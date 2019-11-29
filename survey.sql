-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: survey
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add survey',1,'add_survey'),(2,'Can change survey',1,'change_survey'),(3,'Can delete survey',1,'delete_survey'),(4,'Can view survey',1,'view_survey'),(5,'Can add response',2,'add_response'),(6,'Can change response',2,'change_response'),(7,'Can delete response',2,'delete_response'),(8,'Can view response',2,'view_response'),(9,'Can add question',3,'add_question'),(10,'Can change question',3,'change_question'),(11,'Can delete question',3,'delete_question'),(12,'Can view question',3,'view_question'),(13,'Can add multiple choice',4,'add_multiplechoice'),(14,'Can change multiple choice',4,'change_multiplechoice'),(15,'Can delete multiple choice',4,'delete_multiplechoice'),(16,'Can view multiple choice',4,'view_multiplechoice'),(17,'Can add checkbox choice',5,'add_checkboxchoice'),(18,'Can change checkbox choice',5,'change_checkboxchoice'),(19,'Can delete checkbox choice',5,'delete_checkboxchoice'),(20,'Can view checkbox choice',5,'view_checkboxchoice'),(21,'Can add answer',6,'add_answer'),(22,'Can change answer',6,'change_answer'),(23,'Can delete answer',6,'delete_answer'),(24,'Can view answer',6,'view_answer'),(25,'Can add log entry',7,'add_logentry'),(26,'Can change log entry',7,'change_logentry'),(27,'Can delete log entry',7,'delete_logentry'),(28,'Can view log entry',7,'view_logentry'),(29,'Can add permission',8,'add_permission'),(30,'Can change permission',8,'change_permission'),(31,'Can delete permission',8,'delete_permission'),(32,'Can view permission',8,'view_permission'),(33,'Can add group',9,'add_group'),(34,'Can change group',9,'change_group'),(35,'Can delete group',9,'delete_group'),(36,'Can view group',9,'view_group'),(37,'Can add user',10,'add_user'),(38,'Can change user',10,'change_user'),(39,'Can delete user',10,'delete_user'),(40,'Can view user',10,'view_user'),(41,'Can add content type',11,'add_contenttype'),(42,'Can change content type',11,'change_contenttype'),(43,'Can delete content type',11,'delete_contenttype'),(44,'Can view content type',11,'view_contenttype'),(45,'Can add session',12,'add_session'),(46,'Can change session',12,'change_session'),(47,'Can delete session',12,'delete_session'),(48,'Can view session',12,'view_session'),(49,'Can add choice',4,'add_choice'),(50,'Can change choice',4,'change_choice'),(51,'Can delete choice',4,'delete_choice'),(52,'Can view choice',4,'view_choice');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$CcsjTKzPIgub$q0yrZxVSOcgK0OnGrZNTVtm5oGyN6FENVRghHR6U/ts=','2019-11-26 10:13:38.305154',0,'17021194','','','17021194@vnu.edu.vn',0,1,'2019-11-17 14:12:19.035385'),(2,'pbkdf2_sha256$150000$0MWBJTVW58Fe$bHBuMWdQXqzlC9FeNMfJw1iNtF7sIaSBcXIM572sHLY=','2019-11-26 10:10:49.391951',1,'admin','','','admin@email.com',1,1,'2019-11-17 14:14:24.774782'),(13,'pbkdf2_sha256$150000$TII3GhdR3l2y$uB82qr9P6+zj1h2qTRyLrXkyKWxGjF6ORroXtpjJ3aI=','2019-11-26 08:19:24.176677',0,'reigenable','','','reigenable@gmail.com',0,1,'2019-11-17 17:07:48.414992');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'admin','logentry'),(9,'auth','group'),(8,'auth','permission'),(10,'auth','user'),(11,'contenttypes','contenttype'),(12,'sessions','session'),(6,'yevrus','answer'),(5,'yevrus','checkboxchoice'),(4,'yevrus','choice'),(3,'yevrus','question'),(2,'yevrus','response'),(1,'yevrus','survey');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-11-17 14:10:01.421093'),(2,'auth','0001_initial','2019-11-17 14:10:01.733257'),(3,'admin','0001_initial','2019-11-17 14:10:02.809409'),(4,'admin','0002_logentry_remove_auto_add','2019-11-17 14:10:03.028791'),(5,'admin','0003_logentry_add_action_flag_choices','2019-11-17 14:10:03.041754'),(6,'contenttypes','0002_remove_content_type_name','2019-11-17 14:10:03.265159'),(7,'auth','0002_alter_permission_name_max_length','2019-11-17 14:10:03.387830'),(8,'auth','0003_alter_user_email_max_length','2019-11-17 14:10:03.429718'),(9,'auth','0004_alter_user_username_opts','2019-11-17 14:10:03.441685'),(10,'auth','0005_alter_user_last_login_null','2019-11-17 14:10:03.532443'),(11,'auth','0006_require_contenttypes_0002','2019-11-17 14:10:03.537429'),(12,'auth','0007_alter_validators_add_error_messages','2019-11-17 14:10:03.548401'),(13,'auth','0008_alter_user_username_max_length','2019-11-17 14:10:03.666085'),(14,'auth','0009_alter_user_last_name_max_length','2019-11-17 14:10:03.778817'),(15,'auth','0010_alter_group_name_max_length','2019-11-17 14:10:03.805740'),(16,'auth','0011_update_proxy_permissions','2019-11-17 14:10:03.816683'),(17,'sessions','0001_initial','2019-11-17 14:10:03.874529'),(18,'yevrus','0001_initial','2019-11-17 14:10:04.255509'),(19,'yevrus','0002_auto_20191117_2124','2019-11-17 14:24:19.329006'),(20,'yevrus','0003_response_submit_date','2019-11-18 15:03:47.500655'),(21,'yevrus','0004_auto_20191118_2305','2019-11-18 16:05:13.929957'),(22,'yevrus','0005_survey_is_done','2019-11-19 08:50:51.419535'),(23,'yevrus','0006_auto_20191119_1607','2019-11-19 09:07:25.612772'),(24,'yevrus','0007_auto_20191119_1608','2019-11-19 09:09:01.001122'),(25,'yevrus','0008_auto_20191124_2219','2019-11-24 15:19:14.390512'),(26,'yevrus','0009_auto_20191125_1522','2019-11-25 08:22:44.767129');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4dh223ftdfdxjo8z2bzol9g675hceaba','ZWU0NGEwNzUxMDQzNDE0ZmU4ODZlZjc2ZjYxYjg0YzU0MDZmYWY2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYjgxNDA0MThjYzZlM2E4YjRmYzEyMTljYWNhMGQ3MDAwYjZiOTU4In0=','2019-12-10 10:13:38.312119'),('4v0pye3kho0akztssnmsnmaz0p1kjht2','NDJhOGE4YzAyNjAyN2NmMTQwZDBmZjhmNTU1MzM5MDRiMWI1NWZkYTp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjlhMjIzZGU4NGUxZGZmNjU1Y2FhNTIwOWRkZTkwYzBjZGYwYjQyNiJ9','2019-12-10 08:19:24.183346'),('vrsx7m5vxzpz7kwuh501wpsegqns894n','ZGUwNjc1NTVjZWI5OTEzMDBhOGY5NzQxYmQ0OTFhZmRmYjFlZTM3Yzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MWI0ODkwYjQ5MzUzMWZiNWFkNzkwMThlOTI4MzliMjgxNjk2ODU4In0=','2019-12-10 08:05:22.585114');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yevrus_answer`
--

DROP TABLE IF EXISTS `yevrus_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yevrus_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_in_response` int(11) NOT NULL,
  `type` varchar(25) NOT NULL,
  `answer` varchar(500) DEFAULT NULL,
  `response_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `yevrus_answer_response_id_e2d8eba1_fk_yevrus_response_id` (`response_id`),
  CONSTRAINT `yevrus_answer_response_id_e2d8eba1_fk_yevrus_response_id` FOREIGN KEY (`response_id`) REFERENCES `yevrus_response` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yevrus_answer`
--

LOCK TABLES `yevrus_answer` WRITE;
/*!40000 ALTER TABLE `yevrus_answer` DISABLE KEYS */;
INSERT INTO `yevrus_answer` VALUES (7,0,'2','[\'0\', \'2\']',3),(8,0,'0','Hoàng Phương Anh',4),(9,1,'1','1',4),(10,2,'2','[\'0\', \'2\']',4),(11,3,'0','Không',4),(12,0,'2','[]',5),(13,0,'1','1',6),(17,0,'0','See you again',8),(22,0,'0','Nguyễn Thanh Quang',10),(23,1,'1','0',10),(24,2,'2','[\'0\']',10),(25,3,'0','Hơi ngắn',10),(26,0,'0','Phan Thị Thu Trang',11),(27,1,'1','1',11),(28,2,'2','[\'0\', \'1\', \'2\']',11),(29,3,'0','.',11),(30,0,'0','Nguyễn Khả Quang Huy',12),(31,1,'1','0',12),(32,2,'2','[\'0\', \'1\', \'2\', \'3\']',12),(33,3,'0','Không',12),(34,0,'0','Tạ Thị Trường An',13),(35,1,'1','1',13),(36,2,'2','[\'0\', \'1\', \'2\', \'3\']',13),(37,3,'0','Không',13),(38,0,'0','Nguyễn Quang Hưng',14),(39,1,'1','2',14),(40,2,'2','[\'0\', \'1\']',14),(41,0,'0','huy',15),(42,1,'1','1',15),(43,2,'1','0',15),(44,3,'0','asd',15);
/*!40000 ALTER TABLE `yevrus_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yevrus_choice`
--

DROP TABLE IF EXISTS `yevrus_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yevrus_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(200) NOT NULL,
  `id_in_question` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `yevrus_multiplechoice_question_id_6e30b1a2_fk_yevrus_question_id` (`question_id`),
  CONSTRAINT `yevrus_multiplechoice_question_id_6e30b1a2_fk_yevrus_question_id` FOREIGN KEY (`question_id`) REFERENCES `yevrus_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yevrus_choice`
--

LOCK TABLES `yevrus_choice` WRITE;
/*!40000 ALTER TABLE `yevrus_choice` DISABLE KEYS */;
INSERT INTO `yevrus_choice` VALUES (1,'Nam',0,2),(2,'Nữ',1,2),(3,'Xử lý ảnh',0,3),(4,'Phát triển ứng dụng web',1,3),(5,'Trí tuệ nhân tạo',2,3),(6,'Xử lý ngôn ngữ tự nhiên',3,3),(7,'An toàn và an ninh mạng',4,3),(8,'Đồ họa máy tính',5,3),(9,'Lý thuyết thông tin',6,3),(10,'Nam',0,5),(11,'Nữ',1,5),(12,'Việt Nam',0,6),(13,'Hàn Quốc',1,6),(14,'Thái Lan',2,6),(15,'Trung Quốc',3,6),(18,'R1',0,18),(19,'R2',1,18),(20,'C1',0,19),(21,'C2',1,19),(22,'C3',2,19),(23,'C4',3,19),(43,'Samsung',0,27),(44,'Apple',1,27),(45,'Xiaomi',2,27),(46,'Oppo',3,27),(47,'Realme',4,27),(48,'Huawei',5,27),(49,'Khác',6,27),(50,'Yes \\n it is.',0,28),(51,'Nope',1,28),(57,'This is \\n first line',0,31),(58,'This is second line',1,31),(59,'How about \\\\n ?',2,31),(76,'Red',0,42),(77,'Blue',1,42),(78,'Yellow',2,42),(79,'Green',3,42),(80,'Yess',0,43),(81,'No',1,43),(128,'Nam',0,68),(129,'Nữ',1,68),(130,'Đỏ',0,69),(131,'Xanh',1,69),(132,'Vàng',2,69),(133,'Lục',3,69),(134,'Lam',4,69),(135,'Chàm',5,69),(136,'Tím',6,69),(137,'Cat',0,71),(138,'Dog',1,71),(139,'Blue',0,72),(140,'Red',1,72),(141,'Yes',0,75),(142,'No',1,75),(143,'Male',0,77),(144,'Female',1,77),(145,'Object',0,78),(146,'ArrayList',1,78),(147,'class',2,78),(148,'Nguyễn',0,81),(149,'Quang',1,81),(150,'Hưng',2,81),(151,'12',0,82),(152,'1999',1,82),(153,'C2',0,84),(154,'C3',1,84),(155,'C3',2,84),(156,'1',0,85),(157,'2',1,85),(158,'3',2,85),(159,'4',3,85),(160,'Nam',0,87),(161,'Nữ',1,87),(162,'Huy',0,88),(163,'Quang',1,88),(164,'Khả',2,88),(165,'Nguyễn',3,88);
/*!40000 ALTER TABLE `yevrus_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yevrus_question`
--

DROP TABLE IF EXISTS `yevrus_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yevrus_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_in_survey` int(11) NOT NULL,
  `type` varchar(25) NOT NULL,
  `title` varchar(500) NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `survey_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `yevrus_question_survey_id_f9640b01_fk_yevrus_survey_id` (`survey_id`),
  CONSTRAINT `yevrus_question_survey_id_f9640b01_fk_yevrus_survey_id` FOREIGN KEY (`survey_id`) REFERENCES `yevrus_survey` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yevrus_question`
--

LOCK TABLES `yevrus_question` WRITE;
/*!40000 ALTER TABLE `yevrus_question` DISABLE KEYS */;
INSERT INTO `yevrus_question` VALUES (1,0,'0','Họ và tên',0,1),(2,1,'1','Giới tính',0,1),(3,2,'2','Bạn đã học những môn nào trong các môn sau:',0,1),(4,0,'0','Họ và tên',0,2),(5,1,'1','Giới tính',0,2),(6,2,'2','Bạn đã từng ăn những món ăn thuộc các quốc gia nào dưới đây?',0,2),(7,3,'0','Bạn có góp ý gì với khảo sát này không?',0,2),(17,0,'0','Question text',0,15),(18,1,'1','Question Radio',0,15),(19,2,'2','Question Multichoice',0,15),(27,0,'2','Bạn đang dùng điện thoại hãng nào',0,19),(28,0,'1','Is there any problem?',0,20),(31,0,'1','Debugging',0,23),(41,0,'0','OK?',0,27),(42,1,'2','Color',0,27),(43,2,'1','Yes/no',0,27),(67,0,'0','Họ và tên',0,36),(68,1,'1','Giới tính',0,36),(69,2,'2','Màu yêu thích',0,36),(70,0,'0','Your name',0,37),(71,1,'1','Cat or dog',0,37),(72,2,'1','Blue or Red',0,37),(73,0,'0','Name',0,38),(74,1,'0','DOB',0,38),(75,2,'1','Do you like python',0,38),(76,0,'0','Name',0,39),(77,1,'1','Gender',0,39),(78,2,'2','Java?',0,39),(79,0,'0','Bye',0,40),(80,0,'0','Họ và tên',0,41),(81,1,'1','Name',0,41),(82,2,'2','DOB',0,41),(83,0,'0','Q1',0,42),(84,1,'1','Q2',0,42),(85,2,'2','Q3',0,42),(86,0,'0','Họ và tên',0,43),(87,1,'1','Giới tính',0,43),(88,2,'1','Test empty line',0,43),(89,3,'0','Q4',0,43);
/*!40000 ALTER TABLE `yevrus_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yevrus_response`
--

DROP TABLE IF EXISTS `yevrus_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yevrus_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `submit_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `yevrus_response_survey_id_abec2105_fk_yevrus_survey_id` (`survey_id`),
  KEY `yevrus_response_user_id_337070ab_fk_auth_user_id` (`user_id`),
  CONSTRAINT `yevrus_response_survey_id_abec2105_fk_yevrus_survey_id` FOREIGN KEY (`survey_id`) REFERENCES `yevrus_survey` (`id`),
  CONSTRAINT `yevrus_response_user_id_337070ab_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yevrus_response`
--

LOCK TABLES `yevrus_response` WRITE;
/*!40000 ALTER TABLE `yevrus_response` DISABLE KEYS */;
INSERT INTO `yevrus_response` VALUES (3,19,1,'2019-11-18 20:58:11.436034'),(4,2,2,'2019-11-18 20:59:08.614503'),(5,19,13,'2019-11-18 21:17:48.937310'),(6,20,NULL,'2019-11-24 16:31:39.719963'),(8,40,2,'2019-11-26 08:05:33.706737'),(10,2,NULL,'2019-11-26 08:16:32.640339'),(11,2,NULL,'2019-11-26 08:16:53.834658'),(12,2,13,'2019-11-26 08:19:42.186528'),(13,2,NULL,'2019-11-26 08:20:39.325312'),(14,41,NULL,'2019-11-26 10:22:59.903718'),(15,43,NULL,'2019-11-26 11:06:30.034494');
/*!40000 ALTER TABLE `yevrus_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yevrus_survey`
--

DROP TABLE IF EXISTS `yevrus_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yevrus_survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_done` tinyint(1) NOT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `publish_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yevrus_survey_user_id_fa764fa1_fk_auth_user_id` (`user_id`),
  CONSTRAINT `yevrus_survey_user_id_fa764fa1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yevrus_survey`
--

LOCK TABLES `yevrus_survey` WRITE;
/*!40000 ALTER TABLE `yevrus_survey` DISABLE KEYS */;
INSERT INTO `yevrus_survey` VALUES (1,'xy2aMEiFVbTcrv2kgCQZ4c','Khảo sát chất lượng giảng dạy',1,2,0,NULL,NULL),(2,'sHhnQkZMkk8Q9xNFgAuAVR','Khảo sát sở thích ăn uống',1,1,0,NULL,NULL),(15,'w72332kyV2AUKummySvzpR','Test edit survey',1,1,1,NULL,NULL),(19,'PbgTP7cLFN8kv7T7kR4JSF','Khảo sát thương hiệu điện thoại',1,2,0,NULL,NULL),(20,'rdfd9UQvAxgRJbgLPjqkaf','Test endline',1,1,0,NULL,NULL),(23,'PSyQk58t2RaBZcjFchsXiG','Test endline debug',1,1,0,NULL,NULL),(27,'VLUY6PAGo4xgNakLEZnDdM','Test new survey creator',1,1,0,NULL,NULL),(36,'LYEciTuiuNKCUx74nopJX3','Thông tin cá nhân',1,2,0,NULL,NULL),(37,'JDGACosodmibVCBcFg9ZQW','Quick test',1,2,0,NULL,NULL),(38,'XmXatyDdDb5oJAKZFu3dui','Python survey',1,2,0,NULL,NULL),(39,'BrSGanuzxDjPw2vKZRbDHn','Javaaaaaaa',1,2,0,NULL,NULL),(40,'teFLwtym43MrfvqwCFn9Z5','Hello',1,1,0,NULL,NULL),(41,'STKqjUBYMSa4swJxN6gQ2h','Nguyễn Quang Hưng',1,1,0,NULL,NULL),(42,'UnVuWyJa8kKYRrFtGsUqh7','Tests',1,1,0,NULL,NULL),(43,'TJoXoXj9uHUAhaqPMUBvad','Khảo sát sở thích du lịch',1,1,0,NULL,NULL);
/*!40000 ALTER TABLE `yevrus_survey` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-09 16:58:15
