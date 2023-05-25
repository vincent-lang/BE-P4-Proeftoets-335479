-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 25 mei 2023 om 13:00
-- Serverversie: 5.7.36
-- PHP-versie: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oefen-toets-MVC`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Leerling`
--

DROP TABLE IF EXISTS `Leerling`;
CREATE TABLE IF NOT EXISTS `Leerling` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(10) NOT NULL,
  `TussenVoegsel` varchar(10) DEFAULT NULL,
  `Achternaam` varchar(10) NOT NULL,
  `Mobiel` varchar(20) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `OpMerkingen` varchar(250) DEFAULT NULL,
  `DatumAanGemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Leerling`
--

INSERT INTO `Leerling` (`Id`, `Voornaam`, `TussenVoegsel`, `Achternaam`, `Mobiel`, `IsActief`, `OpMerkingen`, `DatumAanGemaakt`, `DatumGewijzigd`) VALUES
(1, 'Bas', 'De', 'Bakker', '06-28493827', b'1', NULL, '2023-05-25 14:09:14.665112', '2023-05-25 14:09:14.665120'),
(2, 'Terence', NULL, 'Draaijer', '06-39398734', b'1', NULL, '2023-05-25 14:09:14.670267', '2023-05-25 14:09:14.670276'),
(3, 'Samuel', NULL, 'Werchter', '06-24383291', b'1', NULL, '2023-05-25 14:09:14.675615', '2023-05-25 14:09:14.675622'),
(4, 'Sharida', NULL, 'Tetehuka', '06-48293823', b'1', NULL, '2023-05-25 14:09:14.680820', '2023-05-25 14:09:14.680827'),
(5, 'Fatma', NULL, 'Yilmaz', '06-34291234', b'1', NULL, '2023-05-25 14:09:14.686497', '2023-05-25 14:09:14.686506');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `LeerlingPerLesPakket`
--

DROP TABLE IF EXISTS `LeerlingPerLesPakket`;
CREATE TABLE IF NOT EXISTS `LeerlingPerLesPakket` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `LesPakketId` tinyint(3) UNSIGNED NOT NULL,
  `LeerlingId` tinyint(3) UNSIGNED NOT NULL,
  `StartDatumRijlessen` date NOT NULL,
  `DatumRijbewijsBehaald` date DEFAULT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `OpMerkingen` varchar(250) DEFAULT NULL,
  `DatumAanGemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `LesPakketId` (`LesPakketId`),
  KEY `LeerlingId` (`LeerlingId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `LeerlingPerLesPakket`
--

INSERT INTO `LeerlingPerLesPakket` (`Id`, `LesPakketId`, `LeerlingId`, `StartDatumRijlessen`, `DatumRijbewijsBehaald`, `IsActief`, `OpMerkingen`, `DatumAanGemaakt`, `DatumGewijzigd`) VALUES
(1, 1, 5, '2023-05-23', NULL, b'1', NULL, '2023-05-25 14:09:14.694143', '2023-05-25 14:09:14.694148'),
(2, 4, 1, '2022-06-03', '2022-08-05', b'1', NULL, '2023-05-25 14:09:14.699252', '2023-05-25 14:09:14.699258'),
(3, 1, 1, '2023-06-02', NULL, b'1', NULL, '2023-05-25 14:09:14.705287', '2023-05-25 14:09:14.705294'),
(4, 3, 4, '2023-01-01', NULL, b'1', NULL, '2023-05-25 14:09:14.710982', '2023-05-25 14:09:14.710987'),
(5, 1, 2, '2022-11-30', '2023-05-23', b'1', NULL, '2023-05-25 14:09:14.717352', '2023-05-25 14:09:14.717358'),
(6, 2, 3, '2022-06-06', '2023-06-06', b'1', NULL, '2023-05-25 14:09:14.722971', '2023-05-25 14:09:14.722977');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `LesPakket`
--

DROP TABLE IF EXISTS `LesPakket`;
CREATE TABLE IF NOT EXISTS `LesPakket` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `PakketNaam` varchar(20) NOT NULL,
  `AantalLessen` int(11) NOT NULL,
  `Rijbewijscategorie` varchar(10) NOT NULL,
  `Prijs` varchar(20) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `OpMerkingen` varchar(250) DEFAULT NULL,
  `DatumAanGemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `LesPakket`
--

INSERT INTO `LesPakket` (`Id`, `PakketNaam`, `AantalLessen`, `Rijbewijscategorie`, `Prijs`, `IsActief`, `OpMerkingen`, `DatumAanGemaakt`, `DatumGewijzigd`) VALUES
(1, 'Personenauto Extra', 40, 'B', '2700', b'1', NULL, '2023-05-25 14:09:14.640845', '2023-05-25 14:09:14.640853'),
(2, 'Vrachtwagen Subliem', 60, 'C', '5400', b'1', NULL, '2023-05-25 14:09:14.645823', '2023-05-25 14:09:14.645830'),
(3, 'Bus Extraordinaire', 80, 'D', '7300', b'1', NULL, '2023-05-25 14:09:14.651754', '2023-05-25 14:09:14.651764'),
(4, 'Bromfiets Deluxe', 10, 'AM', '230', b'1', NULL, '2023-05-25 14:09:14.657193', '2023-05-25 14:09:14.657200');

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `LeerlingPerLesPakket`
--
ALTER TABLE `LeerlingPerLesPakket`
  ADD CONSTRAINT `leerlingperlespakket_ibfk_1` FOREIGN KEY (`LesPakketId`) REFERENCES `LesPakket` (`Id`),
  ADD CONSTRAINT `leerlingperlespakket_ibfk_2` FOREIGN KEY (`LeerlingId`) REFERENCES `Leerling` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
