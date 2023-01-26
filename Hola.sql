
 -- Entrega 2.1, Exercici 1.1 

CREATE DATABASE òptica_cul_ampolla;

CREATE TABLE
    proveidor_òptica (
        id_proveidor INTEGER NOT NULL AUTO_INCREMENT,
        nom_proveidor TEXT,
        adreça_proveidor TEXT,
        telèfon_proveidor INTEGER,
        fax_proveidor INTEGER,
        nif_proveidor VARCHAR(9),
        PRIMARY KEY (id_proveidor)
    );

CREATE TABLE
    ulleres_òptica (
        id_proveidor INTEGER NOT NULL,
        FOREIGN KEY (id_proveidor) REFERENCES proveidor_òptica(id_proveidor),
        id_producte INTEGER NOT NULL AUTO_INCREMENT,
        marca_producte VARCHAR(500),
        graduacio_producte INTEGER,
        montura_producte VARCHAR(500),
        color_montura VARCHAR(500),
        color_vidre VARCHAR(500),
        preu_producte INTEGER,
        PRIMARY KEY (id_producte)
    );

CREATE TABLE
    client_òptica (
        id_client INTEGER NOT NULL AUTO_INCREMENT,
        nom_client TEXT,
        data_registre DATE,
        adreça_client TEXT,
        telèfon_client INTEGER,
        email_client TEXT,
        id_recomanat INTEGER,
        FOREIGN KEY (id_recomanat) REFERENCES client_òptica(id_client),
        PRIMARY KEY (id_client)
    );

CREATE TABLE
    traballadors_òptica (
        id_treballador INTEGER NOT NULL AUTO_INCREMENT,
        nom_trebalador VARCHAR(400),
        cognom_trebalador VARCHAR(1000),
        PRIMARY KEY (id_treballador)
    );

CREATE TABLE
    ventes_òptica (
        id_venta INTEGER NOT NULL AUTO_INCREMENT,
        id_client INTEGER NOT NULL,
        FOREIGN KEY (id_client) REFERENCES client_òptica(id_client),
        data_venta DATE,
        id_producte INTEGER NOT NULL,
        FOREIGN KEY (id_producte) REFERENCES ulleres_òptica(id_producte),
        id_treballador INTEGER NOT NULL,
        FOREIGN KEY (id_treballador) REFERENCES traballadors_òptica(id_treballador),
        PRIMARY KEY (id_venta)
    );