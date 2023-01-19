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

