-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: stacionar
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add departments',7,'add_departments'),(26,'Can change departments',7,'change_departments'),(27,'Can delete departments',7,'delete_departments'),(28,'Can view departments',7,'view_departments'),(29,'Can add doctors',8,'add_doctors'),(30,'Can change doctors',8,'change_doctors'),(31,'Can delete doctors',8,'delete_doctors'),(32,'Can view doctors',8,'view_doctors'),(33,'Can add patient',9,'add_patient'),(34,'Can change patient',9,'change_patient'),(35,'Can delete patient',9,'delete_patient'),(36,'Can view patient',9,'view_patient'),(37,'Can add diagnoses',10,'add_diagnoses'),(38,'Can change diagnoses',10,'change_diagnoses'),(39,'Can delete diagnoses',10,'delete_diagnoses'),(40,'Can view diagnoses',10,'view_diagnoses'),(41,'Can add diagnoses name',11,'add_diagnosesname'),(42,'Can change diagnoses name',11,'change_diagnosesname'),(43,'Can delete diagnoses name',11,'delete_diagnosesname'),(44,'Can view diagnoses name',11,'view_diagnosesname'),(45,'Can add diagnoses type',12,'add_diagnosestype'),(46,'Can change diagnoses type',12,'change_diagnosestype'),(47,'Can delete diagnoses type',12,'delete_diagnosestype'),(48,'Can view diagnoses type',12,'view_diagnosestype'),(49,'Can add direction',13,'add_direction'),(50,'Can change direction',13,'change_direction'),(51,'Can delete direction',13,'delete_direction'),(52,'Can view direction',13,'view_direction'),(53,'Can add paper',14,'add_paper'),(54,'Can change paper',14,'change_paper'),(55,'Can delete paper',14,'delete_paper'),(56,'Can view paper',14,'view_paper'),(57,'Can add result',15,'add_result'),(58,'Can change result',15,'change_result'),(59,'Can delete result',15,'delete_result'),(60,'Can view result',15,'view_result'),(61,'Can add status',16,'add_status'),(62,'Can change status',16,'change_status'),(63,'Can delete status',16,'delete_status'),(64,'Can view status',16,'view_status'),(65,'Can add type',17,'add_type'),(66,'Can change type',17,'change_type'),(67,'Can delete type',17,'delete_type'),(68,'Can view type',17,'view_type');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (4,'pbkdf2_sha256$390000$AkrCa5OBoMhbyXwumgjCwL$AaTDdIQyesc9umI7PprQ27+B8nTM9aTCCz+O8w1/7Bk=','2023-06-14 13:01:30.843419',0,'user1','','','',0,1,'2023-06-14 12:27:42.501427'),(10,'pbkdf2_sha256$390000$7s9s85ErnYdQJ7GgcxBBzc$ig9A09lsBg2YSJPJ1DvpNOaLUcG8TNTtMGdEtx8MdYQ=','2023-06-17 12:52:46.648694',1,'Administrator','','','admin@stacionar.ua',1,1,'2023-06-16 23:10:56.496950');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'stacionar','departments'),(10,'stacionar','diagnoses'),(11,'stacionar','diagnosesname'),(12,'stacionar','diagnosestype'),(13,'stacionar','direction'),(8,'stacionar','doctors'),(14,'stacionar','paper'),(9,'stacionar','patient'),(15,'stacionar','result'),(16,'stacionar','status'),(17,'stacionar','type');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-03-18 12:40:11.365348'),(2,'auth','0001_initial','2023-03-18 12:40:13.099891'),(3,'admin','0001_initial','2023-03-18 12:40:13.526690'),(4,'admin','0002_logentry_remove_auto_add','2023-03-18 12:40:13.540167'),(5,'admin','0003_logentry_add_action_flag_choices','2023-03-18 12:40:13.552305'),(6,'contenttypes','0002_remove_content_type_name','2023-03-18 12:40:13.824979'),(7,'auth','0002_alter_permission_name_max_length','2023-03-18 12:40:13.988726'),(8,'auth','0003_alter_user_email_max_length','2023-03-18 12:40:14.168558'),(9,'auth','0004_alter_user_username_opts','2023-03-18 12:40:14.185438'),(10,'auth','0005_alter_user_last_login_null','2023-03-18 12:40:14.325797'),(11,'auth','0006_require_contenttypes_0002','2023-03-18 12:40:14.334815'),(12,'auth','0007_alter_validators_add_error_messages','2023-03-18 12:40:14.344788'),(13,'auth','0008_alter_user_username_max_length','2023-03-18 12:40:14.503159'),(14,'auth','0009_alter_user_last_name_max_length','2023-03-18 12:40:14.663731'),(15,'auth','0010_alter_group_name_max_length','2023-03-18 12:40:14.802603'),(16,'auth','0011_update_proxy_permissions','2023-03-18 12:40:14.816939'),(17,'auth','0012_alter_user_first_name_max_length','2023-03-18 12:40:14.980012'),(18,'sessions','0001_initial','2023-03-18 12:40:15.086393'),(19,'stacionar','0001_initial','2023-03-18 12:40:16.753983'),(20,'stacionar','0002_diagnoses_remove_diagnosesname_type_and_more','2023-03-18 12:40:18.369671'),(21,'stacionar','0003_diagnosestype_diagnosesname_alter_patient_diagnosis_and_more','2023-03-18 12:46:40.326347'),(22,'stacionar','0002_alter_departments_options_alter_diagnoses_options_and_more','2023-05-26 23:13:52.286071');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('kgz0wxw1k0x553gu71p9uba7x4rqwpkn','.eJxVjDsOwyAQBe9CHaEF8TEp0-cMaGGX4CTCkrErK3ePLblI2jczbxMR16XGtfMcRxJXoUBcfseE-cXtIPTE9phkntoyj0keijxpl_eJ-H073b-Dir3uNeJQgtXa-aEktg69ISRLhhnBArNHp0BbCDtyRetilM4GCgU0HpX4fAEVFTgq:1qAVQ6:0cU4gwBpxY5pS2RquckaVarSQ38tIcT9I0GP_dAnIvU','2023-07-01 12:52:46.658837');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stacionar_departments`
--

DROP TABLE IF EXISTS `stacionar_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stacionar_departments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `number` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stacionar_departments`
--

LOCK TABLES `stacionar_departments` WRITE;
/*!40000 ALTER TABLE `stacionar_departments` DISABLE KEYS */;
INSERT INTO `stacionar_departments` VALUES (1,'Інфекційне відділення',1),(2,'Інфекційне відділення',2),(3,'Хірургічне відділення',1),(4,'Кардіологічне відділення',1),(5,'Урологічне відділення',1);
/*!40000 ALTER TABLE `stacionar_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stacionar_diagnoses`
--

DROP TABLE IF EXISTS `stacionar_diagnoses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stacionar_diagnoses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stacionar_diagnoses`
--

LOCK TABLES `stacionar_diagnoses` WRITE;
/*!40000 ALTER TABLE `stacionar_diagnoses` DISABLE KEYS */;
INSERT INTO `stacionar_diagnoses` VALUES (1,'Інфекційні хвороби','Інфекційна хвороба №1'),(2,'Інфекційні хвороби','Інфекційна хвороба №2'),(3,'Хірургічні хвороби','Хірургічна хвороба №1'),(4,'Кардіологічні хвороби','Кардіологічна хвороба №1'),(5,'Урологічні хвороби','Урологічна хвороба №1');
/*!40000 ALTER TABLE `stacionar_diagnoses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stacionar_direction`
--

DROP TABLE IF EXISTS `stacionar_direction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stacionar_direction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `direction` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stacionar_direction`
--

LOCK TABLES `stacionar_direction` WRITE;
/*!40000 ALTER TABLE `stacionar_direction` DISABLE KEYS */;
INSERT INTO `stacionar_direction` VALUES (1,'Лікарня'),(2,'Військомат');
/*!40000 ALTER TABLE `stacionar_direction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stacionar_doctors`
--

DROP TABLE IF EXISTS `stacionar_doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stacionar_doctors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `specialization` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stacionar_doctors`
--

LOCK TABLES `stacionar_doctors` WRITE;
/*!40000 ALTER TABLE `stacionar_doctors` DISABLE KEYS */;
INSERT INTO `stacionar_doctors` VALUES (1,'Ім\'я1','Прізвище1','По-батькові1','Інфекціоніст'),(2,'Ім\'я2','Прізвище2','По-батькові2','Інфекціоніст'),(3,'Ім\'я3','Прізвище3','По-батькові3','Хірург'),(4,'Ім\'я4','Прізвище4','По-батькові4','Кардіолог'),(5,'Ім\'я5','Прізвище5','По-батькові5','Уролог');
/*!40000 ALTER TABLE `stacionar_doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stacionar_paper`
--

DROP TABLE IF EXISTS `stacionar_paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stacionar_paper` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `patient_paper` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stacionar_paper`
--

LOCK TABLES `stacionar_paper` WRITE;
/*!40000 ALTER TABLE `stacionar_paper` DISABLE KEYS */;
INSERT INTO `stacionar_paper` VALUES (1,'Відкритий'),(2,'Закритий');
/*!40000 ALTER TABLE `stacionar_paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stacionar_patient`
--

DROP TABLE IF EXISTS `stacionar_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stacionar_patient` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `time_of_beginning` datetime(6) DEFAULT NULL,
  `time_of_ending` datetime(6) DEFAULT NULL,
  `direction_name` varchar(200) DEFAULT NULL,
  `patient_paper_id` bigint NOT NULL,
  `time_create` datetime(6) NOT NULL,
  `time_update` datetime(6) NOT NULL,
  `department_id` bigint NOT NULL,
  `diagnosis_id` bigint NOT NULL,
  `direction_id` bigint DEFAULT NULL,
  `doctor_id` bigint NOT NULL,
  `result_id` bigint DEFAULT NULL,
  `status_id` bigint NOT NULL,
  `type_patient_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stacionar_patient_department_id_f85fb877_fk_stacionar` (`department_id`),
  KEY `stacionar_patient_doctor_id_c85b4b1d_fk_stacionar_doctors_id` (`doctor_id`),
  KEY `stacionar_patient_diagnosis_id_907b0710_fk_stacionar` (`diagnosis_id`),
  KEY `type_patient_id` (`type_patient_id`),
  KEY `stacionar_patient_direction_id_080582eb_fk_stacionar` (`direction_id`),
  KEY `stacionar_patient_patient_paper_id_210981f2_fk_stacionar` (`patient_paper_id`),
  KEY `stacionar_patient_result_id_3bb28bc2_fk_stacionar_result_id` (`result_id`),
  KEY `stacionar_patient_status_id_9250b667_fk_stacionar_status_id` (`status_id`),
  CONSTRAINT `stacionar_patient_department_id_f85fb877_fk_stacionar` FOREIGN KEY (`department_id`) REFERENCES `stacionar_departments` (`id`),
  CONSTRAINT `stacionar_patient_diagnosis_id_907b0710_fk_stacionar` FOREIGN KEY (`diagnosis_id`) REFERENCES `stacionar_diagnoses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stacionar_patient_direction_id_080582eb_fk_stacionar` FOREIGN KEY (`direction_id`) REFERENCES `stacionar_direction` (`id`),
  CONSTRAINT `stacionar_patient_doctor_id_c85b4b1d_fk_stacionar_doctors_id` FOREIGN KEY (`doctor_id`) REFERENCES `stacionar_doctors` (`id`),
  CONSTRAINT `stacionar_patient_ibfk_2` FOREIGN KEY (`type_patient_id`) REFERENCES `stacionar_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stacionar_patient_patient_paper_id_210981f2_fk_stacionar` FOREIGN KEY (`patient_paper_id`) REFERENCES `stacionar_paper` (`id`),
  CONSTRAINT `stacionar_patient_result_id_3bb28bc2_fk_stacionar_result_id` FOREIGN KEY (`result_id`) REFERENCES `stacionar_result` (`id`),
  CONSTRAINT `stacionar_patient_status_id_9250b667_fk_stacionar_status_id` FOREIGN KEY (`status_id`) REFERENCES `stacionar_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stacionar_patient`
--

LOCK TABLES `stacionar_patient` WRITE;
/*!40000 ALTER TABLE `stacionar_patient` DISABLE KEYS */;
INSERT INTO `stacionar_patient` VALUES (1,'Ім\'я1','Прізвище1','По-батькові1','2001-07-12',NULL,NULL,'МВЗ КЛМН№4',1,'2023-03-18 14:59:33.000000','2023-05-25 00:05:00.597586',1,1,1,1,NULL,1,1),(2,'Ім\'я2','Прізвище2','По-батькові2','2017-01-01',NULL,'2023-06-12 19:31:52.145537','МВЗ КЛМН№5',1,'2023-03-18 14:59:33.000000','2023-06-12 19:31:52.146543',2,2,1,2,NULL,1,1),(3,'Ім\'я3','Прізвище3','По-батькові3','1999-01-01',NULL,NULL,'МВЗ КЛМН№2',1,'2023-03-18 14:59:33.000000','2023-03-18 14:59:33.000000',3,3,1,3,NULL,1,1),(4,'Ім\'я4','Прізвище4','По-батьковdі4','1999-01-01',NULL,NULL,'Центральний ТЦК та СП',1,'2023-03-18 14:59:33.000000','2023-06-16 22:20:56.235823',4,4,2,4,NULL,1,1),(5,'Ім\'я5','Прізвище5','По-батькові5','1999-01-01',NULL,'2023-06-12 19:32:52.362991','Центральний ТЦК та СП',1,'2023-03-18 14:59:33.000000','2023-06-12 19:32:52.362991',5,5,2,5,NULL,1,1),(6,'Ім\'я6','Прізвище6','По-батькові6','1999-01-01',NULL,'2023-06-13 11:36:17.882679','Центральний ТЦК та СП',1,'2023-03-18 14:59:33.000000','2023-06-13 11:36:17.882679',1,1,2,1,3,2,1),(7,'Ім\'я7','Прізвище7','По-батькові7','2017-01-02','2023-03-18 15:03:21.000000','2023-03-18 15:03:21.000000',NULL,2,'2023-03-18 15:03:21.000000','2023-05-23 23:56:15.598364',1,1,NULL,1,1,2,2),(8,'Ім\'я8','Прізвище8','По-батькові8','2017-01-01','2023-03-18 15:03:21.000000','2023-03-18 15:03:21.000000',NULL,1,'2023-03-18 15:03:21.000000','2023-03-18 15:03:21.000000',2,2,NULL,2,NULL,1,2),(9,'Ім\'я9','Прізвище9','По-батькові9','1999-01-01','2023-03-18 15:03:21.000000','2023-03-18 15:03:21.000000',NULL,2,'2023-03-18 15:03:21.000000','2023-03-18 15:03:21.000000',3,3,NULL,3,2,2,2),(10,'Ім\'я10','Прізвище10','По-батькові107','2017-01-01','2023-03-18 15:05:47.000000',NULL,NULL,1,'2023-03-18 15:05:47.000000','2023-03-18 15:05:47.000000',4,4,NULL,4,NULL,1,2),(11,'Ім\'я11','Прізвище11','По-батькові11','1987-01-01','2023-03-18 15:05:47.000000','2023-05-31 23:37:33.448946',NULL,2,'2023-03-18 15:05:47.000000','2023-05-31 23:37:33.448946',5,5,NULL,5,1,2,2),(12,'Ім\'я12','Прізвище12','По-батькові112','1960-01-01','2023-03-18 15:05:47.000000','2023-06-12 19:30:25.092561',NULL,2,'2023-03-18 15:05:47.000000','2023-06-12 19:30:25.092561',1,1,NULL,1,1,2,2),(28,'Роберт','Мартін','Сесіл','1952-12-05',NULL,NULL,'Лікарня №1',1,'2023-06-01 14:00:11.403873','2023-06-01 14:00:11.403873',2,1,1,2,NULL,1,1);
/*!40000 ALTER TABLE `stacionar_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stacionar_result`
--

DROP TABLE IF EXISTS `stacionar_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stacionar_result` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `result` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stacionar_result`
--

LOCK TABLES `stacionar_result` WRITE;
/*!40000 ALTER TABLE `stacionar_result` DISABLE KEYS */;
INSERT INTO `stacionar_result` VALUES (1,'Одужання'),(2,'Поліпшення'),(3,'Без змін'),(4,'Погіршення'),(5,'Смерть');
/*!40000 ALTER TABLE `stacionar_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stacionar_status`
--

DROP TABLE IF EXISTS `stacionar_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stacionar_status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stacionar_status`
--

LOCK TABLES `stacionar_status` WRITE;
/*!40000 ALTER TABLE `stacionar_status` DISABLE KEYS */;
INSERT INTO `stacionar_status` VALUES (1,'На лікуванні'),(2,'Виписано');
/*!40000 ALTER TABLE `stacionar_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stacionar_type`
--

DROP TABLE IF EXISTS `stacionar_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stacionar_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type_patient` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stacionar_type`
--

LOCK TABLES `stacionar_type` WRITE;
/*!40000 ALTER TABLE `stacionar_type` DISABLE KEYS */;
INSERT INTO `stacionar_type` VALUES (1,'Плановий'),(2,'Ургентний');
/*!40000 ALTER TABLE `stacionar_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'stacionar'
--

--
-- Dumping routines for database 'stacionar'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-17 16:18:30
