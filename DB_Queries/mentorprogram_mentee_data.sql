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
) ENGINE=InnoDB AUTO_INCREMENT=1037 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentee_data`
--

LOCK TABLES `mentee_data` WRITE;
/*!40000 ALTER TABLE `mentee_data` DISABLE KEYS */;
INSERT INTO `mentee_data` VALUES (1001,'Mukesh','Poptani',12,'2134214738','poptani@usc.edu','ewld,ml;wdm','1992-10-21','',''),(1002,'Howard','Hatfield',NULL,NULL,NULL,NULL,NULL,'',''),(1003,'Hope','Fuentes',NULL,NULL,NULL,NULL,NULL,'','\0'),(1004,'Vivian','Harrell',NULL,NULL,NULL,NULL,NULL,'','\0'),(1005,'Timothy','Mooney',NULL,NULL,NULL,NULL,NULL,'','\0'),(1006,'Jackson','Bradshaw',NULL,NULL,NULL,NULL,NULL,'','\0'),(1007,'Olivia','Liang',21,'3235320666','olivia@gmail.com','Los Angeles',NULL,'','\0'),(1008,'Bruno','Nash',NULL,NULL,NULL,NULL,NULL,'',''),(1009,'Sakura','Yamamoto',NULL,NULL,NULL,NULL,NULL,'',''),(1010,'Thor','Walton',NULL,NULL,NULL,NULL,NULL,'',''),(1011,'Finn','Camacho',NULL,NULL,NULL,NULL,NULL,'','\0'),(1012,'Serge','Baldwin',NULL,NULL,NULL,NULL,NULL,'',''),(1013,'Zenaida','Frank',NULL,NULL,NULL,NULL,NULL,'',''),(1015,'Nikhil','Kishore',31,'3103231986','myemail@gmail.com','Mumbai',NULL,'',''),(1016,'Eshwar Nag','Lanka',25,'3237701559','leshwar4@gmail.com','New York',NULL,'',''),(1017,'Eshwar Nag','Lanka',34,'3237701559','leshwar4@gmail.com','New York',NULL,'',''),(1018,'Eshwar Nag','Lanka',34,'3237701559','leshwar4@gmail.com','New York',NULL,'',''),(1019,'Eshwar Nag','Lanka',36,'3237701559','leshwar4@gmail.com','new york',NULL,'',''),(1020,'Eshwar Nag','Lanka',36,'3237701559','leshwar4@gmail.com','new york',NULL,'',''),(1021,'Eshwar Nag','Lanka',45,'3237701567','leshwar4@gmail.com','New York',NULL,'',''),(1022,'Mukesh','Potpani',50,'3237701234','mp@gmail.com','Los Angeles',NULL,'',''),(1023,'Mukesh','Nag',51,'3237701555','','',NULL,'',''),(1024,'Eshwar','Pp',53,'3237701556','nc@gmail.com','Los Angeles',NULL,'',''),(1025,'Mukesh','Potpani',56,'3237701236','mp@gmail.com','Los Angeles',NULL,'',''),(1026,'Alexa','Pandian',29,'3237701554','test@usc.edu','Los Angeles',NULL,'',''),(1027,'Siri','Apple',22,'3237701554','test1@usc.edu','Los Angeles',NULL,'',''),(1028,'Michelle','Mark',19,'3234401557','test2@gmail.com','Los Angeles',NULL,'',''),(1029,'Hopper','Trojan',18,'5642295778','test3@gmail.com','Los Angeles',NULL,'',''),(1030,'Hopper','Trojan',18,'5642295778','test3@gmail.com','Los Angeles',NULL,'',''),(1031,'Hopper','Trojan',18,'5642295778','test3@gmail.com','Los Angeles',NULL,'',''),(1032,'Hopper','Trojan',18,'5642295778','test3@gmail.com','Los Angeles',NULL,'',''),(1033,'ashish','bulchandani',25,'2134214738','abc@gmai.com','JERSEY CITY',NULL,'',''),(1034,'Mike','Poptani',26,'2134214738','elanka@usc.edu','Los Angeles',NULL,'',''),(1035,'Nick','Jonas',21,'2134214738','poptani@usc.edu','Los Angeles',NULL,'',''),(1036,'Captcha','Test',23,'','','',NULL,'','');
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

-- Dump completed on 2019-11-22 11:17:00
