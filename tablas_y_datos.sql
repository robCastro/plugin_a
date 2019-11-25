--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2019-11-15 19:02:40 CST

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

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 25388)
-- Name: aduana; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.aduana (
    id_aduana integer NOT NULL,
    nombre_aduana character varying(128) NOT NULL,
    direccion_aduana character varying(1024),
    activo_aduana boolean NOT NULL,
    id_pais integer NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 25386)
-- Name: aduana_id_aduana_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.aduana_id_aduana_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 196
-- Name: aduana_id_aduana_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.aduana_id_aduana_seq OWNED BY public.aduana.id_aduana;


--
-- TOC entry 199 (class 1259 OID 25399)
-- Name: arancel; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.arancel (
    id_arancel integer NOT NULL,
    id_conversion_dolar integer NOT NULL,
    tasa_entrada_arancel numeric(5,2) NOT NULL,
    tasa_paso_arancel numeric(5,2) NOT NULL,
    fecha_arancel date NOT NULL,
    activo_arancel boolean NOT NULL,
    id_tipo_mercancia integer NOT NULL,
    id_pais integer NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 25397)
-- Name: arancel_id_arancel_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.arancel_id_arancel_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 198
-- Name: arancel_id_arancel_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.arancel_id_arancel_seq OWNED BY public.arancel.id_arancel;


--
-- TOC entry 201 (class 1259 OID 25407)
-- Name: conversion_dolar; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conversion_dolar (
    id_conversion_dolar integer NOT NULL,
    valor_conversion_dolar numeric(5,2) NOT NULL,
    fecha_conversion_dolar date NOT NULL,
    activo_conversion_dolar boolean NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 25405)
-- Name: conversion_dolar_id_conversion_dolar_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conversion_dolar_id_conversion_dolar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 200
-- Name: conversion_dolar_id_conversion_dolar_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conversion_dolar_id_conversion_dolar_seq OWNED BY public.conversion_dolar.id_conversion_dolar;


--
-- TOC entry 203 (class 1259 OID 25415)
-- Name: iva; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.iva (
    id_iva integer NOT NULL,
    tasa_iva numeric(5,2) NOT NULL,
    fecha_iva date NOT NULL,
    activo_iva boolean NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 25413)
-- Name: iva_id_iva_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.iva_id_iva_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 202
-- Name: iva_id_iva_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.iva_id_iva_seq OWNED BY public.iva.id_iva;


--
-- TOC entry 205 (class 1259 OID 25423)
-- Name: pasa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pasa (
    id_pasa integer NOT NULL,
    id_iva integer,
    id_aduana integer NOT NULL,
    id_arancel integer,
    fecha_pasa date NOT NULL,
    retenida_pasa boolean NOT NULL,
    multa_pasa numeric(12,2) NOT NULL,
    id_transporte integer NOT NULL,
    id_mercancia integer NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 25421)
-- Name: pasa_id_pasa_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pasa_id_pasa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 204
-- Name: pasa_id_pasa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pasa_id_pasa_seq OWNED BY public.pasa.id_pasa;


--
-- TOC entry 2819 (class 2604 OID 25391)
-- Name: aduana id_aduana; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aduana ALTER COLUMN id_aduana SET DEFAULT nextval('public.aduana_id_aduana_seq'::regclass);


--
-- TOC entry 2820 (class 2604 OID 25402)
-- Name: arancel id_arancel; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.arancel ALTER COLUMN id_arancel SET DEFAULT nextval('public.arancel_id_arancel_seq'::regclass);


--
-- TOC entry 2821 (class 2604 OID 25410)
-- Name: conversion_dolar id_conversion_dolar; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conversion_dolar ALTER COLUMN id_conversion_dolar SET DEFAULT nextval('public.conversion_dolar_id_conversion_dolar_seq'::regclass);


--
-- TOC entry 2822 (class 2604 OID 25418)
-- Name: iva id_iva; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.iva ALTER COLUMN id_iva SET DEFAULT nextval('public.iva_id_iva_seq'::regclass);


--
-- TOC entry 2823 (class 2604 OID 25426)
-- Name: pasa id_pasa; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pasa ALTER COLUMN id_pasa SET DEFAULT nextval('public.pasa_id_pasa_seq'::regclass);


--
-- TOC entry 2960 (class 0 OID 25388)
-- Dependencies: 197
-- Data for Name: aduana; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.aduana (id_aduana, nombre_aduana, direccion_aduana, activo_aduana, id_pais) VALUES (1, 'Mocalempa', 'Mancomunida de Mocalempa, Departamento de Lempira', true, 2);
INSERT INTO public.aduana (id_aduana, nombre_aduana, direccion_aduana, activo_aduana, id_pais) VALUES (2, 'Las Manos', 'Aldea las Manos, Municipio de Alauca, Departamento de El Paraíso.', true, 2);
INSERT INTO public.aduana (id_aduana, nombre_aduana, direccion_aduana, activo_aduana, id_pais) VALUES (3, 'Corinto', 'Municipio de Omoa, Departamento de Cortés, km 60.', true, 2);
INSERT INTO public.aduana (id_aduana, nombre_aduana, direccion_aduana, activo_aduana, id_pais) VALUES (4, 'El Poy', 'Aldea San Rafael, Municipio de Ocotepeque', true, 2);


--
-- TOC entry 2962 (class 0 OID 25399)
-- Dependencies: 199
-- Data for Name: arancel; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.arancel (id_arancel, id_conversion_dolar, tasa_entrada_arancel, tasa_paso_arancel, fecha_arancel, activo_arancel, id_tipo_mercancia, id_pais) VALUES (1, 4, 0.15, 0.25, '2017-05-12', true, 1, 3);
INSERT INTO public.arancel (id_arancel, id_conversion_dolar, tasa_entrada_arancel, tasa_paso_arancel, fecha_arancel, activo_arancel, id_tipo_mercancia, id_pais) VALUES (2, 2, 0.10, 0.15, '2017-10-24', true, 2, 3);
INSERT INTO public.arancel (id_arancel, id_conversion_dolar, tasa_entrada_arancel, tasa_paso_arancel, fecha_arancel, activo_arancel, id_tipo_mercancia, id_pais) VALUES (3, 1, 0.13, 0.14, '2018-01-01', false, 3, 3);
INSERT INTO public.arancel (id_arancel, id_conversion_dolar, tasa_entrada_arancel, tasa_paso_arancel, fecha_arancel, activo_arancel, id_tipo_mercancia, id_pais) VALUES (4, 5, 0.14, 0.17, '2018-06-23', true, 4, 3);
INSERT INTO public.arancel (id_arancel, id_conversion_dolar, tasa_entrada_arancel, tasa_paso_arancel, fecha_arancel, activo_arancel, id_tipo_mercancia, id_pais) VALUES (5, 6, 0.20, 0.16, '2019-04-02', false, 5, 3);
INSERT INTO public.arancel (id_arancel, id_conversion_dolar, tasa_entrada_arancel, tasa_paso_arancel, fecha_arancel, activo_arancel, id_tipo_mercancia, id_pais) VALUES (6, 3, 0.25, 0.20, '2019-08-28', true, 6, 3);


--
-- TOC entry 2964 (class 0 OID 25407)
-- Dependencies: 201
-- Data for Name: conversion_dolar; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.conversion_dolar (id_conversion_dolar, valor_conversion_dolar, fecha_conversion_dolar, activo_conversion_dolar) VALUES (1, 1.20, '2018-05-09', true);
INSERT INTO public.conversion_dolar (id_conversion_dolar, valor_conversion_dolar, fecha_conversion_dolar, activo_conversion_dolar) VALUES (2, 8.90, '2017-08-14', false);
INSERT INTO public.conversion_dolar (id_conversion_dolar, valor_conversion_dolar, fecha_conversion_dolar, activo_conversion_dolar) VALUES (3, 7.25, '2019-01-25', false);
INSERT INTO public.conversion_dolar (id_conversion_dolar, valor_conversion_dolar, fecha_conversion_dolar, activo_conversion_dolar) VALUES (4, 22.95, '2019-03-26', false);
INSERT INTO public.conversion_dolar (id_conversion_dolar, valor_conversion_dolar, fecha_conversion_dolar, activo_conversion_dolar) VALUES (5, 545.30, '2019-10-19', false);
INSERT INTO public.conversion_dolar (id_conversion_dolar, valor_conversion_dolar, fecha_conversion_dolar, activo_conversion_dolar) VALUES (6, 25.39, '2019-11-30', false);


--
-- TOC entry 2966 (class 0 OID 25415)
-- Dependencies: 203
-- Data for Name: iva; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.iva (id_iva, tasa_iva, fecha_iva, activo_iva) VALUES (1, 0.10, '2002-02-19', false);
INSERT INTO public.iva (id_iva, tasa_iva, fecha_iva, activo_iva) VALUES (2, 0.13, '2009-10-14', false);
INSERT INTO public.iva (id_iva, tasa_iva, fecha_iva, activo_iva) VALUES (3, 0.15, '2014-05-16', false);
INSERT INTO public.iva (id_iva, tasa_iva, fecha_iva, activo_iva) VALUES (4, 0.20, '2016-11-25', true);


--
-- TOC entry 2968 (class 0 OID 25423)
-- Dependencies: 205
-- Data for Name: pasa; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.pasa (id_pasa, id_iva, id_aduana, id_arancel, fecha_pasa, retenida_pasa, multa_pasa, id_transporte, id_mercancia) VALUES (1, 1, 1, 1, '2018-11-17', true, 25.50, 1, 2);
INSERT INTO public.pasa (id_pasa, id_iva, id_aduana, id_arancel, fecha_pasa, retenida_pasa, multa_pasa, id_transporte, id_mercancia) VALUES (2, 2, 2, 2, '2018-12-15', true, 50.36, 2, 1);
INSERT INTO public.pasa (id_pasa, id_iva, id_aduana, id_arancel, fecha_pasa, retenida_pasa, multa_pasa, id_transporte, id_mercancia) VALUES (3, 3, 2, 3, '2019-01-25', false, 15.25, 3, 5);
INSERT INTO public.pasa (id_pasa, id_iva, id_aduana, id_arancel, fecha_pasa, retenida_pasa, multa_pasa, id_transporte, id_mercancia) VALUES (4, 2, 3, 4, '2019-03-02', false, 30.25, 4, 4);
INSERT INTO public.pasa (id_pasa, id_iva, id_aduana, id_arancel, fecha_pasa, retenida_pasa, multa_pasa, id_transporte, id_mercancia) VALUES (5, 1, 4, 5, '2019-05-03', true, 35.21, 5, 6);
INSERT INTO public.pasa (id_pasa, id_iva, id_aduana, id_arancel, fecha_pasa, retenida_pasa, multa_pasa, id_transporte, id_mercancia) VALUES (6, 4, 3, 6, '2019-06-05', true, 60.23, 6, 8);
INSERT INTO public.pasa (id_pasa, id_iva, id_aduana, id_arancel, fecha_pasa, retenida_pasa, multa_pasa, id_transporte, id_mercancia) VALUES (7, 3, 1, 1, '2019-10-11', true, 96.36, 7, 9);


--
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 196
-- Name: aduana_id_aduana_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.aduana_id_aduana_seq', 4, true);


--
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 198
-- Name: arancel_id_arancel_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.arancel_id_arancel_seq', 6, true);


--
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 200
-- Name: conversion_dolar_id_conversion_dolar_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.conversion_dolar_id_conversion_dolar_seq', 6, true);


--
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 202
-- Name: iva_id_iva_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.iva_id_iva_seq', 4, true);


--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 204
-- Name: pasa_id_pasa_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pasa_id_pasa_seq', 7, true);


--
-- TOC entry 2825 (class 2606 OID 25396)
-- Name: aduana pk_aduana; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aduana
    ADD CONSTRAINT pk_aduana PRIMARY KEY (id_aduana);


--
-- TOC entry 2827 (class 2606 OID 25404)
-- Name: arancel pk_arancel; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.arancel
    ADD CONSTRAINT pk_arancel PRIMARY KEY (id_arancel);


--
-- TOC entry 2829 (class 2606 OID 25412)
-- Name: conversion_dolar pk_conversion_dolar; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conversion_dolar
    ADD CONSTRAINT pk_conversion_dolar PRIMARY KEY (id_conversion_dolar);


--
-- TOC entry 2831 (class 2606 OID 25420)
-- Name: iva pk_iva; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.iva
    ADD CONSTRAINT pk_iva PRIMARY KEY (id_iva);


--
-- TOC entry 2833 (class 2606 OID 25428)
-- Name: pasa pk_pasa; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pasa
    ADD CONSTRAINT pk_pasa PRIMARY KEY (id_pasa);


--
-- TOC entry 2834 (class 2606 OID 25429)
-- Name: arancel fk_arancel_relations_conversi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.arancel
    ADD CONSTRAINT fk_arancel_relations_conversi FOREIGN KEY (id_conversion_dolar) REFERENCES public.conversion_dolar(id_conversion_dolar) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2836 (class 2606 OID 25439)
-- Name: pasa fk_pasa_relations_aduana; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pasa
    ADD CONSTRAINT fk_pasa_relations_aduana FOREIGN KEY (id_aduana) REFERENCES public.aduana(id_aduana) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2837 (class 2606 OID 25444)
-- Name: pasa fk_pasa_relations_arancel; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pasa
    ADD CONSTRAINT fk_pasa_relations_arancel FOREIGN KEY (id_arancel) REFERENCES public.arancel(id_arancel) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2835 (class 2606 OID 25434)
-- Name: pasa fk_pasa_relations_iva; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pasa
    ADD CONSTRAINT fk_pasa_relations_iva FOREIGN KEY (id_iva) REFERENCES public.iva(id_iva) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2019-11-15 19:02:40 CST

--
-- PostgreSQL database dump complete
--

