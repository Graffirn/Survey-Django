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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$CcsjTKzPIgub$q0yrZxVSOcgK0OnGrZNTVtm5oGyN6FENVRghHR6U/ts=','2019-11-18 21:19:31.404832',0,'17021194','','','17021194@vnu.edu.vn',0,1,'2019-11-17 14:12:19.035385'),(2,'pbkdf2_sha256$150000$0MWBJTVW58Fe$bHBuMWdQXqzlC9FeNMfJw1iNtF7sIaSBcXIM572sHLY=','2019-11-18 20:58:36.918788',1,'admin','','','admin@email.com',1,1,'2019-11-17 14:14:24.774782'),(13,'pbkdf2_sha256$150000$TII3GhdR3l2y$uB82qr9P6+zj1h2qTRyLrXkyKWxGjF6ORroXtpjJ3aI=','2019-11-18 21:17:44.969292',0,'reigenable','','','reigenable@gmail.com',0,1,'2019-11-17 17:07:48.414992');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-11-17 14:10:01.421093'),(2,'auth','0001_initial','2019-11-17 14:10:01.733257'),(3,'admin','0001_initial','2019-11-17 14:10:02.809409'),(4,'admin','0002_logentry_remove_auto_add','2019-11-17 14:10:03.028791'),(5,'admin','0003_logentry_add_action_flag_choices','2019-11-17 14:10:03.041754'),(6,'contenttypes','0002_remove_content_type_name','2019-11-17 14:10:03.265159'),(7,'auth','0002_alter_permission_name_max_length','2019-11-17 14:10:03.387830'),(8,'auth','0003_alter_user_email_max_length','2019-11-17 14:10:03.429718'),(9,'auth','0004_alter_user_username_opts','2019-11-17 14:10:03.441685'),(10,'auth','0005_alter_user_last_login_null','2019-11-17 14:10:03.532443'),(11,'auth','0006_require_contenttypes_0002','2019-11-17 14:10:03.537429'),(12,'auth','0007_alter_validators_add_error_messages','2019-11-17 14:10:03.548401'),(13,'auth','0008_alter_user_username_max_length','2019-11-17 14:10:03.666085'),(14,'auth','0009_alter_user_last_name_max_length','2019-11-17 14:10:03.778817'),(15,'auth','0010_alter_group_name_max_length','2019-11-17 14:10:03.805740'),(16,'auth','0011_update_proxy_permissions','2019-11-17 14:10:03.816683'),(17,'sessions','0001_initial','2019-11-17 14:10:03.874529'),(18,'yevrus','0001_initial','2019-11-17 14:10:04.255509'),(19,'yevrus','0002_auto_20191117_2124','2019-11-17 14:24:19.329006'),(20,'yevrus','0003_response_submit_date','2019-11-18 15:03:47.500655'),(21,'yevrus','0004_auto_20191118_2305','2019-11-18 16:05:13.929957'),(22,'yevrus','0005_survey_is_done','2019-11-19 08:50:51.419535'),(23,'yevrus','0006_auto_20191119_1607','2019-11-19 09:07:25.612772'),(24,'yevrus','0007_auto_20191119_1608','2019-11-19 09:09:01.001122');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yevrus_answer`
--

LOCK TABLES `yevrus_answer` WRITE;
/*!40000 ALTER TABLE `yevrus_answer` DISABLE KEYS */;
INSERT INTO `yevrus_answer` VALUES (7,0,'2','[\'0\', \'2\']',3),(8,0,'0','Hoàng Phương Anh',4),(9,1,'1','1',4),(10,2,'2','[\'0\', \'2\']',4),(11,3,'0','Không',4),(12,0,'2','[]',5);
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yevrus_choice`
--

LOCK TABLES `yevrus_choice` WRITE;
/*!40000 ALTER TABLE `yevrus_choice` DISABLE KEYS */;
INSERT INTO `yevrus_choice` VALUES (1,'Nam',0,2),(2,'Nữ',1,2),(3,'Xử lý ảnh',0,3),(4,'Phát triển ứng dụng web',1,3),(5,'Trí tuệ nhân tạo',2,3),(6,'Xử lý ngôn ngữ tự nhiên',3,3),(7,'An toàn và an ninh mạng',4,3),(8,'Đồ họa máy tính',5,3),(9,'Lý thuyết thông tin',6,3),(10,'Nam',0,5),(11,'Nữ',1,5),(12,'Việt Nam',0,6),(13,'Hàn Quốc',1,6),(14,'Thái Lan',2,6),(15,'Trung Quốc',3,6),(16,'Nam',0,9),(17,'Nữ',1,9),(18,'R1',0,18),(19,'R2',1,18),(20,'C1',0,19),(21,'C2',1,19),(22,'C3',2,19),(23,'C4',3,19),(43,'Samsung',0,27),(44,'Apple',1,27),(45,'Xiaomi',2,27),(46,'Oppo',3,27),(47,'Realme',4,27),(48,'Huawei',5,27),(49,'Khác',6,27);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yevrus_question`
--

LOCK TABLES `yevrus_question` WRITE;
/*!40000 ALTER TABLE `yevrus_question` DISABLE KEYS */;
INSERT INTO `yevrus_question` VALUES (1,0,'0','Họ và tên',0,1),(2,1,'1','Giới tính',0,1),(3,2,'2','Bạn đã học những môn nào trong các môn sau:',0,1),(4,0,'0','Họ và tên',0,2),(5,1,'1','Giới tính',0,2),(6,2,'2','Bạn đã từng ăn những món ăn thuộc các quốc gia nào dưới đây?',0,2),(7,3,'0','Bạn có góp ý gì với khảo sát này không?',0,2),(8,0,'0','Họ và tên',0,3),(9,1,'1','Giới tính',0,3),(10,2,'0','Kể về một địa điểm bạn đã tới du lịch',0,3),(17,0,'0','Question text',0,15),(18,1,'1','Question Radio',0,15),(19,2,'2','Question Multichoice',0,15),(27,0,'2','Bạn đang dùng điện thoại hãng nào',0,19);
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
  `user_id` int(11) NOT NULL,
  `submit_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `yevrus_response_survey_id_abec2105_fk_yevrus_survey_id` (`survey_id`),
  KEY `yevrus_response_user_id_337070ab_fk_auth_user_id` (`user_id`),
  CONSTRAINT `yevrus_response_survey_id_abec2105_fk_yevrus_survey_id` FOREIGN KEY (`survey_id`) REFERENCES `yevrus_survey` (`id`),
  CONSTRAINT `yevrus_response_user_id_337070ab_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yevrus_response`
--

LOCK TABLES `yevrus_response` WRITE;
/*!40000 ALTER TABLE `yevrus_response` DISABLE KEYS */;
INSERT INTO `yevrus_response` VALUES (3,19,1,'2019-11-18 20:58:11.436034'),(4,2,2,'2019-11-18 20:59:08.614503'),(5,19,13,'2019-11-18 21:17:48.937310');
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
  PRIMARY KEY (`id`),
  KEY `yevrus_survey_user_id_fa764fa1_fk_auth_user_id` (`user_id`),
  CONSTRAINT `yevrus_survey_user_id_fa764fa1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yevrus_survey`
--

LOCK TABLES `yevrus_survey` WRITE;
/*!40000 ALTER TABLE `yevrus_survey` DISABLE KEYS */;
INSERT INTO `yevrus_survey` VALUES (1,'xy2aMEiFVbTcrv2kgCQZ4c','Khảo sát chất lượng giảng dạy',1,2,0),(2,'sHhnQkZMkk8Q9xNFgAuAVR','Khảo sát sở thích ăn uống',1,1,0),(3,'TJoXoXj9uHUAhaqPMUBvad','Khảo sát sở thích du lịch',0,1,0),(15,'w72332kyV2AUKummySvzpR','Test edit survey',1,1,1),(19,'PbgTP7cLFN8kv7T7kR4JSF','Khảo sát thương hiệu điện thoại',1,2,0);
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

-- Dump completed on 2019-11-19 16:46:08
