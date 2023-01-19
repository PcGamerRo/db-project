INSERT INTO CLIENT VALUES (100, 'Pietroiu', 'Robert', 'pietroiurobert65@gmail.com', '0765126290');
INSERT INTO CLIENT VALUES (101, 'Oprea', 'Ovidiu', 'operaovidiu12@gmail.com', '0765124536');
INSERT INTO CLIENT VALUES (102, 'Popa', 'Alexandru', 'popaalexandru54@gmail.com', '0765456899');
INSERT INTO CLIENT VALUES (103, 'Popa', 'Romeo', 'poparomeo88@gmail.com', '0762455671');
INSERT INTO CLIENT VALUES (104, 'Davidoiu', 'Adrian', 'davidoiuadrian24@gmail.com', '0723441577');
INSERT INTO CLIENT VALUES (105, 'Stoica', 'Ionut', 'stoicaionut99@gmail.com', '0798567743');
INSERT INTO CLIENT VALUES (106, 'Florea', 'Marian', 'floareamarian25@gmail.com', '0767562433');
INSERT INTO CLIENT VALUES (107, 'Cristea', 'Bogdan', 'cristeabogdan07@gmail.com', '0787674212');

INSERT INTO CINEMA VALUES (301, 'CINEMA CITY BUZAU', 'Bulevardul Doina Cornea 4, Bucure?ti');
INSERT INTO FILM VALUES(123, 'RUSH HOUR', 120, 'ACTIUNE', '...', 1998);
INSERT INTO LISTA_ACTORI VALUES(55, 123);

INSERT INTO ACTOR VALUES (624, 'Tzi Ma', 60, 55);
INSERT INTO ACTOR VALUES (231, 'Jackie Chan', 68, 55);
INSERT INTO ACTOR VALUES (134, 'Chris Tucker', 51,55);

INSERT INTO SALA VALUES (1, 'S1', 50, 301);
INSERT INTO FILM_PROGRAMAT VALUES(13, '20:00', '22:00', 15, 123, 1);
INSERT INTO RAND VALUES (1, 2, 1);
INSERT INTO LOC VALUES (1, 1, 1);
INSERT INTO LOC VALUES (2, 2, 1);
INSERT INTO LOC VALUES (3, 3, 1);
INSERT INTO LOC VALUES (4, 4, 1);
INSERT INTO LOC VALUES (5, 5, 1);
INSERT INTO LOC VALUES (6, 6, 1);
INSERT INTO LOC VALUES (7, 7, 1);
INSERT INTO LOC VALUES (8, 8, 1);
INSERT INTO REZERVARE VALUES (410, to_date('24-11-2022', 'dd-mm-yyyy'), 13, 100, 1);
INSERT INTO REZERVARE VALUES (411, to_date('20-11-2022', 'dd-mm-yyyy'), 13, 101, 2);
INSERT INTO REZERVARE VALUES (412, to_date('21-11-2022', 'dd-mm-yyyy'), 13, 102, 3);
INSERT INTO REZERVARE VALUES (413, to_date('25-11-2022', 'dd-mm-yyyy'), 13, 103, 4);
INSERT INTO REZERVARE VALUES (414, to_date('26-11-2022', 'dd-mm-yyyy'), 13, 104, 5);
INSERT INTO REZERVARE VALUES (415, to_date('24-11-2022', 'dd-mm-yyyy'), 13, 105, 6);
INSERT INTO REZERVARE VALUES (416, to_date('24-11-2022', 'dd-mm-yyyy'), 13, 106, 7);
INSERT INTO REZERVARE VALUES (417, to_date('25-11-2022', 'dd-mm-yyyy'), 13, 107, 8);

INSERT INTO CLIENT VALUES (108, 'Velea', 'Alin', 'veleaalin33@gmail.com', '0755247681');
INSERT INTO CLIENT VALUES (109, 'Preda', 'Marina', 'predamarina27@gmail.com', '0757342581');
INSERT INTO CLIENT VALUES (110, 'Constantin', 'Mihai', 'constmihai88@gmail.com', '0723451324');
INSERT INTO CLIENT VALUES (111, 'Globasu', 'Gabriel', 'globasugabriel90@gmail.com', '0765989152');
INSERT INTO CLIENT VALUES (112, 'Ghita', 'Mihai', 'ghitamihai56@gmail.com', '0765871255');
INSERT INTO CLIENT VALUES (113, 'Teodorescu', 'Alexandru', 'teodorescualexandru66@gmail.com', '0765871503');
INSERT INTO CLIENT VALUES (114, 'Popa', 'Razvan', 'poparazvan12@gmail.com', '0762349177');
INSERT INTO CLIENT VALUES (115, 'Prus', 'Dragos', 'prusdragos13@gmail.com', '0763892651');
INSERT INTO CLIENT VALUES (116, 'Hagiu', 'Ioana', 'hagiuioana1235@gmail.com', '0769251426');
INSERT INTO CLIENT VALUES (117, 'Tau', 'Raluca', 'tauraluca782@gmail.com', '0757825433');
INSERT INTO CLIENT VALUES (118, 'Tarara', 'Robert', 'tarararobert999@gmail.com', '0789265437');

INSERT INTO CINEMA VALUES (600, 'CINEMA CITY BUZAU', 'Bulevardul Unirii 232, Buzău 120021');
INSERT INTO FILM VALUES(124, '
Spider-Man: No Way Home', 148, 'ACTIUNE', '...', 2021);
INSERT INTO LISTA_ACTORI VALUES(60, 124);

INSERT INTO ACTOR VALUES (1023, 'Tom Holland', 26, 60);
INSERT INTO ACTOR VALUES (1024, 'Zendaya', 26, 60);
INSERT INTO ACTOR VALUES (1025, 'Benedict Cumberbatch', 46, 60);

INSERT INTO SALA VALUES (2, 'sala A', 30, 600);
INSERT INTO FILM_PROGRAMAT VALUES(20, '19:00', '21:24', 20, 124, 2);
INSERT INTO RAND VALUES (3, 1, 2);
INSERT INTO LOC VALUES (21, 1, 3);
INSERT INTO LOC VALUES (12, 2, 3);
INSERT INTO LOC VALUES (13, 3, 3);
INSERT INTO LOC VALUES (14, 4, 3);
INSERT INTO LOC VALUES (15, 5, 3);
INSERT INTO LOC VALUES (16, 6, 3);
INSERT INTO LOC VALUES (17, 7, 3);
INSERT INTO LOC VALUES (18, 8, 3);
INSERT INTO REZERVARE VALUES (418, to_date('24-11-2022', 'dd-mm-yyyy'), 20, 108, 21);
INSERT INTO REZERVARE VALUES (419, to_date('20-11-2022', 'dd-mm-yyyy'), 20, 100, 12);
INSERT INTO REZERVARE VALUES (420, to_date('21-11-2022', 'dd-mm-yyyy'), 20, 109, 13);
INSERT INTO REZERVARE VALUES (422, to_date('26-11-2022', 'dd-mm-yyyy'), 20, 111, 15);
INSERT INTO REZERVARE VALUES (423, to_date('24-11-2022', 'dd-mm-yyyy'), 20, 112, 16);
INSERT INTO REZERVARE VALUES (424, to_date('24-11-2022', 'dd-mm-yyyy'), 20, 113, 17);
INSERT INTO REZERVARE VALUES (425, to_date('25-11-2022', 'dd-mm-yyyy'), 20, 114, 18);
