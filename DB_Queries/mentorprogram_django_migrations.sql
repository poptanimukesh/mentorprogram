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
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-10-02 23:15:06.014950'),(2,'auth','0001_initial','2019-10-02 23:16:34.701341'),(3,'admin','0001_initial','2019-10-02 23:17:06.745714'),(4,'admin','0002_logentry_remove_auto_add','2019-10-02 23:17:09.507247'),(5,'admin','0003_logentry_add_action_flag_choices','2019-10-02 23:17:10.431438'),(6,'contenttypes','0002_remove_content_type_name','2019-10-02 23:17:12.273993'),(7,'auth','0002_alter_permission_name_max_length','2019-10-02 23:17:13.055571'),(8,'auth','0003_alter_user_email_max_length','2019-10-02 23:17:14.527433'),(9,'auth','0004_alter_user_username_opts','2019-10-02 23:17:15.243548'),(10,'auth','0005_alter_user_last_login_null','2019-10-02 23:17:16.370793'),(11,'auth','0006_require_contenttypes_0002','2019-10-02 23:17:17.086249'),(12,'auth','0007_alter_validators_add_error_messages','2019-10-02 23:17:18.623105'),(13,'auth','0008_alter_user_username_max_length','2019-10-02 23:17:19.750242'),(14,'auth','0009_alter_user_last_name_max_length','2019-10-02 23:17:22.821754'),(15,'auth','0010_alter_group_name_max_length','2019-10-02 23:17:31.966408'),(16,'auth','0011_update_proxy_permissions','2019-10-02 23:17:35.008938'),(17,'sessions','0001_initial','2019-10-02 23:17:41.253621'),(18,'polls','0001_initial','2019-10-03 01:54:09.637843'),(19,'corsheaders','0001_initial','2019-10-04 04:35:59.454903'),(20,'registration','0001_initial','2019-10-20 01:54:55.444613'),(21,'registration','0002_auto_20191020_0205','2019-10-20 02:05:54.220164'),(22,'registration','0003_mentordata_mentorregistrationdata','2019-10-20 23:55:30.535044'),(23,'registration','0004_auto_20191023_0154','2019-10-23 17:48:50.854058'),(24,'registration','0005_auto_20191023_1733','2019-10-23 17:48:52.185324'),(25,'registration','0006_auto_20191023_1742','2019-10-23 17:48:53.793301'),(26,'registration','0007_delete_menteedata','2019-10-23 17:48:54.949647'),(27,'registration','0008_menteedata','2019-10-23 17:50:22.295469'),(28,'registration','0009_auto_20191023_1843','2019-10-23 18:44:05.911822'),(29,'registration','0010_remove_mentordata_date','2019-10-23 19:09:40.665886');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-22 11:17:01
