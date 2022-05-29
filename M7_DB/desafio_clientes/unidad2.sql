--
-- lmunozm1702QL database dump
--

-- Dumped from database version 10.12
-- Dumped by pg_dump version 10.12

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

-- CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

-- COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cliente; Type: TABLE; Schema: public; Owner: lmunozm1702
--

CREATE TABLE public.cliente (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    email character varying(40) NOT NULL
);


ALTER TABLE public.cliente OWNER TO lmunozm1702;

--
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: lmunozm1702
--

CREATE SEQUENCE public.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_id_seq OWNER TO lmunozm1702;

--
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lmunozm1702
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;


--
-- Name: compra; Type: TABLE; Schema: public; Owner: lmunozm1702
--

CREATE TABLE public.compra (
    id integer NOT NULL,
    cliente_id integer NOT NULL,
    fecha date
);


ALTER TABLE public.compra OWNER TO lmunozm1702;

--
-- Name: compra_id_seq; Type: SEQUENCE; Schema: public; Owner: lmunozm1702
--

CREATE SEQUENCE public.compra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compra_id_seq OWNER TO lmunozm1702;

--
-- Name: compra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lmunozm1702
--

ALTER SEQUENCE public.compra_id_seq OWNED BY public.compra.id;


--
-- Name: detalle_compra; Type: TABLE; Schema: public; Owner: lmunozm1702
--

CREATE TABLE public.detalle_compra (
    id integer NOT NULL,
    producto_id integer NOT NULL,
    compra_id integer NOT NULL,
    cantidad integer
);


ALTER TABLE public.detalle_compra OWNER TO lmunozm1702;

--
-- Name: detalle_compra_id_seq; Type: SEQUENCE; Schema: public; Owner: lmunozm1702
--

CREATE SEQUENCE public.detalle_compra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detalle_compra_id_seq OWNER TO lmunozm1702;

--
-- Name: detalle_compra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lmunozm1702
--

ALTER SEQUENCE public.detalle_compra_id_seq OWNED BY public.detalle_compra.id;


--
-- Name: producto; Type: TABLE; Schema: public; Owner: lmunozm1702
--

CREATE TABLE public.producto (
    id integer NOT NULL,
    descripcion character varying(500) NOT NULL,
    stock integer,
    precio integer,
    CONSTRAINT stock_valido CHECK ((stock >= 0))
);


ALTER TABLE public.producto OWNER TO lmunozm1702;

--
-- Name: producto_id_seq; Type: SEQUENCE; Schema: public; Owner: lmunozm1702
--

CREATE SEQUENCE public.producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producto_id_seq OWNER TO lmunozm1702;

--
-- Name: producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lmunozm1702
--

ALTER SEQUENCE public.producto_id_seq OWNED BY public.producto.id;


--
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: lmunozm1702
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- Name: compra id; Type: DEFAULT; Schema: public; Owner: lmunozm1702
--

ALTER TABLE ONLY public.compra ALTER COLUMN id SET DEFAULT nextval('public.compra_id_seq'::regclass);


--
-- Name: detalle_compra id; Type: DEFAULT; Schema: public; Owner: lmunozm1702
--

ALTER TABLE ONLY public.detalle_compra ALTER COLUMN id SET DEFAULT nextval('public.detalle_compra_id_seq'::regclass);


--
-- Name: producto id; Type: DEFAULT; Schema: public; Owner: lmunozm1702
--

ALTER TABLE ONLY public.producto ALTER COLUMN id SET DEFAULT nextval('public.producto_id_seq'::regclass);


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: lmunozm1702
--

    
