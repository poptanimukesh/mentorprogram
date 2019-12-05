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
-- Table structure for table `mentee_reg_data`
--

DROP TABLE IF EXISTS `mentee_reg_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mentee_reg_data` (
  `mentee_id` int(11) NOT NULL AUTO_INCREMENT,
  `comm_plat` varchar(5) DEFAULT NULL,
  `desire_dream` varchar(250) DEFAULT NULL,
  `have_mentor` varchar(250) DEFAULT NULL,
  `desc_yourslf` varchar(250) DEFAULT NULL,
  `major_chall` varchar(250) DEFAULT NULL,
  `ideal_mentor` varchar(250) DEFAULT NULL,
  `any_else` varchar(250) DEFAULT NULL,
  `race_req` varchar(5) DEFAULT NULL,
  `race_details` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`mentee_id`),
  CONSTRAINT `mentee_reg_data_ibfk_1` FOREIGN KEY (`mentee_id`) REFERENCES `mentee_data` (`mentee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1037 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentee_reg_data`
--

LOCK TABLES `mentee_reg_data` WRITE;
/*!40000 ALTER TABLE `mentee_reg_data` DISABLE KEYS */;
INSERT INTO `mentee_reg_data` VALUES (1,'No','NA','NA','NA','NA','NA','NA','No','Black or African American'),(2,'Yes','YA','YA','YA','YA','YA','YA','No','American Indian or Alaska Native'),(3,'Yes','NA','NA','NA','NA','NA','NA','No','Asian'),(4,'Yes','NA','NA','NA','NA','NA','NA','No','Asian'),(5,'Yes','NA','NA','NA','NA','NA','NA','No','Asian'),(6,'Yes','NA','NA','NA','NA','NA','NA','No','Asian'),(7,'Yes','NA','NA','NA','NA','NA','NA','No','Asian'),(8,'Yes','NA','NA','NA','NA','NA','NA','No','Asian'),(9,'Yes','NA','NA','NA','NA','NA','NA','No','Asian'),(10,'Yes','NA','NA','NA','NA','NA','NA','No','Asian'),(11,'Yes','NA','NA','NA','NA','NA','NA','No','Asian'),(12,'Yes','NA','NA','NA','NA','NA','NA','No','Asian'),(13,'Yes','NA','NA','NA','NA','NA','NA','No','Asian'),(14,'Yes','NA','NA','NA','NA','NA','NA','No','Asian'),(15,'Yes','NA','NA','NA','NA','NA','NA','No','Asian'),(16,'Yes','All','All','All','All','All','All','Yes','American Indian or Alaska Native'),(17,NULL,'','','','','','',NULL,'Choose...'),(18,NULL,'','','','','','',NULL,'Choose...'),(19,NULL,'','','','','','',NULL,'Choose...'),(20,NULL,'','','','','','',NULL,'Choose...'),(21,'Yes','','','','','','',NULL,'Choose...'),(22,NULL,'','','','','','',NULL,'Choose...'),(23,'Yes','','','','','','',NULL,'Choose...'),(1001,'Yes','I want to become a best singer','Want to get advice on overcoming frequent depressions','','frequent depressions','Should guide me properly and understand my situations','','No','White'),(1025,'Yes','','','','','','',NULL,'Choose...'),(1026,'Yes','Become Singer','Proper Guidance','Dog lover and foodie','Yes, Need time to relax','Calm and listening','No','No','Choose...'),(1028,'No','Become Actress','Life experiences that can help me','I play sports - football, basketball','No','Active','No','Yes','Asian'),(1029,'No','Become Scientist','Give me proper guidance','I take care of my health','No','Should know his/her stuff','No','No','Choose...'),(1036,NULL,'','','','','','',NULL,'Choose...');
/*!40000 ALTER TABLE `mentee_reg_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-22 11:17:02
