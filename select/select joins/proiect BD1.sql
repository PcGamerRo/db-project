--JOINS
--1. Sa se afiseze toate rezervarile clientilor ale caror numere de telefon au prefixul '0765'
SELECT R.ID_REZERVARE, c.NUMAR_TELEFON
    FROM REZERVARE R, CLIENT C
        WHERE R.ID_CLIENT=C.ID_CLIENT AND C.NUMAR_TELEFON LIKE '0765%';
        
--2. Sa se afiseze numele filmelor ce sunt progromate in sali ce au capacitate de peste 30 de persoane
SELECT F.NUME, S.CAPACITATE "CAPACITATE SALA"
    FROM FILM F, FILM_PROGRAMAT FP, SALA S
        WHERE F.ID_FILM=FP.ID_FILM AND FP.ID_SALA=S.ID_SALA AND S.CAPACITATE>30;

--3. Sa se afiseze randurile in care vor sta persoane care au facut rezervare dupa data de 25-NOV-2022
SELECT R.ID_RAND, RE.DATA_REZERVARE
    FROM RAND R, LOC L, REZERVARE RE
        WHERE R.ID_RAND=L.ID_RAND AND L.ID_LOC=RE.ID_LOC AND
            RE.DATA_REZERVARE>to_date('25-11-2022','dd-mm-yyyy');

--4. Sa se afiseze clientii care au facut rezervare la filme mai ieftine de 20 de lei
SELECT C.NUME || C.PRENUME AS "Client"
    FROM CLIENT C, REZERVARE R, FILM_PROGRAMAT FP
        WHERE C.ID_CLIENT=R.ID_CLIENT AND R.ID_FILM_PROGRAMAT=FP.ID_FILM_PROGRAMAT
            AND FP.PRET<20;

--5. Sa se afiseze actorii care joaca in filme programate in cinema-ul cu ID=600;
SELECT A.ID_ACTOR || ' ' || A.NUME AS "ACTOR"
    FROM ACTOR A, LISTA_ACTORI LA, FILM F, FILM_PROGRAMAT FP, SALA S, CINEMA C
        WHERE A.ID_LISTA=LA.ID_LISTA AND LA.ID_FILM=F.ID_FILM AND F.ID_FILM=FP.ID_FILM AND 
        FP.ID_SALA=S.ID_SALA AND S.ID_CINEMA=C.ID_CINEMA 
            AND C.ID_CINEMA=600;



--SUBCERERI
--1. Sa se afiseze randurile in care vor sta cel putin 2 persoane care au facut rezervarea in aceeasi zi
SELECT distinct R.ID_RAND
    FROM RAND R, LOC L, REZERVARE RE , CLIENT C
    WHERE R.ID_RAND=L.ID_RAND AND L.ID_LOC=RE.ID_LOC AND 
        RE.DATA_REZERVARE IN (SELECT DATA_REZERVARE FROM REZERVARE);
        
--2. Sa se afiseze actorii care au jucat in cel putin un film
SELECT A.ID_ACTOR || ' ' || A.NUME AS "ACTOR", ID_LISTA
    FROM ACTOR A
    WHERE A.ID_LISTA IN (SELECT ID_LISTA FROM LISTA_ACTORI);
        
--3. Sa se afiseze filmele programate in sala cu cele mai multe locuri
SELECT FP.ID_FILM_PROGRAMAT
    FROM FILM_PROGRAMAT FP, SALA S
        WHERE FP.ID_SALA=S.ID_SALA AND S.CAPACITATE>ANY(SELECT CAPACITATE FROM SALA);
        
--4. Sa se afiseze actorii care participa la cel mai recent film aparut
SELECT NUME "ACTOR"
    FROM ACTOR WHERE ID_LISTA=(SELECT ID_LISTA FROM LISTA_ACTORI
                WHERE ID_FILM=(SELECT ID_FILM FROM FILM
                    WHERE ANUL_PUBLICARII>ANY(SELECT ANUL_PUBLICARII FROM FILM)));

--5. Sa se afiseze numele, varsta curenta si varsta actorilor in momentul publicarii filmului 
-- in care au jucat (adica varsta-2022+anul_publicarii)
SELECT A.NUME, A.VARSTA "VARSTA CURENTA" ,A.VARSTA-2022+(SELECT ANUL_PUBLICARII FROM FILM 
        WHERE ID_FILM IN (SELECT ID_FILM FROM LISTA_ACTORI WHERE A.ID_LISTA=ID_LISTA)) AS "VARSTA"
        FROM ACTOR A;


INSERT INTO SALA VALUES(3, 'S2', 40, 301);
INSERT INTO SALA VALUES(4, 'S3', 100, 301);
INSERT INTO SALA VALUES(5, 'S4', 120, 301);
INSERT INTO SALA VALUES(6, 'Sala B', 70, 301);



--GROUP BY
--1. Sa se afiseze numele filmelor, si numarul de actori care joaca in acestea
SELECT F.NUME,  COUNT(A.ID_ACTOR) "numar actori"
    FROM FILM F, LISTA_ACTORI LA, ACTOR A
        WHERE F.ID_FILM=LA.ID_FILM AND A.ID_LISTA=LA.ID_LISTA 
        group by F.NUME, F.TIP;

--2. Sa se afiseze numele cinema-urilor si sala cu capacitatea maxima
SELECT C.ID_CINEMA, MAX(S.CAPACITATE)
    FROM CINEMA C, SALA S
        WHERE C.ID_CINEMA=S.ID_CINEMA 
        group by C.ID_CINEMA;

--3. Sa se afiseze filmele cu cei mai tineri actori, alaturi de varsta minima a unui actor
SELECT distinct F.nume "NUME FILM", a.varsta
    FROM FILM F, ACTOR A, LISTA_ACTORI LA
        WHERE F.ID_FILM=LA.ID_FILM AND A.ID_LISTA=LA.ID_LISTA 
        group by F.nume, a.nume, a.varsta
        having a.varsta<=all(select varsta from actor);
        
--4. Sa se afiseze zilele in care s-au facut cele mai multe rezervari,
-- in ordinea descrescatoare a numarului acestora
SELECT R1.DATA_REZERVARE, COUNT(R2.ID_REZERVARE)
    FROM REZERVARE R1 , REZERVARE R2
    WHERE R1.ID_REZERVARE=R2.ID_REZERVARE group by R1.DATA_REZERVARE
    ORDER BY COUNT(R2.ID_REZERVARE) DESC;
    
--5. Sa se afiseze filmul vizionat de cei mai multi clienti
SELECT MAX(F.NUME) "FILM", COUNT(DISTINCT R1.ID_REZERVARE) "Numar rezervari"
    FROM FILM F, FILM_PROGRAMAT FP, REZERVARE R1, REZERVARE R2
        WHERE F.ID_FILM=FP.ID_FILM AND FP.ID_FILM_PROGRAMAT=R1.ID_FILM_PROGRAMAT 
        group by F.NUME
        order by  COUNT(DISTINCT R1.ID_REZERVARE) desc
        fetch next 1 row only;
        
        