-- - Nivell 1 - Exercici 1 - Pizzeria

DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria;

CREATE TABLE ubicacions (
        localitat VARCHAR (50) UNIQUE,
        provincia VARCHAR (50) UNIQUE
    );

CREATE TABLE client (
        id_client INTEGER NOT NULL AUTO_INCREMENT,
        nom_client TEXT,
        cognoms_client TEXT,
        telefon_client INTEGER,
        adreça_client TEXT,
        CP_client INTEGER,
        localitat VARCHAR (50),
        FOREIGN KEY (localitat) REFERENCES ubicacions (localitat),
        provincia VARCHAR (50),
        FOREIGN KEY (provincia) REFERENCES ubicacions (provincia),
        PRIMARY KEY (id_client)
    );

CREATE TABLE locals (
        id_local INTEGER NOT NULL AUTO_INCREMENT,
        localitat_local TEXT,
        CP_local INTEGER,
        localitat VARCHAR (50),
        FOREIGN KEY (localitat) REFERENCES ubicacions (localitat),
        provincia VARCHAR (50),
        FOREIGN KEY (provincia) REFERENCES ubicacions (provincia),
        PRIMARY KEY(id_local)
    );

CREATE TABLE categories (
        id_categoria INTEGER NOT NULL AUTO_INCREMENT,
        nom_categoria VARCHAR(50),
        PRIMARY KEY (id_categoria)
    );

CREATE TABLE productes (
        id_producte INTEGER NOT NULL AUTO_INCREMENT,
        nom_producte TEXT,
        id_categoria INTEGER NOT NULL,
        FOREIGN KEY (id_categoria) REFERENCES Categories(id_categoria),
        descripcio_producte TEXT,
        imatge_producte VARCHAR (50),
        preu_producte FLOAT,
        PRIMARY KEY (id_producte)
    );

CREATE TABLE empleats(
        id_local INTEGER NOT NULL,
        id_empleat INTEGER NOT NULL AUTO_INCREMENT,
        nom_empleat VARCHAR(50),
        cognoms_empleat VARCHAR(50),
        nif_empleat INTEGER,
        telefon_empleat INTEGER,
        tipus_treballador VARCHAR(50),
        PRIMARY KEY (id_empleat)
    );

    CREATE TABLE ventes (
        id_client INTEGER NOT NULL,
        FOREIGN KEY (id_client) REFERENCES client(id_client),
        id_local INTEGER NOT NULL,
        FOREIGN KEY (id_local) REFERENCES locals(id_local),
        id_empleat INTEGER NOT NULL,
        FOREIGN KEY (id_empleat) REFERENCES empleats(id_empleat),
        id_comanda INTEGER NOT NULL AUTO_INCREMENT,
        data_comanda DATETIME NOT NULL,
        tipus_comanda VARCHAR (50),
        PRIMARY KEY(id_comanda)
    );

CREATE TABLE comandes(
        id_comanda INTEGER NOT NULL,
        FOREIGN KEY (id_comanda) REFERENCES ventes(id_comanda),
        id_producte INTEGER NOT NULL,
        FOREIGN KEY (id_producte) REFERENCES productes(id_producte)
    );

-- Inserts Pizzeria

INSERT INTO localitat  (localitat, provincia)
VALUES('Sant Guim de la Plana', 'Lleida');
INSERT INTO localitat  (localitat, provincia)
VALUES('Torà', 'Lleida');

INSERT INTO client (nom_client, cognoms_client, telefon_client, localitat, provincia)
VALUES('Jaume', 'Oliva', 612345678, 'Sant Guim de la Plana', 'Lleida');
INSERT INTO client (nom_client, cognoms_client, telefon_client, localitat, provincia)
VALUES('Arnau', 'Esteban', 623456789, 'Sant Guim de la Plana', 'Lleida');
INSERT INTO client (nom_client, cognoms_client, telefon_client, localitat, provincia)
VALUES('Mireia', 'Mercader', 634567890, 'Torà', 'Lleida');

INSERT INTO locals (localitat_local, CP_local, localitat, provincia)
VALUES("Plaça de l'Esglèsia", 25750, 'Torà', 'Lleida');
INSERT INTO locals (localitat_local, CP_local, localitat, provincia)
VALUES('Travesia del Mig', 25211, 'Sant Guim de la Plana', 'Lleida');

INSERT INTO Categories (nom_categoria, id_categoria)
VALUES('no vegetiariana', 1);
INSERT INTO Categories (nom_categoria, id_categoria)
VALUES('vegetariana', 2);

INSERT INTO productes (id_producte, nom_producte, Categories, descripcio_producte, imatge_producte, preu_producte)
VALUES(1, 'pizza margherita', 2, 'tomàquet, mozzarela, orenga', 'photo.jpg', 10);
INSERT INTO productes (id_producte, nom_producte, Categories, descripcio_producte, imatge_producte, preu_producte)
VALUES(2, 'pizza alcapone', 1, 'tomàquet, sobrassada, olives negres, alcaparres, burrata, ceba morada, albahaca, salsa pesto ', 'photo2.jpg', 15);
INSERT INTO productes (id_producte, nom_producte, descripcio_producte, imatge_producte, preu_producte)
VALUES(3, 'hamburguesa clàssica', 'carn vadella, enciam, tompaquet, formatge', 'photo3.jpg', 10);
INSERT INTO productes (id_producte, nom_producte, descripcio_producte, imatge_producte, preu_producte)
VALUES(4, 'birra', 'beguda', 'photo4.jpg', 2);
INSERT INTO productes (nom_producte, descripcio_producte, imatge_producte, preu_producte)


INSERT INTO empleats (id_local, nom_empleat, cognoms_empleat, tipus_treballador)
VALUES(1, 'Juanma', 'Sabat', 'repartidor');
INSERT INTO empleats (id_local, nom_empleat, cognoms_empleat, tipus_treballador)
VALUES(2, 'Sarai', 'Amate', 'repartidor');
INSERT INTO empleats (id_local, nom_empleat, cognoms_empleat, tipus_treballador)
VALUES(1, 'Gerard', 'Quer', 'cuiner');
INSERT INTO empleats (id_local, nom_empleat, cognoms_empleat, tipus_treballador)

INSERT INTO ventes (id_client, id_local, id_empleat, data_comanda, tipus_comanda)
VALUES(1, 1, 1, '2023-01-20 21:00h', 'local');
INSERT INTO ventes (id_client, id_local, id_empleat, data_comanda, tipus_comanda)
VALUES(2, 1, 2, '2023-01-21 21:20', 'takeaway');
INSERT INTO ventes (id_client, id_local, id_empleat, data_comanda, tipus_comanda)
VALUES(3, 2, 4, '2023-01-22 22:00', 'delivery');
INSERT INTO ventes (id_client, id_local, id_empleat, data_comanda, tipus_comanda)

INSERT INTO comandes (id_comanda, id_producte)
VALUES(1, 1);
INSERT INTO comandes (id_comanda, id_producte)
VALUES(2, 3);
INSERT INTO comandes (id_comanda, id_producte)
VALUES(3, 2);
INSERT INTO comandes (id_comanda, id_producte)



-- Requisits Pizzeria

--Llista quants productes de categoria 'Begudes' s'han venut en una determinada localitat.
-- Llista quantes comandes ha efectuat un determinat empleat/da.

SELECT  t.localidad FROM ventas v JOIN tiendas t ON t.id = v.id_tienda AND t.localidad = "Torà";
SELECT e.id_empleat, e.nom_empleat, e.cognoms_empleat, v.id_comanda FROM empleats AS e INNER JOIN ventes AS v ON e.id_empleat = v.id_empleat WHERE e.id_empleat = 1;

