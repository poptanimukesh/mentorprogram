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
) ENGINE=InnoDB AUTO_INCREMENT=1033 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentor_reg_data`
--

LOCK TABLES `mentor_reg_data` WRITE;
/*!40000 ALTER TABLE `mentor_reg_data` DISABLE KEYS */;
INSERT INTO `mentor_reg_data` VALUES (1027,'I wan','I did a master\'s in software engineering and am currently working as an APM.\r\nI also worked as an advisor for various start-up\'s','I planned my expenses properly. Cut short on unnecessary expenses. I always try to keep my income liquidated.','Yes','Yes','Yes','Yes',''),(1028,'I wan','I have a Master\'s degree in Computer Science. I have participated in several workshops to mentor people in the right direction. I have many ted talks related to the same','I cut down on many unnecessary costs. Kept my expenses low and paid off bills dues at time','Yes','Yes','Yes','Yes',''),(1029,'To gu','I have training in helping out people come out of depression and focus on their work. I am a trained counselor','I have not borrowed any money I can\'t pay off. I kept all my credit card spendings to a minimum low.','Yes','Yes','Yes','Yes',''),(1030,'I wou','','Kept my credit card spending to a record low. Taken help from several organizations. Worked extra hours.','Yes','Yes','Yes','Yes',''),(1031,'To he','I am a volunteer in the religious center that preach positivity.\r\nI can help people focus on their life by talking through them and counseling them','Never put loans and never borrowed extra money','Yes','Yes','Yes','Yes',''),(1032,'To he','Lots of experience','Have lots of examples','Yes','Yes','Yes','Yes','No th');
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

-- Dump completed on 2019-12-04 21:16:08
