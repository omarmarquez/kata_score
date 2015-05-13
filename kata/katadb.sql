-- MySQL dump 10.14  Distrib 5.5.35-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: judokata
-- ------------------------------------------------------
-- Server version	5.5.35-MariaDB

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (4,'KataEvent_Admins'),(5,'Kata_Judges'),(3,'Kata_Senseis'),(2,'Kata_Users');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (9,2,52),(10,2,53),(11,2,54),(3,3,55),(1,3,56),(2,3,57),(5,4,46),(4,4,47),(12,5,58);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add kata',8,'add_kata'),(23,'Can change kata',8,'change_kata'),(24,'Can delete kata',8,'delete_kata'),(25,'Can add kata image',9,'add_kataimage'),(26,'Can change kata image',9,'change_kataimage'),(27,'Can delete kata image',9,'delete_kataimage'),(28,'Can add kata technique',10,'add_katatechnique'),(29,'Can change kata technique',10,'change_katatechnique'),(30,'Can delete kata technique',10,'delete_katatechnique'),(31,'Can add tech image',11,'add_techimage'),(32,'Can change tech image',11,'change_techimage'),(33,'Can delete tech image',11,'delete_techimage'),(34,'Can add kata',12,'add_kata'),(35,'Can change kata',12,'change_kata'),(36,'Can delete kata',12,'delete_kata'),(37,'Can add kata image',13,'add_kataimage'),(38,'Can change kata image',13,'change_kataimage'),(39,'Can delete kata image',13,'delete_kataimage'),(40,'Can add kata technique',14,'add_katatechnique'),(41,'Can change kata technique',14,'change_katatechnique'),(42,'Can delete kata technique',14,'delete_katatechnique'),(46,'Can add event',16,'add_event'),(47,'Can change event',16,'change_event'),(48,'Can delete event',16,'delete_event'),(49,'Can add kata execution',17,'add_kataexecution'),(50,'Can change kata execution',17,'change_kataexecution'),(51,'Can delete kata execution',17,'delete_kataexecution'),(52,'Can add tech video',18,'add_techvideo'),(53,'Can change tech video',18,'change_techvideo'),(54,'Can delete tech video',18,'delete_techvideo'),(55,'Can add critique',19,'add_critique'),(56,'Can change critique',19,'change_critique'),(57,'Can delete critique',19,'delete_critique'),(58,'Can add score',20,'add_score'),(59,'Can change score',20,'change_score'),(60,'Can delete score',20,'delete_score'),(64,'Can add event table',22,'add_eventtable'),(65,'Can change event table',22,'change_eventtable'),(66,'Can delete event table',22,'delete_eventtable'),(67,'Can add category',23,'add_category'),(68,'Can change category',23,'change_category'),(69,'Can delete category',23,'delete_category');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$10000$A4TBDi3NNVFT$R9YnpySZQJOPwLQVw92TNpLC+uHQvaAFsSqrN29dRUM=','2014-02-22 02:41:05',1,'omarquez','Omar','Marquez','marquez.om@gmail.com',1,1,'2013-07-13 00:39:21'),(2,'pbkdf2_sha256$10000$8V0TB6c2bdIX$3o6YP9Z/3po/AQjhcq3ubbSNXyLURMiL+glIg34iA9U=','2013-07-22 12:46:15',0,'tohkon','tohkon','','',1,1,'2013-07-17 01:57:59'),(3,'pbkdf2_sha256$10000$BuaHa7axJmy6$SC5xg3orhKiOv9AZ+t6qATGCqqs1Sluv5Gd9gfave3M=','2013-07-28 16:04:21',0,'bzises','Brian','Zises','',1,1,'2013-07-27 17:47:56'),(5,'pbkdf2_sha256$10000$ZmDk72gdCjmI$PhITt5RbIGadVpbYLXfw4To9e4nUkLsQXmFDu9fR66I=','2013-08-16 11:49:30',0,'andrews','Robert','Andrews','',0,1,'2013-07-27 23:10:21'),(6,'pbkdf2_sha256$10000$6zpujX1tSOaD$DX0TNkjx76os5aHpiOOOPfItL8Jnqk5qu/G5wjpN+Co=','2013-08-01 15:39:09',0,'nleung','Nicole','Leung','nicole@tohkon.com',1,1,'2013-08-01 15:39:09'),(7,'pbkdf2_sha256$10000$eFGYV2dtIGTR$jZZU9PGWzVWptoqDDle3puxgGxnxU9EcbpaZBjQ4Zl4=','2013-09-27 04:23:58',0,'dtjudo','Douglas','Tono','dtjudo@tohkon.com',1,1,'2013-08-18 20:41:55'),(8,'pbkdf2_sha256$10000$ol4krZJfDsko$a6IJJGLw7nI1sRi65Sf4j8h8ZeVhruxuX47oDkLrZrs=','2014-02-22 01:40:17',1,'cindy','Cindy','Peterson','yellowtoys@sbcglobal.net',1,1,'2014-02-22 01:26:16');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (12,1,4),(13,1,5),(2,2,2),(3,3,3),(10,5,3),(11,5,5),(4,6,2),(5,6,3),(6,6,4),(17,7,3),(18,7,4),(19,7,5),(20,8,3),(21,8,4),(22,8,5);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2013-07-14 14:49:38',1,12,'3','isutsu',2,'Changed rank. Added kata image \"KataImage object\".'),(2,'2013-07-14 14:55:15',1,12,'3','isutsu',2,'Changed image for kata image \"KataImage object\".'),(3,'2013-07-14 14:58:31',1,12,'3','isutsu',2,'Changed image for kata image \"KataImage object\".'),(4,'2013-07-14 15:46:59',1,12,'3','isutsu',2,'No fields changed.'),(5,'2013-07-14 15:49:49',1,12,'3','isutsu',2,'Changed image.'),(6,'2013-07-14 16:14:02',1,12,'2','juno',2,'Changed image and rank.'),(7,'2013-07-14 16:19:29',1,12,'1','nageno',2,'Changed image and rank.'),(8,'2013-07-14 19:28:19',1,16,'1','Test Event',1,''),(9,'2013-07-14 19:36:31',1,16,'1','Test Event',2,'Changed image.'),(10,'2013-07-14 19:41:36',1,16,'1','Test Event',2,'Changed image. Added kata execution \"juno:: Tori:Omar Marquez Uke:Daine Jablonskyte\".'),(11,'2013-07-14 19:45:12',1,16,'2','13th Anual USJF Kata Conference',1,''),(12,'2013-07-14 19:46:30',1,16,'3','Tohkon Annual Kata Clinic',1,''),(13,'2013-07-14 19:55:18',1,16,'2','13th Anual USJF Kata Conference',2,'Changed event_location.'),(14,'2013-07-14 19:55:29',1,16,'3','Tohkon Annual Kata Clinic',2,'Changed event_location.'),(15,'2013-07-14 20:38:21',1,17,'1','juno:: Tori:Omar Marquez Uke:Daine Jablonskyte',2,'Added tech video \"Test Event juno Aisatsu\".'),(16,'2013-07-14 20:40:38',1,17,'1','isutsu:: Tori:Omar Marquez Uke:Daine Jablonskyte',2,'Changed kata.'),(17,'2013-07-14 20:46:46',1,17,'1','isutsu:: Tori:Omar Marquez Uke:Daine Jablonskyte',2,'Added tech video \"Test Event isutsu Oshikaeshi\".'),(18,'2013-07-14 21:51:31',1,17,'2','juno:: Tori:Omar Marquez Uke:Daine Jablonskyte',1,''),(19,'2013-07-15 00:58:32',1,19,'1','  Test Event isutsu Oshikaeshi',1,''),(20,'2013-07-15 00:59:51',1,19,'2','  Test Event isutsu Oshikaeshi',1,''),(21,'2013-07-15 01:13:42',1,20,'1','  Test Event isutsu Aisatsu -3.0',1,''),(22,'2013-07-16 01:03:23',1,19,'3','  Test Event isutsu Aisatsu',1,''),(23,'2013-07-16 01:04:39',1,19,'4','  Test Event isutsu Oshikaeshi',1,''),(24,'2013-07-16 01:56:27',1,19,'5','  Test Event isutsu Aisatsu',1,''),(25,'2013-07-16 01:57:08',1,19,'5','  Test Event isutsu Aisatsu',3,''),(26,'2013-07-16 01:57:08',1,19,'4','  Test Event isutsu Oshikaeshi',3,''),(27,'2013-07-16 01:57:08',1,19,'3','  Test Event isutsu Aisatsu',3,''),(28,'2013-07-16 01:57:08',1,19,'2','  Test Event isutsu Oshikaeshi',3,''),(29,'2013-07-16 01:57:08',1,19,'1','  Test Event isutsu Oshikaeshi',3,''),(30,'2013-07-16 02:19:59',1,19,'16','  Test Event isutsu Aisatsu',1,''),(31,'2013-07-16 02:21:42',1,19,'17','  Test Event isutsu Oshikaeshi',1,''),(32,'2013-07-16 02:22:16',1,19,'17','  Test Event isutsu Oshikaeshi',3,''),(33,'2013-07-16 02:22:16',1,19,'16','  Test Event isutsu Aisatsu',3,''),(36,'2013-07-16 03:15:24',1,16,'1','Test Event',2,'Deleted kata execution \"juno:: Tori:Omar Marquez Uke:Daine Jablonskyte\".'),(37,'2013-07-16 03:15:37',1,16,'1','Test Event',2,'Changed image.'),(38,'2013-07-17 00:49:02',1,16,'1','Test Event',2,'Added kata execution \"nageno:: Tori:Omar Marquez Uke:Bryan Zises\".'),(39,'2013-07-17 00:52:40',1,17,'4','nageno:: Tori:Omar Marquez Uke:Daine Jablonskyte',1,''),(40,'2013-07-17 01:22:56',1,2,'1','Kata_User',1,''),(41,'2013-07-17 01:23:13',1,2,'2','Kata_Users',1,''),(42,'2013-07-17 01:24:03',1,2,'3','Kata_Senseis',1,''),(43,'2013-07-17 01:24:14',1,2,'1','Kata_User',3,''),(44,'2013-07-17 01:25:34',1,2,'4','KataEvent_Admins',1,''),(45,'2013-07-17 01:27:15',1,2,'2','Kata_Users',2,'Changed permissions.'),(46,'2013-07-17 01:57:59',1,3,'2','tohkon',1,''),(47,'2013-07-17 01:58:33',1,3,'2','tohkon',2,'Changed password and groups.'),(48,'2013-07-17 01:59:06',1,3,'2','tohkon',2,'Changed password, first_name and is_staff.'),(49,'2013-07-17 02:09:24',1,12,'3','isutsu',2,'Changed tech_order for kata technique \"isutsu 0 Aisatsu\". Changed tech_order for kata technique \"isutsu 1 Oshikaeshi\". Changed tech_order for kata technique \"isutsu 2 Eige\". Changed tech_order for kata technique \"isutsu 3 Tomowakare\". Changed tech_order for kata technique \"isutsu 4 Roin\". Changed tech_order for kata technique \"isutsu 5 Settsuka no wakare\".'),(50,'2013-07-17 23:23:06',1,22,'1','EventTable object',1,''),(51,'2013-07-17 23:28:18',1,22,'1','EventTable object',2,'Added kata execution \"nageno:: Tori:Daine Jablonskyte Uke:Omar Marquez @ Test Event \".'),(52,'2013-07-20 01:33:17',1,22,'1','EventTable object',2,'Added kata execution \"juno:: Tori:Omar Marquez Uke:Daine Jablonskyte @ Test Event \".'),(53,'2013-07-20 16:36:10',1,3,'1','omarquez',2,'Changed password, first_name and last_name.'),(54,'2013-07-20 17:10:24',1,22,'1','EventTable object',2,'Added kata execution \"nageno:: Tori:Bryan Zises Uke:Omar Marquez @ Test Event \". Added kata execution \"isutsu:: Tori:Doug Tono Uke:Nicole Leung @ Test Event \".'),(55,'2013-07-20 18:12:40',1,12,'2','juno',2,'Changed tech_order for kata technique \"juno 0 Aisatsu\". Changed tech_order for kata technique \"juno 1 Tsuki-dashi\". Changed tech_order for kata technique \"juno 2 Kata-oshi\". Changed tech_order for kata technique \"juno 3 Ryo-te-dori\". Changed tech_order for kata technique \"juno 4 Kata-mawashi\". Changed tech_order for kata technique \"juno 5 Ago-oshi\". Changed tech_order for kata technique \"juno 6 Kiri-oroshi\". Changed tech_order for kata technique \"juno 7 Ryo-kata-oshi\". Changed tech_order for kata technique \"juno 8 Naname-uchi\". Changed tech_order for kata technique \"juno 9 Kata-te-dorie\". Changed tech_order for kata technique \"juno 11 Obi-tori\". Changed tech_order for kata technique \"juno 12 Mune-oshi\". Changed tech_order for kata technique \"juno 13 Tsuki-age\". Changed tech_order for kata technique \"juno 14 Ushi-oroshi\". Changed tech_order for kata technique \"juno 15 Ryo-gan-tsuki\". Changed tech_order for kata technique \"juno 16 Aisatsu\".'),(56,'2013-07-21 02:05:32',1,12,'1','nageno',2,'Changed tech_order for kata technique \"nageno 0 Aisatsu\". Changed tech_order for kata technique \"nageno 1 Uki otoshi\". Changed tech_order for kata technique \"nageno 2 Seoi nage\". Changed tech_order for kata technique \"nageno 3 Kata guruma\". Changed tech_order for kata technique \"nageno 4 Uki goshi\". Changed tech_order for kata technique \"nageno 5 Tsurikomi goshi\". Changed tech_order for kata technique \"nageno 6 Okuri ashi harai\". Changed tech_order for kata technique \"nageno 7 Sasae tsurikomi ashi\". Changed tech_order for kata technique \"nageno 8 Uchi mata\". Changed tech_order for kata technique \"nageno 9 Tomoe nage\". Changed tech_order for kata technique \"nageno 11 Sumi gaeshi\". Changed tech_order for kata technique \"nageno 12 Yoko gake\". Changed tech_order for kata technique \"nageno 13 Yoko guruma\". Changed tech_order for kata technique \"nageno 14 Uki waza\". Changed tech_order for kata technique \"nageno 15 Aisatsu\".'),(57,'2013-07-21 14:38:46',1,17,'3','isutsu:: Tori:Doug Tono Uke:Nicole Leung @ Test Event ',2,'Added tech video \"Test Event isutsu Aisatsu\".'),(58,'2013-07-21 18:29:10',1,17,'3','isutsu:: Tori:Female Shodan Uke:Male Shodan @ Test Event ',2,'Changed tori and uke.'),(59,'2013-07-27 17:28:46',1,19,'1','Omar Marquez isutsu:: Tori:Female Shodan Uke:Male Shodan @ Test Event  english isutsu Aisatsu',3,''),(60,'2013-07-27 17:47:56',1,3,'3','bzises',1,''),(61,'2013-07-27 17:48:45',1,3,'3','bzises',2,'Changed password, first_name, last_name, is_staff and groups.'),(62,'2013-07-27 22:56:33',1,3,'4','Randrews',1,''),(63,'2013-07-27 23:03:57',1,3,'4','Randrews',2,'Changed password, first_name, last_name and is_staff.'),(64,'2013-07-27 23:05:33',1,3,'4','andrews',2,'Changed username and password.'),(65,'2013-07-27 23:07:06',1,3,'4','andrews',2,'Changed password.'),(66,'2013-07-27 23:08:58',1,3,'4','andrews',3,''),(67,'2013-07-27 23:10:21',1,3,'5','andrews',1,''),(68,'2013-07-28 18:29:05',1,17,'3','isutsu:: Tori:Female Shodan Uke:Male Shodan @ Test Event ',2,'Changed video for tech video \"Test Event isutsu Aisatsu\".'),(69,'2013-07-28 18:31:12',1,17,'3','isutsu:: Tori:Female Shodan Uke:Male Shodan @ Test Event ',2,'Changed video for tech video \"Test Event isutsu Oshikaeshi\".'),(70,'2013-07-28 18:48:43',1,17,'3','isutsu:: Tori:Female Shodan Uke:Male Shodan @ Test Event ',2,'Changed video for tech video \"Test Event isutsu Eige\". Changed video for tech video \"Test Event isutsu Tomowakare\". Changed video for tech video \"Test Event isutsu Roin\". Changed video for tech video \"Test Event isutsu Aisatsu\". Changed video for tech video \"Test Event isutsu Settsuka no wakare\".'),(71,'2013-07-29 03:30:13',1,17,'3','isutsu:: Tori:Female Shodan Uke:Male Shodan @ Test Event ',2,'Changed video for tech video \"Test Event isutsu Aisatsu\". Changed video for tech video \"Test Event isutsu Oshikaeshi\". Changed video for tech video \"Test Event isutsu Eige\". Changed video for tech video \"Test Event isutsu Tomowakare\". Changed video for tech video \"Test Event isutsu Roin\". Changed video for tech video \"Test Event isutsu Aisatsu\". Changed video for tech video \"Test Event isutsu Settsuka no wakare\".'),(72,'2013-07-29 11:52:12',1,17,'3','isutsu:: Tori:Female Shodan Uke:Male Shodan @ Test Event ',2,'Changed video for tech video \"Test Event isutsu Aisatsu\".'),(73,'2013-07-30 01:46:16',1,17,'3','isutsu:: Tori:Female Shodan Uke:Male Shodan @ Test Event ',2,'Changed video for tech video \"Test Event isutsu Aisatsu\".'),(74,'2013-08-01 01:30:42',1,23,'1','Category object',2,'No fields changed.'),(75,'2013-08-01 15:39:09',1,3,'6','nleung',1,''),(76,'2013-08-01 16:13:12',1,3,'6','nleung',2,'Changed password, first_name, last_name, email, is_staff and groups.'),(77,'2013-08-01 23:50:11',1,3,'1','omarquez',2,'Changed password and groups.'),(78,'2013-08-10 11:37:58',1,19,'2','Omar Marquez isutsu:: Tori:Female Shodan Uke:Male Shodan @ Test Event  english isutsu Aisatsu',3,''),(79,'2013-08-10 11:38:23',1,19,'4','Omar Marquez isutsu:: Tori:Female Shodan Uke:Male Shodan @ Test Event  english isutsu Aisatsu',3,''),(80,'2013-08-10 11:49:55',1,12,'3','isutsu',2,'Changed tech_name for kata technique \"isutsu 10 Bow Out\".'),(81,'2013-08-10 11:50:16',1,12,'2','juno',2,'Changed tech_name for kata technique \"juno 16 Bow Out\".'),(82,'2013-08-10 11:50:41',1,12,'1','nageno',2,'Changed tech_name for kata technique \"nageno 15 Bow Out\".'),(83,'2013-08-10 17:57:02',1,2,'5','Kata_Judges',1,''),(84,'2013-08-11 17:54:01',1,3,'5','andrews',2,'Changed password and groups.'),(85,'2013-08-11 17:56:33',1,3,'5','andrews',2,'Changed password, first_name and last_name.'),(86,'2013-08-13 00:02:14',1,12,'1','nageno',2,'Changed tech_order for kata technique \"nageno 5 Harai goshi\". Changed tech_order for kata technique \"nageno 6 Tsurikomi goshi\". Changed tech_order for kata technique \"nageno 7 Okuri ashi harai\". Changed tech_order for kata technique \"nageno 8 Sasae tsurikomi ashi\". Changed tech_order for kata technique \"nageno 9 Uchi mata\". Changed tech_order for kata technique \"nageno 10 Tomoe nage\". Changed tech_order for kata technique \"nageno 11 Ura nage\". Changed tech_order for kata technique \"nageno 12 Sumi gaeshi\". Changed tech_order for kata technique \"nageno 13 Yoko gake\". Changed tech_order for kata technique \"nageno 14 Yoko guruma\". Changed tech_order for kata technique \"nageno 15 Uki waza\". Changed tech_order for kata technique \"nageno 16 Bow Out\".'),(87,'2013-08-15 23:54:42',1,3,'1','omarquez',2,'Changed password and groups.'),(88,'2013-08-18 20:41:55',1,3,'7','dtjudo',1,''),(89,'2013-08-18 20:42:52',1,3,'7','dtjudo',2,'Changed password, first_name, last_name, email, is_staff and groups.'),(90,'2013-08-18 23:15:01',1,3,'7','dtjudo',2,'Changed password and groups.'),(91,'2013-08-18 23:19:11',1,3,'7','dtjudo',2,'Changed password and groups.'),(92,'2013-08-25 20:22:28',1,12,'7','Katame',1,''),(93,'2013-08-25 20:23:28',1,12,'7','Katame',2,'Changed image.'),(94,'2014-02-22 01:26:17',1,3,'8','cindy',1,''),(95,'2014-02-22 01:27:37',1,3,'8','cindy',2,'Changed password, first_name, last_name, email, is_staff, is_superuser and groups.'),(96,'2014-02-22 01:49:56',8,16,'4','Welcome Mat Open',1,''),(97,'2014-02-22 02:59:48',1,19,'5','Omar Marquez isutsu:: Tori:Omar Marquez Uke:Daine Jablonskyte @ Welcome Mat Open  english isutsu Aisatsu',3,''),(98,'2014-02-22 02:59:48',1,19,'4','Omar Marquez isutsu:: Tori:Omar Marquez Uke:Daine Jablonskyte @ Welcome Mat Open  english isutsu Aisatsu',3,''),(99,'2014-02-22 04:51:22',1,12,'1','nageno',2,'Changed tech_name for kata technique \"nageno 0 Aisatsu\". Changed tech_order for kata technique \"nageno 3 Migi Seoi nage\". Changed tech_order for kata technique \"nageno 5 Migi Kata guruma\". Changed tech_order for kata technique \"nageno 7 Migi Uki goshi\". Changed tech_order for kata technique \"nageno 9 Migi Harai goshi\". Changed tech_order for kata technique \"nageno 11 Migi Tsurikomi goshi\". Changed tech_order for kata technique \"nageno 13 Migi Okuri ashi harai\". Changed tech_order for kata technique \"nageno 15 Migi Sasae tsurikomi ashi\". Changed tech_order for kata technique \"nageno 17 Migi Uchi mata\". Changed tech_order for kata technique \"nageno 19 Migi Tomoe nage\". Changed tech_order for kata technique \"nageno 21 Migi Ura nage\". Changed tech_order for kata technique \"nageno 23 Migi Sumi gaeshi\". Changed tech_order for kata technique \"nageno 25 Migi Yoko gake\". Changed tech_order for kata technique \"nageno 27 Migi Yoko guruma\". Changed tech_order for kata technique \"nageno 29 Migi Uki waza\". Changed tech_order for kata technique \"nageno 31 Migi Bow Out\". Changed tech_order for kata technique \"nageno 2 Hidari Uki otoshi\". Changed tech_order for kata technique \"nageno 4 Hidari Seoi nage\". Changed tech_order for kata technique \"nageno 6 Hidari Kata guruma\". Changed tech_order for kata technique \"nageno 8 Hidari Uki goshi\". Changed tech_order for kata technique \"nageno 10 Hidari Harai goshi\". Changed tech_order for kata technique \"nageno 12 Hidari Tsurikomi goshi\". Changed tech_order for kata technique \"nageno 14 Hidari Okuri ashi harai\". Changed tech_order for kata technique \"nageno 16 Hidari Sasae tsurikomi ashi\". Changed tech_order for kata technique \"nageno 18 Hidari Uchi mata\". Changed tech_order for kata technique \"nageno 20 Hidari Tomoe nage\". Changed tech_order for kata technique \"nageno 22 Hidari Ura nage\". Changed tech_order for kata technique \"nageno 24 Hidari Sumi gaeshi\". Changed tech_order for kata technique \"nageno 28 Hidari Yoko gake\". Changed tech_order for kata technique \"nageno 30 Hidari Yoko guruma\". Changed tech_order for kata technique \"nageno 32 Hidari Uki waza\". Changed tech_order for kata technique \"nageno 33 Hidari Bow Out\".'),(100,'2014-02-22 04:52:00',1,12,'1','nageno',2,'Deleted kata technique \"nageno 31 Migi Bow Out\". Deleted kata technique \"nageno 0 Hidari Aisatsu\".'),(101,'2014-02-22 19:44:46',1,12,'1','nageno',2,'Changed tech_name for kata technique \"nageno 33 Aisatsu\".'),(102,'2014-02-22 19:45:09',1,12,'3','isutsu',2,'Changed tech_name for kata technique \"isutsu 10 Aisatsu\".'),(103,'2014-02-22 19:45:36',1,12,'2','juno',2,'Changed tech_name for kata technique \"juno 16 Aisatsu\".'),(104,'2014-02-22 19:46:34',1,12,'7','Katame',2,'Changed tech_name for kata technique \"Katame 1 Aisatsu\". Changed tech_name for kata technique \"Katame 16 Aisatsu\".'),(105,'2014-02-22 19:47:14',1,12,'3','isutsu',2,'Added kata technique \"isutsu 11 Overall Flow\".'),(106,'2014-02-22 19:47:30',1,12,'2','juno',2,'Added kata technique \"juno 17 Overall Flow\".'),(107,'2014-02-22 19:47:58',1,12,'1','nageno',2,'Added kata technique \"nageno 34 Overall Flow\".'),(108,'2014-02-23 23:18:19',1,12,'1','nageno',2,'Changed tech_order for kata technique \"nageno 26 Hidari Yoko gake\". Changed tech_order for kata technique \"nageno 28 Hidari Yoko guruma\". Changed tech_order for kata technique \"nageno 30 Hidari Uki waza\". Changed tech_order for kata technique \"nageno 31 Aisatsu\". Changed tech_order for kata technique \"nageno 32 Overall Flow\".');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'kata','learn','kata'),(9,'kata image','learn','kataimage'),(10,'kata technique','learn','katatechnique'),(11,'tech image','learn','techimage'),(12,'kata','kata','kata'),(13,'kata image','kata','kataimage'),(14,'kata technique','kata','katatechnique'),(16,'event','kata','event'),(17,'kata execution','kata','kataexecution'),(18,'tech video','kata','techvideo'),(19,'critique','kata','critique'),(20,'score','kata','score'),(22,'event table','kata','eventtable'),(23,'category','kata','category');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0q3zc81qcju35qzcq1qtlfukgewdsr8y','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2013-08-13 01:42:48'),('0znyh2bs8tlua9ogroo8mu22indxdqv1','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2014-03-04 12:41:06'),('1u5v5cisiccmvpt2pn8j0ey5ydmkdc35','NTc1ZmJiNTg5NjU5ODI0NjA3ODA4NWNhYzhkYzM2ZjRmODcyMjM5NjqAAn1xAVUKc2VhcmNoX2V4cFgAAAAAcy4=','2013-08-12 22:32:52'),('23dwr0b1uoq3rhqih92xpvu2dt6ecsif','NDA5M2I5NDlmYzMwOGI0ODZhODE5YmIxNWVlZDI5Y2JjNjZjYmY4MjqAAn1xAShVCnNlYXJjaF9leHBVAFUNX2F1dGhfdXNlcl9pZIoBAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHUu','2013-09-28 23:03:45'),('2s2c253qt380njgzi4hu9544tm4dsu1i','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2014-03-04 12:48:52'),('361afaveq8gi5he4b36ntjg69wyed22k','NTc1ZmJiNTg5NjU5ODI0NjA3ODA4NWNhYzhkYzM2ZjRmODcyMjM5NjqAAn1xAVUKc2VhcmNoX2V4cFgAAAAAcy4=','2013-08-12 23:41:52'),('4qyqeag1a9zn51354u6a1bl92xny1g4l','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2013-09-01 23:01:23'),('4rqkfren23pv7z9ayuaew4xtsvqlhin0','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2013-08-12 00:00:08'),('4z0bskakrelzwjr7yge1x01umo2kjjr1','MTNhOWRjNTExMmYxNGY1MDZkY2Q4NzhkNWMxNzMyZWJiMjgyMDU2MjqAAn1xAShVCnNlYXJjaF9leHBVAFUNX2F1dGhfdXNlcl9pZIoBBVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHUu','2013-08-30 11:49:31'),('544tczcajgfbqevv3oqpjjr0hzal50zf','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2013-08-06 17:04:31'),('5bjt37kht8gc2c8fukbfd1u1q0fdum92','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2013-08-07 00:11:49'),('5fazdkbl2eqyo4bef61stu4qonrsh1i2','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2013-08-11 02:36:55'),('6aibp27z381mj03k6rilhrrx5sppfrw3','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2014-02-14 12:57:41'),('6aoang4shyauwrznivrzbvkqyi7dcay5','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2014-03-04 19:54:21'),('6xxtfawdjivmeb115gbjmsphymzauvr3','NTc1ZmJiNTg5NjU5ODI0NjA3ODA4NWNhYzhkYzM2ZjRmODcyMjM5NjqAAn1xAVUKc2VhcmNoX2V4cFgAAAAAcy4=','2013-08-13 03:42:29'),('7io65dwrv8cvf4los9j22toqm2jx6oly','MmI5ODgwNzU5ZTVlZjlkM2ViODE1MDI1ZGJmMGUxNzRmMGFhMmU3MjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVDV9hdXRoX3VzZXJfaWSKAQFVCnNlYXJjaF9leHBYAAAAAHUu','2013-09-01 23:27:14'),('7z6h0k32lncrre5h54e6r6j8dhdxe7df','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2014-03-04 12:41:02'),('8ajn8hgtg7l7vdwebia5lu2efei6ylky','MTUxNDBlZDdkNjZlOWQ1NTAxYzI0MWY3ZWZkZDBiMjhjNjFlYzYxNzqAAn1xAShVCnNlYXJjaF9leHBYAAAAAFUNX2F1dGhfdXNlcl9pZIoBAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHUu','2013-08-05 01:17:32'),('95w5u05wu1pn9h88atdmpxhgbh5k3lcv','NTc1ZmJiNTg5NjU5ODI0NjA3ODA4NWNhYzhkYzM2ZjRmODcyMjM5NjqAAn1xAVUKc2VhcmNoX2V4cFgAAAAAcy4=','2013-08-11 22:58:07'),('9a4p2spsi70vozbmgecfqgqm5h7zo2ka','ZjQzY2NmMGU3NGZiZWRiZmJmOWFmMTAzNjU3ZDk1MjViMjBmYjQzZTqAAn1xAShVCnNlYXJjaF9leHBVAFUNX2F1dGhfdXNlcl9pZIoBB1USX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHUu','2013-10-11 04:23:59'),('9aqv7xs66w2kd0ueihcf0r355kvovs0x','Y2MxNmE2ZDI3ODA2MmQ0NWM2YWY2NTdiNjkxYzI0NDVhOTcwOWZkODqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu','2014-03-05 14:50:55'),('9c2uvnoukgn2dd7ekwrd5pi1g00y7oo8','NTc1ZmJiNTg5NjU5ODI0NjA3ODA4NWNhYzhkYzM2ZjRmODcyMjM5NjqAAn1xAVUKc2VhcmNoX2V4cFgAAAAAcy4=','2013-08-11 19:20:19'),('absudxmixxfxy2krbccozixplw16e5g3','ZjQzY2NmMGU3NGZiZWRiZmJmOWFmMTAzNjU3ZDk1MjViMjBmYjQzZTqAAn1xAShVCnNlYXJjaF9leHBVAFUNX2F1dGhfdXNlcl9pZIoBB1USX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHUu','2013-09-01 23:14:12'),('akiqxub0ih5e7cnr8iufflpr2bfu7wud','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2013-08-28 03:57:10'),('az2grrm28oo7mabf07zd3nxt8emunoef','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2014-03-05 13:51:25'),('b5amie12czibceaxl90q9xu9mdi2mp5u','MmI5ODgwNzU5ZTVlZjlkM2ViODE1MDI1ZGJmMGUxNzRmMGFhMmU3MjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVDV9hdXRoX3VzZXJfaWSKAQFVCnNlYXJjaF9leHBYAAAAAHUu','2013-09-16 23:49:16'),('conl7kwqcqpta3psxyeld3pjwva2ugmv','NTc1ZmJiNTg5NjU5ODI0NjA3ODA4NWNhYzhkYzM2ZjRmODcyMjM5NjqAAn1xAVUKc2VhcmNoX2V4cFgAAAAAcy4=','2013-08-13 01:52:19'),('cxta6r53o56xkhx7voyp57hulutznndm','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2014-03-04 14:23:34'),('d4a2nko3mnuxyq1ul0dyg058doyehv09','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2014-03-04 12:53:24'),('e5fhja5pba3kuebbh36d2ilarir1q6yf','MGY2YzM4NWVjNWM4N2I1MjMyOTg2YzYzN2I2M2M4MDAwOWVlMzQxZDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRYCgAAAHRlc3Rjb29raWVYBgAAAHdvcmtlZFUNX2F1dGhfdXNlcl9pZIoBBVUKc2VhcmNoX2V4cFgEAAAAanVub3Uu','2013-09-01 00:01:40'),('eqz10w0mwhhu3664p97zkp386b1ws3fa','NTdiNzc2ZTYwN2U0ZDc2ZDg2NjY1ZmNhOGQ3NzRmNTZhZGYwYTE1NzqAAn1xAShVCnNlYXJjaF9leHBVAFgKAAAAdGVzdGNvb2tpZVgGAAAAd29ya2VkVQ1fYXV0aF91c2VyX2lkigEFVRJfYXV0aF91c2VyX2JhY2tlbmRVKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kdS4=','2013-08-10 23:48:25'),('fefx08ujpdpkkzvuc3p40cab1z96x5yz','ZDlhNzU1NmM1N2EwOTRkMjBlYzM0NTFiNTRkYjgwNjk5NzUyOWE4MDqAAn1xAVUKc2VhcmNoX2V4cFUAcy4=','2014-03-04 14:15:47'),('fne6pj8qr5ipkj33p9gq4hfcdm9nkwkw','OTNmZjVkN2QyMjc1MDVhM2NmNTNiNTg1MmQzOGI2NmY0OGFmZGNlMTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQFVCnNlYXJjaF9leHBYAAAAAHUu','2013-08-14 05:36:35'),('fpcw3l4n8u4s0cdx0an2uxnofl73jm94','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2014-03-04 12:48:52'),('fu57i8byzxlr9vopws2tej44ixrorri2','NDA5M2I5NDlmYzMwOGI0ODZhODE5YmIxNWVlZDI5Y2JjNjZjYmY4MjqAAn1xAShVCnNlYXJjaF9leHBVAFUNX2F1dGhfdXNlcl9pZIoBAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHUu','2013-08-12 12:29:57'),('gzmqaxb7okbhulwgjy9duzpwd1i3dfto','NGUyZDE5NWYyYTY5OGNlYzU0Yzc5NWUyM2QzNDUzNzk4NGU5ZGJlZTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==','2013-07-27 17:17:24'),('h89rdj9uq1dwjw6kq28ktcopbdvu2joy','NGUyZDE5NWYyYTY5OGNlYzU0Yzc5NWUyM2QzNDUzNzk4NGU5ZGJlZTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==','2013-07-28 18:27:04'),('hxyg8p930mag2f0biritp30zxahjvzjo','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2013-08-16 00:49:01'),('hysbm0oil5dv4wm31ty31w17k3tbi6vu','ZDlhNzU1NmM1N2EwOTRkMjBlYzM0NTFiNTRkYjgwNjk5NzUyOWE4MDqAAn1xAVUKc2VhcmNoX2V4cFUAcy4=','2013-10-31 15:58:45'),('i9ghfv5pfvwhvp20nft1nlx0artjjyaj','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2014-03-04 12:50:48'),('izhhnshbl1ghkssvne1efjempqneoe46','NDA5M2I5NDlmYzMwOGI0ODZhODE5YmIxNWVlZDI5Y2JjNjZjYmY4MjqAAn1xAShVCnNlYXJjaF9leHBVAFUNX2F1dGhfdXNlcl9pZIoBAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHUu','2014-03-09 18:14:44'),('jm40ikjwecig7ma4c340iqpn249yjijf','ZDlhNzU1NmM1N2EwOTRkMjBlYzM0NTFiNTRkYjgwNjk5NzUyOWE4MDqAAn1xAVUKc2VhcmNoX2V4cFUAcy4=','2013-08-11 22:49:06'),('jplkgeb772ioqug2bj8d8sx01cq59wt3','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2014-03-04 12:50:53'),('kgmd88ecoj42ah8qit9hgxauehd2y158','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2014-03-04 12:48:57'),('ku76l2fya0baril7uii7b8fk318xgrhj','Y2MxNmE2ZDI3ODA2MmQ0NWM2YWY2NTdiNjkxYzI0NDVhOTcwOWZkODqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu','2014-03-05 14:47:08'),('l1txln18szu3b8t09dkxseskqe4o0ltz','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2013-10-24 20:41:40'),('l69uaunzafoe48h7brgay89nuka20br9','NDA5M2I5NDlmYzMwOGI0ODZhODE5YmIxNWVlZDI5Y2JjNjZjYmY4MjqAAn1xAShVCnNlYXJjaF9leHBVAFUNX2F1dGhfdXNlcl9pZIoBAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHUu','2014-03-08 02:41:05'),('lc3atad99fgcmvea0lvkbqfb3cw4ikk2','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2013-10-24 20:40:58'),('libtc4p2r1z98ktmng2ba5ub1dmevw55','ZDlhNzU1NmM1N2EwOTRkMjBlYzM0NTFiNTRkYjgwNjk5NzUyOWE4MDqAAn1xAVUKc2VhcmNoX2V4cFUAcy4=','2013-08-13 16:52:19'),('lvmepf0afvuv3udikzo5a2xpg0iellcp','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2014-03-08 02:55:13'),('mtulvotwdjvj8asp5k8epcd5y0fi9rrt','MmI5ODgwNzU5ZTVlZjlkM2ViODE1MDI1ZGJmMGUxNzRmMGFhMmU3MjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVDV9hdXRoX3VzZXJfaWSKAQFVCnNlYXJjaF9leHBYAAAAAHUu','2013-08-31 14:10:36'),('mye3y8mks6rw1z1uwtd2j48cbi85kqjv','ZDlhNzU1NmM1N2EwOTRkMjBlYzM0NTFiNTRkYjgwNjk5NzUyOWE4MDqAAn1xAVUKc2VhcmNoX2V4cFUAcy4=','2013-08-13 02:15:22'),('nc3sosf0oj886v6610pph7j6rmxnfc2s','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2014-03-05 14:10:22'),('qlj2as182kofmp2abo7cppxmnuqdldbk','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2014-03-04 12:50:47'),('r1e3a6ehhybg9nmty23d1gwwwjm1y1b5','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2014-03-04 12:53:29'),('r2sitaclhxatoxu30lo7md4fxowpeksx','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2014-03-04 14:23:33'),('rzdhrvur1ag5frl6zksajkcs8bo472cs','ZDlhNzU1NmM1N2EwOTRkMjBlYzM0NTFiNTRkYjgwNjk5NzUyOWE4MDqAAn1xAVUKc2VhcmNoX2V4cFUAcy4=','2014-02-14 04:45:43'),('soin4rege7khx64idqhmz83cu368h9ee','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2013-08-11 02:36:56'),('stnt2hb4d4x2nf58wgudc4mdb69fy6mv','NzM2NTgzMDZmMjQzZjM3MDJmYTkxODRlNWQ0Nzk3M2NjMzRlMWJhYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVDV9hdXRoX3VzZXJfaWSKAQNVCnNlYXJjaF9leHBYAAAAAHUu','2013-08-11 16:05:09'),('vk2jqnqfxokcf9dfodh3xil44f3taddp','NTc1ZmJiNTg5NjU5ODI0NjA3ODA4NWNhYzhkYzM2ZjRmODcyMjM5NjqAAn1xAVUKc2VhcmNoX2V4cFgAAAAAcy4=','2013-08-12 03:50:29'),('von1zl8xii33b5fnxi2l96z476eo3jgu','NDExZmU4MDEwY2NmNGQ2NzU4NTIzMzliZjgwZDNkM2E2N2Q5NDgyNzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVDV9hdXRoX3VzZXJfaWSKAQFVCnNlYXJjaF9leHBVAHUu','2014-03-09 23:50:22'),('vz0ku5qf09xfrdc4mg28pgh4223x9kuo','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2013-08-11 02:36:55'),('w4iey6sqmeurd2t6oqx4ex5fs0vcgu6j','NDA5M2I5NDlmYzMwOGI0ODZhODE5YmIxNWVlZDI5Y2JjNjZjYmY4MjqAAn1xAShVCnNlYXJjaF9leHBVAFUNX2F1dGhfdXNlcl9pZIoBAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHUu','2013-08-14 15:38:38'),('wpl8zb6kp1jo610puu37t50pete73cqx','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2014-03-04 14:23:33'),('wtoev8odnl8bpgpddula3587fsag1n6w','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2013-09-02 21:08:46'),('wzo95snbxqk523q85jn094rxm1dc6sxh','MmI5ODgwNzU5ZTVlZjlkM2ViODE1MDI1ZGJmMGUxNzRmMGFhMmU3MjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVDV9hdXRoX3VzZXJfaWSKAQFVCnNlYXJjaF9leHBYAAAAAHUu','2013-08-13 04:07:35'),('x9kw47q4rh9u1qbxdgtbhunbvyeuv1ol','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2014-03-04 12:53:24'),('y5bc8aqjoahblxg3zq4ir2p80v3ztkqy','NGUyZDE5NWYyYTY5OGNlYzU0Yzc5NWUyM2QzNDUzNzk4NGU5ZGJlZTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==','2013-07-28 14:42:54'),('z2e9hg8wxv8worn8xsqis8djhgr66qk9','MTU0NGQ3NGUwMjJmNTJhZGMwM2U0NzY2NjM4NDUwMWM3Yzk3MTRlMTqAAn1xAVUKc2VhcmNoX2V4cHECVQBzLg==','2014-03-06 14:41:17');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kata_category`
--

DROP TABLE IF EXISTS `kata_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kata_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kata_category_a41e20fe` (`event_id`),
  CONSTRAINT `event_id_refs_id_635a8cc8` FOREIGN KEY (`event_id`) REFERENCES `kata_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kata_category`
--

LOCK TABLES `kata_category` WRITE;
/*!40000 ALTER TABLE `kata_category` DISABLE KEYS */;
INSERT INTO `kata_category` VALUES (14,4,'Juniors','Nage No Kata'),(15,4,'Seniors','Nage No Kara');
/*!40000 ALTER TABLE `kata_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kata_critique`
--

DROP TABLE IF EXISTS `kata_critique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kata_critique` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created` date NOT NULL,
  `updated` datetime NOT NULL,
  `tech_video_id` int(11) NOT NULL,
  `language` varchar(20) DEFAULT NULL,
  `search` varchar(160) DEFAULT NULL,
  `media` varchar(2000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kata_critique_6340c63c` (`user_id`),
  KEY `kata_critique_480fc19b` (`tech_video_id`),
  KEY `kata_critique_44523a97` (`search`),
  CONSTRAINT `tech_video_id_refs_id_00540c0e` FOREIGN KEY (`tech_video_id`) REFERENCES `kata_techvideo` (`id`),
  CONSTRAINT `user_id_refs_id_a61e452d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kata_critique`
--

LOCK TABLES `kata_critique` WRITE;
/*!40000 ALTER TABLE `kata_critique` DISABLE KEYS */;
INSERT INTO `kata_critique` VALUES (6,1,'2014-02-21','2014-02-22 02:41:48',13,'english','Omar Marquez isutsu:: Tori:Omar Marquez Uke:Daine Jablonskyte @ Welcome Mat Open  english isutsu Aisatsu','critiques/6_capturedvideo_2.MOV');
/*!40000 ALTER TABLE `kata_critique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kata_event`
--

DROP TABLE IF EXISTS `kata_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kata_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(200) NOT NULL,
  `event_description` longtext NOT NULL,
  `event_location` varchar(600) NOT NULL,
  `event_date` date NOT NULL,
  `created` date NOT NULL,
  `updated` datetime NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `scoring_ignore_higlow` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kata_event`
--

LOCK TABLES `kata_event` WRITE;
/*!40000 ALTER TABLE `kata_event` DISABLE KEYS */;
INSERT INTO `kata_event` VALUES (1,'Test Event','This is to test the software','Skokie','2013-07-14','2013-07-14','2013-07-17 00:49:02','event_images/kata-guruma.gif',NULL,0),(2,'13th Anual USJF Kata Conference','August 9–11, 2013 • Chicago, Illinois\r\nSponsored by the USJF Kata Committee, Chicago Judo Black Belt Association and the Tohkon Judo Academy\r\nThe United States Judo Federation (USJF) Kata Development Committee and the\r\nChicago Judo Black Belt Association proudly welcome\r\nthe following nationally recognized kata experts and honored guests:',' Tohkon Judo Academy\r\n 4427 N. Clark St\r\n Chicago, IL 60640\r\n','2013-08-09','2013-07-14','2013-07-14 19:55:18','event_images/Screen_Shot_2013-07-14_at_2.43.13_PM.png',NULL,0),(3,'Tohkon Annual Kata Clinic','Tohkon Kata Clinic',' Tohkon Judo Academy\r\n 4427 N. Clark St\r\n Chicago, IL 60640','2014-02-14','2013-07-14','2013-07-14 19:55:29','event_images/Screen_Shot_2013-07-14_at_2.43.27_PM.png',NULL,0),(4,'Welcome Mat Open','Kata competition','Fond Du Lac, WI','2014-02-21','2014-02-21','2014-02-22 01:49:56','',NULL,0);
/*!40000 ALTER TABLE `kata_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kata_eventtable`
--

DROP TABLE IF EXISTS `kata_eventtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kata_eventtable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created` date NOT NULL,
  `updated` datetime NOT NULL,
  `event_id` int(11) NOT NULL,
  `current_execution` int(11) DEFAULT NULL,
  `current_technique` int(11) DEFAULT NULL,
  `table_name` varchar(100) NOT NULL,
  `table_location` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kata_eventtable_6340c63c` (`user_id`),
  KEY `kata_eventtable_a41e20fe` (`event_id`),
  CONSTRAINT `event_id_refs_id_7e105997` FOREIGN KEY (`event_id`) REFERENCES `kata_event` (`id`),
  CONSTRAINT `user_id_refs_id_8190337e` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kata_eventtable`
--

LOCK TABLES `kata_eventtable` WRITE;
/*!40000 ALTER TABLE `kata_eventtable` DISABLE KEYS */;
INSERT INTO `kata_eventtable` VALUES (7,8,'2014-02-21','2014-02-22 04:52:18',4,7,1,'Table 1','Nearest the Door'),(8,1,'2014-02-21','2014-02-22 01:57:59',4,NULL,NULL,'Table in Chicago','North Chicago');
/*!40000 ALTER TABLE `kata_eventtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kata_kata`
--

DROP TABLE IF EXISTS `kata_kata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kata_kata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kata_name` varchar(200) NOT NULL,
  `origin` varchar(100) NOT NULL,
  `rank` varchar(100) NOT NULL,
  `kata_description` longtext NOT NULL,
  `created` date NOT NULL,
  `updated` datetime NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kata_kata`
--

LOCK TABLES `kata_kata` WRITE;
/*!40000 ALTER TABLE `kata_kata` DISABLE KEYS */;
INSERT INTO `kata_kata` VALUES (1,'nageno','kodokan','1st','forms of throwing','2013-07-14','2014-02-23 23:18:19','kata_images/nageno.jpg'),(2,'juno','kodokan','6th','forms of gentleness','2013-07-14','2014-02-22 19:47:30','kata_images/juno.jpg'),(3,'isutsu','kodokan','6th','forms of five','2013-07-14','2014-02-22 19:47:14','kata_images/itsutsu.jpg'),(7,'Katame','Kodokan','Shodan','Osaekomi Waza\r\nShime Waza\r\nKansetsu Waza','2013-08-25','2014-02-22 19:46:34','kata_images/kami.jpg');
/*!40000 ALTER TABLE `kata_kata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kata_kataexecution`
--

DROP TABLE IF EXISTS `kata_kataexecution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kata_kataexecution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `event_table_id` int(11) NOT NULL,
  `kata_id` int(11) NOT NULL,
  `tori` varchar(100) NOT NULL,
  `tori_club` varchar(60) NOT NULL,
  `uke` varchar(100) NOT NULL,
  `uke_club` varchar(60) NOT NULL,
  `total_score` decimal(5,2) DEFAULT NULL,
  `created` date NOT NULL,
  `updated` datetime NOT NULL,
  `search` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kata_kataexecution_7492577a` (`event_table_id`),
  KEY `kata_kataexecution_148eed8e` (`kata_id`),
  KEY `kata_kataexecution_44523a97` (`search`),
  CONSTRAINT `event_table_id_refs_id_c4dd56ba` FOREIGN KEY (`event_table_id`) REFERENCES `kata_eventtable` (`id`),
  CONSTRAINT `kata_id_refs_id_6f1afe65` FOREIGN KEY (`kata_id`) REFERENCES `kata_kata` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kata_kataexecution`
--

LOCK TABLES `kata_kataexecution` WRITE;
/*!40000 ALTER TABLE `kata_kataexecution` DISABLE KEYS */;
INSERT INTO `kata_kataexecution` VALUES (7,14,7,1,'Cindy Peterson','Racine Kyu Dojo','Tony Truskowski','Racine Kyu Dojo',6.10,'2014-02-21','2014-02-23 23:54:52','nageno:: Tori:Cindy Peterson Uke:Tony Truskowski @ Welcome Mat Open '),(8,14,7,3,'Omar Marquez','Tohkon','Daine Jablonskyte','Tohkon',4.86,'2014-02-21','2014-02-22 02:35:33','isutsu:: Tori:Omar Marquez Uke:Daine Jablonskyte @ Welcome Mat Open ');
/*!40000 ALTER TABLE `kata_kataexecution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kata_kataimage`
--

DROP TABLE IF EXISTS `kata_kataimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kata_kataimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kata_id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kata_kataimage_148eed8e` (`kata_id`),
  CONSTRAINT `kata_id_refs_id_cb868838` FOREIGN KEY (`kata_id`) REFERENCES `kata_kata` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kata_kataimage`
--

LOCK TABLES `kata_kataimage` WRITE;
/*!40000 ALTER TABLE `kata_kataimage` DISABLE KEYS */;
INSERT INTO `kata_kataimage` VALUES (1,3,'kata_images/kano16.jpg');
/*!40000 ALTER TABLE `kata_kataimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kata_katatechnique`
--

DROP TABLE IF EXISTS `kata_katatechnique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kata_katatechnique` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kata_id` int(11) NOT NULL,
  `tech_order` smallint(5) unsigned NOT NULL,
  `tech_name` varchar(200) NOT NULL,
  `tech_description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kata_katatechnique_148eed8e` (`kata_id`),
  CONSTRAINT `kata_id_refs_id_27aa7783` FOREIGN KEY (`kata_id`) REFERENCES `kata_kata` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kata_katatechnique`
--

LOCK TABLES `kata_katatechnique` WRITE;
/*!40000 ALTER TABLE `kata_katatechnique` DISABLE KEYS */;
INSERT INTO `kata_katatechnique` VALUES (1,1,0,'Aisatsu','Salutation: Tori (???, the executor of the techniques in the kata) and Uke (?? the receiver?) approach the mat from opposite sides, with Tori on the left hand of the Joseki (???, high point of the dojo) and Uke on the right (i.e. as they would be if facing towards the Joseki). They bow as they step on the mat, then turn to face the Joseki and execute a ritsu rei (???, standing bow), then turn to face each other and execute a zarei (???, kneeling bow). Tori and Uke step in, left foot first, to adopt shizen hontai (?? ???, basic natural posture)'),(2,1,1,'Migi Uki otoshi','Te-waza: ...'),(3,1,3,'Migi Seoi nage','Te-waza: ...'),(4,1,5,'Migi Kata guruma','Te-waza: ...'),(5,1,7,'Migi Uki goshi','Koshi-waza: ...'),(6,1,9,'Migi Harai goshi','Koshi-waza: ...'),(7,1,11,'Migi Tsurikomi goshi','Koshi-waza: ...'),(8,1,13,'Migi Okuri ashi harai','Ashi-waza: ...'),(9,1,15,'Migi Sasae tsurikomi ashi','Ashi-waza: ...'),(10,1,17,'Migi Uchi mata','Ashi-waza: ...'),(11,1,19,'Migi Tomoe nage','Ma-sutemi-waza: ...'),(12,1,21,'Migi Ura nage','Ma-sutemi-waza: ...'),(13,1,23,'Migi Sumi gaeshi','Ma-sutemi-waza: ...'),(14,1,25,'Migi Yoko gake','Yoko-sutemi-waza: ...'),(15,1,27,'Migi Yoko guruma','Yoko-sutemi-waza: ...'),(16,1,29,'Migi Uki waza','Yoko-sutemi-waza: ...'),(18,2,0,'Aisatsu','Salutation: Tori (???, the executor of the techniques in the kata) and Uke (?? the receiver?) approach the mat from opposite sides, with Tori on the left hand of the Joseki (???, high point of the dojo) and Uke on the right (i.e. as they would be if facing towards the Joseki). They bow as they step on the mat, then turn to face the Joseki and execute a ritsu rei (???, standing bow), then turn to face each other and execute a zarei (???, kneeling bow). Tori and Uke step in, left foot first, to adopt shizen hontai (?? ???, basic natural posture)'),(19,2,1,'Tsuki-dashi','Set 1: Hand Thrust...'),(20,2,2,'Kata-oshi','Set 1: Shoulder Push...'),(21,2,3,'Ryo-te-dori','Set 1: Two-Hand Hold...'),(22,2,4,'Kata-mawashi','Set 1: Shoulder Turn...'),(23,2,5,'Ago-oshi','Set 1: Jaw Push...'),(24,2,6,'Kiri-oroshi','Set 2:Downward Cut...'),(25,2,7,'Ryo-kata-oshi','Set 2:Two shoulder push ...'),(26,2,8,'Naname-uchi','Set 2:Slanting stride ...'),(27,2,9,'Kata-te-dorie','Set 2:One hand hold...'),(28,2,10,'Kata-te-age','Set 2:One hand lift...'),(29,2,11,'Obi-tori','Set 3:Belt grab...'),(30,2,12,'Mune-oshi','Set 3:Chest push...'),(31,2,13,'Tsuki-age','Set 3:Uppercut...'),(32,2,14,'Ushi-oroshi','Set 3:Downward strike ...'),(33,2,15,'Ryo-gan-tsuki','Set 3:Eyes strike...'),(34,2,16,'Aisatsu','Salutation: Bow out'),(35,3,0,'Aisatsu','Salutation: Tori (???, the executor of the techniques in the kata) and Uke (?? the receiver?) approach the mat from opposite sides, with Tori on the left hand of the Joseki (???, high point of the dojo) and Uke on the right (i.e. as they would be if facing towards the Joseki). They bow as they step on the mat, then turn to face the Joseki and execute a ritsu rei (???, standing bow), then turn to face each other and execute a zarei (???, kneeling bow). Tori and Uke step in, left foot first, to adopt shizen hontai (?? ???, basic natural posture)'),(36,3,1,'Oshikaeshi','1. Continuos push: Demonstrates the principle that rationalized, continuous attack will bring defeat, even against a strong power. This technique represents the impeccable strength of justice. A small power applied continuously, in a rational manner, can control a huge power.'),(37,3,2,'Eige','2. Draw Drop: Demonstrates the principle of using the energy of the opponent\'s attack to defeat them, or victory through yielding.'),(38,3,3,'Tomowakare','3. Separation: Demonstrates the principle of the whirlpool, wherein the inner circle controls the outer circle. Two objects revolving in giant circles, inevitably they close in on each other, and then part without damage.'),(39,3,4,'Roin','4. Pulling tide: Demonstrates the power of the ocean\'s tide. The tide will draw everything on the shore into the ocean, no matter how large, as a giant wave sweeping the beach clean of all debris and impurity.'),(40,3,5,'Settsuka no wakare','5. Instant Separation: Demonstrates the principle of yielding: when unlimited energies collide with each other, one yields to avoid destroying both. This technique shows that a clash between two strong forces can only result in mutual doom, but if you step aside and give way there will be peace and coexistance.'),(41,3,10,'Aisatsu','Salutation: Bow out'),(42,7,1,'Aisatsu','Approach'),(43,7,2,'Kuzure Kesa Gatame','Kuzure Kesa Gatame'),(44,7,3,'Kata Gatame','Kata Gatame'),(45,7,4,'Kami Shiho Gatame','Kame Shiho Gatame'),(46,7,5,'Yoko Shiho Gatame','Yoko Shiho Gatame'),(47,7,6,'Kuzure Kami Shiho Gatame','Kuzure Kami Shiho Gatame'),(48,7,7,'Kata Juji Jime','Kata Juji Jime'),(49,7,8,'Hadaka Jime','Hadaka Jime'),(50,7,9,'Okuri Eri Jime','Okuri Eri Jime'),(51,7,10,'Kata ha Jime','Kata ha Jime'),(52,7,11,'Gyaku Juji Jime','Gyaku Juji Jime'),(53,7,12,'Ude Garami','Ude Garami'),(54,7,13,'Ude Hishigi Juji Gatame','Ude Hishigi Juji Gatame'),(55,7,14,'Ude Hishigi Hiza Gatame','Hiza Gatame'),(56,7,15,'Ashi Garami','Ashi Garami'),(57,7,16,'Aisatsu','Bow Out'),(58,7,17,'Overall Flow','Overall Flow'),(60,1,2,'Hidari Uki otoshi','Te-waza: ...'),(61,1,4,'Hidari Seoi nage','Te-waza: ...'),(62,1,6,'Hidari Kata guruma','Te-waza: ...'),(63,1,8,'Hidari Uki goshi','Koshi-waza: ...'),(64,1,10,'Hidari Harai goshi','Koshi-waza: ...'),(65,1,12,'Hidari Tsurikomi goshi','Koshi-waza: ...'),(66,1,14,'Hidari Okuri ashi harai','Ashi-waza: ...'),(67,1,16,'Hidari Sasae tsurikomi ashi','Ashi-waza: ...'),(68,1,18,'Hidari Uchi mata','Ashi-waza: ...'),(69,1,20,'Hidari Tomoe nage','Ma-sutemi-waza: ...'),(70,1,22,'Hidari Ura nage','Ma-sutemi-waza: ...'),(71,1,24,'Hidari Sumi gaeshi','Ma-sutemi-waza: ...'),(72,1,26,'Hidari Yoko gake','Yoko-sutemi-waza: ...'),(73,1,28,'Hidari Yoko guruma','Yoko-sutemi-waza: ...'),(74,1,30,'Hidari Uki waza','Yoko-sutemi-waza: ...'),(75,1,31,'Aisatsu','Salutation: Bow out'),(90,3,11,'Overall Flow','Overall execution flow'),(91,2,17,'Overall Flow','Overall Flow'),(92,1,32,'Overall Flow','Overall Flow');
/*!40000 ALTER TABLE `kata_katatechnique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kata_score`
--

DROP TABLE IF EXISTS `kata_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kata_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created` date NOT NULL,
  `updated` datetime NOT NULL,
  `execution_id` int(11) NOT NULL,
  `technique_id` int(11) NOT NULL,
  `score` decimal(5,2) DEFAULT NULL,
  `uke` decimal(5,2) NOT NULL,
  `tori` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kata_score_6340c63c` (`user_id`),
  KEY `kata_score_042fe192` (`execution_id`),
  KEY `kata_score_28863227` (`technique_id`),
  CONSTRAINT `execution_id_refs_id_69028a67` FOREIGN KEY (`execution_id`) REFERENCES `kata_kataexecution` (`id`),
  CONSTRAINT `technique_id_refs_id_c407f214` FOREIGN KEY (`technique_id`) REFERENCES `kata_katatechnique` (`id`),
  CONSTRAINT `user_id_refs_id_ffc19f87` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kata_score`
--

LOCK TABLES `kata_score` WRITE;
/*!40000 ALTER TABLE `kata_score` DISABLE KEYS */;
INSERT INTO `kata_score` VALUES (143,8,'2014-02-21','2014-02-22 02:10:11',7,1,8.00,4.00,4.00),(145,8,'2014-02-21','2014-02-22 02:11:00',7,2,7.50,4.00,3.50),(148,8,'2014-02-21','2014-02-22 02:11:42',7,3,6.50,3.00,3.50),(149,8,'2014-02-21','2014-02-22 02:12:02',7,4,6.50,3.00,3.50),(151,8,'2014-02-21','2014-02-22 02:12:26',7,5,7.50,4.00,3.50),(153,8,'2014-02-21','2014-02-22 02:12:34',7,6,7.00,4.00,3.00),(157,8,'2014-02-21','2014-02-22 02:12:53',7,7,6.00,3.00,3.00),(159,8,'2014-02-21','2014-02-22 02:12:58',7,8,7.50,3.50,4.00),(162,8,'2014-02-21','2014-02-22 02:13:03',7,9,7.50,3.50,4.00),(164,8,'2014-02-21','2014-02-22 02:13:09',7,10,6.00,3.50,2.50),(166,8,'2014-02-21','2014-02-22 02:13:16',7,11,5.00,3.00,2.00),(168,8,'2014-02-21','2014-02-22 02:13:22',7,12,7.00,3.50,3.50),(170,8,'2014-02-21','2014-02-22 02:13:27',7,13,4.00,2.50,1.50),(172,8,'2014-02-21','2014-02-22 02:13:33',7,14,4.50,2.00,2.50),(173,8,'2014-02-21','2014-02-22 02:13:39',7,15,4.50,2.00,2.50),(174,8,'2014-02-21','2014-02-22 02:13:45',7,16,5.00,3.00,2.00),(176,1,'2014-02-21','2014-02-22 02:21:10',8,35,5.50,1.50,4.00),(177,1,'2014-02-21','2014-02-22 02:21:13',8,36,7.00,3.50,3.50),(178,1,'2014-02-21','2014-02-22 02:21:18',8,37,3.50,2.00,1.50),(179,1,'2014-02-21','2014-02-22 02:21:21',8,38,4.50,1.50,3.00),(180,1,'2014-02-21','2014-02-22 02:21:26',8,39,2.50,0.50,2.00),(181,1,'2014-02-21','2014-02-22 02:21:33',8,40,6.50,2.50,4.00),(182,1,'2014-02-21','2014-02-22 02:21:42',8,41,3.50,1.00,2.50),(190,8,'2014-02-21','2014-02-22 02:32:42',8,35,8.00,4.00,4.00),(191,8,'2014-02-21','2014-02-22 02:32:52',8,36,5.50,3.00,2.50),(192,8,'2014-02-21','2014-02-22 02:33:07',8,37,6.00,3.00,3.00),(193,8,'2014-02-21','2014-02-22 02:33:18',8,38,3.50,1.50,2.00),(194,8,'2014-02-21','2014-02-22 02:34:14',8,39,5.00,3.00,2.00),(195,8,'2014-02-21','2014-02-22 02:35:24',8,40,3.50,1.50,2.00),(196,8,'2014-02-21','2014-02-22 02:35:32',8,41,3.50,1.50,2.00),(222,1,'2014-02-23','2014-02-23 23:53:32',7,60,7.00,3.50,3.50),(223,1,'2014-02-23','2014-02-23 23:53:34',7,3,6.50,3.00,3.50),(224,1,'2014-02-23','2014-02-23 23:53:37',7,61,7.00,3.00,4.00),(225,1,'2014-02-23','2014-02-23 23:53:38',7,4,6.50,3.50,3.00),(226,1,'2014-02-23','2014-02-23 23:53:40',7,62,5.50,2.50,3.00),(227,1,'2014-02-23','2014-02-23 23:53:42',7,5,9.00,4.50,4.50),(228,1,'2014-02-23','2014-02-23 23:53:43',7,63,7.00,3.50,3.50),(229,1,'2014-02-23','2014-02-23 23:53:46',7,6,5.50,2.50,3.00),(230,1,'2014-02-23','2014-02-23 23:53:48',7,64,5.00,3.00,2.00),(231,1,'2014-02-23','2014-02-23 23:53:50',7,7,6.50,3.00,3.50),(232,1,'2014-02-23','2014-02-23 23:53:53',7,65,4.50,2.00,2.50),(233,1,'2014-02-23','2014-02-23 23:53:56',7,8,5.50,2.50,3.00),(234,1,'2014-02-23','2014-02-23 23:53:58',7,66,5.50,2.50,3.00),(235,1,'2014-02-23','2014-02-23 23:54:02',7,9,5.00,2.00,3.00),(236,1,'2014-02-23','2014-02-23 23:54:05',7,67,4.50,2.00,2.50),(237,1,'2014-02-23','2014-02-23 23:54:07',7,10,5.00,2.50,2.50),(238,1,'2014-02-23','2014-02-23 23:54:10',7,68,4.00,1.50,2.50),(239,1,'2014-02-23','2014-02-23 23:54:12',7,11,7.50,3.50,4.00),(240,1,'2014-02-23','2014-02-23 23:54:15',7,69,6.50,3.00,3.50),(241,1,'2014-02-23','2014-02-23 23:54:18',7,12,6.50,3.00,3.50),(242,1,'2014-02-23','2014-02-23 23:54:20',7,70,6.00,3.00,3.00),(243,1,'2014-02-23','2014-02-23 23:54:22',7,13,7.50,3.50,4.00),(244,1,'2014-02-23','2014-02-23 23:54:24',7,71,5.50,2.50,3.00),(245,1,'2014-02-23','2014-02-23 23:54:26',7,14,6.00,3.00,3.00),(246,1,'2014-02-23','2014-02-23 23:54:28',7,72,5.00,2.50,2.50),(247,1,'2014-02-23','2014-02-23 23:54:32',7,15,6.00,3.00,3.00),(248,1,'2014-02-23','2014-02-23 23:54:34',7,73,5.00,2.50,2.50),(249,1,'2014-02-23','2014-02-23 23:54:39',7,16,6.50,3.50,3.00),(250,1,'2014-02-23','2014-02-23 23:54:46',7,74,6.00,3.00,3.00),(251,1,'2014-02-23','2014-02-23 23:54:48',7,75,3.50,1.50,2.00),(252,1,'2014-02-23','2014-02-23 23:54:51',7,92,7.00,3.50,3.50),(253,1,'2014-02-23','2014-02-24 01:41:44',7,1,8.00,3.50,4.50),(254,1,'2014-02-23','2014-02-24 01:41:46',7,2,7.00,3.50,3.50);
/*!40000 ALTER TABLE `kata_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kata_techimage`
--

DROP TABLE IF EXISTS `kata_techimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kata_techimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `technique_id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kata_techimage_28863227` (`technique_id`),
  CONSTRAINT `technique_id_refs_id_208dcd27` FOREIGN KEY (`technique_id`) REFERENCES `kata_katatechnique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kata_techimage`
--

LOCK TABLES `kata_techimage` WRITE;
/*!40000 ALTER TABLE `kata_techimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `kata_techimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kata_techvideo`
--

DROP TABLE IF EXISTS `kata_techvideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kata_techvideo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `execution_id` int(11) NOT NULL,
  `technique_id` int(11) NOT NULL,
  `video` varchar(2000) NOT NULL,
  `created` date NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kata_techvideo_042fe192` (`execution_id`),
  KEY `kata_techvideo_28863227` (`technique_id`),
  CONSTRAINT `execution_id_refs_id_58d58787` FOREIGN KEY (`execution_id`) REFERENCES `kata_kataexecution` (`id`),
  CONSTRAINT `technique_id_refs_id_6658ab88` FOREIGN KEY (`technique_id`) REFERENCES `kata_katatechnique` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kata_techvideo`
--

LOCK TABLES `kata_techvideo` WRITE;
/*!40000 ALTER TABLE `kata_techvideo` DISABLE KEYS */;
INSERT INTO `kata_techvideo` VALUES (13,8,35,'tech_videos/13_Isutsu0.flv','2014-02-21','2014-02-22 02:28:05'),(14,8,36,'tech_videos/14_Isutsu1.flv','2014-02-21','2014-02-22 02:28:35'),(15,8,37,'tech_videos/15_Isutsu2.flv','2014-02-21','2014-02-22 02:31:50'),(16,8,38,'tech_videos/16_Isutsu_3.flv','2014-02-21','2014-02-22 02:32:03'),(17,8,39,'tech_videos/17_Isutsu_4.flv','2014-02-21','2014-02-22 02:32:17'),(18,8,40,'tech_videos/18_Isutsu_5.flv','2014-02-21','2014-02-22 02:32:33'),(19,8,41,'tech_videos/19_isutsu6.flv','2014-02-21','2014-02-22 02:32:44');
/*!40000 ALTER TABLE `kata_techvideo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-23 21:57:07
