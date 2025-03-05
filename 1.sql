-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: myai
-- ------------------------------------------------------
-- Server version	8.0.41

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
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add AI平台',7,'add_aiplatform'),(26,'Can change AI平台',7,'change_aiplatform'),(27,'Can delete AI平台',7,'delete_aiplatform'),(28,'Can view AI平台',7,'view_aiplatform');
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
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$ErhSA7fLmrjOfH2dVzta4x$5EoWPsTxM1iFArfkHuIHJVrzlU2ilEVNcvLeeRzketw=','2025-03-03 15:02:55.493012',1,'ynzys','','','ynzys@163.com',1,1,'2025-03-03 13:54:31.463315');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-03-03 14:28:47.815397','1','豆包',1,'[{\"added\": {}}]',7,1),(2,'2025-03-03 14:50:01.411996','2','Kimi',1,'[{\"added\": {}}]',7,1),(3,'2025-03-03 15:37:12.248937','3','Kimi+',1,'[{\"added\": {}}]',7,1),(4,'2025-03-03 15:37:32.636920','4','硅基流动',1,'[{\"added\": {}}]',7,1),(5,'2025-03-03 15:37:57.069733','5','智谱清言',1,'[{\"added\": {}}]',7,1),(6,'2025-03-03 15:38:36.201970','6','Gemini',1,'[{\"added\": {}}]',7,1),(7,'2025-03-03 15:38:54.948505','7','chatGPT',1,'[{\"added\": {}}]',7,1),(8,'2025-03-03 15:39:16.009678','8','阿里千问海外版',1,'[{\"added\": {}}]',7,1),(9,'2025-03-03 15:39:46.825777','9','https://claude.ai/',1,'[{\"added\": {}}]',7,1),(10,'2025-03-03 15:40:12.093914','10','deepseek',1,'[{\"added\": {}}]',7,1),(11,'2025-03-03 15:40:40.073549','11','腾讯元宝',1,'[{\"added\": {}}]',7,1),(12,'2025-03-03 15:41:02.063576','12','Grok3',1,'[{\"added\": {}}]',7,1),(13,'2025-03-03 15:41:27.677685','9','claude',2,'[{\"changed\": {\"fields\": [\"\\u5e73\\u53f0\\u540d\\u79f0\"]}}]',7,1),(14,'2025-03-03 15:46:08.632365','13','爆款网文生成器',1,'[{\"added\": {}}]',7,1),(15,'2025-03-03 15:46:47.701234','14','Kimi+ PPT',1,'[{\"added\": {}}]',7,1),(16,'2025-03-03 15:50:32.820851','1','豆包',2,'[]',7,1),(17,'2025-03-03 15:56:22.439843','13','爆款网文生成器',2,'[{\"changed\": {\"fields\": [\"\\u987a\\u5e8f\"]}}]',7,1),(18,'2025-03-03 15:56:22.441841','12','Grok3',2,'[{\"changed\": {\"fields\": [\"\\u987a\\u5e8f\"]}}]',7,1),(19,'2025-03-03 15:56:22.442842','11','腾讯元宝',2,'[{\"changed\": {\"fields\": [\"\\u987a\\u5e8f\"]}}]',7,1),(20,'2025-03-03 15:56:22.444840','10','deepseek',2,'[{\"changed\": {\"fields\": [\"\\u987a\\u5e8f\"]}}]',7,1),(21,'2025-03-03 15:56:22.446344','9','claude',2,'[{\"changed\": {\"fields\": [\"\\u987a\\u5e8f\"]}}]',7,1),(22,'2025-03-03 15:56:22.447350','8','阿里千问海外版',2,'[{\"changed\": {\"fields\": [\"\\u987a\\u5e8f\"]}}]',7,1),(23,'2025-03-03 15:56:22.449349','7','chatGPT',2,'[{\"changed\": {\"fields\": [\"\\u987a\\u5e8f\"]}}]',7,1),(24,'2025-03-03 15:56:22.450354','6','Gemini',2,'[{\"changed\": {\"fields\": [\"\\u987a\\u5e8f\"]}}]',7,1),(25,'2025-03-03 15:56:22.451350','5','智谱清言',2,'[{\"changed\": {\"fields\": [\"\\u987a\\u5e8f\"]}}]',7,1),(26,'2025-03-03 15:56:22.453349','4','硅基流动',2,'[{\"changed\": {\"fields\": [\"\\u987a\\u5e8f\"]}}]',7,1),(27,'2025-03-03 15:56:22.454355','3','Kimi+',2,'[{\"changed\": {\"fields\": [\"\\u987a\\u5e8f\"]}}]',7,1),(28,'2025-03-03 15:56:22.456351','2','Kimi',2,'[{\"changed\": {\"fields\": [\"\\u987a\\u5e8f\"]}}]',7,1),(29,'2025-03-03 15:56:22.457348','1','豆包',2,'[{\"changed\": {\"fields\": [\"\\u987a\\u5e8f\"]}}]',7,1);
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
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'portal','aiplatform'),(6,'sessions','session');
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
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-03-03 13:34:37.554974'),(2,'auth','0001_initial','2025-03-03 13:34:37.907868'),(3,'admin','0001_initial','2025-03-03 13:34:37.999313'),(4,'admin','0002_logentry_remove_auto_add','2025-03-03 13:34:38.005617'),(5,'admin','0003_logentry_add_action_flag_choices','2025-03-03 13:34:38.010357'),(6,'contenttypes','0002_remove_content_type_name','2025-03-03 13:34:38.075904'),(7,'auth','0002_alter_permission_name_max_length','2025-03-03 13:34:38.113322'),(8,'auth','0003_alter_user_email_max_length','2025-03-03 13:34:38.129823'),(9,'auth','0004_alter_user_username_opts','2025-03-03 13:34:38.134267'),(10,'auth','0005_alter_user_last_login_null','2025-03-03 13:34:38.167250'),(11,'auth','0006_require_contenttypes_0002','2025-03-03 13:34:38.170668'),(12,'auth','0007_alter_validators_add_error_messages','2025-03-03 13:34:38.176798'),(13,'auth','0008_alter_user_username_max_length','2025-03-03 13:34:38.227755'),(14,'auth','0009_alter_user_last_name_max_length','2025-03-03 13:34:38.265917'),(15,'auth','0010_alter_group_name_max_length','2025-03-03 13:34:38.279844'),(16,'auth','0011_update_proxy_permissions','2025-03-03 13:34:38.285687'),(17,'auth','0012_alter_user_first_name_max_length','2025-03-03 13:34:38.322054'),(18,'sessions','0001_initial','2025-03-03 13:34:38.343640'),(19,'portal','0001_initial','2025-03-03 14:20:22.190365'),(20,'portal','0002_initial','2025-03-03 14:22:37.995466'),(21,'portal','0003_aiplatform_order','2025-03-03 15:47:51.927545'),(22,'portal','0004_alter_aiplatform_options','2025-03-03 15:53:03.603961');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('70pyh690l4peiz3djmy1is32ffoxfdj3','.eJxVjDsOwjAQBe_iGlnY618o6XMGa-1d4wBypDipEHeHSCmgfTPzXiLitta4dV7iROIilDj9bgnzg9sO6I7tNss8t3WZktwVedAux5n4eT3cv4OKvX5rmwr5FKCQ5uBInROUxMAFncYBjFGWMLshO6-DRQ2oGQwFY23xGIp4fwAGIjhr:1tp6lr:cCRWUmmky_ADlvQgPEHTiqpkbX-KsZaPA3HMwL8cuEg','2025-03-17 14:27:51.043154'),('cx2sj1806dvc0vrl12uikippy7az6f2j','.eJxVjDsOwjAQBe_iGlnY618o6XMGa-1d4wBypDipEHeHSCmgfTPzXiLitta4dV7iROIilDj9bgnzg9sO6I7tNss8t3WZktwVedAux5n4eT3cv4OKvX5rmwr5FKCQ5uBInROUxMAFncYBjFGWMLshO6-DRQ2oGQwFY23xGIp4fwAGIjhr:1tp7Jn:CxO4UCSyiDCAjxJAqwJ-TRJJkv7BGnlBAwShjv15HXw','2025-03-17 15:02:55.497017');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_aiplatform`
--

DROP TABLE IF EXISTS `portal_aiplatform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portal_aiplatform` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `visit_count` int unsigned NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `order` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  CONSTRAINT `portal_aiplatform_chk_1` CHECK ((`visit_count` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_aiplatform`
--

LOCK TABLES `portal_aiplatform` WRITE;
/*!40000 ALTER TABLE `portal_aiplatform` DISABLE KEYS */;
INSERT INTO `portal_aiplatform` VALUES (1,'豆包','https://www.doubao.com/chat/','字节跳动的大作，生成图片准确快速，人性化',353,'2025-03-03 14:28:47.814395',13),(2,'Kimi','https://kimi.moonshot.cn/','月之暗面，长文NB',321,'2025-03-03 14:50:01.410999',12),(3,'Kimi+','https://kimi.moonshot.cn/kimiplus','PPT 无处不在，Kimi+为你分忧，帮你制作详尽且有说服力的 PPT 文稿，转达信息，说服听众.',160,'2025-03-03 15:37:12.247939',11),(4,'硅基流动','https://cloud.siliconflow.cn/models','大模型算力和服务提供商，特色：视频生成，以及提供线上微调服务。',0,'2025-03-03 15:37:32.635920',10),(5,'智谱清言','https://chatglm.cn','清华大学背景团队研发大模型，比较早期，成熟。',0,'2025-03-03 15:37:57.067733',9),(6,'Gemini','https://gemini.google.com/','google大模型，2.0堪称神级作品。需要魔法，速度极快。高级版本国内限制使用。',0,'2025-03-03 15:38:36.200967',8),(7,'chatGPT','https://chatgpt.com/','openAI推出，全球第一个商用大模型，需要魔法，免费版本容易断线。收费版本功能强大。',64,'2025-03-03 15:38:54.947505',7),(8,'阿里千问海外版','https://chat.qwenlm.ai/','千问2.5海外版，多模态',0,'2025-03-03 15:39:16.008678',6),(9,'claude','https://claude.ai/','anthropic，Claude 3.7 Sonnet and Claude Code。可惜国内很难访问，锁区。',0,'2025-03-03 15:39:46.824777',5),(10,'deepseek','https://deepseek.com/','深度求索，国内最强大模型',0,'2025-03-03 15:40:12.092899',4),(11,'腾讯元宝','https://yuanbao.tencent.com','腾讯元宝，支持混元模型和满血版deepseek',459,'2025-03-03 15:40:40.072501',3),(12,'Grok3','https://grok.com/','xAI，马斯克的大神级创作，号称世界第一。要魔法上网才可以访问。付费用户全解锁30$/月',0,'2025-03-03 15:41:02.062584',2),(13,'爆款网文生成器','https://kimi.moonshot.cn/kimiplus/conpdjgt7lag4rq67pt0','I am Moyuan, the assistant for popular online novels. Here, you can brainstorm topic ideas with me, analyze and break down popular articles, and start writing online novels from scratch.',0,'2025-03-03 15:46:08.631365',1),(14,'Kimi+ PPT','https://kimi.moonshot.cn/kimiplus/conpg18t7lagbbsfqksg','PPT 无处不在，Kimi+为你分忧，帮你制作详尽且有说服力的 PPT 文稿，转达信息，说服听众.',257,'2025-03-03 15:46:47.701234',0);
/*!40000 ALTER TABLE `portal_aiplatform` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-05 17:34:24
