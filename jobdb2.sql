-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jobdb2
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `apply`
--

DROP TABLE IF EXISTS `apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `cv` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `active` tinyint NOT NULL,
  `candidate_id` int NOT NULL,
  `recruitment_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_apply_user_id_idx` (`candidate_id`),
  KEY `fk_apply_recruitment_id_idx` (`recruitment_id`),
  CONSTRAINT `fk_apply_recruitment_id` FOREIGN KEY (`recruitment_id`) REFERENCES `recruitment` (`id`),
  CONSTRAINT `fk_apply_user_id` FOREIGN KEY (`candidate_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apply`
--

LOCK TABLES `apply` WRITE;
/*!40000 ALTER TABLE `apply` DISABLE KEYS */;
INSERT INTO `apply` VALUES (19,'Ứng tuyển công việc này','Em hiện là sinh viên ngành công nghệ thông tin và có nguyện vọng được thực tập.','https://res.cloudinary.com/nct682000/image/upload/v1633182604/jrsh7qckwbpii0odt8u1.jpg','2020-10-02 00:00:00',1,44,47),(20,'Apply this job','I want to apply for this job','https://res.cloudinary.com/nct682000/image/upload/v1633183768/qq9fdcdxgzzs4dsiaxqe.jpg','2020-11-02 00:00:00',1,51,37),(21,'Apply this job','I want to apply for this job','https://res.cloudinary.com/nct682000/image/upload/v1633183908/slvgspesqpnkkkkufgbj.jpg','2021-01-02 00:00:00',1,52,35),(22,'Apply this job','I want to apply for this job','https://res.cloudinary.com/nct682000/image/upload/v1633184029/jvhzrxyj2vg6e57r0wx9.jpg','2021-02-02 00:00:00',1,53,41),(23,'Apply this job','I want to apply for this job',NULL,'2021-03-02 00:00:00',1,54,42),(24,'Apply this job','I want to apply for this job','https://res.cloudinary.com/nct682000/image/upload/v1633184395/tqnjjfnrvrom4zr5fdcn.jpg','2021-04-02 00:00:00',1,55,43),(25,'Apply this job','I want to apply for this job','https://res.cloudinary.com/nct682000/image/upload/v1633184455/pmvuiv3xrveyqgdndudd.jpg','2021-05-02 00:00:00',1,56,38),(26,'Ứng tuyển công việc này','Tôi muốn đi làm',NULL,'2021-05-02 00:00:00',1,58,36),(27,'Apply this job','I want to apply this job','https://res.cloudinary.com/nct682000/image/upload/v1633265880/qiyadxbetjekpslectsq.pdf','2021-05-03 00:00:00',1,44,44),(28,'Apply this job','test','https://res.cloudinary.com/nct682000/image/upload/v1633267883/thelnnefrxpgcwfvq3ew.pdf','2021-08-03 00:00:00',1,44,47),(29,'Ứng tuyển công việc này','test date','https://res.cloudinary.com/nct682000/image/upload/v1633576959/ttef4liluzjze8ctzenf.jpg','2021-08-07 00:00:00',1,56,40),(30,'Ứng tuyển công việc này','test date time',NULL,'2021-10-07 00:00:00',1,58,41),(31,'Apply this job','test date time','https://res.cloudinary.com/nct682000/image/upload/v1633577379/aypbwutklmlroblcwvp1.jpg','2021-10-07 10:29:42',0,44,41);
/*!40000 ALTER TABLE `apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benefit`
--

DROP TABLE IF EXISTS `benefit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benefit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benefit`
--

LOCK TABLES `benefit` WRITE;
/*!40000 ALTER TABLE `benefit` DISABLE KEYS */;
INSERT INTO `benefit` VALUES (1,'Laptop'),(2,'Đồng phục'),(3,'Thâm niên'),(4,'Nghỉ phép năm'),(5,'Phụ cấp');
/*!40000 ALTER TABLE `benefit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `career`
--

DROP TABLE IF EXISTS `career`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `career` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `career`
--

LOCK TABLES `career` WRITE;
/*!40000 ALTER TABLE `career` DISABLE KEYS */;
INSERT INTO `career` VALUES (7,'Bán hàng'),(3,'Bảo vệ'),(5,'Ca sĩ'),(2,'CNTT - Phần cứng'),(1,'CNTT - Phần mềm'),(15,'Đầu bếp'),(14,'Điều dưỡng'),(13,'Gia sư'),(9,'Giao hàng'),(12,'Giáo viên'),(8,'Kế toán'),(4,'Khác'),(11,'Luật sư'),(6,'Sác tác âm nhạc'),(10,'Xây dựng');
/*!40000 ALTER TABLE `career` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `file` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `commenter_id` int NOT NULL,
  `commented_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_user_id1_idx` (`commenter_id`),
  KEY `fk_comment_user_id2_idx` (`commented_id`),
  CONSTRAINT `fk_comment_user_id1` FOREIGN KEY (`commenter_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_comment_user_id2` FOREIGN KEY (`commented_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (103,'comment',NULL,'2021-10-02 14:32:42',47,45),(104,'Hello',NULL,'2021-10-02 20:59:55',44,49),(105,'Good',NULL,'2021-10-02 21:21:28',56,47),(106,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',NULL,'2021-10-02 21:57:48',58,45),(107,'cmt',NULL,'2021-10-03 20:33:16',44,49),(112,'test',NULL,'2021-10-29 12:18:19',49,49),(113,'testtt',NULL,'2021-10-29 12:24:00',49,49),(114,'testt 5',NULL,'2021-10-29 12:26:35',49,49);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interaction`
--

DROP TABLE IF EXISTS `interaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interaction` (
  `user_id` int NOT NULL,
  `comment_id` int NOT NULL,
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`user_id`,`comment_id`),
  KEY `fk_interaction_comment_id_idx` (`comment_id`),
  CONSTRAINT `fk_interaction_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`),
  CONSTRAINT `fk_interaction_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interaction`
--

LOCK TABLES `interaction` WRITE;
/*!40000 ALTER TABLE `interaction` DISABLE KEYS */;
INSERT INTO `interaction` VALUES (44,103,'0'),(44,104,'0'),(44,105,'1'),(44,106,'1'),(44,107,'1'),(47,107,'1'),(49,104,'0'),(49,107,'0'),(49,114,'0');
/*!40000 ALTER TABLE `interaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `province_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_location_province_id_idx` (`province_id`),
  CONSTRAINT `fk_location_province_id` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (86,'Gò Vấp',1),(87,'Hồ Gươm',2),(88,'Quận 2',1),(89,'Bình Thạnh',1),(90,'Thanh Xuân',2),(91,'Quận 5',1),(92,'Cầu Giấy',2),(93,'Gò Vấp',1),(94,'Hồ Gươm',2),(95,'Tân Phú',1),(96,'Đống Đa',2),(97,'Ba Đình',2),(98,'Tân Bình',1),(99,'Gò Vấp',1),(100,'Gò Vấp',1),(101,'Bắc Từ Liêm',2),(102,'Bắc Từ Liêm',1),(103,'Bắc Từ Liêm',1),(104,'Bắc Từ Liêm',1),(105,'Bắc Từ Liêm',1),(106,'Bắc Từ Liêm',1),(107,'Bắc Từ Liêm',1),(108,'Bắc Từ Liêm',1),(109,'Bắc Từ Liêm',2),(110,'Quận 5',1),(111,'Gò Vấp',1),(112,'Gò Vấp',1),(113,'Gò Vấp',1),(114,'Gò Vấp',1),(115,'Gò Vấp',1),(116,'Gò Vấp',1),(117,'Quận 5',1),(118,'Quận 5',1),(119,'Gò Vấp',1),(120,'Gò Vấp',1),(121,'Gò vấp',1),(122,'Gò Vấp',1);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (2,'Hà Nội'),(1,'Hồ Chí Minh');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rate` (
  `candidate_id` int NOT NULL,
  `recruiter_id` int NOT NULL,
  `point` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`candidate_id`,`recruiter_id`),
  KEY `fk_rate_user_id2_idx` (`recruiter_id`),
  CONSTRAINT `fk_rate_user_id1` FOREIGN KEY (`candidate_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_rate_user_id2` FOREIGN KEY (`recruiter_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate`
--

LOCK TABLES `rate` WRITE;
/*!40000 ALTER TABLE `rate` DISABLE KEYS */;
INSERT INTO `rate` VALUES (44,49,4,'2021-10-21 00:00:00'),(47,49,4,'2021-11-08 00:00:00'),(49,49,5,'2021-11-07 00:00:00'),(49,50,4,'2021-10-10 00:00:00'),(52,49,3,'2021-10-21 00:00:00'),(56,47,5,'2021-10-02 00:00:00'),(58,45,3,'2021-10-02 00:00:00');
/*!40000 ALTER TABLE `rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruitment`
--

DROP TABLE IF EXISTS `recruitment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruitment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `salary_from` decimal(10,0) DEFAULT NULL,
  `salary_to` decimal(10,0) DEFAULT NULL,
  `form` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `active` tinyint NOT NULL,
  `career_id` int NOT NULL,
  `recruiter_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_recruitment_career_id_idx` (`career_id`),
  KEY `fk_recruitment_user_id_idx` (`recruiter_id`),
  CONSTRAINT `fk_recruitment_career_id` FOREIGN KEY (`career_id`) REFERENCES `career` (`id`),
  CONSTRAINT `fk_recruitment_user_id` FOREIGN KEY (`recruiter_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitment`
--

LOCK TABLES `recruitment` WRITE;
/*!40000 ALTER TABLE `recruitment` DISABLE KEYS */;
INSERT INTO `recruitment` VALUES (35,'Tuyển 2 bảo vệ cổng',8000000,10000000,'2','Bảo vệ tại công ra vào, làm việc 24/7','2020-10-02 00:00:00','2020-10-02 00:00:00',1,3,45),(36,'Tuyển 2 bảo vệ sảnh chờ',5000000,6000000,'2','Bảo vệ trong sảnh, làm việc 6 ngày 1 tuần, giờ hành chính','2021-11-02 00:00:00','2021-11-02 00:00:00',1,3,45),(37,'Tuyển 10 gia sư cấp 3 khu vực Thảo Điền',NULL,NULL,'1','Giảng dậy tại nhà giờ giấc linh hoạt','2021-12-02 00:00:00','2021-12-02 00:00:00',1,13,46),(38,'Tuyển 5 thực tập sinh điều dưỡng',2000000,2000000,'0','Hỗ trợ điều dưỡng tại các bệnh viện khu vực Bình Thạnh, Gò Vấp, Phú Nhuận','2021-01-02 00:00:00','2021-01-02 00:00:00',1,14,47),(39,'Tuyển 1 giám đốc sản xuất âm nhạc',NULL,30000000,'6','Phụ trách về các sản phẩm âm nhạc của công ty','2021-02-02 00:00:00','2021-02-02 00:00:00',0,6,48),(40,'Tuyển 2 quản lý dự án phần mềm',2000000,3000000,'4','Quản lý các dự án phần mềm và tiến độ làm việc của các lập trình viên','2021-03-27 00:00:00','2021-03-27 00:00:00',1,1,49),(41,'Tuyển 1 quản lý phần mềm cấp cao',NULL,NULL,'5','Quản lý, tiếp nhận các đơn đặt hàng và kiểm duyệt, điểu chỉnh sản phẩm để giao cho khách hàng','2021-04-02 00:00:00','2021-04-02 00:00:00',0,1,49),(42,'Nhân viên giao Pizza',10000000,NULL,'2','Vận chuyển pizza từ cửa hàng giao cho khách','2021-05-02 00:00:00','2021-05-02 00:00:00',1,9,50),(43,'Ca sĩ phòng trà',10000000,15000000,'2','Hát tại các phòng trà, tuần 3-4 buổi tối','2021-05-02 00:00:00','2021-05-02 00:00:00',0,5,48),(44,'Tuyển 1 nhân viên kĩ thuật',8000000,12000000,'2','Chỉnh sửa, bảo trì máy móc','2021-05-02 00:00:00','2021-05-02 00:00:00',1,2,49),(45,'Kế toán trưởng',15000000,15000000,'3','Quản lý thu ngân, tính toán lợi nhuận, tính lương nhân viên','2021-08-02 00:00:00','2021-08-02 00:00:00',0,8,50),(46,'Chế biến pizza',10000000,NULL,'2','Chế biến các món pizza theo công thức có sẵn của nhà hàng','2021-10-02 00:00:00','2021-10-02 00:00:00',1,15,50),(47,'Tuyển 10 thực tập sinh lập trình',NULL,3500000,'0','Hỗ trợ lập trình các dự án, có thể nghỉ 2 buổi 1 tuần','2021-10-02 00:00:00','2021-10-02 00:00:00',1,1,49);
/*!40000 ALTER TABLE `recruitment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruitment_benefit`
--

DROP TABLE IF EXISTS `recruitment_benefit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruitment_benefit` (
  `recruitment_id` int NOT NULL,
  `benefit_id` int NOT NULL,
  PRIMARY KEY (`recruitment_id`,`benefit_id`),
  KEY `fk_benefit_recruitment_id_idx` (`benefit_id`),
  CONSTRAINT `fk_benefit_recruitment_id` FOREIGN KEY (`benefit_id`) REFERENCES `benefit` (`id`),
  CONSTRAINT `fk_recruitment_benefit_id` FOREIGN KEY (`recruitment_id`) REFERENCES `recruitment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitment_benefit`
--

LOCK TABLES `recruitment_benefit` WRITE;
/*!40000 ALTER TABLE `recruitment_benefit` DISABLE KEYS */;
/*!40000 ALTER TABLE `recruitment_benefit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruitment_tag`
--

DROP TABLE IF EXISTS `recruitment_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruitment_tag` (
  `recruitment_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`recruitment_id`,`tag_id`),
  KEY `fk_tag_recruitment_id_idx` (`tag_id`),
  CONSTRAINT `fk_recruitment_tag_id` FOREIGN KEY (`recruitment_id`) REFERENCES `recruitment` (`id`),
  CONSTRAINT `fk_tag_recruitment_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitment_tag`
--

LOCK TABLES `recruitment_tag` WRITE;
/*!40000 ALTER TABLE `recruitment_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `recruitment_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `file` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `replyer_id` int NOT NULL,
  `comment_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reply_user_id1_idx` (`replyer_id`),
  KEY `fk_reply_comment_id_idx` (`comment_id`),
  CONSTRAINT `fk_reply_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`),
  CONSTRAINT `fk_reply_user_id1` FOREIGN KEY (`replyer_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (1,'reply-test',NULL,'2021-10-20 00:00:00',44,104),(2,'test reply',NULL,'2021-10-27 00:00:00',49,104);
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_UNIQUE` (`content`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (5,'Java'),(1,'Mobile'),(4,'Ngoài trời'),(7,'PHP'),(6,'Python'),(8,'Thời hạn'),(2,'Thực tập'),(3,'Văn phòng');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `password` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `first_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `company_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sex` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `mail` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `introduce` varchar(1000) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `avatar` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `active` tinyint NOT NULL,
  `location_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_user_location_id_idx` (`location_id`),
  CONSTRAINT `fk_user_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (44,'candidate1','$2a$10$g4Z8QuLlxgxFV0HhPWgpuOIFS6hB.Hge2CO9lFlNWWccuEW8cOYfm','Tường','Nguyễn',NULL,'0','candidate1@ou.edu.vn','0123456789',NULL,'https://res.cloudinary.com/nct682000/image/upload/v1633158026/vcsc6rhvps8zgeepqe8r.jpg','2',1,86),(45,'recruiter1','$2a$10$d4OC02IfOK.Lb3DdZFxxc.5nkLhGiM8Qir75007ohstpjKxnhDb0G',NULL,NULL,'CÔNG TY A',NULL,'recruiter1@ou.edu.vn','0987654321',NULL,'https://res.cloudinary.com/nct682000/image/upload/v1633158125/lhchmy7ync6qtub39wxy.jpg','1',1,87),(46,'recruiter2','$2a$10$kjduGEruxhiRDaW2NVmS1uI7ZRerA8BgqagBsPDbk9p5sWqv60KlK',NULL,NULL,'CÔNG TY B',NULL,'recruiter2@ou.edu.vn','0987654321',NULL,'https://res.cloudinary.com/nct682000/image/upload/v1633158176/fvuzloeqehxmrtsbo3jj.jpg','1',1,88),(47,'recruiter3','$2a$10$Y0G5./7tTLd6tg2wo7HlA.PcUBmkJzQkpbkqyyXKCplLHLQw07O5S',NULL,NULL,'CÔNG TY C',NULL,'recruiter3@ou.edu.vn','0987654321',NULL,'https://res.cloudinary.com/nct682000/image/upload/v1633158217/iaubbarlrcqu5sknxowa.jpg','1',1,89),(48,'recruiter4','$2a$10$ItNzIJIWL7spvWQAjyTpZekNByZNqp8L0ISjgpL61JBgTIDdLPV4W',NULL,NULL,'CÔNG TY D',NULL,'recruiter4@ou.edu.vn','0987654321',NULL,'https://res.cloudinary.com/nct682000/image/upload/v1633158262/qbisbgvzd1enew3lrmxm.png','1',1,90),(49,'recruiter5','$2a$10$KPf6dUM2AvCDYkzRYraqeezKfA/dxI2ifDdjo3AcMLAoiu12QP5qC',NULL,NULL,'CÔNG TY E',NULL,'recruiter5@ou.edu.vn','0987654321','Đây là phần giới thiệu','https://res.cloudinary.com/nct682000/image/upload/v1633158315/uw6r7k9f41vfqrae4txo.jpg','1',1,118),(50,'recruiter6','$2a$10$A1whatJLwN2APLwwYvdyneiz3jeJpj.jguBBRcHop6xdX/aRSV5Oa',NULL,NULL,'CÔNG TY F',NULL,'recruiter6@ou.edu.vn','0987654321',NULL,'https://res.cloudinary.com/nct682000/image/upload/v1633158377/hezhmxdunk5xjbo26kkh.jpg','1',1,92),(51,'candidate2','$2a$10$d4OC02IfOK.Lb3DdZFxxc.5nkLhGiM8Qir75007ohstpjKxnhDb0G','Vin','Lê',NULL,'0','candidate2@ou.edu.vn','123456789','Tôi là Vin','https://res.cloudinary.com/nct682000/image/upload/v1633158446/xfxgylipmvxjz3od21go.jpg','2',1,120),(52,'candidate3','$2a$10$KPf6dUM2AvCDYkzRYraqeezKfA/dxI2ifDdjo3AcMLAoiu12QP5qC','Cường','Nguyễn',NULL,'0','candidate3@ou.edu.vn','123456789',NULL,'https://res.cloudinary.com/nct682000/image/upload/v1633158553/zlwjcevgnwvpmixdndul.png','2',1,94),(53,'candidate4','$2a$10$fdzpfV40OA.D0GqAftwpreOPnFIaKxCFIgnBx9hCAMb89v9UiFtaG','Thành','Châu',NULL,'0','candidate4@ou.edu.vn','123456789',NULL,'https://res.cloudinary.com/nct682000/image/upload/v1633158605/wwhcxw9ky8bhyxuyh48s.jpg','2',1,95),(54,'candidate5','$2a$10$V8EEZ/SupcW0cJ4Lo.UKYuVik6wj.ukPyCKUg4VfsUKVCpcn8MjCW','Tựu','Châu',NULL,'0','candidate1@ou.edu.vn','123456789',NULL,'https://res.cloudinary.com/nct682000/image/upload/v1633158710/mlup1kyd8vcvmu1qpfdt.jpg','2',1,96),(55,'candidate6','$2a$10$dn7zgpe34ZFChmTmhixsOehom8FOL5qzxR/ny592PszKXDovzoRGK','Thưởng','Nguyễn',NULL,'0','recruiter6@ou.edu.vn','0987654321',NULL,'https://res.cloudinary.com/nct682000/image/upload/v1633158773/q5b6qf0by3tm72bq2xfs.png','2',1,97),(56,'candidate7','$2a$10$.dGiUZL3sPOTnyIzfffIW.SrL6lcdhnOVPV9vghn.2aM.vRW8V9kO','Tiến','Võ',NULL,'0','candidate7@ou.edu.vn','0123456789',NULL,'https://res.cloudinary.com/nct682000/image/upload/v1633158856/ypusbe4roaygzrrgqu15.png','2',1,98),(57,'admin','$2a$10$.dGiUZL3sPOTnyIzfffIW.SrL6lcdhnOVPV9vghn.2aM.vRW8V9kO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',1,NULL),(58,'candidate8','$2a$10$.dGiUZL3sPOTnyIzfffIW.SrL6lcdhnOVPV9vghn.2aM.vRW8V9kO','Tin','Nguyễn',NULL,'2','candidate8@ou.edu.vn','0123456789','Đây là phần giới thiệu bản thân','https://res.cloudinary.com/nct682000/image/upload/v1633185496/xqwdzcssysxbmfrihyyo.png','2',1,109),(59,'candidate9','$2a$10$YCW3kWMaKJNiVti9u.BdmetnlimfDw2/W0ZKS8PmDS0d7SXPBJquW','Vũ','Bùi',NULL,'0','candidate9@ou.edu.vn','0123456789','',NULL,'2',1,116),(60,'employee1','$2a$10$iDqJhaU851qd6vLHOZmQ8ePlLnQ9gOflNQXYq2RHp53PqD9dxUHn6','Nguyễn','Tường',NULL,'0','nct682000@gmail.com','0123456789',NULL,'https://res.cloudinary.com/nct682000/image/upload/v1636697833/nttebyf6i7iiayvq486b.jpg','3',1,121),(61,'employee2','$2a$10$eHP3Y.QfloQ7RWMq6IiG9ufGTiFAX9bj00/YHwi45P5g2U3U2xN2W','Lê','Vin',NULL,'0','abcde@ou.edu.vn','0123456789',NULL,'https://res.cloudinary.com/nct682000/image/upload/v1636697888/ff10hradyg3k25wlr4ei.jpg','3',1,122);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-12 13:28:14
