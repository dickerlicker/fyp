-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: assignment1
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `flightschedule`
--

DROP TABLE IF EXISTS `flightschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flightschedule` (
  `flightscheduleID` int(11) NOT NULL AUTO_INCREMENT,
  `aircraftID` int(11) NOT NULL,
  `economyCost` int(11) DEFAULT NULL,
  `businessclassCost` int(11) DEFAULT NULL,
  `firstclassCost` int(11) DEFAULT NULL,
  `originAirport` varchar(45) DEFAULT NULL,
  `destinationAirport` varchar(45) DEFAULT NULL,
  `originCountry` varchar(45) DEFAULT NULL,
  `destinationCountry` varchar(45) DEFAULT NULL,
  `dateofDeparture` date DEFAULT NULL,
  `timeofDeparture` varchar(10) DEFAULT NULL,
  `dateofArrival` date DEFAULT NULL,
  `timeofArrival` varchar(10) DEFAULT NULL,
  `flightduration` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`flightscheduleID`),
  KEY `aircraftID_idx` (`aircraftID`),
  CONSTRAINT `aircraftID` FOREIGN KEY (`aircraftID`) REFERENCES `aircraft` (`aircraftID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightschedule`
--

LOCK TABLES `flightschedule` WRITE;
/*!40000 ALTER TABLE `flightschedule` DISABLE KEYS */;
INSERT INTO `flightschedule` VALUES (1111,1,230,460,900,'Changi Airport','Tan Son Nhat Airport','Singapore','Vietnam','2017-05-25','11:25 PM','2017-05-26','04:20 AM','4 hours 55 minutes'),(1112,2,560,990,1700,'Changi Airport','Narita International Airport','Singapore','Japan','2017-06-15','2:00 AM','2017-06-15','10:00 AM','8 hours'),(1113,5,800,1370,1880,'Changi Airport','Frankfurt Airport','Singapore','Germany','2017-06-06','07:00 AM','2017-06-06','08:00 PM','11 hours'),(1114,4,450,930,1500,'Narita International Airport','Changi Airport','Japan','Singapore','2017-06-23','03:00 PM','2017-06-23','11:00 PM','8 hours'),(1115,5,800,1370,1880,'Frankfurt Airport','Changi Airport','Germany','Singapore','2017-05-24','06:40 PM','2017-06-25','07:40AM','11 hours'),(1116,2,310,720,930,'Changi Airport','Taoyuan International Airport','Singapore','Taiwan','2017-05-28','5:50 PM','2017-05-28','9:40PM','3 hours 50 minutes'),(1119,4,720,1030,1340,'Changi Airport','Frankfurt Airport','Singapore','Germany','2017-05-29','11:10 PM','2017-05-30','9:10 AM','11 hours'),(1120,5,610,730,910,'Tan Son Nhat Airport','Changi Airport','Vietnam','Singapore','2017-05-30','8:40 AM','2017-05-30','12:40 PM','4 hours');
/*!40000 ALTER TABLE `flightschedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-07  8:26:38
