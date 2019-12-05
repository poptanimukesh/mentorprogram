-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: mentor-program-dev2.mysql.database.azure.com    Database: mentorprogram
-- ------------------------------------------------------
-- Server version	5.6.42.0

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
-- Table structure for table `mentee_data`
--

DROP TABLE IF EXISTS `mentee_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mentee_data` (
  `mentee_id` int(10) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `dob` varchar(20) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `isAvailable` bit(1) DEFAULT NULL,
  PRIMARY KEY (`mentee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1043 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentee_data`
--

LOCK TABLES `mentee_data` WRITE;
/*!40000 ALTER TABLE `mentee_data` DISABLE KEYS */;
INSERT INTO `mentee_data` VALUES (1037,'ashish','bulchandani',10,'2134214738','assas@gmail.com','JERSEY CITY',NULL,'\0',''),(1038,'Nikhil','Sargur',26,'3234561222','umeshsar@usc.edu','San Diego',NULL,'',''),(1039,'Saurabh','Dube',26,'3234561222','dubes@usc.edu','San Diego',NULL,'','\0'),(1040,'Tommy','Trojan',26,'3234561233','tommy@usc.edu','Los Angeles',NULL,'',''),(1041,'Keeleana','Peck',25,'2321234455','keeleanp@usc.edu','Los Angeles',NULL,'','\0'),(1042,'Patty','Smith',22,'818-222-2222','poptanimukesh@gmail.com','Los Angeles',NULL,'','');
/*!40000 ALTER TABLE `mentee_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-04 21:14:42
