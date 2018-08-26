--
-- PostgreSQL database dump
--

-- Started on 2010-04-09 00:11:52

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 419 (class 2612 OID 16386)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1626 (class 1259 OID 24854)
-- Dependencies: 3
-- Name: administrative_role; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE administrative_role (
    id bigint NOT NULL,
    role bigint NOT NULL
);


ALTER TABLE public.administrative_role OWNER TO anubis;

--
-- TOC entry 1606 (class 1259 OID 24579)
-- Dependencies: 3
-- Name: application; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE application (
    id bigint NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    application_account bigint NOT NULL
);


ALTER TABLE public.application OWNER TO anubis;

--
-- TOC entry 1609 (class 1259 OID 24632)
-- Dependencies: 1931 3
-- Name: application_account; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE application_account (
    id bigint NOT NULL,
    password text NOT NULL,
    enabled boolean DEFAULT false NOT NULL
);


ALTER TABLE public.application_account OWNER TO anubis;

--
-- TOC entry 1634 (class 1259 OID 24967)
-- Dependencies: 3
-- Name: characteristic; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE characteristic (
    id bigint NOT NULL,
    aid text NOT NULL,
    application bigint
);


ALTER TABLE public.characteristic OWNER TO anubis;

--
-- TOC entry 1635 (class 1259 OID 24982)
-- Dependencies: 3
-- Name: characteristic_translation; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE characteristic_translation (
    uid bigint NOT NULL,
    name text NOT NULL,
    description text,
    locale bigint NOT NULL,
    characteristic bigint NOT NULL
);


ALTER TABLE public.characteristic_translation OWNER TO anubis;

--
-- TOC entry 1636 (class 1259 OID 25000)
-- Dependencies: 3
-- Name: characteristic_value; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE characteristic_value (
    uid bigint NOT NULL,
    id text NOT NULL,
    characteristic bigint NOT NULL
);


ALTER TABLE public.characteristic_value OWNER TO anubis;

--
-- TOC entry 1637 (class 1259 OID 25010)
-- Dependencies: 3
-- Name: characteristic_value_translation; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE characteristic_value_translation (
    characteristic_value_translation_uid bigint NOT NULL,
    name text NOT NULL,
    description text,
    locale_uid bigint NOT NULL,
    characteristic_value_uid bigint NOT NULL
);


ALTER TABLE public.characteristic_value_translation OWNER TO anubis;

--
-- TOC entry 1632 (class 1259 OID 24947)
-- Dependencies: 3
-- Name: characterized_group; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE characterized_group (
    characterized_group_uid bigint NOT NULL,
    group_uid bigint NOT NULL
);


ALTER TABLE public.characterized_group OWNER TO anubis;

--
-- TOC entry 1652 (class 1259 OID 25254)
-- Dependencies: 3
-- Name: characterized_group_characteristic_value; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE characterized_group_characteristic_value (
    characterized_group_characteristic_value_uid bigint NOT NULL,
    characterized_group_uid bigint NOT NULL,
    characteristic_value_uid bigint NOT NULL
);


ALTER TABLE public.characterized_group_characteristic_value OWNER TO anubis;

--
-- TOC entry 1627 (class 1259 OID 24864)
-- Dependencies: 3
-- Name: common_role; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE common_role (
    common_role_uid bigint NOT NULL,
    role_uid bigint NOT NULL
);


ALTER TABLE public.common_role OWNER TO anubis;

--
-- TOC entry 1645 (class 1259 OID 25129)
-- Dependencies: 3
-- Name: context; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE context (
    context_uid bigint NOT NULL,
    id text NOT NULL,
    application_uid bigint NOT NULL
);


ALTER TABLE public.context OWNER TO anubis;

--
-- TOC entry 1647 (class 1259 OID 25168)
-- Dependencies: 3
-- Name: context_translation; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE context_translation (
    context_translation_uid bigint NOT NULL,
    name text NOT NULL,
    description text,
    locale_uid bigint NOT NULL,
    context_uid bigint NOT NULL
);


ALTER TABLE public.context_translation OWNER TO anubis;

--
-- TOC entry 1648 (class 1259 OID 25187)
-- Dependencies: 3
-- Name: context_value; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE context_value (
    context_value_uid bigint NOT NULL,
    id text NOT NULL,
    context_uid bigint NOT NULL
);


ALTER TABLE public.context_value OWNER TO anubis;

--
-- TOC entry 1649 (class 1259 OID 25202)
-- Dependencies: 3
-- Name: context_value_translation; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE context_value_translation (
    context_value_translation_uid bigint NOT NULL,
    name text NOT NULL,
    description text,
    locale_uid bigint NOT NULL,
    context_value_uid bigint NOT NULL
);


ALTER TABLE public.context_value_translation OWNER TO anubis;

--
-- TOC entry 1630 (class 1259 OID 24912)
-- Dependencies: 1934 3
-- Name: group; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE "group" (
    group_uid bigint NOT NULL,
    id text NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    application_uid bigint NOT NULL
);


ALTER TABLE public."group" OWNER TO anubis;

--
-- TOC entry 1643 (class 1259 OID 25089)
-- Dependencies: 3
-- Name: group_assigned_common_role; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE group_assigned_common_role (
    group_assigned_common_role_uid bigint NOT NULL,
    group_uid bigint NOT NULL,
    validate_uid bigint,
    common_role_uid bigint NOT NULL
);


ALTER TABLE public.group_assigned_common_role OWNER TO anubis;

--
-- TOC entry 1631 (class 1259 OID 24929)
-- Dependencies: 3
-- Name: group_translation; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE group_translation (
    group_translation_uid bigint NOT NULL,
    name text NOT NULL,
    description text,
    group_uid bigint NOT NULL,
    locale_uid bigint NOT NULL
);


ALTER TABLE public.group_translation OWNER TO anubis;

--
-- TOC entry 1640 (class 1259 OID 25051)
-- Dependencies: 3
-- Name: inactivated_group; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE inactivated_group (
    inactivated_group_uid bigint NOT NULL,
    inactivation_uid bigint NOT NULL,
    group_uid bigint NOT NULL
);


ALTER TABLE public.inactivated_group OWNER TO anubis;

--
-- TOC entry 1641 (class 1259 OID 25054)
-- Dependencies: 3
-- Name: inactivated_user; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE inactivated_user (
    inactivated_user_uid bigint NOT NULL,
    inactivation_uid bigint NOT NULL,
    user_uid bigint NOT NULL
);


ALTER TABLE public.inactivated_user OWNER TO anubis;

--
-- TOC entry 1638 (class 1259 OID 25028)
-- Dependencies: 3
-- Name: inactivation; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE inactivation (
    inactivation_uid bigint NOT NULL
);


ALTER TABLE public.inactivation OWNER TO anubis;

--
-- TOC entry 1639 (class 1259 OID 25033)
-- Dependencies: 3
-- Name: inactivation_translation; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE inactivation_translation (
    inactivation_translation_uid bigint NOT NULL,
    reason text NOT NULL,
    locale_uid bigint NOT NULL,
    inactivation_uid bigint NOT NULL
);


ALTER TABLE public.inactivation_translation OWNER TO anubis;

--
-- TOC entry 1607 (class 1259 OID 24589)
-- Dependencies: 3
-- Name: locale; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE locale (
    locale_uid bigint NOT NULL,
    code text NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.locale OWNER TO anubis;

--
-- TOC entry 1633 (class 1259 OID 24957)
-- Dependencies: 3
-- Name: manual_group; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE manual_group (
    manual_group_uid bigint NOT NULL,
    group_uid bigint NOT NULL
);


ALTER TABLE public.manual_group OWNER TO anubis;

--
-- TOC entry 1621 (class 1259 OID 24772)
-- Dependencies: 3
-- Name: operation; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE operation (
    operation_uid bigint NOT NULL,
    id text NOT NULL,
    application_uid bigint
);


ALTER TABLE public.operation OWNER TO anubis;

--
-- TOC entry 1622 (class 1259 OID 24778)
-- Dependencies: 3
-- Name: operation_translation; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE operation_translation (
    operation_translation_uid bigint NOT NULL,
    name text NOT NULL,
    description text,
    locale_uid bigint NOT NULL,
    operation_uid bigint NOT NULL
);


ALTER TABLE public.operation_translation OWNER TO anubis;

--
-- TOC entry 1623 (class 1259 OID 24802)
-- Dependencies: 1932 1933 3
-- Name: permission; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE permission (
    permission_uid bigint NOT NULL,
    resource_uid bigint NOT NULL,
    operation_uid bigint NOT NULL,
    contextualized boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.permission OWNER TO anubis;

--
-- TOC entry 1624 (class 1259 OID 24819)
-- Dependencies: 3
-- Name: permission_conflict; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE permission_conflict (
    permission_uid bigint NOT NULL,
    permission_conflited_uid bigint NOT NULL,
    permission_conflict_uid bigint NOT NULL
);


ALTER TABLE public.permission_conflict OWNER TO anubis;

--
-- TOC entry 1625 (class 1259 OID 24836)
-- Dependencies: 3
-- Name: permission_conflict_translation; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE permission_conflict_translation (
    permission_conflict_translation_uid bigint NOT NULL,
    description text NOT NULL,
    permission_conflict_uid bigint NOT NULL,
    locale_uid bigint NOT NULL
);


ALTER TABLE public.permission_conflict_translation OWNER TO anubis;

--
-- TOC entry 1646 (class 1259 OID 25142)
-- Dependencies: 3
-- Name: permission_context; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE permission_context (
    permission_context_uid bigint NOT NULL,
    permission_uid bigint NOT NULL,
    context_uid bigint NOT NULL
);


ALTER TABLE public.permission_context OWNER TO anubis;

--
-- TOC entry 1617 (class 1259 OID 24705)
-- Dependencies: 3
-- Name: resouce; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE resouce (
    resource_uid bigint NOT NULL,
    validate_uid bigint,
    id text NOT NULL,
    application_uid bigint NOT NULL
);


ALTER TABLE public.resouce OWNER TO anubis;

--
-- TOC entry 1618 (class 1259 OID 24726)
-- Dependencies: 3
-- Name: resource_translation; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE resource_translation (
    resource_translation_uid bigint NOT NULL,
    name text NOT NULL,
    description text,
    locale_uid bigint NOT NULL,
    resource_uid bigint NOT NULL
);


ALTER TABLE public.resource_translation OWNER TO anubis;

--
-- TOC entry 1619 (class 1259 OID 24744)
-- Dependencies: 3
-- Name: resource_type; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE resource_type (
    resource_type_uid bigint NOT NULL,
    id text NOT NULL
);


ALTER TABLE public.resource_type OWNER TO anubis;

--
-- TOC entry 1620 (class 1259 OID 24754)
-- Dependencies: 3
-- Name: resource_type_translation; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE resource_type_translation (
    resource_type_translation_uid bigint NOT NULL,
    name text NOT NULL,
    description text,
    locale_uid bigint NOT NULL,
    resource_type_uid bigint NOT NULL
);


ALTER TABLE public.resource_type_translation OWNER TO anubis;

--
-- TOC entry 1615 (class 1259 OID 24667)
-- Dependencies: 3
-- Name: role; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE role (
    role_uid bigint NOT NULL,
    id text NOT NULL,
    validate_uid bigint NOT NULL,
    application_uid bigint NOT NULL
);


ALTER TABLE public.role OWNER TO anubis;

--
-- TOC entry 1616 (class 1259 OID 24687)
-- Dependencies: 3
-- Name: role_translation; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE role_translation (
    role_translation_uid bigint NOT NULL,
    name text NOT NULL,
    description text,
    locale_uid bigint NOT NULL,
    role_uid bigint NOT NULL
);


ALTER TABLE public.role_translation OWNER TO anubis;

--
-- TOC entry 1612 (class 1259 OID 24643)
-- Dependencies: 3
-- Name: sequence_application_account_uid; Type: SEQUENCE; Schema: public; Owner: anubis
--

CREATE SEQUENCE sequence_application_account_uid
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sequence_application_account_uid OWNER TO anubis;

--
-- TOC entry 2182 (class 0 OID 0)
-- Dependencies: 1612
-- Name: sequence_application_account_uid; Type: SEQUENCE SET; Schema: public; Owner: anubis
--

SELECT pg_catalog.setval('sequence_application_account_uid', 12, true);


--
-- TOC entry 1610 (class 1259 OID 24638)
-- Dependencies: 3
-- Name: sequence_application_uid; Type: SEQUENCE; Schema: public; Owner: anubis
--

CREATE SEQUENCE sequence_application_uid
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sequence_application_uid OWNER TO anubis;

--
-- TOC entry 2183 (class 0 OID 0)
-- Dependencies: 1610
-- Name: sequence_application_uid; Type: SEQUENCE SET; Schema: public; Owner: anubis
--

SELECT pg_catalog.setval('sequence_application_uid', 43, true);


--
-- TOC entry 1614 (class 1259 OID 24663)
-- Dependencies: 3
-- Name: sequence_supported_locale_uid; Type: SEQUENCE; Schema: public; Owner: anubis
--

CREATE SEQUENCE sequence_supported_locale_uid
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sequence_supported_locale_uid OWNER TO anubis;

--
-- TOC entry 2184 (class 0 OID 0)
-- Dependencies: 1614
-- Name: sequence_supported_locale_uid; Type: SEQUENCE SET; Schema: public; Owner: anubis
--

SELECT pg_catalog.setval('sequence_supported_locale_uid', 16, true);


--
-- TOC entry 1613 (class 1259 OID 24645)
-- Dependencies: 3
-- Name: sequence_validate_uid; Type: SEQUENCE; Schema: public; Owner: anubis
--

CREATE SEQUENCE sequence_validate_uid
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sequence_validate_uid OWNER TO anubis;

--
-- TOC entry 2185 (class 0 OID 0)
-- Dependencies: 1613
-- Name: sequence_validate_uid; Type: SEQUENCE SET; Schema: public; Owner: anubis
--

SELECT pg_catalog.setval('sequence_validate_uid', 15, true);


--
-- TOC entry 1608 (class 1259 OID 24609)
-- Dependencies: 3
-- Name: supported_locale; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE supported_locale (
    supported_locale_uid bigint NOT NULL,
    application_uid bigint NOT NULL,
    locale_uid bigint NOT NULL
);


ALTER TABLE public.supported_locale OWNER TO anubis;

--
-- TOC entry 1628 (class 1259 OID 24884)
-- Dependencies: 3
-- Name: user; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE "user" (
    user_uid bigint NOT NULL,
    name text NOT NULL,
    preferred_locale_uid bigint NOT NULL
);


ALTER TABLE public."user" OWNER TO anubis;

--
-- TOC entry 1629 (class 1259 OID 24892)
-- Dependencies: 3
-- Name: user_account; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE user_account (
    user_account_uid bigint NOT NULL,
    login text NOT NULL,
    password text NOT NULL,
    validate_uid bigint NOT NULL,
    user_uid bigint NOT NULL
);


ALTER TABLE public.user_account OWNER TO anubis;

--
-- TOC entry 1644 (class 1259 OID 25109)
-- Dependencies: 3
-- Name: user_assigned_administrative_role; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE user_assigned_administrative_role (
    user_assigned_administrative_role_uid bigint NOT NULL,
    user_uid bigint NOT NULL,
    administrative_role_uid bigint NOT NULL,
    validate_uid bigint
);


ALTER TABLE public.user_assigned_administrative_role OWNER TO anubis;

--
-- TOC entry 1642 (class 1259 OID 25069)
-- Dependencies: 3
-- Name: user_assigned_common_role; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE user_assigned_common_role (
    user_assigned_common_role_uid bigint NOT NULL,
    user_uid bigint NOT NULL,
    common_role_uid bigint NOT NULL,
    validate_uid bigint
);


ALTER TABLE public.user_assigned_common_role OWNER TO anubis;

--
-- TOC entry 1653 (class 1259 OID 25271)
-- Dependencies: 3
-- Name: user_assigned_common_role_contextualization; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE user_assigned_common_role_contextualization (
    user_assigned_common_role_contextualization_uid bigint NOT NULL,
    user_assigned_common_role_uid bigint NOT NULL,
    context_value_uid bigint NOT NULL,
    permission_uid bigint NOT NULL
);


ALTER TABLE public.user_assigned_common_role_contextualization OWNER TO anubis;

--
-- TOC entry 1651 (class 1259 OID 25237)
-- Dependencies: 3
-- Name: user_characteristic_value; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE user_characteristic_value (
    user_characteristic_value_uid bigint NOT NULL,
    characteristic_value_uid bigint NOT NULL,
    user_uid bigint NOT NULL
);


ALTER TABLE public.user_characteristic_value OWNER TO anubis;

--
-- TOC entry 1650 (class 1259 OID 25220)
-- Dependencies: 3
-- Name: user_manual_group_membership; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE user_manual_group_membership (
    user_manual_group_membership_uid bigint NOT NULL,
    manual_group_uid bigint NOT NULL,
    user_uid bigint NOT NULL
);


ALTER TABLE public.user_manual_group_membership OWNER TO anubis;

--
-- TOC entry 1611 (class 1259 OID 24640)
-- Dependencies: 3
-- Name: validate; Type: TABLE; Schema: public; Owner: anubis; Tablespace: 
--

CREATE TABLE validate (
    id bigint NOT NULL,
    begin_date timestamp with time zone,
    end_date timestamp with time zone
);


ALTER TABLE public.validate OWNER TO anubis;

--
-- TOC entry 2149 (class 0 OID 24854)
-- Dependencies: 1626
-- Data for Name: administrative_role; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY administrative_role (id, role) FROM stdin;
\.


--
-- TOC entry 2133 (class 0 OID 24579)
-- Dependencies: 1606
-- Data for Name: application; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY application (id, code, name, application_account) FROM stdin;
19	TESTE_PHELIPE	xpto	1
20	TESTE_2	asdasd	2
21	XPTO	asdsa	3
23	XPTO3	asd	4
28	xxxxxxxxx	xxxxxxxxxxxxx	29
30	XPTO2	lalalalaalala	31
32	xasasd	xxxxxasss	33
34	asagfgf	hfh	35
36	TESTE_IDIOMAS	TESTE_IDIOMASaaa	37
38	dasd	asdas	39
40	XPTO_555	XPTO_555	41
\.


--
-- TOC entry 2136 (class 0 OID 24632)
-- Dependencies: 1609
-- Data for Name: application_account; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY application_account (id, password, enabled) FROM stdin;
1	a	f
2	x	f
3	y	f
4	z	f
29	xxxxxxxxxxxxxxxxxxxx	f
31	ac	f
33	asas	t
35	fhffhh	t
37	TESTE_IDIOMASasada	t
39	sdasd	t
41	XPTO_555	t
\.


--
-- TOC entry 2157 (class 0 OID 24967)
-- Dependencies: 1634
-- Data for Name: characteristic; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY characteristic (id, aid, application) FROM stdin;
\.


--
-- TOC entry 2158 (class 0 OID 24982)
-- Dependencies: 1635
-- Data for Name: characteristic_translation; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY characteristic_translation (uid, name, description, locale, characteristic) FROM stdin;
\.


--
-- TOC entry 2159 (class 0 OID 25000)
-- Dependencies: 1636
-- Data for Name: characteristic_value; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY characteristic_value (uid, id, characteristic) FROM stdin;
\.


--
-- TOC entry 2160 (class 0 OID 25010)
-- Dependencies: 1637
-- Data for Name: characteristic_value_translation; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY characteristic_value_translation (characteristic_value_translation_uid, name, description, locale_uid, characteristic_value_uid) FROM stdin;
\.


--
-- TOC entry 2155 (class 0 OID 24947)
-- Dependencies: 1632
-- Data for Name: characterized_group; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY characterized_group (characterized_group_uid, group_uid) FROM stdin;
\.


--
-- TOC entry 2175 (class 0 OID 25254)
-- Dependencies: 1652
-- Data for Name: characterized_group_characteristic_value; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY characterized_group_characteristic_value (characterized_group_characteristic_value_uid, characterized_group_uid, characteristic_value_uid) FROM stdin;
\.


--
-- TOC entry 2150 (class 0 OID 24864)
-- Dependencies: 1627
-- Data for Name: common_role; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY common_role (common_role_uid, role_uid) FROM stdin;
\.


--
-- TOC entry 2168 (class 0 OID 25129)
-- Dependencies: 1645
-- Data for Name: context; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY context (context_uid, id, application_uid) FROM stdin;
\.


--
-- TOC entry 2170 (class 0 OID 25168)
-- Dependencies: 1647
-- Data for Name: context_translation; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY context_translation (context_translation_uid, name, description, locale_uid, context_uid) FROM stdin;
\.


--
-- TOC entry 2171 (class 0 OID 25187)
-- Dependencies: 1648
-- Data for Name: context_value; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY context_value (context_value_uid, id, context_uid) FROM stdin;
\.


--
-- TOC entry 2172 (class 0 OID 25202)
-- Dependencies: 1649
-- Data for Name: context_value_translation; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY context_value_translation (context_value_translation_uid, name, description, locale_uid, context_value_uid) FROM stdin;
\.


--
-- TOC entry 2153 (class 0 OID 24912)
-- Dependencies: 1630
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY "group" (group_uid, id, enabled, application_uid) FROM stdin;
\.


--
-- TOC entry 2166 (class 0 OID 25089)
-- Dependencies: 1643
-- Data for Name: group_assigned_common_role; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY group_assigned_common_role (group_assigned_common_role_uid, group_uid, validate_uid, common_role_uid) FROM stdin;
\.


--
-- TOC entry 2154 (class 0 OID 24929)
-- Dependencies: 1631
-- Data for Name: group_translation; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY group_translation (group_translation_uid, name, description, group_uid, locale_uid) FROM stdin;
\.


--
-- TOC entry 2163 (class 0 OID 25051)
-- Dependencies: 1640
-- Data for Name: inactivated_group; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY inactivated_group (inactivated_group_uid, inactivation_uid, group_uid) FROM stdin;
\.


--
-- TOC entry 2164 (class 0 OID 25054)
-- Dependencies: 1641
-- Data for Name: inactivated_user; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY inactivated_user (inactivated_user_uid, inactivation_uid, user_uid) FROM stdin;
\.


--
-- TOC entry 2161 (class 0 OID 25028)
-- Dependencies: 1638
-- Data for Name: inactivation; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY inactivation (inactivation_uid) FROM stdin;
\.


--
-- TOC entry 2162 (class 0 OID 25033)
-- Dependencies: 1639
-- Data for Name: inactivation_translation; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY inactivation_translation (inactivation_translation_uid, reason, locale_uid, inactivation_uid) FROM stdin;
\.


--
-- TOC entry 2134 (class 0 OID 24589)
-- Dependencies: 1607
-- Data for Name: locale; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY locale (locale_uid, code, name) FROM stdin;
3	es-ES	Espanhol
1	pt-BR	Português
2	en-US	Inglês
\.


--
-- TOC entry 2156 (class 0 OID 24957)
-- Dependencies: 1633
-- Data for Name: manual_group; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY manual_group (manual_group_uid, group_uid) FROM stdin;
\.


--
-- TOC entry 2144 (class 0 OID 24772)
-- Dependencies: 1621
-- Data for Name: operation; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY operation (operation_uid, id, application_uid) FROM stdin;
\.


--
-- TOC entry 2145 (class 0 OID 24778)
-- Dependencies: 1622
-- Data for Name: operation_translation; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY operation_translation (operation_translation_uid, name, description, locale_uid, operation_uid) FROM stdin;
\.


--
-- TOC entry 2146 (class 0 OID 24802)
-- Dependencies: 1623
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY permission (permission_uid, resource_uid, operation_uid, contextualized, enabled) FROM stdin;
\.


--
-- TOC entry 2147 (class 0 OID 24819)
-- Dependencies: 1624
-- Data for Name: permission_conflict; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY permission_conflict (permission_uid, permission_conflited_uid, permission_conflict_uid) FROM stdin;
\.


--
-- TOC entry 2148 (class 0 OID 24836)
-- Dependencies: 1625
-- Data for Name: permission_conflict_translation; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY permission_conflict_translation (permission_conflict_translation_uid, description, permission_conflict_uid, locale_uid) FROM stdin;
\.


--
-- TOC entry 2169 (class 0 OID 25142)
-- Dependencies: 1646
-- Data for Name: permission_context; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY permission_context (permission_context_uid, permission_uid, context_uid) FROM stdin;
\.


--
-- TOC entry 2140 (class 0 OID 24705)
-- Dependencies: 1617
-- Data for Name: resouce; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY resouce (resource_uid, validate_uid, id, application_uid) FROM stdin;
\.


--
-- TOC entry 2141 (class 0 OID 24726)
-- Dependencies: 1618
-- Data for Name: resource_translation; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY resource_translation (resource_translation_uid, name, description, locale_uid, resource_uid) FROM stdin;
\.


--
-- TOC entry 2142 (class 0 OID 24744)
-- Dependencies: 1619
-- Data for Name: resource_type; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY resource_type (resource_type_uid, id) FROM stdin;
\.


--
-- TOC entry 2143 (class 0 OID 24754)
-- Dependencies: 1620
-- Data for Name: resource_type_translation; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY resource_type_translation (resource_type_translation_uid, name, description, locale_uid, resource_type_uid) FROM stdin;
\.


--
-- TOC entry 2138 (class 0 OID 24667)
-- Dependencies: 1615
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY role (role_uid, id, validate_uid, application_uid) FROM stdin;
\.


--
-- TOC entry 2139 (class 0 OID 24687)
-- Dependencies: 1616
-- Data for Name: role_translation; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY role_translation (role_translation_uid, name, description, locale_uid, role_uid) FROM stdin;
\.


--
-- TOC entry 2135 (class 0 OID 24609)
-- Dependencies: 1608
-- Data for Name: supported_locale; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY supported_locale (supported_locale_uid, application_uid, locale_uid) FROM stdin;
1	19	1
2	19	2
3	19	3
4	20	1
5	20	2
6	20	3
7	21	1
8	23	2
9	23	3
12	38	1
11	38	3
13	40	1
14	40	2
\.


--
-- TOC entry 2151 (class 0 OID 24884)
-- Dependencies: 1628
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY "user" (user_uid, name, preferred_locale_uid) FROM stdin;
\.


--
-- TOC entry 2152 (class 0 OID 24892)
-- Dependencies: 1629
-- Data for Name: user_account; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY user_account (user_account_uid, login, password, validate_uid, user_uid) FROM stdin;
\.


--
-- TOC entry 2167 (class 0 OID 25109)
-- Dependencies: 1644
-- Data for Name: user_assigned_administrative_role; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY user_assigned_administrative_role (user_assigned_administrative_role_uid, user_uid, administrative_role_uid, validate_uid) FROM stdin;
\.


--
-- TOC entry 2165 (class 0 OID 25069)
-- Dependencies: 1642
-- Data for Name: user_assigned_common_role; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY user_assigned_common_role (user_assigned_common_role_uid, user_uid, common_role_uid, validate_uid) FROM stdin;
\.


--
-- TOC entry 2176 (class 0 OID 25271)
-- Dependencies: 1653
-- Data for Name: user_assigned_common_role_contextualization; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY user_assigned_common_role_contextualization (user_assigned_common_role_contextualization_uid, user_assigned_common_role_uid, context_value_uid, permission_uid) FROM stdin;
\.


--
-- TOC entry 2174 (class 0 OID 25237)
-- Dependencies: 1651
-- Data for Name: user_characteristic_value; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY user_characteristic_value (user_characteristic_value_uid, characteristic_value_uid, user_uid) FROM stdin;
\.


--
-- TOC entry 2173 (class 0 OID 25220)
-- Dependencies: 1650
-- Data for Name: user_manual_group_membership; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY user_manual_group_membership (user_manual_group_membership_uid, manual_group_uid, user_uid) FROM stdin;
\.


--
-- TOC entry 2137 (class 0 OID 24640)
-- Dependencies: 1611
-- Data for Name: validate; Type: TABLE DATA; Schema: public; Owner: anubis
--

COPY validate (id, begin_date, end_date) FROM stdin;
4	2010-04-05 22:02:13.899-03	\N
5	2010-04-05 22:03:54.775-03	\N
7	2010-04-05 22:11:20.092-03	\N
8	2010-04-05 22:40:44.978-03	\N
12	2010-04-05 22:47:50.637-03	\N
14	\N	\N
15	1987-09-02 18:00:00-03	\N
\.


--
-- TOC entry 1989 (class 2606 OID 24858)
-- Dependencies: 1626 1626
-- Name: administrative_role_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY administrative_role
    ADD CONSTRAINT administrative_role_pkey PRIMARY KEY (id);


--
-- TOC entry 1953 (class 2606 OID 24650)
-- Dependencies: 1609 1609
-- Name: application_account_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY application_account
    ADD CONSTRAINT application_account_pkey PRIMARY KEY (id);


--
-- TOC entry 1936 (class 2606 OID 25311)
-- Dependencies: 1606 1606
-- Name: application_application_account_uid_key; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY application
    ADD CONSTRAINT application_application_account_uid_key UNIQUE (application_account);


--
-- TOC entry 1938 (class 2606 OID 24588)
-- Dependencies: 1606 1606
-- Name: application_id_key; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY application
    ADD CONSTRAINT application_id_key UNIQUE (code);


--
-- TOC entry 1940 (class 2606 OID 24666)
-- Dependencies: 1606 1606
-- Name: application_name_key; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY application
    ADD CONSTRAINT application_name_key UNIQUE (name);


--
-- TOC entry 1942 (class 2606 OID 24600)
-- Dependencies: 1606 1606
-- Name: application_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY application
    ADD CONSTRAINT application_pkey PRIMARY KEY (id);


--
-- TOC entry 2009 (class 2606 OID 24976)
-- Dependencies: 1634 1634 1634
-- Name: characteristic_id_key; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY characteristic
    ADD CONSTRAINT characteristic_id_key UNIQUE (aid, application);


--
-- TOC entry 2015 (class 2606 OID 25009)
-- Dependencies: 1636 1636 1636
-- Name: characteristic_id_key1; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY characteristic_value
    ADD CONSTRAINT characteristic_id_key1 UNIQUE (id, characteristic);


--
-- TOC entry 2011 (class 2606 OID 24974)
-- Dependencies: 1634 1634
-- Name: characteristic_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY characteristic
    ADD CONSTRAINT characteristic_pkey PRIMARY KEY (id);


--
-- TOC entry 2017 (class 2606 OID 25007)
-- Dependencies: 1636 1636
-- Name: characteristic_pkey1; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY characteristic_value
    ADD CONSTRAINT characteristic_pkey1 PRIMARY KEY (uid);


--
-- TOC entry 2013 (class 2606 OID 24989)
-- Dependencies: 1635 1635
-- Name: characteristic_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY characteristic_translation
    ADD CONSTRAINT characteristic_translation_pkey PRIMARY KEY (uid);


--
-- TOC entry 2019 (class 2606 OID 25017)
-- Dependencies: 1637 1637
-- Name: characteristic_translation_pkey1; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY characteristic_value_translation
    ADD CONSTRAINT characteristic_translation_pkey1 PRIMARY KEY (characteristic_value_translation_uid);


--
-- TOC entry 2059 (class 2606 OID 25270)
-- Dependencies: 1652 1652 1652
-- Name: characterized_group_characteristic__characterized_group_uid_key; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY characterized_group_characteristic_value
    ADD CONSTRAINT characterized_group_characteristic__characterized_group_uid_key UNIQUE (characterized_group_uid, characteristic_value_uid);


--
-- TOC entry 2061 (class 2606 OID 25258)
-- Dependencies: 1652 1652
-- Name: characterized_group_characteristic_value_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY characterized_group_characteristic_value
    ADD CONSTRAINT characterized_group_characteristic_value_pkey PRIMARY KEY (characterized_group_characteristic_value_uid);


--
-- TOC entry 2005 (class 2606 OID 24951)
-- Dependencies: 1632 1632
-- Name: characterized_group_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY characterized_group
    ADD CONSTRAINT characterized_group_pkey PRIMARY KEY (characterized_group_uid);


--
-- TOC entry 1991 (class 2606 OID 24868)
-- Dependencies: 1627 1627
-- Name: common_role_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY common_role
    ADD CONSTRAINT common_role_pkey PRIMARY KEY (common_role_uid);


--
-- TOC entry 2035 (class 2606 OID 25162)
-- Dependencies: 1645 1645 1645
-- Name: context_id_key; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY context
    ADD CONSTRAINT context_id_key UNIQUE (id, application_uid);


--
-- TOC entry 2037 (class 2606 OID 25155)
-- Dependencies: 1645 1645
-- Name: context_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY context
    ADD CONSTRAINT context_pkey PRIMARY KEY (context_uid);


--
-- TOC entry 2043 (class 2606 OID 25175)
-- Dependencies: 1647 1647
-- Name: context_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY context_translation
    ADD CONSTRAINT context_translation_pkey PRIMARY KEY (context_translation_uid);


--
-- TOC entry 2045 (class 2606 OID 25196)
-- Dependencies: 1648 1648 1648
-- Name: context_value_id_key; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY context_value
    ADD CONSTRAINT context_value_id_key UNIQUE (id, context_uid);


--
-- TOC entry 2047 (class 2606 OID 25194)
-- Dependencies: 1648 1648
-- Name: context_value_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY context_value
    ADD CONSTRAINT context_value_pkey PRIMARY KEY (context_value_uid);


--
-- TOC entry 2049 (class 2606 OID 25209)
-- Dependencies: 1649 1649
-- Name: context_value_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY context_value_translation
    ADD CONSTRAINT context_value_translation_pkey PRIMARY KEY (context_value_translation_uid);


--
-- TOC entry 2031 (class 2606 OID 25093)
-- Dependencies: 1643 1643
-- Name: group_assigned_common_role_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY group_assigned_common_role
    ADD CONSTRAINT group_assigned_common_role_pkey PRIMARY KEY (group_assigned_common_role_uid);


--
-- TOC entry 1999 (class 2606 OID 24922)
-- Dependencies: 1630 1630 1630
-- Name: group_id_key; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY "group"
    ADD CONSTRAINT group_id_key UNIQUE (id, application_uid);


--
-- TOC entry 2001 (class 2606 OID 24920)
-- Dependencies: 1630 1630
-- Name: group_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY "group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (group_uid);


--
-- TOC entry 2003 (class 2606 OID 24936)
-- Dependencies: 1631 1631
-- Name: group_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY group_translation
    ADD CONSTRAINT group_translation_pkey PRIMARY KEY (group_translation_uid);


--
-- TOC entry 2025 (class 2606 OID 25294)
-- Dependencies: 1640 1640
-- Name: inactivated_group_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY inactivated_group
    ADD CONSTRAINT inactivated_group_pkey PRIMARY KEY (inactivated_group_uid);


--
-- TOC entry 2021 (class 2606 OID 25032)
-- Dependencies: 1638 1638
-- Name: inactivation_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY inactivation
    ADD CONSTRAINT inactivation_pkey PRIMARY KEY (inactivation_uid);


--
-- TOC entry 2023 (class 2606 OID 25040)
-- Dependencies: 1639 1639
-- Name: inactivation_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY inactivation_translation
    ADD CONSTRAINT inactivation_translation_pkey PRIMARY KEY (inactivation_translation_uid);


--
-- TOC entry 1944 (class 2606 OID 24598)
-- Dependencies: 1607 1607
-- Name: locale_code_key; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY locale
    ADD CONSTRAINT locale_code_key UNIQUE (code);


--
-- TOC entry 1946 (class 2606 OID 24596)
-- Dependencies: 1607 1607
-- Name: locale_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY locale
    ADD CONSTRAINT locale_pkey PRIMARY KEY (locale_uid);


--
-- TOC entry 2007 (class 2606 OID 24961)
-- Dependencies: 1633 1633
-- Name: manual_group_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY manual_group
    ADD CONSTRAINT manual_group_pkey PRIMARY KEY (manual_group_uid);


--
-- TOC entry 1975 (class 2606 OID 24789)
-- Dependencies: 1621 1621 1621
-- Name: operation_id_key; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY operation
    ADD CONSTRAINT operation_id_key UNIQUE (id, application_uid);


--
-- TOC entry 1977 (class 2606 OID 24787)
-- Dependencies: 1621 1621
-- Name: operation_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY operation
    ADD CONSTRAINT operation_pkey PRIMARY KEY (operation_uid);


--
-- TOC entry 1979 (class 2606 OID 24791)
-- Dependencies: 1622 1622
-- Name: operation_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY operation_translation
    ADD CONSTRAINT operation_translation_pkey PRIMARY KEY (operation_translation_uid);


--
-- TOC entry 1983 (class 2606 OID 24825)
-- Dependencies: 1624 1624 1624
-- Name: permission_conflict_permission_uid_key; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY permission_conflict
    ADD CONSTRAINT permission_conflict_permission_uid_key UNIQUE (permission_uid, permission_conflited_uid);


--
-- TOC entry 1985 (class 2606 OID 24823)
-- Dependencies: 1624 1624
-- Name: permission_conflict_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY permission_conflict
    ADD CONSTRAINT permission_conflict_pkey PRIMARY KEY (permission_conflict_uid);


--
-- TOC entry 1987 (class 2606 OID 24843)
-- Dependencies: 1625 1625
-- Name: permission_conflict_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY permission_conflict_translation
    ADD CONSTRAINT permission_conflict_translation_pkey PRIMARY KEY (permission_conflict_translation_uid);


--
-- TOC entry 2039 (class 2606 OID 25148)
-- Dependencies: 1646 1646 1646
-- Name: permission_context_permission_uid_key; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY permission_context
    ADD CONSTRAINT permission_context_permission_uid_key UNIQUE (permission_uid, context_uid);


--
-- TOC entry 2041 (class 2606 OID 25146)
-- Dependencies: 1646 1646
-- Name: permission_context_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY permission_context
    ADD CONSTRAINT permission_context_pkey PRIMARY KEY (permission_context_uid);


--
-- TOC entry 1981 (class 2606 OID 24808)
-- Dependencies: 1623 1623
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (permission_uid);


--
-- TOC entry 1963 (class 2606 OID 24714)
-- Dependencies: 1617 1617 1617
-- Name: resouce_id_key; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY resouce
    ADD CONSTRAINT resouce_id_key UNIQUE (id, application_uid);


--
-- TOC entry 1965 (class 2606 OID 24712)
-- Dependencies: 1617 1617
-- Name: resouce_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY resouce
    ADD CONSTRAINT resouce_pkey PRIMARY KEY (resource_uid);


--
-- TOC entry 1967 (class 2606 OID 24733)
-- Dependencies: 1618 1618
-- Name: resource_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY resource_translation
    ADD CONSTRAINT resource_translation_pkey PRIMARY KEY (resource_translation_uid);


--
-- TOC entry 1969 (class 2606 OID 24753)
-- Dependencies: 1619 1619
-- Name: resource_type_id_key; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY resource_type
    ADD CONSTRAINT resource_type_id_key UNIQUE (id);


--
-- TOC entry 1971 (class 2606 OID 24751)
-- Dependencies: 1619 1619
-- Name: resource_type_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY resource_type
    ADD CONSTRAINT resource_type_pkey PRIMARY KEY (resource_type_uid);


--
-- TOC entry 1973 (class 2606 OID 24761)
-- Dependencies: 1620 1620
-- Name: resource_type_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY resource_type_translation
    ADD CONSTRAINT resource_type_translation_pkey PRIMARY KEY (resource_type_translation_uid);


--
-- TOC entry 1957 (class 2606 OID 24676)
-- Dependencies: 1615 1615 1615
-- Name: role_id_key; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_id_key UNIQUE (id, application_uid);


--
-- TOC entry 1959 (class 2606 OID 24674)
-- Dependencies: 1615 1615
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_uid);


--
-- TOC entry 1961 (class 2606 OID 24694)
-- Dependencies: 1616 1616
-- Name: role_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY role_translation
    ADD CONSTRAINT role_translation_pkey PRIMARY KEY (role_translation_uid);


--
-- TOC entry 1949 (class 2606 OID 24615)
-- Dependencies: 1608 1608 1608
-- Name: supported_locale_application_uid_key; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY supported_locale
    ADD CONSTRAINT supported_locale_application_uid_key UNIQUE (application_uid, locale_uid);


--
-- TOC entry 1951 (class 2606 OID 24613)
-- Dependencies: 1608 1608
-- Name: supported_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY supported_locale
    ADD CONSTRAINT supported_locale_pkey PRIMARY KEY (supported_locale_uid);


--
-- TOC entry 1995 (class 2606 OID 24901)
-- Dependencies: 1629 1629
-- Name: user_account_login_key; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY user_account
    ADD CONSTRAINT user_account_login_key UNIQUE (login);


--
-- TOC entry 1997 (class 2606 OID 24899)
-- Dependencies: 1629 1629
-- Name: user_account_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY user_account
    ADD CONSTRAINT user_account_pkey PRIMARY KEY (user_account_uid);


--
-- TOC entry 2033 (class 2606 OID 25113)
-- Dependencies: 1644 1644
-- Name: user_assigned_administrative_role_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY user_assigned_administrative_role
    ADD CONSTRAINT user_assigned_administrative_role_pkey PRIMARY KEY (user_assigned_administrative_role_uid);


--
-- TOC entry 2063 (class 2606 OID 25277)
-- Dependencies: 1653 1653 1653 1653
-- Name: user_assigned_common_role_con_user_assigned_common_role_uid_key; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY user_assigned_common_role_contextualization
    ADD CONSTRAINT user_assigned_common_role_con_user_assigned_common_role_uid_key UNIQUE (user_assigned_common_role_uid, context_value_uid, permission_uid);


--
-- TOC entry 2065 (class 2606 OID 25275)
-- Dependencies: 1653 1653
-- Name: user_assigned_common_role_contextualization_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY user_assigned_common_role_contextualization
    ADD CONSTRAINT user_assigned_common_role_contextualization_pkey PRIMARY KEY (user_assigned_common_role_contextualization_uid);


--
-- TOC entry 2029 (class 2606 OID 25073)
-- Dependencies: 1642 1642
-- Name: user_assigned_common_role_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY user_assigned_common_role
    ADD CONSTRAINT user_assigned_common_role_pkey PRIMARY KEY (user_assigned_common_role_uid);


--
-- TOC entry 2055 (class 2606 OID 25243)
-- Dependencies: 1651 1651 1651
-- Name: user_characteristic_value_characteristic_value_uid_key; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY user_characteristic_value
    ADD CONSTRAINT user_characteristic_value_characteristic_value_uid_key UNIQUE (characteristic_value_uid, user_uid);


--
-- TOC entry 2057 (class 2606 OID 25241)
-- Dependencies: 1651 1651
-- Name: user_characteristic_value_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY user_characteristic_value
    ADD CONSTRAINT user_characteristic_value_pkey PRIMARY KEY (user_characteristic_value_uid);


--
-- TOC entry 2027 (class 2606 OID 25058)
-- Dependencies: 1641 1641
-- Name: user_inactivation_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY inactivated_user
    ADD CONSTRAINT user_inactivation_pkey PRIMARY KEY (inactivated_user_uid);


--
-- TOC entry 2051 (class 2606 OID 25226)
-- Dependencies: 1650 1650 1650
-- Name: user_manual_group_membership_manual_group_uid_key; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY user_manual_group_membership
    ADD CONSTRAINT user_manual_group_membership_manual_group_uid_key UNIQUE (manual_group_uid, user_uid);


--
-- TOC entry 2053 (class 2606 OID 25224)
-- Dependencies: 1650 1650
-- Name: user_manual_group_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY user_manual_group_membership
    ADD CONSTRAINT user_manual_group_membership_pkey PRIMARY KEY (user_manual_group_membership_uid);


--
-- TOC entry 1993 (class 2606 OID 24891)
-- Dependencies: 1628 1628
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_uid);


--
-- TOC entry 1955 (class 2606 OID 24657)
-- Dependencies: 1611 1611
-- Name: validate_pkey; Type: CONSTRAINT; Schema: public; Owner: anubis; Tablespace: 
--

ALTER TABLE ONLY validate
    ADD CONSTRAINT validate_pkey PRIMARY KEY (id);


--
-- TOC entry 1947 (class 1259 OID 24631)
-- Dependencies: 1608
-- Name: fki_; Type: INDEX; Schema: public; Owner: anubis; Tablespace: 
--

CREATE INDEX fki_ ON supported_locale USING btree (locale_uid);


--
-- TOC entry 2087 (class 2606 OID 24859)
-- Dependencies: 1615 1958 1626
-- Name: administrative_role_role_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY administrative_role
    ADD CONSTRAINT administrative_role_role_uid_fkey FOREIGN KEY (role) REFERENCES role(role_uid);


--
-- TOC entry 2066 (class 2606 OID 25305)
-- Dependencies: 1609 1606 1952
-- Name: application_application_account_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY application
    ADD CONSTRAINT application_application_account_uid_fkey FOREIGN KEY (application_account) REFERENCES application_account(id);


--
-- TOC entry 2096 (class 2606 OID 24977)
-- Dependencies: 1634 1941 1606
-- Name: characteristic_application_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY characteristic
    ADD CONSTRAINT characteristic_application_uid_fkey FOREIGN KEY (application) REFERENCES application(id);


--
-- TOC entry 2097 (class 2606 OID 24990)
-- Dependencies: 1634 2010 1635
-- Name: characteristic_translation_characteristic_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY characteristic_translation
    ADD CONSTRAINT characteristic_translation_characteristic_uid_fkey FOREIGN KEY (characteristic) REFERENCES characteristic(id);


--
-- TOC entry 2099 (class 2606 OID 25018)
-- Dependencies: 2016 1637 1636
-- Name: characteristic_translation_characteristic_uid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY characteristic_value_translation
    ADD CONSTRAINT characteristic_translation_characteristic_uid_fkey1 FOREIGN KEY (characteristic_value_uid) REFERENCES characteristic_value(uid);


--
-- TOC entry 2098 (class 2606 OID 24995)
-- Dependencies: 1635 1607 1945
-- Name: characteristic_translation_locale_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY characteristic_translation
    ADD CONSTRAINT characteristic_translation_locale_uid_fkey FOREIGN KEY (locale) REFERENCES locale(locale_uid);


--
-- TOC entry 2100 (class 2606 OID 25023)
-- Dependencies: 1607 1945 1637
-- Name: characteristic_translation_locale_uid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY characteristic_value_translation
    ADD CONSTRAINT characteristic_translation_locale_uid_fkey1 FOREIGN KEY (locale_uid) REFERENCES locale(locale_uid);


--
-- TOC entry 2129 (class 2606 OID 25264)
-- Dependencies: 2016 1636 1652
-- Name: characterized_group_characteristi_characteristic_value_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY characterized_group_characteristic_value
    ADD CONSTRAINT characterized_group_characteristi_characteristic_value_uid_fkey FOREIGN KEY (characteristic_value_uid) REFERENCES characteristic_value(uid);


--
-- TOC entry 2128 (class 2606 OID 25259)
-- Dependencies: 2004 1632 1652
-- Name: characterized_group_characteristic_characterized_group_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY characterized_group_characteristic_value
    ADD CONSTRAINT characterized_group_characteristic_characterized_group_uid_fkey FOREIGN KEY (characterized_group_uid) REFERENCES characterized_group(characterized_group_uid);


--
-- TOC entry 2094 (class 2606 OID 24952)
-- Dependencies: 2000 1630 1632
-- Name: characterized_group_group_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY characterized_group
    ADD CONSTRAINT characterized_group_group_uid_fkey FOREIGN KEY (group_uid) REFERENCES "group"(group_uid);


--
-- TOC entry 2088 (class 2606 OID 24869)
-- Dependencies: 1958 1627 1615
-- Name: common_role_role_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY common_role
    ADD CONSTRAINT common_role_role_uid_fkey FOREIGN KEY (role_uid) REFERENCES role(role_uid);


--
-- TOC entry 2116 (class 2606 OID 25156)
-- Dependencies: 1645 1606 1941
-- Name: context_application_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY context
    ADD CONSTRAINT context_application_uid_fkey FOREIGN KEY (application_uid) REFERENCES application(id);


--
-- TOC entry 2120 (class 2606 OID 25181)
-- Dependencies: 2036 1647 1645
-- Name: context_translation_context_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY context_translation
    ADD CONSTRAINT context_translation_context_uid_fkey FOREIGN KEY (context_uid) REFERENCES context(context_uid);


--
-- TOC entry 2119 (class 2606 OID 25176)
-- Dependencies: 1647 1607 1945
-- Name: context_translation_locale_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY context_translation
    ADD CONSTRAINT context_translation_locale_uid_fkey FOREIGN KEY (locale_uid) REFERENCES locale(locale_uid);


--
-- TOC entry 2121 (class 2606 OID 25197)
-- Dependencies: 1648 1645 2036
-- Name: context_value_context_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY context_value
    ADD CONSTRAINT context_value_context_uid_fkey FOREIGN KEY (context_uid) REFERENCES context(context_uid);


--
-- TOC entry 2122 (class 2606 OID 25210)
-- Dependencies: 2046 1649 1648
-- Name: context_value_translation_context_value_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY context_value_translation
    ADD CONSTRAINT context_value_translation_context_value_uid_fkey FOREIGN KEY (context_value_uid) REFERENCES context_value(context_value_uid);


--
-- TOC entry 2123 (class 2606 OID 25215)
-- Dependencies: 1649 1607 1945
-- Name: context_value_translation_locale_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY context_value_translation
    ADD CONSTRAINT context_value_translation_locale_uid_fkey FOREIGN KEY (locale_uid) REFERENCES locale(locale_uid);


--
-- TOC entry 2091 (class 2606 OID 24923)
-- Dependencies: 1606 1630 1941
-- Name: group_application_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY "group"
    ADD CONSTRAINT group_application_uid_fkey FOREIGN KEY (application_uid) REFERENCES application(id);


--
-- TOC entry 2112 (class 2606 OID 25104)
-- Dependencies: 1643 1627 1990
-- Name: group_assigned_common_role_common_role_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY group_assigned_common_role
    ADD CONSTRAINT group_assigned_common_role_common_role_uid_fkey FOREIGN KEY (common_role_uid) REFERENCES common_role(common_role_uid);


--
-- TOC entry 2110 (class 2606 OID 25094)
-- Dependencies: 1630 1643 2000
-- Name: group_assigned_common_role_group_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY group_assigned_common_role
    ADD CONSTRAINT group_assigned_common_role_group_uid_fkey FOREIGN KEY (group_uid) REFERENCES "group"(group_uid);


--
-- TOC entry 2111 (class 2606 OID 25099)
-- Dependencies: 1954 1643 1611
-- Name: group_assigned_common_role_validate_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY group_assigned_common_role
    ADD CONSTRAINT group_assigned_common_role_validate_uid_fkey FOREIGN KEY (validate_uid) REFERENCES validate(id);


--
-- TOC entry 2092 (class 2606 OID 24937)
-- Dependencies: 1630 1631 2000
-- Name: group_translation_group_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY group_translation
    ADD CONSTRAINT group_translation_group_uid_fkey FOREIGN KEY (group_uid) REFERENCES "group"(group_uid);


--
-- TOC entry 2093 (class 2606 OID 24942)
-- Dependencies: 1607 1631 1945
-- Name: group_translation_locale_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY group_translation
    ADD CONSTRAINT group_translation_locale_uid_fkey FOREIGN KEY (locale_uid) REFERENCES locale(locale_uid);


--
-- TOC entry 2103 (class 2606 OID 25295)
-- Dependencies: 2000 1630 1640
-- Name: inactivated_group_group_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY inactivated_group
    ADD CONSTRAINT inactivated_group_group_uid_fkey FOREIGN KEY (group_uid) REFERENCES "group"(group_uid);


--
-- TOC entry 2104 (class 2606 OID 25300)
-- Dependencies: 2020 1640 1638
-- Name: inactivated_group_inactivation_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY inactivated_group
    ADD CONSTRAINT inactivated_group_inactivation_uid_fkey FOREIGN KEY (inactivation_uid) REFERENCES inactivation(inactivation_uid);


--
-- TOC entry 2102 (class 2606 OID 25046)
-- Dependencies: 1638 1639 2020
-- Name: inactivation_translation_inactivation_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY inactivation_translation
    ADD CONSTRAINT inactivation_translation_inactivation_uid_fkey FOREIGN KEY (inactivation_uid) REFERENCES inactivation(inactivation_uid);


--
-- TOC entry 2101 (class 2606 OID 25041)
-- Dependencies: 1639 1607 1945
-- Name: inactivation_translation_locale_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY inactivation_translation
    ADD CONSTRAINT inactivation_translation_locale_uid_fkey FOREIGN KEY (locale_uid) REFERENCES locale(locale_uid);


--
-- TOC entry 2095 (class 2606 OID 24962)
-- Dependencies: 2000 1633 1630
-- Name: manual_group_group_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY manual_group
    ADD CONSTRAINT manual_group_group_uid_fkey FOREIGN KEY (group_uid) REFERENCES "group"(group_uid);


--
-- TOC entry 2079 (class 2606 OID 24792)
-- Dependencies: 1622 1607 1945
-- Name: operation_translation_locale_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY operation_translation
    ADD CONSTRAINT operation_translation_locale_uid_fkey FOREIGN KEY (locale_uid) REFERENCES locale(locale_uid);


--
-- TOC entry 2080 (class 2606 OID 24797)
-- Dependencies: 1976 1621 1622
-- Name: operation_translation_operation_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY operation_translation
    ADD CONSTRAINT operation_translation_operation_uid_fkey FOREIGN KEY (operation_uid) REFERENCES operation(operation_uid);


--
-- TOC entry 2084 (class 2606 OID 24831)
-- Dependencies: 1980 1624 1623
-- Name: permission_conflict_permission_conflited_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY permission_conflict
    ADD CONSTRAINT permission_conflict_permission_conflited_uid_fkey FOREIGN KEY (permission_conflited_uid) REFERENCES permission(permission_uid);


--
-- TOC entry 2083 (class 2606 OID 24826)
-- Dependencies: 1623 1980 1624
-- Name: permission_conflict_permission_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY permission_conflict
    ADD CONSTRAINT permission_conflict_permission_uid_fkey FOREIGN KEY (permission_uid) REFERENCES permission(permission_uid);


--
-- TOC entry 2085 (class 2606 OID 24844)
-- Dependencies: 1625 1945 1607
-- Name: permission_conflict_translation_locale_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY permission_conflict_translation
    ADD CONSTRAINT permission_conflict_translation_locale_uid_fkey FOREIGN KEY (locale_uid) REFERENCES locale(locale_uid);


--
-- TOC entry 2086 (class 2606 OID 24849)
-- Dependencies: 1625 1984 1624
-- Name: permission_conflict_translation_permission_conflict_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY permission_conflict_translation
    ADD CONSTRAINT permission_conflict_translation_permission_conflict_uid_fkey FOREIGN KEY (permission_conflict_uid) REFERENCES permission_conflict(permission_conflict_uid);


--
-- TOC entry 2118 (class 2606 OID 25163)
-- Dependencies: 1646 1645 2036
-- Name: permission_context_context_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY permission_context
    ADD CONSTRAINT permission_context_context_uid_fkey FOREIGN KEY (context_uid) REFERENCES context(context_uid);


--
-- TOC entry 2117 (class 2606 OID 25149)
-- Dependencies: 1980 1646 1623
-- Name: permission_context_permission_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY permission_context
    ADD CONSTRAINT permission_context_permission_uid_fkey FOREIGN KEY (permission_uid) REFERENCES permission(permission_uid);


--
-- TOC entry 2082 (class 2606 OID 24814)
-- Dependencies: 1976 1623 1621
-- Name: permission_operation_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_operation_uid_fkey FOREIGN KEY (operation_uid) REFERENCES operation(operation_uid);


--
-- TOC entry 2081 (class 2606 OID 24809)
-- Dependencies: 1964 1623 1617
-- Name: permission_resource_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_resource_uid_fkey FOREIGN KEY (resource_uid) REFERENCES resouce(resource_uid);


--
-- TOC entry 2074 (class 2606 OID 24720)
-- Dependencies: 1941 1606 1617
-- Name: resouce_application_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY resouce
    ADD CONSTRAINT resouce_application_uid_fkey FOREIGN KEY (application_uid) REFERENCES application(id);


--
-- TOC entry 2073 (class 2606 OID 24715)
-- Dependencies: 1954 1617 1611
-- Name: resouce_validate_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY resouce
    ADD CONSTRAINT resouce_validate_uid_fkey FOREIGN KEY (validate_uid) REFERENCES validate(id);


--
-- TOC entry 2076 (class 2606 OID 24739)
-- Dependencies: 1945 1607 1618
-- Name: resource_translation_locale_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY resource_translation
    ADD CONSTRAINT resource_translation_locale_uid_fkey FOREIGN KEY (locale_uid) REFERENCES locale(locale_uid);


--
-- TOC entry 2075 (class 2606 OID 24734)
-- Dependencies: 1618 1964 1617
-- Name: resource_translation_resource_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY resource_translation
    ADD CONSTRAINT resource_translation_resource_uid_fkey FOREIGN KEY (resource_uid) REFERENCES resouce(resource_uid);


--
-- TOC entry 2078 (class 2606 OID 24767)
-- Dependencies: 1620 1945 1607
-- Name: resource_type_translation_locale_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY resource_type_translation
    ADD CONSTRAINT resource_type_translation_locale_uid_fkey FOREIGN KEY (locale_uid) REFERENCES locale(locale_uid);


--
-- TOC entry 2077 (class 2606 OID 24762)
-- Dependencies: 1970 1619 1620
-- Name: resource_type_translation_resource_type_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY resource_type_translation
    ADD CONSTRAINT resource_type_translation_resource_type_uid_fkey FOREIGN KEY (resource_type_uid) REFERENCES resource_type(resource_type_uid);


--
-- TOC entry 2069 (class 2606 OID 24677)
-- Dependencies: 1615 1941 1606
-- Name: role_application_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_application_uid_fkey FOREIGN KEY (application_uid) REFERENCES application(id);


--
-- TOC entry 2072 (class 2606 OID 24700)
-- Dependencies: 1945 1616 1607
-- Name: role_translation_locale_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY role_translation
    ADD CONSTRAINT role_translation_locale_uid_fkey FOREIGN KEY (locale_uid) REFERENCES locale(locale_uid);


--
-- TOC entry 2071 (class 2606 OID 24695)
-- Dependencies: 1616 1958 1615
-- Name: role_translation_role_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY role_translation
    ADD CONSTRAINT role_translation_role_uid_fkey FOREIGN KEY (role_uid) REFERENCES role(role_uid);


--
-- TOC entry 2070 (class 2606 OID 24682)
-- Dependencies: 1954 1611 1615
-- Name: role_validate_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_validate_uid_fkey FOREIGN KEY (validate_uid) REFERENCES validate(id);


--
-- TOC entry 2067 (class 2606 OID 24621)
-- Dependencies: 1608 1941 1606
-- Name: supported_locale_application_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY supported_locale
    ADD CONSTRAINT supported_locale_application_uid_fkey FOREIGN KEY (application_uid) REFERENCES application(id);


--
-- TOC entry 2068 (class 2606 OID 24626)
-- Dependencies: 1945 1608 1607
-- Name: supported_locale_locale_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY supported_locale
    ADD CONSTRAINT supported_locale_locale_uid_fkey FOREIGN KEY (locale_uid) REFERENCES locale(locale_uid);


--
-- TOC entry 2089 (class 2606 OID 24902)
-- Dependencies: 1629 1628 1992
-- Name: user_account_user_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY user_account
    ADD CONSTRAINT user_account_user_uid_fkey FOREIGN KEY (user_uid) REFERENCES "user"(user_uid);


--
-- TOC entry 2090 (class 2606 OID 24907)
-- Dependencies: 1611 1954 1629
-- Name: user_account_validate_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY user_account
    ADD CONSTRAINT user_account_validate_uid_fkey FOREIGN KEY (validate_uid) REFERENCES validate(id);


--
-- TOC entry 2113 (class 2606 OID 25114)
-- Dependencies: 1988 1644 1626
-- Name: user_assigned_administrative_role_administrative_role_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY user_assigned_administrative_role
    ADD CONSTRAINT user_assigned_administrative_role_administrative_role_uid_fkey FOREIGN KEY (administrative_role_uid) REFERENCES administrative_role(id);


--
-- TOC entry 2114 (class 2606 OID 25119)
-- Dependencies: 1644 1628 1992
-- Name: user_assigned_administrative_role_user_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY user_assigned_administrative_role
    ADD CONSTRAINT user_assigned_administrative_role_user_uid_fkey FOREIGN KEY (user_uid) REFERENCES "user"(user_uid);


--
-- TOC entry 2115 (class 2606 OID 25124)
-- Dependencies: 1611 1954 1644
-- Name: user_assigned_administrative_role_validate_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY user_assigned_administrative_role
    ADD CONSTRAINT user_assigned_administrative_role_validate_uid_fkey FOREIGN KEY (validate_uid) REFERENCES validate(id);


--
-- TOC entry 2108 (class 2606 OID 25079)
-- Dependencies: 1627 1990 1642
-- Name: user_assigned_common_role_common_role_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY user_assigned_common_role
    ADD CONSTRAINT user_assigned_common_role_common_role_uid_fkey FOREIGN KEY (common_role_uid) REFERENCES common_role(common_role_uid);


--
-- TOC entry 2132 (class 2606 OID 25288)
-- Dependencies: 2028 1642 1653
-- Name: user_assigned_common_role_con_user_assigned_common_role_ui_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY user_assigned_common_role_contextualization
    ADD CONSTRAINT user_assigned_common_role_con_user_assigned_common_role_ui_fkey FOREIGN KEY (user_assigned_common_role_uid) REFERENCES user_assigned_common_role(user_assigned_common_role_uid);


--
-- TOC entry 2131 (class 2606 OID 25283)
-- Dependencies: 2046 1653 1648
-- Name: user_assigned_common_role_contextualizat_context_value_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY user_assigned_common_role_contextualization
    ADD CONSTRAINT user_assigned_common_role_contextualizat_context_value_uid_fkey FOREIGN KEY (context_value_uid) REFERENCES context_value(context_value_uid);


--
-- TOC entry 2130 (class 2606 OID 25278)
-- Dependencies: 1623 1980 1653
-- Name: user_assigned_common_role_contextualization_permission_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY user_assigned_common_role_contextualization
    ADD CONSTRAINT user_assigned_common_role_contextualization_permission_uid_fkey FOREIGN KEY (permission_uid) REFERENCES permission(permission_uid);


--
-- TOC entry 2107 (class 2606 OID 25074)
-- Dependencies: 1642 1628 1992
-- Name: user_assigned_common_role_user_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY user_assigned_common_role
    ADD CONSTRAINT user_assigned_common_role_user_uid_fkey FOREIGN KEY (user_uid) REFERENCES "user"(user_uid);


--
-- TOC entry 2109 (class 2606 OID 25084)
-- Dependencies: 1611 1954 1642
-- Name: user_assigned_common_role_validate_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY user_assigned_common_role
    ADD CONSTRAINT user_assigned_common_role_validate_uid_fkey FOREIGN KEY (validate_uid) REFERENCES validate(id);


--
-- TOC entry 2126 (class 2606 OID 25244)
-- Dependencies: 1636 2016 1651
-- Name: user_characteristic_value_characteristic_value_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY user_characteristic_value
    ADD CONSTRAINT user_characteristic_value_characteristic_value_uid_fkey FOREIGN KEY (characteristic_value_uid) REFERENCES characteristic_value(uid);


--
-- TOC entry 2127 (class 2606 OID 25249)
-- Dependencies: 1628 1651 1992
-- Name: user_characteristic_value_user_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY user_characteristic_value
    ADD CONSTRAINT user_characteristic_value_user_uid_fkey FOREIGN KEY (user_uid) REFERENCES "user"(user_uid);


--
-- TOC entry 2106 (class 2606 OID 25064)
-- Dependencies: 1641 1638 2020
-- Name: user_inactivation_inactivation_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY inactivated_user
    ADD CONSTRAINT user_inactivation_inactivation_uid_fkey FOREIGN KEY (inactivation_uid) REFERENCES inactivation(inactivation_uid);


--
-- TOC entry 2105 (class 2606 OID 25059)
-- Dependencies: 1628 1641 1992
-- Name: user_inactivation_user_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY inactivated_user
    ADD CONSTRAINT user_inactivation_user_uid_fkey FOREIGN KEY (user_uid) REFERENCES "user"(user_uid);


--
-- TOC entry 2125 (class 2606 OID 25232)
-- Dependencies: 2006 1650 1633
-- Name: user_manual_group_membership_manual_group_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY user_manual_group_membership
    ADD CONSTRAINT user_manual_group_membership_manual_group_uid_fkey FOREIGN KEY (manual_group_uid) REFERENCES manual_group(manual_group_uid);


--
-- TOC entry 2124 (class 2606 OID 25227)
-- Dependencies: 1628 1650 1992
-- Name: user_manual_group_membership_user_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anubis
--

ALTER TABLE ONLY user_manual_group_membership
    ADD CONSTRAINT user_manual_group_membership_user_uid_fkey FOREIGN KEY (user_uid) REFERENCES "user"(user_uid);


--
-- TOC entry 2181 (class 0 OID 0)
-- Dependencies: 3
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2010-04-09 00:11:53

--
-- PostgreSQL database dump complete
--

