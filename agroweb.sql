PGDMP     $    &            
    u           agroweb    10.0    10.0 ;    ;           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            <           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            =           1262    24596    agroweb    DATABASE     �   CREATE DATABASE agroweb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE agroweb;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            >           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            ?           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    24632    cadastro    TABLE     0  CREATE TABLE cadastro (
    cad_id integer NOT NULL,
    cad_email character varying(120) NOT NULL,
    cad_username character varying(120) NOT NULL,
    cad_fone character varying(120),
    cad_senha character varying(120) NOT NULL,
    cad_nome character varying(120) NOT NULL,
    local_id integer
);
    DROP TABLE public.cadastro;
       public         postgres    false    3            �            1259    24630    cadastro_cad_id_seq    SEQUENCE     �   CREATE SEQUENCE cadastro_cad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.cadastro_cad_id_seq;
       public       postgres    false    3    199            @           0    0    cadastro_cad_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE cadastro_cad_id_seq OWNED BY cadastro.cad_id;
            public       postgres    false    198            �            1259    24648 
   fornecedor    TABLE     �  CREATE TABLE fornecedor (
    for_id integer NOT NULL,
    for_nome character varying(120) NOT NULL,
    for_telefone character varying(120) NOT NULL,
    for_endereco character varying(240) NOT NULL,
    for_logo character varying(120) NOT NULL,
    for_pagamento character varying(120) NOT NULL,
    for_email character varying(120) NOT NULL,
    for_url character varying(120),
    local_id integer
);
    DROP TABLE public.fornecedor;
       public         postgres    false    3            �            1259    24646    fornecedor_for_id_seq    SEQUENCE     �   CREATE SEQUENCE fornecedor_for_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.fornecedor_for_id_seq;
       public       postgres    false    3    201            A           0    0    fornecedor_for_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE fornecedor_for_id_seq OWNED BY fornecedor.for_id;
            public       postgres    false    200            �            1259    24688    fornecedorproduto    TABLE     K   CREATE TABLE fornecedorproduto (
    for_id integer,
    prd_id integer
);
 %   DROP TABLE public.fornecedorproduto;
       public         postgres    false    3            �            1259    24624    local    TABLE     �   CREATE TABLE local (
    local_id integer NOT NULL,
    local_cidade character varying(120) NOT NULL,
    local_uf character varying(6) NOT NULL,
    local_pais character varying(120)
);
    DROP TABLE public.local;
       public         postgres    false    3            �            1259    24622    local_local_id_seq    SEQUENCE     �   CREATE SEQUENCE local_local_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.local_local_id_seq;
       public       postgres    false    197    3            B           0    0    local_local_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE local_local_id_seq OWNED BY local.local_id;
            public       postgres    false    196            �            1259    24709    pessoafisica    TABLE     k   CREATE TABLE pessoafisica (
    cad_id integer,
    pf_cpf integer NOT NULL,
    pf_rg integer NOT NULL
);
     DROP TABLE public.pessoafisica;
       public         postgres    false    3            �            1259    24701    pessoajuridica    TABLE     �   CREATE TABLE pessoajuridica (
    cad_id integer,
    pj_razaosocial character varying(120) NOT NULL,
    pj_cnpj integer NOT NULL,
    pj_nomefantasia character varying(120) NOT NULL,
    pj_insricao_est character varying(15)
);
 "   DROP TABLE public.pessoajuridica;
       public         postgres    false    3            �            1259    24672    produto    TABLE     �   CREATE TABLE produto (
    prd_id integer NOT NULL,
    prd_nome character varying(120) NOT NULL,
    prd_preco double precision NOT NULL,
    prd_qt integer NOT NULL,
    prd_data date NOT NULL,
    cat_id integer,
    for_id integer
);
    DROP TABLE public.produto;
       public         postgres    false    3            �            1259    24670    produto_prd_id_seq    SEQUENCE     �   CREATE SEQUENCE produto_prd_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.produto_prd_id_seq;
       public       postgres    false    3    205            C           0    0    produto_prd_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE produto_prd_id_seq OWNED BY produto.prd_id;
            public       postgres    false    204            �            1259    24664    produtocategoria    TABLE     �   CREATE TABLE produtocategoria (
    cat_id integer NOT NULL,
    cat_nome character varying(120),
    cat_desc character varying(240)
);
 $   DROP TABLE public.produtocategoria;
       public         postgres    false    3            �            1259    24662    produtocategoria_cat_id_seq    SEQUENCE     �   CREATE SEQUENCE produtocategoria_cat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.produtocategoria_cat_id_seq;
       public       postgres    false    3    203            D           0    0    produtocategoria_cat_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE produtocategoria_cat_id_seq OWNED BY produtocategoria.cat_id;
            public       postgres    false    202            �            1259    24717    session    TABLE     �   CREATE TABLE session (
    sid character varying NOT NULL,
    sess json NOT NULL,
    expire timestamp(6) without time zone NOT NULL
);
    DROP TABLE public.session;
       public         postgres    false    3            �
           2604    24635    cadastro cad_id    DEFAULT     d   ALTER TABLE ONLY cadastro ALTER COLUMN cad_id SET DEFAULT nextval('cadastro_cad_id_seq'::regclass);
 >   ALTER TABLE public.cadastro ALTER COLUMN cad_id DROP DEFAULT;
       public       postgres    false    199    198    199            �
           2604    24651    fornecedor for_id    DEFAULT     h   ALTER TABLE ONLY fornecedor ALTER COLUMN for_id SET DEFAULT nextval('fornecedor_for_id_seq'::regclass);
 @   ALTER TABLE public.fornecedor ALTER COLUMN for_id DROP DEFAULT;
       public       postgres    false    201    200    201            �
           2604    24627    local local_id    DEFAULT     b   ALTER TABLE ONLY local ALTER COLUMN local_id SET DEFAULT nextval('local_local_id_seq'::regclass);
 =   ALTER TABLE public.local ALTER COLUMN local_id DROP DEFAULT;
       public       postgres    false    196    197    197            �
           2604    24675    produto prd_id    DEFAULT     b   ALTER TABLE ONLY produto ALTER COLUMN prd_id SET DEFAULT nextval('produto_prd_id_seq'::regclass);
 =   ALTER TABLE public.produto ALTER COLUMN prd_id DROP DEFAULT;
       public       postgres    false    205    204    205            �
           2604    24667    produtocategoria cat_id    DEFAULT     t   ALTER TABLE ONLY produtocategoria ALTER COLUMN cat_id SET DEFAULT nextval('produtocategoria_cat_id_seq'::regclass);
 F   ALTER TABLE public.produtocategoria ALTER COLUMN cat_id DROP DEFAULT;
       public       postgres    false    203    202    203            .          0    24632    cadastro 
   TABLE DATA               e   COPY cadastro (cad_id, cad_email, cad_username, cad_fone, cad_senha, cad_nome, local_id) FROM stdin;
    public       postgres    false    199   AB       0          0    24648 
   fornecedor 
   TABLE DATA               �   COPY fornecedor (for_id, for_nome, for_telefone, for_endereco, for_logo, for_pagamento, for_email, for_url, local_id) FROM stdin;
    public       postgres    false    201   �P       5          0    24688    fornecedorproduto 
   TABLE DATA               4   COPY fornecedorproduto (for_id, prd_id) FROM stdin;
    public       postgres    false    206   �S       ,          0    24624    local 
   TABLE DATA               F   COPY local (local_id, local_cidade, local_uf, local_pais) FROM stdin;
    public       postgres    false    197   �S       7          0    24709    pessoafisica 
   TABLE DATA               6   COPY pessoafisica (cad_id, pf_cpf, pf_rg) FROM stdin;
    public       postgres    false    208   �T       6          0    24701    pessoajuridica 
   TABLE DATA               d   COPY pessoajuridica (cad_id, pj_razaosocial, pj_cnpj, pj_nomefantasia, pj_insricao_est) FROM stdin;
    public       postgres    false    207   �T       4          0    24672    produto 
   TABLE DATA               Y   COPY produto (prd_id, prd_nome, prd_preco, prd_qt, prd_data, cat_id, for_id) FROM stdin;
    public       postgres    false    205   �T       2          0    24664    produtocategoria 
   TABLE DATA               ?   COPY produtocategoria (cat_id, cat_nome, cat_desc) FROM stdin;
    public       postgres    false    203   �U       8          0    24717    session 
   TABLE DATA               -   COPY session (sid, sess, expire) FROM stdin;
    public       postgres    false    209   V       E           0    0    cadastro_cad_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('cadastro_cad_id_seq', 85, true);
            public       postgres    false    198            F           0    0    fornecedor_for_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('fornecedor_for_id_seq', 10, true);
            public       postgres    false    200            G           0    0    local_local_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('local_local_id_seq', 8, true);
            public       postgres    false    196            H           0    0    produto_prd_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('produto_prd_id_seq', 20, true);
            public       postgres    false    204            I           0    0    produtocategoria_cat_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('produtocategoria_cat_id_seq', 1, false);
            public       postgres    false    202            �
           2606    24640    cadastro cadastro_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY cadastro
    ADD CONSTRAINT cadastro_pkey PRIMARY KEY (cad_id);
 @   ALTER TABLE ONLY public.cadastro DROP CONSTRAINT cadastro_pkey;
       public         postgres    false    199            �
           2606    24656    fornecedor fornecedor_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY fornecedor
    ADD CONSTRAINT fornecedor_pkey PRIMARY KEY (for_id);
 D   ALTER TABLE ONLY public.fornecedor DROP CONSTRAINT fornecedor_pkey;
       public         postgres    false    201            �
           2606    24629    local local_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY local
    ADD CONSTRAINT local_pkey PRIMARY KEY (local_id);
 :   ALTER TABLE ONLY public.local DROP CONSTRAINT local_pkey;
       public         postgres    false    197            �
           2606    24677    produto produto_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (prd_id);
 >   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_pkey;
       public         postgres    false    205            �
           2606    24669 &   produtocategoria produtocategoria_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY produtocategoria
    ADD CONSTRAINT produtocategoria_pkey PRIMARY KEY (cat_id);
 P   ALTER TABLE ONLY public.produtocategoria DROP CONSTRAINT produtocategoria_pkey;
       public         postgres    false    203            �
           2606    24724    session session_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY session
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);
 >   ALTER TABLE ONLY public.session DROP CONSTRAINT session_pkey;
       public         postgres    false    209            �
           2606    24641    cadastro cadastro_local_id_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY cadastro
    ADD CONSTRAINT cadastro_local_id_fkey FOREIGN KEY (local_id) REFERENCES local(local_id);
 I   ALTER TABLE ONLY public.cadastro DROP CONSTRAINT cadastro_local_id_fkey;
       public       postgres    false    199    197    2719            �
           2606    24657 #   fornecedor fornecedor_local_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY fornecedor
    ADD CONSTRAINT fornecedor_local_id_fkey FOREIGN KEY (local_id) REFERENCES local(local_id);
 M   ALTER TABLE ONLY public.fornecedor DROP CONSTRAINT fornecedor_local_id_fkey;
       public       postgres    false    2719    197    201            �
           2606    24691 /   fornecedorproduto fornecedorproduto_for_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY fornecedorproduto
    ADD CONSTRAINT fornecedorproduto_for_id_fkey FOREIGN KEY (for_id) REFERENCES fornecedor(for_id);
 Y   ALTER TABLE ONLY public.fornecedorproduto DROP CONSTRAINT fornecedorproduto_for_id_fkey;
       public       postgres    false    206    2723    201            �
           2606    24696 /   fornecedorproduto fornecedorproduto_prd_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY fornecedorproduto
    ADD CONSTRAINT fornecedorproduto_prd_id_fkey FOREIGN KEY (prd_id) REFERENCES produto(prd_id);
 Y   ALTER TABLE ONLY public.fornecedorproduto DROP CONSTRAINT fornecedorproduto_prd_id_fkey;
       public       postgres    false    206    2727    205            �
           2606    24712 %   pessoafisica pessoafisica_cad_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY pessoafisica
    ADD CONSTRAINT pessoafisica_cad_id_fkey FOREIGN KEY (cad_id) REFERENCES cadastro(cad_id);
 O   ALTER TABLE ONLY public.pessoafisica DROP CONSTRAINT pessoafisica_cad_id_fkey;
       public       postgres    false    2721    208    199            �
           2606    24704 *   pessoajuridica pessoajurídica_cad_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY pessoajuridica
    ADD CONSTRAINT "pessoajurídica_cad_id_fkey" FOREIGN KEY (cad_id) REFERENCES cadastro(cad_id);
 V   ALTER TABLE ONLY public.pessoajuridica DROP CONSTRAINT "pessoajurídica_cad_id_fkey";
       public       postgres    false    2721    199    207            �
           2606    24678    produto produto_cat_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY produto
    ADD CONSTRAINT produto_cat_id_fkey FOREIGN KEY (cat_id) REFERENCES produtocategoria(cat_id);
 E   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_cat_id_fkey;
       public       postgres    false    205    203    2725            �
           2606    24683    produto produto_for_id_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY produto
    ADD CONSTRAINT produto_for_id_fkey FOREIGN KEY (for_id) REFERENCES fornecedor(for_id);
 E   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_for_id_fkey;
       public       postgres    false    205    201    2723            .   �  x�eXٲ�J��f?ź8�}��y�;L���28DG�(��d|��A�źp����#���̯2��/��DLK���������a�d J�s�a[pa���>M��(|��|�"�����Vi`��E�1��?d0�~�EӤ<a�/��TP�9�Y��9)D�H	��n�R&R�'C0�4͓#
�%���;>'5�-��ǲ�92L�ȁ������`u�{ aQ<�jUG������������E�0-���w�=,4I��(+r�1ka:���pN`��D3_~�l���d��Y���)^���7�?ռ�k�K��Q�a�ע�?��"�iYx���2��EwQt�Z�H��i��9����"J���swM�(�A���%�F�,�-n0G��s��TO�/@q��s��A�1��?^��E�Cg&y��V�&N�N�.C���y
>�J�h�&�%���n���>�|�Ŕd�O��>Y�Fq`���j�]�y7���t�?v�h�͒���%�9N�.:�PA�un�?3t�Td1�S$�O�AycItr�D�$�=�!2σ	Ħ ~�߾�&�4B��ȧSK�e��H�s�FQ(��S,+~�'0X3u�͹��J�B�ATɇ��Ǩ��;������0g���K)쑧���?�V�0�^>)��$�Ē���Y8P[)�����S8|�����O��OGO=@����H�Ɗ�O����|�dO{��G[yA�ٚ�~����V$��ϻ�!P'�����~�q?��~���?�}d� ,���(oZ�q�gA���@��`Q�/��˼ʢ�TGֺ҃x#3;+�v���yfkʲ�H��$��6��&m��&�,T� �D���H��~�|-�y�椦�����sK�V�͎�|���~�r�̔*�NѻI�C`?��x�#�����k�q�d�iw8���3a/�����4�ݺs�����Þ?����xV��'�P(#?h's�R.���R���#x��JA�MI�.
2w<Q|t�N����m�Q��4懅�P�jv:�76� �I����Q���١���l[ʤU�mL�09gi������P�FS$JB��z<��E-UA<WאdF�W_��,d�
�v#T���۾�-<cG8�`�>Oh� ��G� ۭ}�]�MG�{z3]�4Z4�;)V�:���d�#7�\��6Z�_�GT����s�ci"�����5�r��d�l�s��$���%Kl3ZUy�kx�2�֒�[�h���FQ	>��`�V�{���|�I��߅8e/2��0^%��O�s��[���a:�rTy�d��#�C�G�S�H 
�����7�̳j���2	�o)#�*�ڜ�\�MV�ǭ�I��%���}h�f���"`~���Y␠!9,�7��0�u	�R��e!M;�����M����v����NugC1�*3m.j��Y�H��odu��J�Qw}���a�(�ܙ�[���ɽ^v!�w�PI�rz��&!A*�!f��,3� �@
;�H�\���?��%��Q���jB7`�ץ�s��X��0�|��aV�]7���9�|����U��a7�Y�%�$=#!O��ֿ
�tj�4U'��Zc���vx%��I��,l�,�4k��n�-Nx|ܡ��1�#�ڊ��%�${Ŀ�f|���K�9�t�1)���Ո�i�Y)Uql�-�Ș�}����~��\[�.���V���^������7�ĭe/7�Q�ѱ�B��'B��)���ݭ2�'^s��2q}�� �q9.^�¯�f��*�Z\��E�"���`r�Uq���%�j���Hs*��$�azM�������(�c�|"zѬ��skW�C�ֹY��x�s���y�E���v`�bB���:��*I1�Nd*{GA�����Uݹ�XWl˩��N���*����d�i�j-�溥 �*|����?��(<׮%����:`/ZV�?�yh99;mx�%/u@T�,�Z�_cM@��d�T��FS/>mԢϔ܆���n��E�A��ފͽ훣�}���ۙrn1~�J\4��|�4�D�R�H����&��>�Krs�|;�U���������d��׻��)�--�>2�y���I�o���A"_F��(%Q �����Ѥ) w2,�ۮ֎gL��,dx[8��k�}�Y�_�#��P��72 ��H�o��`�{V��'^h����kσ*�[ߘ+Z3���u{ܜ�=.�ud+BƊ�_p�V�%��&[�T��7�/
C�V75�ph�N׃k�~0��.��f��p�y�t��ʪ}�dh��1M��˓K������|��4]��Rx��4�k�T�6������dgZm�)�~�,�"�K��1M#aK������*��S�ƺu8��ka�O�t�$�!��fV��0o�;�������]�X\G�W4�����?|b�zț4��ۤ�TG��Ԑ���\mN���m��Oz�<����C81i�r��9b���T�^}�H"y�f�4���I��}��Ѯ���1�]ۙ4�"��R�^���I#W�0�m��(�U.�j�$��_#"�������zZ��[��}����'qθ�	��Nl~�L��H���n4"��hg׳2^i�Bp�;��e^��[�<���?:��?�y�[U$��V��L�盂�+���b���/}��%~y��������vd�B���2G�� �.o9���:�Mc�(�y���mU��t�axb��Ni�j�V��(�q7W��4U�Y���w$�M��Kl��T{�ZB�5(�������O���ù���I������)Erk�^�cg��dã1�S�eF4���q��4����M����|i�'�x�*����4S��q�\(/�
�ő��L��1��0al�2�>=�O���cQ�4Z��E|����QW�>���[��\l&�T �M���8�����z�b��
GX����?�u�`�4��~��;��xr��T�v^HkB�
�ҭ�8�@Y��X�����Z��O���s��bE���}��[�����d���� ��ĳ�%�%:q>����[���v1N�u89������>r��9M"u��߹�k	��:L���+�pj W�h]�	�nC�^y�m���6�ʼ-���/�xP���7�=��G��ШX�3�/t���z�^�]جe�&.��F��u����!�1w(�X�;=ć�{i�Hw
�g�n�S�	�����LE%����xs�'��m�%�]<q%�&�I{��D��G}�l�2������S%��1s���,{��ς�Qn�m�v��قc���N��q!v$���?���_�e����Ȳ
t8�X�{��Ыj9��_��1��������!�V�s�(��X��'�8$�J�Q[�m/�DY�������)q�j��b*S\�5�k���NU�OY��l��b��7,���X��\x[/Lu)����p���ۘ�G��WH-�R����)�E�Uw�o���;C�liD�������s��ށl�:/����
��{���v�S���s�����J�|n�Z�x�Ȑa�H�cz��?Z�kSb�1�zhL������M�鴘��q�=�`Ֆ�8xeiIH���~�Gx�|驈����(�x������'��[�x7jc��L��Xu|��K�6K�4?޿�/��ׯ�����      0   �  x���[O�0���_�G�HHl��}qЕ�E��)�ֱ#'���~'�v�$���'9�Ϝ��͊�F���߹ʶ��l�/�j4�(��c.��,K�Fd*f3X��P�g0�U]�|;=5�c����p�i��S�Gl�����î����Y�sC��[*X`h�c�(a7ΕkmO���][T;���
�nYdI�8T�J��R�Y��@���6z�_ i�r�@v��& �����r=��
��Z����`��t�>��q=��-z�JDY%2v�F��`~ �9��Jg7�+g�w��V���Uo�D��W������7�,#�Pfi�M��ُ�������;������J��i;wD"؍��2AI��8Pq�+J	� �n�~��@_#��c�uQe���{�_�O�1ؽv�����x�lH_悴E��*g��i�O��v��/Jl\�;��Kx�O�*��ah�t�D6d�Dj��wuÎ��iyH)��ip�w],�lѯ�?���h��^{���� w/�Q��=0�/�q0��@�R�gm��*�1��u޽L��g�7�����1�R����2�U�!H�7I���O�:,OhV�2q�� R�G��s�`;��It�)�L+ɓ�M]_ �5^۷C�x=�^�G�>b�}i���g8�~h�       5      x������ � �      ,   �   x�m�1O�0����Ĉb�M�Z$@j� ���\j��m��"�=f`c�����;dNe��1;/Z�!��s��jtoW��$o�3��o
�){S-^)@����y�)fa���R�n�l�M�jx/|�Ppy� V��)D���T�X�]J.P�b�#z�h�u��^��rO�b��;�K m6��-&����cdJ�6}�M[
��wsլ:�����(�n cLX|���>��7=�
!~ �e      7      x������ � �      6      x������ � �      4   �   x�M�A��0���]2��Ա��`�&B PASqL���*R��maw���gG*!J �v��sF2d!����nm��̺).&�S�(��/"�]�������Dz�g���"����Fh��W.���\�m�e�۪y[CqxM���h�%������Ld��8�!���LV�eX'ǯa�9�B=      2   ?   x�3�L/:�8���Lqq:��&�CH.c������Û+2��b6�	g~iIP������ Z��      8   �   x�5���0 g��A)�`���11��.
T���b�.nw7ܵ>��.����]�UR�?~��y�Gww��zqd ex�%9���T�"�kn��k�>K��g!h�: ��qfk�2n�y����P� �qa�t�Sgd��!���3�     