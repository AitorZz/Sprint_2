// Nivell 1 - Exercici 1 - Pizzeria

db.dropDatabase();
db.createCollection("clients_pizzeria");
db.createCollection("productes_pizzeria");
db.createCollection("botigues_pizzeria");

db.clients_pizzeria.insertOne({
  _id: "1",
  nom_client: "Jaume",
  cognom_client: "Oliva",
  adreça_client: "Plaça del Mig 1",
  codi_postal_client: "25211",
  localitat_client: "Sant Guim de la Plana",
  província_client: "Lleida",
  telefon_client: "612345678",
  comandes: [
    {
      tipus_comanda: "local",
      informacio_tenda: {
        id_local: "1",
        id_empleat: "1",
      },
      data_comanda: "2023-01-20 21:00h",
      productes_comanda: ["1"],
      preu: "10",
    },
  ],
});

db.clients_pizzeria.insertOne({
  _id: "2",
  nom_client: "Arnau",
  cognom_client: "Esteban",
  adreça_client: "Carrer Major 5",
  codi_postal_client: "25211",
  localitat_client: "Sant Guim de la Plana",
  província_client: "Lleida",
  telefon_client: "623456789",
  comandes: [
    {
      tipus_comanda: "takeaway",
      informacio_tenda: {
        id_local: "1",
        id_empleat: "2",
      },
      data_comanda: "2023-01-21 21:20",
      productes_comanda: ["3"],
      preu: "10",
    },
  ],
});
db.clients_pizzeria.insertOne({
  _id: "3",
  nom_client: "Mireia",
  cognom_client: "Mercader",
  adreça_client: "Carrer Ponent 32",
  codi_postal_client: "25208",
  localitat_client: "Guissona",
  província_client: "Lleida",
  telefon_client: "634567890",
  comandes: [
    {
      tipus_comanda: "delivery",
      informacio_tenda: {
        id_local: "2",
        id_empleat: "2",
      },
      data_comanda: "2023-01-22 22:00",
      lliurament_comanda: "2023-01-22 22:44",
      productes_comanda: ["2"],
      preu: "15",
    },
  ],
});

db.productes_pizzeria.insertOne({
  _id: "1",
  nom_producte: "pizza margherita",
  descripcio_producte: ["tomàquet, mozzarela, orenga"],
  imatge_poducte: "photo.jpg",
  preu_producte: "10",
});

db.productes_pizzeria.insertOne({
  _id: "2",
  nom_producte: "Pizza Vegetal",
  descripcio_producte: [
    "tomàquet, sobrassada, olives negres, alcaparres, burrata, ceba morada, albahaca, salsa pesto",
  ],
  imatge_producte: "photo2.jpg",
  preu_producte: "15",
});

db.productes_pizzeria.insertOne({
  _id: "3",
  nom_producte: "hamburguesa clàssica",
  descripcio_producte: ["carn vadella, enciam, tompaquet, formatge"],
  imatge_producte: "photo3.jpg",
  preu_producte: "10",
});

db.productes_pizzeria.insertOne({
  _id: "4",
  nom_producte: "birra",
  descripcio_producte: "beguda",
  imatge_producte: "photo4.jpg",
  preu_producte: "2",
});

db.local_pizzeria.insertOne({
  _id: "1",
  nom_local: "Pizzes Torà",
  adreça_local: "Plaça de l'Esglèsia",
  codi_postal_local: "25750",
  localitat_local: "Torà",
  privincia_local: "Lleida",
  empleats: [
    {
      id_empleat: "1",
      nom_empleat: "Juanma",
      cognoms_empleat: "Sabat Cobo",
      tipus_treballador: "repartidor",
      telefon_empleat: "612345678",
      nif_empleat: "12345678A",
    },
    {
      id_empleat: "2",
      nom_empleat: "Sarai",
      cognoms_empleat: "Amate Chacón",
      tipus_treballador: "repartidor",
      telefon_empleat: "623456789",
      nif_empleat: "23456789B",
    },
    {
      id_empleat: "3",
      nom_empleat: "Gerard",
      cognoms_empleat: "Quer Torrefeta",
      tipus_treballador: "cuiner",
      telefon_empleat: "634567890",
      nif_empleat: "34567890C",
    },
  ],
});
