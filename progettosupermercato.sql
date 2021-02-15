--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-07-29 11:22:24 CEST

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
-- TOC entry 223 (class 1259 OID 18376)
-- Name: catalogo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalogo (
    viasupermercato character(20) NOT NULL,
    numcivsupermercato numeric(3,0) NOT NULL,
    codicepremio character(20) NOT NULL
);


ALTER TABLE public.catalogo OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 18205)
-- Name: clienteregistrato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clienteregistrato (
    numerotessera character(20) NOT NULL,
    nome character(20) NOT NULL,
    cognome character(20) NOT NULL,
    cf character(16) NOT NULL,
    cap numeric(5,0) NOT NULL,
    via character(20) NOT NULL,
    numciv numeric(3,0) NOT NULL,
    "città" character(20) NOT NULL,
    telefono character(11) NOT NULL,
    email character(254) NOT NULL,
    numeropunti numeric(6,0),
    CONSTRAINT clienteregistrato_cap_check CHECK ((cap > (0)::numeric)),
    CONSTRAINT clienteregistrato_numciv_check CHECK ((numciv > (0)::numeric)),
    CONSTRAINT clienteregistrato_numeropunti_check CHECK ((numeropunti >= (0)::numeric))
);


ALTER TABLE public.clienteregistrato OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 18329)
-- Name: composizione; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.composizione (
    composto character(10) NOT NULL,
    componente character(10) NOT NULL,
    "quantità" numeric(5,0) NOT NULL,
    CONSTRAINT "composizione_quantità_check" CHECK (("quantità" > (0)::numeric))
);


ALTER TABLE public.composizione OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 18187)
-- Name: fornitore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fornitore (
    partitaiva character(27) NOT NULL,
    ragionesociale character(30) NOT NULL,
    email character(254) NOT NULL,
    telefono character(11) NOT NULL,
    cap numeric(5,0) NOT NULL,
    via character(20) NOT NULL,
    numciv numeric(3,0) NOT NULL,
    "città" character(20) NOT NULL,
    "modalitàpagamento" character(20) NOT NULL,
    CONSTRAINT fornitore_cap_check CHECK ((cap > (0)::numeric)),
    CONSTRAINT "fornitore_modalitàpagamento_check" CHECK (("modalitàpagamento" = ANY (ARRAY['bonifico'::bpchar, 'assegno'::bpchar, 'contanti'::bpchar, 'bollettino bancario'::bpchar, 'carta di credito'::bpchar]))),
    CONSTRAINT fornitore_numciv_check CHECK ((numciv > (0)::numeric))
);


ALTER TABLE public.fornitore OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 18148)
-- Name: impiegato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.impiegato (
    cf character(16) NOT NULL,
    datadinascita date NOT NULL,
    cap numeric(5,0) NOT NULL,
    via character(20) NOT NULL,
    numciv numeric(3,0) NOT NULL,
    "città" character(20) NOT NULL,
    nome character(20) NOT NULL,
    cognome character(20) NOT NULL,
    email character(254) NOT NULL,
    mansione character(20) NOT NULL,
    numturno numeric(1,0),
    numlivello numeric(1,0),
    CONSTRAINT impiegato_cap_check CHECK ((cap > (0)::numeric)),
    CONSTRAINT impiegato_numciv_check CHECK ((numciv > (0)::numeric))
);


ALTER TABLE public.impiegato OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 18281)
-- Name: lavora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lavora (
    cfimpiegato character(16) NOT NULL,
    datainizio date NOT NULL,
    datafine date,
    nomereparto character(20),
    viasupermercato character(20),
    numcivsupermercato numeric(3,0)
);


ALTER TABLE public.lavora OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 18104)
-- Name: livello; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.livello (
    numl numeric(1,0) NOT NULL,
    stipendio numeric(8,2) NOT NULL,
    CONSTRAINT livello_numl_check CHECK ((numl >= (0)::numeric)),
    CONSTRAINT livello_stipendio_check CHECK ((stipendio > (0)::numeric))
);


ALTER TABLE public.livello OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 18391)
-- Name: login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login (
    username character(20) NOT NULL,
    password character(20) NOT NULL
);


ALTER TABLE public.login OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 18167)
-- Name: magazzino; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.magazzino (
    cap numeric(5,0) NOT NULL,
    via character(20) NOT NULL,
    numciv numeric(3,0) NOT NULL,
    "città" character(20) NOT NULL,
    viasupermercato character(20),
    numcivsupermercato numeric(3,0),
    CONSTRAINT magazzino_cap_check CHECK ((cap > (0)::numeric)),
    CONSTRAINT magazzino_numciv_check CHECK ((numciv > (0)::numeric))
);


ALTER TABLE public.magazzino OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 18199)
-- Name: oggettopremio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oggettopremio (
    codicepremio character(10) NOT NULL,
    puntipremio numeric(3,0) NOT NULL,
    CONSTRAINT oggettopremio_puntipremio_check CHECK ((puntipremio > (0)::numeric))
);


ALTER TABLE public.oggettopremio OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 18219)
-- Name: orario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orario (
    id character(5) NOT NULL,
    viasupermercato character(20) NOT NULL,
    numcivsupermercato numeric(3,0) NOT NULL,
    orainizio time without time zone NOT NULL,
    orafine time without time zone NOT NULL,
    giornosettimana character(9),
    datastraordinario date,
    CONSTRAINT orario_giornosettimana_check CHECK ((giornosettimana = ANY (ARRAY['lunedì'::bpchar, 'martedì'::bpchar, 'mercoledì'::bpchar, 'giovedì'::bpchar, 'venerdì'::bpchar, 'sabato'::bpchar, 'domenica'::bpchar])))
);


ALTER TABLE public.orario OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 18245)
-- Name: ordine; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ordine (
    dataordine timestamp without time zone NOT NULL,
    codiceinternoprodotto character(10) NOT NULL,
    partitaivafornitore character(27) NOT NULL,
    viasupermercato character(20) NOT NULL,
    numcivsupermercato numeric(3,0) NOT NULL,
    "quantitào" numeric(4,0) NOT NULL,
    CONSTRAINT "ordine_quantitào_check" CHECK (("quantitào" > (0)::numeric))
);


ALTER TABLE public.ordine OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 18467)
-- Name: premispeciali; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.premispeciali (
    id character(10) NOT NULL,
    codicepremio character(10) NOT NULL,
    "disponibilità" boolean NOT NULL,
    "puntimodalitàpagamento" numeric(6,0) NOT NULL,
    "denaromodalitàpagamento" numeric(6,0) NOT NULL
);


ALTER TABLE public.premispeciali OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 18477)
-- Name: prenotazione; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prenotazione (
    "modalitàacquisto" character(20) NOT NULL,
    id character(10) NOT NULL,
    codicepremio character(10) NOT NULL,
    numerotessera character(20) NOT NULL,
    mailavviso boolean NOT NULL,
    CONSTRAINT "prenotazione_modalitàacquisto_check" CHECK (("modalitàacquisto" = ANY (ARRAY['punti'::bpchar, 'puntiEdenaro'::bpchar])))
);


ALTER TABLE public.prenotazione OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 18179)
-- Name: prodotto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prodotto (
    codiceinterno character(10) NOT NULL,
    materiaprima boolean DEFAULT false NOT NULL,
    datascadenza date NOT NULL,
    nome character(20) NOT NULL,
    categoria character(20) NOT NULL,
    prezzoalpubblico numeric(8,2) NOT NULL,
    punti numeric(4,0),
    CONSTRAINT prodotto_prezzoalpubblico_check CHECK ((prezzoalpubblico >= (0)::numeric)),
    CONSTRAINT prodotto_punti_check CHECK ((punti >= (0)::numeric))
);


ALTER TABLE public.prodotto OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 18345)
-- Name: ps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ps (
    codiceinternoprodotto character(10) NOT NULL,
    numeroscontrino character(10) NOT NULL,
    viasupermercato character(20) NOT NULL,
    numcivsupermercato numeric(3,0) NOT NULL,
    "quantità" numeric(5,0) NOT NULL,
    CONSTRAINT "ps_quantità_check" CHECK (("quantità" > (0)::numeric))
);


ALTER TABLE public.ps OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 18138)
-- Name: reparto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reparto (
    nome character(20) NOT NULL,
    viasupermercato character(20) NOT NULL,
    numcivsupermercato numeric(3,0) NOT NULL
);


ALTER TABLE public.reparto OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 18113)
-- Name: responsabile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.responsabile (
    cf character(16) NOT NULL,
    datadinascita date NOT NULL,
    cap numeric(5,0) NOT NULL,
    via character(20) NOT NULL,
    numciv numeric(3,0) NOT NULL,
    "città" character(20) NOT NULL,
    nome character(20) NOT NULL,
    cognome character(20) NOT NULL,
    email character(254) NOT NULL,
    numturno numeric(1,0),
    numlivello numeric(1,0),
    CONSTRAINT responsabile_cap_check CHECK ((cap > (0)::numeric)),
    CONSTRAINT responsabile_numciv_check CHECK ((numciv > (0)::numeric))
);


ALTER TABLE public.responsabile OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18313)
-- Name: rifornisce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rifornisce (
    partitaivafornitore character(27) NOT NULL,
    codiceinternoprodotto character(10) NOT NULL,
    stimadiconsegna character(20) NOT NULL,
    prezzof numeric(8,2) NOT NULL,
    codicef character(20) NOT NULL,
    CONSTRAINT rifornisce_prezzof_check CHECK ((prezzof >= (0)::numeric))
);


ALTER TABLE public.rifornisce OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 18493)
-- Name: ritiro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ritiro (
    dataritiro date NOT NULL,
    "modalitàacquisto" character(20) NOT NULL,
    id character(10) NOT NULL,
    codicepremio character(10) NOT NULL,
    numerotessera character(20) NOT NULL,
    numeroscontrino character(10) NOT NULL,
    viasupermercato character(20) NOT NULL,
    numcivsupermercato numeric(3,0) NOT NULL,
    CONSTRAINT "ritiro_modalitàacquisto_check" CHECK (("modalitàacquisto" = ANY (ARRAY['punti'::bpchar, 'puntiEdenaro'::bpchar])))
);


ALTER TABLE public.ritiro OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 18230)
-- Name: scontrino; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scontrino (
    data timestamp without time zone NOT NULL,
    numeroscontrino character(10) NOT NULL,
    viasupermercato character(20) NOT NULL,
    numcivsupermercato numeric(3,0) NOT NULL,
    numerotesseracliente character(20)
);


ALTER TABLE public.scontrino OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 18296)
-- Name: stoccaggio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stoccaggio (
    codiceinternoprodotto character(10) NOT NULL,
    numcivmagazzino numeric(3,0) NOT NULL,
    viamagazzino character(20) NOT NULL,
    capmagazzino numeric(5,0) NOT NULL,
    "cittàmagazzino" character(20) NOT NULL,
    "quantità" numeric(5,0) NOT NULL,
    sogliaminima numeric(5,0) NOT NULL,
    CONSTRAINT "stoccaggio_quantità_check" CHECK (("quantità" >= (0)::numeric)),
    CONSTRAINT stoccaggio_sogliaminima_check CHECK ((sogliaminima >= (0)::numeric))
);


ALTER TABLE public.stoccaggio OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 18132)
-- Name: supermercato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supermercato (
    via character(20) NOT NULL,
    numciv numeric(3,0) NOT NULL,
    nome character(60) NOT NULL,
    CONSTRAINT supermercato_numciv_check CHECK ((numciv > (0)::numeric))
);


ALTER TABLE public.supermercato OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 18266)
-- Name: supervisione; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supervisione (
    cfresponsabile character(16) NOT NULL,
    datainizio date NOT NULL,
    datafine date,
    nomereparto character(20),
    viasupermercato character(20),
    numcivsupermercato numeric(3,0)
);


ALTER TABLE public.supervisione OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 18098)
-- Name: turno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.turno (
    numt numeric(1,0) NOT NULL,
    iniziot time without time zone NOT NULL,
    finet time without time zone NOT NULL,
    CONSTRAINT turno_numt_check CHECK ((numt >= (0)::numeric))
);


ALTER TABLE public.turno OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 18361)
-- Name: vende; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vende (
    codiceinternoprodotto character(10) NOT NULL,
    nomereparto character(20) NOT NULL,
    viasupermercato character(20) NOT NULL,
    numcivsupermercato numeric(3,0) NOT NULL
);


ALTER TABLE public.vende OWNER TO postgres;

--
-- TOC entry 3192 (class 2606 OID 18380)
-- Name: catalogo catalogo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalogo
    ADD CONSTRAINT catalogo_pkey PRIMARY KEY (viasupermercato, numcivsupermercato, codicepremio);


--
-- TOC entry 3164 (class 2606 OID 18214)
-- Name: clienteregistrato clienteregistrato_cf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clienteregistrato
    ADD CONSTRAINT clienteregistrato_cf_key UNIQUE (cf);


--
-- TOC entry 3166 (class 2606 OID 18218)
-- Name: clienteregistrato clienteregistrato_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clienteregistrato
    ADD CONSTRAINT clienteregistrato_email_key UNIQUE (email);


--
-- TOC entry 3168 (class 2606 OID 18212)
-- Name: clienteregistrato clienteregistrato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clienteregistrato
    ADD CONSTRAINT clienteregistrato_pkey PRIMARY KEY (numerotessera);


--
-- TOC entry 3170 (class 2606 OID 18216)
-- Name: clienteregistrato clienteregistrato_telefono_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clienteregistrato
    ADD CONSTRAINT clienteregistrato_telefono_key UNIQUE (telefono);


--
-- TOC entry 3186 (class 2606 OID 18334)
-- Name: composizione composizione_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composizione
    ADD CONSTRAINT composizione_pkey PRIMARY KEY (composto, componente);


--
-- TOC entry 3156 (class 2606 OID 18196)
-- Name: fornitore fornitore_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornitore
    ADD CONSTRAINT fornitore_email_key UNIQUE (email);


--
-- TOC entry 3158 (class 2606 OID 18194)
-- Name: fornitore fornitore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornitore
    ADD CONSTRAINT fornitore_pkey PRIMARY KEY (partitaiva);


--
-- TOC entry 3160 (class 2606 OID 18198)
-- Name: fornitore fornitore_telefono_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornitore
    ADD CONSTRAINT fornitore_telefono_key UNIQUE (telefono);


--
-- TOC entry 3148 (class 2606 OID 18156)
-- Name: impiegato impiegato_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.impiegato
    ADD CONSTRAINT impiegato_email_key UNIQUE (email);


--
-- TOC entry 3150 (class 2606 OID 18154)
-- Name: impiegato impiegato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.impiegato
    ADD CONSTRAINT impiegato_pkey PRIMARY KEY (cf);


--
-- TOC entry 3180 (class 2606 OID 18285)
-- Name: lavora lavora_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lavora
    ADD CONSTRAINT lavora_pkey PRIMARY KEY (cfimpiegato, datainizio);


--
-- TOC entry 3136 (class 2606 OID 18110)
-- Name: livello livello_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livello
    ADD CONSTRAINT livello_pkey PRIMARY KEY (numl);


--
-- TOC entry 3138 (class 2606 OID 18112)
-- Name: livello livello_stipendio_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livello
    ADD CONSTRAINT livello_stipendio_key UNIQUE (stipendio);


--
-- TOC entry 3194 (class 2606 OID 18395)
-- Name: login login_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_pkey PRIMARY KEY (username, password);


--
-- TOC entry 3152 (class 2606 OID 18173)
-- Name: magazzino magazzino_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.magazzino
    ADD CONSTRAINT magazzino_pkey PRIMARY KEY (cap, via, numciv, "città");


--
-- TOC entry 3162 (class 2606 OID 18204)
-- Name: oggettopremio oggettopremio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oggettopremio
    ADD CONSTRAINT oggettopremio_pkey PRIMARY KEY (codicepremio);


--
-- TOC entry 3172 (class 2606 OID 18224)
-- Name: orario orario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orario
    ADD CONSTRAINT orario_pkey PRIMARY KEY (id, viasupermercato, numcivsupermercato);


--
-- TOC entry 3176 (class 2606 OID 18250)
-- Name: ordine ordine_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordine
    ADD CONSTRAINT ordine_pkey PRIMARY KEY (dataordine, codiceinternoprodotto, partitaivafornitore, viasupermercato, numcivsupermercato);


--
-- TOC entry 3196 (class 2606 OID 18471)
-- Name: premispeciali premispeciali_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.premispeciali
    ADD CONSTRAINT premispeciali_pkey PRIMARY KEY (id, codicepremio);


--
-- TOC entry 3198 (class 2606 OID 18482)
-- Name: prenotazione prenotazione_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenotazione
    ADD CONSTRAINT prenotazione_pkey PRIMARY KEY ("modalitàacquisto", id, codicepremio, numerotessera);


--
-- TOC entry 3154 (class 2606 OID 18186)
-- Name: prodotto prodotto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodotto
    ADD CONSTRAINT prodotto_pkey PRIMARY KEY (codiceinterno);


--
-- TOC entry 3188 (class 2606 OID 18350)
-- Name: ps ps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ps
    ADD CONSTRAINT ps_pkey PRIMARY KEY (codiceinternoprodotto, numeroscontrino, viasupermercato, numcivsupermercato);


--
-- TOC entry 3146 (class 2606 OID 18142)
-- Name: reparto reparto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reparto
    ADD CONSTRAINT reparto_pkey PRIMARY KEY (nome, viasupermercato, numcivsupermercato);


--
-- TOC entry 3140 (class 2606 OID 18121)
-- Name: responsabile responsabile_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsabile
    ADD CONSTRAINT responsabile_email_key UNIQUE (email);


--
-- TOC entry 3142 (class 2606 OID 18119)
-- Name: responsabile responsabile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsabile
    ADD CONSTRAINT responsabile_pkey PRIMARY KEY (cf);


--
-- TOC entry 3184 (class 2606 OID 18318)
-- Name: rifornisce rifornisce_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rifornisce
    ADD CONSTRAINT rifornisce_pkey PRIMARY KEY (partitaivafornitore, codiceinternoprodotto);


--
-- TOC entry 3200 (class 2606 OID 18498)
-- Name: ritiro ritiro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ritiro
    ADD CONSTRAINT ritiro_pkey PRIMARY KEY (dataritiro, "modalitàacquisto", id, codicepremio, numerotessera, numeroscontrino, viasupermercato, numcivsupermercato);


--
-- TOC entry 3174 (class 2606 OID 18234)
-- Name: scontrino scontrino_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scontrino
    ADD CONSTRAINT scontrino_pkey PRIMARY KEY (numeroscontrino, viasupermercato, numcivsupermercato);


--
-- TOC entry 3182 (class 2606 OID 18302)
-- Name: stoccaggio stoccaggio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stoccaggio
    ADD CONSTRAINT stoccaggio_pkey PRIMARY KEY (codiceinternoprodotto, numcivmagazzino, viamagazzino, capmagazzino, "cittàmagazzino");


--
-- TOC entry 3144 (class 2606 OID 18137)
-- Name: supermercato supermercato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supermercato
    ADD CONSTRAINT supermercato_pkey PRIMARY KEY (via, numciv);


--
-- TOC entry 3178 (class 2606 OID 18270)
-- Name: supervisione supervisione_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supervisione
    ADD CONSTRAINT supervisione_pkey PRIMARY KEY (cfresponsabile, datainizio);


--
-- TOC entry 3134 (class 2606 OID 18103)
-- Name: turno turno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turno
    ADD CONSTRAINT turno_pkey PRIMARY KEY (numt);


--
-- TOC entry 3190 (class 2606 OID 18365)
-- Name: vende vende_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vende
    ADD CONSTRAINT vende_pkey PRIMARY KEY (codiceinternoprodotto, nomereparto, viasupermercato, numcivsupermercato);


--
-- TOC entry 3228 (class 2606 OID 18386)
-- Name: catalogo catalogo_codicepremio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalogo
    ADD CONSTRAINT catalogo_codicepremio_fkey FOREIGN KEY (codicepremio) REFERENCES public.oggettopremio(codicepremio) ON UPDATE CASCADE;


--
-- TOC entry 3227 (class 2606 OID 18381)
-- Name: catalogo catalogo_viasupermercato_numcivsupermercato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalogo
    ADD CONSTRAINT catalogo_viasupermercato_numcivsupermercato_fkey FOREIGN KEY (viasupermercato, numcivsupermercato) REFERENCES public.supermercato(via, numciv) ON UPDATE CASCADE;


--
-- TOC entry 3221 (class 2606 OID 18340)
-- Name: composizione composizione_componente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composizione
    ADD CONSTRAINT composizione_componente_fkey FOREIGN KEY (componente) REFERENCES public.prodotto(codiceinterno) ON UPDATE CASCADE;


--
-- TOC entry 3222 (class 2606 OID 18335)
-- Name: composizione composizione_composto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composizione
    ADD CONSTRAINT composizione_composto_fkey FOREIGN KEY (composto) REFERENCES public.prodotto(codiceinterno) ON UPDATE CASCADE;


--
-- TOC entry 3205 (class 2606 OID 18162)
-- Name: impiegato impiegato_numlivello_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.impiegato
    ADD CONSTRAINT impiegato_numlivello_fkey FOREIGN KEY (numlivello) REFERENCES public.livello(numl) ON UPDATE CASCADE;


--
-- TOC entry 3204 (class 2606 OID 18157)
-- Name: impiegato impiegato_numturno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.impiegato
    ADD CONSTRAINT impiegato_numturno_fkey FOREIGN KEY (numturno) REFERENCES public.turno(numt) ON UPDATE CASCADE;


--
-- TOC entry 3215 (class 2606 OID 18286)
-- Name: lavora lavora_cfimpiegato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lavora
    ADD CONSTRAINT lavora_cfimpiegato_fkey FOREIGN KEY (cfimpiegato) REFERENCES public.impiegato(cf);


--
-- TOC entry 3216 (class 2606 OID 18291)
-- Name: lavora lavora_nomereparto_viasupermercato_numcivsupermercato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lavora
    ADD CONSTRAINT lavora_nomereparto_viasupermercato_numcivsupermercato_fkey FOREIGN KEY (nomereparto, viasupermercato, numcivsupermercato) REFERENCES public.reparto(nome, viasupermercato, numcivsupermercato) ON UPDATE CASCADE;


--
-- TOC entry 3206 (class 2606 OID 18174)
-- Name: magazzino magazzino_viasupermercato_numcivsupermercato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.magazzino
    ADD CONSTRAINT magazzino_viasupermercato_numcivsupermercato_fkey FOREIGN KEY (viasupermercato, numcivsupermercato) REFERENCES public.supermercato(via, numciv) ON UPDATE CASCADE;


--
-- TOC entry 3207 (class 2606 OID 18225)
-- Name: orario orario_viasupermercato_numcivsupermercato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orario
    ADD CONSTRAINT orario_viasupermercato_numcivsupermercato_fkey FOREIGN KEY (viasupermercato, numcivsupermercato) REFERENCES public.supermercato(via, numciv) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3210 (class 2606 OID 18251)
-- Name: ordine ordine_codiceinternoprodotto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordine
    ADD CONSTRAINT ordine_codiceinternoprodotto_fkey FOREIGN KEY (codiceinternoprodotto) REFERENCES public.prodotto(codiceinterno) ON UPDATE CASCADE;


--
-- TOC entry 3211 (class 2606 OID 18256)
-- Name: ordine ordine_partitaivafornitore_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordine
    ADD CONSTRAINT ordine_partitaivafornitore_fkey FOREIGN KEY (partitaivafornitore) REFERENCES public.fornitore(partitaiva) ON UPDATE CASCADE;


--
-- TOC entry 3212 (class 2606 OID 18261)
-- Name: ordine ordine_viasupermercato_numcivsupermercato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordine
    ADD CONSTRAINT ordine_viasupermercato_numcivsupermercato_fkey FOREIGN KEY (viasupermercato, numcivsupermercato) REFERENCES public.supermercato(via, numciv) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3229 (class 2606 OID 18472)
-- Name: premispeciali premispeciali_codicepremio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.premispeciali
    ADD CONSTRAINT premispeciali_codicepremio_fkey FOREIGN KEY (codicepremio) REFERENCES public.oggettopremio(codicepremio);


--
-- TOC entry 3230 (class 2606 OID 18483)
-- Name: prenotazione prenotazione_id_codicepremio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenotazione
    ADD CONSTRAINT prenotazione_id_codicepremio_fkey FOREIGN KEY (id, codicepremio) REFERENCES public.premispeciali(id, codicepremio);


--
-- TOC entry 3231 (class 2606 OID 18488)
-- Name: prenotazione prenotazione_numerotessera_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenotazione
    ADD CONSTRAINT prenotazione_numerotessera_fkey FOREIGN KEY (numerotessera) REFERENCES public.clienteregistrato(numerotessera);


--
-- TOC entry 3223 (class 2606 OID 18351)
-- Name: ps ps_codiceinternoprodotto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ps
    ADD CONSTRAINT ps_codiceinternoprodotto_fkey FOREIGN KEY (codiceinternoprodotto) REFERENCES public.prodotto(codiceinterno) ON UPDATE CASCADE;


--
-- TOC entry 3224 (class 2606 OID 18356)
-- Name: ps ps_numeroscontrino_viasupermercato_numcivsupermercato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ps
    ADD CONSTRAINT ps_numeroscontrino_viasupermercato_numcivsupermercato_fkey FOREIGN KEY (numeroscontrino, viasupermercato, numcivsupermercato) REFERENCES public.scontrino(numeroscontrino, viasupermercato, numcivsupermercato) ON UPDATE CASCADE;


--
-- TOC entry 3203 (class 2606 OID 18143)
-- Name: reparto reparto_viasupermercato_numcivsupermercato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reparto
    ADD CONSTRAINT reparto_viasupermercato_numcivsupermercato_fkey FOREIGN KEY (viasupermercato, numcivsupermercato) REFERENCES public.supermercato(via, numciv) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3202 (class 2606 OID 18127)
-- Name: responsabile responsabile_numlivello_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsabile
    ADD CONSTRAINT responsabile_numlivello_fkey FOREIGN KEY (numlivello) REFERENCES public.livello(numl) ON UPDATE CASCADE;


--
-- TOC entry 3201 (class 2606 OID 18122)
-- Name: responsabile responsabile_numturno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsabile
    ADD CONSTRAINT responsabile_numturno_fkey FOREIGN KEY (numturno) REFERENCES public.turno(numt) ON UPDATE CASCADE;


--
-- TOC entry 3220 (class 2606 OID 18324)
-- Name: rifornisce rifornisce_codiceinternoprodotto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rifornisce
    ADD CONSTRAINT rifornisce_codiceinternoprodotto_fkey FOREIGN KEY (codiceinternoprodotto) REFERENCES public.prodotto(codiceinterno) ON UPDATE CASCADE;


--
-- TOC entry 3219 (class 2606 OID 18319)
-- Name: rifornisce rifornisce_partitaivafornitore_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rifornisce
    ADD CONSTRAINT rifornisce_partitaivafornitore_fkey FOREIGN KEY (partitaivafornitore) REFERENCES public.fornitore(partitaiva) ON UPDATE CASCADE;


--
-- TOC entry 3232 (class 2606 OID 18499)
-- Name: ritiro ritiro_modalitàacquisto_id_codicepremio_numerotessera_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ritiro
    ADD CONSTRAINT "ritiro_modalitàacquisto_id_codicepremio_numerotessera_fkey" FOREIGN KEY ("modalitàacquisto", id, codicepremio, numerotessera) REFERENCES public.prenotazione("modalitàacquisto", id, codicepremio, numerotessera);


--
-- TOC entry 3233 (class 2606 OID 18504)
-- Name: ritiro ritiro_numeroscontrino_viasupermercato_numcivsupermercato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ritiro
    ADD CONSTRAINT ritiro_numeroscontrino_viasupermercato_numcivsupermercato_fkey FOREIGN KEY (numeroscontrino, viasupermercato, numcivsupermercato) REFERENCES public.scontrino(numeroscontrino, viasupermercato, numcivsupermercato);


--
-- TOC entry 3208 (class 2606 OID 18235)
-- Name: scontrino scontrino_numerotesseracliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scontrino
    ADD CONSTRAINT scontrino_numerotesseracliente_fkey FOREIGN KEY (numerotesseracliente) REFERENCES public.clienteregistrato(numerotessera) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3209 (class 2606 OID 18240)
-- Name: scontrino scontrino_viasupermercato_numcivsupermercato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scontrino
    ADD CONSTRAINT scontrino_viasupermercato_numcivsupermercato_fkey FOREIGN KEY (viasupermercato, numcivsupermercato) REFERENCES public.supermercato(via, numciv) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3217 (class 2606 OID 18303)
-- Name: stoccaggio stoccaggio_codiceinternoprodotto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stoccaggio
    ADD CONSTRAINT stoccaggio_codiceinternoprodotto_fkey FOREIGN KEY (codiceinternoprodotto) REFERENCES public.prodotto(codiceinterno) ON UPDATE CASCADE;


--
-- TOC entry 3218 (class 2606 OID 18308)
-- Name: stoccaggio stoccaggio_viamagazzino_numcivmagazzino_capmagazzino_citt_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stoccaggio
    ADD CONSTRAINT stoccaggio_viamagazzino_numcivmagazzino_capmagazzino_citt_fkey FOREIGN KEY (viamagazzino, numcivmagazzino, capmagazzino, "cittàmagazzino") REFERENCES public.magazzino(via, numciv, cap, "città") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3213 (class 2606 OID 18271)
-- Name: supervisione supervisione_cfresponsabile_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supervisione
    ADD CONSTRAINT supervisione_cfresponsabile_fkey FOREIGN KEY (cfresponsabile) REFERENCES public.responsabile(cf);


--
-- TOC entry 3214 (class 2606 OID 18276)
-- Name: supervisione supervisione_nomereparto_viasupermercato_numcivsupermercat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supervisione
    ADD CONSTRAINT supervisione_nomereparto_viasupermercato_numcivsupermercat_fkey FOREIGN KEY (nomereparto, viasupermercato, numcivsupermercato) REFERENCES public.reparto(nome, viasupermercato, numcivsupermercato) ON UPDATE CASCADE;


--
-- TOC entry 3225 (class 2606 OID 18366)
-- Name: vende vende_codiceinternoprodotto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vende
    ADD CONSTRAINT vende_codiceinternoprodotto_fkey FOREIGN KEY (codiceinternoprodotto) REFERENCES public.prodotto(codiceinterno) ON UPDATE CASCADE;


--
-- TOC entry 3226 (class 2606 OID 18371)
-- Name: vende vende_nomereparto_viasupermercato_numcivsupermercato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vende
    ADD CONSTRAINT vende_nomereparto_viasupermercato_numcivsupermercato_fkey FOREIGN KEY (nomereparto, viasupermercato, numcivsupermercato) REFERENCES public.reparto(nome, viasupermercato, numcivsupermercato) ON UPDATE CASCADE;


-- Completed on 2020-07-29 11:22:24 CEST

--
-- PostgreSQL database dump complete
--

