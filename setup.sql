-- Database Section
-- ________________ 

create database campionatodicalcio;
use campionatodicalcio;


-- Tables Section
-- _____________ 

create table CALCIATORE (
     cognome varchar(20) not null,
     nome varchar(20) not null,
     data_di_nascita date not null,
     tessera_FIGC int not null,
     ruolo char(1) not null,
     constraint IDCALCIATORE primary key (tessera_FIGC));

create table CAMPIONATO (
     anno_calcistico varchar(9) not null,
     constraint IDCAMPIONATO primary key (anno_calcistico));

create table CONTRATTO (
     tessera_FIGC int not null,
     data_inizio date not null,
     data_fine date,
     ingaggio int not null,
     squadra varchar(20) not null,
     constraint IDCONTRATTO primary key (tessera_FIGC, data_inizio));

create table FORMAZIONE (
     codice int not null,
     squadra varchar(20) not null,
     constraint IDFORMAZIONE primary key (codice));

create table GIORNATA (
     anno_calcistico varchar(9) not null,
     numero int not null,
     constraint IDGIORNATA primary key (anno_calcistico, numero));

create table GOL (
     tessera_FIGC int not null,
     partita int not null,
     minuto int not null,
     autogol char not null,
     rigore char not null,
     constraint IDGOL primary key (partita, tessera_FIGC, minuto));

create table PARTECIPANTE (
     formazione int not null,
     tessera_FIGC int not null,
     subentrato int,
     ammonito1 int,
     ammonito2 int,
     espulso int,
     in_panchina char not null,
     constraint IDPARTECIPANTE primary key (tessera_FIGC, formazione));

create table PARTITA (
     codice int not null,
     data date not null,
     esito_casa int not null,
     esito_trasferta int not null,
     gol_casa int not null,
     gol_trasferta int not null,
     possesso_palla_casa int not null,
     possesso_palla_trasferta int not null,
     tiri_in_porta_casa int not null,
     tiri_in_porta_trasferta int not null,
     tiri_fuori_casa int not null,
     tiri_fuori_trasferta int not null,
     falli_casa int not null,
     falli_trasferta int not null,
     ammonizioni_casa int not null,
     ammonizioni_trasferta int not null,
     espulsioni_casa int not null,
     espulsioni_trasferta int not null,
     anno_calcistico varchar(9) not null,
     giornata int not null,
     squadra_casa varchar(20) not null,
     squadra_trasferta varchar(20) not null,
     formazione_casa int not null,
     formazione_trasferta int not null,
     constraint IDPARTITA primary key (codice));

create table SQUADRA (
     nome varchar(20) not null,
     colori_sociali varchar(20) not null,
     constraint IDSQUADRA primary key (nome));


-- Constraints Section
-- ___________________ 

alter table CONTRATTO add constraint FKstipulazione
     foreign key (squadra)
     references SQUADRA (nome);

alter table CONTRATTO add constraint FKsottoscrizione
     foreign key (tessera_FIGC)
     references CALCIATORE (tessera_FIGC);

alter table FORMAZIONE add constraint FKschieramento
     foreign key (squadra)
     references SQUADRA (nome);

alter table GIORNATA add constraint FKsuddivisione
     foreign key (anno_calcistico)
     references CAMPIONATO (anno_calcistico);

alter table GOL add constraint FKmarcatura
     foreign key (partita)
     references PARTITA (codice);

alter table GOL add constraint FKsegna
     foreign key (tessera_FIGC)
     references CALCIATORE (tessera_FIGC);

alter table PARTECIPANTE add constraint FKPAR_CAL
     foreign key (tessera_FIGC)
     references CALCIATORE (tessera_FIGC);

alter table PARTECIPANTE add constraint FKPAR_FOR
     foreign key (formazione)
     references FORMAZIONE (codice);

alter table PARTITA add constraint FKsvolgimento
     foreign key (anno_calcistico, giornata)
     references GIORNATA (anno_calcistico, numero);

alter table PARTITA add constraint FKospita
     foreign key (squadra_casa)
     references SQUADRA (nome);

alter table PARTITA add constraint FKospitata
     foreign key (squadra_trasferta)
     references SQUADRA (nome);

alter table PARTITA add constraint FKgioca
     foreign key (formazione_casa)
     references FORMAZIONE (codice);

alter table PARTITA add constraint FKR
     foreign key (formazione_trasferta)
     references FORMAZIONE (codice);
	 
-- Creazione campionato 
INSERT INTO CAMPIONATO VALUES ('2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (1, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (2, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (3, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (4, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (5, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (6, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (7, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (8, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (9, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (10, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (11, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (12, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (13, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (14, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (15, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (16, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (17, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (18, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (19, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (20, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (21, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (22, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (23, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (24, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (25, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (26, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (27, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (28, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (29, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (30, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (31, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (32, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (33, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (34, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (35, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (36, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (37, '2019/2020');
INSERT INTO GIORNATA(numero, anno_calcistico) VALUES (38, '2019/2020');

-- Creazione delle squadre
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Atalanta', 'Neroazzurri');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Bologna', 'Rossoblu');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Brescia', 'Biancoblu');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Cagliari', 'Rossoblu');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Fiorentina', 'Viola');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Genoa', 'Rossoblu');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Inter', 'Neroazzurri');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Juventus', 'Bianconeri');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Lazio', 'Biancoazzurri');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Lecce', 'Giallorossi');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Milan', 'Rossoneri');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Napoli', 'Azzurri');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Parma', 'Gialloblu');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Roma', 'Giallorossi');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Sampdoria', 'Blucerchiati');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Sassuolo', 'Neroverdi');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('SPAL', 'Biancoazzurri');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Torino', 'Granata');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Udinese', 'Bianconeri');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Verona', 'Gialloblu');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Empoli', 'Azzurri');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Chievo', 'Gialloblu');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Benevento', 'Giallorossi');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Crotone', 'Rossoblu');
INSERT INTO SQUADRA (nome, colori_sociali) VALUES ('Spezia', 'Bianconeri');

-- Inserimento calciatori
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Gollini', 'Pierluigi', '19950318', 1, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Rossi', 'Francesco', '19910427', 2, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Sportiello', 'Marco', '19920510', 3, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Da Costa', 'Angelo', '19831112', 4, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Fallou', 'Sarr', '19970105', 5, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Skorupski', 'Lukasz', '19910505', 6, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Alfonso', 'Enrico', '19880504', 7, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Andrenacci', 'Lorenzo', '19950102', 8, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Joronen', 'Jesse', '19930321', 9, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Cragno', 'Alessio', '19940628', 10, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Olsen', 'Robin', '19900108', 11, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Rafael', 'Pinheiro', '19820303', 12, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Brancolini', 'Federico', '20010714', 13, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Dragowski', 'Bartlomiej', '19970819', 14, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Terracciano', 'Pietro', '19900308', 15, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ichazo', 'Salvador', '19920126', 16, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Marchetti', 'Federico', '19830207', 17, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Perin', 'Mattia', '19921110', 18, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Berni', 'Tommaso', '19830306', 19, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Handanovic', 'Samir', '19840714', 20, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Padelli', 'Daniele', '19851025', 21, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Buffon', 'Gianluigi', '19780128', 22, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Pinsoglio', 'Carlo', '19900316', 23, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Szczesny', 'Vojciech', '19900418', 24, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Guerrieri', 'Guido', '19960225', 25, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Proto', 'Silvio', '19830523', 26, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Strakosha', 'Thomas', '19950319', 27, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Gabriel', 'Ferreira', '19950318', 28, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Sava', 'Razvan', '19950318', 29, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Vigorito', 'Mauro', '19950318', 30, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Begovic', 'Asmir', '19870620', 31, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Donnarumma', 'Antonio', '19900707', 32, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Donnarumma', 'Gianluigi', '19990225', 33, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Karnezis', 'Orestis', '19850711', 34, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Meret', 'Alex', '19970322', 35, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ospina', 'David', '19880831', 36, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Colombi', 'Simone', '19910701', 37, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Radu', 'Ionut', '19970528', 38, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Sepe', 'Luigi', '19910508', 39, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Fuzato', 'Daniel', '19970704', 40, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Lopez', 'Pau', '19941213', 41, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Mirante', 'Antonio', '19830708', 42, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Audero', 'Emil', '19970118', 43, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Falcone', 'Wladimiro', '19950412', 44, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Seculin', 'Andrea', '19900714', 45, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Consigli', 'Andrea', '19870127', 46, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Pegolo', 'Gianluca', '19810325', 47, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Turati', 'Stefano', '20010905', 48, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Berisha', 'Erit', '19890310', 49, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Letica', 'Karlo', '19970211', 50, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Thiam', 'Demba', '19980309', 51, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Rosati', 'Antonio', '19830626', 52, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Sirigu', 'Salvatore', '19870112', 53, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ujkani', 'Samir', '19880705', 54, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Musso', 'Juan', '19940506', 55, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Nicolas', 'Andrade', '19880412', 56, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Perisan', 'Samuele', '19970821', 57, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Berardi', 'Alessandro', '19910116', 58, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Radunovic', 'Boris', '19960526', 59, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Silvestri', 'Marco', '19910302', 60, 'P');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Caldara', 'Mattia', '19940505', 61, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Sutalo', 'Bosko', '20000101', 62, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Toloi', 'Rafael', '19901010', 63, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Czyborra', 'Lennart', '19990503', 64, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Gosens', 'Robin', '19940705', 65, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Djimsiti', 'Berat', '19930219', 66, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Castagne', 'Timothy', '19951205', 67, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Bellanova', 'Raoul', '20000517', 68, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Hateboer', 'Hans', '19940109', 69, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Denswil', 'Stefano', '19930507', 70, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Bani', 'Mattia', '19931210', 71, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Tomiyasu', 'Takehiro', '19981105', 72, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Mbaye', 'Ibrahima', '19941119', 73, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Danilo', 'Larangeira', '19840510', 74, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Corbo', 'Gabriele', '20000111', 75, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Bonini', 'Federico', '20010806', 76, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Dijks', 'Mitchell', '19930209', 77, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Sabelli', 'Stefano', '19930113', 78, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Mateju', 'Ales', '19960603', 79, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Gastaldello', 'Daniele', '19830625', 80, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Chancellor', 'Jhon', '19920102', 81, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Cistana', 'Andrea', '19970401', 82, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Mangraviti', 'Massimiliano', '19980124', 83, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Martella', 'Bruno', '19920814', 84, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Semprini', 'Alessandro', '19980224', 85, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Papetti', 'Andrea', '20020703', 86, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Mattiello', 'Federico', '19950714', 87, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Cacciatore', 'Fabrizio', '19861008', 88, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Klavan', 'Ragnar', '19851030', 89, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Pisacane', 'Fabio', '19860128', 90, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Lykogiannis', 'Charalampos', '19931022', 91, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ceppitelli', 'Luca', '19890811', 92, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Faragò', 'Paolo', '19930212', 93, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Pellegrini', 'Luca', '19990307', 94, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Walukiewicz', 'Sebastian', '20000405', 95, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Igor', 'Julio dos Santos', '19980207', 96, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Milenkovi?', 'Nikola', '19971012', 97, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ceccherini', 'Federico', '19920511', 98, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Pezzella', 'Germán', '19910627', 99, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Lirola', 'Pol', '19970813', 100, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Cáceres', 'Martín', '19870407', 101, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Venuti', 'Lorenzo', '19950412', 102, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Dalbert', 'Henrique', '19930908', 103, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Terzi?', 'Aleksa', '19990817', 104, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Zapata', 'Cristián', '19860930', 105, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Barreca', 'Antonio', '19950318', 106, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Criscito', 'Domenico', '19861230', 107, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Goldaniga', 'Edoardo', '19931102', 108, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Biraschi', 'Davide', '19940702', 109, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Romero', 'Cristian', '19980427', 110, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ankersen', 'Peter', '19900922', 111, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ghiglione', 'Paolo', '19970202', 112, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Paja?', 'Marko', '19930511', 113, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Masiello', 'Andrea', '19860205', 114, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Soumaoro', 'Adama', '19920618', 115, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Godín', 'Diego', '19860216', 116, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('De Vrij', 'Stefan', '19920205', 117, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ranocchia', 'Andrea', '19880216', 118, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Pirola', 'Lorenzo', '20020220', 119, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('D''Ambrosio', 'Danilo', '19880909', 120, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Škriniar', 'Milan', '19950211', 121, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Bastoni', 'Alessandro', '19990413', 122, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('De Sciglio', 'Mattia', '19921020', 123, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Chiellini', 'Giorgio', '19840814', 124, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('De Ligt', 'Matthijs', '19990812', 125, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Sandro', 'Alex', '19910126', 126, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Danilo', 'Luiz da Silva', '19910715', 127, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Bonucci', 'Leonardo', '19870501', 128, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Rugani', 'Daniele', '19940729', 129, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Demiral', 'Merih', '19980305', 130, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Felipe', 'Luiz', '19970322', 131, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Patric', 'Gabarrón', '19930417', 132, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Lukaku', 'Jordan', '19940725', 133, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Bastos', 'Jacinto Quissanga', '19910327', 134, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Radu', 'Stefan', '19861022', 135, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Acerbi', 'Francesco', '19880210', 136, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Vavro', 'Denis', '19960410', 137, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Maruši?', 'Adam', '19921017', 138, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Vera', 'Brayan', '19990115', 139, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Lucioni', 'Fabio', '19870925', 140, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Paz', 'Nehuén', '19930428', 141, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Donati', 'Giulio', '19900205', 142, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Rossettini', 'Luca', '19850509', 143, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Meccariello', 'Biagio', '19910327', 144, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Calderoni', 'Marco', '19890218', 145, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Rispoli', 'Andrea', '19880929', 146, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Dell Orco', 'Cristian', '19940210', 147, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Calabria', 'Davide', '19961206', 148, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Conti', 'Andrea', '19940302', 149, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Romagnoli', 'Alessio', '19950112', 150, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Hernández', 'Theo', '19971006', 151, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Musacchio', 'Mateo', '19900826', 152, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Kjaer', 'Simon', '19890326', 153, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Duarte', 'Léo', '19960717', 154, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Gabbia', 'Matteo', '19991021', 155, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Malcuit', 'Kévin', '19910731', 156, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Rui', 'Mário', '19910527', 157, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Luperto', 'Sebastiano', '19960906', 158, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Maksimovi?', 'Nikola', '19911125', 159, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Di Lorenzo', 'Giovanni', '19930804', 160, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Hysaj', 'Elseid', '19940202', 161, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Koulibaly', 'Kalidou', '19910620', 162, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ghoulam', 'Faouzi', '19910201', 163, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Manolas', 'Kostas', '19910614', 164, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Iacoponi', 'Simone', '19870430', 165, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Dermaku', 'Kastriot', '19920115', 166, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Regini', 'Vasco', '19900909', 167, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Laurini', 'Vincent', '19890610', 168, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Alves', 'Bruno', '19811127', 169, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Gagliolo', 'Riccardo', '19900428', 170, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Darmian', 'Matteo', '19891202', 171, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Pezzella', 'Giuseppe', '19971129', 172, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Zappacosta', 'Davide', '19920611', 173, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Jesus', 'Juan', '19910610', 174, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Smalling', 'Chris', '19891122', 175, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Kolarov', 'Aleksandar', '19851110', 176, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Cetin', 'Mert', '19970101', 177, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Santon', 'Davide', '19910102', 178, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Fazio', 'Federico', '19870317', 179, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Mancini', 'Gianluca', '19960417', 180, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Peres', 'Bruno', '19900301', 181, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Spinazzola', 'Leonardo', '19930325', 182, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ibañez', 'Roger', '19981123', 183, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Augello', 'Tommaso', '19940830', 184, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Chabot', 'Julian', '19980212', 185, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Depaoli', 'Fabio', '19970424', 186, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Colley', 'Omar', '19921024', 187, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Tonelli', 'Lorenzo', '19900117', 188, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Bereszy?ski', 'Bartosz', '19920712', 189, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ferrari', 'Alex', '19940701', 190, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Murru', 'Nicola', '19941216', 191, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Yoshida', 'Maya', '19880824', 192, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Marlon', 'Santos', '19950907', 193, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Rogério', 'Oliveira', '19980113', 194, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Peluso', 'Federico', '19840120', 195, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Muldur', 'Mert', '19990403', 196, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Romagna', 'Filippo', '19970526', 197, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Chiriches', 'Vlad', '19891114', 198, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Toljan', 'Jeremy', '19940808', 199, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Magnani', 'Giangiacomo', '19951004', 200, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ferrari', 'Gian Marco', '19920515', 201, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Tripaldelli', 'Alessandro', '19990209', 202, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Kyriakopoulos', 'Georgios', '19960205', 203, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Cionek', 'Thiago', '19860421', 204, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Reca', 'Arkadiusz', '19950617', 205, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Vicari', 'Francesco', '19940803', 206, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Sala', 'Jacopo', '19911205', 207, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Felipe', 'Dal Bello', '19840731', 208, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Tomovic', 'Nenad', '19870830', 209, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Bonifazi', 'Kevin', '19960519', 210, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Salamon', 'Bartosz', '19910501', 211, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Zukanovic', 'Ervin', '19870211', 212, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Lyanco', 'Vojnovic', '19970201', 213, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Izzo', 'Armando', '19920302', 214, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ansaldi', 'Cristian', '19860920', 215, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Singo', 'Wilfried', '20001225', 216, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('De Silvestri', 'Lorenzo', '19880523', 217, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Djidji', 'Koffi', '19921130', 218, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Nkoulou', 'Nicolas', '19900327', 219, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Aina', 'Ola', '19961008', 220, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Bremer', 'Gleison', '19970318', 221, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Samir', 'Caetano', '19941205', 222, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Prodl', 'Sebastian', '19870621', 223, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Troost-Ekong', 'William', '19930901', 224, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Nuytinck', 'Bram', '19900504', 225, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('ter Avest', 'Hidde', '19970520', 226, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Stryger Larsen', 'Jens', '19910221', 227, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Becao', 'Rodrigo', '19960119', 228, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('De Maio', 'Sebastien', '19870305', 229, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Faraoni', 'Davide', '19911025', 230, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Rrahmani', 'Amir', '19940224', 231, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Bocchetti', 'Salvatore', '19861130', 232, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Gunter', 'Koray', '19940816', 233, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Dimarco', 'Federico', '19971110', 234, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Kumbulla', 'Marash', '20000208', 235, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Dawidowicz', 'Pawel', '19950520', 236, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Empereur', 'Alan', '19940310', 237, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Adjapong', 'Claud', '19980506', 238, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Palomino', 'Jose Luis', '19900105', 503, 'D');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Tameze', 'Adrien', '19941104', 239, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Freuler', 'Remo', '19920415', 240, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('de Roon', 'Marten', '19910329', 241, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Malinovskyj', 'Ruslan', '19930504', 242, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Pasalic', 'Mario', '19950209', 243, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Medel', 'Gary', '19870803', 244, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Domínguez', 'Nicolas', '19980628', 245, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Krej?í', 'Ladislav', '19920705', 246, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Poli', 'Andrea', '19890929', 247, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Soriano', 'Roberto', '19910208', 248, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Schouten', 'Jerdy', '19970112', 249, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Svanberg', 'Mattias', '19990105', 250, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Tonali', 'Sandro', '20000508', 251, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ndoj', 'Emanuele', '19961120', 252, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Zmrhal', 'Jaromir', '19930802', 253, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Skrabb', 'Simon', '19950119', 254, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Viviani', 'Mattia', '20000904', 255, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Bisoli', 'Dimitri', '19940325', 256, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Dessena', 'Daniele', '19870510', 257, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Bjarnason', 'Birkir', '19880527', 258, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Rômulo', 'Souza', '19870522', 259, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Nainggolan', 'Radja', '19880504', 260, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Rog', 'Marko', '19950719', 261, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Cigarini', 'Luca', '19860620', 262, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Pedro', 'Joao', '19920309', 263, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Birsa', 'Valter', '19860807', 264, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Oliva', 'Christian', '19960601', 265, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Nandez', 'Nahitan', '19951228', 266, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ionita', 'Artur', '19900817', 267, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Badelj', 'Milan', '19890225', 268, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ribery', 'Franck', '19830407', 269, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Castrovilli', 'Gaetano', '19970217', 270, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ghezzal', 'Rachid', '19920509', 271, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Agudelo', 'Kevin', '19981114', 272, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Benassi', 'Marco', '19940908', 273, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Pulgar', 'Erick', '19940115', 274, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Duncan', 'Alfred', '19930310', 275, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Lerager', 'Lukas', '19930712', 276, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Jagiello', 'Filip', '19970808', 277, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Eriksson', 'Sebastian', '19890131', 278, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Schone', 'Lasse', '19860527', 279, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Radovanovic', 'Ivan', '19880829', 280, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Sturaro', 'Stefano', '19930309', 281, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Cassata', 'Francesco', '19970716', 282, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Behrami', 'Valon', '19850419', 283, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Gagliardini', 'Roberto', '19940407', 284, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Vecino', 'Matias', '19910824', 285, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Moses', 'Victor', '19901212', 286, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Sensi', 'Stefano', '19950805', 287, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Young', 'Ashley', '19850709', 288, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Asamoah', 'Kwadwo', '19881209', 289, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Valero', 'Borja', '19850112', 290, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Barella', 'Nicolò', '19970207', 291, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Eriksen', 'Christian', '19920214', 292, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Agoumé', 'Lucien', '20020209', 293, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Biraghi', 'Cristiano', '19920901', 294, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Brozovic', 'Marcelo', '19921116', 295, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Candreva', 'Antonio', '19870228', 296, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Pjanic', 'Miralem', '19900402', 297, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Khedira', 'Sami', '19870404', 298, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ramsey', 'Aaron', '19901226', 299, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Matuidi', 'Blaise', '19870409', 300, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Rabiot', 'Adrien', '19950403', 301, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Bentancur', 'Rodrigo', '19970625', 302, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Leiva', 'Lucas', '19870109', 303, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Anderson', 'Djavan', '19950421', 304, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Alberto', 'Luis', '19920928', 305, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Parolo', 'Marco', '19850125', 306, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Lulic', 'Senad', '19860118', 307, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Milinkovic-Savic', 'Sergej', '19950227', 308, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Jony', 'Rodriguez', '19910709', 309, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Anderson', 'André', '19990923', 310, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Lazzari', 'Manuel', '19931129', 311, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Cataldi', 'Danilo', '19940806', 312, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Petriccione', 'Jacopo', '19950222', 313, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Mancosu', 'Marco', '19880822', 314, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Sachov', 'Jevhen', '19901130', 315, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Deiola', 'Alessandro', '19950801', 316, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Saponara', 'Riccardo', '19911221', 317, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Majer', 'Zan', '19920725', 318, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Barak', 'Antonin', '19941203', 319, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Tachtsidis', 'Panagiotis', '19910215', 320, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Bennacer', 'Ismael', '19971201', 321, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Bonaventura', 'Giacomo', '19890822', 322, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Calhano?lu', 'Hakan', '19940208', 323, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Biglia', 'Lucas', '19860130', 324, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Krunic', 'Rade', '19931007', 325, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Paquetá', 'Lucas', '19970827', 326, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Saelemaekers', 'Alexis', '19990627', 327, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Kessié', 'Franck', '19961219', 328, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Laxalt', 'Diego', '19930207', 329, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Demme', 'Diego', '19911121', 330, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Allan', 'Marques', '19910108', 331, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ruiz', 'Fabián', '19960403', 332, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Elmas', 'Eljif', '19990924', 333, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Zieli?ski', 'Piotr', '19940520', 334, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Younes', 'Amin', '19930806', 335, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Lobotka', 'Stanislav', '19941125', 336, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Grassi', 'Alberto', '19950307', 337, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Hernani', 'Azevedo Júnior', '19940327', 338, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Brugman', 'Gastón', '19920907', 339, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Barillà', 'Antonino', '19880401', 340, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Kurtic', 'Jasmin', '19890110', 341, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Scozzarella', 'Matteo', '19880605', 342, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Kucka', 'Juraj', '19870226', 343, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Kulusevski', 'Dejan', '20000425', 344, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Cristante', 'Bryan', '19950303', 345, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Pellegrini', 'Lorenzo', '19960619', 346, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Villar', 'Gonzalo', '19980323', 347, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Veretout', 'Jordan', '19930301', 348, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Zaniolo', 'Nicolò', '19990702', 349, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Pastore', 'Javier', '19890620', 350, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Diawara', 'Amadou', '19970717', 351, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Mkhitaryan', 'Henrikh', '19890121', 352, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Vieira', 'Ronaldo', '19980719', 353, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ekdal', 'Albin', '19890728', 354, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Linetty', 'Karol', '19950202', 355, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Barreto', 'Edgar', '19840715', 356, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Jankto', 'Jakub', '19960119', 357, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Askildsen', 'Kristoffer', '20010109', 358, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Thorsby', 'Morten', '19960505', 359, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Léris', 'Mehdi', '19980523', 360, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Bertolacci', 'Andrea', '19910111', 361, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Magnanelli', 'Francesco', '19841112', 362, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Boga', 'Jérémie', '19970103', 363, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('?uricic', 'Filip', '19920130', 364, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Obiang', 'Pedro', '19920327', 365, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Traorè', 'Hamed Junior', '20000216', 366, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Haraslín', 'Lukas', '19960526', 367, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Bourabia', 'Mehdi', '19910807', 368, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Locatelli', 'Manuel', '19980108', 369, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Valdifiori', 'Mirko', '19860421', 370, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Missiroli', 'Simone', '19860523', 371, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Valoti', 'Mattia', '19930906', 372, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Murgia', 'Alessandro', '19960809', 373, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Dabo', 'Bryan', '19920218', 374, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Castro', 'Lucas', '19890409', 375, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Strefezza', 'Gabriel', '19970418', 376, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Di Francesco', 'Federico', '19940614', 377, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('D Alessandro', 'Marco', '19910217', 378, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Fares', 'Mohamed', '19960215', 379, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Baselli', 'Daniele', '19920312', 380, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Berenguer', 'Alejandro', '19950704', 381, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Lukic', 'Sasa', '19960813', 382, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Meité', 'Soualiho', '19940317', 383, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Rincón', 'Tomas', '19880113', 384, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Fofana', 'Seko', '19950507', 385, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Jajalo', 'Mato', '19880525', 386, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('De Paul', 'Rodrigo', '19940524', 387, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Walace', 'Souza Silva', '19950404', 388, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Sema', 'Ken', '19930930', 389, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Mandragora', 'Rolando', '19970629', 390, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Zeegelaar', 'Marvin', '19900812', 391, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Veloso', 'Miguel', '19860511', 392, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Badu', 'Emmanuel', '19901202', 393, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Eysseric', 'Valentin', '19920325', 394, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Verre', 'Valerio', '19940111', 395, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Zaccagni', 'Mattia', '19950616', 396, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Danzi', 'Andrea', '19990225', 397, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Pessina', 'Matteo', '19970421', 398, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Amrabat', 'Sofyan', '19960821', 399, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Lazovic', 'Darko', '19900915', 400, 'C');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Muriel', 'Luis', '19910416', 401, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Gómez', 'Alejandro', '19880215', 402, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ilicic', 'Josip', '19880129', 403, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Colley', 'Ebrima', '20000201', 404, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Zapata', 'Duván', '19910401', 405, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Orsolini', 'Riccardo', '19970124', 406, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Santander', 'Federico', '19910604', 407, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Sansone', 'Nicola', '19910910', 408, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Skov Olsen', 'Andreas', '19991229', 409, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Palacio', 'Rodrigo', '19820205', 410, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Juwara', 'Musa', '20011226', 411, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Barrow', 'Musa', '19981114', 412, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Spalek', 'Nikolas', '19970212', 413, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Donnarumma', 'Alfredo', '19901130', 414, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Torregrossa', 'Ernesto', '19920628', 415, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ayé', 'Florian', '19970119', 416, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Balotelli', 'Mario', '19900812', 417, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Paloschi', 'Alberto', '19900104', 418, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Pereiro', 'Gaston', '19950611', 419, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ragatzu', 'Daniele', '19910921', 420, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Pavoletti', 'Leonardo', '19881126', 421, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Simeone', 'Giovanni', '19950705', 422, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Kouamé', 'Christian', '19971206', 423, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Sottil', 'Riccardo', '19990603', 424, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Chiesa', 'Federico', '19971025', 425, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Vlahovic', 'Dusan', '20000128', 426, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Cutrone', 'Patrick', '19980103', 427, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Sanabria', 'Antonio', '19960304', 428, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Falque', 'Iago', '19900104', 429, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Pandev', 'Goran', '19830727', 430, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Destro', 'Mattia', '19910320', 431, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Favilli', 'Andrea', '19970517', 432, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Pinamonti', 'Andrea', '19990519', 433, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Sánchez', 'Alexis', '19881219', 434, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Lukaku', 'Romelu', '19930513', 435, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Martínez', 'Lautaro', '19970822', 436, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Esposito', 'Sebastiano', '20020702', 437, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ronaldo', 'Cristiano', '19850205', 438, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Dybala', 'Paulo', '19931115', 439, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Costa', 'Douglas', '19900914', 440, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Cuadrado', 'Juan', '19880526', 441, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Higuain', 'Gonzalo', '19871210', 442, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Bernardeschi', 'Federico', '19940216', 443, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Correa', 'Joaquín', '19940813', 444, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Immobile', 'Ciro', '19900220', 445, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Caicedo', 'Felipe', '19880905', 446, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Adekanye', 'Bobby', '19990817', 447, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Lapadula', 'Gianluca', '19900207', 448, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Falco', 'Filippo', '19920211', 449, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Farias', 'Diego', '19900510', 450, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Babacar', 'Khouma El', '19930317', 451, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Castillejo', 'Samu', '19950118', 452, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Leão', 'Rafael', '19990610', 453, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Rebic', 'Ante', '19930921', 454, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ibrahimovi?', 'Zlatan', '19811003', 455, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Maldini', 'Daniel', '20011011', 456, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Callejón', 'José María', '19870211', 457, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Llorente', 'Fernando', '19850226', 458, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Lozano', 'Hirving', '19950730', 459, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Mertens', 'Dries', '19870506', 460, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Politano', 'Matteo', '19930803', 461, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Insigne', 'Lorenzo', '19910604', 462, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Milik', 'Arkadiusz', '19940228', 463, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Karamoh', 'Yann', '19980708', 464, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Inglese', 'Roberto', '19911112', 465, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Cornelius', 'Andreas', '19930316', 466, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Caprari', 'Gianluca', '19930730', 467, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Siligardi', 'Luca', '19880126', 468, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Sprocati', 'Mattia', '19930428', 469, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Perotti', 'Diego', '19880726', 470, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Džeko', 'Edin', '19860317', 471, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Under', 'Cengiz', '19970714', 472, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Kalinic', 'Nikola', '19880105', 473, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Pérez', 'Carles', '19980216', 474, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Kluivert', 'Justin', '19990505', 475, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Caputo', 'Francesco', '19870806', 476, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Defrel', 'Grégoire', '19910617', 477, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Raspadori', 'Giacomo', '20000218', 478, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Berardi', 'Domenico', '19940801', 479, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Floccari', 'Sergio', '19811112', 480, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Cerri', 'Alberto', '19960416', 481, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Petagna', 'Andrea', '19950630', 482, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Belotti', 'Andrea', '19931220', 483, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Zaza', 'Simone', '19910625', 484, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Edera', 'Simone', '19970109', 485, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Millico', 'Vincenzo', '20000812', 486, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Verdi', 'Simone', '19920712', 487, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Okaka', 'Stefano', '19890809', 488, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Lasagna', 'Kevin', '19920810', 489, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Nestorovski', 'Ilija', '19900312', 490, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Teodorczyk', 'Lukasz', '19910603', 491, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Stepi?ski', 'Mariusz', '19950512', 492, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Di Carmine', 'Samuel', '19880929', 493, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Pazzini', 'Giampaolo', '19840802', 494, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Borini', 'Fabio', '19910329', 495, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Salcedo', 'Eddie', '20011001', 496, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Bonazzoli', 'Federico', '19970521', 497, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Ramirez', 'Gaston', '19901202', 498, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('La Gumina', 'Antonino', '19960306', 499, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Maroni', 'Gonzalo', '19990318', 500, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Gabbiadini', 'Manolo', '19911126', 501, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Quagliarella', 'Fabio', '19830131', 502, 'A');
INSERT INTO CALCIATORE (cognome, nome, data_di_nascita, tessera_FIGC, ruolo) VALUES ('Gervinho', 'Lombe Yao', '19870527', 504, 'A');

-- Inserimento contratti
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (1, '2018-07-01', '2023-06-30', 500000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (2, '2017-01-23', '2021-06-30', 100000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (3, '2019-07-01', '2021-06-30', 350000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (4, '2015-01-20', '2021-06-30', 350000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (5, '2019-07-01', '2020-06-30', 100000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (6, '2018-07-01', '2023-06-30', 900000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (7, '2018-07-09', '2021-06-30', 200000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (8, '2017-07-01', '2021-06-30', 400000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (9, '2019-07-11', '2022-06-30', 500000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (10, '2014-07-12', '2024-06-30', 1000000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (11, '2019-09-30', '2020-06-30', 500000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (12, '2016-07-08', '2020-06-30', 300000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (13, '2019-07-01', '2022-06-30', 50000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (14, '2016-07-04', '2023-06-30', 750000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (15, '2019-07-07', '2021-06-30', 300000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (16, '2020-02-14', '2020-06-30', 100000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (17, '2018-07-01', '2020-06-30', 700000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (18, '2020-01-02', '2021-06-30', 800000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (19, '2014-07-02', '2020-06-30', 200000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (20, '2012-07-09', '2022-06-30', 3200000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (21, '2017-07-01', '2021-06-30', 500000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (22, '2019-07-04', '2021-06-30', 1500000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (23, '2017-07-01', '2021-06-30', 300000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (24, '2019-07-19', '2024-06-30', 3500000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (25, '2017-07-01', '2020-06-30', 300000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (26, '2018-07-04', '2021-06-30', 1000000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (27, '2016-07-01', '2022-06-30', 1200000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (28, '2019-07-03', '2021-06-30', 700000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (29, '2020-01-22', '2020-06-30', 50000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (30, '2018-07-31', '2022-06-30', 500000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (31, '2020-01-13', '2020-06-30', 500000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (32, '2017-07-12', '2021-06-30', 1000000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (33, '2015-07-01', '2021-06-30', 6000000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (34, '2019-07-01', '2021-06-30', 500000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (35, '2019-07-01', '2023-06-30', 1000000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (36, '2019-07-04', '2022-06-30', 1400000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (37, '2019-07-11', '2022-06-30', 180000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (38, '2020-01-30', '2020-06-30', 800000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (39, '2018-07-09', '2020-06-30', 800000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (40, '2018-07-09', '2023-06-30', 500000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (41, '2019-07-10', '2024-06-30', 3000000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (42, '2018-07-01', '2021-06-30', 1000000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (43, '2019-07-01', '2023-06-30', 800000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (44, '2019-07-01', '2024-06-30', 80000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (45, '2019-09-02', '2020-06-30', 180000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (46, '2014-09-01', '2022-06-30', 1000000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (47, '2013-09-02', '2021-06-30', 500000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (48, '2019-10-01', '2024-06-30', 150000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (49, '2019-07-06', '2020-06-30', 1000000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (50, '2019-08-20', '2020-06-30', 300000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (51, '2019-07-01', '2020-06-30', 150000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (52, '2018-07-12', '2021-06-30', 150000, 'Torino');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (53, '2017-07-01', '2022-06-30', 1700000, 'Torino');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (54, '2019-09-02', '2021-06-30', 250000, 'Torino');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (55, '2018-07-11', '2023-06-30', 400000, 'Udinese');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (56, '2019-07-18', '2021-06-30', 200000, 'Udinese');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (57, '2019-07-01', '2020-06-30', 300000, 'Udinese');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (58, '2018-12-14', '2021-06-30', 150000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (59, '2019-07-01', '2020-06-30', 200000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (60, '2017-07-11', '2022-06-30', 300000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (61, '2020-01-12', '2021-06-30', 2200000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (62, '2020-01-30', '2024-06-30', 250000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (63, '2015-08-26', '2023-06-30', 800000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (64, '2020-01-22', '2024-06-30', 150000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (65, '2017-07-01', '2022-06-30', 300000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (66, '2018-07-01', '2022-06-30', 400000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (67, '2017-07-07', '2022-06-30', 550000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (68, '2020-01-30', '2021-06-30', 100000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (69, '2017-01-31', '2022-06-30', 500000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (70, '2019-07-06', '2022-06-30', 800000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (71, '2019-07-01', '2023-06-30', 500000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (72, '2019-07-09', '2024-06-30', 600000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (73, '2015-07-01', '2023-06-30', 750000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (74, '2019-07-01', '2021-06-30', 800000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (75, '2019-07-01', '2023-06-30', 350000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (76, '2020-01-20', '2024-06-30', 50000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (77, '2018-07-01', '2023-06-30', 800000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (78, '2018-07-01', '2021-06-30', 250000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (79, '2019-07-01', '2021-06-30', 150000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (80, '2017-08-25', '2020-06-30', 300000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (81, '2019-07-21', '2022-06-30', 150000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (82, '2018-07-01', '2021-06-30', 100000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (83, '2019-07-01', '2022-06-30', 100000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (84, '2019-07-01', '2022-06-30', 250000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (85, '2018-07-01', '2021-06-30', 100000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (86, '2020-03-01', '2025-06-30', 50000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (87, '2019-07-10', '2020-06-30', 300000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (88, '2019-07-01', '2020-06-30', 400000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (89, '2018-08-17', '2021-06-30', 1000000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (90, '2015-07-14', '2021-06-30', 500000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (91, '2018-01-22', '2022-06-30', 500000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (92, '2014-08-07', '2021-06-30', 1000000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (93, '2017-07-01', '2022-06-30', 500000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (94, '2019-08-19', '2020-06-30', 1000000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (95, '2019-07-01', '2023-06-30', 200000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (96, '2020-01-31', '2021-06-30', 400000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (97, '2017-07-01', '2022-06-30', 800000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (98, '2018-07-12', '2023-06-30', 500000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (99, '2018-07-01', '2022-06-30', 1200000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (100, '2019-08-01', '2020-06-30', 800000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (101, '2019-08-30', '2021-06-30', 1200000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (102, '2019-07-01', '2024-06-30', 300000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (103, '2019-08-29', '2020-06-30', 1200000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (104, '2019-07-01', '2024-06-30', 300000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (105, '2019-07-02', '2021-06-30', 1200000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (106, '2019-07-10', '2020-06-30', 850000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (107, '2018-07-01', '2022-06-30', 1200000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (108, '2019-09-02', '2020-06-30', 500000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (109, '2016-08-31', '2022-06-30', 450000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (110, '2019-07-13', '2020-06-30', 900000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (111, '2019-09-02', '2021-06-30', 500000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (112, '2019-07-01', '2021-06-30', 300000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (113, '2019-08-20', '2020-06-30', 300000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (114, '2020-01-29', '2022-06-30', 500000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (115, '2020-01-31', '2020-06-30', 1000000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (116, '2019-07-01', '2022-06-30', 6000000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (117, '2018-07-01', '2023-06-30', 3800000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (118, '2017-07-01', '2021-06-30', 1800000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (119, '2020-01-01', '2020-06-30', 50000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (120, '2014-01-30', '2021-06-30', 2000000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (121, '2017-07-07', '2023-06-30', 3500000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (122, '2019-07-01', '2023-06-30', 1500000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (123, '2017-07-20', '2022-06-30', 3000000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (124, '2005-07-01', '2021-06-30', 3500000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (125, '2019-07-18', '2024-06-30', 12000000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (126, '2015-08-20', '2023-06-30', 5000000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (127, '2019-08-07', '2024-06-30', 5000000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (128, '2018-08-02', '2024-06-30', 5500000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (129, '2015-07-01', '2023-06-30', 3500000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (130, '2019-07-05', '2024-06-30', 1800000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (131, '2017-07-01', '2022-06-30', 800000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (132, '2015-07-01', '2022-06-30', 1000000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (133, '2016-07-22', '2022-06-30', 1000000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (134, '2016-08-17', '2021-06-30', 1000000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (135, '2008-07-01', '2021-06-30', 1400000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (136, '2018-07-11', '2023-06-30', 1500000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (137, '2019-07-04', '2024-06-30', 1000000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (138, '2017-07-01', '2022-06-30', 900000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (139, '2019-07-01', '2023-06-30', 700000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (140, '2018-07-20', '2021-06-30', 700000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (141, '2020-01-31', '2020-06-30', 450000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (142, '2019-12-16', '2020-06-30', 300000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (143, '2019-07-12', '2021-06-30', 800000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (144, '2019-07-01', '2021-06-30', 500000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (145, '2018-07-18', '2021-06-30', 200000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (146, '2019-08-13', '2021-06-30', 700000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (147, '2019-08-09', '2020-06-30', 600000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (148, '2015-07-01', '2022-06-30', 2000000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (149, '2017-07-07', '2022-06-30', 2000000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (150, '2015-08-11', '2022-06-30', 3500000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (151, '2019-07-06', '2024-06-30', 1500000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (152, '2017-07-01', '2021-06-30', 2000000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (153, '2020-01-13', '2020-06-30', 1000000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (154, '2019-08-07', '2024-06-30', 1000000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (155, '2019-07-01', '2024-06-30', 600000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (156, '2018-08-08', '2022-06-30', 800000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (157, '2018-01-03', '2025-06-30', 1800000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (158, '2018-07-01', '2023-06-30', 400000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (159, '2018-07-01', '2021-06-30', 1200000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (160, '2019-07-01', '2025-06-30', 1200000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (161, '2015-08-02', '2021-06-30', 1600000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (162, '2014-07-01', '2023-06-30', 6000000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (163, '2014-01-31', '2022-06-30', 2400000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (164, '2019-07-01', '2024-06-30', 4000000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (165, '2017-01-31', '2022-06-30', 260000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (166, '2019-07-07', '2023-06-30', 180000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (167, '2020-01-31', '2020-06-30', 500000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (168, '2019-07-08', '2022-06-30', 400000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (169, '2018-07-12', '2021-06-30', 800000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (170, '2018-07-01', '2022-06-30', 380000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (171, '2019-09-02', '2023-06-30', 1500000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (172, '2019-08-27', '2020-06-30', 350000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (173, '2019-08-21', '2020-06-30', 2500000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (174, '2017-07-01', '2021-06-30', 2200000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (175, '2019-08-30', '2020-06-30', 3000000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (176, '2017-07-22', '2021-06-30', 3000000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (177, '2019-08-16', '2024-06-30', 1000000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (178, '2018-07-01', '2022-06-30', 1500000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (179, '2017-07-01', '2021-06-30', 2500000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (180, '2019-07-17', '2020-06-30', 2000000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (181, '2020-01-09', '2021-06-30', 3000000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (182, '2019-07-01', '2024-06-30', 3000000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (183, '2020-01-27', '2021-06-30', 250000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (184, '2019-07-09', '2020-06-30', 250000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (185, '2019-07-01', '2024-06-30', 450000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (186, '2019-07-01', '2024-06-30', 300000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (187, '2018-07-01', '2022-06-30', 950000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (188, '2020-01-23', '2020-06-30', 1000000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (189, '2017-01-03', '2023-06-30', 450000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (190, '2019-07-01', '2023-06-30', 400000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (191, '2017-07-01', '2024-06-30', 700000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (192, '2020-01-31', '2020-06-30', 1000000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (193, '2018-08-16', '2023-06-30', 600000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (194, '2019-07-01', '2023-06-30', 700000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (195, '2014-07-03', '2021-06-30', 600000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (196, '2019-08-20', '2024-06-30', 400000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (197, '2019-09-02', '2020-06-30', 400000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (198, '2019-09-02', '2020-06-30', 1000000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (199, '2019-07-11', '2021-06-30', 700000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (200, '2020-01-31', '2023-06-30', 600000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (201, '2018-07-01', '2023-06-30', 600000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (202, '2019-07-01', '2022-06-30', 250000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (203, '2019-09-02', '2020-06-30', 250000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (204, '2018-01-13', '2020-06-30', 350000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (205, '2019-08-28', '2020-06-30', 300000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (206, '2016-08-11', '2022-06-30', 500000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (207, '2019-09-02', '2020-06-30', 900000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (208, '2017-07-03', '2020-06-30', 400000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (209, '2019-08-22', '2020-06-30', 600000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (210, '2020-01-24', '2020-06-30', 600000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (211, '2019-07-01', '2021-06-30', 400000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (212, '2020-01-31', '2020-06-30', 600000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (213, '2019-07-01', '2024-06-30', 600000, 'Torino');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (214, '2018-07-04', '2024-06-30', 1700000, 'Torino');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (215, '2019-07-01', '2021-06-30', 1400000, 'Torino');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (216, '2019-07-01', '2022-06-30', 30000, 'Torino');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (217, '2016-08-18', '2020-06-30', 1000000, 'Torino');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (218, '2019-07-01', '2023-06-30', 700000, 'Torino');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (219, '2018-07-01', '2021-06-30', 1500000, 'Torino');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (220, '2019-07-01', '2023-06-30', 1000000, 'Torino');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (221, '2018-07-10', '2023-06-30', 500000, 'Torino');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (222, '2016-07-01', '2023-06-30', 500000, 'Udinese');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (223, '2020-01-04', '2021-06-30', 200000, 'Udinese');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (224, '2018-08-17', '2023-06-30', 400000, 'Udinese');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (225, '2017-07-29', '2021-06-30', 500000, 'Udinese');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (226, '2018-07-01', '2022-06-30', 300000, 'Udinese');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (227, '2017-08-24', '2022-06-30', 400000, 'Udinese');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (228, '2019-07-06', '2024-06-30', 500000, 'Udinese');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (229, '2019-07-01', '2022-06-30', 550000, 'Udinese');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (230, '2019-07-01', '2022-06-30', 300000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (231, '2020-01-21', '2020-06-30', 300000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (232, '2019-07-25', '2021-06-30', 500000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (233, '2019-07-19', '2020-06-30', 300000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (234, '2020-01-31', '2021-06-30', 500000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (235, '2018-07-01', '2024-06-30', 300000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (236, '2019-07-01', '2022-06-30', 300000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (237, '2018-08-17', '2022-06-30', 250000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (238, '2019-08-21', '2020-06-30', 350000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (503, '2017-07-01', '2023-06-30', 600000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (239, '2020-01-31', '2020-06-30', 500000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (240, '2016-01-19', '2022-06-30', 500000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (241, '2017-08-10', '2021-06-30', 750000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (242, '2019-07-16', '2024-06-30', 1000000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (243, '2018-07-25', '2020-06-30', 1300000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (244, '2019-08-29', '2022-06-30', 1500000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (245, '2020-01-08', '2024-06-30', 550000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (246, '2016-07-07', '2020-06-30', 550000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (247, '2017-07-01', '2022-06-30', 1000000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (248, '2019-07-01', '2023-06-30', 1500000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (249, '2019-07-05', '2024-06-30', 500000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (250, '2018-07-05', '2023-06-30', 500000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (251, '2018-01-01', '2022-06-30', 250000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (252, '2016-01-31', '2022-06-30', 200000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (253, '2019-08-06', '2023-06-30', 250000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (254, '2020-01-13', '2023-06-30', 150000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (255, '2018-03-22', '2021-06-30', 100000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (256, '2017-07-01', '2024-06-30', 250000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (257, '2019-01-10', '2021-06-30', 400000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (258, '2020-01-18', '2021-06-30', 250000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (259, '2019-09-02', '2020-06-30', 600000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (260, '2019-08-05', '2020-06-30', 3000000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (261, '2019-07-23', '2020-06-30', 1500000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (262, '2017-07-01', '2020-06-30', 500000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (263, '2014-07-01', '2023-06-30', 800000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (264, '2019-01-09', '2021-06-30', 600000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (265, '2019-07-01', '2023-06-30', 300000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (266, '2019-08-09', '2024-06-30', 1500000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (267, '2016-07-01', '2021-06-30', 800000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (268, '2019-08-05', '2020-06-30', 1500000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (269, '2019-08-21', '2021-06-30', 4000000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (270, '2019-07-01', '2024-06-30', 200000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (271, '2019-09-02', '2020-06-30', 1000000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (272, '2020-01-31', '2020-06-30', 250000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (273, '2017-08-09', '2022-06-30', 1100000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (274, '2019-08-09', '2023-06-30', 1300000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (275, '2020-01-31', '2020-06-30', 700000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (276, '2019-07-01', '2023-06-30', 700000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (277, '2019-07-01', '2023-06-30', 250000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (278, '2020-01-23', '2020-06-30', 200000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (279, '2019-08-09', '2021-06-30', 1500000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (280, '2019-01-31', '2021-06-30', 600000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (281, '2019-07-01', '2022-06-30', 1200000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (282, '2019-07-26', '2020-06-30', 300000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (283, '2020-01-02', '2021-06-30', 500000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (284, '2019-08-01', '2023-06-30', 1500000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (285, '2017-08-02', '2022-06-30', 2500000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (286, '2020-01-23', '2020-06-30', 2500000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (287, '2019-07-02', '2020-06-30', 1800000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (288, '2020-01-17', '2021-06-30', 3000000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (289, '2018-07-01', '2021-06-30', 3000000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (290, '2017-07-10', '2020-06-30', 2500000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (291, '2019-07-12', '2020-06-30', 2500000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (292, '2020-01-28', '2024-06-30', 9000000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (293, '2019-07-05', '2022-06-30', 200000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (294, '2019-08-29', '2020-06-30', 2000000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (295, '2016-07-01', '2022-06-30', 3500000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (296, '2016-08-03', '2021-06-30', 3000000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (297, '2016-07-01', '2023-06-30', 6500000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (298, '2015-07-01', '2021-06-30', 6000000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (299, '2019-07-01', '2023-06-30', 7000000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (300, '2017-08-18', '2021-06-30', 3500000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (301, '2019-07-01', '2023-06-30', 9000000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (302, '2017-07-01', '2024-06-30', 2500000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (303, '2017-07-18', '2022-06-30', 2300000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (304, '2019-07-01', '2023-06-30', 200000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (305, '2016-08-31', '2025-06-30', 1800000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (306, '2014-07-01', '2021-06-30', 1400000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (307, '2011-07-01', '2021-06-30', 1400000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (308, '2015-08-06', '2024-06-30', 2500000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (309, '2019-07-22', '2023-06-30', 1100000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (310, '2019-07-01', '2023-06-30', 100000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (311, '2019-07-12', '2024-06-30', 1500000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (312, '2018-07-01', '2024-06-30', 1100000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (313, '2018-08-03', '2023-06-30', 500000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (314, '2016-07-07', '2021-06-30', 500000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (315, '2019-07-01', '2021-06-30', 800000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (316, '2020-01-10', '2020-06-30', 300000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (317, '2020-01-22', '2020-06-30', 900000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (318, '2019-02-16', '2023-06-30', 700000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (319, '2020-01-28', '2020-06-30', 300000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (320, '2019-07-01', '2022-06-30', 800000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (321, '2019-08-04', '2024-06-30', 1500000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (322, '2014-09-01', '2020-06-30', 2000000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (323, '2017-07-03', '2021-06-30', 2500000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (324, '2017-07-16', '2020-06-30', 3500000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (325, '2019-07-08', '2024-06-30', 1100000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (326, '2019-01-03', '2023-06-30', 1700000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (327, '2020-01-31', '2020-06-30', 1100000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (328, '2019-07-01', '2022-06-30', 2200000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (329, '2020-01-31', '2022-06-30', 1400000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (330, '2020-01-11', '2024-06-30', 2500000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (331, '2015-07-21', '2023-06-30', 2000000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (332, '2018-07-05', '2023-06-30', 1500000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (333, '2019-07-24', '2025-06-30', 1500000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (334, '2016-08-04', '2024-06-30', 1100000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (335, '2018-07-01', '2023-06-30', 1500000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (336, '2020-01-15', '2024-06-30', 1800000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (337, '2018-08-14', '2020-06-30', 800000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (338, '2019-07-12', '2020-06-30', 400000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (339, '2020-01-23', '2022-06-30', 280000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (340, '2017-07-01', '2022-06-30', 360000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (341, '2020-01-10', '2020-06-30', 700000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (342, '2017-01-08', '2021-06-30', 300000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (343, '2019-01-15', '2022-06-30', 1100000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (344, '2020-01-03', '2020-06-30', 250000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (345, '2019-07-01', '2024-06-30', 1500000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (346, '2017-07-01', '2022-06-30', 2000000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (347, '2020-01-30', '2024-06-30', 1200000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (348, '2019-07-20', '2020-06-30', 3000000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (349, '2018-07-01', '2024-06-30', 2500000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (350, '2018-07-01', '2023-06-30', 4500000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (351, '2019-07-01', '2024-06-30', 2500000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (352, '2019-09-02', '2020-06-30', 4000000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (353, '2018-08-01', '2023-06-30', 750000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (354, '2018-08-14', '2021-06-30', 1100000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (355, '2016-07-29', '2021-06-30', 500000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (356, '2015-07-01', '2020-06-30', 600000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (357, '2019-07-01', '2023-06-30', 800000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (358, '2020-01-28', '2020-06-30', 100000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (359, '2019-07-01', '2023-06-30', 500000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (360, '2019-08-12', '2024-06-30', 280000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (361, '2019-10-08', '2020-06-30', 500000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (362, '2005-07-01', '2021-06-30', 600000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (363, '2018-07-21', '2022-06-30', 400000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (364, '2018-07-01', '2022-06-30', 700000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (365, '2019-07-24', '2020-06-30', 850000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (366, '2019-07-12', '2021-06-30', 500000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (367, '2020-01-31', '2020-06-30', 400000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (368, '2018-07-17', '2021-06-30', 600000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (369, '2019-07-01', '2023-06-30', 700000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (370, '2018-08-16', '2020-06-30', 700000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (371, '2018-08-17', '2021-06-30', 700000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (372, '2019-07-01', '2021-06-30', 350000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (373, '2019-07-12', '2024-06-30', 700000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (374, '2020-01-13', '2020-06-30', 500000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (375, '2020-01-31', '2020-06-30', 800000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (376, '2019-07-01', '2022-06-30', 300000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (377, '2019-07-26', '2021-06-30', 600000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (378, '2019-07-10', '2020-06-30', 400000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (379, '2019-07-01', '2022-06-30', 350000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (380, '2015-07-10', '2022-06-30', 1400000, 'Torino');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (381, '2017-07-17', '2022-06-30', 700000, 'Torino');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (382, '2018-07-01', '2023-06-30', 500000, 'Torino');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (383, '2018-07-10', '2023-06-30', 1100000, 'Torino');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (384, '2018-07-01', '2022-06-30', 1400000, 'Torino');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (385, '2016-07-01', '2022-06-30', 500000, 'Udinese');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (386, '2019-07-01', '2022-06-30', 450000, 'Udinese');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (387, '2016-07-20', '2024-06-30', 800000, 'Udinese');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (388, '2019-08-12', '2024-06-30', 500000, 'Udinese');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (389, '2019-08-22', '2020-06-30', 400000, 'Udinese');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (390, '2018-07-26', '2023-06-30', 700000, 'Udinese');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (391, '2020-01-24', '2022-06-30', 500000, 'Udinese');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (392, '2019-07-20', '2021-06-30', 400000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (393, '2019-07-13', '2020-06-30', 500000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (394, '2020-01-31', '2020-06-30', 800000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (395, '2019-08-10', '2020-06-30', 400000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (396, '2016-07-01', '2022-06-30', 400000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (397, '2018-07-01', '2022-06-30', 100000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (398, '2019-08-26', '2020-06-30', 200000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (399, '2020-01-31', '2020-06-30', 300000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (400, '2019-08-06', '2022-06-30', 500000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (401, '2019-07-01', '2024-06-30', 1800000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (402, '2014-07-01', '2022-06-30', 1800000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (403, '2017-07-05', '2022-06-30', 1500000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (404, '2020-02-01', '2023-06-30', 100000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (405, '2020-01-17', '2023-06-30', 1800000, 'Atalanta');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (406, '2019-07-01', '2022-06-30', 1000000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (407, '2018-07-01', '2022-06-30', 1000000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (408, '2019-07-01', '2023-06-30', 1500000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (409, '2019-07-24', '2024-06-30', 800000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (410, '2017-08-17', '2021-06-30', 1000000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (411, '2020-01-01', '2024-06-30', 100000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (412, '2020-01-17', '2021-06-30', 250000, 'Bologna');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (413, '2018-01-22', '2022-06-30', 150000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (414, '2018-07-13', '2022-06-30', 600000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (415, '2018-01-31', '2022-06-30', 450000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (416, '2019-07-05', '2022-06-30', 150000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (417, '2019-08-18', '2022-06-30', 4500000, 'Brescia');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (418, '2020-01-31', '2020-06-30', 1000000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (419, '2020-01-31', '2024-06-30', 1400000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (420, '2019-07-01', '2020-06-30', 150000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (421, '2017-08-30', '2022-06-30', 1800000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (422, '2019-08-30', '2020-06-30', 1500000, 'Cagliari');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (423, '2020-01-31', '2020-06-30', 450000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (424, '2019-07-01', '2024-06-30', 150000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (425, '2016-07-01', '2022-06-30', 1700000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (426, '2018-07-01', '2023-06-30', 200000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (427, '2020-01-10', '2021-06-30', 2000000, 'Fiorentina');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (428, '2019-01-26', '2020-06-30', 1100000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (429, '2020-01-31', '2020-06-30', 1700000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (430, '2015-07-07', '2021-06-30', 350000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (431, '2020-01-04', '2020-06-30', 2000000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (432, '2019-07-01', '2023-06-30', 700000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (433, '2019-07-01', '2020-06-30', 1200000, 'Genoa');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (434, '2019-08-29', '2020-06-30', 5000000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (435, '2019-08-08', '2024-06-30', 9000000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (436, '2018-07-04', '2023-06-30', 1500000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (437, '2019-07-01', '2022-06-30', 100000, 'Inter');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (438, '2018-07-10', '2022-06-30', 30000000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (439, '2015-07-01', '2022-06-30', 7300000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (440, '2018-07-01', '2022-06-30', 6000000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (441, '2017-07-01', '2022-06-30', 3500000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (442, '2019-06-30', '2021-06-30', 7500000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (443, '2017-07-24', '2022-06-30', 4000000, 'Juventus');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (444, '2018-08-01', '2024-06-30', 1500000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (445, '2016-07-27', '2025-06-30', 2500000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (446, '2017-08-02', '2022-06-30', 1700000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (447, '2019-07-01', '2022-06-30', 500000, 'Lazio');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (448, '2019-07-12', '2020-06-30', 750000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (449, '2018-07-04', '2022-06-30', 800000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (450, '2019-08-13', '2020-06-30', 700000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (451, '2019-09-02', '2020-06-30', 1000000, 'Lecce');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (452, '2018-08-17', '2023-06-30', 1500000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (453, '2019-08-01', '2024-06-30', 1400000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (454, '2019-09-02', '2021-06-30', 3000000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (455, '2020-01-02', '2021-06-30', 7000000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (456, '2020-09-01', '2024-06-30', 300000, 'Milan');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (457, '2013-07-11', '2020-06-30', 3000000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (458, '2019-09-02', '2021-06-30', 2500000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (459, '2019-08-23', '2024-06-30', 4500000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (460, '2013-07-01', '2022-06-30', 4000000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (461, '2020-01-28', '2021-06-30', 2000000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (462, '2012-07-01', '2022-06-30', 4600000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (463, '2016-08-01', '2021-06-30', 2500000, 'Napoli');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (464, '2019-07-17', '2020-06-30', 1000000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (465, '2019-07-16', '2020-06-30', 1400000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (466, '2019-07-18', '2021-06-30', 800000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (467, '2020-01-31', '2020-06-30', 750000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (468, '2017-07-15', '2022-06-30', 460000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (469, '2019-07-01', '2023-06-30', 400000, 'Parma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (470, '2016-07-01', '2021-06-30', 3000000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (471, '2016-07-01', '2022-06-30', 6000000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (472, '2017-07-16', '2023-06-30', 2500000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (473, '2019-09-02', '2020-06-30', 3000000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (474, '2020-01-30', '2020-06-30', 2000000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (475, '2018-07-01', '2023-06-30', 1800000, 'Roma');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (476, '2019-07-13', '2022-06-30', 800000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (477, '2019-08-30', '2020-06-30', 900000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (478, '2018-07-01', '2022-06-30', 500000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (479, '2015-07-01', '2024-06-30', 1000000, 'Sassuolo');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (480, '2017-01-19', '2021-06-30', 300000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (481, '2020-01-31', '2020-06-30', 1000000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (482, '2020-01-31', '2020-06-30', 1200000, 'SPAL');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (483, '2015-08-18', '2022-06-30', 1700000, 'Torino');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (484, '2019-07-01', '2023-06-30', 1700000, 'Torino');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (485, '2019-07-01', '2023-06-30', 400000, 'Torino');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (486, '2019-07-01', '2023-06-30', 100000, 'Torino');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (487, '2019-09-02', '2020-06-30', 1700000, 'Torino');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (488, '2019-09-02', '2022-06-30', 700000, 'Udinese');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (489, '2017-07-01', '2023-06-30', 600000, 'Udinese');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (490, '2019-07-26', '2022-06-30', 600000, 'Udinese');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (491, '2018-08-17', '2022-06-30', 500000, 'Udinese');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (492, '2020-01-19', '2024-06-30', 600000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (493, '2019-07-01', '2021-06-30', 800000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (494, '2018-07-01', '2020-06-30', 1300000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (495, '2020-01-14', '2020-06-30', 2500000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (496, '2019-08-31', '2020-06-30', 160000, 'Verona');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (497, '2019-07-01', '2025-06-30', 500000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (498, '2017-08-04', '2021-06-30', 1100000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (499, '2020-01-31', '2021-06-30', 500000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (500, '2019-07-01', '2020-06-30', 750000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (501, '2019-01-11', '2023-06-30', 1100000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (502, '2016-07-01', '2021-06-30', 1200000, 'Sampdoria');
INSERT INTO CONTRATTO (tessera_FIGC, data_inizio, data_fine, ingaggio, squadra) VALUES (504, '2018-08-17', '2022-06-30', 1300000, 'Parma');

-- Inserimento formazioni
INSERT INTO FORMAZIONE (codice, squadra) VALUES (1,'Inter');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(1, 289, NULL, NULL, NULL, NULL, 0),
		(1, 295, NULL, NULL, NULL, NULL, 0),
		(1, 296, NULL, NULL, NULL, NULL, 0),
		(1, 120, NULL, NULL, NULL, NULL, 0),
		(1,  20, NULL, NULL, NULL, NULL, 0),
		(1, 435, NULL, NULL, NULL, NULL, 0),
		(1, 436, NULL,   40, NULL, NULL, 0),
		(1, 118, NULL, NULL, NULL, NULL, 0),
		(1, 121, NULL, NULL, NULL, NULL, 0),
		(1, 285, NULL, NULL, NULL, NULL, 0),
		(1, 287, NULL, NULL, NULL, NULL, 0),
		(1, 284,   72, NULL, NULL, NULL, 1),
		(1, 291,   66, NULL, NULL, NULL, 1),
		(1, 461,   78, NULL, NULL, NULL, 1),
		(1, 437, NULL, NULL, NULL, NULL, 1),
		(1,  21, NULL, NULL, NULL, NULL, 1),
		(1, 117, NULL, NULL, NULL, NULL, 1),
		(1, 122, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (2,'Lecce');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(2, 145, NULL, NULL, NULL, NULL, 0),
		(2, 449, NULL, NULL, NULL, NULL, 0),
		(2,  28, NULL, NULL, NULL, NULL, 0),
		(2, 451, NULL, NULL, NULL, NULL, 0),
		(2, 448, NULL,   52, NULL, NULL, 0),
		(2, 140, NULL, NULL, NULL, NULL, 0),
		(2, 318, NULL, NULL, NULL, NULL, 0),
		(2, 313, NULL,   38, NULL, NULL, 0),
		(2, 146, NULL, NULL, NULL, NULL, 0),
		(2, 143, NULL, NULL, NULL, NULL, 0),
		(2, 320, NULL, NULL, NULL, NULL, 0),
		(2, 142,   72, NULL, NULL, NULL, 1),
		(2, 30,  NULL, NULL, NULL, NULL, 1),
		(2, 147, NULL, NULL, NULL, NULL, 1),
		(2, 450,   61, NULL, NULL,   76, 1),
		(2, 314,   61, NULL, NULL, NULL, 1),
		(2, 139, NULL, NULL, NULL, NULL, 1),
		(2, 315, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (3,'Cagliari');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(3, 264, NULL, NULL, NULL, NULL, 0),
		(3,  92, NULL, NULL, NULL, NULL, 0),
		(3, 267, NULL, NULL, NULL, NULL, 0),
		(3, 263, NULL, NULL, NULL, NULL, 0),
		(3,  89, NULL, NULL, NULL, NULL, 0),
		(3,  91, NULL,   45, NULL, NULL, 0),
		(3, 260, NULL, NULL, NULL, NULL, 0),
		(3, 266, NULL, NULL, NULL, NULL, 0),
		(3, 421, NULL, NULL, NULL, NULL, 0),
		(3,  87, NULL,   71, NULL, NULL, 0),
		(3,  12, NULL, NULL, NULL, NULL, 0),
		(3, 418,   45, NULL, NULL, NULL, 1),
		(3, 262,   62, NULL, NULL, NULL, 1),
		(3, 420,   81, NULL, NULL, NULL, 1),
		(3,  13, NULL, NULL, NULL, NULL, 1),
		(3, 265, NULL, NULL, NULL, NULL, 1),
		(3,  94, NULL, NULL, NULL, NULL, 1),
		(3,  90, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (4,'Brescia');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(4, 416, NULL,   61, NULL, NULL, 0),
		(4, 256, NULL, NULL, NULL, NULL, 0),
		(4,  81, NULL, NULL, NULL, NULL, 0),
		(4,  82, NULL, NULL, NULL, NULL, 0),
		(4, 257, NULL,   74, NULL, NULL, 0),
		(4, 414, NULL, NULL, NULL, NULL, 0),
		(4,   9, NULL, NULL, NULL, NULL, 0),
		(4,  84, NULL, NULL, NULL, NULL, 0),
		(4,  78, NULL, NULL, NULL, NULL, 0),
		(4, 413, NULL, NULL, NULL, NULL, 0),
		(4, 251, NULL, NULL, NULL, NULL, 0),
		(4,  80,   79, NULL, NULL, NULL, 1),
		(4, 253,   71, NULL, NULL, NULL, 1),
		(4,  85, NULL, NULL, NULL, NULL, 1),
		(4,   7, NULL, NULL, NULL, NULL, 1),
		(4, 415, NULL, NULL, NULL, NULL, 1),
		(4, 252, NULL, NULL, NULL, NULL, 1),
		(4, 254, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (5,'Roma');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(5, 345, NULL, NULL, NULL, NULL, 0),
		(5, 471, NULL, NULL, NULL, NULL, 0),
		(5, 179, NULL, NULL, NULL, NULL, 0),
		(5, 181, NULL,   38, NULL, NULL, 0),
		(5, 174, NULL,   42, NULL, NULL, 0),
		(5, 475, NULL, NULL, NULL, NULL, 0),
		(5, 176, NULL, NULL, NULL, NULL, 0),
		(5,  41, NULL, NULL, NULL, NULL, 0),
		(5, 346, NULL,   74, NULL, NULL, 0),
		(5, 472, NULL, NULL, NULL, NULL, 0),
		(5, 349, NULL, NULL, NULL, NULL, 0),
		(5, 180,   66, NULL, NULL, NULL, 1),
		(5, 182,   78, NULL, NULL, NULL, 1),
		(5, 350,   74, NULL, NULL, NULL, 1),
		(5,  42, NULL, NULL, NULL, NULL, 1),
		(5, 473, NULL, NULL, NULL, NULL, 1),
		(5, 474, NULL, NULL, NULL, NULL, 1),
		(5, 348, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (6,'Genoa');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(6, 106, NULL, NULL, NULL, NULL, 0),
		(6, 107, NULL, NULL, NULL, NULL, 0),
		(6, 112, NULL, NULL, NULL, NULL, 0),
		(6, 429, NULL, NULL, NULL, NULL, 0),
		(6, 276, NULL, NULL, NULL, NULL, 0),
		(6, 433, NULL, NULL, NULL, NULL, 0),
		(6, 280, NULL, NULL, NULL, NULL, 0),
		(6,  18, NULL, NULL, NULL, NULL, 0),
		(6, 110, NULL,   56, NULL, NULL, 0),
		(6, 279, NULL, NULL, NULL, NULL, 0),
		(6, 105, NULL, NULL, NULL, NULL, 0),
		(6, 430,   86, NULL, NULL, NULL, 1),
		(6, 281,   73, NULL, NULL, NULL, 1),
		(6, 428,   90, NULL, NULL, NULL, 1),
		(6, 277, NULL, NULL, NULL, NULL, 1),
		(6,  17, NULL, NULL, NULL, NULL, 1),
		(6, 109, NULL, NULL, NULL, NULL, 1),
		(6, 108, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (7,'Sampdoria');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(7,  43, NULL, NULL, NULL, NULL, 0),
		(7, 189, NULL, NULL, NULL, NULL, 0),
		(7, 499, NULL, NULL, NULL, NULL, 0),
		(7, 187, NULL, NULL, NULL, NULL, 0),
		(7, 354, NULL,   25, NULL, NULL, 0),
		(7, 501, NULL, NULL, NULL, NULL, 0),
		(7, 355, NULL, NULL, NULL, NULL, 0),
		(7, 188, NULL, NULL, NULL, NULL, 0),
		(7, 191, NULL,   59, NULL, NULL, 0),
		(7, 502, NULL, NULL, NULL, NULL, 0),
		(7, 353, NULL, NULL, NULL, NULL, 0),
		(7, 497,   76, NULL, NULL, NULL, 1),
		(7, 357,   66, NULL, NULL, NULL, 1),
		(7, 360,   66, NULL, NULL, NULL, 1),
		(7,  44, NULL, NULL, NULL, NULL, 1),
		(7, 356, NULL, NULL, NULL, NULL, 1),
		(7, 498, NULL, NULL, NULL, NULL, 1),
		(7, 185, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (8,'Lazio');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(8, 136, NULL,   43, NULL, NULL, 0),
		(8, 305, NULL, NULL, NULL, NULL, 0),
		(8, 444, NULL, NULL, NULL, NULL, 0),
		(8, 445, NULL, NULL, NULL, NULL, 0),
		(8, 311, NULL,   21, NULL, NULL, 0),
		(8, 131, NULL, NULL, NULL, NULL, 0),
		(8, 307, NULL, NULL, NULL, NULL, 0),
		(8, 308, NULL, NULL, NULL, NULL, 0),
		(8, 306, NULL,   59, NULL, NULL, 0),
		(8, 135, NULL, NULL, NULL, NULL, 0),
		(8,  27, NULL, NULL, NULL, NULL, 0),
		(8, 312,   76, NULL, NULL, NULL, 1),
		(8, 138,   65, NULL, NULL, NULL, 1),
		(8, 137,   70, NULL, NULL, NULL, 1),
		(8, 446, NULL, NULL, NULL, NULL, 1),
		(8, 447, NULL, NULL, NULL, NULL, 1),
		(8,  25, NULL, NULL, NULL, NULL, 1),
		(8, 303, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (9,'SPAL');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(9,  49, NULL, NULL, NULL, NULL, 0),
		(9, 204, NULL,   90, NULL, NULL, 0),
		(9, 378, NULL, NULL, NULL, NULL, 0),
		(9, 377, NULL, NULL, NULL, NULL, 0),
		(9, 208, NULL,   21, NULL, NULL, 0),
		(9, 210, NULL, NULL, NULL, NULL, 0),
		(9, 375, NULL, NULL, NULL, NULL, 0),
		(9, 371, NULL, NULL, NULL, NULL, 0),
		(9, 482, NULL,   59, NULL, NULL, 0),
		(9, 372, NULL,   61, NULL, NULL, 0),
		(9, 206, NULL, NULL, NULL, NULL, 0),
		(9, 480,   78, NULL, NULL, NULL, 1),
		(9, 373,   65, NULL, NULL, NULL, 1),
		(9, 209,   71, NULL, NULL, NULL, 1),
		(9, 50,  NULL, NULL, NULL, NULL, 1),
		(9, 481, NULL, NULL, NULL, NULL, 1),
		(9, 376, NULL, NULL, NULL, NULL, 1),
		(9, 212, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (10,'Atalanta');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES  (10, 241, NULL,   43, NULL, NULL, 0),
		(10,  66, NULL, NULL, NULL, NULL, 0),
		(10, 240, NULL, NULL, NULL, NULL, 0),
		(10,   1, NULL, NULL, NULL, NULL, 0),
		(10, 402, NULL, NULL, NULL, NULL, 0),
		(10,  65, NULL, NULL, NULL, NULL, 0),
		(10,  69, NULL, NULL, NULL, NULL, 0),
		(10,  68, NULL,   55, NULL, NULL, 0),
		(10, 503, NULL, NULL, NULL, NULL, 0),
		(10, 243, NULL, NULL, NULL, NULL, 0),
		(10, 405, NULL, NULL, NULL, NULL, 0),
		(10, 242,   54, NULL, NULL, NULL, 1),
		(10, 401,   55, NULL, NULL, NULL, 1),
		(10,  63,   81, NULL, NULL, NULL, 1),
		(10,   2, NULL, NULL, NULL, NULL, 1),
		(10, 404, NULL, NULL, NULL, NULL, 1),
		(10, 239, NULL, NULL, NULL, NULL, 1),
		(10,  62, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (11,'Torino');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(11, 215, NULL,   24, NULL, NULL, 0),
		(11, 380, NULL, NULL, NULL, NULL, 0),
		(11, 483, NULL, NULL, NULL, NULL, 0),
		(11, 216, NULL, NULL, NULL, NULL, 0),
		(11, 221, NULL,   35, NULL, NULL, 0),
		(11, 217, NULL, NULL, NULL, NULL, 0),
		(11, 214, NULL, NULL, NULL, NULL, 0),
		(11, 382, NULL, NULL, NULL, NULL, 0),
		(11, 384, NULL, NULL, NULL, NULL, 0),
		(11,  53, NULL,   77, NULL, NULL, 0),
		(11, 484, NULL,   90, NULL, NULL, 0),
		(11, 220,   46, NULL, NULL, NULL, 1),
		(11, 218,   68, NULL, NULL, NULL, 1),
		(11, 383,   80, NULL, NULL, NULL, 1),
		(11,  52, NULL, NULL, NULL, NULL, 1),
		(11, 381, NULL, NULL, NULL, NULL, 1),
		(11, 486, NULL, NULL, NULL, NULL, 1),
		(11, 487, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (12,'Sassuolo');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(12, 363, NULL, NULL, NULL, NULL, 0),
		(12, 368, NULL,   45, NULL, NULL, 0),
		(12, 476, NULL, NULL, NULL, NULL, 0),
		(12,  46, NULL, NULL, NULL, NULL, 0),
		(12, 201, NULL,   35, NULL, NULL, 0),
		(12, 369, NULL, NULL, NULL, NULL, 0),
		(12, 193, NULL,   11, NULL, NULL, 0),
		(12, 365, NULL,   78, NULL, NULL, 0),
		(12, 194, NULL, NULL, NULL, NULL, 0),
		(12, 199, NULL,   77, NULL, NULL, 0),
		(12, 366, NULL,   90, NULL, NULL, 0),
		(12, 196,   68, NULL, NULL, NULL, 1),
		(12, 195,   46, NULL, NULL, NULL, 1),
		(12, 478,   81, NULL, NULL, NULL, 1),
		(12, 477, NULL, NULL, NULL, NULL, 1),
		(12,  47, NULL, NULL, NULL, NULL, 1),
		(12, 364, NULL, NULL, NULL, NULL, 1),
		(12, 202, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (13,'Verona');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(13, 236, NULL, NULL, NULL, 13, 0),
		(13, 230, NULL, NULL, NULL, NULL, 0),
		(13, 397, NULL,   18, NULL, NULL, 0),
		(13, 235, NULL, NULL, NULL, NULL, 0),
		(13, 400, NULL, NULL, NULL, NULL, 0),
		(13, 231, NULL, NULL, NULL, NULL, 0),
		(13, 60, NULL,  NULL, NULL, NULL, 0),
		(13, 495, NULL, NULL, NULL, NULL, 0),
		(13, 392, NULL, NULL, NULL, NULL, 0),
		(13, 395, NULL, NULL, NULL, NULL, 0),
		(13, 396, NULL, NULL, NULL, NULL, 0),
		(13, 399,   49, NULL, NULL, NULL, 1),
		(13, 232,   16, NULL, NULL, NULL, 1),
		(13, 233,   87, NULL, NULL, NULL, 1),
		(13, 494, NULL, NULL, NULL, NULL, 1),
		(13,  59, NULL, NULL, NULL, NULL, 1),
		(13, 398, NULL, NULL, NULL, NULL, 1),
		(13, 492, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (14,'Bologna');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(14,  74, NULL, NULL, NULL, 13, 0),
		(14,  70, NULL,   65, NULL, NULL, 0),
		(14,  77, NULL,   88, NULL, NULL, 0),
		(14, 244, NULL, NULL, NULL, NULL, 0),
		(14, 406, NULL, NULL, NULL, NULL, 0),
		(14, 410, NULL, NULL, NULL, NULL, 0),
		(14, 247, NULL,  NULL, NULL, NULL, 0),
		(14, 408, NULL, NULL, NULL, NULL, 0),
		(14,   6, NULL, NULL, NULL, NULL, 0),
		(14, 248, NULL, NULL, NULL, NULL, 0),
		(14,  72, NULL, NULL, NULL, NULL, 0),
		(14, 412,   70,   80, NULL, NULL, 1),
		(14, 245,   77, NULL, NULL, NULL, 1),
		(14, 407,   54, NULL, NULL, NULL, 1),
		(14, 249, NULL, NULL, NULL, NULL, 1),
		(14,   4, NULL, NULL, NULL, NULL, 1),
		(14,  71, NULL, NULL, NULL, NULL, 1),
		(14,  73, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (15,'Udinese');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(15, 228, NULL, NULL, NULL, NULL, 0),
		(15, 385, NULL, NULL, NULL, NULL, 0),
		(15, 386, NULL,   45, NULL, NULL, 0),
		(15, 489, NULL, NULL, NULL, NULL, 0),
		(15, 390, NULL, NULL, NULL, NULL, 0),
		(15,  55, NULL, NULL, NULL, NULL, 0),
		(15, 223, NULL, NULL, NULL, NULL, 0),
		(15, 488, NULL, NULL, NULL, NULL, 0),
		(15, 222, NULL, NULL, NULL, NULL, 0),
		(15, 227, NULL, NULL, NULL, NULL, 0),
		(15, 224, NULL, NULL, NULL, NULL, 0),
		(15, 387,   71, NULL, NULL, NULL, 1),
		(15, 490,   70, NULL, NULL, NULL, 1),
		(15, 389,   81, NULL, NULL, NULL, 1),
		(15,  56, NULL, NULL, NULL, NULL, 1),
		(15, 225, NULL, NULL, NULL, NULL, 1),
		(15, 229, NULL, NULL, NULL, NULL, 1),
		(15, 491, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (16,'Milan');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(16, 454, NULL,   44, NULL, NULL, 0),
		(16, 148, NULL, NULL, NULL, NULL, 0),
		(16, 323, NULL,   34, NULL, NULL, 0),
		(16, 452, NULL, NULL, NULL, NULL, 0),
		(16,  33, NULL, NULL, NULL, NULL, 0),
		(16, 152, NULL, NULL, NULL, NULL, 0),
		(16, 326, NULL,   22, NULL, NULL, 0),
		(16, 455, NULL, NULL, NULL, NULL, 0),
		(16, 155, NULL, NULL, NULL, NULL, 0),
		(16, 150, NULL, NULL, NULL, NULL, 0),
		(16, 456, NULL, NULL, NULL, NULL, 0),
		(16, 321,   76, NULL, NULL, NULL, 1),
		(16, 328,   60, NULL, NULL, NULL, 1),
		(16, 453,   74, NULL, NULL, NULL, 1),
		(16, 154, NULL, NULL, NULL, NULL, 1),
		(16, 149, NULL, NULL, NULL, NULL, 1),
		(16,  31, NULL, NULL, NULL, NULL, 1),
		(16, 325, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (17,'Fiorentina');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(17, 268, NULL, NULL, NULL, NULL, 0),
		(17, 270, NULL, NULL, NULL, NULL, 0),
		(17, 425, NULL, NULL, NULL, NULL, 0),
		(17,  14, NULL, NULL, NULL, NULL, 0),
		(17, 100, NULL, NULL, NULL, NULL, 0),
		(17,  97, NULL, NULL, NULL, NULL, 0),
		(17,  99, NULL,   90, NULL, NULL, 0),
		(17, 274, NULL, NULL, NULL, NULL, 0),
		(17, 424, NULL, NULL, NULL, NULL, 0),
		(17, 102, NULL, NULL, NULL, NULL, 0),
		(17, 426, NULL, NULL, NULL, NULL, 0),
		(17, 273,   73, NULL, NULL, NULL, 1),
		(17, 275,   61,   90, NULL, NULL, 1),
		(17, 269,   78, NULL, NULL, NULL, 1),
		(17,  15, NULL, NULL, NULL, NULL, 1),
		(17, 103, NULL, NULL, NULL, NULL, 1),
		(17, 101, NULL, NULL, NULL, NULL, 1),
		(17, 427, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (18,'Napoli');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(18, 331, NULL,   19, NULL, NULL, 0),
		(18, 457, NULL,   20, NULL, NULL, 0),
		(18, 160, NULL, NULL, NULL, NULL, 0),
		(18, 462, NULL, NULL, NULL, NULL, 0),
		(18, 162, NULL, NULL, NULL, NULL, 0),
		(18, 164, NULL, NULL, NULL, NULL, 0),
		(18,  35, NULL,   90, NULL, NULL, 0),
		(18, 460, NULL, NULL, NULL, NULL, 0),
		(18, 157, NULL,   24, NULL, NULL, 0),
		(18, 332, NULL, NULL, NULL, NULL, 0),
		(18, 334, NULL,   90, NULL, NULL, 0),
		(18, 333,   72, NULL, NULL, NULL, 1),
		(18, 163,   71,   90, NULL, NULL, 1),
		(18, 161,   84, NULL, NULL, NULL, 1),
		(18, 458, NULL, NULL, NULL, NULL, 1),
		(18, 461, NULL, NULL, NULL, NULL, 1),
		(18,  36, NULL, NULL, NULL, NULL, 1),
		(18, 335, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (19,'Parma');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(19, 169, NULL, NULL, NULL, NULL, 0),
		(19, 340, NULL, NULL, NULL, NULL, 0),
		(19, 339, NULL, NULL, NULL, NULL, 0),
		(19, 170, NULL, NULL, NULL, NULL, 0),
		(19, 504, NULL, NULL, NULL, NULL, 0),
		(19, 338, NULL,   45, NULL, NULL, 0),
		(19, 165, NULL, NULL, NULL, NULL, 0),
		(19, 465, NULL, NULL, NULL, NULL, 0),
		(19, 344, NULL,   27, NULL, NULL, 0),
		(19, 168, NULL, NULL, NULL, NULL, 0),
		(19,  39, NULL, NULL, NULL, NULL, 0),
		(19, 337,   77, NULL, NULL, NULL, 1),
		(19, 464,   85, NULL, NULL, NULL, 1),
		(19, 468,   57, NULL, NULL, NULL, 1),
		(19,  37, NULL, NULL, NULL, NULL, 1),
		(19, 343, NULL, NULL, NULL, NULL, 1),
		(19, 166, NULL, NULL, NULL, NULL, 1),
		(19, 171, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (20,'Juventus');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(20, 126, NULL, NULL, NULL, NULL, 0),
		(20, 128, NULL, NULL, NULL, NULL, 0),
		(20, 124, NULL, NULL, NULL, NULL, 0),
		(20, 440, NULL, NULL, NULL, NULL, 0),
		(20, 123, NULL, NULL, NULL, NULL, 0),
		(20, 442, NULL, NULL, NULL, NULL, 0),
		(20, 298, NULL,   53, NULL, NULL, 0),
		(20, 300, NULL, NULL, NULL, NULL, 0),
		(20, 297, NULL,   90, NULL, NULL, 0),
		(20, 438, NULL, NULL, NULL, NULL, 0),
		(20,  24, NULL, NULL, NULL, NULL, 0),
		(20, 301,   63, NULL, NULL, NULL, 1),
		(20, 443,   83,   88, NULL, NULL, 1),
		(20, 441,   71, NULL, NULL, NULL, 1),
		(20, 302, NULL, NULL, NULL, NULL, 1),
		(20,  22, NULL, NULL, NULL, NULL, 1),
		(20, 125, NULL, NULL, NULL, NULL, 1),
		(20, 130, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (21,'Atalanta');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(21, 241, NULL,   76, NULL, NULL, 0),
		(21,  66, NULL, NULL, NULL, NULL, 0),
		(21,   1, NULL, NULL, NULL, NULL, 0),
		(21, 402, NULL, NULL, NULL, NULL, 0),
		(21,  65, NULL, NULL, NULL, NULL, 0),
		(21,  69, NULL,   65, NULL, NULL, 0),
		(21, 403, NULL, NULL, NULL, NULL, 0),
		(21,  61, NULL, NULL, NULL, NULL, 0),
		(21, 243, NULL, NULL, NULL, NULL, 0),
		(21,  63, NULL, NULL, NULL, NULL, 0),
		(21, 405, NULL, NULL, NULL, NULL, 0),
		(21,  64,   80, NULL, NULL, NULL, 1),
		(21, 242,   67, NULL, NULL, NULL, 1),
		(21, 401,   63, NULL, NULL, NULL, 1),
		(21,   3, NULL, NULL, NULL, NULL, 1),
		(21, 240, NULL, NULL, NULL, NULL, 1),
		(21, 503, NULL, NULL, NULL, NULL, 1),
		(21, 404, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (22,'Torino');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(22, 220, NULL, NULL, NULL, NULL, 0),
		(22, 380, NULL, NULL, NULL, NULL, 0),
		(22, 483, NULL, NULL, NULL, NULL, 0),
		(22, 381, NULL,   21, NULL, NULL, 0),
		(22, 216, NULL, NULL, NULL, NULL, 0),
		(22, 217, NULL, NULL, NULL, NULL, 0),
		(22, 218, NULL, NULL, NULL, NULL, 0),
		(22, 214, NULL, NULL, NULL, NULL, 0),
		(22, 383, NULL, NULL, NULL, NULL, 0),
		(22, 384, NULL, NULL, NULL, NULL, 0),
		(22,  53, NULL, NULL, NULL, NULL, 0),
		(22, 219,   83,   90, NULL, NULL, 1),
		(22, 382,   78, NULL, NULL, NULL, 1),
		(22,  52, NULL, NULL, NULL, NULL, 1),
		(22, 484, NULL, NULL, NULL, NULL, 1),
		(22, 487, NULL, NULL, NULL, NULL, 1),
		(22, 213, NULL, NULL, NULL, NULL, 1),
		(22, 221, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (23,'Cagliari');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(23,  92, NULL,   68, NULL, NULL, 0),
		(23, 419, NULL, NULL, NULL, NULL, 0),
		(23, 267, NULL,   76, NULL, NULL, 0),
		(23, 263, NULL, NULL, NULL, NULL, 0),
		(23,  89, NULL, NULL, NULL, NULL, 0),
		(23, 260, NULL,   60, NULL, NULL, 0),
		(23, 266, NULL,   88, NULL, NULL, 0),
		(23,  11, NULL, NULL, NULL, NULL, 0),
		(23,  94, NULL, NULL, NULL, NULL, 0),
		(23,  90, NULL,   71, NULL, NULL, 0),
		(23, 261, NULL, NULL, NULL, NULL, 0),
		(23, 265,   74, NULL, NULL, NULL, 1),
		(23, 262,   85, NULL, NULL, NULL, 1),
		(23, 422,   46, NULL, NULL, NULL, 1),
		(23, 420, NULL, NULL, NULL, NULL, 1),
		(23,  12, NULL, NULL, NULL, NULL, 1),
		(23,  87, NULL, NULL, NULL, NULL, 1),
		(23,  91, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (24,'Inter');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(24, 289, NULL,   45, NULL, NULL, 0),
		(24, 295, NULL,   21, NULL, NULL, 0),
		(24, 296, NULL, NULL, NULL, NULL, 0),
		(24, 120, NULL, NULL, NULL, NULL, 0),
		(24,  20, NULL, NULL, NULL, NULL, 0),
		(24, 435, NULL, NULL, NULL, NULL, 0),
		(24, 436, NULL, NULL, NULL, NULL, 0),
		(24, 118, NULL,   86, NULL, NULL, 0),
		(24, 287, NULL, NULL, NULL, NULL, 0),
		(24, 121, NULL, NULL, NULL, NULL, 0),
		(24, 285, NULL, NULL, NULL, NULL, 0),
		(24, 291,   69, NULL, NULL, NULL, 1),
		(24, 116,   79, NULL, NULL, NULL, 1),
		(24, 437,   77, NULL, NULL, NULL, 1),
		(24,  21, NULL, NULL, NULL, NULL, 1),
		(24, 122, NULL, NULL, NULL, NULL, 1),
		(24, 284, NULL, NULL, NULL, NULL, 1),
		(24, 434, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (25,'Genoa');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(25, 106, NULL, NULL, NULL, NULL, 0),
		(25, 107, NULL,   45, NULL, NULL, 0),
		(25, 112, NULL, NULL, NULL, NULL, 0),
		(25, 429, NULL, NULL, NULL, NULL, 0),
		(25, 276, NULL, NULL, NULL, NULL, 0),
		(25, 433, NULL, NULL, NULL, NULL, 0),
		(25, 280, NULL, NULL, NULL, NULL, 0),
		(25,  18, NULL, NULL, NULL, NULL, 0),
		(25, 110, NULL,   16, NULL, NULL, 0),
		(25, 279, NULL, NULL, NULL, NULL, 0),
		(25, 105, NULL, NULL, NULL, NULL, 0),
		(25, 113,   78, NULL, NULL, NULL, 1),
		(25, 430,   84, NULL, NULL, NULL, 1),
		(25, 283,   71, NULL, NULL, NULL, 1),
		(25,  17, NULL, NULL, NULL, NULL, 1),
		(25, 109, NULL, NULL, NULL, NULL, 1),
		(25, 277, NULL, NULL, NULL, NULL, 1),
		(25, 428, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (26,'Fiorentina');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(26, 268, NULL, NULL, NULL, NULL, 0),
		(26, 275, NULL, NULL, NULL, NULL, 0),
		(26, 270, NULL, NULL, NULL, NULL, 0),
		(26, 425, NULL, NULL, NULL, NULL, 0),
		(26,  14, NULL, NULL, NULL, NULL, 0),
		(26, 100, NULL, NULL, NULL, NULL, 0),
		(26,  97, NULL, NULL, NULL, NULL, 0),
		(26,  99, NULL, NULL, NULL, NULL, 0),
		(26, 274, NULL, NULL, NULL, NULL, 0),
		(26, 423, NULL, NULL, NULL, NULL, 0),
		(26, 424, NULL, NULL, NULL, NULL, 0),
		(26, 103,   60, NULL, NULL, NULL, 1),
		(26, 269,   72, NULL, NULL, NULL, 1),
		(26, 426,   72, NULL, NULL, NULL, 1),
		(26,  15, NULL, NULL, NULL, NULL, 1),
		(26, 427, NULL, NULL, NULL, NULL, 1),
		(26, 273, NULL, NULL, NULL, NULL, 1),
		(26, 102, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (27,'Lecce');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(27, 141, NULL, NULL, NULL, NULL, 0),
		(27, 147, NULL, NULL, NULL, NULL, 0),
		(27, 449, NULL, NULL, NULL, NULL, 0),
		(27,  28, NULL, NULL, NULL, NULL, 0),
		(27, 448, NULL, NULL, NULL, NULL, 0),
		(27, 140, NULL, NULL, NULL, NULL, 0),
		(27, 318, NULL,   85, NULL, NULL, 0),
		(27, 314, NULL, NULL, NULL, NULL, 0),
		(27, 143, NULL,   22, NULL, NULL, 0),
		(27, 315, NULL, NULL, NULL, NULL, 0),
		(27, 320, NULL, NULL, NULL, NULL, 0),
		(27, 145,   82, NULL, NULL, NULL, 1),
		(27, 451,   65, NULL, NULL, NULL, 1),
		(27, 146,   59, NULL, NULL, NULL, 1),
		(27, 450, NULL, NULL, NULL, NULL, 1),
		(27,  30, NULL, NULL, NULL, NULL, 1),
		(27, 313, NULL, NULL, NULL, NULL, 1),
		(27, 139, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (28,'Verona');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(28, 399, NULL, NULL, NULL, NULL, 0),
		(28, 230, NULL, NULL, NULL, NULL, 0),
		(28, 233, NULL,   65, NULL, NULL, 0),
		(28, 234, NULL, NULL, NULL, NULL, 0),
		(28, 235, NULL,    3, NULL, NULL, 0),
		(28, 400, NULL, NULL, NULL, NULL, 0),
		(28, 231, NULL, NULL, NULL, NULL, 0),
		(28,  60, NULL, NULL, NULL, NULL, 0),
		(28, 495, NULL,   22, NULL, NULL, 0),
		(28, 392, NULL, NULL, NULL, NULL, 0),
		(28, 396, NULL, NULL, NULL, NULL, 0),
		(28, 232,   78, NULL, NULL, NULL, 1),
		(28, 398,   74, NULL, NULL, NULL, 1),
		(28, 395,   59,   67, NULL, NULL, 1),
		(28, 494, NULL, NULL, NULL, NULL, 1),
		(28, 496, NULL, NULL, NULL, NULL, 1),
		(28,  59, NULL, NULL, NULL, NULL, 1),
		(28, 238, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (29,'Sassuolo');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(29, 479, NULL, NULL, NULL, NULL, 0),
		(29, 476, NULL, NULL, NULL, NULL, 0),
		(29,  46, NULL, NULL, NULL, NULL, 0),
		(29, 367, NULL,   16, NULL, NULL, 0),
		(29, 201, NULL, NULL, NULL, NULL, 0),
		(29, 369, NULL, NULL, NULL, NULL, 0),
		(29, 193, NULL, NULL, NULL, NULL, 0),
		(29, 196, NULL, NULL, NULL, NULL, 0),
		(29, 365, NULL, NULL, NULL, NULL, 0),
		(29, 195, NULL, NULL, NULL, NULL, 0),
		(29, 366, NULL, NULL, NULL, NULL, 0),
		(29, 363,   75, NULL, NULL, NULL, 1),
		(29, 364,   84, NULL, NULL, NULL, 1),
		(29, 362,   79, NULL, NULL, NULL, 1),
		(29,  47, NULL, NULL, NULL, NULL, 1),
		(29, 477, NULL, NULL, NULL, NULL, 1),
		(29, 199, NULL, NULL, NULL, NULL, 1),
		(29, 202, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (30,'Sampdoria');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(30,  43, NULL, NULL, NULL, NULL, 0),
		(30, 189, NULL, NULL, NULL, NULL, 0),
		(30, 187, NULL,   11, NULL, NULL, 0),
		(30, 354, NULL, NULL, NULL, NULL, 0),
		(30, 357, NULL, NULL, NULL, NULL, 0),
		(30, 360, NULL, NULL, NULL, NULL, 0),
		(30, 188, NULL, NULL, NULL, NULL, 0),
		(30, 191, NULL, NULL, NULL, NULL, 0),
		(30, 502, NULL,   64, NULL, NULL, 0),
		(30, 498, NULL, NULL, NULL, NULL, 0),
		(30, 353, NULL, NULL, NULL,   45, 0),
		(30, 356,   46, NULL, NULL, NULL, 1),
		(30, 499,   61,   87, NULL, NULL, 1),
		(30, 190,   54, NULL, NULL, NULL, 1),
		(30, 501, NULL, NULL, NULL, NULL, 1),
		(30,  44, NULL, NULL, NULL, NULL, 1),
		(30, 355, NULL, NULL, NULL, NULL, 1),
		(30, 185, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (31,'Udinese');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(31, 228, NULL, NULL, NULL, NULL, 0),
		(31, 387, NULL, NULL, NULL, NULL, 0),
		(31, 386, NULL, NULL, NULL, NULL, 0),
		(31, 489, NULL, NULL, NULL, NULL, 0),
		(31, 390, NULL, NULL, NULL, NULL, 0),
		(31,  55, NULL, NULL, NULL, NULL, 0),
		(31, 490, NULL, NULL, NULL, NULL, 0),
		(31, 222, NULL, NULL, NULL, NULL, 0),
		(31, 389, NULL, NULL, NULL, NULL, 0),
		(31, 227, NULL, NULL, NULL, NULL, 0),
		(31, 224, NULL, NULL, NULL, NULL, 0),
		(31, 385,   55, NULL, NULL, NULL, 1),
		(31, 391,   70, NULL, NULL, NULL, 1),
		(31, 491,   78,   90, NULL, NULL, 1),
		(31,  56, NULL, NULL, NULL, NULL, 1),
		(31, 488, NULL, NULL, NULL, NULL, 1),
		(31, 225, NULL, NULL, NULL, NULL, 1),
		(31, 229, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (32,'Parma');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(32, 169, NULL, NULL, NULL, NULL, 0),
		(32, 340, NULL,   81, NULL, NULL, 0),
		(32, 170, NULL, NULL, NULL, NULL, 0),
		(32, 504, NULL, NULL, NULL, NULL, 0),
		(32, 337, NULL,    6, NULL, NULL, 0),
		(32, 338, NULL,   86, NULL, NULL, 0),
		(32, 165, NULL, NULL, NULL, NULL, 0),
		(32, 465, NULL, NULL, NULL, NULL, 0),
		(32, 344, NULL, NULL, NULL, NULL, 0),
		(32, 168, NULL, NULL, NULL, NULL, 0),
		(32,  39, NULL, NULL, NULL, NULL, 0),
		(32, 466,   82, NULL, NULL, NULL, 1),
		(32, 343,   64, NULL, NULL, NULL, 1),
		(32, 172,   70, NULL, NULL, NULL, 1),
		(32, 464, NULL, NULL, NULL, NULL, 1),
		(32,  37, NULL, NULL, NULL, NULL, 1),
		(32, 166, NULL, NULL, NULL, NULL, 1),
		(32, 342, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (33,'Lazio');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(33, 136, NULL,   76, NULL, NULL, 0),
		(33, 305, NULL, NULL, NULL, NULL, 0),
		(33, 444, NULL, NULL, NULL, NULL, 0),
		(33, 445, NULL,   55, NULL, NULL, 0),
		(33, 311, NULL, NULL, NULL, NULL, 0),
		(33, 303, NULL,   86, NULL, NULL, 0),
		(33, 131, NULL,   25, NULL, NULL, 0),
		(33, 307, NULL, NULL, NULL, NULL, 0),
		(33, 308, NULL, NULL, NULL, NULL, 0),
		(33, 135, NULL,   63, NULL, NULL, 0),
		(33,  27, NULL, NULL, NULL, NULL, 0),
		(33, 306,   71, NULL, NULL, NULL, 1),
		(33, 134,   40, NULL, NULL, NULL, 1),
		(33, 309,   78, NULL, NULL, NULL, 1),
		(33,  26, NULL, NULL, NULL, NULL, 1),
		(33, 446, NULL, NULL, NULL, NULL, 1),
		(33, 447, NULL, NULL, NULL, NULL, 1),
		(33, 132, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (34,'Roma');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(34, 345, NULL, NULL, NULL, NULL, 0),
		(34, 471, NULL, NULL, NULL, NULL, 0),
		(34, 179, NULL, NULL, NULL, NULL, 0),
		(34, 181, NULL,   70, NULL, NULL, 0),
		(34, 475, NULL, NULL, NULL, NULL, 0),
		(34, 176, NULL, NULL, NULL, NULL, 0),
		(34,  41, NULL, NULL, NULL, NULL, 0),
		(34, 180, NULL, NULL, NULL, NULL, 0),
		(34, 346, NULL, NULL, NULL, NULL, 0),
		(34, 472, NULL, NULL, NULL, NULL, 0),
		(34, 349, NULL,   31, NULL, NULL, 0),
		(34, 351,   89, NULL, NULL, NULL, 1),
		(34, 350,   67, NULL, NULL, NULL, 1),
		(34, 178,   78,   84, NULL, NULL, 1),
		(34,  42, NULL, NULL, NULL, NULL, 1),
		(34, 473, NULL, NULL, NULL, NULL, 1),
		(34, 474, NULL, NULL, NULL, NULL, 1),
		(34, 175, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (35,'Juventus');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(35, 126, NULL,   80, NULL, NULL, 0),
		(35, 128, NULL, NULL, NULL, NULL, 0),
		(35, 440, NULL,   83, NULL, NULL, 0),
		(35, 125, NULL, NULL, NULL, NULL, 0),
		(35, 123, NULL, NULL, NULL, NULL, 0),
		(35, 442, NULL, NULL, NULL, NULL, 0),
		(35, 298, NULL, NULL, NULL, NULL, 0),
		(35, 300, NULL,   52, NULL, NULL, 0),
		(35, 297, NULL, NULL, NULL, NULL, 0),
		(35, 438, NULL, NULL, NULL, NULL, 0),
		(35,  24, NULL, NULL, NULL, NULL, 0),
		(35, 299,   60, NULL, NULL, NULL, 1),
		(35, 127,   15, NULL, NULL, NULL, 1),
		(35, 439,   76, NULL, NULL, NULL, 1),
		(35,  22, NULL, NULL, NULL, NULL, 1),
		(35, 443, NULL, NULL, NULL, NULL, 1),
		(35, 302, NULL, NULL, NULL, NULL, 1),
		(35, 130, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (36,'Napoli');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(36, 331, NULL, NULL, NULL, NULL, 0),
		(36, 457, NULL, NULL, NULL, NULL, 0),
		(36, 160, NULL,   44, NULL, NULL, 0),
		(36, 163, NULL,   40, NULL, NULL, 0),
		(36, 462, NULL, NULL, NULL, NULL, 0),
		(36, 162, NULL, NULL, NULL, NULL, 0),
		(36, 164, NULL, NULL, NULL, NULL, 0),
		(36,  35, NULL, NULL, NULL, NULL, 0),
		(36, 460, NULL, NULL, NULL, NULL, 0),
		(36, 332, NULL, NULL, NULL, NULL, 0),
		(36, 334, NULL, NULL, NULL, NULL, 0),
		(36, 333,   90, NULL, NULL, NULL, 1),
		(36, 459,   46, NULL, NULL, NULL, 1),
		(36, 157,   46, NULL, NULL, NULL, 1),
		(36, 458, NULL, NULL, NULL, NULL, 1),
		(36,  36, NULL, NULL, NULL, NULL, 1),
		(36, 159, NULL, NULL, NULL, NULL, 1),
		(36, 335, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (37,'Milan');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(37, 321, NULL, NULL, NULL, NULL, 0),
		(37, 148, NULL,   55, NULL, NULL, 0),
		(37, 323, NULL,   65, NULL, NULL, 0),
		(37, 452, NULL, NULL, NULL, NULL, 0),
		(37,  33, NULL, NULL, NULL, NULL, 0),
		(37, 328, NULL, NULL, NULL, NULL, 0),
		(37, 152, NULL, NULL, NULL, NULL, 0),
		(37, 151, NULL, NULL, NULL, NULL, 0),
		(37, 150, NULL, NULL, NULL, NULL, 0),
		(37, 454, NULL,   34, NULL, NULL, 0),
		(37, 453, NULL, NULL, NULL, NULL, 0),
		(37, 456,   80, NULL, NULL, NULL, 1),
		(37, 326,   65, NULL, NULL, NULL, 1),
		(37, 455,   60, NULL, NULL, NULL, 1),
		(37,  31, NULL, NULL, NULL, NULL, 1),
		(37, 322, NULL, NULL, NULL, NULL, 1),
		(37, 149, NULL, NULL, NULL, NULL, 1),
		(37, 154, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (38,'Brescia');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(38, 256, NULL,   39, NULL, NULL, 0),
		(38,  81, NULL, NULL, NULL, NULL, 0),
		(38,  82, NULL,   30, NULL, NULL, 0),
		(38, 257, NULL,   24, NULL, NULL, 0),
		(38, 414, NULL, NULL, NULL, NULL, 0),
		(38,   9, NULL, NULL, NULL, NULL, 0),
		(38,  84, NULL, NULL, NULL, NULL, 0),
		(38,  78, NULL, NULL, NULL, NULL, 0),
		(38, 413, NULL, NULL, NULL, NULL, 0),
		(38, 251, NULL,   90, NULL, NULL, 0),
		(38, 415, NULL, NULL, NULL, NULL, 0),
		(38, 416,   46, NULL, NULL, NULL, 1),
		(38,  79,   14, NULL, NULL, NULL, 1),
		(38, 417,   76, NULL, NULL, NULL, 1),
		(38, 253, NULL, NULL, NULL, NULL, 1),
		(38, 254, NULL, NULL, NULL, NULL, 1),
		(38,   7, NULL, NULL, NULL, NULL, 1),
		(38,  80, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (39,'Bologna');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(39,  74, NULL,   39, NULL, NULL, 0),
		(39,  70, NULL, NULL, NULL, NULL, 0),
		(39, 412, NULL, NULL, NULL, NULL, 0),
		(39,  77, NULL, NULL, NULL, NULL, 0),
		(39, 244, NULL,   60, NULL, NULL, 0),
		(39, 406, NULL, NULL, NULL, NULL, 0),
		(39, 247, NULL, NULL, NULL, NULL, 0),
		(39, 408, NULL, NULL, NULL, NULL, 0),
		(39,   6, NULL, NULL, NULL, NULL, 0),
		(39, 248, NULL,   90, NULL, NULL, 0),
		(39,  72, NULL, NULL, NULL, NULL, 0),
		(39, 245,   71, NULL, NULL, NULL, 1),
		(39, 410,   81, NULL, NULL, NULL, 1),
		(39, 407,   76,   63, NULL, NULL, 1),
		(39,  73, NULL, NULL, NULL, NULL, 1),
		(39,  71, NULL, NULL, NULL, NULL, 1),
		(39,   4, NULL, NULL, NULL, NULL, 1),
		(39, 249, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (40,'SPAL');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(40,  49, NULL, NULL, NULL, NULL, 0),
		(40, 204, NULL, NULL, NULL, NULL, 0),
		(40, 378, NULL, NULL, NULL, NULL, 0),
		(40, 377, NULL, NULL, NULL, NULL, 0),
		(40, 208, NULL, NULL, NULL, NULL, 0),
		(40, 210, NULL,   61, NULL, NULL, 0),
		(40, 375, NULL, NULL, NULL, NULL, 0),
		(40, 371, NULL,   50, NULL, NULL, 0),
		(40, 482, NULL, NULL, NULL, NULL, 0),
		(40, 372, NULL, NULL, NULL, NULL, 0),
		(40, 206, NULL, NULL, NULL, NULL, 0),
		(40, 480,   81, NULL, NULL, NULL, 1),
		(40, 370,   63, NULL, NULL, NULL, 1),
		(40, 209,   83, NULL, NULL, NULL, 1),
		(40, 481, NULL, NULL, NULL, NULL, 1),
		(40,  50, NULL, NULL, NULL, NULL, 1),
		(40, 205, NULL, NULL, NULL, NULL, 1),
		(40, 373, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (41,'Torino');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(41, 220, NULL, NULL, NULL, NULL, 0),
		(41, 380, NULL, NULL, NULL, NULL, 0),
		(41, 483, NULL, NULL, NULL, NULL, 0),
		(41, 381, NULL, NULL, NULL, NULL, 0),
		(41, 221, NULL, NULL, NULL, NULL, 0),
		(41, 217, NULL,   61, NULL, NULL, 0),
		(41, 218, NULL, NULL, NULL, NULL, 0),
		(41, 214, NULL, NULL, NULL, NULL, 0),
		(41, 383, NULL, NULL, NULL, NULL, 0),
		(41, 384, NULL, NULL, NULL, NULL, 0),
		(41,  53, NULL, NULL, NULL, NULL, 0),
		(41, 382,   80, NULL, NULL, NULL, 1),
		(41, 487,   72, NULL, NULL, NULL, 1),
		(41, 484,   46, NULL, NULL, NULL, 1),
		(41, 213, NULL, NULL, NULL, NULL, 1),
		(41, 485, NULL, NULL, NULL, NULL, 1),
		(41, 486, NULL, NULL, NULL, NULL, 1),
		(41,  54, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (42,'Lecce');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(42, 145, NULL, NULL, NULL, NULL, 0),
		(42, 449, NULL, NULL, NULL, NULL, 0),
		(42, 450, NULL, NULL, NULL, NULL, 0),
		(42,  28, NULL, NULL, NULL, NULL, 0),
		(42, 448, NULL,   50, NULL, NULL, 0),
		(42, 140, NULL,   18, NULL, NULL, 0),
		(42, 318, NULL, NULL, NULL, NULL, 0),
		(42, 146, NULL,   88, NULL, NULL, 0),
		(42, 143, NULL,   15, NULL, NULL, 0),
		(42, 317, NULL,   56, NULL, NULL, 0),
		(42, 320, NULL, NULL, NULL, NULL, 0),
		(42, 314,   63, NULL, NULL, NULL, 1),
		(42, 315,   81, NULL, NULL, NULL, 1),
		(42, 451,   63, NULL, NULL, NULL, 1),
		(42, 141, NULL, NULL, NULL, NULL, 1),
		(42, 139, NULL, NULL, NULL, NULL, 1),
		(42,  30, NULL, NULL, NULL, NULL, 1),
		(42, 313, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (43,'Verona');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(43, 399, NULL,   74, NULL, NULL, 0),
		(43, 230, NULL, NULL, NULL, NULL, 0),
		(43, 233, NULL,   65, NULL, NULL, 0),
		(43, 235, NULL, NULL, NULL, NULL, 0),
		(43, 400, NULL, NULL, NULL, NULL, 0),
		(43, 231, NULL, NULL, NULL, NULL, 0),
		(43,  60, NULL,   85, NULL, NULL, 0),
		(43, 492, NULL, NULL, NULL,   21, 0),
		(43, 392, NULL,   40, NULL, NULL, 0),
		(43, 395, NULL, NULL, NULL, NULL, 0),
		(43, 396, NULL, NULL, NULL, NULL, 0),
		(43, 493,   78, NULL, NULL, NULL, 1),
		(43, 398,   66, NULL, NULL, NULL, 1),
		(43, 495,   79, NULL, NULL, NULL, 1),
		(43, 397, NULL, NULL, NULL, NULL, 1),
		(43, 394, NULL, NULL, NULL, NULL, 1),
		(43,  59, NULL, NULL, NULL, NULL, 1),
		(43, 236, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (44,'Milan');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(44, 324, NULL, NULL, NULL, NULL, 0),
		(44, 148, NULL, NULL, NULL,   90, 0),
		(44, 323, NULL, NULL, NULL, NULL, 0),
		(44,  33, NULL, NULL, NULL, NULL, 0),
		(44, 328, NULL, NULL, NULL, NULL, 0),
		(44, 152, NULL, NULL, NULL, NULL, 0),
		(44, 326, NULL,   35, NULL, NULL, 0),
		(44, 455, NULL,   24, NULL,   21, 0),
		(44, 155, NULL, NULL, NULL, NULL, 0),
		(44, 150, NULL, NULL, NULL, NULL, 0),
		(44, 452, NULL, NULL, NULL, NULL, 0),
		(44, 454,   46,   86, NULL, NULL, 1),
		(44, 453, NULL, NULL, NULL, NULL, 1),
		(44, 321, NULL, NULL, NULL, NULL, 1),
		(44, 322, NULL, NULL, NULL, NULL, 1),
		(44,  31, NULL, NULL, NULL, NULL, 1),
		(44, 149, NULL, NULL, NULL, NULL, 1),
		(44, 154, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (45,'Roma');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(45, 345, NULL, NULL, NULL, NULL, 0),
		(45, 471, NULL, NULL, NULL, NULL, 0),
		(45, 179, NULL, NULL, NULL, NULL, 0),
		(45, 181, NULL, NULL, NULL, NULL, 0),
		(45, 475, NULL, NULL, NULL, NULL, 0),
		(45, 176, NULL, NULL, NULL, NULL, 0),
		(45, 41, NULL,  NULL, NULL, NULL, 0),
		(45, 180, NULL, NULL, NULL, NULL, 0),
		(45, 352, NULL, NULL, NULL, NULL, 0),
		(45, 346, NULL,   28, NULL, NULL, 0),
		(45, 348, NULL, NULL, NULL, NULL, 0),
		(45, 350,   84, NULL, NULL, NULL, 1),
		(45, 182,   73, NULL, NULL, NULL, 1),
		(45, 349,   72, NULL, NULL, NULL, 1),
		(45, 473, NULL, NULL, NULL, NULL, 1),
		(45, 474, NULL, NULL, NULL, NULL, 1),
		(45,  42, NULL, NULL, NULL, NULL, 1),
		(45, 174, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (46,'Sassuolo');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(46, 479, NULL, NULL, NULL, NULL, 0),
		(46, 476, NULL, NULL, NULL, NULL, 0),
		(46, 198, NULL, NULL, NULL, NULL, 0),
		(46,  46, NULL, NULL, NULL, NULL, 0),
		(46, 477, NULL, NULL, NULL, NULL, 0),
		(46, 362, NULL, NULL, NULL, NULL, 0),
		(46, 201, NULL, NULL, NULL, NULL, 0),
		(46, 369, NULL, NULL, NULL, NULL, 0),
		(46, 193, NULL, NULL, NULL, NULL, 0),
		(46, 365, NULL,   33, NULL, NULL, 0),
		(46, 195, NULL, NULL, NULL, NULL, 0),
		(46, 196,   70, NULL, NULL, NULL, 1),
		(46, 199,   46,   82, NULL, NULL, 1),
		(46, 366,   84, NULL, NULL, NULL, 1),
		(46, 363, NULL, NULL, NULL, NULL, 1),
		(46, 478, NULL, NULL, NULL, NULL, 1),
		(46, 368, NULL, NULL, NULL, NULL, 1),
		(46,  47, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (47,'Brescia');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(47, 416, NULL, NULL, NULL, NULL, 0),
		(47, 256, NULL, NULL, NULL, NULL, 0),
		(47,  81, NULL, NULL, NULL, NULL, 0),
		(47,  82, NULL, NULL, NULL, NULL, 0),
		(47, 414, NULL, NULL, NULL, NULL, 0),
		(47, 257, NULL,   21,   48,   48, 0),
		(47,   9, NULL, NULL, NULL, NULL, 0),
		(47,  79, NULL, NULL, NULL, NULL, 0),
		(47, 259, NULL, NULL, NULL, NULL, 0),
		(47,  78, NULL, NULL, NULL, NULL, 0),
		(47, 251, NULL, NULL, NULL, NULL, 0),
		(47, 413,   79, NULL, NULL, NULL, 1),
		(47, 417,   83, NULL, NULL, NULL, 1),
		(47, 253,   63, NULL, NULL, NULL, 1),
		(47, 254, NULL, NULL, NULL, NULL, 1),
		(47,   7, NULL, NULL, NULL, NULL, 1),
		(47,  85, NULL, NULL, NULL, NULL, 1),
		(47,  80, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (48,'Bologna');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(48,  71, NULL,   12, NULL, NULL, 0),
		(48,  70, NULL,   45, NULL, NULL, 0),
		(48,  77, NULL, NULL, NULL, NULL, 0),
		(48, 245, NULL, NULL, NULL, NULL, 0),
		(48, 244, NULL,   83, NULL, NULL, 0),
		(48, 406, NULL, NULL, NULL, NULL, 0),
		(48, 410, NULL, NULL, NULL, NULL, 0),
		(48, 408, NULL, NULL, NULL, NULL, 0),
		(48,   6, NULL, NULL, NULL, NULL, 0),
		(48, 248, NULL,   69, NULL, NULL, 0),
		(48,  72, NULL, NULL, NULL, NULL, 0),
		(48, 247,   53, NULL, NULL, NULL, 1),
		(48, 407,   46,   67, NULL, NULL, 1),
		(48, 409,   89,   90, NULL, NULL, 1),
		(48,   4, NULL, NULL, NULL, NULL, 1),
		(48, 249, NULL, NULL, NULL, NULL, 1),
		(48,  73, NULL, NULL, NULL, NULL, 1),
		(48,  75, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (49,'Parma');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(49, 169, NULL, NULL, NULL, NULL, 0),
		(49, 340, NULL, NULL, NULL, NULL, 0),
		(49, 339, NULL, NULL, NULL, NULL, 0),
		(49, 171, NULL, NULL, NULL, NULL, 0),
		(49, 170, NULL, NULL, NULL, NULL, 0),
		(49, 504, NULL, NULL, NULL, NULL, 0),
		(49, 338, NULL, NULL, NULL, NULL, 0),
		(49, 165, NULL, NULL, NULL, NULL, 0),
		(49, 465, NULL, NULL, NULL, NULL, 0),
		(49, 344, NULL, NULL, NULL, NULL, 0),
		(49,  39, NULL, NULL, NULL, NULL, 0),
		(49, 172,   73, NULL, NULL, NULL, 1),
		(49, 466,   74, NULL, NULL, NULL, 1),
		(49, 469,   81, NULL, NULL, NULL, 1),
		(49, 166, NULL, NULL, NULL, NULL, 1),
		(49, 341, NULL, NULL, NULL, NULL, 1),
		(49,  37, NULL, NULL, NULL, NULL, 1),
		(49, 342, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (50,'Cagliari');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(50,  88, NULL, NULL, NULL, NULL, 0),
		(50, 265, NULL,   86, NULL, NULL, 0),
		(50,  92, NULL,   16, NULL, NULL, 0),
		(50, 262, NULL, NULL, NULL, NULL, 0),
		(50, 263, NULL,   42, NULL, NULL, 0),
		(50, 266, NULL,   56, NULL, NULL, 0),
		(50,  11, NULL, NULL, NULL, NULL, 0),
		(50,  94, NULL,   62, NULL, NULL, 0),
		(50,  90, NULL, NULL, NULL, NULL, 0),
		(50, 261, NULL, NULL, NULL, NULL, 0),
		(50, 422, NULL, NULL, NULL, NULL, 0),
		(50, 267,   83, NULL, NULL, NULL, 1),
		(50,  89,   69, NULL, NULL, NULL, 1),
		(50,  91,   64, NULL, NULL, NULL, 1),
		(50,  93, NULL, NULL, NULL, NULL, 1),
		(50, 420, NULL, NULL, NULL, NULL, 1),
		(50,  12, NULL, NULL, NULL, NULL, 1),
		(50, 419, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (51,'SPAL');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(51,  49, NULL, NULL, NULL, NULL, 0),
		(51, 204, NULL, NULL, NULL, NULL, 0),
		(51, 378, NULL, NULL, NULL, NULL, 0),
		(51, 377, NULL,   90, NULL, NULL, 0),
		(51, 375, NULL, NULL, NULL, NULL, 0),
		(51, 371, NULL,   51, NULL, NULL, 0),
		(51, 373, NULL, NULL, NULL, NULL, 0),
		(51, 482, NULL, NULL, NULL, NULL, 0),
		(51, 205, NULL, NULL, NULL, NULL, 0),
		(51, 209, NULL,   16, NULL, NULL, 0),
		(51, 206, NULL, NULL, NULL, NULL, 0),
		(51, 208,   80,   85, NULL, NULL, 1),
		(51, 207,   73, NULL, NULL, NULL, 1),
		(51, 376,   62,   64, NULL, NULL, 1),
		(51,  50, NULL, NULL, NULL, NULL, 1),
		(51, 480, NULL, NULL, NULL, NULL, 1),
		(51, 372, NULL, NULL, NULL, NULL, 1),
		(51, 481, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (52,'Lazio');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(52, 136, NULL,   89, NULL, NULL, 0),
		(52, 305, NULL, NULL, NULL, NULL, 0),
		(52, 446, NULL, NULL, NULL, NULL, 0),
		(52, 445, NULL, NULL, NULL, NULL, 0),
		(52, 311, NULL, NULL, NULL, NULL, 0),
		(52, 303, NULL, NULL, NULL, NULL, 0),
		(52, 307, NULL, NULL, NULL, NULL, 0),
		(52, 306, NULL, NULL, NULL, NULL, 0),
		(52, 132, NULL,   26, NULL, NULL, 0),
		(52, 135, NULL,   79, NULL, NULL, 0),
		(52,  27, NULL, NULL, NULL, NULL, 0),
		(52, 444,   68, NULL, NULL, NULL, 1),
		(52, 308,   68, NULL, NULL, NULL, 1),
		(52, 137,   48, NULL, NULL, NULL, 1),
		(52, 447, NULL, NULL, NULL, NULL, 1),
		(52,  26, NULL, NULL, NULL, NULL, 1),
		(52, 309, NULL, NULL, NULL, NULL, 1),
		(52, 134, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (53,'Genoa');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(53, 106, NULL, NULL, NULL, NULL, 0),
		(53, 107, NULL, NULL, NULL, NULL, 0),
		(53, 112, NULL, NULL, NULL, NULL, 0),
		(53, 429, NULL, NULL, NULL, NULL, 0),
		(53, 276, NULL, NULL, NULL, NULL, 0),
		(53, 433, NULL, NULL, NULL, NULL, 0),
		(53, 280, NULL, NULL, NULL, NULL, 0),
		(53,  18, NULL, NULL, NULL, NULL, 0),
		(53, 110, NULL,   31, NULL, NULL, 0),
		(53, 279, NULL, NULL, NULL, NULL, 0),
		(53, 105, NULL,   63, NULL, NULL, 0),
		(53, 111,   82, NULL, NULL, NULL, 1),
		(53, 430,   68,   90, NULL, NULL, 1),
		(53, 281,   70, NULL, NULL, NULL, 1),
		(53, 428, NULL, NULL, NULL, NULL, 1),
		(53,  17, NULL, NULL, NULL, NULL, 1),
		(53, 113, NULL, NULL, NULL, NULL, 1),
		(53, 277, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (54,'Atalanta');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(54,  66, NULL, NULL, NULL, NULL, 0),
		(54, 240, NULL, NULL, NULL, NULL, 0),
		(54,   1, NULL, NULL, NULL, NULL, 0),
		(54, 402, NULL, NULL, NULL, NULL, 0),
		(54,  65, NULL, NULL, NULL, NULL, 0),
		(54,  69, NULL,   48, NULL, NULL, 0),
		(54, 403, NULL,   45, NULL, NULL, 0),
		(54,  61, NULL,   44, NULL, NULL, 0),
		(54, 243, NULL, NULL, NULL, NULL, 0),
		(54,  63, NULL, NULL, NULL, NULL, 0),
		(54, 405, NULL, NULL, NULL, NULL, 0),
		(54, 241,   56, NULL, NULL, NULL, 1),
		(54, 401,   60, NULL, NULL, NULL, 1),
		(54,   3, NULL, NULL, NULL, NULL, 1),
		(54,  67, NULL, NULL, NULL, NULL, 1),
		(54, 503, NULL, NULL, NULL, NULL, 1),
		(54, 242, NULL, NULL, NULL, NULL, 1),
		(54, 404, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (55,'Inter');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(55, 289, NULL, NULL, NULL, NULL, 0),
		(55, 291, NULL,   29, NULL, NULL, 0),
		(55, 295, NULL, NULL, NULL, NULL, 0),
		(55, 296, NULL,   78, NULL, NULL, 0),
		(55, 117, NULL, NULL, NULL, NULL, 0),
		(55, 116, NULL, NULL, NULL, NULL, 0),
		(55,  20, NULL, NULL, NULL, NULL, 0),
		(55, 435, NULL, NULL, NULL, NULL, 0),
		(55, 437, NULL, NULL, NULL, NULL, 0),
		(55, 287, NULL, NULL, NULL, NULL, 0),
		(55, 121, NULL, NULL, NULL, NULL, 0),
		(55, 436,   64, NULL, NULL, NULL, 1),
		(55, 434,   79, NULL, NULL, NULL, 1),
		(55, 284,   46, NULL, NULL, NULL, 1),
		(55, 122, NULL, NULL, NULL, NULL, 1),
		(55, 120, NULL, NULL, NULL, NULL, 1),
		(55,  21, NULL, NULL, NULL, NULL, 1),
		(55, 285, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (56,'Udinese');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(56, 228, NULL,   36, NULL, NULL, 0),
		(56, 229, NULL, NULL, NULL, NULL, 0),
		(56, 387, NULL, NULL, NULL,   35, 0),
		(56, 385, NULL, NULL, NULL, NULL, 0),
		(56, 386, NULL, NULL, NULL, NULL, 0),
		(56, 489, NULL, NULL, NULL, NULL, 0),
		(56,  55, NULL, NULL, NULL, NULL, 0),
		(56, 391, NULL, NULL, NULL, NULL, 0),
		(56, 389, NULL, NULL, NULL, NULL, 0),
		(56, 227, NULL, NULL, NULL, NULL, 0),
		(56, 388, NULL, NULL, NULL, NULL, 0),
		(56, 224,   70, NULL, NULL, NULL, 1),
		(56, 488,   81, NULL, NULL, NULL, 1),
		(56, 390,   81, NULL, NULL, NULL, 1),
		(56,  56, NULL, NULL, NULL, NULL, 1),
		(56, 222, NULL, NULL, NULL, NULL, 1),
		(56, 225, NULL, NULL, NULL, NULL, 1),
		(56, 490, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (57,'Napoli');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(57, 457, NULL, NULL, NULL, NULL, 0),
		(57, 160, NULL, NULL, NULL, NULL, 0),
		(57, 333, NULL, NULL, NULL, NULL, 0),
		(57, 162, NULL, NULL, NULL, NULL, 0),
		(57, 459, NULL, NULL, NULL, NULL, 0),
		(57, 159, NULL,    7, NULL, NULL, 0),
		(57,  35, NULL, NULL, NULL, NULL, 0),
		(57, 460, NULL, NULL, NULL, NULL, 0),
		(57, 157, NULL, NULL, NULL, NULL, 0),
		(57, 332, NULL,   37, NULL, NULL, 0),
		(57, 334, NULL, NULL, NULL, NULL, 0),
		(57, 462,   75, NULL, NULL, NULL, 1),
		(57, 458,   65, NULL, NULL, NULL, 1),
		(57, 335,   80, NULL, NULL, NULL, 1),
		(57,  36, NULL, NULL, NULL, NULL, 1),
		(57, 156, NULL, NULL, NULL, NULL, 1),
		(57, 164, NULL, NULL, NULL, NULL, 1),
		(57, 331, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (58,'Sampdoria');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(58,  43, NULL, NULL, NULL, NULL, 0),
		(58, 189, NULL, NULL, NULL, NULL, 0),
		(58, 499, NULL,   41, NULL, NULL, 0),
		(58, 354, NULL, NULL, NULL, NULL, 0),
		(58, 190, NULL,   26, NULL, NULL, 0),
		(58, 355, NULL, NULL, NULL, NULL, 0),
		(58, 188, NULL, NULL, NULL, NULL, 0),
		(58, 191, NULL, NULL, NULL, NULL, 0),
		(58, 502, NULL, NULL, NULL, NULL, 0),
		(58, 192, NULL, NULL, NULL, NULL, 0),
		(58, 500, NULL, NULL, NULL, NULL, 0),
		(58, 186,   79, NULL, NULL, NULL, 1),
		(58, 501,   68, NULL, NULL, NULL, 1),
		(58, 360,   66, NULL, NULL, NULL, 1),
		(58, 498, NULL, NULL, NULL, NULL, 1),
		(58, 356, NULL, NULL, NULL, NULL, 1),
		(58,  44, NULL, NULL, NULL, NULL, 1),
		(58, 187, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (59,'Fiorentina');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(59, 268, NULL, NULL, NULL, NULL, 0),
		(59, 101, NULL,   10, NULL, NULL, 0),
		(59, 270, NULL,   77, NULL, NULL, 0),
		(59, 425, NULL,   37, NULL, NULL, 0),
		(59, 103, NULL, NULL, NULL, NULL, 0),
		(59,  14, NULL, NULL, NULL, NULL, 0),
		(59, 100, NULL, NULL, NULL, NULL, 0),
		(59,  97, NULL, NULL, NULL, NULL, 0),
		(59,  99, NULL, NULL, NULL, NULL, 0),
		(59, 274, NULL, NULL, NULL, NULL, 0),
		(59, 269, NULL, NULL, NULL, NULL, 0),
		(59, 275,   69, NULL, NULL, NULL, 1),
		(59,  98,   83, NULL, NULL, NULL, 1),
		(59, 102,   89, NULL, NULL, NULL, 1),
		(59, 104, NULL, NULL, NULL, NULL, 1),
		(59, 426, NULL, NULL, NULL, NULL, 1),
		(59, 424, NULL, NULL, NULL, NULL, 1),
		(59, 271, NULL, NULL, NULL, NULL, 1);
INSERT INTO FORMAZIONE (codice, squadra) VALUES (60,'Juventus');
INSERT INTO PARTECIPANTE (formazione, tessera_FIGC, subentrato, ammonito1, ammonito2, espulso, in_panchina)
VALUES	(60, 126, NULL, NULL, NULL, NULL, 0),
		(60, 128, NULL, NULL, NULL, NULL, 0),
		(60, 440, NULL, NULL, NULL, NULL, 0),
		(60, 127, NULL, NULL, NULL, NULL, 0),
		(60, 125, NULL,   46, NULL, NULL, 0),
		(60, 442, NULL, NULL, NULL, NULL, 0),
		(60, 298, NULL, NULL, NULL, NULL, 0),
		(60, 300, NULL, NULL, NULL, NULL, 0),
		(60, 297, NULL,   14, NULL, NULL, 0),
		(60, 438, NULL, NULL, NULL, NULL, 0),
		(60, 24,  NULL, NULL, NULL, NULL, 0),
		(60, 302,   44,   82, NULL, NULL, 1),
		(60, 443,    8, NULL, NULL, NULL, 1),
		(60, 441,   62, NULL, NULL, NULL, 1),
		(60, 301, NULL, NULL, NULL, NULL, 1),
		(60,  22, NULL, NULL, NULL, NULL, 1),
		(60, 129, NULL, NULL, NULL, NULL, 1),
		(60, 130, NULL, NULL, NULL, NULL, 1);
        
-- Inserimento partite
INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(1, '20190826', 3, 0, 4, 0, 65, 35, 7, 4, 9, 6, 14, 8, 1, 2, 0, 1, '2019/2020', 1, 'Inter', 'Lecce', 1, 2);
INSERT INTO GOL(tessera_FIGC, partita, minuto, autogol, rigore)
VALUES	(295, 1, 21, 0, 0),
		(287, 1, 24, 0, 0),
		(435, 1, 60, 0, 0),
		(296, 1, 84, 0, 0);
INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(2, '20190825', 0, 3, 0, 1, 53, 47, 5, 3, 4, 5, 10, 11, 2, 2, 0, 0, '2019/2020', 1, 'Cagliari', 'Brescia', 3, 4);
INSERT INTO GOL(tessera_FIGC, partita, minuto, autogol, rigore)
VALUES	(414, 2, 54, 0, 1);
INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(3, '20190825', 1, 1, 3, 3, 56, 44, 9, 4, 8, 2, 15, 13, 3, 1, 0, 0, '2019/2020', 1, 'Roma', 'Genoa', 5, 6);
INSERT INTO GOL(tessera_FIGC, partita, minuto, autogol, rigore)
VALUES	(472, 3,  6, 0, 0),
		(471, 3, 30, 0, 0),
		(176, 3, 49, 0, 0),
		(433, 3, 16, 0, 0),
		(107, 3, 43, 0, 1),
		(429, 3, 70, 0, 0);
INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(4, '20190825', 0, 3, 0, 3, 45, 55, 8, 10, 4, 6, 13, 11, 2, 2, 0, 0, '2019/2020', 1, 'Sampdoria', 'Lazio', 7, 8);
INSERT INTO GOL(tessera_FIGC, partita, minuto, autogol, rigore)
VALUES	(445, 4, 37, 0, 0),
		(445, 4, 62, 0, 0),
		(444, 4, 56, 0, 0);
INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(5, '20190825', 0, 3, 2, 3, 42, 58, 3, 14, 5, 4, 13, 16, 2, 1, 0, 0, '2019/2020', 1, 'SPAL', 'Atalanta', 9, 10);
INSERT INTO GOL(tessera_FIGC, partita, minuto, autogol, rigore)
VALUES	(377, 5,  7, 0, 0),
		(482, 5, 27, 0, 0),
		( 65, 5, 34, 0, 0),
		(401, 5, 71, 0, 0),
		(401, 5, 76, 0, 0);
INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(6, '20190825', 3, 0, 2, 1, 42, 58, 5, 9, 3, 4, 21, 15, 4, 3, 0, 0, '2019/2020', 1, 'Torino', 'Sassuolo', 11, 12);
INSERT INTO GOL(tessera_FIGC, partita, minuto, autogol, rigore)
VALUES	(484, 6, 14, 0, 0),
		(483, 6, 55, 0, 0),
		(476, 6, 69, 0, 0);
INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(7, '20190825', 1, 1, 1, 1, 23, 77, 2, 5, 3, 9, 12, 13, 1, 3, 1, 0, '2019/2020', 1, 'Verona', 'Bologna', 13, 14);
INSERT INTO GOL(tessera_FIGC, partita, minuto, autogol, rigore)
VALUES	(408, 7, 15, 0, 1),
		(392, 7, 37, 0, 0);
INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(8, '20190825', 3, 0, 1, 0, 42, 58, 6, 0, 5, 6, 14, 11, 1, 3, 0, 0, '2019/2020', 1, 'Udinese', 'Milan', 15, 16);
INSERT INTO GOL(tessera_FIGC, partita, minuto, autogol, rigore)
VALUES	(228, 8, 72, 0, 0);
INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(9, '20190824', 0, 3, 3, 4, 46, 54, 6, 6, 4, 2, 21, 16, 2, 4, 0, 0, '2019/2020', 1, 'Fiorentina', 'Napoli', 17, 18);
INSERT INTO GOL(tessera_FIGC, partita, minuto, autogol, rigore)
VALUES	(274, 9,  9, 0, 1),
		( 97, 9, 52, 0, 0),
		(275, 9, 65, 0, 0),
		(460, 9, 38, 0, 0),
		(462, 9, 43, 0, 1),
		(457, 9, 56, 0, 0),
		(462, 9, 67, 0, 0);
INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(10, '20190824', 0, 3, 0, 1, 38, 62, 4, 4, 1, 5, 12, 14, 2, 3, 0, 0, '2019/2020', 1, 'Parma', 'Juventus', 19, 20);
INSERT INTO GOL(tessera_FIGC, partita, minuto, autogol, rigore)
VALUES	(124, 10, 21, 0, 0);
INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(11, '20190901', 0, 3, 2, 3, 58, 42, 12, 6, 7, 2, 13, 15, 2, 2, 0, 0, '2019/2020', 2, 'Atalanta', 'Torino', 21, 22);

INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(12, '20190901', 0, 3, 1, 2, 45, 55, 3, 8, 4, 1, 12, 11, 5, 3, 0, 0, '2019/2020', 2, 'Cagliari', 'Inter', 23, 24);

INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(13, '20190901', 3, 0, 2, 1, 52, 48, 10, 7, 8, 9, 17, 15, 2, 0, 0, 0, '2019/2020', 2, 'Genoa', 'Fiorentina', 25, 26);

INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(14, '20190901', 0, 3, 0, 1, 46, 54, 3, 6, 6, 5, 14, 14, 2, 3, 0, 0, '2019/2020', 2, 'Lecce', 'Verona', 27, 28);

INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(15, '20190901', 3, 0, 4, 1, 65, 35, 8, 5, 3, 3, 9, 10, 1, 3, 0, 1, '2019/2020', 2, 'Sassuolo', 'Sampdoria', 29, 30);

INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(16, '20190901', 0, 3, 1, 3, 53, 47, 12, 3, 5, 3, 11, 11, 1, 3, 0, 0, '2019/2020', 2, 'Udinese', 'Parma', 31, 32);

INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(17, '20190901', 1, 1, 1, 1, 46, 54, 13, 5, 8, 3, 15, 13, 4, 3, 0, 0, '2019/2020', 2, 'Lazio', 'Roma', 33, 34);

INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(18, '20190831', 3, 0, 4, 3, 44, 56, 8, 7, 2, 5, 13, 13, 3, 3, 0, 0, '2019/2020', 2, 'Juventus', 'Napoli', 35, 36);

INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(19, '20190831', 3, 0, 1, 0, 63, 37, 6, 2, 5, 2, 14, 18, 3, 4, 0, 0, '2019/2020', 2, 'Milan', 'Brescia', 37, 38);

INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(20, '20190830', 3, 0, 1, 0, 59, 41, 9, 1, 9, 6, 13, 13, 3, 2, 0, 0, '2019/2020', 2, 'Bologna', 'SPAL', 39, 40);

INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(21, '20190916', 0, 3, 1, 2, 58, 42, 3, 5, 9, 7, 11, 19, 1, 5, 0, 0, '2019/2020', 3, 'Torino', 'Lecce', 41, 42);

INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(22, '20190915', 0, 3, 0, 1, 33, 67, 2, 6, 4, 5, 13, 16, 4, 3, 1, 1, '2019/2020', 3, 'Verona', 'Milan', 43, 44);

INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(23, '20190915', 3, 0, 4, 2, 48, 52, 10, 5, 4, 5, 13, 9, 1, 2, 0, 0, '2019/2020', 3, 'Roma', 'Sassuolo', 45, 46);

INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(24, '20190915', 0, 3, 3, 4, 42, 58, 7, 6, 2, 11, 14, 17, 2, 6, 1, 0, '2019/2020', 3, 'Brescia', 'Bologna', 47, 48);

INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(25, '20190915', 0, 3, 1, 3, 59, 41, 8, 4, 6, 2, 12, 16, 0, 5, 0, 0, '2019/2020', 3, 'Parma', 'Cagliari', 49, 50);

INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(26, '20190915', 3, 0, 2, 1, 45, 55, 4, 7, 5, 4, 9, 11, 5, 3, 0, 0, '2019/2020', 3, 'SPAL', 'Lazio', 51, 52);

INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(27, '20190915', 0, 3, 1, 2, 51, 49, 3, 6, 5, 5, 12, 14, 3, 3, 0, 0, '2019/2020', 3, 'Genoa', 'Atalanta', 53, 54);

INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(28, '20190914', 3, 0, 1, 0, 64, 36, 10, 4, 5, 2, 9, 10, 2, 1, 0, 1, '2019/2020', 3, 'Inter', 'Udinese', 55, 56);

INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(29, '20190914', 3, 0, 2, 0, 66, 34, 9, 2, 10, 5, 7, 10, 2, 2, 0, 0, '2019/2020', 3, 'Napoli', 'Sampdoria', 57, 58);

INSERT INTO PARTITA (codice, data, esito_casa, esito_trasferta, gol_casa, gol_trasferta, possesso_palla_casa, possesso_palla_trasferta, tiri_in_porta_casa, tiri_in_porta_trasferta, tiri_fuori_casa, tiri_fuori_trasferta, falli_casa, falli_trasferta, ammonizioni_casa, ammonizioni_trasferta, espulsioni_casa, espulsioni_trasferta, anno_calcistico, giornata, squadra_casa, squadra_trasferta, formazione_casa, formazione_trasferta)
VALUES	(30, '20190914', 1, 1, 0, 0, 46, 54, 8, 4, 7, 1, 12, 18, 3, 3, 0, 0, '2019/2020', 3, 'Fiorentina', 'Juventus', 59, 60);