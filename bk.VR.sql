-- MySQL dump 10.13  Distrib 5.7.44, for Linux (x86_64)
--
-- Host: localhost    Database: VR
-- ------------------------------------------------------
-- Server version	5.7.44

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='data will be stored here category';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `ddress` varchar(80) DEFAULT NULL,
  `telephone` char(9) DEFAULT NULL,
  `supplier_ruc` int(11) NOT NULL,
  `supplier_2_ruc` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `customer_supplier` (`supplier_2_ruc`),
  CONSTRAINT `customer_supplier` FOREIGN KEY (`supplier_2_ruc`) REFERENCES `supplier` (`ruc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='data will be stored here customer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `code` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `supplier_ruc` varchar(20) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `product_category` (`category_id`),
  KEY `product_supplier` (`supplier_ruc`),
  CONSTRAINT `product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `product_supplier` FOREIGN KEY (`supplier_ruc`) REFERENCES `supplier` (`ruc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='data will be stored here product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale` (
  `ID` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `final_amount` decimal(10,2) DEFAULT NULL,
  `customer_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `sale_customer` (`customer_ID`),
  CONSTRAINT `sale_customer` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Sales information will be saved here';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saleDetail`
--

DROP TABLE IF EXISTS `saleDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saleDetail` (
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `sale_ID` int(11) NOT NULL,
  `product_code` int(11) NOT NULL,
  PRIMARY KEY (`quantity`),
  KEY `saleDetail_product` (`product_code`),
  KEY `saleDetail_sale` (`sale_ID`),
  CONSTRAINT `saleDetail_product` FOREIGN KEY (`product_code`) REFERENCES `product` (`code`),
  CONSTRAINT `saleDetail_sale` FOREIGN KEY (`sale_ID`) REFERENCES `sale` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Sales informationDetail will be saved here';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saleDetail`
--

LOCK TABLES `saleDetail` WRITE;
/*!40000 ALTER TABLE `saleDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `saleDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `ruc` varchar(20) NOT NULL,
  `names` varchar(80) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL,
  `phone` char(9) DEFAULT NULL,
  PRIMARY KEY (`ruc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='data will be stored here supplier';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-04 14:57:43
