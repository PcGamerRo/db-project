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



