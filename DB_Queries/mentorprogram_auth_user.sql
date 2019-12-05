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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$PrOQ2fNqJ8km$czYzSBtU2a9HM6RlSjFiTjjwgzdLnhivpVr7O6Z0yaQ=','2019-11-22 21:03:58.685192',1,'admin','','','poptani@usc.edu',1,1,'2019-10-03 06:07:42.180430'),(8,'pbkdf2_sha256$150000$ZFDS22KL2ldQ$MjtV3QxwXf3pxU/ogWa22A7QEHtc0+2TphB6c0noHnA=','2019-11-23 01:37:40.051206',0,'pfield@5050leadership.org','Pauline','Field','pfield@5050leadership.org',1,1,'2019-11-22 21:15:53.000000'),(9,'pbkdf2_sha256$150000$RnpRp9fhq7Sp$DNEJgOh4J7Q4JpVhlc5cawYfCBVDe0kGhrUUiM3R59Y=','2019-11-23 01:26:43.421233',0,'elanka@usc.edu','Eshwar Nag','Lanka','elanka@usc.edu',0,1,'2019-11-22 21:45:19.988992'),(10,'pbkdf2_sha256$150000$bDAy0TpWUQpU$JUtiqFfzRLjgfq/8i/ypPj2y80NCVbuWf2ntbHrOMPA=','2019-11-23 01:31:35.902995',0,'poptani@usc.edu','Mukesh','Poptani','poptani@usc.edu',0,1,'2019-11-22 22:27:12.935003'),(11,'pbkdf2_sha256$150000$W6XP6hVzmUrh$ZIorO+xJRI5ZFDTAHZWrFr10HLOr2lSX/7vONrn0rJ0=',NULL,0,'chittoor@usc.edu','Navya Dass','Chittor','chittoor@usc.edu',0,1,'2019-11-22 22:34:02.658129'),(12,'pbkdf2_sha256$150000$Q5oLlJNxz1MF$G5VErTgAmJuZFMvJMjk/SMOc4M3hAhpXolodHViEo6o=',NULL,0,'nmshinde@usc.edu','Nikita','Shinde','nmshinde@usc.edu',0,1,'2019-11-22 22:36:40.674754'),(13,'pbkdf2_sha256$150000$kjVZIZbQdiME$ff6HdvThSrfjSvPBBEN8glq/lgfx3YSOmdPB0Xwj0iY=',NULL,0,'yashvora@usc.edu','Yash','Vora','yashvora@usc.edu',0,1,'2019-11-22 23:33:03.340343'),(15,'pbkdf2_sha256$150000$3KLxgHy1Gj8n$iVkA8MMcRsl9mSqpuLxnszuhrKNeJ/piNlBCduG1PC0=',NULL,0,'pauline.field@gmail.com','Pauline','Field','pauline.field@gmail.com',0,1,'2019-11-23 01:09:26.405446');
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

-- Dump completed on 2019-12-04 21:16:13
