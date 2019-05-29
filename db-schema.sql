--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.10
-- Dumped by pg_dump version 9.5.10

-- Started on 2018-01-05 00:19:52 EET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12359)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2164 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 187 (class 1259 OID 25028)
-- Name: fivemin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE fivemin (
    "time" timestamp without time zone,
    pair character varying(7),
    close real,
    open real,
    min real,
    max real
);


ALTER TABLE fivemin OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 25016)
-- Name: min; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE min (
    "time" timestamp without time zone,
    pair character varying(7),
    open real,
    close real,
    min real,
    max real
);


ALTER TABLE min OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 16433)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE orders (
    id integer NOT NULL,
    userid integer,
    product character varying(7),
    side character varying(4),
    volume integer,
    type character varying(7),
    price real,
    expiry timestamp without time zone,
    spread real,
    takeprofit real,
    stoploss real,
    placed timestamp without time zone,
    executed timestamp without time zone,
    "limit" real,
    stop real
);


ALTER TABLE orders OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 25043)
-- Name: sixhour; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sixhour (
    "time" timestamp without time zone,
    pair character varying(7),
    close real,
    open real,
    min real,
    max real
);


ALTER TABLE sixhour OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 25033)
-- Name: tenmin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tenmin (
    "time" timestamp without time zone,
    pair character varying(7),
    close real,
    open real,
    min real,
    max real
);


ALTER TABLE tenmin OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 25037)
-- Name: thirtymin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE thirtymin (
    "time" timestamp without time zone,
    pair character varying(7),
    close real,
    open real,
    min real,
    max real
);


ALTER TABLE thirtymin OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 25040)
-- Name: threehour; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE threehour (
    "time" timestamp without time zone,
    pair character varying(7),
    close real,
    open real,
    min real,
    max real
);


ALTER TABLE threehour OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 25004)
-- Name: tick; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tick (
    pair character varying(7) NOT NULL,
    "time" timestamp without time zone NOT NULL,
    bid real,
    ask real
);


ALTER TABLE tick OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 25077)
-- Name: trades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE trades (
    openorderid integer NOT NULL,
    closeorderid integer,
    gainloss real
);


ALTER TABLE trades OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16438)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 1000000
    CACHE 10;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16440)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id integer DEFAULT nextval('users_id_seq'::regclass) NOT NULL,
    username character varying(20) NOT NULL,
    password character varying(64) NOT NULL,
    token character varying
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 2022 (class 2604 OID 16444)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('transactions_id_seq'::regclass);


--
-- TOC entry 2029 (class 2606 OID 25008)
-- Name: pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tick
    ADD CONSTRAINT pkey PRIMARY KEY (pair, "time");


--
-- TOC entry 2040 (class 2606 OID 25081)
-- Name: trades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trades
    ADD CONSTRAINT trades_pkey PRIMARY KEY (openorderid);


--
-- TOC entry 2025 (class 2606 OID 16450)
-- Name: transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 2027 (class 2606 OID 16452)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2034 (class 1259 OID 25032)
-- Name: fivemin_time_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fivemin_time_idx ON fivemin USING btree ("time");


--
-- TOC entry 2033 (class 1259 OID 25031)
-- Name: minute_time_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX minute_time_idx ON min USING btree ("time");


--
-- TOC entry 2038 (class 1259 OID 25048)
-- Name: sixhour_time_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sixhour_time_idx ON sixhour USING btree ("time");


--
-- TOC entry 2035 (class 1259 OID 25036)
-- Name: tenmin_time_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tenmin_time_idx ON tenmin USING btree ("time");


--
-- TOC entry 2036 (class 1259 OID 25046)
-- Name: thirtymin_time_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX thirtymin_time_idx ON thirtymin USING btree ("time");


--
-- TOC entry 2037 (class 1259 OID 25047)
-- Name: threehour_time_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX threehour_time_idx ON threehour USING btree ("time");


--
-- TOC entry 2030 (class 1259 OID 25092)
-- Name: tick_ask_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tick_ask_idx ON tick USING btree (ask);


--
-- TOC entry 2031 (class 1259 OID 25093)
-- Name: tick_bid_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tick_bid_idx ON tick USING btree (bid);


--
-- TOC entry 2032 (class 1259 OID 25009)
-- Name: tick_time_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tick_time_idx ON tick USING btree ("time");


--
-- TOC entry 2042 (class 2606 OID 25087)
-- Name: trades_closeorderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trades
    ADD CONSTRAINT trades_closeorderid_fkey FOREIGN KEY (closeorderid) REFERENCES orders(id);


--
-- TOC entry 2041 (class 2606 OID 25082)
-- Name: trades_openorderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trades
    ADD CONSTRAINT trades_openorderid_fkey FOREIGN KEY (openorderid) REFERENCES orders(id);


--
-- TOC entry 2163 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-01-05 00:19:53 EET

--
-- PostgreSQL database dump complete
--

