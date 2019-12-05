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
) ENGINE=InnoDB AUTO_INCREMENT=1043 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentee_reg_data`
--

LOCK TABLES `mentee_reg_data` WRITE;
/*!40000 ALTER TABLE `mentee_reg_data` DISABLE KEYS */;
INSERT INTO `mentee_reg_data` VALUES (1037,NULL,'dvds','xdvd','NY','sdfs','','','Yes','Choose...'),(1038,'Yes','Be a dancer','A person who understands and guides me.','dance, music, travel','No','A person who can give me good advice and guide me during my communication skills.','NA','Yes','Asian'),(1040,'Yes','Footballer','A person who guides me to control my temperament.','dance, music, travel','Not getting the right guidance to network with people in football.','A person who can give me good advice to control my temper.','NA','Yes','Asian'),(1041,'Yes','Pursue my career as a chef','Guide me with recommendations to achieve my goal.','foodie, cooking','Not able to fund myself well.','Guide me with my financial challenges.','','No','Choose...'),(1042,'Yes','To be a successful business owner','Having someone to bounce things off and make better decisions','Health nut','Getting into college','A good listener','I need help','No','Choose...');
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

-- Dump completed on 2019-12-04 21:16:11
