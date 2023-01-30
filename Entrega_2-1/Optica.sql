-- - Nivell 1 - Exercici 1 - Òptica

DROP DATABASE IF EXISTS optica;

CREATE DATABASE optica;
USE optica;

CREATE TABLE proveidors  (
        id_proveidor INTEGER NOT NULL AUTO_INCREMENT,
        nom_proveidor TEXT,
        adreça_proveidor TEXT,
        telefon_proveidor INTEGER,
        fax_proveidor INTEGER,
        nif_proveidor VARCHAR(9),
        PRIMARY KEY (id_proveidor)
    );

CREATE TABLE ulleres (
        id_proveidor INTEGER NOT NULL,
        FOREIGN KEY (id_proveidor) REFERENCES proveidors (id_proveidor),
        id_ulleres INTEGER NOT NULL AUTO_INCREMENT,
        marca_ulleres VARCHAR(50),
        graduacio_vidres INTEGER ,
        tipus_montura ENUM("flotant", "pasta", "metàlica") NOT NULL,
        color_montura VARCHAR(50),
        color_vidre VARCHAR(50),
        preu_ulleres INTEGER,
        PRIMARY KEY (id_ulleres)

    );

CREATE TABLE clients (
        id_client INTEGER NOT NULL AUTO_INCREMENT,
        nom_client TEXT,
        adreça_client TEXT,
        telefon_client INTEGER,
        email_client TEXT,
        data_registre DATE,
        id_referenciat INTEGER,
        FOREIGN KEY (id_referenciat) REFERENCES clients(id_client),
        PRIMARY KEY (id_client)
    );

CREATE TABLE treballadors (
        id_treballador INTEGER NOT NULL AUTO_INCREMENT,
        nom_treballador VARCHAR(50),
        cognom_treballador VARCHAR(50),
        PRIMARY KEY (id_treballador)
    );

CREATE TABLE ventes (
        id_venta INTEGER NOT NULL AUTO_INCREMENT,
        id_client INTEGER NOT NULL,
        FOREIGN KEY (id_client) REFERENCES clients(id_client),
        data_venta DATE,
        id_ulleres INTEGER NOT NULL,
        FOREIGN KEY (id_ulleres) REFERENCES ulleres(id_ulleres),
        id_treballador INTEGER NOT NULL,
        FOREIGN KEY (id_treballador) REFERENCES treballadors(id_treballador),
        PRIMARY KEY (id_venta)
    );

-- Inserts proveidors, ulleres, clients, treballadors


INSERT INTO proveidors  (nom_proveidor, adreça_proveidor, telefon_proveidor, nif_proveidor)
VALUES('Alain afflelou', 'Carrer Franchute 1', 612345678, 'A12345678');
INSERT INTO proveidors  (nom_proveidor, adreça_proveidor, fax_proveidor, nif_proveidor)
VALUES('Meller', 'Carrer Perill 2', 623456789, 'B1245678');


INSERT INTO ulleres (id_proveidor, marca_ulleres, graduacio_vidres, tipus_montura, color_montura, color_vidre, preu_ulleres )
VALUES(1, 'Dos por uno', 1.5, 'flotant', 'black pearl', 'black', 50);
INSERT INTO ulleres (id_proveidor, marca_ulleres, graduacio_vidres, tipus_montura, color_montura, color_vidre, preu_ulleres )
VALUES(1, 'OG Classic', 1,'metàlica', 'metal', 'yellow', 100);
INSERT INTO ulleres (id_proveidor, marca_ulleres, graduacio_vidres, tipus_montura, color_montura, color_vidre, preu_ulleres )
VALUES(2, 'Endless Summer', 0.00, 'pasta', 'brown', 'black', 150);


INSERT INTO clients (nom_client, data_registre, telefon_client, email_client)
VALUES('Marc-André ter Stegen', '2014-08-01', 634567890, 'goalie@gmail.com');
INSERT INTO clients (nom_client, data_registre, telefon_client, email_client, id_referenciat)
VALUES('Héctor Bellerín', '2022-08-1', 645678901, 'thriftshopper@gmail.com', 1);
INSERT INTO clients (nom_client, data_registre, telefon_client, email_client, id_referenciat)
VALUES('Ansu Fati', '2012-01-01', 656789012, 'anssumane@gmail.com', 2);


INSERT INTO treballadors (nom_treballador, cognom_treballador)
VALUES('Juan Manuel', 'Sabat Cobo');
INSERT INTO treballadors (nom_treballador, cognom_treballador)
VALUES('Sarai', 'Amate Chacón');


INSERT INTO ventes (id_client, data_venta, id_ulleres, id_treballador )
VALUES(1, '2014-08-01', 1, 1);
INSERT INTO ventes (id_client, data_venta, id_ulleres, id_treballador )
VALUES(1, '2014-08-01', 2, 2);
INSERT INTO ventes (id_client, data_venta, id_ulleres, id_treballador )
VALUES(2, '2022-08-1', 2, 2);
INSERT INTO ventes (id_client, data_venta, id_ulleres, id_treballador )
VALUES(2, '2022-08-1', 3, 1);
INSERT INTO ventes (id_client, data_venta, id_ulleres, id_treballador )
VALUES(3, '2012-01-01', 3, 1);

-- Requisits òptica:

-- Llista el total de compres d’un client/a.
-- Llista les diferents ulleres que ha venut un empleat durant un any.
-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.

SELECT c.id_client, c.nom_client, v.* FROM clients AS c INNER JOIN ventes AS v ON c.id_client = v.id_client WHERE c.id_client = 1;
SELECT t.*, v.id_ulleres, u.* FROM treballadors AS t INNER JOIN ventes AS v ON t.id_treballador = v.id_treballador INNER JOIN ulleres AS u ON u.id_ulleres = v.id_ulleres WHERE t.id_treballador = 1 AND v.data_venta LIKE '2022%';
SELECT p.nom_proveidor, u.id_ulleres, v.data_venta FROM proveidors  AS p INNER JOIN ulleres AS u ON p.id_proveidor = u.id_proveidor INNER JOIN ventes AS v ON u.id_ulleres = v.id_ulleres;
