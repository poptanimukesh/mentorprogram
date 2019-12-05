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
-- Table structure for table `mentor_data`
--

DROP TABLE IF EXISTS `mentor_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mentor_data` (
  `mentor_id` int(10) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `date` datetime NOT NULL,
  `street_address` varchar(150) DEFAULT NULL,
  `city_state_zip` varchar(150) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `phonenumber_alter` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `pref_contact` varchar(10) DEFAULT NULL,
  `recent_employer` varchar(100) DEFAULT NULL,
  `recent_position` varchar(100) DEFAULT NULL,
  `languages` varchar(100) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `isAvailable` bit(1) DEFAULT NULL,
  `trainingPhases` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`mentor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1033 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentor_data`
--

LOCK TABLES `mentor_data` WRITE;
/*!40000 ALTER TABLE `mentor_data` DISABLE KEYS */;
INSERT INTO `mentor_data` VALUES (1027,'Eshwar Nag','Lanka','0000-00-00 00:00:00','2106 Park Gove Ave','Los Angeles, CA, 90007','323-770-1555','','elanka@usc.edu','1983-07-20','email','Metro Local LA','Associate Program Manager','Spanish, Hindi','','\0',4),(1028,'Mukesh','Poptani','0000-00-00 00:00:00','2106 Park Grove Ave','Los Angeles, CA, 90007','323-770-1554','','poptani@usc.edu','1987-06-16','phone','Amtrak','Data Engineer','French, Tamil','','\0',4),(1029,'Navya Dass','Chittor','0000-00-00 00:00:00','2420 Severence St, Apt 9','Los Angeles, CA, 92037','323-700-9878','','chittoor@usc.edu','1983-06-14','email','','','','','',4),(1030,'Nikita','Shinde','0000-00-00 00:00:00','2420 Severence St, Apt 9','San Diego, CA, 92037','323-770-1550','','nmshinde@usc.edu','1983-06-21','phone','','','','','',4),(1031,'Yash','Vora','0000-00-00 00:00:00','2420 Severence St, Apt 9','San Diego, CA, 92037','323-700-9879','','yashvora@usc.edu','1983-07-14','email','','','','','',4),(1032,'Pauline','Field','0000-00-00 00:00:00','PO Box 11202','Glendale CA 91226','818-243-2322','','pauline.field@gmail.com','1988-08-23','email','Self','CEO','','','',2);
/*!40000 ALTER TABLE `mentor_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-04 21:17:14
