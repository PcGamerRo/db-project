--1. Modificati data rezervarilor cu +1 zi in cazul filmelor ce au ID_FILM_PROGRAMAT=13, sau cu 2 in cazul ID_FILM_PROGRAMAT=20
UPDATE REZERVARE SET DATA_REZERVARE = DATA_REZERVARE + 
(CASE WHEN ID_FILM_PROGRAMAT=13 THEN 1
    	WHEN ID_FILM_PROGRAMAT=20 THEN 2
   	ELSE 0 END);

--2. Modificati capacitatea salii ce are ca id=1, cu pretul filmului programat in acea sala
UPDATE SALA S SET CAPACITATE = (SELECT PRET FROM FILM_PROGRAMAT F WHERE S.ID_SALA = F.ID_SALA)
WHERE ID_SALA=1;
    
--3. Sa se mareasca pretul filmului programat cu 15% daca data publicarii este<2000
UPDATE FILM_PROGRAMAT FP SET PRET = PRET + PRET*
   (CASE WHEN (SELECT ANUL_PUBLICARII FROM FILM F WHERE F.ID_FILM = FP.ID_FILM)<2000 THEN 0.15
   ELSE 1 END);

--4. Sa se modifice numarul locului pentru clientii care au facut rezervare pe 24 Noiembrie cu 24
UPDATE LOC L SET NUMAR = NUMAR - 1*
    (CASE WHEN (SELECT EXTRACT(DAY FROM DATA_REZERVARE) FROM REZERVARE R WHERE L.ID_LOC = R.ID_LOC)=24
          AND upper((SELECT EXTRACT(MONTH FROM DATA_REZERVARE) FROM REZERVARE R WHERE L.ID_LOC=R.ID_LOC))=11  then 24
    ELSE 0 END);

--5. Sa se reduca capacitatea salii la numarul de rezervari facute
UPDATE SALA S SET CAPACITATE = 
    (SELECT COUNT(R.ID_REZERVARE)
                    FROM REZERVARE R, FILM_PROGRAMAT FP
                        WHERE R.ID_FILM_PROGRAMAT=FP.ID_FILM_PROGRAMAT AND FP.ID_SALA=S.ID_SALA);
---6. CRESTETI CAPACITATEA SALII CU ID-UL 1 LA 50 DE PERSOANE SI CU 80 PENTRU ID-UL 2
UPDATE SALA SET CAPACITATE=
        (CASE WHEN ID_SALA=1 THEN 50
        WHEN ID_SALA=2 THEN 80 END);
--7. Schimbati numele cinema-ului cu id-ul 301 in ‘CINEMA CITY BUCURESTI’
UPDATE CINEMA SET NUME='CINEMA CITY BUCURESTI' WHERE ID_CINEMA=301;
