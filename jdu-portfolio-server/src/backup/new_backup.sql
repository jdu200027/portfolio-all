PGDMP      ,        
        |         	   portfolio    14.12 (Homebrew)    16.1 �   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    294429 	   portfolio    DATABASE     k   CREATE DATABASE portfolio WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE portfolio;
             
   botirovs03    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
             
   botirovs03    false            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                
   botirovs03    false    4            _           1247    294667    enum_Decans_role    TYPE     ?   CREATE TYPE public."enum_Decans_role" AS ENUM (
    'decan'
);
 %   DROP TYPE public."enum_Decans_role";
       public       
   botirovs03    false    4            >           1247    294431    enum_Groups_year    TYPE     h   CREATE TYPE public."enum_Groups_year" AS ENUM (
    'First',
    'Second',
    'Third',
    'Fourth'
);
 %   DROP TYPE public."enum_Groups_year";
       public       
   botirovs03    false    4            M           1247    294480    enum_JapanLanguageTests_level    TYPE     �   CREATE TYPE public."enum_JapanLanguageTests_level" AS ENUM (
    '0',
    'N1',
    'N2',
    'N3',
    'N4',
    'N5',
    'Q1',
    'Q2',
    'Q3',
    'Q4'
);
 2   DROP TYPE public."enum_JapanLanguageTests_level";
       public       
   botirovs03    false    4            J           1247    294474    enum_JapanLanguageTests_name    TYPE     U   CREATE TYPE public."enum_JapanLanguageTests_name" AS ENUM (
    'JLPT',
    'NAT'
);
 1   DROP TYPE public."enum_JapanLanguageTests_name";
       public       
   botirovs03    false    4            P           1247    294609    enum_LessonResults_status    TYPE     _   CREATE TYPE public."enum_LessonResults_status" AS ENUM (
    'Incompleted',
    'Completed'
);
 .   DROP TYPE public."enum_LessonResults_status";
       public       
   botirovs03    false    4            n           1247    294711    enum_Parents_role    TYPE     A   CREATE TYPE public."enum_Parents_role" AS ENUM (
    'parent'
);
 &   DROP TYPE public."enum_Parents_role";
       public       
   botirovs03    false    4            V           1247    294636    enum_Recruitors_role    TYPE     G   CREATE TYPE public."enum_Recruitors_role" AS ENUM (
    'recruitor'
);
 )   DROP TYPE public."enum_Recruitors_role";
       public       
   botirovs03    false    4            D           1247    294450    enum_Students_role    TYPE     C   CREATE TYPE public."enum_Students_role" AS ENUM (
    'student'
);
 '   DROP TYPE public."enum_Students_role";
       public       
   botirovs03    false    4            e           1247    294681    enum_Teachers_role    TYPE     P   CREATE TYPE public."enum_Teachers_role" AS ENUM (
    'teacher',
    'staff'
);
 '   DROP TYPE public."enum_Teachers_role";
       public       
   botirovs03    false    4            �            1259    294669    Decans    TABLE       CREATE TABLE public."Decans" (
    id uuid NOT NULL,
    "firstName" character varying(255),
    "lastName" character varying(255),
    "loginId" character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255),
    role public."enum_Decans_role" DEFAULT 'decan'::public."enum_Decans_role" NOT NULL,
    avatar character varying(255),
    "isDeleted" boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Decans";
       public         heap 
   botirovs03    false    863    4    863            �            1259    294439    Groups    TABLE     {  CREATE TABLE public."Groups" (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(255) DEFAULT 'IT'::character varying,
    year public."enum_Groups_year" DEFAULT 'First'::public."enum_Groups_year",
    "isDeleted" boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Groups";
       public         heap 
   botirovs03    false    830    4    830            �            1259    294697    Infos    TABLE     �  CREATE TABLE public."Infos" (
    id uuid NOT NULL,
    "emailInfo" character varying(255),
    "phoneNumber" character varying(255) DEFAULT '+998 98 876 54 32'::character varying,
    "startTime" character varying(255) DEFAULT '09:00'::character varying,
    "endTime" character varying(255) DEFAULT '21:00'::character varying,
    location character varying(255) DEFAULT 'Tashkent, Shayhontohur district, Sebzor, 21'::character varying
);
    DROP TABLE public."Infos";
       public         heap 
   botirovs03    false    4            �            1259    294639 
   Recruitors    TABLE     �  CREATE TABLE public."Recruitors" (
    id uuid NOT NULL,
    avatar character varying(255),
    "loginId" character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "firstName" character varying(255),
    "lastName" character varying(255),
    "companyName" character varying(255),
    specialisation character varying(255),
    "phoneNumber" character varying(255),
    email character varying(255),
    bio text,
    role public."enum_Recruitors_role" DEFAULT 'recruitor'::public."enum_Recruitors_role" NOT NULL,
    "isDeleted" boolean DEFAULT false NOT NULL,
    "isActive" boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."Recruitors";
       public         heap 
   botirovs03    false    854    854    4            �            1259    294651    SelectedStudents    TABLE     k   CREATE TABLE public."SelectedStudents" (
    "StudentId" uuid NOT NULL,
    "RecruitorId" uuid NOT NULL
);
 &   DROP TABLE public."SelectedStudents";
       public         heap 
   botirovs03    false    4            �            1259    294453    Students    TABLE     �  CREATE TABLE public."Students" (
    id uuid NOT NULL,
    "firstName" character varying(255),
    "lastName" character varying(255),
    "loginId" character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255),
    "groupId" uuid,
    role public."enum_Students_role" DEFAULT 'student'::public."enum_Students_role",
    avatar character varying(255),
    bio text,
    "phoneNumber" text,
    brithday text,
    images character varying(255)[] DEFAULT (ARRAY[]::character varying[])::character varying(255)[],
    videos character varying(255)[] DEFAULT (ARRAY[]::character varying[])::character varying(255)[],
    "isDeleted" boolean DEFAULT false NOT NULL,
    "isActive" boolean DEFAULT false,
    cv character varying(255),
    jlpt character varying(255),
    jdu character varying(255),
    "desc" text,
    "isArchive" boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Students";
       public         heap 
   botirovs03    false    836    836    4            �            1259    294685    Teachers    TABLE     +  CREATE TABLE public."Teachers" (
    id uuid NOT NULL,
    "firstName" character varying(255),
    "lastName" character varying(255),
    "fatherName" character varying(255),
    university character varying(255),
    avatar character varying(255),
    "loginId" character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255),
    specialisation character varying(255),
    section character varying(255),
    "position" character varying(255),
    "phoneNumber" character varying(255),
    role public."enum_Teachers_role" DEFAULT 'teacher'::public."enum_Teachers_role" NOT NULL,
    "isActive" boolean DEFAULT false,
    "isDeleted" boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Teachers";
       public         heap 
   botirovs03    false    869    4    869            �            1259    294629    Tokens    TABLE     �   CREATE TABLE public."Tokens" (
    id integer NOT NULL,
    "userId" uuid NOT NULL,
    token character varying(255) NOT NULL
);
    DROP TABLE public."Tokens";
       public         heap 
   botirovs03    false    4            �            1259    294628    Tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Tokens_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Tokens_id_seq";
       public       
   botirovs03    false    212    4            �           0    0    Tokens_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Tokens_id_seq" OWNED BY public."Tokens".id;
          public       
   botirovs03    false    211            �           2604    294632 	   Tokens id    DEFAULT     j   ALTER TABLE ONLY public."Tokens" ALTER COLUMN id SET DEFAULT nextval('public."Tokens_id_seq"'::regclass);
 :   ALTER TABLE public."Tokens" ALTER COLUMN id DROP DEFAULT;
       public       
   botirovs03    false    212    211    212            �          0    294669    Decans 
   TABLE DATA           �   COPY public."Decans" (id, "firstName", "lastName", "loginId", password, email, role, avatar, "isDeleted", "createdAt", "updatedAt") FROM stdin;
    public       
   botirovs03    false    215   ��      �          0    294439    Groups 
   TABLE DATA           e   COPY public."Groups" (id, name, collection, year, "isDeleted", "createdAt", "updatedAt") FROM stdin;
    public       
   botirovs03    false    209   s�      �          0    294697    Infos 
   TABLE DATA           c   COPY public."Infos" (id, "emailInfo", "phoneNumber", "startTime", "endTime", location) FROM stdin;
    public       
   botirovs03    false    217   ;�      �          0    294639 
   Recruitors 
   TABLE DATA           �   COPY public."Recruitors" (id, avatar, "loginId", password, "firstName", "lastName", "companyName", specialisation, "phoneNumber", email, bio, role, "isDeleted", "isActive", "createdAt", "updatedAt") FROM stdin;
    public       
   botirovs03    false    213   X�      �          0    294651    SelectedStudents 
   TABLE DATA           H   COPY public."SelectedStudents" ("StudentId", "RecruitorId") FROM stdin;
    public       
   botirovs03    false    214   q�      �          0    294453    Students 
   TABLE DATA           �   COPY public."Students" (id, "firstName", "lastName", "loginId", password, email, "groupId", role, avatar, bio, "phoneNumber", brithday, images, videos, "isDeleted", "isActive", cv, jlpt, jdu, "desc", "isArchive", "createdAt", "updatedAt") FROM stdin;
    public       
   botirovs03    false    210   ��      �          0    294685    Teachers 
   TABLE DATA           �   COPY public."Teachers" (id, "firstName", "lastName", "fatherName", university, avatar, "loginId", password, email, specialisation, section, "position", "phoneNumber", role, "isActive", "isDeleted", "createdAt", "updatedAt") FROM stdin;
    public       
   botirovs03    false    216   ��      �          0    294629    Tokens 
   TABLE DATA           7   COPY public."Tokens" (id, "userId", token) FROM stdin;
    public       
   botirovs03    false    212   l�      �           0    0    Tokens_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Tokens_id_seq"', 1, false);
          public       
   botirovs03    false    211            �           2606    528867    Decans Decans_loginId_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key" UNIQUE ("loginId");
 G   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key";
       public         
   botirovs03    false    215            �           2606    528869    Decans Decans_loginId_key1 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key1" UNIQUE ("loginId");
 H   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key1";
       public         
   botirovs03    false    215            �           2606    528897    Decans Decans_loginId_key10 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key10" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key10";
       public         
   botirovs03    false    215            �           2606    528827    Decans Decans_loginId_key100 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key100" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key100";
       public         
   botirovs03    false    215            �           2606    528829    Decans Decans_loginId_key101 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key101" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key101";
       public         
   botirovs03    false    215            �           2606    528841    Decans Decans_loginId_key102 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key102" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key102";
       public         
   botirovs03    false    215            �           2606    528831    Decans Decans_loginId_key103 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key103" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key103";
       public         
   botirovs03    false    215            �           2606    528833    Decans Decans_loginId_key104 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key104" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key104";
       public         
   botirovs03    false    215            �           2606    528835    Decans Decans_loginId_key105 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key105" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key105";
       public         
   botirovs03    false    215            �           2606    528837    Decans Decans_loginId_key106 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key106" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key106";
       public         
   botirovs03    false    215            �           2606    528839    Decans Decans_loginId_key107 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key107" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key107";
       public         
   botirovs03    false    215            �           2606    528787    Decans Decans_loginId_key108 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key108" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key108";
       public         
   botirovs03    false    215            �           2606    528749    Decans Decans_loginId_key109 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key109" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key109";
       public         
   botirovs03    false    215            �           2606    528681    Decans Decans_loginId_key11 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key11" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key11";
       public         
   botirovs03    false    215            �           2606    528789    Decans Decans_loginId_key110 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key110" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key110";
       public         
   botirovs03    false    215            �           2606    528747    Decans Decans_loginId_key111 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key111" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key111";
       public         
   botirovs03    false    215            �           2606    528791    Decans Decans_loginId_key112 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key112" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key112";
       public         
   botirovs03    false    215            �           2606    528745    Decans Decans_loginId_key113 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key113" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key113";
       public         
   botirovs03    false    215            �           2606    528793    Decans Decans_loginId_key114 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key114" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key114";
       public         
   botirovs03    false    215            �           2606    528795    Decans Decans_loginId_key115 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key115" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key115";
       public         
   botirovs03    false    215                        2606    528743    Decans Decans_loginId_key116 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key116" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key116";
       public         
   botirovs03    false    215                       2606    528797    Decans Decans_loginId_key117 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key117" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key117";
       public         
   botirovs03    false    215                       2606    528799    Decans Decans_loginId_key118 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key118" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key118";
       public         
   botirovs03    false    215                       2606    528741    Decans Decans_loginId_key119 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key119" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key119";
       public         
   botirovs03    false    215                       2606    528863    Decans Decans_loginId_key12 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key12" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key12";
       public         
   botirovs03    false    215            
           2606    528801    Decans Decans_loginId_key120 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key120" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key120";
       public         
   botirovs03    false    215                       2606    528803    Decans Decans_loginId_key121 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key121" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key121";
       public         
   botirovs03    false    215                       2606    528739    Decans Decans_loginId_key122 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key122" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key122";
       public         
   botirovs03    false    215                       2606    528805    Decans Decans_loginId_key123 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key123" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key123";
       public         
   botirovs03    false    215                       2606    528807    Decans Decans_loginId_key124 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key124" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key124";
       public         
   botirovs03    false    215                       2606    528737    Decans Decans_loginId_key125 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key125" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key125";
       public         
   botirovs03    false    215                       2606    528735    Decans Decans_loginId_key126 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key126" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key126";
       public         
   botirovs03    false    215                       2606    528717    Decans Decans_loginId_key127 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key127" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key127";
       public         
   botirovs03    false    215                       2606    528719    Decans Decans_loginId_key128 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key128" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key128";
       public         
   botirovs03    false    215                       2606    528721    Decans Decans_loginId_key129 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key129" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key129";
       public         
   botirovs03    false    215                       2606    528683    Decans Decans_loginId_key13 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key13" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key13";
       public         
   botirovs03    false    215                        2606    528723    Decans Decans_loginId_key130 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key130" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key130";
       public         
   botirovs03    false    215            "           2606    528733    Decans Decans_loginId_key131 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key131" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key131";
       public         
   botirovs03    false    215            $           2606    528725    Decans Decans_loginId_key132 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key132" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key132";
       public         
   botirovs03    false    215            &           2606    528727    Decans Decans_loginId_key133 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key133" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key133";
       public         
   botirovs03    false    215            (           2606    528729    Decans Decans_loginId_key134 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key134" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key134";
       public         
   botirovs03    false    215            *           2606    528731    Decans Decans_loginId_key135 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key135" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key135";
       public         
   botirovs03    false    215            ,           2606    528621    Decans Decans_loginId_key136 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key136" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key136";
       public         
   botirovs03    false    215            .           2606    528623    Decans Decans_loginId_key137 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key137" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key137";
       public         
   botirovs03    false    215            0           2606    528645    Decans Decans_loginId_key138 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key138" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key138";
       public         
   botirovs03    false    215            2           2606    528625    Decans Decans_loginId_key139 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key139" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key139";
       public         
   botirovs03    false    215            4           2606    528861    Decans Decans_loginId_key14 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key14" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key14";
       public         
   botirovs03    false    215            6           2606    528627    Decans Decans_loginId_key140 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key140" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key140";
       public         
   botirovs03    false    215            8           2606    528643    Decans Decans_loginId_key141 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key141" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key141";
       public         
   botirovs03    false    215            :           2606    528629    Decans Decans_loginId_key142 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key142" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key142";
       public         
   botirovs03    false    215            <           2606    528631    Decans Decans_loginId_key143 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key143" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key143";
       public         
   botirovs03    false    215            >           2606    528633    Decans Decans_loginId_key144 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key144" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key144";
       public         
   botirovs03    false    215            @           2606    528641    Decans Decans_loginId_key145 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key145" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key145";
       public         
   botirovs03    false    215            B           2606    528635    Decans Decans_loginId_key146 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key146" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key146";
       public         
   botirovs03    false    215            D           2606    528639    Decans Decans_loginId_key147 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key147" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key147";
       public         
   botirovs03    false    215            F           2606    528637    Decans Decans_loginId_key148 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key148" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key148";
       public         
   botirovs03    false    215            H           2606    528757    Decans Decans_loginId_key149 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key149" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key149";
       public         
   botirovs03    false    215            J           2606    528859    Decans Decans_loginId_key15 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key15" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key15";
       public         
   botirovs03    false    215            L           2606    528759    Decans Decans_loginId_key150 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key150" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key150";
       public         
   botirovs03    false    215            N           2606    528761    Decans Decans_loginId_key151 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key151" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key151";
       public         
   botirovs03    false    215            P           2606    528889    Decans Decans_loginId_key152 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key152" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key152";
       public         
   botirovs03    false    215            R           2606    528909    Decans Decans_loginId_key153 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key153" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key153";
       public         
   botirovs03    false    215            T           2606    528911    Decans Decans_loginId_key154 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key154" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key154";
       public         
   botirovs03    false    215            V           2606    528913    Decans Decans_loginId_key155 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key155" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key155";
       public         
   botirovs03    false    215            X           2606    528915    Decans Decans_loginId_key156 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key156" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key156";
       public         
   botirovs03    false    215            Z           2606    528887    Decans Decans_loginId_key157 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key157" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key157";
       public         
   botirovs03    false    215            \           2606    528917    Decans Decans_loginId_key158 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key158" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key158";
       public         
   botirovs03    false    215            ^           2606    528885    Decans Decans_loginId_key159 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key159" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key159";
       public         
   botirovs03    false    215            `           2606    528851    Decans Decans_loginId_key16 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key16" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key16";
       public         
   botirovs03    false    215            b           2606    528919    Decans Decans_loginId_key160 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key160" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key160";
       public         
   botirovs03    false    215            d           2606    528921    Decans Decans_loginId_key161 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key161" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key161";
       public         
   botirovs03    false    215            f           2606    528923    Decans Decans_loginId_key162 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key162" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key162";
       public         
   botirovs03    false    215            h           2606    528925    Decans Decans_loginId_key163 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key163" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key163";
       public         
   botirovs03    false    215            j           2606    528767    Decans Decans_loginId_key164 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key164" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key164";
       public         
   botirovs03    false    215            l           2606    528927    Decans Decans_loginId_key165 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key165" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key165";
       public         
   botirovs03    false    215            n           2606    528929    Decans Decans_loginId_key166 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key166" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key166";
       public         
   botirovs03    false    215            p           2606    528931    Decans Decans_loginId_key167 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key167" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key167";
       public         
   botirovs03    false    215            r           2606    528933    Decans Decans_loginId_key168 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key168" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key168";
       public         
   botirovs03    false    215            t           2606    528935    Decans Decans_loginId_key169 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key169" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key169";
       public         
   botirovs03    false    215            v           2606    528853    Decans Decans_loginId_key17 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key17" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key17";
       public         
   botirovs03    false    215            x           2606    528765    Decans Decans_loginId_key170 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key170" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key170";
       public         
   botirovs03    false    215            z           2606    528937    Decans Decans_loginId_key171 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key171" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key171";
       public         
   botirovs03    false    215            |           2606    528763    Decans Decans_loginId_key172 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key172" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key172";
       public         
   botirovs03    false    215            ~           2606    528939    Decans Decans_loginId_key173 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key173" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key173";
       public         
   botirovs03    false    215            �           2606    528941    Decans Decans_loginId_key174 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key174" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key174";
       public         
   botirovs03    false    215            �           2606    528943    Decans Decans_loginId_key175 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key175" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key175";
       public         
   botirovs03    false    215            �           2606    528591    Decans Decans_loginId_key176 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key176" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key176";
       public         
   botirovs03    false    215            �           2606    528945    Decans Decans_loginId_key177 
   CONSTRAINT     `   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key177" UNIQUE ("loginId");
 J   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key177";
       public         
   botirovs03    false    215            �           2606    528855    Decans Decans_loginId_key18 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key18" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key18";
       public         
   botirovs03    false    215            �           2606    528857    Decans Decans_loginId_key19 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key19" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key19";
       public         
   botirovs03    false    215            �           2606    528871    Decans Decans_loginId_key2 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key2" UNIQUE ("loginId");
 H   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key2";
       public         
   botirovs03    false    215            �           2606    528849    Decans Decans_loginId_key20 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key20" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key20";
       public         
   botirovs03    false    215            �           2606    528753    Decans Decans_loginId_key21 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key21" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key21";
       public         
   botirovs03    false    215            �           2606    528755    Decans Decans_loginId_key22 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key22" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key22";
       public         
   botirovs03    false    215            �           2606    528847    Decans Decans_loginId_key23 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key23" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key23";
       public         
   botirovs03    false    215            �           2606    528845    Decans Decans_loginId_key24 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key24" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key24";
       public         
   botirovs03    false    215            �           2606    528891    Decans Decans_loginId_key25 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key25" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key25";
       public         
   botirovs03    false    215            �           2606    528893    Decans Decans_loginId_key26 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key26" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key26";
       public         
   botirovs03    false    215            �           2606    528843    Decans Decans_loginId_key27 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key27" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key27";
       public         
   botirovs03    false    215            �           2606    528679    Decans Decans_loginId_key28 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key28" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key28";
       public         
   botirovs03    false    215            �           2606    528899    Decans Decans_loginId_key29 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key29" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key29";
       public         
   botirovs03    false    215            �           2606    528873    Decans Decans_loginId_key3 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key3" UNIQUE ("loginId");
 H   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key3";
       public         
   botirovs03    false    215            �           2606    528901    Decans Decans_loginId_key30 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key30" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key30";
       public         
   botirovs03    false    215            �           2606    528813    Decans Decans_loginId_key31 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key31" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key31";
       public         
   botirovs03    false    215            �           2606    528903    Decans Decans_loginId_key32 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key32" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key32";
       public         
   botirovs03    false    215            �           2606    528905    Decans Decans_loginId_key33 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key33" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key33";
       public         
   botirovs03    false    215            �           2606    528811    Decans Decans_loginId_key34 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key34" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key34";
       public         
   botirovs03    false    215            �           2606    528907    Decans Decans_loginId_key35 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key35" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key35";
       public         
   botirovs03    false    215            �           2606    528593    Decans Decans_loginId_key36 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key36" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key36";
       public         
   botirovs03    false    215            �           2606    528809    Decans Decans_loginId_key37 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key37" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key37";
       public         
   botirovs03    false    215            �           2606    528595    Decans Decans_loginId_key38 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key38" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key38";
       public         
   botirovs03    false    215            �           2606    528597    Decans Decans_loginId_key39 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key39" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key39";
       public         
   botirovs03    false    215            �           2606    528875    Decans Decans_loginId_key4 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key4" UNIQUE ("loginId");
 H   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key4";
       public         
   botirovs03    false    215            �           2606    528599    Decans Decans_loginId_key40 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key40" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key40";
       public         
   botirovs03    false    215            �           2606    528601    Decans Decans_loginId_key41 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key41" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key41";
       public         
   botirovs03    false    215            �           2606    528603    Decans Decans_loginId_key42 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key42" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key42";
       public         
   botirovs03    false    215            �           2606    528769    Decans Decans_loginId_key43 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key43" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key43";
       public         
   botirovs03    false    215            �           2606    528611    Decans Decans_loginId_key44 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key44" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key44";
       public         
   botirovs03    false    215            �           2606    528613    Decans Decans_loginId_key45 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key45" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key45";
       public         
   botirovs03    false    215            �           2606    528615    Decans Decans_loginId_key46 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key46" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key46";
       public         
   botirovs03    false    215            �           2606    528617    Decans Decans_loginId_key47 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key47" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key47";
       public         
   botirovs03    false    215            �           2606    528619    Decans Decans_loginId_key48 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key48" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key48";
       public         
   botirovs03    false    215            �           2606    528647    Decans Decans_loginId_key49 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key49" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key49";
       public         
   botirovs03    false    215            �           2606    528877    Decans Decans_loginId_key5 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key5" UNIQUE ("loginId");
 H   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key5";
       public         
   botirovs03    false    215            �           2606    528675    Decans Decans_loginId_key50 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key50" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key50";
       public         
   botirovs03    false    215            �           2606    528649    Decans Decans_loginId_key51 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key51" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key51";
       public         
   botirovs03    false    215            �           2606    528651    Decans Decans_loginId_key52 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key52" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key52";
       public         
   botirovs03    false    215            �           2606    528653    Decans Decans_loginId_key53 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key53" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key53";
       public         
   botirovs03    false    215            �           2606    528655    Decans Decans_loginId_key54 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key54" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key54";
       public         
   botirovs03    false    215            �           2606    528657    Decans Decans_loginId_key55 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key55" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key55";
       public         
   botirovs03    false    215            �           2606    528673    Decans Decans_loginId_key56 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key56" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key56";
       public         
   botirovs03    false    215            �           2606    528659    Decans Decans_loginId_key57 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key57" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key57";
       public         
   botirovs03    false    215            �           2606    528661    Decans Decans_loginId_key58 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key58" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key58";
       public         
   botirovs03    false    215            �           2606    528671    Decans Decans_loginId_key59 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key59" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key59";
       public         
   botirovs03    false    215            �           2606    528879    Decans Decans_loginId_key6 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key6" UNIQUE ("loginId");
 H   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key6";
       public         
   botirovs03    false    215            �           2606    528663    Decans Decans_loginId_key60 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key60" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key60";
       public         
   botirovs03    false    215            �           2606    528669    Decans Decans_loginId_key61 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key61" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key61";
       public         
   botirovs03    false    215            �           2606    528665    Decans Decans_loginId_key62 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key62" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key62";
       public         
   botirovs03    false    215            �           2606    528667    Decans Decans_loginId_key63 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key63" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key63";
       public         
   botirovs03    false    215            �           2606    528609    Decans Decans_loginId_key64 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key64" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key64";
       public         
   botirovs03    false    215            �           2606    528605    Decans Decans_loginId_key65 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key65" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key65";
       public         
   botirovs03    false    215            �           2606    528607    Decans Decans_loginId_key66 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key66" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key66";
       public         
   botirovs03    false    215            �           2606    528751    Decans Decans_loginId_key67 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key67" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key67";
       public         
   botirovs03    false    215            �           2606    528685    Decans Decans_loginId_key68 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key68" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key68";
       public         
   botirovs03    false    215            �           2606    528687    Decans Decans_loginId_key69 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key69" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key69";
       public         
   botirovs03    false    215            �           2606    528881    Decans Decans_loginId_key7 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key7" UNIQUE ("loginId");
 H   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key7";
       public         
   botirovs03    false    215            �           2606    528689    Decans Decans_loginId_key70 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key70" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key70";
       public         
   botirovs03    false    215            �           2606    528691    Decans Decans_loginId_key71 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key71" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key71";
       public         
   botirovs03    false    215                        2606    528693    Decans Decans_loginId_key72 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key72" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key72";
       public         
   botirovs03    false    215                       2606    528695    Decans Decans_loginId_key73 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key73" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key73";
       public         
   botirovs03    false    215                       2606    528697    Decans Decans_loginId_key74 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key74" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key74";
       public         
   botirovs03    false    215                       2606    528785    Decans Decans_loginId_key75 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key75" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key75";
       public         
   botirovs03    false    215                       2606    528699    Decans Decans_loginId_key76 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key76" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key76";
       public         
   botirovs03    false    215            
           2606    528701    Decans Decans_loginId_key77 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key77" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key77";
       public         
   botirovs03    false    215                       2606    528703    Decans Decans_loginId_key78 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key78" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key78";
       public         
   botirovs03    false    215                       2606    528705    Decans Decans_loginId_key79 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key79" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key79";
       public         
   botirovs03    false    215                       2606    528865    Decans Decans_loginId_key8 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key8" UNIQUE ("loginId");
 H   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key8";
       public         
   botirovs03    false    215                       2606    528707    Decans Decans_loginId_key80 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key80" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key80";
       public         
   botirovs03    false    215                       2606    528783    Decans Decans_loginId_key81 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key81" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key81";
       public         
   botirovs03    false    215                       2606    528709    Decans Decans_loginId_key82 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key82" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key82";
       public         
   botirovs03    false    215                       2606    528781    Decans Decans_loginId_key83 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key83" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key83";
       public         
   botirovs03    false    215                       2606    528711    Decans Decans_loginId_key84 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key84" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key84";
       public         
   botirovs03    false    215                       2606    528779    Decans Decans_loginId_key85 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key85" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key85";
       public         
   botirovs03    false    215                       2606    528713    Decans Decans_loginId_key86 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key86" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key86";
       public         
   botirovs03    false    215                        2606    528715    Decans Decans_loginId_key87 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key87" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key87";
       public         
   botirovs03    false    215            "           2606    528777    Decans Decans_loginId_key88 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key88" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key88";
       public         
   botirovs03    false    215            $           2606    528771    Decans Decans_loginId_key89 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key89" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key89";
       public         
   botirovs03    false    215            &           2606    528895    Decans Decans_loginId_key9 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key9" UNIQUE ("loginId");
 H   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key9";
       public         
   botirovs03    false    215            (           2606    528775    Decans Decans_loginId_key90 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key90" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key90";
       public         
   botirovs03    false    215            *           2606    528773    Decans Decans_loginId_key91 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key91" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key91";
       public         
   botirovs03    false    215            ,           2606    528815    Decans Decans_loginId_key92 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key92" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key92";
       public         
   botirovs03    false    215            .           2606    528817    Decans Decans_loginId_key93 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key93" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key93";
       public         
   botirovs03    false    215            0           2606    528677    Decans Decans_loginId_key94 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key94" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key94";
       public         
   botirovs03    false    215            2           2606    528819    Decans Decans_loginId_key95 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key95" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key95";
       public         
   botirovs03    false    215            4           2606    528883    Decans Decans_loginId_key96 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key96" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key96";
       public         
   botirovs03    false    215            6           2606    528821    Decans Decans_loginId_key97 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key97" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key97";
       public         
   botirovs03    false    215            8           2606    528823    Decans Decans_loginId_key98 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key98" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key98";
       public         
   botirovs03    false    215            :           2606    528825    Decans Decans_loginId_key99 
   CONSTRAINT     _   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_loginId_key99" UNIQUE ("loginId");
 I   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_loginId_key99";
       public         
   botirovs03    false    215            <           2606    294677    Decans Decans_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Decans"
    ADD CONSTRAINT "Decans_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Decans" DROP CONSTRAINT "Decans_pkey";
       public         
   botirovs03    false    215            �           2606    294448    Groups Groups_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Groups"
    ADD CONSTRAINT "Groups_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Groups" DROP CONSTRAINT "Groups_pkey";
       public         
   botirovs03    false    209            �           2606    529365    Infos Infos_emailInfo_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key" UNIQUE ("emailInfo");
 G   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key";
       public         
   botirovs03    false    217            �           2606    529367    Infos Infos_emailInfo_key1 
   CONSTRAINT     `   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key1" UNIQUE ("emailInfo");
 H   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key1";
       public         
   botirovs03    false    217            �           2606    529495    Infos Infos_emailInfo_key10 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key10" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key10";
       public         
   botirovs03    false    217            �           2606    529549    Infos Infos_emailInfo_key100 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key100" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key100";
       public         
   botirovs03    false    217            �           2606    529583    Infos Infos_emailInfo_key101 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key101" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key101";
       public         
   botirovs03    false    217            �           2606    529551    Infos Infos_emailInfo_key102 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key102" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key102";
       public         
   botirovs03    false    217            �           2606    529553    Infos Infos_emailInfo_key103 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key103" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key103";
       public         
   botirovs03    false    217            �           2606    529555    Infos Infos_emailInfo_key104 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key104" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key104";
       public         
   botirovs03    false    217            �           2606    529557    Infos Infos_emailInfo_key105 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key105" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key105";
       public         
   botirovs03    false    217            �           2606    529581    Infos Infos_emailInfo_key106 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key106" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key106";
       public         
   botirovs03    false    217            �           2606    529559    Infos Infos_emailInfo_key107 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key107" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key107";
       public         
   botirovs03    false    217            �           2606    529579    Infos Infos_emailInfo_key108 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key108" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key108";
       public         
   botirovs03    false    217            �           2606    529561    Infos Infos_emailInfo_key109 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key109" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key109";
       public         
   botirovs03    false    217            �           2606    529497    Infos Infos_emailInfo_key11 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key11" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key11";
       public         
   botirovs03    false    217            �           2606    529577    Infos Infos_emailInfo_key110 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key110" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key110";
       public         
   botirovs03    false    217            �           2606    529563    Infos Infos_emailInfo_key111 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key111" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key111";
       public         
   botirovs03    false    217            �           2606    529575    Infos Infos_emailInfo_key112 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key112" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key112";
       public         
   botirovs03    false    217            �           2606    529565    Infos Infos_emailInfo_key113 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key113" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key113";
       public         
   botirovs03    false    217            �           2606    529567    Infos Infos_emailInfo_key114 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key114" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key114";
       public         
   botirovs03    false    217            �           2606    529573    Infos Infos_emailInfo_key115 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key115" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key115";
       public         
   botirovs03    false    217            �           2606    529569    Infos Infos_emailInfo_key116 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key116" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key116";
       public         
   botirovs03    false    217            �           2606    529571    Infos Infos_emailInfo_key117 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key117" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key117";
       public         
   botirovs03    false    217            �           2606    529473    Infos Infos_emailInfo_key118 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key118" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key118";
       public         
   botirovs03    false    217            �           2606    529589    Infos Infos_emailInfo_key119 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key119" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key119";
       public         
   botirovs03    false    217            �           2606    529501    Infos Infos_emailInfo_key12 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key12" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key12";
       public         
   botirovs03    false    217            �           2606    529591    Infos Infos_emailInfo_key120 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key120" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key120";
       public         
   botirovs03    false    217            �           2606    529349    Infos Infos_emailInfo_key121 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key121" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key121";
       public         
   botirovs03    false    217            �           2606    529593    Infos Infos_emailInfo_key122 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key122" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key122";
       public         
   botirovs03    false    217            �           2606    529595    Infos Infos_emailInfo_key123 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key123" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key123";
       public         
   botirovs03    false    217            �           2606    529597    Infos Infos_emailInfo_key124 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key124" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key124";
       public         
   botirovs03    false    217            �           2606    529347    Infos Infos_emailInfo_key125 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key125" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key125";
       public         
   botirovs03    false    217            �           2606    529599    Infos Infos_emailInfo_key126 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key126" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key126";
       public         
   botirovs03    false    217            �           2606    529601    Infos Infos_emailInfo_key127 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key127" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key127";
       public         
   botirovs03    false    217            �           2606    529345    Infos Infos_emailInfo_key128 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key128" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key128";
       public         
   botirovs03    false    217            �           2606    529603    Infos Infos_emailInfo_key129 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key129" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key129";
       public         
   botirovs03    false    217            �           2606    529499    Infos Infos_emailInfo_key13 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key13" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key13";
       public         
   botirovs03    false    217            �           2606    529343    Infos Infos_emailInfo_key130 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key130" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key130";
       public         
   botirovs03    false    217            �           2606    529605    Infos Infos_emailInfo_key131 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key131" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key131";
       public         
   botirovs03    false    217            �           2606    529607    Infos Infos_emailInfo_key132 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key132" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key132";
       public         
   botirovs03    false    217            �           2606    529609    Infos Infos_emailInfo_key133 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key133" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key133";
       public         
   botirovs03    false    217            �           2606    529341    Infos Infos_emailInfo_key134 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key134" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key134";
       public         
   botirovs03    false    217            �           2606    529611    Infos Infos_emailInfo_key135 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key135" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key135";
       public         
   botirovs03    false    217            �           2606    529613    Infos Infos_emailInfo_key136 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key136" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key136";
       public         
   botirovs03    false    217            �           2606    529339    Infos Infos_emailInfo_key137 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key137" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key137";
       public         
   botirovs03    false    217            �           2606    529615    Infos Infos_emailInfo_key138 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key138" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key138";
       public         
   botirovs03    false    217            �           2606    529617    Infos Infos_emailInfo_key139 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key139" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key139";
       public         
   botirovs03    false    217            �           2606    529375    Infos Infos_emailInfo_key14 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key14" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key14";
       public         
   botirovs03    false    217                        2606    529337    Infos Infos_emailInfo_key140 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key140" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key140";
       public         
   botirovs03    false    217                       2606    529619    Infos Infos_emailInfo_key141 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key141" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key141";
       public         
   botirovs03    false    217                       2606    529621    Infos Infos_emailInfo_key142 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key142" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key142";
       public         
   botirovs03    false    217                       2606    529623    Infos Infos_emailInfo_key143 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key143" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key143";
       public         
   botirovs03    false    217                       2606    529335    Infos Infos_emailInfo_key144 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key144" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key144";
       public         
   botirovs03    false    217            
           2606    529625    Infos Infos_emailInfo_key145 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key145" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key145";
       public         
   botirovs03    false    217                       2606    529333    Infos Infos_emailInfo_key146 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key146" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key146";
       public         
   botirovs03    false    217                       2606    529627    Infos Infos_emailInfo_key147 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key147" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key147";
       public         
   botirovs03    false    217                       2606    529629    Infos Infos_emailInfo_key148 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key148" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key148";
       public         
   botirovs03    false    217                       2606    529631    Infos Infos_emailInfo_key149 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key149" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key149";
       public         
   botirovs03    false    217                       2606    529455    Infos Infos_emailInfo_key15 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key15" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key15";
       public         
   botirovs03    false    217                       2606    529633    Infos Infos_emailInfo_key150 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key150" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key150";
       public         
   botirovs03    false    217                       2606    529331    Infos Infos_emailInfo_key151 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key151" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key151";
       public         
   botirovs03    false    217                       2606    529635    Infos Infos_emailInfo_key152 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key152" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key152";
       public         
   botirovs03    false    217                       2606    529637    Infos Infos_emailInfo_key153 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key153" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key153";
       public         
   botirovs03    false    217                       2606    529639    Infos Infos_emailInfo_key154 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key154" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key154";
       public         
   botirovs03    false    217                        2606    529329    Infos Infos_emailInfo_key155 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key155" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key155";
       public         
   botirovs03    false    217            "           2606    529327    Infos Infos_emailInfo_key156 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key156" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key156";
       public         
   botirovs03    false    217            $           2606    529641    Infos Infos_emailInfo_key157 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key157" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key157";
       public         
   botirovs03    false    217            &           2606    529325    Infos Infos_emailInfo_key158 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key158" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key158";
       public         
   botirovs03    false    217            (           2606    529643    Infos Infos_emailInfo_key159 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key159" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key159";
       public         
   botirovs03    false    217            *           2606    529377    Infos Infos_emailInfo_key16 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key16" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key16";
       public         
   botirovs03    false    217            ,           2606    529645    Infos Infos_emailInfo_key160 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key160" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key160";
       public         
   botirovs03    false    217            .           2606    529647    Infos Infos_emailInfo_key161 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key161" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key161";
       public         
   botirovs03    false    217            0           2606    529649    Infos Infos_emailInfo_key162 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key162" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key162";
       public         
   botirovs03    false    217            2           2606    529323    Infos Infos_emailInfo_key163 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key163" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key163";
       public         
   botirovs03    false    217            4           2606    529651    Infos Infos_emailInfo_key164 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key164" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key164";
       public         
   botirovs03    false    217            6           2606    529653    Infos Infos_emailInfo_key165 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key165" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key165";
       public         
   botirovs03    false    217            8           2606    529655    Infos Infos_emailInfo_key166 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key166" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key166";
       public         
   botirovs03    false    217            :           2606    529321    Infos Infos_emailInfo_key167 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key167" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key167";
       public         
   botirovs03    false    217            <           2606    529657    Infos Infos_emailInfo_key168 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key168" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key168";
       public         
   botirovs03    false    217            >           2606    529319    Infos Infos_emailInfo_key169 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key169" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key169";
       public         
   botirovs03    false    217            @           2606    529379    Infos Infos_emailInfo_key17 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key17" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key17";
       public         
   botirovs03    false    217            B           2606    529659    Infos Infos_emailInfo_key170 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key170" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key170";
       public         
   botirovs03    false    217            D           2606    529317    Infos Infos_emailInfo_key171 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key171" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key171";
       public         
   botirovs03    false    217            F           2606    529661    Infos Infos_emailInfo_key172 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key172" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key172";
       public         
   botirovs03    false    217            H           2606    529663    Infos Infos_emailInfo_key173 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key173" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key173";
       public         
   botirovs03    false    217            J           2606    529665    Infos Infos_emailInfo_key174 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key174" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key174";
       public         
   botirovs03    false    217            L           2606    529315    Infos Infos_emailInfo_key175 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key175" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key175";
       public         
   botirovs03    false    217            N           2606    529667    Infos Infos_emailInfo_key176 
   CONSTRAINT     b   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key176" UNIQUE ("emailInfo");
 J   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key176";
       public         
   botirovs03    false    217            P           2606    529453    Infos Infos_emailInfo_key18 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key18" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key18";
       public         
   botirovs03    false    217            R           2606    529381    Infos Infos_emailInfo_key19 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key19" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key19";
       public         
   botirovs03    false    217            T           2606    529369    Infos Infos_emailInfo_key2 
   CONSTRAINT     `   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key2" UNIQUE ("emailInfo");
 H   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key2";
       public         
   botirovs03    false    217            V           2606    529451    Infos Infos_emailInfo_key20 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key20" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key20";
       public         
   botirovs03    false    217            X           2606    529383    Infos Infos_emailInfo_key21 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key21" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key21";
       public         
   botirovs03    false    217            Z           2606    529385    Infos Infos_emailInfo_key22 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key22" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key22";
       public         
   botirovs03    false    217            \           2606    529449    Infos Infos_emailInfo_key23 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key23" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key23";
       public         
   botirovs03    false    217            ^           2606    529447    Infos Infos_emailInfo_key24 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key24" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key24";
       public         
   botirovs03    false    217            `           2606    529387    Infos Infos_emailInfo_key25 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key25" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key25";
       public         
   botirovs03    false    217            b           2606    529445    Infos Infos_emailInfo_key26 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key26" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key26";
       public         
   botirovs03    false    217            d           2606    529389    Infos Infos_emailInfo_key27 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key27" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key27";
       public         
   botirovs03    false    217            f           2606    529443    Infos Infos_emailInfo_key28 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key28" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key28";
       public         
   botirovs03    false    217            h           2606    529391    Infos Infos_emailInfo_key29 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key29" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key29";
       public         
   botirovs03    false    217            j           2606    529371    Infos Infos_emailInfo_key3 
   CONSTRAINT     `   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key3" UNIQUE ("emailInfo");
 H   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key3";
       public         
   botirovs03    false    217            l           2606    529393    Infos Infos_emailInfo_key30 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key30" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key30";
       public         
   botirovs03    false    217            n           2606    529441    Infos Infos_emailInfo_key31 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key31" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key31";
       public         
   botirovs03    false    217            p           2606    529395    Infos Infos_emailInfo_key32 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key32" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key32";
       public         
   botirovs03    false    217            r           2606    529397    Infos Infos_emailInfo_key33 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key33" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key33";
       public         
   botirovs03    false    217            t           2606    529439    Infos Infos_emailInfo_key34 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key34" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key34";
       public         
   botirovs03    false    217            v           2606    529399    Infos Infos_emailInfo_key35 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key35" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key35";
       public         
   botirovs03    false    217            x           2606    529437    Infos Infos_emailInfo_key36 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key36" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key36";
       public         
   botirovs03    false    217            z           2606    529491    Infos Infos_emailInfo_key37 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key37" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key37";
       public         
   botirovs03    false    217            |           2606    529401    Infos Infos_emailInfo_key38 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key38" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key38";
       public         
   botirovs03    false    217            ~           2606    529435    Infos Infos_emailInfo_key39 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key39" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key39";
       public         
   botirovs03    false    217            �           2606    529373    Infos Infos_emailInfo_key4 
   CONSTRAINT     `   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key4" UNIQUE ("emailInfo");
 H   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key4";
       public         
   botirovs03    false    217            �           2606    529403    Infos Infos_emailInfo_key40 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key40" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key40";
       public         
   botirovs03    false    217            �           2606    529405    Infos Infos_emailInfo_key41 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key41" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key41";
       public         
   botirovs03    false    217            �           2606    529407    Infos Infos_emailInfo_key42 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key42" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key42";
       public         
   botirovs03    false    217            �           2606    529433    Infos Infos_emailInfo_key43 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key43" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key43";
       public         
   botirovs03    false    217            �           2606    529409    Infos Infos_emailInfo_key44 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key44" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key44";
       public         
   botirovs03    false    217            �           2606    529411    Infos Infos_emailInfo_key45 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key45" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key45";
       public         
   botirovs03    false    217            �           2606    529413    Infos Infos_emailInfo_key46 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key46" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key46";
       public         
   botirovs03    false    217            �           2606    529415    Infos Infos_emailInfo_key47 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key47" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key47";
       public         
   botirovs03    false    217            �           2606    529417    Infos Infos_emailInfo_key48 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key48" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key48";
       public         
   botirovs03    false    217            �           2606    529431    Infos Infos_emailInfo_key49 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key49" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key49";
       public         
   botirovs03    false    217            �           2606    529457    Infos Infos_emailInfo_key5 
   CONSTRAINT     `   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key5" UNIQUE ("emailInfo");
 H   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key5";
       public         
   botirovs03    false    217            �           2606    529419    Infos Infos_emailInfo_key50 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key50" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key50";
       public         
   botirovs03    false    217            �           2606    529421    Infos Infos_emailInfo_key51 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key51" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key51";
       public         
   botirovs03    false    217            �           2606    529423    Infos Infos_emailInfo_key52 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key52" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key52";
       public         
   botirovs03    false    217            �           2606    529425    Infos Infos_emailInfo_key53 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key53" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key53";
       public         
   botirovs03    false    217            �           2606    529427    Infos Infos_emailInfo_key54 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key54" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key54";
       public         
   botirovs03    false    217            �           2606    529429    Infos Infos_emailInfo_key55 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key55" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key55";
       public         
   botirovs03    false    217            �           2606    529459    Infos Infos_emailInfo_key56 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key56" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key56";
       public         
   botirovs03    false    217            �           2606    529461    Infos Infos_emailInfo_key57 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key57" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key57";
       public         
   botirovs03    false    217            �           2606    529485    Infos Infos_emailInfo_key58 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key58" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key58";
       public         
   botirovs03    false    217            �           2606    529463    Infos Infos_emailInfo_key59 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key59" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key59";
       public         
   botirovs03    false    217            �           2606    529487    Infos Infos_emailInfo_key6 
   CONSTRAINT     `   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key6" UNIQUE ("emailInfo");
 H   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key6";
       public         
   botirovs03    false    217            �           2606    529483    Infos Infos_emailInfo_key60 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key60" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key60";
       public         
   botirovs03    false    217            �           2606    529465    Infos Infos_emailInfo_key61 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key61" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key61";
       public         
   botirovs03    false    217            �           2606    529481    Infos Infos_emailInfo_key62 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key62" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key62";
       public         
   botirovs03    false    217            �           2606    529479    Infos Infos_emailInfo_key63 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key63" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key63";
       public         
   botirovs03    false    217            �           2606    529467    Infos Infos_emailInfo_key64 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key64" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key64";
       public         
   botirovs03    false    217            �           2606    529469    Infos Infos_emailInfo_key65 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key65" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key65";
       public         
   botirovs03    false    217            �           2606    529477    Infos Infos_emailInfo_key66 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key66" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key66";
       public         
   botirovs03    false    217            �           2606    529471    Infos Infos_emailInfo_key67 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key67" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key67";
       public         
   botirovs03    false    217            �           2606    529475    Infos Infos_emailInfo_key68 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key68" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key68";
       public         
   botirovs03    false    217            �           2606    529503    Infos Infos_emailInfo_key69 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key69" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key69";
       public         
   botirovs03    false    217            �           2606    529489    Infos Infos_emailInfo_key7 
   CONSTRAINT     `   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key7" UNIQUE ("emailInfo");
 H   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key7";
       public         
   botirovs03    false    217            �           2606    529505    Infos Infos_emailInfo_key70 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key70" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key70";
       public         
   botirovs03    false    217            �           2606    529507    Infos Infos_emailInfo_key71 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key71" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key71";
       public         
   botirovs03    false    217            �           2606    529509    Infos Infos_emailInfo_key72 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key72" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key72";
       public         
   botirovs03    false    217            �           2606    529511    Infos Infos_emailInfo_key73 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key73" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key73";
       public         
   botirovs03    false    217            �           2606    529361    Infos Infos_emailInfo_key74 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key74" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key74";
       public         
   botirovs03    false    217            �           2606    529513    Infos Infos_emailInfo_key75 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key75" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key75";
       public         
   botirovs03    false    217            �           2606    529515    Infos Infos_emailInfo_key76 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key76" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key76";
       public         
   botirovs03    false    217            �           2606    529517    Infos Infos_emailInfo_key77 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key77" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key77";
       public         
   botirovs03    false    217            �           2606    529519    Infos Infos_emailInfo_key78 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key78" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key78";
       public         
   botirovs03    false    217            �           2606    529521    Infos Infos_emailInfo_key79 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key79" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key79";
       public         
   botirovs03    false    217            �           2606    529363    Infos Infos_emailInfo_key8 
   CONSTRAINT     `   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key8" UNIQUE ("emailInfo");
 H   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key8";
       public         
   botirovs03    false    217            �           2606    529359    Infos Infos_emailInfo_key80 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key80" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key80";
       public         
   botirovs03    false    217            �           2606    529523    Infos Infos_emailInfo_key81 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key81" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key81";
       public         
   botirovs03    false    217            �           2606    529357    Infos Infos_emailInfo_key82 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key82" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key82";
       public         
   botirovs03    false    217            �           2606    529525    Infos Infos_emailInfo_key83 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key83" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key83";
       public         
   botirovs03    false    217            �           2606    529355    Infos Infos_emailInfo_key84 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key84" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key84";
       public         
   botirovs03    false    217            �           2606    529527    Infos Infos_emailInfo_key85 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key85" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key85";
       public         
   botirovs03    false    217            �           2606    529529    Infos Infos_emailInfo_key86 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key86" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key86";
       public         
   botirovs03    false    217            �           2606    529353    Infos Infos_emailInfo_key87 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key87" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key87";
       public         
   botirovs03    false    217            �           2606    529531    Infos Infos_emailInfo_key88 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key88" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key88";
       public         
   botirovs03    false    217            �           2606    529351    Infos Infos_emailInfo_key89 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key89" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key89";
       public         
   botirovs03    false    217            �           2606    529493    Infos Infos_emailInfo_key9 
   CONSTRAINT     `   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key9" UNIQUE ("emailInfo");
 H   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key9";
       public         
   botirovs03    false    217            �           2606    529533    Infos Infos_emailInfo_key90 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key90" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key90";
       public         
   botirovs03    false    217            �           2606    529535    Infos Infos_emailInfo_key91 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key91" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key91";
       public         
   botirovs03    false    217            �           2606    529537    Infos Infos_emailInfo_key92 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key92" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key92";
       public         
   botirovs03    false    217            �           2606    529587    Infos Infos_emailInfo_key93 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key93" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key93";
       public         
   botirovs03    false    217            �           2606    529539    Infos Infos_emailInfo_key94 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key94" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key94";
       public         
   botirovs03    false    217            �           2606    529585    Infos Infos_emailInfo_key95 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key95" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key95";
       public         
   botirovs03    false    217            �           2606    529541    Infos Infos_emailInfo_key96 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key96" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key96";
       public         
   botirovs03    false    217            �           2606    529543    Infos Infos_emailInfo_key97 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key97" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key97";
       public         
   botirovs03    false    217                        2606    529545    Infos Infos_emailInfo_key98 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key98" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key98";
       public         
   botirovs03    false    217                       2606    529547    Infos Infos_emailInfo_key99 
   CONSTRAINT     a   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_emailInfo_key99" UNIQUE ("emailInfo");
 I   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_emailInfo_key99";
       public         
   botirovs03    false    217                       2606    294707    Infos Infos_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Infos"
    ADD CONSTRAINT "Infos_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Infos" DROP CONSTRAINT "Infos_pkey";
       public         
   botirovs03    false    217            n           2606    528417 !   Recruitors Recruitors_loginId_key 
   CONSTRAINT     e   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key" UNIQUE ("loginId");
 O   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key";
       public         
   botirovs03    false    213            p           2606    528439 "   Recruitors Recruitors_loginId_key1 
   CONSTRAINT     f   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key1" UNIQUE ("loginId");
 P   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key1";
       public         
   botirovs03    false    213            r           2606    528405 #   Recruitors Recruitors_loginId_key10 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key10" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key10";
       public         
   botirovs03    false    213            t           2606    528423 $   Recruitors Recruitors_loginId_key100 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key100" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key100";
       public         
   botirovs03    false    213            v           2606    528425 $   Recruitors Recruitors_loginId_key101 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key101" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key101";
       public         
   botirovs03    false    213            x           2606    528437 $   Recruitors Recruitors_loginId_key102 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key102" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key102";
       public         
   botirovs03    false    213            z           2606    528427 $   Recruitors Recruitors_loginId_key103 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key103" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key103";
       public         
   botirovs03    false    213            |           2606    528429 $   Recruitors Recruitors_loginId_key104 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key104" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key104";
       public         
   botirovs03    false    213            ~           2606    528431 $   Recruitors Recruitors_loginId_key105 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key105" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key105";
       public         
   botirovs03    false    213            �           2606    528433 $   Recruitors Recruitors_loginId_key106 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key106" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key106";
       public         
   botirovs03    false    213            �           2606    528435 $   Recruitors Recruitors_loginId_key107 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key107" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key107";
       public         
   botirovs03    false    213            �           2606    528341 $   Recruitors Recruitors_loginId_key108 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key108" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key108";
       public         
   botirovs03    false    213            �           2606    528349 $   Recruitors Recruitors_loginId_key109 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key109" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key109";
       public         
   botirovs03    false    213            �           2606    528407 #   Recruitors Recruitors_loginId_key11 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key11" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key11";
       public         
   botirovs03    false    213            �           2606    528343 $   Recruitors Recruitors_loginId_key110 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key110" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key110";
       public         
   botirovs03    false    213            �           2606    528347 $   Recruitors Recruitors_loginId_key111 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key111" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key111";
       public         
   botirovs03    false    213            �           2606    528345 $   Recruitors Recruitors_loginId_key112 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key112" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key112";
       public         
   botirovs03    false    213            �           2606    528259 $   Recruitors Recruitors_loginId_key113 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key113" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key113";
       public         
   botirovs03    false    213            �           2606    528487 $   Recruitors Recruitors_loginId_key114 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key114" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key114";
       public         
   botirovs03    false    213            �           2606    528489 $   Recruitors Recruitors_loginId_key115 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key115" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key115";
       public         
   botirovs03    false    213            �           2606    528257 $   Recruitors Recruitors_loginId_key116 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key116" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key116";
       public         
   botirovs03    false    213            �           2606    528491 $   Recruitors Recruitors_loginId_key117 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key117" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key117";
       public         
   botirovs03    false    213            �           2606    528493 $   Recruitors Recruitors_loginId_key118 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key118" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key118";
       public         
   botirovs03    false    213            �           2606    528255 $   Recruitors Recruitors_loginId_key119 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key119" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key119";
       public         
   botirovs03    false    213            �           2606    528413 #   Recruitors Recruitors_loginId_key12 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key12" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key12";
       public         
   botirovs03    false    213            �           2606    528495 $   Recruitors Recruitors_loginId_key120 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key120" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key120";
       public         
   botirovs03    false    213            �           2606    528497 $   Recruitors Recruitors_loginId_key121 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key121" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key121";
       public         
   botirovs03    false    213            �           2606    528253 $   Recruitors Recruitors_loginId_key122 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key122" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key122";
       public         
   botirovs03    false    213            �           2606    528499 $   Recruitors Recruitors_loginId_key123 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key123" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key123";
       public         
   botirovs03    false    213            �           2606    528501 $   Recruitors Recruitors_loginId_key124 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key124" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key124";
       public         
   botirovs03    false    213            �           2606    528251 $   Recruitors Recruitors_loginId_key125 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key125" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key125";
       public         
   botirovs03    false    213            �           2606    528249 $   Recruitors Recruitors_loginId_key126 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key126" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key126";
       public         
   botirovs03    false    213            �           2606    528503 $   Recruitors Recruitors_loginId_key127 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key127" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key127";
       public         
   botirovs03    false    213            �           2606    528505 $   Recruitors Recruitors_loginId_key128 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key128" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key128";
       public         
   botirovs03    false    213            �           2606    528507 $   Recruitors Recruitors_loginId_key129 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key129" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key129";
       public         
   botirovs03    false    213            �           2606    528409 #   Recruitors Recruitors_loginId_key13 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key13" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key13";
       public         
   botirovs03    false    213            �           2606    528509 $   Recruitors Recruitors_loginId_key130 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key130" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key130";
       public         
   botirovs03    false    213            �           2606    528247 $   Recruitors Recruitors_loginId_key131 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key131" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key131";
       public         
   botirovs03    false    213            �           2606    528511 $   Recruitors Recruitors_loginId_key132 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key132" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key132";
       public         
   botirovs03    false    213            �           2606    528513 $   Recruitors Recruitors_loginId_key133 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key133" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key133";
       public         
   botirovs03    false    213            �           2606    528515 $   Recruitors Recruitors_loginId_key134 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key134" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key134";
       public         
   botirovs03    false    213            �           2606    528517 $   Recruitors Recruitors_loginId_key135 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key135" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key135";
       public         
   botirovs03    false    213            �           2606    528519 $   Recruitors Recruitors_loginId_key136 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key136" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key136";
       public         
   botirovs03    false    213            �           2606    528521 $   Recruitors Recruitors_loginId_key137 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key137" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key137";
       public         
   botirovs03    false    213            �           2606    528245 $   Recruitors Recruitors_loginId_key138 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key138" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key138";
       public         
   botirovs03    false    213            �           2606    528523 $   Recruitors Recruitors_loginId_key139 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key139" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key139";
       public         
   botirovs03    false    213            �           2606    528411 #   Recruitors Recruitors_loginId_key14 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key14" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key14";
       public         
   botirovs03    false    213            �           2606    528525 $   Recruitors Recruitors_loginId_key140 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key140" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key140";
       public         
   botirovs03    false    213            �           2606    528527 $   Recruitors Recruitors_loginId_key141 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key141" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key141";
       public         
   botirovs03    false    213            �           2606    528243 $   Recruitors Recruitors_loginId_key142 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key142" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key142";
       public         
   botirovs03    false    213            �           2606    528529 $   Recruitors Recruitors_loginId_key143 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key143" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key143";
       public         
   botirovs03    false    213            �           2606    528531 $   Recruitors Recruitors_loginId_key144 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key144" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key144";
       public         
   botirovs03    false    213            �           2606    528533 $   Recruitors Recruitors_loginId_key145 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key145" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key145";
       public         
   botirovs03    false    213            �           2606    528241 $   Recruitors Recruitors_loginId_key146 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key146" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key146";
       public         
   botirovs03    false    213            �           2606    528535 $   Recruitors Recruitors_loginId_key147 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key147" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key147";
       public         
   botirovs03    false    213            �           2606    528239 $   Recruitors Recruitors_loginId_key148 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key148" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key148";
       public         
   botirovs03    false    213            �           2606    528537 $   Recruitors Recruitors_loginId_key149 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key149" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key149";
       public         
   botirovs03    false    213            �           2606    528391 #   Recruitors Recruitors_loginId_key15 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key15" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key15";
       public         
   botirovs03    false    213            �           2606    528539 $   Recruitors Recruitors_loginId_key150 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key150" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key150";
       public         
   botirovs03    false    213            �           2606    528541 $   Recruitors Recruitors_loginId_key151 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key151" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key151";
       public         
   botirovs03    false    213            �           2606    528543 $   Recruitors Recruitors_loginId_key152 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key152" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key152";
       public         
   botirovs03    false    213            �           2606    528237 $   Recruitors Recruitors_loginId_key153 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key153" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key153";
       public         
   botirovs03    false    213            �           2606    528545 $   Recruitors Recruitors_loginId_key154 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key154" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key154";
       public         
   botirovs03    false    213            �           2606    528547 $   Recruitors Recruitors_loginId_key155 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key155" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key155";
       public         
   botirovs03    false    213            �           2606    528549 $   Recruitors Recruitors_loginId_key156 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key156" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key156";
       public         
   botirovs03    false    213            �           2606    528551 $   Recruitors Recruitors_loginId_key157 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key157" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key157";
       public         
   botirovs03    false    213            �           2606    528235 $   Recruitors Recruitors_loginId_key158 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key158" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key158";
       public         
   botirovs03    false    213            �           2606    528553 $   Recruitors Recruitors_loginId_key159 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key159" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key159";
       public         
   botirovs03    false    213            �           2606    528443 #   Recruitors Recruitors_loginId_key16 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key16" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key16";
       public         
   botirovs03    false    213            �           2606    528233 $   Recruitors Recruitors_loginId_key160 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key160" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key160";
       public         
   botirovs03    false    213            �           2606    528555 $   Recruitors Recruitors_loginId_key161 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key161" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key161";
       public         
   botirovs03    false    213            �           2606    528557 $   Recruitors Recruitors_loginId_key162 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key162" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key162";
       public         
   botirovs03    false    213            �           2606    528559 $   Recruitors Recruitors_loginId_key163 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key163" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key163";
       public         
   botirovs03    false    213                        2606    528561 $   Recruitors Recruitors_loginId_key164 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key164" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key164";
       public         
   botirovs03    false    213                       2606    528231 $   Recruitors Recruitors_loginId_key165 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key165" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key165";
       public         
   botirovs03    false    213                       2606    528563 $   Recruitors Recruitors_loginId_key166 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key166" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key166";
       public         
   botirovs03    false    213                       2606    528565 $   Recruitors Recruitors_loginId_key167 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key167" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key167";
       public         
   botirovs03    false    213                       2606    528567 $   Recruitors Recruitors_loginId_key168 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key168" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key168";
       public         
   botirovs03    false    213            
           2606    528569 $   Recruitors Recruitors_loginId_key169 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key169" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key169";
       public         
   botirovs03    false    213                       2606    528445 #   Recruitors Recruitors_loginId_key17 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key17" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key17";
       public         
   botirovs03    false    213                       2606    528571 $   Recruitors Recruitors_loginId_key170 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key170" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key170";
       public         
   botirovs03    false    213                       2606    528229 $   Recruitors Recruitors_loginId_key171 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key171" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key171";
       public         
   botirovs03    false    213                       2606    528573 $   Recruitors Recruitors_loginId_key172 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key172" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key172";
       public         
   botirovs03    false    213                       2606    528227 $   Recruitors Recruitors_loginId_key173 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key173" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key173";
       public         
   botirovs03    false    213                       2606    528575 $   Recruitors Recruitors_loginId_key174 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key174" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key174";
       public         
   botirovs03    false    213                       2606    528577 $   Recruitors Recruitors_loginId_key175 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key175" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key175";
       public         
   botirovs03    false    213                       2606    528579 $   Recruitors Recruitors_loginId_key176 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key176" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key176";
       public         
   botirovs03    false    213                       2606    528225 $   Recruitors Recruitors_loginId_key177 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key177" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key177";
       public         
   botirovs03    false    213                       2606    528581 $   Recruitors Recruitors_loginId_key178 
   CONSTRAINT     h   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key178" UNIQUE ("loginId");
 R   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key178";
       public         
   botirovs03    false    213                        2606    528447 #   Recruitors Recruitors_loginId_key18 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key18" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key18";
       public         
   botirovs03    false    213            "           2606    528389 #   Recruitors Recruitors_loginId_key19 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key19" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key19";
       public         
   botirovs03    false    213            $           2606    528441 "   Recruitors Recruitors_loginId_key2 
   CONSTRAINT     f   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key2" UNIQUE ("loginId");
 P   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key2";
       public         
   botirovs03    false    213            &           2606    528387 #   Recruitors Recruitors_loginId_key20 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key20" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key20";
       public         
   botirovs03    false    213            (           2606    528449 #   Recruitors Recruitors_loginId_key21 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key21" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key21";
       public         
   botirovs03    false    213            *           2606    528451 #   Recruitors Recruitors_loginId_key22 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key22" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key22";
       public         
   botirovs03    false    213            ,           2606    528385 #   Recruitors Recruitors_loginId_key23 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key23" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key23";
       public         
   botirovs03    false    213            .           2606    528383 #   Recruitors Recruitors_loginId_key24 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key24" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key24";
       public         
   botirovs03    false    213            0           2606    528453 #   Recruitors Recruitors_loginId_key25 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key25" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key25";
       public         
   botirovs03    false    213            2           2606    528455 #   Recruitors Recruitors_loginId_key26 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key26" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key26";
       public         
   botirovs03    false    213            4           2606    528457 #   Recruitors Recruitors_loginId_key27 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key27" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key27";
       public         
   botirovs03    false    213            6           2606    528381 #   Recruitors Recruitors_loginId_key28 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key28" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key28";
       public         
   botirovs03    false    213            8           2606    528459 #   Recruitors Recruitors_loginId_key29 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key29" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key29";
       public         
   botirovs03    false    213            :           2606    528393 "   Recruitors Recruitors_loginId_key3 
   CONSTRAINT     f   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key3" UNIQUE ("loginId");
 P   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key3";
       public         
   botirovs03    false    213            <           2606    528461 #   Recruitors Recruitors_loginId_key30 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key30" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key30";
       public         
   botirovs03    false    213            >           2606    528379 #   Recruitors Recruitors_loginId_key31 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key31" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key31";
       public         
   botirovs03    false    213            @           2606    528463 #   Recruitors Recruitors_loginId_key32 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key32" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key32";
       public         
   botirovs03    false    213            B           2606    528465 #   Recruitors Recruitors_loginId_key33 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key33" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key33";
       public         
   botirovs03    false    213            D           2606    528377 #   Recruitors Recruitors_loginId_key34 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key34" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key34";
       public         
   botirovs03    false    213            F           2606    528467 #   Recruitors Recruitors_loginId_key35 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key35" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key35";
       public         
   botirovs03    false    213            H           2606    528469 #   Recruitors Recruitors_loginId_key36 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key36" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key36";
       public         
   botirovs03    false    213            J           2606    528375 #   Recruitors Recruitors_loginId_key37 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key37" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key37";
       public         
   botirovs03    false    213            L           2606    528471 #   Recruitors Recruitors_loginId_key38 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key38" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key38";
       public         
   botirovs03    false    213            N           2606    528473 #   Recruitors Recruitors_loginId_key39 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key39" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key39";
       public         
   botirovs03    false    213            P           2606    528395 "   Recruitors Recruitors_loginId_key4 
   CONSTRAINT     f   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key4" UNIQUE ("loginId");
 P   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key4";
       public         
   botirovs03    false    213            R           2606    528475 #   Recruitors Recruitors_loginId_key40 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key40" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key40";
       public         
   botirovs03    false    213            T           2606    528477 #   Recruitors Recruitors_loginId_key41 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key41" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key41";
       public         
   botirovs03    false    213            V           2606    528479 #   Recruitors Recruitors_loginId_key42 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key42" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key42";
       public         
   botirovs03    false    213            X           2606    528373 #   Recruitors Recruitors_loginId_key43 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key43" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key43";
       public         
   botirovs03    false    213            Z           2606    528481 #   Recruitors Recruitors_loginId_key44 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key44" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key44";
       public         
   botirovs03    false    213            \           2606    528483 #   Recruitors Recruitors_loginId_key45 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key45" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key45";
       public         
   botirovs03    false    213            ^           2606    528485 #   Recruitors Recruitors_loginId_key46 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key46" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key46";
       public         
   botirovs03    false    213            `           2606    528261 #   Recruitors Recruitors_loginId_key47 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key47" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key47";
       public         
   botirovs03    false    213            b           2606    528371 #   Recruitors Recruitors_loginId_key48 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key48" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key48";
       public         
   botirovs03    false    213            d           2606    528263 #   Recruitors Recruitors_loginId_key49 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key49" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key49";
       public         
   botirovs03    false    213            f           2606    528397 "   Recruitors Recruitors_loginId_key5 
   CONSTRAINT     f   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key5" UNIQUE ("loginId");
 P   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key5";
       public         
   botirovs03    false    213            h           2606    528369 #   Recruitors Recruitors_loginId_key50 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key50" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key50";
       public         
   botirovs03    false    213            j           2606    528333 #   Recruitors Recruitors_loginId_key51 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key51" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key51";
       public         
   botirovs03    false    213            l           2606    528335 #   Recruitors Recruitors_loginId_key52 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key52" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key52";
       public         
   botirovs03    false    213            n           2606    528337 #   Recruitors Recruitors_loginId_key53 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key53" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key53";
       public         
   botirovs03    false    213            p           2606    528339 #   Recruitors Recruitors_loginId_key54 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key54" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key54";
       public         
   botirovs03    false    213            r           2606    528351 #   Recruitors Recruitors_loginId_key55 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key55" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key55";
       public         
   botirovs03    false    213            t           2606    528367 #   Recruitors Recruitors_loginId_key56 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key56" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key56";
       public         
   botirovs03    false    213            v           2606    528353 #   Recruitors Recruitors_loginId_key57 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key57" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key57";
       public         
   botirovs03    false    213            x           2606    528355 #   Recruitors Recruitors_loginId_key58 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key58" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key58";
       public         
   botirovs03    false    213            z           2606    528365 #   Recruitors Recruitors_loginId_key59 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key59" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key59";
       public         
   botirovs03    false    213            |           2606    528399 "   Recruitors Recruitors_loginId_key6 
   CONSTRAINT     f   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key6" UNIQUE ("loginId");
 P   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key6";
       public         
   botirovs03    false    213            ~           2606    528357 #   Recruitors Recruitors_loginId_key60 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key60" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key60";
       public         
   botirovs03    false    213            �           2606    528363 #   Recruitors Recruitors_loginId_key61 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key61" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key61";
       public         
   botirovs03    false    213            �           2606    528359 #   Recruitors Recruitors_loginId_key62 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key62" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key62";
       public         
   botirovs03    false    213            �           2606    528361 #   Recruitors Recruitors_loginId_key63 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key63" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key63";
       public         
   botirovs03    false    213            �           2606    528331 #   Recruitors Recruitors_loginId_key64 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key64" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key64";
       public         
   botirovs03    false    213            �           2606    528265 #   Recruitors Recruitors_loginId_key65 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key65" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key65";
       public         
   botirovs03    false    213            �           2606    528329 #   Recruitors Recruitors_loginId_key66 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key66" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key66";
       public         
   botirovs03    false    213            �           2606    528327 #   Recruitors Recruitors_loginId_key67 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key67" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key67";
       public         
   botirovs03    false    213            �           2606    528267 #   Recruitors Recruitors_loginId_key68 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key68" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key68";
       public         
   botirovs03    false    213            �           2606    528269 #   Recruitors Recruitors_loginId_key69 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key69" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key69";
       public         
   botirovs03    false    213            �           2606    528401 "   Recruitors Recruitors_loginId_key7 
   CONSTRAINT     f   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key7" UNIQUE ("loginId");
 P   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key7";
       public         
   botirovs03    false    213            �           2606    528271 #   Recruitors Recruitors_loginId_key70 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key70" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key70";
       public         
   botirovs03    false    213            �           2606    528273 #   Recruitors Recruitors_loginId_key71 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key71" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key71";
       public         
   botirovs03    false    213            �           2606    528275 #   Recruitors Recruitors_loginId_key72 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key72" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key72";
       public         
   botirovs03    false    213            �           2606    528277 #   Recruitors Recruitors_loginId_key73 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key73" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key73";
       public         
   botirovs03    false    213            �           2606    528279 #   Recruitors Recruitors_loginId_key74 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key74" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key74";
       public         
   botirovs03    false    213            �           2606    528325 #   Recruitors Recruitors_loginId_key75 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key75" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key75";
       public         
   botirovs03    false    213            �           2606    528281 #   Recruitors Recruitors_loginId_key76 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key76" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key76";
       public         
   botirovs03    false    213            �           2606    528283 #   Recruitors Recruitors_loginId_key77 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key77" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key77";
       public         
   botirovs03    false    213            �           2606    528285 #   Recruitors Recruitors_loginId_key78 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key78" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key78";
       public         
   botirovs03    false    213            �           2606    528287 #   Recruitors Recruitors_loginId_key79 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key79" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key79";
       public         
   botirovs03    false    213            �           2606    528415 "   Recruitors Recruitors_loginId_key8 
   CONSTRAINT     f   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key8" UNIQUE ("loginId");
 P   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key8";
       public         
   botirovs03    false    213            �           2606    528289 #   Recruitors Recruitors_loginId_key80 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key80" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key80";
       public         
   botirovs03    false    213            �           2606    528323 #   Recruitors Recruitors_loginId_key81 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key81" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key81";
       public         
   botirovs03    false    213            �           2606    528291 #   Recruitors Recruitors_loginId_key82 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key82" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key82";
       public         
   botirovs03    false    213            �           2606    528321 #   Recruitors Recruitors_loginId_key83 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key83" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key83";
       public         
   botirovs03    false    213            �           2606    528293 #   Recruitors Recruitors_loginId_key84 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key84" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key84";
       public         
   botirovs03    false    213            �           2606    528319 #   Recruitors Recruitors_loginId_key85 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key85" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key85";
       public         
   botirovs03    false    213            �           2606    528295 #   Recruitors Recruitors_loginId_key86 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key86" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key86";
       public         
   botirovs03    false    213            �           2606    528297 #   Recruitors Recruitors_loginId_key87 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key87" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key87";
       public         
   botirovs03    false    213            �           2606    528317 #   Recruitors Recruitors_loginId_key88 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key88" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key88";
       public         
   botirovs03    false    213            �           2606    528299 #   Recruitors Recruitors_loginId_key89 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key89" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key89";
       public         
   botirovs03    false    213            �           2606    528403 "   Recruitors Recruitors_loginId_key9 
   CONSTRAINT     f   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key9" UNIQUE ("loginId");
 P   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key9";
       public         
   botirovs03    false    213            �           2606    528315 #   Recruitors Recruitors_loginId_key90 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key90" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key90";
       public         
   botirovs03    false    213            �           2606    528301 #   Recruitors Recruitors_loginId_key91 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key91" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key91";
       public         
   botirovs03    false    213            �           2606    528303 #   Recruitors Recruitors_loginId_key92 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key92" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key92";
       public         
   botirovs03    false    213            �           2606    528305 #   Recruitors Recruitors_loginId_key93 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key93" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key93";
       public         
   botirovs03    false    213            �           2606    528313 #   Recruitors Recruitors_loginId_key94 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key94" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key94";
       public         
   botirovs03    false    213            �           2606    528307 #   Recruitors Recruitors_loginId_key95 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key95" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key95";
       public         
   botirovs03    false    213            �           2606    528311 #   Recruitors Recruitors_loginId_key96 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key96" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key96";
       public         
   botirovs03    false    213            �           2606    528309 #   Recruitors Recruitors_loginId_key97 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key97" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key97";
       public         
   botirovs03    false    213            �           2606    528419 #   Recruitors Recruitors_loginId_key98 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key98" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key98";
       public         
   botirovs03    false    213            �           2606    528421 #   Recruitors Recruitors_loginId_key99 
   CONSTRAINT     g   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_loginId_key99" UNIQUE ("loginId");
 Q   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_loginId_key99";
       public         
   botirovs03    false    213            �           2606    294648    Recruitors Recruitors_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Recruitors"
    ADD CONSTRAINT "Recruitors_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Recruitors" DROP CONSTRAINT "Recruitors_pkey";
       public         
   botirovs03    false    213            �           2606    294655 &   SelectedStudents SelectedStudents_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."SelectedStudents"
    ADD CONSTRAINT "SelectedStudents_pkey" PRIMARY KEY ("StudentId", "RecruitorId");
 T   ALTER TABLE ONLY public."SelectedStudents" DROP CONSTRAINT "SelectedStudents_pkey";
       public         
   botirovs03    false    214    214            �           2606    527936    Students Students_loginId_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key" UNIQUE ("loginId");
 K   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key";
       public         
   botirovs03    false    210            �           2606    527938    Students Students_loginId_key1 
   CONSTRAINT     b   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key1" UNIQUE ("loginId");
 L   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key1";
       public         
   botirovs03    false    210            �           2606    527954    Students Students_loginId_key10 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key10" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key10";
       public         
   botirovs03    false    210                        2606    528082     Students Students_loginId_key100 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key100" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key100";
       public         
   botirovs03    false    210                       2606    527878     Students Students_loginId_key101 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key101" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key101";
       public         
   botirovs03    false    210                       2606    528084     Students Students_loginId_key102 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key102" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key102";
       public         
   botirovs03    false    210                       2606    528086     Students Students_loginId_key103 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key103" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key103";
       public         
   botirovs03    false    210                       2606    528088     Students Students_loginId_key104 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key104" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key104";
       public         
   botirovs03    false    210            
           2606    528090     Students Students_loginId_key105 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key105" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key105";
       public         
   botirovs03    false    210                       2606    528092     Students Students_loginId_key106 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key106" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key106";
       public         
   botirovs03    false    210                       2606    527876     Students Students_loginId_key107 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key107" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key107";
       public         
   botirovs03    false    210                       2606    528094     Students Students_loginId_key108 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key108" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key108";
       public         
   botirovs03    false    210                       2606    528096     Students Students_loginId_key109 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key109" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key109";
       public         
   botirovs03    false    210                       2606    527956    Students Students_loginId_key11 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key11" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key11";
       public         
   botirovs03    false    210                       2606    528098     Students Students_loginId_key110 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key110" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key110";
       public         
   botirovs03    false    210                       2606    528100     Students Students_loginId_key111 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key111" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key111";
       public         
   botirovs03    false    210                       2606    528102     Students Students_loginId_key112 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key112" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key112";
       public         
   botirovs03    false    210                       2606    528104     Students Students_loginId_key113 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key113" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key113";
       public         
   botirovs03    false    210                       2606    527874     Students Students_loginId_key114 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key114" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key114";
       public         
   botirovs03    false    210                        2606    528106     Students Students_loginId_key115 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key115" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key115";
       public         
   botirovs03    false    210            "           2606    527872     Students Students_loginId_key116 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key116" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key116";
       public         
   botirovs03    false    210            $           2606    528108     Students Students_loginId_key117 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key117" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key117";
       public         
   botirovs03    false    210            &           2606    527870     Students Students_loginId_key118 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key118" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key118";
       public         
   botirovs03    false    210            (           2606    528110     Students Students_loginId_key119 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key119" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key119";
       public         
   botirovs03    false    210            *           2606    527932    Students Students_loginId_key12 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key12" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key12";
       public         
   botirovs03    false    210            ,           2606    528112     Students Students_loginId_key120 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key120" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key120";
       public         
   botirovs03    false    210            .           2606    527868     Students Students_loginId_key121 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key121" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key121";
       public         
   botirovs03    false    210            0           2606    528114     Students Students_loginId_key122 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key122" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key122";
       public         
   botirovs03    false    210            2           2606    528116     Students Students_loginId_key123 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key123" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key123";
       public         
   botirovs03    false    210            4           2606    527866     Students Students_loginId_key124 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key124" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key124";
       public         
   botirovs03    false    210            6           2606    528118     Students Students_loginId_key125 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key125" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key125";
       public         
   botirovs03    false    210            8           2606    528120     Students Students_loginId_key126 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key126" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key126";
       public         
   botirovs03    false    210            :           2606    527864     Students Students_loginId_key127 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key127" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key127";
       public         
   botirovs03    false    210            <           2606    528122     Students Students_loginId_key128 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key128" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key128";
       public         
   botirovs03    false    210            >           2606    528124     Students Students_loginId_key129 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key129" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key129";
       public         
   botirovs03    false    210            @           2606    527958    Students Students_loginId_key13 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key13" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key13";
       public         
   botirovs03    false    210            B           2606    528126     Students Students_loginId_key130 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key130" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key130";
       public         
   botirovs03    false    210            D           2606    527862     Students Students_loginId_key131 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key131" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key131";
       public         
   botirovs03    false    210            F           2606    528128     Students Students_loginId_key132 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key132" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key132";
       public         
   botirovs03    false    210            H           2606    528130     Students Students_loginId_key133 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key133" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key133";
       public         
   botirovs03    false    210            J           2606    528132     Students Students_loginId_key134 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key134" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key134";
       public         
   botirovs03    false    210            L           2606    528134     Students Students_loginId_key135 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key135" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key135";
       public         
   botirovs03    false    210            N           2606    527860     Students Students_loginId_key136 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key136" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key136";
       public         
   botirovs03    false    210            P           2606    528136     Students Students_loginId_key137 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key137" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key137";
       public         
   botirovs03    false    210            R           2606    528138     Students Students_loginId_key138 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key138" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key138";
       public         
   botirovs03    false    210            T           2606    528140     Students Students_loginId_key139 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key139" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key139";
       public         
   botirovs03    false    210            V           2606    527930    Students Students_loginId_key14 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key14" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key14";
       public         
   botirovs03    false    210            X           2606    528142     Students Students_loginId_key140 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key140" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key140";
       public         
   botirovs03    false    210            Z           2606    528144     Students Students_loginId_key141 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key141" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key141";
       public         
   botirovs03    false    210            \           2606    528146     Students Students_loginId_key142 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key142" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key142";
       public         
   botirovs03    false    210            ^           2606    527858     Students Students_loginId_key143 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key143" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key143";
       public         
   botirovs03    false    210            `           2606    528148     Students Students_loginId_key144 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key144" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key144";
       public         
   botirovs03    false    210            b           2606    528150     Students Students_loginId_key145 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key145" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key145";
       public         
   botirovs03    false    210            d           2606    528152     Students Students_loginId_key146 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key146" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key146";
       public         
   botirovs03    false    210            f           2606    527856     Students Students_loginId_key147 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key147" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key147";
       public         
   botirovs03    false    210            h           2606    527970     Students Students_loginId_key148 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key148" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key148";
       public         
   botirovs03    false    210            j           2606    528154     Students Students_loginId_key149 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key149" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key149";
       public         
   botirovs03    false    210            l           2606    527928    Students Students_loginId_key15 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key15" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key15";
       public         
   botirovs03    false    210            n           2606    528156     Students Students_loginId_key150 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key150" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key150";
       public         
   botirovs03    false    210            p           2606    527854     Students Students_loginId_key151 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key151" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key151";
       public         
   botirovs03    false    210            r           2606    528158     Students Students_loginId_key152 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key152" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key152";
       public         
   botirovs03    false    210            t           2606    527852     Students Students_loginId_key153 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key153" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key153";
       public         
   botirovs03    false    210            v           2606    528160     Students Students_loginId_key154 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key154" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key154";
       public         
   botirovs03    false    210            x           2606    528162     Students Students_loginId_key155 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key155" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key155";
       public         
   botirovs03    false    210            z           2606    528164     Students Students_loginId_key156 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key156" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key156";
       public         
   botirovs03    false    210            |           2606    528166     Students Students_loginId_key157 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key157" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key157";
       public         
   botirovs03    false    210            ~           2606    527850     Students Students_loginId_key158 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key158" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key158";
       public         
   botirovs03    false    210            �           2606    528168     Students Students_loginId_key159 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key159" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key159";
       public         
   botirovs03    false    210            �           2606    527960    Students Students_loginId_key16 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key16" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key16";
       public         
   botirovs03    false    210            �           2606    528170     Students Students_loginId_key160 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key160" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key160";
       public         
   botirovs03    false    210            �           2606    528172     Students Students_loginId_key161 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key161" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key161";
       public         
   botirovs03    false    210            �           2606    528174     Students Students_loginId_key162 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key162" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key162";
       public         
   botirovs03    false    210            �           2606    527848     Students Students_loginId_key163 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key163" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key163";
       public         
   botirovs03    false    210            �           2606    528176     Students Students_loginId_key164 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key164" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key164";
       public         
   botirovs03    false    210            �           2606    527846     Students Students_loginId_key165 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key165" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key165";
       public         
   botirovs03    false    210            �           2606    528178     Students Students_loginId_key166 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key166" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key166";
       public         
   botirovs03    false    210            �           2606    528180     Students Students_loginId_key167 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key167" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key167";
       public         
   botirovs03    false    210            �           2606    528182     Students Students_loginId_key168 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key168" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key168";
       public         
   botirovs03    false    210            �           2606    528184     Students Students_loginId_key169 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key169" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key169";
       public         
   botirovs03    false    210            �           2606    527962    Students Students_loginId_key17 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key17" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key17";
       public         
   botirovs03    false    210            �           2606    527844     Students Students_loginId_key170 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key170" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key170";
       public         
   botirovs03    false    210            �           2606    528186     Students Students_loginId_key171 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key171" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key171";
       public         
   botirovs03    false    210            �           2606    528188     Students Students_loginId_key172 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key172" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key172";
       public         
   botirovs03    false    210            �           2606    528190     Students Students_loginId_key173 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key173" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key173";
       public         
   botirovs03    false    210            �           2606    528192     Students Students_loginId_key174 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key174" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key174";
       public         
   botirovs03    false    210            �           2606    528194     Students Students_loginId_key175 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key175" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key175";
       public         
   botirovs03    false    210            �           2606    527842     Students Students_loginId_key176 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key176" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key176";
       public         
   botirovs03    false    210            �           2606    528196     Students Students_loginId_key177 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key177" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key177";
       public         
   botirovs03    false    210            �           2606    527840     Students Students_loginId_key178 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key178" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key178";
       public         
   botirovs03    false    210            �           2606    528198     Students Students_loginId_key179 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key179" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key179";
       public         
   botirovs03    false    210            �           2606    527964    Students Students_loginId_key18 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key18" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key18";
       public         
   botirovs03    false    210            �           2606    528200     Students Students_loginId_key180 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key180" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key180";
       public         
   botirovs03    false    210            �           2606    528202     Students Students_loginId_key181 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key181" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key181";
       public         
   botirovs03    false    210            �           2606    527838     Students Students_loginId_key182 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key182" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key182";
       public         
   botirovs03    false    210            �           2606    528204     Students Students_loginId_key183 
   CONSTRAINT     d   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key183" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key183";
       public         
   botirovs03    false    210            �           2606    527926    Students Students_loginId_key19 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key19" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key19";
       public         
   botirovs03    false    210            �           2606    527940    Students Students_loginId_key2 
   CONSTRAINT     b   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key2" UNIQUE ("loginId");
 L   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key2";
       public         
   botirovs03    false    210            �           2606    527924    Students Students_loginId_key20 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key20" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key20";
       public         
   botirovs03    false    210            �           2606    527966    Students Students_loginId_key21 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key21" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key21";
       public         
   botirovs03    false    210            �           2606    527968    Students Students_loginId_key22 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key22" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key22";
       public         
   botirovs03    false    210            �           2606    527972    Students Students_loginId_key23 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key23" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key23";
       public         
   botirovs03    false    210            �           2606    527922    Students Students_loginId_key24 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key24" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key24";
       public         
   botirovs03    false    210            �           2606    527974    Students Students_loginId_key25 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key25" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key25";
       public         
   botirovs03    false    210            �           2606    527976    Students Students_loginId_key26 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key26" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key26";
       public         
   botirovs03    false    210            �           2606    527920    Students Students_loginId_key27 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key27" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key27";
       public         
   botirovs03    false    210            �           2606    527918    Students Students_loginId_key28 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key28" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key28";
       public         
   botirovs03    false    210            �           2606    527978    Students Students_loginId_key29 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key29" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key29";
       public         
   botirovs03    false    210            �           2606    527942    Students Students_loginId_key3 
   CONSTRAINT     b   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key3" UNIQUE ("loginId");
 L   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key3";
       public         
   botirovs03    false    210            �           2606    527980    Students Students_loginId_key30 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key30" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key30";
       public         
   botirovs03    false    210            �           2606    527916    Students Students_loginId_key31 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key31" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key31";
       public         
   botirovs03    false    210            �           2606    527982    Students Students_loginId_key32 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key32" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key32";
       public         
   botirovs03    false    210            �           2606    527984    Students Students_loginId_key33 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key33" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key33";
       public         
   botirovs03    false    210            �           2606    527914    Students Students_loginId_key34 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key34" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key34";
       public         
   botirovs03    false    210            �           2606    527986    Students Students_loginId_key35 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key35" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key35";
       public         
   botirovs03    false    210            �           2606    527988    Students Students_loginId_key36 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key36" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key36";
       public         
   botirovs03    false    210            �           2606    527912    Students Students_loginId_key37 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key37" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key37";
       public         
   botirovs03    false    210            �           2606    527990    Students Students_loginId_key38 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key38" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key38";
       public         
   botirovs03    false    210            �           2606    527992    Students Students_loginId_key39 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key39" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key39";
       public         
   botirovs03    false    210            �           2606    527944    Students Students_loginId_key4 
   CONSTRAINT     b   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key4" UNIQUE ("loginId");
 L   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key4";
       public         
   botirovs03    false    210            �           2606    527910    Students Students_loginId_key40 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key40" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key40";
       public         
   botirovs03    false    210            �           2606    527994    Students Students_loginId_key41 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key41" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key41";
       public         
   botirovs03    false    210            �           2606    527996    Students Students_loginId_key42 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key42" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key42";
       public         
   botirovs03    false    210            �           2606    527908    Students Students_loginId_key43 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key43" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key43";
       public         
   botirovs03    false    210            �           2606    527998    Students Students_loginId_key44 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key44" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key44";
       public         
   botirovs03    false    210            �           2606    528000    Students Students_loginId_key45 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key45" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key45";
       public         
   botirovs03    false    210            �           2606    528002    Students Students_loginId_key46 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key46" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key46";
       public         
   botirovs03    false    210            �           2606    528004    Students Students_loginId_key47 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key47" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key47";
       public         
   botirovs03    false    210            �           2606    527906    Students Students_loginId_key48 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key48" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key48";
       public         
   botirovs03    false    210            �           2606    528006    Students Students_loginId_key49 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key49" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key49";
       public         
   botirovs03    false    210            �           2606    527946    Students Students_loginId_key5 
   CONSTRAINT     b   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key5" UNIQUE ("loginId");
 L   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key5";
       public         
   botirovs03    false    210            �           2606    528008    Students Students_loginId_key50 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key50" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key50";
       public         
   botirovs03    false    210                        2606    528010    Students Students_loginId_key51 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key51" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key51";
       public         
   botirovs03    false    210                       2606    527904    Students Students_loginId_key52 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key52" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key52";
       public         
   botirovs03    false    210                       2606    528012    Students Students_loginId_key53 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key53" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key53";
       public         
   botirovs03    false    210                       2606    528014    Students Students_loginId_key54 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key54" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key54";
       public         
   botirovs03    false    210                       2606    528016    Students Students_loginId_key55 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key55" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key55";
       public         
   botirovs03    false    210            
           2606    528018    Students Students_loginId_key56 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key56" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key56";
       public         
   botirovs03    false    210                       2606    528020    Students Students_loginId_key57 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key57" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key57";
       public         
   botirovs03    false    210                       2606    527902    Students Students_loginId_key58 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key58" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key58";
       public         
   botirovs03    false    210                       2606    528022    Students Students_loginId_key59 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key59" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key59";
       public         
   botirovs03    false    210                       2606    527948    Students Students_loginId_key6 
   CONSTRAINT     b   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key6" UNIQUE ("loginId");
 L   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key6";
       public         
   botirovs03    false    210                       2606    528024    Students Students_loginId_key60 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key60" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key60";
       public         
   botirovs03    false    210                       2606    527900    Students Students_loginId_key61 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key61" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key61";
       public         
   botirovs03    false    210                       2606    528026    Students Students_loginId_key62 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key62" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key62";
       public         
   botirovs03    false    210                       2606    528028    Students Students_loginId_key63 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key63" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key63";
       public         
   botirovs03    false    210                       2606    528030    Students Students_loginId_key64 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key64" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key64";
       public         
   botirovs03    false    210                       2606    528032    Students Students_loginId_key65 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key65" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key65";
       public         
   botirovs03    false    210                        2606    527898    Students Students_loginId_key66 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key66" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key66";
       public         
   botirovs03    false    210            "           2606    528034    Students Students_loginId_key67 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key67" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key67";
       public         
   botirovs03    false    210            $           2606    528036    Students Students_loginId_key68 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key68" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key68";
       public         
   botirovs03    false    210            &           2606    527896    Students Students_loginId_key69 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key69" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key69";
       public         
   botirovs03    false    210            (           2606    527950    Students Students_loginId_key7 
   CONSTRAINT     b   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key7" UNIQUE ("loginId");
 L   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key7";
       public         
   botirovs03    false    210            *           2606    528038    Students Students_loginId_key70 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key70" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key70";
       public         
   botirovs03    false    210            ,           2606    528040    Students Students_loginId_key71 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key71" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key71";
       public         
   botirovs03    false    210            .           2606    527894    Students Students_loginId_key72 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key72" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key72";
       public         
   botirovs03    false    210            0           2606    528042    Students Students_loginId_key73 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key73" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key73";
       public         
   botirovs03    false    210            2           2606    528044    Students Students_loginId_key74 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key74" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key74";
       public         
   botirovs03    false    210            4           2606    528046    Students Students_loginId_key75 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key75" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key75";
       public         
   botirovs03    false    210            6           2606    528048    Students Students_loginId_key76 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key76" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key76";
       public         
   botirovs03    false    210            8           2606    528050    Students Students_loginId_key77 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key77" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key77";
       public         
   botirovs03    false    210            :           2606    528052    Students Students_loginId_key78 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key78" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key78";
       public         
   botirovs03    false    210            <           2606    528054    Students Students_loginId_key79 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key79" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key79";
       public         
   botirovs03    false    210            >           2606    527934    Students Students_loginId_key8 
   CONSTRAINT     b   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key8" UNIQUE ("loginId");
 L   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key8";
       public         
   botirovs03    false    210            @           2606    527892    Students Students_loginId_key80 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key80" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key80";
       public         
   botirovs03    false    210            B           2606    528056    Students Students_loginId_key81 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key81" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key81";
       public         
   botirovs03    false    210            D           2606    528058    Students Students_loginId_key82 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key82" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key82";
       public         
   botirovs03    false    210            F           2606    528060    Students Students_loginId_key83 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key83" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key83";
       public         
   botirovs03    false    210            H           2606    528062    Students Students_loginId_key84 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key84" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key84";
       public         
   botirovs03    false    210            J           2606    528064    Students Students_loginId_key85 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key85" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key85";
       public         
   botirovs03    false    210            L           2606    527890    Students Students_loginId_key86 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key86" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key86";
       public         
   botirovs03    false    210            N           2606    528066    Students Students_loginId_key87 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key87" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key87";
       public         
   botirovs03    false    210            P           2606    527888    Students Students_loginId_key88 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key88" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key88";
       public         
   botirovs03    false    210            R           2606    528068    Students Students_loginId_key89 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key89" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key89";
       public         
   botirovs03    false    210            T           2606    527952    Students Students_loginId_key9 
   CONSTRAINT     b   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key9" UNIQUE ("loginId");
 L   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key9";
       public         
   botirovs03    false    210            V           2606    527886    Students Students_loginId_key90 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key90" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key90";
       public         
   botirovs03    false    210            X           2606    528070    Students Students_loginId_key91 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key91" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key91";
       public         
   botirovs03    false    210            Z           2606    528072    Students Students_loginId_key92 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key92" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key92";
       public         
   botirovs03    false    210            \           2606    527884    Students Students_loginId_key93 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key93" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key93";
       public         
   botirovs03    false    210            ^           2606    528074    Students Students_loginId_key94 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key94" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key94";
       public         
   botirovs03    false    210            `           2606    527882    Students Students_loginId_key95 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key95" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key95";
       public         
   botirovs03    false    210            b           2606    528076    Students Students_loginId_key96 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key96" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key96";
       public         
   botirovs03    false    210            d           2606    528078    Students Students_loginId_key97 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key97" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key97";
       public         
   botirovs03    false    210            f           2606    528080    Students Students_loginId_key98 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key98" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key98";
       public         
   botirovs03    false    210            h           2606    527880    Students Students_loginId_key99 
   CONSTRAINT     c   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_loginId_key99" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_loginId_key99";
       public         
   botirovs03    false    210            j           2606    294465    Students Students_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_pkey";
       public         
   botirovs03    false    210            >           2606    529121    Teachers Teachers_loginId_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key" UNIQUE ("loginId");
 K   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key";
       public         
   botirovs03    false    216            @           2606    529123    Teachers Teachers_loginId_key1 
   CONSTRAINT     b   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key1" UNIQUE ("loginId");
 L   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key1";
       public         
   botirovs03    false    216            B           2606    529139    Teachers Teachers_loginId_key10 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key10" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key10";
       public         
   botirovs03    false    216            D           2606    529191     Teachers Teachers_loginId_key100 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key100" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key100";
       public         
   botirovs03    false    216            F           2606    528967     Teachers Teachers_loginId_key101 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key101" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key101";
       public         
   botirovs03    false    216            H           2606    529249     Teachers Teachers_loginId_key102 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key102" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key102";
       public         
   botirovs03    false    216            J           2606    529251     Teachers Teachers_loginId_key103 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key103" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key103";
       public         
   botirovs03    false    216            L           2606    529253     Teachers Teachers_loginId_key104 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key104" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key104";
       public         
   botirovs03    false    216            N           2606    529255     Teachers Teachers_loginId_key105 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key105" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key105";
       public         
   botirovs03    false    216            P           2606    528965     Teachers Teachers_loginId_key106 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key106" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key106";
       public         
   botirovs03    false    216            R           2606    529257     Teachers Teachers_loginId_key107 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key107" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key107";
       public         
   botirovs03    false    216            T           2606    528963     Teachers Teachers_loginId_key108 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key108" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key108";
       public         
   botirovs03    false    216            V           2606    529259     Teachers Teachers_loginId_key109 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key109" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key109";
       public         
   botirovs03    false    216            X           2606    529141    Teachers Teachers_loginId_key11 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key11" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key11";
       public         
   botirovs03    false    216            Z           2606    528961     Teachers Teachers_loginId_key110 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key110" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key110";
       public         
   botirovs03    false    216            \           2606    529261     Teachers Teachers_loginId_key111 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key111" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key111";
       public         
   botirovs03    false    216            ^           2606    528959     Teachers Teachers_loginId_key112 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key112" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key112";
       public         
   botirovs03    false    216            `           2606    529263     Teachers Teachers_loginId_key113 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key113" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key113";
       public         
   botirovs03    false    216            b           2606    529265     Teachers Teachers_loginId_key114 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key114" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key114";
       public         
   botirovs03    false    216            d           2606    529293     Teachers Teachers_loginId_key115 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key115" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key115";
       public         
   botirovs03    false    216            f           2606    529267     Teachers Teachers_loginId_key116 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key116" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key116";
       public         
   botirovs03    false    216            h           2606    529269     Teachers Teachers_loginId_key117 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key117" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key117";
       public         
   botirovs03    false    216            j           2606    529291     Teachers Teachers_loginId_key118 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key118" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key118";
       public         
   botirovs03    false    216            l           2606    529271     Teachers Teachers_loginId_key119 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key119" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key119";
       public         
   botirovs03    false    216            n           2606    529165    Teachers Teachers_loginId_key12 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key12" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key12";
       public         
   botirovs03    false    216            p           2606    529273     Teachers Teachers_loginId_key120 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key120" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key120";
       public         
   botirovs03    false    216            r           2606    529289     Teachers Teachers_loginId_key121 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key121" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key121";
       public         
   botirovs03    false    216            t           2606    529275     Teachers Teachers_loginId_key122 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key122" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key122";
       public         
   botirovs03    false    216            v           2606    529277     Teachers Teachers_loginId_key123 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key123" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key123";
       public         
   botirovs03    false    216            x           2606    529279     Teachers Teachers_loginId_key124 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key124" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key124";
       public         
   botirovs03    false    216            z           2606    529287     Teachers Teachers_loginId_key125 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key125" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key125";
       public         
   botirovs03    false    216            |           2606    529281     Teachers Teachers_loginId_key126 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key126" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key126";
       public         
   botirovs03    false    216            ~           2606    529283     Teachers Teachers_loginId_key127 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key127" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key127";
       public         
   botirovs03    false    216            �           2606    529285     Teachers Teachers_loginId_key128 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key128" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key128";
       public         
   botirovs03    false    216            �           2606    529195     Teachers Teachers_loginId_key129 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key129" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key129";
       public         
   botirovs03    false    216            �           2606    529143    Teachers Teachers_loginId_key13 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key13" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key13";
       public         
   botirovs03    false    216            �           2606    529247     Teachers Teachers_loginId_key130 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key130" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key130";
       public         
   botirovs03    false    216            �           2606    529197     Teachers Teachers_loginId_key131 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key131" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key131";
       public         
   botirovs03    false    216            �           2606    529199     Teachers Teachers_loginId_key132 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key132" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key132";
       public         
   botirovs03    false    216            �           2606    529201     Teachers Teachers_loginId_key133 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key133" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key133";
       public         
   botirovs03    false    216            �           2606    529245     Teachers Teachers_loginId_key134 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key134" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key134";
       public         
   botirovs03    false    216            �           2606    529203     Teachers Teachers_loginId_key135 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key135" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key135";
       public         
   botirovs03    false    216            �           2606    529205     Teachers Teachers_loginId_key136 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key136" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key136";
       public         
   botirovs03    false    216            �           2606    529243     Teachers Teachers_loginId_key137 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key137" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key137";
       public         
   botirovs03    false    216            �           2606    529207     Teachers Teachers_loginId_key138 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key138" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key138";
       public         
   botirovs03    false    216            �           2606    529209     Teachers Teachers_loginId_key139 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key139" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key139";
       public         
   botirovs03    false    216            �           2606    529145    Teachers Teachers_loginId_key14 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key14" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key14";
       public         
   botirovs03    false    216            �           2606    529241     Teachers Teachers_loginId_key140 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key140" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key140";
       public         
   botirovs03    false    216            �           2606    529211     Teachers Teachers_loginId_key141 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key141" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key141";
       public         
   botirovs03    false    216            �           2606    529213     Teachers Teachers_loginId_key142 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key142" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key142";
       public         
   botirovs03    false    216            �           2606    529215     Teachers Teachers_loginId_key143 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key143" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key143";
       public         
   botirovs03    false    216            �           2606    529239     Teachers Teachers_loginId_key144 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key144" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key144";
       public         
   botirovs03    false    216            �           2606    529217     Teachers Teachers_loginId_key145 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key145" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key145";
       public         
   botirovs03    false    216            �           2606    529237     Teachers Teachers_loginId_key146 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key146" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key146";
       public         
   botirovs03    false    216            �           2606    529235     Teachers Teachers_loginId_key147 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key147" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key147";
       public         
   botirovs03    false    216            �           2606    529219     Teachers Teachers_loginId_key148 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key148" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key148";
       public         
   botirovs03    false    216            �           2606    529221     Teachers Teachers_loginId_key149 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key149" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key149";
       public         
   botirovs03    false    216            �           2606    529163    Teachers Teachers_loginId_key15 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key15" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key15";
       public         
   botirovs03    false    216            �           2606    529223     Teachers Teachers_loginId_key150 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key150" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key150";
       public         
   botirovs03    false    216            �           2606    529233     Teachers Teachers_loginId_key151 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key151" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key151";
       public         
   botirovs03    false    216            �           2606    529225     Teachers Teachers_loginId_key152 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key152" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key152";
       public         
   botirovs03    false    216            �           2606    529227     Teachers Teachers_loginId_key153 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key153" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key153";
       public         
   botirovs03    false    216            �           2606    529229     Teachers Teachers_loginId_key154 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key154" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key154";
       public         
   botirovs03    false    216            �           2606    529231     Teachers Teachers_loginId_key155 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key155" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key155";
       public         
   botirovs03    false    216            �           2606    529193     Teachers Teachers_loginId_key156 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key156" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key156";
       public         
   botirovs03    false    216            �           2606    529089     Teachers Teachers_loginId_key157 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key157" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key157";
       public         
   botirovs03    false    216            �           2606    529109     Teachers Teachers_loginId_key158 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key158" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key158";
       public         
   botirovs03    false    216            �           2606    529091     Teachers Teachers_loginId_key159 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key159" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key159";
       public         
   botirovs03    false    216            �           2606    529147    Teachers Teachers_loginId_key16 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key16" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key16";
       public         
   botirovs03    false    216            �           2606    529093     Teachers Teachers_loginId_key160 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key160" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key160";
       public         
   botirovs03    false    216            �           2606    529095     Teachers Teachers_loginId_key161 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key161" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key161";
       public         
   botirovs03    false    216            �           2606    529097     Teachers Teachers_loginId_key162 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key162" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key162";
       public         
   botirovs03    false    216            �           2606    529107     Teachers Teachers_loginId_key163 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key163" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key163";
       public         
   botirovs03    false    216            �           2606    529099     Teachers Teachers_loginId_key164 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key164" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key164";
       public         
   botirovs03    false    216            �           2606    529101     Teachers Teachers_loginId_key165 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key165" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key165";
       public         
   botirovs03    false    216            �           2606    529103     Teachers Teachers_loginId_key166 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key166" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key166";
       public         
   botirovs03    false    216            �           2606    529105     Teachers Teachers_loginId_key167 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key167" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key167";
       public         
   botirovs03    false    216            �           2606    529295     Teachers Teachers_loginId_key168 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key168" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key168";
       public         
   botirovs03    false    216            �           2606    528957     Teachers Teachers_loginId_key169 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key169" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key169";
       public         
   botirovs03    false    216            �           2606    529149    Teachers Teachers_loginId_key17 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key17" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key17";
       public         
   botirovs03    false    216            �           2606    529297     Teachers Teachers_loginId_key170 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key170" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key170";
       public         
   botirovs03    false    216            �           2606    528955     Teachers Teachers_loginId_key171 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key171" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key171";
       public         
   botirovs03    false    216            �           2606    529299     Teachers Teachers_loginId_key172 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key172" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key172";
       public         
   botirovs03    false    216            �           2606    529301     Teachers Teachers_loginId_key173 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key173" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key173";
       public         
   botirovs03    false    216            �           2606    529303     Teachers Teachers_loginId_key174 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key174" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key174";
       public         
   botirovs03    false    216            �           2606    528953     Teachers Teachers_loginId_key175 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key175" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key175";
       public         
   botirovs03    false    216            �           2606    529305     Teachers Teachers_loginId_key176 
   CONSTRAINT     d   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key176" UNIQUE ("loginId");
 N   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key176";
       public         
   botirovs03    false    216            �           2606    529161    Teachers Teachers_loginId_key18 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key18" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key18";
       public         
   botirovs03    false    216            �           2606    529151    Teachers Teachers_loginId_key19 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key19" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key19";
       public         
   botirovs03    false    216            �           2606    529125    Teachers Teachers_loginId_key2 
   CONSTRAINT     b   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key2" UNIQUE ("loginId");
 L   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key2";
       public         
   botirovs03    false    216            �           2606    529033    Teachers Teachers_loginId_key20 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key20" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key20";
       public         
   botirovs03    false    216            �           2606    529153    Teachers Teachers_loginId_key21 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key21" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key21";
       public         
   botirovs03    false    216            �           2606    529155    Teachers Teachers_loginId_key22 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key22" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key22";
       public         
   botirovs03    false    216            �           2606    529031    Teachers Teachers_loginId_key23 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key23" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key23";
       public         
   botirovs03    false    216            �           2606    529029    Teachers Teachers_loginId_key24 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key24" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key24";
       public         
   botirovs03    false    216            �           2606    528997    Teachers Teachers_loginId_key25 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key25" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key25";
       public         
   botirovs03    false    216            �           2606    529027    Teachers Teachers_loginId_key26 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key26" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key26";
       public         
   botirovs03    false    216                        2606    528999    Teachers Teachers_loginId_key27 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key27" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key27";
       public         
   botirovs03    false    216                       2606    529025    Teachers Teachers_loginId_key28 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key28" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key28";
       public         
   botirovs03    false    216                       2606    529001    Teachers Teachers_loginId_key29 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key29" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key29";
       public         
   botirovs03    false    216                       2606    529127    Teachers Teachers_loginId_key3 
   CONSTRAINT     b   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key3" UNIQUE ("loginId");
 L   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key3";
       public         
   botirovs03    false    216                       2606    529003    Teachers Teachers_loginId_key30 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key30" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key30";
       public         
   botirovs03    false    216            
           2606    529023    Teachers Teachers_loginId_key31 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key31" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key31";
       public         
   botirovs03    false    216                       2606    529005    Teachers Teachers_loginId_key32 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key32" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key32";
       public         
   botirovs03    false    216                       2606    529007    Teachers Teachers_loginId_key33 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key33" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key33";
       public         
   botirovs03    false    216                       2606    529021    Teachers Teachers_loginId_key34 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key34" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key34";
       public         
   botirovs03    false    216                       2606    529009    Teachers Teachers_loginId_key35 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key35" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key35";
       public         
   botirovs03    false    216                       2606    529013    Teachers Teachers_loginId_key36 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key36" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key36";
       public         
   botirovs03    false    216                       2606    529019    Teachers Teachers_loginId_key37 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key37" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key37";
       public         
   botirovs03    false    216                       2606    529015    Teachers Teachers_loginId_key38 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key38" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key38";
       public         
   botirovs03    false    216                       2606    529017    Teachers Teachers_loginId_key39 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key39" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key39";
       public         
   botirovs03    false    216                       2606    529129    Teachers Teachers_loginId_key4 
   CONSTRAINT     b   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key4" UNIQUE ("loginId");
 L   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key4";
       public         
   botirovs03    false    216                       2606    529157    Teachers Teachers_loginId_key40 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key40" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key40";
       public         
   botirovs03    false    216                        2606    528977    Teachers Teachers_loginId_key41 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key41" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key41";
       public         
   botirovs03    false    216            "           2606    528979    Teachers Teachers_loginId_key42 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key42" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key42";
       public         
   botirovs03    false    216            $           2606    528995    Teachers Teachers_loginId_key43 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key43" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key43";
       public         
   botirovs03    false    216            &           2606    528981    Teachers Teachers_loginId_key44 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key44" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key44";
       public         
   botirovs03    false    216            (           2606    529083    Teachers Teachers_loginId_key45 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key45" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key45";
       public         
   botirovs03    false    216            *           2606    529085    Teachers Teachers_loginId_key46 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key46" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key46";
       public         
   botirovs03    false    216            ,           2606    529087    Teachers Teachers_loginId_key47 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key47" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key47";
       public         
   botirovs03    false    216            .           2606    529111    Teachers Teachers_loginId_key48 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key48" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key48";
       public         
   botirovs03    false    216            0           2606    528993    Teachers Teachers_loginId_key49 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key49" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key49";
       public         
   botirovs03    false    216            2           2606    529131    Teachers Teachers_loginId_key5 
   CONSTRAINT     b   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key5" UNIQUE ("loginId");
 L   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key5";
       public         
   botirovs03    false    216            4           2606    529113    Teachers Teachers_loginId_key50 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key50" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key50";
       public         
   botirovs03    false    216            6           2606    528983    Teachers Teachers_loginId_key51 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key51" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key51";
       public         
   botirovs03    false    216            8           2606    528985    Teachers Teachers_loginId_key52 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key52" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key52";
       public         
   botirovs03    false    216            :           2606    528987    Teachers Teachers_loginId_key53 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key53" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key53";
       public         
   botirovs03    false    216            <           2606    528989    Teachers Teachers_loginId_key54 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key54" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key54";
       public         
   botirovs03    false    216            >           2606    528991    Teachers Teachers_loginId_key55 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key55" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key55";
       public         
   botirovs03    false    216            @           2606    529035    Teachers Teachers_loginId_key56 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key56" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key56";
       public         
   botirovs03    false    216            B           2606    529037    Teachers Teachers_loginId_key57 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key57" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key57";
       public         
   botirovs03    false    216            D           2606    529159    Teachers Teachers_loginId_key58 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key58" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key58";
       public         
   botirovs03    false    216            F           2606    529039    Teachers Teachers_loginId_key59 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key59" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key59";
       public         
   botirovs03    false    216            H           2606    529133    Teachers Teachers_loginId_key6 
   CONSTRAINT     b   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key6" UNIQUE ("loginId");
 L   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key6";
       public         
   botirovs03    false    216            J           2606    529119    Teachers Teachers_loginId_key60 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key60" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key60";
       public         
   botirovs03    false    216            L           2606    529041    Teachers Teachers_loginId_key61 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key61" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key61";
       public         
   botirovs03    false    216            N           2606    529117    Teachers Teachers_loginId_key62 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key62" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key62";
       public         
   botirovs03    false    216            P           2606    529115    Teachers Teachers_loginId_key63 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key63" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key63";
       public         
   botirovs03    false    216            R           2606    529043    Teachers Teachers_loginId_key64 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key64" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key64";
       public         
   botirovs03    false    216            T           2606    529045    Teachers Teachers_loginId_key65 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key65" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key65";
       public         
   botirovs03    false    216            V           2606    529081    Teachers Teachers_loginId_key66 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key66" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key66";
       public         
   botirovs03    false    216            X           2606    529047    Teachers Teachers_loginId_key67 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key67" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key67";
       public         
   botirovs03    false    216            Z           2606    529049    Teachers Teachers_loginId_key68 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key68" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key68";
       public         
   botirovs03    false    216            \           2606    529051    Teachers Teachers_loginId_key69 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key69" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key69";
       public         
   botirovs03    false    216            ^           2606    529135    Teachers Teachers_loginId_key7 
   CONSTRAINT     b   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key7" UNIQUE ("loginId");
 L   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key7";
       public         
   botirovs03    false    216            `           2606    529053    Teachers Teachers_loginId_key70 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key70" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key70";
       public         
   botirovs03    false    216            b           2606    529055    Teachers Teachers_loginId_key71 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key71" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key71";
       public         
   botirovs03    false    216            d           2606    529057    Teachers Teachers_loginId_key72 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key72" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key72";
       public         
   botirovs03    false    216            f           2606    529059    Teachers Teachers_loginId_key73 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key73" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key73";
       public         
   botirovs03    false    216            h           2606    529079    Teachers Teachers_loginId_key74 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key74" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key74";
       public         
   botirovs03    false    216            j           2606    529061    Teachers Teachers_loginId_key75 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key75" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key75";
       public         
   botirovs03    false    216            l           2606    529063    Teachers Teachers_loginId_key76 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key76" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key76";
       public         
   botirovs03    false    216            n           2606    529065    Teachers Teachers_loginId_key77 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key77" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key77";
       public         
   botirovs03    false    216            p           2606    529067    Teachers Teachers_loginId_key78 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key78" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key78";
       public         
   botirovs03    false    216            r           2606    529069    Teachers Teachers_loginId_key79 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key79" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key79";
       public         
   botirovs03    false    216            t           2606    529167    Teachers Teachers_loginId_key8 
   CONSTRAINT     b   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key8" UNIQUE ("loginId");
 L   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key8";
       public         
   botirovs03    false    216            v           2606    529077    Teachers Teachers_loginId_key80 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key80" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key80";
       public         
   botirovs03    false    216            x           2606    529071    Teachers Teachers_loginId_key81 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key81" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key81";
       public         
   botirovs03    false    216            z           2606    529075    Teachers Teachers_loginId_key82 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key82" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key82";
       public         
   botirovs03    false    216            |           2606    529073    Teachers Teachers_loginId_key83 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key83" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key83";
       public         
   botirovs03    false    216            ~           2606    529011    Teachers Teachers_loginId_key84 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key84" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key84";
       public         
   botirovs03    false    216            �           2606    529169    Teachers Teachers_loginId_key85 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key85" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key85";
       public         
   botirovs03    false    216            �           2606    529171    Teachers Teachers_loginId_key86 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key86" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key86";
       public         
   botirovs03    false    216            �           2606    528975    Teachers Teachers_loginId_key87 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key87" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key87";
       public         
   botirovs03    false    216            �           2606    529173    Teachers Teachers_loginId_key88 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key88" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key88";
       public         
   botirovs03    false    216            �           2606    528973    Teachers Teachers_loginId_key89 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key89" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key89";
       public         
   botirovs03    false    216            �           2606    529137    Teachers Teachers_loginId_key9 
   CONSTRAINT     b   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key9" UNIQUE ("loginId");
 L   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key9";
       public         
   botirovs03    false    216            �           2606    529175    Teachers Teachers_loginId_key90 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key90" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key90";
       public         
   botirovs03    false    216            �           2606    529177    Teachers Teachers_loginId_key91 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key91" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key91";
       public         
   botirovs03    false    216            �           2606    529179    Teachers Teachers_loginId_key92 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key92" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key92";
       public         
   botirovs03    false    216            �           2606    528971    Teachers Teachers_loginId_key93 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key93" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key93";
       public         
   botirovs03    false    216            �           2606    529181    Teachers Teachers_loginId_key94 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key94" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key94";
       public         
   botirovs03    false    216            �           2606    528969    Teachers Teachers_loginId_key95 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key95" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key95";
       public         
   botirovs03    false    216            �           2606    529183    Teachers Teachers_loginId_key96 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key96" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key96";
       public         
   botirovs03    false    216            �           2606    529185    Teachers Teachers_loginId_key97 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key97" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key97";
       public         
   botirovs03    false    216            �           2606    529187    Teachers Teachers_loginId_key98 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key98" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key98";
       public         
   botirovs03    false    216            �           2606    529189    Teachers Teachers_loginId_key99 
   CONSTRAINT     c   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_loginId_key99" UNIQUE ("loginId");
 M   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_loginId_key99";
       public         
   botirovs03    false    216            �           2606    294694    Teachers Teachers_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Teachers"
    ADD CONSTRAINT "Teachers_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Teachers" DROP CONSTRAINT "Teachers_pkey";
       public         
   botirovs03    false    216            l           2606    294634    Tokens Tokens_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Tokens"
    ADD CONSTRAINT "Tokens_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Tokens" DROP CONSTRAINT "Tokens_pkey";
       public         
   botirovs03    false    212                       2606    294661 2   SelectedStudents SelectedStudents_RecruitorId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."SelectedStudents"
    ADD CONSTRAINT "SelectedStudents_RecruitorId_fkey" FOREIGN KEY ("RecruitorId") REFERENCES public."Recruitors"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 `   ALTER TABLE ONLY public."SelectedStudents" DROP CONSTRAINT "SelectedStudents_RecruitorId_fkey";
       public       
   botirovs03    false    214    4308    213                       2606    294656 0   SelectedStudents SelectedStudents_StudentId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."SelectedStudents"
    ADD CONSTRAINT "SelectedStudents_StudentId_fkey" FOREIGN KEY ("StudentId") REFERENCES public."Students"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public."SelectedStudents" DROP CONSTRAINT "SelectedStudents_StudentId_fkey";
       public       
   botirovs03    false    3946    210    214                       2606    528205    Students Students_groupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES public."Groups"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public."Students" DROP CONSTRAINT "Students_groupId_fkey";
       public       
   botirovs03    false    210    3576    209            �   �   x�]̱!К�
{م�ۥ������0O+�߻֩&y���w;�RP��U+<��JHb.�y��龖���g5{k�9�X#!������Z�ۨ��"�sJ�rai�R����k�Z�f��a<�`!Y�R��18��q'�	��C�)#:b�hZ�4M?�&5�      �   �   x�}ͱJ1��:y
�Rf�Lf�ɶ�p�mic2	ns�����ʁ����_|�4K&�B�W#��#Xf6�Z{e����[����p�ĀT�̑�(�*=���|}k�b�J��#Cl
ʈ!�,������:�v>�Z'ݵ~�O��^% �u`����u�����|�˺}^�8#O�x��������H�      �      x������ � �      �   	  x����nG��{�B�1$�䐷
�T)����!�(r��}�r)�������7�<3���l��a�E�84-k��6��>O�:�3�z�5�vֱqn�4��#F�!0��}+MZ�) �dV�#��5�n�����w>���/�����~��Ϸw��ȇ������\l���?B�=��q^�
G�b����h!�^��a=��&%fgY�u#�ت;��Zm��7Lv�%��I����x߀�W�Ku{�I�w7�R�L�ڌ�Zi�sh��c/��T�����PS�+���ɣ]GU"�<.ڍ+���8`�;��Fo@���E_@{:���dKpve�P��R�go����Q5"?����v��6-]T�ΞKI��D�S ��j��oؠ�6Wc{��?���5��й�X2��T�Ko�ű�凔�X���VO��qV�m��i�N�}�Uܲ#�3a��̀��W��֊�*��	kv���4tօY&EQM�x��j���,}.��Ig���v���{�X�S�.�XV%clun�4�<d�Ѵvl9y�h#��*v����3��B�FlB<Je��>Fa��؋dC�X�������N'S[��j;\����ڢ�����JwZ�w:)�p�2O?���m�������/\�����]q��Y�П?����z���P�@��0��gȏ�%�¾$��s���0jɖL3u[��Fr�*hٱ,-���I�I���Ubp 9��m�a)}��B�K|���7��u嬟���B������7j	ƃ      �      x������ � �      �   �  x��SM�1=O��!��8q2'�y���KǢ �R?� ��ɴ�[�.h+�G�{�	���K3B2�@MLT��V*adaَ֫�
 �@�x՘m!@����G�F)T���(��jcp�sH��[�û�rZ����Ǔ�����b?~Φ����`���`���&�&�%{��?R�a�c5��کb3% �Z�cw9��!�M��i���w��~�u@��P�k`�6�$���[��*d��X�4j�!�HJ�Կ��D�l�$[:�"֔��t�I,��
ݫs�J�ͶɐҘ,�!z�yμ-�T;��Z&���2ݫ�0"O]8�¬�[�h�J� }�� Q߱�$6-/�v#:�X�u�J:&���:�h3��Z*Q%�����VbI�$���K>�������n�s&F���/�������OOogw��
g�ײ��p�A߭��������=����ٽ���?#և�L�/9<�4M�B�6�<��r�X��,�      �   �  x�����$5�㞧�yTU����x �Kl�K� �J{�H��3� D����pbwo��[j��i�W��^u��X.��=��QR�ETd{�ٳ�Q8󆳷e}H_}z�աiKr��hZ�W(ʅ������؊��� �o^|a���o��q�|�n7�q�� _�OG�O@�>9�X�VI<c�,��`M5{Y\skr!e�ϭ� oTi�����2z�ns ת�rF\�8S�e�H���d��N��.�=&ͥIi[��Fj+{Rl�S������]�/_���n���]��|��@�[�mb��,u�Qg)L�vwSUG�0�Hc�i�YcM����޿��ׯ�m?����_~�~{��Ǹz�1�s|>a�v�_N(G���ǻ��p++:�\RS�4�Z�
�E��	����/n�jg��22����I4Z���2(C�#O��]��[�:��2U�ÝE�ɥ��L���^�.�-y�d�p�D���M�������������u6��U�YԆD�#�D�T�E����������wJ, �CY�s*Nk����"9o(���zW�Jò��/+��j�� 5��m���M�rA������_��������p��{E���)���N��M�~�%*�O[iP�ً;O/������2&����m0{�iīA|��f��Z�L�{��q����l~�F;�XK9g{^���TZ��      �      x������ � �     