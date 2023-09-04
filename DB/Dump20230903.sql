-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 109.234.161.154    Database: sace4948_system
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.15-MariaDB

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
-- Table structure for table `Sections`
--

DROP TABLE IF EXISTS `Sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sections` (
  `secId` int(11) NOT NULL AUTO_INCREMENT,
  `secKey` varchar(36) NOT NULL,
  `secCreatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `secUpdateAt` datetime DEFAULT NULL,
  `secDeleted` smallint(6) NOT NULL DEFAULT 0,
  `secName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `secDescription` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `secComId` int(11) NOT NULL,
  PRIMARY KEY (`secId`),
  UNIQUE KEY `secKey_UNIQUE` (`secKey`),
  KEY `fk_Sections_companys1_idx` (`secComId`),
  CONSTRAINT `fk_Sections_companys1` FOREIGN KEY (`secComId`) REFERENCES `companys` (`comId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sections`
--

LOCK TABLES `Sections` WRITE;
/*!40000 ALTER TABLE `Sections` DISABLE KEYS */;
INSERT INTO `Sections` VALUES (1,'3e02f6a1-dbc9-4399-9596-aa737e744a81','2023-08-24 12:49:11',NULL,0,'Seccion 1','section 1',1),(2,'455942e2-2073-4b42-b4d5-cec071c5d6fe','2023-08-24 12:53:00',NULL,0,'Seccion 2','Seccion 2',1);
/*!40000 ALTER TABLE `Sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actives`
--

DROP TABLE IF EXISTS `actives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actives` (
  `actId` int(11) NOT NULL AUTO_INCREMENT,
  `actCreateAt` datetime NOT NULL DEFAULT current_timestamp(),
  `actUpdateAt` datetime DEFAULT NULL,
  `actDeleted` smallint(6) NOT NULL DEFAULT 0,
  `actCodigo` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `actDescription` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `actComId` int(11) NOT NULL,
  `actKey` varchar(36) NOT NULL,
  `actCliId` int(11) DEFAULT NULL,
  `actMaintenice` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`actId`),
  UNIQUE KEY `actKey_UNIQUE` (`actKey`),
  KEY `fk_actives_companys1_idx` (`actComId`),
  KEY `fk_actives_clients_idx` (`actCliId`),
  CONSTRAINT `fk_actives_clients` FOREIGN KEY (`actCliId`) REFERENCES `clients` (`cliId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_actives_companys1` FOREIGN KEY (`actComId`) REFERENCES `companys` (`comId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actives`
--

LOCK TABLES `actives` WRITE;
/*!40000 ALTER TABLE `actives` DISABLE KEYS */;
INSERT INTO `actives` VALUES (1,'2023-05-13 15:17:38',NULL,0,'ACT-1','activo 1222222',1,'59500eb6-7f6e-4cc7-b4b2-a47acf6774e7',12,0),(2,'2023-05-13 15:17:38',NULL,0,'ACT-2','activo 2222',1,'405be63b-6543-48a9-869f-aa45f0a1531f',12,1),(3,'2023-05-13 15:17:38',NULL,1,'act2',NULL,1,'1cc6b7a2-7924-4d5d-8de0-393fc72ecdfc',10,0),(4,'2023-05-13 15:17:38',NULL,0,'aaaaa','rrrrrrrr',1,'9342d171-1e15-4ca9-9628-1ebffd156dd6',10,0),(5,'2023-05-13 15:17:38',NULL,0,'6666','dfsadsadsa',1,'bc00de9c-1f3d-4a22-8265-0ec605d2ca77',14,1),(6,'2023-05-13 15:17:38',NULL,0,'6666','sssssss',1,'cff35e11-8731-4680-b88f-5e7a7f2bd3f1',18,0),(7,'2023-05-13 15:17:38',NULL,0,'sssssss','sssssssssssss',1,'805b341a-3f2a-4ac4-bd85-9104c368ba85',9,0),(8,'2023-05-13 15:17:38',NULL,0,'phany1','phany1',1,'df7a23ee-8f30-4feb-a4ef-c58f9ad1f6c7',16,0),(9,'2023-05-13 15:17:38',NULL,0,'phany1','phany1',1,'ba1091ee-4627-493a-be4c-2c38a6625d5d',14,0),(10,'2023-05-13 15:17:38',NULL,0,'test','test',1,'1721dca5-cc95-4994-90fa-6cea38ea4b1b',16,0),(11,'2023-05-13 15:17:38',NULL,0,'phany1dsadsa','dsadsadsa',1,'85dfc54b-535a-4949-9dc4-1738bc3b16d0',17,0),(12,'2023-05-13 15:17:38',NULL,0,'dsadsa','dsadsadsa',1,'9d59d7c2-89a0-4251-9be0-3e9da3493419',13,0),(13,'2023-09-03 06:34:50',NULL,0,'5324rewrew','safdsafdsafdsa',1,'uuid()',21,0),(14,'2023-09-03 22:22:47',NULL,0,'activi 2','activi 2',1,'f6e36bc3-e1ec-4afb-a97a-e7eef9179e7d',NULL,0),(15,'2023-09-03 22:26:15',NULL,0,'tafdsfd33333','3333',1,'a22076e6-c030-4a7b-8ebb-77f31a678817',NULL,0);
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
  `cliCreatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `cliUpdatedAt` datetime DEFAULT NULL,
  `cliDeleted` smallint(6) NOT NULL DEFAULT 0,
  `cliFirstName` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cliLastName` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cliEmail` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cliPhone` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cliComId` int(11) NOT NULL,
  `cliKey` varchar(36) NOT NULL,
  `cliRutId` int(11) DEFAULT NULL,
  PRIMARY KEY (`cliId`),
  UNIQUE KEY `cliKey_UNIQUE` (`cliKey`),
  KEY `fk_clients_companys1_idx` (`cliComId`),
  KEY `fk_clients_rutes1_idx` (`cliRutId`),
  CONSTRAINT `fk_clients_companys1` FOREIGN KEY (`cliComId`) REFERENCES `companys` (`comId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_clients_rutes1` FOREIGN KEY (`cliRutId`) REFERENCES `rutes` (`rutId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
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
  `comCreatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `comUpdatedAt` datetime DEFAULT NULL,
  `comDeleted` smallint(6) NOT NULL DEFAULT 0,
  `comName` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `comPhone` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `comAddress` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `comKey` varchar(36) NOT NULL,
  PRIMARY KEY (`comId`),
  UNIQUE KEY `comKey_UNIQUE` (`comKey`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
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
  `empCreatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `empUpdatedAt` datetime DEFAULT NULL,
  `empDeleted` smallint(6) NOT NULL DEFAULT 0,
  `empFirstName` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `empLastName` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `empEmail` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `empPhone` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `empSalary` double NOT NULL DEFAULT 0,
  `empComId` int(11) NOT NULL,
  `empKey` varchar(36) NOT NULL,
  PRIMARY KEY (`empId`),
  UNIQUE KEY `empKey_UNIQUE` (`empKey`),
  KEY `fk_employees_companys1_idx` (`empComId`),
  CONSTRAINT `fk_employees_companys1` FOREIGN KEY (`empComId`) REFERENCES `companys` (`comId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
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
  `payDate` datetime NOT NULL DEFAULT current_timestamp(),
  `payMount` double NOT NULL DEFAULT 0,
  `payCreateAt` datetime NOT NULL DEFAULT current_timestamp(),
  `payUpdateAt` datetime DEFAULT NULL,
  `payKey` varchar(36) NOT NULL,
  `payDeleted` smallint(6) NOT NULL DEFAULT 0,
  `payComId` int(11) NOT NULL,
  PRIMARY KEY (`payId`),
  UNIQUE KEY `payKey_UNIQUE` (`payKey`),
  KEY `fk_payments_companys1_idx` (`payComId`),
  KEY `fk_payments_sales1_idx` (`paySalId`),
  CONSTRAINT `fk_payments_companys1` FOREIGN KEY (`payComId`) REFERENCES `companys` (`comId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payments_sales1` FOREIGN KEY (`paySalId`) REFERENCES `sales` (`salId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (5,4,'2023-08-31 04:11:33',74,'2023-08-31 04:11:33',NULL,'3052f1e1-da5a-4f2f-978a-fd94787c86ee',0,1),(6,4,'2023-08-31 04:35:40',150,'2023-08-31 04:35:40',NULL,'1fc147ab-e47c-4926-80e8-bd4af91c93a9',0,1),(7,4,'2023-08-31 04:37:01',100,'2023-08-31 04:37:01',NULL,'c391761f-1687-44ee-9292-b490c44503bf',0,1),(8,4,'2023-08-31 04:45:03',1,'2023-08-31 04:45:03',NULL,'04aa0cfb-20c8-4149-955c-a32d70e766cd',0,1),(9,4,'2023-08-31 04:46:06',1,'2023-08-31 04:46:06',NULL,'8c49cf95-5008-4ad2-887d-dcb49fd76e43',0,1),(10,4,'2023-08-31 04:47:39',1,'2023-08-31 04:47:39',NULL,'8bab22e2-8f1b-435b-b683-daf600862f55',0,1),(11,4,'2023-08-31 04:47:50',1,'2023-08-31 04:47:50',NULL,'124f0cf7-5bfc-4d9f-9dc6-59452665fb61',0,1),(12,4,'2023-08-31 14:11:33',2,'2023-08-31 14:11:33',NULL,'91974667-6d69-4cef-97e5-3612edec2a94',0,1),(13,4,'2023-08-31 14:46:08',4,'2023-08-31 14:46:08',NULL,'40f5ffad-e062-476d-a581-ca2b7ad5779e',0,1),(14,4,'2023-08-31 16:04:39',10,'2023-08-31 16:04:39',NULL,'c34c0846-5426-41bc-a6d6-4f7377651ae2',0,1),(15,4,'2023-08-31 16:05:02',11,'2023-08-31 16:05:02',NULL,'40365358-c034-4d95-a55a-38cdf8cedbe0',0,1),(16,4,'2023-08-31 16:05:07',111,'2023-08-31 16:05:07',NULL,'d43af229-5328-4265-81ca-649e26a8bf50',0,1),(17,12,'2023-08-31 18:25:15',34,'2023-08-31 18:25:15',NULL,'f02e566e-58bb-424b-a862-be83d8e647e3',0,1),(18,10,'2023-09-01 23:19:04',15,'2023-09-01 23:19:04',NULL,'5705f283-1cd6-491c-b0d3-9ad12789697b',0,1),(19,10,'2023-09-01 23:19:11',10,'2023-09-01 23:19:11',NULL,'436f2618-1485-46d5-965c-bd8a8947f1b4',0,1);
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
  `procreatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `proUpdatedAt` datetime DEFAULT NULL,
  `proDeleted` smallint(6) NOT NULL DEFAULT 0,
  `proDescription` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `proPriceSales` double NOT NULL DEFAULT 0,
  `proPricePurchase` double NOT NULL DEFAULT 0,
  `proImage` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `proComId` int(11) NOT NULL,
  `proStock` double NOT NULL DEFAULT 0,
  `proKey` varchar(36) NOT NULL,
  `proSecId` int(11) NOT NULL,
  PRIMARY KEY (`proId`),
  UNIQUE KEY `proKey_UNIQUE` (`proKey`),
  KEY `fk_products_companys1_idx` (`proComId`),
  KEY `fk_products_Sections1_idx` (`proSecId`),
  CONSTRAINT `fk_products_Sections1` FOREIGN KEY (`proSecId`) REFERENCES `Sections` (`secId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_companys1` FOREIGN KEY (`proComId`) REFERENCES `companys` (`comId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (3,'2023-01-26 23:42:48',NULL,0,'fdsf',3,3,'fdsfds',1,78,'30d8c1ea-2e69-4512-95dc-8877a698886b',1),(4,'2023-01-28 21:11:05',NULL,0,'prod1',10.5,20,NULL,1,24,'437f0518-8fef-4634-a5e8-0506c22ea346',1),(5,'2023-02-12 06:53:27',NULL,0,'e',10,20,NULL,1,20,'89cb0b4d-fe48-4920-929e-dfc725906047',1),(6,'2023-02-12 06:53:40',NULL,0,'test3333333333333',10,4,NULL,1,84,'3413bc71-9901-405a-8482-50cdabcf22ad',1),(7,'2023-02-12 06:54:22',NULL,0,'wwwwwwwwwwwwwww',4,5,NULL,1,6,'6d490df7-7072-420d-87ba-b4deb531120c',1),(8,'2023-02-12 06:54:35',NULL,0,'rersr',3,4,NULL,1,176,'1caecf07-5101-4ee6-8fd8-f0ad9c90a009',1),(9,'2023-02-12 06:54:46',NULL,0,'wwwwwwwwwwwwwww',23,3,NULL,1,-1,'152e9a72-5250-49d0-8d1b-9f3ab165f00b',1),(10,'2023-07-13 06:20:19',NULL,0,'22222222222222',2,2,NULL,1,-8,'71904974-eef4-4870-8a93-16bb041c22eb',1),(11,'2023-07-13 06:20:33',NULL,0,'22222222222222',2,2,NULL,1,-6,'7a608fdd-4a60-47b4-89bd-dd978152802f',1),(12,'2023-07-13 06:20:43',NULL,0,'ssssss',10,0,NULL,1,27,'4ad3d4bb-6160-4209-b777-0989f54bd220',1),(13,'2023-07-13 06:21:52',NULL,0,'ssssss',10,0,NULL,1,-4,'dcf76adb-1394-4f6f-b82b-4b45bc8be03e',1),(14,'2023-07-13 06:22:14',NULL,0,'ssssss',10,0,NULL,1,-5,'a36e4c43-d8d3-4f87-ad81-a94dba76a138',1),(15,'2023-07-13 06:22:15',NULL,0,'ssssss',10,0,NULL,1,-2,'c7ae1981-b06f-402f-be54-bfc3ade379ed',1),(16,'2023-07-13 06:22:15',NULL,0,'ssssss',10,0,NULL,1,-3,'433e517e-c96a-4877-b4c8-bff02593c177',1),(17,'2023-07-13 06:22:15',NULL,0,'ssssss',10,0,NULL,1,-3,'338eed9c-84e0-4cce-bafc-56ce44881c2b',1),(18,'2023-07-13 06:22:15',NULL,0,'ssssss',10,0,NULL,1,-2,'4870187a-3d6e-441d-b5f8-f1c41e8e353a',2),(19,'2023-07-13 06:22:15',NULL,0,'ssssss',10,0,NULL,1,-2,'3cbbcf6c-1ce5-4439-854e-35f038731ea5',2),(20,'2023-07-13 06:22:16',NULL,0,'ssssss',10,0,NULL,1,-5,'fddc4fec-30f5-453f-a000-52ca998afb5a',2),(21,'2023-08-07 01:22:46',NULL,0,'0000',100,10,NULL,1,-12,'58dbd21f-1890-4050-aac7-7d474ba4338a',2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
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
  `prvCreatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `prvUpdatedAt` datetime DEFAULT NULL,
  `prvDeleted` smallint(6) NOT NULL DEFAULT 0,
  `prvName` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `prvPhone` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `prvAddress` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `prvImage` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `prvComId` int(11) NOT NULL,
  `prvKey` varchar(36) NOT NULL,
  PRIMARY KEY (`prvId`),
  UNIQUE KEY `prvKey_UNIQUE` (`prvKey`),
  KEY `fk_providers_companys_idx` (`prvComId`),
  CONSTRAINT `fk_providers_companys` FOREIGN KEY (`prvComId`) REFERENCES `companys` (`comId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers`
--

LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT INTO `providers` VALUES (1,'2023-01-26 22:13:39',NULL,0,'proveedor 1','12345789','av. Chapare km 7 1/5ssssssssssss','image1.jpg',1,'1592235c-cd27-40d7-a050-ceddaee66b70'),(2,'2023-01-28 21:05:50',NULL,1,'wwwwww','72297259','av. Chapare km 7 1/5, edificio multifamiliar bartolina bloque II depto 292','',1,'de3ded67-6f88-47c9-bfdd-67fb39d990a9'),(3,'2023-07-17 03:51:25',NULL,1,'milton adalid gutierrez barco','72297259','av. Chapare km 7 1/5, edificio multifamiliar bartolina bloque II depto 292','',1,'b5d7b604-c2e8-4622-a05d-bac9fbb91181'),(4,'2023-07-17 03:51:27',NULL,0,'milton adalid gutierr444ez barco','7229725944','av. Chapare km 7 41/5, edificio multifamiliar bartolina bloque II depto 292','',1,'eefc8985-4569-400d-8a97-577fd436a143'),(5,'2023-07-17 03:51:28',NULL,0,'milton adalid gutierr444ez barco','7229725944','av. Chapare km 7 41/5, edificio multifamiliar bartolina bloque II depto 292','',1,'7c58009f-8579-4dd8-8bdb-cfe1cf21a852'),(6,'2023-07-17 03:51:30',NULL,1,'milton adalid gutierr444ez barco','7229725944','av. Chapare km 7 41/5, edificio multifamiliar bartolina bloque II depto 292','',1,'437bc32e-21e6-4cda-8bb3-889489fefa97'),(7,'2023-07-17 03:51:31',NULL,0,'milton adalid gutierr444ez barco','7229725944','av. Chapare km 7 41/5, edificio multifamiliar bartolina bloque II depto 292','',1,'43bc73a9-fcd1-4fa8-b8bc-a3a1b2bb1b06'),(8,'2023-07-17 14:55:37',NULL,0,'milton adalid gutierr444ez barco','7229725944','av. Chapare km 7 41/5, edificio multifamiliar bartolina bloque II depto 292','',1,'ce0d8a0c-5a96-47a9-9897-a80cbb3d3529'),(9,'2023-07-17 14:55:54',NULL,0,'milton adalid gutierr444ez barco','7229725944','av. Chapare km 7 41/5, edificio multifamiliar bartolina bloque II depto 292','',1,'0054cc8d-e550-4dde-b1ee-58ef48ed4535'),(10,'2023-08-07 01:24:57',NULL,0,'00000','72297259','av. Chapare km 7 1/5, edificio multifamiliar bartolina bloque II depto 292','',1,'cea8c728-4a51-47af-885f-e051b786bcde');
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
  `purCreatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `purUpdatedAt` datetime DEFAULT NULL,
  `purDeleted` smallint(6) NOT NULL DEFAULT 0,
  `purDate` datetime NOT NULL DEFAULT current_timestamp(),
  `purTotal` double NOT NULL DEFAULT 0,
  `purComId` int(11) NOT NULL,
  `purClose` smallint(6) NOT NULL DEFAULT 0,
  `purUseId` int(11) NOT NULL,
  `purPrvId` int(11) NOT NULL,
  `purKey` varchar(36) NOT NULL,
  `purNumber` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`purId`),
  UNIQUE KEY `purKey_UNIQUE` (`purKey`),
  KEY `fk_purchases_companys1_idx` (`purComId`),
  KEY `fk_purchase_provider_idx` (`purPrvId`),
  CONSTRAINT `fk_purchase_provider` FOREIGN KEY (`purPrvId`) REFERENCES `providers` (`prvId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchases_companys1` FOREIGN KEY (`purComId`) REFERENCES `companys` (`comId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,'2023-05-07 14:08:25',NULL,0,'2023-05-07 14:08:25',585,1,1,1,1,'94c59ead-86eb-41df-aea3-eda4d0b70cdd',NULL),(2,'2023-08-25 11:35:41',NULL,0,'2023-08-25 11:35:41',585,1,0,0,1,'28236a90-073e-417c-a867-820b1062428c',NULL),(3,'2023-08-25 11:35:43',NULL,0,'2023-08-25 11:35:43',585,1,0,0,1,'3c3f66b1-65ac-4eba-9dfb-4256720c5f25',NULL),(4,'2023-08-25 11:35:47',NULL,0,'2023-08-25 11:35:47',585,1,0,0,1,'53ec24ff-b893-4523-a0e4-192d742967f0',NULL),(5,'2023-08-25 11:35:49',NULL,0,'2023-08-25 11:35:49',585,1,0,0,1,'d7eaac8c-be6d-4119-8fa5-f5b12c8879c5',NULL),(6,'2023-08-26 04:44:06',NULL,0,'2023-08-26 04:44:06',585,1,0,0,7,'1c6cf657-185a-4e81-8a7f-f34ab453340c',NULL),(7,'2023-08-26 04:45:48',NULL,0,'2023-08-26 04:45:48',585,1,0,0,7,'3921d267-c792-462f-ad47-8ead5b6d06bc',NULL),(8,'2023-08-26 04:56:24',NULL,0,'2023-08-26 04:56:24',585,1,0,0,4,'87d5627a-34f3-4124-bc45-803a07f4d36f',NULL),(9,'2023-08-26 04:57:17',NULL,0,'2023-08-26 04:57:17',585,1,0,0,7,'289b9917-7cdf-4f2e-9e7a-41bfc1db3476',NULL),(10,'2023-08-26 04:58:17',NULL,1,'2023-08-26 04:58:17',585,1,0,0,7,'d4fa9e0a-6b0f-4610-96d9-e8f4080d1c08',NULL),(11,'2023-08-26 04:58:50',NULL,1,'2023-08-26 04:58:50',585,1,0,0,5,'f7187da5-3e29-48fa-bb0b-e3259c011955',NULL),(12,'2023-08-26 04:59:10',NULL,0,'2023-08-26 04:59:10',585,1,0,0,4,'dda2e430-9c92-41f1-957f-7d433027caf7',NULL),(13,'2023-08-26 05:00:27',NULL,0,'2023-08-26 05:00:27',585,1,0,0,4,'2ea4208b-6b30-437a-ad15-b3ea7537c62b',NULL),(14,'2023-08-26 05:02:25',NULL,0,'2023-08-26 05:02:25',585,1,0,0,4,'83be2855-221f-4645-9bf0-bac625f37f1b',NULL),(15,'2023-08-26 05:04:19',NULL,0,'2023-08-26 05:04:19',585,1,0,0,7,'e8272133-67d5-498f-abdc-38f9cd32faf6',NULL),(16,'2023-08-26 05:10:13',NULL,0,'2023-08-26 05:10:13',585,1,0,0,7,'94569246-a180-4c8d-9c62-17edfffc6b47',NULL),(17,'2023-08-26 05:11:05',NULL,0,'2023-08-26 05:11:05',585,1,0,0,5,'83a5a2e4-1eaa-49dc-bf72-71ce2b210b19',NULL),(18,'2023-08-26 05:13:50',NULL,1,'2023-08-26 05:13:50',585,1,0,0,4,'c46082f6-c708-4f62-8fc4-a2152dad1582',NULL),(19,'2023-08-26 05:16:29',NULL,0,'2023-08-26 05:16:29',585,1,0,0,5,'f134ec38-fb36-4ecb-a6ba-7d3cdb1c4d87',NULL),(20,'2023-08-26 05:16:50',NULL,1,'2023-08-26 05:16:50',585,1,0,0,1,'1e9804c7-b5bb-4f03-8d1c-4af50fa899e5',NULL),(21,'2023-08-26 05:20:39',NULL,1,'2023-08-26 05:20:39',585,1,0,0,4,'de353044-bef7-46e6-9dbd-8d9f7b55e11e',NULL),(22,'2023-08-26 20:32:17',NULL,1,'2023-08-26 20:32:17',585,1,0,0,1,'329cd92a-0bef-4491-bd8b-8d92ac98ce58',NULL),(23,'2023-08-26 20:36:46',NULL,0,'2023-08-26 20:36:46',585,1,0,0,1,'405998bf-0358-4647-a710-2342e4e55b36',NULL);
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
  `pudCreatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `pudUpdatedAt` datetime DEFAULT NULL,
  `pudDeleted` smallint(6) NOT NULL DEFAULT 0,
  `pudProdId` int(11) NOT NULL,
  `pudProdDescription` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `pudProdCount` double NOT NULL DEFAULT 0,
  `pudUseId` int(11) NOT NULL,
  `pudPurId` int(11) NOT NULL,
  `pudProdPrice` double NOT NULL DEFAULT 0,
  `pudLastItem` smallint(6) NOT NULL DEFAULT 0,
  `pudSubTotal` double NOT NULL DEFAULT 0,
  `pudKey` varchar(36) NOT NULL,
  PRIMARY KEY (`pudId`),
  UNIQUE KEY `pudKey_UNIQUE` (`pudKey`),
  KEY `fk_purchasesdetails_purchases1_idx` (`pudPurId`),
  CONSTRAINT `fk_purchasesdetails_purchases1` FOREIGN KEY (`pudPurId`) REFERENCES `purchases` (`purId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasesdetails`
--

LOCK TABLES `purchasesdetails` WRITE;
/*!40000 ALTER TABLE `purchasesdetails` DISABLE KEYS */;
INSERT INTO `purchasesdetails` VALUES (2,'2023-05-07 14:11:03',NULL,0,5,'tset',10,1,1,1,1,0,'594a7ef9-9a3c-48e1-b580-98ebda11fb0c'),(3,'2023-08-26 13:21:50',NULL,0,4,'prod1',3,1,1,32,0,0,'42ce70c8-b496-46fb-8819-c579fd5a06ee'),(4,'2023-08-26 13:22:44',NULL,0,4,'prod1',3,1,1,32,0,0,'6dd3b3c7-58c5-4080-95ff-f071c5ccb09d'),(5,'2023-08-26 13:23:04',NULL,0,4,'prod1',3,1,1,32,0,0,'64c22fae-0258-450b-8937-8ec0781d4ea6'),(6,'2023-08-26 20:37:05',NULL,0,3,'fdsf',43,1,23,43,0,0,'e314f36b-aa55-4845-b310-c055fcd0e920'),(7,'2023-08-26 20:39:06',NULL,0,3,'fdsf',43,1,23,43,0,0,'1b5aa9a1-51c9-47eb-85d0-3b7c77edb7f1'),(8,'2023-08-26 20:39:12',NULL,0,6,'test3333333333333',43,1,23,43,0,0,'e4263f10-7c71-4145-8f80-8a1a8494abe7'),(9,'2023-08-26 20:39:17',NULL,0,8,'rersr',43,1,23,43,0,0,'205111cf-c52f-4481-9f97-041ebd046f87'),(10,'2023-08-26 20:39:49',NULL,0,8,'rersr',43,1,23,43,0,0,'fdee95f9-0e3b-48f9-adfa-58351b7019fe'),(11,'2023-08-26 20:40:43',NULL,0,12,'ssssss',43,1,23,43,0,0,'0ccba272-a7e7-4ae6-83f0-7443fed5711e'),(12,'2023-08-26 20:42:29',NULL,0,8,'rersr',43,1,23,43,0,0,'00067aa2-aa5d-4603-a112-745c85cc5a2a'),(13,'2023-08-26 20:46:40',NULL,0,6,'test3333333333333',43,1,23,43,0,0,'7666ee77-4722-4434-98e5-b3c4648aefc6'),(14,'2023-08-26 23:05:02',NULL,0,16,'ssssss',0,1,23,0,0,0,'3491d7e5-39bb-48e1-a827-979aa25251b0'),(15,'2023-08-27 01:51:19',NULL,0,9,'wwwwwwwwwwwwwww',2,1,23,2,0,0,'e6319296-6c7f-4b7a-b39e-9bc6a3b648b1'),(16,'2023-08-27 01:51:37',NULL,0,5,'e',22,1,23,5,0,0,'7a695d96-cd7a-4973-9d4a-1a9911cf8f71'),(17,'2023-09-03 03:57:55',NULL,0,6,'test3333333333333',4,1,23,4,0,0,'7a695d96-cd7a-4973-9d4a-1a9911458f71'),(18,'2023-09-03 03:58:07',NULL,0,8,'rersr',54,1,23,54,0,0,'7a695d96-cd7a-4973-9d4a-1878911cf8f7'),(19,'2023-09-03 04:32:51',NULL,0,4,'prod1',21,1,22,21,0,0,'7a6996-cd7a-4973-9d4a-1a991581cf8f71'),(20,'2023-09-03 04:32:59',NULL,0,7,'wwwwwwwwwwwwwww',12,1,22,12,0,0,'7a695d456cd7a-4973-9d4a-1a9911cf8f71');
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
-- Table structure for table `rutes`
--

DROP TABLE IF EXISTS `rutes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rutes` (
  `rutId` int(11) NOT NULL AUTO_INCREMENT,
  `rutCreatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `rutUpdatedAt` datetime DEFAULT NULL,
  `rutDeleted` smallint(6) NOT NULL DEFAULT 0,
  `rutName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `rutDescription` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `rutKey` varchar(36) NOT NULL,
  `rutComId` int(11) DEFAULT NULL,
  PRIMARY KEY (`rutId`),
  UNIQUE KEY `rutKey_UNIQUE` (`rutKey`),
  KEY `fk_rutes_companys1_idx` (`rutComId`),
  CONSTRAINT `fk_rutes_companys1` FOREIGN KEY (`rutComId`) REFERENCES `companys` (`comId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
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
  `salCreatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `salUpdatedAt` datetime DEFAULT NULL,
  `salDeleted` smallint(6) NOT NULL DEFAULT 0,
  `salDate` datetime NOT NULL DEFAULT current_timestamp(),
  `salTotal` double NOT NULL DEFAULT 0,
  `salLiteral` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'cero',
  `salComId` int(11) NOT NULL,
  `salCliId` int(11) NOT NULL,
  `salClose` smallint(6) NOT NULL DEFAULT 0,
  `salUseId` int(11) NOT NULL,
  `salKey` varchar(36) NOT NULL,
  `salDescuento` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`salId`),
  UNIQUE KEY `salKey_UNIQUE` (`salKey`),
  KEY `fk_sales_companys1_idx` (`salComId`),
  CONSTRAINT `fk_sales_companys1` FOREIGN KEY (`salComId`) REFERENCES `companys` (`comId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'2023-07-23 04:33:55',NULL,0,'2023-07-23 04:33:55',161.5,'cero',1,10,1,1,'4bfbb9dd-77e6-4b82-b7e8-3713e5025766',66),(2,'2023-08-14 13:25:12',NULL,0,'2023-08-14 13:25:12',161.5,'t',1,10,1,1,'7bae9953-870c-4757-9e5d-f6835550d382',0),(3,'2023-08-14 18:46:33',NULL,0,'2023-08-14 18:46:33',161.5,'cero',1,10,1,1,'017d0808-b429-4105-888b-4224eb283d85',100),(4,'2023-08-26 14:27:52',NULL,1,'2023-08-26 14:27:52',161.5,'cero',1,10,1,1,'d9ee868d-617e-4517-9bd5-cd381845e2a9',0),(5,'2023-08-26 14:27:52',NULL,0,'2023-08-26 14:27:52',161.5,'cero',1,10,1,1,'f3740c05-cdfd-4ced-b041-540957c06aec',0),(6,'2023-08-26 14:27:52',NULL,1,'2023-08-26 14:27:52',161.5,'cero',1,11,1,1,'80fd7881-40b5-45cf-8738-ac54a44ab7ae',0),(7,'2023-08-27 03:43:21',NULL,0,'2023-08-27 03:43:21',161.5,'cero',1,10,1,1,'70bb1dbf-1d39-4925-b9c3-3475af7c3f59',0),(8,'2023-08-27 03:43:59',NULL,0,'2023-08-27 03:43:59',161.5,'cero',1,10,1,1,'05664c7e-2b63-423e-89da-edcd7006cf21',0),(9,'2023-08-29 02:25:11',NULL,0,'2023-08-29 02:25:11',161.5,'cero',1,10,1,1,'0565ad76-30fb-4201-a8a9-11f224433ae4',0),(10,'2023-08-31 16:08:25',NULL,0,'2023-08-31 16:08:25',161.5,'cero',1,10,1,1,'49fa6d01-b457-46bf-af59-1294bd289cfe',0),(11,'2023-08-31 16:10:41',NULL,0,'2023-08-31 16:10:41',161.5,'cero',1,10,1,1,'e1296065-0e5a-45a6-a549-20fcb675ddce',0),(12,'2023-08-31 17:11:29',NULL,0,'2023-08-31 17:11:29',161.5,'cero',1,10,1,1,'5de7cb3b-5b8e-489d-8d72-5af1cd03128e',0),(13,'2023-08-31 17:45:00',NULL,0,'2023-08-31 17:45:00',161.5,'cero',1,10,1,1,'f32360c9-d88f-4bde-92df-337636cadc75',0),(14,'2023-08-31 17:49:59',NULL,0,'2023-08-31 17:49:59',161.5,'cero',1,10,1,1,'c82a7aa2-efb8-41cb-b52a-6e3b95a32175',0),(15,'2023-08-31 18:26:59',NULL,0,'2023-08-31 18:26:59',161.5,'cero',1,10,1,1,'f319da21-30e7-4dc2-b713-d1243d94e9c5',0),(16,'2023-09-01 23:16:24',NULL,0,'2023-09-01 23:16:24',161.5,'cero',1,11,1,1,'bca52801-6a85-4ad1-8eeb-27e0ddd7af6c',0),(17,'2023-09-02 21:36:18',NULL,0,'2023-09-02 21:36:18',161.5,'cero',1,10,1,1,'bca52801-6a85-4ad1-8eeb-27e0ddd7af6',0),(18,'2023-09-02 21:36:21',NULL,0,'2023-09-02 21:36:21',161.5,'cero',1,10,1,1,'bca52801-6a85-4ad1-8eeb-27e0ddd7af',10),(19,'2023-09-03 16:14:43',NULL,0,'2023-09-03 16:14:43',0,'cero',1,10,0,1,'a52801-6a85-4ad1-8eeb-27e0ddd7af6cfd',0);
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
  `sadCreatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `sadUpdatedAt` datetime DEFAULT NULL,
  `sadDeleted` smallint(6) NOT NULL DEFAULT 0,
  `sadProdId` int(11) NOT NULL,
  `sadProdDescription` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sadProdPrice` double NOT NULL DEFAULT 0,
  `sadProdCount` double NOT NULL DEFAULT 0,
  `sadUseId` int(11) NOT NULL,
  `sadSalId` int(11) NOT NULL,
  `salLastItem` smallint(6) NOT NULL DEFAULT 0,
  `sadSubTotal` double NOT NULL DEFAULT 0,
  `sadKey` varchar(36) NOT NULL,
  `sadProdKey` varchar(45) NOT NULL DEFAULT '"-"',
  PRIMARY KEY (`sadId`),
  UNIQUE KEY `sadKey_UNIQUE` (`sadKey`),
  KEY `fk_salesdetails_sales1_idx` (`sadSalId`),
  CONSTRAINT `fk_salesdetails_sales1` FOREIGN KEY (`sadSalId`) REFERENCES `sales` (`salId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesdetails`
--

LOCK TABLES `salesdetails` WRITE;
/*!40000 ALTER TABLE `salesdetails` DISABLE KEYS */;
INSERT INTO `salesdetails` VALUES (107,'2023-07-23 04:35:42',NULL,0,6,'test3333333333333',10,4,1,1,0,40,'5797c4e8-e687-40df-b8fa-44e1dae09ac4','\"-\"'),(108,'2023-07-23 04:35:44',NULL,0,8,'rersr',3,3,1,1,0,9,'b87f6e53-d4d7-47f3-a93b-2922f5ccf28c','\"-\"'),(109,'2023-07-23 04:35:48',NULL,0,11,'22222222222222',2,2,1,1,0,4,'33dafd0d-4b5d-4b2a-8275-08dfe22173ea','\"-\"'),(110,'2023-07-23 04:36:28',NULL,0,5,'e',10,7,1,1,0,70,'8b208194-bccd-4ec1-b3ff-cd58e0b475f5','\"-\"'),(111,'2023-07-23 04:38:45',NULL,0,4,'prod1',10.5,2,1,1,0,21,'e84c898e-f0c9-41fd-ba60-41899e683677','\"-\"'),(112,'2023-07-23 04:43:30',NULL,0,13,'ssssss',10,2,1,1,0,20,'db2b4d28-eca9-45a2-9c95-d876fa12473e','\"-\"'),(113,'2023-07-24 18:37:32',NULL,0,3,'fdsf',3,2,1,1,0,6,'9f07250c-92b9-4da4-9e98-3ca4ccf87855','\"-\"'),(114,'2023-07-24 18:37:40',NULL,0,7,'wwwwwwwwwwwwwww',4,2,1,1,0,8,'17b9a98b-c835-48f5-969b-6e9c74b7048c','\"-\"'),(115,'2023-07-24 18:37:44',NULL,0,9,'wwwwwwwwwwwwwww',23,1,1,1,0,23,'d76a8285-d007-4e24-b261-1bc7880d5f57','\"-\"'),(116,'2023-07-24 18:37:46',NULL,0,10,'22222222222222',2,2,1,1,0,4,'671cfec7-1a03-4358-8d0b-28f8c1dd9977','\"-\"'),(117,'2023-07-24 18:37:50',NULL,0,12,'ssssss',10,1,1,1,0,10,'8f2e0d04-2599-498e-aa6b-3d3f13413664','\"-\"'),(118,'2023-08-11 16:49:21',NULL,0,14,'ssssss',10,2,1,1,0,20,'c649c401-6d26-403e-a966-9e8baa12fcf1','\"-\"'),(119,'2023-08-12 03:33:44',NULL,0,20,'ssssss',10,1,1,1,0,10,'a5c4d7cd-4281-4f4b-9d42-81528b99ee48','\"-\"'),(120,'2023-08-12 03:34:01',NULL,0,21,'0000',100,8,1,1,1,800,'ce1a5681-ab4e-481a-8e65-91251473406a','\"-\"'),(125,'2023-08-26 14:27:57',NULL,0,12,'ssssss',10,10,1,4,0,100,'6f6c1df0-5d18-4032-97cc-afc3831c9e54','\"-\"'),(126,'2023-08-26 15:58:36',NULL,0,8,'rersr',3,1,1,4,0,3,'a44afb97-544b-42cb-b77f-20825502e1d9','\"-\"'),(127,'2023-08-26 15:59:10',NULL,0,10,'22222222222222',2,2,1,4,0,4,'99ae8e48-29a9-4ad4-8a38-b6917f5b4a33','\"-\"'),(128,'2023-08-26 15:59:12',NULL,0,7,'wwwwwwwwwwwwwww',4,1,1,4,0,4,'2b172565-449a-4f01-ae4c-0d94970d6a82','\"-\"'),(129,'2023-08-26 15:59:13',NULL,0,5,'e',10,2,1,4,0,20,'8e842542-da66-4412-a1df-ce749b3fc423','\"-\"'),(130,'2023-08-26 15:59:15',NULL,0,17,'ssssss',10,1,1,4,0,10,'4c1dde7a-f773-405d-9dc0-5aa04502ef43','\"-\"'),(131,'2023-08-26 15:59:17',NULL,0,20,'ssssss',10,2,1,4,0,20,'20b2e7dd-6290-42ce-a4a5-4d8b96f61d65','\"-\"'),(132,'2023-08-26 15:59:25',NULL,0,3,'fdsf',3,1,1,4,0,3,'ccd87d70-7e84-40f8-a834-553314bde0f0','\"-\"'),(133,'2023-08-26 15:59:29',NULL,0,21,'0000',100,2,1,4,0,200,'2197d9b6-1e3b-463f-9e53-8c69583a3877','\"-\"'),(134,'2023-08-26 17:44:37',NULL,0,13,'ssssss',10,1,1,4,1,10,'c5645232-c8a5-483c-91c4-7c3477823ad6','\"-\"'),(135,'2023-08-27 03:43:24',NULL,0,10,'22222222222222',2,1,1,7,0,2,'81bbf423-11b3-4daf-9a54-8651d5108c42','\"-\"'),(136,'2023-08-27 03:43:26',NULL,0,9,'wwwwwwwwwwwwwww',23,1,1,7,1,23,'faf50739-e009-42e9-aac9-7b44b92c16d4','\"-\"'),(137,'2023-08-27 03:58:09',NULL,0,11,'22222222222222',2,1,1,8,0,2,'c570bcce-7384-48de-a140-76b1b6286c9d','\"-\"'),(138,'2023-08-27 03:58:11',NULL,0,12,'ssssss',10,1,1,8,0,10,'4e336063-17f1-439b-ba37-3e623e78e01f','\"-\"'),(139,'2023-08-27 03:58:13',NULL,0,5,'e',10,1,1,8,1,10,'5a8ec753-91c6-4c63-88f4-25780b8f7721','\"-\"'),(140,'2023-08-30 13:00:59',NULL,0,10,'22222222222222',2,1,1,9,0,2,'06077f87-430a-4936-82a2-63eb8b20e336','\"-\"'),(141,'2023-08-30 13:01:01',NULL,0,12,'ssssss',10,1,1,9,0,10,'931d31df-5636-44d1-b46b-b9e1e76a701e','\"-\"'),(142,'2023-08-30 13:01:03',NULL,0,17,'ssssss',10,1,1,9,1,10,'b5fafcb2-08a2-4815-8e88-d37e7787c58b','\"-\"'),(143,'2023-08-31 16:08:29',NULL,0,4,'prod1',10.5,1,1,10,0,10.5,'0600b1b2-fb72-47ae-8055-514be9ce4c32','\"-\"'),(144,'2023-08-31 16:08:31',NULL,0,8,'rersr',3,2,1,10,0,6,'8e1b5bd7-8892-4244-9991-303083b04a5d','\"-\"'),(145,'2023-08-31 16:08:33',NULL,0,6,'test3333333333333',10,1,1,10,0,10,'4a52425b-f3bb-46e3-b3cc-771b0aa3e15c','\"-\"'),(146,'2023-08-31 16:08:37',NULL,0,14,'ssssss',10,2,1,10,0,20,'7e738e67-4d0d-4c73-8658-f621fb414413','\"-\"'),(147,'2023-08-31 16:08:41',NULL,0,16,'ssssss',10,1,1,10,1,10,'7c9cb0a1-a751-486e-920b-729195c02e3b','\"-\"'),(148,'2023-08-31 16:10:44',NULL,0,4,'prod1',10.5,1,1,11,0,10.5,'dbde824d-8133-466c-b271-925d6e8dd98a','\"-\"'),(149,'2023-08-31 16:10:46',NULL,0,3,'fdsf',3,1,1,11,0,3,'d096441d-994e-45ce-bd98-b28350532a86','\"-\"'),(150,'2023-08-31 16:10:48',NULL,0,13,'ssssss',10,1,1,11,0,10,'d5de6e07-e9c6-434c-9ca2-cde728d1fdcf','\"-\"'),(151,'2023-08-31 16:10:50',NULL,0,7,'wwwwwwwwwwwwwww',4,1,1,11,0,4,'582785d6-7525-4b25-9905-cbfd7e5721c6','\"-\"'),(152,'2023-08-31 16:10:52',NULL,0,12,'ssssss',10,1,1,11,1,10,'299214ba-3cfb-4ff1-8531-ab9bf83c1745','\"-\"'),(153,'2023-08-31 17:12:21',NULL,0,7,'wwwwwwwwwwwwwww',4,1,1,12,0,4,'0b78de2e-2a14-41e3-96ad-8c6cd21a7cfd','\"-\"'),(155,'2023-08-31 17:12:53',NULL,0,16,'ssssss',10,1,1,12,0,10,'4e2b3c32-94e8-494c-b95a-ade603d85700','\"-\"'),(157,'2023-08-31 17:13:34',NULL,0,12,'ssssss',10,1,1,12,0,10,'00baae67-afec-4bc2-b38c-0fe4b4b562e5','\"-\"'),(158,'2023-08-31 17:13:56',NULL,0,15,'ssssss',10,1,1,12,1,10,'c607c9db-0959-4323-b896-145dfc2fdd60','\"-\"'),(159,'2023-08-31 17:45:04',NULL,0,4,'prod1',10.5,1,1,13,0,10.5,'b3ad842a-e77f-4471-ae46-3a3c5e9b0262','\"-\"'),(160,'2023-08-31 17:45:06',NULL,0,11,'22222222222222',2,1,1,13,0,2,'e9bb6c52-335d-4afd-bb57-831047c36fea','\"-\"'),(161,'2023-08-31 17:45:08',NULL,0,14,'ssssss',10,1,1,13,0,10,'90f47b39-5905-4a8f-b78f-cf24ee036c5e','\"-\"'),(162,'2023-08-31 17:45:09',NULL,0,19,'ssssss',10,1,1,13,0,10,'35a1a2e0-296f-47ce-b90e-5f70c7d896fb','\"-\"'),(163,'2023-09-02 22:01:17',NULL,1,3,'fdsf',3,3,1,17,0,9,'35a1a2e0-296f-47ce-b90e-5f7s0c7d896f','\"-\"'),(164,'2023-09-02 22:08:26',NULL,1,5,'e',10,1,1,17,0,10,'rew32fds fda','\"-\"'),(165,'2023-09-02 22:46:13',NULL,1,6,'test3333333333333',10,1,1,17,0,10,'ewqewqe','3413bc71-9901-405a-8482-50cdabcf22ad'),(166,'2023-09-02 22:46:25',NULL,1,17,'ssssss',10,2,1,17,1,20,'dsafsafdsadaws','338eed9c-84e0-4cce-bafc-56ce44881c2b'),(167,'2023-09-03 02:29:44',NULL,1,8,'rersr',3,1,1,18,0,3,'dsafdsafd','1caecf07-5101-4ee6-8fd8-f0ad9c90a009'),(168,'2023-09-03 03:17:22',NULL,1,7,'wwwwwwwwwwwwwww',4,1,1,18,0,4,'safdsafdsadsa','6d490df7-7072-420d-87ba-b4deb531120c'),(169,'2023-09-03 03:17:34',NULL,1,5,'e',10,3,1,18,0,30,'afdsafs','89cb0b4d-fe48-4920-929e-dfc725906047'),(170,'2023-09-03 03:17:40',NULL,1,4,'prod1',10.5,1,1,18,0,10.5,'dsafdsafds','437f0518-8fef-4634-a5e8-0506c22ea346'),(171,'2023-09-03 03:19:05',NULL,1,20,'ssssss',10,1,1,18,0,10,'afsdaff','fddc4fec-30f5-453f-a000-52ca998afb5a'),(172,'2023-09-03 03:22:40',NULL,1,9,'wwwwwwwwwwwwwww',23,1,1,18,0,23,'ewrewrew654343f','152e9a72-5250-49d0-8d1b-9f3ab165f00b'),(173,'2023-09-03 03:25:34',NULL,1,16,'ssssss',10,2,1,18,0,20,'dsfaesd','433e517e-c96a-4877-b4c8-bff02593c177'),(174,'2023-09-03 05:06:52',NULL,1,15,'ssssss',10,1,1,18,0,10,'fewrewrewrew','c7ae1981-b06f-402f-be54-bfc3ade379ed'),(175,'2023-09-03 05:07:53',NULL,1,10,'22222222222222',2,1,1,18,0,2,'rewrewr','71904974-eef4-4870-8a93-16bb041c22eb'),(176,'2023-09-03 05:25:02',NULL,1,12,'ssssss',10,2,1,18,0,20,'ewrewrewr','4ad3d4bb-6160-4209-b777-0989f54bd220'),(177,'2023-09-03 16:12:11',NULL,1,11,'22222222222222',2,1,1,18,0,2,'rewrewrewr','7a608fdd-4a60-47b4-89bd-dd978152802f'),(178,'2023-09-03 16:13:20',NULL,0,10,'22222222222222',2,1,1,18,0,2,'ewrewrew4tr3fd','71904974-eef4-4870-8a93-16bb041c22eb'),(179,'2023-09-03 16:13:30',NULL,0,20,'ssssss',10,1,1,18,0,10,'rewrewrew','fddc4fec-30f5-453f-a000-52ca998afb5a'),(180,'2023-09-03 16:13:39',NULL,0,3,'fdsf',3,1,1,18,0,3,'rewrew43fgdew','30d8c1ea-2e69-4512-95dc-8877a698886b'),(181,'2023-09-03 16:13:50',NULL,0,19,'ssssss',10,1,1,18,0,10,'rewrewrewrewqvf ew','3cbbcf6c-1ce5-4439-854e-35f038731ea5'),(182,'2023-09-03 16:13:57',NULL,0,11,'22222222222222',2,2,1,18,1,4,'rewrewrewre','7a608fdd-4a60-47b4-89bd-dd978152802f');
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
 1 AS `rutName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `useId` int(11) NOT NULL AUTO_INCREMENT,
  `useCreatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `useUpdatedAt` datetime DEFAULT NULL,
  `useDeleted` smallint(6) NOT NULL DEFAULT 0,
  `useName` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `usePassword` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `useEmail` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `useComId` int(11) NOT NULL,
  `useKey` varchar(36) NOT NULL,
  PRIMARY KEY (`useId`),
  UNIQUE KEY `useKey_UNIQUE` (`useKey`),
  KEY `fk_users_companys1_idx` (`useComId`),
  CONSTRAINT `fk_users_companys1` FOREIGN KEY (`useComId`) REFERENCES `companys` (`comId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2023-01-26 22:13:39',NULL,0,'milton','milton','milton.guty@gmail.comfghjfgjh',1,'38980c16-971e-426b-8e3e-8ad87deb36ca'),(4,'2023-08-06 21:33:13',NULL,0,'milton','miltonsss','milton',1,'f1480867-8a57-462c-ba34-9c2296af4656'),(5,'2023-08-07 01:34:31',NULL,1,'0000','0000','milton.guty@gmail.com',1,'bfdfb0f5-fd7a-42ff-8a93-8e787d77cde9'),(6,'2023-08-07 02:52:42',NULL,1,'miltonguty','miltonguty','72297259',1,'e6820a5e-f9d2-43f5-8d50-482647795d9a'),(1002,'2023-09-01 15:17:59',NULL,0,'miltonXXXXXXXXXXXX','miltonXXXXXXXXXXXX','milton.guty@gmail.com',1,'e6a6efb8-2265-4e48-9d76-b06c56b61675'),(1003,'2023-09-01 15:18:16',NULL,0,'miltonXXXXXXXXXXXX','miltonXXXXXXXXXXXX','milton.guty@gmail.com',1,'f31055b3-b1eb-4a00-99e9-3c7c5a4b03f8'),(1004,'2023-09-01 15:18:29',NULL,0,'miltonXXXXXXXXXXXX','miltonXXXXXXXXXXXX','milton.guty@gmail.com',1,'29488c4c-ffb3-4e79-89a1-02df633c45bf'),(1005,'2023-09-01 15:21:28',NULL,0,'333333','333333','milton.guty@gmail.com',1,'da7aacc2-f57f-4b56-927b-21065deed338'),(1006,'2023-09-01 15:21:59',NULL,0,'test','test','testfsdfds',1,'c3ba9b74-882e-4cff-9ed5-c0730edf27f5'),(1007,'2023-09-01 15:32:59',NULL,0,'leidySSSS','leidy','lfcdsfsdafdsfdsXXXX',1,'9378f939-78b9-4a29-80a4-dee1e64758f2'),(1008,'2023-09-03 21:40:21',NULL,0,'66666','66666','6666666',2,'UUID()');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sace4948_system'
--

--
-- Dumping routines for database 'sace4948_system'
--
/*!50003 DROP FUNCTION IF EXISTS `GENERATEUUID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`sace4948_system`@`%` FUNCTION `GENERATEUUID`() RETURNS int(11)
BEGIN

RETURN (select uuid());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GETTOTALDESCUENTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`sace4948_system`@`%` FUNCTION `GETTOTALDESCUENTO`(salId int, salDesc float ) RETURNS int(11)
BEGIN

RETURN (salDesc * (SELECT GETTOTALNOTESALES(salId)) / 100) ;
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
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`sace4948_system`@`%` FUNCTION `GetTotalNoteSales`(salesId Int) RETURNS int(11)
BEGIN

RETURN (SELECT 
                IFNULL(SUM(`salesdetails`.`sadSubTotal`), 0) AS `total`
            FROM
                `salesdetails`
            WHERE
                `salesdetails`.`sadSalId` = salesId AND `salesdetails`.`sadDeleted` = 0) ;
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
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`sace4948_system`@`%` FUNCTION `GETTOTALPAYMENT`(salId int ) RETURNS int(11)
BEGIN

RETURN (SELECT 
                IFNULL(SUM(`payments`.`payMount`), 0) AS `totalPayment`
            FROM
                `payments`
            WHERE
                `payments`.`paySalId` = salId);
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
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`sace4948_system`@`%` FUNCTION `GETTOTALWITHDUE`(cliId int ) RETURNS int(11)
BEGIN

RETURN (SELECT ifnull( sum( due),0) from salesview where salCLiid= cliId and salDeleted=0);
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
CREATE DEFINER=`sace4948_system`@`%` PROCEDURE `UpdateTotalPurchases`(IN purId  INT)
BEGIN
DECLARE Total float default 0;
 SET Total  = (select sum(pudProdPrice*pudProdCount) from purchasesdetails where pudpurId=purId);
Update 	purchases set purTotal=Total  where purId=purId;
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
/*!50001 VIEW `clientsview` AS select `clients`.`cliId` AS `cliId`,`clients`.`cliCreatedAt` AS `cliCreatedAt`,`clients`.`cliUpdatedAt` AS `cliUpdatedAt`,`clients`.`cliDeleted` AS `cliDeleted`,`clients`.`cliFirstName` AS `cliFirstName`,`clients`.`cliLastName` AS `cliLastName`,`clients`.`cliEmail` AS `cliEmail`,`clients`.`cliPhone` AS `cliPhone`,`clients`.`cliComId` AS `cliComId`,`clients`.`cliKey` AS `cliKey`,`clients`.`cliRutId` AS `cliRutId`,(select `GETTOTALWITHDUE`(`clients`.`cliId`)) AS `deuda` from `clients` */;
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
/*!50001 VIEW `salesview` AS select `sales`.`salId` AS `salId`,`sales`.`salCreatedAt` AS `salCreatedAt`,`sales`.`salUpdatedAt` AS `salUpdatedAt`,`sales`.`salDeleted` AS `salDeleted`,`sales`.`salDate` AS `salDate`,`sales`.`salLiteral` AS `salLiteral`,`sales`.`salComId` AS `salComId`,`sales`.`salCliId` AS `salCliId`,`sales`.`salClose` AS `salClose`,`sales`.`salUseId` AS `salUseId`,`sales`.`salKey` AS `salKey`,`sales`.`salDescuento` AS `salDescuento`,(select `GETTOTALNOTESALES`(`sales`.`salId`)) AS `total`,(select `GETTOTALDESCUENTO`(`sales`.`salId`,`sales`.`salDescuento`)) AS `totalDesc`,(select `GETTOTALNOTESALES`(`sales`.`salId`)) - (select `GETTOTALDESCUENTO`(`sales`.`salId`,`sales`.`salDescuento`)) AS `totalWithDesc`,(select `GETTOTALPAYMENT`(`sales`.`salId`)) AS `totalPayment`,(select `GETTOTALNOTESALES`(`sales`.`salId`)) - (select `GETTOTALDESCUENTO`(`sales`.`salId`,`sales`.`salDescuento`)) - (select `GETTOTALPAYMENT`(`sales`.`salId`)) AS `due`,`clients`.`cliFirstName` AS `cliFirstName`,`clients`.`cliLastName` AS `cliLastName`,`clients`.`cliKey` AS `cliKey`,`rutes`.`rutName` AS `rutName` from ((`sales` join `clients` on(`sales`.`salCliId` = `clients`.`cliId`)) join `rutes` on(`rutes`.`rutId` = `clients`.`cliRutId`)) */;
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

-- Dump completed on 2023-09-03 23:51:10
