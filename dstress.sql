-- Restore DB after cloning using: 
-- pg_restore -U postgres -d postgres -F p dstress.sql


-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- /// NEED TO EDIT ///

CREATE TABLE public.activity (
    activity_id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    activity_type character varying(50),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT activities_activity_type_check CHECK (((activity_type)::text = ANY ((ARRAY['game'::character varying, 'exercise'::character varying, 'task'::character varying])::text[])))
);


ALTER TABLE public.activity OWNER TO postgres;

--
-- Name: activities_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activities_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.activities_activity_id_seq OWNER TO postgres;

--
-- Name: activities_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activities_activity_id_seq OWNED BY public.activity.activity_id;


--
-- Name: booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking (
    booking_id integer NOT NULL,
    user_id integer,
    professional_id bigint,
    appointment_date date NOT NULL,
    status character varying(255),
    payment_status character varying(255),
    CONSTRAINT booking_payment_status_check CHECK (((payment_status)::text = ANY (ARRAY[('PENDING'::character varying)::text, ('COMPLETED'::character varying)::text]))),
    CONSTRAINT booking_status_check CHECK (((status)::text = ANY (ARRAY[('PENDING'::character varying)::text, ('CONFIRMED'::character varying)::text, ('CANCELLED'::character varying)::text])))
);


ALTER TABLE public.booking OWNER TO postgres;

--
-- Name: booking_booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.booking_booking_id_seq OWNER TO postgres;

--
-- Name: booking_booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_booking_id_seq OWNED BY public.booking.booking_id;


--
-- Name: forumcomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forumcomment (
    comment_id integer NOT NULL,
    post_id integer,
    user_id integer,
    content text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.forumcomment OWNER TO postgres;

--
-- Name: forumcomments_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forumcomments_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.forumcomments_comment_id_seq OWNER TO postgres;

--
-- Name: forumcomments_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forumcomments_comment_id_seq OWNED BY public.forumcomment.comment_id;


--
-- Name: forumpost; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forumpost (
    post_id integer NOT NULL,
    user_id integer,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.forumpost OWNER TO postgres;

--
-- Name: forumposts_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forumposts_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.forumposts_post_id_seq OWNER TO postgres;

--
-- Name: forumposts_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forumposts_post_id_seq OWNED BY public.forumpost.post_id;


--
-- Name: option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.option (
    option_id bigint NOT NULL,
    questionnaire_id integer,
    question_id bigint,
    option_text character varying(255),
    select_option_id integer
);


ALTER TABLE public.option OWNER TO postgres;

--
-- Name: option_option_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.option_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.option_option_id_seq OWNER TO postgres;

--
-- Name: option_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.option_option_id_seq OWNED BY public.option.option_id;


--
-- Name: option_templates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.option_templates (
    template_id bigint NOT NULL,
    option_text text[]
);


ALTER TABLE public.option_templates OWNER TO postgres;

--
-- Name: option_templates_template_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.option_templates ALTER COLUMN template_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.option_templates_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: professional; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professional (
    professional_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    specialization character varying(255),
    contact_info bigint,
    bio character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    pid bigint NOT NULL,
    email character varying(255),
    password character varying(255),
    image_url character varying(255),
    cv_url character varying(255)
);


ALTER TABLE public.professional OWNER TO postgres;

--
-- Name: professional_pid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.professional ALTER COLUMN pid ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.professional_pid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: professionals_professional_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.professionals_professional_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.professionals_professional_id_seq OWNER TO postgres;

--
-- Name: professionals_professional_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.professionals_professional_id_seq OWNED BY public.professional.professional_id;


--
-- Name: profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile (
    user_id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_of_birth character varying(255)
);


ALTER TABLE public.profile OWNER TO postgres;

--
-- Name: question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question (
    question_id bigint NOT NULL,
    questionnaire_id bigint,
    question_text character varying(255) NOT NULL,
    question_type character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.question OWNER TO postgres;

--
-- Name: questionnaire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questionnaire (
    questionnaire_id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.questionnaire OWNER TO postgres;

--
-- Name: questionnaires_questionnaire_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questionnaires_questionnaire_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.questionnaires_questionnaire_id_seq OWNER TO postgres;

--
-- Name: questionnaires_questionnaire_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questionnaires_questionnaire_id_seq OWNED BY public.questionnaire.questionnaire_id;


--
-- Name: questions_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questions_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.questions_question_id_seq OWNER TO postgres;

--
-- Name: questions_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questions_question_id_seq OWNED BY public.question.question_id;


--
-- Name: resource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource (
    resource_id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255),
    link character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT resources_resource_type_check CHECK (((type)::text = ANY (ARRAY[('article'::character varying)::text, ('video'::character varying)::text, ('book'::character varying)::text])))
);


ALTER TABLE public.resource OWNER TO postgres;

--
-- Name: resources_resource_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resources_resource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.resources_resource_id_seq OWNER TO postgres;

--
-- Name: resources_resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resources_resource_id_seq OWNED BY public.resource.resource_id;


--
-- Name: response; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.response (
    response_id bigint NOT NULL,
    user_id integer,
    question_id bigint,
    option_id integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    score integer NOT NULL,
    questionnaire_id bigint,
    selected_option_id bigint
);


ALTER TABLE public.response OWNER TO postgres;

--
-- Name: response_response_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.response_response_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.response_response_id_seq OWNER TO postgres;

--
-- Name: response_response_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.response_response_id_seq OWNED BY public.response.response_id;


--
-- Name: task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task (
    task_id integer NOT NULL,
    created_at timestamp(6) without time zone,
    is_completed boolean NOT NULL,
    task_name character varying(255),
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.task OWNER TO postgres;

--
-- Name: task_task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.task ALTER COLUMN task_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.task_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction (
    transaction_id integer NOT NULL,
    booking_id integer,
    amount numeric(10,2) NOT NULL,
    payment_method character varying(10),
    transaction_date timestamp without time zone NOT NULL,
    transaction_status character varying(10),
    CONSTRAINT transaction_payment_method_check CHECK (((payment_method)::text = ANY ((ARRAY['CARD'::character varying, 'UPI'::character varying, 'etc.'::character varying])::text[]))),
    CONSTRAINT transaction_transaction_status_check CHECK (((transaction_status)::text = ANY ((ARRAY['SUCCESS'::character varying, 'FAILED'::character varying])::text[])))
);


ALTER TABLE public.transaction OWNER TO postgres;

--
-- Name: transaction_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_transaction_id_seq OWNER TO postgres;

--
-- Name: transaction_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_transaction_id_seq OWNED BY public.transaction.transaction_id;


--
-- Name: useractivity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.useractivity (
    user_activity_id integer NOT NULL,
    user_id integer,
    activity_id integer,
    completion_status character varying(50),
    score integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT useractivities_completion_status_check CHECK (((completion_status)::text = ANY ((ARRAY['completed'::character varying, 'in_progress'::character varying, 'not_started'::character varying])::text[])))
);


ALTER TABLE public.useractivity OWNER TO postgres;

--
-- Name: useractivities_user_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.useractivities_user_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.useractivities_user_activity_id_seq OWNER TO postgres;

--
-- Name: useractivities_user_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.useractivities_user_activity_id_seq OWNED BY public.useractivity.user_activity_id;


--
-- Name: userprogress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userprogress (
    progress_id integer NOT NULL,
    user_id integer,
    metric_name character varying(255) NOT NULL,
    metric_value double precision NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.userprogress OWNER TO postgres;

--
-- Name: userprogress_progress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.userprogress_progress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.userprogress_progress_id_seq OWNER TO postgres;

--
-- Name: userprogress_progress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.userprogress_progress_id_seq OWNED BY public.userprogress.progress_id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.profile.user_id;


--
-- Name: activity activity_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity ALTER COLUMN activity_id SET DEFAULT nextval('public.activities_activity_id_seq'::regclass);


--
-- Name: booking booking_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking ALTER COLUMN booking_id SET DEFAULT nextval('public.booking_booking_id_seq'::regclass);


--
-- Name: forumcomment comment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forumcomment ALTER COLUMN comment_id SET DEFAULT nextval('public.forumcomments_comment_id_seq'::regclass);


--
-- Name: forumpost post_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forumpost ALTER COLUMN post_id SET DEFAULT nextval('public.forumposts_post_id_seq'::regclass);


--
-- Name: option option_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.option ALTER COLUMN option_id SET DEFAULT nextval('public.option_option_id_seq'::regclass);


--
-- Name: professional professional_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professional ALTER COLUMN professional_id SET DEFAULT nextval('public.professionals_professional_id_seq'::regclass);


--
-- Name: profile user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: question question_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question ALTER COLUMN question_id SET DEFAULT nextval('public.questions_question_id_seq'::regclass);


--
-- Name: questionnaire questionnaire_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire ALTER COLUMN questionnaire_id SET DEFAULT nextval('public.questionnaires_questionnaire_id_seq'::regclass);


--
-- Name: resource resource_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource ALTER COLUMN resource_id SET DEFAULT nextval('public.resources_resource_id_seq'::regclass);


--
-- Name: response response_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.response ALTER COLUMN response_id SET DEFAULT nextval('public.response_response_id_seq'::regclass);


--
-- Name: transaction transaction_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction ALTER COLUMN transaction_id SET DEFAULT nextval('public.transaction_transaction_id_seq'::regclass);


--
-- Name: useractivity user_activity_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.useractivity ALTER COLUMN user_activity_id SET DEFAULT nextval('public.useractivities_user_activity_id_seq'::regclass);


--
-- Name: userprogress progress_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userprogress ALTER COLUMN progress_id SET DEFAULT nextval('public.userprogress_progress_id_seq'::regclass);


--
-- Data for Name: activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activity (activity_id, title, description, activity_type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking (booking_id, user_id, professional_id, appointment_date, status, payment_status) FROM stdin;
\.


--
-- Data for Name: forumcomment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forumcomment (comment_id, post_id, user_id, content, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: forumpost; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forumpost (post_id, user_id, title, content, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.option (option_id, questionnaire_id, question_id, option_text, select_option_id) FROM stdin;
16	1	4	 Never: You always have enough time for everything.	\N
17	1	4	 Rarely: You rarely feel pressed for time.	\N
18	1	4	 Sometimes: You sometimes feel like you're running out of time.	\N
19	1	4	 Often: You frequently feel you have too much to do.	\N
20	1	4	 Always: You always feel overwhelmed by a lack of time.	\N
21	1	5	 Never: You complete assignments and study well in advance.	\N
22	1	5	 Rarely: You occasionally procrastinate, but it's not a habit.	\N
23	1	5	 Sometimes: You procrastinate regularly but usually catch up.	\N
24	1	5	 Often: You frequently delay assignments and study at the last minute.	\N
25	1	5	 Always: You always procrastinate and struggle to finish on time.	\N
26	1	6	 Never: Conflicts with peers don't bother you at all.	\N
27	1	6	 Rarely: You occasionally feel stressed by conflicts, but it's not common.	\N
28	1	6	 Sometimes: You sometimes find conflicts stressful.	\N
29	1	6	 Often: You frequently feel stressed by conflicts with peers.	\N
30	1	6	 Always: Conflicts with friends or classmates always stress you out.	\N
31	1	7	 Never: You don't feel any pressure from your peers.	\N
32	1	7	 Rarely: You rarely feel pressured by others' expectations.	\N
33	1	7	 Sometimes: You sometimes feel the need to perform well because of peer pressure.	\N
34	1	7	 Often: You often feel stressed by the pressure to keep up with peers.	\N
35	1	7	 Always: You always feel under pressure to perform because of your peers.	\N
36	1	8	 Very satisfied: You are very happy with your social life.	\N
37	1	8	 Satisfied: You are generally content with your social interactions.	\N
38	1	8	 Neutral: You feel indifferent about your social life.	\N
39	1	8	 Unsatisfied: You are unhappy with your social interactions.	\N
40	1	8	 Very unsatisfied: You are very dissatisfied with your social life.	\N
41	1	9	 Never: Your family's expectations don't cause you any stress.	\N
42	1	9	 Rarely: You occasionally feel stressed, but it's manageable.	\N
43	1	9	 Sometimes: You sometimes feel pressured by family expectations.	\N
44	1	9	 Often: You frequently feel stressed by what your family expects from you.	\N
45	1	9	 Always: Your family's expectations constantly cause you stress.	\N
46	1	10	 Never: You always feel you meet your family's expectations.	\N
47	1	10	 Rarely: You occasionally feel you're not meeting expectations.	\N
48	1	10	 Sometimes: You sometimes feel you're falling short of expectations.	\N
49	1	10	 Often: You frequently feel you're not meeting your family's expectations.	\N
50	1	10	 Always: You constantly feel you're not living up to your family's expectations.	\N
51	1	11	 Never: You openly discuss your challenges with your family.	\N
52	1	11	 Rarely: You rarely struggle to talk about your academic issues.	\N
53	1	11	 Sometimes: You sometimes find it hard to share academic problems.	\N
54	1	11	 Often: You often struggle to discuss academic challenges with your family.	\N
55	1	11	 Always: You always find it difficult to talk about your academic issues with your family.	\N
56	1	12	 Never: You don't experience physical symptoms related to stress.	\N
57	1	12	 Rarely: You occasionally feel fatigued or have headaches due to stress.	\N
58	1	12	 Sometimes: You sometimes experience physical symptoms from academic stress.	\N
59	1	12	 Often: You frequently suffer from headaches or fatigue due to stress.	\N
60	1	12	 Always: You constantly experience physical symptoms related to academic stress	\N
61	1	13	 Never: You sleep well and are not affected by academic stress.	\N
62	1	13	 Rarely: You occasionally have trouble sleeping due to academic concerns.	\N
63	1	13	 Sometimes: You sometimes struggle to sleep because of stress.	\N
64	1	13	 Often: You frequently have trouble sleeping because of academic worries.	\N
65	1	13	 Always: You always have difficulty sleeping due to academic stress.	\N
66	1	14	 Never: You rarely feel anxious or stressed.	\N
67	1	14	 Rarely: You occasionally feel anxious, but it doesn't affect you much.	\N
68	1	14	 Sometimes: You sometimes feel stressed or anxious.	\N
69	1	14	 Often: You frequently feel stressed or anxious.	\N
70	1	14	 Always: You constantly feel anxious or stressed.	\N
6	1	2	 Always: You constantly feel overwhelmed and behind in your studies.	\N
7	1	2	 Never: Exams and deadlines don't cause you stress.	\N
8	1	2	 Rarely: You feel a little anxious, but it's manageable.	\N
9	1	2	 Sometimes: You often worry about exams and deadlines.	\N
10	1	2	 Always: You are always anxious about upcoming exams and deadlines.	\N
11	1	3	 Never: You easily balance academics and other activities.	\N
12	1	3	 Rarely: You occasionally struggle, but it's rare.	\N
13	1	3	 Sometimes: You sometimes find it hard to balance both.	\N
14	1	3	 Often: You frequently struggle to maintain a balance.	\N
15	1	3	 Always: You always find it difficult to manage both academics and other activities.	\N
1	1	1	 Never: You always manage to stay on top of your studies without stress.	\N
2	1	1	 Never: You always manage to stay on top of your studies without stress.	\N
3	1	1	 Rarely: You occasionally feel overwhelmed but quickly catch up.	\N
4	1	1	 Sometimes: You sometimes feel overwhelmed, especially before exams.	\N
5	1	1	 Often: You frequently struggle to keep up with your study load.	\N
\.


--
-- Data for Name: option_templates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.option_templates (template_id, option_text) FROM stdin;
\.


--
-- Data for Name: professional; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.professional (professional_id, name, specialization, contact_info, bio, created_at, updated_at, pid, email, password, image_url, cv_url) FROM stdin;
1	Dr. ADBC	Therapist	\N	\N	2024-12-08 20:00:17.260748+05:30	2024-12-08 20:00:17.260748+05:30	17	abc@gmail.com	\N	C:/Users/arpita/OneDrive/Project/BackendStuff/uploads/images	\N
\.


--
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile (user_id, username, email, password, created_at, updated_at, date_of_birth) FROM stdin;
9	abc	abc@gmail.com	12345678	2024-09-24 17:20:20.869661+05:30	2024-09-24 17:20:20.870661+05:30	\N
10	john_doe	john123@gmail.com	password123	2024-09-24 18:26:53.815039+05:30	2024-09-24 18:26:53.816883+05:30	\N
12	jk	jk@gmail.com	563214	2024-09-25 14:49:48.970796+05:30	2024-09-25 14:49:48.982821+05:30	\N
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question (question_id, questionnaire_id, question_text, question_type, created_at, updated_at) FROM stdin;
1	1	How often do you feel overwhelmed(burdened/stressed to the point you are unable to focus) by the amount of study material you need to cover?	Academic Pressure	2024-09-23 20:19:44.408589+05:30	2024-09-23 20:19:44.408589+05:30
2	1	How often do you feel anxious about exams or deadlines?	Academic Pressure	2024-09-23 20:20:04.25349+05:30	2024-09-23 20:20:04.25349+05:30
3	1	Do you struggle to balance your academic responsibilities with other activities like hobbies or social life? 	Time Management	2024-09-23 20:20:44.854946+05:30	2024-09-23 20:20:44.854946+05:30
4	1	 How often do you feel you have too much to do and not enough time?	Time Management	2024-09-23 20:20:44.854946+05:30	2024-09-23 20:20:44.854946+05:30
5	1	Do you often procrastinate on assignments or studying? 	Time Management	2024-09-23 20:20:44.854946+05:30	2024-09-23 20:20:44.854946+05:30
6	1	How often do conflicts with friends or classmates cause you stress?	Peer Relationships	2024-09-23 20:21:02.411317+05:30	2024-09-23 20:21:02.411317+05:30
7	1	Do you feel pressured by your peers to perform well academically? 	Peer Relationships	2024-09-23 20:21:02.411317+05:30	2024-09-23 20:21:02.411317+05:30
8	1	How satisfied are you with your social interactions at school or college? 	Peer Relationships	2024-09-23 20:21:02.411317+05:30	2024-09-23 20:21:02.411317+05:30
9	1	Do you feel stressed by the academic expectations your family has of you?	Family Exceptations	2024-09-23 20:23:30.157514+05:30	2024-09-23 20:23:30.157514+05:30
10	1	How often do you feel that you are not meeting your family's expectations in your studies?	Family Expectations	2024-09-23 20:28:08.423884+05:30	2024-09-23 20:28:08.423884+05:30
11	1	Do you find it difficult to discuss your academic challenges with your family?	Family Expectations	2024-09-23 20:28:08.423884+05:30	2024-09-23 20:28:08.423884+05:30
12	1	How often do you experience physical symptoms like headaches or fatigue due to academic stress? 	Personal Well-being	2024-09-23 20:29:18.961266+05:30	2024-09-23 20:29:18.961266+05:30
13	1	Do you have trouble sleeping because of academic worries? 	Personal Well-being	2024-09-23 20:29:18.961266+05:30	2024-09-23 20:29:18.961266+05:30
14	1	How often do you feel anxious or stressed in general? 	Personal Well-being	2024-09-23 20:29:18.961266+05:30	2024-09-23 20:29:18.961266+05:30
\.


--
-- Data for Name: questionnaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questionnaire (questionnaire_id, title, description, created_at, updated_at) FROM stdin;
1	Non-clinical	First part of questionnaire	2024-09-18 18:07:22.407194+05:30	2024-09-18 18:07:22.407194+05:30
2	Clinical	Second part of questionnaire	2024-09-18 18:07:22.407194+05:30	2024-09-18 18:07:22.407194+05:30
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource (resource_id, title, description, type, link, created_at, updated_at) FROM stdin;
1	two days one night	variety show of celebrities doing small tasks for living	video	https://#	2024-08-26 03:11:31.607623+05:30	2024-08-26 03:11:31.607623+05:30
2	do epic shit	great book by ankoor varikar	book	https://#	2024-08-26 03:11:31.607623+05:30	2024-08-26 03:11:31.607623+05:30
3	how to get sleep asap	best remedies to sleep better and early	article	https://#	2024-08-26 03:11:31.607623+05:30	2024-08-26 03:11:31.607623+05:30
\.


--
-- Data for Name: response; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.response (response_id, user_id, question_id, option_id, created_at, score, questionnaire_id, selected_option_id) FROM stdin;
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.task (task_id, created_at, is_completed, task_name, updated_at) FROM stdin;
1	2024-11-30 12:29:22.073141	f	\N	2024-11-30 12:29:22.073141
2	2024-12-02 10:51:54.778296	f	\N	2024-12-02 10:51:54.779295
3	2024-12-02 10:52:03.448528	f	\N	2024-12-02 10:52:03.448528
4	2024-12-02 10:53:18.161693	f	Journaling	2024-12-02 10:53:18.161693
5	2024-12-02 10:53:23.40868	f	Journaling	2024-12-02 10:53:23.40868
\.


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction (transaction_id, booking_id, amount, payment_method, transaction_date, transaction_status) FROM stdin;
\.


--
-- Data for Name: useractivity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.useractivity (user_activity_id, user_id, activity_id, completion_status, score, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: userprogress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.userprogress (progress_id, user_id, metric_name, metric_value, created_at, updated_at) FROM stdin;
\.


--
-- Name: activities_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activities_activity_id_seq', 1, false);


--
-- Name: booking_booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_booking_id_seq', 1, false);


--
-- Name: forumcomments_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forumcomments_comment_id_seq', 1, false);


--
-- Name: forumposts_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forumposts_post_id_seq', 1, false);


--
-- Name: option_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.option_option_id_seq', 1, false);


--
-- Name: option_templates_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.option_templates_template_id_seq', 1, false);


--
-- Name: professional_pid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.professional_pid_seq', 17, true);


--
-- Name: professionals_professional_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.professionals_professional_id_seq', 15, true);


--
-- Name: questionnaires_questionnaire_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questionnaires_questionnaire_id_seq', 1, false);


--
-- Name: questions_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questions_question_id_seq', 1, false);


--
-- Name: resources_resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resources_resource_id_seq', 1, false);


--
-- Name: response_response_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.response_response_id_seq', 1, false);


--
-- Name: task_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_task_id_seq', 5, true);


--
-- Name: transaction_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_transaction_id_seq', 1, false);


--
-- Name: useractivities_user_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.useractivities_user_activity_id_seq', 1, false);


--
-- Name: userprogress_progress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.userprogress_progress_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 12, true);


--
-- Name: activity activities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activities_pkey PRIMARY KEY (activity_id);


--
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (booking_id);


--
-- Name: forumcomment forumcomments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forumcomment
    ADD CONSTRAINT forumcomments_pkey PRIMARY KEY (comment_id);


--
-- Name: forumpost forumposts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forumpost
    ADD CONSTRAINT forumposts_pkey PRIMARY KEY (post_id);


--
-- Name: option option_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.option
    ADD CONSTRAINT option_pkey PRIMARY KEY (option_id);


--
-- Name: option_templates option_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.option_templates
    ADD CONSTRAINT option_templates_pkey PRIMARY KEY (template_id);


--
-- Name: professional professionals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professional
    ADD CONSTRAINT professionals_pkey PRIMARY KEY (professional_id);


--
-- Name: questionnaire questionnaires_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaires_pkey PRIMARY KEY (questionnaire_id);


--
-- Name: question questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT questions_pkey PRIMARY KEY (question_id);


--
-- Name: resource resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resources_pkey PRIMARY KEY (resource_id);


--
-- Name: response response_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.response
    ADD CONSTRAINT response_pkey PRIMARY KEY (response_id);


--
-- Name: task task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (task_id);


--
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (transaction_id);


--
-- Name: useractivity useractivities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.useractivity
    ADD CONSTRAINT useractivities_pkey PRIMARY KEY (user_activity_id);


--
-- Name: userprogress userprogress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userprogress
    ADD CONSTRAINT userprogress_pkey PRIMARY KEY (progress_id);


--
-- Name: profile users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: profile users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: profile users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: booking booking_professional_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_professional_id_fkey FOREIGN KEY (professional_id) REFERENCES public.professional(professional_id);


--
-- Name: booking booking_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profile(user_id);


--
-- Name: response fk8i6vilu3v2tk0r0bytwxuelts; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.response
    ADD CONSTRAINT fk8i6vilu3v2tk0r0bytwxuelts FOREIGN KEY (questionnaire_id) REFERENCES public.questionnaire(questionnaire_id);


--
-- Name: response fkstt88u6v02rpune40r68m70fi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.response
    ADD CONSTRAINT fkstt88u6v02rpune40r68m70fi FOREIGN KEY (selected_option_id) REFERENCES public.option(option_id);


--
-- Name: forumcomment forumcomments_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forumcomment
    ADD CONSTRAINT forumcomments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.forumpost(post_id) ON DELETE CASCADE;


--
-- Name: forumcomment forumcomments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forumcomment
    ADD CONSTRAINT forumcomments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profile(user_id) ON DELETE CASCADE;


--
-- Name: forumpost forumposts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forumpost
    ADD CONSTRAINT forumposts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profile(user_id) ON DELETE CASCADE;


--
-- Name: option option_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.option
    ADD CONSTRAINT option_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question(question_id) ON DELETE CASCADE;


--
-- Name: option option_questionnaire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.option
    ADD CONSTRAINT option_questionnaire_id_fkey FOREIGN KEY (questionnaire_id) REFERENCES public.questionnaire(questionnaire_id) ON DELETE CASCADE;


--
-- Name: question questions_questionnaire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT questions_questionnaire_id_fkey FOREIGN KEY (questionnaire_id) REFERENCES public.questionnaire(questionnaire_id) ON DELETE CASCADE;


--
-- Name: response response_option_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.response
    ADD CONSTRAINT response_option_id_fkey FOREIGN KEY (option_id) REFERENCES public.option(option_id);


--
-- Name: response response_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.response
    ADD CONSTRAINT response_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question(question_id);


--
-- Name: response response_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.response
    ADD CONSTRAINT response_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profile(user_id);


--
-- Name: transaction transaction_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.booking(booking_id);


--
-- Name: useractivity useractivities_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.useractivity
    ADD CONSTRAINT useractivities_activity_id_fkey FOREIGN KEY (activity_id) REFERENCES public.activity(activity_id) ON DELETE CASCADE;


--
-- Name: useractivity useractivities_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.useractivity
    ADD CONSTRAINT useractivities_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profile(user_id) ON DELETE CASCADE;


--
-- Name: userprogress userprogress_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userprogress
    ADD CONSTRAINT userprogress_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profile(user_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

