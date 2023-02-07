//  Nivell 1 - Exercici 1 - Òptica

db.dropDatabase()
db.createCollection('proveidor_optica');
db.createCollection('client_optica');

db.proveidor_optica.insertOne({
    _id: "1",
    nom_proveidor: "Alain afflelou",
    adreça_proveidor: "Carrer Franchute 1, Baixos, 08020, Espanya",
    telefon_proveidor: "612345678",
    fax_proveidor: "912345678",
    nif_proveidor: "A12345678",
    marques_ulleres: [
        "Dos por uno",
        "OG Classic"
    ]
});

db.proveidor_optica.insertOne({
    _id: "2",
    nom_proveidor: "Meller",
    adreça_proveidor: "Carrer Perill 2, Baixos, 08012, Espanya",
    telefon_proveidor: "623456789",
    fax_proveidor: "923456789",
    nif_proveidor: "B1245678",
    marques_ulleres: [
        "Endless Summer"
    ]
});


db.client_optica.insertOne({
    _id: "1",
    nom_client: "Marc-André ter Stegen",
    adreça_client: "Avinguda Collblanc 53, Barcelona, 08030, Espanya",
    telefon_client: "634567890",
    email_client: "goalie@gmail.com",
    data_registre: "2014-08-01",
    client_id_recomenat: "",
    compres: [
        {
            marca: "Dos por uno",
            graduacio: "1.5",
            montura: "flotant",
            color_montura: "black pearl",
            color_vidre: "black",
            preu: "50",
            venut_per_empleat:
            {
                id_empleat: "1",
                nom_empleat: "Juan Manuel Sabat Cobo"
            }
        },

        {
        
            marca: "OG Classic",
            graduacio: "1",
            montura: "metàlica",
            color_montura: "metal",
            color_vidre: "yellow",
            preu: "100",
            venut_per_empleat:
            {
                id_empleat: "2",
                nom_empleat: "Sarai Amate Chacón"
            }
        }
    ]
});

db.client_optica.insertOne({
    _id: "2",
    nom_client: "Héctor Bellerín",
    adreça_client: "Av do mar, Porto, 02080, Portugal",
    telefon_client: "645678901",
    email_client: "thriftshopper@gmail.com",
    data_registre: "12-032022-08-1-2022",
    client_id_recomenat: "1",
    compres: [
        {
        
            marca: "OG Classic",
            graduacio: "1",
            montura: "metàlica",
            color_montura: "metal",
            color_vidre: "yellow",
            preu: "100",
            venut_per_empleat:
            {
                id_empleat: "2",
                nom_empleat: "Sarai Amate Chacón"
            }
        },
        {
            marca: "Endless Summer",
            graduacio: "0.0",
            montura: "pasta",
            color_montura: "brown",
            color_vidre: "black",
            preu: "150",
            venut_per_empleat:
            {
                id_empleat: "1",
                nom_empleat: "Juan Manuel Sabat Cobo"
            }
        },

    ]
});
