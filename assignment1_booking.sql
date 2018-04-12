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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `bookingID` int(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(2) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contactNo` int(10) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `flightScheduleID_1` int(4) DEFAULT NULL,
  `flightScheduleID_2` int(4) DEFAULT NULL,
  `cabinClass` varchar(45) DEFAULT NULL,
  `noOfPassengers` int(3) DEFAULT NULL,
  PRIMARY KEY (`bookingID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,'Dr','Wesley','wesley@gmail.com',92114432,1950,1,1,'FirstClass',3),(2,'Mr','Jon','jon@gmail.com',93259943,400,2,2,'Economy',2),(3,'Mr','Keth','keith@gmail.com',94495042,600,3,3,'Business',1),(4,'Mr','Yong Jie','yongjie@gmail.com',84419321,1500,4,4,'FirstClass',2),(5,'Mr','Dexter','dexter@gmail.com',85315910,4320,5,5,'Business',8),(6,'Ms','Jezerene','jezerene@gmail.com',94113124,440,6,6,'FirstClass',1),(7,'Mr','a','a@a.com',12356789,230,1111,1,'economy_capacity',1),(8,'Mr','a','a@a.com',1231231,230,1111,1,'economy_capacity',1),(9,'Mr','asd','asd@asd.com',12312312,230,1111,1,'economy_capacity',1),(10,'Mr','asd','asd@asd.com',12312312,230,1111,1,'economy_capacity',1),(11,'Mr','Jason','Tan@mail.com',12312612,230,1111,1,'economy_capacity',1),(12,'Mr','Jason','Tan@mail.com',12312612,230,1111,1,'economy_capacity',1),(13,'Mr','Jason','Tan@mail.com',12312612,230,1111,1,'economy_capacity',1),(14,'Mr','a','a@a.com',123121312,230,1111,1,'economy_capacity',1),(15,'Mr','a','a@a.com',12356789,230,1111,1,'economy_capacity',1),(16,'Mr','a','a@a.com',123172127,230,1111,1,'economy_capacity',1);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
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
