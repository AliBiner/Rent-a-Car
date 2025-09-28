--
-- PostgreSQL database dump
--

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg13+1)
-- Dumped by pg_dump version 17.0

-- Started on 2025-09-28 22:23:02 +03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 24781)
-- Name: brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brand (
    id integer NOT NULL,
    brand character varying(50) NOT NULL
);


ALTER TABLE public.brand OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24780)
-- Name: brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.brand_id_seq OWNER TO postgres;

--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 219
-- Name: brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brand_id_seq OWNED BY public.brand.id;


--
-- TOC entry 222 (class 1259 OID 24790)
-- Name: model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model (
    id integer NOT NULL,
    model character varying(50) NOT NULL,
    brand_id integer
);


ALTER TABLE public.model OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24789)
-- Name: model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.model_id_seq OWNER TO postgres;

--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 221
-- Name: model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.model_id_seq OWNED BY public.model.id;


--
-- TOC entry 232 (class 1259 OID 32971)
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    id integer NOT NULL,
    reservation_id integer,
    deposit numeric(16,2),
    amount numeric(16,2),
    total_amount numeric(16,2) NOT NULL,
    payment_type integer NOT NULL,
    status integer NOT NULL,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 32970)
-- Name: payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_id_seq OWNER TO postgres;

--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 231
-- Name: payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_id_seq OWNED BY public.payment.id;


--
-- TOC entry 228 (class 1259 OID 24839)
-- Name: rent_price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rent_price (
    id integer NOT NULL,
    vehicle_id integer,
    hourly_price numeric(16,2) NOT NULL,
    daily_price numeric(16,2) NOT NULL,
    weekly_price numeric(16,2) NOT NULL,
    monthly_price numeric(16,2) NOT NULL
);


ALTER TABLE public.rent_price OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24838)
-- Name: rent_price_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rent_price_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rent_price_id_seq OWNER TO postgres;

--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 227
-- Name: rent_price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rent_price_id_seq OWNED BY public.rent_price.id;


--
-- TOC entry 230 (class 1259 OID 32952)
-- Name: reservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation (
    id integer NOT NULL,
    user_id integer,
    vehicle_id integer,
    start_date timestamp without time zone NOT NULL,
    finish_date timestamp without time zone NOT NULL,
    status integer NOT NULL,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.reservation OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 32951)
-- Name: reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reservation_id_seq OWNER TO postgres;

--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 229
-- Name: reservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservation_id_seq OWNED BY public.reservation.id;


--
-- TOC entry 217 (class 1259 OID 16400)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    passwd character varying(255) NOT NULL,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    user_role integer DEFAULT 1 NOT NULL,
    customer_type integer,
    age integer DEFAULT 0 NOT NULL,
    CONSTRAINT users_created_date_check CHECK (((created_date IS NULL) OR (created_date = created_date)))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16410)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 24804)
-- Name: vehicle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle (
    id integer NOT NULL,
    model_id integer NOT NULL,
    vehicle_type integer NOT NULL,
    price numeric(16,2),
    is_rent boolean DEFAULT false,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    at_created integer,
    at_updated integer
);


ALTER TABLE public.vehicle OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 24827)
-- Name: vehicle_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle_details (
    id integer NOT NULL,
    vehicle_id integer,
    door_count integer,
    cc integer,
    max_range integer,
    wing_count integer,
    pilot_count integer,
    machine_type integer
);


ALTER TABLE public.vehicle_details OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24826)
-- Name: vehicle_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicle_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vehicle_details_id_seq OWNER TO postgres;

--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 225
-- Name: vehicle_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicle_details_id_seq OWNED BY public.vehicle_details.id;


--
-- TOC entry 223 (class 1259 OID 24803)
-- Name: vehicle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vehicle_id_seq OWNER TO postgres;

--
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 223
-- Name: vehicle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicle_id_seq OWNED BY public.vehicle.id;


--
-- TOC entry 3313 (class 2604 OID 24784)
-- Name: brand id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand ALTER COLUMN id SET DEFAULT nextval('public.brand_id_seq'::regclass);


--
-- TOC entry 3314 (class 2604 OID 24793)
-- Name: model id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model ALTER COLUMN id SET DEFAULT nextval('public.model_id_seq'::regclass);


--
-- TOC entry 3324 (class 2604 OID 32974)
-- Name: payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN id SET DEFAULT nextval('public.payment_id_seq'::regclass);


--
-- TOC entry 3320 (class 2604 OID 24842)
-- Name: rent_price id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rent_price ALTER COLUMN id SET DEFAULT nextval('public.rent_price_id_seq'::regclass);


--
-- TOC entry 3321 (class 2604 OID 32955)
-- Name: reservation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation ALTER COLUMN id SET DEFAULT nextval('public.reservation_id_seq'::regclass);


--
-- TOC entry 3315 (class 2604 OID 24807)
-- Name: vehicle id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle ALTER COLUMN id SET DEFAULT nextval('public.vehicle_id_seq'::regclass);


--
-- TOC entry 3319 (class 2604 OID 24830)
-- Name: vehicle_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_details ALTER COLUMN id SET DEFAULT nextval('public.vehicle_details_id_seq'::regclass);


--
-- TOC entry 3512 (class 0 OID 24781)
-- Dependencies: 220
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brand (id, brand) FROM stdin;
1	Honda
\.


--
-- TOC entry 3514 (class 0 OID 24790)
-- Dependencies: 222
-- Data for Name: model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model (id, model, brand_id) FROM stdin;
1	Civic	1
\.


--
-- TOC entry 3524 (class 0 OID 32971)
-- Dependencies: 232
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) FROM stdin;
1	1	0.00	0.00	0.00	0	0	2025-09-28 19:31:50.165337	2025-09-28 19:31:50.165337
2	2	0.00	0.00	0.00	0	0	2025-09-28 19:34:02.070136	2025-09-28 19:34:02.070136
3	3	0.00	0.00	6500.00	0	0	2025-09-28 19:38:45.873741	2025-09-28 19:38:45.873741
4	4	0.00	0.00	6000.00	0	0	2025-09-28 19:39:32.747605	2025-09-28 19:39:32.747605
5	5	0.00	0.00	4000.00	0	0	2025-09-28 19:39:41.195857	2025-09-28 19:39:41.195857
6	6	0.00	0.00	6000.00	0	0	2025-09-28 19:45:19.766082	2025-09-28 19:45:19.766082
7	7	0.00	0.00	4000.00	0	0	2025-09-28 20:41:19.494386	2025-09-28 20:41:19.494386
8	8	0.00	0.00	2000.00	0	0	2025-09-28 20:42:50.428499	2025-09-28 20:42:50.428499
9	9	1000.00	1000.00	10000.00	0	2	2025-09-28 21:21:13.70772	2025-09-28 21:21:13.70772
10	10	800.00	1000.00	8000.00	0	2	2025-09-28 21:41:42.542416	2025-09-28 21:41:42.542416
11	11	600.00	1000.00	6000.00	0	2	2025-09-28 21:43:41.371219	2025-09-28 21:43:41.371219
12	12	1150.00	10000.00	11500.00	0	2	2025-09-28 21:44:10.883035	2025-09-28 21:44:10.883035
\.


--
-- TOC entry 3520 (class 0 OID 24839)
-- Dependencies: 228
-- Data for Name: rent_price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) FROM stdin;
2	4	500.00	2000.00	5000.00	15000.00
\.


--
-- TOC entry 3522 (class 0 OID 32952)
-- Dependencies: 230
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) FROM stdin;
1	2	4	2025-09-28 19:31:49.932576	2025-09-28 19:31:49.932576	0	2025-09-28 19:31:50.165337	2025-09-28 19:31:50.165337
2	2	4	2025-09-28 19:34:01.824702	2025-09-28 19:34:01.824702	0	2025-09-28 19:34:02.070136	2025-09-28 19:34:02.070136
3	2	4	2025-10-28 23:00:00	2025-10-28 23:00:00	0	2025-09-28 19:38:45.873741	2025-09-28 19:38:45.873741
4	2	4	2025-10-02 12:00:00	2025-10-02 12:00:00	0	2025-09-28 19:39:32.747605	2025-09-28 19:39:32.747605
5	2	4	2025-10-03 12:00:00	2025-10-03 12:00:00	0	2025-09-28 19:39:41.195857	2025-09-28 19:39:41.195857
6	2	4	2025-10-06 12:00:00	2025-10-06 12:00:00	0	2025-09-28 19:45:19.766082	2025-09-28 19:45:19.766082
7	2	4	2025-10-07 12:00:00	2025-10-07 12:00:00	0	2025-09-28 20:41:19.494386	2025-09-28 20:41:19.494386
8	2	4	2025-10-08 12:00:00	2025-10-09 12:00:00	0	2025-09-28 20:42:50.428499	2025-09-28 20:42:50.428499
9	6	4	2025-10-10 12:00:00	2025-10-15 12:00:00	0	2025-09-28 21:21:13.70772	2025-09-28 21:21:13.70772
10	6	4	2025-10-16 12:00:00	2025-10-20 12:00:00	0	2025-09-28 21:41:42.542416	2025-09-28 21:41:42.542416
11	6	4	2025-10-21 13:00:00	2025-10-25 12:00:00	0	2025-09-28 21:43:41.371219	2025-09-28 21:43:41.371219
12	6	4	2025-10-26 13:00:00	2025-10-27 12:00:00	0	2025-09-28 21:44:10.883035	2025-09-28 21:44:10.883035
\.


--
-- TOC entry 3509 (class 0 OID 16400)
-- Dependencies: 217
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, first_name, last_name, email, passwd, created_date, updated_date, user_role, customer_type, age) FROM stdin;
1	Ali	Biner	admin@admin.com	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	2025-09-27 11:39:50.233501	2025-09-27 11:39:50.233501	0	\N	28
2	tarık	keser	customer@customer.com	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	2025-09-27 15:24:48.141071	2025-09-27 15:24:48.131749	1	1	40
5	test	test	test1@test.com	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	2025-09-28 18:22:53.656384	2025-09-28 18:22:53.648826	1	1	18
6	test	test	test2@test.com	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	2025-09-28 18:22:53.656384	2025-09-28 18:22:53.648826	1	1	35
\.


--
-- TOC entry 3516 (class 0 OID 24804)
-- Dependencies: 224
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated) FROM stdin;
6	1	0	2000000.00	f	2025-09-27 22:13:07.190914	2025-09-27 22:13:07.190914	1	1
7	1	1	50000000.00	f	2025-09-27 22:18:58.970331	2025-09-27 22:18:58.970331	1	1
8	1	2	500000.00	f	2025-09-27 22:22:02.645191	2025-09-27 22:22:02.645191	1	1
9	1	0	5000000.00	f	2025-09-28 04:58:42.709172	2025-09-28 04:58:42.709172	1	1
4	1	0	3000000.00	f	2025-09-27 11:40:57.945575	2025-09-28 07:51:28.365068	1	1
\.


--
-- TOC entry 3518 (class 0 OID 24827)
-- Dependencies: 226
-- Data for Name: vehicle_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) FROM stdin;
2	6	5	0	0	0	0	\N
3	7	0	0	2000	4	2	\N
4	8	0	500	0	0	0	\N
5	4	4	0	0	0	0	\N
\.


--
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 219
-- Name: brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_id_seq', 1, true);


--
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 221
-- Name: model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.model_id_seq', 1, true);


--
-- TOC entry 3540 (class 0 OID 0)
-- Dependencies: 231
-- Name: payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_id_seq', 12, true);


--
-- TOC entry 3541 (class 0 OID 0)
-- Dependencies: 227
-- Name: rent_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rent_price_id_seq', 2, true);


--
-- TOC entry 3542 (class 0 OID 0)
-- Dependencies: 229
-- Name: reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservation_id_seq', 12, true);


--
-- TOC entry 3543 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- TOC entry 3544 (class 0 OID 0)
-- Dependencies: 225
-- Name: vehicle_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_details_id_seq', 5, true);


--
-- TOC entry 3545 (class 0 OID 0)
-- Dependencies: 223
-- Name: vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_id_seq', 9, true);


--
-- TOC entry 3333 (class 2606 OID 24788)
-- Name: brand brand_brand_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_brand_key UNIQUE (brand);


--
-- TOC entry 3335 (class 2606 OID 24786)
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (id);


--
-- TOC entry 3337 (class 2606 OID 24797)
-- Name: model model_brand_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_brand_id_key UNIQUE (brand_id);


--
-- TOC entry 3339 (class 2606 OID 24795)
-- Name: model model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_pkey PRIMARY KEY (id);


--
-- TOC entry 3352 (class 2606 OID 32978)
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- TOC entry 3354 (class 2606 OID 32980)
-- Name: payment payment_reservation_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_reservation_id_key UNIQUE (reservation_id);


--
-- TOC entry 3346 (class 2606 OID 24844)
-- Name: rent_price rent_price_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rent_price
    ADD CONSTRAINT rent_price_pkey PRIMARY KEY (id);


--
-- TOC entry 3348 (class 2606 OID 24846)
-- Name: rent_price rent_price_vehicle_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rent_price
    ADD CONSTRAINT rent_price_vehicle_id_key UNIQUE (vehicle_id);


--
-- TOC entry 3350 (class 2606 OID 32959)
-- Name: reservation reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (id);


--
-- TOC entry 3329 (class 2606 OID 16409)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3331 (class 2606 OID 16407)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3343 (class 2606 OID 24832)
-- Name: vehicle_details vehicle_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_details
    ADD CONSTRAINT vehicle_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3341 (class 2606 OID 24810)
-- Name: vehicle vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_pkey PRIMARY KEY (id);


--
-- TOC entry 3344 (class 1259 OID 24852)
-- Name: fki_R; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_R" ON public.rent_price USING btree (vehicle_id);


--
-- TOC entry 3355 (class 2606 OID 24798)
-- Name: model model_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brand(id);


--
-- TOC entry 3363 (class 2606 OID 32981)
-- Name: payment payment_reservation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_reservation_id_fkey FOREIGN KEY (reservation_id) REFERENCES public.reservation(id);


--
-- TOC entry 3360 (class 2606 OID 24847)
-- Name: rent_price rent_price_vehicle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rent_price
    ADD CONSTRAINT rent_price_vehicle_fkey FOREIGN KEY (vehicle_id) REFERENCES public.vehicle(id) NOT VALID;


--
-- TOC entry 3361 (class 2606 OID 32960)
-- Name: reservation reservation_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3362 (class 2606 OID 32965)
-- Name: reservation reservation_vehicle_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_vehicle_id_fkey FOREIGN KEY (vehicle_id) REFERENCES public.vehicle(id);


--
-- TOC entry 3356 (class 2606 OID 24816)
-- Name: vehicle vehicle_at_created_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_at_created_fkey FOREIGN KEY (at_created) REFERENCES public.users(id);


--
-- TOC entry 3357 (class 2606 OID 24821)
-- Name: vehicle vehicle_at_updated_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_at_updated_fkey FOREIGN KEY (at_updated) REFERENCES public.users(id);


--
-- TOC entry 3359 (class 2606 OID 24833)
-- Name: vehicle_details vehicle_details_vehicle_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_details
    ADD CONSTRAINT vehicle_details_vehicle_id_fkey FOREIGN KEY (vehicle_id) REFERENCES public.vehicle(id);


--
-- TOC entry 3358 (class 2606 OID 24811)
-- Name: vehicle vehicle_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_model_id_fkey FOREIGN KEY (model_id) REFERENCES public.model(id);


-- Completed on 2025-09-28 22:23:02 +03

--
-- PostgreSQL database dump complete
--

