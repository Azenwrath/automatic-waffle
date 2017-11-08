--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: azenwrath
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO azenwrath;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: azenwrath
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO azenwrath;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: azenwrath
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: azenwrath
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO azenwrath;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: azenwrath
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO azenwrath;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: azenwrath
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: azenwrath
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO azenwrath;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: azenwrath
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO azenwrath;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: azenwrath
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: azenwrath
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO azenwrath;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: azenwrath
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO azenwrath;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: azenwrath
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO azenwrath;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: azenwrath
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: azenwrath
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO azenwrath;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: azenwrath
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: azenwrath
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO azenwrath;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: azenwrath
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO azenwrath;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: azenwrath
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: azenwrath
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO azenwrath;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: azenwrath
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO azenwrath;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: azenwrath
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: azenwrath
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO azenwrath;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: azenwrath
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO azenwrath;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: azenwrath
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: azenwrath
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO azenwrath;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: azenwrath
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO azenwrath;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: azenwrath
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: azenwrath
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO azenwrath;

--
-- Name: tweets_tweet; Type: TABLE; Schema: public; Owner: azenwrath
--

CREATE TABLE tweets_tweet (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    text character varying(255) NOT NULL,
    created_at timestamp with time zone,
    label character varying(10),
    neg double precision,
    neutral double precision,
    pos double precision,
    tweet_id character varying(255) NOT NULL
);


ALTER TABLE tweets_tweet OWNER TO azenwrath;

--
-- Name: tweets_tweet_id_seq; Type: SEQUENCE; Schema: public; Owner: azenwrath
--

CREATE SEQUENCE tweets_tweet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tweets_tweet_id_seq OWNER TO azenwrath;

--
-- Name: tweets_tweet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: azenwrath
--

ALTER SEQUENCE tweets_tweet_id_seq OWNED BY tweets_tweet.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: tweets_tweet id; Type: DEFAULT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY tweets_tweet ALTER COLUMN id SET DEFAULT nextval('tweets_tweet_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: azenwrath
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: azenwrath
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: azenwrath
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: azenwrath
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: azenwrath
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add tweet	7	add_tweet
20	Can change tweet	7	change_tweet
21	Can delete tweet	7	delete_tweet
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: azenwrath
--

SELECT pg_catalog.setval('auth_permission_id_seq', 21, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: azenwrath
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$36000$1c7EBUvvCZkl$3bbM+nxp8J3Ob8T0umFH2jkHPgs9T92ajZhBxuxwE9k=	2017-11-06 22:23:31.706731+00	t	Dana				t	t	2017-11-02 17:56:48.158996+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: azenwrath
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: azenwrath
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: azenwrath
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: azenwrath
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: azenwrath
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: azenwrath
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-11-02 18:10:25.866781+00	15	RT @ChefsSmokeAlot: @iJustwannafeedU(tw) :: \nThink	3		7	1
2	2017-11-02 18:10:25.874173+00	14	@jakeowen guess what? I'm at #wafflehouse 😁	3		7	1
3	2017-11-02 18:10:25.876592+00	13	RT @mererow: "These are sexual predators... I was 	3		7	1
4	2017-11-02 18:10:25.878834+00	12	@DonnieWahlberg what's your favorite meal to order	3		7	1
5	2017-11-02 18:10:25.881068+00	11	Breakfast for dinner - Pecan waffle, 2 eggs over m	3		7	1
6	2017-11-02 18:10:25.883429+00	10	#wafflehouse https://t.co/vqMO1O1Ug3	3		7	1
7	2017-11-02 18:10:25.885713+00	9	RT @joeymcintyre: Prettiest #WaffleHouse I've ever	3		7	1
8	2017-11-02 18:10:25.888915+00	8	Being #Weird at #wafflehouse just cuz XD https://t	3		7	1
9	2017-11-02 18:10:25.892605+00	7	RT @docdhj: Jesse: Awesome Shark costume !  I have	3		7	1
10	2017-11-02 18:10:25.897438+00	6	In Waffle House like it's whatever dawg #clayco #w	3		7	1
11	2017-11-02 18:10:25.902373+00	5	#WaffleHouse put bleach in woman's drink, lawsuit 	3		7	1
12	2017-11-02 18:10:25.90787+00	4	RT @MISSHAIRDOCTOR1: #WaffleHouse put bleach in wo	3		7	1
13	2017-11-02 18:10:25.913699+00	3	Observed how waffles are made and relished them so	3		7	1
14	2017-11-02 18:10:25.919123+00	2	Because it’s almost that time again #wafflehouse h	3		7	1
15	2017-11-02 18:10:25.924537+00	1	At #wafflehouse	3		7	1
16	2017-11-02 18:39:29.621318+00	1	RT @ChefsSmokeAlot: @iJustwannafeedU(tw) :: \nThink	3		7	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: azenwrath
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 16, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: azenwrath
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	tweets	tweet
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: azenwrath
--

SELECT pg_catalog.setval('django_content_type_id_seq', 7, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: azenwrath
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-11-02 17:55:47.243427+00
2	auth	0001_initial	2017-11-02 17:55:47.452389+00
3	admin	0001_initial	2017-11-02 17:55:47.514156+00
4	admin	0002_logentry_remove_auto_add	2017-11-02 17:55:47.542739+00
5	contenttypes	0002_remove_content_type_name	2017-11-02 17:55:47.566159+00
6	auth	0002_alter_permission_name_max_length	2017-11-02 17:55:47.574081+00
7	auth	0003_alter_user_email_max_length	2017-11-02 17:55:47.585193+00
8	auth	0004_alter_user_username_opts	2017-11-02 17:55:47.594033+00
9	auth	0005_alter_user_last_login_null	2017-11-02 17:55:47.620855+00
10	auth	0006_require_contenttypes_0002	2017-11-02 17:55:47.625216+00
11	auth	0007_alter_validators_add_error_messages	2017-11-02 17:55:47.636418+00
12	auth	0008_alter_user_username_max_length	2017-11-02 17:55:47.656108+00
13	sessions	0001_initial	2017-11-02 17:55:47.688487+00
14	tweets	0001_initial	2017-11-02 17:55:47.715583+00
15	tweets	0002_remove_tweet_created_at	2017-11-02 17:55:47.731421+00
16	tweets	0003_auto_20171030_1846	2017-11-02 17:55:47.782593+00
17	tweets	0004_auto_20171102_1755	2017-11-02 17:55:47.812773+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: azenwrath
--

SELECT pg_catalog.setval('django_migrations_id_seq', 17, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: azenwrath
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
lrlauk4iyo6qy945c2tygw9dktjsgpeu	ZTBlYjRiMDRiYWFmNWRiMmU3OGI0MjhlNjM4MTViMGU3MDg4ZmE2MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZmM3NjdhYzU0YzM1NTY5OTczZjAwNjMyNTJkMjJkYjgzYjk3OWI3In0=	2017-11-16 17:57:03.817485+00
d0f8r79a77jojuz77zi905wb4e0dyzwm	ZTBlYjRiMDRiYWFmNWRiMmU3OGI0MjhlNjM4MTViMGU3MDg4ZmE2MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZmM3NjdhYzU0YzM1NTY5OTczZjAwNjMyNTJkMjJkYjgzYjk3OWI3In0=	2017-11-20 22:23:31.710755+00
\.


--
-- Data for Name: tweets_tweet; Type: TABLE DATA; Schema: public; Owner: azenwrath
--

COPY tweets_tweet (id, username, text, created_at, label, neg, neutral, pos, tweet_id) FROM stdin;
1	QDOTDAVIS	#Late #Breakfast wafflehouse\n#wafflehouse @ Waffle House https://t.co/RshoG3EvGI	2017-10-27 17:14:34+00	neutral	0.638105309588056335	0.583924308817543203	0.361894690411943665	923961130455793665
2	BettaB_DeVinchi	I just seen a #Cookout definitely eating there later for now #Wafflehouse 😋	2017-10-27 16:42:42+00	pos	0.30202536686076642	0.311664021061044683	0.69797463313923358	923953111030517761
3	djplugg	RT @YungDiDaPrince: I been calling #WaffleHouse For The last hour and ain’t nobody picked up the phone🤔 tell me why I pull up and see this…	2017-10-27 16:41:41+00	neg	0.796429352069110918	0.313639424059871608	0.203570647930889082	923952855001763840
4	danisaacs	It's (wa)Fall, y'all!  #WaffleHouse https://t.co/n0hyxBohOW	2017-10-27 13:51:38+00	neg	0.558289702591429071	0.381483393039406427	0.441710297408570984	923910061289889792
5	mbtmom2000	RT @Garysarratt: Thoughts for the real world: when dressing for #WaffleHouse, wear something blood, grease and vomit won’t ruin, but still…	2017-10-27 12:28:01+00	neutral	0.493206391074644257	0.76496980129121217	0.506793608925355743	923889017413947392
6	TheFoodieFreak	Nutella Waffle at The Belgian Waffle Co.🖤\n@belgianwaffleco #waffle #wafflehouse #belgianwaffle… https://t.co/Ax6AeH7fOd	2017-10-27 12:25:22+00	pos	0.475165339988844138	0.454119121202196829	0.524834660011155862	923888350448140288
7	Garysarratt	Thoughts for the real world: when dressing for #WaffleHouse, wear something blood, grease and vomit won’t ruin, but still looks good on tv.	2017-10-27 12:24:24+00	neg	0.589586570229221119	0.408411342198253813	0.410413429770778937	923888107283349504
8	TREVORALLSTAR	#You can’t Come #downsouth without going to the #wafflehouse @ Ponderosa Steak House https://t.co/zvnbCXr9Vb	2017-10-27 11:10:13+00	neg	0.531585309898189418	0.383018880471626577	0.468414690101810582	923869437161361408
9	JustinRichey13	Brushed under the rug, like I said #wafflehouse	2017-10-27 10:54:21+00	neg	0.592402879075942579	0.314128321995432003	0.407597120924057477	923865447564443650
10	SephyKillEm	RT @YungDiDaPrince: I been calling #WaffleHouse For The last hour and ain’t nobody picked up the phone🤔 tell me why I pull up and see this…	2017-10-27 03:46:38+00	neg	0.796429352069110918	0.313639424059871608	0.203570647930889082	923757805840068611
11	YungDiDaPrince	I been calling #WaffleHouse For The last hour and ain’t nobody picked up the phone🤔 tell me why I pull up and see t… https://t.co/8dqpImoHxb	2017-10-27 03:43:54+00	neg	0.803791760244695341	0.315557016181273575	0.196208239755304659	923757120457146368
12	PITTSBURGHGRL	@DonnieWahlberg @jordanknight #memories #wafflehouse #dirtywaffles https://t.co/Ns3lNQTgTf	2017-10-27 03:07:51+00	neutral	0.47480417210929593	0.625708115400968601	0.52519582789070407	923748048341295105
13	LoriAMcFarlane	After two trips to Walmart, a trip to Academy and a trip to the Halloween store, it's #WaffleHouse for dinner.… https://t.co/6wkkRsj9jd	2017-10-27 00:42:31+00	neutral	0.536291867015894597	0.849367583819810257	0.463708132984105403	923711472533848069
14	DSterlingDavis	This is your fault #blamebirkey @JAbirkeyLTD #wafflehouse #delight https://t.co/Y720FlRJ5g	2017-10-27 00:21:26+00	pos	0.417062477432708745	0.341021835677713048	0.582937522567291255	923706167641096192
15	AaronCPep	#LifeGoal : made it onto the work corkboard.  And yes, I'm always repping the OG #wafflehouse . https://t.co/0ievo1F5Np	2017-10-26 17:48:09+00	pos	0.401613595537375856	0.336020585269754424	0.598386404462624144	923607191923302400
16	Renardcomedy	Outside of my family, @WaffleHouse is the only place I trust to handle my Grits! #Grits #WaffleHouse #Love	2017-10-31 16:36:50+00	neg	0.625054623644306973	0.478547903644083228	0.374945376355693027	925401186420822016
17	BUCKSKIBANUTSKI	Meanwhile in #WaffleHouse can i please get a waffle pleaseeeeeee 😂😂😂😂😂😂😂😂😂#Lmao #CatFight https://t.co/vRAQEaVdO2	2017-10-31 16:25:38+00	neutral	0.61618528154258323	0.557798304797275879	0.383814718457416715	925398368729395200
18	Jennerz21	@WaffleHouse Happy Halloween! Wish we had #wafflehouse in #Iowa ❤🎃 https://t.co/izPE7pNoYW	2017-10-31 15:53:34+00	pos	0.400389911710710367	0.0866769511070600157	0.599610088289289633	925390299081437185
19	KelleyII	Overheard at #WaffleHouse: “Why do they call them donut holes? They don’t even have holes in them.”\nWe are doomed.	2017-10-31 13:54:48+00	neutral	0.825297738956207838	0.552145636665435258	0.174702261043792134	925360410152325120
20	thatboy_k	At #wafflehouse	2017-10-31 13:53:28+00	neutral	0.517250599758275031	0.61015935856137582	0.482749400241724913	925360074981281793
21	theivanmagallon	Just paid for my @WaffleHouse order in all quarters Now that is spooky. 👻\n\n#Halloween #HappyHalloween #Halloween2017 #WaffleHouse	2017-10-31 13:19:50+00	pos	0.37501573537884203	0.441581778520362456	0.62498426462115797	925351608841637888
22	treys3	You are always guaranteed to see something interesting at #WaffleHouse	2017-10-31 13:17:53+00	pos	0.257261711888190692	0.171244018908888768	0.742738288111809308	925351116971405312
23	66perristreet	Wow, @WaffleHouse has a crazy condiments code we never knew about (on @extracrispy): https://t.co/Uu5yeEo4WJ… https://t.co/VJwKmOl7u0	2017-10-31 12:33:03+00	neg	0.657880886448942603	0.109718286948155663	0.342119113551057397	925339837758169088
24	mr3Dhimself478	Ain't nun open at this hour but Waffle House &amp; legs shawty❕❕❕🕓🕓🕓🔥🔥🔥 #NewMusic #4InThaMornin #WaffleHouse #Twerk #RT https://t.co/454Qhi2ySG	2017-10-31 08:25:34+00	neg	0.664131910634724099	0.234833255984117972	0.335868089365275846	925277553140682752
25	thatguyCLEEN	Had to. #LifeSentenceTour #WaffleHouse https://t.co/BPK4w6NVq5	2017-10-31 08:03:37+00	neutral	0.61872457765617983	0.691398500562558582	0.381275422343820114	925272030408249344
26	bitaomeow	She's beauty &amp; she's grace. 🙏🏽✨\n.\n.\n.\n 😂😂😂 #wafflehouse #fave… https://t.co/TS4GepSMLN	2017-10-31 03:33:29+00	neutral	0.389023437357449819	0.784688202498015408	0.610976562642550181	925204050622271488
27	jwdng	@MegShepks #wafflehouse	2017-10-31 01:41:52+00	neutral	0.509551998906751624	0.59508906140405482	0.490448001093248376	925175960059641861
28	ABOriginal777	Andy Reid and his #wafflehouse menu. I'll order a Bronco offside.	2017-10-31 01:06:36+00	neutral	0.403991391854301551	0.516680249062191899	0.596008608145698449	925167083247341568
29	PorterTFlinn	No L’s at the @WaffleHouse in my whole life! I promise you. #WaffleHouse is the GOAT.	2017-10-31 00:54:15+00	neg	0.579303276377251652	0.238978713423089989	0.420696723622748348	925163976064995329
30	Trumpwall2016	@WandaSpeaks67 @deray #wafflehouse	2017-10-30 22:30:41+00	neutral	0.509551998906751624	0.59508906140405482	0.490448001093248376	925127845474533376
31	thatboy_k	At #wafflehouse	2017-11-02 14:36:25+00	neutral	0.517250599758275031	0.61015935856137582	0.482749400241724913	926095657378701312
32	Deana_d91	Because it’s almost that time again #wafflehouse https://t.co/KSXJ1CkiiQ	2017-11-02 12:22:38+00	neg	0.537564335521082515	0.340534228529382366	0.462435664478917485	926061988479938561
33	mann_org	Observed how waffles are made and relished them soon after 💜Thank you to everyone who made this happen #inclusion… https://t.co/g6lxQnduSw	2017-11-02 10:17:08+00	neutral	0.298873764133940623	0.981655083437782405	0.701126235866059377	926030405345607680
34	diamondzway	RT @MISSHAIRDOCTOR1: #WaffleHouse put bleach in woman's drink, lawsuit alleges - Fox News https://t.co/SmRdvQSWFM	2017-11-02 06:49:32+00	neutral	0.457188578054357087	0.706548011111690855	0.542811421945642913	925978164257488896
35	MISSHAIRDOCTOR1	#WaffleHouse put bleach in woman's drink, lawsuit alleges - Fox News https://t.co/SmRdvQSWFM	2017-11-02 06:33:03+00	neutral	0.495944559999691781	0.706548011111690855	0.504055440000308219	925974014643900416
36	RBESLICKP	In Waffle House like it's whatever dawg #clayco #wafflehouse #southside #rbeslickp #RBEGLOBAL @… https://t.co/B8HZzupMQS	2017-11-02 05:41:08+00	neg	0.624111790677822409	0.360367479236265387	0.375888209322177591	925960947448999936
37	JulieQBarnett	RT @docdhj: Jesse: Awesome Shark costume !  I have seen my buddy @Simple_George5 wear that same costume to #WaffleHouse ! @roland_gail http…	2017-11-02 02:43:43+00	pos	0.329628626714012274	0.152700142722474064	0.670371373285987726	925916302115594240
38	n3rdroll	Being #Weird at #wafflehouse just cuz XD https://t.co/8WFqvxL8p2	2017-11-02 02:16:55+00	neg	0.63710555640472355	0.0625336094581196017	0.36289444359527645	925909556819087360
39	AriBardel	RT @joeymcintyre: Prettiest #WaffleHouse I've ever seen. Bout to get #scatteredcoveredsmotheredandchunked on this… https://t.co/92dayJVa9S	2017-11-02 01:36:32+00	pos	0.463853968808533468	0.404431509207237749	0.536146031191466532	925899391789096960
40	ThuugggLyfe	#wafflehouse https://t.co/vqMO1O1Ug3	2017-11-01 23:55:03+00	neg	0.505753946940779686	0.47780934039101064	0.494246053059220258	925873852835655688
41	officetutorials	Breakfast for dinner - Pecan waffle, 2 eggs over medium, bacon and orange juice! @WaffleHouse #wafflehouse… https://t.co/Tds3F1cBvz	2017-11-01 23:16:58+00	neutral	0.550122962043047115	0.727154131326597564	0.449877037956952885	925864271568883712
42	Kristin0121	@DonnieWahlberg what's your favorite meal to order at #wafflehouse? 👀	2017-11-01 21:24:46+00	pos	0.41890555034659982	0.213806878384428689	0.58109444965340018	925836036026101760
43	secularbosrb	RT @mererow: "These are sexual predators... I was even scared" #wafflehouse #katiesmom  @katiegrace84 @SeaRaeJae	2017-11-01 20:57:38+00	neg	0.52071060845301842	0.0929470600507004141	0.479289391546981525	925829206650621952
44	Oliviaand24	@jakeowen guess what? I'm at #wafflehouse 😁	2017-11-01 18:48:08+00	neg	0.694384605141597944	0.354316361278180558	0.305615394858402056	925796615771820035
45	iJustwannafeedu	RT @ChefsSmokeAlot: @iJustwannafeedU(tw) :: \nThink I got this #Wafflehouse #recipe Just Right folks.. #Waffle… https://t.co/nEPp3VJz16	2017-11-01 17:26:34+00	neg	0.551635084862629688	0.172044616586746968	0.448364915137370312	925776090139975681
62	edwardpanas	One of the many reasons I love living in the South. #wafflehouse @ Waffle House https://t.co/WlqDDtMclS	2017-11-03 10:12:10+00	neutral	0.183555203678637868	0.739568181750181686	0.816444796321362132	926391544596389888
64	dust_jeff	@jpeteb @weirdmedicine @BrianKlauder Why Don't #wafflehouse Have Getta	2017-11-03 09:36:32+00	neg	0.753187404972533447	0.370977370524055827	0.246812595027466525	926382579007283201
65	LoveBlessRepeat	RT @11AliveNews: Criminal charges reinstated in sex scandal involving #WaffleHouse chairman https://t.co/LY9DX4EA0Z #MorningRushATL https:/…	2017-11-03 09:06:01+00	neutral	0.482060121633729133	0.604988233067123349	0.517939878366270867	926374895876837377
66	11AliveNews	Criminal charges reinstated in sex scandal involving #WaffleHouse chairman https://t.co/LY9DX4EA0Z #MorningRushATL https://t.co/XJJgoD6s34	2017-11-03 08:55:00+00	neutral	0.543289031003812983	0.604988233067123349	0.456710968996186961	926372124977119232
67	djpolow	#IHOP Or #WaffleHouse 👀😩 Can someone help me Choose 🤔 ?	2017-11-03 07:43:25+00	neg	0.696587450905458816	0.46050800103699796	0.303412549094541184	926354110701559809
68	shop_at_caps	Just ate #WaffleHouse now my stomach twisted!!!! 🤢	2017-11-03 07:02:26+00	neg	0.708464526186941668	0.0449242851484792718	0.291535473813058332	926343795737849856
69	imme8135	Ready to get off so I can dig into some #WaffleHouse	2017-11-03 03:42:12+00	neg	0.681495219327051593	0.194483757190431844	0.318504780672948351	926293405172490241
71	PoloPaIN	They need to build a  #WaffleHouse  over there on Rockside	2017-11-01 17:15:19+00	neutral	0.615654257568981622	0.935217379101326629	0.384345742431018322	925773257047003136
72	xxdanyell	today i ordered my hash browns "scrambled" #wafflehouse	2017-11-01 17:07:33+00	pos	0.499156645310309677	0.379382378781675245	0.500843354689690323	925771302484561921
73	929boy1	#wafflehouse pork chop with cheese! 😋🤤 @ Canton Sales and Storage Compa https://t.co/bg2dh4BtQe	2017-11-01 16:36:08+00	neg	0.619769661309317654	0.43792973148602532	0.380230338690682346	925763399077777411
74	hoss4107	RT @lawtide1x: UGA #1 in the Poll . They went out last night . #WaffleHouse https://t.co/mQdmSFB1t3	2017-11-01 15:15:37+00	neutral	0.689831684999555161	0.938941482178401121	0.310168315000444839	925743134600024064
75	bushthompson	#BreakfastOfChampions #WaffleHouse	2017-11-01 14:44:45+00	neutral	0.509551998906751624	0.59508906140405482	0.490448001093248376	925735365385773058
76	Merbear1981	Halloween success! #Chipotle #trickortreat #candy #drinks #debine #wafflehouse 🙈👻🎃🌯🍫🍬🥃🙌🏼 https://t.co/VzLVoZTqGl	2017-11-01 14:37:06+00	pos	0.466469308555161999	0.448367208656621496	0.533530691444838001	925733443434172416
77	EXIT104SHAWTY	#MoMornigs #MyMornings #Wafflehouse in #Atlanta 😂🔥 https://t.co/5Y4hNHpDUI	2017-11-01 14:12:44+00	neutral	0.529153173204219285	0.530061165075443985	0.470846826795780715	925727308002021376
79	thatboy_k	At #wafflehouse	2017-11-01 13:41:52+00	neutral	0.517250599758275031	0.61015935856137582	0.482749400241724913	925719543946842113
80	lawtide1x	UGA #1 in the Poll . They went out last night . #WaffleHouse https://t.co/mQdmSFB1t3	2017-11-01 13:13:41+00	neutral	0.727045550756923564	0.938941482178401121	0.272954449243076436	925712450254667781
81	Kay_Shanellej	Which one you prefer!? #wafflehouse #ihop #vote #FolloForFolloBack	2017-11-01 09:54:39+00	neutral	0.383755329698698411	0.518982368300780039	0.616244670301301589	925662360886444032
82	l0bridg	Expect some serious twitting happening once I make this #WaffleHouse pit stop solo	2017-11-01 04:52:12+00	neg	0.68156742387692304	0.149384179410536805	0.31843257612307696	925586245660696577
83	docdhj	Jesse: Awesome Shark costume !  I have seen my buddy @Simple_George5 wear that same costume to #WaffleHouse !… https://t.co/EkSDdh6Si9	2017-11-01 00:31:41+00	pos	0.383642023527519638	0.149605883407952306	0.616357976472480362	925520685149163520
84	marihear	South GA trick or treating yields a #WaffleHouse coupon. https://t.co/dBdYwakC3T	2017-10-31 23:36:29+00	neutral	0.442271815530704715	0.713490614235292475	0.557728184469295285	925506796143435776
86	JohnFricke	#Coke... #WaffleHouse #Chick-Fil-A, whatever. Still more than the ZERO to come out of #Charlotte. \n“Hate Week”, tha… https://t.co/57iLHaj0my	2017-10-31 23:06:13+00	neg	0.622663752961308825	0.206784601572886251	0.37733624703869123	925499178272346112
87	JayGot_Cakes	RT @WaffleHouse: The greater the storm the brighter the rainbow. #doublerainbow #wafflehouse #shinebright https://t.co/VFl1ZTZl6R https://t…	2017-10-31 21:41:48+00	pos	0.415241617480080927	0.343282608234038278	0.584758382519919073	925477934055526401
88	LlandoSolo	@EdwardAshton30 @SenJohnMcCain Sounds like a late night special at #wafflehouse ! The flip flopper!	2017-10-31 21:09:55+00	neg	0.561008960361155218	0.328596074409687633	0.438991039638844782	925469910108704768
89	nobles_rose	@WaffleHouse #wafflehouse #wafflehousehallowen #wafflehouse809 https://t.co/JR6LB4DXAR	2017-10-31 20:59:15+00	neg	0.505753946940779686	0.47780934039101064	0.494246053059220258	925467227301777409
90	nobles_rose	@WaffleHouse #wafflehouse #wafflehousehallowen #wafflehouse809 https://t.co/jMEALjPovN	2017-10-31 20:58:52+00	neg	0.505753946940779686	0.47780934039101064	0.494246053059220258	925467130677612546
91	nobles_rose	RT @nobles_rose: #wafflehouse #wafflehousehallowen #wafflehouse809 https://t.co/8vDNASdNGq	2017-10-31 20:49:23+00	pos	0.465016720018211593	0.47780934039101064	0.534983279981788407	925464740595367936
92	nobles_rose	RT @nobles_rose: #wafflehouse #wafflehousehallowen #wafflehouse809 https://t.co/Rx788EKcHn	2017-10-31 20:44:25+00	pos	0.465016720018211593	0.47780934039101064	0.534983279981788407	925463492601270273
93	ChefsSmokeAlot	@iJustwannafeedU(tw) :: \nThink I got this #Wafflehouse #recipe Just Right folks.. #Waffle… https://t.co/nEPp3VJz16	2017-10-31 20:10:44+00	neg	0.609104368567377485	0.172044616586746968	0.390895631432622515	925455017091276800
46	lamae_ana	I want #Wafflehouse	2017-11-03 16:09:47+00	neg	0.609397650384429612	0.363916790242684307	0.390602349615570332	926481541894619136
47	ClawleenMeowlen	I still can’t believe Jason had never been to Waffle House before today #wafflehouse #breakfast… https://t.co/q6l0b5aQ5D	2017-11-03 16:07:44+00	neg	0.668730118694007114	0.371533557645985113	0.331269881305992886	926481024506368000
48	skrobo21	Hey @wafflehouse any way I can purchase the bottles of the casa de waffle salsa to go?   I need my fix at home!@wafflehousenews #wafflehouse	2017-11-03 15:35:07+00	neg	0.660463731658774256	0.341765701859725268	0.339536268341225689	926472818509996033
49	NotoriousWojo	Instagramming my coffee like a basic white bitch. #wafflehouse… https://t.co/4wpclUklQs	2017-11-03 14:55:33+00	neg	0.598383700836646826	0.32770051872696776	0.401616299163353119	926462859185410048
50	brian1davis1	Whoever is singing at  #wafflehouse #terrell near Walmart please stop.  You can cook a mean egg but not sing. Thank you	2017-11-03 14:41:46+00	neg	0.503319710499994799	0.243442419099977408	0.496680289500005201	926459393201319936
51	CHbanderson	Breakfast of Champions for The Guys this morning after a GREAT early practice &amp; some competition on the grass.… https://t.co/dAdx4vwdXM	2017-11-03 14:41:44+00	neutral	0.433863780269144406	0.669628191895046521	0.566136219730855594	926459384129118208
52	thatboy_k	At #wafflehouse	2017-11-03 14:35:59+00	neutral	0.517250599758275031	0.61015935856137582	0.482749400241724913	926457934913163264
53	dpgeorgiev	Didn't the woman assume the risk by going to #WaffleHouse? https://t.co/Rq5HQOCGDF #FoxNews	2017-11-03 14:17:17+00	neutral	0.661340362965050055	0.84601386054166261	0.33865963703494989	926453232284717059
54	BeverlyHolloway	Him I want to take you out for breakfast.#wafflehouse today's my day😛😂 #nomakeupchallenge  moisturizer and lipstick… https://t.co/ZwHZUCTLhP	2017-11-03 14:12:56+00	pos	0.359348578523344786	0.434815764854263487	0.640651421476655214	926452134295625728
55	sameowss	Someone left this in our #WaffleHouse mailbox anonymously last night 😂 https://t.co/o6oLtw85EW	2017-11-03 12:59:55+00	neutral	0.541806463587402365	0.855847565780472608	0.458193536412597635	926433761767690240
56	Karenlcr	Lo primero que comeré cuando llegue a EE.UU! Será mi desayuno, almuerzo y cena 🤤😍❤️ #WaffleHouse… https://t.co/NhmQjavvOc	2017-11-03 12:24:29+00	pos	0.417446718698934349	0.39477551534265376	0.582553281301065651	926424843020578816
57	DAMMITMITCH	Lmao nigga I work in IT 😂 #wafflehouse babeh https://t.co/iDtd75rbQ7	2017-11-03 12:10:52+00	neg	0.592366821481424166	0.0102453525810939586	0.407633178518575778	926421417352204289
58	MaryFordgb	RT @11AliveNews: Criminal charges reinstated in sex scandal involving #WaffleHouse chairman https://t.co/LY9DX4mZ9r #MorningRushATL https:/…	2017-11-03 10:46:52+00	neutral	0.482060121633729133	0.604988233067123349	0.517939878366270867	926400275585359872
59	bmb410	#WaffleHouse I miss Loganville Georgia https://t.co/VSPOYbQVlF	2017-11-03 10:39:35+00	neg	0.730985727566109356	0.368727987513284505	0.269014272433890644	926398445644144640
60	11AliveNews	Criminal charges reinstated in sex scandal involving #WaffleHouse chairman https://t.co/LY9DX4mZ9r #MorningRushATL https://t.co/wpmpvTcEbX	2017-11-03 10:35:01+00	neutral	0.543289031003812983	0.604988233067123349	0.456710968996186961	926397297252093952
61	FreeStacks214	🏡🏡🏡 #WaffleHouse 😋😋UGHHH #IMGOINGFEDERAL 💰🤑 #FreeStacks #INVESTMENTS #OTW💰💰🤑🤑 @ Waffle House https://t.co/C8Os7z0qtu	2017-11-03 10:15:23+00	neutral	0.628619868838830476	0.630243046104804638	0.371380131161169524	926392354076020737
63	n8wink	It’s 27 degrees Fahrenheit inside #WaffleHouse on the 27th parallel right now. Seriously, I’m going to have to eat fast or it might freeze.	2017-11-03 09:38:42+00	neg	0.689543745631566507	0.209570536269916702	0.310456254368433493	926383122928881665
70	ronaldsbatson	#Wafflehouse waffles have been flimsier than ever these days. They’ve turned into mush when syrup was poured on them!  How about thickenin	2017-11-02 22:03:13+00	neutral	0.685214184533873061	0.995869826215671661	0.314785815466126884	926208100763348992
94	SlimJimBABA	#WaffleHouse vs. #Ihop	2017-10-31 19:52:06+00	neutral	0.529455423968882455	0.537783400020726776	0.47054457603111749	925450324709650432
96	WaffleHouse	RT @nobles_rose: #wafflehouse #wafflehousehallowen #wafflehouse809 https://t.co/Rx788EKcHn	2017-10-31 19:20:44+00	pos	0.465016720018211593	0.47780934039101064	0.534983279981788407	925442430962425856
97	nobles_rose	#wafflehouse #wafflehousehallowen #wafflehouse809 https://t.co/8vDNASdNGq	2017-10-31 18:44:03+00	neg	0.505753946940779686	0.47780934039101064	0.494246053059220258	925433202629599232
98	nobles_rose	#wafflehouse #wafflehousehallowen #wafflehouse809 https://t.co/ywHbLedZNc	2017-10-31 18:43:35+00	neg	0.505753946940779686	0.47780934039101064	0.494246053059220258	925433084845150210
99	nobles_rose	#wafflehouse #wafflehousehallowen #wafflehouse809 https://t.co/Rx788EKcHn	2017-10-31 18:42:58+00	neg	0.505753946940779686	0.47780934039101064	0.494246053059220258	925432929077121027
100	kennaheinlein	@tristand26 #wafflehouse 💗	2017-10-30 17:43:20+00	neutral	0.509551998906751624	0.59508906140405482	0.490448001093248376	925055533102583808
102	AmandaSenaMusic	My first time. #wafflehouse https://t.co/EDlGpDUybP	2017-10-30 15:17:47+00	pos	0.418622681197282076	0.266284023722920482	0.581377318802717924	925018906325946368
103	PUFFTV	I truly miss this place.... #goodeating #wafflehouse #bullcity https://t.co/wVe74jaJsC	2017-10-30 15:03:43+00	neg	0.68697769515569862	0.348152874951581426	0.31302230484430138	925015362399363072
104	KeiyAlexis	Back in the South #wafflehouse https://t.co/8vIFte4LbS	2017-10-30 13:50:01+00	neutral	0.582092659969717152	0.932027021630351116	0.417907340030282848	924996815589707778
105	thatboy_k	At #wafflehouse	2017-10-30 13:22:16+00	neutral	0.517250599758275031	0.61015935856137582	0.482749400241724913	924989833352794112
107	navyvet50	@fangsbites Don't you live in GA? Uumm #WaffleHouse	2017-10-30 05:43:27+00	pos	0.393013883367703931	0.219428111328702352	0.606986116632296069	924874368869654529
108	DavidGOficial	Almost last call..gonna have to watch the rest At #waffleHouse.. #worldseries #AstrosvsDodgers	2017-10-30 05:17:57+00	neg	0.657778621278345854	0.404666964251435834	0.34222137872165409	924867953467719681
109	ChefExMachina	RT @Div1neThaGod: The Waffle House. #wafflehouse #food #breakfast #life #love #foodporn #waffles #hashbrowns @… https://t.co/qwQi4pqhqJ	2017-10-30 04:45:24+00	neutral	0.318465594864959622	0.68588127295513468	0.681534405135040378	924859758850592768
110	Div1neThaGod	The Waffle House. #wafflehouse #food #breakfast #life #love #foodporn #waffles #hashbrowns @… https://t.co/qwQi4pqhqJ	2017-10-30 04:38:45+00	neutral	0.375332671671080753	0.68588127295513468	0.624667328328919247	924858088254947328
111	ShanaeThe1Jones	When you go outta town and get in so late that you just have to stop by #WaffleHouse so you can… https://t.co/D8mNFBWuBY	2017-10-30 03:20:06+00	neutral	0.605320686568028399	0.751568416136228046	0.394679313431971601	924838292104929280
112	illiniFBGuru	@JonHeyman #wafflehouse doesn’t take reservations.	2017-10-30 03:17:38+00	neg	0.619381100892433922	0.493661016734361524	0.380618899107566078	924837674778800133
114	tamlynren	When THIS is your waitress at #wafflehouse 🖕🏻that!!!!  Bye Felicia!! https://t.co/uYH5Cgllk0	2017-10-30 02:32:53+00	neg	0.538473329993951255	0.38406468932343274	0.461526670006048745	924826411273244673
115	mitchxxii_	easiest poll i’ve ever voted on #WaffleHouse 😤 https://t.co/TfQwDob0V8	2017-10-30 01:29:04+00	neg	0.555414721138016265	0.361852878963587976	0.444585278861983735	924810352453439489
78	PamShumate	@PressSec used to work at #WaffleHouse didn't she ? seeing who her Dad is,her ignorance really shouldn't be a surpr… https://t.co/wwHpNdQNWe	2017-11-01 13:54:27+00	neutral	0.762518301401216236	0.758746959984709424	0.237481698598783791	925722707882381313
85	Bcaru15	RT @JohnFricke: #Coke... #WaffleHouse #Chick-Fil-A, whatever. Still more than the ZERO to come out of #Charlotte. \n“Hate Week”, that’s cute…	2017-10-31 23:08:04+00	pos	0.484500662550091277	0.204964305654590867	0.515499337449908723	925499641600397312
95	TNVolDrB	RT @nobles_rose: #wafflehouse #wafflehousehallowen #wafflehouse809 https://t.co/Rx788EKcHn	2017-10-31 19:43:09+00	pos	0.465016720018211593	0.47780934039101064	0.534983279981788407	925448073601527809
101	hester_lpster	RT @unicoharz: Die leckersten Waffeln im Nordharz !!!!!! #waffeln #wafflehouse #waffelhaus #waffles #unicoharz https://t.co/2CZKlzSQjX	2017-10-30 15:24:46+00	neg	0.562621180178564106	0.47780934039101064	0.437378819821435894	925020661805928448
106	gmoney4980	I might not go to bed... Still gotta comb through recordings from the #BHoleAween \n\nUmm, yeah. There's a #WaffleHouse 1min from my home	2017-10-30 09:28:56+00	neg	0.650126354899488001	0.346794771942878777	0.349873645100511999	924931114199932928
113	Mike_Butcher23	#WaffleHouse should advertise for MLB... They would have every slogan down! #ScatterdSmothered&amp;Covered	2017-10-30 02:40:36+00	neg	0.65036429262001505	0.278879505836924058	0.34963570737998495	924828351553945600
119	evapors	@DeionSanders Amen and amen!!! #WAFFLEHOUSE	2017-11-06 16:49:28+00	neutral	0.457023466112339571	0.623596927379234334	0.542976533887660429	927578694167814145
120	HawaiianLouts_	Me; drunk waiting for my food at #wafflehouse https://t.co/it9iQldJq3	2017-11-06 16:31:22+00	neg	0.748232726174493767	0.0112933912666969213	0.251767273825506233	927574135781429250
122	kayla_wwe_girl1	RT @TrueKofi: .@WaffleHouse. Came in for a meal, left with so much more... \n\n#WaffleHouseArmSleeves #WaffleHouse\n#BankheadDriveWaffleHouseL…	2017-11-06 15:57:56+00	neutral	0.595581911269341013	0.526774427726836914	0.404418088730659042	927565721978195968
123	mb_mayfair	Waffle House entrepreneur. #awfulwaffle #dowhatyougottado #wafflehouse https://t.co/DUSd2Gj1Zo	2017-11-06 14:47:51+00	neutral	0.585781397821852456	0.731979031285271531	0.414218602178147544	927548087387570177
124	onlymaylaj	#wafflehouse slaps I had two sandwiches 🤦🏽‍♀️	2017-11-06 14:31:07+00	neg	0.638403005593848327	0.372165366527170749	0.361596994406151617	927543876944039936
125	thatboy_k	At #wafflehouse	2017-11-06 13:59:35+00	neutral	0.517250599758275031	0.61015935856137582	0.482749400241724913	927535938837843968
126	ChuckMeathrell	There is no way out of Waffle House except by waddling. \n#WaffleHouse\n#OverEasy\n#Waddling	2017-11-06 13:42:05+00	neutral	0.725531228792655858	0.800872166548707187	0.274468771207344198	927531537758765057
127	LloydistheWoyd	RT @Unpersuaded112: @AlanSuderman really @WaffleHouse ??? #wafflehouse #trump	2017-11-06 11:58:42+00	pos	0.483889831461620123	0.154128919479812942	0.516110168538379877	927505520088485889
129	Beth39686160	RT @kcfaul: One thing is for sure: the restaurant owners who support racist, prejudice candidates serve terrible food #WaffleHouse #PapaJoh…	2017-11-06 04:13:21+00	neutral	0.532250742493912798	0.539905644810526164	0.467749257506087202	927388408288305152
130	kcfaul	One thing is for sure: the restaurant owners who support racist, prejudice candidates serve terrible food… https://t.co/7YAPQxI9nJ	2017-11-06 04:03:45+00	neg	0.559886905836749493	0.466870057362645641	0.440113094163250562	927385994462035968
131	soaprookie	RT @ta2t2o: Why is the @WaffleHouse from Norcross, GA donating $20K to the lobbyist in the VA governor’s race? #wafflehouse https://t.co/pm…	2017-11-06 03:14:36+00	neutral	0.609019351500483697	0.848940854888803997	0.390980648499516303	927373625673515009
132	CHOCLABLOVER	RT @ta2t2o: Why is the @WaffleHouse from Norcross, GA donating $20K to the lobbyist in the VA governor’s race? #wafflehouse https://t.co/pm…	2017-11-06 03:12:26+00	neutral	0.609019351500483697	0.848940854888803997	0.390980648499516303	927373080858591235
133	ta2t2o	Why is the @WaffleHouse from Norcross, GA donating $20K to the lobbyist in the VA governor’s race? #wafflehouse https://t.co/pmd4a0w6sU	2017-11-06 03:10:29+00	neutral	0.636397230594280106	0.848940854888803997	0.363602769405719894	927372586916499456
134	whodatjhawk	RT @Unpersuaded112: @AlanSuderman really @WaffleHouse ??? #wafflehouse #trump	2017-11-06 02:36:16+00	pos	0.483889831461620123	0.154128919479812942	0.516110168538379877	927363978644393984
135	Unpersuaded112	@AlanSuderman really @WaffleHouse ??? #wafflehouse #trump	2017-11-06 02:10:30+00	neg	0.532863289744549107	0.154128919479812942	0.467136710255450949	927357492039954433
136	dcresisting	@WaffleHouse more like racist awfulhouse. #wafflehouse #awfulhouse	2017-11-06 00:24:24+00	pos	0.472374377920707689	0.272114385453941121	0.527625622079292311	927330791276892165
138	JPBlough	RT @AvaAcres: Falling for you @WaffleHouse 🤤💖 #neworleans #louisiana #wafflehouse https://t.co/46vsYtb1T9	2017-11-05 23:06:51+00	neutral	0.424051212797885602	0.678982773116837746	0.575948787202114398	927311277344600064
139	AvaAcres	Falling for you @WaffleHouse 🤤💖 #neworleans #louisiana #wafflehouse https://t.co/46vsYtb1T9	2017-11-05 22:50:55+00	neutral	0.45029154050250686	0.678982773116837746	0.54970845949749314	927307264305885186
140	maxebernhardt	I need to listen more and talk less\n\n#vsco #vscocam #vscodaily #wafflehouse @ Texarkana, Arkansas https://t.co/ZPgqI2U2D0	2017-11-05 22:35:48+00	neg	0.578135181670933029	0.243230757466762482	0.421864818329066971	927303460797734913
141	taylorlevesque	#goingtothechapcole #nicolegetscoled\n#wafflehouse @ Ashton Gardens DFW https://t.co/6omSUNG0NQ	2017-11-05 22:05:28+00	neg	0.502884094813460192	0.47780934039101064	0.497115905186539808	927295829060157440
143	DarkGzzz	#TIME TO EAT #WAFFLEHOUSE https://t.co/wi7XxZl4c7	2017-11-05 16:45:21+00	pos	0.460507714425336445	0.447971425872844942	0.539492285574663555	927215268455206913
144	cognac62	@WaffleHouse @terrysimpson has never eaten at a #WaffleHouse   We must change that.	2017-11-05 16:43:00+00	neutral	0.505747949029182742	0.746570980885761237	0.494252050970817314	927214678983499776
145	IzzieCarrasco	The minute I left #WaffleHouse, some guy pulled out a gun...wow, no words can explain the fear. https://t.co/1udtL5C6Vs	2017-11-05 16:15:23+00	neutral	0.647226176787281782	0.640242607744345271	0.352773823212718163	927207727499268096
147	StephensLana	#wafflehouse #girlsweekend #hadablast https://t.co/QWk5WKNBGl	2017-11-05 14:47:39+00	neg	0.505753946940779686	0.47780934039101064	0.494246053059220258	927185648485912576
148	Cowpow10	RT @jazzy_redd504: After the show #Chucky'sBdaybash #HooiserDome grabbed a bit to eat at the #Wafflehouse @DottieStaxx @jazzy_redd504 @DjBi…	2017-11-05 13:56:26+00	neutral	0.336820715816458338	0.515650301108649844	0.663179284183541662	927172757674176512
149	trembeieys	RT @jazzy_redd504: After the show #Chucky'sBdaybash #HooiserDome grabbed a bit to eat at the #Wafflehouse @DottieStaxx @jazzy_redd504 @DjBi…	2017-11-05 13:14:31+00	neutral	0.336820715816458338	0.515650301108649844	0.663179284183541662	927162212606607362
150	BrltnyLonglocks	RT @jazzy_redd504: After the show #Chucky'sBdaybash #HooiserDome grabbed a bit to eat at the #Wafflehouse @DottieStaxx @jazzy_redd504 @DjBi…	2017-11-05 13:07:24+00	neutral	0.336820715816458338	0.515650301108649844	0.663179284183541662	927160418711232514
151	TheJetBallistic	RT @jalen6saunders: #wafflehouse I missed you dearly I will never take you for granted again.	2017-11-05 13:03:52+00	neg	0.537028088366225065	0.344000373806369275	0.462971911633774935	927159529141391360
152	jalen6saunders	#wafflehouse I missed you dearly I will never take you for granted again.	2017-11-05 12:59:16+00	neg	0.582878553491531504	0.344000373806369275	0.417121446508468496	927158373002473473
154	Valsome35	RT @jazzy_redd504: After the show #Chucky'sBdaybash #HooiserDome grabbed a bit to eat at the #Wafflehouse @DottieStaxx @jazzy_redd504 @DjBi…	2017-11-05 12:52:55+00	neutral	0.336820715816458338	0.515650301108649844	0.663179284183541662	927156776759365632
155	ChlcagoBullsMan	RT @jazzy_redd504: After the show #Chucky'sBdaybash #HooiserDome grabbed a bit to eat at the #Wafflehouse @DottieStaxx @jazzy_redd504 @DjBi…	2017-11-05 12:49:40+00	neutral	0.336820715816458338	0.515650301108649844	0.663179284183541662	927155957452374016
156	elissa446	RT @jazzy_redd504: After the show #Chucky'sBdaybash #HooiserDome grabbed a bit to eat at the #Wafflehouse @DottieStaxx @jazzy_redd504 @DjBi…	2017-11-05 12:49:14+00	neutral	0.336820715816458338	0.515650301108649844	0.663179284183541662	927155849029734402
157	KlssesAndMuahs	RT @jazzy_redd504: After the show #Chucky'sBdaybash #HooiserDome grabbed a bit to eat at the #Wafflehouse @DottieStaxx @jazzy_redd504 @DjBi…	2017-11-05 12:46:16+00	neutral	0.336820715816458338	0.515650301108649844	0.663179284183541662	927155101306941440
158	KiwiTiwi96	RT @jazzy_redd504: After the show #Chucky'sBdaybash #HooiserDome grabbed a bit to eat at the #Wafflehouse @DottieStaxx @jazzy_redd504 @DjBi…	2017-11-05 12:44:21+00	neutral	0.336820715816458338	0.515650301108649844	0.663179284183541662	927154620568297473
160	DjBigO317	RT @jazzy_redd504: After the show #Chucky'sBdaybash #HooiserDome grabbed a bit to eat at the #Wafflehouse @DottieStaxx @jazzy_redd504 @DjBi…	2017-11-05 12:32:21+00	neutral	0.336820715816458338	0.515650301108649844	0.663179284183541662	927151601072115712
161	Billionairerob	#Wafflehouse😍😍😍	2017-11-05 12:01:29+00	neutral	0.509551998906751624	0.59508906140405482	0.490448001093248376	927143830004158464
162	jwash225	#WaffleHouse been taking care of the drunk for years!!! https://t.co/hCeKeopUqy	2017-11-05 09:49:20+00	neg	0.523272797065367112	0.422306939546958471	0.476727202934632888	927110573380079616
163	moucetrap	#wafflehouse kid https://t.co/psmgD9y9qG	2017-11-05 07:55:46+00	neg	0.505753946940779686	0.438109326078895134	0.494246053059220258	927081993136955393
165	rizzn	I was tagged in a photo by Iris Hopkins. "This how we end the night #wafflehouse #food" https://t.co/aRr2HUWqPy	2017-11-05 04:58:13+00	pos	0.490877661401288745	0.396864961057092236	0.509122338598711255	927037314034958336
166	iMiSS_KEKE	A bacon egg an cheese Texas toast sandwich an some covered hash browns would be so clutch right now 😩 #wafflehouse	2017-11-05 03:25:18+00	neg	0.702699204622536433	0.246724326213092787	0.297300795377463567	927013930224050176
167	TheOneTrueAngel	Paaaaartttttttyyyyyy #WaffleHouse https://t.co/svuyGAjaAp	2017-11-05 02:12:55+00	neg	0.505753946940779686	0.47780934039101064	0.494246053059220258	926995712205905920
169	jay_mulligan	Beatbox loops &amp; upright piano. #wafflehouse #montecristo https://t.co/2uGos3ZZ82	2017-11-05 01:07:59+00	neutral	0.497868046950497134	0.532081056450501744	0.502131953049502866	926979374129102848
170	evapors	@DeionSanders You always on some truth. #WAFFLEHOUSE	2017-11-05 00:20:45+00	pos	0.295643187722031908	0.387902716750706311	0.704356812277968092	926967487140388869
171	icetouchoutro62	" #PlanetFitness #McRib #WaffleHouse #LaffyTaffyEquity" - @JustinTuck, @SteveSmithII, @IamCRod,&amp; @Kam_Chancellor	2017-11-04 23:37:04+00	neutral	0.498438269846478654	0.59508906140405482	0.501561730153521346	926956492758114304
172	991wqik	LIVE music in #Jaxcountry tonight with our buddy @coltford at @dailysplace show starts at 8 #Cmon #WaffleHouse… https://t.co/h5cgtQOprl	2017-11-04 21:56:57+00	neutral	0.468181842280371852	0.654614605525003168	0.531818157719628148	926931295648743424
174	JeffDye	#WaffleHouse is like the official octagon of #WorldStar . \n\n@WORLDSTAR @WaffleHouse	2017-11-04 19:18:33+00	pos	0.482879829163887608	0.485568992498584484	0.517120170836112392	926891432673202177
175	kbinkles	He’s learning from the masters. #wafflehouse https://t.co/p2XFIAo4j3	2017-11-04 18:28:54+00	neutral	0.446743099662136212	0.926231305293085172	0.553256900337863788	926878940236455936
176	KingMajesty	#WaffleHouse They’re up in here getting physical..... https://t.co/IToIfMJC9l	2017-11-04 18:25:54+00	neg	0.58404045722448239	0.418597574448168974	0.415959542775517666	926878183173050378
177	EddiePTATC	@Mark_Schlabach I see what you are doing there #wafflehouse	2017-11-04 17:41:38+00	pos	0.393662249102413653	0.348369998099941902	0.606337750897586347	926867045773438977
178	relizabethb66	@DonnieWahlberg I just got my waffle house cherry popped. #wafflehouse #notavirginanymore https://t.co/O8WsdJFbjL	2017-11-04 17:21:54+00	neg	0.760609759654774287	0.349861899301208645	0.239390240345225741	926862077905555456
179	Charress	Waffle House Renaissance art. This is the perfect picture. #WaffleHouse https://t.co/uXhsgMEFhs	2017-11-04 14:34:14+00	pos	0.312541243579647077	0.0709829272673479644	0.687458756420352923	926819884775776256
180	EricTheCarpentR	I'm thinking #WaffleHouse \n#saturdaymorning	2017-11-04 14:22:26+00	neg	0.612486596340804379	0.362235719768954467	0.387513403659195566	926816914537680896
181	SwaggerjackProd	@PostalElk1 I need to stop filming my nipple adventures\n\n#Wafflehouse	2017-11-04 13:36:32+00	neutral	0.644156424637809311	0.592842797085723183	0.355843575362190634	926805362866397184
182	JustEatMeeSlow	#WaffleHouse is me and babe spot	2017-11-04 13:35:42+00	neg	0.593767425966947204	0.405296691664018993	0.406232574033052851	926805152216035328
184	runningben5	Always nice to get up at 430 and drive to #wafflehouse to start Saturday #hustle #retail #hardware	2017-11-04 10:31:22+00	neutral	0.553740667282340393	0.56719801844608142	0.446259332717659662	926758763880738816
185	FlaveBFMG	#wafflehouse  sounds like the move right about now #studiolife  #feedme  👨🏻‍🍳💬💬	2017-11-04 07:26:52+00	neg	0.58781728603463046	0.188767832607835834	0.41218271396536954	926712333807874048
186	JC_Christian	You will.be the first to be depantsed and taunted, Jethro #Nov4itbegins #WaffleHouse #SexySheep https://t.co/bNcMmlvgS0	2017-11-04 06:44:04+00	pos	0.322112795159989918	0.253778836100327032	0.677887204840010082	926701562885423104
188	Lakecrazy	#WaffleHouse and @OfficialLivePD #LivePD earlier made me think of 😂 https://t.co/z1z0y0Tcxw	2017-11-04 03:44:07+00	neg	0.564413213964046867	0.181791591448290851	0.435586786035953133	926656277996081152
189	donbleecker	readytoretire2021 and I enjoying some high brow late night fare #wafflehouse #itshowweroll @… https://t.co/5LmE1jV0pd	2017-11-04 03:36:20+00	neg	0.565432867887683321	0.176555163430927253	0.434567132112316679	926654318438096901
190	paulwilliams_72	Thank God my #daughter likes #wafflehouse	2017-11-04 03:35:47+00	neutral	0.493167688099022339	0.647415866169247067	0.506832311900977661	926654178377764864
191	normajeanr50	RT @RealityPDBingo: Anyone else craving some hashbrowns all of a sudden? Scattered, smothered and covered. #wafflehouse #livepd #livepdbing…	2017-11-04 03:22:51+00	neg	0.643444099974358807	0.198936048821902745	0.356555900025641193	926650926282231808
192	SherryD85470388	RT @RealityPDBingo: Anyone else craving some hashbrowns all of a sudden? Scattered, smothered and covered. #wafflehouse #livepd #livepdbing…	2017-11-04 03:18:40+00	neg	0.643444099974358807	0.198936048821902745	0.356555900025641193	926649871460913152
194	GeezCindy	RT @RealityPDBingo: Anyone else craving some hashbrowns all of a sudden? Scattered, smothered and covered. #wafflehouse #livepd #livepdbing…	2017-11-04 03:12:56+00	neg	0.643444099974358807	0.198936048821902745	0.356555900025641193	926648430436511746
195	SOUTHBOUND2011	RT @RealityPDBingo: Anyone else craving some hashbrowns all of a sudden? Scattered, smothered and covered. #wafflehouse #livepd #livepdbing…	2017-11-04 03:12:25+00	neg	0.643444099974358807	0.198936048821902745	0.356555900025641193	926648299389685760
196	RealityPDBingo	Anyone else craving some hashbrowns all of a sudden? Scattered, smothered and covered. #wafflehouse #livepd #livepdbingo #hashbrowns #yum	2017-11-04 03:11:25+00	neg	0.608984010576943513	0.198936048821902745	0.391015989423056487	926648048859705345
197	timpaulgavin	This has to be the first #Wafflehouse on  #LivePD	2017-11-04 03:10:39+00	neutral	0.498024573034978602	0.633392986212434006	0.501975426965021398	926647856638787584
198	ScottTalbott	#WaffleHouse #LivePDbingo	2017-11-04 03:10:24+00	neutral	0.509551998906751624	0.59508906140405482	0.490448001093248376	926647791304224774
199	LocalB12	@jpelc2 Funny, I was just saying the same about #Wafflehouse	2017-11-04 03:10:10+00	neg	0.595218687755336262	0.151842841672463896	0.404781312244663793	926647732210606081
200	Monkeyfister1	10pm CDT Two hours to GO TIME. Don't tell anyone. #Antifa #Nov4 #CivilWar #JadeHelm #JiffPeanutButter #WaffleHouse	2017-11-04 03:00:22+00	neg	0.617535112988435664	0.369750924137151493	0.382464887011564281	926645268606484480
202	JakeEdwards01	RT @Kaber195: Cant make a whore a housewife, but i damn sure tried even when she lied. #wafflehouse	2017-11-04 02:40:49+00	neg	0.662099635950557763	0.0957248383917383566	0.337900364049442237	926640346733441024
116	go4munch	#wafflehouse  enough said!	2017-11-06 19:04:16+00	neg	0.531647031993254027	0.2458786460430121	0.468352968006746029	927612616939319297
117	AdamHeis6	@ConnorJRogers Happy Birthday!See ya in January my man! #wafflehouse	2017-11-06 18:36:22+00	pos	0.12413742814738804	0.101673035484539265	0.87586257185261196	927605593682169858
118	tyshirey	Everyday is a fun day with Ro-$. #DaddysDayOff #wafflehouse #RomanJack @ Waffle House https://t.co/limxBkF8Zi	2017-11-06 17:34:41+00	neutral	0.200853513403944972	0.556642720388491608	0.799146486596055028	927590069875208192
121	suplexesmics	Episode 12 with @Shea2McGrady is now available! \nhttps://t.co/1XABxeL9FH\n#IndyWrestling #wrestling #highprofile #podcast #wafflehouse	2017-11-06 16:15:19+00	neutral	0.27445419530270132	0.736827011485697181	0.72554580469729868	927570098822483969
128	gorgeous1965	RT @ta2t2o: Why is the @WaffleHouse from Norcross, GA donating $20K to the lobbyist in the VA governor’s race? #wafflehouse https://t.co/pm…	2017-11-06 04:14:47+00	neutral	0.609019351500483697	0.848940854888803997	0.390980648499516303	927388768637767685
137	GeneCrain1	#wafflehouse #Savannah it's a southern thing https://t.co/GvjJPgEAU5	2017-11-05 23:14:52+00	pos	0.466832844396005253	0.357659444486039979	0.533167155603994747	927313295350140928
142	thewritermegan	When your clothes smell like #WaffleHouse after you leave Waffle House. 🙂	2017-11-05 16:56:14+00	neutral	0.597451906152475676	0.513470636074602971	0.402548093847524324	927218006702387200
146	TheRealToteMan	Went to #durham #ihop &amp; sat at table 4 20 minutes no 1 taking our order watching people who sat after us getting food. Going to #wafflehouse	2017-11-05 15:33:05+00	neutral	0.686584715614546592	0.614368714758954382	0.313415284385453463	927197081806229505
153	rcolli88	RT @jazzy_redd504: After the show #Chucky'sBdaybash #HooiserDome grabbed a bit to eat at the #Wafflehouse @DottieStaxx @jazzy_redd504 @DjBi…	2017-11-05 12:57:27+00	neutral	0.336820715816458338	0.515650301108649844	0.663179284183541662	927157913763876864
159	mayllnburns	RT @jazzy_redd504: After the show #Chucky'sBdaybash #HooiserDome grabbed a bit to eat at the #Wafflehouse @DottieStaxx @jazzy_redd504 @DjBi…	2017-11-05 12:41:01+00	neutral	0.336820715816458338	0.515650301108649844	0.663179284183541662	927153778343768066
164	upenzi	I’m dying 😂🤦🏽‍♀️⚰️ #WaffleHouse #IfIWasSober https://t.co/lReY4pzXdb	2017-11-05 07:35:49+00	neg	0.652999036350126794	0.389705707108391586	0.347000963649873206	927076972618018816
168	kyleplunkett	I had a random craving of Waffle House. Why they tasted so good at night? 😂 #wafflehouse @… https://t.co/7lYEBZrqvP	2017-11-05 02:00:02+00	neg	0.695073138551662306	0.239296498175031652	0.304926861448337694	926992471170699264
173	beReInVintaged	@SpankYouSilly, look what I found on one of my #thrifting excursions! Viva la #wafflehouse!  (Sorry I tagged you ev… https://t.co/S0KSQB7SqD	2017-11-04 20:05:37+00	neg	0.632450127178326604	0.00487307853593789333	0.367549872821673396	926903280214642689
183	CaptTouchback	Let the handicapping begin! #BreedersCup #WaffleHouse https://t.co/x2le26Fqys	2017-11-04 11:02:56+00	neutral	0.580213504075171138	0.67342011780996458	0.419786495924828862	926766707758088192
187	poppabugg	RT @Lakecrazy: #WaffleHouse and @OfficialLivePD #LivePD earlier made me think of 😂 https://t.co/z1z0y0Tcxw	2017-11-04 03:45:32+00	neg	0.533391549146508215	0.181791591448290851	0.466608450853491785	926656633769549824
193	PatrolPd	RT @RealityPDBingo: Anyone else craving some hashbrowns all of a sudden? Scattered, smothered and covered. #wafflehouse #livepd #livepdbing…	2017-11-04 03:13:26+00	neg	0.643444099974358807	0.198936048821902745	0.356555900025641193	926648556555001856
201	kwhudnut	@HSACouncil @WCraigFugate @ReadyLA Another great event convened by HSAC; partnership is key #SupplyChain… https://t.co/GcPX1PFgNL	2017-11-04 02:54:00+00	pos	0.269958465284286797	0.392761053785104952	0.730041534715713203	926643664482209792
203	EHFoundation237	RT @traditionAlyssa: #flashbackfriday #vacationtime #carnivalmagic #carnivalcruise #views #food #travel #wafflehouse https://t.co/V3PgONckRH	2017-11-04 02:07:28+00	neutral	0.395152018956424156	0.698728781037014968	0.604847981043575844	926631952484110337
204	traditionAlyssa	#flashbackfriday #vacationtime #carnivalmagic #carnivalcruise #views #food #travel #wafflehouse https://t.co/V3PgONckRH	2017-11-04 02:06:27+00	neutral	0.422959706886765763	0.698728781037014968	0.577040293113234237	926631699936620544
205	horta1701	Mmmm, #WaffleHouse party. Maybe that's where we'll eat dinner tomorrow! https://t.co/ejHo2mrZ5S	2017-11-04 01:50:47+00	pos	0.464154305227600039	0.351232402210881534	0.535845694772399961	926627757555179521
206	JegErAlan	Two words: #wafflehouse #onehashtag https://t.co/6RlCqLb9Zx	2017-11-04 01:32:07+00	neg	0.53650898985085882	0.435141888951387668	0.46349101014914118	926623059737567232
207	adriandcanfield	GUYS\n\n#wafflehouse https://t.co/TnNaie5HpD	2017-11-04 01:24:22+00	neg	0.509094944963004004	0.43452595554729917	0.490905055036996052	926621108333408256
208	conniereagan	#wafflehouse date. At the low bar. https://t.co/EipOa0iTjf	2017-11-04 00:41:32+00	neg	0.538504605546468618	0.390904951616890983	0.461495394453531382	926610326828802048
209	JC_Christian	God-fearing patriots will feel the sting of our dildonic technology #Antifa #Nov4 #CivilWar #JadeHelm… https://t.co/W5SMWg7v3V	2017-11-03 22:23:16+00	pos	0.417357585435074507	0.454659248994456366	0.582642414564925493	926575531394342913
210	MatthewLFouty	#wafflehouse #coffeelover #coffeecup Only $5 https://t.co/CByiWOvAO3 https://t.co/R7Zt0IBXeP	2017-11-03 18:40:20+00	neg	0.604111402513681561	0.258743481677140175	0.395888597486318383	926519430607196160
211	Bird33WV	RT @DerekMcIntyre: 5 things that makes @Bird33WV happy.\n\n1. Giada\n2. @wHippY_C \n3. #BostonCeltics \n4. #WaffleHouse\n5. #RicFlair \n\nWhat the…	2017-11-07 23:43:01+00	pos	0.273719753946083499	0.0253593813288988529	0.726280246053916501	928045153771802624
212	DerekMcIntyre	5 things that makes @Bird33WV happy.\n\n1. Giada\n2. @wHippY_C \n3. #BostonCeltics \n4. #WaffleHouse\n5. #RicFlair \n\nWhat… https://t.co/tEnaRtCPl1	2017-11-07 23:41:08+00	pos	0.291033220422070138	0.0194935713791869573	0.708966779577929862	928044680310415360
213	EdHeadington	🥞 Often pour the #coffee, click my boots 3 times &amp; say “There’s no place like #WaffleHouse.” ☕️ #coffee #coffeetime… https://t.co/fOwxgT2c7Y	2017-11-07 23:00:30+00	pos	0.449285661649821866	0.335450425079027559	0.550714338350178134	928034454605479937
214	asfreeasabird01	Galsgiving guest list: #JenelleEvans #RuthBaderGinsburg #TilaTequila #ChelseaHandler &amp;Vanessa who works at my local #WaffleHouse 👌#diversity	2017-11-07 20:47:52+00	neutral	0.33887971296525532	0.787601182084549989	0.66112028703474468	928001075189346304
215	mack_joka	🚨🚨#MackTightDebate "#WaffleHouse or #IHOP??" 🤔 Who You Choosing?? #Breakfast #JoinTheDebate ✔ #Debate ✔ -... https://t.co/MtEgo0pFsl	2017-11-07 20:17:58+00	pos	0.371981380912424608	0.421816367859911223	0.628018619087575392	927993551568244736
216	mack_joka	🚨🚨#MackTightDebate "#WaffleHouse or #IHOP??" 🤔 Who You Choosing?? #Breakfast #JoinTheDebate ✔ #Debate ✔ -... https://t.co/Kli5jOT2Oq	2017-11-07 20:16:44+00	pos	0.371981380912424608	0.421816367859911223	0.628018619087575392	927993241076563968
217	sunnyboysoul	Its an easy choice. Brunch and dinner! #waffles #wafflehouse #chicken #Temecula. #Murrieta #socalfood https://t.co/dxChISl74Q	2017-11-07 16:53:17+00	pos	0.314138575873664783	0.0621380682711314414	0.685861424126335217	927942040553390081
218	Model_Shanissa	Best #wafflehouse in Jackson TN\n#wafflehouseprincess. #food #foodporn #like #follow #share https://t.co/YXmOIxluq3	2017-11-07 15:09:57+00	pos	0.127042325179487881	0.442723422436538894	0.872957674820512119	927916034593505280
219	convince48	Album soon, 🐓, who ready, #wafflehouse #goodmorningpost #youcouldhavebeenhere #lol😂 #rapperelite… https://t.co/9alqh5C9E2	2017-11-07 14:57:10+00	neutral	0.46849478890955909	0.698438223297605076	0.53150521109044091	927912817516335104
220	iamjoelwayne	Final stop in SC. #wafflehouse #gritsfordays #successisspelledwaffle #dinercoffee @ Waffle House https://t.co/LlJma1NyvS	2017-11-07 14:12:29+00	neutral	0.635536896030888032	0.542941895266433661	0.364463103969112023	927901573631631360
221	BrynLorena	Look at that ring! Look at that beard! Look at that man!! \n•\n•\n•\n•\n•\n•\n#wafflehouse… https://t.co/4JWuppgIWj	2017-11-07 14:07:13+00	pos	0.474078332395210467	0.379562337251120929	0.525921667604789533	927900250207064065
222	thatboy_k	At #wafflehouse	2017-11-07 13:24:18+00	neutral	0.517250599758275031	0.61015935856137582	0.482749400241724913	927889447378735104
223	Jenesis_Brooke	@wnoahwtso ihop is that at anytime #wafflehouse 💛	2017-11-07 12:57:30+00	pos	0.464210893731094698	0.423748013505714727	0.535789106268905302	927882705303457792
224	georgeclontz	@DoctorYasmin @dradambanks @VerySmartBros @Stanford salt... butter, pepper,eggs,hashbrowns,bacon.. (Everything but… https://t.co/X8iZZV0rra	2017-11-07 03:58:25+00	neutral	0.568036599299923006	0.557747613603606029	0.431963400700076938	927747040804769792
225	playerpres76	Great way to start the day! 😁😁😁 #WaffleHouse #Scattered #Smothered #Covered https://t.co/NlmaaZpIMg	2017-11-08 15:43:19+00	neutral	0.34884783249803808	0.578590866708126761	0.65115216750196192	928286818856062976
226	PrettyBlackMyy	I just had the BEST steakcheese and bacon melt!!! 🥩 🧀 🥓 🥪 \n#WaffleHouse	2017-11-08 14:42:06+00	pos	0.393005200919506192	0.239076018793956319	0.606994799080493808	928271416671330304
227	BobbyBukks	Good morning. #wafflehouse https://t.co/xtgUpcpi9X	2017-11-08 13:38:22+00	pos	0.33430928564935658	0.317558211100400722	0.66569071435064342	928255374343528448
228	thatboy_k	At #wafflehouse	2017-11-08 12:39:40+00	neutral	0.517250599758275031	0.61015935856137582	0.482749400241724913	928240602088603649
229	DeWittbaby	#WaffleHouse at 5am after a long shift was well worth it.	2017-11-08 11:03:06+00	pos	0.48750364827169701	0.453708654647556664	0.51249635172830299	928216301486641152
230	MckinstryAZ	#shizham #wafflehouse plus #bacon (@ Waffle House) on #Yelp https://t.co/L9Q9hmQF2b	2017-11-08 07:43:36+00	neutral	0.616285012661443643	0.748096897078127765	0.383714987338556357	928166097328553985
231	XSLasvegas_Ken	RT @DerekMcIntyre: 5 things that makes @Bird33WV happy.\n\n1. Giada\n2. @wHippY_C \n3. #BostonCeltics \n4. #WaffleHouse\n5. #RicFlair \n\nWhat the…	2017-11-08 00:07:49+00	pos	0.273719753946083499	0.0253593813288988529	0.726280246053916501	928051396447842305
\.


--
-- Name: tweets_tweet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: azenwrath
--

SELECT pg_catalog.setval('tweets_tweet_id_seq', 231, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: tweets_tweet tweets_tweet_pkey; Type: CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY tweets_tweet
    ADD CONSTRAINT tweets_tweet_pkey PRIMARY KEY (id);


--
-- Name: tweets_tweet tweets_tweet_tweet_id_4681b9de_uniq; Type: CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY tweets_tweet
    ADD CONSTRAINT tweets_tweet_tweet_id_4681b9de_uniq UNIQUE (tweet_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: azenwrath
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: azenwrath
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: azenwrath
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: azenwrath
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: azenwrath
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: azenwrath
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: azenwrath
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: azenwrath
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: azenwrath
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: azenwrath
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: azenwrath
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: azenwrath
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: azenwrath
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: tweets_tweet_tweet_id_4681b9de_like; Type: INDEX; Schema: public; Owner: azenwrath
--

CREATE INDEX tweets_tweet_tweet_id_4681b9de_like ON tweets_tweet USING btree (tweet_id varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: azenwrath
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

