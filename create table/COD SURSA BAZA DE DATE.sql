---------------------------COD SURSA BAZA DE DATE--------------------------------
CREATE TABLE CLIENT (
    id_client NUMBER CONSTRAINT pk_client PRIMARY KEY,
    nume VARCHAR(10) NOT NULL,
    prenume VARCHAR(10) NOT NULL,
    email VARCHAR(80),
    numar_telefon CHAR(10)
);

CREATE TABLE CINEMA (
    id_cinema NUMBER CONSTRAINT pk_cinema PRIMARY KEY,
    nume VARCHAR(80),
    adresa VARCHAR(80)
);

CREATE TABLE FILM (
    id_film NUMBER CONSTRAINT pk_film PRIMARY KEY,
    nume VARCHAR(20) NOT NULL,
    durata_minute NUMBER NOT NULL,
    tip VARCHAR(20) NOT NULL,
    descriere VARCHAR(50),
    anul_publicarii NUMBER
);

CREATE TABLE SALA (
    id_sala NUMBER CONSTRAINT pk_sala PRIMARY KEY,
    nume VARCHAR(10),
    capacitate NUMBER,
    id_cinema NUMBER REFERENCES CINEMA(id_cinema)
);

CREATE TABLE FILM_PROGRAMAT (
    id_film_programat NUMBER CONSTRAINT pk_film_programat PRIMARY KEY,
    ora_inceput VARCHAR(10),
    ora_incheiere VARCHAR(10),
    pret NUMBER NOT NULL,
    id_film NUMBER REFERENCES FILM(id_film),
    id_sala NUMBER REFERENCES SALA(id_sala)
);

CREATE TABLE LISTA_ACTORI (
    id_lista NUMBER CONSTRAINT pk_lista PRIMARY KEY,
    id_film NUMBER REFERENCES FILM(id_film)
);

CREATE TABLE ACTOR (
    id_actor NUMBER CONSTRAINT pk_actor PRIMARY KEY,
    nume VARCHAR(20) NOT NULL,
    varsta NUMBER, 
    id_lista NUMBER REFERENCES LISTA_ACTORI(id_lista)
);


CREATE TABLE RAND (
    id_rand NUMBER CONSTRAINT pk_rand PRIMARY KEY,
    numar NUMBER NOT NULL,
    id_sala NUMBER REFERENCES SALA(id_sala)
);

CREATE TABLE LOC (
    id_loc NUMBER CONSTRAINT pk_loc PRIMARY KEY,
    numar NUMBER NOT NULL,
    id_rand NUMBER REFERENCES RAND(id_rand)
);

CREATE TABLE REZERVARE (
    id_rezervare NUMBER CONSTRAINT pk_rezervare PRIMARY KEY,
    data_rezervare DATE NOT NULL,
    id_film_programat NUMBER REFERENCES FILM_PROGRAMAT(id_film_programat),
    id_client NUMBER REFERENCES CLIENT(id_client),
    id_loc NUMBER REFERENCES LOC(id_loc)
);