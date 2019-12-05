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
-- Table structure for table `mentor_reg_data`
--

DROP TABLE IF EXISTS `mentor_reg_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mentor_reg_data` (
  `mentor_id` int(11) NOT NULL AUTO_INCREMENT,
  `why_mentor` varchar(5) DEFAULT NULL,
  `brief_summary` varchar(250) DEFAULT NULL,
  `diff_situation` varchar(250) DEFAULT NULL,
  `min_commit` varchar(250) DEFAULT NULL,
  `min_avail` varchar(250) DEFAULT NULL,
  `mentor_training` varchar(250) DEFAULT NULL,
  `group_meetings` varchar(250) DEFAULT NULL,
  `any_else` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`mentor_id`),
  CONSTRAINT `mentor_reg_data_ibfk_1` FOREIGN KEY (`mentor_id`) REFERENCES `mentor_data` (`mentor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1027 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentor_reg_data`
--

LOCK TABLES `mentor_reg_data` WRITE;
/*!40000 ALTER TABLE `mentor_reg_data` DISABLE KEYS */;
INSERT INTO `mentor_reg_data` VALUES (1,'NA','NA','NA','Yes','No','Yes','No','NA'),(2,'NA','NA','NA','Yes',NULL,'Yes','Yes','NA'),(1001,'dfdfs','sdfs','dgfer','Yes','No','Yes','Yes','jhdbs'),(1015,'','','',NULL,NULL,NULL,NULL,''),(1018,'','','',NULL,NULL,NULL,NULL,''),(1019,'','','',NULL,NULL,NULL,NULL,''),(1023,'MLMR','Graduate','',NULL,NULL,NULL,NULL,''),(1024,'Want ','Masters Degree Arts','I\'ve personally taken advise from my seniors and parents','Yes','Yes','Yes','Yes',''),(1025,'yrs','svdv','vwdg','Yes','Yes','Yes','Yes','qwef'),(1026,'TEST','','TEST','Yes','Yes','Yes','Yes','');
/*!40000 ALTER TABLE `mentor_reg_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-22 11:16:55
