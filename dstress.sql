PGDMP  !    &                }            postgres    16.4    16.4 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     {   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    5041                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            �           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    16535    activity    TABLE     �  CREATE TABLE public.activity (
    activity_id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    activity_type character varying(50),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT activities_activity_type_check CHECK (((activity_type)::text = ANY ((ARRAY['game'::character varying, 'exercise'::character varying, 'task'::character varying])::text[])))
);
    DROP TABLE public.activity;
       public         heap    postgres    false            �            1259    16534    activities_activity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.activities_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.activities_activity_id_seq;
       public          postgres    false    233            �           0    0    activities_activity_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.activities_activity_id_seq OWNED BY public.activity.activity_id;
          public          postgres    false    232            �            1259    16966    booking    TABLE     P  CREATE TABLE public.booking (
    booking_id integer NOT NULL,
    user_id integer,
    professional_id bigint,
    appointment_date date NOT NULL,
    status character varying(255),
    payment_status character varying(255),
    CONSTRAINT booking_payment_status_check CHECK (((payment_status)::text = ANY (ARRAY[('PENDING'::character varying)::text, ('COMPLETED'::character varying)::text]))),
    CONSTRAINT booking_status_check CHECK (((status)::text = ANY (ARRAY[('PENDING'::character varying)::text, ('CONFIRMED'::character varying)::text, ('CANCELLED'::character varying)::text])))
);
    DROP TABLE public.booking;
       public         heap    postgres    false            �            1259    16965    booking_booking_id_seq    SEQUENCE     �   CREATE SEQUENCE public.booking_booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.booking_booking_id_seq;
       public          postgres    false    244            �           0    0    booking_booking_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.booking_booking_id_seq OWNED BY public.booking.booking_id;
          public          postgres    false    243            �            1259    16500    forumcomment    TABLE       CREATE TABLE public.forumcomment (
    comment_id integer NOT NULL,
    post_id integer,
    user_id integer,
    content text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
     DROP TABLE public.forumcomment;
       public         heap    postgres    false            �            1259    16499    forumcomments_comment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.forumcomments_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.forumcomments_comment_id_seq;
       public          postgres    false    229            �           0    0    forumcomments_comment_id_seq    SEQUENCE OWNED BY     \   ALTER SEQUENCE public.forumcomments_comment_id_seq OWNED BY public.forumcomment.comment_id;
          public          postgres    false    228            �            1259    16484 	   forumpost    TABLE     !  CREATE TABLE public.forumpost (
    post_id integer NOT NULL,
    user_id integer,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.forumpost;
       public         heap    postgres    false            �            1259    16483    forumposts_post_id_seq    SEQUENCE     �   CREATE SEQUENCE public.forumposts_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.forumposts_post_id_seq;
       public          postgres    false    227            �           0    0    forumposts_post_id_seq    SEQUENCE OWNED BY     P   ALTER SEQUENCE public.forumposts_post_id_seq OWNED BY public.forumpost.post_id;
          public          postgres    false    226            �            1259    16749    option    TABLE     �   CREATE TABLE public.option (
    option_id bigint NOT NULL,
    questionnaire_id integer,
    question_id bigint,
    option_text character varying(255),
    select_option_id integer
);
    DROP TABLE public.option;
       public         heap    postgres    false            �            1259    16748    option_option_id_seq    SEQUENCE     �   CREATE SEQUENCE public.option_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.option_option_id_seq;
       public          postgres    false    238            �           0    0    option_option_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.option_option_id_seq OWNED BY public.option.option_id;
          public          postgres    false    237            �            1259    16864    option_templates    TABLE     b   CREATE TABLE public.option_templates (
    template_id bigint NOT NULL,
    option_text text[]
);
 $   DROP TABLE public.option_templates;
       public         heap    postgres    false            �            1259    16863     option_templates_template_id_seq    SEQUENCE     �   ALTER TABLE public.option_templates ALTER COLUMN template_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.option_templates_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    242            �            1259    16473    professional    TABLE       CREATE TABLE public.professional (
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
     DROP TABLE public.professional;
       public         heap    postgres    false            �            1259    16689    professional_pid_seq    SEQUENCE     �   ALTER TABLE public.professional ALTER COLUMN pid ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.professional_pid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    225            �            1259    16472 !   professionals_professional_id_seq    SEQUENCE     �   CREATE SEQUENCE public.professionals_professional_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.professionals_professional_id_seq;
       public          postgres    false    225            �           0    0 !   professionals_professional_id_seq    SEQUENCE OWNED BY     f   ALTER SEQUENCE public.professionals_professional_id_seq OWNED BY public.professional.professional_id;
          public          postgres    false    224            �            1259    16398    profile    TABLE     u  CREATE TABLE public.profile (
    user_id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_of_birth character varying(255)
);
    DROP TABLE public.profile;
       public         heap    postgres    false            �            1259    16424    question    TABLE     B  CREATE TABLE public.question (
    question_id bigint NOT NULL,
    questionnaire_id bigint,
    question_text character varying(255) NOT NULL,
    question_type character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.question;
       public         heap    postgres    false            �            1259    16413    questionnaire    TABLE     %  CREATE TABLE public.questionnaire (
    questionnaire_id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 !   DROP TABLE public.questionnaire;
       public         heap    postgres    false            �            1259    16412 #   questionnaires_questionnaire_id_seq    SEQUENCE     �   CREATE SEQUENCE public.questionnaires_questionnaire_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.questionnaires_questionnaire_id_seq;
       public          postgres    false    219            �           0    0 #   questionnaires_questionnaire_id_seq    SEQUENCE OWNED BY     j   ALTER SEQUENCE public.questionnaires_questionnaire_id_seq OWNED BY public.questionnaire.questionnaire_id;
          public          postgres    false    218            �            1259    16423    questions_question_id_seq    SEQUENCE     �   CREATE SEQUENCE public.questions_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.questions_question_id_seq;
       public          postgres    false    221            �           0    0    questions_question_id_seq    SEQUENCE OWNED BY     V   ALTER SEQUENCE public.questions_question_id_seq OWNED BY public.question.question_id;
          public          postgres    false    220            �            1259    16461    resource    TABLE       CREATE TABLE public.resource (
    resource_id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255),
    link character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT resources_resource_type_check CHECK (((type)::text = ANY (ARRAY[('article'::character varying)::text, ('video'::character varying)::text, ('book'::character varying)::text])))
);
    DROP TABLE public.resource;
       public         heap    postgres    false            �            1259    16460    resources_resource_id_seq    SEQUENCE     �   CREATE SEQUENCE public.resources_resource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.resources_resource_id_seq;
       public          postgres    false    223            �           0    0    resources_resource_id_seq    SEQUENCE OWNED BY     V   ALTER SEQUENCE public.resources_resource_id_seq OWNED BY public.resource.resource_id;
          public          postgres    false    222            �            1259    16786    response    TABLE     !  CREATE TABLE public.response (
    response_id bigint NOT NULL,
    user_id integer,
    question_id bigint,
    option_id integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    score integer NOT NULL,
    questionnaire_id bigint,
    selected_option_id bigint
);
    DROP TABLE public.response;
       public         heap    postgres    false            �            1259    16785    response_response_id_seq    SEQUENCE     �   CREATE SEQUENCE public.response_response_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.response_response_id_seq;
       public          postgres    false    240            �           0    0    response_response_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.response_response_id_seq OWNED BY public.response.response_id;
          public          postgres    false    239            �            1259    17098    task    TABLE     �   CREATE TABLE public.task (
    task_id integer NOT NULL,
    created_at timestamp(6) without time zone,
    is_completed boolean NOT NULL,
    task_name character varying(255),
    updated_at timestamp(6) without time zone
);
    DROP TABLE public.task;
       public         heap    postgres    false            �            1259    17097    task_task_id_seq    SEQUENCE     �   ALTER TABLE public.task ALTER COLUMN task_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.task_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    248            �            1259    16985    transaction    TABLE     ~  CREATE TABLE public.transaction (
    transaction_id integer NOT NULL,
    booking_id integer,
    amount numeric(10,2) NOT NULL,
    payment_method character varying(10),
    transaction_date timestamp without time zone NOT NULL,
    transaction_status character varying(10),
    CONSTRAINT transaction_payment_method_check CHECK (((payment_method)::text = ANY ((ARRAY['CARD'::character varying, 'UPI'::character varying, 'etc.'::character varying])::text[]))),
    CONSTRAINT transaction_transaction_status_check CHECK (((transaction_status)::text = ANY ((ARRAY['SUCCESS'::character varying, 'FAILED'::character varying])::text[])))
);
    DROP TABLE public.transaction;
       public         heap    postgres    false            �            1259    16984    transaction_transaction_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transaction_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.transaction_transaction_id_seq;
       public          postgres    false    246            �           0    0    transaction_transaction_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.transaction_transaction_id_seq OWNED BY public.transaction.transaction_id;
          public          postgres    false    245            �            1259    16547    useractivity    TABLE       CREATE TABLE public.useractivity (
    user_activity_id integer NOT NULL,
    user_id integer,
    activity_id integer,
    completion_status character varying(50),
    score integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT useractivities_completion_status_check CHECK (((completion_status)::text = ANY ((ARRAY['completed'::character varying, 'in_progress'::character varying, 'not_started'::character varying])::text[])))
);
     DROP TABLE public.useractivity;
       public         heap    postgres    false            �            1259    16546 #   useractivities_user_activity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.useractivities_user_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.useractivities_user_activity_id_seq;
       public          postgres    false    235            �           0    0 #   useractivities_user_activity_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.useractivities_user_activity_id_seq OWNED BY public.useractivity.user_activity_id;
          public          postgres    false    234            �            1259    16521    userprogress    TABLE     ?  CREATE TABLE public.userprogress (
    progress_id integer NOT NULL,
    user_id integer,
    metric_name character varying(255) NOT NULL,
    metric_value double precision NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
     DROP TABLE public.userprogress;
       public         heap    postgres    false            �            1259    16520    userprogress_progress_id_seq    SEQUENCE     �   CREATE SEQUENCE public.userprogress_progress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.userprogress_progress_id_seq;
       public          postgres    false    231            �           0    0    userprogress_progress_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.userprogress_progress_id_seq OWNED BY public.userprogress.progress_id;
          public          postgres    false    230            �            1259    16397    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    217            �           0    0    users_user_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.profile.user_id;
          public          postgres    false    216            �           2604    16538    activity activity_id    DEFAULT     ~   ALTER TABLE ONLY public.activity ALTER COLUMN activity_id SET DEFAULT nextval('public.activities_activity_id_seq'::regclass);
 C   ALTER TABLE public.activity ALTER COLUMN activity_id DROP DEFAULT;
       public          postgres    false    232    233    233            �           2604    16969    booking booking_id    DEFAULT     x   ALTER TABLE ONLY public.booking ALTER COLUMN booking_id SET DEFAULT nextval('public.booking_booking_id_seq'::regclass);
 A   ALTER TABLE public.booking ALTER COLUMN booking_id DROP DEFAULT;
       public          postgres    false    243    244    244            �           2604    16503    forumcomment comment_id    DEFAULT     �   ALTER TABLE ONLY public.forumcomment ALTER COLUMN comment_id SET DEFAULT nextval('public.forumcomments_comment_id_seq'::regclass);
 F   ALTER TABLE public.forumcomment ALTER COLUMN comment_id DROP DEFAULT;
       public          postgres    false    229    228    229            �           2604    16487    forumpost post_id    DEFAULT     w   ALTER TABLE ONLY public.forumpost ALTER COLUMN post_id SET DEFAULT nextval('public.forumposts_post_id_seq'::regclass);
 @   ALTER TABLE public.forumpost ALTER COLUMN post_id DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    16877    option option_id    DEFAULT     t   ALTER TABLE ONLY public.option ALTER COLUMN option_id SET DEFAULT nextval('public.option_option_id_seq'::regclass);
 ?   ALTER TABLE public.option ALTER COLUMN option_id DROP DEFAULT;
       public          postgres    false    238    237    238            �           2604    16702    professional professional_id    DEFAULT     �   ALTER TABLE ONLY public.professional ALTER COLUMN professional_id SET DEFAULT nextval('public.professionals_professional_id_seq'::regclass);
 K   ALTER TABLE public.professional ALTER COLUMN professional_id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    17035    profile user_id    DEFAULT     p   ALTER TABLE ONLY public.profile ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 >   ALTER TABLE public.profile ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    16636    question question_id    DEFAULT     }   ALTER TABLE ONLY public.question ALTER COLUMN question_id SET DEFAULT nextval('public.questions_question_id_seq'::regclass);
 C   ALTER TABLE public.question ALTER COLUMN question_id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    16668    questionnaire questionnaire_id    DEFAULT     �   ALTER TABLE ONLY public.questionnaire ALTER COLUMN questionnaire_id SET DEFAULT nextval('public.questionnaires_questionnaire_id_seq'::regclass);
 M   ALTER TABLE public.questionnaire ALTER COLUMN questionnaire_id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    16723    resource resource_id    DEFAULT     }   ALTER TABLE ONLY public.resource ALTER COLUMN resource_id SET DEFAULT nextval('public.resources_resource_id_seq'::regclass);
 C   ALTER TABLE public.resource ALTER COLUMN resource_id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    16906    response response_id    DEFAULT     |   ALTER TABLE ONLY public.response ALTER COLUMN response_id SET DEFAULT nextval('public.response_response_id_seq'::regclass);
 C   ALTER TABLE public.response ALTER COLUMN response_id DROP DEFAULT;
       public          postgres    false    239    240    240            �           2604    16988    transaction transaction_id    DEFAULT     �   ALTER TABLE ONLY public.transaction ALTER COLUMN transaction_id SET DEFAULT nextval('public.transaction_transaction_id_seq'::regclass);
 I   ALTER TABLE public.transaction ALTER COLUMN transaction_id DROP DEFAULT;
       public          postgres    false    245    246    246            �           2604    16550    useractivity user_activity_id    DEFAULT     �   ALTER TABLE ONLY public.useractivity ALTER COLUMN user_activity_id SET DEFAULT nextval('public.useractivities_user_activity_id_seq'::regclass);
 L   ALTER TABLE public.useractivity ALTER COLUMN user_activity_id DROP DEFAULT;
       public          postgres    false    234    235    235            �           2604    16524    userprogress progress_id    DEFAULT     �   ALTER TABLE ONLY public.userprogress ALTER COLUMN progress_id SET DEFAULT nextval('public.userprogress_progress_id_seq'::regclass);
 G   ALTER TABLE public.userprogress ALTER COLUMN progress_id DROP DEFAULT;
       public          postgres    false    230    231    231            �          0    16535    activity 
   TABLE DATA           j   COPY public.activity (activity_id, title, description, activity_type, created_at, updated_at) FROM stdin;
    public          postgres    false    233   �       �          0    16966    booking 
   TABLE DATA           q   COPY public.booking (booking_id, user_id, professional_id, appointment_date, status, payment_status) FROM stdin;
    public          postgres    false    244   �       �          0    16500    forumcomment 
   TABLE DATA           e   COPY public.forumcomment (comment_id, post_id, user_id, content, created_at, updated_at) FROM stdin;
    public          postgres    false    229   �       �          0    16484 	   forumpost 
   TABLE DATA           ]   COPY public.forumpost (post_id, user_id, title, content, created_at, updated_at) FROM stdin;
    public          postgres    false    227   <�       �          0    16749    option 
   TABLE DATA           i   COPY public.option (option_id, questionnaire_id, question_id, option_text, select_option_id) FROM stdin;
    public          postgres    false    238   Y�       �          0    16864    option_templates 
   TABLE DATA           D   COPY public.option_templates (template_id, option_text) FROM stdin;
    public          postgres    false    242   ;�       �          0    16473    professional 
   TABLE DATA           �   COPY public.professional (professional_id, name, specialization, contact_info, bio, created_at, updated_at, pid, email, password, image_url, cv_url) FROM stdin;
    public          postgres    false    225   X�       �          0    16398    profile 
   TABLE DATA           l   COPY public.profile (user_id, username, email, password, created_at, updated_at, date_of_birth) FROM stdin;
    public          postgres    false    217   ��       �          0    16424    question 
   TABLE DATA           w   COPY public.question (question_id, questionnaire_id, question_text, question_type, created_at, updated_at) FROM stdin;
    public          postgres    false    221   ��       �          0    16413    questionnaire 
   TABLE DATA           e   COPY public.questionnaire (questionnaire_id, title, description, created_at, updated_at) FROM stdin;
    public          postgres    false    219   ��       �          0    16461    resource 
   TABLE DATA           g   COPY public.resource (resource_id, title, description, type, link, created_at, updated_at) FROM stdin;
    public          postgres    false    223   8�       �          0    16786    response 
   TABLE DATA           �   COPY public.response (response_id, user_id, question_id, option_id, created_at, score, questionnaire_id, selected_option_id) FROM stdin;
    public          postgres    false    240   �       �          0    17098    task 
   TABLE DATA           X   COPY public.task (task_id, created_at, is_completed, task_name, updated_at) FROM stdin;
    public          postgres    false    248   3�       �          0    16985    transaction 
   TABLE DATA              COPY public.transaction (transaction_id, booking_id, amount, payment_method, transaction_date, transaction_status) FROM stdin;
    public          postgres    false    246   ǿ       �          0    16547    useractivity 
   TABLE DATA           �   COPY public.useractivity (user_activity_id, user_id, activity_id, completion_status, score, created_at, updated_at) FROM stdin;
    public          postgres    false    235   �       �          0    16521    userprogress 
   TABLE DATA           o   COPY public.userprogress (progress_id, user_id, metric_name, metric_value, created_at, updated_at) FROM stdin;
    public          postgres    false    231   �       �           0    0    activities_activity_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.activities_activity_id_seq', 1, false);
          public          postgres    false    232            �           0    0    booking_booking_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.booking_booking_id_seq', 1, false);
          public          postgres    false    243            �           0    0    forumcomments_comment_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.forumcomments_comment_id_seq', 1, false);
          public          postgres    false    228            �           0    0    forumposts_post_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.forumposts_post_id_seq', 1, false);
          public          postgres    false    226            �           0    0    option_option_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.option_option_id_seq', 1, false);
          public          postgres    false    237            �           0    0     option_templates_template_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.option_templates_template_id_seq', 1, false);
          public          postgres    false    241            �           0    0    professional_pid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.professional_pid_seq', 17, true);
          public          postgres    false    236            �           0    0 !   professionals_professional_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.professionals_professional_id_seq', 15, true);
          public          postgres    false    224            �           0    0 #   questionnaires_questionnaire_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.questionnaires_questionnaire_id_seq', 1, false);
          public          postgres    false    218            �           0    0    questions_question_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.questions_question_id_seq', 1, false);
          public          postgres    false    220            �           0    0    resources_resource_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.resources_resource_id_seq', 1, false);
          public          postgres    false    222            �           0    0    response_response_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.response_response_id_seq', 1, false);
          public          postgres    false    239            �           0    0    task_task_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.task_task_id_seq', 5, true);
          public          postgres    false    247            �           0    0    transaction_transaction_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.transaction_transaction_id_seq', 1, false);
          public          postgres    false    245            �           0    0 #   useractivities_user_activity_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.useractivities_user_activity_id_seq', 1, false);
          public          postgres    false    234            �           0    0    userprogress_progress_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.userprogress_progress_id_seq', 1, false);
          public          postgres    false    230            �           0    0    users_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_user_id_seq', 12, true);
          public          postgres    false    216            �           2606    16545    activity activities_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activities_pkey PRIMARY KEY (activity_id);
 B   ALTER TABLE ONLY public.activity DROP CONSTRAINT activities_pkey;
       public            postgres    false    233            �           2606    16973    booking booking_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (booking_id);
 >   ALTER TABLE ONLY public.booking DROP CONSTRAINT booking_pkey;
       public            postgres    false    244            �           2606    16509    forumcomment forumcomments_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.forumcomment
    ADD CONSTRAINT forumcomments_pkey PRIMARY KEY (comment_id);
 I   ALTER TABLE ONLY public.forumcomment DROP CONSTRAINT forumcomments_pkey;
       public            postgres    false    229            �           2606    16493    forumpost forumposts_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.forumpost
    ADD CONSTRAINT forumposts_pkey PRIMARY KEY (post_id);
 C   ALTER TABLE ONLY public.forumpost DROP CONSTRAINT forumposts_pkey;
       public            postgres    false    227            �           2606    16879    option option_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.option
    ADD CONSTRAINT option_pkey PRIMARY KEY (option_id);
 <   ALTER TABLE ONLY public.option DROP CONSTRAINT option_pkey;
       public            postgres    false    238            �           2606    16870 &   option_templates option_templates_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.option_templates
    ADD CONSTRAINT option_templates_pkey PRIMARY KEY (template_id);
 P   ALTER TABLE ONLY public.option_templates DROP CONSTRAINT option_templates_pkey;
       public            postgres    false    242            �           2606    16704    professional professionals_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.professional
    ADD CONSTRAINT professionals_pkey PRIMARY KEY (professional_id);
 I   ALTER TABLE ONLY public.professional DROP CONSTRAINT professionals_pkey;
       public            postgres    false    225            �           2606    16670 !   questionnaire questionnaires_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaires_pkey PRIMARY KEY (questionnaire_id);
 K   ALTER TABLE ONLY public.questionnaire DROP CONSTRAINT questionnaires_pkey;
       public            postgres    false    219            �           2606    16638    question questions_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.question
    ADD CONSTRAINT questions_pkey PRIMARY KEY (question_id);
 A   ALTER TABLE ONLY public.question DROP CONSTRAINT questions_pkey;
       public            postgres    false    221            �           2606    16725    resource resources_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resources_pkey PRIMARY KEY (resource_id);
 A   ALTER TABLE ONLY public.resource DROP CONSTRAINT resources_pkey;
       public            postgres    false    223            �           2606    16908    response response_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.response
    ADD CONSTRAINT response_pkey PRIMARY KEY (response_id);
 @   ALTER TABLE ONLY public.response DROP CONSTRAINT response_pkey;
       public            postgres    false    240            �           2606    17102    task task_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (task_id);
 8   ALTER TABLE ONLY public.task DROP CONSTRAINT task_pkey;
       public            postgres    false    248            �           2606    16992    transaction transaction_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (transaction_id);
 F   ALTER TABLE ONLY public.transaction DROP CONSTRAINT transaction_pkey;
       public            postgres    false    246            �           2606    16555     useractivity useractivities_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.useractivity
    ADD CONSTRAINT useractivities_pkey PRIMARY KEY (user_activity_id);
 J   ALTER TABLE ONLY public.useractivity DROP CONSTRAINT useractivities_pkey;
       public            postgres    false    235            �           2606    16528    userprogress userprogress_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.userprogress
    ADD CONSTRAINT userprogress_pkey PRIMARY KEY (progress_id);
 H   ALTER TABLE ONLY public.userprogress DROP CONSTRAINT userprogress_pkey;
       public            postgres    false    231            �           2606    16612    profile users_email_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.profile
    ADD CONSTRAINT users_email_key UNIQUE (email);
 A   ALTER TABLE ONLY public.profile DROP CONSTRAINT users_email_key;
       public            postgres    false    217            �           2606    17037    profile users_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.profile
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 <   ALTER TABLE ONLY public.profile DROP CONSTRAINT users_pkey;
       public            postgres    false    217            �           2606    16614    profile users_username_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.profile
    ADD CONSTRAINT users_username_key UNIQUE (username);
 D   ALTER TABLE ONLY public.profile DROP CONSTRAINT users_username_key;
       public            postgres    false    217            �           2606    17002 $   booking booking_professional_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_professional_id_fkey FOREIGN KEY (professional_id) REFERENCES public.professional(professional_id);
 N   ALTER TABLE ONLY public.booking DROP CONSTRAINT booking_professional_id_fkey;
       public          postgres    false    244    4820    225            �           2606    17038    booking booking_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profile(user_id);
 F   ALTER TABLE ONLY public.booking DROP CONSTRAINT booking_user_id_fkey;
       public          postgres    false    4810    217    244            �           2606    16922 $   response fk8i6vilu3v2tk0r0bytwxuelts    FK CONSTRAINT     �   ALTER TABLE ONLY public.response
    ADD CONSTRAINT fk8i6vilu3v2tk0r0bytwxuelts FOREIGN KEY (questionnaire_id) REFERENCES public.questionnaire(questionnaire_id);
 N   ALTER TABLE ONLY public.response DROP CONSTRAINT fk8i6vilu3v2tk0r0bytwxuelts;
       public          postgres    false    240    219    4814            �           2606    16927 $   response fkstt88u6v02rpune40r68m70fi    FK CONSTRAINT     �   ALTER TABLE ONLY public.response
    ADD CONSTRAINT fkstt88u6v02rpune40r68m70fi FOREIGN KEY (selected_option_id) REFERENCES public.option(option_id);
 N   ALTER TABLE ONLY public.response DROP CONSTRAINT fkstt88u6v02rpune40r68m70fi;
       public          postgres    false    240    4832    238            �           2606    16510 '   forumcomment forumcomments_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.forumcomment
    ADD CONSTRAINT forumcomments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.forumpost(post_id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.forumcomment DROP CONSTRAINT forumcomments_post_id_fkey;
       public          postgres    false    4822    229    227            �           2606    17048 '   forumcomment forumcomments_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.forumcomment
    ADD CONSTRAINT forumcomments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profile(user_id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.forumcomment DROP CONSTRAINT forumcomments_user_id_fkey;
       public          postgres    false    229    217    4810            �           2606    17043 !   forumpost forumposts_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.forumpost
    ADD CONSTRAINT forumposts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profile(user_id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.forumpost DROP CONSTRAINT forumposts_user_id_fkey;
       public          postgres    false    4810    227    217            �           2606    16895    option option_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.option
    ADD CONSTRAINT option_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question(question_id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.option DROP CONSTRAINT option_question_id_fkey;
       public          postgres    false    4816    221    238            �           2606    16756 #   option option_questionnaire_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.option
    ADD CONSTRAINT option_questionnaire_id_fkey FOREIGN KEY (questionnaire_id) REFERENCES public.questionnaire(questionnaire_id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.option DROP CONSTRAINT option_questionnaire_id_fkey;
       public          postgres    false    238    219    4814            �           2606    16671 (   question questions_questionnaire_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.question
    ADD CONSTRAINT questions_questionnaire_id_fkey FOREIGN KEY (questionnaire_id) REFERENCES public.questionnaire(questionnaire_id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.question DROP CONSTRAINT questions_questionnaire_id_fkey;
       public          postgres    false    221    219    4814            �           2606    16880     response response_option_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.response
    ADD CONSTRAINT response_option_id_fkey FOREIGN KEY (option_id) REFERENCES public.option(option_id);
 J   ALTER TABLE ONLY public.response DROP CONSTRAINT response_option_id_fkey;
       public          postgres    false    240    238    4832            �           2606    16913 "   response response_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.response
    ADD CONSTRAINT response_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question(question_id);
 L   ALTER TABLE ONLY public.response DROP CONSTRAINT response_question_id_fkey;
       public          postgres    false    240    221    4816            �           2606    17063    response response_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.response
    ADD CONSTRAINT response_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profile(user_id);
 H   ALTER TABLE ONLY public.response DROP CONSTRAINT response_user_id_fkey;
       public          postgres    false    217    4810    240            �           2606    16993 '   transaction transaction_booking_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.booking(booking_id);
 Q   ALTER TABLE ONLY public.transaction DROP CONSTRAINT transaction_booking_id_fkey;
       public          postgres    false    244    246    4838            �           2606    16561 ,   useractivity useractivities_activity_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.useractivity
    ADD CONSTRAINT useractivities_activity_id_fkey FOREIGN KEY (activity_id) REFERENCES public.activity(activity_id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.useractivity DROP CONSTRAINT useractivities_activity_id_fkey;
       public          postgres    false    235    233    4828            �           2606    17058 (   useractivity useractivities_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.useractivity
    ADD CONSTRAINT useractivities_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profile(user_id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.useractivity DROP CONSTRAINT useractivities_user_id_fkey;
       public          postgres    false    217    235    4810            �           2606    17053 &   userprogress userprogress_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.userprogress
    ADD CONSTRAINT userprogress_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profile(user_id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.userprogress DROP CONSTRAINT userprogress_user_id_fkey;
       public          postgres    false    4810    231    217            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �  x���Ko�6�����͗ اw������@�\��hEX">���wȡd��=��ؙ��&�}~�>���������;o+�0���JfE�P�����R��ׇ�/��Y��5T-���3+ *�h0�`�dt&�o��KCv��'�V�X�ܓ���x$S�2U$���*,H�~8��S���*�j��/��*��6d�{px�|�U��{	U�\[�Yųׁ��	�A�2U7X`�q�5j1�˜��CU1!�߸�"eG�4�*˸J�
=i��47VHn��b�}2L*��J~�@{�";0gn�����Gd�bl\C�q��C����e�������ᑀ3��#�v�[�S�
!�)��I�}�>�1�Cɢ�x�d�6�`�d�U�J u��d"��h�ܣ*]L|�1
=��V��g�.״@�zP�.J���J��I\���8]�G�)� ��͘a�L�7]�,l3���>��q�R;��B����T͎�W��B����d�[LF�쉲>-|�I@�L�MM�v��;�k���Pb���]��!���Y<���n�$�H����d�hH�&:�a��~~`���e#c
yd#�Od�MӒ�`nT&��E��D�oS�H�4�D��#���gIR΄{g�6����\h��W?���\������w&:�$6n�����i%H_�5+x-�>-����0^��\�#�}#&�*5���ZEA{�����HﴍB�9b�K37 ���	z$hR�K��2���>��W�v3w��x05:�8��Y�}�X�)��r1E�#j=�U �cL�t��Ly��[���u}��q���I�=�V��Sqv�����b�$E5 ��R��}�ۤD�A��$�EX��"gf�����5�<�9�"cؿ��}d��Zaq&�L�A���Wi�H���TW�l����c��-�(��I�������)�gv3�g�/��V���3m�XU� V��)4x<E�z�X7��x���xγ5���sd.�jUh�5}$R�%r�;�8����C�ҝ��ϛH\�{:RС���,������xy�M��3_3~?�"j1G����a��)�٣�����y��IJ[��'��T�!���2�-A��ޕ�`G�1BgZ)�>j�NE���x�[)�?�r�\��Hv�h��Ѽ��؏`|GRji��+���\_0�^FIO�h~�Nٞ6�vmk,�m�[e�t�~�2�=o^�X�|"ZLǟ?yM�;7*Lo[I6�d�愤㞳��q>�w�F)��밍c����f��o�D��5�f������ �0�X��`��4Y��_�߄�"��d�R��N��[���d|�z���6DX��0�9����Qp$��˓2�_�s��	���ᣃj�Y�ٰ�}.�*��r➈�f�}
�8�������>b���"s|�U+m^�}������e��4D�}||���L      �      x������ � �      �   �   x�����0 ��+��kE!���D�X��`�i�߯|�ɍw'H�Yr�ˊܞ��lC$�iE��R!S(	
@���=�Y�����A���;�ӓ[����`|��g��GS{�1�⧗ё���fl�q�:��Äm��ao¯���~<�1�      �   �   x�m��
�0���S�.+iڦiO>�O0���:�w���^Ze�@_����OoOs��!�B���<�-�m�}Dȥ��ހ���vR�������;�����啞c���qD��(�LX���M�C1]sUG�-׮�6�-������F��NI)�jE�      �     x���M��0���W̭���Il��*�U/�VU�^zq�Ibձ#,��;N�GhOH��x�y=�d�̾��ʡ�R�A{�%�W4�e������3h-��4���B��f�b������P�(�jOa��|y��94���E��v<$��>sVb+8��L��,���)^?�H�M��d�<��e��/7��̀(�[$S{��Vh� ������J)ڷy�g�t��n�\=�D�e` 9}]�L2�1�`Ǭ���ʊBH�Z�	׀&UC��ê]�`5�JQ�f�D���)Vc��]�`�2[g�{%L��j�ے�/{5ih=oBq�T	J��J���i� ��Y݁�3�f�P�u�0kE�B�A�ВB��i5�<�U%w�AVF�*{.	,L�μ�c�P�mg/H��%s������N6q:ϒd�<߆�
���R�'׍^���۰��6�_��Ҧ�JyjN&�T{[>
giW[	b
P{�z���ɁЄY���X�h-{I��X���N�x����C��z�Z!4'6�"-mg߆��{��;EXP�y�|^&�mƫ�(��z�k�ٺ�d��4%�%�;�?�P��44"���4��7q>��E�ߡ�
���BZA�!������~",]0vb����DUm򢐇�޼[�fa��λ�`è�=����ѫ�a�ܺ"��#���	N�����X�h��4O�)M�֛$��WI��cNWQrq�m����]�+�=A��1��F��y[��=�udMM�#�3����	��      �   i   x�3�����M����LN��t�,*.Q(H,*Q�OS(,M-.����K�,J�4202�5��5�P0��20�22�3107�4�60�26 ��ˈ�fQpjr~^
�l����� m7�      �   �   x����n�0D��W��c��@K+���5ހ��"{E����%י����dOE�@���h��v�I��;I�s�(A�2�<8%���)nGL[�4�����ިq���}_����o�k羺�}w�}��T��q8d�ј�^u���ˬ�ԝ9����y�)F1�$�����<$���_��L�a ��N�-I^��s����xC      �      x������ � �      �   �   x���=
A��zr���ɗ����`E���
�(k�|o"�E��$pt7�,���ވȘ�����Z3���G��tD8k��
�g�q�#��%�R�����|,��u���|#�l�����hND� aA$      �      x������ � �      �      x������ � �      �      x������ � �     