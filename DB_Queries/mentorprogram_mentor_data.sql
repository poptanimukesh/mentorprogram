CREATE DATABASE  IF NOT EXISTS `mentorprogram` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mentorprogram`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: mentor-program-dev.mysql.database.azure.com    Database: mentorprogram
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
) ENGINE=InnoDB AUTO_INCREMENT=1027 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentor_data`
--

LOCK TABLES `mentor_data` WRITE;
/*!40000 ALTER TABLE `mentor_data` DISABLE KEYS */;
INSERT INTO `mentor_data` VALUES (1001,'Raj','Thaker','0000-00-00 00:00:00','severance ','None','2133730977','','rpthaker@usc.edu','2019-11-11',NULL,'kwqne','lwmd','lkwmd','','',4),(1002,'Tiger','Nixon','0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',4),(1003,'Garrett','Winters','0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','\0',4),(1004,'Ashton','Cox','0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0','\0',4),(1005,'Cedric','Kelly','2019-10-21 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','\0',4),(1006,'Airi','Satou','0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',4),(1007,'Brielle','Williamson','0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0','\0',2),(1008,'Herrod','Chandler','0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',4),(1009,'Rhona','Davidson','0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','\0',2),(1010,'Colleen','Hurst','0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',3),(1011,'Sonya','Frost','0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',4),(1012,'Jena','Gaines','0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',3),(1013,'Quinn','Flynn','0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',0),(1014,'Eshwar ','Nag','2019-10-23 00:00:00','2106 Park Grove Ave','Los Angeles, CA, 90007','3237701555','','elanka@usc.edu','2019-10-16','email','USC','SA','Hindi','','',0),(1015,'Eshwar Nag','Lanka','2019-10-21 00:00:00','','New York','3237701567','','leshwar4@gmail.com','2019-10-15',NULL,'','','','','',0),(1016,'Eshwar Nag','Lanka','2019-10-21 00:00:00','','New York','3237701567','','leshwar4@gmail.com','2019-10-15',NULL,'','','','','',0),(1017,'Eshwar Nag','Lanka','2019-10-21 00:00:00','','New York','3237701567','','leshwar4@gmail.com','2019-10-15',NULL,'','','','','',0),(1018,'Eshwar Nag','Lanka','2019-10-22 00:00:00','New York','New York','3237777777','','leshwar4@gmail.com','2019-10-08',NULL,'','','','','',0),(1019,'Eshwar','Potpani','2019-10-15 00:00:00','','Los Angeles','3237702222','','mp@gmail.com','2019-10-08','phone','','','','','',0),(1020,'Eshwar','Potpani','2019-10-15 00:00:00','','Los Angeles','3237702222','','mp@gmail.com','2019-10-08','phone','','','','','',0),(1021,'Eshwar','Potpani','2019-10-15 00:00:00','','Los Angeles','3237702222','','mp@gmail.com','2019-10-08','phone','','','','','',0),(1022,'Eshwar','Potpani','2019-10-15 00:00:00','','Los Angeles','3237702222','','mp@gmail.com','2019-10-08','phone','','','','','',0),(1023,'Nikhil','Sir','0000-00-00 00:00:00','2352 Portland St','LA, CA, 90007','5646675334','','test@usc.edu','2019-10-14','phone','USC','TA','','','',0),(1024,'Tommy','Trojan','0000-00-00 00:00:00','Severance St','Los Angeles','1234','',NULL,'1992-01-01','phone','','','','','',0),(1025,'Navya','Dass','0000-00-00 00:00:00','severance','90007','232-522-4444','','jknklhnlkhn@gmail.com','2019-01-01','email','nothing','nothing','english','','',0),(1026,'Saurabh','Dube','0000-00-00 00:00:00','2620 Severance St, Apt 7','Los Angeles','213-421-4738','','dubes@usc.edu','2019-10-29','phone','','','','','',4);
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

-- Dump completed on 2019-11-22 11:17:09
