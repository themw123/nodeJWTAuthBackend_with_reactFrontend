-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Win64 (AMD64)

--

-- Host: localhost    Database: platinendb

-- ------------------------------------------------------

-- Server version	10.4.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */

;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */

;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */

;

/*!40101 SET NAMES utf8mb4 */

;

/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */

;

/*!40103 SET TIME_ZONE='+00:00' */

;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */

;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */

;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */

;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */

;

--

-- Current Database: `platinendb`

--

CREATE USER 'jwt'@'%' IDENTIFIED BY '123test123';

GRANT ALL PRIVILEGES ON *.* TO 'jwt'@'%';

CREATE DATABASE
    /*!32312 IF NOT EXISTS*/
    `platinendb`
    /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */
;

USE `platinendb`;

--

-- Temporary table structure for view `anzahlausstehend`

--

DROP TABLE IF EXISTS `anzahlausstehend`;

/*!50001 DROP VIEW IF EXISTS `anzahlausstehend`*/

;

SET @saved_cs_client = @@character_set_client;

SET character_set_client = utf8;

/*!50001 CREATE TABLE `anzahlausstehend` (
 `ID` tinyint NOT NULL,
 `NAME` tinyint NOT NULL,
 `ausstehend` tinyint NOT NULL
 ) ENGINE=MyISAM */

;

SET character_set_client = @saved_cs_client;

--

-- Temporary table structure for view `auftraege`

--

DROP TABLE IF EXISTS `auftraege`;

/*!50001 DROP VIEW IF EXISTS `auftraege`*/

;

SET @saved_cs_client = @@character_set_client;

SET character_set_client = utf8;

/*!50001 CREATE TABLE `auftraege` (
 `Anzahlaufträge` tinyint NOT NULL
 ) ENGINE=MyISAM */

;

SET character_set_client = @saved_cs_client;

--

-- Temporary table structure for view `austehend1oder0`

--

DROP TABLE IF EXISTS `austehend1oder0`;

/*!50001 DROP VIEW IF EXISTS `austehend1oder0`*/

;

SET @saved_cs_client = @@character_set_client;

SET character_set_client = utf8;

/*!50001 CREATE TABLE `austehend1oder0` (
 `ID` tinyint NOT NULL,
 `Name` tinyint NOT NULL,
 `zustand` tinyint NOT NULL
 ) ENGINE=MyISAM */

;

SET character_set_client = @saved_cs_client;

--

-- Table structure for table `backupnutzen`

--

DROP TABLE IF EXISTS `backupnutzen`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE
    `backupnutzen` (
        `ID` int(11) NOT NULL AUTO_INCREMENT,
        `Nr` int(10) unsigned DEFAULT NULL,
        `Bearbeiter_ID` int(11) DEFAULT NULL,
        `Material_ID` int(11) NOT NULL,
        `Endkupfer` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        `Staerke` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        `Lagen` int(11) NOT NULL,
        `Lagen_ID` int(11) DEFAULT NULL,
        `Groesse` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        `Datum` datetime DEFAULT NULL,
        `intoderext` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        `Status1` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        `Testdaten` tinyint(4) NOT NULL,
        `Datum1` datetime DEFAULT NULL,
        `Datum2` datetime DEFAULT NULL,
        `Kommentar` longtext COLLATE utf8_unicode_ci NOT NULL,
        PRIMARY KEY (`ID`),
        KEY `Material_ID` (`Material_ID`),
        KEY `Bearbeiter_ID` (`Bearbeiter_ID`),
        KEY `Lagen_ID` (`Lagen_ID`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 10131 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `backupnutzen`

--

LOCK TABLES `backupnutzen` WRITE;

/*!40000 ALTER TABLE `backupnutzen` DISABLE KEYS */

;

/*!40000 ALTER TABLE `backupnutzen` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `backupnutzenlagen`

--

DROP TABLE IF EXISTS `backupnutzenlagen`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE
    `backupnutzenlagen` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `Top` double DEFAULT NULL,
        `L2` double DEFAULT NULL,
        `L3` double DEFAULT NULL,
        `L4` double DEFAULT NULL,
        `L5` double DEFAULT NULL,
        `Bottom` double DEFAULT NULL,
        `LagenSumme` double DEFAULT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `backupnutzenlagen`

--

LOCK TABLES `backupnutzenlagen` WRITE;

/*!40000 ALTER TABLE `backupnutzenlagen` DISABLE KEYS */

;

/*!40000 ALTER TABLE `backupnutzenlagen` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `backupnutzenplatinen`

--

DROP TABLE IF EXISTS `backupnutzenplatinen`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE
    `backupnutzenplatinen` (
        `ID` int(11) NOT NULL AUTO_INCREMENT,
        `Platinen_ID` int(11) DEFAULT NULL,
        `Nutzen_ID` int(11) NOT NULL,
        `platinenaufnutzen` int(11) NOT NULL,
        PRIMARY KEY (`ID`),
        KEY `Platinen_ID` (`Platinen_ID`),
        KEY `Nutzen_ID` (`Nutzen_ID`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 990 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `backupnutzenplatinen`

--

LOCK TABLES `backupnutzenplatinen` WRITE;

/*!40000 ALTER TABLE `backupnutzenplatinen` DISABLE KEYS */

;

/*!40000 ALTER TABLE `backupnutzenplatinen` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `backupplatinen`

--

DROP TABLE IF EXISTS `backupplatinen`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE
    `backupplatinen` (
        `ID` int(11) NOT NULL AUTO_INCREMENT,
        `Auftraggeber_ID` int(11) NOT NULL,
        `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        `Anzahl` int(11) NOT NULL,
        `Finanzstelle_ID` int(11) NOT NULL,
        `Material_ID` int(11) NOT NULL,
        `Endkupfer` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        `Staerke` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        `Lagen` int(11) NOT NULL,
        `Groesse` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        `Oberflaeche` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        `Loetstopp` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        `erstelltam` datetime DEFAULT NULL,
        `wunschDatum` datetime DEFAULT NULL,
        `Kommentar` longtext COLLATE utf8_unicode_ci NOT NULL,
        `Downloads_ID` int(11) DEFAULT NULL,
        `ignorieren` tinyint(4) DEFAULT NULL,
        PRIMARY KEY (`ID`) USING BTREE,
        KEY `Material_ID` (`Material_ID`),
        KEY `Auftraggeber_ID` (`Auftraggeber_ID`),
        KEY `platinen_ibfk_3` (`Downloads_ID`),
        KEY `Finanzstelle_ID` (`Finanzstelle_ID`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 122723 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `backupplatinen`

--

LOCK TABLES `backupplatinen` WRITE;

/*!40000 ALTER TABLE `backupplatinen` DISABLE KEYS */

;

/*!40000 ALTER TABLE `backupplatinen` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Temporary table structure for view `detailplatineadd`

--

DROP TABLE IF EXISTS `detailplatineadd`;

/*!50001 DROP VIEW IF EXISTS `detailplatineadd`*/

;

SET @saved_cs_client = @@character_set_client;

SET character_set_client = utf8;

/*!50001 CREATE TABLE `detailplatineadd` (
 `ID` tinyint NOT NULL,
 `NAME` tinyint NOT NULL,
 `user_name` tinyint NOT NULL,
 `erstelltam` tinyint NOT NULL,
 `ausstehend` tinyint NOT NULL,
 `MaterialName` tinyint NOT NULL,
 `Endkupfer` tinyint NOT NULL,
 `Staerke` tinyint NOT NULL,
 `Lagen` tinyint NOT NULL,
 `ignorieren` tinyint NOT NULL
 ) ENGINE=MyISAM */

;

SET character_set_client = @saved_cs_client;

--

-- Table structure for table `downloads`

--

DROP TABLE IF EXISTS `downloads`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE
    `downloads` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `download` longblob NOT NULL,
        `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
        `size` int(11) NOT NULL,
        `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `downloads`

--

LOCK TABLES `downloads` WRITE;

/*!40000 ALTER TABLE `downloads` DISABLE KEYS */

;

INSERT INTO `downloads`
VALUES (
        3,
        'Rar!\Z\03���\n\0��\0e�~E&\0\0\0\0\0\0�\0\0Neuer Ordner\nW&5��X�wVQ\0',
        'Neuer Ordner.rar',
        74,
        'application/octet-stream'
    ), (
        4,
        'Rar!\Z\03���\n\0��\0&�>\0\0\0\0\0\0�\0\0täst\n�Gtc�c�wVQ\0',
        'täst.rar',
        67,
        'application/octet-stream'
    ), (
        5,
        'Rar!\Z\03���\n\0��\0&�>\0\0\0\0\0\0�\0\0täst\n�Gtc�c�wVQ\0',
        'täst.rar',
        67,
        'application/octet-stream'
    );

/*!40000 ALTER TABLE `downloads` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `finanzstelle`

--

DROP TABLE IF EXISTS `finanzstelle`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE
    `finanzstelle` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
        `nummer` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
        PRIMARY KEY (`id`),
        UNIQUE KEY `name` (`name`),
        UNIQUE KEY `nummer` (`nummer`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 47 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `finanzstelle`

--

LOCK TABLES `finanzstelle` WRITE;

/*!40000 ALTER TABLE `finanzstelle` DISABLE KEYS */

;

INSERT INTO `finanzstelle`
VALUES (1, 'est', '0123456789'), (41, 'unbekannt', '0000000000');

/*!40000 ALTER TABLE `finanzstelle` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `lehrstuhl`

--

DROP TABLE IF EXISTS `lehrstuhl`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE
    `lehrstuhl` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `kuerzel` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        PRIMARY KEY (`id`),
        UNIQUE KEY `kuerzel` (`kuerzel`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 62 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `lehrstuhl`

--

LOCK TABLES `lehrstuhl` WRITE;

/*!40000 ALTER TABLE `lehrstuhl` DISABLE KEYS */

;

INSERT INTO `lehrstuhl` VALUES (1,'est');

/*!40000 ALTER TABLE `lehrstuhl` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `material`

--

DROP TABLE IF EXISTS `material`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE
    `material` (
        `ID` int(11) NOT NULL AUTO_INCREMENT,
        `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        PRIMARY KEY (`ID`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `material`

--

LOCK TABLES `material` WRITE;

/*!40000 ALTER TABLE `material` DISABLE KEYS */

;

INSERT INTO `material`
VALUES (1, 'fr4'), (2, 'roger4003'), (3, 'spezial');

/*!40000 ALTER TABLE `material` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `nutzen`

--

DROP TABLE IF EXISTS `nutzen`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE
    `nutzen` (
        `ID` int(11) NOT NULL AUTO_INCREMENT,
        `Nr` int(10) unsigned DEFAULT NULL,
        `Bearbeiter_ID` int(11) DEFAULT NULL,
        `Material_ID` int(11) NOT NULL,
        `Finanzstelle_ID` int(11) DEFAULT NULL,
        `Endkupfer` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        `Staerke` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        `Lagen` int(11) NOT NULL,
        `Lagen_ID` int(11) DEFAULT NULL,
        `Groesse` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        `Datum` datetime DEFAULT NULL,
        `intoderext` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        `Status1` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        `Testdaten` tinyint(4) NOT NULL,
        `Datum1` datetime DEFAULT NULL,
        `Datum2` datetime DEFAULT NULL,
        `Kommentar` longtext COLLATE utf8_unicode_ci NOT NULL,
        PRIMARY KEY (`ID`),
        KEY `Material_ID` (`Material_ID`),
        KEY `Bearbeiter_ID` (`Bearbeiter_ID`) USING BTREE,
        KEY `Lagen_ID` (`Lagen_ID`),
        KEY `Finanzstelle_ID` (`Finanzstelle_ID`),
        CONSTRAINT `nutzen_ibfk_1` FOREIGN KEY (`Bearbeiter_ID`) REFERENCES `login`.`users` (`user_id`) ON UPDATE CASCADE,
        CONSTRAINT `nutzen_ibfk_2` FOREIGN KEY (`Material_ID`) REFERENCES `material` (`ID`) ON UPDATE CASCADE,
        CONSTRAINT `nutzen_ibfk_3` FOREIGN KEY (`Lagen_ID`) REFERENCES `nutzenlagen` (`id`) ON UPDATE CASCADE,
        CONSTRAINT `nutzen_ibfk_4` FOREIGN KEY (`Finanzstelle_ID`) REFERENCES `finanzstelle` (`id`) ON UPDATE CASCADE
    ) ENGINE = InnoDB AUTO_INCREMENT = 10140 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `nutzen`

--

LOCK TABLES `nutzen` WRITE;

/*!40000 ALTER TABLE `nutzen` DISABLE KEYS */

;

INSERT INTO `nutzen`
VALUES (
        216,
        928,
        101,
        3,
        1,
        '35µ',
        'spezial',
        2,
        NULL,
        'groß',
        '2021-07-14 00:00:00',
        'ext',
        'Fertigung',
        0,
        '2021-07-15 00:00:00',
        NULL,
        ''
    ), (
        217,
        923,
        101,
        1,
        NULL,
        '35µ',
        '1,55',
        2,
        NULL,
        'groß',
        '2021-07-07 00:00:00',
        'int',
        'neu',
        0,
        NULL,
        NULL,
        ''
    ), (
        218,
        922,
        101,
        3,
        NULL,
        '35µ',
        '1,0',
        2,
        NULL,
        'groß',
        '2021-07-06 15:35:36',
        'int',
        'Fertigung',
        0,
        '2021-07-15 00:00:00',
        NULL,
        ''
    ), (
        219,
        918,
        101,
        3,
        NULL,
        '35µ',
        '1,0',
        2,
        NULL,
        'groß',
        '2021-07-06 15:18:36',
        'int',
        'Fertigung',
        0,
        '2021-11-04 00:00:00',
        NULL,
        ''
    ), (
        220,
        925,
        81,
        1,
        NULL,
        '35µ',
        '1,55',
        2,
        NULL,
        'groß',
        '2021-07-05 15:27:58',
        'ext',
        'neu',
        0,
        NULL,
        NULL,
        ''
    ), (
        221,
        924,
        81,
        1,
        NULL,
        '35µ',
        '1,55',
        4,
        NULL,
        'groß',
        '2021-07-02 15:29:14',
        'int',
        'neu',
        0,
        NULL,
        NULL,
        ''
    ), (
        222,
        921,
        101,
        1,
        NULL,
        '35µ',
        '1,55',
        2,
        NULL,
        'mittel',
        '2021-06-30 15:30:12',
        'int',
        'Fertigung',
        0,
        '2021-06-30 00:00:00',
        NULL,
        ''
    ), (
        223,
        1,
        81,
        1,
        1,
        '35µ',
        '1,55',
        4,
        NULL,
        'groß',
        '2021-06-28 15:32:30',
        'ext',
        'Fertigung',
        0,
        '2021-06-28 00:00:00',
        NULL,
        ''
    ), (
        224,
        2,
        81,
        1,
        1,
        '35µ',
        '1,55',
        2,
        NULL,
        'groß',
        '2021-06-14 15:34:25',
        'ext',
        'Fertigung',
        0,
        '2021-06-29 00:00:00',
        NULL,
        ''
    ), (
        225,
        927,
        81,
        3,
        NULL,
        '35µ',
        '0,2',
        4,
        NULL,
        'groß',
        '2021-06-10 15:38:11',
        'int',
        'Fertigung',
        0,
        '2021-07-13 00:00:00',
        NULL,
        ''
    ), (
        226,
        926,
        81,
        3,
        NULL,
        '35µ',
        '0,5',
        2,
        NULL,
        'groß',
        '2021-06-10 15:37:25',
        'int',
        'Fertigung',
        0,
        '2021-07-13 00:00:00',
        NULL,
        ''
    ), (
        230,
        929,
        102,
        1,
        NULL,
        '35µ',
        '1,55',
        2,
        NULL,
        'mittel',
        '2021-08-03 17:11:09',
        'int',
        'Fertigung',
        1,
        '2021-08-03 00:00:00',
        NULL,
        ''
    ), (
        231,
        930,
        81,
        1,
        NULL,
        '35µ',
        '1,55',
        2,
        NULL,
        'mittel',
        '2021-08-05 14:19:57',
        'int',
        'neu',
        1,
        NULL,
        NULL,
        'Stackaufbau:  0,2mm RO4003, 2x0,1mm Prepreg, 0,6mm FR4, keine Durchkontaktierungen vorhanden'
    ), (
        238,
        931,
        101,
        1,
        NULL,
        '35µ',
        '1,0',
        2,
        NULL,
        'groß',
        '2021-08-05 17:32:48',
        'int',
        'neu',
        1,
        NULL,
        NULL,
        ''
    ), (
        239,
        932,
        101,
        1,
        NULL,
        '35µ',
        '1,55',
        2,
        NULL,
        'groß',
        '2021-08-05 17:33:47',
        'ext',
        'neu',
        1,
        NULL,
        NULL,
        ''
    ), (
        240,
        933,
        102,
        1,
        1,
        '35µ',
        '1,55',
        2,
        NULL,
        'groß',
        '2021-08-05 17:33:57',
        'ext',
        'Fertigung',
        1,
        '2022-07-15 00:00:00',
        NULL,
        ''
    ), (
        243,
        934,
        12,
        1,
        NULL,
        '35µ',
        '1,55',
        2,
        NULL,
        'mittel',
        '2021-08-11 16:11:57',
        'int',
        'abgeschlossen',
        0,
        '2021-08-11 00:00:00',
        '2021-10-18 00:00:00',
        ''
    ), (
        244,
        935,
        102,
        1,
        NULL,
        '35µ',
        '1,55',
        2,
        NULL,
        'mittel',
        '2021-07-04 16:12:36',
        'int',
        'abgeschlossen',
        0,
        '2021-08-11 00:00:00',
        '2021-08-11 00:00:00',
        ''
    ), (
        245,
        936,
        12,
        1,
        1,
        '35µ',
        '1,55',
        2,
        NULL,
        'mittel',
        '2021-08-11 21:36:55',
        'ext',
        'Fertigung',
        0,
        '2022-07-15 00:00:00',
        NULL,
        ''
    ), (
        246,
        937,
        12,
        1,
        NULL,
        '35µ',
        '1,55',
        1,
        NULL,
        'mittel',
        '2021-08-11 21:37:01',
        'int',
        'Fertigung',
        0,
        '2021-08-11 00:00:00',
        NULL,
        ''
    ), (
        247,
        938,
        12,
        1,
        NULL,
        '35µ',
        '1,55',
        1,
        NULL,
        'mittel',
        '2021-08-11 21:37:08',
        'int',
        'Fertigung',
        0,
        '2021-08-11 00:00:00',
        NULL,
        ''
    ), (
        248,
        939,
        12,
        1,
        NULL,
        '35µ',
        '1,55',
        1,
        NULL,
        'mittel',
        '2021-08-11 21:37:16',
        'int',
        'Fertigung',
        0,
        '2021-08-11 00:00:00',
        NULL,
        ''
    ), (
        249,
        940,
        102,
        1,
        NULL,
        '35µ',
        '1,55',
        1,
        NULL,
        'mittel',
        '2021-08-11 21:37:23',
        'int',
        'Fertigung',
        0,
        '2021-08-11 00:00:00',
        NULL,
        ''
    ), (
        250,
        941,
        12,
        1,
        NULL,
        '35µ',
        '1,0',
        1,
        NULL,
        'mittel',
        '2021-08-11 21:44:32',
        'ext',
        'neu',
        0,
        NULL,
        NULL,
        ''
    ), (
        251,
        942,
        12,
        1,
        NULL,
        '35µ',
        '1,55',
        1,
        NULL,
        'mittel',
        '2021-08-11 21:44:41',
        'int',
        'Fertigung',
        0,
        '2021-08-11 00:00:00',
        NULL,
        ''
    ), (
        252,
        943,
        12,
        1,
        NULL,
        '35µ',
        '1,55',
        1,
        NULL,
        'mittel',
        '2021-08-11 21:44:47',
        'int',
        'Fertigung',
        0,
        '2021-08-11 00:00:00',
        NULL,
        ''
    ), (
        253,
        944,
        12,
        1,
        NULL,
        '35µ',
        '1,55',
        1,
        NULL,
        'mittel',
        '2021-10-13 00:00:00',
        'int',
        'Fertigung',
        0,
        '2021-10-11 00:00:00',
        NULL,
        ''
    ), (
        254,
        945,
        102,
        3,
        1,
        '35µ',
        '0,5',
        2,
        NULL,
        'mittel',
        '2021-08-12 12:43:31',
        'ext',
        'Fertigung',
        0,
        '2022-06-20 00:00:00',
        NULL,
        ''
    ), (
        276,
        946,
        12,
        1,
        NULL,
        '35µ',
        '1,55',
        2,
        NULL,
        'mittel',
        '2022-02-27 20:03:42',
        'int',
        'Fertigung',
        0,
        '2022-02-27 00:00:00',
        NULL,
        ''
    ), (
        10116,
        947,
        12,
        2,
        1,
        '35µ',
        '1,55',
        2,
        NULL,
        'individuell',
        '2022-04-22 15:12:07',
        'ext',
        'Fertigung',
        1,
        '2022-07-15 00:00:00',
        NULL,
        ''
    ), (
        10124,
        948,
        12,
        1,
        1,
        '35µ',
        '1,55',
        6,
        NULL,
        'mittel',
        '2022-06-07 13:08:41',
        'ext',
        'Fertigung',
        0,
        '2022-06-21 00:00:00',
        NULL,
        ''
    ), (
        10130,
        949,
        12,
        1,
        1,
        '35µ',
        '1,55',
        6,
        32,
        'mittel',
        '2022-06-07 15:16:05',
        'ext',
        'abgeschlossen',
        0,
        '2022-06-07 00:00:00',
        '2022-06-07 00:00:00',
        ''
    ), (
        10134,
        950,
        77,
        2,
        NULL,
        '35µ',
        '1,55',
        2,
        NULL,
        'mittel',
        '2022-07-15 15:05:20',
        'int',
        'neu',
        0,
        NULL,
        NULL,
        ''
    );

/*!40000 ALTER TABLE `nutzen` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `nutzenlagen`

--

DROP TABLE IF EXISTS `nutzenlagen`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE
    `nutzenlagen` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `Top` double DEFAULT NULL,
        `L2` double DEFAULT NULL,
        `L3` double DEFAULT NULL,
        `L4` double DEFAULT NULL,
        `L5` double DEFAULT NULL,
        `Bottom` double DEFAULT NULL,
        `LagenSumme` double DEFAULT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 49 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `nutzenlagen`

--

LOCK TABLES `nutzenlagen` WRITE;

/*!40000 ALTER TABLE `nutzenlagen` DISABLE KEYS */

;

INSERT INTO `nutzenlagen`
VALUES (
        32,
        56947.8538,
        72602.8709,
        71610.0665,
        71408.9056,
        72603.0967,
        59563.5583,
        404736.3518
    ), (
        35,
        1883.5607,
        NULL,
        NULL,
        NULL,
        NULL,
        10920.5265,
        12804.0872
    );

/*!40000 ALTER TABLE `nutzenlagen` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `nutzenplatinen`

--

DROP TABLE IF EXISTS `nutzenplatinen`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE
    `nutzenplatinen` (
        `ID` int(11) NOT NULL AUTO_INCREMENT,
        `Platinen_ID` int(11) DEFAULT NULL,
        `Nutzen_ID` int(11) NOT NULL,
        `platinenaufnutzen` int(11) NOT NULL,
        PRIMARY KEY (`ID`),
        KEY `Platinen_ID` (`Platinen_ID`),
        KEY `Nutzen_ID` (`Nutzen_ID`),
        CONSTRAINT `NutzenPlatinen_ibfk_1` FOREIGN KEY (`Platinen_ID`) REFERENCES `platinen` (`ID`),
        CONSTRAINT `NutzenPlatinen_ibfk_2` FOREIGN KEY (`Nutzen_ID`) REFERENCES `nutzen` (`ID`) ON DELETE CASCADE
    ) ENGINE = InnoDB AUTO_INCREMENT = 1009 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `nutzenplatinen`

--

LOCK TABLES `nutzenplatinen` WRITE;

/*!40000 ALTER TABLE `nutzenplatinen` DISABLE KEYS */

;

INSERT INTO `nutzenplatinen`
VALUES (803, 449, 216, 2), (804, 450, 216, 2), (805, 451, 217, 5), (806, 452, 218, 1), (808, 454, 218, 1), (810, 456, 218, 1), (812, 458, 220, 2), (814, 460, 222, 20), (815, 461, 222, 1), (817, 463, 224, 3), (818, 464, 225, 1), (819, 465, 225, 1), (820, 466, 226, 1), (821, 467, 226, 1), (837, 487, 243, 1), (838, 487, 244, 1), (840, 487, 240, 1), (842, 491, 244, 2), (843, 493, 244, 1), (846, 487, 239, 1), (850, 501, 243, 5), (853, 451, 231, 2), (861, 457, 219, 1), (890, 467, 254, 2), (892, 448, 224, 2), (893, 462, 223, 4), (894, 541, 244, 2), (895, 488, 243, 1), (896, 541, 243, 1), (941, 451, 276, 2), (966, 490, 10116, 3), (969, 486, 10116, 3), (984, 122745, 10124, 1), (989, 122745, 10130, 1), (994, 492, 240, 5), (995, 489, 240, 2), (999, 461, 245, 1), (1002, 501, 220, 1), (1003, 487, 220, 1);

/*!40000 ALTER TABLE `nutzenplatinen` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Temporary table structure for view `nutzenview`

--

DROP TABLE IF EXISTS `nutzenview`;

/*!50001 DROP VIEW IF EXISTS `nutzenview`*/

;

SET @saved_cs_client = @@character_set_client;

SET character_set_client = utf8;

/*!50001 CREATE TABLE `nutzenview` (
 `ID` tinyint NOT NULL,
 `Nr` tinyint NOT NULL,
 `Bearbeiter` tinyint NOT NULL,
 `Status` tinyint NOT NULL,
 `Material` tinyint NOT NULL,
 `Finanzstelle_name` tinyint NOT NULL,
 `Finanzstelle_nummer` tinyint NOT NULL,
 `Endkupfer` tinyint NOT NULL,
 `Staerke` tinyint NOT NULL,
 `Lagen` tinyint NOT NULL,
 `erstellt` tinyint NOT NULL,
 `Fertigung` tinyint NOT NULL,
 `abgeschlossen` tinyint NOT NULL,
 `Groesse` tinyint NOT NULL,
 `intoderext` tinyint NOT NULL,
 `Testdaten` tinyint NOT NULL,
 `Kommentar` tinyint NOT NULL,
 `dringlichkeitFertigung` tinyint NOT NULL
 ) ENGINE=MyISAM */

;

SET character_set_client = @saved_cs_client;

--

-- Table structure for table `platinen`

--

DROP TABLE IF EXISTS `platinen`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE
    `platinen` (
        `ID` int(11) NOT NULL AUTO_INCREMENT,
        `Auftraggeber_ID` int(11) NOT NULL,
        `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        `Anzahl` int(11) NOT NULL,
        `Finanzstelle_ID` int(11) NOT NULL,
        `Material_ID` int(11) NOT NULL,
        `Endkupfer` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        `Staerke` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        `Lagen` int(11) NOT NULL,
        `Groesse` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        `Oberflaeche` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        `Loetstopp` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
        `Bestueckungsdruck` tinyint(1) NOT NULL,
        `erstelltam` datetime DEFAULT NULL,
        `wunschDatum` datetime DEFAULT NULL,
        `Kommentar` longtext COLLATE utf8_unicode_ci NOT NULL,
        `Downloads_ID` int(11) DEFAULT NULL,
        `ignorieren` tinyint(4) DEFAULT NULL,
        PRIMARY KEY (`ID`) USING BTREE,
        KEY `Material_ID` (`Material_ID`),
        KEY `Auftraggeber_ID` (`Auftraggeber_ID`),
        KEY `platinen_ibfk_3` (`Downloads_ID`),
        KEY `Finanzstelle_ID` (`Finanzstelle_ID`),
        CONSTRAINT `platinen_ibfk_1` FOREIGN KEY (`Auftraggeber_ID`) REFERENCES `login`.`users` (`user_id`) ON UPDATE CASCADE,
        CONSTRAINT `platinen_ibfk_2` FOREIGN KEY (`Material_ID`) REFERENCES `material` (`ID`) ON UPDATE CASCADE,
        CONSTRAINT `platinen_ibfk_3` FOREIGN KEY (`Downloads_ID`) REFERENCES `downloads` (`id`) ON UPDATE CASCADE,
        CONSTRAINT `platinen_ibfk_4` FOREIGN KEY (`Finanzstelle_ID`) REFERENCES `finanzstelle` (`id`) ON UPDATE CASCADE
    ) ENGINE = InnoDB AUTO_INCREMENT = 122781 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `platinen`

--

LOCK TABLES `platinen` WRITE;

/*!40000 ALTER TABLE `platinen` DISABLE KEYS */

;

INSERT INTO `platinen`
VALUES (
        448,
        8,
        'TelefonDrHut',
        5,
        41,
        1,
        '35µ',
        '1,55',
        2,
        '76x36',
        'Zinn',
        'ja',
        0,
        '2021-08-02 14:43:47',
        NULL,
        '',
        NULL,
        0
    ), (
        449,
        8,
        'FiberBEv2B',
        2,
        1,
        3,
        '35µ',
        'spezial',
        2,
        '148x174',
        'egal',
        'ja',
        0,
        '2021-07-14 14:42:55',
        NULL,
        '',
        NULL,
        0
    ), (
        450,
        8,
        '1GHZ_OxCO',
        2,
        1,
        3,
        '35µ',
        'spezial',
        2,
        '69x235',
        'egal',
        'ja',
        0,
        '2021-07-14 14:41:24',
        NULL,
        '',
        NULL,
        0
    ), (
        451,
        12,
        'Anschlussplatte_7_72',
        8,
        1,
        1,
        '35µ',
        '1,55',
        2,
        '160x72',
        'Zinn',
        'ja',
        0,
        '2021-07-31 14:27:27',
        NULL,
        '',
        NULL,
        0
    ), (
        452,
        9,
        'YIGdiag_Platine_WPD_LP_06_2021',
        1,
        1,
        3,
        '35µ',
        '1,0',
        2,
        '-',
        'egal',
        'nein',
        0,
        '2021-07-06 14:46:50',
        NULL,
        '',
        NULL,
        0
    ), (
        453,
        9,
        'YIGdiag_Platine_LP_06_2021',
        6,
        1,
        3,
        '35µ',
        '1,0',
        2,
        '-',
        'egal',
        'nein',
        0,
        '2021-07-06 14:45:28',
        NULL,
        '',
        NULL,
        0
    ), (
        454,
        9,
        'YIGcross_Platine_WPD_LP_06_2021',
        3,
        1,
        3,
        '35µ',
        '1,0',
        2,
        '-',
        'egal',
        'nein',
        0,
        '2021-07-06 14:44:17',
        NULL,
        '',
        NULL,
        0
    ), (
        455,
        9,
        'YIGcross_Platine_LP_06_2021',
        1,
        1,
        3,
        '35µ',
        '1,0',
        2,
        '-',
        'egal',
        'nein',
        0,
        '2021-07-06 14:43:39',
        NULL,
        '',
        NULL,
        0
    ), (
        456,
        9,
        'WPD_Platine_LP_06_2021',
        1,
        1,
        3,
        '35µ',
        '1,0',
        2,
        '-',
        'egal',
        'nein',
        0,
        '2021-07-06 14:42:17',
        NULL,
        '',
        NULL,
        0
    ), (
        457,
        9,
        'TOSM_Kal_LP_06_2021',
        1,
        1,
        3,
        '35µ',
        '1,0',
        2,
        '-',
        'egal',
        'nein',
        0,
        '2021-07-06 14:41:48',
        NULL,
        '',
        NULL,
        0
    ), (
        458,
        12,
        'SR-DE0-Adapter_V1.0r0',
        2,
        1,
        1,
        '35µ',
        '1,55',
        2,
        '160x100',
        'Zinn',
        'ja',
        0,
        '2021-07-05 14:34:21',
        NULL,
        '',
        NULL,
        0
    ), (
        460,
        12,
        'Stecker_ELR',
        20,
        1,
        1,
        '35µ',
        '1,55',
        2,
        '28x16',
        'Zinn',
        'ja',
        0,
        '2021-10-18 14:35:54',
        NULL,
        '',
        NULL,
        0
    ), (
        461,
        12,
        'Pi-Adapter',
        2,
        1,
        1,
        '35µ',
        '1,55',
        2,
        '56x93',
        'Zinn',
        'ja',
        0,
        '2021-06-29 14:36:33',
        NULL,
        '',
        NULL,
        0
    ), (
        462,
        12,
        'kalibrierstandard',
        4,
        1,
        1,
        '35µ',
        '1,55',
        4,
        '160x160',
        'egal',
        'ja',
        0,
        '2021-10-10 14:37:07',
        NULL,
        '',
        NULL,
        0
    ), (
        463,
        12,
        'verteiler-platine',
        3,
        1,
        1,
        '35µ',
        '1,55',
        2,
        '190x120',
        'egal',
        'ja',
        0,
        '2021-06-14 14:37:43',
        NULL,
        '',
        NULL,
        0
    ), (
        464,
        10,
        'Wilkinson_Xband_2',
        1,
        1,
        3,
        '35µ',
        '0,2',
        4,
        '18x22',
        'Zinn',
        'nein',
        0,
        '2021-06-10 14:44:16',
        NULL,
        '',
        NULL,
        0
    ), (
        465,
        10,
        'Wilkinson_Xband_1',
        1,
        1,
        3,
        '35µ',
        '0,2',
        4,
        '18x22',
        'Zinn',
        'nein',
        0,
        '2021-06-10 14:43:01',
        NULL,
        '',
        NULL,
        0
    ), (
        466,
        10,
        'Patch_Xband_2',
        1,
        1,
        3,
        '35µ',
        '0,5',
        2,
        '16x21',
        'Zinn',
        'nein',
        0,
        '2021-10-11 14:42:03',
        NULL,
        '',
        NULL,
        0
    ), (
        467,
        10,
        'Patch_Xband_1',
        3,
        1,
        3,
        '35µ',
        '0,5',
        2,
        '16x21',
        'Zinn',
        'nein',
        0,
        '2021-06-10 14:41:36',
        NULL,
        '',
        NULL,
        0
    ), (
        485,
        12,
        'platine1',
        3,
        1,
        1,
        '35µ',
        '1,55',
        2,
        '-',
        'Zinn',
        'ja',
        0,
        '2021-08-05 12:30:08',
        NULL,
        'sssssssssssssssssssssssssssssssssssssssssss',
        NULL,
        0
    ), (
        486,
        12,
        '2ds',
        4,
        41,
        2,
        '35µ',
        '1,55',
        2,
        '-',
        'Zinn',
        'nein',
        0,
        '2021-10-03 17:34:14',
        NULL,
        '',
        NULL,
        0
    ), (
        487,
        12,
        'aa',
        8,
        41,
        1,
        '35µ',
        '1,55',
        2,
        '-',
        'Zinn',
        'ja',
        0,
        '2021-09-30 17:34:14',
        NULL,
        '',
        NULL,
        0
    ), (
        488,
        12,
        'bb',
        1,
        1,
        1,
        '35µ',
        '1,55',
        2,
        '-',
        'Zinn',
        'ja',
        0,
        '2021-10-03 16:25:25',
        NULL,
        '',
        NULL,
        0
    ), (
        489,
        12,
        'ggg',
        2,
        1,
        1,
        '35µ',
        '1,55',
        2,
        '-',
        'Zinn',
        'ja',
        0,
        '2021-10-03 17:34:14',
        NULL,
        '',
        NULL,
        0
    ), (
        490,
        12,
        'efe',
        11,
        41,
        2,
        '35µ',
        '1,55',
        2,
        '-',
        'Zinn',
        'nein',
        0,
        '2021-05-02 17:21:39',
        '2022-03-31 00:00:00',
        '',
        NULL,
        0
    ), (
        491,
        12,
        'xcc',
        2,
        1,
        1,
        '35µ',
        '1,55',
        2,
        '-',
        'Zinn',
        'ja',
        0,
        '2021-10-10 17:49:37',
        NULL,
        '',
        NULL,
        0
    ), (
        492,
        12,
        'yy',
        7,
        1,
        1,
        '35µ',
        '1,55',
        2,
        '-',
        'Zinn',
        'ja',
        0,
        '2021-09-30 17:34:14',
        NULL,
        '',
        NULL,
        0
    ), (
        493,
        12,
        'cc',
        1,
        1,
        1,
        '35µ',
        '1,55',
        2,
        '-',
        'Zinn',
        'ja',
        0,
        '2021-08-11 18:57:45',
        NULL,
        '',
        NULL,
        0
    ), (
        496,
        12,
        'cv',
        2,
        1,
        1,
        '35µ',
        '1,55',
        2,
        '-',
        'Zinn',
        'ja',
        0,
        '2021-10-11 16:25:25',
        NULL,
        '',
        NULL,
        0
    ), (
        497,
        12,
        'sa',
        4,
        1,
        1,
        '35µ',
        '1,55',
        2,
        '-',
        'Zinn',
        'ja',
        0,
        '2021-10-28 14:34:54',
        NULL,
        '',
        NULL,
        0
    ), (
        501,
        8,
        'qq',
        6,
        1,
        1,
        '35µ',
        '1,55',
        2,
        '-',
        'Zinn',
        'ja',
        0,
        '2021-08-12 15:21:56',
        NULL,
        '',
        NULL,
        0
    ), (
        541,
        12,
        'ttr',
        3,
        1,
        1,
        '35µ',
        '1,55',
        2,
        '-',
        'Gold',
        'ja',
        0,
        '2021-10-11 15:02:47',
        NULL,
        '',
        NULL,
        0
    ), (
        543,
        12,
        'ssd',
        2,
        1,
        1,
        '35µ',
        '1,55',
        2,
        '-',
        'Zinn',
        'nein',
        0,
        '2021-11-25 16:47:11',
        NULL,
        '',
        NULL,
        0
    ), (
        112719,
        12,
        'n',
        2,
        1,
        3,
        '35µ',
        '0,5',
        2,
        '-',
        'Zinn',
        'ja',
        0,
        '2022-02-27 19:12:02',
        NULL,
        '',
        NULL,
        0
    ), (
        122722,
        12,
        'jj',
        3,
        1,
        3,
        '35µ',
        '0,5',
        2,
        '-',
        'Zinn',
        'ja',
        0,
        '2022-02-27 19:34:16',
        NULL,
        '',
        NULL,
        0
    ), (
        122742,
        12,
        'sd',
        2,
        1,
        1,
        '35µ',
        '1,55',
        2,
        '-',
        'Zinn',
        'ja',
        0,
        '2022-05-02 18:00:20',
        NULL,
        '',
        3,
        0
    ), (
        122744,
        12,
        'd',
        2,
        1,
        1,
        '35µ',
        '1,55',
        2,
        '-',
        'Zinn',
        'ja',
        0,
        '2022-05-09 15:33:52',
        NULL,
        '',
        4,
        0
    ), (
        122745,
        12,
        'hh',
        3,
        1,
        1,
        '35µ',
        '1,55',
        6,
        '-',
        'Zinn',
        'ja',
        0,
        '2022-05-09 16:50:55',
        NULL,
        '',
        5,
        0
    ), (
        122752,
        12,
        'grr',
        3,
        1,
        1,
        '35µ',
        '1,55',
        2,
        '-',
        'Zinn',
        'nein',
        0,
        '2022-06-13 17:57:46',
        NULL,
        '',
        NULL,
        0
    );

/*!40000 ALTER TABLE `platinen` ENABLE KEYS */

;

UNLOCK TABLES;

/*!50003 SET @saved_cs_client      = @@character_set_client */

;

/*!50003 SET @saved_cs_results     = @@character_set_results */

;

/*!50003 SET @saved_col_connection = @@collation_connection */

;

/*!50003 SET character_set_client  = utf8mb4 */

;

/*!50003 SET character_set_results = utf8mb4 */

;

/*!50003 SET collation_connection  = utf8mb4_general_ci */

;

/*!50003 SET @saved_sql_mode       = @@sql_mode */

;

/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */

;

DELIMITER ;;

/*!50003 CREATE*/

/*!50017 DEFINER=`root`@`localhost`*/

/*!50003 TRIGGER `test` AFTER DELETE ON `platinen` FOR EACH ROW delete from downloads
 where downloads.id = 
 (
 select Downloads_ID from platinen where old.id = platinen.ID
 ) */

;

;

DELIMITER ;

/*!50003 SET sql_mode              = @saved_sql_mode */

;

/*!50003 SET character_set_client  = @saved_cs_client */

;

/*!50003 SET character_set_results = @saved_cs_results */

;

/*!50003 SET collation_connection  = @saved_col_connection */

;

--

-- Temporary table structure for view `platinenaufnutzen1`

--

DROP TABLE IF EXISTS `platinenaufnutzen1`;

/*!50001 DROP VIEW IF EXISTS `platinenaufnutzen1`*/

;

SET @saved_cs_client = @@character_set_client;

SET character_set_client = utf8;

/*!50001 CREATE TABLE `platinenaufnutzen1` (
 `Nr` tinyint NOT NULL,
 `Status1` tinyint NOT NULL,
 `platinenaufnutzen` tinyint NOT NULL,
 `Platinen_ID` tinyint NOT NULL
 ) ENGINE=MyISAM */

;

SET character_set_client = @saved_cs_client;

--

-- Temporary table structure for view `platinenaufnutzen2`

--

DROP TABLE IF EXISTS `platinenaufnutzen2`;

/*!50001 DROP VIEW IF EXISTS `platinenaufnutzen2`*/

;

SET @saved_cs_client = @@character_set_client;

SET character_set_client = utf8;

/*!50001 CREATE TABLE `platinenaufnutzen2` (
 `ID` tinyint NOT NULL,
 `Name` tinyint NOT NULL,
 `user_name` tinyint NOT NULL,
 `platinenaufnutzen` tinyint NOT NULL,
 `zustand` tinyint NOT NULL,
 `nuplid` tinyint NOT NULL
 ) ENGINE=MyISAM */

;

SET character_set_client = @saved_cs_client;

--

-- Temporary table structure for view `platinenaufnutzen3`

--

DROP TABLE IF EXISTS `platinenaufnutzen3`;

/*!50001 DROP VIEW IF EXISTS `platinenaufnutzen3`*/

;

SET @saved_cs_client = @@character_set_client;

SET character_set_client = utf8;

/*!50001 CREATE TABLE `platinenaufnutzen3` (
 `ID` tinyint NOT NULL,
 `Nutzen_ID` tinyint NOT NULL,
 `Platinen_ID` tinyint NOT NULL,
 `Finanzstelle_ID` tinyint NOT NULL,
 `Finanzstelle_Name` tinyint NOT NULL,
 `Finanzstelle_Nummer` tinyint NOT NULL
 ) ENGINE=MyISAM */

;

SET character_set_client = @saved_cs_client;

--

-- Temporary table structure for view `platinenview`

--

DROP TABLE IF EXISTS `platinenview`;

/*!50001 DROP VIEW IF EXISTS `platinenview`*/

;

SET @saved_cs_client = @@character_set_client;

SET character_set_client = utf8;

/*!50001 CREATE TABLE `platinenview` (
 `ID` tinyint NOT NULL,
 `Name` tinyint NOT NULL,
 `Auftraggeber` tinyint NOT NULL,
 `Finanzstelle_name` tinyint NOT NULL,
 `Finanzstelle_nummer` tinyint NOT NULL,
 `Lehrstuhl` tinyint NOT NULL,
 `ausstehend` tinyint NOT NULL,
 `Anzahl` tinyint NOT NULL,
 `Material` tinyint NOT NULL,
 `Endkupfer` tinyint NOT NULL,
 `Staerke` tinyint NOT NULL,
 `Lagen` tinyint NOT NULL,
 `Groesse` tinyint NOT NULL,
 `Oberflaeche` tinyint NOT NULL,
 `Loetstopp` tinyint NOT NULL,
 `Bestueckungsdruck` tinyint NOT NULL,
 `erstelltam` tinyint NOT NULL,
 `wunschDatum` tinyint NOT NULL,
 `Kommentar` tinyint NOT NULL
 ) ENGINE=MyISAM */

;

SET character_set_client = @saved_cs_client;

--

-- Temporary table structure for view `platinenviewest`

--

DROP TABLE IF EXISTS `platinenviewest`;

/*!50001 DROP VIEW IF EXISTS `platinenviewest`*/

;

SET @saved_cs_client = @@character_set_client;

SET character_set_client = utf8;

/*!50001 CREATE TABLE `platinenviewest` (
 `ID` tinyint NOT NULL,
 `Name` tinyint NOT NULL,
 `Auftraggeber` tinyint NOT NULL,
 `Finanzstelle_name` tinyint NOT NULL,
 `Finanzstelle_nummer` tinyint NOT NULL,
 `Lehrstuhl` tinyint NOT NULL,
 `ausstehend` tinyint NOT NULL,
 `Anzahl` tinyint NOT NULL,
 `Material` tinyint NOT NULL,
 `Endkupfer` tinyint NOT NULL,
 `Staerke` tinyint NOT NULL,
 `Lagen` tinyint NOT NULL,
 `Groesse` tinyint NOT NULL,
 `Oberflaeche` tinyint NOT NULL,
 `Loetstopp` tinyint NOT NULL,
 `Bestueckungsdruck` tinyint NOT NULL,
 `erstelltam` tinyint NOT NULL,
 `wunschDatum` tinyint NOT NULL,
 `Kommentar` tinyint NOT NULL,
 `Status` tinyint NOT NULL,
 `ignorieren` tinyint NOT NULL,
 `abgeschlossenPost` tinyint NOT NULL,
 `abgeschlossenFertigung` tinyint NOT NULL,
 `downloads1or0` tinyint NOT NULL
 ) ENGINE=MyISAM */

;

SET character_set_client = @saved_cs_client;

--

-- Dumping routines for database 'platinendb'

--

/*!50003 DROP PROCEDURE IF EXISTS `BackupAbgeschlossene` */

;

/*!50003 SET @saved_cs_client      = @@character_set_client */

;

/*!50003 SET @saved_cs_results     = @@character_set_results */

;

/*!50003 SET @saved_col_connection = @@collation_connection */

;

/*!50003 SET character_set_client  = utf8mb4 */

;

/*!50003 SET character_set_results = utf8mb4 */

;

/*!50003 SET collation_connection  = utf8mb4_unicode_ci */

;

/*!50003 SET @saved_sql_mode       = @@sql_mode */

;

/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */

;

DELIMITER ;;

CREATE DEFINER =`ROOT`@`LOCALHOST` PROCEDURE `BACKUPABGESCHLOSSENE`
(OUT WARNUNG VARCHAR(255)) DETERMINISTIC BEGIN 
	DECLARE exit
	handler
	    for sqlexception BEGIN -- falls Fehler, brich ab und mach löschen rückgangig
	SET
	    warnung = "Fehler! Backup wurde nicht durchgeführt! Alles bleibt beim Alten, es wurde nichts gelöscht. Mögliche Fehlerursache: Die Backuptabellen müssen hinsichtlich ihrer Struktur mit den originalen Tabellen übereinstimmen";
	ROLLBACK;
END; 

START TRANSACTION;

-- backup alle abgeschlossenen nutzenplatinen

INSERT INTO
    backupnutzenplatinen (
        SELECT
            nutzenplatinen.*
        From
            platinendb.nutzenplatinen
            Inner Join platinendb.nutzen On platinendb.nutzenplatinen.Nutzen_ID = platinendb.nutzen.ID
        Where
            nutzen.Status1 = "abgeschlossen"
    );

-- backup alle abgeschlossenen platinen

INSERT INTO backupplatinen (
        Select
            platinendb.platinen.*
        From
            platinendb.platinen
            Inner Join platinendb.platinenviewest On platinendb.platinenviewest.ID = platinendb.platinen.ID
        Where
            abgeschlossenFertigung = 1
    );

-- backup alle abgeschlossenen nutzen

INSERT INTO backupnutzen (
        Select
            platinendb.nutzen.*
        From
            platinendb.nutzen
            Inner Join platinendb.nutzenview On platinendb.nutzenview.ID = platinendb.nutzen.ID
        Where
            dringlichkeitFertigung = 3
    );

-- backup alle lagen

INSERT INTO backupnutzenlagen (
        Select
            platinendb.nutzenlagen.*
        From
            platinendb.nutzenlagen
            Inner Join platinendb.nutzen On platinendb.nutzen.Lagen_ID = platinendb.nutzenlagen.id
            Inner Join platinendb.nutzenview On platinendb.nutzenview.ID = platinendb.nutzen.ID
        Where
            platinendb.nutzenview.dringlichkeitFertigung = 3
    );

-- kurzzeitig key Abhängigkeiten ausschalten damit platinen gelöscht werden können

SET foreign_key_checks = 0;

-- lösche alle abgeschlossenen platinen

DELETE p
FROM platinen AS p
    JOIN platinenviewest AS pv ON p.ID = pv.ID
WHERE
    abgeschlossenFertigung = 1;

-- lösche alle abgeschlossenen nutzenplatinen

DELETE np
FROM nutzenplatinen AS np
    JOIN nutzen AS n ON np.Nutzen_ID = n.ID
WHERE
    n.Status1 = "abgeschlossen";

-- lösche alle lagen dessen nutzen abgeschlossenen sind

DELETE l
FROM nutzenlagen AS l
    JOIN nutzen as nu ON l.id = nu.Lagen_ID
    JOIN nutzenview AS nv ON nu.ID = nv.ID
WHERE
    nv.dringlichkeitFertigung = 3;

SET foreign_key_checks = 1;

-- lösche alle abgeschlossenen nutzen

DELETE n
FROM nutzen AS n
    JOIN nutzenview AS nv ON n.ID = nv.ID
WHERE
    nv.dringlichkeitFertigung = 3;

SET warnung = "Backup erfolgreich!";

COMMIT;

END ;

;

DELIMITER ;

/*!50003 SET sql_mode              = @saved_sql_mode */

;

/*!50003 SET character_set_client  = @saved_cs_client */

;

/*!50003 SET character_set_results = @saved_cs_results */

;

/*!50003 SET collation_connection  = @saved_col_connection */

;

/*!50003 DROP PROCEDURE IF EXISTS `stressTest` */

;

/*!50003 SET @saved_cs_client      = @@character_set_client */

;

/*!50003 SET @saved_cs_results     = @@character_set_results */

;

/*!50003 SET @saved_col_connection = @@collation_connection */

;

/*!50003 SET character_set_client  = utf8mb4 */

;

/*!50003 SET character_set_results = utf8mb4 */

;

/*!50003 SET collation_connection  = utf8mb4_unicode_ci */

;

/*!50003 SET @saved_sql_mode       = @@sql_mode */

;

/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */

;

DELIMITER ;;

CREATE DEFINER =`ROOT`@`LOCALHOST` PROCEDURE `STRESSTEST`
() BEGIN 
	DECLARE i INT DEFAULT 0;
	WHILE (i <= 5000)
	DO
	INSERT INTO
	    platinen (
	        Name,
	        Auftraggeber_ID,
	        Anzahl,
	        Material_ID,
	        Endkupfer,
	        Staerke,
	        Lagen,
	        Groesse,
	        Oberflaeche,
	        Loetstopp,
	        erstelltam,
	        wunschDatum,
	        Kommentar,
	        Downloads_ID,
	        ignorieren
	    )
	VALUES (
	        'xx',
	        '12',
	        '2',
	        '1',
	        '35ﾃつｵ',
	        '1,55',
	        '2',
	        '-',
	        'Zinn',
	        'ja',
	        '2022-02-25  14:14:54 ',
	        null,
	        '',
	        null,
	        '0'
	    );
	SET i = i + 1;
	END WHILE;
	END 
; 

;

DELIMITER ;

/*!50003 SET sql_mode              = @saved_sql_mode */

;

/*!50003 SET character_set_client  = @saved_cs_client */

;

/*!50003 SET character_set_results = @saved_cs_results */

;

/*!50003 SET collation_connection  = @saved_col_connection */

;

--

-- Current Database: `login`

--

CREATE DATABASE
    /*!32312 IF NOT EXISTS*/
    `login`
    /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */
;

USE `login`;

--

-- Table structure for table `users`

--

DROP TABLE IF EXISTS `users`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE
    `users` (
        `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index',
        `user_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
        `admin` tinyint(1) NOT NULL,
        `user_password_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'user''s password in salted and hashed format',
        `user_email` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'user''s email, unique',
        `lehrstuhl` int(50) NOT NULL,
        `user_activation_hash` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
        `user_password_reset_hash` char(40) COLLATE utf8_unicode_ci DEFAULT NULL,
        `user_password_reset_timestamp` bigint(20) DEFAULT NULL,
        PRIMARY KEY (`user_id`),
        UNIQUE KEY `user_name` (`user_name`),
        KEY `user_email` (`user_email`) USING BTREE,
        KEY `lehrstuhl` (`lehrstuhl`),
        CONSTRAINT `users_ibfk_1` FOREIGN KEY (`lehrstuhl`) REFERENCES `platinendb`.`lehrstuhl` (`id`) ON UPDATE CASCADE
    ) ENGINE = InnoDB AUTO_INCREMENT = 216 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'user data';

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `users`

--

LOCK TABLES `users` WRITE;

/*!40000 ALTER TABLE `users` DISABLE KEYS */

;

INSERT INTO `users`
VALUES (
        8,
        'kunde1',
        0,
        '$2y$10$g4j1XzHqMTez35yu1WdoQO0vQKoWhmZd2TPwZUmzMhgpsiiMBNwpa',
        'fdfgvdf@web.de',
        1,
        NULL,
        '5fb75072fa6fffe20749acc2e3a802014a3a0207',
        1601563674
    ), (
        9,
        'kunde2',
        0,
        '$2y$10$uQYt7Gq6GmarwS3JtXsAseZpk5J5ATar3qzYJQ0l/Ya/rT5AmrQAu',
        'rgdf@web.de',
        1,
        NULL,
        '3965d6840ae5668e41cea29d8d382927d64bf106',
        1601554771
    ), (
        10,
        'kunde3',
        0,
        '$2y$10$zKzmWIdujuArGGz3Qfvyg.PRBh5bue1qBbhLpxuCE7hQNz1ecYa46',
        'sdffv@web.de',
        1,
        NULL,
        '16e9cc7e0dcd7e0b83ff70e67ab291b034ac0518',
        1601554774
    ), (
        12,
        'est',
        1,
        '$2y$10$m8gZBCxvjb1EsIamiof3HOMGhB7bhS7riJ5KuTTmSq9DmF6FuKkBG',
        'bla@est.rub.de',
        1,
        NULL,
        NULL,
        NULL
    ), (
        68,
        'test',
        0,
        '$2y$10$fNaTCIeMskM2VDtHav7JzeS5vnFDceUp4u6OZFW6N05xjYiesKGoy',
        'dsfdsgv@web.de',
        1,
        NULL,
        NULL,
        NULL
    ), (
        70,
        'dominik',
        0,
        NULL,
        NULL,
        1,
        NULL,
        NULL,
        NULL
    ), (
        77,
        'platinen',
        1,
        '$argon2id$v=19$m=65536,t=4,p=1$Y3VTdFAwb1RkZzV1UFc2Tg$0cHcWON+76ZVYIisEslNqt059Fzfn7qp9YElEfcegqI',
        'dsfd@est.rub.de',
        1,
        NULL,
        NULL,
        NULL
    ), (
        81,
        'Sabine',
        1,
        '$argon2id$v=19$m=65536,t=4,p=1$YXV2SmM3YWFzb2JkdWwyTQ$o1kaB7AqpXJY99bwhvMI8SogEeSviv5BBDST87ZyNyo',
        'dfvvfd@est.rub.de',
        1,
        NULL,
        NULL,
        NULL
    ), (
        101,
        'Max',
        1,
        '$2y$10$m8gZBCxvjb1EsIamiof3HOMGhB7bhS7riJ5KuTTmSq9DmF6FuKkBG',
        'gfbgn@web.de',
        1,
        NULL,
        NULL,
        NULL
    ), (
        102,
        'Muster',
        1,
        '$2y$10$m8gZBCxvjb1EsIamiof3HOMGhB7bhS7riJ5KuTTmSq9DmF6FuKkBG',
        'fghtrnb@web.de',
        1,
        NULL,
        NULL,
        NULL
    ), (
        103,
        'lcfa',
        1,
        '$2y$10$m8gZBCxvjb1EsIamiof3HOMGhB7bhS7riJ5KuTTmSq9DmF6FuKkBG',
        'nfnf@web.de',
        1,
        NULL,
        NULL,
        NULL
    );

/*!40000 ALTER TABLE `users` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Dumping routines for database 'login'

--

--

-- Current Database: `platinendb`

--

USE `platinendb`;

--

-- Final view structure for view `anzahlausstehend`

--

/*!50001 DROP TABLE IF EXISTS `anzahlausstehend`*/

;

/*!50001 DROP VIEW IF EXISTS `anzahlausstehend`*/

;

/*!50001 SET @saved_cs_client          = @@character_set_client */

;

/*!50001 SET @saved_cs_results         = @@character_set_results */

;

/*!50001 SET @saved_col_connection     = @@collation_connection */

;

/*!50001 SET character_set_client      = utf8mb4 */

;

/*!50001 SET character_set_results     = utf8mb4 */

;

/*!50001 SET collation_connection      = utf8mb4_general_ci */

;

/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50013 DEFINER=`est`@`%` SQL SECURITY DEFINER */

/*!50001 VIEW `anzahlausstehend` AS select `platinen`.`ID` AS `ID`,`platinen`.`Name` AS `NAME`,ifnull(`platinen`.`Anzahl` - sum(`nutzenplatinen`.`platinenaufnutzen`),`platinen`.`Anzahl`) AS `ausstehend` from (`platinen` left join `nutzenplatinen` on(`nutzenplatinen`.`Platinen_ID` = `platinen`.`ID`)) group by `platinen`.`ID` */

;

/*!50001 SET character_set_client      = @saved_cs_client */

;

/*!50001 SET character_set_results     = @saved_cs_results */

;

/*!50001 SET collation_connection      = @saved_col_connection */

;

--

-- Final view structure for view `auftraege`

--

/*!50001 DROP TABLE IF EXISTS `auftraege`*/

;

/*!50001 DROP VIEW IF EXISTS `auftraege`*/

;

/*!50001 SET @saved_cs_client          = @@character_set_client */

;

/*!50001 SET @saved_cs_results         = @@character_set_results */

;

/*!50001 SET @saved_col_connection     = @@collation_connection */

;

/*!50001 SET character_set_client      = utf8mb4 */

;

/*!50001 SET character_set_results     = utf8mb4 */

;

/*!50001 SET collation_connection      = utf8mb4_general_ci */

;

/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50013 DEFINER=`est`@`%` SQL SECURITY DEFINER */

/*!50001 VIEW `auftraege` AS select count(`platinen`.`Name`) AS `Anzahlaufträge` from `platinen` */

;

/*!50001 SET character_set_client      = @saved_cs_client */

;

/*!50001 SET character_set_results     = @saved_cs_results */

;

/*!50001 SET collation_connection      = @saved_col_connection */

;

--

-- Final view structure for view `austehend1oder0`

--

/*!50001 DROP TABLE IF EXISTS `austehend1oder0`*/

;

/*!50001 DROP VIEW IF EXISTS `austehend1oder0`*/

;

/*!50001 SET @saved_cs_client          = @@character_set_client */

;

/*!50001 SET @saved_cs_results         = @@character_set_results */

;

/*!50001 SET @saved_col_connection     = @@collation_connection */

;

/*!50001 SET character_set_client      = utf8mb4 */

;

/*!50001 SET character_set_results     = utf8mb4 */

;

/*!50001 SET collation_connection      = utf8mb4_general_ci */

;

/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50013 DEFINER=`est`@`%` SQL SECURITY DEFINER */

/*!50001 VIEW `austehend1oder0` AS select `platinen`.`ID` AS `ID`,`platinen`.`Name` AS `Name`,case when `anzahlausstehend`.`ausstehend` = 0 then 1 else 0 end AS `zustand` from (`anzahlausstehend` join `platinen` on(`anzahlausstehend`.`ID` = `platinen`.`ID`)) */

;

/*!50001 SET character_set_client      = @saved_cs_client */

;

/*!50001 SET character_set_results     = @saved_cs_results */

;

/*!50001 SET collation_connection      = @saved_col_connection */

;

--

-- Final view structure for view `detailplatineadd`

--

/*!50001 DROP TABLE IF EXISTS `detailplatineadd`*/

;

/*!50001 DROP VIEW IF EXISTS `detailplatineadd`*/

;

/*!50001 SET @saved_cs_client          = @@character_set_client */

;

/*!50001 SET @saved_cs_results         = @@character_set_results */

;

/*!50001 SET @saved_col_connection     = @@collation_connection */

;

/*!50001 SET character_set_client      = utf8mb4 */

;

/*!50001 SET character_set_results     = utf8mb4 */

;

/*!50001 SET collation_connection      = utf8mb4_general_ci */

;

/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50013 DEFINER=`est`@`%` SQL SECURITY DEFINER */

/*!50001 VIEW `detailplatineadd` AS select distinct `platinendb`.`platinen`.`ID` AS `ID`,`platinendb`.`platinen`.`Name` AS `NAME`,`login`.`users`.`user_name` AS `user_name`,`platinendb`.`platinen`.`erstelltam` AS `erstelltam`,`anzahlausstehend`.`ausstehend` AS `ausstehend`,`platinendb`.`material`.`Name` AS `MaterialName`,`platinendb`.`platinen`.`Endkupfer` AS `Endkupfer`,`platinendb`.`platinen`.`Staerke` AS `Staerke`,`platinendb`.`platinen`.`Lagen` AS `Lagen`,`platinendb`.`platinen`.`ignorieren` AS `ignorieren` from ((((`platinendb`.`platinen` join `platinendb`.`material` on(`platinendb`.`platinen`.`Material_ID` = `platinendb`.`material`.`ID`)) join `platinendb`.`anzahlausstehend` on(`anzahlausstehend`.`ID` = `platinendb`.`platinen`.`ID`)) join `login`.`users` on(`platinendb`.`platinen`.`Auftraggeber_ID` = `login`.`users`.`user_id`)) left join `platinendb`.`platinenaufnutzen1` on(`platinendb`.`platinen`.`ID` = `platinenaufnutzen1`.`Platinen_ID`)) order by `platinendb`.`platinen`.`erstelltam`,`anzahlausstehend`.`ausstehend` desc */

;

/*!50001 SET character_set_client      = @saved_cs_client */

;

/*!50001 SET character_set_results     = @saved_cs_results */

;

/*!50001 SET collation_connection      = @saved_col_connection */

;

--

-- Final view structure for view `nutzenview`

--

/*!50001 DROP TABLE IF EXISTS `nutzenview`*/

;

/*!50001 DROP VIEW IF EXISTS `nutzenview`*/

;

/*!50001 SET @saved_cs_client          = @@character_set_client */

;

/*!50001 SET @saved_cs_results         = @@character_set_results */

;

/*!50001 SET @saved_col_connection     = @@collation_connection */

;

/*!50001 SET character_set_client      = utf8mb4 */

;

/*!50001 SET character_set_results     = utf8mb4 */

;

/*!50001 SET collation_connection      = utf8mb4_unicode_ci */

;

/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50013 DEFINER=`est`@`%` SQL SECURITY DEFINER */

/*!50001 VIEW `nutzenview` AS select `platinendb`.`nutzen`.`ID` AS `ID`,`platinendb`.`nutzen`.`Nr` AS `Nr`,`login`.`users`.`user_name` AS `Bearbeiter`,`platinendb`.`nutzen`.`Status1` AS `Status`,`platinendb`.`material`.`Name` AS `Material`,`platinendb`.`finanzstelle`.`name` AS `Finanzstelle_name`,`platinendb`.`finanzstelle`.`nummer` AS `Finanzstelle_nummer`,`platinendb`.`nutzen`.`Endkupfer` AS `Endkupfer`,`platinendb`.`nutzen`.`Staerke` AS `Staerke`,`platinendb`.`nutzen`.`Lagen` AS `Lagen`,`platinendb`.`nutzen`.`Datum` AS `erstellt`,`platinendb`.`nutzen`.`Datum1` AS `Fertigung`,`platinendb`.`nutzen`.`Datum2` AS `abgeschlossen`,`platinendb`.`nutzen`.`Groesse` AS `Groesse`,`platinendb`.`nutzen`.`intoderext` AS `intoderext`,`platinendb`.`nutzen`.`Testdaten` AS `Testdaten`,`platinendb`.`nutzen`.`Kommentar` AS `Kommentar`,case when `platinendb`.`nutzen`.`Status1` = 'neu' then 1 when `platinendb`.`nutzen`.`Status1` = 'abgeschlossen' then 3 when `platinendb`.`nutzen`.`Status1` = 'Fertigung' and `platinendb`.`nutzen`.`Datum1` < current_timestamp() - interval 5 day = 1 then 0 when `platinendb`.`nutzen`.`Status1` = 'Fertigung' and `platinendb`.`nutzen`.`Datum1` < current_timestamp() - interval 5 day = 0 then 2 end AS `dringlichkeitFertigung` from (((`platinendb`.`nutzen` join `platinendb`.`material` on(`platinendb`.`material`.`ID` = `platinendb`.`nutzen`.`Material_ID`)) join `login`.`users` on(`platinendb`.`nutzen`.`Bearbeiter_ID` = `login`.`users`.`user_id`)) left join `platinendb`.`finanzstelle` on(`platinendb`.`nutzen`.`Finanzstelle_ID` = `platinendb`.`finanzstelle`.`id`)) order by case when `platinendb`.`nutzen`.`Status1` = 'neu' then 1 when `platinendb`.`nutzen`.`Status1` = 'abgeschlossen' then 3 when `platinendb`.`nutzen`.`Status1` = 'Fertigung' and `platinendb`.`nutzen`.`Datum1` < current_timestamp() - interval 5 day = 1 then 0 when `platinendb`.`nutzen`.`Status1` = 'Fertigung' and `platinendb`.`nutzen`.`Datum1` < current_timestamp() - interval 5 day = 0 then 2 end,case when `platinendb`.`nutzen`.`Status1` = 'neu' then `platinendb`.`nutzen`.`Datum` end desc,case when `platinendb`.`nutzen`.`Status1` = 'Fertigung' then `platinendb`.`nutzen`.`Datum1` end,case when `platinendb`.`nutzen`.`Status1` = 'abgeschlossen' then `platinendb`.`nutzen`.`Datum2` end desc */

;

/*!50001 SET character_set_client      = @saved_cs_client */

;

/*!50001 SET character_set_results     = @saved_cs_results */

;

/*!50001 SET collation_connection      = @saved_col_connection */

;

--

-- Final view structure for view `platinenaufnutzen1`

--

/*!50001 DROP TABLE IF EXISTS `platinenaufnutzen1`*/

;

/*!50001 DROP VIEW IF EXISTS `platinenaufnutzen1`*/

;

/*!50001 SET @saved_cs_client          = @@character_set_client */

;

/*!50001 SET @saved_cs_results         = @@character_set_results */

;

/*!50001 SET @saved_col_connection     = @@collation_connection */

;

/*!50001 SET character_set_client      = utf8mb4 */

;

/*!50001 SET character_set_results     = utf8mb4 */

;

/*!50001 SET collation_connection      = utf8mb4_general_ci */

;

/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50013 DEFINER=`est`@`%` SQL SECURITY DEFINER */

/*!50001 VIEW `platinenaufnutzen1` AS select `nutzen`.`Nr` AS `Nr`,`nutzen`.`Status1` AS `Status1`,`nutzenplatinen`.`platinenaufnutzen` AS `platinenaufnutzen`,`nutzenplatinen`.`Platinen_ID` AS `Platinen_ID` from (`nutzenplatinen` join `nutzen` on(`nutzenplatinen`.`Nutzen_ID` = `nutzen`.`ID`)) order by `nutzen`.`Status1` desc */

;

/*!50001 SET character_set_client      = @saved_cs_client */

;

/*!50001 SET character_set_results     = @saved_cs_results */

;

/*!50001 SET collation_connection      = @saved_col_connection */

;

--

-- Final view structure for view `platinenaufnutzen2`

--

/*!50001 DROP TABLE IF EXISTS `platinenaufnutzen2`*/

;

/*!50001 DROP VIEW IF EXISTS `platinenaufnutzen2`*/

;

/*!50001 SET @saved_cs_client          = @@character_set_client */

;

/*!50001 SET @saved_cs_results         = @@character_set_results */

;

/*!50001 SET @saved_col_connection     = @@collation_connection */

;

/*!50001 SET character_set_client      = utf8mb4 */

;

/*!50001 SET character_set_results     = utf8mb4 */

;

/*!50001 SET collation_connection      = utf8mb4_general_ci */

;

/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50013 DEFINER=`est`@`%` SQL SECURITY DEFINER */

/*!50001 VIEW `platinenaufnutzen2` AS select `platinendb`.`nutzen`.`ID` AS `ID`,`platinendb`.`platinen`.`Name` AS `Name`,`login`.`users`.`user_name` AS `user_name`,`platinendb`.`nutzenplatinen`.`platinenaufnutzen` AS `platinenaufnutzen`,`austehend1oder0`.`zustand` AS `zustand`,`platinendb`.`nutzenplatinen`.`ID` AS `nuplid` from ((((`platinendb`.`nutzenplatinen` join `platinendb`.`platinen` on(`platinendb`.`nutzenplatinen`.`Platinen_ID` = `platinendb`.`platinen`.`ID`)) join `login`.`users` on(`platinendb`.`platinen`.`Auftraggeber_ID` = `login`.`users`.`user_id`)) join `platinendb`.`austehend1oder0` on(`platinendb`.`platinen`.`ID` = `austehend1oder0`.`ID`)) join `platinendb`.`nutzen` on(`platinendb`.`nutzenplatinen`.`Nutzen_ID` = `platinendb`.`nutzen`.`ID`)) */

;

/*!50001 SET character_set_client      = @saved_cs_client */

;

/*!50001 SET character_set_results     = @saved_cs_results */

;

/*!50001 SET collation_connection      = @saved_col_connection */

;

--

-- Final view structure for view `platinenaufnutzen3`

--

/*!50001 DROP TABLE IF EXISTS `platinenaufnutzen3`*/

;

/*!50001 DROP VIEW IF EXISTS `platinenaufnutzen3`*/

;

/*!50001 SET @saved_cs_client          = @@character_set_client */

;

/*!50001 SET @saved_cs_results         = @@character_set_results */

;

/*!50001 SET @saved_col_connection     = @@collation_connection */

;

/*!50001 SET character_set_client      = utf8mb4 */

;

/*!50001 SET character_set_results     = utf8mb4 */

;

/*!50001 SET collation_connection      = utf8mb4_unicode_ci */

;

/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50013 DEFINER=`est`@`%` SQL SECURITY DEFINER */

/*!50001 VIEW `platinenaufnutzen3` AS select `nutzenplatinen`.`ID` AS `ID`,`nutzenplatinen`.`Nutzen_ID` AS `Nutzen_ID`,`nutzenplatinen`.`Platinen_ID` AS `Platinen_ID`,`platinen`.`Finanzstelle_ID` AS `Finanzstelle_ID`,`finanzstelle`.`name` AS `Finanzstelle_Name`,`finanzstelle`.`nummer` AS `Finanzstelle_Nummer` from ((`nutzenplatinen` join `platinen` on(`nutzenplatinen`.`Platinen_ID` = `platinen`.`ID`)) join `finanzstelle` on(`platinen`.`Finanzstelle_ID` = `finanzstelle`.`id`)) */

;

/*!50001 SET character_set_client      = @saved_cs_client */

;

/*!50001 SET character_set_results     = @saved_cs_results */

;

/*!50001 SET collation_connection      = @saved_col_connection */

;

--

-- Final view structure for view `platinenview`

--

/*!50001 DROP TABLE IF EXISTS `platinenview`*/

;

/*!50001 DROP VIEW IF EXISTS `platinenview`*/

;

/*!50001 SET @saved_cs_client          = @@character_set_client */

;

/*!50001 SET @saved_cs_results         = @@character_set_results */

;

/*!50001 SET @saved_col_connection     = @@collation_connection */

;

/*!50001 SET character_set_client      = utf8mb4 */

;

/*!50001 SET character_set_results     = utf8mb4 */

;

/*!50001 SET collation_connection      = utf8mb4_unicode_ci */

;

/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50013 DEFINER=`est`@`%` SQL SECURITY DEFINER */

/*!50001 VIEW `platinenview` AS select `platinendb`.`platinen`.`ID` AS `ID`,`platinendb`.`platinen`.`Name` AS `Name`,`login`.`users`.`user_name` AS `Auftraggeber`,`platinendb`.`finanzstelle`.`name` AS `Finanzstelle_name`,`platinendb`.`finanzstelle`.`nummer` AS `Finanzstelle_nummer`,`platinendb`.`lehrstuhl`.`kuerzel` AS `Lehrstuhl`,`anzahlausstehend`.`ausstehend` AS `ausstehend`,`platinendb`.`platinen`.`Anzahl` AS `Anzahl`,`platinendb`.`material`.`Name` AS `Material`,`platinendb`.`platinen`.`Endkupfer` AS `Endkupfer`,`platinendb`.`platinen`.`Staerke` AS `Staerke`,`platinendb`.`platinen`.`Lagen` AS `Lagen`,`platinendb`.`platinen`.`Groesse` AS `Groesse`,`platinendb`.`platinen`.`Oberflaeche` AS `Oberflaeche`,`platinendb`.`platinen`.`Loetstopp` AS `Loetstopp`,`platinendb`.`platinen`.`Bestueckungsdruck` AS `Bestueckungsdruck`,`platinendb`.`platinen`.`erstelltam` AS `erstelltam`,`platinendb`.`platinen`.`wunschDatum` AS `wunschDatum`,`platinendb`.`platinen`.`Kommentar` AS `Kommentar` from (((((`platinendb`.`platinen` join `platinendb`.`material` on(`platinendb`.`platinen`.`Material_ID` = `platinendb`.`material`.`ID`)) join `platinendb`.`anzahlausstehend` on(`anzahlausstehend`.`ID` = `platinendb`.`platinen`.`ID`)) join `login`.`users` on(`platinendb`.`platinen`.`Auftraggeber_ID` = `login`.`users`.`user_id`)) join `platinendb`.`lehrstuhl` on(`login`.`users`.`lehrstuhl` = `platinendb`.`lehrstuhl`.`id`)) join `platinendb`.`finanzstelle` on(`platinendb`.`platinen`.`Finanzstelle_ID` = `platinendb`.`finanzstelle`.`id`)) */

;

/*!50001 SET character_set_client      = @saved_cs_client */

;

/*!50001 SET character_set_results     = @saved_cs_results */

;

/*!50001 SET collation_connection      = @saved_col_connection */

;

--

-- Final view structure for view `platinenviewest`

--

/*!50001 DROP TABLE IF EXISTS `platinenviewest`*/

;

/*!50001 DROP VIEW IF EXISTS `platinenviewest`*/

;

/*!50001 SET @saved_cs_client          = @@character_set_client */

;

/*!50001 SET @saved_cs_results         = @@character_set_results */

;

/*!50001 SET @saved_col_connection     = @@collation_connection */

;

/*!50001 SET character_set_client      = utf8mb4 */

;

/*!50001 SET character_set_results     = utf8mb4 */

;

/*!50001 SET collation_connection      = utf8mb4_unicode_ci */

;

/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50013 DEFINER=`est`@`%` SQL SECURITY DEFINER */

/*!50001 VIEW `platinenviewest` AS select distinct `platinendb`.`platinen`.`ID` AS `ID`,`platinendb`.`platinen`.`Name` AS `Name`,`login`.`users`.`user_name` AS `Auftraggeber`,`platinendb`.`finanzstelle`.`name` AS `Finanzstelle_name`,`platinendb`.`finanzstelle`.`nummer` AS `Finanzstelle_nummer`,`platinendb`.`lehrstuhl`.`kuerzel` AS `Lehrstuhl`,`anzahlausstehend`.`ausstehend` AS `ausstehend`,`platinendb`.`platinen`.`Anzahl` AS `Anzahl`,`platinendb`.`material`.`Name` AS `Material`,`platinendb`.`platinen`.`Endkupfer` AS `Endkupfer`,`platinendb`.`platinen`.`Staerke` AS `Staerke`,`platinendb`.`platinen`.`Lagen` AS `Lagen`,`platinendb`.`platinen`.`Groesse` AS `Groesse`,`platinendb`.`platinen`.`Oberflaeche` AS `Oberflaeche`,`platinendb`.`platinen`.`Loetstopp` AS `Loetstopp`,`platinendb`.`platinen`.`Bestueckungsdruck` AS `Bestueckungsdruck`,`platinendb`.`platinen`.`erstelltam` AS `erstelltam`,`platinendb`.`platinen`.`wunschDatum` AS `wunschDatum`,`platinendb`.`platinen`.`Kommentar` AS `Kommentar`,case when (select count(0) AS `Count` from `platinendb`.`platinenaufnutzen1` where `platinenaufnutzen1`.`Platinen_ID` = `platinendb`.`platinen`.`ID`) < 1 then NULL when (select count(0) AS `Count` from `platinendb`.`platinenaufnutzen1` where `platinenaufnutzen1`.`Platinen_ID` = `platinendb`.`platinen`.`ID` and `platinenaufnutzen1`.`Status1` = 'neu') > 0 then 'neu' else 'KeineImZustandNeu' end AS `Status`,`platinendb`.`platinen`.`ignorieren` AS `ignorieren`,case when `anzahlausstehend`.`ausstehend` < 1 and case when (select count(0) AS `Count` from `platinendb`.`platinenaufnutzen1` where `platinenaufnutzen1`.`Platinen_ID` = `platinendb`.`platinen`.`ID`) < 1 then NULL when (select count(0) AS `Count` from `platinendb`.`platinenaufnutzen1` where `platinenaufnutzen1`.`Platinen_ID` = `platinendb`.`platinen`.`ID` and `platinenaufnutzen1`.`Status1` = 'neu') > 0 then 'neu' else 'KeineImZustandNeu' end = 'KeineImZustandNeu' then 1 else 0 end AS `abgeschlossenPost`,case when `anzahlausstehend`.`ausstehend` < 1 and case when (select count(0) AS `Count` from `platinendb`.`platinenaufnutzen1` where `platinenaufnutzen1`.`Platinen_ID` = `platinendb`.`platinen`.`ID`) < 1 then NULL when (select count(0) AS `Count` from `platinendb`.`platinenaufnutzen1` where `platinenaufnutzen1`.`Platinen_ID` = `platinendb`.`platinen`.`ID` and `platinenaufnutzen1`.`Status1` = 'neu') > 0 then 'neu' else 'KeineImZustandNeu' end = 'KeineImZustandNeu' and case when (select count(0) AS `Count` from `platinendb`.`platinenaufnutzen1` where `platinenaufnutzen1`.`Platinen_ID` = `platinendb`.`platinen`.`ID`) < 1 then NULL when (select count(0) AS `Count` from `platinendb`.`platinenaufnutzen1` where `platinenaufnutzen1`.`Platinen_ID` = `platinendb`.`platinen`.`ID` and `platinenaufnutzen1`.`Status1` = 'Fertigung') > 0 then 'Fertigung' else 'KeineImZustandFertigung' end = 'KeineImZustandFertigung' then 1 else 0 end AS `abgeschlossenFertigung`,case when `platinendb`.`platinen`.`Downloads_ID` is null then 0 else 1 end AS `downloads1or0` from ((((((`platinendb`.`platinen` join `platinendb`.`material` on(`platinendb`.`platinen`.`Material_ID` = `platinendb`.`material`.`ID`)) join `platinendb`.`anzahlausstehend` on(`anzahlausstehend`.`ID` = `platinendb`.`platinen`.`ID`)) join `login`.`users` on(`platinendb`.`platinen`.`Auftraggeber_ID` = `login`.`users`.`user_id`)) left join `platinendb`.`platinenaufnutzen1` on(`platinendb`.`platinen`.`ID` = `platinenaufnutzen1`.`Platinen_ID`)) join `platinendb`.`lehrstuhl` on(`login`.`users`.`lehrstuhl` = `platinendb`.`lehrstuhl`.`id`)) join `platinendb`.`finanzstelle` on(`platinendb`.`platinen`.`Finanzstelle_ID` = `platinendb`.`finanzstelle`.`id`)) order by case when `anzahlausstehend`.`ausstehend` < 1 and case when (select count(0) AS `Count` from `platinendb`.`platinenaufnutzen1` where `platinenaufnutzen1`.`Platinen_ID` = `platinendb`.`platinen`.`ID`) < 1 then NULL when (select count(0) AS `Count` from `platinendb`.`platinenaufnutzen1` where `platinenaufnutzen1`.`Platinen_ID` = `platinendb`.`platinen`.`ID` and `platinenaufnutzen1`.`Status1` = 'neu') > 0 then 'neu' else 'KeineImZustandNeu' end = 'KeineImZustandNeu' then 1 else 0 end,case when `anzahlausstehend`.`ausstehend` < 1 and case when (select count(0) AS `Count` from `platinendb`.`platinenaufnutzen1` where `platinenaufnutzen1`.`Platinen_ID` = `platinendb`.`platinen`.`ID`) < 1 then NULL when (select count(0) AS `Count` from `platinendb`.`platinenaufnutzen1` where `platinenaufnutzen1`.`Platinen_ID` = `platinendb`.`platinen`.`ID` and `platinenaufnutzen1`.`Status1` = 'neu') > 0 then 'neu' else 'KeineImZustandNeu' end = 'KeineImZustandNeu' and case when (select count(0) AS `Count` from `platinendb`.`platinenaufnutzen1` where `platinenaufnutzen1`.`Platinen_ID` = `platinendb`.`platinen`.`ID`) < 1 then NULL when (select count(0) AS `Count` from `platinendb`.`platinenaufnutzen1` where `platinenaufnutzen1`.`Platinen_ID` = `platinendb`.`platinen`.`ID` and `platinenaufnutzen1`.`Status1` = 'Fertigung') > 0 then 'Fertigung' else 'KeineImZustandFertigung' end = 'KeineImZustandFertigung' then 1 else 0 end,`platinendb`.`platinen`.`ignorieren`,case when `abgeschlossenFertigung` = 1 then `platinendb`.`platinen`.`erstelltam` end desc,`platinendb`.`platinen`.`erstelltam` */

;

/*!50001 SET character_set_client      = @saved_cs_client */

;

/*!50001 SET character_set_results     = @saved_cs_results */

;

/*!50001 SET collation_connection      = @saved_col_connection */

;

--

-- Current Database: `login`

--

USE `login`;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */

;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */

;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */

;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */

;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */

;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */

;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */

;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */

;

-- Dump completed on 2022-07-25 15:56:55