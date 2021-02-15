--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-07-29 11:23:17 CEST

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
-- TOC entry 3369 (class 0 OID 18199)
-- Dependencies: 211
-- Data for Name: oggettopremio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.oggettopremio VALUES ('WW90M74NN2', 334);
INSERT INTO public.oggettopremio VALUES ('DV90N62632', 987);
INSERT INTO public.oggettopremio VALUES ('NV75K5541B', 654);


--
-- TOC entry 3363 (class 0 OID 18132)
-- Dependencies: 205
-- Data for Name: supermercato; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.supermercato VALUES ('via Lorenteggio     ', 219, 'Esselunga Lorenteggio                                       ');
INSERT INTO public.supermercato VALUES ('via Andrea Solari   ', 29, 'Esselunga Solari                                            ');
INSERT INTO public.supermercato VALUES ('via G. Washington   ', 53, 'Esselunga Washington                                        ');


--
-- TOC entry 3381 (class 0 OID 18376)
-- Dependencies: 223
-- Data for Name: catalogo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.catalogo VALUES ('via Lorenteggio     ', 219, 'WW90M74NN2          ');
INSERT INTO public.catalogo VALUES ('via Andrea Solari   ', 29, 'DV90N62632          ');
INSERT INTO public.catalogo VALUES ('via G. Washington   ', 53, 'NV75K5541B          ');


--
-- TOC entry 3370 (class 0 OID 18205)
-- Dependencies: 212
-- Data for Name: clienteregistrato; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clienteregistrato VALUES ('0500654350006       ', 'Astolfo             ', 'Albanese            ', 'LBNSLF08B24F205R', 20126, 'via Garian          ', 41, 'Milano              ', '20146      ', 'albenese.a@gmail.com                                                                                                                                                                                                                                          ', 235);
INSERT INTO public.clienteregistrato VALUES ('05006543544002      ', 'Cristiana           ', 'Franco              ', 'FRNCST08M69H501B', 20165, 'via Gregorio VII    ', 122, 'Roma                ', '3336562844 ', 'cri.franco@icloud.com                                                                                                                                                                                                                                         ', 500);
INSERT INTO public.clienteregistrato VALUES ('0522609950006       ', 'Priamo              ', 'Bonetti             ', 'BNTPRM07S29L736V', 30173, 'Via Altinia         ', 131, 'Venezia VE          ', '3214336779 ', 'piamo.bonetti@tiscali.it                                                                                                                                                                                                                                      ', 1329);


--
-- TOC entry 3367 (class 0 OID 18179)
-- Dependencies: 209
-- Data for Name: prodotto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.prodotto VALUES ('ESS101025 ', true, '2020-06-05', 'farina              ', 'drogheria           ', 1.40, 2);
INSERT INTO public.prodotto VALUES ('ESS101667 ', false, '2020-05-05', 'pane                ', 'panificati          ', 1.00, 2);
INSERT INTO public.prodotto VALUES ('ESS101007 ', true, '2025-07-08', 'sogliola            ', 'pescheria           ', 2.68, 10);
INSERT INTO public.prodotto VALUES ('ESS101332 ', false, '2021-11-18', 'set di penne        ', 'cartoleria          ', 5.00, 5);
INSERT INTO public.prodotto VALUES ('ESS101555 ', true, '2020-10-03', 'pesca               ', 'ortofrutta          ', 0.60, 5);
INSERT INTO public.prodotto VALUES ('ESS102222 ', false, '2020-07-31', 'pasta fresca        ', 'panificati          ', 4.99, 7);
INSERT INTO public.prodotto VALUES ('ESS222025 ', true, '2020-08-05', 'uova                ', 'drogheria           ', 3.00, 5);


--
-- TOC entry 3378 (class 0 OID 18329)
-- Dependencies: 220
-- Data for Name: composizione; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.composizione VALUES ('ESS101667 ', 'ESS101025 ', 2);
INSERT INTO public.composizione VALUES ('ESS102222 ', 'ESS222025 ', 2);
INSERT INTO public.composizione VALUES ('ESS102222 ', 'ESS101025 ', 1);


--
-- TOC entry 3368 (class 0 OID 18187)
-- Dependencies: 210
-- Data for Name: fornitore; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fornitore VALUES ('12345670157                ', 'Fratelli Ceccarelli           ', 'info@fratelliceccarelli.it                                                                                                                                                                                                                                    ', '025743092  ', 20151, 'via Gallarate       ', 355, 'Milano              ', 'bonifico            ');
INSERT INTO public.fornitore VALUES ('12345670165                ', 'Walter FoodService            ', 'info@walterfoodservice.it                                                                                                                                                                                                                                     ', '0299010606 ', 20030, 'via P. Togliatti    ', 12, 'Milano              ', 'assegno             ');
INSERT INTO public.fornitore VALUES ('12345670132                ', 'AGEA                          ', 'info@agea.it                                                                                                                                                                                                                                                  ', '06494991   ', 185, 'via Palestro        ', 81, 'Roma                ', 'bollettino bancario ');


--
-- TOC entry 3361 (class 0 OID 18104)
-- Dependencies: 203
-- Data for Name: livello; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.livello VALUES (1, 1000.00);
INSERT INTO public.livello VALUES (2, 2000.00);
INSERT INTO public.livello VALUES (3, 3000.00);


--
-- TOC entry 3360 (class 0 OID 18098)
-- Dependencies: 202
-- Data for Name: turno; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.turno VALUES (1, '07:00:00', '13:30:00');
INSERT INTO public.turno VALUES (2, '13:30:00', '20:00:00');
INSERT INTO public.turno VALUES (3, '05:30:00', '08:30:00');
INSERT INTO public.turno VALUES (4, '11:00:00', '16:00:00');


--
-- TOC entry 3365 (class 0 OID 18148)
-- Dependencies: 207
-- Data for Name: impiegato; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.impiegato VALUES ('GLLMRC60C23A944L', '1960-03-23', 20094, 'via Raffaello       ', 22, 'Corsico             ', 'Marco               ', 'Gellini             ', 'marco.gellini@gmail.com                                                                                                                                                                                                                                       ', 'panettiere          ', 2, 1);
INSERT INTO public.impiegato VALUES ('DSNLSU19R51D612E', '1998-02-28', 20089, 'via Cervino         ', 10, 'Rozzano             ', 'Luisa               ', 'De Santis           ', 'luisadesantis@alice.it                                                                                                                                                                                                                                        ', 'provviste scaffali  ', 3, 1);
INSERT INTO public.impiegato VALUES ('NVLMSM88A20H623N', '1988-01-20', 20089, 'via Roma            ', 1, 'Rozzano             ', 'Massimiliano        ', 'Novella             ', 'novella.massimiliano@gmail.com                                                                                                                                                                                                                                ', 'addetto al banco    ', 1, 1);
INSERT INTO public.impiegato VALUES ('GVLMRA61C23A944U', '1961-03-23', 20090, 'via Celoria         ', 29, 'Assago              ', 'Mauro               ', 'Gavilli             ', 'gavillimauro@gmail.com                                                                                                                                                                                                                                        ', 'provviste scaffali  ', 3, 1);
INSERT INTO public.impiegato VALUES ('RSSVNT99C50L682W', '1999-03-10', 20090, 'via Lazio           ', 20, 'Cormano             ', 'Valentina           ', 'Rossi               ', 'rossivalentina@gmail.com                                                                                                                                                                                                                                      ', 'panettiere          ', 1, 1);


--
-- TOC entry 3364 (class 0 OID 18138)
-- Dependencies: 206
-- Data for Name: reparto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reparto VALUES ('ortofrutta          ', 'via Lorenteggio     ', 219);
INSERT INTO public.reparto VALUES ('pescheria           ', 'via Andrea Solari   ', 29);
INSERT INTO public.reparto VALUES ('cartoleria          ', 'via G. Washington   ', 53);
INSERT INTO public.reparto VALUES ('panetteria          ', 'via G. Washington   ', 53);


--
-- TOC entry 3375 (class 0 OID 18281)
-- Dependencies: 217
-- Data for Name: lavora; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lavora VALUES ('NVLMSM88A20H623N', '2013-09-13', NULL, 'ortofrutta          ', 'via Lorenteggio     ', 219);
INSERT INTO public.lavora VALUES ('GVLMRA61C23A944U', '2018-08-11', NULL, 'pescheria           ', 'via Andrea Solari   ', 29);
INSERT INTO public.lavora VALUES ('RSSVNT99C50L682W', '2019-10-01', '2020-01-20', 'panetteria          ', 'via G. Washington   ', 53);
INSERT INTO public.lavora VALUES ('DSNLSU19R51D612E', '2017-05-04', NULL, 'cartoleria          ', 'via G. Washington   ', 53);
INSERT INTO public.lavora VALUES ('GLLMRC60C23A944L', '2015-01-21', NULL, 'panetteria          ', 'via G. Washington   ', 53);


--
-- TOC entry 3382 (class 0 OID 18391)
-- Dependencies: 224
-- Data for Name: login; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.login VALUES ('amministratore      ', 'abc                 ');


--
-- TOC entry 3366 (class 0 OID 18167)
-- Dependencies: 208
-- Data for Name: magazzino; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.magazzino VALUES (20096, 'SP Cassanese        ', 1, 'Pioltello           ', 'via Andrea Solari   ', 29);
INSERT INTO public.magazzino VALUES (155, 'viale P. Togliatti  ', 121, 'Roma                ', 'via G. Washington   ', 53);
INSERT INTO public.magazzino VALUES (20090, 'SP 161              ', 9, 'Settala             ', 'via Lorenteggio     ', 219);


--
-- TOC entry 3371 (class 0 OID 18219)
-- Dependencies: 213
-- Data for Name: orario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orario VALUES ('01   ', 'via Lorenteggio     ', 219, '09:00:00', '18:30:00', 'lunedì   ', NULL);
INSERT INTO public.orario VALUES ('02   ', 'via Lorenteggio     ', 219, '09:00:00', '18:30:00', 'martedì  ', NULL);
INSERT INTO public.orario VALUES ('03   ', 'via Lorenteggio     ', 219, '09:00:00', '18:30:00', 'mercoledì', NULL);
INSERT INTO public.orario VALUES ('04   ', 'via Lorenteggio     ', 219, '09:00:00', '18:30:00', 'giovedì  ', NULL);
INSERT INTO public.orario VALUES ('05   ', 'via Lorenteggio     ', 219, '09:00:00', '18:30:00', 'venerdì  ', NULL);
INSERT INTO public.orario VALUES ('06   ', 'via Andrea Solari   ', 29, '08:00:00', '18:00:00', 'lunedì   ', NULL);
INSERT INTO public.orario VALUES ('07   ', 'via Andrea Solari   ', 29, '08:00:00', '18:00:00', 'martedì  ', NULL);
INSERT INTO public.orario VALUES ('08   ', 'via Andrea Solari   ', 29, '08:00:00', '18:00:00', 'mercoledì', NULL);
INSERT INTO public.orario VALUES ('09   ', 'via Andrea Solari   ', 29, '08:00:00', '18:00:00', 'giovedì  ', NULL);
INSERT INTO public.orario VALUES ('10   ', 'via Andrea Solari   ', 29, '08:00:00', '18:00:00', 'venerdì  ', NULL);
INSERT INTO public.orario VALUES ('11   ', 'via Andrea Solari   ', 29, '09:00:00', '18:00:00', 'sabato   ', NULL);
INSERT INTO public.orario VALUES ('12   ', 'via Andrea Solari   ', 29, '10:00:00', '13:00:00', 'domenica ', NULL);
INSERT INTO public.orario VALUES ('13   ', 'via G. Washington   ', 53, '08:30:00', '18:00:00', 'lunedì   ', NULL);
INSERT INTO public.orario VALUES ('14   ', 'via G. Washington   ', 53, '08:30:00', '18:00:00', 'martedì  ', NULL);
INSERT INTO public.orario VALUES ('15   ', 'via G. Washington   ', 53, '08:30:00', '18:00:00', 'mercoledì', NULL);
INSERT INTO public.orario VALUES ('16   ', 'via G. Washington   ', 53, '08:30:00', '18:00:00', 'giovedì  ', NULL);
INSERT INTO public.orario VALUES ('17   ', 'via G. Washington   ', 53, '08:30:00', '18:00:00', 'venerdì  ', NULL);
INSERT INTO public.orario VALUES ('18   ', 'via G. Washington   ', 53, '08:30:00', '12:30:00', 'sabato   ', NULL);
INSERT INTO public.orario VALUES ('19   ', 'via G. Washington   ', 53, '10:00:00', '12:30:00', NULL, '2020-04-25');
INSERT INTO public.orario VALUES ('20   ', 'via Andrea Solari   ', 29, '09:30:00', '12:30:00', NULL, '2020-04-25');
INSERT INTO public.orario VALUES ('21   ', 'via Lorenteggio     ', 219, '09:30:00', '12:30:00', NULL, '2020-06-02');


--
-- TOC entry 3373 (class 0 OID 18245)
-- Dependencies: 215
-- Data for Name: ordine; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ordine VALUES ('2020-03-20 00:00:00', 'ESS101332 ', '12345670157                ', 'via Lorenteggio     ', 219, 200);
INSERT INTO public.ordine VALUES ('2020-03-20 00:00:00', 'ESS101555 ', '12345670165                ', 'via Andrea Solari   ', 29, 120);
INSERT INTO public.ordine VALUES ('2020-05-02 00:00:00', 'ESS101332 ', '12345670132                ', 'via G. Washington   ', 53, 400);


--
-- TOC entry 3383 (class 0 OID 18467)
-- Dependencies: 225
-- Data for Name: premispeciali; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.premispeciali VALUES ('1233256dt ', 'WW90M74NN2', true, 250, 200);


--
-- TOC entry 3384 (class 0 OID 18477)
-- Dependencies: 226
-- Data for Name: prenotazione; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3372 (class 0 OID 18230)
-- Dependencies: 214
-- Data for Name: scontrino; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.scontrino VALUES ('2020-06-12 09:22:09', '0004531976', 'via Andrea Solari   ', 29, '0500654350006       ');
INSERT INTO public.scontrino VALUES ('2020-06-12 17:30:46', '0004532406', 'via Andrea Solari   ', 29, '0500654350006       ');
INSERT INTO public.scontrino VALUES ('2020-06-02 11:09:07', '0003706005', 'via G. Washington   ', 53, '0522609950006       ');
INSERT INTO public.scontrino VALUES ('2020-06-20 12:01:56', '0003706850', 'via G. Washington   ', 53, '0522609950006       ');
INSERT INTO public.scontrino VALUES ('2020-06-18 14:56:23', '0021819716', 'via Lorenteggio     ', 219, NULL);
INSERT INTO public.scontrino VALUES ('2020-03-19 10:56:23', '0021802791', 'via Lorenteggio     ', 219, NULL);


--
-- TOC entry 3379 (class 0 OID 18345)
-- Dependencies: 221
-- Data for Name: ps; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ps VALUES ('ESS101025 ', '0003706005', 'via G. Washington   ', 53, 7);
INSERT INTO public.ps VALUES ('ESS101332 ', '0003706850', 'via G. Washington   ', 53, 7);
INSERT INTO public.ps VALUES ('ESS101007 ', '0004531976', 'via Andrea Solari   ', 29, 12);
INSERT INTO public.ps VALUES ('ESS101007 ', '0004532406', 'via Andrea Solari   ', 29, 12);
INSERT INTO public.ps VALUES ('ESS101555 ', '0021819716', 'via Lorenteggio     ', 219, 4);
INSERT INTO public.ps VALUES ('ESS101555 ', '0021802791', 'via Lorenteggio     ', 219, 4);


--
-- TOC entry 3362 (class 0 OID 18113)
-- Dependencies: 204
-- Data for Name: responsabile; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.responsabile VALUES ('RSSMRA81T15F205Z', '1981-12-15', 20122, 'via Pace            ', 21, 'Milano              ', 'Mario               ', 'Rossi               ', 'mario.rossi@gmail.com                                                                                                                                                                                                                                         ', 4, 3);
INSERT INTO public.responsabile VALUES ('FBRBNC90A51A944C', '1990-01-11', 27100, 'via Roma            ', 1, 'Pavia               ', 'Bianca              ', 'Fabrizi             ', 'bianca.fabrizi@gmail.com                                                                                                                                                                                                                                      ', 4, 3);
INSERT INTO public.responsabile VALUES ('FNTGLI71T45D612B', '1971-12-05', 20090, 'via Tre Castelli    ', 90, 'Buccinasco          ', 'Giulia              ', 'Fanti               ', 'giuliafanti71@alice.it                                                                                                                                                                                                                                        ', 4, 3);
INSERT INTO public.responsabile VALUES ('PRDSMN70S07E801P', '1970-11-07', 20013, 'via Rosmini         ', 3, 'Magenta             ', 'Simone              ', 'Parodi              ', 'simoneparodi@gmail.com                                                                                                                                                                                                                                        ', 4, 3);
INSERT INTO public.responsabile VALUES ('GVZPTR68T07E801A', '1968-12-07', 20013, 'via Verdi           ', 3, 'Magenta             ', 'Pietro              ', 'Gavizi              ', 'pietro.gavizi68@gmail.com                                                                                                                                                                                                                                     ', 4, 3);
INSERT INTO public.responsabile VALUES ('LRSNLO93D16D969M', '1993-04-16', 20013, 'via Carducci        ', 16, 'Vigevano            ', 'Noel                ', 'Larosa              ', 'noel.larosa@gmail.com                                                                                                                                                                                                                                         ', 4, 3);


--
-- TOC entry 3377 (class 0 OID 18313)
-- Dependencies: 219
-- Data for Name: rifornisce; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rifornisce VALUES ('12345670157                ', 'ESS101332 ', '3 giorni            ', 4.00, '8076809573016       ');
INSERT INTO public.rifornisce VALUES ('12345670165                ', 'ESS101007 ', '8 giorni            ', 2.30, '80019886            ');
INSERT INTO public.rifornisce VALUES ('12345670132                ', 'ESS101555 ', '1 giorno            ', 0.35, '8052440350209       ');


--
-- TOC entry 3385 (class 0 OID 18493)
-- Dependencies: 227
-- Data for Name: ritiro; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3376 (class 0 OID 18296)
-- Dependencies: 218
-- Data for Name: stoccaggio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.stoccaggio VALUES ('ESS101007 ', 1, 'SP Cassanese        ', 20096, 'Pioltello           ', 100, 150);
INSERT INTO public.stoccaggio VALUES ('ESS101025 ', 1, 'SP Cassanese        ', 20096, 'Pioltello           ', 400, 100);
INSERT INTO public.stoccaggio VALUES ('ESS101332 ', 121, 'viale P. Togliatti  ', 155, 'Roma                ', 500, 200);
INSERT INTO public.stoccaggio VALUES ('ESS101555 ', 9, 'SP 161              ', 20090, 'Settala             ', 600, 250);


--
-- TOC entry 3374 (class 0 OID 18266)
-- Dependencies: 216
-- Data for Name: supervisione; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.supervisione VALUES ('RSSMRA81T15F205Z', '2019-09-19', NULL, 'ortofrutta          ', 'via Lorenteggio     ', 219);
INSERT INTO public.supervisione VALUES ('FBRBNC90A51A944C', '2020-01-25', NULL, 'pescheria           ', 'via Andrea Solari   ', 29);
INSERT INTO public.supervisione VALUES ('FNTGLI71T45D612B', '2015-02-12', NULL, 'cartoleria          ', 'via G. Washington   ', 53);
INSERT INTO public.supervisione VALUES ('PRDSMN70S07E801P', '2019-06-13', NULL, 'panetteria          ', 'via G. Washington   ', 53);
INSERT INTO public.supervisione VALUES ('GVZPTR68T07E801A', '2018-05-18', '2019-06-12', 'panetteria          ', 'via G. Washington   ', 53);
INSERT INTO public.supervisione VALUES ('LRSNLO93D16D969M', '2018-05-18', '2019-09-18', 'ortofrutta          ', 'via Lorenteggio     ', 219);


--
-- TOC entry 3380 (class 0 OID 18361)
-- Dependencies: 222
-- Data for Name: vende; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.vende VALUES ('ESS101555 ', 'ortofrutta          ', 'via Lorenteggio     ', 219);
INSERT INTO public.vende VALUES ('ESS101007 ', 'pescheria           ', 'via Andrea Solari   ', 29);
INSERT INTO public.vende VALUES ('ESS101332 ', 'cartoleria          ', 'via G. Washington   ', 53);
INSERT INTO public.vende VALUES ('ESS101667 ', 'panetteria          ', 'via G. Washington   ', 53);
INSERT INTO public.vende VALUES ('ESS102222 ', 'panetteria          ', 'via G. Washington   ', 53);
INSERT INTO public.vende VALUES ('ESS101025 ', 'panetteria          ', 'via G. Washington   ', 53);
INSERT INTO public.vende VALUES ('ESS222025 ', 'panetteria          ', 'via G. Washington   ', 53);


-- Completed on 2020-07-29 11:23:17 CEST

--
-- PostgreSQL database dump complete
--

