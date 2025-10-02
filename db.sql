--
-- PostgreSQL database dump
--

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg13+1)
-- Dumped by pg_dump version 17.0

-- Started on 2025-10-02 13:26:31 +03

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
-- TOC entry 3529 (class 0 OID 0)
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
-- TOC entry 3530 (class 0 OID 0)
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
-- TOC entry 3531 (class 0 OID 0)
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
-- TOC entry 3532 (class 0 OID 0)
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
-- TOC entry 3533 (class 0 OID 0)
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
    at_updated integer,
    is_delete boolean DEFAULT false
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
-- TOC entry 3534 (class 0 OID 0)
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
-- TOC entry 3535 (class 0 OID 0)
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
-- TOC entry 3325 (class 2604 OID 32974)
-- Name: payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN id SET DEFAULT nextval('public.payment_id_seq'::regclass);


--
-- TOC entry 3321 (class 2604 OID 24842)
-- Name: rent_price id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rent_price ALTER COLUMN id SET DEFAULT nextval('public.rent_price_id_seq'::regclass);


--
-- TOC entry 3322 (class 2604 OID 32955)
-- Name: reservation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation ALTER COLUMN id SET DEFAULT nextval('public.reservation_id_seq'::regclass);


--
-- TOC entry 3315 (class 2604 OID 24807)
-- Name: vehicle id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle ALTER COLUMN id SET DEFAULT nextval('public.vehicle_id_seq'::regclass);


--
-- TOC entry 3320 (class 2604 OID 24830)
-- Name: vehicle_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_details ALTER COLUMN id SET DEFAULT nextval('public.vehicle_details_id_seq'::regclass);


--
-- TOC entry 3511 (class 0 OID 24781)
-- Dependencies: 220
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.brand (id, brand) VALUES (25, 'brand');
INSERT INTO public.brand (id, brand) VALUES (26, 'Chevrolet');
INSERT INTO public.brand (id, brand) VALUES (27, 'Mercedes-Benz');
INSERT INTO public.brand (id, brand) VALUES (28, 'Isuzu');
INSERT INTO public.brand (id, brand) VALUES (29, 'Oldsmobile');
INSERT INTO public.brand (id, brand) VALUES (30, 'Ford');
INSERT INTO public.brand (id, brand) VALUES (31, 'Cadillac');
INSERT INTO public.brand (id, brand) VALUES (32, 'Dodge');
INSERT INTO public.brand (id, brand) VALUES (33, 'BYD');
INSERT INTO public.brand (id, brand) VALUES (34, 'Toyota');
INSERT INTO public.brand (id, brand) VALUES (35, 'Tesla');


--
-- TOC entry 3513 (class 0 OID 24790)
-- Dependencies: 222
-- Data for Name: model; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.model (id, model, brand_id) VALUES (294, 'S4', 33);
INSERT INTO public.model (id, model, brand_id) VALUES (295, 'ES', 25);
INSERT INTO public.model (id, model, brand_id) VALUES (296, 'Boxster', 34);
INSERT INTO public.model (id, model, brand_id) VALUES (297, 'Suburban 1500', 28);
INSERT INTO public.model (id, model, brand_id) VALUES (298, 'Malibu', 29);
INSERT INTO public.model (id, model, brand_id) VALUES (299, 'QX', 29);
INSERT INTO public.model (id, model, brand_id) VALUES (300, 'S-Series', 35);
INSERT INTO public.model (id, model, brand_id) VALUES (301, 'Silhouette', 28);
INSERT INTO public.model (id, model, brand_id) VALUES (302, 'LFA', 27);
INSERT INTO public.model (id, model, brand_id) VALUES (303, 'Touareg 2', 34);
INSERT INTO public.model (id, model, brand_id) VALUES (304, 'NSX', 34);
INSERT INTO public.model (id, model, brand_id) VALUES (305, 'Taurus', 29);
INSERT INTO public.model (id, model, brand_id) VALUES (306, 'V70', 33);
INSERT INTO public.model (id, model, brand_id) VALUES (307, 'Liberty', 32);
INSERT INTO public.model (id, model, brand_id) VALUES (308, 'Ram 1500', 33);
INSERT INTO public.model (id, model, brand_id) VALUES (309, 'RX Hybrid', 33);
INSERT INTO public.model (id, model, brand_id) VALUES (310, 'CTS', 31);
INSERT INTO public.model (id, model, brand_id) VALUES (311, 'GX', 25);
INSERT INTO public.model (id, model, brand_id) VALUES (312, 'Tracer', 28);
INSERT INTO public.model (id, model, brand_id) VALUES (313, 'Pathfinder', 32);
INSERT INTO public.model (id, model, brand_id) VALUES (314, 'C-Class', 32);
INSERT INTO public.model (id, model, brand_id) VALUES (315, 'Skylark', 30);
INSERT INTO public.model (id, model, brand_id) VALUES (316, 'Pilot', 25);
INSERT INTO public.model (id, model, brand_id) VALUES (317, 'Town & Country', 29);
INSERT INTO public.model (id, model, brand_id) VALUES (318, 'VUE', 34);
INSERT INTO public.model (id, model, brand_id) VALUES (319, 'A8', 30);
INSERT INTO public.model (id, model, brand_id) VALUES (320, 'Mark VIII', 27);
INSERT INTO public.model (id, model, brand_id) VALUES (321, 'S10 Blazer', 26);
INSERT INTO public.model (id, model, brand_id) VALUES (322, 'L-Series', 29);
INSERT INTO public.model (id, model, brand_id) VALUES (323, 'SL-Class', 27);
INSERT INTO public.model (id, model, brand_id) VALUES (324, 'Equator', 27);
INSERT INTO public.model (id, model, brand_id) VALUES (325, 'Expedition', 27);
INSERT INTO public.model (id, model, brand_id) VALUES (326, 'tC', 27);
INSERT INTO public.model (id, model, brand_id) VALUES (327, 'Santa Fe', 34);
INSERT INTO public.model (id, model, brand_id) VALUES (328, 'Stratus', 30);
INSERT INTO public.model (id, model, brand_id) VALUES (329, 'NX', 31);
INSERT INTO public.model (id, model, brand_id) VALUES (330, 'Sienna', 25);
INSERT INTO public.model (id, model, brand_id) VALUES (331, 'Grand Cherokee', 32);
INSERT INTO public.model (id, model, brand_id) VALUES (332, 'XC70', 32);
INSERT INTO public.model (id, model, brand_id) VALUES (333, 'B-Series', 33);
INSERT INTO public.model (id, model, brand_id) VALUES (334, 'Town & Country', 30);
INSERT INTO public.model (id, model, brand_id) VALUES (335, 'rio', 29);
INSERT INTO public.model (id, model, brand_id) VALUES (336, 'RX', 25);
INSERT INTO public.model (id, model, brand_id) VALUES (337, 'Sprinter 2500', 29);
INSERT INTO public.model (id, model, brand_id) VALUES (338, 'F150', 31);
INSERT INTO public.model (id, model, brand_id) VALUES (339, '4Runner', 29);
INSERT INTO public.model (id, model, brand_id) VALUES (340, 'Celica', 29);
INSERT INTO public.model (id, model, brand_id) VALUES (341, '8 Series', 31);
INSERT INTO public.model (id, model, brand_id) VALUES (342, 'Range Rover', 31);
INSERT INTO public.model (id, model, brand_id) VALUES (343, 'Topaz', 26);
INSERT INTO public.model (id, model, brand_id) VALUES (344, 'Silverado 1500', 31);
INSERT INTO public.model (id, model, brand_id) VALUES (345, 'Sorento', 25);
INSERT INTO public.model (id, model, brand_id) VALUES (346, 'Explorer', 33);
INSERT INTO public.model (id, model, brand_id) VALUES (347, 'QX56', 35);
INSERT INTO public.model (id, model, brand_id) VALUES (348, 'Savana 3500', 27);
INSERT INTO public.model (id, model, brand_id) VALUES (349, 'CLK-Class', 31);
INSERT INTO public.model (id, model, brand_id) VALUES (350, 'Express', 33);
INSERT INTO public.model (id, model, brand_id) VALUES (351, 'Biturbo', 31);
INSERT INTO public.model (id, model, brand_id) VALUES (352, 'Silverado 1500', 28);
INSERT INTO public.model (id, model, brand_id) VALUES (353, 'del Sol', 29);
INSERT INTO public.model (id, model, brand_id) VALUES (354, 'B-Series', 25);
INSERT INTO public.model (id, model, brand_id) VALUES (355, 'Falcon', 25);
INSERT INTO public.model (id, model, brand_id) VALUES (356, 'DeVille', 32);
INSERT INTO public.model (id, model, brand_id) VALUES (357, 'Excel', 29);
INSERT INTO public.model (id, model, brand_id) VALUES (358, 'Mirage', 26);
INSERT INTO public.model (id, model, brand_id) VALUES (359, 'H1', 28);
INSERT INTO public.model (id, model, brand_id) VALUES (360, 'Camry', 27);
INSERT INTO public.model (id, model, brand_id) VALUES (361, 'Riviera', 27);
INSERT INTO public.model (id, model, brand_id) VALUES (362, 'Legacy', 31);
INSERT INTO public.model (id, model, brand_id) VALUES (363, 'Expedition', 30);
INSERT INTO public.model (id, model, brand_id) VALUES (364, 'Sienna', 26);
INSERT INTO public.model (id, model, brand_id) VALUES (365, 'TL', 30);
INSERT INTO public.model (id, model, brand_id) VALUES (366, 'E150', 34);
INSERT INTO public.model (id, model, brand_id) VALUES (367, 'Highlander', 34);
INSERT INTO public.model (id, model, brand_id) VALUES (368, 'Familia', 34);
INSERT INTO public.model (id, model, brand_id) VALUES (369, 'M', 28);
INSERT INTO public.model (id, model, brand_id) VALUES (370, 'A8', 28);
INSERT INTO public.model (id, model, brand_id) VALUES (371, '1500 Club Coupe', 31);
INSERT INTO public.model (id, model, brand_id) VALUES (372, 'Passat', 25);
INSERT INTO public.model (id, model, brand_id) VALUES (373, 'G-Class', 31);
INSERT INTO public.model (id, model, brand_id) VALUES (374, 'Silhouette', 30);
INSERT INTO public.model (id, model, brand_id) VALUES (375, 'Tredia', 29);
INSERT INTO public.model (id, model, brand_id) VALUES (376, 'XC60', 33);
INSERT INTO public.model (id, model, brand_id) VALUES (377, 'Escort', 31);
INSERT INTO public.model (id, model, brand_id) VALUES (378, 'Yukon', 35);
INSERT INTO public.model (id, model, brand_id) VALUES (379, 'CLK-Class', 25);
INSERT INTO public.model (id, model, brand_id) VALUES (380, 'Ram 3500', 31);
INSERT INTO public.model (id, model, brand_id) VALUES (381, 'Econoline E250', 29);
INSERT INTO public.model (id, model, brand_id) VALUES (382, 'Courier', 27);
INSERT INTO public.model (id, model, brand_id) VALUES (383, 'Amigo', 27);
INSERT INTO public.model (id, model, brand_id) VALUES (384, 'X6 M', 26);
INSERT INTO public.model (id, model, brand_id) VALUES (385, 'Spider', 30);
INSERT INTO public.model (id, model, brand_id) VALUES (386, 'E350', 34);
INSERT INTO public.model (id, model, brand_id) VALUES (387, 'Equinox', 33);
INSERT INTO public.model (id, model, brand_id) VALUES (388, 'C/V', 30);


--
-- TOC entry 3523 (class 0 OID 32971)
-- Dependencies: 232
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (36, 17, 5167.00, 2571.00, 8552.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (37, 18, 5704.00, 4183.00, 7577.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (38, 19, 876.00, 8261.00, 3217.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (39, 20, 8452.00, 2129.00, 3138.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (40, 21, 7980.00, 6954.00, 5169.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (41, 22, 2027.00, 2092.00, 5804.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (42, 23, 7492.00, 3533.00, 9813.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (43, 24, 9607.00, 9593.00, 6446.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (44, 25, 5882.00, 1838.00, 8238.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (45, 26, 5398.00, 7044.00, 267.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (46, 27, 1609.00, 9243.00, 6144.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (47, 28, 4309.00, 2489.00, 1351.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (48, 29, 9334.00, 7138.00, 9674.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (49, 30, 7806.00, 4978.00, 6211.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (50, 31, 1931.00, 7598.00, 2832.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (51, 32, 2685.00, 3286.00, 8375.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (52, 33, 4179.00, 6457.00, 7621.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (53, 34, 6516.00, 77.00, 4798.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (54, 35, 864.00, 8067.00, 7372.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (55, 36, 3541.00, 5548.00, 3773.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (56, 37, 6346.00, 9023.00, 253.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (57, 38, 9569.00, 4722.00, 2208.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (58, 39, 5049.00, 3632.00, 7939.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (59, 40, 1657.00, 6690.00, 227.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (60, 41, 8727.00, 6412.00, 3.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (61, 42, 7947.00, 2206.00, 7576.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (62, 43, 5862.00, 5517.00, 7214.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (63, 44, 4876.00, 4963.00, 1868.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (64, 45, 6046.00, 7761.00, 9680.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (65, 46, 507.00, 2163.00, 2535.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (66, 47, 7683.00, 8534.00, 3862.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (67, 48, 4417.00, 9925.00, 2683.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (68, 49, 1631.00, 6761.00, 1069.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (69, 50, 4823.00, 2423.00, 4328.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (70, 51, 3435.00, 7403.00, 6825.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (71, 52, 3039.00, 4416.00, 6787.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (72, 53, 703.00, 1817.00, 399.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (73, 54, 2840.00, 6949.00, 9603.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (74, 55, 6583.00, 5727.00, 855.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (75, 56, 3865.00, 5801.00, 5928.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (76, 57, 4837.00, 3054.00, 5919.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (77, 58, 3186.00, 8301.00, 4652.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (78, 59, 9656.00, 6477.00, 662.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (79, 60, 8096.00, 6354.00, 110.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (80, 61, 5693.00, 8974.00, 915.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (81, 62, 1441.00, 8738.00, 4029.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (82, 63, 3798.00, 3868.00, 7165.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (83, 64, 7424.00, 8870.00, 8179.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (84, 65, 63.00, 7495.00, 9574.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (85, 66, 2308.00, 6033.00, 9212.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (86, 67, 9517.00, 123.00, 2987.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (87, 68, 6382.00, 6307.00, 8451.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (88, 69, 7797.00, 6323.00, 2503.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (89, 70, 4035.00, 6180.00, 5429.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (90, 71, 9170.00, 1757.00, 8992.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (91, 72, 4907.00, 202.00, 521.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (92, 73, 5513.00, 5478.00, 5911.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (93, 74, 5490.00, 3375.00, 4933.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (94, 75, 1335.00, 8270.00, 7770.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (95, 76, 197.00, 9098.00, 2329.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (96, 77, 3784.00, 5196.00, 3015.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (97, 78, 1392.00, 5575.00, 4954.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (98, 79, 2654.00, 7800.00, 2644.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (99, 80, 4940.00, 4195.00, 1563.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (100, 81, 1468.00, 6875.00, 2411.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (101, 82, 9933.00, 2043.00, 7850.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (102, 83, 7573.00, 5299.00, 4978.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (103, 84, 2493.00, 7682.00, 8638.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (104, 85, 3329.00, 7117.00, 791.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (105, 86, 4659.00, 3400.00, 7568.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (106, 87, 1820.00, 4205.00, 3748.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (107, 88, 4401.00, 9402.00, 1532.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (108, 89, 5142.00, 6206.00, 6130.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (109, 90, 3776.00, 4781.00, 2598.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (110, 91, 2890.00, 4940.00, 4871.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (111, 92, 8522.00, 650.00, 8015.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (112, 93, 6886.00, 7097.00, 1940.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (113, 94, 1320.00, 1658.00, 6501.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (114, 95, 6265.00, 2679.00, 3501.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (115, 96, 3709.00, 4137.00, 8461.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (116, 97, 2458.00, 2503.00, 1242.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (117, 98, 5166.00, 7900.00, 6657.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (118, 99, 9186.00, 2116.00, 3727.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (119, 100, 9886.00, 1929.00, 183.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (120, 101, 9747.00, 6558.00, 7944.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (121, 102, 4792.00, 9801.00, 3783.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (122, 103, 1374.00, 8636.00, 8371.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (123, 104, 2986.00, 3410.00, 2294.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (124, 105, 2496.00, 2593.00, 3258.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (125, 106, 3116.00, 2429.00, 5196.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (126, 107, 8281.00, 208.00, 7460.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (127, 108, 7933.00, 5636.00, 6494.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (128, 109, 7466.00, 2299.00, 1776.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (129, 110, 7257.00, 2252.00, 7738.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (130, 111, 4847.00, 7200.00, 7114.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (131, 112, 2837.00, 1095.00, 6547.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (132, 113, 1223.00, 1032.00, 9719.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (133, 114, 3874.00, 8878.00, 8787.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (134, 115, 5741.00, 4736.00, 5087.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (135, 116, 1330.00, 9956.00, 37.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (136, 117, 5799.00, 8030.00, 4114.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (137, 118, 1188.00, 1634.00, 6621.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (138, 119, 3062.00, 6125.00, 6155.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (139, 120, 6986.00, 3650.00, 4939.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (140, 121, 339.00, 3361.00, 7882.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (141, 122, 4622.00, 76.00, 4774.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (142, 123, 7145.00, 246.00, 6140.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (143, 124, 1458.00, 9005.00, 4064.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (144, 125, 7462.00, 1942.00, 3393.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (145, 126, 4854.00, 1477.00, 7685.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (146, 127, 7504.00, 5874.00, 8104.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (147, 128, 9735.00, 2770.00, 6946.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (148, 129, 7595.00, 7282.00, 5415.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (149, 130, 8680.00, 1184.00, 7938.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (150, 131, 5730.00, 1757.00, 938.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (151, 132, 106.00, 3575.00, 4423.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (152, 133, 9365.00, 1462.00, 2272.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (153, 134, 93.00, 8347.00, 2875.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (154, 135, 2130.00, 7266.00, 8546.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (155, 136, 4156.00, 5216.00, 1499.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (156, 137, 7116.00, 9542.00, 4022.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (157, 138, 1990.00, 1865.00, 8262.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (158, 139, 9084.00, 8143.00, 9093.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (159, 140, 9466.00, 8981.00, 4114.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (160, 141, 3140.00, 6075.00, 4104.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (161, 142, 4741.00, 8314.00, 5720.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (162, 143, 3802.00, 8535.00, 3450.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (163, 144, 6261.00, 4556.00, 9984.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (164, 145, 5042.00, 5518.00, 3194.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (165, 146, 9456.00, 3054.00, 6311.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (166, 147, 2138.00, 2138.00, 3729.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (167, 148, 2468.00, 9097.00, 641.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (168, 149, 4541.00, 9772.00, 2709.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (169, 150, 1433.00, 9164.00, 2943.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (170, 151, 3543.00, 734.00, 5240.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (171, 152, 4525.00, 341.00, 6483.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (172, 153, 1412.00, 3392.00, 624.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (173, 154, 8209.00, 7653.00, 2364.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (174, 155, 2544.00, 1042.00, 5992.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (175, 156, 7700.00, 4247.00, 6759.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (176, 157, 6726.00, 4660.00, 3460.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (177, 158, 2233.00, 6760.00, 4417.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (178, 159, 9699.00, 4296.00, 7494.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (179, 160, 4266.00, 3007.00, 6689.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (180, 161, 5350.00, 1907.00, 9012.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (181, 162, 9303.00, 5229.00, 8626.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (182, 163, 8414.00, 1526.00, 92.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (183, 164, 9490.00, 1643.00, 2201.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (184, 165, 6367.00, 8567.00, 6768.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (185, 166, 2490.00, 5367.00, 5377.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (186, 167, 1048.00, 5364.00, 5706.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (187, 168, 3026.00, 1006.00, 1596.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (188, 169, 9546.00, 4050.00, 2108.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (189, 170, 7646.00, 5347.00, 596.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (190, 171, 9853.00, 283.00, 6032.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (191, 172, 1662.00, 4698.00, 5112.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (192, 173, 8306.00, 8117.00, 7334.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (193, 174, 9949.00, 1818.00, 2361.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (194, 175, 3185.00, 6141.00, 1860.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (195, 176, 4674.00, 733.00, 2872.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (196, 177, 3724.00, 6480.00, 600.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (197, 178, 2693.00, 6340.00, 9261.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (198, 179, 4295.00, 8382.00, 342.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (199, 180, 350.00, 6928.00, 2653.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (200, 181, 4670.00, 862.00, 1577.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (201, 182, 5742.00, 3284.00, 4963.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (202, 183, 7859.00, 9592.00, 2277.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (203, 184, 9403.00, 6867.00, 7670.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (204, 185, 2537.00, 7784.00, 2673.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (205, 186, 8349.00, 7704.00, 3802.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (206, 187, 1013.00, 1006.00, 1832.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (207, 188, 7098.00, 5125.00, 9937.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (208, 189, 9054.00, 5351.00, 3428.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (209, 190, 7508.00, 8495.00, 8623.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (210, 191, 634.00, 1361.00, 7815.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (211, 192, 1354.00, 3243.00, 720.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (212, 193, 9353.00, 275.00, 2230.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (213, 194, 6142.00, 5922.00, 1703.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (214, 195, 4421.00, 8238.00, 8399.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (215, 196, 7796.00, 918.00, 2692.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (216, 197, 4611.00, 5823.00, 7316.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (217, 198, 764.00, 8386.00, 6415.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (218, 199, 2016.00, 9614.00, 3196.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (219, 200, 9671.00, 8987.00, 1027.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (220, 201, 9256.00, 3124.00, 6622.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (221, 202, 2380.00, 2010.00, 3762.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (222, 203, 3407.00, 5589.00, 7724.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (223, 204, 7748.00, 9304.00, 2077.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (224, 205, 3964.00, 7331.00, 3626.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (225, 206, 8703.00, 632.00, 436.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (226, 207, 2726.00, 1158.00, 3844.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (227, 208, 5059.00, 7097.00, 7758.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (228, 209, 4458.00, 7083.00, 6907.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (229, 210, 3008.00, 1072.00, 7780.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (230, 211, 9519.00, 4284.00, 9837.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (231, 212, 9840.00, 7514.00, 5699.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (232, 213, 1056.00, 3754.00, 3118.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (233, 214, 8276.00, 2832.00, 1267.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (234, 215, 4395.00, 1099.00, 4132.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (235, 216, 7313.00, 3080.00, 3528.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (236, 217, 9969.00, 3270.00, 4286.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (237, 218, 5225.00, 3372.00, 6377.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (238, 219, 7327.00, 4945.00, 1560.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (239, 220, 6622.00, 4139.00, 31.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (240, 221, 2975.00, 2482.00, 9258.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (241, 222, 5565.00, 4630.00, 2031.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (242, 223, 3172.00, 5192.00, 937.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (243, 224, 1096.00, 3597.00, 9989.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (244, 225, 1066.00, 2723.00, 6426.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (245, 226, 2877.00, 9195.00, 4019.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (246, 227, 7494.00, 8671.00, 273.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (247, 228, 6504.00, 5269.00, 5849.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (248, 229, 2818.00, 2140.00, 7997.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (249, 230, 7725.00, 4320.00, 752.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (250, 231, 3127.00, 4181.00, 4660.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (251, 232, 8133.00, 1670.00, 8707.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (252, 233, 1899.00, 7050.00, 6134.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (253, 234, 4245.00, 8873.00, 2572.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (254, 235, 844.00, 1390.00, 8026.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (255, 236, 6263.00, 377.00, 6575.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (256, 237, 7119.00, 7986.00, 78.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (257, 238, 4209.00, 8860.00, 9562.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (258, 239, 8009.00, 3402.00, 4130.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (259, 240, 8606.00, 2902.00, 1700.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (260, 241, 9011.00, 2953.00, 8165.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (261, 242, 2147.00, 2827.00, 8547.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (262, 243, 8701.00, 732.00, 1522.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (263, 244, 3122.00, 1206.00, 4417.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (264, 245, 8527.00, 5119.00, 2853.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (265, 246, 8867.00, 3129.00, 8345.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (266, 247, 5982.00, 2159.00, 3833.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (267, 248, 8893.00, 3524.00, 9599.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (268, 249, 8496.00, 6723.00, 8724.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (269, 250, 3169.00, 7578.00, 2217.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (270, 251, 7860.00, 1369.00, 3182.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (271, 252, 9293.00, 5756.00, 2240.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (272, 253, 4564.00, 9375.00, 488.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (273, 254, 622.00, 8377.00, 9378.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (274, 255, 1.00, 9103.00, 5751.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (275, 256, 1650.00, 1991.00, 39.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (276, 257, 8862.00, 9838.00, 4166.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (277, 258, 503.00, 1852.00, 3635.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (278, 259, 2089.00, 1656.00, 202.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (279, 260, 4756.00, 8629.00, 6138.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (280, 261, 4420.00, 8785.00, 5204.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (281, 262, 830.00, 2664.00, 4552.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (282, 263, 5387.00, 5576.00, 4931.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (283, 264, 2963.00, 6007.00, 1331.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (284, 265, 7078.00, 5278.00, 8491.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (285, 266, 8583.00, 7595.00, 8938.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (286, 267, 2702.00, 9627.00, 9520.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (287, 268, 7144.00, 3348.00, 5933.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (288, 269, 7722.00, 8859.00, 5821.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (289, 270, 5659.00, 7363.00, 4373.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (290, 271, 5067.00, 6886.00, 792.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (291, 272, 9408.00, 2246.00, 2046.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (292, 273, 6644.00, 6448.00, 2090.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (293, 274, 1636.00, 1384.00, 8625.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (294, 275, 8256.00, 1578.00, 9411.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (295, 276, 9657.00, 9295.00, 4751.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (296, 277, 8587.00, 6782.00, 8126.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (297, 278, 461.00, 3227.00, 8029.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (298, 279, 2788.00, 3615.00, 6748.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (299, 280, 4545.00, 4089.00, 6921.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (300, 281, 8761.00, 3850.00, 20.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (301, 282, 184.00, 8429.00, 8064.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (302, 283, 5431.00, 6755.00, 23.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (303, 284, 1663.00, 2704.00, 9773.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (304, 285, 3176.00, 1207.00, 4079.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (305, 286, 1170.00, 6188.00, 8444.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (306, 287, 5715.00, 6260.00, 794.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (307, 288, 6117.00, 3804.00, 1416.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (308, 289, 8531.00, 3165.00, 5685.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (309, 290, 8378.00, 1346.00, 241.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (310, 291, 4051.00, 7405.00, 8932.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (311, 292, 7238.00, 1297.00, 9893.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (312, 293, 1499.00, 9039.00, 5757.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (313, 294, 9023.00, 6212.00, 8243.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (314, 295, 1993.00, 3532.00, 2498.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (315, 296, 2295.00, 8678.00, 5474.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (316, 297, 1799.00, 7881.00, 1452.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (317, 298, 237.00, 7287.00, 6567.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (318, 299, 7649.00, 3334.00, 3844.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (319, 300, 9437.00, 8243.00, 2834.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (320, 301, 5007.00, 8759.00, 8910.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (321, 302, 5826.00, 9216.00, 3595.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (322, 303, 7863.00, 605.00, 3763.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (323, 304, 8287.00, 4683.00, 6422.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (324, 305, 3467.00, 9753.00, 6184.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (325, 306, 3358.00, 8780.00, 3351.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (326, 307, 6327.00, 5064.00, 9251.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (327, 308, 7036.00, 4935.00, 1795.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (328, 309, 5736.00, 1978.00, 8253.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (329, 310, 3079.00, 3921.00, 1056.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (330, 311, 7152.00, 9021.00, 1116.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (331, 312, 2067.00, 4299.00, 7972.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (332, 313, 8532.00, 8309.00, 6616.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (333, 314, 4368.00, 3078.00, 1404.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (334, 315, 8986.00, 6436.00, 7288.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (335, 316, 1439.00, 3307.00, 3443.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (336, 317, 2179.00, 9172.00, 7952.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (337, 318, 6475.00, 6103.00, 5853.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (338, 319, 938.00, 6422.00, 8885.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (339, 320, 7957.00, 8906.00, 8465.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (340, 321, 8212.00, 2535.00, 8202.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (341, 322, 9979.00, 7951.00, 9630.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (342, 323, 7787.00, 4276.00, 6117.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (343, 324, 6319.00, 4993.00, 5483.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (344, 325, 9362.00, 4175.00, 76.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (345, 326, 4277.00, 807.00, 7124.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (346, 327, 7782.00, 5210.00, 5495.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (347, 328, 6620.00, 1166.00, 7444.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (348, 329, 9923.00, 8637.00, 2369.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (349, 330, 7865.00, 5117.00, 9087.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (350, 331, 1078.00, 1472.00, 4005.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (351, 332, 5387.00, 7282.00, 9038.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (352, 333, 5026.00, 5.00, 4790.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (353, 334, 5964.00, 2233.00, 2439.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (354, 335, 6991.00, 2967.00, 5003.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (355, 336, 2961.00, 5055.00, 6298.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (356, 337, 596.00, 7286.00, 278.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (357, 338, 5526.00, 691.00, 7964.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (358, 339, 6003.00, 1031.00, 1750.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (359, 340, 1877.00, 2989.00, 9205.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (360, 341, 8431.00, 7464.00, 8988.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (361, 342, 976.00, 4421.00, 5594.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (362, 343, 807.00, 573.00, 2111.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (363, 344, 6218.00, 9578.00, 1762.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (364, 345, 9474.00, 6691.00, 7254.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (365, 346, 8663.00, 7086.00, 5404.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (366, 347, 4312.00, 4015.00, 4688.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (367, 348, 6126.00, 8303.00, 9867.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (368, 349, 9509.00, 473.00, 3848.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (369, 350, 9076.00, 1729.00, 5406.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (370, 351, 5672.00, 8947.00, 6081.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (371, 352, 9227.00, 8210.00, 8864.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (372, 353, 8537.00, 6044.00, 5384.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (373, 354, 4000.00, 549.00, 7257.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (374, 355, 9479.00, 1751.00, 7731.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (375, 356, 5085.00, 621.00, 7641.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (376, 357, 1503.00, 770.00, 6923.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (377, 358, 7625.00, 6468.00, 8858.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (378, 359, 2814.00, 1446.00, 9984.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (379, 360, 8650.00, 3257.00, 1451.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (380, 361, 7989.00, 1368.00, 3857.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (381, 362, 6287.00, 1407.00, 8112.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (382, 363, 665.00, 7574.00, 2347.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (383, 364, 4334.00, 1452.00, 9367.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (384, 365, 4332.00, 1895.00, 9613.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (385, 366, 7185.00, 8644.00, 7316.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (386, 367, 5461.00, 6804.00, 553.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (387, 368, 454.00, 5849.00, 3077.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (388, 369, 6539.00, 4727.00, 7880.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (389, 370, 739.00, 3777.00, 4063.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (390, 371, 2216.00, 2161.00, 5602.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (391, 372, 1286.00, 748.00, 6513.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (392, 373, 1685.00, 2736.00, 1871.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (393, 374, 1542.00, 9547.00, 9159.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (394, 375, 2157.00, 159.00, 382.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (395, 376, 5174.00, 3915.00, 6497.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (396, 377, 3484.00, 4367.00, 992.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (397, 378, 4563.00, 958.00, 4575.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (398, 379, 1298.00, 8481.00, 7071.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (399, 380, 6017.00, 4203.00, 8754.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (400, 381, 6793.00, 7260.00, 3145.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (401, 382, 7293.00, 3229.00, 7620.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (402, 383, 1985.00, 2623.00, 3062.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (403, 384, 2668.00, 7458.00, 4202.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (404, 385, 3179.00, 5092.00, 7291.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (405, 386, 5920.00, 8713.00, 172.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (406, 387, 6302.00, 7898.00, 7886.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (407, 388, 6692.00, 9504.00, 8123.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (408, 389, 7530.00, 5120.00, 3526.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (409, 390, 7203.00, 2466.00, 1358.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (410, 391, 2573.00, 4126.00, 7652.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (411, 392, 8414.00, 7636.00, 7073.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (412, 393, 4521.00, 4045.00, 5154.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (413, 394, 9542.00, 5380.00, 1437.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (414, 395, 8173.00, 4004.00, 1802.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (415, 396, 4147.00, 4034.00, 5854.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (416, 397, 5385.00, 1804.00, 2651.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (417, 398, 6899.00, 288.00, 2820.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (418, 399, 888.00, 697.00, 1343.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (419, 400, 1592.00, 9547.00, 2640.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (420, 401, 2986.00, 4074.00, 2577.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (421, 402, 9669.00, 3323.00, 4909.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (422, 403, 1771.00, 7728.00, 7325.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (423, 404, 1497.00, 4590.00, 5760.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (424, 405, 2331.00, 8068.00, 1314.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (425, 406, 8577.00, 5021.00, 160.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (426, 407, 3900.00, 6938.00, 5976.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (427, 408, 4754.00, 757.00, 8061.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (428, 409, 2533.00, 9150.00, 2321.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (429, 410, 102.00, 8395.00, 7078.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (430, 411, 5035.00, 1001.00, 3153.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (431, 412, 1624.00, 3561.00, 7249.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (432, 413, 7423.00, 5124.00, 115.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (433, 414, 9306.00, 4790.00, 1130.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (434, 415, 9222.00, 2375.00, 1823.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (435, 416, 394.00, 8085.00, 1471.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (436, 417, 6425.00, 7640.00, 4721.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (437, 418, 8641.00, 3424.00, 7599.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (438, 419, 1540.00, 1954.00, 9168.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (439, 420, 6311.00, 8063.00, 3153.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (440, 421, 8206.00, 1658.00, 8276.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (441, 422, 399.00, 1567.00, 65.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (442, 423, 2710.00, 7734.00, 5450.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (443, 424, 7389.00, 189.00, 1185.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (444, 425, 3376.00, 7255.00, 1969.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (445, 426, 3331.00, 6231.00, 2981.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (446, 427, 5789.00, 2556.00, 2061.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (447, 428, 5011.00, 6072.00, 6229.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (448, 429, 1598.00, 9724.00, 4932.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (449, 430, 6870.00, 5524.00, 7485.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (450, 431, 5767.00, 9306.00, 857.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (451, 432, 9978.00, 598.00, 1173.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (452, 433, 6230.00, 6963.00, 4124.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (453, 434, 660.00, 986.00, 100.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (454, 435, 8677.00, 6168.00, 7894.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (455, 436, 6655.00, 2151.00, 4449.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (456, 437, 1450.00, 1430.00, 5294.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (457, 438, 3436.00, 2366.00, 2302.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (458, 439, 8313.00, 8116.00, 4757.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (459, 440, 2924.00, 268.00, 2821.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (460, 441, 877.00, 8568.00, 8922.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (461, 442, 1173.00, 6787.00, 1820.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (462, 443, 7242.00, 2400.00, 5683.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (463, 444, 6103.00, 3764.00, 9833.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (464, 445, 6282.00, 3240.00, 8987.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (465, 446, 3812.00, 6704.00, 2691.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (466, 447, 4156.00, 1739.00, 3901.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (467, 448, 5420.00, 1607.00, 1531.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (468, 449, 4310.00, 7425.00, 2391.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (469, 450, 8025.00, 1996.00, 8218.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (470, 451, 6011.00, 2211.00, 9681.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (471, 452, 8148.00, 1589.00, 3240.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (472, 453, 4273.00, 1268.00, 5450.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (473, 454, 7577.00, 5772.00, 3483.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (474, 455, 9859.00, 4552.00, 381.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (475, 456, 9736.00, 7642.00, 9102.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (476, 457, 1294.00, 3246.00, 1145.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (477, 458, 4195.00, 1851.00, 4390.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (478, 459, 6920.00, 2717.00, 845.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (479, 460, 8547.00, 9457.00, 2574.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (480, 461, 5823.00, 7319.00, 6636.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (481, 462, 3081.00, 9682.00, 787.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (482, 463, 4954.00, 6049.00, 8794.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (483, 464, 1526.00, 5739.00, 6464.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (484, 465, 9404.00, 6521.00, 5690.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (485, 466, 6638.00, 9189.00, 6383.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (486, 467, 6760.00, 6014.00, 475.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (487, 468, 5612.00, 296.00, 1180.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (488, 469, 9685.00, 8736.00, 1461.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (489, 470, 5548.00, 8114.00, 6947.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (490, 471, 239.00, 4428.00, 5611.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (491, 472, 107.00, 9776.00, 2730.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (492, 473, 7266.00, 1765.00, 6195.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (493, 474, 7381.00, 1663.00, 2169.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (494, 475, 5383.00, 2587.00, 2042.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (495, 476, 2683.00, 149.00, 2505.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (496, 477, 322.00, 1318.00, 2244.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (497, 478, 2777.00, 2292.00, 831.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (498, 479, 6041.00, 6795.00, 3318.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (499, 480, 6436.00, 8654.00, 3687.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (500, 481, 7129.00, 2451.00, 2072.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (501, 482, 6351.00, 9769.00, 3712.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (502, 483, 9530.00, 9912.00, 3583.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (503, 484, 7086.00, 971.00, 677.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (504, 485, 6157.00, 1542.00, 8194.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (505, 486, 5721.00, 9469.00, 9720.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (506, 487, 1345.00, 6256.00, 392.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (507, 488, 6481.00, 5856.00, 6726.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (508, 489, 5146.00, 9989.00, 9518.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (509, 490, 2866.00, 8727.00, 7466.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (510, 491, 9608.00, 9897.00, 3437.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (511, 492, 6101.00, 2206.00, 3027.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (512, 493, 2014.00, 8335.00, 7293.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (513, 494, 4247.00, 6231.00, 6910.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (514, 495, 8440.00, 2397.00, 9297.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (515, 496, 3554.00, 7970.00, 2919.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (516, 497, 9251.00, 9409.00, 5293.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (517, 498, 5578.00, 1055.00, 793.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (518, 499, 4762.00, 5966.00, 8226.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (519, 500, 9939.00, 289.00, 2461.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (520, 501, 5766.00, 8423.00, 332.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (521, 502, 2493.00, 8512.00, 2400.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (522, 503, 3333.00, 207.00, 7570.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (523, 504, 6076.00, 5358.00, 3108.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (524, 505, 4417.00, 750.00, 4422.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (525, 506, 1876.00, 3409.00, 6590.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (526, 507, 220.00, 7687.00, 376.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (527, 508, 9460.00, 2288.00, 1705.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (528, 509, 268.00, 2382.00, 7555.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (529, 510, 4808.00, 7302.00, 1404.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (530, 511, 3686.00, 6256.00, 1196.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (531, 512, 6094.00, 4078.00, 5341.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (532, 513, 7447.00, 2356.00, 5591.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (533, 514, 3517.00, 8551.00, 535.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (534, 515, 8477.00, 2131.00, 2743.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (535, 516, 6714.00, 1052.00, 519.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (536, 517, 1650.00, 4801.00, 2314.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (537, 518, 7860.00, 8436.00, 9209.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (538, 519, 9621.00, 9989.00, 2090.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (539, 520, 121.00, 907.00, 1509.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (540, 521, 9052.00, 733.00, 3288.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (541, 522, 830.00, 5240.00, 1102.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (542, 523, 1492.00, 5635.00, 5455.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (543, 524, 718.00, 4678.00, 4190.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (544, 525, 6920.00, 4511.00, 7934.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (545, 526, 2219.00, 7764.00, 8843.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (546, 527, 2239.00, 7361.00, 3883.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (547, 528, 2670.00, 876.00, 3992.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (548, 529, 3716.00, 7543.00, 684.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (549, 530, 2988.00, 8810.00, 599.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (550, 531, 3601.00, 9064.00, 3229.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (551, 532, 8210.00, 9757.00, 1079.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (552, 533, 8491.00, 8023.00, 8774.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (553, 534, 6947.00, 8710.00, 3084.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (554, 535, 8061.00, 9333.00, 3484.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (555, 536, 3750.00, 3768.00, 4847.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (556, 537, 1627.00, 8600.00, 8192.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (557, 538, 304.00, 3747.00, 3826.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (558, 539, 7715.00, 2434.00, 1242.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (559, 540, 3421.00, 4202.00, 9685.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (560, 541, 8580.00, 8753.00, 2406.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (561, 542, 7651.00, 2586.00, 3492.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (562, 543, 2729.00, 9579.00, 1648.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (563, 544, 1063.00, 7501.00, 1148.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (564, 545, 7554.00, 4469.00, 3123.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (565, 546, 9279.00, 6822.00, 2361.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (566, 547, 5790.00, 9229.00, 872.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (567, 548, 1033.00, 2158.00, 8021.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (568, 549, 8673.00, 1082.00, 4764.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (569, 550, 6551.00, 2167.00, 1417.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (570, 551, 2956.00, 5638.00, 7657.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (571, 552, 3677.00, 5427.00, 9874.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (572, 553, 5238.00, 8575.00, 2204.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (573, 554, 1537.00, 8028.00, 4916.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (574, 555, 2732.00, 6670.00, 8597.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (575, 556, 4042.00, 7241.00, 1958.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (576, 557, 5485.00, 7370.00, 6481.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (577, 558, 9613.00, 5040.00, 7720.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (578, 559, 1447.00, 8504.00, 1822.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (579, 560, 8127.00, 5210.00, 2330.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (580, 561, 5387.00, 637.00, 353.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (581, 562, 9139.00, 4267.00, 2798.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (582, 563, 15.00, 1608.00, 7234.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (583, 564, 1968.00, 1323.00, 2664.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (584, 565, 5535.00, 2051.00, 4354.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (585, 566, 8341.00, 1044.00, 3545.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (586, 567, 364.00, 2452.00, 4138.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (587, 568, 9820.00, 7116.00, 1761.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (588, 569, 2704.00, 7576.00, 7946.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (589, 570, 3894.00, 1463.00, 1767.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (590, 571, 2331.00, 9236.00, 1312.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (591, 572, 5711.00, 1743.00, 4812.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (592, 573, 6084.00, 6808.00, 2369.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (593, 574, 5456.00, 4726.00, 4303.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (594, 575, 1364.00, 9616.00, 2965.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (595, 576, 3503.00, 5435.00, 2515.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (596, 577, 9239.00, 7017.00, 484.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (597, 578, 7996.00, 5805.00, 7913.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (598, 579, 5530.00, 2408.00, 363.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (599, 580, 1762.00, 582.00, 1328.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (600, 581, 7664.00, 9749.00, 7867.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (601, 582, 1224.00, 7751.00, 5695.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (602, 583, 3102.00, 7835.00, 3181.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (603, 584, 3958.00, 292.00, 219.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (604, 585, 447.00, 876.00, 94.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (605, 586, 2040.00, 1250.00, 4896.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (606, 587, 1946.00, 2381.00, 6635.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (607, 588, 7174.00, 7048.00, 3531.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (608, 589, 7435.00, 6882.00, 9626.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (609, 590, 8827.00, 8949.00, 7710.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (610, 591, 7138.00, 4488.00, 5391.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (611, 592, 4364.00, 8129.00, 1663.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (612, 593, 1558.00, 2573.00, 1608.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (613, 594, 4778.00, 2643.00, 1240.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (614, 595, 2481.00, 5144.00, 599.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (615, 596, 7251.00, 6215.00, 5031.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (616, 597, 2560.00, 6466.00, 9745.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (617, 598, 6776.00, 4820.00, 9324.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (618, 599, 8609.00, 8238.00, 1553.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (619, 600, 1396.00, 9844.00, 3498.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (620, 601, 8493.00, 1367.00, 7442.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (621, 602, 4161.00, 3230.00, 9304.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (622, 603, 9138.00, 5978.00, 4715.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (623, 604, 8232.00, 7131.00, 125.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (624, 605, 7219.00, 2490.00, 8940.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (625, 606, 8593.00, 135.00, 8222.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (626, 607, 6781.00, 8754.00, 8901.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (627, 608, 6085.00, 4443.00, 5274.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (628, 609, 3350.00, 2955.00, 3884.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (629, 610, 4637.00, 1294.00, 6003.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (630, 611, 4760.00, 6116.00, 742.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (631, 612, 3784.00, 6770.00, 9152.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (632, 613, 3093.00, 27.00, 7461.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (633, 614, 6140.00, 5368.00, 1962.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (634, 615, 5339.00, 3879.00, 366.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (635, 616, 9106.00, 3729.00, 4745.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (636, 617, 7491.00, 3510.00, 1974.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (637, 618, 31.00, 5675.00, 9800.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (638, 619, 98.00, 9406.00, 3684.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (639, 620, 544.00, 9231.00, 2662.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (640, 621, 9508.00, 2340.00, 3416.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (641, 622, 746.00, 9624.00, 9188.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (642, 623, 6672.00, 1515.00, 8605.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (643, 624, 4617.00, 6521.00, 4975.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (644, 625, 2641.00, 197.00, 2163.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (645, 626, 5657.00, 8272.00, 5928.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (646, 627, 2949.00, 9835.00, 1954.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (647, 628, 3314.00, 9400.00, 6330.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (648, 629, 5694.00, 3238.00, 1418.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (649, 630, 9303.00, 2460.00, 5111.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (650, 631, 6538.00, 6751.00, 6707.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (651, 632, 5624.00, 9442.00, 8049.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (652, 633, 482.00, 1402.00, 715.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (653, 634, 7645.00, 2995.00, 3034.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (654, 635, 6349.00, 5619.00, 9179.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (655, 636, 8721.00, 6028.00, 3222.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (656, 637, 1651.00, 8386.00, 7233.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (657, 638, 5868.00, 447.00, 3121.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (658, 639, 1988.00, 4002.00, 1208.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (659, 640, 4696.00, 2865.00, 5034.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (660, 641, 6660.00, 5214.00, 7438.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (661, 642, 7896.00, 7306.00, 3823.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (662, 643, 2321.00, 498.00, 3590.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (663, 644, 8759.00, 7998.00, 175.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (664, 645, 5568.00, 990.00, 8526.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (665, 646, 1348.00, 6033.00, 3963.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (666, 647, 6117.00, 3100.00, 9094.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (667, 648, 6863.00, 388.00, 8292.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (668, 649, 6557.00, 7228.00, 948.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (669, 650, 1524.00, 364.00, 2247.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (670, 651, 6793.00, 662.00, 4630.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (671, 652, 7026.00, 7357.00, 6290.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (672, 653, 9799.00, 505.00, 5486.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (673, 654, 2837.00, 495.00, 9965.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (674, 655, 980.00, 2335.00, 5856.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (675, 656, 4837.00, 6454.00, 1049.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (676, 657, 5821.00, 5953.00, 82.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (677, 658, 7367.00, 530.00, 1671.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (678, 659, 3276.00, 7252.00, 4491.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (679, 660, 7560.00, 8689.00, 7346.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (680, 661, 1007.00, 3563.00, 7376.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (681, 662, 1022.00, 5935.00, 2772.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (682, 663, 8070.00, 4807.00, 1509.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (683, 664, 679.00, 9186.00, 3678.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (684, 665, 6135.00, 7117.00, 3882.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (685, 666, 4556.00, 1127.00, 1125.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (686, 667, 737.00, 3383.00, 304.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (687, 668, 5624.00, 8762.00, 1708.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (688, 669, 6741.00, 749.00, 5352.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (689, 670, 376.00, 7589.00, 5893.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (690, 671, 5751.00, 5779.00, 9180.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (691, 672, 7863.00, 3420.00, 9980.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (692, 673, 3561.00, 1655.00, 6499.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (693, 674, 8777.00, 6588.00, 7216.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (694, 675, 3514.00, 8906.00, 1269.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (695, 676, 6275.00, 6440.00, 3443.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (696, 677, 9344.00, 3600.00, 4787.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (697, 678, 8737.00, 2678.00, 4311.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (698, 679, 6675.00, 5001.00, 7815.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (699, 680, 52.00, 9546.00, 8107.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (700, 681, 1059.00, 2763.00, 8180.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (701, 682, 6289.00, 8966.00, 9372.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (702, 683, 5314.00, 5668.00, 8958.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (703, 684, 3316.00, 6032.00, 29.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (704, 685, 2653.00, 1110.00, 5996.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (705, 686, 1984.00, 1890.00, 1529.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (706, 687, 6165.00, 2920.00, 2157.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (707, 688, 3970.00, 6689.00, 9430.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (708, 689, 2044.00, 7779.00, 4913.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (709, 690, 310.00, 6199.00, 2462.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (710, 691, 542.00, 4743.00, 102.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (711, 692, 1580.00, 9578.00, 7934.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (712, 693, 5774.00, 5748.00, 3627.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (713, 694, 8175.00, 1684.00, 2977.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (714, 695, 1188.00, 8202.00, 3384.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (715, 696, 3461.00, 7686.00, 684.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (716, 697, 1406.00, 9118.00, 5481.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (717, 698, 111.00, 4510.00, 9617.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (718, 699, 4738.00, 4193.00, 6275.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (719, 700, 2602.00, 1250.00, 1135.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (720, 701, 2677.00, 4195.00, 4817.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (721, 702, 9577.00, 8623.00, 8527.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (722, 703, 3790.00, 9103.00, 1766.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (723, 704, 7255.00, 4630.00, 8262.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (724, 705, 9724.00, 6198.00, 3381.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (725, 706, 5283.00, 8156.00, 3804.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (726, 707, 135.00, 6816.00, 4402.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (727, 708, 2948.00, 8929.00, 1171.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (728, 709, 2076.00, 9491.00, 4233.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (729, 710, 224.00, 5742.00, 4445.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (730, 711, 7839.00, 6540.00, 9100.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (731, 712, 3417.00, 8490.00, 8672.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (732, 713, 60.00, 1723.00, 4413.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (733, 714, 9024.00, 9210.00, 9241.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (734, 715, 4803.00, 4080.00, 834.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (735, 716, 3485.00, 4632.00, 9005.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (736, 717, 3387.00, 9111.00, 9936.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (737, 718, 1396.00, 6955.00, 1861.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (738, 719, 7590.00, 1620.00, 6015.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (739, 720, 9231.00, 6633.00, 5011.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (740, 721, 1594.00, 8399.00, 5936.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (741, 722, 2351.00, 9381.00, 8369.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (742, 723, 5306.00, 2224.00, 460.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (743, 724, 4523.00, 5052.00, 2582.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (744, 725, 3397.00, 4686.00, 3999.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (745, 726, 5181.00, 9595.00, 3424.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (746, 727, 3236.00, 6424.00, 4930.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (747, 728, 5224.00, 3602.00, 9233.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (748, 729, 5270.00, 7466.00, 971.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (749, 730, 9563.00, 1495.00, 2551.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (750, 731, 5082.00, 5106.00, 1623.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (751, 732, 2360.00, 654.00, 6384.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (752, 733, 900.00, 7013.00, 9977.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (753, 734, 656.00, 8211.00, 9571.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (754, 735, 8303.00, 1446.00, 504.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (755, 736, 2524.00, 4506.00, 925.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (756, 737, 9471.00, 9538.00, 6807.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (757, 738, 9465.00, 9186.00, 3193.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (758, 739, 9593.00, 6924.00, 1902.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (759, 740, 210.00, 6562.00, 2919.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (760, 741, 3830.00, 3568.00, 4281.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (761, 742, 9639.00, 1106.00, 5390.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (762, 743, 1190.00, 6502.00, 2824.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (763, 744, 714.00, 7249.00, 6819.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (764, 745, 5689.00, 896.00, 6949.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (765, 746, 5124.00, 2341.00, 4226.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (766, 747, 4482.00, 1850.00, 4257.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (767, 748, 4820.00, 8273.00, 2614.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (768, 749, 1665.00, 4707.00, 9965.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (769, 750, 5167.00, 7621.00, 2829.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (770, 751, 8724.00, 8541.00, 9522.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (771, 752, 3285.00, 5945.00, 1552.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (772, 753, 9708.00, 3883.00, 8583.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (773, 754, 1919.00, 5804.00, 9314.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (774, 755, 9280.00, 2600.00, 8008.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (775, 756, 7165.00, 5012.00, 6949.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (776, 757, 8871.00, 6246.00, 2033.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (777, 758, 1128.00, 8270.00, 618.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (778, 759, 5922.00, 1817.00, 9638.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (779, 760, 1445.00, 6503.00, 1039.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (780, 761, 4439.00, 1838.00, 4982.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (781, 762, 1446.00, 8673.00, 9071.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (782, 763, 6162.00, 9656.00, 4898.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (783, 764, 8199.00, 203.00, 4671.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (784, 765, 618.00, 6308.00, 7298.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (785, 766, 3664.00, 7299.00, 8228.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (786, 767, 3594.00, 8372.00, 801.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (787, 768, 9102.00, 8160.00, 1441.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (788, 769, 5190.00, 7797.00, 7230.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (789, 770, 5344.00, 9616.00, 9942.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (790, 771, 1563.00, 3697.00, 9865.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (791, 772, 1603.00, 8365.00, 5156.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (792, 773, 2174.00, 7860.00, 6186.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (793, 774, 6804.00, 161.00, 3597.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (794, 775, 5625.00, 7286.00, 9977.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (795, 776, 1121.00, 7497.00, 1853.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (796, 777, 3634.00, 2325.00, 2017.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (797, 778, 5877.00, 5395.00, 9633.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (798, 779, 9776.00, 2890.00, 1212.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (799, 780, 8894.00, 4186.00, 1277.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (800, 781, 7092.00, 3111.00, 1134.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (801, 782, 875.00, 7867.00, 1010.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (802, 783, 8601.00, 9028.00, 6260.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (803, 784, 3296.00, 5601.00, 9940.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (804, 785, 8368.00, 9087.00, 8541.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (805, 786, 7299.00, 2840.00, 2871.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (806, 787, 2915.00, 9288.00, 4552.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (807, 788, 1993.00, 7578.00, 7417.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (808, 789, 3931.00, 9888.00, 169.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (809, 790, 9873.00, 9137.00, 5094.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (810, 791, 188.00, 6034.00, 2497.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (811, 792, 9398.00, 8260.00, 935.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (812, 793, 778.00, 8194.00, 5160.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (813, 794, 1020.00, 2074.00, 3607.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (814, 795, 7461.00, 5931.00, 9290.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (815, 796, 1140.00, 4374.00, 7136.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (816, 797, 106.00, 6478.00, 5976.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (817, 798, 8688.00, 5218.00, 6853.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (818, 799, 3675.00, 3333.00, 9984.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (819, 800, 3600.00, 2006.00, 3110.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (820, 801, 2289.00, 4067.00, 9252.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (821, 802, 3350.00, 931.00, 7253.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (822, 803, 6338.00, 8907.00, 2205.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (823, 804, 6067.00, 6960.00, 7942.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (824, 805, 329.00, 8962.00, 8386.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (825, 806, 24.00, 2039.00, 631.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (826, 807, 1393.00, 1682.00, 4556.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (827, 808, 3414.00, 8845.00, 8293.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (828, 809, 7892.00, 9262.00, 909.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (829, 810, 7515.00, 2039.00, 2942.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (830, 811, 3003.00, 1274.00, 840.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (831, 812, 6109.00, 2505.00, 211.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (832, 813, 8945.00, 9043.00, 8627.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (833, 814, 8075.00, 5682.00, 7727.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (834, 815, 8077.00, 1054.00, 4309.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (835, 816, 4576.00, 5584.00, 4471.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (836, 817, 5261.00, 4899.00, 3795.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (837, 818, 8114.00, 302.00, 4988.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (838, 819, 4040.00, 3540.00, 2738.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (839, 820, 5007.00, 5123.00, 3035.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (840, 821, 49.00, 513.00, 9137.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (841, 822, 9329.00, 4812.00, 3976.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (842, 823, 1787.00, 1861.00, 9939.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (843, 824, 5090.00, 922.00, 8039.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (844, 825, 7561.00, 7712.00, 8710.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (845, 826, 4821.00, 7324.00, 4124.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (846, 827, 9933.00, 6233.00, 8707.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (847, 828, 3658.00, 3388.00, 1885.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (848, 829, 6315.00, 5850.00, 8240.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (849, 830, 4225.00, 2055.00, 5029.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (850, 831, 3667.00, 9317.00, 5979.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (851, 832, 7824.00, 4271.00, 8607.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (852, 833, 1607.00, 8416.00, 8764.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (853, 834, 2463.00, 5926.00, 2116.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (854, 835, 1207.00, 5337.00, 8116.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (855, 836, 9689.00, 684.00, 4937.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (856, 837, 3694.00, 7154.00, 1563.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (857, 838, 2650.00, 6390.00, 7437.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (858, 839, 6219.00, 8537.00, 5389.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (859, 840, 3836.00, 3211.00, 6430.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (860, 841, 706.00, 3085.00, 383.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (861, 842, 4873.00, 8280.00, 4739.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (862, 843, 9829.00, 1722.00, 974.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (863, 844, 9072.00, 5973.00, 7568.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (864, 845, 1702.00, 8024.00, 2469.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (865, 846, 8676.00, 8647.00, 9994.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (866, 847, 6489.00, 2399.00, 9356.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (867, 848, 4099.00, 9928.00, 4008.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (868, 849, 57.00, 1872.00, 7904.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (869, 850, 3991.00, 3924.00, 39.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (870, 851, 1254.00, 759.00, 4242.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (871, 852, 2742.00, 8060.00, 4829.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (872, 853, 8153.00, 9884.00, 3453.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (873, 854, 8319.00, 7421.00, 6303.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (874, 855, 7910.00, 2450.00, 1542.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (875, 856, 842.00, 3863.00, 1402.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (876, 857, 7854.00, 4709.00, 9857.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (877, 858, 2142.00, 5660.00, 3382.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (878, 859, 4252.00, 9147.00, 7677.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (879, 860, 3900.00, 597.00, 8995.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (880, 861, 4015.00, 2830.00, 2081.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (881, 862, 7356.00, 9314.00, 8111.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (882, 863, 6787.00, 1242.00, 2352.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (883, 864, 1080.00, 567.00, 6179.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (884, 865, 4029.00, 9900.00, 4810.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (885, 866, 3696.00, 8233.00, 557.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (886, 867, 9826.00, 6613.00, 3355.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (887, 868, 4324.00, 512.00, 2751.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (888, 869, 8112.00, 9008.00, 9787.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (889, 870, 3204.00, 2144.00, 1173.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (890, 871, 3299.00, 6311.00, 9644.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (891, 872, 7759.00, 3788.00, 2384.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (892, 873, 2982.00, 3858.00, 632.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (893, 874, 6962.00, 4054.00, 454.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (894, 875, 3003.00, 8700.00, 6140.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (895, 876, 3846.00, 5081.00, 10.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (896, 877, 1166.00, 9358.00, 5097.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (897, 878, 2542.00, 487.00, 1921.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (898, 879, 5387.00, 3111.00, 9727.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (899, 880, 6076.00, 9013.00, 8136.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (900, 881, 4482.00, 5550.00, 8129.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (901, 882, 4988.00, 568.00, 1770.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (902, 883, 1444.00, 5387.00, 8239.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (903, 884, 9523.00, 9100.00, 1163.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (904, 885, 267.00, 6093.00, 1738.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (905, 886, 9738.00, 8270.00, 4730.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (906, 887, 3139.00, 855.00, 4780.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (907, 888, 5003.00, 7610.00, 2832.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (908, 889, 2280.00, 9414.00, 4400.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (909, 890, 9654.00, 3850.00, 4143.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (910, 891, 2878.00, 3612.00, 2247.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (911, 892, 1937.00, 2354.00, 9289.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (912, 893, 218.00, 7581.00, 5114.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (913, 894, 6068.00, 8212.00, 8825.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (914, 895, 6738.00, 6445.00, 4174.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (915, 896, 5580.00, 5692.00, 9098.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (916, 897, 6941.00, 3318.00, 9688.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (917, 898, 7848.00, 1185.00, 5190.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (918, 899, 7009.00, 955.00, 5230.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (919, 900, 9067.00, 7901.00, 8314.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (920, 901, 7058.00, 6577.00, 3171.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (921, 902, 352.00, 8366.00, 762.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (922, 903, 3958.00, 498.00, 9791.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (923, 904, 5892.00, 2731.00, 2488.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (924, 905, 375.00, 9195.00, 6152.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (925, 906, 500.00, 9615.00, 157.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (926, 907, 392.00, 9915.00, 4981.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (927, 908, 9258.00, 756.00, 3969.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (928, 909, 2676.00, 990.00, 5701.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (929, 910, 7320.00, 9948.00, 9961.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (930, 911, 1128.00, 8000.00, 8217.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (931, 912, 207.00, 9187.00, 4648.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (932, 913, 7533.00, 5115.00, 8143.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (933, 914, 3643.00, 862.00, 2269.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (934, 915, 9255.00, 968.00, 8034.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (935, 916, 1964.00, 3187.00, 1066.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (936, 917, 1811.00, 7090.00, 5725.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (937, 918, 3517.00, 6720.00, 5867.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (938, 919, 9155.00, 91.00, 869.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (939, 920, 4275.00, 50.00, 5498.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (940, 921, 6698.00, 1721.00, 4552.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (941, 922, 3412.00, 1833.00, 3880.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (942, 923, 4840.00, 6884.00, 536.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (943, 924, 9071.00, 7558.00, 4202.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (944, 925, 1373.00, 8515.00, 6557.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (945, 926, 1006.00, 6960.00, 8139.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (946, 927, 3601.00, 7829.00, 6912.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (947, 928, 4807.00, 9350.00, 6354.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (948, 929, 6569.00, 6088.00, 6373.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (949, 930, 3404.00, 6986.00, 7679.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (950, 931, 1734.00, 7699.00, 9312.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (951, 932, 519.00, 2162.00, 2911.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (952, 933, 4621.00, 9239.00, 4282.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (953, 934, 9215.00, 6451.00, 9825.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (954, 935, 6571.00, 4495.00, 1053.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (955, 936, 9831.00, 8226.00, 1847.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (956, 937, 7305.00, 602.00, 3782.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (957, 938, 7594.00, 9924.00, 2266.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (958, 939, 5375.00, 6016.00, 608.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (959, 940, 9745.00, 296.00, 5101.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (960, 941, 7400.00, 7922.00, 5211.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (961, 942, 7914.00, 4160.00, 9493.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (962, 943, 9780.00, 7386.00, 4131.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (963, 944, 3803.00, 3436.00, 306.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (964, 945, 6757.00, 1904.00, 2200.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (965, 946, 7769.00, 7846.00, 9254.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (966, 947, 3232.00, 4979.00, 5316.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (967, 948, 4194.00, 3143.00, 5565.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (968, 949, 1628.00, 1259.00, 3844.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (969, 950, 1753.00, 6741.00, 7926.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (970, 951, 8087.00, 5859.00, 160.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (971, 952, 1560.00, 7237.00, 7553.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (972, 953, 3709.00, 6757.00, 7026.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (973, 954, 3614.00, 3795.00, 8970.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (974, 955, 5196.00, 443.00, 5534.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (975, 956, 5781.00, 6153.00, 4426.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (976, 957, 1277.00, 7396.00, 2596.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (977, 958, 7284.00, 5742.00, 3241.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (978, 959, 1892.00, 5335.00, 9083.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (979, 960, 8557.00, 2685.00, 6837.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (980, 961, 8616.00, 1441.00, 4724.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (981, 962, 3609.00, 9537.00, 4479.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (982, 963, 6378.00, 8395.00, 4060.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (983, 964, 9286.00, 4473.00, 1218.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (984, 965, 1738.00, 6636.00, 5831.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (985, 966, 9569.00, 4897.00, 8231.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (986, 967, 9529.00, 1545.00, 2902.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (987, 968, 9239.00, 381.00, 7540.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (988, 969, 4289.00, 2337.00, 1947.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (989, 970, 4345.00, 9483.00, 6216.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (990, 971, 555.00, 8649.00, 4585.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (991, 972, 9170.00, 5325.00, 1205.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (992, 973, 963.00, 814.00, 780.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (993, 974, 1585.00, 4904.00, 4530.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (994, 975, 6658.00, 6692.00, 289.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (995, 976, 4809.00, 2004.00, 4537.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (996, 977, 9771.00, 3107.00, 7748.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (997, 978, 3290.00, 6143.00, 4575.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (998, 979, 4015.00, 4222.00, 5937.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (999, 980, 6107.00, 7401.00, 5941.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1000, 981, 7712.00, 8355.00, 646.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1001, 982, 5568.00, 9427.00, 632.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1002, 983, 4096.00, 2012.00, 4026.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1003, 984, 6394.00, 9515.00, 7882.00, 0, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1004, 985, 4129.00, 2558.00, 870.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1005, 986, 4716.00, 8230.00, 1793.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1006, 987, 2126.00, 4811.00, 3460.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1007, 988, 4315.00, 6613.00, 2428.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1008, 989, 7010.00, 820.00, 4264.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1009, 990, 1397.00, 7631.00, 4553.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1010, 991, 3546.00, 5000.00, 9837.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1011, 992, 6945.00, 7982.00, 4975.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1012, 993, 8413.00, 1854.00, 974.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1013, 994, 195.00, 9899.00, 3857.00, 0, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1014, 995, 6239.00, 1957.00, 5449.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1015, 996, 2832.00, 358.00, 8265.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1016, 997, 2051.00, 6778.00, 8674.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1017, 998, 1962.00, 3448.00, 1536.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1018, 999, 5781.00, 1839.00, 8681.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1019, 1000, 380.00, 7407.00, 1533.00, 1, 0, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1020, 1001, 5453.00, 628.00, 3616.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1021, 1002, 7193.00, 8230.00, 2163.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1022, 1003, 1555.00, 6050.00, 1929.00, 1, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1023, 1004, 5646.00, 1566.00, 385.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1024, 1005, 1936.00, 7851.00, 8132.00, 0, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1025, 1006, 4673.00, 9992.00, 4295.00, 1, 3, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1026, 1007, 9216.00, 8097.00, 9328.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1027, 1008, 9983.00, 6725.00, 1446.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1028, 1009, 4419.00, 2597.00, 6012.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1029, 1010, 772.00, 1827.00, 7020.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1030, 1011, 3475.00, 3503.00, 7095.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1031, 1012, 9989.00, 6008.00, 5423.00, 0, 1, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1032, 1013, 784.00, 9584.00, 6519.00, 0, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1033, 1014, 6067.00, 4485.00, 8293.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1034, 1015, 9532.00, 1495.00, 5950.00, 1, 2, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');
INSERT INTO public.payment (id, reservation_id, deposit, amount, total_amount, payment_type, status, created_date, updated_date) VALUES (1035, 1016, 6883.00, 9991.00, 5437.00, 1, 4, '2025-10-02 11:30:09.275945', '2025-10-02 11:30:09.275945');


--
-- TOC entry 3519 (class 0 OID 24839)
-- Dependencies: 228
-- Data for Name: rent_price; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (4, 12, 557.00, 230.00, 124.00, 822.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (5, 13, 871.00, 809.00, 856.00, 96.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (6, 14, 258.00, 949.00, 819.00, 75.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (7, 15, 778.00, 568.00, 181.00, 190.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (8, 16, 117.00, 488.00, 681.00, 832.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (9, 17, 594.00, 221.00, 867.00, 328.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (10, 18, 238.00, 969.00, 504.00, 643.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (11, 19, 155.00, 608.00, 886.00, 853.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (12, 20, 749.00, 817.00, 324.00, 517.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (13, 21, 793.00, 278.00, 780.00, 388.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (14, 22, 977.00, 924.00, 315.00, 978.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (15, 23, 411.00, 84.00, 565.00, 919.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (16, 24, 652.00, 748.00, 599.00, 514.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (17, 25, 84.00, 446.00, 133.00, 688.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (18, 26, 739.00, 116.00, 885.00, 832.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (19, 27, 799.00, 849.00, 27.00, 545.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (20, 28, 660.00, 931.00, 541.00, 955.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (21, 29, 890.00, 211.00, 916.00, 166.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (22, 30, 571.00, 133.00, 211.00, 541.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (23, 31, 218.00, 681.00, 221.00, 641.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (24, 32, 712.00, 334.00, 451.00, 98.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (25, 33, 511.00, 406.00, 395.00, 14.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (26, 34, 243.00, 9.00, 430.00, 326.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (27, 35, 996.00, 851.00, 11.00, 150.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (28, 36, 762.00, 970.00, 526.00, 50.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (29, 37, 971.00, 942.00, 262.00, 578.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (30, 38, 286.00, 15.00, 471.00, 952.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (31, 39, 530.00, 630.00, 104.00, 312.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (32, 40, 230.00, 294.00, 773.00, 399.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (33, 41, 884.00, 929.00, 752.00, 134.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (34, 42, 346.00, 918.00, 273.00, 597.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (35, 43, 556.00, 732.00, 933.00, 87.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (36, 44, 254.00, 756.00, 36.00, 537.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (37, 45, 356.00, 673.00, 482.00, 985.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (38, 46, 111.00, 654.00, 353.00, 97.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (39, 47, 279.00, 557.00, 342.00, 568.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (40, 48, 934.00, 187.00, 158.00, 545.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (41, 49, 584.00, 188.00, 915.00, 412.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (42, 50, 479.00, 774.00, 519.00, 305.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (43, 51, 375.00, 633.00, 372.00, 51.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (44, 52, 532.00, 143.00, 140.00, 703.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (45, 53, 41.00, 273.00, 994.00, 778.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (46, 54, 410.00, 727.00, 70.00, 955.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (47, 55, 553.00, 424.00, 93.00, 881.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (48, 56, 544.00, 992.00, 651.00, 482.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (49, 57, 182.00, 230.00, 281.00, 342.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (50, 58, 524.00, 420.00, 198.00, 213.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (51, 59, 590.00, 381.00, 415.00, 142.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (52, 60, 319.00, 432.00, 821.00, 192.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (53, 61, 325.00, 382.00, 184.00, 343.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (54, 62, 30.00, 690.00, 946.00, 393.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (55, 63, 260.00, 359.00, 632.00, 725.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (56, 64, 75.00, 775.00, 158.00, 201.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (57, 65, 288.00, 684.00, 582.00, 218.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (58, 66, 639.00, 33.00, 570.00, 125.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (59, 67, 963.00, 469.00, 387.00, 1000.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (60, 68, 803.00, 665.00, 439.00, 19.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (61, 69, 764.00, 362.00, 570.00, 223.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (62, 70, 984.00, 108.00, 83.00, 323.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (63, 71, 11.00, 181.00, 151.00, 460.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (64, 72, 754.00, 259.00, 340.00, 468.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (65, 73, 582.00, 759.00, 422.00, 144.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (66, 74, 281.00, 976.00, 945.00, 602.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (67, 75, 843.00, 712.00, 388.00, 485.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (68, 76, 797.00, 243.00, 809.00, 123.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (69, 77, 2.00, 669.00, 48.00, 488.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (70, 78, 557.00, 923.00, 390.00, 842.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (71, 79, 714.00, 175.00, 271.00, 158.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (72, 80, 194.00, 849.00, 409.00, 657.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (73, 81, 550.00, 388.00, 962.00, 891.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (74, 82, 497.00, 690.00, 630.00, 710.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (75, 83, 421.00, 825.00, 161.00, 611.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (76, 84, 849.00, 690.00, 547.00, 11.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (77, 85, 66.00, 196.00, 235.00, 676.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (78, 86, 175.00, 526.00, 218.00, 221.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (79, 87, 17.00, 442.00, 99.00, 706.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (80, 88, 734.00, 38.00, 58.00, 78.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (81, 89, 268.00, 473.00, 308.00, 897.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (82, 90, 864.00, 344.00, 312.00, 448.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (83, 91, 562.00, 819.00, 848.00, 940.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (84, 92, 218.00, 996.00, 188.00, 66.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (85, 93, 849.00, 241.00, 626.00, 833.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (86, 94, 854.00, 531.00, 453.00, 285.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (87, 95, 637.00, 675.00, 562.00, 664.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (88, 96, 231.00, 134.00, 266.00, 59.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (89, 97, 654.00, 632.00, 141.00, 227.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (90, 98, 636.00, 127.00, 166.00, 509.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (91, 99, 587.00, 320.00, 104.00, 921.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (92, 100, 262.00, 539.00, 546.00, 305.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (93, 101, 16.00, 182.00, 898.00, 525.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (94, 102, 655.00, 610.00, 50.00, 946.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (95, 103, 422.00, 575.00, 504.00, 997.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (96, 104, 166.00, 317.00, 929.00, 721.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (97, 105, 909.00, 344.00, 743.00, 282.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (98, 106, 17.00, 120.00, 217.00, 626.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (99, 107, 133.00, 426.00, 302.00, 700.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (100, 108, 398.00, 750.00, 179.00, 520.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (101, 109, 611.00, 794.00, 670.00, 828.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (102, 110, 54.00, 599.00, 828.00, 720.00);
INSERT INTO public.rent_price (id, vehicle_id, hourly_price, daily_price, weekly_price, monthly_price) VALUES (103, 111, 381.00, 477.00, 487.00, 400.00);


--
-- TOC entry 3521 (class 0 OID 32952)
-- Dependencies: 230
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (17, 10, 110, '2025-07-13 00:00:00', '2025-04-28 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (18, 10, 51, '2025-08-18 00:00:00', '2025-04-04 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (19, 9, 94, '2025-09-05 00:00:00', '2024-11-28 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (20, 9, 16, '2024-11-17 00:00:00', '2025-08-22 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (21, 11, 67, '2025-07-24 00:00:00', '2025-05-09 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (22, 9, 20, '2025-12-05 00:00:00', '2025-05-16 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (23, 9, 80, '2025-05-29 00:00:00', '2025-09-16 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (24, 9, 108, '2025-08-06 00:00:00', '2025-02-20 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (25, 9, 17, '2025-08-21 00:00:00', '2025-09-02 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (26, 9, 43, '2025-01-17 00:00:00', '2025-06-07 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (27, 9, 32, '2025-02-25 00:00:00', '2024-11-21 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (28, 9, 63, '2024-12-29 00:00:00', '2025-03-09 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (29, 10, 103, '2025-06-09 00:00:00', '2024-11-20 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (30, 11, 95, '2025-05-21 00:00:00', '2025-07-05 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (31, 9, 84, '2024-12-03 00:00:00', '2025-07-25 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (32, 10, 94, '2025-10-03 00:00:00', '2024-10-11 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (33, 10, 99, '2025-12-06 00:00:00', '2025-01-21 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (34, 10, 105, '2025-12-14 00:00:00', '2025-06-22 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (35, 10, 96, '2025-04-08 00:00:00', '2024-10-03 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (36, 9, 52, '2025-10-12 00:00:00', '2024-12-27 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (37, 9, 63, '2025-10-28 00:00:00', '2024-11-14 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (38, 10, 105, '2024-12-15 00:00:00', '2025-02-20 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (39, 11, 39, '2025-02-11 00:00:00', '2025-01-21 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (40, 10, 52, '2025-07-01 00:00:00', '2025-09-30 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (41, 9, 18, '2025-02-06 00:00:00', '2025-08-18 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (42, 11, 73, '2025-05-25 00:00:00', '2024-11-04 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (43, 11, 78, '2025-04-09 00:00:00', '2025-08-19 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (44, 10, 48, '2024-11-02 00:00:00', '2025-07-23 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (45, 9, 68, '2025-12-07 00:00:00', '2025-07-22 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (46, 10, 34, '2025-08-08 00:00:00', '2025-03-15 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (47, 9, 93, '2025-01-14 00:00:00', '2025-05-06 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (48, 11, 80, '2024-11-03 00:00:00', '2025-03-21 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (49, 10, 34, '2024-11-13 00:00:00', '2025-05-20 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (50, 9, 56, '2024-10-02 00:00:00', '2025-09-05 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (51, 10, 38, '2025-10-30 00:00:00', '2025-02-24 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (52, 9, 99, '2025-06-07 00:00:00', '2024-12-19 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (53, 9, 89, '2025-01-28 00:00:00', '2025-05-08 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (54, 11, 79, '2025-04-04 00:00:00', '2024-12-16 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (55, 11, 21, '2024-11-19 00:00:00', '2025-03-11 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (56, 11, 59, '2025-11-15 00:00:00', '2024-12-09 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (57, 11, 38, '2025-08-18 00:00:00', '2025-05-23 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (58, 9, 68, '2025-01-26 00:00:00', '2025-04-14 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (59, 11, 110, '2025-02-08 00:00:00', '2024-10-28 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (60, 9, 18, '2025-12-18 00:00:00', '2024-11-28 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (61, 9, 90, '2025-02-28 00:00:00', '2024-11-08 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (62, 10, 40, '2025-06-22 00:00:00', '2024-11-15 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (63, 10, 79, '2025-03-30 00:00:00', '2025-08-30 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (64, 9, 63, '2025-06-26 00:00:00', '2024-11-02 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (65, 9, 78, '2025-07-14 00:00:00', '2025-07-29 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (66, 11, 51, '2024-12-26 00:00:00', '2024-11-05 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (67, 11, 20, '2025-07-21 00:00:00', '2025-01-25 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (68, 11, 35, '2025-03-14 00:00:00', '2025-03-14 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (69, 11, 78, '2025-04-19 00:00:00', '2025-06-14 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (70, 11, 23, '2025-11-28 00:00:00', '2025-08-12 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (71, 9, 57, '2025-02-22 00:00:00', '2025-02-21 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (72, 11, 77, '2025-04-22 00:00:00', '2024-12-31 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (73, 10, 75, '2025-07-23 00:00:00', '2024-11-11 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (74, 9, 32, '2025-10-11 00:00:00', '2024-12-15 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (75, 10, 69, '2025-10-04 00:00:00', '2025-04-29 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (76, 11, 19, '2025-07-25 00:00:00', '2025-02-11 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (77, 9, 57, '2025-01-01 00:00:00', '2025-09-25 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (78, 10, 45, '2024-10-10 00:00:00', '2025-08-29 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (79, 10, 100, '2025-12-18 00:00:00', '2025-03-07 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (80, 9, 64, '2025-08-13 00:00:00', '2025-09-14 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (81, 9, 50, '2025-08-13 00:00:00', '2024-10-30 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (82, 11, 52, '2025-03-16 00:00:00', '2025-08-01 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (83, 10, 36, '2025-09-24 00:00:00', '2024-10-16 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (84, 10, 46, '2025-09-20 00:00:00', '2025-03-07 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (85, 9, 17, '2025-12-20 00:00:00', '2025-09-04 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (86, 9, 35, '2024-10-30 00:00:00', '2024-11-20 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (87, 11, 63, '2024-10-24 00:00:00', '2025-04-11 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (88, 9, 71, '2025-04-02 00:00:00', '2025-02-11 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (89, 9, 64, '2025-12-01 00:00:00', '2025-08-26 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (90, 9, 81, '2025-09-08 00:00:00', '2025-01-30 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (91, 10, 40, '2024-12-21 00:00:00', '2025-01-23 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (92, 10, 70, '2024-12-24 00:00:00', '2025-04-09 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (93, 9, 24, '2025-03-25 00:00:00', '2025-02-13 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (94, 10, 36, '2025-01-18 00:00:00', '2025-07-26 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (95, 9, 99, '2025-06-23 00:00:00', '2025-04-19 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (96, 10, 47, '2025-10-14 00:00:00', '2025-01-03 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (97, 11, 35, '2024-12-04 00:00:00', '2024-10-11 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (98, 9, 105, '2025-03-05 00:00:00', '2025-09-11 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (99, 10, 69, '2025-05-06 00:00:00', '2024-11-17 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (100, 11, 74, '2025-01-12 00:00:00', '2025-05-12 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (101, 11, 98, '2025-05-19 00:00:00', '2025-05-03 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (102, 11, 19, '2025-04-12 00:00:00', '2024-11-23 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (103, 9, 47, '2024-10-16 00:00:00', '2025-07-29 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (104, 10, 92, '2025-12-21 00:00:00', '2025-03-04 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (105, 9, 45, '2025-08-10 00:00:00', '2025-02-04 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (106, 9, 103, '2025-12-02 00:00:00', '2025-08-15 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (107, 11, 61, '2025-04-22 00:00:00', '2025-09-17 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (108, 9, 26, '2025-06-27 00:00:00', '2025-01-09 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (109, 11, 20, '2024-11-27 00:00:00', '2024-10-09 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (110, 10, 102, '2025-11-18 00:00:00', '2024-11-03 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (111, 11, 31, '2025-05-24 00:00:00', '2024-11-29 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (112, 10, 54, '2025-09-26 00:00:00', '2025-08-25 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (113, 9, 46, '2025-02-14 00:00:00', '2025-09-16 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (114, 9, 102, '2025-07-27 00:00:00', '2024-12-05 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (115, 9, 13, '2025-11-09 00:00:00', '2025-07-28 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (116, 11, 70, '2025-10-08 00:00:00', '2025-02-08 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (117, 10, 28, '2024-10-03 00:00:00', '2025-08-30 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (118, 10, 38, '2025-10-06 00:00:00', '2025-01-09 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (119, 11, 61, '2025-07-12 00:00:00', '2025-04-21 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (120, 11, 32, '2025-04-10 00:00:00', '2025-09-25 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (121, 10, 33, '2025-10-21 00:00:00', '2024-11-18 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (122, 11, 45, '2025-06-20 00:00:00', '2025-02-21 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (123, 11, 35, '2025-04-26 00:00:00', '2025-01-22 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (124, 10, 76, '2025-07-11 00:00:00', '2024-10-26 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (125, 9, 24, '2025-07-11 00:00:00', '2025-06-25 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (126, 9, 101, '2024-12-29 00:00:00', '2025-03-05 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (127, 11, 87, '2024-10-15 00:00:00', '2025-03-28 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (128, 11, 49, '2025-02-15 00:00:00', '2025-04-18 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (129, 11, 100, '2025-07-27 00:00:00', '2025-06-28 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (130, 11, 59, '2024-12-05 00:00:00', '2025-09-12 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (131, 9, 20, '2025-10-19 00:00:00', '2024-11-06 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (132, 11, 108, '2024-10-17 00:00:00', '2025-06-29 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (133, 10, 105, '2025-03-11 00:00:00', '2025-06-19 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (134, 11, 66, '2024-10-10 00:00:00', '2025-09-02 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (135, 9, 104, '2025-03-31 00:00:00', '2025-06-20 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (136, 10, 96, '2025-05-22 00:00:00', '2024-11-29 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (137, 9, 19, '2025-07-24 00:00:00', '2024-11-29 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (138, 10, 43, '2024-11-18 00:00:00', '2025-02-14 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (139, 9, 80, '2025-09-29 00:00:00', '2025-02-01 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (140, 10, 30, '2025-11-06 00:00:00', '2025-08-07 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (141, 10, 20, '2025-09-01 00:00:00', '2024-11-21 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (142, 11, 108, '2025-10-20 00:00:00', '2025-09-14 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (143, 11, 71, '2025-01-20 00:00:00', '2025-07-13 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (144, 10, 70, '2025-04-12 00:00:00', '2025-06-03 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (145, 11, 108, '2025-08-05 00:00:00', '2024-11-05 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (146, 9, 111, '2025-01-16 00:00:00', '2025-09-18 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (147, 9, 67, '2025-04-12 00:00:00', '2025-03-10 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (148, 11, 61, '2025-10-11 00:00:00', '2025-08-30 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (149, 10, 61, '2025-09-06 00:00:00', '2025-01-08 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (150, 9, 77, '2025-10-02 00:00:00', '2025-09-28 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (151, 9, 20, '2024-12-25 00:00:00', '2024-11-22 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (152, 11, 13, '2025-02-24 00:00:00', '2025-08-08 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (153, 11, 12, '2025-08-29 00:00:00', '2025-02-27 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (154, 10, 97, '2025-07-08 00:00:00', '2025-06-22 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (155, 10, 90, '2024-12-24 00:00:00', '2025-03-31 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (156, 11, 45, '2025-12-11 00:00:00', '2025-08-26 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (157, 11, 21, '2025-11-27 00:00:00', '2025-07-12 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (158, 10, 79, '2025-03-27 00:00:00', '2025-04-08 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (159, 10, 30, '2025-07-23 00:00:00', '2024-10-02 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (160, 11, 72, '2025-07-30 00:00:00', '2025-09-11 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (161, 11, 39, '2024-12-15 00:00:00', '2025-05-20 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (162, 10, 82, '2024-12-27 00:00:00', '2025-05-18 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (163, 9, 56, '2024-11-09 00:00:00', '2025-09-18 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (164, 9, 57, '2024-10-07 00:00:00', '2025-06-20 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (165, 11, 47, '2024-11-10 00:00:00', '2025-02-19 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (166, 11, 54, '2025-11-04 00:00:00', '2025-05-14 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (167, 10, 91, '2024-11-06 00:00:00', '2025-07-27 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (168, 10, 20, '2024-10-19 00:00:00', '2025-08-22 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (169, 9, 55, '2024-10-13 00:00:00', '2025-01-13 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (170, 10, 38, '2025-10-16 00:00:00', '2024-11-04 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (171, 11, 25, '2025-07-19 00:00:00', '2024-10-30 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (172, 11, 40, '2025-08-22 00:00:00', '2025-07-19 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (173, 10, 98, '2025-05-08 00:00:00', '2025-01-14 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (174, 11, 25, '2024-11-18 00:00:00', '2025-06-01 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (175, 10, 21, '2025-07-25 00:00:00', '2025-09-10 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (176, 9, 110, '2025-06-13 00:00:00', '2025-06-24 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (177, 11, 89, '2024-10-02 00:00:00', '2025-05-12 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (178, 9, 72, '2025-01-30 00:00:00', '2025-08-10 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (179, 11, 61, '2025-01-15 00:00:00', '2025-08-17 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (180, 9, 47, '2025-06-27 00:00:00', '2025-01-20 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (181, 9, 60, '2025-06-16 00:00:00', '2025-08-02 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (182, 11, 50, '2025-08-31 00:00:00', '2024-12-31 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (183, 11, 39, '2025-12-09 00:00:00', '2025-03-30 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (184, 10, 69, '2025-08-16 00:00:00', '2025-06-28 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (185, 10, 29, '2024-10-31 00:00:00', '2025-06-12 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (186, 10, 18, '2025-12-04 00:00:00', '2025-02-01 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (187, 10, 26, '2025-10-26 00:00:00', '2024-10-10 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (188, 10, 20, '2025-02-20 00:00:00', '2025-05-18 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (189, 10, 30, '2025-07-24 00:00:00', '2025-02-07 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (190, 9, 100, '2025-09-01 00:00:00', '2024-12-02 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (191, 9, 21, '2025-09-18 00:00:00', '2025-06-21 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (192, 10, 71, '2024-10-14 00:00:00', '2024-11-03 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (193, 11, 47, '2025-04-14 00:00:00', '2025-04-13 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (194, 10, 37, '2025-12-16 00:00:00', '2025-09-03 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (195, 9, 104, '2025-02-07 00:00:00', '2025-09-19 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (196, 9, 81, '2025-07-06 00:00:00', '2024-10-20 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (197, 11, 75, '2025-09-04 00:00:00', '2025-03-10 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (198, 11, 27, '2025-02-26 00:00:00', '2025-09-04 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (199, 11, 54, '2025-05-31 00:00:00', '2025-09-25 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (200, 9, 54, '2025-05-25 00:00:00', '2025-07-26 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (201, 11, 46, '2025-09-23 00:00:00', '2025-09-02 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (202, 9, 78, '2025-12-02 00:00:00', '2025-02-08 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (203, 11, 33, '2024-10-04 00:00:00', '2025-02-19 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (204, 11, 73, '2025-11-30 00:00:00', '2025-08-17 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (205, 9, 74, '2025-06-06 00:00:00', '2025-04-15 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (206, 11, 12, '2025-11-21 00:00:00', '2024-10-08 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (207, 11, 67, '2024-11-01 00:00:00', '2024-10-23 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (208, 10, 17, '2025-10-07 00:00:00', '2025-04-15 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (209, 9, 47, '2025-08-31 00:00:00', '2025-02-09 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (210, 9, 70, '2025-02-18 00:00:00', '2025-08-01 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (211, 10, 64, '2025-11-14 00:00:00', '2024-11-12 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (212, 11, 35, '2025-08-30 00:00:00', '2025-07-01 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (213, 11, 12, '2025-07-20 00:00:00', '2025-01-11 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (214, 10, 90, '2025-11-21 00:00:00', '2024-10-27 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (215, 10, 48, '2024-11-08 00:00:00', '2024-12-07 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (216, 10, 32, '2025-10-10 00:00:00', '2025-09-17 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (217, 11, 54, '2025-01-20 00:00:00', '2025-08-14 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (218, 9, 108, '2025-05-26 00:00:00', '2024-11-08 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (219, 10, 32, '2025-07-10 00:00:00', '2025-01-13 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (220, 11, 89, '2025-10-08 00:00:00', '2025-04-10 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (221, 9, 95, '2025-05-04 00:00:00', '2025-08-18 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (222, 9, 105, '2025-06-18 00:00:00', '2025-09-07 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (223, 9, 12, '2025-12-08 00:00:00', '2025-09-12 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (224, 9, 40, '2025-08-29 00:00:00', '2025-06-13 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (225, 11, 60, '2025-08-05 00:00:00', '2025-03-03 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (226, 10, 89, '2025-08-26 00:00:00', '2025-09-10 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (227, 9, 15, '2025-02-23 00:00:00', '2025-02-05 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (228, 9, 70, '2024-11-11 00:00:00', '2024-12-27 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (229, 10, 97, '2025-01-17 00:00:00', '2024-12-15 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (230, 11, 38, '2025-05-14 00:00:00', '2025-01-31 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (231, 11, 69, '2025-05-10 00:00:00', '2024-10-16 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (232, 10, 35, '2025-09-20 00:00:00', '2025-09-27 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (233, 10, 111, '2024-10-30 00:00:00', '2025-08-08 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (234, 11, 111, '2025-06-28 00:00:00', '2025-07-29 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (235, 11, 78, '2025-01-03 00:00:00', '2025-08-20 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (236, 10, 19, '2025-01-31 00:00:00', '2025-07-25 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (237, 11, 92, '2024-12-17 00:00:00', '2025-07-29 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (238, 10, 80, '2025-05-19 00:00:00', '2025-10-01 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (239, 9, 86, '2024-11-13 00:00:00', '2024-10-24 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (240, 9, 18, '2024-11-01 00:00:00', '2025-08-31 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (241, 10, 84, '2024-11-26 00:00:00', '2025-07-08 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (242, 9, 13, '2024-11-07 00:00:00', '2025-08-18 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (243, 9, 53, '2025-02-01 00:00:00', '2025-07-29 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (244, 9, 52, '2025-11-23 00:00:00', '2025-08-13 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (245, 10, 76, '2025-05-01 00:00:00', '2025-06-07 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (246, 9, 98, '2025-08-11 00:00:00', '2025-09-15 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (247, 11, 57, '2025-06-29 00:00:00', '2025-08-18 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (248, 9, 71, '2025-03-08 00:00:00', '2025-03-28 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (249, 10, 83, '2025-08-19 00:00:00', '2025-07-31 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (250, 9, 73, '2025-11-21 00:00:00', '2025-09-22 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (251, 10, 62, '2025-05-26 00:00:00', '2024-12-30 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (252, 10, 35, '2025-10-19 00:00:00', '2025-05-28 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (253, 9, 15, '2025-06-29 00:00:00', '2025-07-03 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (254, 10, 103, '2025-01-12 00:00:00', '2025-09-24 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (255, 10, 26, '2024-12-28 00:00:00', '2025-05-08 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (256, 10, 28, '2025-02-01 00:00:00', '2025-03-01 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (257, 11, 75, '2025-05-18 00:00:00', '2025-05-13 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (258, 10, 35, '2024-11-07 00:00:00', '2025-07-07 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (259, 11, 88, '2025-02-23 00:00:00', '2024-10-09 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (260, 11, 45, '2025-11-11 00:00:00', '2024-10-10 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (261, 9, 96, '2025-04-02 00:00:00', '2025-02-05 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (262, 10, 93, '2025-05-16 00:00:00', '2024-11-03 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (263, 9, 93, '2025-10-15 00:00:00', '2024-10-17 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (264, 10, 41, '2025-04-28 00:00:00', '2025-01-17 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (265, 9, 57, '2025-02-23 00:00:00', '2024-10-06 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (266, 9, 12, '2025-03-22 00:00:00', '2025-04-21 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (267, 10, 74, '2025-07-20 00:00:00', '2025-01-19 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (268, 9, 30, '2025-01-22 00:00:00', '2025-07-03 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (269, 10, 28, '2025-05-03 00:00:00', '2025-08-23 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (270, 11, 68, '2024-11-30 00:00:00', '2025-02-22 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (271, 10, 60, '2025-04-25 00:00:00', '2024-10-21 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (272, 9, 40, '2025-09-20 00:00:00', '2025-01-02 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (273, 11, 106, '2025-05-07 00:00:00', '2025-07-08 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (274, 9, 51, '2024-12-29 00:00:00', '2025-05-10 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (275, 11, 32, '2025-07-01 00:00:00', '2025-09-02 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (276, 10, 28, '2025-12-24 00:00:00', '2025-05-24 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (277, 9, 94, '2025-05-14 00:00:00', '2025-09-14 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (278, 9, 13, '2024-11-19 00:00:00', '2025-02-12 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (279, 10, 37, '2025-06-29 00:00:00', '2025-05-29 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (280, 11, 23, '2025-12-10 00:00:00', '2025-06-05 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (281, 10, 95, '2025-07-17 00:00:00', '2025-04-03 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (282, 10, 106, '2025-05-23 00:00:00', '2024-11-15 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (283, 9, 86, '2024-10-03 00:00:00', '2025-03-23 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (284, 9, 101, '2024-11-09 00:00:00', '2025-07-20 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (285, 10, 49, '2025-10-13 00:00:00', '2025-08-27 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (286, 10, 78, '2025-04-20 00:00:00', '2025-08-30 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (287, 10, 97, '2025-01-22 00:00:00', '2024-11-02 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (288, 11, 76, '2025-01-14 00:00:00', '2025-09-03 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (289, 10, 21, '2024-10-24 00:00:00', '2025-06-13 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (290, 9, 74, '2025-09-03 00:00:00', '2025-02-09 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (291, 9, 83, '2025-02-27 00:00:00', '2025-07-08 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (292, 10, 31, '2025-01-11 00:00:00', '2025-03-29 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (293, 9, 64, '2024-10-13 00:00:00', '2024-11-23 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (294, 11, 35, '2025-05-07 00:00:00', '2025-06-20 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (295, 10, 72, '2025-06-26 00:00:00', '2024-11-13 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (296, 10, 104, '2025-03-23 00:00:00', '2024-11-12 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (297, 11, 77, '2025-05-14 00:00:00', '2025-01-05 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (298, 10, 62, '2025-08-27 00:00:00', '2024-10-13 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (299, 10, 28, '2025-04-27 00:00:00', '2025-05-30 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (300, 10, 90, '2025-12-21 00:00:00', '2024-10-17 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (301, 9, 33, '2025-09-13 00:00:00', '2025-01-18 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (302, 10, 103, '2025-02-14 00:00:00', '2024-10-06 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (303, 10, 81, '2025-07-20 00:00:00', '2025-03-10 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (304, 10, 45, '2025-09-30 00:00:00', '2025-09-25 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (305, 9, 97, '2025-10-07 00:00:00', '2024-11-19 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (306, 9, 99, '2025-07-31 00:00:00', '2025-04-18 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (307, 9, 37, '2025-03-26 00:00:00', '2025-04-01 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (308, 10, 24, '2024-10-28 00:00:00', '2025-02-28 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (309, 11, 36, '2025-06-19 00:00:00', '2025-03-26 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (310, 9, 20, '2025-02-28 00:00:00', '2025-09-21 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (311, 11, 41, '2025-07-19 00:00:00', '2025-06-07 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (312, 10, 29, '2024-10-18 00:00:00', '2025-02-07 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (313, 9, 59, '2025-05-09 00:00:00', '2025-09-08 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (314, 9, 101, '2024-12-29 00:00:00', '2025-04-22 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (315, 9, 55, '2025-12-02 00:00:00', '2025-05-13 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (316, 9, 94, '2025-12-27 00:00:00', '2025-05-03 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (317, 9, 108, '2025-07-06 00:00:00', '2025-09-21 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (318, 10, 106, '2025-01-11 00:00:00', '2024-11-24 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (319, 9, 83, '2025-06-02 00:00:00', '2025-04-13 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (320, 9, 12, '2024-12-02 00:00:00', '2024-11-05 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (321, 10, 59, '2025-08-02 00:00:00', '2025-07-15 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (322, 11, 26, '2025-12-05 00:00:00', '2025-05-22 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (323, 10, 64, '2025-12-23 00:00:00', '2024-12-31 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (324, 10, 25, '2024-11-08 00:00:00', '2025-03-21 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (325, 11, 65, '2025-06-30 00:00:00', '2024-11-12 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (326, 10, 35, '2024-12-01 00:00:00', '2025-07-26 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (327, 9, 26, '2024-11-30 00:00:00', '2025-07-01 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (328, 11, 98, '2024-10-05 00:00:00', '2025-01-17 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (329, 9, 69, '2025-09-03 00:00:00', '2025-01-23 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (330, 11, 109, '2025-11-23 00:00:00', '2024-11-17 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (331, 9, 82, '2025-03-08 00:00:00', '2025-04-22 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (332, 11, 37, '2024-10-23 00:00:00', '2025-08-23 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (333, 10, 20, '2025-11-09 00:00:00', '2025-06-28 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (334, 11, 68, '2025-05-03 00:00:00', '2024-12-12 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (335, 9, 61, '2025-08-14 00:00:00', '2025-04-04 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (336, 9, 94, '2024-10-29 00:00:00', '2025-09-24 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (337, 10, 39, '2025-09-17 00:00:00', '2024-12-17 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (338, 10, 100, '2025-04-14 00:00:00', '2025-08-25 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (339, 10, 37, '2025-11-13 00:00:00', '2025-09-03 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (340, 10, 16, '2025-10-09 00:00:00', '2025-03-09 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (341, 11, 31, '2025-05-30 00:00:00', '2025-04-21 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (342, 9, 105, '2025-11-18 00:00:00', '2024-11-27 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (343, 11, 25, '2025-08-28 00:00:00', '2025-03-07 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (344, 10, 103, '2025-06-21 00:00:00', '2025-01-19 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (345, 10, 43, '2025-10-14 00:00:00', '2025-03-10 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (346, 11, 78, '2024-11-01 00:00:00', '2024-11-29 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (347, 11, 36, '2024-12-31 00:00:00', '2025-05-22 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (348, 9, 90, '2024-11-24 00:00:00', '2025-01-31 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (349, 11, 100, '2025-02-13 00:00:00', '2025-02-17 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (350, 10, 16, '2025-06-21 00:00:00', '2025-09-18 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (351, 10, 79, '2025-01-04 00:00:00', '2024-11-11 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (352, 10, 60, '2025-11-09 00:00:00', '2025-04-10 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (353, 11, 38, '2025-05-12 00:00:00', '2025-09-11 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (354, 11, 17, '2025-07-16 00:00:00', '2025-05-17 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (355, 11, 20, '2024-10-20 00:00:00', '2025-02-16 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (356, 9, 73, '2024-10-20 00:00:00', '2024-11-17 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (357, 11, 69, '2025-07-27 00:00:00', '2024-10-26 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (358, 11, 16, '2025-08-18 00:00:00', '2025-08-13 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (359, 11, 61, '2025-09-21 00:00:00', '2025-02-12 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (360, 10, 65, '2025-05-06 00:00:00', '2025-02-14 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (361, 11, 88, '2024-10-07 00:00:00', '2025-01-12 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (362, 11, 108, '2024-11-06 00:00:00', '2024-12-24 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (363, 11, 19, '2024-10-09 00:00:00', '2025-02-25 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (364, 10, 53, '2025-06-27 00:00:00', '2025-04-22 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (365, 11, 49, '2024-11-10 00:00:00', '2025-08-22 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (366, 9, 95, '2025-03-26 00:00:00', '2025-10-01 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (367, 9, 43, '2025-11-01 00:00:00', '2025-01-16 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (368, 11, 58, '2025-09-05 00:00:00', '2024-10-03 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (369, 11, 43, '2025-06-25 00:00:00', '2024-10-26 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (370, 10, 45, '2025-12-15 00:00:00', '2025-07-13 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (371, 9, 91, '2024-10-25 00:00:00', '2025-05-04 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (372, 9, 30, '2025-04-02 00:00:00', '2024-10-27 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (373, 10, 34, '2025-06-15 00:00:00', '2025-08-09 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (374, 10, 109, '2024-11-27 00:00:00', '2025-09-12 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (375, 9, 90, '2025-04-01 00:00:00', '2025-07-03 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (376, 9, 25, '2024-12-22 00:00:00', '2025-05-15 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (377, 9, 108, '2025-09-22 00:00:00', '2024-11-27 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (378, 11, 37, '2025-04-13 00:00:00', '2024-12-18 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (379, 9, 25, '2025-08-06 00:00:00', '2024-10-26 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (380, 11, 107, '2024-11-22 00:00:00', '2025-07-04 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (381, 9, 58, '2025-01-02 00:00:00', '2024-10-16 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (382, 10, 50, '2025-10-08 00:00:00', '2025-01-08 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (383, 11, 99, '2025-12-13 00:00:00', '2025-09-08 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (384, 10, 54, '2024-12-26 00:00:00', '2025-03-25 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (385, 9, 50, '2025-12-26 00:00:00', '2024-12-02 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (386, 11, 111, '2025-11-11 00:00:00', '2025-05-25 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (387, 11, 50, '2025-04-17 00:00:00', '2025-07-27 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (388, 11, 48, '2024-11-16 00:00:00', '2025-03-19 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (389, 10, 52, '2025-12-04 00:00:00', '2025-02-24 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (390, 10, 41, '2025-04-20 00:00:00', '2025-09-28 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (391, 10, 21, '2024-12-09 00:00:00', '2025-05-31 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (392, 9, 18, '2025-05-11 00:00:00', '2025-06-27 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (393, 10, 23, '2025-08-26 00:00:00', '2024-10-13 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (394, 9, 51, '2025-02-02 00:00:00', '2024-12-05 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (395, 11, 31, '2025-05-05 00:00:00', '2024-11-06 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (396, 10, 25, '2025-07-26 00:00:00', '2025-02-11 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (397, 11, 54, '2024-11-17 00:00:00', '2024-11-21 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (398, 9, 16, '2025-07-23 00:00:00', '2025-08-28 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (399, 11, 29, '2025-11-30 00:00:00', '2025-05-25 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (400, 9, 21, '2025-03-03 00:00:00', '2025-08-29 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (401, 9, 61, '2024-11-11 00:00:00', '2025-02-12 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (402, 11, 70, '2025-04-03 00:00:00', '2025-01-31 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (403, 9, 52, '2024-11-21 00:00:00', '2025-02-15 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (404, 10, 32, '2025-04-05 00:00:00', '2024-12-15 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (405, 9, 37, '2025-03-13 00:00:00', '2025-01-07 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (406, 10, 69, '2024-12-11 00:00:00', '2025-01-25 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (407, 9, 78, '2025-11-26 00:00:00', '2025-03-29 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (408, 11, 43, '2025-04-24 00:00:00', '2024-12-14 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (409, 11, 79, '2024-10-12 00:00:00', '2025-02-26 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (410, 9, 32, '2025-11-14 00:00:00', '2025-09-20 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (411, 10, 65, '2025-10-02 00:00:00', '2025-04-16 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (412, 10, 69, '2025-03-11 00:00:00', '2025-07-07 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (413, 9, 65, '2025-09-20 00:00:00', '2025-05-13 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (414, 9, 32, '2025-05-05 00:00:00', '2025-08-05 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (415, 11, 81, '2024-11-21 00:00:00', '2025-06-19 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (416, 10, 94, '2025-05-28 00:00:00', '2025-06-04 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (417, 11, 98, '2025-04-14 00:00:00', '2025-07-23 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (418, 11, 66, '2025-07-18 00:00:00', '2025-04-11 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (419, 9, 42, '2025-08-22 00:00:00', '2024-11-12 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (420, 11, 44, '2024-11-16 00:00:00', '2025-08-19 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (421, 10, 77, '2025-08-08 00:00:00', '2025-09-30 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (422, 9, 23, '2025-06-28 00:00:00', '2025-05-25 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (423, 11, 90, '2025-10-08 00:00:00', '2025-05-02 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (424, 11, 24, '2025-08-28 00:00:00', '2024-12-23 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (425, 10, 34, '2025-09-11 00:00:00', '2025-02-17 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (426, 11, 76, '2025-06-12 00:00:00', '2025-08-12 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (427, 9, 110, '2025-09-15 00:00:00', '2025-06-07 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (428, 10, 71, '2025-11-23 00:00:00', '2025-07-08 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (429, 9, 70, '2025-01-28 00:00:00', '2025-07-05 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (430, 9, 96, '2025-08-03 00:00:00', '2025-04-10 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (431, 10, 105, '2025-07-24 00:00:00', '2024-10-07 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (432, 9, 26, '2024-11-07 00:00:00', '2024-11-14 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (433, 9, 22, '2025-07-15 00:00:00', '2025-05-30 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (434, 9, 69, '2025-11-01 00:00:00', '2025-04-28 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (435, 9, 37, '2025-10-17 00:00:00', '2025-05-05 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (436, 10, 21, '2024-12-13 00:00:00', '2024-10-24 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (437, 9, 35, '2025-01-05 00:00:00', '2025-01-22 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (438, 9, 65, '2025-12-22 00:00:00', '2024-11-12 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (439, 10, 52, '2025-09-14 00:00:00', '2025-02-23 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (440, 10, 95, '2025-03-06 00:00:00', '2025-07-07 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (441, 10, 47, '2025-05-13 00:00:00', '2024-10-11 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (442, 9, 62, '2025-03-25 00:00:00', '2024-11-26 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (443, 10, 79, '2025-07-10 00:00:00', '2025-09-29 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (444, 9, 98, '2025-08-23 00:00:00', '2025-07-21 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (445, 10, 37, '2025-01-24 00:00:00', '2025-08-08 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (446, 9, 46, '2024-10-13 00:00:00', '2025-02-27 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (447, 11, 25, '2025-10-27 00:00:00', '2025-04-27 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (448, 9, 102, '2024-11-06 00:00:00', '2025-01-02 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (449, 11, 31, '2025-04-15 00:00:00', '2024-11-24 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (450, 9, 62, '2025-11-21 00:00:00', '2024-10-09 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (451, 9, 31, '2025-07-18 00:00:00', '2025-08-20 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (452, 10, 98, '2024-12-27 00:00:00', '2024-11-01 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (453, 11, 111, '2025-09-28 00:00:00', '2025-05-18 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (454, 9, 93, '2025-02-15 00:00:00', '2025-04-02 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (455, 10, 25, '2025-11-16 00:00:00', '2025-03-26 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (456, 10, 94, '2024-10-15 00:00:00', '2025-02-20 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (457, 11, 25, '2025-04-26 00:00:00', '2025-02-12 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (458, 11, 64, '2025-03-23 00:00:00', '2025-06-16 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (459, 11, 94, '2025-07-10 00:00:00', '2025-05-24 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (460, 11, 69, '2025-03-21 00:00:00', '2024-10-17 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (461, 10, 22, '2025-07-06 00:00:00', '2025-07-01 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (462, 9, 93, '2025-10-22 00:00:00', '2025-08-19 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (463, 9, 44, '2024-12-07 00:00:00', '2025-07-19 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (464, 9, 71, '2025-01-20 00:00:00', '2025-04-06 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (465, 9, 92, '2025-01-02 00:00:00', '2024-10-28 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (466, 11, 96, '2025-10-07 00:00:00', '2025-04-17 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (467, 9, 77, '2025-06-07 00:00:00', '2025-08-12 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (468, 10, 39, '2025-05-27 00:00:00', '2025-01-03 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (469, 11, 43, '2025-06-01 00:00:00', '2024-11-05 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (470, 10, 101, '2025-07-08 00:00:00', '2025-05-07 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (471, 10, 88, '2025-12-25 00:00:00', '2025-06-12 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (472, 11, 21, '2025-12-17 00:00:00', '2024-10-04 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (473, 10, 13, '2025-09-19 00:00:00', '2024-11-06 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (474, 9, 52, '2025-07-19 00:00:00', '2025-01-27 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (475, 9, 45, '2025-03-21 00:00:00', '2025-01-17 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (476, 11, 18, '2025-04-06 00:00:00', '2025-01-09 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (477, 9, 44, '2025-10-20 00:00:00', '2024-12-16 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (478, 9, 86, '2025-04-22 00:00:00', '2024-12-09 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (479, 10, 107, '2025-07-02 00:00:00', '2024-12-20 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (480, 11, 43, '2025-01-26 00:00:00', '2025-09-16 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (481, 11, 104, '2025-01-26 00:00:00', '2025-01-27 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (482, 10, 51, '2025-02-26 00:00:00', '2025-06-23 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (483, 10, 109, '2025-01-20 00:00:00', '2024-12-19 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (484, 9, 70, '2025-05-06 00:00:00', '2025-01-14 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (485, 10, 63, '2025-07-22 00:00:00', '2025-06-17 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (486, 9, 36, '2025-08-07 00:00:00', '2024-10-08 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (487, 10, 73, '2025-08-17 00:00:00', '2025-05-21 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (488, 9, 62, '2025-03-16 00:00:00', '2025-08-10 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (489, 11, 37, '2025-06-22 00:00:00', '2024-12-21 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (490, 10, 63, '2024-10-13 00:00:00', '2025-02-22 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (491, 9, 77, '2025-05-16 00:00:00', '2025-05-14 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (492, 11, 77, '2025-10-21 00:00:00', '2025-02-26 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (493, 9, 67, '2025-07-18 00:00:00', '2025-04-06 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (494, 10, 80, '2025-10-08 00:00:00', '2024-10-17 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (495, 10, 88, '2025-04-01 00:00:00', '2025-06-09 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (496, 9, 60, '2025-03-09 00:00:00', '2025-05-18 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (497, 10, 54, '2024-12-19 00:00:00', '2024-12-04 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (498, 9, 105, '2025-10-20 00:00:00', '2025-04-27 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (499, 11, 102, '2024-12-27 00:00:00', '2025-04-12 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (500, 11, 53, '2025-11-27 00:00:00', '2024-12-23 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (501, 11, 18, '2025-08-19 00:00:00', '2025-08-24 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (502, 10, 38, '2025-01-31 00:00:00', '2025-09-24 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (503, 9, 49, '2025-06-29 00:00:00', '2024-10-21 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (504, 10, 28, '2024-12-04 00:00:00', '2025-04-30 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (505, 9, 59, '2025-03-16 00:00:00', '2025-09-07 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (506, 10, 25, '2025-05-16 00:00:00', '2025-03-28 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (507, 11, 76, '2025-02-17 00:00:00', '2025-07-09 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (508, 9, 74, '2024-11-14 00:00:00', '2025-08-28 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (509, 10, 70, '2024-12-12 00:00:00', '2024-11-14 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (510, 11, 49, '2024-10-07 00:00:00', '2024-12-08 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (511, 10, 64, '2025-02-20 00:00:00', '2024-11-24 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (512, 9, 58, '2025-10-04 00:00:00', '2025-06-15 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (513, 11, 73, '2025-12-16 00:00:00', '2025-04-11 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (514, 10, 24, '2025-09-18 00:00:00', '2024-12-27 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (515, 9, 56, '2025-10-13 00:00:00', '2025-03-06 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (516, 10, 62, '2025-02-13 00:00:00', '2025-04-05 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (517, 11, 74, '2025-10-03 00:00:00', '2024-10-18 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (518, 9, 102, '2025-01-18 00:00:00', '2025-02-26 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (519, 9, 102, '2025-09-22 00:00:00', '2025-07-05 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (520, 11, 53, '2025-08-21 00:00:00', '2024-10-29 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (521, 11, 47, '2024-12-04 00:00:00', '2025-09-08 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (522, 10, 42, '2025-04-02 00:00:00', '2024-12-27 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (523, 11, 31, '2025-11-26 00:00:00', '2024-12-03 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (524, 10, 101, '2024-11-22 00:00:00', '2025-06-08 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (525, 10, 67, '2025-10-10 00:00:00', '2024-12-29 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (526, 9, 64, '2025-11-07 00:00:00', '2025-03-28 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (527, 9, 88, '2025-07-19 00:00:00', '2025-01-12 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (528, 10, 52, '2025-01-25 00:00:00', '2025-07-03 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (529, 11, 71, '2025-08-31 00:00:00', '2025-09-19 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (530, 10, 66, '2025-10-23 00:00:00', '2024-11-29 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (531, 9, 81, '2025-03-25 00:00:00', '2024-12-18 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (532, 10, 22, '2024-12-01 00:00:00', '2025-06-16 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (533, 11, 87, '2025-07-29 00:00:00', '2025-03-17 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (534, 11, 73, '2025-01-10 00:00:00', '2025-07-26 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (535, 11, 49, '2025-09-09 00:00:00', '2024-10-17 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (536, 9, 94, '2025-04-11 00:00:00', '2024-12-09 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (537, 9, 12, '2025-10-03 00:00:00', '2024-10-27 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (538, 10, 63, '2025-10-08 00:00:00', '2025-08-04 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (539, 11, 74, '2025-01-24 00:00:00', '2024-11-09 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (540, 11, 31, '2025-12-09 00:00:00', '2025-06-08 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (541, 9, 72, '2024-10-06 00:00:00', '2024-10-07 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (542, 10, 55, '2024-10-21 00:00:00', '2025-06-20 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (543, 9, 45, '2025-08-10 00:00:00', '2025-05-07 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (544, 9, 21, '2025-07-27 00:00:00', '2024-11-30 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (545, 9, 52, '2025-09-04 00:00:00', '2025-05-23 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (546, 10, 23, '2025-04-01 00:00:00', '2025-01-09 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (547, 11, 36, '2025-07-14 00:00:00', '2024-11-17 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (548, 11, 73, '2025-05-08 00:00:00', '2025-06-23 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (549, 11, 89, '2025-07-04 00:00:00', '2025-04-21 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (550, 11, 51, '2025-11-06 00:00:00', '2024-10-26 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (551, 10, 16, '2025-10-27 00:00:00', '2025-05-21 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (552, 9, 83, '2025-10-09 00:00:00', '2025-08-03 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (553, 9, 85, '2025-10-19 00:00:00', '2024-10-03 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (554, 9, 104, '2025-10-07 00:00:00', '2025-06-17 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (555, 9, 93, '2025-01-17 00:00:00', '2025-09-17 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (556, 11, 66, '2024-11-21 00:00:00', '2025-05-31 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (557, 10, 98, '2025-05-30 00:00:00', '2025-06-23 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (558, 11, 18, '2025-10-18 00:00:00', '2025-02-10 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (559, 9, 74, '2025-01-24 00:00:00', '2024-12-06 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (560, 10, 30, '2025-12-16 00:00:00', '2024-10-03 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (561, 11, 25, '2025-12-19 00:00:00', '2025-03-07 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (562, 9, 27, '2025-05-12 00:00:00', '2024-11-03 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (563, 9, 42, '2025-12-19 00:00:00', '2025-04-04 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (564, 10, 54, '2025-12-21 00:00:00', '2025-03-09 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (565, 10, 81, '2024-12-10 00:00:00', '2025-04-21 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (566, 10, 41, '2025-12-23 00:00:00', '2024-11-19 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (567, 11, 71, '2025-01-05 00:00:00', '2025-05-18 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (568, 10, 21, '2025-11-13 00:00:00', '2025-01-09 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (569, 9, 51, '2024-10-27 00:00:00', '2025-07-27 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (570, 9, 80, '2025-06-05 00:00:00', '2024-10-23 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (571, 10, 70, '2025-01-27 00:00:00', '2025-08-22 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (572, 10, 39, '2025-09-26 00:00:00', '2025-01-30 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (573, 11, 108, '2025-12-21 00:00:00', '2025-02-25 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (574, 11, 76, '2025-02-06 00:00:00', '2025-09-23 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (575, 11, 81, '2025-01-22 00:00:00', '2025-08-28 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (576, 11, 57, '2025-05-04 00:00:00', '2025-03-24 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (577, 9, 35, '2025-06-13 00:00:00', '2025-05-09 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (578, 9, 42, '2025-11-15 00:00:00', '2025-08-15 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (579, 11, 53, '2025-04-17 00:00:00', '2024-10-20 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (580, 9, 88, '2025-04-11 00:00:00', '2025-06-04 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (581, 11, 71, '2025-12-04 00:00:00', '2025-05-13 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (582, 9, 110, '2025-08-12 00:00:00', '2025-06-06 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (583, 11, 44, '2024-10-16 00:00:00', '2025-05-02 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (584, 10, 65, '2025-10-23 00:00:00', '2025-09-23 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (585, 9, 55, '2025-12-09 00:00:00', '2024-11-23 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (586, 11, 36, '2025-06-21 00:00:00', '2024-10-27 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (587, 11, 63, '2025-02-28 00:00:00', '2024-11-01 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (588, 11, 29, '2025-01-23 00:00:00', '2025-03-11 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (589, 11, 78, '2025-01-08 00:00:00', '2025-04-23 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (590, 9, 44, '2024-12-19 00:00:00', '2025-05-30 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (591, 9, 88, '2025-02-17 00:00:00', '2024-11-05 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (592, 10, 20, '2025-10-22 00:00:00', '2024-11-21 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (593, 11, 97, '2024-11-12 00:00:00', '2025-03-24 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (594, 10, 27, '2025-01-03 00:00:00', '2025-01-25 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (595, 10, 78, '2025-06-16 00:00:00', '2025-05-15 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (596, 10, 51, '2024-12-14 00:00:00', '2025-09-11 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (597, 9, 69, '2025-05-01 00:00:00', '2024-11-26 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (598, 10, 107, '2025-12-19 00:00:00', '2025-05-08 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (599, 9, 106, '2025-02-23 00:00:00', '2025-05-12 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (600, 9, 15, '2025-05-13 00:00:00', '2025-07-06 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (601, 11, 55, '2025-06-14 00:00:00', '2025-03-31 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (602, 9, 37, '2024-10-23 00:00:00', '2025-10-01 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (603, 9, 110, '2025-09-13 00:00:00', '2025-05-24 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (604, 9, 56, '2025-09-21 00:00:00', '2024-11-20 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (605, 11, 43, '2024-12-10 00:00:00', '2024-11-26 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (606, 10, 48, '2025-06-12 00:00:00', '2024-10-11 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (607, 11, 100, '2025-04-07 00:00:00', '2025-09-06 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (608, 9, 82, '2024-12-27 00:00:00', '2025-01-06 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (609, 11, 32, '2025-07-08 00:00:00', '2025-08-23 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (610, 11, 95, '2025-04-22 00:00:00', '2025-09-21 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (611, 11, 60, '2025-12-01 00:00:00', '2025-04-13 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (612, 11, 76, '2025-03-05 00:00:00', '2025-01-23 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (613, 11, 14, '2025-07-20 00:00:00', '2024-10-13 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (614, 10, 46, '2025-11-04 00:00:00', '2024-11-18 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (615, 11, 88, '2025-04-04 00:00:00', '2025-01-30 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (616, 11, 44, '2024-12-21 00:00:00', '2025-01-17 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (617, 9, 94, '2024-10-07 00:00:00', '2025-03-16 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (618, 9, 84, '2025-03-06 00:00:00', '2025-07-30 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (619, 11, 96, '2025-01-17 00:00:00', '2025-06-04 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (620, 11, 45, '2025-10-15 00:00:00', '2025-01-12 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (621, 9, 90, '2025-02-16 00:00:00', '2025-05-11 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (622, 11, 71, '2025-02-13 00:00:00', '2025-02-19 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (623, 9, 106, '2025-05-14 00:00:00', '2025-07-22 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (624, 11, 38, '2025-03-19 00:00:00', '2025-02-12 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (625, 10, 97, '2025-05-31 00:00:00', '2025-09-07 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (626, 10, 12, '2025-06-14 00:00:00', '2025-05-03 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (627, 10, 111, '2025-04-14 00:00:00', '2025-07-05 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (628, 10, 42, '2025-03-08 00:00:00', '2025-06-13 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (629, 9, 98, '2025-05-19 00:00:00', '2025-08-21 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (630, 10, 61, '2025-08-06 00:00:00', '2024-10-24 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (631, 9, 81, '2025-01-20 00:00:00', '2025-03-20 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (632, 11, 83, '2025-01-25 00:00:00', '2025-06-27 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (633, 10, 19, '2025-04-15 00:00:00', '2024-12-28 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (634, 11, 17, '2025-11-04 00:00:00', '2025-01-05 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (635, 9, 103, '2025-11-30 00:00:00', '2025-02-10 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (636, 9, 32, '2024-11-21 00:00:00', '2024-11-06 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (637, 11, 35, '2025-11-10 00:00:00', '2024-12-10 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (638, 10, 42, '2025-03-11 00:00:00', '2025-02-19 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (639, 11, 99, '2024-12-16 00:00:00', '2024-11-15 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (640, 10, 70, '2025-02-23 00:00:00', '2025-03-21 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (641, 11, 86, '2025-02-18 00:00:00', '2025-09-04 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (642, 10, 38, '2025-07-07 00:00:00', '2025-08-14 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (643, 10, 81, '2024-10-29 00:00:00', '2025-03-09 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (644, 10, 20, '2025-06-24 00:00:00', '2024-11-05 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (645, 11, 91, '2024-11-19 00:00:00', '2025-01-04 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (646, 9, 42, '2025-01-06 00:00:00', '2025-06-17 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (647, 10, 92, '2024-11-07 00:00:00', '2025-09-12 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (648, 11, 15, '2025-10-20 00:00:00', '2025-02-04 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (649, 9, 61, '2025-11-15 00:00:00', '2025-05-26 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (650, 11, 109, '2025-02-23 00:00:00', '2025-05-13 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (651, 9, 95, '2025-03-02 00:00:00', '2025-04-13 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (652, 11, 33, '2025-12-30 00:00:00', '2025-09-05 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (653, 9, 86, '2025-03-02 00:00:00', '2025-08-26 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (654, 10, 39, '2025-08-05 00:00:00', '2025-09-22 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (655, 10, 82, '2024-12-03 00:00:00', '2024-12-15 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (656, 10, 41, '2025-10-02 00:00:00', '2025-07-06 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (657, 9, 45, '2025-01-02 00:00:00', '2025-01-08 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (658, 11, 107, '2024-11-03 00:00:00', '2025-03-25 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (659, 10, 43, '2025-02-20 00:00:00', '2024-10-08 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (660, 10, 102, '2024-11-10 00:00:00', '2025-06-30 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (661, 9, 82, '2025-10-16 00:00:00', '2024-12-23 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (662, 9, 88, '2025-09-13 00:00:00', '2025-07-28 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (663, 11, 67, '2025-04-21 00:00:00', '2025-01-28 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (664, 11, 64, '2024-11-11 00:00:00', '2024-10-27 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (665, 10, 62, '2025-10-25 00:00:00', '2024-12-01 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (666, 11, 92, '2025-02-28 00:00:00', '2024-11-15 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (667, 10, 14, '2025-03-16 00:00:00', '2025-04-25 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (668, 9, 18, '2025-12-28 00:00:00', '2025-03-29 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (669, 10, 59, '2024-11-10 00:00:00', '2025-06-19 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (670, 9, 82, '2025-04-06 00:00:00', '2025-03-14 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (671, 10, 88, '2025-07-26 00:00:00', '2025-02-13 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (672, 11, 27, '2025-03-25 00:00:00', '2025-02-18 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (673, 10, 101, '2025-09-29 00:00:00', '2025-08-07 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (674, 11, 37, '2025-09-24 00:00:00', '2025-08-20 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (675, 10, 42, '2025-09-24 00:00:00', '2025-02-14 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (676, 11, 82, '2024-11-23 00:00:00', '2025-05-26 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (677, 11, 90, '2025-06-24 00:00:00', '2025-01-31 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (678, 11, 46, '2025-12-06 00:00:00', '2025-07-29 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (679, 9, 38, '2025-09-19 00:00:00', '2025-04-02 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (680, 10, 94, '2025-09-22 00:00:00', '2025-07-17 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (681, 11, 89, '2025-02-20 00:00:00', '2024-10-15 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (682, 10, 109, '2025-12-22 00:00:00', '2024-11-27 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (683, 10, 16, '2025-09-06 00:00:00', '2024-12-31 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (684, 9, 63, '2024-11-14 00:00:00', '2024-10-18 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (685, 11, 89, '2025-02-26 00:00:00', '2025-02-06 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (686, 9, 58, '2025-11-05 00:00:00', '2025-02-26 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (687, 9, 28, '2025-12-09 00:00:00', '2025-06-26 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (688, 9, 14, '2024-10-04 00:00:00', '2024-11-27 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (689, 9, 85, '2024-11-18 00:00:00', '2025-06-28 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (690, 11, 36, '2025-07-20 00:00:00', '2025-09-30 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (691, 10, 91, '2025-04-16 00:00:00', '2025-01-06 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (692, 10, 89, '2024-11-12 00:00:00', '2024-10-26 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (693, 9, 82, '2025-10-18 00:00:00', '2025-02-28 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (694, 10, 22, '2025-09-10 00:00:00', '2024-12-21 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (695, 10, 18, '2024-11-06 00:00:00', '2025-07-02 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (696, 11, 16, '2025-09-15 00:00:00', '2025-01-12 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (697, 10, 82, '2025-03-06 00:00:00', '2024-11-18 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (698, 11, 48, '2025-12-25 00:00:00', '2025-09-17 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (699, 10, 98, '2025-07-15 00:00:00', '2025-09-14 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (700, 11, 60, '2025-06-10 00:00:00', '2025-09-10 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (701, 11, 46, '2025-12-01 00:00:00', '2024-12-03 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (702, 11, 44, '2024-12-07 00:00:00', '2024-10-07 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (703, 10, 41, '2025-08-02 00:00:00', '2024-11-07 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (704, 10, 88, '2025-01-30 00:00:00', '2025-04-24 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (705, 10, 39, '2025-10-19 00:00:00', '2025-09-27 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (706, 9, 50, '2025-01-15 00:00:00', '2025-09-22 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (707, 11, 51, '2025-07-18 00:00:00', '2025-06-08 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (708, 10, 15, '2025-11-28 00:00:00', '2025-01-28 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (709, 11, 17, '2025-05-12 00:00:00', '2025-01-06 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (710, 10, 24, '2024-10-02 00:00:00', '2025-06-14 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (711, 11, 38, '2024-10-14 00:00:00', '2025-05-07 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (712, 11, 103, '2025-12-15 00:00:00', '2024-12-04 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (713, 11, 59, '2024-12-11 00:00:00', '2025-06-05 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (714, 11, 55, '2025-06-12 00:00:00', '2025-02-13 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (715, 9, 93, '2025-06-07 00:00:00', '2025-03-14 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (716, 11, 84, '2025-03-10 00:00:00', '2025-08-27 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (717, 10, 66, '2025-06-20 00:00:00', '2025-01-16 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (718, 11, 58, '2025-06-22 00:00:00', '2025-03-31 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (719, 10, 80, '2024-12-26 00:00:00', '2025-07-07 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (720, 11, 16, '2025-10-24 00:00:00', '2025-02-15 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (721, 9, 57, '2025-04-27 00:00:00', '2024-10-23 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (722, 9, 16, '2025-09-03 00:00:00', '2025-08-27 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (723, 10, 85, '2025-12-06 00:00:00', '2025-01-06 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (724, 11, 26, '2025-03-06 00:00:00', '2025-01-29 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (725, 10, 63, '2025-02-25 00:00:00', '2024-11-22 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (726, 9, 39, '2025-09-23 00:00:00', '2024-12-18 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (727, 9, 91, '2025-12-18 00:00:00', '2025-03-09 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (728, 9, 111, '2025-01-03 00:00:00', '2025-02-10 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (729, 9, 33, '2025-08-25 00:00:00', '2025-01-25 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (730, 10, 96, '2025-06-17 00:00:00', '2025-06-29 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (731, 9, 71, '2025-11-11 00:00:00', '2024-12-15 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (732, 11, 111, '2025-01-29 00:00:00', '2025-03-29 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (733, 10, 81, '2025-11-16 00:00:00', '2025-03-20 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (734, 9, 66, '2025-06-23 00:00:00', '2025-09-16 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (735, 11, 96, '2025-06-27 00:00:00', '2025-05-17 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (736, 10, 36, '2025-04-20 00:00:00', '2024-11-27 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (737, 9, 101, '2025-12-28 00:00:00', '2025-09-05 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (738, 10, 105, '2025-07-09 00:00:00', '2025-07-20 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (739, 11, 93, '2025-03-04 00:00:00', '2025-03-06 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (740, 11, 37, '2025-12-03 00:00:00', '2025-04-13 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (741, 9, 80, '2025-03-20 00:00:00', '2025-08-11 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (742, 11, 63, '2025-12-28 00:00:00', '2024-11-18 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (743, 9, 48, '2025-05-19 00:00:00', '2025-01-04 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (744, 11, 56, '2025-07-13 00:00:00', '2025-10-01 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (745, 10, 74, '2025-07-12 00:00:00', '2025-02-11 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (746, 11, 49, '2024-11-22 00:00:00', '2025-01-09 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (747, 11, 14, '2024-11-21 00:00:00', '2025-01-06 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (748, 9, 77, '2025-02-14 00:00:00', '2025-03-26 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (749, 11, 67, '2025-03-26 00:00:00', '2025-04-23 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (750, 10, 37, '2025-01-14 00:00:00', '2025-08-24 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (751, 10, 72, '2025-09-29 00:00:00', '2025-01-22 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (752, 10, 67, '2025-02-14 00:00:00', '2024-12-05 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (753, 10, 55, '2025-11-08 00:00:00', '2025-08-28 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (754, 9, 109, '2025-04-11 00:00:00', '2025-03-22 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (755, 11, 51, '2025-03-23 00:00:00', '2025-07-25 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (756, 10, 56, '2025-04-08 00:00:00', '2025-06-13 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (757, 10, 98, '2024-11-21 00:00:00', '2025-04-28 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (758, 11, 79, '2025-10-31 00:00:00', '2025-08-07 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (759, 9, 61, '2025-10-10 00:00:00', '2025-05-24 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (760, 11, 83, '2024-11-10 00:00:00', '2024-11-20 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (761, 11, 33, '2024-12-29 00:00:00', '2025-09-15 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (762, 10, 88, '2025-03-21 00:00:00', '2025-03-06 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (763, 11, 22, '2025-07-07 00:00:00', '2024-10-30 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (764, 10, 82, '2024-10-04 00:00:00', '2024-10-23 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (765, 10, 103, '2025-08-10 00:00:00', '2024-11-28 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (766, 10, 93, '2025-10-31 00:00:00', '2024-10-12 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (767, 10, 12, '2025-12-13 00:00:00', '2024-10-10 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (768, 11, 30, '2024-11-03 00:00:00', '2025-09-22 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (769, 11, 80, '2025-03-22 00:00:00', '2024-10-19 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (770, 10, 82, '2025-05-19 00:00:00', '2025-02-10 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (771, 11, 102, '2025-03-16 00:00:00', '2025-05-08 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (772, 11, 60, '2025-02-06 00:00:00', '2024-12-09 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (773, 9, 73, '2025-07-23 00:00:00', '2025-03-29 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (774, 10, 17, '2025-07-13 00:00:00', '2025-09-10 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (775, 10, 87, '2024-10-05 00:00:00', '2024-10-20 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (776, 10, 92, '2025-05-23 00:00:00', '2024-12-10 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (777, 9, 80, '2025-03-25 00:00:00', '2025-02-10 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (778, 10, 52, '2025-08-08 00:00:00', '2024-11-25 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (779, 9, 108, '2025-07-08 00:00:00', '2024-10-07 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (780, 10, 105, '2024-11-03 00:00:00', '2024-11-11 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (781, 11, 64, '2025-02-14 00:00:00', '2025-02-07 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (782, 10, 74, '2025-12-13 00:00:00', '2025-03-13 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (783, 9, 84, '2025-07-13 00:00:00', '2025-09-24 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (784, 10, 29, '2024-11-03 00:00:00', '2024-10-23 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (785, 11, 73, '2025-07-29 00:00:00', '2025-01-06 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (786, 9, 105, '2025-05-08 00:00:00', '2024-12-26 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (787, 9, 103, '2024-12-25 00:00:00', '2024-11-18 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (788, 9, 110, '2025-04-01 00:00:00', '2025-09-19 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (789, 11, 64, '2025-06-22 00:00:00', '2025-03-29 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (790, 11, 62, '2025-09-11 00:00:00', '2025-08-14 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (791, 10, 90, '2025-06-13 00:00:00', '2025-05-02 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (792, 11, 44, '2024-10-28 00:00:00', '2024-11-22 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (793, 10, 65, '2024-10-19 00:00:00', '2025-03-15 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (794, 9, 103, '2024-12-20 00:00:00', '2025-08-05 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (795, 11, 45, '2025-03-25 00:00:00', '2025-04-26 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (796, 10, 29, '2025-07-27 00:00:00', '2025-04-03 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (797, 11, 74, '2025-01-27 00:00:00', '2025-08-18 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (798, 10, 78, '2025-03-15 00:00:00', '2025-03-19 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (799, 10, 20, '2024-12-31 00:00:00', '2025-10-01 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (800, 9, 86, '2025-04-10 00:00:00', '2025-09-15 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (801, 11, 69, '2025-07-12 00:00:00', '2025-05-02 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (802, 10, 85, '2025-01-08 00:00:00', '2025-01-28 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (803, 10, 108, '2024-10-16 00:00:00', '2025-05-20 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (804, 11, 77, '2025-03-28 00:00:00', '2025-04-17 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (805, 11, 110, '2025-03-27 00:00:00', '2025-08-27 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (806, 10, 36, '2024-10-12 00:00:00', '2025-05-30 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (807, 9, 41, '2024-12-29 00:00:00', '2025-02-27 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (808, 10, 72, '2025-10-16 00:00:00', '2025-01-20 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (809, 10, 106, '2024-10-03 00:00:00', '2025-04-03 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (810, 11, 90, '2025-08-18 00:00:00', '2024-12-18 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (811, 10, 60, '2025-06-25 00:00:00', '2024-10-19 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (812, 9, 42, '2024-12-03 00:00:00', '2024-12-11 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (813, 10, 89, '2025-10-01 00:00:00', '2025-04-07 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (814, 9, 106, '2024-10-04 00:00:00', '2025-08-31 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (815, 9, 85, '2025-07-28 00:00:00', '2025-06-08 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (816, 9, 40, '2025-02-12 00:00:00', '2024-10-24 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (817, 10, 28, '2025-09-11 00:00:00', '2025-05-18 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (818, 11, 107, '2025-07-18 00:00:00', '2025-04-09 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (819, 9, 89, '2025-03-07 00:00:00', '2024-10-13 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (820, 10, 105, '2025-05-24 00:00:00', '2025-07-08 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (821, 10, 104, '2025-05-15 00:00:00', '2025-01-03 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (822, 11, 93, '2024-11-16 00:00:00', '2025-01-09 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (823, 9, 25, '2025-02-24 00:00:00', '2025-09-24 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (824, 11, 13, '2025-09-24 00:00:00', '2025-05-03 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (825, 10, 100, '2024-11-27 00:00:00', '2025-08-06 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (826, 9, 13, '2025-08-26 00:00:00', '2024-11-27 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (827, 10, 41, '2025-03-28 00:00:00', '2025-06-05 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (828, 11, 20, '2025-11-27 00:00:00', '2025-07-20 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (829, 11, 46, '2025-01-21 00:00:00', '2024-11-06 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (830, 9, 19, '2025-01-09 00:00:00', '2025-07-08 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (831, 11, 81, '2025-04-24 00:00:00', '2025-03-06 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (832, 11, 80, '2025-11-21 00:00:00', '2024-12-23 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (833, 10, 29, '2025-05-20 00:00:00', '2025-05-08 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (834, 9, 19, '2025-11-27 00:00:00', '2025-02-02 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (835, 10, 99, '2024-11-17 00:00:00', '2024-11-08 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (836, 11, 88, '2025-11-30 00:00:00', '2025-01-04 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (837, 10, 59, '2025-08-22 00:00:00', '2025-09-29 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (838, 9, 20, '2024-10-21 00:00:00', '2024-10-09 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (839, 9, 88, '2025-12-28 00:00:00', '2025-02-06 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (840, 11, 94, '2024-10-23 00:00:00', '2024-11-08 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (841, 11, 35, '2025-09-07 00:00:00', '2025-05-31 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (842, 11, 110, '2025-06-21 00:00:00', '2025-02-27 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (843, 10, 83, '2025-02-08 00:00:00', '2025-05-14 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (844, 11, 68, '2025-02-26 00:00:00', '2025-05-09 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (845, 11, 27, '2025-01-28 00:00:00', '2024-12-11 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (846, 10, 81, '2025-07-25 00:00:00', '2025-09-28 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (847, 10, 23, '2025-09-27 00:00:00', '2025-02-23 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (848, 11, 44, '2025-02-06 00:00:00', '2025-07-18 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (849, 11, 79, '2025-10-10 00:00:00', '2025-06-09 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (850, 11, 99, '2025-05-16 00:00:00', '2025-04-04 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (851, 10, 22, '2025-07-26 00:00:00', '2025-03-21 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (852, 10, 47, '2025-05-04 00:00:00', '2024-12-01 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (853, 10, 49, '2025-10-13 00:00:00', '2025-08-11 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (854, 11, 95, '2025-01-18 00:00:00', '2025-02-10 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (855, 10, 25, '2025-01-07 00:00:00', '2025-08-25 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (856, 11, 87, '2025-07-31 00:00:00', '2024-10-13 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (857, 9, 36, '2025-03-31 00:00:00', '2024-12-10 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (858, 10, 50, '2025-11-17 00:00:00', '2024-12-20 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (859, 10, 61, '2025-06-12 00:00:00', '2024-10-09 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (860, 10, 15, '2025-12-21 00:00:00', '2025-03-20 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (861, 9, 36, '2024-11-05 00:00:00', '2025-04-05 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (862, 11, 22, '2025-05-20 00:00:00', '2025-01-11 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (863, 9, 22, '2025-03-12 00:00:00', '2025-07-08 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (864, 11, 75, '2025-03-18 00:00:00', '2025-06-28 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (865, 10, 72, '2025-06-07 00:00:00', '2024-12-19 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (866, 11, 33, '2025-06-04 00:00:00', '2025-07-17 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (867, 10, 41, '2025-06-15 00:00:00', '2025-09-07 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (868, 9, 66, '2025-01-18 00:00:00', '2025-04-05 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (869, 11, 91, '2025-07-18 00:00:00', '2025-01-03 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (870, 10, 68, '2025-06-04 00:00:00', '2025-03-22 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (871, 10, 31, '2025-12-18 00:00:00', '2025-08-27 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (872, 11, 21, '2025-04-10 00:00:00', '2025-05-11 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (873, 10, 52, '2024-12-10 00:00:00', '2025-01-31 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (874, 10, 25, '2025-05-18 00:00:00', '2025-03-27 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (875, 11, 37, '2024-12-16 00:00:00', '2025-08-02 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (876, 10, 79, '2025-10-25 00:00:00', '2025-09-17 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (877, 9, 88, '2025-12-20 00:00:00', '2024-12-25 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (878, 10, 62, '2024-12-30 00:00:00', '2025-03-17 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (879, 10, 25, '2025-03-07 00:00:00', '2024-10-17 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (880, 10, 14, '2025-08-24 00:00:00', '2024-10-11 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (881, 9, 70, '2025-03-11 00:00:00', '2025-07-10 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (882, 9, 24, '2025-03-21 00:00:00', '2024-10-28 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (883, 10, 25, '2025-12-03 00:00:00', '2025-08-15 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (884, 9, 60, '2025-09-22 00:00:00', '2025-09-30 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (885, 10, 104, '2025-12-11 00:00:00', '2024-11-23 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (886, 10, 95, '2025-07-17 00:00:00', '2025-01-18 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (887, 9, 89, '2025-04-29 00:00:00', '2025-03-28 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (888, 11, 23, '2025-03-16 00:00:00', '2025-04-16 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (889, 9, 96, '2024-11-07 00:00:00', '2024-11-19 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (890, 9, 53, '2025-12-03 00:00:00', '2024-11-27 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (891, 9, 78, '2025-07-16 00:00:00', '2024-10-08 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (892, 9, 38, '2025-10-06 00:00:00', '2025-09-05 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (893, 11, 22, '2025-07-15 00:00:00', '2025-04-07 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (894, 9, 64, '2025-10-16 00:00:00', '2025-09-25 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (895, 9, 26, '2024-12-20 00:00:00', '2025-07-20 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (896, 9, 41, '2025-01-17 00:00:00', '2025-01-30 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (897, 10, 77, '2025-08-17 00:00:00', '2025-09-13 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (898, 11, 73, '2025-05-10 00:00:00', '2025-04-13 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (899, 11, 44, '2025-04-24 00:00:00', '2025-01-07 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (900, 9, 48, '2025-09-04 00:00:00', '2025-06-08 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (901, 9, 46, '2025-03-04 00:00:00', '2024-12-28 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (902, 11, 75, '2024-11-26 00:00:00', '2024-11-12 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (903, 9, 24, '2025-06-04 00:00:00', '2024-12-22 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (904, 10, 51, '2024-10-12 00:00:00', '2025-05-20 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (905, 11, 25, '2025-06-12 00:00:00', '2025-03-02 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (906, 10, 71, '2025-08-17 00:00:00', '2025-08-31 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (907, 9, 62, '2024-11-17 00:00:00', '2024-11-06 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (908, 9, 25, '2025-04-12 00:00:00', '2025-09-07 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (909, 11, 66, '2024-11-17 00:00:00', '2024-10-21 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (910, 9, 82, '2025-04-13 00:00:00', '2024-11-12 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (911, 9, 27, '2025-06-14 00:00:00', '2024-10-26 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (912, 9, 36, '2025-11-28 00:00:00', '2025-05-02 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (913, 9, 48, '2025-01-19 00:00:00', '2024-12-01 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (914, 9, 51, '2025-07-19 00:00:00', '2025-02-19 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (915, 9, 26, '2025-07-29 00:00:00', '2025-01-29 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (916, 11, 26, '2024-10-05 00:00:00', '2025-08-15 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (917, 9, 56, '2025-09-24 00:00:00', '2024-10-11 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (918, 10, 94, '2025-11-29 00:00:00', '2024-10-09 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (919, 9, 54, '2025-06-14 00:00:00', '2025-01-16 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (920, 11, 93, '2024-11-29 00:00:00', '2025-08-06 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (921, 10, 16, '2025-01-09 00:00:00', '2025-07-07 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (922, 10, 98, '2025-09-03 00:00:00', '2025-03-20 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (923, 10, 28, '2025-10-12 00:00:00', '2025-06-05 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (924, 9, 61, '2025-04-01 00:00:00', '2024-10-16 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (925, 11, 92, '2025-04-15 00:00:00', '2025-07-27 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (926, 9, 89, '2025-04-01 00:00:00', '2025-01-27 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (927, 10, 19, '2025-03-27 00:00:00', '2024-11-02 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (928, 10, 76, '2025-02-18 00:00:00', '2025-02-05 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (929, 11, 34, '2025-08-25 00:00:00', '2025-07-21 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (930, 9, 76, '2025-09-15 00:00:00', '2025-04-04 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (931, 11, 78, '2025-12-24 00:00:00', '2024-10-30 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (932, 9, 12, '2025-05-25 00:00:00', '2024-12-19 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (933, 9, 15, '2024-11-30 00:00:00', '2024-10-29 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (934, 10, 64, '2025-07-13 00:00:00', '2025-02-12 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (935, 11, 40, '2024-10-17 00:00:00', '2024-11-11 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (936, 10, 72, '2025-05-20 00:00:00', '2025-01-16 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (937, 10, 52, '2025-12-16 00:00:00', '2024-12-28 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (938, 11, 15, '2024-12-19 00:00:00', '2024-10-10 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (939, 11, 30, '2024-12-13 00:00:00', '2025-06-13 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (940, 11, 18, '2025-04-06 00:00:00', '2025-05-25 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (941, 9, 100, '2025-06-14 00:00:00', '2024-12-18 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (942, 11, 45, '2025-03-25 00:00:00', '2025-04-26 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (943, 11, 94, '2025-01-09 00:00:00', '2025-08-17 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (944, 9, 53, '2025-12-24 00:00:00', '2025-06-08 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (945, 10, 21, '2025-02-09 00:00:00', '2025-04-01 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (946, 11, 102, '2025-03-13 00:00:00', '2024-12-01 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (947, 9, 77, '2025-03-07 00:00:00', '2024-12-08 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (948, 10, 13, '2024-11-26 00:00:00', '2024-11-25 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (949, 9, 79, '2025-04-10 00:00:00', '2025-06-17 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (950, 10, 40, '2024-12-07 00:00:00', '2025-03-31 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (951, 9, 82, '2024-11-14 00:00:00', '2024-12-12 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (952, 10, 60, '2024-10-10 00:00:00', '2024-11-06 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (953, 10, 53, '2025-10-11 00:00:00', '2025-07-20 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (954, 9, 66, '2024-10-23 00:00:00', '2025-03-01 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (955, 11, 25, '2024-11-21 00:00:00', '2025-09-20 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (956, 9, 24, '2025-11-14 00:00:00', '2025-01-21 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (957, 11, 82, '2025-12-20 00:00:00', '2025-03-28 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (958, 9, 64, '2025-09-06 00:00:00', '2025-09-17 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (959, 9, 32, '2024-11-12 00:00:00', '2025-07-18 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (960, 11, 110, '2025-05-25 00:00:00', '2025-08-22 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (961, 10, 25, '2025-12-26 00:00:00', '2025-03-08 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (962, 11, 92, '2025-07-01 00:00:00', '2025-04-11 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (963, 9, 39, '2025-08-11 00:00:00', '2025-02-28 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (964, 11, 67, '2025-08-07 00:00:00', '2025-06-27 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (965, 11, 52, '2025-02-20 00:00:00', '2025-08-30 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (966, 10, 51, '2025-05-02 00:00:00', '2025-02-19 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (967, 9, 56, '2025-01-08 00:00:00', '2025-01-13 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (968, 10, 93, '2025-10-11 00:00:00', '2025-05-08 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (969, 11, 16, '2024-12-01 00:00:00', '2025-08-20 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (970, 9, 64, '2025-08-05 00:00:00', '2024-12-30 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (971, 9, 93, '2025-08-23 00:00:00', '2025-07-11 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (972, 10, 89, '2025-08-05 00:00:00', '2025-09-02 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (973, 10, 76, '2025-11-04 00:00:00', '2025-09-29 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (974, 10, 91, '2025-02-09 00:00:00', '2025-06-25 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (975, 11, 71, '2025-01-30 00:00:00', '2025-04-13 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (976, 11, 100, '2025-04-19 00:00:00', '2025-06-09 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (977, 11, 82, '2025-07-30 00:00:00', '2024-10-22 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (978, 10, 14, '2025-12-21 00:00:00', '2025-08-11 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (979, 10, 92, '2025-04-07 00:00:00', '2025-02-16 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (980, 10, 45, '2025-09-04 00:00:00', '2024-10-26 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (981, 11, 74, '2025-04-25 00:00:00', '2025-06-28 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (982, 10, 29, '2025-12-27 00:00:00', '2024-10-28 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (983, 10, 85, '2025-06-23 00:00:00', '2025-03-09 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (984, 9, 105, '2025-10-02 00:00:00', '2024-10-18 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (985, 10, 36, '2024-10-27 00:00:00', '2024-12-16 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (986, 11, 54, '2025-08-19 00:00:00', '2024-11-07 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (987, 11, 29, '2024-12-18 00:00:00', '2024-11-28 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (988, 11, 97, '2024-10-27 00:00:00', '2025-09-26 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (989, 10, 110, '2025-03-31 00:00:00', '2025-08-11 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (990, 11, 47, '2025-12-09 00:00:00', '2024-11-02 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (991, 11, 35, '2025-04-02 00:00:00', '2025-04-27 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (992, 10, 43, '2024-12-08 00:00:00', '2024-12-24 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (993, 11, 111, '2025-04-21 00:00:00', '2024-12-03 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (994, 10, 64, '2025-08-02 00:00:00', '2025-04-11 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (995, 11, 47, '2024-10-16 00:00:00', '2025-09-24 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (996, 10, 78, '2025-09-06 00:00:00', '2025-05-05 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (997, 9, 20, '2025-06-14 00:00:00', '2025-03-04 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (998, 11, 67, '2024-11-24 00:00:00', '2024-10-23 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (999, 9, 94, '2025-08-16 00:00:00', '2025-07-23 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (1000, 9, 111, '2025-10-28 00:00:00', '2024-11-23 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (1001, 10, 97, '2025-02-21 00:00:00', '2025-03-11 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (1002, 9, 40, '2025-08-11 00:00:00', '2024-11-28 00:00:00', 0, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (1003, 11, 45, '2025-11-08 00:00:00', '2025-09-22 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (1004, 9, 81, '2025-12-15 00:00:00', '2024-11-19 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (1005, 11, 104, '2025-05-01 00:00:00', '2025-08-14 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (1006, 9, 103, '2024-11-13 00:00:00', '2024-11-06 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (1007, 11, 15, '2025-01-13 00:00:00', '2025-07-14 00:00:00', 2, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (1008, 9, 47, '2025-03-18 00:00:00', '2025-06-22 00:00:00', 3, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (1009, 9, 14, '2025-03-11 00:00:00', '2025-09-19 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (1010, 10, 74, '2025-01-13 00:00:00', '2025-09-28 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (1011, 9, 66, '2024-10-07 00:00:00', '2025-07-07 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (1012, 10, 13, '2025-12-21 00:00:00', '2025-03-25 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (1013, 9, 96, '2025-09-30 00:00:00', '2025-06-25 00:00:00', 4, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (1014, 10, 65, '2025-06-27 00:00:00', '2025-07-16 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (1015, 10, 39, '2025-05-18 00:00:00', '2024-12-22 00:00:00', 1, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');
INSERT INTO public.reservation (id, user_id, vehicle_id, start_date, finish_date, status, created_date, updated_date) VALUES (1016, 9, 74, '2025-06-08 00:00:00', '2025-07-29 00:00:00', 5, '2025-10-02 11:11:14.307533', '2025-10-02 11:11:14.307533');


--
-- TOC entry 3508 (class 0 OID 16400)
-- Dependencies: 217
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, first_name, last_name, email, passwd, created_date, updated_date, user_role, customer_type, age) VALUES (8, 'Admin', 'Admin', 'admin@admin.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2025-09-27 11:39:50.233501', '2025-09-27 11:39:50.233501', 0, NULL, 28);
INSERT INTO public.users (id, first_name, last_name, email, passwd, created_date, updated_date, user_role, customer_type, age) VALUES (9, 'Bireysel', '>30 yaş', 'customer1@customer.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2025-09-27 15:24:48.141071', '2025-09-27 15:24:48.131749', 1, 1, 40);
INSERT INTO public.users (id, first_name, last_name, email, passwd, created_date, updated_date, user_role, customer_type, age) VALUES (10, 'Bireysel', '<30', 'customer2@customer.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2025-09-28 18:22:53.656384', '2025-09-28 18:22:53.648826', 1, 1, 18);
INSERT INTO public.users (id, first_name, last_name, email, passwd, created_date, updated_date, user_role, customer_type, age) VALUES (11, 'Kurumsal', '40', 'customer3@customer.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2025-09-28 18:22:53.656384', '2025-09-28 18:22:53.648826', 1, 2, 35);


--
-- TOC entry 3515 (class 0 OID 24804)
-- Dependencies: 224
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (12, 367, 0, 5671111.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (13, 384, 0, 4640949.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (14, 304, 1, 4103449.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (15, 295, 2, 7937373.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (16, 356, 0, 4878144.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (17, 303, 2, 2347489.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (18, 331, 1, 9266888.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (19, 302, 0, 1181761.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (20, 360, 1, 67934.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (21, 298, 2, 3707230.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (22, 339, 2, 3046498.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (23, 373, 0, 8306877.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (24, 379, 1, 107415.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (25, 316, 1, 1595530.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (26, 332, 1, 8703051.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (27, 353, 1, 8136096.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (28, 346, 0, 7039593.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (29, 300, 0, 3139637.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (30, 324, 0, 9149356.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (31, 336, 0, 9937439.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (32, 318, 1, 2214561.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (33, 300, 2, 5290752.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (34, 381, 0, 7824643.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (35, 335, 2, 8387290.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (36, 299, 0, 7861086.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (37, 370, 2, 7230266.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (38, 388, 2, 3686745.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (39, 343, 1, 5457058.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (40, 361, 2, 1889045.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (41, 307, 1, 2704860.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (42, 327, 0, 2186493.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (43, 305, 1, 2122372.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (44, 353, 0, 5954721.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (45, 315, 1, 8982013.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (46, 330, 0, 2194929.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (47, 345, 2, 7619652.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (48, 362, 2, 9470546.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (49, 372, 1, 5162073.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (50, 305, 1, 8175383.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (51, 301, 1, 8353332.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (52, 370, 0, 1454300.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (53, 359, 1, 6458835.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (54, 379, 2, 815530.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (55, 337, 0, 4160846.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (56, 374, 1, 423624.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (57, 302, 2, 6246776.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (58, 378, 0, 1479456.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (59, 306, 2, 7777770.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (60, 382, 1, 7642738.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (61, 323, 2, 4121785.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (62, 387, 1, 6334093.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (63, 324, 1, 3605512.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (64, 387, 1, 3170910.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (65, 339, 0, 9467516.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (66, 362, 0, 6429922.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (67, 370, 2, 1951445.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (68, 384, 2, 4424543.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (69, 338, 1, 9625183.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (70, 347, 0, 6247669.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (71, 360, 2, 23464.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (72, 360, 1, 6893305.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (73, 320, 0, 1920088.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (74, 346, 1, 7040374.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (75, 379, 2, 3970206.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (76, 376, 1, 1095518.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (77, 303, 1, 6253017.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (78, 360, 2, 6541916.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (79, 348, 2, 4991550.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (80, 335, 0, 7118779.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (81, 324, 0, 2076170.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (82, 303, 0, 1054594.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (83, 379, 2, 8382743.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (84, 317, 2, 6226606.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (85, 329, 0, 8043493.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (86, 305, 0, 992701.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (87, 315, 2, 2621411.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (88, 332, 0, 2766207.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (89, 297, 0, 3726527.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (90, 336, 1, 1613902.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (91, 300, 1, 1459799.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (92, 321, 2, 2697962.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (93, 375, 2, 9693907.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (94, 351, 2, 7856816.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (95, 329, 0, 315188.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (96, 367, 1, 5114251.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (97, 301, 2, 5277260.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (98, 361, 2, 4963458.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (99, 299, 0, 2089812.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (100, 352, 2, 8043146.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (101, 355, 2, 8706188.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (102, 331, 2, 3786237.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (103, 381, 0, 390128.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (104, 308, 1, 2667023.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (105, 356, 2, 1640461.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (106, 343, 0, 8583013.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (107, 384, 1, 6148109.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, true);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (108, 366, 0, 4750486.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (109, 387, 2, 1811466.00, true, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (110, 338, 0, 8465012.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);
INSERT INTO public.vehicle (id, model_id, vehicle_type, price, is_rent, created_date, updated_date, at_created, at_updated, is_delete) VALUES (111, 359, 2, 4113021.00, false, '2025-10-02 10:58:35.956808', '2025-10-02 10:58:35.956808', 8, 8, false);


--
-- TOC entry 3517 (class 0 OID 24827)
-- Dependencies: 226
-- Data for Name: vehicle_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (6, 41, 3, 2918, 8835716, 4, 3, 1);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (7, 68, 2, 702, 6288762, 2, 2, 2);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (8, 37, 1, 8997, 2750672, 2, 1, 0);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (9, 46, 2, 7349, 3440480, 4, 1, 1);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (10, 39, 2, 7556, 3176497, 2, 2, 1);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (11, 19, 0, 2076, 650147, 3, 3, 1);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (12, 91, 3, 429, 5852465, 0, 4, 1);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (13, 105, 0, 4474, 5838832, 3, 1, 2);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (14, 18, 0, 7082, 3420763, 0, 4, 2);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (15, 100, 0, 2421, 2865311, 7, 3, 1);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (16, 74, 2, 7576, 3100664, 7, 2, 0);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (17, 80, 4, 2380, 5597756, 4, 3, 0);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (18, 84, 3, 6069, 9171984, 6, 4, 0);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (19, 44, 4, 5523, 4693226, 1, 3, 2);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (20, 92, 5, 9484, 2470070, 3, 2, 1);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (21, 96, 1, 2072, 7797851, 6, 1, 1);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (22, 14, 5, 6236, 129489, 3, 2, 2);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (23, 26, 1, 6878, 636937, 8, 0, 0);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (24, 109, 3, 1475, 3298993, 8, 0, 1);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (25, 52, 3, 9113, 7184275, 7, 1, 0);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (26, 66, 0, 7590, 3445255, 7, 4, 0);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (27, 106, 1, 7265, 9295933, 3, 3, 2);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (28, 15, 4, 849, 4785827, 0, 1, 2);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (29, 61, 1, 3654, 7560786, 3, 4, 0);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (30, 65, 3, 9752, 467872, 7, 4, 0);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (31, 106, 4, 3403, 7888253, 0, 1, 2);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (32, 90, 4, 9883, 1908649, 3, 4, 1);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (33, 43, 1, 2524, 8899186, 1, 1, 0);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (34, 34, 3, 419, 7019517, 3, 4, 2);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (35, 47, 4, 8931, 4366987, 2, 2, 1);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (36, 54, 1, 5787, 9659838, 4, 2, 2);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (37, 111, 3, 3942, 2146549, 8, 4, 2);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (38, 35, 1, 2316, 8884965, 0, 1, 2);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (39, 106, 4, 5343, 6976030, 3, 1, 1);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (40, 22, 2, 3149, 1677738, 1, 2, 2);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (41, 25, 4, 309, 4545448, 1, 1, 0);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (42, 59, 5, 1357, 1372923, 5, 3, 0);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (43, 45, 2, 1988, 9781034, 0, 1, 1);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (44, 73, 5, 2231, 5565208, 0, 4, 0);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (45, 46, 2, 849, 5109641, 8, 4, 1);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (46, 91, 2, 5698, 9724436, 4, 1, 1);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (47, 42, 2, 6747, 3675763, 5, 0, 0);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (48, 95, 5, 5442, 8989621, 2, 1, 0);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (49, 75, 0, 5367, 7126420, 2, 0, 1);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (50, 19, 2, 3015, 1672717, 5, 1, 0);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (51, 32, 2, 3018, 7326418, 4, 1, 1);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (52, 66, 2, 3258, 5460823, 5, 3, 0);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (53, 106, 1, 3604, 8558643, 6, 1, 0);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (54, 71, 2, 775, 8962650, 3, 1, 2);
INSERT INTO public.vehicle_details (id, vehicle_id, door_count, cc, max_range, wing_count, pilot_count, machine_type) VALUES (55, 73, 2, 7569, 9178701, 6, 3, 2);


--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 219
-- Name: brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_id_seq', 35, true);


--
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 221
-- Name: model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.model_id_seq', 388, true);


--
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 231
-- Name: payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_id_seq', 1035, true);


--
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 227
-- Name: rent_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rent_price_id_seq', 103, true);


--
-- TOC entry 3540 (class 0 OID 0)
-- Dependencies: 229
-- Name: reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservation_id_seq', 1016, true);


--
-- TOC entry 3541 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- TOC entry 3542 (class 0 OID 0)
-- Dependencies: 225
-- Name: vehicle_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_details_id_seq', 55, true);


--
-- TOC entry 3543 (class 0 OID 0)
-- Dependencies: 223
-- Name: vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_id_seq', 111, true);


--
-- TOC entry 3334 (class 2606 OID 24788)
-- Name: brand brand_brand_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_brand_key UNIQUE (brand);


--
-- TOC entry 3336 (class 2606 OID 24786)
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (id);


--
-- TOC entry 3338 (class 2606 OID 24795)
-- Name: model model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_pkey PRIMARY KEY (id);


--
-- TOC entry 3351 (class 2606 OID 32978)
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- TOC entry 3353 (class 2606 OID 32980)
-- Name: payment payment_reservation_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_reservation_id_key UNIQUE (reservation_id);


--
-- TOC entry 3345 (class 2606 OID 24844)
-- Name: rent_price rent_price_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rent_price
    ADD CONSTRAINT rent_price_pkey PRIMARY KEY (id);


--
-- TOC entry 3347 (class 2606 OID 24846)
-- Name: rent_price rent_price_vehicle_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rent_price
    ADD CONSTRAINT rent_price_vehicle_id_key UNIQUE (vehicle_id);


--
-- TOC entry 3349 (class 2606 OID 32959)
-- Name: reservation reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (id);


--
-- TOC entry 3330 (class 2606 OID 16409)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3332 (class 2606 OID 16407)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3342 (class 2606 OID 24832)
-- Name: vehicle_details vehicle_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_details
    ADD CONSTRAINT vehicle_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3340 (class 2606 OID 24810)
-- Name: vehicle vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_pkey PRIMARY KEY (id);


--
-- TOC entry 3343 (class 1259 OID 24852)
-- Name: fki_R; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_R" ON public.rent_price USING btree (vehicle_id);


--
-- TOC entry 3354 (class 2606 OID 24798)
-- Name: model model_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brand(id);


--
-- TOC entry 3362 (class 2606 OID 32981)
-- Name: payment payment_reservation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_reservation_id_fkey FOREIGN KEY (reservation_id) REFERENCES public.reservation(id);


--
-- TOC entry 3359 (class 2606 OID 24847)
-- Name: rent_price rent_price_vehicle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rent_price
    ADD CONSTRAINT rent_price_vehicle_fkey FOREIGN KEY (vehicle_id) REFERENCES public.vehicle(id) NOT VALID;


--
-- TOC entry 3360 (class 2606 OID 32960)
-- Name: reservation reservation_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3361 (class 2606 OID 32965)
-- Name: reservation reservation_vehicle_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_vehicle_id_fkey FOREIGN KEY (vehicle_id) REFERENCES public.vehicle(id);


--
-- TOC entry 3355 (class 2606 OID 24816)
-- Name: vehicle vehicle_at_created_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_at_created_fkey FOREIGN KEY (at_created) REFERENCES public.users(id);


--
-- TOC entry 3356 (class 2606 OID 24821)
-- Name: vehicle vehicle_at_updated_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_at_updated_fkey FOREIGN KEY (at_updated) REFERENCES public.users(id);


--
-- TOC entry 3358 (class 2606 OID 24833)
-- Name: vehicle_details vehicle_details_vehicle_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_details
    ADD CONSTRAINT vehicle_details_vehicle_id_fkey FOREIGN KEY (vehicle_id) REFERENCES public.vehicle(id);


--
-- TOC entry 3357 (class 2606 OID 24811)
-- Name: vehicle vehicle_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_model_id_fkey FOREIGN KEY (model_id) REFERENCES public.model(id);


-- Completed on 2025-10-02 13:26:31 +03

--
-- PostgreSQL database dump complete
--

