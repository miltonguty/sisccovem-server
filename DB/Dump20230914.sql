CREATE DATABASE  IF NOT EXISTS `sace4948_system` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sace4948_system`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sace4948_system
-- ------------------------------------------------------
-- Server version	5.7.43-log

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
-- Table structure for table `actives`
--

DROP TABLE IF EXISTS `actives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actives` (
  `actId` int(11) NOT NULL AUTO_INCREMENT,
  `actCreateAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actUpdateAt` datetime DEFAULT NULL,
  `actDeleted` smallint(6) NOT NULL DEFAULT '0',
  `actCodigo` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `actDescription` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `actComId` int(11) NOT NULL,
  `actKey` varchar(36) NOT NULL,
  `actCliId` int(11) DEFAULT NULL,
  `actMaintenice` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`actId`),
  UNIQUE KEY `actKey_UNIQUE` (`actKey`),
  KEY `fk_actives_companys1_idx` (`actComId`),
  KEY `fk_actives_clients_idx` (`actCliId`),
  CONSTRAINT `fk_actives_clients` FOREIGN KEY (`actCliId`) REFERENCES `clients` (`cliId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_actives_companys1` FOREIGN KEY (`actComId`) REFERENCES `companys` (`comId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actives`
--

LOCK TABLES `actives` WRITE;
/*!40000 ALTER TABLE `actives` DISABLE KEYS */;
INSERT INTO `actives` VALUES (1,'2023-05-13 15:17:38',NULL,0,'ACT-1','activo 1222222',1,'59500eb6-7f6e-4cc7-b4b2-a47acf6774e7',12,0),(2,'2023-05-13 15:17:38',NULL,0,'ACT-2','activo 2222',1,'405be63b-6543-48a9-869f-aa45f0a1531f',12,1),(3,'2023-05-13 15:17:38',NULL,1,'act2',NULL,1,'1cc6b7a2-7924-4d5d-8de0-393fc72ecdfc',10,0),(4,'2023-05-13 15:17:38',NULL,0,'aaaaa','rrrrrrrr',1,'9342d171-1e15-4ca9-9628-1ebffd156dd6',10,0),(5,'2023-05-13 15:17:38',NULL,0,'6666','dfsadsadsa',1,'bc00de9c-1f3d-4a22-8265-0ec605d2ca77',14,1),(6,'2023-05-13 15:17:38',NULL,0,'6666','sssssss',1,'cff35e11-8731-4680-b88f-5e7a7f2bd3f1',18,0),(7,'2023-05-13 15:17:38',NULL,0,'sssssss','sssssssssssss',1,'805b341a-3f2a-4ac4-bd85-9104c368ba85',9,0),(8,'2023-05-13 15:17:38',NULL,0,'phany1','phany1',1,'df7a23ee-8f30-4feb-a4ef-c58f9ad1f6c7',16,0),(9,'2023-05-13 15:17:38',NULL,0,'phany1','phany1',1,'ba1091ee-4627-493a-be4c-2c38a6625d5d',14,0),(10,'2023-05-13 15:17:38',NULL,0,'test','test',1,'1721dca5-cc95-4994-90fa-6cea38ea4b1b',16,0),(11,'2023-05-13 15:17:38',NULL,0,'phany1dsadsa','dsadsadsa',1,'85dfc54b-535a-4949-9dc4-1738bc3b16d0',17,0),(12,'2023-05-13 15:17:38',NULL,0,'dsadsa','dsadsadsa',1,'9d59d7c2-89a0-4251-9be0-3e9da3493419',13,0),(13,'2023-09-03 06:34:50',NULL,0,'5324rewrew','safdsafdsafdsa',1,'uuid()',21,0),(14,'2023-09-03 22:22:47',NULL,0,'activi 2','activi 2',1,'f6e36bc3-e1ec-4afb-a97a-e7eef9179e7d',NULL,0),(15,'2023-09-03 22:26:15',NULL,0,'tafdsfd33333','3333',1,'a22076e6-c030-4a7b-8ebb-77f31a678817',NULL,0),(16,'2023-09-07 02:21:49',NULL,0,'123456789','trewrewrewrew',1,'aee07518-3b85-437d-a881-526bd2d35f7c',NULL,0);
/*!40000 ALTER TABLE `actives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `cliId` int(11) NOT NULL AUTO_INCREMENT,
  `cliCreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cliUpdatedAt` datetime DEFAULT NULL,
  `cliDeleted` smallint(6) NOT NULL DEFAULT '0',
  `cliFirstName` varchar(191) CHARACTER SET utf8 NOT NULL,
  `cliLastName` varchar(191) CHARACTER SET utf8 NOT NULL,
  `cliEmail` varchar(191) CHARACTER SET utf8 NOT NULL,
  `cliPhone` varchar(191) CHARACTER SET utf8 NOT NULL,
  `cliComId` int(11) NOT NULL,
  `cliKey` varchar(36) NOT NULL,
  `cliRutId` int(11) DEFAULT NULL,
  PRIMARY KEY (`cliId`),
  UNIQUE KEY `cliKey_UNIQUE` (`cliKey`),
  KEY `fk_clients_companys1_idx` (`cliComId`),
  KEY `fk_clients_rutes1_idx` (`cliRutId`),
  CONSTRAINT `fk_clients_companys1` FOREIGN KEY (`cliComId`) REFERENCES `companys` (`comId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_clients_rutes1` FOREIGN KEY (`cliRutId`) REFERENCES `rutes` (`rutId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'2023-01-26 22:15:02',NULL,1,'miltonLeydi','Gutierrez','milton.guty@gmail.com','123456789',1,'c5c10b0c-f4bd-4fad-85e1-c51ed81404c6',1),(2,'2023-05-13 15:17:38',NULL,1,'milton','Gutierrez','milton.guty@gmail.com','123456789',1,'0311a0db-3656-4048-8dc8-5cd2913370c8',1),(3,'2023-05-15 14:30:58',NULL,1,'rrrrrrrrr','Gutierrez','milton.guty@gmail.com','123456789',1,'7b458be4-b22c-4243-8d13-65051871c40e',1),(4,'2023-05-21 21:19:21',NULL,1,'guty','mitlon','dsadsad','1452456',1,'10099288-3a0a-4190-8cdf-367aa8d12b1b',1),(5,'2023-05-21 21:19:35',NULL,1,'test','test','ewrewrew','4156',1,'b6ffe778-4d24-429c-90e2-747a30fd0dd7',1),(6,'2023-05-21 21:19:43',NULL,1,'rewre','rewrew','rewrew','rwerewr',1,'487c5e2f-99b1-4ab8-9b6c-6544c9ce5d0a',1),(8,'2023-05-21 22:19:53',NULL,1,'ooooooooooooo','tret','retret','retre',1,'bb9d4f0e-1dac-43b0-a4e0-ab50e77d64e4',1),(9,'2023-05-22 22:33:50',NULL,1,'milton','barco','milton.guty@gmail.com','72297259',1,'02e78f6f-c3c4-42b6-9415-943478331d55',1),(10,'2023-05-22 22:34:15',NULL,0,'milton testsetes','barco test s','milton.guty@gmail.com','72297259',1,'31e833c9-e445-47f5-ab02-335a3aeb2f0a',1),(11,'2023-05-22 22:34:57',NULL,0,'maria','maria','maria.guty@gmail.com','72297259',1,'3e341add-11a0-4fc6-90e7-af896cb6d83f',1),(12,'2023-05-22 22:34:58',NULL,0,'miltonqqqqq','barcoqqqq','milton.guty@gmail.com','72297259',1,'b058a1c6-01c4-4f23-abc8-8f40c0b230ce',1),(13,'2023-05-22 22:34:59',NULL,0,'miltonqqqqq','barcoqqqq','milton.guty@gmail.com','72297259',1,'18ebe0ae-d6e0-48aa-924a-8523bfa14c62',1),(14,'2023-05-22 22:35:00',NULL,0,'miltonqqqqq','barcoqqqq','milton.guty@gmail.com','72297259',1,'d06284e6-f785-4a10-bdcc-7f7a46df7907',1),(15,'2023-05-22 22:35:00',NULL,0,'miltonqqqqq','barcoqqqq','milton.guty@gmail.com','72297259',1,'d47254ce-bbe5-485b-8bcb-4064cf83bb64',1),(16,'2023-05-22 22:35:00',NULL,0,'miltonqqqqq','barcoqqqq','milton.guty@gmail.com','72297259',1,'2772322c-87fa-401e-9d6c-29e0905a82cd',1),(17,'2023-05-22 22:35:00',NULL,0,'miltonqqqqq','barcoqqqq','milton.guty@gmail.com','72297259',1,'49081499-3a9b-4b66-b244-155850b62172',1),(18,'2023-05-22 22:35:00',NULL,0,'miltonqqqqq','barcoqqqq','milton.guty@gmail.com','72297259',1,'73d6ce45-7880-49f5-8aca-2d29c5e1895a',1),(19,'2023-05-22 22:35:01',NULL,0,'miltonqqqqq','barcoqqqq','milton.guty@gmail.com','72297259',1,'43b4890c-5a92-4cb3-b104-a78e36779b38',1),(20,'2023-05-22 22:35:01',NULL,0,'miltonqqqqq','barcoqqqq','milton.guty@gmail.com','72297259',1,'aa88108e-4c4b-448e-9504-6e1509870d53',1),(21,'2023-05-22 22:35:01',NULL,0,'miltonqqqqq','barcoqqqq','milton.guty@gmail.com','72297259',1,'671e6389-1a95-4bda-a811-aab69dfa5b08',1),(22,'2023-05-22 22:35:01',NULL,0,'miltonqqqqq','barcoqqqq','milton.guty@gmail.com','72297259',1,'b238da2f-32af-4466-8b86-6d197a898e9b',1),(23,'2023-05-22 22:35:02',NULL,0,'miltonqqqqq','barcoqqqq','milton.guty@gmail.com','72297259',1,'dd963f1b-324e-4cd9-ae9f-3b25232bd3d6',1),(24,'2023-05-22 22:35:02',NULL,0,'miltonqqqqq','barcoqqqq','milton.guty@gmail.com','72297259',1,'4c52267c-44bc-4f43-aaf0-ba350a6999b1',1),(25,'2023-05-22 22:35:02',NULL,0,'miltonqqqqq','barcoqqqq','milton.guty@gmail.com','72297259',1,'87dcfcd1-0e71-4922-a9b3-f51ed18a77bd',1),(26,'2023-05-22 22:37:32',NULL,0,'miltonsssssss','barcossssssss','milton.guty@gmail.com','72297259',1,'87a4ccac-4920-4699-8ef1-7231b2b06735',1),(27,'2023-05-22 22:37:49',NULL,0,'LEYDI','LEYDI','milton.guty@gmail.com','72297259',1,'be5775f5-9c1c-4019-aff5-0bb870cedf4b',1),(28,'2023-05-22 22:38:41',NULL,0,'miltonqqqqqqqqq','barcoqqqqqqqqqqqqqqqqqqqqqqqq','milton.guty@gmail.com','72297259',1,'d3d3f23b-7b26-4d76-9127-ff0b3bfd7ff6',1),(29,'2023-05-22 22:42:53',NULL,0,'milton','barco','milton.guty@gmail.com','72297259',1,'4488c4b9-5de3-412f-a1bd-7ba5f0db6a06',1),(30,'2023-05-24 04:13:40',NULL,0,'milton','barco','milton.guty@gmail.com','72297259',1,'fde813d7-05a6-4e6e-bdf8-dd1864950333',3),(31,'2023-05-29 16:57:19',NULL,0,'milton','barco','milton.guty@gmail.com','72297259',1,'f6153a0b-f884-4949-bfc1-486360552ac8',3),(32,'2023-05-29 16:58:33',NULL,0,'milton','barco','milton.guty@gmail.com','72297259',1,'283cc013-82af-4596-b30a-cf3b6f7306dc',3),(33,'2023-05-29 17:00:26',NULL,0,'Milton','Gutierrez','milton.guty@gmail.com','543543543',1,'232888be-ff63-4f10-a4cc-8a3f5dd8cc2f',3),(34,'2023-05-29 17:01:35',NULL,0,'Milton','Gutierrez','milton.guty@gmail.com','',1,'4ebec083-94ca-437a-9fd3-6aa48e6a5821',3),(35,'2023-05-29 17:08:28',NULL,0,'Milton','Gutierrez','milton.guty@gmail.com','',1,'bbc986ca-6739-4116-9386-d43ed164171b',3),(36,'2023-05-30 02:43:26',NULL,0,'kkkkkkkkkkkk','kkkkkkkkkkkkkkk','milton.guty@gmail.com','72297259',1,'7055f74a-67d1-4898-89dd-927d5d5670b7',3),(37,'2023-05-30 02:44:19',NULL,0,'miltonuytuytytuytu','barco','milton.guty@gmail.com','72297259',1,'09b46cc7-f4fb-48a6-a885-3af5760d9fa3',3),(38,'2023-05-30 02:49:01',NULL,0,'aaaa','barco','milton.guty@gmail.com','72297259',1,'cee616b4-1acc-4ddd-a847-6d2adda85b5c',3),(39,'2023-06-30 13:50:11',NULL,0,'wwwwww','xxxxxxxxxxxxxxxxxxxxxxx','xxxxxxxxxxxxxxxxxxxx','xxxxxxxxxxxxxxxxx',1,'72266b8b-9731-467a-a9fc-cf2cbc21ddfc',2),(40,'2023-06-30 13:51:56',NULL,0,'wwwwww2','xxxxxxxxxxxxxxxxxxxxxxx','xxxxxxxxxxxxxxxxxxxx','xxxxxxxxxxxxxxxxx',1,'7679bacf-5d1e-4691-9cd3-dd0179fa265b',2),(41,'2023-06-30 14:05:41',NULL,0,'wwwwww2','xxxxxxxxxxxxxxxxxxxxxxx','xxxxxxxxxxxxxxxxxxxx','xxxxxxxxxxxxxxxxx',1,'e2ee6061-ebe4-44fc-9c8d-6a11ff22fd39',2),(42,'2023-08-07 01:20:43',NULL,0,'0000000000milton','barco','milton.guty@gmail.com','72297259',1,'b4dd9ac5-130c-4359-80d2-3ba6f69c91e5',2);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `clientsview`
--

DROP TABLE IF EXISTS `clientsview`;
/*!50001 DROP VIEW IF EXISTS `clientsview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clientsview` AS SELECT 
 1 AS `cliId`,
 1 AS `cliCreatedAt`,
 1 AS `cliUpdatedAt`,
 1 AS `cliDeleted`,
 1 AS `cliFirstName`,
 1 AS `cliLastName`,
 1 AS `cliEmail`,
 1 AS `cliPhone`,
 1 AS `cliComId`,
 1 AS `cliKey`,
 1 AS `cliRutId`,
 1 AS `rutName`,
 1 AS `deuda`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `companys`
--

DROP TABLE IF EXISTS `companys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companys` (
  `comId` int(11) NOT NULL AUTO_INCREMENT,
  `comCreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comUpdatedAt` datetime DEFAULT NULL,
  `comDeleted` smallint(6) NOT NULL DEFAULT '0',
  `comName` varchar(191) CHARACTER SET utf8 NOT NULL,
  `comPhone` varchar(191) CHARACTER SET utf8 DEFAULT NULL,
  `comAddress` varchar(191) CHARACTER SET utf8 DEFAULT NULL,
  `comKey` varchar(36) NOT NULL,
  PRIMARY KEY (`comId`),
  UNIQUE KEY `comKey_UNIQUE` (`comKey`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companys`
--

LOCK TABLES `companys` WRITE;
/*!40000 ALTER TABLE `companys` DISABLE KEYS */;
INSERT INTO `companys` VALUES (1,'2023-01-26 22:13:39',NULL,0,'Company11s','123456789','calle la paz #150','acfa2f85-cd2a-49ea-8d68-c54f7076a797'),(2,'2023-07-01 00:11:51',NULL,0,'milton adalid gutierrez barco','72297259','milton.guty@gmail.com','2e7f13b8-e0d0-4282-b5b3-07a8390a1026'),(3,'2023-07-01 02:46:14',NULL,0,'milton adalid gutierrez barco','72297259','av. Chapare km 7 1/5, edificio multifamiliar bartolina bloque II depto 292','48fd0f84-6c78-415e-ad3c-447de54811f7'),(4,'2023-08-07 01:18:03',NULL,0,'milton adalid gutierrez barco','72297259','av. Chapare km 7 1/5, edificio multifamiliar bartolina bloque II depto 292','9e50a231-9bad-40fc-b603-01aa34dee00c'),(5,'2023-08-07 01:18:19',NULL,0,'aaaaaaaaaaaaaaamilton adalid gutierrez barco','72297259111111','av. Chapare km 7 1/5, edificio multifamiliar bartolina bloque II depto 292','28e44999-e377-4e43-ab22-bfa6f649628a');
/*!40000 ALTER TABLE `companys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `empId` int(11) NOT NULL AUTO_INCREMENT,
  `empCreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `empUpdatedAt` datetime DEFAULT NULL,
  `empDeleted` smallint(6) NOT NULL DEFAULT '0',
  `empFirstName` varchar(191) CHARACTER SET utf8 NOT NULL,
  `empLastName` varchar(191) CHARACTER SET utf8 NOT NULL,
  `empEmail` varchar(191) CHARACTER SET utf8 NOT NULL,
  `empPhone` varchar(191) CHARACTER SET utf8 NOT NULL,
  `empSalary` double NOT NULL DEFAULT '0',
  `empComId` int(11) NOT NULL,
  `empKey` varchar(36) NOT NULL,
  PRIMARY KEY (`empId`),
  UNIQUE KEY `empKey_UNIQUE` (`empKey`),
  KEY `fk_employees_companys1_idx` (`empComId`),
  CONSTRAINT `fk_employees_companys1` FOREIGN KEY (`empComId`) REFERENCES `companys` (`comId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'2023-01-26 22:14:57',NULL,1,'juansss','perez','juan.perez@gmail.com','123156',32565,1,'b806085d-0112-4d40-8248-257ecf608c74'),(2,'2023-07-01 01:35:55',NULL,0,'milton','barco','milton.guty@gmail.com','72297259',0,1,'078d3485-1096-4deb-a5b2-ec628c7767b3'),(3,'2023-08-07 01:23:08',NULL,1,'00000','barco','milton.guty@gmail.com','72297259',0,1,'48024212-3e0e-4ea9-bbf6-f5bb135f76be');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payId` int(11) NOT NULL AUTO_INCREMENT,
  `paySalId` int(11) NOT NULL,
  `payDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payMount` double NOT NULL DEFAULT '0',
  `payCreateAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payUpdateAt` datetime DEFAULT NULL,
  `payKey` varchar(36) NOT NULL,
  `payDeleted` smallint(6) NOT NULL DEFAULT '0',
  `payComId` int(11) NOT NULL,
  PRIMARY KEY (`payId`),
  UNIQUE KEY `payKey_UNIQUE` (`payKey`),
  KEY `fk_payments_companys1_idx` (`payComId`),
  KEY `fk_payments_sales1_idx` (`paySalId`),
  CONSTRAINT `fk_payments_companys1` FOREIGN KEY (`payComId`) REFERENCES `companys` (`comId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payments_sales1` FOREIGN KEY (`paySalId`) REFERENCES `sales` (`salId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (5,4,'2023-08-31 04:11:33',74,'2023-08-31 04:11:33',NULL,'3052f1e1-da5a-4f2f-978a-fd94787c86ee',0,1),(6,4,'2023-08-31 04:35:40',150,'2023-08-31 04:35:40',NULL,'1fc147ab-e47c-4926-80e8-bd4af91c93a9',0,1),(7,4,'2023-08-31 04:37:01',100,'2023-08-31 04:37:01',NULL,'c391761f-1687-44ee-9292-b490c44503bf',0,1),(8,4,'2023-08-31 04:45:03',1,'2023-08-31 04:45:03',NULL,'04aa0cfb-20c8-4149-955c-a32d70e766cd',0,1),(9,4,'2023-08-31 04:46:06',1,'2023-08-31 04:46:06',NULL,'8c49cf95-5008-4ad2-887d-dcb49fd76e43',0,1),(10,4,'2023-08-31 04:47:39',1,'2023-08-31 04:47:39',NULL,'8bab22e2-8f1b-435b-b683-daf600862f55',0,1),(11,4,'2023-08-31 04:47:50',1,'2023-08-31 04:47:50',NULL,'124f0cf7-5bfc-4d9f-9dc6-59452665fb61',0,1),(12,4,'2023-08-31 14:11:33',2,'2023-08-31 14:11:33',NULL,'91974667-6d69-4cef-97e5-3612edec2a94',0,1),(13,4,'2023-08-31 14:46:08',4,'2023-08-31 14:46:08',NULL,'40f5ffad-e062-476d-a581-ca2b7ad5779e',0,1),(14,4,'2023-08-31 16:04:39',10,'2023-08-31 16:04:39',NULL,'c34c0846-5426-41bc-a6d6-4f7377651ae2',0,1),(15,4,'2023-08-31 16:05:02',11,'2023-08-31 16:05:02',NULL,'40365358-c034-4d95-a55a-38cdf8cedbe0',0,1),(16,4,'2023-08-31 16:05:07',111,'2023-08-31 16:05:07',NULL,'d43af229-5328-4265-81ca-649e26a8bf50',1,1),(17,12,'2023-08-31 18:25:15',34,'2023-08-31 18:25:15',NULL,'f02e566e-58bb-424b-a862-be83d8e647e3',0,1),(18,10,'2023-09-01 23:19:04',15,'2023-09-01 23:19:04',NULL,'5705f283-1cd6-491c-b0d3-9ad12789697b',0,1),(19,10,'2023-09-01 23:19:11',10,'2023-09-01 23:19:11',NULL,'436f2618-1485-46d5-965c-bd8a8947f1b4',0,1),(24,1,'2023-09-05 18:06:02',100,'2023-09-05 18:06:02',NULL,'36e36e38-af08-406f-8027-13c530cab321',0,1),(25,8,'2023-09-05 18:13:42',100000000000,'2023-09-05 18:13:42',NULL,'1c0e6543-1804-4db8-b8e8-80efded521cb',1,1),(26,18,'2023-09-05 18:53:46',26.1,'2023-09-05 18:53:46',NULL,'7aa2566c-245b-4fd2-bd2f-d8b86145e001',0,1),(27,24,'2023-09-06 20:46:39',9,'2023-09-06 20:46:39',NULL,'044a0df9-17bb-436f-a422-e5d7dcb98de4',0,1),(28,24,'2023-09-06 22:50:04',9,'2023-09-06 22:50:04',NULL,'9cb0da11-295f-4c7b-b384-194ab55aca29',1,1),(29,25,'2023-09-06 23:18:06',10,'2023-09-06 23:18:06',NULL,'32c82100-7758-4a83-b5be-e2e287941d9d',0,1),(30,25,'2023-09-07 00:09:55',10,'2023-09-07 00:09:55',NULL,'88be314f-3697-45a7-92a2-8eb26f34add9',1,1),(31,26,'2023-09-07 00:55:48',100,'2023-09-07 00:55:48',NULL,'83b14754-427c-45a9-9961-3f80af6e228e',0,1),(32,62,'2023-09-11 18:12:50',100,'2023-09-11 18:12:50',NULL,'6fd60a91-0aed-4f8b-96a5-ffc1f3780281',1,1),(33,62,'2023-09-11 18:12:58',9,'2023-09-11 18:12:58',NULL,'2b3f01e0-2b60-417a-8b9e-02c978454f42',1,1),(34,13,'2023-09-11 18:33:14',10,'2023-09-11 18:33:14',NULL,'b236b256-1238-4901-8cea-97639d893b18',0,1),(35,49,'2023-09-11 23:17:21',2,'2023-09-11 23:17:21',NULL,'417e72fa-4359-4408-9266-c1f0b8c65313',0,1),(36,60,'2023-09-11 23:24:32',120,'2023-09-11 23:24:32',NULL,'52713542-8bef-4e2b-95a3-751e929e243b',0,1),(37,52,'2023-09-11 23:26:41',6,'2023-09-11 23:26:41',NULL,'9ef57d71-af57-4c61-8b40-3401b4798dc6',0,1),(38,49,'2023-09-11 23:30:28',1,'2023-09-11 23:30:28',NULL,'4eb80747-e415-4111-82c5-e90f3d0f66b3',0,1),(39,52,'2023-09-11 23:31:46',1,'2023-09-11 23:31:46',NULL,'f1e0199f-28a9-4ee1-af8e-548b90418c22',0,1),(40,20,'2023-09-11 23:32:43',20,'2023-09-11 23:32:43',NULL,'409ea217-4eee-4504-b905-eb43e70291f9',0,1),(41,20,'2023-09-11 23:33:25',3,'2023-09-11 23:33:25',NULL,'980d239f-a9bf-4648-9fa7-c4137ebb3bd1',0,1),(42,60,'2023-09-11 23:34:29',22,'2023-09-11 23:34:29',NULL,'7a3bb823-82f2-47f9-8dd4-992ecb347bea',1,1),(43,60,'2023-09-11 23:35:43',1,'2023-09-11 23:35:43',NULL,'e0f51eb7-5b13-4021-8bbd-a9df19cb0ea2',1,1),(44,62,'2023-09-13 17:09:50',8,'2023-09-13 17:09:50',NULL,'10776505-e5c3-43e5-8297-25470119c4b3',1,1),(45,62,'2023-09-13 18:13:23',1,'2023-09-13 18:13:23',NULL,'4ae69385-68db-4826-9025-590a6467e002',1,1),(46,62,'2023-09-13 18:13:44',2,'2023-09-13 18:13:44',NULL,'8d84b05a-cf43-495c-b570-de6d5d19e6b5',1,1),(47,62,'2023-09-13 19:14:07',2,'2023-09-13 19:14:07',NULL,'228aa9f6-2376-4472-a6bf-0486efa9fe71',0,1),(48,62,'2023-09-13 19:14:09',2,'2023-09-13 19:14:09',NULL,'7194fe4a-0607-4095-afb8-2fdbad946493',1,1),(49,62,'2023-09-13 19:16:03',3,'2023-09-13 19:16:03',NULL,'fc83efa9-0a2f-49f0-adfc-5dcb10fd3ca2',1,1),(50,62,'2023-09-13 19:16:13',5,'2023-09-13 19:16:13',NULL,'48061a67-1c33-49fa-8922-a63d0a12eef9',1,1),(51,62,'2023-09-13 19:24:22',3,'2023-09-13 19:24:22',NULL,'37f30557-9564-423b-9d82-5389f21ae424',1,1),(52,62,'2023-09-13 19:24:45',3,'2023-09-13 19:24:45',NULL,'43f6c918-68c9-4e7c-bed2-d3b8ddcc5eb8',1,1),(53,62,'2023-09-13 21:29:10',3,'2023-09-13 21:29:10',NULL,'81d9eaf5-e6a4-45ab-8e5a-13b93246dfde',1,1),(54,62,'2023-09-13 21:29:13',4,'2023-09-13 21:29:13',NULL,'e991b4c5-4246-4162-9474-1c7f059e7b18',1,1),(55,62,'2023-09-13 21:37:51',3,'2023-09-13 21:37:51',NULL,'28ff043f-b982-4ee2-a460-976c9022d20b',1,1),(56,62,'2023-09-13 21:39:42',7,'2023-09-13 21:39:42',NULL,'e431a561-5428-495e-9d97-5adc72bab67d',0,1),(57,62,'2023-09-13 21:39:50',7,'2023-09-13 21:39:50',NULL,'1919cf39-44ec-42b9-ae9a-4efac35c2908',1,1),(58,62,'2023-09-13 21:39:55',7,'2023-09-13 21:39:55',NULL,'5c91efed-e2b1-43ed-ab3c-9f0ba1732db0',1,1),(59,20,'2023-09-13 22:03:49',100,'2023-09-13 22:03:49',NULL,'5c7c7ee7-3b9c-44f2-9be5-f661ea8577ae',1,1),(60,62,'2023-09-13 22:05:38',1,'2023-09-13 22:05:38',NULL,'5ecc69dd-bb4c-47c7-8d65-d61c435d984a',0,1),(61,49,'2023-09-13 22:06:50',1,'2023-09-13 22:06:50',NULL,'c3f779d9-a587-470c-b293-b83d745f0a46',0,1),(62,59,'2023-09-13 22:51:50',121.5,'2023-09-13 22:51:50',NULL,'33ab228f-3124-4f37-b4a7-5e16023a47bc',0,1),(63,25,'2023-09-14 00:21:56',3.5,'2023-09-14 00:21:56',NULL,'32d388ed-0fee-4ca0-8157-5b78fe438465',0,1),(64,24,'2023-09-14 00:22:17',0.55,'2023-09-14 00:22:17',NULL,'ed437a1e-397c-4a07-8692-15a4f88fb5d6',0,1),(65,4,'2023-09-14 00:22:43',19,'2023-09-14 00:22:43',NULL,'6f9ce7fb-0a33-43bd-b81c-63935e6e230f',0,1),(66,60,'2023-09-14 00:58:45',1.6,'2023-09-14 00:58:45',NULL,'887fe86f-70d3-409e-98cf-1919d4aaab6b',1,1),(67,60,'2023-09-14 00:58:56',1.5,'2023-09-14 00:58:56',NULL,'1039ecd6-dcdb-46f0-a88a-d1c6de6b213c',0,1),(68,10,'2023-09-14 01:06:12',100,'2023-09-14 01:06:12',NULL,'9980da7c-f94b-4f57-8160-7b38ac85de89',1,1),(69,20,'2023-09-14 12:30:57',0,'2023-09-14 12:30:57',NULL,'00518e0d-d8c1-4ff5-8460-cc660014bf12',1,1),(70,20,'2023-09-14 12:32:30',0,'2023-09-14 12:32:30',NULL,'13d8782a-e2e2-4299-a0d9-20de933ffbf0',1,1),(71,20,'2023-09-14 12:37:37',0,'2023-09-14 12:37:37',NULL,'8e871ee9-0789-4cb8-919a-78aaa543fc1d',1,1),(72,20,'2023-09-14 12:38:07',0,'2023-09-14 12:38:07',NULL,'ac9bc955-56d6-44ca-80bb-9b2bc34564b1',1,1),(73,20,'2023-09-14 15:09:29',0,'2023-09-14 15:09:29',NULL,'78a041bb-6ebb-4847-9c85-9f03a2b77063',1,1),(74,20,'2023-09-14 15:10:11',0,'2023-09-14 15:10:11',NULL,'cb886ea2-f1a7-49f9-9d81-296aebcb523f',0,1),(75,20,'2023-09-14 17:21:46',10,'2023-09-14 17:21:46',NULL,'32cda9b3-9789-4fba-87bf-4de789f31f0e',0,1);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `proId` int(11) NOT NULL AUTO_INCREMENT,
  `procreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `proUpdatedAt` datetime DEFAULT NULL,
  `proDeleted` smallint(6) NOT NULL DEFAULT '0',
  `proDescription` varchar(191) CHARACTER SET utf8 NOT NULL,
  `proPriceSales` double NOT NULL DEFAULT '0',
  `proPricePurchase` double NOT NULL DEFAULT '0',
  `proImage` varchar(191) CHARACTER SET utf8 DEFAULT NULL,
  `proComId` int(11) NOT NULL,
  `proStock` double NOT NULL DEFAULT '0',
  `proKey` varchar(36) NOT NULL,
  `proSecId` int(11) NOT NULL,
  PRIMARY KEY (`proId`),
  UNIQUE KEY `proKey_UNIQUE` (`proKey`),
  KEY `fk_products_companys1_idx` (`proComId`),
  KEY `fk_products_Sections1_idx` (`proSecId`),
  CONSTRAINT `fk_products_Sections1` FOREIGN KEY (`proSecId`) REFERENCES `sections` (`secId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_companys1` FOREIGN KEY (`proComId`) REFERENCES `companys` (`comId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (3,'2023-01-26 23:42:48',NULL,0,'fdsf',3.5,3,'fdsfds',1,21,'30d8c1ea-2e69-4512-95dc-8877a698886b',1),(4,'2023-01-28 21:11:05',NULL,1,'prod1',10.5,20,NULL,1,63,'437f0518-8fef-4634-a5e8-0506c22ea346',1),(5,'2023-02-12 06:53:27',NULL,0,'e',10.5,20,NULL,1,161,'89cb0b4d-fe48-4920-929e-dfc725906047',2),(6,'2023-02-12 06:53:40',NULL,0,'test3333333333333',10,4,NULL,1,57,'3413bc71-9901-405a-8482-50cdabcf22ad',1),(7,'2023-02-12 06:54:22',NULL,0,'wwwwwwwwwwwwwww',4,5,NULL,1,5,'6d490df7-7072-420d-87ba-b4deb531120c',1),(8,'2023-02-12 06:54:35',NULL,0,'rersr',3,4,NULL,1,178,'1caecf07-5101-4ee6-8fd8-f0ad9c90a009',1),(9,'2023-02-12 06:54:46',NULL,0,'wwwwwwwwwwwwwww',23,3,NULL,1,-4,'152e9a72-5250-49d0-8d1b-9f3ab165f00b',1),(10,'2023-07-13 06:20:19',NULL,0,'22222222222222',2,2,NULL,1,-7,'71904974-eef4-4870-8a93-16bb041c22eb',1),(11,'2023-07-13 06:20:33',NULL,0,'22222222222222',2,2,NULL,1,-9,'7a608fdd-4a60-47b4-89bd-dd978152802f',1),(12,'2023-07-13 06:20:43',NULL,0,'ssssss',10,0,NULL,1,11,'4ad3d4bb-6160-4209-b777-0989f54bd220',1),(13,'2023-07-13 06:21:52',NULL,0,'ssssss',10,0,NULL,1,-7,'dcf76adb-1394-4f6f-b82b-4b45bc8be03e',1),(14,'2023-07-13 06:22:14',NULL,0,'ssssss',10,0,NULL,1,-5,'a36e4c43-d8d3-4f87-ad81-a94dba76a138',1),(15,'2023-07-13 06:22:15',NULL,0,'ssssss',10,0,NULL,1,886,'c7ae1981-b06f-402f-be54-bfc3ade379ed',1),(16,'2023-07-13 06:22:15',NULL,0,'ssssss',10,0,NULL,1,-8,'433e517e-c96a-4877-b4c8-bff02593c177',1),(17,'2023-07-13 06:22:15',NULL,0,'ssssss',10,0,NULL,1,-7,'338eed9c-84e0-4cce-bafc-56ce44881c2b',1),(18,'2023-07-13 06:22:15',NULL,0,'ssssss',10,0,NULL,1,-90,'4870187a-3d6e-441d-b5f8-f1c41e8e353a',2),(19,'2023-07-13 06:22:15',NULL,0,'ssssss',10,0,NULL,1,-2,'3cbbcf6c-1ce5-4439-854e-35f038731ea5',2),(20,'2023-07-13 06:22:16',NULL,0,'ssssss',10,0,NULL,1,-7,'fddc4fec-30f5-453f-a000-52ca998afb5a',2),(21,'2023-08-07 01:22:46',NULL,0,'0000',100,10,NULL,1,-17,'58dbd21f-1890-4050-aac7-7d474ba4338a',2),(22,'2023-09-05 14:58:28',NULL,0,'43243242',4,4,NULL,1,-5,'675ad8a1-5297-413d-b311-15773682428b',2),(23,'2023-09-05 15:02:38',NULL,0,'xxxxxxxxxxxxx',3,3,NULL,1,-1,'01a7c7ff-606d-4fb5-b23f-8631a87c4dac',2),(24,'2023-09-05 15:03:36',NULL,0,'treter',5,5,NULL,1,-1,'c8dcc6e7-eac3-4010-a545-3b44d0573789',2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `productsview`
--

DROP TABLE IF EXISTS `productsview`;
/*!50001 DROP VIEW IF EXISTS `productsview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productsview` AS SELECT 
 1 AS `proId`,
 1 AS `procreatedAt`,
 1 AS `proUpdatedAt`,
 1 AS `proDeleted`,
 1 AS `proDescription`,
 1 AS `proPriceSales`,
 1 AS `proPricePurchase`,
 1 AS `proImage`,
 1 AS `proComId`,
 1 AS `proStock`,
 1 AS `proKey`,
 1 AS `proSecId`,
 1 AS `secId`,
 1 AS `secKey`,
 1 AS `secCreatedAt`,
 1 AS `secUpdateAt`,
 1 AS `secDeleted`,
 1 AS `secName`,
 1 AS `secDescription`,
 1 AS `secComId`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `productxsupliers`
--

DROP TABLE IF EXISTS `productxsupliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productxsupliers` (
  `pxsId` int(11) NOT NULL AUTO_INCREMENT,
  `pxsProId` int(11) NOT NULL,
  `pxsSupId` int(11) NOT NULL,
  `pxsKey` varchar(36) NOT NULL,
  PRIMARY KEY (`pxsId`),
  UNIQUE KEY `pxsKey_UNIQUE` (`pxsKey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productxsupliers`
--

LOCK TABLES `productxsupliers` WRITE;
/*!40000 ALTER TABLE `productxsupliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `productxsupliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `providers` (
  `prvId` int(11) NOT NULL AUTO_INCREMENT,
  `prvCreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prvUpdatedAt` datetime DEFAULT NULL,
  `prvDeleted` smallint(6) NOT NULL DEFAULT '0',
  `prvName` varchar(191) CHARACTER SET utf8 NOT NULL,
  `prvPhone` varchar(191) CHARACTER SET utf8 NOT NULL,
  `prvAddress` varchar(191) CHARACTER SET utf8 NOT NULL,
  `prvImage` varchar(191) DEFAULT NULL,
  `prvComId` int(11) NOT NULL,
  `prvKey` varchar(36) NOT NULL,
  PRIMARY KEY (`prvId`),
  UNIQUE KEY `prvKey_UNIQUE` (`prvKey`),
  KEY `fk_providers_companys_idx` (`prvComId`),
  CONSTRAINT `fk_providers_companys` FOREIGN KEY (`prvComId`) REFERENCES `companys` (`comId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers`
--

LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT INTO `providers` VALUES (1,'2023-01-26 22:13:39',NULL,0,'proveedor 1','12345789','av. Chapare km 7 1/5ssssssssssss','image1.jpg',1,'1592235c-cd27-40d7-a050-ceddaee66b70'),(2,'2023-01-28 21:05:50',NULL,1,'wwwwww','72297259','av. Chapare km 7 1/5, edificio multifamiliar bartolina bloque II depto 292','',1,'de3ded67-6f88-47c9-bfdd-67fb39d990a9'),(3,'2023-07-17 03:51:25',NULL,1,'milton adalid gutierrez barco','72297259','av. Chapare km 7 1/5, edificio multifamiliar bartolina bloque II depto 292','',1,'b5d7b604-c2e8-4622-a05d-bac9fbb91181'),(4,'2023-07-17 03:51:27',NULL,0,'milton adalid gutierr444ez barco','7229725944','av. Chapare km 7 41/5, edificio multifamiliar bartolina bloque II depto 292','',1,'eefc8985-4569-400d-8a97-577fd436a143'),(5,'2023-07-17 03:51:28',NULL,0,'milton adalid gutierr444ez barco','7229725944','av. Chapare km 7 41/5, edificio multifamiliar bartolina bloque II depto 292','',1,'7c58009f-8579-4dd8-8bdb-cfe1cf21a852'),(6,'2023-07-17 03:51:30',NULL,1,'milton adalid gutierr444ez barco','7229725944','av. Chapare km 7 41/5, edificio multifamiliar bartolina bloque II depto 292','',1,'437bc32e-21e6-4cda-8bb3-889489fefa97'),(7,'2023-07-17 03:51:31',NULL,0,'milton adalid gutierr444ez barco','7229725944','av. Chapare km 7 41/5, edificio multifamiliar bartolina bloque II depto 292','',1,'43bc73a9-fcd1-4fa8-b8bc-a3a1b2bb1b06'),(8,'2023-07-17 14:55:37',NULL,0,'milton adalid gutierr444ez barco','7229725944','av. Chapare km 7 41/5, edificio multifamiliar bartolina bloque II depto 292','',1,'ce0d8a0c-5a96-47a9-9897-a80cbb3d3529'),(9,'2023-07-17 14:55:54',NULL,0,'milton adalid gutierr444ez barco','7229725944','av. Chapare km 7 41/5, edificio multifamiliar bartolina bloque II depto 292','',1,'0054cc8d-e550-4dde-b1ee-58ef48ed4535'),(10,'2023-08-07 01:24:57',NULL,0,'00000','72297259','av. Chapare km 7 1/5, edificio multifamiliar bartolina bloque II depto 292','',1,'cea8c728-4a51-47af-885f-e051b786bcde'),(11,'2023-09-05 15:17:30',NULL,0,'555555555555adalid gutierrez barco','72297259','av. Chapare km 7 1/5, edificio multifamiliar bartolina bloque II depto 292',NULL,1,'bb7c3d0b-cda2-4746-9c0c-fff2aa3ff285');
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `purId` int(11) NOT NULL AUTO_INCREMENT,
  `purCreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `purUpdatedAt` datetime DEFAULT NULL,
  `purDeleted` smallint(6) NOT NULL DEFAULT '0',
  `purDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `purTotal` double NOT NULL DEFAULT '0',
  `purComId` int(11) NOT NULL,
  `purClose` smallint(6) NOT NULL DEFAULT '0',
  `purUseId` int(11) NOT NULL,
  `purPrvId` int(11) NOT NULL,
  `purKey` varchar(36) NOT NULL,
  `purNumber` char(10) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`purId`),
  UNIQUE KEY `purKey_UNIQUE` (`purKey`),
  KEY `fk_purchases_companys1_idx` (`purComId`),
  KEY `fk_purchase_provider_idx` (`purPrvId`),
  CONSTRAINT `fk_purchase_provider` FOREIGN KEY (`purPrvId`) REFERENCES `providers` (`prvId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchases_companys1` FOREIGN KEY (`purComId`) REFERENCES `companys` (`comId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,'2023-05-07 14:08:25',NULL,1,'2023-05-07 14:08:25',98712,1,1,1,1,'94c59ead-86eb-41df-aea3-eda4d0b70cdd',NULL),(2,'2023-08-25 11:35:41',NULL,0,'2023-08-25 11:35:41',98712,1,0,0,1,'28236a90-073e-417c-a867-820b1062428c',NULL),(3,'2023-08-25 11:35:43',NULL,0,'2023-08-25 11:35:43',98712,1,0,0,1,'3c3f66b1-65ac-4eba-9dfb-4256720c5f25',NULL),(4,'2023-08-25 11:35:47',NULL,0,'2023-08-25 11:35:47',98712,1,0,0,1,'53ec24ff-b893-4523-a0e4-192d742967f0',NULL),(5,'2023-08-25 11:35:49',NULL,0,'2023-08-25 11:35:49',98712,1,0,0,1,'d7eaac8c-be6d-4119-8fa5-f5b12c8879c5',NULL),(6,'2023-08-26 04:44:06',NULL,0,'2023-08-26 04:44:06',98712,1,0,0,7,'1c6cf657-185a-4e81-8a7f-f34ab453340c',NULL),(7,'2023-08-26 04:45:48',NULL,0,'2023-08-26 04:45:48',98712,1,0,0,7,'3921d267-c792-462f-ad47-8ead5b6d06bc',NULL),(8,'2023-08-26 04:56:24',NULL,0,'2023-08-26 04:56:24',98712,1,0,0,4,'87d5627a-34f3-4124-bc45-803a07f4d36f',NULL),(9,'2023-08-26 04:57:17',NULL,0,'2023-08-26 04:57:17',98712,1,0,0,7,'289b9917-7cdf-4f2e-9e7a-41bfc1db3476',NULL),(10,'2023-08-26 04:58:17',NULL,1,'2023-08-26 04:58:17',98712,1,0,0,7,'d4fa9e0a-6b0f-4610-96d9-e8f4080d1c08',NULL),(11,'2023-08-26 04:58:50',NULL,1,'2023-08-26 04:58:50',98712,1,0,0,5,'f7187da5-3e29-48fa-bb0b-e3259c011955',NULL),(12,'2023-08-26 04:59:10',NULL,0,'2023-08-26 04:59:10',98712,1,0,0,4,'dda2e430-9c92-41f1-957f-7d433027caf7',NULL),(13,'2023-08-26 05:00:27',NULL,0,'2023-08-26 05:00:27',98712,1,0,0,4,'2ea4208b-6b30-437a-ad15-b3ea7537c62b',NULL),(14,'2023-08-26 05:02:25',NULL,0,'2023-08-26 05:02:25',98712,1,0,0,4,'83be2855-221f-4645-9bf0-bac625f37f1b',NULL),(15,'2023-08-26 05:04:19',NULL,0,'2023-08-26 05:04:19',98712,1,0,0,7,'e8272133-67d5-498f-abdc-38f9cd32faf6',NULL),(16,'2023-08-26 05:10:13',NULL,0,'2023-08-26 05:10:13',98712,1,0,0,7,'94569246-a180-4c8d-9c62-17edfffc6b47',NULL),(17,'2023-08-26 05:11:05',NULL,1,'2023-08-26 05:11:05',98712,1,0,0,5,'83a5a2e4-1eaa-49dc-bf72-71ce2b210b19',NULL),(18,'2023-08-26 05:13:50',NULL,1,'2023-08-26 05:13:50',98712,1,0,0,4,'c46082f6-c708-4f62-8fc4-a2152dad1582',NULL),(19,'2023-08-26 05:16:29',NULL,0,'2023-08-26 05:16:29',98712,1,0,0,5,'f134ec38-fb36-4ecb-a6ba-7d3cdb1c4d87',NULL),(20,'2023-08-26 05:16:50',NULL,1,'2023-08-26 05:16:50',98712,1,0,0,1,'1e9804c7-b5bb-4f03-8d1c-4af50fa899e5',NULL),(21,'2023-08-26 05:20:39',NULL,1,'2023-08-26 05:20:39',98712,1,0,0,4,'de353044-bef7-46e6-9dbd-8d9f7b55e11e',NULL),(22,'2023-08-26 20:32:17',NULL,1,'2023-08-26 20:32:17',98712,1,0,0,1,'329cd92a-0bef-4491-bd8b-8d92ac98ce58',NULL),(23,'2023-08-26 20:36:46',NULL,0,'2023-08-26 20:36:46',98712,1,0,0,1,'405998bf-0358-4647-a710-2342e4e55b36',NULL),(24,'2023-09-05 03:15:22',NULL,0,'2023-09-05 03:15:22',98712,1,0,1,1,'52ba3e9d-85e5-44f5-a3f2-fe49b8bf6e1e',NULL),(25,'2023-09-05 03:18:00',NULL,0,'2023-09-05 03:18:00',99013,1,0,1,4,'a0322a3a-29e5-459f-9fcb-bab43970e0e2',NULL),(26,'2023-09-06 01:00:50',NULL,0,'2023-09-06 01:00:50',1683,1,0,1,1,'b0ee634d-7a85-481a-a677-6c7cf4e0e9c1',NULL);
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchasesdetails`
--

DROP TABLE IF EXISTS `purchasesdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchasesdetails` (
  `pudId` int(11) NOT NULL AUTO_INCREMENT,
  `pudCreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pudUpdatedAt` datetime DEFAULT NULL,
  `pudDeleted` smallint(6) NOT NULL DEFAULT '0',
  `pudProdId` int(11) NOT NULL,
  `pudProdDescription` varchar(191) CHARACTER SET utf8 NOT NULL,
  `pudProdCount` double NOT NULL DEFAULT '0',
  `pudUseId` int(11) NOT NULL,
  `pudPurId` int(11) NOT NULL,
  `pudProdPrice` double NOT NULL DEFAULT '0',
  `pudLastItem` smallint(6) NOT NULL DEFAULT '0',
  `pudSubTotal` double GENERATED ALWAYS AS ((`pudProdCount` * `pudProdPrice`)) STORED,
  `pudKey` varchar(36) NOT NULL,
  PRIMARY KEY (`pudId`),
  UNIQUE KEY `pudKey_UNIQUE` (`pudKey`),
  KEY `fk_purchasesdetails_purchases1_idx` (`pudPurId`),
  CONSTRAINT `fk_purchasesdetails_purchases1` FOREIGN KEY (`pudPurId`) REFERENCES `purchases` (`purId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasesdetails`
--

LOCK TABLES `purchasesdetails` WRITE;
/*!40000 ALTER TABLE `purchasesdetails` DISABLE KEYS */;
INSERT INTO `purchasesdetails` (`pudId`, `pudCreatedAt`, `pudUpdatedAt`, `pudDeleted`, `pudProdId`, `pudProdDescription`, `pudProdCount`, `pudUseId`, `pudPurId`, `pudProdPrice`, `pudLastItem`, `pudKey`) VALUES (2,'2023-05-07 14:11:03',NULL,0,5,'tset',10,1,1,1,1,'594a7ef9-9a3c-48e1-b580-98ebda11fb0c'),(3,'2023-08-26 13:21:50',NULL,0,4,'prod1',3,1,1,32,0,'42ce70c8-b496-46fb-8819-c579fd5a06ee'),(4,'2023-08-26 13:22:44',NULL,0,4,'prod1',3,1,1,32,0,'6dd3b3c7-58c5-4080-95ff-f071c5ccb09d'),(5,'2023-08-26 13:23:04',NULL,0,4,'prod1',3,1,1,32,0,'64c22fae-0258-450b-8937-8ec0781d4ea6'),(6,'2023-08-26 20:37:05',NULL,0,3,'fdsf',43,1,23,43,0,'e314f36b-aa55-4845-b310-c055fcd0e920'),(7,'2023-08-26 20:39:06',NULL,0,3,'fdsf',43,1,23,43,0,'1b5aa9a1-51c9-47eb-85d0-3b7c77edb7f1'),(8,'2023-08-26 20:39:12',NULL,0,6,'test3333333333333',43,1,23,43,0,'e4263f10-7c71-4145-8f80-8a1a8494abe7'),(9,'2023-08-26 20:39:17',NULL,0,8,'rersr',43,1,23,43,0,'205111cf-c52f-4481-9f97-041ebd046f87'),(10,'2023-08-26 20:39:49',NULL,0,8,'rersr',43,1,23,43,0,'fdee95f9-0e3b-48f9-adfa-58351b7019fe'),(11,'2023-08-26 20:40:43',NULL,0,12,'ssssss',43,1,23,43,0,'0ccba272-a7e7-4ae6-83f0-7443fed5711e'),(12,'2023-08-26 20:42:29',NULL,0,8,'rersr',43,1,23,43,0,'00067aa2-aa5d-4603-a112-745c85cc5a2a'),(13,'2023-08-26 20:46:40',NULL,0,6,'test3333333333333',43,1,23,43,0,'7666ee77-4722-4434-98e5-b3c4648aefc6'),(14,'2023-08-26 23:05:02',NULL,0,16,'ssssss',0,1,23,0,0,'3491d7e5-39bb-48e1-a827-979aa25251b0'),(15,'2023-08-27 01:51:19',NULL,0,9,'wwwwwwwwwwwwwww',2,1,23,2,0,'e6319296-6c7f-4b7a-b39e-9bc6a3b648b1'),(16,'2023-08-27 01:51:37',NULL,0,5,'e',22,1,23,5,0,'7a695d96-cd7a-4973-9d4a-1a9911cf8f71'),(17,'2023-09-03 03:57:55',NULL,0,6,'test3333333333333',4,1,23,4,0,'7a695d96-cd7a-4973-9d4a-1a9911458f71'),(18,'2023-09-03 03:58:07',NULL,0,8,'rersr',54,1,23,54,0,'7a695d96-cd7a-4973-9d4a-1878911cf8f7'),(19,'2023-09-03 04:32:51',NULL,0,4,'prod1',21,1,22,21,0,'7a6996-cd7a-4973-9d4a-1a991581cf8f71'),(20,'2023-09-03 04:32:59',NULL,0,7,'wwwwwwwwwwwwwww',12,1,22,12,0,'7a695d456cd7a-4973-9d4a-1a9911cf8f71'),(21,'2023-09-05 03:16:24',NULL,0,4,'prod1',11,1,24,10,0,'aff135b4-bd7f-409f-a26f-ee13af00dd80'),(22,'2023-09-05 03:18:12',NULL,0,6,'test3333333333333',3,1,25,3,0,'779c3f76-f675-4550-8f36-2f6eda31ead0'),(23,'2023-09-05 03:18:15',NULL,0,6,'test3333333333333',3,1,25,3,0,'112ea574-493b-47d7-8f17-d39f238748bc'),(24,'2023-09-05 03:18:34',NULL,0,8,'rersr',4,1,25,4,0,'c414526f-8c38-4d60-84c6-9f0b14d3116c'),(25,'2023-09-05 03:19:46',NULL,0,15,'ssssss',111,1,25,111,0,'d106efb3-51ec-4f0c-bd49-674404aa90e6'),(26,'2023-09-05 03:19:46',NULL,0,15,'ssssss',111,1,25,111,0,'e3f96276-2faa-428e-affb-9a1cc7116c18'),(27,'2023-09-05 03:19:47',NULL,0,15,'ssssss',111,1,25,111,0,'9971ae9c-05c4-4e1c-956e-ced276dc637b'),(28,'2023-09-05 03:19:48',NULL,0,15,'ssssss',111,1,25,111,0,'c5d64d8b-5e24-4bf2-bb75-9a7e006fd3ba'),(32,'2023-09-05 03:19:49',NULL,0,15,'ssssss',111,1,25,111,0,'61378adf-588c-42ab-98c7-99e5746fa286'),(33,'2023-09-05 03:19:50',NULL,0,15,'ssssss',111,1,25,111,0,'c8b3e7d9-aa3d-4cef-b97e-b462de5a3115'),(34,'2023-09-05 03:19:50',NULL,0,15,'ssssss',111,1,25,111,0,'eae69302-8a7a-4cc6-ade0-51fde6e32458'),(36,'2023-09-05 03:19:52',NULL,0,15,'ssssss',111,1,25,111,0,'2f4fdf9e-9a56-40a5-85fe-0d8e3a5a53ed'),(37,'2023-09-05 03:21:40',NULL,0,3,'fdsf',0,1,25,0,0,'4f11344d-492e-4770-8b62-1db34092b008'),(38,'2023-09-05 03:21:42',NULL,0,3,'fdsf',0,1,25,0,0,'33bbb4ad-94b7-473f-846c-eb6d4624835e'),(39,'2023-09-05 03:21:42',NULL,0,3,'fdsf',0,1,25,0,0,'9c6dc6ef-fe4a-4d62-a32c-8ae101d01a12'),(43,'2023-09-05 03:21:43',NULL,0,3,'fdsf',0,1,25,0,0,'b1118bbe-ad32-4681-af5b-3c1804d822b7'),(45,'2023-09-05 03:21:45',NULL,0,3,'fdsf',0,1,25,0,0,'546ef0c4-1dbb-43ac-87b3-1444640ae17b'),(46,'2023-09-05 03:35:13',NULL,0,6,'test3333333333333',0,1,25,342423,0,'be61be73-86d9-4102-817e-7c893b27df54'),(47,'2023-09-05 03:35:14',NULL,0,6,'test3333333333333',0,1,25,342423,0,'1341c984-2d6c-43ea-8396-83b6d2e83a06'),(48,'2023-09-05 03:35:14',NULL,0,6,'test3333333333333',0,1,25,342423,0,'1d050723-75d4-4854-b89c-53e09489f518'),(52,'2023-09-05 03:35:16',NULL,0,6,'test3333333333333',0,1,25,342423,0,'8b0f03bc-5acc-436f-b593-58e52183f912'),(53,'2023-09-05 03:35:16',NULL,0,6,'test3333333333333',0,1,25,342423,0,'ca79417b-8dee-4c1f-8a15-d5424a6e97d4'),(56,'2023-09-05 03:39:05',NULL,0,4,'prod1',5,1,25,5,0,'bc76e0f8-d38e-4e73-b57a-59cd694de78a'),(57,'2023-09-05 03:39:27',NULL,0,4,'prod1',9,1,25,9,0,'43e224fd-b6c2-433e-af4d-6dc6f5558204'),(58,'2023-09-05 03:41:58',NULL,0,4,'prod1',2,1,25,2,0,'08956104-a42c-4ef8-b1b4-210395c23a96'),(59,'2023-09-05 19:16:25',NULL,0,4,'prod1',1,1,25,1,0,'5628f944-b59d-42c9-9678-4b9de0c24b0d'),(60,'2023-09-05 19:17:51',NULL,0,5,'e',150,1,25,2,0,'ed0c987d-1c2e-4cea-b920-89ee3209a71d'),(61,'2023-09-06 01:01:13',NULL,0,8,'rersr',5,1,26,5,0,'02795c99-b205-4aa6-96fc-c849f4c8a186'),(62,'2023-09-06 01:01:38',NULL,0,10,'22222222222222',2,1,26,4,0,'095ab8b2-2be4-4eae-be64-b63e3ba16ae7'),(63,'2023-09-06 01:10:12',NULL,1,4,'prod1',15,1,26,110,0,'2eca6d89-b93a-4ec3-b321-96ca2ad240e0');
/*!40000 ALTER TABLE `purchasesdetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sace4948_system`@`%`*/ /*!50003 TRIGGER `sace4948_system`.`purchasesdetails_AFTER_INSERT` AFTER INSERT ON `purchasesdetails` FOR EACH ROW
BEGIN
  DECLARE pudProId INT DEFAULT 0;
  DECLARE pudpurId INT DEFAULT 0;
	SET pudProId = NEW.pudprodid ;
	SET pudpurId = NEW.pudpurid;
    CALL Updatestockproduct (pudProId);
	CALL UpdateTotalPurchases(pudpurId);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sace4948_system`@`%`*/ /*!50003 TRIGGER `sace4948_system`.`purchasesdetails_AFTER_DELETE` AFTER DELETE ON `purchasesdetails` FOR EACH ROW
BEGIN
     DECLARE pudProId INT DEFAULT 0;
     DECLARE pudpurId INT DEFAULT 0;
     set pudProId = OLD.pudprodid;	    
     set pudpurId= OLD.pudpurid;
     CALL Updatestockproduct(pudProId);
	 CALL  UpdateTotalPurchases(pudpurId);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `purchasesview`
--

DROP TABLE IF EXISTS `purchasesview`;
/*!50001 DROP VIEW IF EXISTS `purchasesview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `purchasesview` AS SELECT 
 1 AS `purId`,
 1 AS `purCreatedAt`,
 1 AS `purUpdatedAt`,
 1 AS `purDeleted`,
 1 AS `purDate`,
 1 AS `purTotal`,
 1 AS `purComId`,
 1 AS `purClose`,
 1 AS `purUseId`,
 1 AS `purPrvId`,
 1 AS `purKey`,
 1 AS `purNumber`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rutes`
--

DROP TABLE IF EXISTS `rutes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rutes` (
  `rutId` int(11) NOT NULL AUTO_INCREMENT,
  `rutCreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rutUpdatedAt` datetime DEFAULT NULL,
  `rutDeleted` smallint(6) NOT NULL DEFAULT '0',
  `rutName` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rutDescription` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rutKey` varchar(36) NOT NULL,
  `rutComId` int(11) DEFAULT NULL,
  PRIMARY KEY (`rutId`),
  UNIQUE KEY `rutKey_UNIQUE` (`rutKey`),
  KEY `fk_rutes_companys1_idx` (`rutComId`),
  CONSTRAINT `fk_rutes_companys1` FOREIGN KEY (`rutComId`) REFERENCES `companys` (`comId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutes`
--

LOCK TABLES `rutes` WRITE;
/*!40000 ALTER TABLE `rutes` DISABLE KEYS */;
INSERT INTO `rutes` VALUES (1,'2023-08-23 23:24:45',NULL,0,'ruta 1','ruta1','0c763d6a-638e-42b7-b648-2318a3bf34cc',1),(2,'2023-08-23 23:25:43',NULL,0,'ruta 2','ruta 2','6ed2e35f-aaf4-46c7-bf41-d1318fd57f3b',1),(3,'2023-08-23 23:25:55',NULL,0,'ruta 3','ruta 3','c8f018d1-fbca-4cae-a5c6-f213f02e94a2',1);
/*!40000 ALTER TABLE `rutes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `salId` int(11) NOT NULL AUTO_INCREMENT,
  `salCreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `salUpdatedAt` datetime DEFAULT NULL,
  `salDeleted` smallint(6) NOT NULL DEFAULT '0',
  `salDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `salTotal` double NOT NULL DEFAULT '0',
  `salLiteral` varchar(191) CHARACTER SET utf8 NOT NULL DEFAULT 'cero',
  `salComId` int(11) NOT NULL,
  `salCliId` int(11) NOT NULL,
  `salClose` smallint(6) NOT NULL DEFAULT '0',
  `salUseId` int(11) NOT NULL,
  `salKey` varchar(36) NOT NULL,
  `salDescuento` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`salId`),
  UNIQUE KEY `salKey_UNIQUE` (`salKey`),
  KEY `fk_sales_companys1_idx` (`salComId`),
  CONSTRAINT `fk_sales_companys1` FOREIGN KEY (`salComId`) REFERENCES `companys` (`comId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'2023-07-23 04:33:55',NULL,0,'2023-07-23 04:33:55',38,'cero',1,10,1,1,'4bfbb9dd-77e6-4b82-b7e8-3713e5025766',66),(2,'2023-08-14 13:25:12',NULL,0,'2023-08-14 13:25:12',38,'t',1,10,1,1,'7bae9953-870c-4757-9e5d-f6835550d382',0),(3,'2023-08-14 18:46:33',NULL,0,'2023-08-14 18:46:33',38,'cero',1,10,1,1,'017d0808-b429-4105-888b-4224eb283d85',100),(4,'2023-08-26 14:27:52',NULL,1,'2023-08-26 14:27:52',38,'cero',1,10,1,1,'d9ee868d-617e-4517-9bd5-cd381845e2a9',0),(5,'2023-08-26 14:27:52',NULL,0,'2023-08-26 14:27:52',38,'cero',1,10,1,1,'f3740c05-cdfd-4ced-b041-540957c06aec',0),(6,'2023-08-26 14:27:52',NULL,1,'2023-08-26 14:27:52',38,'cero',1,11,1,1,'80fd7881-40b5-45cf-8738-ac54a44ab7ae',0),(7,'2023-08-27 03:43:21',NULL,0,'2023-08-27 03:43:21',38,'cero',1,10,1,1,'70bb1dbf-1d39-4925-b9c3-3475af7c3f59',0),(8,'2023-08-27 03:43:59',NULL,0,'2023-08-27 03:43:59',38,'cero',1,10,1,1,'05664c7e-2b63-423e-89da-edcd7006cf21',0),(9,'2023-08-29 02:25:11',NULL,0,'2023-08-29 02:25:11',38,'cero',1,10,1,1,'0565ad76-30fb-4201-a8a9-11f224433ae4',0),(10,'2023-08-31 16:08:25',NULL,0,'2023-08-31 16:08:25',38,'cero',1,10,1,1,'49fa6d01-b457-46bf-af59-1294bd289cfe',0),(11,'2023-08-31 16:10:41',NULL,0,'2023-08-31 16:10:41',38,'cero',1,10,1,1,'e1296065-0e5a-45a6-a549-20fcb675ddce',0),(12,'2023-08-31 17:11:29',NULL,0,'2023-08-31 17:11:29',38,'cero',1,10,1,1,'5de7cb3b-5b8e-489d-8d72-5af1cd03128e',0),(13,'2023-08-31 17:45:00',NULL,0,'2023-08-31 17:45:00',38,'cero',1,10,1,1,'f32360c9-d88f-4bde-92df-337636cadc75',0),(14,'2023-08-31 17:49:59',NULL,0,'2023-08-31 17:49:59',38,'cero',1,10,1,1,'c82a7aa2-efb8-41cb-b52a-6e3b95a32175',0),(15,'2023-08-31 18:26:59',NULL,0,'2023-08-31 18:26:59',38,'cero',1,10,1,1,'f319da21-30e7-4dc2-b713-d1243d94e9c5',0),(16,'2023-09-01 23:16:24',NULL,0,'2023-09-01 23:16:24',38,'cero',1,11,1,1,'bca52801-6a85-4ad1-8eeb-27e0ddd7af6c',0),(17,'2023-09-02 21:36:18',NULL,0,'2023-09-02 21:36:18',38,'cero',1,10,1,1,'bca52801-6a85-4ad1-8eeb-27e0ddd7af6',0),(18,'2023-09-02 21:36:21',NULL,0,'2023-09-02 21:36:21',38,'cero',1,10,1,1,'bca52801-6a85-4ad1-8eeb-27e0ddd7af',10),(19,'2023-09-03 16:14:43',NULL,0,'2023-09-03 16:14:43',38,'cero',1,14,1,1,'a52801-6a85-4ad1-8eeb-27e0ddd7af6cfd',0),(20,'2023-09-04 16:58:16',NULL,0,'2023-09-04 16:58:16',38,'cero',1,11,1,1,'73cca0fb-175d-4b06-8582-94fad26b316c',0),(21,'2023-09-04 17:04:15',NULL,0,'2023-09-04 17:04:15',38,'cero',1,23,1,1,'263df9ba-77d1-40c9-bb39-634457b65f42',0),(22,'2023-09-04 17:26:03',NULL,0,'2023-09-04 17:26:03',38,'cero',1,10,1,1,'6a4d90ee-4df6-4cc8-90f2-62b2f346df28',100),(23,'2023-09-06 19:46:10',NULL,0,'2023-09-06 19:46:10',38,'cero',1,11,1,1,'a5324c66-47bc-4298-ab8e-b94c3bdcc094',0),(24,'2023-09-06 19:48:46',NULL,0,'2023-09-06 19:48:46',38,'cero',1,10,1,1,'579514a7-8cf7-486f-9e5d-d58dcb041aaa',9),(25,'2023-09-06 23:15:33',NULL,0,'2023-09-06 23:15:33',38,'cero',1,10,1,1,'7e1b4259-c707-4a1e-9e47-eeba209cf6b8',0),(26,'2023-09-07 00:45:51',NULL,0,'2023-09-07 00:45:51',38,'cero',1,10,1,1,'c847ed38-9c1d-4e90-96cc-5ed8fa09cb0b',0),(27,'2023-09-07 02:22:45',NULL,0,'2023-09-07 02:22:45',38,'cero',1,14,0,1,'f14fe217-a793-466a-b308-e44680378ad4',0),(28,'2023-09-08 19:48:22',NULL,0,'2023-09-08 19:48:22',38,'cero',1,10,0,1,'1e9e9b8e-b048-4460-8532-1f6216d9df91',0),(29,'2023-09-08 19:53:01',NULL,0,'2023-09-08 19:53:01',38,'cero',1,10,0,1,'8768e351-01fe-47d6-bdea-520cff19cba7',0),(30,'2023-09-08 20:20:33',NULL,0,'2023-09-08 20:20:33',38,'cero',1,10,0,1,'65a6dd66-6fa3-46a2-ad30-5a482b875b1b',0),(31,'2023-09-08 20:56:44',NULL,0,'2023-09-08 20:56:44',38,'cero',1,10,0,1,'63be0a99-2c35-4975-9ff0-8a5e92f67eba',0),(32,'2023-09-08 21:40:26',NULL,0,'2023-09-08 21:40:26',38,'cero',1,10,0,1,'1b89705f-8d62-450c-b785-f4c32b562021',0),(33,'2023-09-08 21:41:05',NULL,0,'2023-09-08 21:41:05',38,'cero',1,11,0,1,'93a4b56f-5db2-4735-a06f-c5f96753d117',0),(34,'2023-09-09 11:50:14',NULL,0,'2023-09-09 11:50:14',38,'cero',1,13,0,1,'b61db79a-aab6-4358-a0d4-8f66275fcf29',0),(35,'2023-09-09 12:06:50',NULL,0,'2023-09-09 12:06:50',38,'cero',1,11,0,1,'e94fc2c4-f71a-4e6a-bdac-a82a0820f79f',0),(36,'2023-09-09 12:27:41',NULL,0,'2023-09-09 12:27:41',38,'cero',1,10,0,1,'59118442-4ad7-4d69-ab02-f88da2a8e846',0),(37,'2023-09-09 12:28:40',NULL,0,'2023-09-09 12:28:40',38,'cero',1,15,0,1,'b431cd23-6799-45e1-bb1c-e770f38d453e',0),(38,'2023-09-09 12:41:02',NULL,0,'2023-09-09 12:41:02',38,'cero',1,11,0,1,'d822bf91-bbeb-43de-89fe-b8011dad11ad',0),(39,'2023-09-09 12:43:56',NULL,0,'2023-09-09 12:43:56',38,'cero',1,14,0,1,'09d5f0bc-03bb-4933-b08d-6286b2097041',0),(40,'2023-09-09 12:44:40',NULL,0,'2023-09-09 12:44:40',38,'cero',1,18,0,1,'ced3a648-55be-408e-8b30-83d1608ffa59',0),(41,'2023-09-09 21:06:44',NULL,0,'2023-09-09 21:06:44',38,'cero',1,10,0,1,'7eac801d-0651-4c86-b55e-dcba2281c12d',0),(42,'2023-09-09 21:07:31',NULL,0,'2023-09-09 21:07:31',38,'cero',1,13,0,1,'ea2d22ac-fd78-4440-bc85-d010c3de84e7',0),(43,'2023-09-09 21:11:54',NULL,0,'2023-09-09 21:11:54',38,'cero',1,20,0,1,'a93536fc-03e2-43a3-9222-74e51f711a7c',0),(44,'2023-09-09 21:12:29',NULL,0,'2023-09-09 21:12:29',38,'cero',1,11,0,1,'a002a139-bcb6-4304-9813-f63e00371a64',0),(45,'2023-09-09 21:23:00',NULL,0,'2023-09-09 21:23:00',38,'cero',1,15,0,1,'e7b963dc-c82e-4a65-a1c1-9019d8334aff',0),(46,'2023-09-10 01:37:35',NULL,0,'2023-09-10 01:37:35',38,'cero',1,20,0,1,'321e0f7a-f234-4d6a-bfdd-38a3f9e352b5',0),(47,'2023-09-10 01:40:43',NULL,0,'2023-09-10 01:40:43',38,'cero',1,10,0,1,'ee67c1c9-f20c-4868-82b9-037672eeef26',0),(48,'2023-09-10 01:53:20',NULL,0,'2023-09-10 01:53:20',38,'cero',1,13,0,1,'e09efa12-b063-4980-9b95-8f1149aa9155',0),(49,'2023-09-10 02:12:38',NULL,0,'2023-09-10 02:12:38',38,'cero',1,11,0,1,'49c6801e-d1c4-4a5b-ba4b-8f391819c8a3',0),(50,'2023-09-11 00:22:19',NULL,0,'2023-09-11 00:22:19',38,'cero',1,20,0,1,'e1de2a6f-7e39-443e-b0c6-01367c393a43',0),(51,'2023-09-11 00:28:52',NULL,0,'2023-09-11 00:28:52',38,'cero',1,12,0,1,'b4c213f4-39e5-4707-959d-39b3bbd5ef28',0),(52,'2023-09-11 00:32:17',NULL,0,'2023-09-11 00:32:17',38,'cero',1,11,0,1,'f214ba56-160f-4167-92f8-a00502edd65c',0),(53,'2023-09-11 00:36:13',NULL,0,'2023-09-11 00:36:13',38,'cero',1,13,0,1,'00afa435-bd5b-4463-b010-9b776e24ee36',0),(54,'2023-09-11 00:41:15',NULL,0,'2023-09-11 00:41:15',38,'cero',1,13,0,1,'6f3f125e-e6db-47c2-aa54-07b02f297d68',0),(55,'2023-09-11 00:46:39',NULL,0,'2023-09-11 00:46:39',38,'cero',1,16,0,1,'d7a2cc99-3c93-4b50-8937-823ac6ed4bdc',0),(56,'2023-09-11 00:50:49',NULL,0,'2023-09-11 00:50:49',38,'cero',1,16,0,1,'b9fbecc9-51a7-4d7c-a114-468fae7eb821',0),(57,'2023-09-11 01:01:57',NULL,0,'2023-09-11 01:01:57',38,'cero',1,16,0,1,'fc97552c-e108-4a80-9e02-b1fb93e4089d',0),(58,'2023-09-11 01:02:22',NULL,0,'2023-09-11 01:02:22',38,'cero',1,16,0,1,'aa550bb7-4fb3-4b15-bb78-d1ea4d852d01',0),(59,'2023-09-11 01:04:50',NULL,0,'2023-09-11 01:04:50',38,'cero',1,12,0,1,'ca5ee74a-6ee0-4fef-8615-8226587badd9',0),(60,'2023-09-11 01:15:31',NULL,0,'2023-09-11 01:15:31',38,'cero',1,11,0,1,'16fd4c24-bf22-436d-801c-7242c69abb2e',0),(61,'2023-09-11 01:16:16',NULL,0,'2023-09-11 01:16:16',38,'cero',1,15,0,1,'92a6b237-f310-4c16-aff6-455c3045a86c',0),(62,'2023-09-11 01:21:24',NULL,0,'2023-09-11 01:21:24',38,'cero',1,11,0,1,'fc913826-e955-41e6-bdab-3a88188ac647',0),(63,'2023-09-11 01:58:13',NULL,0,'2023-09-11 01:58:13',38,'cero',1,14,0,1,'7ece62b5-f922-4caf-9df0-d60820f0decc',0);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesdetails`
--

DROP TABLE IF EXISTS `salesdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesdetails` (
  `sadId` int(11) NOT NULL AUTO_INCREMENT,
  `sadCreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sadUpdatedAt` datetime DEFAULT NULL,
  `sadDeleted` smallint(6) NOT NULL DEFAULT '0',
  `sadProdId` int(11) NOT NULL,
  `sadProdDescription` varchar(191) CHARACTER SET utf8 NOT NULL,
  `sadProdPrice` double NOT NULL DEFAULT '0',
  `sadProdCount` double NOT NULL DEFAULT '0',
  `sadUseId` int(11) NOT NULL,
  `sadSalId` int(11) NOT NULL,
  `salLastItem` smallint(6) NOT NULL DEFAULT '0',
  `sadSubTotal` double NOT NULL DEFAULT '0',
  `sadKey` varchar(36) NOT NULL,
  `sadProdKey` varchar(45) NOT NULL DEFAULT '"-"',
  PRIMARY KEY (`sadId`),
  UNIQUE KEY `sadKey_UNIQUE` (`sadKey`),
  KEY `fk_salesdetails_sales1_idx` (`sadSalId`),
  CONSTRAINT `fk_salesdetails_sales1` FOREIGN KEY (`sadSalId`) REFERENCES `sales` (`salId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesdetails`
--

LOCK TABLES `salesdetails` WRITE;
/*!40000 ALTER TABLE `salesdetails` DISABLE KEYS */;
INSERT INTO `salesdetails` VALUES (107,'2023-07-23 04:35:42',NULL,0,6,'test3333333333333',10,4,1,1,0,40,'5797c4e8-e687-40df-b8fa-44e1dae09ac4','\"-\"'),(108,'2023-07-23 04:35:44',NULL,0,8,'rersr',3,3,1,1,0,9,'b87f6e53-d4d7-47f3-a93b-2922f5ccf28c','\"-\"'),(109,'2023-07-23 04:35:48',NULL,0,11,'22222222222222',2,2,1,1,0,4,'33dafd0d-4b5d-4b2a-8275-08dfe22173ea','\"-\"'),(110,'2023-07-23 04:36:28',NULL,0,5,'e',10,7,1,1,0,70,'8b208194-bccd-4ec1-b3ff-cd58e0b475f5','\"-\"'),(111,'2023-07-23 04:38:45',NULL,0,4,'prod1',10.5,2,1,1,0,21,'e84c898e-f0c9-41fd-ba60-41899e683677','\"-\"'),(112,'2023-07-23 04:43:30',NULL,0,13,'ssssss',10,2,1,1,0,20,'db2b4d28-eca9-45a2-9c95-d876fa12473e','\"-\"'),(113,'2023-07-24 18:37:32',NULL,0,3,'fdsf',3,2,1,1,0,6,'9f07250c-92b9-4da4-9e98-3ca4ccf87855','\"-\"'),(114,'2023-07-24 18:37:40',NULL,0,7,'wwwwwwwwwwwwwww',4,2,1,1,0,8,'17b9a98b-c835-48f5-969b-6e9c74b7048c','\"-\"'),(115,'2023-07-24 18:37:44',NULL,0,9,'wwwwwwwwwwwwwww',23,1,1,1,0,23,'d76a8285-d007-4e24-b261-1bc7880d5f57','\"-\"'),(116,'2023-07-24 18:37:46',NULL,0,10,'22222222222222',2,2,1,1,0,4,'671cfec7-1a03-4358-8d0b-28f8c1dd9977','\"-\"'),(117,'2023-07-24 18:37:50',NULL,0,12,'ssssss',10,1,1,1,0,10,'8f2e0d04-2599-498e-aa6b-3d3f13413664','\"-\"'),(118,'2023-08-11 16:49:21',NULL,0,14,'ssssss',10,2,1,1,0,20,'c649c401-6d26-403e-a966-9e8baa12fcf1','\"-\"'),(119,'2023-08-12 03:33:44',NULL,0,20,'ssssss',10,1,1,1,0,10,'a5c4d7cd-4281-4f4b-9d42-81528b99ee48','\"-\"'),(120,'2023-08-12 03:34:01',NULL,0,21,'0000',100,8,1,1,1,800,'ce1a5681-ab4e-481a-8e65-91251473406a','\"-\"'),(125,'2023-08-26 14:27:57',NULL,0,12,'ssssss',10,10,1,4,0,100,'6f6c1df0-5d18-4032-97cc-afc3831c9e54','\"-\"'),(126,'2023-08-26 15:58:36',NULL,0,8,'rersr',3,1,1,4,0,3,'a44afb97-544b-42cb-b77f-20825502e1d9','\"-\"'),(127,'2023-08-26 15:59:10',NULL,0,10,'22222222222222',2,2,1,4,0,4,'99ae8e48-29a9-4ad4-8a38-b6917f5b4a33','\"-\"'),(128,'2023-08-26 15:59:12',NULL,0,7,'wwwwwwwwwwwwwww',4,1,1,4,0,4,'2b172565-449a-4f01-ae4c-0d94970d6a82','\"-\"'),(129,'2023-08-26 15:59:13',NULL,0,5,'e',10,2,1,4,0,20,'8e842542-da66-4412-a1df-ce749b3fc423','\"-\"'),(130,'2023-08-26 15:59:15',NULL,0,17,'ssssss',10,1,1,4,0,10,'4c1dde7a-f773-405d-9dc0-5aa04502ef43','\"-\"'),(131,'2023-08-26 15:59:17',NULL,0,20,'ssssss',10,2,1,4,0,20,'20b2e7dd-6290-42ce-a4a5-4d8b96f61d65','\"-\"'),(132,'2023-08-26 15:59:25',NULL,0,3,'fdsf',3,1,1,4,0,3,'ccd87d70-7e84-40f8-a834-553314bde0f0','\"-\"'),(133,'2023-08-26 15:59:29',NULL,0,21,'0000',100,2,1,4,0,200,'2197d9b6-1e3b-463f-9e53-8c69583a3877','\"-\"'),(134,'2023-08-26 17:44:37',NULL,0,13,'ssssss',10,1,1,4,1,10,'c5645232-c8a5-483c-91c4-7c3477823ad6','\"-\"'),(135,'2023-08-27 03:43:24',NULL,0,10,'22222222222222',2,1,1,7,0,2,'81bbf423-11b3-4daf-9a54-8651d5108c42','\"-\"'),(136,'2023-08-27 03:43:26',NULL,0,9,'wwwwwwwwwwwwwww',23,1,1,7,1,23,'faf50739-e009-42e9-aac9-7b44b92c16d4','\"-\"'),(137,'2023-08-27 03:58:09',NULL,0,11,'22222222222222',2,1,1,8,0,2,'c570bcce-7384-48de-a140-76b1b6286c9d','\"-\"'),(138,'2023-08-27 03:58:11',NULL,0,12,'ssssss',10,1,1,8,0,10,'4e336063-17f1-439b-ba37-3e623e78e01f','\"-\"'),(139,'2023-08-27 03:58:13',NULL,0,5,'e',10,1,1,8,1,10,'5a8ec753-91c6-4c63-88f4-25780b8f7721','\"-\"'),(140,'2023-08-30 13:00:59',NULL,0,10,'22222222222222',2,1,1,9,0,2,'06077f87-430a-4936-82a2-63eb8b20e336','\"-\"'),(141,'2023-08-30 13:01:01',NULL,0,12,'ssssss',10,1,1,9,0,10,'931d31df-5636-44d1-b46b-b9e1e76a701e','\"-\"'),(142,'2023-08-30 13:01:03',NULL,0,17,'ssssss',10,1,1,9,1,10,'b5fafcb2-08a2-4815-8e88-d37e7787c58b','\"-\"'),(143,'2023-08-31 16:08:29',NULL,0,4,'prod1',10.5,1,1,10,0,10.5,'0600b1b2-fb72-47ae-8055-514be9ce4c32','\"-\"'),(144,'2023-08-31 16:08:31',NULL,0,8,'rersr',3,2,1,10,0,6,'8e1b5bd7-8892-4244-9991-303083b04a5d','\"-\"'),(145,'2023-08-31 16:08:33',NULL,0,6,'test3333333333333',10,1,1,10,0,10,'4a52425b-f3bb-46e3-b3cc-771b0aa3e15c','\"-\"'),(146,'2023-08-31 16:08:37',NULL,0,14,'ssssss',10,2,1,10,0,20,'7e738e67-4d0d-4c73-8658-f621fb414413','\"-\"'),(147,'2023-08-31 16:08:41',NULL,0,16,'ssssss',10,1,1,10,1,10,'7c9cb0a1-a751-486e-920b-729195c02e3b','\"-\"'),(148,'2023-08-31 16:10:44',NULL,0,4,'prod1',10.5,1,1,11,0,10.5,'dbde824d-8133-466c-b271-925d6e8dd98a','\"-\"'),(149,'2023-08-31 16:10:46',NULL,0,3,'fdsf',3,1,1,11,0,3,'d096441d-994e-45ce-bd98-b28350532a86','\"-\"'),(150,'2023-08-31 16:10:48',NULL,0,13,'ssssss',10,1,1,11,0,10,'d5de6e07-e9c6-434c-9ca2-cde728d1fdcf','\"-\"'),(151,'2023-08-31 16:10:50',NULL,0,7,'wwwwwwwwwwwwwww',4,1,1,11,0,4,'582785d6-7525-4b25-9905-cbfd7e5721c6','\"-\"'),(152,'2023-08-31 16:10:52',NULL,0,12,'ssssss',10,1,1,11,1,10,'299214ba-3cfb-4ff1-8531-ab9bf83c1745','\"-\"'),(153,'2023-08-31 17:12:21',NULL,0,7,'wwwwwwwwwwwwwww',4,1,1,12,0,4,'0b78de2e-2a14-41e3-96ad-8c6cd21a7cfd','\"-\"'),(155,'2023-08-31 17:12:53',NULL,0,16,'ssssss',10,1,1,12,0,10,'4e2b3c32-94e8-494c-b95a-ade603d85700','\"-\"'),(157,'2023-08-31 17:13:34',NULL,0,12,'ssssss',10,1,1,12,0,10,'00baae67-afec-4bc2-b38c-0fe4b4b562e5','\"-\"'),(158,'2023-08-31 17:13:56',NULL,0,15,'ssssss',10,1,1,12,1,10,'c607c9db-0959-4323-b896-145dfc2fdd60','\"-\"'),(159,'2023-08-31 17:45:04',NULL,0,4,'prod1',10.5,1,1,13,0,10.5,'b3ad842a-e77f-4471-ae46-3a3c5e9b0262','\"-\"'),(160,'2023-08-31 17:45:06',NULL,0,11,'22222222222222',2,1,1,13,0,2,'e9bb6c52-335d-4afd-bb57-831047c36fea','\"-\"'),(161,'2023-08-31 17:45:08',NULL,0,14,'ssssss',10,1,1,13,0,10,'90f47b39-5905-4a8f-b78f-cf24ee036c5e','\"-\"'),(162,'2023-08-31 17:45:09',NULL,0,19,'ssssss',10,1,1,13,0,10,'35a1a2e0-296f-47ce-b90e-5f70c7d896fb','\"-\"'),(163,'2023-09-02 22:01:17',NULL,1,3,'fdsf',3,3,1,17,0,9,'35a1a2e0-296f-47ce-b90e-5f7s0c7d896f','\"-\"'),(164,'2023-09-02 22:08:26',NULL,1,5,'e',10,1,1,17,0,10,'rew32fds fda','\"-\"'),(165,'2023-09-02 22:46:13',NULL,1,6,'test3333333333333',10,1,1,17,0,10,'ewqewqe','3413bc71-9901-405a-8482-50cdabcf22ad'),(166,'2023-09-02 22:46:25',NULL,1,17,'ssssss',10,2,1,17,1,20,'dsafsafdsadaws','338eed9c-84e0-4cce-bafc-56ce44881c2b'),(167,'2023-09-03 02:29:44',NULL,1,8,'rersr',3,1,1,18,0,3,'dsafdsafd','1caecf07-5101-4ee6-8fd8-f0ad9c90a009'),(168,'2023-09-03 03:17:22',NULL,1,7,'wwwwwwwwwwwwwww',4,1,1,18,0,4,'safdsafdsadsa','6d490df7-7072-420d-87ba-b4deb531120c'),(169,'2023-09-03 03:17:34',NULL,1,5,'e',10,3,1,18,0,30,'afdsafs','89cb0b4d-fe48-4920-929e-dfc725906047'),(170,'2023-09-03 03:17:40',NULL,1,4,'prod1',10.5,1,1,18,0,10.5,'dsafdsafds','437f0518-8fef-4634-a5e8-0506c22ea346'),(171,'2023-09-03 03:19:05',NULL,1,20,'ssssss',10,1,1,18,0,10,'afsdaff','fddc4fec-30f5-453f-a000-52ca998afb5a'),(172,'2023-09-03 03:22:40',NULL,1,9,'wwwwwwwwwwwwwww',23,1,1,18,0,23,'ewrewrew654343f','152e9a72-5250-49d0-8d1b-9f3ab165f00b'),(173,'2023-09-03 03:25:34',NULL,1,16,'ssssss',10,2,1,18,0,20,'dsfaesd','433e517e-c96a-4877-b4c8-bff02593c177'),(174,'2023-09-03 05:06:52',NULL,1,15,'ssssss',10,1,1,18,0,10,'fewrewrewrew','c7ae1981-b06f-402f-be54-bfc3ade379ed'),(175,'2023-09-03 05:07:53',NULL,1,10,'22222222222222',2,1,1,18,0,2,'rewrewr','71904974-eef4-4870-8a93-16bb041c22eb'),(176,'2023-09-03 05:25:02',NULL,1,12,'ssssss',10,2,1,18,0,20,'ewrewrewr','4ad3d4bb-6160-4209-b777-0989f54bd220'),(177,'2023-09-03 16:12:11',NULL,1,11,'22222222222222',2,1,1,18,0,2,'rewrewrewr','7a608fdd-4a60-47b4-89bd-dd978152802f'),(178,'2023-09-03 16:13:20',NULL,0,10,'22222222222222',2,1,1,18,0,2,'ewrewrew4tr3fd','71904974-eef4-4870-8a93-16bb041c22eb'),(179,'2023-09-03 16:13:30',NULL,0,20,'ssssss',10,1,1,18,0,10,'rewrewrew','fddc4fec-30f5-453f-a000-52ca998afb5a'),(180,'2023-09-03 16:13:39',NULL,0,3,'fdsf',3,1,1,18,0,3,'rewrew43fgdew','30d8c1ea-2e69-4512-95dc-8877a698886b'),(181,'2023-09-03 16:13:50',NULL,0,19,'ssssss',10,1,1,18,0,10,'rewrewrewrewqvf ew','3cbbcf6c-1ce5-4439-854e-35f038731ea5'),(182,'2023-09-03 16:13:57',NULL,0,11,'22222222222222',2,2,1,18,1,4,'rewrewrewre','7a608fdd-4a60-47b4-89bd-dd978152802f'),(183,'2023-09-04 16:50:05',NULL,0,8,'rersr',3,1,1,19,0,3,'7ebed7ad-a716-4d0a-b487-5fe4cb5281c3','1caecf07-5101-4ee6-8fd8-f0ad9c90a009'),(184,'2023-09-04 16:50:18',NULL,0,12,'ssssss',10,1,1,19,0,10,'d87fc094-88ca-41cc-bff6-7ab5f99126c3','4ad3d4bb-6160-4209-b777-0989f54bd220'),(185,'2023-09-04 16:50:28',NULL,0,4,'prod1',10.5,1,1,19,1,10.5,'a97b4974-59d6-4dba-9448-f355b6b0f1ee','437f0518-8fef-4634-a5e8-0506c22ea346'),(186,'2023-09-04 16:58:29',NULL,0,5,'e',10,1,1,20,0,10,'b3f6cb00-61d3-4426-9014-91f12ec25af1','89cb0b4d-fe48-4920-929e-dfc725906047'),(187,'2023-09-04 16:58:49',NULL,0,3,'fdsf',3,1,1,20,0,3,'7e447a2e-5418-4a69-a6e5-7cba88daadbd','30d8c1ea-2e69-4512-95dc-8877a698886b'),(188,'2023-09-04 16:58:59',NULL,0,21,'0000',100,1,1,20,0,100,'03e3d618-fba5-4f68-8f0c-cb21d9083459','58dbd21f-1890-4050-aac7-7d474ba4338a'),(189,'2023-09-04 16:59:16',NULL,0,6,'test3333333333333',10,1,1,20,1,10,'b441c84e-7b49-47a6-bf33-c593908ebedb','3413bc71-9901-405a-8482-50cdabcf22ad'),(190,'2023-09-04 17:04:26',NULL,0,12,'ssssss',10,1,1,21,0,10,'4029859c-d7e1-4347-8879-96f5828ba7e4','4ad3d4bb-6160-4209-b777-0989f54bd220'),(191,'2023-09-04 17:04:40',NULL,0,16,'ssssss',10,1,1,21,0,10,'9bee30f2-e473-41f3-a3d0-4a094c783058','433e517e-c96a-4877-b4c8-bff02593c177'),(192,'2023-09-04 17:04:48',NULL,0,20,'ssssss',10,1,1,21,0,10,'cc2f2e53-ba23-4520-9cac-7c95af8204ea','fddc4fec-30f5-453f-a000-52ca998afb5a'),(193,'2023-09-04 17:05:09',NULL,0,18,'ssssss',10,1,1,21,0,10,'ad8cd895-e0db-4d19-9d94-8544f6547019','4870187a-3d6e-441d-b5f8-f1c41e8e353a'),(194,'2023-09-04 17:05:20',NULL,0,21,'0000',100,5,1,21,1,500,'61775b1c-b4a4-420d-af19-dc5de2eef466','58dbd21f-1890-4050-aac7-7d474ba4338a'),(195,'2023-09-06 03:47:24',NULL,0,3,'fdsf',3,1,1,22,1,3,'db2aca8d-baa4-4192-bcaf-ab4fef476c40','30d8c1ea-2e69-4512-95dc-8877a698886b'),(196,'2023-09-06 19:46:47',NULL,0,3,'fdsf',3,1,1,23,1,3,'95c64504-8761-45a4-bde4-ab2e1e8f572a','30d8c1ea-2e69-4512-95dc-8877a698886b'),(197,'2023-09-06 20:09:06',NULL,0,4,'prod1',10.5,1,1,24,1,10.5,'707666a7-9783-407c-abd5-8bf795b6b111','437f0518-8fef-4634-a5e8-0506c22ea346'),(198,'2023-09-06 23:16:05',NULL,0,4,'prod1',10.5,1,1,25,0,10.5,'d28958da-6395-4997-b163-a0b6a7a3cbc1','437f0518-8fef-4634-a5e8-0506c22ea346'),(199,'2023-09-06 23:16:30',NULL,0,8,'rersr',3,1,1,25,1,3,'2633223b-4998-4d25-81ee-fcf3cbc19d10','1caecf07-5101-4ee6-8fd8-f0ad9c90a009'),(200,'2023-09-07 00:50:52',NULL,0,3,'fdsf',3,1,1,26,0,3,'8c333ee1-4e2c-4146-bf15-6620b9367ac4','30d8c1ea-2e69-4512-95dc-8877a698886b'),(201,'2023-09-07 00:51:02',NULL,0,4,'prod1',10.5,1,1,26,0,10.5,'2f5469a4-3bc0-4bf5-bb8b-5eeb6746ceb2','437f0518-8fef-4634-a5e8-0506c22ea346'),(202,'2023-09-07 00:51:15',NULL,0,6,'test3333333333333',10,1,1,26,0,10,'02695cf7-a951-4c72-919c-fec13b0cc755','3413bc71-9901-405a-8482-50cdabcf22ad'),(203,'2023-09-07 00:51:31',NULL,0,9,'wwwwwwwwwwwwwww',23,1,1,26,0,23,'74d3fabb-e84a-4b5c-98d1-593df0f178ce','152e9a72-5250-49d0-8d1b-9f3ab165f00b'),(204,'2023-09-07 00:51:41',NULL,0,12,'ssssss',10,2,1,26,0,20,'ea1e5161-5ffe-4fb1-a36e-08c64a230a58','4ad3d4bb-6160-4209-b777-0989f54bd220'),(205,'2023-09-07 00:51:53',NULL,0,22,'43243242',4,1,1,26,0,4,'cbebf5b0-e1bc-40b2-9290-0cac31ca7f30','675ad8a1-5297-413d-b311-15773682428b'),(206,'2023-09-07 00:52:06',NULL,0,21,'0000',100,1,1,26,0,100,'dfe7df17-b81e-4bfc-ab52-3896044346ea','58dbd21f-1890-4050-aac7-7d474ba4338a'),(207,'2023-09-07 00:52:22',NULL,0,20,'ssssss',10,1,1,26,0,10,'fb646fe4-1da7-45b7-b9f8-e56ae5348a40','fddc4fec-30f5-453f-a000-52ca998afb5a'),(208,'2023-09-07 00:52:41',NULL,0,17,'ssssss',10,1,1,26,0,10,'70f32ddc-ec0b-4d12-92e6-a24792bea7c9','338eed9c-84e0-4cce-bafc-56ce44881c2b'),(209,'2023-09-07 00:53:16',NULL,0,24,'treter',5,2,1,26,0,10,'dbcdc4f2-48cb-46f5-8bbf-e27e4f93067d','c8dcc6e7-eac3-4010-a545-3b44d0573789'),(210,'2023-09-07 00:54:14',NULL,0,10,'22222222222222',2,1,1,26,0,2,'c2a7b534-15b5-444b-861c-02864e19594c','71904974-eef4-4870-8a93-16bb041c22eb'),(211,'2023-09-07 00:54:23',NULL,0,11,'22222222222222',2,1,1,26,1,2,'c71c5c91-24a3-4720-9227-1e64c22f8136','7a608fdd-4a60-47b4-89bd-dd978152802f'),(212,'2023-09-07 23:47:25',NULL,1,3,'fdsf',3,1,1,27,0,3,'8173119c-049a-45d8-a73b-842b1e751957','30d8c1ea-2e69-4512-95dc-8877a698886b'),(213,'2023-09-08 14:01:11',NULL,1,3,'fdsf',3,2,1,27,0,6,'92523f93-cae2-4561-acbb-07b6cb47b8fc','30d8c1ea-2e69-4512-95dc-8877a698886b'),(214,'2023-09-08 14:06:15',NULL,0,3,'fdsf',3,1,1,27,0,3,'e542e14e-3031-4fa7-8bf1-371cc986273c','30d8c1ea-2e69-4512-95dc-8877a698886b'),(215,'2023-09-08 18:50:12',NULL,0,6,'test3333333333333',10,30,1,27,0,300,'c2867322-3aae-4e5f-872e-3c126a209d95','3413bc71-9901-405a-8482-50cdabcf22ad'),(216,'2023-09-08 18:50:17',NULL,0,12,'ssssss',10,6,1,27,0,60,'c5276459-ba61-470b-9239-9d9f54b2f7f7','4ad3d4bb-6160-4209-b777-0989f54bd220'),(217,'2023-09-08 19:06:53',NULL,0,18,'ssssss',10,86,1,27,0,860,'a3ef928b-54ca-4f18-9c33-bf9b3f638846','4870187a-3d6e-441d-b5f8-f1c41e8e353a'),(218,'2023-09-08 19:49:18',NULL,0,23,'xxxxxxxxxxxxx',3,1,1,27,0,3,'53074e7c-cfd9-43d1-be7f-3e6b0d45db36','01a7c7ff-606d-4fb5-b23f-8631a87c4dac'),(219,'2023-09-08 19:52:14',NULL,0,11,'22222222222222',2,2,1,27,0,4,'2f5de5cc-06cf-4b0c-ae8b-78a0fba1a5df','7a608fdd-4a60-47b4-89bd-dd978152802f'),(220,'2023-09-08 21:55:46',NULL,0,5,'e',10,1,1,27,1,10,'ce67b59c-f204-43c6-97b3-c10506ce983e','89cb0b4d-fe48-4920-929e-dfc725906047'),(221,'2023-09-10 02:12:40',NULL,0,3,'fdsf',3.5,1,1,49,1,3.5,'bb95cad1-7332-4b38-8820-4d8b35d541f9','30d8c1ea-2e69-4512-95dc-8877a698886b'),(227,'2023-09-11 00:32:51',NULL,0,3,'fdsf',3.5,1,1,52,1,3.5,'539dc18f-290b-4f0c-a012-5189a4930d69','30d8c1ea-2e69-4512-95dc-8877a698886b'),(228,'2023-09-11 00:32:51',NULL,0,3,'fdsf',3.5,1,1,52,1,3.5,'d16cfd5e-0d53-46a8-9abe-00280f001d2a','30d8c1ea-2e69-4512-95dc-8877a698886b'),(230,'2023-09-11 00:36:32',NULL,0,3,'fdsf',3.5,1,1,53,1,3.5,'cfc9658a-3a44-40da-b495-cccfc3c2a1f8','30d8c1ea-2e69-4512-95dc-8877a698886b'),(231,'2023-09-11 00:36:32',NULL,0,3,'fdsf',3.5,1,1,53,1,3.5,'14c9e67e-b34b-4d26-bc97-d64a16cb1c92','30d8c1ea-2e69-4512-95dc-8877a698886b'),(232,'2023-09-11 00:36:32',NULL,0,3,'fdsf',3.5,1,1,53,1,3.5,'a93ef3b2-7b4e-4f04-a8cd-12ff4945d3fc','30d8c1ea-2e69-4512-95dc-8877a698886b'),(233,'2023-09-11 00:36:32',NULL,0,3,'fdsf',3.5,1,1,53,1,3.5,'72836d97-d063-41b4-a238-4744d3b350bd','30d8c1ea-2e69-4512-95dc-8877a698886b'),(234,'2023-09-11 00:41:17',NULL,0,3,'fdsf',3.5,1,1,54,1,3.5,'aabb63d2-3e9b-47b9-a463-141219da9d0f','30d8c1ea-2e69-4512-95dc-8877a698886b'),(235,'2023-09-11 00:41:17',NULL,0,3,'fdsf',3.5,1,1,54,1,3.5,'4dab5ce1-abc4-4c44-aeef-951e50a1d89d','30d8c1ea-2e69-4512-95dc-8877a698886b'),(236,'2023-09-11 00:41:17',NULL,0,3,'fdsf',3.5,1,1,54,1,3.5,'3bd42718-7c68-44d4-9fbc-8f7a26db8db7','30d8c1ea-2e69-4512-95dc-8877a698886b'),(238,'2023-09-11 00:41:17',NULL,0,3,'fdsf',3.5,1,1,54,1,3.5,'cb8352d8-77a4-4180-960b-6866db634178','30d8c1ea-2e69-4512-95dc-8877a698886b'),(239,'2023-09-11 00:46:39',NULL,0,3,'fdsf',3.5,1,1,55,1,3.5,'1d521e9f-d097-4c3b-9ab2-f8079af5d7e7','30d8c1ea-2e69-4512-95dc-8877a698886b'),(240,'2023-09-11 00:46:39',NULL,0,3,'fdsf',3.5,1,1,55,1,3.5,'b530483c-8a2d-4176-9093-bdd713879e7c','30d8c1ea-2e69-4512-95dc-8877a698886b'),(241,'2023-09-11 00:46:39',NULL,0,3,'fdsf',3.5,1,1,55,1,3.5,'bb7140ed-00ae-4c4d-a5bf-7e1c530acf90','30d8c1ea-2e69-4512-95dc-8877a698886b'),(242,'2023-09-11 00:46:39',NULL,0,3,'fdsf',3.5,1,1,55,1,3.5,'171eda56-0fd1-4911-ab66-37fc8326a0f8','30d8c1ea-2e69-4512-95dc-8877a698886b'),(243,'2023-09-11 00:46:39',NULL,0,3,'fdsf',3.5,1,1,55,1,3.5,'7658f441-8312-44ad-aa94-25aaf4ffddbd','30d8c1ea-2e69-4512-95dc-8877a698886b'),(244,'2023-09-11 00:50:49',NULL,0,3,'fdsf',3.5,1,1,56,1,3.5,'b77f2d34-7aed-495d-91e7-2c3ffb7ffb3d','30d8c1ea-2e69-4512-95dc-8877a698886b'),(245,'2023-09-11 00:50:49',NULL,0,3,'fdsf',3.5,1,1,56,1,3.5,'9c181919-2ea5-4fcc-a226-98fed51ef0b3','30d8c1ea-2e69-4512-95dc-8877a698886b'),(246,'2023-09-11 00:50:49',NULL,0,3,'fdsf',3.5,1,1,56,1,3.5,'b91bc79c-3133-4511-8af8-0afd7682197b','30d8c1ea-2e69-4512-95dc-8877a698886b'),(247,'2023-09-11 00:50:49',NULL,0,3,'fdsf',3.5,1,1,56,1,3.5,'22389a49-7037-4b8f-8cd6-e1453a2a331e','30d8c1ea-2e69-4512-95dc-8877a698886b'),(248,'2023-09-11 00:50:49',NULL,0,3,'fdsf',3.5,1,1,56,1,3.5,'ca95d0b8-2c43-4de3-87de-5896e09c60d1','30d8c1ea-2e69-4512-95dc-8877a698886b'),(249,'2023-09-11 00:50:49',NULL,0,3,'fdsf',3.5,1,1,56,1,3.5,'2604836e-05da-42d7-8c7e-69fc9a9ebc70','30d8c1ea-2e69-4512-95dc-8877a698886b'),(250,'2023-09-11 00:50:49',NULL,0,3,'fdsf',3.5,1,1,56,1,3.5,'e31649fa-4250-4828-8683-a9dfe2771242','30d8c1ea-2e69-4512-95dc-8877a698886b'),(251,'2023-09-11 00:50:49',NULL,0,3,'fdsf',3.5,1,1,56,1,3.5,'190f057a-70a4-4aef-91d3-e890410d410f','30d8c1ea-2e69-4512-95dc-8877a698886b'),(252,'2023-09-11 00:50:49',NULL,0,3,'fdsf',3.5,1,1,56,1,3.5,'9775d2e2-77b8-405a-9246-4d717540e510','30d8c1ea-2e69-4512-95dc-8877a698886b'),(253,'2023-09-11 00:50:49',NULL,0,3,'fdsf',3.5,1,1,56,1,3.5,'af5efdd0-6e25-4572-9afd-34f3a963e4dd','30d8c1ea-2e69-4512-95dc-8877a698886b'),(254,'2023-09-11 01:01:57',NULL,0,3,'fdsf',3.5,1,1,57,1,3.5,'35eae35c-d420-410a-9cfd-5b8c621b62e6','30d8c1ea-2e69-4512-95dc-8877a698886b'),(255,'2023-09-11 01:01:57',NULL,0,3,'fdsf',3.5,1,1,57,1,3.5,'735eba31-f632-4096-a635-3e93b1804df2','30d8c1ea-2e69-4512-95dc-8877a698886b'),(256,'2023-09-11 01:01:57',NULL,0,3,'fdsf',3.5,1,1,57,1,3.5,'e14dccc2-f112-4c15-b9d2-ac9a10acd630','30d8c1ea-2e69-4512-95dc-8877a698886b'),(257,'2023-09-11 01:01:57',NULL,0,3,'fdsf',3.5,1,1,57,1,3.5,'f7abbdf1-a265-4a1d-a14e-dc636f5b093f','30d8c1ea-2e69-4512-95dc-8877a698886b'),(258,'2023-09-11 01:01:57',NULL,0,3,'fdsf',3.5,1,1,57,1,3.5,'f49cb3f0-508f-48ea-a633-9c2579e8cb76','30d8c1ea-2e69-4512-95dc-8877a698886b'),(259,'2023-09-11 01:01:57',NULL,0,3,'fdsf',3.5,1,1,57,1,3.5,'e2aaaa84-75e1-418a-b9a4-b9bef5878049','30d8c1ea-2e69-4512-95dc-8877a698886b'),(260,'2023-09-11 01:01:57',NULL,0,3,'fdsf',3.5,1,1,57,1,3.5,'b2671281-e659-4fea-b3f6-c9a4b2f0bb45','30d8c1ea-2e69-4512-95dc-8877a698886b'),(261,'2023-09-11 01:01:57',NULL,0,3,'fdsf',3.5,1,1,57,1,3.5,'e30c8a8f-ad80-470f-b341-1f8d60f7d34f','30d8c1ea-2e69-4512-95dc-8877a698886b'),(262,'2023-09-11 01:01:57',NULL,0,3,'fdsf',3.5,1,1,57,1,3.5,'b4871c38-63b4-4382-9b68-d3938b154d7e','30d8c1ea-2e69-4512-95dc-8877a698886b'),(263,'2023-09-11 01:01:57',NULL,0,3,'fdsf',3.5,1,1,57,1,3.5,'d90ac6b8-cb18-4ea4-8fe4-d3740aee5b63','30d8c1ea-2e69-4512-95dc-8877a698886b'),(264,'2023-09-11 01:02:22',NULL,0,3,'fdsf',3.5,1,1,58,1,3.5,'d3a05174-1f6a-4612-9dd1-503c841c7064','30d8c1ea-2e69-4512-95dc-8877a698886b'),(265,'2023-09-11 01:02:22',NULL,0,3,'fdsf',3.5,1,1,58,1,3.5,'4d799ad4-bf2a-4524-9619-3d01aeda8efe','30d8c1ea-2e69-4512-95dc-8877a698886b'),(266,'2023-09-11 01:02:22',NULL,0,3,'fdsf',3.5,1,1,58,1,3.5,'60f5346e-c3a9-43a7-9b12-5aeb7971fe77','30d8c1ea-2e69-4512-95dc-8877a698886b'),(267,'2023-09-11 01:02:22',NULL,0,3,'fdsf',3.5,1,1,58,1,3.5,'056ea8d4-f8fe-4dcc-a726-700159271edf','30d8c1ea-2e69-4512-95dc-8877a698886b'),(268,'2023-09-11 01:02:22',NULL,0,3,'fdsf',3.5,1,1,58,1,3.5,'436f7f52-5ec3-42d3-ad12-cd14f82336d8','30d8c1ea-2e69-4512-95dc-8877a698886b'),(269,'2023-09-11 01:02:22',NULL,0,3,'fdsf',3.5,1,1,58,1,3.5,'76882dae-d994-4bbb-a040-8042e4bc0a36','30d8c1ea-2e69-4512-95dc-8877a698886b'),(270,'2023-09-11 01:02:22',NULL,0,3,'fdsf',3.5,1,1,58,1,3.5,'daef9392-b4dd-4d70-9a0e-e2041960714a','30d8c1ea-2e69-4512-95dc-8877a698886b'),(271,'2023-09-11 01:02:22',NULL,0,3,'fdsf',3.5,1,1,58,1,3.5,'8d30b2e7-8fdb-4e11-9c71-392be89c4b00','30d8c1ea-2e69-4512-95dc-8877a698886b'),(272,'2023-09-11 01:02:22',NULL,0,3,'fdsf',3.5,1,1,58,1,3.5,'2fae6d84-0105-4378-9fec-67ae3ff6f604','30d8c1ea-2e69-4512-95dc-8877a698886b'),(273,'2023-09-11 01:02:22',NULL,0,3,'fdsf',3.5,1,1,58,1,3.5,'8a723d8e-bfa5-44af-8261-9da3927e2486','30d8c1ea-2e69-4512-95dc-8877a698886b'),(274,'2023-09-11 01:04:50',NULL,0,12,'ssssss',10,2,1,59,1,20,'d7b51f5d-09c2-479f-9b4a-c6715864fe47','4ad3d4bb-6160-4209-b777-0989f54bd220'),(275,'2023-09-11 01:04:50',NULL,0,9,'wwwwwwwwwwwwwww',23,1,1,59,1,23,'e8abd246-ae54-42b5-8225-9c20844f7e7f','152e9a72-5250-49d0-8d1b-9f3ab165f00b'),(276,'2023-09-11 01:04:50',NULL,0,22,'43243242',4,2,1,59,1,8,'9130856c-1321-47f2-9570-169ae9cb4578','675ad8a1-5297-413d-b311-15773682428b'),(277,'2023-09-11 01:04:50',NULL,0,13,'ssssss',10,1,1,59,1,10,'884ad3ea-5f15-46e7-9106-a950c8142443','dcf76adb-1394-4f6f-b82b-4b45bc8be03e'),(278,'2023-09-11 01:04:50',NULL,0,8,'rersr',3,2,1,59,1,6,'a784778f-b00b-4f4d-b0f0-31b3a5dff788','1caecf07-5101-4ee6-8fd8-f0ad9c90a009'),(279,'2023-09-11 01:04:50',NULL,0,5,'e',10.5,2,1,59,1,21,'230779ba-a42f-4f8f-b4a3-c7c3619e80b6','89cb0b4d-fe48-4920-929e-dfc725906047'),(280,'2023-09-11 01:04:50',NULL,0,16,'ssssss',10,1,1,59,1,10,'c10a92e9-4dee-4698-8a39-4e435c025b17','433e517e-c96a-4877-b4c8-bff02593c177'),(281,'2023-09-11 01:04:50',NULL,0,17,'ssssss',10,1,1,59,1,10,'1204e9c3-40fc-4659-9837-027a946fde3a','338eed9c-84e0-4cce-bafc-56ce44881c2b'),(282,'2023-09-11 01:04:50',NULL,0,18,'ssssss',10,1,1,59,1,10,'439df1ed-03f2-4f88-bec0-f23f2067794e','4870187a-3d6e-441d-b5f8-f1c41e8e353a'),(283,'2023-09-11 01:04:50',NULL,0,3,'fdsf',3.5,1,1,59,1,3.5,'4e937228-cd6d-4e14-a7a2-bad0280792e8','30d8c1ea-2e69-4512-95dc-8877a698886b'),(284,'2023-09-11 01:15:31',NULL,0,12,'ssssss',10,2,1,60,1,20,'7586d684-8284-426d-8a82-30114cc2ec3b','4ad3d4bb-6160-4209-b777-0989f54bd220'),(285,'2023-09-11 01:15:31',NULL,0,9,'wwwwwwwwwwwwwww',23,1,1,60,1,23,'7faca91e-72a3-4e63-a735-3473814e9f78','152e9a72-5250-49d0-8d1b-9f3ab165f00b'),(286,'2023-09-11 01:15:31',NULL,0,22,'43243242',4,2,1,60,1,8,'0e3ef58a-613c-47ff-99d2-e6a80b964f45','675ad8a1-5297-413d-b311-15773682428b'),(287,'2023-09-11 01:15:31',NULL,0,13,'ssssss',10,1,1,60,1,10,'ea8c84ee-f782-48fe-add4-9626657c432f','dcf76adb-1394-4f6f-b82b-4b45bc8be03e'),(288,'2023-09-11 01:15:31',NULL,0,8,'rersr',3,2,1,60,1,6,'223e7294-c400-43fd-802f-59d637983d9a','1caecf07-5101-4ee6-8fd8-f0ad9c90a009'),(289,'2023-09-11 01:15:31',NULL,0,5,'e',10.5,2,1,60,1,21,'65a79cfc-48d9-40da-a4db-8d414510a56c','89cb0b4d-fe48-4920-929e-dfc725906047'),(290,'2023-09-11 01:15:31',NULL,0,16,'ssssss',10,1,1,60,1,10,'f71a8f52-62e9-482d-9aeb-e79acef6f9a8','433e517e-c96a-4877-b4c8-bff02593c177'),(291,'2023-09-11 01:15:31',NULL,0,17,'ssssss',10,1,1,60,1,10,'8aa74d6a-e772-4261-9a9b-d1cf155505ff','338eed9c-84e0-4cce-bafc-56ce44881c2b'),(292,'2023-09-11 01:15:31',NULL,0,18,'ssssss',10,1,1,60,1,10,'1da86313-cf6d-4b74-82a1-b66e384b3d3a','4870187a-3d6e-441d-b5f8-f1c41e8e353a'),(293,'2023-09-11 01:15:31',NULL,0,3,'fdsf',3.5,1,1,60,1,3.5,'8e13116f-581c-4d25-9ff1-4d90753deb3a','30d8c1ea-2e69-4512-95dc-8877a698886b'),(294,'2023-09-11 01:16:16',NULL,0,16,'ssssss',10,1,1,61,1,10,'a000ff4e-3167-4223-b9e0-805168385d3d','433e517e-c96a-4877-b4c8-bff02593c177'),(295,'2023-09-11 01:16:16',NULL,0,12,'ssssss',10,1,1,61,1,10,'5e6abca6-2aa4-42c8-a54f-bcd7a02510f3','4ad3d4bb-6160-4209-b777-0989f54bd220'),(296,'2023-09-11 01:16:16',NULL,0,8,'rersr',3,1,1,61,1,3,'cdf5c245-fbbe-4fa0-9557-361b977f22f0','1caecf07-5101-4ee6-8fd8-f0ad9c90a009'),(297,'2023-09-11 01:21:25',NULL,0,6,'test3333333333333',10,1,1,62,1,10,'3c1a5f57-d092-4c26-9656-2591618f8d75','3413bc71-9901-405a-8482-50cdabcf22ad'),(298,'2023-09-11 01:58:13',NULL,0,5,'e',10.5,1,1,63,1,10.5,'67867b38-2357-41d5-be9a-5d11a8d9bca4','89cb0b4d-fe48-4920-929e-dfc725906047'),(299,'2023-09-11 01:58:13',NULL,0,7,'wwwwwwwwwwwwwww',4,1,1,63,1,4,'182be305-ef51-4237-9f29-945e673ee1d3','6d490df7-7072-420d-87ba-b4deb531120c'),(300,'2023-09-11 01:58:13',NULL,0,13,'ssssss',10,1,1,63,1,10,'4a744c15-9d15-4f39-b6f8-4b6ed718eab9','dcf76adb-1394-4f6f-b82b-4b45bc8be03e'),(301,'2023-09-11 01:58:13',NULL,0,3,'fdsf',3.5,1,1,63,1,3.5,'d78ba735-a1b7-47dd-9dd7-f0eb31e9de74','30d8c1ea-2e69-4512-95dc-8877a698886b'),(302,'2023-09-11 01:58:13',NULL,0,18,'ssssss',10,1,1,63,1,10,'9f8bc5e0-4182-4ff6-b109-283da5f7a7b3','4870187a-3d6e-441d-b5f8-f1c41e8e353a');
/*!40000 ALTER TABLE `salesdetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sace4948_system`@`%`*/ /*!50003 TRIGGER `sace4948_system`.`salesdetails_AFTER_INSERT` AFTER INSERT ON `salesdetails` FOR EACH ROW
BEGIN
	DECLARE sadProId INT DEFAULT 0;
	DECLARE sadsalId INT DEFAULT 0;
    set sadProId  = NEW.sadprodid;	
    set sadsalId= NEW.sadsalid;

      CALL Updatestockproduct(sadProId);
	  CALL UpdateTotalSales(sadsalId);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sace4948_system`@`%`*/ /*!50003 TRIGGER `sace4948_system`.`salesdetails_AFTER_DELETE` AFTER DELETE ON `salesdetails` FOR EACH ROW
BEGIN
	DECLARE sadProId  INT default 0; 	
	DECLARE sadsalId  INT default 0;
    
    set sadProId = OLD.sadprodid;  
    set sadsalId  =OLD.sadsalid;
      call Updatestockproduct (sadProId);
	   call UpdateTotalSales (sadsalId);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `salesview`
--

DROP TABLE IF EXISTS `salesview`;
/*!50001 DROP VIEW IF EXISTS `salesview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `salesview` AS SELECT 
 1 AS `salId`,
 1 AS `salCreatedAt`,
 1 AS `salUpdatedAt`,
 1 AS `salDeleted`,
 1 AS `salDate`,
 1 AS `salLiteral`,
 1 AS `salComId`,
 1 AS `salCliId`,
 1 AS `salClose`,
 1 AS `salUseId`,
 1 AS `salKey`,
 1 AS `salDescuento`,
 1 AS `total`,
 1 AS `totalDesc`,
 1 AS `totalWithDesc`,
 1 AS `totalPayment`,
 1 AS `due`,
 1 AS `cliFirstName`,
 1 AS `cliLastName`,
 1 AS `cliKey`,
 1 AS `rutName`,
 1 AS `hasDeuda`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `secId` int(11) NOT NULL AUTO_INCREMENT,
  `secKey` varchar(36) NOT NULL,
  `secCreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `secUpdateAt` datetime DEFAULT NULL,
  `secDeleted` smallint(6) NOT NULL DEFAULT '0',
  `secName` varchar(50) CHARACTER SET utf8 NOT NULL,
  `secDescription` varchar(50) CHARACTER SET utf8 NOT NULL,
  `secComId` int(11) NOT NULL,
  PRIMARY KEY (`secId`),
  UNIQUE KEY `secKey_UNIQUE` (`secKey`),
  KEY `fk_Sections_companys1_idx` (`secComId`),
  CONSTRAINT `fk_Sections_companys1` FOREIGN KEY (`secComId`) REFERENCES `companys` (`comId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,'3e02f6a1-dbc9-4399-9596-aa737e744a81','2023-08-24 12:49:11',NULL,0,'Seccion 1','section 1',1),(2,'455942e2-2073-4b42-b4d5-cec071c5d6fe','2023-08-24 12:53:00',NULL,0,'Seccion 2','Seccion 2',1);
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `useId` int(11) NOT NULL AUTO_INCREMENT,
  `useCreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `useUpdatedAt` datetime DEFAULT NULL,
  `useDeleted` smallint(6) NOT NULL DEFAULT '0',
  `useName` varchar(191) CHARACTER SET utf8 NOT NULL,
  `usePassword` varchar(191) CHARACTER SET utf8 NOT NULL,
  `useEmail` varchar(191) CHARACTER SET utf8 NOT NULL,
  `useComId` int(11) NOT NULL,
  `useKey` varchar(36) NOT NULL,
  `useRole` varchar(45) NOT NULL DEFAULT 'usuario',
  PRIMARY KEY (`useId`),
  UNIQUE KEY `useKey_UNIQUE` (`useKey`),
  KEY `fk_users_companys1_idx` (`useComId`),
  CONSTRAINT `fk_users_companys1` FOREIGN KEY (`useComId`) REFERENCES `companys` (`comId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2023-01-26 22:13:39',NULL,0,'milton','milton','milton.guty@gmail.comfghjfgjh',1,'38980c16-971e-426b-8e3e-8ad87deb36ca','usuario'),(4,'2023-08-06 21:33:13',NULL,0,'milton','miltonsss','milton',1,'f1480867-8a57-462c-ba34-9c2296af4656','usuario'),(5,'2023-08-07 01:34:31',NULL,1,'0000','0000','milton.guty@gmail.com',1,'bfdfb0f5-fd7a-42ff-8a93-8e787d77cde9','usuario'),(6,'2023-08-07 02:52:42',NULL,1,'miltonguty','miltonguty','72297259',1,'e6820a5e-f9d2-43f5-8d50-482647795d9a','usuario'),(1002,'2023-09-01 15:17:59',NULL,0,'miltonXXXXXXXXXXXX','miltonXXXXXXXXXXXX','milton.guty@gmail.com',1,'e6a6efb8-2265-4e48-9d76-b06c56b61675','usuario'),(1003,'2023-09-01 15:18:16',NULL,0,'miltonXXXXXXXXXXXX','miltonXXXXXXXXXXXX','milton.guty@gmail.com',1,'f31055b3-b1eb-4a00-99e9-3c7c5a4b03f8','usuario'),(1004,'2023-09-01 15:18:29',NULL,0,'miltonXXXXXXXXXXXX','miltonXXXXXXXXXXXX','milton.guty@gmail.com',1,'29488c4c-ffb3-4e79-89a1-02df633c45bf','usuario'),(1005,'2023-09-01 15:21:28',NULL,0,'333333','333333','milton.guty@gmail.com',1,'da7aacc2-f57f-4b56-927b-21065deed338','usuario'),(1006,'2023-09-01 15:21:59',NULL,0,'test','test','testfsdfds',1,'c3ba9b74-882e-4cff-9ed5-c0730edf27f5','usuario'),(1007,'2023-09-01 15:32:59',NULL,0,'leidySSSS','leidy','lfcdsfsdafdsfdsXXXX',1,'9378f939-78b9-4a29-80a4-dee1e64758f2','usuario'),(1008,'2023-09-03 21:40:21',NULL,0,'66666','66666','6666666',2,'9378f939-78b9-4a29-80a4-dee1e64758f3','usuario');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sace4948_system'
--

--
-- Dumping routines for database 'sace4948_system'
--
/*!50003 DROP FUNCTION IF EXISTS `GETTOTALDESCUENTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sace4948_system`@`%` FUNCTION `GETTOTALDESCUENTO`(salesId int) RETURNS decimal(10,2)
BEGIN
declare salDesc  float;
set salDesc = (select salDescuento from sales where salId=salesId);
RETURN (salDesc * (SELECT GETTOTALNOTESALES(salesId)) / 100) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GETTOTALDUEBYSALID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sace4948_system`@`%` FUNCTION `GETTOTALDUEBYSALID`(salid int) RETURNS float
BEGIN
DECLARE TOTAL_DUE FLOAT;
SET TOTAL_DUE =( (SELECT GETTOTALNOTESALES(salId)) - (SELECT GETTOTALDESCUENTO(salId)) - (SELECT GETTOTALPAYMENT(salId)));
RETURN IFNULL(TOTAL_DUE,0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetTotalNoteSales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sace4948_system`@`%` FUNCTION `GetTotalNoteSales`(salesId Int) RETURNS float
BEGIN

DECLARE TOTAL_NOTE FLOAT;
SET TOTAL_NOTE= (SELECT 
                SUM(`salesdetails`.`sadSubTotal`) AS `total`
            FROM
                `salesdetails`
            WHERE
                `salesdetails`.`sadSalId` = salesId AND `salesdetails`.`sadDeleted` = 0) ;
RETURN IFNULL(TOTAL_NOTE,0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GETTOTALPAYMENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sace4948_system`@`%` FUNCTION `GETTOTALPAYMENT`(salId int ) RETURNS float
BEGIN
DECLARE TOTAL_PAYMENT  FLOAT;
SET TOTAL_PAYMENT = (SELECT IFNULL(SUM(`payments`.`payMount`), 0) AS `totalPayment` FROM `payments` WHERE `payments`.`paySalId` = salId and payDeleted = 0);
RETURN ifnull( TOTAL_PAYMENT ,0);               
                
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GETTOTALWITHDUE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sace4948_system`@`%` FUNCTION `GETTOTALWITHDUE`(cliId int ) RETURNS float
BEGIN
DECLARE TOTAL_NOTES float ;
DECLARE  TOTAL_PAYMENTS float  ;

SET TOTAL_NOTES = (SELECT  SUM(sadProdCount*sadProdPrice) as total FROM SALES join salesdetails on salId= sadSalId and sadDeleted=0 WHERE salCliId=cliId and salDeleted=0  );
set TOTAL_PAYMENTS = (select SUM(payMount) as totalPayments  from payments join sales on salId=paySalId and salDeleted=0 where salCliId=cliId  and payDeleted=0);
RETURN ifNULL(ifnull(TOTAL_NOTES,0)-ifnull(TOTAL_PAYMENTS,0),0);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GET_TOTAL_DESCUENTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sace4948_system`@`%` FUNCTION `GET_TOTAL_DESCUENTO`(salesId int) RETURNS decimal(10,2)
BEGIN
declare salDesc  float;
set salDesc = (select salDescuento from sales where salId=salesId);
RETURN (salDesc * (SELECT GET_TOTAL_NOTE_SALES(salesId)) / 100) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GET_TOTAL_DUE_BY_SALID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sace4948_system`@`%` FUNCTION `GET_TOTAL_DUE_BY_SALID`(salid int) RETURNS decimal(10,2)
BEGIN
DECLARE TOTAL_DUE FLOAT;
SET TOTAL_DUE =( (SELECT GET_TOTAL_NOTE_SALES(salId)) - (SELECT GET_TOTAL_DESCUENTO(salId)) - (SELECT GET_TOTAL_PAYMENT(salId)));
RETURN IFNULL(TOTAL_DUE,0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GET_TOTAL_NOTE_SALES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sace4948_system`@`%` FUNCTION `GET_TOTAL_NOTE_SALES`(salesId Int) RETURNS decimal(10,2)
BEGIN

DECLARE TOTAL_NOTE FLOAT;
SET TOTAL_NOTE= (SELECT 
                SUM(`salesdetails`.`sadSubTotal`) AS `total`
            FROM
                `salesdetails`
            WHERE
                `salesdetails`.`sadSalId` = salesId AND `salesdetails`.`sadDeleted` = 0) ;
RETURN IFNULL(TOTAL_NOTE,0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GET_TOTAL_PAYMENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sace4948_system`@`%` FUNCTION `GET_TOTAL_PAYMENT`(salId int ) RETURNS decimal(10,2)
BEGIN
DECLARE TOTAL_PAYMENT  FLOAT;
SET TOTAL_PAYMENT = (SELECT IFNULL(SUM(`payments`.`payMount`), 0) AS `totalPayment` FROM `payments` WHERE `payments`.`paySalId` = salId and payDeleted = 0);
RETURN ifnull( TOTAL_PAYMENT ,0);               
                
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GET_TOTAL_WITH_DUE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sace4948_system`@`%` FUNCTION `GET_TOTAL_WITH_DUE`(cliId int ) RETURNS decimal(10,2)
BEGIN
DECLARE TOTAL_NOTES float ;
DECLARE  TOTAL_PAYMENTS float  ;

SET TOTAL_NOTES = (SELECT  SUM(sadProdCount*sadProdPrice) as total FROM SALES join salesdetails on salId= sadSalId and sadDeleted=0 WHERE salCliId=cliId and salDeleted=0  );
set TOTAL_PAYMENTS = (select SUM(payMount) as totalPayments  from payments join sales on salId=paySalId and salDeleted=0 where salCliId=cliId  and payDeleted=0);
RETURN ifNULL(ifnull(TOTAL_NOTES,0)-ifnull(TOTAL_PAYMENTS,0),0);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `TOTALWITHDESC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sace4948_system`@`%` FUNCTION `TOTALWITHDESC`(salId  int) RETURNS decimal(10,2)
BEGIN
DECLARE TOTAL_WITH_DESC FLOAT;
SET TOTAL_WITH_DESC = (SELECT GETTOTALNOTESALES(salId)) - (SELECT GETTOTALDESCUENTO(salId));
RETURN IFNULL(TOTAL_WITH_DESC ,0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `TOTAL_WITH_DESC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sace4948_system`@`%` FUNCTION `TOTAL_WITH_DESC`(salId  int) RETURNS decimal(10,2)
BEGIN
DECLARE TOTAL_WITH_DESC FLOAT;
SET TOTAL_WITH_DESC = (SELECT GET_TOTAL_NOTE_SALES(salId)) - (SELECT GET_TOTAL_DESCUENTO(salId));
RETURN IFNULL(TOTAL_WITH_DESC ,0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserSales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`sace4948_system`@`%` PROCEDURE `inserSales`(IN ComId  INT, IN userId  INT, IN literal  NVARCHAR(500) , IN cliId  INT)
BEGIN
INSERT INTO sales (salComId, salUseId, salDescuento, salLiteral, salCliId) 
    VALUES (@ComId,@userId,0, @literal,@cliId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateStockProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`sace4948_system`@`%` PROCEDURE `UpdateStockProduct`(IN productId  INT)
BEGIN
DECLARE stockSales INT default 0;
DECLARE stockPurchases INT default 0;
 SET stockSales  = (SELECT Sum(salesdetails.sadprodcount)  FROM   salesdetails    WHERE  sadprodid = productId);
 SET stockPurchases  = (SELECT Sum(pudprodcount) FROM   purchasesdetails WHERE  pudprodid = productId);

      IF( stockSales IS NULL ) THEN        
            SET stockSales=0;
        END IF;

      IF( stockPurchases IS NULL ) THEN        
            SET stockPurchases =0;
        END IF;

      UPDATE products   SET    prostock = ( stockPurchases - stockSales )      WHERE  proid = productId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateTotalPurchases` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`sace4948_system`@`%` PROCEDURE `UpdateTotalPurchases`(IN purchaseId  INT)
BEGIN
DECLARE Total float default 0;
 SET Total  = (select sum(pudProdPrice*pudProdCount) from purchasesdetails where pudpurId=purchaseId);
Update 	purchases set purTotal=Total  where purId=purchaseId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateTotalSales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`sace4948_system`@`%` PROCEDURE `UpdateTotalSales`(IN salId  INT)
BEGIN
DECLARE Total float default 0;
 SET Total  = (select sum(sadProdPrice*sadProdCount) from salesdetails where sadsalId=salId);
Update 	sales set salTotal=Total  where salId=salId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `clientsview`
--

/*!50001 DROP VIEW IF EXISTS `clientsview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sace4948_system`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `clientsview` AS select `clients`.`cliId` AS `cliId`,`clients`.`cliCreatedAt` AS `cliCreatedAt`,`clients`.`cliUpdatedAt` AS `cliUpdatedAt`,`clients`.`cliDeleted` AS `cliDeleted`,`clients`.`cliFirstName` AS `cliFirstName`,`clients`.`cliLastName` AS `cliLastName`,`clients`.`cliEmail` AS `cliEmail`,`clients`.`cliPhone` AS `cliPhone`,`clients`.`cliComId` AS `cliComId`,`clients`.`cliKey` AS `cliKey`,`clients`.`cliRutId` AS `cliRutId`,`rutes`.`rutName` AS `rutName`,(select `GET_TOTAL_WITH_DUE`(`clients`.`cliId`)) AS `deuda` from (`clients` join `rutes` on((`rutes`.`rutId` = `clients`.`cliRutId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productsview`
--

/*!50001 DROP VIEW IF EXISTS `productsview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sace4948_system`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `productsview` AS select `products`.`proId` AS `proId`,`products`.`procreatedAt` AS `procreatedAt`,`products`.`proUpdatedAt` AS `proUpdatedAt`,`products`.`proDeleted` AS `proDeleted`,`products`.`proDescription` AS `proDescription`,`products`.`proPriceSales` AS `proPriceSales`,`products`.`proPricePurchase` AS `proPricePurchase`,`products`.`proImage` AS `proImage`,`products`.`proComId` AS `proComId`,`products`.`proStock` AS `proStock`,`products`.`proKey` AS `proKey`,`products`.`proSecId` AS `proSecId`,`sections`.`secId` AS `secId`,`sections`.`secKey` AS `secKey`,`sections`.`secCreatedAt` AS `secCreatedAt`,`sections`.`secUpdateAt` AS `secUpdateAt`,`sections`.`secDeleted` AS `secDeleted`,`sections`.`secName` AS `secName`,`sections`.`secDescription` AS `secDescription`,`sections`.`secComId` AS `secComId` from (`products` join `sections` on((`products`.`proSecId` = `sections`.`secId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `purchasesview`
--

/*!50001 DROP VIEW IF EXISTS `purchasesview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sace4948_system`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `purchasesview` AS select `purchases`.`purId` AS `purId`,`purchases`.`purCreatedAt` AS `purCreatedAt`,`purchases`.`purUpdatedAt` AS `purUpdatedAt`,`purchases`.`purDeleted` AS `purDeleted`,`purchases`.`purDate` AS `purDate`,`purchases`.`purTotal` AS `purTotal`,`purchases`.`purComId` AS `purComId`,`purchases`.`purClose` AS `purClose`,`purchases`.`purUseId` AS `purUseId`,`purchases`.`purPrvId` AS `purPrvId`,`purchases`.`purKey` AS `purKey`,`purchases`.`purNumber` AS `purNumber`,(select sum(`purchasesdetails`.`pudSubTotal`) AS `total` from `purchasesdetails` where (`purchasesdetails`.`pudPurId` = `purchases`.`purId`)) AS `total` from `purchases` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `salesview`
--

/*!50001 DROP VIEW IF EXISTS `salesview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sace4948_system`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `salesview` AS select `sales`.`salId` AS `salId`,`sales`.`salCreatedAt` AS `salCreatedAt`,`sales`.`salUpdatedAt` AS `salUpdatedAt`,`sales`.`salDeleted` AS `salDeleted`,`sales`.`salDate` AS `salDate`,`sales`.`salLiteral` AS `salLiteral`,`sales`.`salComId` AS `salComId`,`sales`.`salCliId` AS `salCliId`,`sales`.`salClose` AS `salClose`,`sales`.`salUseId` AS `salUseId`,`sales`.`salKey` AS `salKey`,`sales`.`salDescuento` AS `salDescuento`,(select `GET_TOTAL_NOTE_SALES`(`sales`.`salId`)) AS `total`,(select `GET_TOTAL_DESCUENTO`(`sales`.`salId`)) AS `totalDesc`,(select `TOTAL_WITH_DESC`(`sales`.`salId`)) AS `totalWithDesc`,(select `GET_TOTAL_PAYMENT`(`sales`.`salId`)) AS `totalPayment`,(select `GET_TOTAL_DUE_BY_SALID`(`sales`.`salId`)) AS `due`,`clients`.`cliFirstName` AS `cliFirstName`,`clients`.`cliLastName` AS `cliLastName`,`clients`.`cliKey` AS `cliKey`,`rutes`.`rutName` AS `rutName`,if((select (`GET_TOTAL_DUE_BY_SALID`(`sales`.`salId`) <> 0)),1,0) AS `hasDeuda` from ((`sales` join `clients` on((`sales`.`salCliId` = `clients`.`cliId`))) join `rutes` on((`rutes`.`rutId` = `clients`.`cliRutId`))) */;
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

-- Dump completed on 2023-09-14 14:02:18
