--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17 (Homebrew)
-- Dumped by pg_dump version 14.17 (Homebrew)

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: xnl_admin
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO xnl_admin;

--
-- Name: chat_messages; Type: TABLE; Schema: public; Owner: xnl_admin
--

CREATE TABLE public.chat_messages (
    id integer NOT NULL,
    sender_id integer NOT NULL,
    receiver_id integer NOT NULL,
    message text NOT NULL,
    "timestamp" timestamp without time zone
);


ALTER TABLE public.chat_messages OWNER TO xnl_admin;

--
-- Name: chat_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: xnl_admin
--

CREATE SEQUENCE public.chat_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_messages_id_seq OWNER TO xnl_admin;

--
-- Name: chat_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnl_admin
--

ALTER SEQUENCE public.chat_messages_id_seq OWNED BY public.chat_messages.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: xnl_admin
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.clients OWNER TO xnl_admin;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: xnl_admin
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO xnl_admin;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnl_admin
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: contracts; Type: TABLE; Schema: public; Owner: xnl_admin
--

CREATE TABLE public.contracts (
    id integer NOT NULL,
    client_id integer NOT NULL,
    freelancer_id integer NOT NULL,
    contract_details text NOT NULL,
    is_signed boolean,
    "timestamp" timestamp without time zone
);


ALTER TABLE public.contracts OWNER TO xnl_admin;

--
-- Name: contracts_id_seq; Type: SEQUENCE; Schema: public; Owner: xnl_admin
--

CREATE SEQUENCE public.contracts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contracts_id_seq OWNER TO xnl_admin;

--
-- Name: contracts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnl_admin
--

ALTER SEQUENCE public.contracts_id_seq OWNED BY public.contracts.id;


--
-- Name: file_uploads; Type: TABLE; Schema: public; Owner: xnl_admin
--

CREATE TABLE public.file_uploads (
    id integer NOT NULL,
    sender_id integer NOT NULL,
    receiver_id integer NOT NULL,
    file_path character varying NOT NULL,
    "timestamp" timestamp without time zone
);


ALTER TABLE public.file_uploads OWNER TO xnl_admin;

--
-- Name: file_uploads_id_seq; Type: SEQUENCE; Schema: public; Owner: xnl_admin
--

CREATE SEQUENCE public.file_uploads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.file_uploads_id_seq OWNER TO xnl_admin;

--
-- Name: file_uploads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnl_admin
--

ALTER SEQUENCE public.file_uploads_id_seq OWNED BY public.file_uploads.id;


--
-- Name: freelancers; Type: TABLE; Schema: public; Owner: xnl_admin
--

CREATE TABLE public.freelancers (
    id integer NOT NULL,
    name character varying NOT NULL,
    skills character varying[] DEFAULT '{}'::character varying[]
);


ALTER TABLE public.freelancers OWNER TO xnl_admin;

--
-- Name: freelancers_id_seq; Type: SEQUENCE; Schema: public; Owner: xnl_admin
--

CREATE SEQUENCE public.freelancers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.freelancers_id_seq OWNER TO xnl_admin;

--
-- Name: freelancers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnl_admin
--

ALTER SEQUENCE public.freelancers_id_seq OWNED BY public.freelancers.id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: xnl_admin
--

CREATE TABLE public.jobs (
    id integer NOT NULL,
    title character varying NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.jobs OWNER TO xnl_admin;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: xnl_admin
--

CREATE SEQUENCE public.jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO xnl_admin;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnl_admin
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: proposals; Type: TABLE; Schema: public; Owner: xnl_admin
--

CREATE TABLE public.proposals (
    id integer NOT NULL,
    freelancer_id integer,
    job_id integer,
    proposed_budget integer NOT NULL,
    proposed_timeline character varying NOT NULL,
    status character varying
);


ALTER TABLE public.proposals OWNER TO xnl_admin;

--
-- Name: proposals_id_seq; Type: SEQUENCE; Schema: public; Owner: xnl_admin
--

CREATE SEQUENCE public.proposals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proposals_id_seq OWNER TO xnl_admin;

--
-- Name: proposals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnl_admin
--

ALTER SEQUENCE public.proposals_id_seq OWNED BY public.proposals.id;


--
-- Name: chat_messages id; Type: DEFAULT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.chat_messages ALTER COLUMN id SET DEFAULT nextval('public.chat_messages_id_seq'::regclass);


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: contracts id; Type: DEFAULT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.contracts ALTER COLUMN id SET DEFAULT nextval('public.contracts_id_seq'::regclass);


--
-- Name: file_uploads id; Type: DEFAULT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.file_uploads ALTER COLUMN id SET DEFAULT nextval('public.file_uploads_id_seq'::regclass);


--
-- Name: freelancers id; Type: DEFAULT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.freelancers ALTER COLUMN id SET DEFAULT nextval('public.freelancers_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: proposals id; Type: DEFAULT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.proposals ALTER COLUMN id SET DEFAULT nextval('public.proposals_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: xnl_admin
--

COPY public.alembic_version (version_num) FROM stdin;
d1c7606ce3b2
\.


--
-- Data for Name: chat_messages; Type: TABLE DATA; Schema: public; Owner: xnl_admin
--

COPY public.chat_messages (id, sender_id, receiver_id, message, "timestamp") FROM stdin;
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: xnl_admin
--

COPY public.clients (id, name) FROM stdin;
\.


--
-- Data for Name: contracts; Type: TABLE DATA; Schema: public; Owner: xnl_admin
--

COPY public.contracts (id, client_id, freelancer_id, contract_details, is_signed, "timestamp") FROM stdin;
\.


--
-- Data for Name: file_uploads; Type: TABLE DATA; Schema: public; Owner: xnl_admin
--

COPY public.file_uploads (id, sender_id, receiver_id, file_path, "timestamp") FROM stdin;
\.


--
-- Data for Name: freelancers; Type: TABLE DATA; Schema: public; Owner: xnl_admin
--

COPY public.freelancers (id, name, skills) FROM stdin;
1	John Doe	{}
2	John Doe	{}
3	John DOD	{}
4	John DOD	{}
5	John Doe	{}
6	John Doe	{}
7	John Doe	{}
8	John Doe	{}
9	John Doe	{}
10	John Doe	{}
11	John Doe	{}
12	John Doe	{}
13	John Doe	{}
14	John Doooggggggg	{}
15	John Doe	{}
16	John Doe	{}
17	John Doe	{}
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: xnl_admin
--

COPY public.jobs (id, title, description) FROM stdin;
1	Full Stack Developer	Looking for an experienced React & FastAPI developer.
2	Full Stack Developer	Looking for an experienced React & FastAPI developer.
3	Full Stack Developer	Looking for an experienced React & FastAPI developer.
4	SDE	looking for SDE
5	Video Editor	Looking for an experienced Video editor.
6	Photographer 	Looking for a skilled photographer.
7	Data Analyst	Looking for an Data Analyst.
8	Data Science	Looking for skilled data science personals
9	string	string
\.


--
-- Data for Name: proposals; Type: TABLE DATA; Schema: public; Owner: xnl_admin
--

COPY public.proposals (id, freelancer_id, job_id, proposed_budget, proposed_timeline, status) FROM stdin;
\.


--
-- Name: chat_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnl_admin
--

SELECT pg_catalog.setval('public.chat_messages_id_seq', 1, false);


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnl_admin
--

SELECT pg_catalog.setval('public.clients_id_seq', 1, false);


--
-- Name: contracts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnl_admin
--

SELECT pg_catalog.setval('public.contracts_id_seq', 1, false);


--
-- Name: file_uploads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnl_admin
--

SELECT pg_catalog.setval('public.file_uploads_id_seq', 1, false);


--
-- Name: freelancers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnl_admin
--

SELECT pg_catalog.setval('public.freelancers_id_seq', 17, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnl_admin
--

SELECT pg_catalog.setval('public.jobs_id_seq', 9, true);


--
-- Name: proposals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnl_admin
--

SELECT pg_catalog.setval('public.proposals_id_seq', 1, false);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: chat_messages chat_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_pkey PRIMARY KEY (id);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: contracts contracts_pkey; Type: CONSTRAINT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (id);


--
-- Name: file_uploads file_uploads_pkey; Type: CONSTRAINT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.file_uploads
    ADD CONSTRAINT file_uploads_pkey PRIMARY KEY (id);


--
-- Name: freelancers freelancers_pkey; Type: CONSTRAINT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.freelancers
    ADD CONSTRAINT freelancers_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: proposals proposals_pkey; Type: CONSTRAINT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.proposals
    ADD CONSTRAINT proposals_pkey PRIMARY KEY (id);


--
-- Name: ix_chat_messages_id; Type: INDEX; Schema: public; Owner: xnl_admin
--

CREATE INDEX ix_chat_messages_id ON public.chat_messages USING btree (id);


--
-- Name: ix_clients_id; Type: INDEX; Schema: public; Owner: xnl_admin
--

CREATE INDEX ix_clients_id ON public.clients USING btree (id);


--
-- Name: ix_contracts_id; Type: INDEX; Schema: public; Owner: xnl_admin
--

CREATE INDEX ix_contracts_id ON public.contracts USING btree (id);


--
-- Name: ix_file_uploads_id; Type: INDEX; Schema: public; Owner: xnl_admin
--

CREATE INDEX ix_file_uploads_id ON public.file_uploads USING btree (id);


--
-- Name: ix_freelancers_id; Type: INDEX; Schema: public; Owner: xnl_admin
--

CREATE INDEX ix_freelancers_id ON public.freelancers USING btree (id);


--
-- Name: ix_jobs_id; Type: INDEX; Schema: public; Owner: xnl_admin
--

CREATE INDEX ix_jobs_id ON public.jobs USING btree (id);


--
-- Name: ix_proposals_id; Type: INDEX; Schema: public; Owner: xnl_admin
--

CREATE INDEX ix_proposals_id ON public.proposals USING btree (id);


--
-- Name: chat_messages chat_messages_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.clients(id);


--
-- Name: chat_messages chat_messages_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.freelancers(id);


--
-- Name: contracts contracts_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: contracts contracts_freelancer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_freelancer_id_fkey FOREIGN KEY (freelancer_id) REFERENCES public.freelancers(id);


--
-- Name: file_uploads file_uploads_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.file_uploads
    ADD CONSTRAINT file_uploads_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.clients(id);


--
-- Name: file_uploads file_uploads_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.file_uploads
    ADD CONSTRAINT file_uploads_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.freelancers(id);


--
-- Name: proposals proposals_freelancer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.proposals
    ADD CONSTRAINT proposals_freelancer_id_fkey FOREIGN KEY (freelancer_id) REFERENCES public.freelancers(id);


--
-- Name: proposals proposals_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: xnl_admin
--

ALTER TABLE ONLY public.proposals
    ADD CONSTRAINT proposals_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.jobs(id);


--
-- PostgreSQL database dump complete
--

