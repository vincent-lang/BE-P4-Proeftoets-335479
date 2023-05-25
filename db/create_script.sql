-- Step: 01
-- Goal: create database
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            25-05-2023      Vincent van de Merwe            new          
-- =============================================================================
drop database if exists `oefen-toets-MVC`;
create database if not exists `oefen-toets-MVC`;

-- Step: 02
-- Goal: using database
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            25-05-2023      Vincent van de Merwe            new          
-- =============================================================================
use `oefen-toets-MVC`;

-- Step: 03
-- Goal: create table LesPakket
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            25-05-2023      Vincent van de Merwe            new          
-- =============================================================================

drop table if exists LesPakket;
create table if not exists LesPakket (
Id TINYINT UNSIGNED not null auto_increment,
PakketNaam varchar(20) not null,
AantalLessen int not null,
Rijbewijscategorie varchar(10) not null,
Prijs varchar(20) not null,
IsActief bit not null default 1,
OpMerkingen varchar(250) null default null,
DatumAanGemaakt datetime(6) not null,
DatumGewijzigd datetime(6) not null,
CONSTRAINT      PK_LesPakket_Id   PRIMARY KEY CLUSTERED(Id)
) engine=InnoDB;

-- Step: 04
-- Goal: create table Leerling
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            25-05-2023      Vincent van de Merwe            new          
-- =============================================================================

drop table if exists Leerling;
create table if not exists Leerling (
Id TINYINT UNSIGNED not null auto_increment,
Voornaam varchar(10) not null,
TussenVoegsel varchar(10) null,
Achternaam varchar(10) not null,
Mobiel varchar(20) not null,
IsActief bit not null default 1,
OpMerkingen varchar(250) null default null,
DatumAanGemaakt datetime(6) not null,
DatumGewijzigd datetime(6) not null,
CONSTRAINT      PK_Leerling_Id   PRIMARY KEY CLUSTERED(Id)
) engine=InnoDB;

-- Step: 05
-- Goal: create table LeerlingPerLesPakket
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            25-05-2023      Vincent van de Merwe            new          
-- =============================================================================

drop table if exists LeerlingPerLesPakket;
create table if not exists LeerlingPerLesPakket (
Id TINYINT UNSIGNED not null auto_increment,
LesPakketId tinyint unsigned not null,
LeerlingId tinyint unsigned not null,
StartDatumRijlessen date not null,
DatumRijbewijsBehaald date null,
IsActief bit not null default 1,
OpMerkingen varchar(250) null default null,
DatumAanGemaakt datetime(6) not null,
DatumGewijzigd datetime(6) not null,
CONSTRAINT      PK_LeerlingPerLesPakket_Id   PRIMARY KEY CLUSTERED(Id),
foreign key (LesPakketId) references LesPakket(Id),
foreign key (LeerlingId) references Leerling(Id)
) engine=InnoDB;

-- Step: 06
-- Goal: insert info in the table LesPakket
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            25-05-2023      Vincent van de Merwe            new          
-- =============================================================================

INSERT INTO LesPakket (Id,PakketNaam,AantalLessen,Rijbewijscategorie,Prijs,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Personenauto Extra', 40, 'B', '2700', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO LesPakket (Id,PakketNaam,AantalLessen,Rijbewijscategorie,Prijs,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Vrachtwagen Subliem', 60, 'C', '5400', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO LesPakket (Id,PakketNaam,AantalLessen,Rijbewijscategorie,Prijs,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Bus Extraordinaire', 80, 'D', '7300', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO LesPakket (Id,PakketNaam,AantalLessen,Rijbewijscategorie,Prijs,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Bromfiets Deluxe', 10, 'AM', '230', 1, NULL, SYSDATE(6), SYSDATE(6));

-- Step: 06
-- Goal: insert info in the table Leerling
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            25-05-2023      Vincent van de Merwe            new          
-- =============================================================================

INSERT INTO Leerling (Id,Voornaam,TussenVoegsel,Achternaam,Mobiel,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Bas', 'De', 'Bakker', '06-28493827', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO Leerling (Id,Voornaam,TussenVoegsel,Achternaam,Mobiel,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Terence', null, 'Draaijer', '06-39398734', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO Leerling (Id,Voornaam,TussenVoegsel,Achternaam,Mobiel,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Samuel', null, 'Werchter', '06-24383291', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO Leerling (Id,Voornaam,TussenVoegsel,Achternaam,Mobiel,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Sharida', null, 'Tetehuka', '06-48293823', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO Leerling (Id,Voornaam,TussenVoegsel,Achternaam,Mobiel,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Fatma', null, 'Yilmaz', '06-34291234', 1, NULL, SYSDATE(6), SYSDATE(6));

-- Step: 07
-- Goal: insert info in the table LeerlingPerLesPakket
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            25-05-2023      Vincent van de Merwe            new          
-- =============================================================================

INSERT INTO LeerlingPerLesPakket (Id,LesPakketId,LeerlingId,StartDatumRijlessen,DatumRijbewijsBehaald,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 1, 5, '2023-05-23', null, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO LeerlingPerLesPakket (Id,LesPakketId,LeerlingId,StartDatumRijlessen,DatumRijbewijsBehaald,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 4, 1, '2022-06-03', '2022-08-05', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO LeerlingPerLesPakket (Id,LesPakketId,LeerlingId,StartDatumRijlessen,DatumRijbewijsBehaald,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 1, 1, '2023-06-02', null, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO LeerlingPerLesPakket (Id,LesPakketId,LeerlingId,StartDatumRijlessen,DatumRijbewijsBehaald,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 3, 4, '2023-01-01', null, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO LeerlingPerLesPakket (Id,LesPakketId,LeerlingId,StartDatumRijlessen,DatumRijbewijsBehaald,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 1, 2, '2022-11-30', '2023-05-23', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO LeerlingPerLesPakket (Id,LesPakketId,LeerlingId,StartDatumRijlessen,DatumRijbewijsBehaald,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 2, 3, '2022-06-06', '2023-06-06', 1, NULL, SYSDATE(6), SYSDATE(6));