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
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add mentee data',7,'add_menteedata'),(26,'Can change mentee data',7,'change_menteedata'),(27,'Can delete mentee data',7,'delete_menteedata'),(28,'Can view mentee data',7,'view_menteedata'),(29,'Can add mentor data',8,'add_mentordata'),(30,'Can change mentor data',8,'change_mentordata'),(31,'Can delete mentor data',8,'delete_mentordata'),(32,'Can view mentor data',8,'view_mentordata'),(33,'Can add mentor mentee assoc',9,'add_mentormenteeassoc'),(34,'Can change mentor mentee assoc',9,'change_mentormenteeassoc'),(35,'Can delete mentor mentee assoc',9,'delete_mentormenteeassoc'),(36,'Can view mentor mentee assoc',9,'view_mentormenteeassoc'),(37,'Can add cors model',10,'add_corsmodel'),(38,'Can change cors model',10,'change_corsmodel'),(39,'Can delete cors model',10,'delete_corsmodel'),(40,'Can view cors model',10,'view_corsmodel'),(41,'Can add mentee data',11,'add_menteedata'),(42,'Can change mentee data',11,'change_menteedata'),(43,'Can delete mentee data',11,'delete_menteedata'),(44,'Can view mentee data',11,'view_menteedata'),(45,'Can add mentee registration data',12,'add_menteeregistrationdata'),(46,'Can change mentee registration data',12,'change_menteeregistrationdata'),(47,'Can delete mentee registration data',12,'delete_menteeregistrationdata'),(48,'Can view mentee registration data',12,'view_menteeregistrationdata'),(49,'Can add mentor data',13,'add_mentordata'),(50,'Can change mentor data',13,'change_mentordata'),(51,'Can delete mentor data',13,'delete_mentordata'),(52,'Can view mentor data',13,'view_mentordata'),(53,'Can add mentor registration data',14,'add_mentorregistrationdata'),(54,'Can change mentor registration data',14,'change_mentorregistrationdata'),(55,'Can delete mentor registration data',14,'delete_mentorregistrationdata'),(56,'Can view mentor registration data',14,'view_mentorregistrationdata');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-04 21:14:36
