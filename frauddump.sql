-- MySQL dump 10.13  Distrib 5.5.41, for Win64 (x86)
--
-- Host: localhost    Database: fraud
-- ------------------------------------------------------
-- Server version	5.5.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abnormaltimes`
--

DROP TABLE IF EXISTS `abnormaltimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abnormaltimes` (
  `itemNo` varchar(255) DEFAULT NULL,
  `fromTime` bigint(20) DEFAULT NULL,
  `toTime` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abnormaltimes`
--

LOCK TABLES `abnormaltimes` WRITE;
/*!40000 ALTER TABLE `abnormaltimes` DISABLE KEYS */;
/*!40000 ALTER TABLE `abnormaltimes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `averageamounttable`
--

DROP TABLE IF EXISTS `averageamounttable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `averageamounttable` (
  `AmountID` int(11) DEFAULT NULL,
  `AverageAmount` decimal(40,15) DEFAULT NULL,
  `AmountCount` decimal(40,15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `averageamounttable`
--

LOCK TABLES `averageamounttable` WRITE;
/*!40000 ALTER TABLE `averageamounttable` DISABLE KEYS */;
INSERT INTO `averageamounttable` VALUES (1,835.536454336147000,1303.000000000000000);
/*!40000 ALTER TABLE `averageamounttable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `averagedurationtable`
--

DROP TABLE IF EXISTS `averagedurationtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `averagedurationtable` (
  `DurationID` int(11) DEFAULT NULL,
  `AverageDuration` decimal(40,15) DEFAULT NULL,
  `DurationCount` decimal(40,15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `averagedurationtable`
--

LOCK TABLES `averagedurationtable` WRITE;
/*!40000 ALTER TABLE `averagedurationtable` DISABLE KEYS */;
INSERT INTO `averagedurationtable` VALUES (1,-8372384315.046931000000000,1662.000000000000000);
/*!40000 ALTER TABLE `averagedurationtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avgqty`
--

DROP TABLE IF EXISTS `avgqty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avgqty` (
  `ITEMNO` varchar(255) DEFAULT NULL,
  `AVG` int(11) DEFAULT NULL,
  `STDEV` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avgqty`
--

LOCK TABLES `avgqty` WRITE;
/*!40000 ALTER TABLE `avgqty` DISABLE KEYS */;
INSERT INTO `avgqty` VALUES ('I0011',4,10),('I0010',2,3),('I0012',1,1),('I0015',4,9),('I0016',100,100),('I0013',10,10),('I0014',7,9);
/*!40000 ALTER TABLE `avgqty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklisted`
--

DROP TABLE IF EXISTS `blacklisted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklisted` (
  `id` int(11) DEFAULT NULL,
  `cardnum` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklisted`
--

LOCK TABLES `blacklisted` WRITE;
/*!40000 ALTER TABLE `blacklisted` DISABLE KEYS */;
INSERT INTO `blacklisted` VALUES (1,5055210036965540),(2,3714496353984310),(3,3772822463100050);
/*!40000 ALTER TABLE `blacklisted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expensiveitem`
--

DROP TABLE IF EXISTS `expensiveitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expensiveitem` (
  `itemNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expensiveitem`
--

LOCK TABLES `expensiveitem` WRITE;
/*!40000 ALTER TABLE `expensiveitem` DISABLE KEYS */;
INSERT INTO `expensiveitem` VALUES ('I0013'),('I0014');
/*!40000 ALTER TABLE `expensiveitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firstcounttable`
--

DROP TABLE IF EXISTS `firstcounttable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firstcounttable` (
  `firstState` varchar(255) DEFAULT NULL,
  `count` decimal(40,15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firstcounttable`
--

LOCK TABLES `firstcounttable` WRITE;
/*!40000 ALTER TABLE `firstcounttable` DISABLE KEYS */;
INSERT INTO `firstcounttable` VALUES ('HFS',5.000000000000000),('HFS',5.000000000000000),('HFS',5.000000000000000),('HFS',5.000000000000000),('HFS',5.000000000000000),('HFS',5.000000000000000),('HFS',5.000000000000000),('HFS',5.000000000000000),('HFS',5.000000000000000),('HFS',5.000000000000000),('HFS',5.000000000000000),('HFS',5.000000000000000),('HFS',5.000000000000000),('HFS',5.000000000000000),('HFS',5.000000000000000),('HFS',5.000000000000000),('HFS',5.000000000000000),('HFS',5.000000000000000);
/*!40000 ALTER TABLE `firstcounttable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fraudcount`
--

DROP TABLE IF EXISTS `fraudcount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fraudcount` (
  `CARDNUM` bigint(20) DEFAULT NULL,
  `TXNID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fraudcount`
--

LOCK TABLES `fraudcount` WRITE;
/*!40000 ALTER TABLE `fraudcount` DISABLE KEYS */;
/*!40000 ALTER TABLE `fraudcount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `markovmodeltable`
--

DROP TABLE IF EXISTS `markovmodeltable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `markovmodeltable` (
  `transition` varchar(10) DEFAULT NULL,
  `firstState` varchar(10) DEFAULT NULL,
  `count` double DEFAULT NULL,
  `probability` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `markovmodeltable`
--

LOCK TABLES `markovmodeltable` WRITE;
/*!40000 ALTER TABLE `markovmodeltable` DISABLE KEYS */;
INSERT INTO `markovmodeltable` VALUES ('LFSLFS','LFS',1,0),('LFSHFH','LFS',1,0);
/*!40000 ALTER TABLE `markovmodeltable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rejectedtxns`
--

DROP TABLE IF EXISTS `rejectedtxns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rejectedtxns` (
  `cardnum` bigint(20) DEFAULT NULL,
  `txnid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rejectedtxns`
--

LOCK TABLES `rejectedtxns` WRITE;
/*!40000 ALTER TABLE `rejectedtxns` DISABLE KEYS */;
/*!40000 ALTER TABLE `rejectedtxns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suspiciousip`
--

DROP TABLE IF EXISTS `suspiciousip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suspiciousip` (
  `id` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suspiciousip`
--

LOCK TABLES `suspiciousip` WRITE;
/*!40000 ALTER TABLE `suspiciousip` DISABLE KEYS */;
/*!40000 ALTER TABLE `suspiciousip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suspiciousmail`
--

DROP TABLE IF EXISTS `suspiciousmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suspiciousmail` (
  `id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suspiciousmail`
--

LOCK TABLES `suspiciousmail` WRITE;
/*!40000 ALTER TABLE `suspiciousmail` DISABLE KEYS */;
/*!40000 ALTER TABLE `suspiciousmail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table2`
--

DROP TABLE IF EXISTS `table2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table2` (
  `SYMBOL` varchar(255) DEFAULT NULL,
  `PRICE` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table2`
--

LOCK TABLES `table2` WRITE;
/*!40000 ALTER TABLE `table2` DISABLE KEYS */;
/*!40000 ALTER TABLE `table2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `cardnum` bigint(20) DEFAULT NULL,
  `txnamt` double DEFAULT NULL,
  `merchantid` varchar(255) DEFAULT NULL,
  `terminalloc` varchar(255) DEFAULT NULL,
  `terminalcountry` varchar(255) DEFAULT NULL,
  `acquirercountry` varchar(255) DEFAULT NULL,
  `acquirerid` bigint(20) DEFAULT NULL,
  `currency` varchar(4) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `shippingaddress` varchar(255) DEFAULT NULL,
  `shippingcountry` varchar(255) DEFAULT NULL,
  `billingaddress` varchar(255) DEFAULT NULL,
  `billingcountry` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `itemNo` varchar(255) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `txnid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (3714496353984310,3380,'Ebay','','AUS','Ukraine',555055,'USD','mitsue_tollner@yahoo.com','8 W Cerritos Ave #54','Ukraine','8 W Cerritos Ave #54','Ukraine','131.26.192.174','IT1584',1420216491791,'1'),(3714496353984310,1670,'CPC','Dehiwela','SL','Sri Lanka',303030,'LKR','calbares@gmail.com','3 Mcauley Dr','Sri Lanka','3 Mcauley Dr','Sri Lanka','131.26.192.174','IT1584',1420216499791,'2'),(3714496353984310,601960,'Sri Lankan Airlines','','UK','Kenya',355612,'EUR','tawna@gmail.com','322 New Horizon Blvd','Kenya','322 New Horizon Blvd','Kenya','115.137.172.173','IT1302',1420242307536,'3'),(3782822463100050,44737,'Singer','','US','Nigeria',305520,'LKR','lpaprocki@hotmail.com','4 B Blue Ridge Blvd','Nigeria','4 B Blue Ridge Blvd','Nigeria','94.154.94.130','IT1496',1420248950835,'4'),(3782822463100050,700,'Cargills','Pasyala','SL','Sri Lanka',404090,'LKR','bfigeroa@aol.com','2371 Jerrold Ave','Sri Lanka','2371 Jerrold Ave','Sri Lanka','32.139.71.59','IT1491',1420382073111,'5'),(3782822463100050,2515935,'Vogue Jewellers','Colombo 03','SL','Sri Lanka',407856,'LKR','shenika@gmail.com','56 E Morehead St','Sri Lanka','56 E Morehead St','Sri Lanka','48.154.179.86','IT1344',1420413019654,'6'),(3782822463100050,166,'Keels Super','Jaffna','SL','Sri Lanka',589632,'LKR','delmy.ahle@hotmail.com','73 State Road 434 E','Sri Lanka','73 State Road 434 E','Sri Lanka','120.94.72.95','IT1066',1420426584600,'7'),(3782822463100050,1432941,'Vogue Jewellers','Colombo 03','SL','US',412352,'USD','micaela_rhymes@gmail.com','74 S Westgate St','US','74 S Westgate St','US','58.183.75.123','IT1825',1420443908111,'8'),(3787344936710000,2590,'Ebay','','US','Japan',403855,'JPY','leota@hotmail.com','639 Main St','Japan','639 Main St','Japan','192.113.129.59','IT1928',1420510478004,'9'),(3787344936710000,478,'Cargills','Kandy','SL','Sri Lanka',407856,'LKR','meaghan@hotmail.com','7 Eads St','Sri Lanka','7 Eads St','Sri Lanka','151.125.145.178','IT1912',1420574771382,'10'),(3787344936710000,3181,'Cargills','Matara','SL','Sri Lanka',404090,'LKR','elly_morocco@gmail.com','1 State Route 27','Sri Lanka','1 State Route 27','Sri Lanka','116.40.85.35','IT1427',1420588056167,'11'),(4078560052521110,2043,'Keels Super','Colombo 01','SL','Sri Lanka',407856,'LKR','jbutt@gmail.com','6649 N Blue Gum St','Sri Lanka','6649 N Blue Gum St','Sri Lanka','13.33.21.149','IT1506',1420591251684,'12'),(4078560052521110,289176,'Sri Lankan Airlines','Colombo 01','SL','UK ',555222,'GBP','kris@gmail.com','34 Center St','UK ','34 Center St','UK ','27.114.94.126','IT1549',1420645970983,'13'),(4078560052521110,3594,'Keels Super','Galle','SL','Sri Lanka',589632,'LKR','fletcher.flosi@yahoo.com','5 Boston Ave #88','Sri Lanka','5 Boston Ave #88','Sri Lanka','35.103.76.170','IT1154',1420814388117,'14'),(4078560052521110,23704,'Damro','Nawala','SL','Sri Lanka',465221,'LKR','asergi@gmail.com','25 E 75th St #69','Sri Lanka','25 E 75th St #69','Sri Lanka','32.179.84.157','IT1027',1420833808192,'15'),(4078560052521110,1000,'Cargills','Negombo','SL','Sri Lanka',465221,'LKR','kallie.blackwood@gmail.com','6 S 33rd St','Sri Lanka','6 S 33rd St','Sri Lanka','173.168.30.45','IT1906',1420837175661,'16'),(4078560052521110,147368,'PC House','Colombo 04','SL','Sri Lanka',465221,'LKR','laurel_reitler@reitler.com','3273 State St','Sri Lanka','3273 State St','Sri Lanka','84.82.129.59','IT1824',1420853242986,'17'),(4088530014523650,888664,'Sri Lankan Airlines','','US','US',405055,'USD','brhym@rhym.com','618 W Yakima Ave','US','618 W Yakima Ave','US','96.61.140.185','IT1015',1420984407739,'18'),(5055210036965540,5442,'Keels Super','Galle','SL','Sri Lanka',465221,'LKR','gladys.rim@rim.org','7 W Jackson Blvd','Sri Lanka','7 W Jackson Blvd','Sri Lanka','111.179.68.33','IT1026',1421038716316,'19'),(5055210036965540,1047967,'Vogue Jewellers','Colombo 03','SL','Italy',545452,'LKR','wkusko@yahoo.com','228 Runamuck Pl #2808','Italy','228 Runamuck Pl #2808','Italy','71.155.65.35','IT1133',1421117906294,'20'),(5055210036965540,28124,'Singer','Kurunegala','SL','Sri Lanka',407856,'LKR','ammie@corrio.com','37275 St  Rt 17m M','Sri Lanka','37275 St  Rt 17m M','Sri Lanka','108.68.115.103','IT1573',1421149679708,'21'),(5055210036965540,694,'Arpico','Hyde Park Corner','SL','Sri Lanka',589632,'LKR','lperin@perin.org','98 Connecticut Ave Nw','Sri Lanka','98 Connecticut Ave Nw','Sri Lanka','102.76.99.192','IT1150',1421163564697,'22'),(5055210036965540,26500,'Keels Super','Trincomalee','SL','Sri Lanka',404090,'LKR','deeanna_juhas@gmail.com','69734 E Carrillo St','Sri Lanka','69734 E Carrillo St','Sri Lanka','173.83.99.127','IT1849',1421164279828,'23'),(5055210036965540,500,'Carnival','Colombo 03','SL','Sri Lanka',407856,'LKR','vmondella@mondella.com','394 Manchester Blvd','Sri Lanka','394 Manchester Blvd','Sri Lanka','29.188.20.178','IT1227',1421268485733,'24'),(5055210036965540,24100,'Dankotuwa','Colombo 03','SL','Sri Lanka',407856,'LKR','johnetta_abdallah@aol.com','6 Greenleaf Ave','Sri Lanka','6 Greenleaf Ave','Sri Lanka','192.89.105.91','IT1945',1421353988306,'25'),(3714496353984310,3380,'Ebay','','AUS','Ukraine',555055,'USD','mitsue_tollner@yahoo.com','8 W Cerritos Ave #54','Ukraine','8 W Cerritos Ave #54','Ukraine','131.26.192.174','IT1584',1420216491791,'1'),(3714496353984310,1670,'CPC','Dehiwela','SL','Sri Lanka',303030,'LKR','calbares@gmail.com','3 Mcauley Dr','Sri Lanka','3 Mcauley Dr','Sri Lanka','131.26.192.174','IT1584',1420216499791,'2'),(3714496353984310,601960,'Sri Lankan Airlines','','UK','Kenya',355612,'EUR','tawna@gmail.com','322 New Horizon Blvd','Kenya','322 New Horizon Blvd','Kenya','115.137.172.173','IT1302',1420242307536,'3'),(3782822463100050,44737,'Singer','','US','Nigeria',305520,'LKR','lpaprocki@hotmail.com','4 B Blue Ridge Blvd','Nigeria','4 B Blue Ridge Blvd','Nigeria','94.154.94.130','IT1496',1420248950835,'4'),(3782822463100050,700,'Cargills','Pasyala','SL','Sri Lanka',404090,'LKR','bfigeroa@aol.com','2371 Jerrold Ave','Sri Lanka','2371 Jerrold Ave','Sri Lanka','32.139.71.59','IT1491',1420382073111,'5'),(3782822463100050,2515935,'Vogue Jewellers','Colombo 03','SL','Sri Lanka',407856,'LKR','shenika@gmail.com','56 E Morehead St','Sri Lanka','56 E Morehead St','Sri Lanka','48.154.179.86','IT1344',1420413019654,'6'),(3782822463100050,166,'Keels Super','Jaffna','SL','Sri Lanka',589632,'LKR','delmy.ahle@hotmail.com','73 State Road 434 E','Sri Lanka','73 State Road 434 E','Sri Lanka','120.94.72.95','IT1066',1420426584600,'7'),(3782822463100050,1432941,'Vogue Jewellers','Colombo 03','SL','US',412352,'USD','micaela_rhymes@gmail.com','74 S Westgate St','US','74 S Westgate St','US','58.183.75.123','IT1825',1420443908111,'8'),(3787344936710000,2590,'Ebay','','US','Japan',403855,'JPY','leota@hotmail.com','639 Main St','Japan','639 Main St','Japan','192.113.129.59','IT1928',1420510478004,'9'),(3787344936710000,478,'Cargills','Kandy','SL','Sri Lanka',407856,'LKR','meaghan@hotmail.com','7 Eads St','Sri Lanka','7 Eads St','Sri Lanka','151.125.145.178','IT1912',1420574771382,'10'),(3787344936710000,3181,'Cargills','Matara','SL','Sri Lanka',404090,'LKR','elly_morocco@gmail.com','1 State Route 27','Sri Lanka','1 State Route 27','Sri Lanka','116.40.85.35','IT1427',1420588056167,'11'),(4078560052521110,2043,'Keels Super','Colombo 01','SL','Sri Lanka',407856,'LKR','jbutt@gmail.com','6649 N Blue Gum St','Sri Lanka','6649 N Blue Gum St','Sri Lanka','13.33.21.149','IT1506',1420591251684,'12'),(4078560052521110,289176,'Sri Lankan Airlines','Colombo 01','SL','UK ',555222,'GBP','kris@gmail.com','34 Center St','UK ','34 Center St','UK ','27.114.94.126','IT1549',1420645970983,'13'),(4078560052521110,3594,'Keels Super','Galle','SL','Sri Lanka',589632,'LKR','fletcher.flosi@yahoo.com','5 Boston Ave #88','Sri Lanka','5 Boston Ave #88','Sri Lanka','35.103.76.170','IT1154',1420814388117,'14'),(4078560052521110,23704,'Damro','Nawala','SL','Sri Lanka',465221,'LKR','asergi@gmail.com','25 E 75th St #69','Sri Lanka','25 E 75th St #69','Sri Lanka','32.179.84.157','IT1027',1420833808192,'15'),(4078560052521110,1000,'Cargills','Negombo','SL','Sri Lanka',465221,'LKR','kallie.blackwood@gmail.com','6 S 33rd St','Sri Lanka','6 S 33rd St','Sri Lanka','173.168.30.45','IT1906',1420837175661,'16'),(4078560052521110,147368,'PC House','Colombo 04','SL','Sri Lanka',465221,'LKR','laurel_reitler@reitler.com','3273 State St','Sri Lanka','3273 State St','Sri Lanka','84.82.129.59','IT1824',1420853242986,'17'),(4088530014523650,888664,'Sri Lankan Airlines','','US','US',405055,'USD','brhym@rhym.com','618 W Yakima Ave','US','618 W Yakima Ave','US','96.61.140.185','IT1015',1420984407739,'18'),(5055210036965540,5442,'Keels Super','Galle','SL','Sri Lanka',465221,'LKR','gladys.rim@rim.org','7 W Jackson Blvd','Sri Lanka','7 W Jackson Blvd','Sri Lanka','111.179.68.33','IT1026',1421038716316,'19'),(5055210036965540,1047967,'Vogue Jewellers','Colombo 03','SL','Italy',545452,'LKR','wkusko@yahoo.com','228 Runamuck Pl #2808','Italy','228 Runamuck Pl #2808','Italy','71.155.65.35','IT1133',1421117906294,'20'),(5055210036965540,28124,'Singer','Kurunegala','SL','Sri Lanka',407856,'LKR','ammie@corrio.com','37275 St  Rt 17m M','Sri Lanka','37275 St  Rt 17m M','Sri Lanka','108.68.115.103','IT1573',1421149679708,'21'),(5055210036965540,694,'Arpico','Hyde Park Corner','SL','Sri Lanka',589632,'LKR','lperin@perin.org','98 Connecticut Ave Nw','Sri Lanka','98 Connecticut Ave Nw','Sri Lanka','102.76.99.192','IT1150',1421163564697,'22'),(5055210036965540,26500,'Keels Super','Trincomalee','SL','Sri Lanka',404090,'LKR','deeanna_juhas@gmail.com','69734 E Carrillo St','Sri Lanka','69734 E Carrillo St','Sri Lanka','173.83.99.127','IT1849',1421164279828,'23'),(5055210036965540,500,'Carnival','Colombo 03','SL','Sri Lanka',407856,'LKR','vmondella@mondella.com','394 Manchester Blvd','Sri Lanka','394 Manchester Blvd','Sri Lanka','29.188.20.178','IT1227',1421268485733,'24'),(5055210036965540,24100,'Dankotuwa','Colombo 03','SL','Sri Lanka',407856,'LKR','johnetta_abdallah@aol.com','6 Greenleaf Ave','Sri Lanka','6 Greenleaf Ave','Sri Lanka','192.89.105.91','IT1945',1421353988306,'25'),(3714496353984310,3380,'Ebay','','AUS','Ukraine',555055,'USD','mitsue_tollner@yahoo.com','8 W Cerritos Ave #54','Ukraine','8 W Cerritos Ave #54','Ukraine','131.26.192.174','IT1584',1420216491791,'1'),(3714496353984310,1670,'CPC','Dehiwela','SL','Sri Lanka',303030,'LKR','calbares@gmail.com','3 Mcauley Dr','Sri Lanka','3 Mcauley Dr','Sri Lanka','131.26.192.174','IT1584',1420216499791,'2'),(3714496353984310,601960,'Sri Lankan Airlines','','UK','Kenya',355612,'EUR','tawna@gmail.com','322 New Horizon Blvd','Kenya','322 New Horizon Blvd','Kenya','115.137.172.173','IT1302',1420242307536,'3'),(3782822463100050,44737,'Singer','','US','Nigeria',305520,'LKR','lpaprocki@hotmail.com','4 B Blue Ridge Blvd','Nigeria','4 B Blue Ridge Blvd','Nigeria','94.154.94.130','IT1496',1420248950835,'4'),(3782822463100050,700,'Cargills','Pasyala','SL','Sri Lanka',404090,'LKR','bfigeroa@aol.com','2371 Jerrold Ave','Sri Lanka','2371 Jerrold Ave','Sri Lanka','32.139.71.59','IT1491',1420382073111,'5'),(3782822463100050,2515935,'Vogue Jewellers','Colombo 03','SL','Sri Lanka',407856,'LKR','shenika@gmail.com','56 E Morehead St','Sri Lanka','56 E Morehead St','Sri Lanka','48.154.179.86','IT1344',1420413019654,'6'),(3782822463100050,166,'Keels Super','Jaffna','SL','Sri Lanka',589632,'LKR','delmy.ahle@hotmail.com','73 State Road 434 E','Sri Lanka','73 State Road 434 E','Sri Lanka','120.94.72.95','IT1066',1420426584600,'7'),(3782822463100050,1432941,'Vogue Jewellers','Colombo 03','SL','US',412352,'USD','micaela_rhymes@gmail.com','74 S Westgate St','US','74 S Westgate St','US','58.183.75.123','IT1825',1420443908111,'8'),(3787344936710000,2590,'Ebay','','US','Japan',403855,'JPY','leota@hotmail.com','639 Main St','Japan','639 Main St','Japan','192.113.129.59','IT1928',1420510478004,'9'),(3787344936710000,478,'Cargills','Kandy','SL','Sri Lanka',407856,'LKR','meaghan@hotmail.com','7 Eads St','Sri Lanka','7 Eads St','Sri Lanka','151.125.145.178','IT1912',1420574771382,'10'),(3787344936710000,3181,'Cargills','Matara','SL','Sri Lanka',404090,'LKR','elly_morocco@gmail.com','1 State Route 27','Sri Lanka','1 State Route 27','Sri Lanka','116.40.85.35','IT1427',1420588056167,'11'),(4078560052521110,2043,'Keels Super','Colombo 01','SL','Sri Lanka',407856,'LKR','jbutt@gmail.com','6649 N Blue Gum St','Sri Lanka','6649 N Blue Gum St','Sri Lanka','13.33.21.149','IT1506',1420591251684,'12'),(4078560052521110,289176,'Sri Lankan Airlines','Colombo 01','SL','UK ',555222,'GBP','kris@gmail.com','34 Center St','UK ','34 Center St','UK ','27.114.94.126','IT1549',1420645970983,'13'),(4078560052521110,3594,'Keels Super','Galle','SL','Sri Lanka',589632,'LKR','fletcher.flosi@yahoo.com','5 Boston Ave #88','Sri Lanka','5 Boston Ave #88','Sri Lanka','35.103.76.170','IT1154',1420814388117,'14'),(4078560052521110,23704,'Damro','Nawala','SL','Sri Lanka',465221,'LKR','asergi@gmail.com','25 E 75th St #69','Sri Lanka','25 E 75th St #69','Sri Lanka','32.179.84.157','IT1027',1420833808192,'15'),(4078560052521110,1000,'Cargills','Negombo','SL','Sri Lanka',465221,'LKR','kallie.blackwood@gmail.com','6 S 33rd St','Sri Lanka','6 S 33rd St','Sri Lanka','173.168.30.45','IT1906',1420837175661,'16'),(4078560052521110,147368,'PC House','Colombo 04','SL','Sri Lanka',465221,'LKR','laurel_reitler@reitler.com','3273 State St','Sri Lanka','3273 State St','Sri Lanka','84.82.129.59','IT1824',1420853242986,'17'),(4088530014523650,888664,'Sri Lankan Airlines','','US','US',405055,'USD','brhym@rhym.com','618 W Yakima Ave','US','618 W Yakima Ave','US','96.61.140.185','IT1015',1420984407739,'18'),(5055210036965540,5442,'Keels Super','Galle','SL','Sri Lanka',465221,'LKR','gladys.rim@rim.org','7 W Jackson Blvd','Sri Lanka','7 W Jackson Blvd','Sri Lanka','111.179.68.33','IT1026',1421038716316,'19'),(5055210036965540,1047967,'Vogue Jewellers','Colombo 03','SL','Italy',545452,'LKR','wkusko@yahoo.com','228 Runamuck Pl #2808','Italy','228 Runamuck Pl #2808','Italy','71.155.65.35','IT1133',1421117906294,'20'),(5055210036965540,28124,'Singer','Kurunegala','SL','Sri Lanka',407856,'LKR','ammie@corrio.com','37275 St  Rt 17m M','Sri Lanka','37275 St  Rt 17m M','Sri Lanka','108.68.115.103','IT1573',1421149679708,'21'),(5055210036965540,694,'Arpico','Hyde Park Corner','SL','Sri Lanka',589632,'LKR','lperin@perin.org','98 Connecticut Ave Nw','Sri Lanka','98 Connecticut Ave Nw','Sri Lanka','102.76.99.192','IT1150',1421163564697,'22'),(5055210036965540,26500,'Keels Super','Trincomalee','SL','Sri Lanka',404090,'LKR','deeanna_juhas@gmail.com','69734 E Carrillo St','Sri Lanka','69734 E Carrillo St','Sri Lanka','173.83.99.127','IT1849',1421164279828,'23'),(5055210036965540,500,'Carnival','Colombo 03','SL','Sri Lanka',407856,'LKR','vmondella@mondella.com','394 Manchester Blvd','Sri Lanka','394 Manchester Blvd','Sri Lanka','29.188.20.178','IT1227',1421268485733,'24'),(5055210036965540,24100,'Dankotuwa','Colombo 03','SL','Sri Lanka',407856,'LKR','johnetta_abdallah@aol.com','6 Greenleaf Ave','Sri Lanka','6 Greenleaf Ave','Sri Lanka','192.89.105.91','IT1945',1421353988306,'25');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-10 10:32:36
