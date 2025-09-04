CREATE DATABASE  IF NOT EXISTS `piattaforma_streaming_musicale` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `piattaforma_streaming_musicale`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: piattaforma_streaming_musicale
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `idAlbum` int NOT NULL AUTO_INCREMENT,
  `titolo` varchar(50) NOT NULL,
  `tipologia` varchar(30) DEFAULT NULL,
  `dataPubblicazione` date NOT NULL,
  `casaDiscografica` varchar(50) NOT NULL,
  PRIMARY KEY (`idAlbum`),
  KEY `album_ibfk_1` (`casaDiscografica`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`casaDiscografica`) REFERENCES `casa_discografica` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'The Marshall Mathers LP','Studio','2000-05-23','Interscope Records'),(2,'21','Studio','2011-01-24','Columbia Records'),(3,'The Blueprint','Studio','2001-09-11','Roc-A-Fella Records'),(4,'When We All Fall Asleep, Where Do We Go?','Studio','2019-03-29','Interscope Records'),(5,'1989','Studio','2012-10-16','Carosello Records');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_canzone`
--

DROP TABLE IF EXISTS `album_canzone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album_canzone` (
  `idAlbum` int NOT NULL,
  `idCanzone` int NOT NULL,
  PRIMARY KEY (`idAlbum`,`idCanzone`),
  KEY `idCanzone` (`idCanzone`),
  CONSTRAINT `album_canzone_ibfk_1` FOREIGN KEY (`idAlbum`) REFERENCES `album` (`idAlbum`),
  CONSTRAINT `album_canzone_ibfk_2` FOREIGN KEY (`idCanzone`) REFERENCES `canzone` (`idCanzone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_canzone`
--

LOCK TABLES `album_canzone` WRITE;
/*!40000 ALTER TABLE `album_canzone` DISABLE KEYS */;
INSERT INTO `album_canzone` VALUES (1,1),(1,2),(2,3),(2,4),(3,5),(3,6),(4,7),(4,8),(5,9),(1,10);
/*!40000 ALTER TABLE `album_canzone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista` (
  `idArtista` int NOT NULL AUTO_INCREMENT,
  `nomeReale` varchar(100) DEFAULT NULL,
  `nomeArte` varchar(100) NOT NULL,
  `nazionalita` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idArtista`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
INSERT INTO `artista` VALUES (1,'Marshall Mathers','Eminem','USA'),(2,'Adele Laurie Blue Adkins','Adele','UK'),(3,'Shawn Corey Carter','Jay-Z','USA'),(4,'Billie Eilish Pirate Baird O\'Connell','Billie Eilish','USA'),(5,'Francesco Tarducci','Nesli','Italia'),(6,'Stefano Tognini','Marracash','Italia'),(7,'Robyn Fenty','Rihanna','Barbados');
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canzone`
--

DROP TABLE IF EXISTS `canzone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canzone` (
  `idCanzone` int NOT NULL AUTO_INCREMENT,
  `titolo` varchar(100) NOT NULL,
  `durata` time DEFAULT NULL,
  `dataUscita` date DEFAULT NULL,
  `casaDiscografica` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCanzone`),
  KEY `casaDiscografica_idx` (`casaDiscografica`),
  CONSTRAINT `casaDiscografica` FOREIGN KEY (`casaDiscografica`) REFERENCES `casa_discografica` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canzone`
--

LOCK TABLES `canzone` WRITE;
/*!40000 ALTER TABLE `canzone` DISABLE KEYS */;
INSERT INTO `canzone` VALUES (1,'The Real Slim Shady','00:04:44','2000-05-23','Interscope Records'),(2,'Stan','00:06:44','2000-11-21','Interscope Records'),(3,'Rolling in the Deep','00:03:48','2010-11-29','Columbia Records'),(4,'Someone Like You','00:04:45','2011-01-24','Columbia Records'),(5,'Izzo (H.O.V.A.)','00:04:00','2001-08-20','Roc-A-Fella Records'),(6,'Takeover','00:05:13','2001-09-11','Roc-A-Fella Records'),(7,'bad guy','00:03:14','2019-03-29','Interscope Records'),(8,'when the party\'s over','00:03:16','2018-10-17','Interscope Records'),(9,'Buongiorno','00:03:45','2012-09-10','Carosello Records'),(10,'Love The Way You Lie','00:04:23','2010-06-22','Interscope Records');
/*!40000 ALTER TABLE `canzone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casa_discografica`
--

DROP TABLE IF EXISTS `casa_discografica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casa_discografica` (
  `nome` varchar(50) NOT NULL,
  `indirizzo` varchar(30) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casa_discografica`
--

LOCK TABLES `casa_discografica` WRITE;
/*!40000 ALTER TABLE `casa_discografica` DISABLE KEYS */;
INSERT INTO `casa_discografica` VALUES ('Carosello Records','Milano, Italia','+39-02-3659-1240'),('Columbia Records','New York City, New York','+1-212-833-4000'),('Interscope Records','Santa Monica, California','+1-310-865-1000'),('Roc-A-Fella Records','New York City, New York','+1-212-841-8000'),('XL Recordings','London, England','+44-20-7636-7777');
/*!40000 ALTER TABLE `casa_discografica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genere`
--

DROP TABLE IF EXISTS `genere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genere` (
  `nomeGenere` varchar(50) NOT NULL,
  PRIMARY KEY (`nomeGenere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genere`
--

LOCK TABLES `genere` WRITE;
/*!40000 ALTER TABLE `genere` DISABLE KEYS */;
INSERT INTO `genere` VALUES ('Alternative'),('Hip-Hop'),('Pop'),('R&B'),('Rock'),('Soul');
/*!40000 ALTER TABLE `genere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genere_canzone`
--

DROP TABLE IF EXISTS `genere_canzone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genere_canzone` (
  `idCanzone` int NOT NULL,
  `nomeGenere` varchar(50) NOT NULL,
  PRIMARY KEY (`idCanzone`,`nomeGenere`),
  KEY `nomeGenere` (`nomeGenere`),
  CONSTRAINT `genere_canzone_ibfk_1` FOREIGN KEY (`idCanzone`) REFERENCES `canzone` (`idCanzone`),
  CONSTRAINT `genere_canzone_ibfk_2` FOREIGN KEY (`nomeGenere`) REFERENCES `genere` (`nomeGenere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genere_canzone`
--

LOCK TABLES `genere_canzone` WRITE;
/*!40000 ALTER TABLE `genere_canzone` DISABLE KEYS */;
INSERT INTO `genere_canzone` VALUES (8,'Alternative'),(1,'Hip-Hop'),(2,'Hip-Hop'),(5,'Hip-Hop'),(6,'Hip-Hop'),(9,'Hip-Hop'),(10,'Hip-Hop'),(7,'Pop'),(3,'Soul'),(4,'Soul');
/*!40000 ALTER TABLE `genere_canzone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interpretazione_canzone`
--

DROP TABLE IF EXISTS `interpretazione_canzone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interpretazione_canzone` (
  `idArtista` int NOT NULL,
  `idCanzone` int NOT NULL,
  PRIMARY KEY (`idArtista`,`idCanzone`),
  KEY `idCanzone` (`idCanzone`),
  CONSTRAINT `interpretazione_canzone_ibfk_1` FOREIGN KEY (`idArtista`) REFERENCES `artista` (`idArtista`),
  CONSTRAINT `interpretazione_canzone_ibfk_2` FOREIGN KEY (`idCanzone`) REFERENCES `canzone` (`idCanzone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interpretazione_canzone`
--

LOCK TABLES `interpretazione_canzone` WRITE;
/*!40000 ALTER TABLE `interpretazione_canzone` DISABLE KEYS */;
INSERT INTO `interpretazione_canzone` VALUES (1,1),(1,2),(2,3),(2,4),(3,5),(3,6),(4,7),(4,8),(5,9),(1,10),(7,10);
/*!40000 ALTER TABLE `interpretazione_canzone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `idPlaylist` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descrizione` text,
  `dataCreazione` date NOT NULL,
  `utente` varchar(50) NOT NULL,
  PRIMARY KEY (`idPlaylist`),
  KEY `playlist_ibfk_1` (`utente`),
  CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`utente`) REFERENCES `utente` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (1,'Hip-Hop Classics','I migliori classici hip-hop','2024-03-01','luca_rossi'),(2,'Soul Vibes','Canzoni soul per rilassarsi','2024-03-05','vincent'),(3,'Modern Mix','Pop e alternative contemporanei','2024-02-20','johnSmith92');
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_canzone`
--

DROP TABLE IF EXISTS `playlist_canzone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_canzone` (
  `idPlaylist` int NOT NULL,
  `idCanzone` int NOT NULL,
  `dataAggiuntaCanzone` datetime NOT NULL,
  PRIMARY KEY (`idPlaylist`,`idCanzone`),
  KEY `idCanzone` (`idCanzone`),
  CONSTRAINT `playlist_canzone_ibfk_1` FOREIGN KEY (`idPlaylist`) REFERENCES `playlist` (`idPlaylist`),
  CONSTRAINT `playlist_canzone_ibfk_2` FOREIGN KEY (`idCanzone`) REFERENCES `canzone` (`idCanzone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_canzone`
--

LOCK TABLES `playlist_canzone` WRITE;
/*!40000 ALTER TABLE `playlist_canzone` DISABLE KEYS */;
INSERT INTO `playlist_canzone` VALUES (1,1,'2025-06-02 01:07:17'),(1,5,'2025-04-12 10:01:10'),(1,6,'2025-05-22 00:01:12'),(2,3,'2025-06-02 01:12:44'),(2,4,'2025-05-10 21:15:40'),(3,7,'2025-03-02 11:10:24'),(3,8,'2025-05-02 03:25:35'),(3,10,'2025-05-17 09:27:23');
/*!40000 ALTER TABLE `playlist_canzone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pubblicazione_album`
--

DROP TABLE IF EXISTS `pubblicazione_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pubblicazione_album` (
  `idArtista` int NOT NULL,
  `idAlbum` int NOT NULL,
  PRIMARY KEY (`idArtista`,`idAlbum`),
  KEY `idAlbum` (`idAlbum`),
  CONSTRAINT `pubblicazione_album_ibfk_1` FOREIGN KEY (`idArtista`) REFERENCES `artista` (`idArtista`),
  CONSTRAINT `pubblicazione_album_ibfk_2` FOREIGN KEY (`idAlbum`) REFERENCES `album` (`idAlbum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pubblicazione_album`
--

LOCK TABLES `pubblicazione_album` WRITE;
/*!40000 ALTER TABLE `pubblicazione_album` DISABLE KEYS */;
INSERT INTO `pubblicazione_album` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `pubblicazione_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riproduzione_canzone`
--

DROP TABLE IF EXISTS `riproduzione_canzone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riproduzione_canzone` (
  `utente` varchar(25) NOT NULL,
  `idCanzone` int NOT NULL,
  `dataRiproduzione` datetime NOT NULL,
  PRIMARY KEY (`utente`,`idCanzone`),
  KEY `idCanzone` (`idCanzone`),
  CONSTRAINT `riproduzione_canzone_ibfk_1` FOREIGN KEY (`utente`) REFERENCES `utente` (`username`),
  CONSTRAINT `riproduzione_canzone_ibfk_2` FOREIGN KEY (`idCanzone`) REFERENCES `canzone` (`idCanzone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riproduzione_canzone`
--

LOCK TABLES `riproduzione_canzone` WRITE;
/*!40000 ALTER TABLE `riproduzione_canzone` DISABLE KEYS */;
INSERT INTO `riproduzione_canzone` VALUES ('emma_jones',2,'2025-05-05 12:15:00'),('emma_jones',9,'2025-05-05 13:00:00'),('johnSmith92',6,'2025-05-04 19:05:00'),('johnSmith92',10,'2025-05-04 18:20:00'),('luca_rossi',1,'2025-05-01 08:30:00'),('luca_rossi',5,'2025-05-01 09:15:00'),('marioB',3,'2025-05-02 14:20:00'),('marioB',7,'2025-05-02 15:05:00'),('vincent',4,'2025-05-03 10:45:00'),('vincent',8,'2025-05-03 11:30:00');
/*!40000 ALTER TABLE `riproduzione_canzone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segue`
--

DROP TABLE IF EXISTS `segue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `segue` (
  `utente` varchar(25) NOT NULL,
  `idArtista` int NOT NULL,
  PRIMARY KEY (`utente`,`idArtista`),
  KEY `segue_ibfk_2` (`idArtista`),
  CONSTRAINT `segue_ibfk_1` FOREIGN KEY (`utente`) REFERENCES `utente` (`username`),
  CONSTRAINT `segue_ibfk_2` FOREIGN KEY (`idArtista`) REFERENCES `artista` (`idArtista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segue`
--

LOCK TABLES `segue` WRITE;
/*!40000 ALTER TABLE `segue` DISABLE KEYS */;
INSERT INTO `segue` VALUES ('emma_jones',1),('luca_rossi',1),('marioB',2),('vincent',2),('johnSmith92',3),('luca_rossi',3),('emma_jones',4),('marioB',4),('vincent',5),('johnSmith92',7);
/*!40000 ALTER TABLE `segue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `username` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dataNascita` date NOT NULL,
  `paese` varchar(15) DEFAULT NULL,
  `dataRegistrazione` datetime NOT NULL,
  `tipoAbbonamento` varchar(15) NOT NULL DEFAULT 'Free',
  `dataUltimoAccesso` datetime NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES ('emma_jones','emma.j@example.com','6f1c15458c34d33c76ab2db672cc166f1a0c5314','1998-09-05','UK','2023-12-05 05:02:10','Base','2025-05-25 01:03:24'),('johnSmith92','john.smith@example.com','58f831106d1d1c79fa5f9f83590d206246ca85de','1992-03-18','USA','2024-01-20 10:10:02','Premium','2025-07-01 08:05:03'),('luca_rossi','luca.rossi@example.com','5f4c28410a3a60ba38d1588c5a8f78a5971f9962','1990-05-15','Italia','2024-01-01 23:00:56','Premium','2025-03-12 02:54:10'),('marioB','mario.b@example.com','64cd299ebc50489dee363c5f606677340031b177','1988-11-30','Italia','2024-02-15 13:03:00','Base','2025-02-20 20:02:03'),('vincent','vincent.aronne95@example.com','9d321a4881ee91e45a2a5625b045d39f5b98dbbd','1995-07-22','Francia','2023-11-10 20:07:50','Premium','2024-06-15 10:20:05');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-02  6:29:55
