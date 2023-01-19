--1. Creati o tabela virtuala care afiseaza numele clientilor care au facut rezervare pe data de 25-NOV-2022
CREATE OR REPLACE VIEW view1 AS
SELECT C.NUME "Client"
    FROM CLIENT C, REZERVARE R
        WHERE C.ID_CLIENT=R.ID_CLIENT AND DATA_REZERVARE=TO_DATE('25-11-2022', 'dd-mm-yyyy');

SELECT * FROM view1;

--2. Creati o tabela virtuala care afiseaza toate id_urile rezervarilor la filme de tip 'ACTIUNE'
CREATE OR REPLACE VIEW view2 AS
SELECT R.ID_REZERVARE
    FROM REZERVARE R, FILM_PROGRAMAT FP, FILM F
        WHERE R.ID_FILM_PROGRAMAT=FP.ID_FILM_PROGRAMAT AND FP.ID_FILM=F.ID_FILM
            AND F.TIP='ACTIUNE';
SELECT * FROM view2;

--3. Creati o tabela virtuala in care sa se afiseze locurile care au ID-ul egal cu numarul
CREATE OR REPLACE VIEW view3 AS
SELECT L.ID_LOC "ID LOC", NUMAR "NUMAR LOC"
    FROM LOC L
        WHERE L.ID_LOC IN (SELECT NUMAR FROM LOC WHERE L.ID_LOC=ID_LOC);
SELECT * FROM view3;

--4. Creati o tabela virtuala care afiseaza toate cinema-urile in Bucuresti
CREATE OR REPLACE VIEW view4 AS
SELECT ID_CINEMA, NUME "NUME CINEMA", ADRESA
    FROM CINEMA
        WHERE UPPER(CINEMA.NUME) LIKE '%BUCURESTI%';
SELECT * FROM view4;

--5. Creati o table virtuala in care sa se afiseze actorii care joaca in cel mai lung film, alaturi de lungimea acestuia
CREATE OR REPLACE VIEW view5 AS
SELECT A.ID_ACTOR, A.NUME, F.DURATA_MINUTE
    FROM ACTOR A, LISTA_ACTORI LA, FILM F
        WHERE A.ID_LISTA=LA.ID_LISTA AND LA.ID_FILM=F.ID_FILM AND F.DURATA_MINUTE>ANY(SELECT DURATA_MINUTE FROM FILM);
SELECT * FROM view5;