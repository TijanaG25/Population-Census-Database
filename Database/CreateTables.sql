CREATE TABLE regioni(
id INTEGER PRIMARY KEY IDENTITY(1,1),
naziv NVARCHAR (100) NOT NULL,
nazivEng NVARCHAR (100) NOT NULL
);
CREATE TABLE zanimanja(
id INTEGER PRIMARY KEY IDENTITY(1,1),
naziv NVARCHAR (100) NOT NULL,
nazivEng NVARCHAR (100) NOT NULL
);
CREATE TABLE delatnosti(
id INTEGER PRIMARY KEY IDENTITY(1,1),
naziv NVARCHAR (50) NOT NULL
);
CREATE TABLE nacionalnePripadnosti(
id INTEGER PRIMARY KEY IDENTITY(1,1),
naziv NVARCHAR (100) NOT NULL,
nazivEng NVARCHAR (100) NOT NULL
);
CREATE TABLE jezici(
id INTEGER PRIMARY KEY IDENTITY(1,1),
naziv NVARCHAR (100) NOT NULL
);
CREATE TABLE ekonomskiNeaktivni(
id INTEGER PRIMARY KEY IDENTITY(1,1),
ukupno INTEGER NOT NULL,
decaMladjaod15Godina INTEGER NOT NULL,
penzioneri INTEGER NOT NULL,
licaSaPrihodimaOdImovine INTEGER NOT NULL,
ucenici INTEGER NOT NULL,
licaKojaObavljajuKucneP INTEGER NOT NULL,
ostalo INTEGER NOT NULL
);
CREATE TABLE ekonomskiAktivni(
id INTEGER PRIMARY KEY IDENTITY(1,1),
ukupno INTEGER NOT NULL,
obavljajuZanimanje INTEGER NOT NULL,
ukupnoNezaposleni INTEGER NOT NULL,
nekadaRadili INTEGER NOT NULL,
trazePrviPosao INTEGER NOT NULL
);
CREATE TABLE polovi(
id INTEGER PRIMARY KEY IDENTITY(1,1),
naziv NVARCHAR(100) NOT NULL
);
CREATE TABLE godine(
id INTEGER PRIMARY KEY IDENTITY(1,1),
godine INTEGER NOT NULL
);
CREATE TABLE veroispovesti(
id INTEGER PRIMARY KEY IDENTITY(1,1),
naziv NVARCHAR(100) NOT NULL
);
CREATE TABLE pomZanimanjeDelatnosti (
idZanimanja INTEGER,
idDelatnosti INTEGER,
broj INTEGER NOT NULL,
idRegiona INTEGER NOT NULL,
PRIMARY KEY (idDelatnosti,idZanimanja, idRegiona),
FOREIGN KEY (idDelatnosti)REFERENCES delatnosti (id),
FOREIGN KEY (idZanimanja)REFERENCES zanimanja (id),
FOREIGN KEY (idRegiona)REFERENCES regioni (id) 
);
CREATE TABLE pomNPJezik (
idJezika INTEGER,
idNacionalnaPripadnost INTEGER,
broj INTEGER NOT NULL,
idRegiona INTEGER NOT NULL,
PRIMARY KEY (idJezika,idNacionalnaPripadnost),
FOREIGN KEY (idJezika) REFERENCES jezici (id),
FOREIGN KEY (idNacionalnaPripadnost) REFERENCES nacionalnePripadnosti(id),
FOREIGN KEY (idRegiona) REFERENCES regioni (id) 
);
CREATE TABLE pomEkonomski (
idNeaktivni INTEGER,
idAktivni INTEGER,
idRegiona INTEGER NOT NULL,
PRIMARY KEY (idNeaktivni,idAktivni, idRegiona),
FOREIGN KEY (idNeaktivni) REFERENCES ekonomskiNeaktivni (id),
FOREIGN KEY (idAktivni) REFERENCES ekonomskiAktivni(id),
FOREIGN KEY (idRegiona) REFERENCES regioni (id) 
);
CREATE TABLE pomNPVeroispovest (
idNacionalnePripadnosti INTEGER,
idVeroispovesti INTEGER,
idRegiona INTEGER NOT NULL,
broj INTEGER NOT NULL,
PRIMARY KEY (idNacionalnePripadnosti,idVeroispovesti, idRegiona),
FOREIGN KEY (idNacionalnePripadnosti) REFERENCES nacionalnePripadnosti(id),
FOREIGN KEY (idVeroispovesti) REFERENCES veroispovesti(id),
FOREIGN KEY (idRegiona) REFERENCES regioni (id) 
);
CREATE TABLE pomPolGodine (
idGodine INTEGER,
idPola INTEGER,
idRegiona INTEGER NOT NULL,
ukupno INTEGER NOT NULL,
PRIMARY KEY (idGodine,idPola,idRegiona),
FOREIGN KEY (idGodine) REFERENCES godine(id),
FOREIGN KEY (idPola) REFERENCES polovi(id),
FOREIGN KEY (idRegiona) REFERENCES regioni (id) 
);
