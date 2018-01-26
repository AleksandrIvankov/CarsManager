CREATE DATABASE  IF NOT EXISTS `ivankov` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ivankov`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: ivankov
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_id_uindex` (`id`),
  UNIQUE KEY `brands_name_uindex` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Audi'),(2,'BMW'),(3,'Mercedes'),(4,'Volkswagen');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salon`
--

DROP TABLE IF EXISTS `salon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `postal_code` int(11) NOT NULL,
  `address` tinytext NOT NULL,
  `working_hours` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `salon_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salon`
--

LOCK TABLES `salon` WRITE;
/*!40000 ALTER TABLE `salon` DISABLE KEYS */;
INSERT INTO `salon` VALUES (1,'Terrasoft',8657,'Kiev city, Lobanovskogo avenue,132','09:00-20:00'),(2,'GlobalLogic',3191,'Lviv city, Avraam Lincoln,24','10:00-19:00'),(3,'Playtech',2095,'Kiev city, Sport square,1A','08:00-18:00'),(4,'ITEA',9563,'Dnipro city, Khreschatyk st., 20','09:00-19:00');
/*!40000 ALTER TABLE `salon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salon_vehicle`
--

DROP TABLE IF EXISTS `salon_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salon_vehicle` (
  `salon` int(11) NOT NULL,
  `vehicle` int(11) NOT NULL,
  KEY `salon_vehicle_salon_id_fk` (`salon`),
  KEY `salon_vehicle_vehicle_id_fk` (`vehicle`),
  CONSTRAINT `salon_vehicle_salon_id_fk` FOREIGN KEY (`salon`) REFERENCES `salon` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salon_vehicle_vehicle_id_fk` FOREIGN KEY (`vehicle`) REFERENCES `vehicle` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salon_vehicle`
--

LOCK TABLES `salon_vehicle` WRITE;
/*!40000 ALTER TABLE `salon_vehicle` DISABLE KEYS */;
INSERT INTO `salon_vehicle` VALUES (1,3),(2,4),(3,5),(4,6),(1,7),(2,8),(3,9),(4,10),(1,11),(2,12),(3,13);
/*!40000 ALTER TABLE `salon_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` int(11) NOT NULL,
  `model` varchar(32) NOT NULL,
  `volume` double NOT NULL,
  `hp` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `year` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vehicle_id_uindex` (`id`),
  KEY `vehicle_brands_id_fk` (`brand`),
  CONSTRAINT `vehicle_brands_id_fk` FOREIGN KEY (`brand`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (3,1,'A5',2,252,55000,2015),(4,1,'A7',3,293,110000,2016),(5,1,'TT',2,230,60000,2017),(6,2,'X5M',4.4,575,130000,2014),(7,2,'M6',4.3,560,140000,2016),(8,2,'M4',2.9,431,85000,2016),(9,3,'E306',2.3,243,65000,2017),(10,3,'AMG_GT',4.9,622,169000,2017),(11,3,'S63',5.4,576,196000,2017),(12,4,'GOLF_R',2,310,50000,2016),(13,4,'Beetle',1.4,160,30000,2016);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-02 16:18:55
