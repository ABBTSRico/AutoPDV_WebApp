CREATE DATABASE  IF NOT EXISTS `Anlagedaten` /*!40100 DEFAULT CHARACTER SET utf8 */;

CREATE USER 'abbtsAA'@'localhost' IDENTIFIED BY 'abbtsAA';
GRANT ALL ON *.* TO 'abbtsAA'@'localhost' WITH GRANT OPTION;

CREATE USER 'abbtsAB'@'localhost' IDENTIFIED BY 'abbtsAB';
GRANT ALL ON *.* TO 'abbtsAB'@'localhost' WITH GRANT OPTION;

USE `Anlagedaten`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 192.168.1.102    Database: Anlagedaten
-- ------------------------------------------------------
-- Server version	8.0.15

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
-- Table structure for table `ANLAGE`
--

DROP TABLE IF EXISTS `ANLAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ANLAGE` (
  `AnID` int(11) NOT NULL AUTO_INCREMENT,
  `VnID` int(11) NOT NULL,
  `NeID` int(11) NOT NULL,
  `AKS_Bezeichnung` int(5) unsigned zerofill NOT NULL,
  `Anlagename` varchar(45) NOT NULL,
  `Kurzzeichen` varchar(3) NOT NULL,
  `Adresse` varchar(45) DEFAULT NULL,
  `OrtID` int(11) DEFAULT NULL,
  `Telefon` varchar(45) DEFAULT NULL,
  `Baujahr` int(4) DEFAULT '-1',
  `Geloescht` tinyint(1) NOT NULL,
  `Datum` datetime NOT NULL,
  `Visum` varchar(16) NOT NULL,
  PRIMARY KEY (`AnID`),
  UNIQUE KEY `AnID_UNIQUE` (`AnID`),
  UNIQUE KEY `Anlagename_UNIQUE` (`Anlagename`),
  UNIQUE KEY `Kurzzeichen_UNIQUE` (`Kurzzeichen`),
  KEY `fk_VnID` (`VnID`),
  KEY `fk_NeID` (`NeID`),
  KEY `fk_OrtID_on_ANLAGE` (`OrtID`),
  CONSTRAINT `fk_NeID` FOREIGN KEY (`NeID`) REFERENCES `NETZEBENE` (`NeID`),
  CONSTRAINT `fk_OrtID_on_ANLAGE` FOREIGN KEY (`OrtID`) REFERENCES `ORT` (`OrtID`),
  CONSTRAINT `fk_VnID` FOREIGN KEY (`VnID`) REFERENCES `VERTEILNETZ` (`VnID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ANLAGE`
--

LOCK TABLES `ANLAGE` WRITE;
/*!40000 ALTER TABLE `ANLAGE` DISABLE KEYS */;
INSERT INTO `ANLAGE` VALUES (1,1,4,00012,'UW Altstetten Alt','ALT','',10,'',1955,1,'1970-01-01 00:00:00','-'),(2,1,4,00012,'UW Altstetten Neu','ALN','',10,'',1992,0,'1970-01-01 00:00:00','-'),(3,1,4,00002,'UW Aubrugg','AUB','',11,'',1961,0,'1970-01-01 00:00:00','-'),(4,1,2,00003,'UW Auwiesen','AWI','',11,'',-1,0,'1970-01-01 00:00:00','-'),(5,1,4,00001,'UW Binz','BIN','',12,'',1953,0,'1970-01-01 00:00:00','-'),(6,1,4,00009,'UW Drahtzug','DRA','',6,'',1985,0,'1970-01-01 00:00:00','-'),(7,1,1,00003,'UW Fällanden','FAL','',14,'',1958,0,'2019-09-02 19:05:23','ricop'),(8,1,4,00003,'UW Frohalp','FRO','',8,'',1968,0,'1970-01-01 00:00:00','-'),(9,1,4,00006,'UW Herdern','HER','Pfingstweidstrasse 85',5,'',1971,0,'2019-08-29 07:11:47','ewzhabm'),(10,1,4,00004,'UW Hönggerberg','HON','',9,'',1966,0,'1970-01-01 00:00:00','-'),(11,1,4,00010,'UW Irchel','IRC','',13,'',1985,1,'1970-01-01 00:00:00','-'),(12,1,4,00007,'UW Katz','KTZ','Badweg 3',2,'058 319 35 00',1977,0,'1970-01-01 00:00:00','-'),(13,1,4,00011,'UW Letten Neu','LEN','',7,'',1997,0,'1970-01-01 00:00:00','-'),(14,1,2,00000,'UW Obfelden','OBF','',16,'',-1,0,'1970-01-01 00:00:00','-'),(15,1,4,00000,'UW Oerlikon','OER','',11,'',1949,0,'1970-01-01 00:00:00','-'),(16,1,4,00014,'UW Oerlikon Neu','OEN','',11,'',2014,0,'2019-09-02 19:13:39','ricop'),(17,1,2,00001,'UW Samstagern','SAM','',15,'',1961,0,'1970-01-01 00:00:00','-'),(18,1,4,00005,'UW Sempersteig','SEM','',2,'',1969,1,'1970-01-01 00:00:00','-'),(19,1,4,00008,'UW Sihlfeld','SIF','',3,'',1981,0,'1970-01-01 00:00:00','-'),(20,1,4,00013,'UW Zeughaus','ZHS','',4,'',1996,0,'1970-01-01 00:00:00','-'),(21,2,2,00001,'UW Sils Albula','SIA','',1,'',-1,0,'1970-01-01 00:00:00','-'),(22,1,6,00070,'GR Farbhof','FAR','Hohlstrasse 694',10,'',-1,0,'1970-01-01 00:00:00','-'),(23,1,6,10015,'GR Mülligen','MUE',NULL,NULL,NULL,-1,0,'1970-01-01 00:00:00','-'),(27,1,1,10016,'GR Wagonsfabrik','WAG','',3,'',2019,0,'1970-01-01 00:00:00','-'),(28,1,6,00016,'GR Ringwiese','RGW','',22,'',-1,0,'1970-01-01 00:00:00','-'),(39,1,1,00009,'TestAnlage9','PER','Teststrasse',18,'',1949,1,'2019-09-07 14:40:17','ricop'),(40,1,1,00009,'Testanlage2','PEQ','Teststrasse',18,'',1950,0,'2019-09-09 18:21:32','ewzhabm');
/*!40000 ALTER TABLE `ANLAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BAUTEIL`
--

DROP TABLE IF EXISTS `BAUTEIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BAUTEIL` (
  `BtID` int(11) NOT NULL AUTO_INCREMENT,
  `Index` int(11) NOT NULL,
  `BmID` int(11) NOT NULL,
  `FkID` int(11) NOT NULL,
  `BmTID` int(11) NOT NULL,
  PRIMARY KEY (`BtID`),
  KEY `fk_BmID_on_BAUTEIL` (`BmID`),
  KEY `fk_FkID` (`FkID`),
  KEY `fk_BmTID` (`BmTID`),
  CONSTRAINT `fk_BmID_on_BAUTEIL` FOREIGN KEY (`BmID`) REFERENCES `BETRIEBSMITTEL` (`BmID`),
  CONSTRAINT `fk_BmTID` FOREIGN KEY (`BmTID`) REFERENCES `BETRIEBSMITTELTYP` (`BmTID`),
  CONSTRAINT `fk_FkID` FOREIGN KEY (`FkID`) REFERENCES `FUNKTION` (`FkID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BAUTEIL`
--

LOCK TABLES `BAUTEIL` WRITE;
/*!40000 ALTER TABLE `BAUTEIL` DISABLE KEYS */;
INSERT INTO `BAUTEIL` VALUES (1,1,1,1,8),(2,1,2,1,8),(3,1,3,1,8),(4,2,1,1,8),(5,2,2,1,8),(6,2,3,1,8),(7,1,4,2,2),(8,1,5,2,2),(9,1,6,2,2),(10,1,7,2,1),(11,1,8,2,3),(12,1,9,2,3),(13,1,16,1,1),(14,1,17,1,1),(15,1,18,1,1),(16,2,16,1,1),(17,2,17,1,1),(18,2,18,1,1),(21,3,1,1,8),(42,1,131,1,8),(43,1,132,1,8),(50,4,1,1,8);
/*!40000 ALTER TABLE `BAUTEIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BENUTZERGRUPPE`
--

DROP TABLE IF EXISTS `BENUTZERGRUPPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BENUTZERGRUPPE` (
  `GrID` int(11) NOT NULL AUTO_INCREMENT,
  `Gruppenname` varchar(45) NOT NULL,
  `Berechtigungen` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`GrID`),
  UNIQUE KEY `Gruppenname_UNIQUE` (`Gruppenname`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BENUTZERGRUPPE`
--

LOCK TABLES `BENUTZERGRUPPE` WRITE;
/*!40000 ALTER TABLE `BENUTZERGRUPPE` DISABLE KEYS */;
INSERT INTO `BENUTZERGRUPPE` VALUES (1,'Administrator','Alle\r'),(2,'Anlagebewirtschafter','CRUD Analgedaten\r'),(3,'Linienvorgesetzter','CRUD Prüflose\r'),(4,'Prüfer','U Prüflose\r'),(5,'Vorlagenverwalter','CRUD Vorlagen\r'),(6,'Benutzerverwalter','Grant Option');
/*!40000 ALTER TABLE `BENUTZERGRUPPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BETRIEBSMITTEL`
--

DROP TABLE IF EXISTS `BETRIEBSMITTEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BETRIEBSMITTEL` (
  `BmID` int(11) NOT NULL AUTO_INCREMENT,
  `Equipment` int(8) NOT NULL,
  `Bezeichnung` varchar(45) NOT NULL,
  `FeID` int(11) NOT NULL,
  `AKS_Bezeichnung` varchar(45) NOT NULL,
  `ProtVoID` int(11) NOT NULL,
  `SerienNr` varchar(45) DEFAULT NULL,
  `Geloescht` tinyint(1) NOT NULL,
  `Datum` datetime NOT NULL,
  `Visum` varchar(16) NOT NULL,
  PRIMARY KEY (`BmID`),
  UNIQUE KEY `Equipment_UNIQUE` (`Equipment`),
  KEY `fk_FeID` (`FeID`),
  KEY `fk_ProtVoID` (`ProtVoID`),
  CONSTRAINT `fk_FeID` FOREIGN KEY (`FeID`) REFERENCES `FELD` (`FeID`),
  CONSTRAINT `fk_ProtVoID` FOREIGN KEY (`ProtVoID`) REFERENCES `PROTOKOLLVORLAGE` (`ProtVoID`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BETRIEBSMITTEL`
--

LOCK TABLES `BETRIEBSMITTEL` WRITE;
/*!40000 ALTER TABLE `BETRIEBSMITTEL` DISABLE KEYS */;
INSERT INTO `BETRIEBSMITTEL` VALUES (1,11093627,'R',1,'BA1',1,'2014.1712.01/004/R',0,'2019-09-08 18:54:20','ewzhabm'),(2,11093628,'S',1,'BA1',1,'2014.1712.01/004/S',0,'2019-09-08 18:54:20','ewzhabm'),(3,11093629,'T',1,'BA1',1,'2014.1712.01/004/T',0,'2019-09-08 18:54:20','ewzhabm'),(4,11093630,'R',1,'BC1',2,'2014.2217.01/001',0,'2019-09-03 09:57:12','ewzhabm'),(5,11093631,'S',1,'BC1',2,'2014.2217.01/008',0,'2019-09-03 09:57:12','ewzhabm'),(6,11093632,'T',1,'BC1',2,'2014.2217.01/007',0,'2019-09-03 09:57:13','ewzhabm'),(7,11093633,'R',1,'BC7',2,'2014.2277.01/003',0,'2019-09-07 13:14:24','ricop'),(8,11093634,'S',1,'BC7',2,'2014.2277.01/002',0,'2019-09-07 13:14:24','ricop'),(9,11093635,'T',1,'BC7',2,'2014.2277.01/001',0,'2019-09-07 13:14:24','ricop'),(10,11093665,'R',2,'BC1',2,'2014.2217.02/001\r',0,'1970-01-01 00:00:00','-'),(11,11093666,'S',2,'BC1',2,'2014.2217.02/004\r',0,'1970-01-01 00:00:00','-'),(12,11093667,'T',2,'BC1',2,'2014.2217.02/001\r',0,'1970-01-01 00:00:00','-'),(13,11093668,'R',2,'BC9',2,'2014.2277.01/006\r',0,'1970-01-01 00:00:00','-'),(14,11093669,'S',2,'BC9',2,'2014.2277.01/005\r',0,'1970-01-01 00:00:00','-'),(15,11093670,'T',2,'BC9',2,'2014.2277.01/004\r',0,'1970-01-01 00:00:00','-'),(16,11112289,'R',3,'BA9',1,'XYX\r',0,'1970-01-01 00:00:00','-'),(17,11112290,'S',3,'BA9',1,'XYY\r',0,'1970-01-01 00:00:00','-'),(18,11112291,'T',3,'BA9',1,'XYZ\r',0,'1970-01-01 00:00:00','-'),(131,987632,'R',1,'BA7',1,'12355',1,'2019-09-07 14:41:12','ricop'),(132,987633,'S',1,'BA7',1,'1235',1,'2019-09-07 14:41:12','ricop'),(133,987634,'T',1,'BA7',1,'1236',0,'2019-09-07 13:16:58','ricop');
/*!40000 ALTER TABLE `BETRIEBSMITTEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BETRIEBSMITTELKLASSE`
--

DROP TABLE IF EXISTS `BETRIEBSMITTELKLASSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BETRIEBSMITTELKLASSE` (
  `BmKlID` varchar(1) NOT NULL,
  `Tabellenverweis` varchar(45) NOT NULL,
  PRIMARY KEY (`BmKlID`),
  UNIQUE KEY `Tabellenverweis_UNIQUE` (`Tabellenverweis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BETRIEBSMITTELKLASSE`
--

LOCK TABLES `BETRIEBSMITTELKLASSE` WRITE;
/*!40000 ALTER TABLE `BETRIEBSMITTELKLASSE` DISABLE KEYS */;
INSERT INTO `BETRIEBSMITTELKLASSE` VALUES ('P','SCHUTZGERAET\r'),('T','WANDLER\r');
/*!40000 ALTER TABLE `BETRIEBSMITTELKLASSE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BETRIEBSMITTELTYP`
--

DROP TABLE IF EXISTS `BETRIEBSMITTELTYP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BETRIEBSMITTELTYP` (
  `BmTID` int(11) NOT NULL AUTO_INCREMENT,
  `HeID` int(11) NOT NULL,
  `ArtikelNr` varchar(45) NOT NULL,
  `BmKlID` varchar(1) NOT NULL,
  PRIMARY KEY (`BmTID`),
  KEY `fk_HeID` (`HeID`),
  KEY `fk_BmKlID` (`BmKlID`),
  CONSTRAINT `fk_BmKlID` FOREIGN KEY (`BmKlID`) REFERENCES `BETRIEBSMITTELKLASSE` (`BmKlID`),
  CONSTRAINT `fk_HeID` FOREIGN KEY (`HeID`) REFERENCES `HERSTELLER` (`HeID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BETRIEBSMITTELTYP`
--

LOCK TABLES `BETRIEBSMITTELTYP` WRITE;
/*!40000 ALTER TABLE `BETRIEBSMITTELTYP` DISABLE KEYS */;
INSERT INTO `BETRIEBSMITTELTYP` VALUES (1,1,'EGK 245s-3','T'),(2,1,'JK ELK CN14s','T'),(3,1,'JKS','T'),(4,3,'SU170/S49','T'),(5,1,'JKS-S','T'),(6,2,'REF620','P'),(7,2,'REF620','P'),(8,1,'EGK 245s-3','T');
/*!40000 ALTER TABLE `BETRIEBSMITTELTYP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EINHEIT`
--

DROP TABLE IF EXISTS `EINHEIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EINHEIT` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `Einheitszeichen` varchar(45) NOT NULL,
  `Einheitsname` varchar(45) NOT NULL,
  PRIMARY KEY (`UID`),
  UNIQUE KEY `Einheitszeichen_UNIQUE` (`Einheitszeichen`),
  UNIQUE KEY `Einheitsname_UNIQUE` (`Einheitsname`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EINHEIT`
--

LOCK TABLES `EINHEIT` WRITE;
/*!40000 ALTER TABLE `EINHEIT` DISABLE KEYS */;
INSERT INTO `EINHEIT` VALUES (1,'V','Volt\r'),(2,'A','Amper\r'),(3,'W','Watt\r'),(4,'VA','Volt-Amper\r');
/*!40000 ALTER TABLE `EINHEIT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FELD`
--

DROP TABLE IF EXISTS `FELD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FELD` (
  `FeID` int(11) NOT NULL AUTO_INCREMENT,
  `InfObID` int(11) NOT NULL,
  `AKS_Bezeichnung` varchar(3) NOT NULL,
  `Feldbezeichnung` varchar(45) NOT NULL,
  `Geloescht` tinyint(1) NOT NULL,
  `Datum` datetime NOT NULL,
  `Visum` varchar(16) NOT NULL,
  PRIMARY KEY (`FeID`),
  KEY `fk_InfObID` (`InfObID`),
  CONSTRAINT `fk_InfObID` FOREIGN KEY (`InfObID`) REFERENCES `INFRASTRUKTUROBJEKT` (`InfObID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FELD`
--

LOCK TABLES `FELD` WRITE;
/*!40000 ALTER TABLE `FELD` DISABLE KEYS */;
INSERT INTO `FELD` VALUES (1,1,'Q01','LTG-OER',0,'2019-09-02 19:14:33','ricop'),(2,1,'Q02','TRA41',0,'2019-08-30 17:36:19','ewzhabm'),(3,2,'Q07','TRA43',0,'2019-08-31 00:28:30','ewzhabm'),(4,3,'Q01','LTG_FRO',0,'1970-01-01 00:00:00','-'),(5,3,'Q02','TRA41',0,'1970-01-01 00:00:00','-'),(6,3,'Q03','RST1',0,'1970-01-01 00:00:00','-'),(7,3,'Q04','KUPP',0,'1970-01-01 00:00:00','-'),(8,3,'Q05','TRA42',0,'1970-01-01 00:00:00','-'),(9,3,'Q06','LTG DRA',0,'1970-01-01 00:00:00','-'),(10,3,'Q07','LTG SIF',0,'1970-01-01 00:00:00','-'),(11,3,'Q08','TRA43',0,'1970-01-01 00:00:00','-'),(12,3,'Q09','LTG ZHS',0,'1970-01-01 00:00:00','-'),(15,6,'Q01','RST1',0,'1970-01-01 00:00:00','-'),(16,6,'Q02','TRA41',0,'1970-01-01 00:00:00','-'),(17,6,'Q03','LTG',0,'1970-01-01 00:00:00','-'),(18,6,'Q04','LTG',0,'1970-01-01 00:00:00','-'),(19,1,'Q03','LTG-AWI N',0,'2019-08-30 17:40:44','ewzhabm'),(20,1,'Q05','TESTX',0,'2019-09-03 08:04:22','ewzhabm'),(21,1,'Q23','TESXT',0,'2019-09-02 19:06:16','ricop'),(22,1,'Q24','TEXST',1,'2019-09-07 14:40:58','ricop'),(23,1,'Q04','LTG',0,'2019-09-03 08:02:33','ewzhabm'),(24,4,'Q02','LTG',0,'2019-09-03 09:40:43','ewzhabm'),(26,10,'Q01','TESTxx',0,'2019-09-04 18:48:39','ricop'),(27,1,'Q77','XTESTX',0,'2019-09-07 13:19:48','ricop');
/*!40000 ALTER TABLE `FELD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FUNKTION`
--

DROP TABLE IF EXISTS `FUNKTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FUNKTION` (
  `FkID` int(11) NOT NULL AUTO_INCREMENT,
  `Funktionsname` varchar(45) NOT NULL,
  `PDatVoID` int(11) NOT NULL,
  PRIMARY KEY (`FkID`),
  UNIQUE KEY `Funktionsname_UNIQUE` (`Funktionsname`),
  KEY `fk_PDatVoID` (`PDatVoID`),
  CONSTRAINT `fk_PDatVoID` FOREIGN KEY (`PDatVoID`) REFERENCES `PRUEFDATEIVORLAGE` (`PDatVoID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FUNKTION`
--

LOCK TABLES `FUNKTION` WRITE;
/*!40000 ALTER TABLE `FUNKTION` DISABLE KEYS */;
INSERT INTO `FUNKTION` VALUES (1,'U-Wandler',1),(2,'I-Wandler',2),(3,'Kombigerät',4),(4,'Diffschutz',5);
/*!40000 ALTER TABLE `FUNKTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HERSTELLER`
--

DROP TABLE IF EXISTS `HERSTELLER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HERSTELLER` (
  `HeID` int(11) NOT NULL AUTO_INCREMENT,
  `Herstellername` varchar(45) NOT NULL,
  `Addresse` varchar(45) DEFAULT NULL,
  `OrtID` int(11) DEFAULT NULL,
  `Telefon` varchar(45) DEFAULT NULL,
  `Mail` varchar(45) DEFAULT NULL,
  `Webseite` varchar(45) DEFAULT NULL,
  `Geloescht` tinyint(1) NOT NULL,
  PRIMARY KEY (`HeID`),
  UNIQUE KEY `Herstellername_UNIQUE` (`Herstellername`),
  KEY `fk_OrtID_on_HERSTELLER` (`OrtID`),
  CONSTRAINT `fk_OrtID_on_HERSTELLER` FOREIGN KEY (`OrtID`) REFERENCES `ORT` (`OrtID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HERSTELLER`
--

LOCK TABLES `HERSTELLER` WRITE;
/*!40000 ALTER TABLE `HERSTELLER` DISABLE KEYS */;
INSERT INTO `HERSTELLER` VALUES (1,'Pfiffner GmbH','Zusestrasse 6',1,'+49 482 1408 270','sales@pfiffner-messwandler.de','http://www.pfiffner-group.com/pde',0),(2,'ABB Schweiz AG','Brown Boveri Strasse 6',2,'+41 84 484 58 45','','',0),(3,'Trench Germany','Nürnberger Strasse 199',3,'+49 951 1803 0','','',0);
/*!40000 ALTER TABLE `HERSTELLER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INFRASTRUKTUROBJEKT`
--

DROP TABLE IF EXISTS `INFRASTRUKTUROBJEKT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INFRASTRUKTUROBJEKT` (
  `InfObID` int(11) NOT NULL AUTO_INCREMENT,
  `AnID` int(11) NOT NULL,
  `AKS_Bezeichnung` varchar(3) NOT NULL,
  `Infrastrukturobjektbezeichnung` varchar(45) NOT NULL,
  `Geloescht` tinyint(1) NOT NULL,
  `Datum` datetime NOT NULL,
  `Visum` varchar(16) NOT NULL,
  PRIMARY KEY (`InfObID`),
  KEY `fk_AnID` (`AnID`),
  CONSTRAINT `fk_AnID` FOREIGN KEY (`AnID`) REFERENCES `ANLAGE` (`AnID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INFRASTRUKTUROBJEKT`
--

LOCK TABLES `INFRASTRUKTUROBJEKT` WRITE;
/*!40000 ALTER TABLE `INFRASTRUKTUROBJEKT` DISABLE KEYS */;
INSERT INTO `INFRASTRUKTUROBJEKT` VALUES (1,16,'EC1','150kV-Anlage',0,'2019-09-02 19:14:02','ricop'),(2,9,'EC1','150kV-Anlage',0,'1970-01-01 00:00:00','-'),(3,12,'EC2','150kV-Anlage',0,'1970-01-01 00:00:00','-'),(4,16,'J1','22kV-Anlage',0,'1970-01-01 00:00:00','-'),(6,12,'J1','22kV-Anlage',0,'1970-01-01 00:00:00','-'),(8,16,'EC4','150kV-Anlage',0,'2019-09-02 19:05:40','ricop'),(10,39,'EC2','152kV-Anlage',0,'2019-09-04 18:47:22','ricop'),(11,16,'EC6','153kV-Anlage',1,'2019-09-07 14:40:49','ricop');
/*!40000 ALTER TABLE `INFRASTRUKTUROBJEKT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KLASSE`
--

DROP TABLE IF EXISTS `KLASSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KLASSE` (
  `KlID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`KlID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KLASSE`
--

LOCK TABLES `KLASSE` WRITE;
/*!40000 ALTER TABLE `KLASSE` DISABLE KEYS */;
INSERT INTO `KLASSE` VALUES (1,'0.2+3P\r'),(2,'5P20\r');
/*!40000 ALTER TABLE `KLASSE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LAND`
--

DROP TABLE IF EXISTS `LAND`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LAND` (
  `LandID` char(2) NOT NULL,
  `en` varchar(100) NOT NULL DEFAULT '',
  `de` varchar(100) NOT NULL DEFAULT '',
  `es` varchar(100) NOT NULL,
  `fr` varchar(100) NOT NULL,
  `it` varchar(100) NOT NULL,
  `ru` varchar(100) NOT NULL,
  PRIMARY KEY (`LandID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LAND`
--

LOCK TABLES `LAND` WRITE;
/*!40000 ALTER TABLE `LAND` DISABLE KEYS */;
INSERT INTO `LAND` VALUES ('AD','Andorra','Andorra','Andorra','ANDORRE','Andorra ','Андорра'),('AE','United Arab Emirates','Vereinigte Arabische Emirate','Emiratos Árabes Unidos','ÉMIRATS ARABES UNIS','Emirati Arabi Uniti ','ОАЭ'),('AF','Afghanistan','Afghanistan','Afganistán','AFGHANISTAN','Afghanistan','Афганистан'),('AG','Antigua and Barbuda','Antigua und Barbuda','Antigua y Barbuda','ANTIGUA-ET-BARBUDA','Antigua e Barbuda','Антигуа и Барбуда'),('AI','Anguilla','Anguilla','Anguila','ANGUILLA','Anguilla','Ангилья'),('AL','Albania','Albanien','Albania','ALBANIE','Albania ','Албания'),('AM','Armenia','Armenien','Armenia','ARMÉNIE','Armenia ','Армения'),('AN','Netherlands Antilles','Niederländische Antillen','Antillas Neerlandesas','','',''),('AO','Angola','Angola','Angola','ANGOLA','Angola ','Ангола'),('AQ','Antarctica','Antarktis','Antártida','ANTARCTIQUE','Antartide ','Антарктида'),('AR','Argentina','Argentinien','Argentina','ARGENTINE','Argentina ','Аргентина'),('AS','American Samoa','Amerikanisch-Samoa','Samoa Americana','SAMOA AMÉRICAINES','Samoa Americane','Американское Самоа'),('AT','Austria','Österreich','Austria','AUTRICHE','Austria','Австрия'),('AU','Australia','Australien','Australia','AUSTRALIE','Australia','Австралия'),('AW','Aruba','Aruba','Aruba','ARUBA','Aruba','Аруба'),('AX','Aland Islands','Åland','Islas Áland','ÅLAND, ÎLES','Isole Åland','Аландские острова'),('AZ','Azerbaijan','Aserbaidschan','Azerbaiyán','AZERBAÏDJAN','Azerbaigian','Азербайджан'),('BA','Bosnia and Herzegovina','Bosnien und Herzegowina','Bosnia y Herzegovina','BOSNIE-HERZÉGOVINE','Bosnia ed Erzegovina','Босния и Герцеговина'),('BB','Barbados','Barbados','Barbados','BARBADE','Barbados','Барбадос'),('BD','Bangladesh','Bangladesch','Bangladesh','BANGLADESH','Bangladesh','Бангладеш'),('BE','Belgium','Belgien','Bélgica','BELGIQUE','Belgio','Бельгия'),('BF','Burkina Faso','Burkina Faso','Burkina Faso','BURKINA FASO','Burkina Faso','Буркина-Фасо'),('BG','Bulgaria','Bulgarien','Bulgaria','BULGARIE','Bulgaria','Болгария'),('BH','Bahrain','Bahrain','Bahréin','BAHREÏN','Bahrein','Бахрейн'),('BI','Burundi','Burundi','Burundi','BURUNDI','Burundi','Бурунди'),('BJ','Benin','Benin','Benin','BÉNIN','Benin','Бенин'),('BL','Saint Barthelemy !Saint Barthélemy','Saint-Barthélemy','Saint Barthélemy','SAINT-BARTHÉLEMY','Saint-Barthélemy','Сен-Бартелеми'),('BM','Bermuda','Bermuda','Bermudas','BERMUDES','Bermuda','Бермуды'),('BN','Brunei','Brunei Darussalam','Brunéi','BRUNÉI DARUSSALAM','Brunei','Бруней'),('BO','Bolivia','Bolivien','Bolivia','BOLIVIE, ÉTAT PLURINATIONAL DE','Bolivia','Боливия'),('BQ','Bonaire, Sint Eustatius and Saba','Bonaire, Sint Eustatius und Saba','Bonaire, San Eustaquio y Saba','BONAIRE, SAINT-EUSTACHE ET SABA','Isole BES','Синт-Эстатиус и Саба'),('BR','Brazil','Brasilien','Brasil','BRÉSIL','Brasile','Бразилия'),('BS','Bahamas','Bahamas','Bahamas','BAHAMAS','Bahamas','Багамы'),('BT','Bhutan','Bhutan','Bhután','BHOUTAN','Bhutan','Бутан'),('BV','Bouvet Island','Bouvetinsel','Isla Bouvet','BOUVET, ÎLE','Isola Bouvet','Остров Буве'),('BW','Botswana','Botswana','Botsuana','BOTSWANA','Botswana','Ботсвана'),('BY','Belarus','Belarus (Weißrussland)','Belarús','BÉLARUS','Bielorussia','Белоруссия'),('BZ','Belize','Belize','Belice','BELIZE','Belize','Белиз'),('CA','Canada','Kanada','Canadá','CANADA','Canada','Канада'),('CC','Cocos (Keeling) Islands','Kokosinseln (Keelinginseln)','Islas Cocos','COCOS (KEELING), ÎLES','Isole Cocos (Keeling)','Кокосовые острова'),('CD','Congo (Kinshasa)','Kongo','Congo','CONGO, LA RÉPUBLIQUE DÉMOCRATIQUE DU','RD del Congo','Демократическая Республика Конго'),('CF','Central African Republic','Zentralafrikanische Republik','República Centro-Africana','CENTRAFRICAINE, RÉPUBLIQUE','Rep. Centrafricana','ЦАР'),('CG','Congo (Brazzaville)','Republik Kongo','Congo','CONGO','Rep. del Congo','Республика Конго'),('CH','Switzerland','Schweiz','Suiza','SUISSE','Svizzera','Швейцария'),('CI','Ivory Coast','Elfenbeinküste','Costa de Marfil','CÔTE D’IVOIRE','Costa d\'Avorio','Кот-д’Ивуар'),('CK','Cook Islands','Cookinseln','Islas Cook','COOK, ÎLES','Isole Cook','Острова Кука'),('CL','Chile','Chile','Chile','CHILI','Cile','Чили'),('CM','Cameroon','Kamerun','Camerún','CAMEROUN','Camerun','Камерун'),('CN','China','China, Volksrepublik','China','CHINE','Cina','КНР (Китайская Народная Республика)'),('CO','Colombia','Kolumbien','Colombia','COLOMBIE','Colombia','Колумбия'),('CR','Costa Rica','Costa Rica','Costa Rica','COSTA RICA','Costa Rica','Коста-Рика'),('CU','Cuba','Kuba','Cuba','CUBA','Cuba','Куба'),('CV','Cape Verde','Kap Verde','Cabo Verde','CABO VERDE','Capo Verde','Кабо-Верде'),('CW','Curacao !Curaçao','Curaçao','Curaçao','CURAÇAO','Curaçao','Кюрасао'),('CX','Christmas Island','Weihnachtsinsel','Islas Christmas','CHRISTMAS, ÎLE','Isola di Natale','Остров Рождества'),('CY','Cyprus','Zypern','Chipre','CHYPRE','Cipro','Кипр'),('CZ','Czech Republic','Tschechische Republik','República Checa','TCHÈQUE, RÉPUBLIQUE','Rep. Ceca','Чехия'),('DE','Germany','Deutschland','Alemania','ALLEMAGNE','Germania','Германия'),('DJ','Djibouti','Dschibuti','Yibuti','DJIBOUTI','Gibuti','Джибути'),('DK','Denmark','Dänemark','Dinamarca','DANEMARK','Danimarca','Дания'),('DM','Dominica','Dominica','Domínica','DOMINIQUE','Dominica','Доминика'),('DO','Dominican Republic','Dominikanische Republik','República Dominicana','DOMINICAINE, RÉPUBLIQUE','Rep. Dominicana','Доминиканская Республика'),('DZ','Algeria','Algerien','Argelia','ALGÉRIE','Algeria','Алжир'),('EC','Ecuador','Ecuador','Ecuador','ÉQUATEUR','Ecuador','Эквадор'),('EE','Estonia','Estland (Reval)','Estonia','ESTONIE','Estonia','Эстония'),('EG','Egypt','Ägypten','Egipto','ÉGYPTE','Egitto','Египет'),('EH','Western Sahara','Westsahara','Sahara Occidental','SAHARA OCCIDENTAL','Sahara Occidentale','САДР'),('ER','Eritrea','Eritrea','Eritrea','ÉRYTHRÉE','Eritrea','Эритрея'),('ES','Spain','Spanien','España','ESPAGNE','Spagna','Испания'),('ET','Ethiopia','Äthiopien','Etiopía','ÉTHIOPIE','Etiopia','Эфиопия'),('FI','Finland','Finnland','Finlandia','FINLANDE','Finlandia','Финляндия'),('FJ','Fiji','Fidschi','Fiji','FIDJI','Figi','Фиджи'),('FK','Falkland Islands','Falklandinseln (Malwinen)','Islas Malvinas','FALKLAND, ÎLES (MALVINAS)','Isole Falkland','Фолклендские острова'),('FM','Micronesia','Mikronesien','Micronesia','MICRONÉSIE, ÉTATS FÉDÉRÉS DE','Micronesia','Микронезия'),('FO','Faroe Islands','Färöer','Islas Faroe','FÉROÉ, ÎLES','Fær Øer','Фареры'),('FR','France','Frankreich','Francia','FRANCE','Francia','Франция'),('GA','Gabon','Gabun','Gabón','GABON','Gabon','Габон'),('GB','United Kingdom','Großbritannien und Nordirland','Reino Unido','ROYAUME-UNI','Regno Unito','Великобритания'),('GD','Grenada','Grenada','Granada','GRENADE','Grenada','Гренада'),('GE','Georgia','Georgien','Georgia','GÉORGIE','Georgia','Грузия'),('GF','French Guiana','Französisch-Guayana','Guayana Francesa','GUYANE FRANÇAISE','Guyana francese','Гвиана'),('GG','Guernsey','Guernsey (Kanalinsel)','Guernsey','GUERNESEY','Guernsey','Гернси'),('GH','Ghana','Ghana','Ghana','GHANA','Ghana','Гана'),('GI','Gibraltar','Gibraltar','Gibraltar','GIBRALTAR','Gibilterra','Гибралтар'),('GL','Greenland','Grönland','Groenlandia','GROENLAND','Groenlandia','Гренландия'),('GM','Gambia','Gambia','Gambia','GAMBIE','Gambia','Гамбия'),('GN','Guinea','Guinea','Guinea','GUINÉE','Guinea','Гвинея'),('GP','Guadeloupe','Guadeloupe','Guadalupe','GUADELOUPE','Guadalupa','Гваделупа'),('GQ','Equatorial Guinea','Äquatorialguinea','Guinea Ecuatorial','GUINÉE ÉQUATORIALE','Guinea Equatoriale','Экваториальная Гвинея'),('GR','Greece','Griechenland','Grecia','GRÈCE','Grecia ','Греция'),('GS','South Georgia and the South Sandwich Islands','Südgeorgien und die Südl. Sandwichinseln','Georgia del Sur e Islas Sandwich del Sur','GÉORGIE DU SUD ET LES ÎLES SANDWICH DU SUD','Georgia del Sud e isole Sandwich meridionali','Южная Георгия и Южные Сандвичевы Острова'),('GT','Guatemala','Guatemala','Guatemala','GUATEMALA','Guatemala','Гватемала'),('GU','Guam','Guam','Guam','GUAM','Guam','Гуам'),('GW','Guinea-Bissau','Guinea-Bissau','Guinea-Bissau','GUINÉE-BISSAU','Guinea-Bissau','Гвинея-Бисау'),('GY','Guyana','Guyana','Guayana','GUYANA','Guyana','Гайана'),('HK','Hong Kong S.A.R., China','Hongkong','Hong Kong','HONG KONG','Hong Kong','Гонконг'),('HM','Heard Island and McDonald Islands','Heard- und McDonald-Inseln','Islas Heard y McDonald','HEARD ET MACDONALD, ÎLES','Isole Heard e McDonald','Херд и Макдональд'),('HN','Honduras','Honduras','Honduras','HONDURAS','Honduras','Гондурас'),('HR','Croatia','Kroatien','Croacia','CROATIE','Croazia','Хорватия'),('HT','Haiti','Haiti','Haití','HAÏTI','Haiti ','Гаити'),('HU','Hungary','Ungarn','Hungría','HONGRIE','Ungheria','Венгрия'),('ID','Indonesia','Indonesien','Indonesia','INDONÉSIE','Indonesia','Индонезия'),('IE','Ireland','Irland','Irlanda','IRLANDE','Irlanda ','Флаг Ирландии Ирландия'),('IL','Israel','Israel','Israel','ISRAËL','Israele ','Израиль'),('IM','Isle of Man','Insel Man','Isla de Man','ÎLE DE MAN','Isola di Man','Остров Мэн'),('IN','India','Indien','India','INDE','India ','Индия Индия'),('IO','British Indian Ocean Territory','Britisches Territorium im Indischen Ozean','Territorio Británico del Océano Índico','OCÉAN INDIEN, TERRITOIRE BRITANNIQUE DE L\'','Territorio britannico dell\'oceano','Британская территория в Индийском океане'),('IQ','Iraq','Irak','Irak','IRAQ','Iraq ','Ирак'),('IR','Iran','Iran','Irán','IRAN, RÉPUBLIQUE ISLAMIQUE D\'','Iran ','Иран'),('IS','Iceland','Island','Islandia','ISLANDE','Islanda ','Исландия'),('IT','Italy','Italien','Italia','ITALIE','Italia ','Италия'),('JE','Jersey','Jersey (Kanalinsel)','Jersey','JERSEY','Jersey ','Джерси'),('JM','Jamaica','Jamaika','Jamaica','JAMAÏQUE','Giamaica','Ямайка'),('JO','Jordan','Jordanien','Jordania','JORDANIE','Giordania ','Иордания'),('JP','Japan','Japan','Japón','JAPON','Giappone ','Япония'),('KE','Kenya','Kenia','Kenia','KENYA','Kenya ','Кения'),('KG','Kyrgyzstan','Kirgisistan','Kirguistán','KIRGHIZISTAN','Kirghizistan','Киргизия'),('KH','Cambodia','Kambodscha','Camboya','CAMBODGE','Cambogia ','Камбоджа'),('KI','Kiribati','Kiribati','Kiribati','KIRIBATI','Kiribati ','Кирибати'),('KM','Comoros','Komoren','Comoros','COMORES','Comore ','Коморы'),('KN','Saint Kitts and Nevis','St. Kitts und Nevis','San Cristóbal y Nieves','SAINT-KITTS-ET-NEVIS','Saint Kitts e Nevis','Сент-Китс и Невис'),('KP','North Korea','Nordkorea','Corea del Norte','CORÉE, RÉPUBLIQUE POPULAIRE DÉMOCRATIQUE DE','Corea del Nord ','КНДР (Корейская Народно-Демократическая Республика)'),('KR','South Korea','Südkorea','Corea del Sur','CORÉE, RÉPUBLIQUE DE','Corea del Sud ','Республика Корея'),('KW','Kuwait','Kuwait','Kuwait','KOWEÏT','Kuwait ','Кувейт'),('KY','Cayman Islands','Kaimaninseln','Islas Caimán','CAÏMANES, ÎLES','Isole Cayman','Острова Кайман'),('KZ','Kazakhstan','Kasachstan','Kazajstán','KAZAKHSTAN','Kazakistan ','Казахстан'),('LA','Laos','Laos','Laos','LAO, RÉPUBLIQUE DÉMOCRATIQUE POPULAIRE','Laos ','Лаос'),('LB','Lebanon','Libanon','Líbano','LIBAN','Libano','Ливан'),('LC','Saint Lucia','St. Lucia','Santa Lucía','SAINTE-LUCIE','Santa Lucia','Сент-Люсия'),('LI','Liechtenstein','Liechtenstein','Liechtenstein','LIECHTENSTEIN','Liechtenstein','Лихтенштейн'),('LK','Sri Lanka','Sri Lanka','Sri Lanka','SRI LANKA','Sri Lanka ','Шри-Ланка'),('LR','Liberia','Liberia','Liberia','LIBÉRIA','Liberia ','Либерия'),('LS','Lesotho','Lesotho','Lesotho','LESOTHO','Lesotho ','Лесото'),('LT','Lithuania','Litauen','Lituania','LITUANIE','Lituania','Литва'),('LU','Luxembourg','Luxemburg','Luxemburgo','LUXEMBOURG','Lussemburgo','Люксембург'),('LV','Latvia','Lettland','Letonia','LETTONIE','Lettonia ','Латвия'),('LY','Libya','Libyen','Libia','LIBYE','Libia ','Ливия'),('MA','Morocco','Marokko','Marruecos','MAROC','Marocco','Марокко'),('MC','Monaco','Monaco','Mónaco','MONACO','Monaco ','Монако'),('MD','Moldova','Moldawien','Moldova','MOLDOVA','Moldavia','Молдавия'),('ME','Montenegro','Montenegro','Montenegro','MONTÉNÉGRO','Montenegro','Черногория'),('MF','Saint Martin (French part)','Saint-Martin (franz. Teil)','Saint Martin (parte francesa)','SAINT-MARTIN (PARTIE FRANÇAISE)','Saint-Martin','Сен-Мартен'),('MG','Madagascar','Madagaskar','Madagascar','MADAGASCAR','Madagascar ','Мадагаскар'),('MH','Marshall Islands','Marshallinseln','Islas Marshall','MARSHALL, ÎLES','Isole Marshall','Маршалловы Острова'),('MK','Macedonia','Mazedonien','Macedonia','MACÉDOINE, L\'EX-RÉPUBLIQUE YOUGOSLAVE DE','Macedonia ','Македония'),('ML','Mali','Mali','Mali','MALI','Mali ','Мали'),('MM','Myanmar','Myanmar (Burma)','Myanmar','MYANMAR','Birmania','Мьянма'),('MN','Mongolia','Mongolei','Mongolia','MONGOLIE','Mongolia','Монголия'),('MO','Macao S.A.R., China','Macau','Macao','MACAO','Macao ','Макао'),('MP','Northern Mariana Islands','Nördliche Marianen','Islas Marianas del Norte','MARIANNES DU NORD, ÎLES','Isole Marianne Settentrionali','Северные Марианские острова'),('MQ','Martinique','Martinique','Martinica','MARTINIQUE','Martinica','Мартиника'),('MR','Mauritania','Mauretanien','Mauritania','MAURITANIE','Mauritania','Мавритания'),('MS','Montserrat','Montserrat','Montserrat','MONTSERRAT','Montserrat','Монтсеррат'),('MT','Malta','Malta','Malta','MALTE','Malta ','Мальта'),('MU','Mauritius','Mauritius','Mauricio','MAURICE','Mauritius','Маврикий'),('MV','Maldives','Malediven','Maldivas','MALDIVES','Maldive ','Мальдивы'),('MW','Malawi','Malawi','Malawi','MALAWI','Malawi ','Малави'),('MX','Mexico','Mexiko','México','MEXIQUE','Messico ','Мексика'),('MY','Malaysia','Malaysia','Malasia','MALAISIE','Malesia ','Малайзия'),('MZ','Mozambique','Mosambik','Mozambique','MOZAMBIQUE','Mozambico','Мозамбик'),('NA','Namibia','Namibia','Namibia','NAMIBIE','Namibia ','Намибия'),('NC','New Caledonia','Neukaledonien','Nueva Caledonia','NOUVELLE-CALÉDONIE','Nuova Caledonia','Новая Каледония'),('NE','Niger','Niger','Níger','NIGER','Niger ','Нигер'),('NF','Norfolk Island','Norfolkinsel','Islas Norkfolk','NORFOLK, ÎLE','Isola Norfolk','Остров Норфолк'),('NG','Nigeria','Nigeria','Nigeria','NIGÉRIA','Nigeria ','Нигерия'),('NI','Nicaragua','Nicaragua','Nicaragua','NICARAGUA','Nicaragua','Никарагуа'),('NL','Netherlands','Niederlande','Países Bajos','PAYS-BAS','Paesi Bassi','Нидерланды'),('NO','Norway','Norwegen','Noruega','NORVÈGE','Norvegia ','Норвегия'),('NP','Nepal','Nepal','Nepal','NÉPAL','Nepal ','Непал'),('NR','Nauru','Nauru','Nauru','NAURU','Nauru ','Науру'),('NU','Niue','Niue','Niue','NIUÉ','Niue ','Ниуэ'),('NZ','New Zealand','Neuseeland','Nueva Zelanda','NOUVELLE-ZÉLANDE','Nuova Zelanda','Новая Зеландия'),('OM','Oman','Oman','Omán','OMAN','Oman ','Оман'),('PA','Panama','Panama','Panamá','PANAMA','Panamá','Панама'),('PE','Peru','Peru','Perú','PÉROU','Perù ','Перу'),('PF','French Polynesia','Französisch-Polynesien','Polinesia Francesa','POLYNÉSIE FRANÇAISE','Polinesia Francese ','Французская Полинезия'),('PG','Papua New Guinea','Papua-Neuguinea','Papúa Nueva Guinea','PAPOUASIE-NOUVELLE-GUINÉE','Papua Nuova Guinea ','Папуа — Новая Гвинея'),('PH','Philippines','Philippinen','Filipinas','PHILIPPINES','Filippine ','Филиппины'),('PK','Pakistan','Pakistan','Pakistán','PAKISTAN','Pakistan ','Пакистан'),('PL','Poland','Polen','Polonia','POLOGNE','Polonia ','Польша'),('PM','Saint Pierre and Miquelon','St. Pierre und Miquelon','San Pedro y Miquelón','SAINT-PIERRE-ET-MIQUELON','Saint-Pierre e Miquelon','Сен-Пьер и Микелон'),('PN','Pitcairn','Pitcairninseln','Islas Pitcairn','PITCAIRN','Isole Pitcairn ','Острова Питкэрн'),('PR','Puerto Rico','Puerto Rico','Puerto Rico','PORTO RICO','Porto Rico ','Пуэрто-Рико'),('PS','Palestine','Palästina','Palestina','ÉTAT DE PALESTINE','Palestina ','Государство Палестина'),('PT','Portugal','Portugal','Portugal','PORTUGAL','Portogallo ','Португалия'),('PW','Palau','Palau','Islas Palaos','PALAOS','Palau ','Палау'),('PY','Paraguay','Paraguay','Paraguay','PARAGUAY','Paraguay ','Парагвай'),('QA','Qatar','Katar','Qatar','QATAR','Qatar ','Катар'),('RE','Reunion','Réunion','Reunión','RÉUNION','Riunione ','Реюньон'),('RO','Romania','Rumänien','Rumanía','ROUMANIE','Romania ','Румыния'),('RS','Serbia','Serbien','Serbia','SERBIE','Serbia ','Сербия'),('RU','Russia','Russische Föderation','Rusia','RUSSIE, FÉDÉRATION DE','Russia ','Россия'),('RW','Rwanda','Ruanda','Ruanda','RWANDA','Ruanda ','Руанда'),('SA','Saudi Arabia','Saudi-Arabien','Arabia Saudita','ARABIE SAOUDITE','Arabia Saudita','Саудовская Аравия'),('SB','Solomon Islands','Salomonen','Islas Solomón','SALOMON, ÎLES','Isole Salomone','Соломоновы Острова'),('SC','Seychelles','Seychellen','Seychelles','SEYCHELLES','Seychelles','Сейшельские Острова'),('SD','Sudan','Sudan','Sudán','SOUDAN','Sudan ','Судан'),('SE','Sweden','Schweden','Suecia','SUÈDE','Svezia','Швеция'),('SG','Singapore','Singapur','Singapur','SINGAPOUR','Singapore','Сингапур'),('SH','Saint Helena','St. Helena','Santa Elena','SAINTE-HÉLÈNE, ASCENSION ET TRISTAN DA CUNHA','Sant\'Elena, Ascensione e Tristan da Cunha','Острова Святой Елены, Вознесения и Тристан-да-Кунья'),('SI','Slovenia','Slowenien','Eslovenia','SLOVÉNIE','Slovenia Slovenia','Словения'),('SJ','Svalbard and Jan Mayen','Svalbard und Jan Mayen','Islas Svalbard y Jan Mayen','SVALBARD ET ÎLE JAN MAYEN','Svalbard e Jan Mayen','Флаг Шпицбергена и Ян-Майена Шпицберген и Ян-Майен'),('SK','Slovakia','Slowakei','Eslovaquia','SLOVAQUIE','Slovacchia ','Словакия'),('SL','Sierra Leone','Sierra Leone','Sierra Leona','SIERRA LEONE','Sierra Leone','Сьерра-Леоне'),('SM','San Marino','San Marino','San Marino','SAINT-MARIN','San Marino ','Сан-Марино'),('SN','Senegal','Senegal','Senegal','SÉNÉGAL','Senegal ','Сенегал'),('SO','Somalia','Somalia','Somalia','SOMALIE','Somalia ','Сомали'),('SR','Suriname','Suriname','Surinam','SURINAME','Suriname','Суринам'),('SS','South Sudan','Sudsudan!Südsudan','Sudán del Sur','SOUDAN DU SUD','Sudan del Sud','Южный Судан'),('ST','Sao Tome and Principe','São Tomé und Príncipe','Santo Tomé y Príncipe','SAO TOMÉ-ET-PRINCIPE','São Tomé e Príncipe','Сан-Томе и Принсипи'),('SV','El Salvador','El Salvador','El Salvador','EL SALVADOR','El Salvador ','Сальвадор'),('SX','Sint Maarten (Dutch part)','Sint Maarten (niederl. Teil)','Sint Maarten (parte neerlandesa)','SAINT-MARTIN (PARTIE NÉERLANDAISE)','Sint Maarten ','Синт-Мартен'),('SY','Syria','Syrien','Siria','SYRIENNE, RÉPUBLIQUE ARABE','Siria ','Сирия'),('SZ','Swaziland','Swasiland','Suazilandia','SWAZILAND','Swaziland','Свазиленд'),('TC','Turks and Caicos Islands','Turks- und Caicosinseln','Islas Turcas y Caicos','TURKS ET CAÏQUES, ÎLES','Turks e Caicos ','Тёркс и Кайкос'),('TD','Chad','Tschad','Chad','TCHAD','Ciad ','Чад'),('TF','French Southern Territories','Französische Süd- und Antarktisgebiete','Territorios Australes Franceses','TERRES AUSTRALES FRANÇAISES','Terre australi e antartiche francesi','Французские Южные и Антарктические Территории'),('TG','Togo','Togo','Togo','TOGO','Togo ','Того'),('TH','Thailand','Thailand','Tailandia','THAÏLANDE','Thailandia','Таиланд'),('TJ','Tajikistan','Tadschikistan','Tayikistán','TADJIKISTAN','Tagikistan','Таджикистан'),('TK','Tokelau','Tokelau','Tokelau','TOKELAU','Tokelau ','Токелау'),('TL','East Timor','Timor-Leste','Timor-Leste','TIMOR-LESTE','Timor Est','Восточный Тимор'),('TM','Turkmenistan','Turkmenistan','Turkmenistán','TURKMÉNISTAN','Turkmenistan','Туркмения'),('TN','Tunisia','Tunesien','Túnez','TUNISIE','Tunisia ','Тунис'),('TO','Tonga','Tonga','Tonga','TONGA','Tonga ','Тонга'),('TR','Turkey','Türkei','Turquía','TURQUIE','Turchia','Турция'),('TT','Trinidad and Tobago','Trinidad und Tobago','Trinidad y Tobago','TRINITÉ-ET-TOBAGO','Trinidad e Tobago','Тринидад и Тобаго'),('TV','Tuvalu','Tuvalu','Tuvalu','TUVALU','Tuvalu ','Тувалу'),('TW','Taiwan','Taiwan','Taiwán','TAÏWAN, PROVINCE DE CHINE','Taiwan ','Китайская Республика'),('TZ','Tanzania','Tansania','Tanzania','TANZANIE, RÉPUBLIQUE UNIE DE','Tanzania ','Танзания'),('UA','Ukraine','Ukraine','Ucrania','UKRAINE','Ucraina ','Украина'),('UG','Uganda','Uganda','Uganda','OUGANDA','Uganda ','Уганда'),('UM','United States Minor Outlying Islands','Amerikanisch-Ozeanien','Islas menores periféricas de los Estados Unidos','ÎLES MINEURES ÉLOIGNÉES DES ÉTATS-UNIS','Isole minori esterne degli Stati Uniti','Внешние малые острова (США)'),('US','United States','Vereinigte Staaten von Amerika','Estados Unidos de América','ÉTATS-UNIS','Stati Uniti','США'),('UY','Uruguay','Uruguay','Uruguay','URUGUAY','Uruguay ','Уругвай'),('UZ','Uzbekistan','Usbekistan','Uzbekistán','OUZBÉKISTAN','Uzbekistan','Узбекистан'),('VA','Vatican','Vatikanstadt','Ciudad del Vaticano','SAINT-SIÈGE (ÉTAT DE LA CITÉ DU VATICAN)','Città del Vaticano','Ватикан'),('VC','Saint Vincent and the Grenadines','St. Vincent und die Grenadinen','San Vicente y las Granadinas','SAINT-VINCENT-ET-LES-GRENADINES','Saint Vincent e Grenadine','Сент-Винсент и Гренадины'),('VE','Venezuela','Venezuela','Venezuela','VENEZUELA, RÉPUBLIQUE BOLIVARIENNE DU','Venezuela ','Венесуэла'),('VG','British Virgin Islands','Britische Jungferninseln','Islas Vírgenes Británicas','ÎLES VIERGES BRITANNIQUES','Isole Vergini britanniche ','Британские Виргинские острова'),('VI','U.S. Virgin Islands','Amerikanische Jungferninseln','Islas Vírgenes de los Estados Unidos de América','ÎLES VIERGES DES ÉTATS-UNIS','Isole Vergini americane ','Виргинские Острова (США)'),('VN','Vietnam','Vietnam','Vietnam','VIET NAM','Vietnam','Вьетнам'),('VU','Vanuatu','Vanuatu','Vanuatu','VANUATU','Vanuatu','Вануату'),('WF','Wallis and Futuna','Wallis und Futuna','Wallis y Futuna','WALLIS-ET-FUTUNA','Wallis e Futuna','Уоллис и Футуна'),('WS','Samoa','Samoa','Samoa','SAMOA','Samoa ','Самоа'),('YE','Yemen','Jemen','Yemen','YÉMEN','Yemen ','Йемен'),('YT','Mayotte','Mayotte','Mayotte','MAYOTTE','Mayotte ','Майотта'),('ZA','South Africa','Südafrika','Sudáfrica','AFRIQUE DU SUD','Sudafrica ','ЮАР'),('ZM','Zambia','Sambia','Zambia','ZAMBIE','Zambia ','Замбия'),('ZW','Zimbabwe','Simbabwe','Zimbabue','ZIMBABWE','Zimbabwe','Зимбабве');
/*!40000 ALTER TABLE `LAND` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MITARBEITER`
--

DROP TABLE IF EXISTS `MITARBEITER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MITARBEITER` (
  `MaID` int(11) NOT NULL AUTO_INCREMENT,
  `GrID` int(11) NOT NULL,
  `Vorname` varchar(45) NOT NULL,
  `Nachname` varchar(45) NOT NULL,
  `Kurzzeichen` varchar(45) NOT NULL,
  `Ausgetreten` tinyint(1) NOT NULL,
  `Mutiert` tinyint(1) NOT NULL,
  `Datum` datetime NOT NULL,
  `Visum` varchar(16) NOT NULL,
  PRIMARY KEY (`MaID`),
  KEY `fk_GrID` (`GrID`),
  CONSTRAINT `fk_GrID` FOREIGN KEY (`GrID`) REFERENCES `BENUTZERGRUPPE` (`GrID`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MITARBEITER`
--

LOCK TABLES `MITARBEITER` WRITE;
/*!40000 ALTER TABLE `MITARBEITER` DISABLE KEYS */;
INSERT INTO `MITARBEITER` VALUES (1,6,'Manuel','Hablützel','ewzhabm',0,1,'1970-01-01 00:00:00','-'),(2,4,'Felix','Muster','ewzmusf',0,0,'1970-01-01 00:00:00','-'),(4,2,'Hans','Kanns','ewzkanh',0,1,'2019-09-07 13:25:48','ricop'),(5,3,'Big','Boss','ewzbigb',0,0,'1970-01-01 00:00:00','-'),(6,3,'Chef','Christian','ewzchec',0,0,'1970-01-01 00:00:00','-'),(7,4,'Test','Anna','ewztesa',0,1,'2019-09-01 18:15:43','ricop'),(8,4,'Prüfling','Franz','ewzprüf',0,0,'1970-01-01 00:00:00','-'),(9,4,'Dummy','Martin','ewzdumm',0,1,'2019-09-01 18:16:02','ricop'),(10,4,'Besserwisser','Christoph','ewzbesc',0,0,'1970-01-01 00:00:00','-'),(11,4,'Alleskönner','Bruno','ewzallb',0,0,'1970-01-01 00:00:00','-'),(12,4,'Weises','Peter','ewzweip',0,0,'1970-01-01 00:00:00','-'),(13,5,'Rentner','Hans','ewzrenh',1,0,'1970-01-01 00:00:00','-'),(14,5,'Max','Verwalter','ewzverm',0,0,'2019-09-08 19:16:01','ewzhabm'),(15,6,'Rico','Peterhans','ricop',0,0,'1970-01-01 00:00:00','-'),(16,2,'Manuel','Hablützel','ewzhabm',0,0,'1970-01-01 00:00:00','-'),(33,1,'Neue','Der','ewzdene',0,1,'2019-09-01 14:08:27','ewzhabm'),(34,6,'Neue','Der','ewzdene',0,1,'2019-09-01 14:08:43','ewzhabm'),(35,6,'Neue','Der','ewzdene',0,1,'2019-09-01 14:09:25','ewzhabm'),(36,6,'Neue','Der','ewzdene',0,1,'2019-09-01 14:13:15','ewzhabm'),(37,4,'Neue','Der','ewzdene',0,1,'2019-09-01 14:15:33','ewzhabm'),(38,6,'Neue','Der','ewzdene',0,1,'2019-09-01 14:30:53','ewzhabm'),(39,1,'Neue','Der','ewzdene',1,0,'2019-09-01 14:31:58','ewzhabm'),(40,4,'Test','Anna','ewztesa',0,0,'2019-09-01 18:15:43','ricop'),(41,4,'Dummy','Martin','ewzdumm',0,0,'2019-09-01 18:16:02','ricop'),(42,1,'TestUser','UserTest','ewzinteg',0,1,'2019-09-02 19:10:37','ricop'),(43,2,'TestUser','UserTest','ewzinteg',0,1,'2019-09-07 13:23:41','ricop'),(44,2,'TestUser','UserTest','ewzinteg',0,1,'2019-09-07 13:24:55','ricop'),(45,1,'Rico','Peterhans','ewzchripet',0,1,'2019-09-07 13:26:07','ricop'),(46,2,'TestUser','UserTest','ewzinteg',0,0,'2019-09-07 13:24:55','ricop'),(47,2,'Hans','Kanns','ewzkanh',0,0,'2019-09-07 13:25:48','ricop'),(48,1,'Rico','Peterhans','ewzchripet',1,0,'2019-09-07 15:12:58','ricop'),(49,1,'admin','admin','ewzadmin',0,0,'2019-09-06 06:00:00','ewzhabm'),(50,2,'abbtsAA','abbtsAA','abbtsAA',0,0,'2019-09-06 06:00:00','ewzhabm'),(51,6,'abbtsAB','abbtsAB','abbtsAB',0,0,'2019-09-06 06:00:00','ewzhabm');
/*!40000 ALTER TABLE `MITARBEITER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NETZEBENE`
--

DROP TABLE IF EXISTS `NETZEBENE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NETZEBENE` (
  `NeID` int(11) NOT NULL AUTO_INCREMENT,
  `AKS_Bezeichnung` varchar(3) NOT NULL,
  `Bezeichnung` varchar(45) NOT NULL,
  `Bereich` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`NeID`),
  UNIQUE KEY `NeID_UNIQUE` (`NeID`),
  UNIQUE KEY `AKS_Bezeichnung_UNIQUE` (`AKS_Bezeichnung`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NETZEBENE`
--

LOCK TABLES `NETZEBENE` WRITE;
/*!40000 ALTER TABLE `NETZEBENE` DISABLE KEYS */;
INSERT INTO `NETZEBENE` VALUES (1,'S01','Übertragungsnetz','U > 150kV\r'),(2,'S02','Koppelunterwerk','\r'),(3,'S03','HS-Netz','150kV >= U > 150kV\r'),(4,'S04','Quartierunterwerk','\r'),(5,'S05','MS-Netz','150kV >= U > 1kV\r'),(6,'S06','Trafostation/GR/HB','\r'),(7,'S07','NS-Netz','U < 1kV\r');
/*!40000 ALTER TABLE `NETZEBENE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORT`
--

DROP TABLE IF EXISTS `ORT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORT` (
  `OrtID` int(11) NOT NULL AUTO_INCREMENT,
  `PLZ` int(5) NOT NULL,
  `Ortsname` varchar(45) NOT NULL,
  `LandID` char(2) NOT NULL,
  PRIMARY KEY (`OrtID`),
  UNIQUE KEY `OrtID_UNIQUE` (`OrtID`),
  KEY `fk_LandID` (`LandID`),
  CONSTRAINT `fk_LandID` FOREIGN KEY (`LandID`) REFERENCES `LAND` (`LandID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORT`
--

LOCK TABLES `ORT` WRITE;
/*!40000 ALTER TABLE `ORT` DISABLE KEYS */;
INSERT INTO `ORT` VALUES (1,7411,'Sils im Domleschg','CH'),(2,8001,'Zürich','CH'),(3,8003,'Zürich','CH'),(4,8004,'Zürich','CH'),(5,8005,'Zürich','CH'),(6,8008,'Zürich','CH'),(7,8037,'Zürich','CH'),(8,8038,'Zürich','CH'),(9,8046,'Zürich','CH'),(10,8048,'Zürich','CH'),(11,8050,'Zürich','CH'),(12,8055,'Zürich','CH'),(13,8057,'Zürich','CH'),(14,8117,'Fällanden','CH'),(15,8833,'Samstagern','CH'),(16,8912,'Obfelden','CH'),(17,25524,'Itzehoe','DE'),(18,5400,'Baden','CH'),(19,96050,'Bamberg','DE'),(21,5430,'Wettingen','CH'),(22,8600,'Dübendorf','CH');
/*!40000 ALTER TABLE `ORT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOKOLLVORLAGE`
--

DROP TABLE IF EXISTS `PROTOKOLLVORLAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOKOLLVORLAGE` (
  `ProtVoID` int(11) NOT NULL AUTO_INCREMENT,
  `Dateipfad` varchar(45) NOT NULL,
  `Dateiname` varchar(45) NOT NULL,
  `Ersteller` varchar(45) NOT NULL,
  `Erstelldatum` date NOT NULL,
  `Bearbeiter` varchar(45) DEFAULT NULL,
  `Aenderungsdatum` date DEFAULT NULL,
  PRIMARY KEY (`ProtVoID`),
  UNIQUE KEY `Dateiname_UNIQUE` (`Dateiname`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOKOLLVORLAGE`
--

LOCK TABLES `PROTOKOLLVORLAGE` WRITE;
/*!40000 ALTER TABLE `PROTOKOLLVORLAGE` DISABLE KEYS */;
INSERT INTO `PROTOKOLLVORLAGE` VALUES (1,'Default','U-Wandler.txt','ewzrenh','2015-06-07','ewzverm','2017-03-14'),(2,'Default','I-Wandler.txt','ewzrenh','2016-10-04','ewzrenh','2016-12-10'),(3,'Default','Kombiwandler.txt','ewzverm','2017-05-06','','2050-12-31'),(4,'Default','Imax-Schutz.txt','ewzverm','2018-03-08','','2050-12-31'),(5,'Default','Diff-Schutz.txt','ewzrenh','2003-10-29','','2050-12-31');
/*!40000 ALTER TABLE `PROTOKOLLVORLAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRUEFDATEIVORLAGE`
--

DROP TABLE IF EXISTS `PRUEFDATEIVORLAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRUEFDATEIVORLAGE` (
  `PDatVoID` int(11) NOT NULL AUTO_INCREMENT,
  `Dateipfad` varchar(45) NOT NULL,
  `Dateiname` varchar(45) NOT NULL,
  `Ersteller` varchar(45) NOT NULL,
  `Erstelldatum` date NOT NULL,
  `Bearbeiter` varchar(45) DEFAULT NULL,
  `Aenderungsdatum` date DEFAULT NULL,
  PRIMARY KEY (`PDatVoID`),
  UNIQUE KEY `Dateiname_UNIQUE` (`Dateiname`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRUEFDATEIVORLAGE`
--

LOCK TABLES `PRUEFDATEIVORLAGE` WRITE;
/*!40000 ALTER TABLE `PRUEFDATEIVORLAGE` DISABLE KEYS */;
INSERT INTO `PRUEFDATEIVORLAGE` VALUES (1,'Default','U-Wandler.xml','ewzrenh','2015-06-07','ewzverm','2017-03-14'),(2,'Default','I-Wandler.xml','ewzrenh','2016-10-04','ewzrenh','2016-12-10'),(3,'Default','Kombiwandler.xml','ewzverm','2017-05-06','','2050-12-31'),(4,'Default','Imax-Schutz.xml','ewzverm','2018-03-08','','2050-12-31'),(5,'Default','Diff-Schutz.xml','ewzrenh','2003-10-29','','2050-12-31');
/*!40000 ALTER TABLE `PRUEFDATEIVORLAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRUEFLING`
--

DROP TABLE IF EXISTS `PRUEFLING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRUEFLING` (
  `PrueflingID` int(11) NOT NULL AUTO_INCREMENT,
  `BmID` int(11) NOT NULL,
  `PlID` int(11) NOT NULL,
  `PpID` int(11) NOT NULL,
  `Dateipfad` varchar(45) NOT NULL,
  `Dateiname` varchar(45) NOT NULL,
  PRIMARY KEY (`PrueflingID`),
  KEY `fk_BmID_on_PRUEFLING` (`BmID`),
  KEY `fk_PlID` (`PlID`),
  KEY `fk_PpID` (`PpID`),
  CONSTRAINT `fk_BmID_on_PRUEFLING` FOREIGN KEY (`BmID`) REFERENCES `BETRIEBSMITTEL` (`BmID`),
  CONSTRAINT `fk_PlID` FOREIGN KEY (`PlID`) REFERENCES `PRUEFLOS` (`PlID`),
  CONSTRAINT `fk_PpID` FOREIGN KEY (`PpID`) REFERENCES `PRUEFPROTOKOLL` (`PpID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRUEFLING`
--

LOCK TABLES `PRUEFLING` WRITE;
/*!40000 ALTER TABLE `PRUEFLING` DISABLE KEYS */;
INSERT INTO `PRUEFLING` VALUES (1,1,1,1,'OENEC1Q01','BA1.xml\r'),(2,2,1,1,'OENEC1Q01','BA1.xml\r'),(3,3,1,1,'OENEC1Q01','BA1.xml\r'),(4,4,1,1,'OENEC1Q01','BC1.xml\r'),(5,5,1,1,'OENEC1Q01','BC1.xml\r'),(6,6,1,1,'OENEC1Q01','BC1.xml\r'),(7,7,1,1,'OENEC1Q01','BC9.xml\r'),(8,8,1,1,'OENEC1Q01','BC9.xml\r'),(9,9,1,1,'OENEC1Q01','BC9.xml\r'),(10,10,1,1,'OENEC1Q02','BC1.xml\r'),(11,11,1,1,'OENEC1Q02','BC1.xml\r'),(12,12,1,1,'OENEC1Q02','BC1.xml\r'),(13,13,1,1,'OENEC1Q02','BC9.xml\r'),(14,14,1,1,'OENEC1Q02','BC9.xml\r'),(15,15,1,1,'OENEC1Q02','BC9.xml\r'),(16,16,2,2,'HEREC1Q01','BA9.xml\r'),(17,17,2,2,'HEREC1Q01','BA9.xml\r'),(18,18,2,2,'HEREC1Q01','BA9.xml\r');
/*!40000 ALTER TABLE `PRUEFLING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRUEFLOS`
--

DROP TABLE IF EXISTS `PRUEFLOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRUEFLOS` (
  `PlID` int(11) NOT NULL,
  `Losname` varchar(45) NOT NULL,
  `StID` int(11) NOT NULL,
  `MaID` int(11) NOT NULL,
  PRIMARY KEY (`PlID`),
  UNIQUE KEY `Losname_UNIQUE` (`Losname`),
  KEY `fk_StID` (`StID`),
  KEY `fk_MaID` (`MaID`),
  CONSTRAINT `fk_MaID` FOREIGN KEY (`MaID`) REFERENCES `MITARBEITER` (`MaID`),
  CONSTRAINT `fk_StID` FOREIGN KEY (`StID`) REFERENCES `STATUS` (`StID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRUEFLOS`
--

LOCK TABLES `PRUEFLOS` WRITE;
/*!40000 ALTER TABLE `PRUEFLOS` DISABLE KEYS */;
INSERT INTO `PRUEFLOS` VALUES (1,'OEN_HS',3,1),(2,'HER_HS',3,1),(3,'OEN_Test',3,1),(4,'HER_Test',3,1),(5,'Test',2,15),(6,'Test2',3,15),(7,'Test3',4,15),(8,'Test4',5,15),(9,'KTZ_HS_7-9',3,15);
/*!40000 ALTER TABLE `PRUEFLOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRUEFPROTOKOLL`
--

DROP TABLE IF EXISTS `PRUEFPROTOKOLL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRUEFPROTOKOLL` (
  `PpID` int(11) NOT NULL AUTO_INCREMENT,
  `Dateipfad` varchar(45) NOT NULL,
  `Dateiname` varchar(45) NOT NULL,
  `Ersteller` varchar(45) NOT NULL,
  `Erstelldatum` date NOT NULL,
  `Pruefer` varchar(45) DEFAULT NULL,
  `Pruefdatum` date DEFAULT NULL,
  `Freigeber` varchar(45) DEFAULT NULL,
  `Freigabedatum` date DEFAULT NULL,
  `Bearbeiter` varchar(45) DEFAULT NULL,
  `Aenderungsdatum` date DEFAULT NULL,
  `Ergebnisse` longtext,
  PRIMARY KEY (`PpID`),
  UNIQUE KEY `Dateiname_UNIQUE` (`Dateiname`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRUEFPROTOKOLL`
--

LOCK TABLES `PRUEFPROTOKOLL` WRITE;
/*!40000 ALTER TABLE `PRUEFPROTOKOLL` DISABLE KEYS */;
INSERT INTO `PRUEFPROTOKOLL` VALUES (1,'Default','OEN_EC1_Q01.txt','ewzbigb','2018-03-18','ewztesa','2018-04-15','','2050-12-31','ewztesa','2018-04-15','-1\r'),(2,'Default','HER_EC1_Q11.txt','ewzbigb','2015-06-18','ewzbesc','2015-12-05','ewzbigb','2016-07-06','ewzbigb','2016-07-06','-1\r'),(3,'Default','KTZ_EC2_Q01_BA9.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(4,'Default','KTZ_EC2_Q01_BC1.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(5,'Default','KTZ_EC2_Q01_BC9.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(6,'Default','KTZ_EC2_Q02_BA9.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(7,'Default','KTZ_EC2_Q02_BC1.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(8,'Default','KTZ_EC2_Q02_BC9.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(9,'Default','KTZ_EC2_Q03_BA9.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(10,'Default','KTZ_EC2_Q03_BC1.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(11,'Default','KTZ_EC2_Q03_BC9.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(12,'Default','KTZ_EC2_Q04_BA9.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(13,'Default','KTZ_EC2_Q04_BC1.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(14,'Default','KTZ_EC2_Q04_BC9.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(15,'Default','KTZ_EC2_Q05_BA9.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(16,'Default','KTZ_EC2_Q05_BC1.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(17,'Default','KTZ_EC2_Q05_BC9.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(18,'Default','KTZ_EC2_Q06_BA9.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(19,'Default','KTZ_EC2_Q06_BC1.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(20,'Default','KTZ_EC2_Q06_BC9.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(21,'Default','KTZ_EC2_Q07_BA9.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(22,'Default','KTZ_EC2_Q07_BC1.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(23,'Default','KTZ_EC2_Q07_BC9.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(24,'Default','KTZ_EC2_Q08_BA9.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(25,'Default','KTZ_EC2_Q08_BC1.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(26,'Default','KTZ_EC2_Q08_BC9.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(27,'Default','KTZ_EC2_Q09_BA9.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(28,'Default','KTZ_EC2_Q09_BC1.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1'),(29,'Default','KTZ_EC2_Q09_BC9.txt','ewzhabm','2019-03-06',NULL,NULL,NULL,NULL,NULL,NULL,'-1');
/*!40000 ALTER TABLE `PRUEFPROTOKOLL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCHUTZGERAET`
--

DROP TABLE IF EXISTS `SCHUTZGERAET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCHUTZGERAET` (
  `BmTID` int(11) NOT NULL,
  `In I>` double NOT NULL,
  `t I>` double NOT NULL,
  `In I>>` double NOT NULL,
  `t I>>` double NOT NULL,
  `IDelta` double NOT NULL,
  `tDelta` double NOT NULL,
  PRIMARY KEY (`BmTID`),
  CONSTRAINT `fk_BmTID_on_SCHUTZGERATE` FOREIGN KEY (`BmTID`) REFERENCES `BETRIEBSMITTELTYP` (`BmTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCHUTZGERAET`
--

LOCK TABLES `SCHUTZGERAET` WRITE;
/*!40000 ALTER TABLE `SCHUTZGERAET` DISABLE KEYS */;
INSERT INTO `SCHUTZGERAET` VALUES (6,1.2,1.4,0,0,0,0),(7,0.8,0.2,0,0,0,0);
/*!40000 ALTER TABLE `SCHUTZGERAET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STATUS`
--

DROP TABLE IF EXISTS `STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STATUS` (
  `StID` int(11) NOT NULL AUTO_INCREMENT,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`StID`),
  UNIQUE KEY `Status_UNIQUE` (`Status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STATUS`
--

LOCK TABLES `STATUS` WRITE;
/*!40000 ALTER TABLE `STATUS` DISABLE KEYS */;
INSERT INTO `STATUS` VALUES (5,'Abgeschlossen\r'),(4,'Freigabe\r'),(1,'Neu\r'),(3,'Prüfung\r'),(2,'Zuweisung\r');
/*!40000 ALTER TABLE `STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VERTEILNETZ`
--

DROP TABLE IF EXISTS `VERTEILNETZ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VERTEILNETZ` (
  `VnID` int(11) NOT NULL AUTO_INCREMENT,
  `AKS_Bezeichnung` varchar(2) NOT NULL,
  `Verteilnetzname` varchar(45) NOT NULL,
  `NLZ` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`VnID`),
  UNIQUE KEY `VnID_UNIQUE` (`VnID`),
  UNIQUE KEY `AKS_Bezeichnung_UNIQUE` (`AKS_Bezeichnung`),
  UNIQUE KEY `Verteilnetzname_UNIQUE` (`Verteilnetzname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VERTEILNETZ`
--

LOCK TABLES `VERTEILNETZ` WRITE;
/*!40000 ALTER TABLE `VERTEILNETZ` DISABLE KEYS */;
INSERT INTO `VERTEILNETZ` VALUES (1,'AA','ewz Zürich','058 319 40 13\r'),(2,'AB','ewz Mittelbünden','058 319 68 11\r');
/*!40000 ALTER TABLE `VERTEILNETZ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WANDLER`
--

DROP TABLE IF EXISTS `WANDLER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WANDLER` (
  `BmTID` int(11) NOT NULL,
  `PrimWert` int(11) NOT NULL,
  `SekWert` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `Buerde` int(11) NOT NULL,
  `KlID` int(11) NOT NULL,
  PRIMARY KEY (`BmTID`),
  KEY `fk_UID` (`UID`),
  KEY `fk_KlID` (`KlID`),
  CONSTRAINT `BmTID` FOREIGN KEY (`BmTID`) REFERENCES `BETRIEBSMITTELTYP` (`BmTID`),
  CONSTRAINT `fk_KlID` FOREIGN KEY (`KlID`) REFERENCES `KLASSE` (`KlID`),
  CONSTRAINT `fk_UID` FOREIGN KEY (`UID`) REFERENCES `EINHEIT` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WANDLER`
--

LOCK TABLES `WANDLER` WRITE;
/*!40000 ALTER TABLE `WANDLER` DISABLE KEYS */;
INSERT INTO `WANDLER` VALUES (1,165000,110,1,50,1),(2,600,1,2,30,2),(3,600,1,2,30,2),(4,165000,110,1,50,1),(5,600,1,2,30,2),(8,165000,110,1,30,1);
/*!40000 ALTER TABLE `WANDLER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_getDevices`
--

DROP TABLE IF EXISTS `view_getDevices`;
/*!50001 DROP VIEW IF EXISTS `view_getDevices`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_getDevices` AS SELECT 
 1 AS `FilterID`,
 1 AS `ID`,
 1 AS `AKS_Bezeichnung`,
 1 AS `Bezeichnung`,
 1 AS `Equipment`,
 1 AS `SerienNr`,
 1 AS `BtID`,
 1 AS `BmTID`,
 1 AS `Kern`,
 1 AS `ArtikelNr`,
 1 AS `Herstellername`,
 1 AS `FkID`,
 1 AS `Funktionsname`,
 1 AS `PrimWert`,
 1 AS `SekWert`,
 1 AS `Einheitszeichen`,
 1 AS `Buerde`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_getEmployee`
--

DROP TABLE IF EXISTS `view_getEmployee`;
/*!50001 DROP VIEW IF EXISTS `view_getEmployee`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_getEmployee` AS SELECT 
 1 AS `MaID`,
 1 AS `GrID`,
 1 AS `Vorname`,
 1 AS `Nachname`,
 1 AS `Kurzzeichen`,
 1 AS `Gruppenname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_getEquipment`
--

DROP TABLE IF EXISTS `view_getEquipment`;
/*!50001 DROP VIEW IF EXISTS `view_getEquipment`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_getEquipment` AS SELECT 
 1 AS `ID`,
 1 AS `AKS_Bezeichnung`,
 1 AS `FilterID`,
 1 AS `Phase`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_getFields`
--

DROP TABLE IF EXISTS `view_getFields`;
/*!50001 DROP VIEW IF EXISTS `view_getFields`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_getFields` AS SELECT 
 1 AS `ID`,
 1 AS `AKS_Bezeichnung`,
 1 AS `Bezeichnung`,
 1 AS `FilterID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_getInfObj`
--

DROP TABLE IF EXISTS `view_getInfObj`;
/*!50001 DROP VIEW IF EXISTS `view_getInfObj`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_getInfObj` AS SELECT 
 1 AS `ID`,
 1 AS `AKS_Bezeichnung`,
 1 AS `InfObjBez`,
 1 AS `FilterID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_getStations`
--

DROP TABLE IF EXISTS `view_getStations`;
/*!50001 DROP VIEW IF EXISTS `view_getStations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_getStations` AS SELECT 
 1 AS `ID`,
 1 AS `AKS_Bezeichnung`,
 1 AS `Anlagename`,
 1 AS `Kurzzeichen`,
 1 AS `Verteilnetzname`,
 1 AS `Bezeichnung`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_getTestLot`
--

DROP TABLE IF EXISTS `view_getTestLot`;
/*!50001 DROP VIEW IF EXISTS `view_getTestLot`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_getTestLot` AS SELECT 
 1 AS `Losname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_getTestObject`
--

DROP TABLE IF EXISTS `view_getTestObject`;
/*!50001 DROP VIEW IF EXISTS `view_getTestObject`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_getTestObject` AS SELECT 
 1 AS `PlID`,
 1 AS `AKS_Bezeichnung`,
 1 AS `Equipment`,
 1 AS `Einbauort`,
 1 AS `SerienNr`,
 1 AS `Kern`,
 1 AS `ArtikelNr`,
 1 AS `Herstellername`,
 1 AS `Funktionsname`,
 1 AS `PrimWert`,
 1 AS `SekWert`,
 1 AS `Einheitszeichen`,
 1 AS `Buerde`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_getTransformers`
--

DROP TABLE IF EXISTS `view_getTransformers`;
/*!50001 DROP VIEW IF EXISTS `view_getTransformers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_getTransformers` AS SELECT 
 1 AS `BmTID`,
 1 AS `ArtikelNr`,
 1 AS `Einheitszeichen`,
 1 AS `Name`,
 1 AS `PrimWert`,
 1 AS `SekWert`,
 1 AS `Buerde`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'Anlagedaten'
--
/*!50003 DROP FUNCTION IF EXISTS `submitInt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER $$;
CREATE DEFINER=`ewzadmin`@`%` FUNCTION `submitInt`() RETURNS int(11)
    NO SQL
    DETERMINISTIC
return @submitInt $$;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `submitString` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER $$;
CREATE DEFINER=`ewzadmin`@`%` FUNCTION `submitString`() RETURNS varchar(32) CHARSET utf8
    NO SQL
    DETERMINISTIC
return @submitString $$;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sps_addUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER $$;
CREATE DEFINER=`ewzadmin`@`%` PROCEDURE `sps_addUser`(userGroup INT,
 firstName TEXT,
 lastname TEXT,
 sign TEXT,
 pw TEXT,
 datum DATETIME,
 visum TEXT)
BEGIN
 	INSERT INTO MITARBEITER VALUES (DEFAULT,userGroup,firstName,lastName,sign,0,0,datum,visum);
 	CALL sps_setPrivFromGroup(userGroup,sign);
 END $$;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sps_deleteUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER $$;
CREATE DEFINER=`ewzadmin`@`%` PROCEDURE `sps_deleteUser`(MaID INT, datum DATETIME, visum VARCHAR(16))
BEGIN
 	DECLARE  sign Text DEFAULT (SELECT Kurzzeichen FROM MITARBEITER WHERE MaID = MITARBEITER.MaID);
 	UPDATE MITARBEITER SET Ausgetreten = 1, MITARBEITER.Datum = datum, MITARBEITER.Visum=visum WHERE MaID = MITARBEITER.MaID;
     CALL sps_exeStatement(CONCAT('REVOKE ALL ON *.* FROM ',sign));
     CALL sps_exeStatement(CONCAT('REVOKE GRANT OPTION ON *.* FROM ',sign));
 END $$;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sps_exeStatement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER $$;
CREATE DEFINER=`ewzadmin`@`%` PROCEDURE `sps_exeStatement`(statement TEXT)
BEGIN
 	SET @sql := statement;
 	PREPARE stmt FROM @sql;
 	EXECUTE stmt; 
 	DEALLOCATE PREPARE stmt;
 END $$;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sps_mutateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER $$;
CREATE DEFINER=`ewzadmin`@`%` PROCEDURE `sps_mutateUser`(MaID INT , userGroup INTEGER, datum DATETIME, visum TEXT)
BEGIN 
 	DECLARE sign Text DEFAULT (SELECT Kurzzeichen FROM MITARBEITER WHERE MaID = MITARBEITER.MaID);
 	INSERT INTO MITARBEITER (GrID,Vorname,Nachname,Kurzzeichen,Ausgetreten,Mutiert,datum,visum)
 	SELECT userGroup,Vorname,Nachname,Kurzzeichen,0,0,datum,visum FROM MITARBEITER WHERE  MaID = MITARBEITER.MaID;
 	UPDATE MITARBEITER SET Mutiert = 1, MITARBEITER.Datum=datum, MITARBEITER.Visum=visum  WHERE MaID = MITARBEITER.MaID;
 	#REVOKE ALL PRIVILEGES, GRANT OPTION FROM sign;
     CALL sps_exeStatement(CONCAT('REVOKE ALL ON *.* FROM ',sign));
     CALL sps_exeStatement(CONCAT('REVOKE GRANT OPTION ON *.* FROM ',sign));
 	CALL sps_setPrivFromGroup(userGroup,sign);
 END $$;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sps_setPrivFromGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER $$;
CREATE DEFINER=`ewzadmin`@`%` PROCEDURE `sps_setPrivFromGroup`(userGroup INTEGER, sign TEXT)
BEGIN
 	CASE userGroup
 		WHEN 1 THEN
 			call sps_exeStatement(CONCAT('GRANT ALL PRIVILEGES ON *.* TO ' , sign ,' WITH GRANT OPTION'));	
 		WHEN 2 THEN
 			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.VERTEILNETZ TO ' , sign));	
 			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.NETZEBENE TO ' , sign));	
 			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.ORT TO ' , sign));	
 			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.ANLAGE TO ' , sign));	
 			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.INFRASTRUKTUROBJEKT TO ' , sign));	
 			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.FELD TO ' , sign));
             call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.BETRIEBSMITTEL TO ' , sign));	
 			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.BAUTEIL TO ' , sign));	
 			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.BETRIEBSMITTELTYP TO ' , sign));	
 			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.BETRIEBSMITTELKLASSE TO ' , sign));	
 			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.FUNKTION TO ' , sign));	
 			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.HERSTELLER TO ' , sign));	
 			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.WANDLER TO ' , sign));	
 			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.KLASSE TO ' , sign));	
 			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.EINHEIT TO ' , sign));	
 			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE,DELETE ON Anlagedaten.SCHUTZGERAET TO ' , sign));		
 			call sps_exeStatement(CONCAT('GRANT SELECT ON Anlagedaten.PRUEFDATEIVORLAGE TO ' , sign));	
 			call sps_exeStatement(CONCAT('GRANT SELECT ON Anlagedaten.PROTOKOLLVORLAGE TO ' , sign));	
         WHEN 3 THEN
 			call sps_exeStatement(CONCAT('GRANT SELECT ON Anlagedaten.view_getTestLot TO ', sign));
 			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE ON Anlagedaten.PRUEFPROTOKOLL TO ' , sign));	
         	call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE ON Anlagedaten.PRUEFLOS TO ' , sign));	
         	call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE ON Anlagedaten.PRUEFLING TO ' , sign));	
         WHEN 4 THEN
 			call sps_exeStatement(CONCAT('GRANT SELECT ON Anlagedaten.view_getTestLot TO ', sign));
 			call sps_exeStatement(CONCAT('GRANT SELECT ON Anlagedaten.view_getTestObject TO ', sign));            
 			call sps_exeStatement(CONCAT('GRANT UPDATE ON Anlagedaten.PRUEFPROTOKOLL TO ' , sign ));            
 			call sps_exeStatement(CONCAT('GRANT UPDATE ON Anlagedaten.PRUEFLOS TO ' , sign ));            
 			call sps_exeStatement(CONCAT('GRANT SELECT,UPDATE ON Anlagedaten.PRUEFLING TO ' , sign ));
         WHEN 5 THEN
 			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE ON Anlagedaten.PRUEFDATEIVORLAGE TO ' , sign));	
 			call sps_exeStatement(CONCAT('GRANT INSERT,SELECT,UPDATE ON Anlagedaten.PROTOKOLLVORLAGE TO ' , sign));	
 		WHEN 6 THEN
 			call sps_exeStatement(CONCAT('GRANT SELECT,INSERT,UPDATE ON Anlagedaten.MITARBEITER TO ', sign));            
 			call sps_exeStatement(CONCAT('GRANT CREATE USER ON *.* TO ' , sign , ' WITH GRANT OPTION' ));
 	END CASE;
     FLUSH PRIVILEGES;
 END $$;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_getDevices`
--

/*!50001 DROP VIEW IF EXISTS `view_getDevices`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ewzadmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_getDevices` AS select `BETRIEBSMITTEL`.`FeID` AS `FilterID`,`BETRIEBSMITTEL`.`BmID` AS `ID`,`BETRIEBSMITTEL`.`AKS_Bezeichnung` AS `AKS_Bezeichnung`,`BETRIEBSMITTEL`.`Bezeichnung` AS `Bezeichnung`,`BETRIEBSMITTEL`.`Equipment` AS `Equipment`,`BETRIEBSMITTEL`.`SerienNr` AS `SerienNr`,`BAUTEIL`.`BtID` AS `BtID`,`BAUTEIL`.`BmTID` AS `BmTID`,`BAUTEIL`.`Index` AS `Kern`,`BETRIEBSMITTELTYP`.`ArtikelNr` AS `ArtikelNr`,`HERSTELLER`.`Herstellername` AS `Herstellername`,`FUNKTION`.`FkID` AS `FkID`,`FUNKTION`.`Funktionsname` AS `Funktionsname`,`WANDLER`.`PrimWert` AS `PrimWert`,`WANDLER`.`SekWert` AS `SekWert`,`EINHEIT`.`Einheitszeichen` AS `Einheitszeichen`,`WANDLER`.`Buerde` AS `Buerde` from (((((`BETRIEBSMITTEL` join (`BETRIEBSMITTELTYP` join `BAUTEIL` on((`BAUTEIL`.`BmTID` = `BETRIEBSMITTELTYP`.`BmTID`))) on((`BAUTEIL`.`BmID` = `BETRIEBSMITTEL`.`BmID`))) join `FUNKTION` on((`FUNKTION`.`FkID` = `BAUTEIL`.`FkID`))) join `WANDLER` on((`BETRIEBSMITTELTYP`.`BmTID` = `WANDLER`.`BmTID`))) join `EINHEIT` on((`EINHEIT`.`UID` = `WANDLER`.`UID`))) join `HERSTELLER` on((`HERSTELLER`.`HeID` = `BETRIEBSMITTELTYP`.`HeID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_getEmployee`
--

/*!50001 DROP VIEW IF EXISTS `view_getEmployee`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ewzadmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_getEmployee` AS select `MITARBEITER`.`MaID` AS `MaID`,`MITARBEITER`.`GrID` AS `GrID`,`MITARBEITER`.`Vorname` AS `Vorname`,`MITARBEITER`.`Nachname` AS `Nachname`,`MITARBEITER`.`Kurzzeichen` AS `Kurzzeichen`,`BENUTZERGRUPPE`.`Gruppenname` AS `Gruppenname` from (`MITARBEITER` join `BENUTZERGRUPPE` on((`MITARBEITER`.`GrID` = `BENUTZERGRUPPE`.`GrID`))) where ((`MITARBEITER`.`Ausgetreten` = 0) and (`MITARBEITER`.`Mutiert` = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_getEquipment`
--

/*!50001 DROP VIEW IF EXISTS `view_getEquipment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ewzadmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_getEquipment` AS select `BAUTEIL`.`BmID` AS `ID`,concat(`VERTEILNETZ`.`AKS_Bezeichnung`,'-',`NETZEBENE`.`AKS_Bezeichnung`,`ANLAGE`.`AKS_Bezeichnung`,'-',`INFRASTRUKTUROBJEKT`.`AKS_Bezeichnung`,'-',`FELD`.`AKS_Bezeichnung`,'-',`BETRIEBSMITTEL`.`AKS_Bezeichnung`) AS `AKS_Bezeichnung`,`BETRIEBSMITTEL`.`FeID` AS `FilterID`,`BETRIEBSMITTEL`.`Bezeichnung` AS `Phase` from ((((((`BAUTEIL` join `BETRIEBSMITTEL` on((`BETRIEBSMITTEL`.`BmID` = `BAUTEIL`.`BmID`))) join `FELD` on((`FELD`.`FeID` = `BETRIEBSMITTEL`.`FeID`))) join `INFRASTRUKTUROBJEKT` on((`INFRASTRUKTUROBJEKT`.`InfObID` = `FELD`.`InfObID`))) join `ANLAGE` on((`ANLAGE`.`AnID` = `INFRASTRUKTUROBJEKT`.`AnID`))) join `VERTEILNETZ` on((`ANLAGE`.`VnID` = `VERTEILNETZ`.`VnID`))) join `NETZEBENE` on((`ANLAGE`.`NeID` = `NETZEBENE`.`NeID`))) where (`BETRIEBSMITTEL`.`Geloescht` = 0) order by concat(`VERTEILNETZ`.`AKS_Bezeichnung`,'-',`NETZEBENE`.`AKS_Bezeichnung`,`ANLAGE`.`AKS_Bezeichnung`,'-',`INFRASTRUKTUROBJEKT`.`AKS_Bezeichnung`,'-',`FELD`.`AKS_Bezeichnung`,'-',`BETRIEBSMITTEL`.`AKS_Bezeichnung`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_getFields`
--

/*!50001 DROP VIEW IF EXISTS `view_getFields`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ewzadmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_getFields` AS select `FELD`.`FeID` AS `ID`,concat(`VERTEILNETZ`.`AKS_Bezeichnung`,'-',`NETZEBENE`.`AKS_Bezeichnung`,`ANLAGE`.`AKS_Bezeichnung`,'-',`INFRASTRUKTUROBJEKT`.`AKS_Bezeichnung`,'-',`FELD`.`AKS_Bezeichnung`) AS `AKS_Bezeichnung`,`FELD`.`Feldbezeichnung` AS `Bezeichnung`,`FELD`.`InfObID` AS `FilterID` from ((((`FELD` join `INFRASTRUKTUROBJEKT` on((`INFRASTRUKTUROBJEKT`.`InfObID` = `FELD`.`InfObID`))) join `ANLAGE` on((`ANLAGE`.`AnID` = `INFRASTRUKTUROBJEKT`.`AnID`))) join `VERTEILNETZ` on((`ANLAGE`.`VnID` = `VERTEILNETZ`.`VnID`))) join `NETZEBENE` on((`ANLAGE`.`NeID` = `NETZEBENE`.`NeID`))) where (`FELD`.`Geloescht` = 0) order by concat(`VERTEILNETZ`.`AKS_Bezeichnung`,'-',`NETZEBENE`.`AKS_Bezeichnung`,`ANLAGE`.`AKS_Bezeichnung`,'-',`INFRASTRUKTUROBJEKT`.`AKS_Bezeichnung`,'-',`FELD`.`AKS_Bezeichnung`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_getInfObj`
--

/*!50001 DROP VIEW IF EXISTS `view_getInfObj`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ewzadmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_getInfObj` AS select `INFRASTRUKTUROBJEKT`.`InfObID` AS `ID`,concat(`VERTEILNETZ`.`AKS_Bezeichnung`,'-',`NETZEBENE`.`AKS_Bezeichnung`,`ANLAGE`.`AKS_Bezeichnung`,'-',`INFRASTRUKTUROBJEKT`.`AKS_Bezeichnung`) AS `AKS_Bezeichnung`,`INFRASTRUKTUROBJEKT`.`Infrastrukturobjektbezeichnung` AS `InfObjBez`,`ANLAGE`.`AnID` AS `FilterID` from (((`INFRASTRUKTUROBJEKT` join `ANLAGE` on((`ANLAGE`.`AnID` = `INFRASTRUKTUROBJEKT`.`AnID`))) join `VERTEILNETZ` on((`ANLAGE`.`VnID` = `VERTEILNETZ`.`VnID`))) join `NETZEBENE` on((`ANLAGE`.`NeID` = `NETZEBENE`.`NeID`))) where (`INFRASTRUKTUROBJEKT`.`Geloescht` = 0) order by concat(`VERTEILNETZ`.`AKS_Bezeichnung`,'-',`NETZEBENE`.`AKS_Bezeichnung`,`ANLAGE`.`AKS_Bezeichnung`,'-',`INFRASTRUKTUROBJEKT`.`AKS_Bezeichnung`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_getStations`
--

/*!50001 DROP VIEW IF EXISTS `view_getStations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ewzadmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_getStations` AS select `ANLAGE`.`AnID` AS `ID`,concat(`VERTEILNETZ`.`AKS_Bezeichnung`,'-',`NETZEBENE`.`AKS_Bezeichnung`,`ANLAGE`.`AKS_Bezeichnung`) AS `AKS_Bezeichnung`,`ANLAGE`.`Anlagename` AS `Anlagename`,`ANLAGE`.`Kurzzeichen` AS `Kurzzeichen`,`VERTEILNETZ`.`Verteilnetzname` AS `Verteilnetzname`,`NETZEBENE`.`Bezeichnung` AS `Bezeichnung` from ((`ANLAGE` join `VERTEILNETZ` on((`ANLAGE`.`VnID` = `VERTEILNETZ`.`VnID`))) join `NETZEBENE` on((`ANLAGE`.`NeID` = `NETZEBENE`.`NeID`))) where (`ANLAGE`.`Geloescht` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_getTestLot`
--

/*!50001 DROP VIEW IF EXISTS `view_getTestLot`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ewzadmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_getTestLot` AS select `PRUEFLOS`.`Losname` AS `Losname` from `PRUEFLOS` where (`PRUEFLOS`.`MaID` = (select `MITARBEITER`.`MaID` from `MITARBEITER` where (`MITARBEITER`.`Kurzzeichen` = `submitString`()))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_getTestObject`
--

/*!50001 DROP VIEW IF EXISTS `view_getTestObject`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ewzadmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_getTestObject` AS select `PRUEFLOS`.`PlID` AS `PlID`,concat(`VERTEILNETZ`.`AKS_Bezeichnung`,'-',`NETZEBENE`.`AKS_Bezeichnung`,`ANLAGE`.`AKS_Bezeichnung`,'-',`INFRASTRUKTUROBJEKT`.`AKS_Bezeichnung`,'-',`FELD`.`AKS_Bezeichnung`,'-',`BETRIEBSMITTEL`.`AKS_Bezeichnung`,'.',`BETRIEBSMITTEL`.`Bezeichnung`) AS `AKS_Bezeichnung`,`BETRIEBSMITTEL`.`Equipment` AS `Equipment`,concat(`ANLAGE`.`Kurzzeichen`,', ',`INFRASTRUKTUROBJEKT`.`Infrastrukturobjektbezeichnung`,', ',`FELD`.`AKS_Bezeichnung`,', ',`BETRIEBSMITTEL`.`AKS_Bezeichnung`,'.',`BETRIEBSMITTEL`.`Bezeichnung`,', ',`FELD`.`Feldbezeichnung`) AS `Einbauort`,`BETRIEBSMITTEL`.`SerienNr` AS `SerienNr`,`BAUTEIL`.`Index` AS `Kern`,`BETRIEBSMITTELTYP`.`ArtikelNr` AS `ArtikelNr`,`HERSTELLER`.`Herstellername` AS `Herstellername`,`FUNKTION`.`Funktionsname` AS `Funktionsname`,`WANDLER`.`PrimWert` AS `PrimWert`,`WANDLER`.`SekWert` AS `SekWert`,`EINHEIT`.`Einheitszeichen` AS `Einheitszeichen`,`WANDLER`.`Buerde` AS `Buerde` from (((((((((((`BETRIEBSMITTEL` join (`PRUEFLOS` join `PRUEFLING` on((`PRUEFLOS`.`PlID` = `PRUEFLING`.`PlID`))) on((`PRUEFLING`.`BmID` = `BETRIEBSMITTEL`.`BmID`))) join `FELD` on((`BETRIEBSMITTEL`.`FeID` = `FELD`.`FeID`))) join `INFRASTRUKTUROBJEKT` on((`INFRASTRUKTUROBJEKT`.`InfObID` = `FELD`.`InfObID`))) join `ANLAGE` on((`ANLAGE`.`AnID` = `INFRASTRUKTUROBJEKT`.`AnID`))) join `VERTEILNETZ` on((`VERTEILNETZ`.`VnID` = `ANLAGE`.`VnID`))) join `NETZEBENE` on((`NETZEBENE`.`NeID` = `ANLAGE`.`NeID`))) join (`BETRIEBSMITTELTYP` join `BAUTEIL` on((`BAUTEIL`.`BmTID` = `BETRIEBSMITTELTYP`.`BmTID`))) on((`BAUTEIL`.`BmID` = `BETRIEBSMITTEL`.`BmID`))) join `FUNKTION` on((`FUNKTION`.`FkID` = `BAUTEIL`.`FkID`))) join `WANDLER` on((`BETRIEBSMITTELTYP`.`BmTID` = `WANDLER`.`BmTID`))) join `EINHEIT` on((`EINHEIT`.`UID` = `WANDLER`.`UID`))) join `HERSTELLER` on((`HERSTELLER`.`HeID` = `BETRIEBSMITTELTYP`.`HeID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_getTransformers`
--

/*!50001 DROP VIEW IF EXISTS `view_getTransformers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ewzadmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_getTransformers` AS select `BETRIEBSMITTELTYP`.`BmTID` AS `BmTID`,`BETRIEBSMITTELTYP`.`ArtikelNr` AS `ArtikelNr`,`EINHEIT`.`Einheitszeichen` AS `Einheitszeichen`,`KLASSE`.`Name` AS `Name`,`WANDLER`.`PrimWert` AS `PrimWert`,`WANDLER`.`SekWert` AS `SekWert`,`WANDLER`.`Buerde` AS `Buerde` from (((`BETRIEBSMITTELTYP` join `WANDLER` on(((`BETRIEBSMITTELTYP`.`BmKlID` = 'T') and (`BETRIEBSMITTELTYP`.`BmTID` = `WANDLER`.`BmTID`)))) join `EINHEIT` on((`EINHEIT`.`UID` = `WANDLER`.`UID`))) join `KLASSE` on((`KLASSE`.`KlID` = `WANDLER`.`KlID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-13 14:08:06
