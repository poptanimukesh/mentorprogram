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
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$PrOQ2fNqJ8km$czYzSBtU2a9HM6RlSjFiTjjwgzdLnhivpVr7O6Z0yaQ=','2019-11-20 23:39:30.296349',1,'admin','','','poptani@usc.edu',1,1,'2019-10-03 06:07:42.180430'),(2,'pbkdf2_sha256$150000$DVrWXtdNRq8y$Mz4L+dsEcFQTXYpALEJ7KjcFAM4zB18Vv0e9D+RtQY0=','2019-11-22 05:58:05.583149',0,'poptanim','Mukesh','Poptani','poptanimukesh@gmail.com',0,1,'2019-11-17 21:57:05.333914'),(3,'pbkdf2_sha256$150000$Tcze3ayCCA7g$VhN+Qshgz8X04GToTuCOIpdYAqJMuQ1ufi/GdRiSEP0=','2019-11-22 16:53:38.839431',0,'pfield','Pauline','Field','poptanimukesh29@gmail.com',1,1,'2019-11-20 23:40:31.000000'),(4,'pbkdf2_sha256$150000$FqbrkGCL6wTE$Q3oY5b+hPGQFiTORh36HCI6RTFnxgKCITbQJ2Jh+1Vc=',NULL,0,'jknklhnlkhn@gmail.com','Navya','Dass','jknklhnlkhn@gmail.com',0,1,'2019-11-22 00:20:37.091356'),(6,'pbkdf2_sha256$216000$84ScPIeW9rPa$03PMx05xMp3rHUGxbDXhOkYgn8IZU29MX2zBLg9Ugkc=','2019-11-22 10:30:50.778124',0,'thakeraj@gmail.com','Raj','Thaker','thakeraj@gmail.com',0,1,'0000-00-00 00:00:00.000000'),(7,'pbkdf2_sha256$150000$VBEeIEQskwwo$jA8fWJXTpJfT9dwpeGH0/PU0xC5/Ppad5a6sS1wqJh0=','2019-11-22 18:42:59.726762',0,'dubes@usc.edu','Saurabh','Dube','dubes@usc.edu',0,1,'2019-11-22 18:35:35.113740');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-22 11:17:06
