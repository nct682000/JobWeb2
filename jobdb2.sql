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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apply`
--

LOCK TABLES `apply` WRITE;
/*!40000 ALTER TABLE `apply` DISABLE KEYS */;
INSERT INTO `apply` VALUES (1,'Apply for Mobile Developer','I want to apply',NULL,NULL,1,2,1),(2,'Apply test','I want to apply for this job',NULL,NULL,1,4,2),(3,'Apply test again','I want to apply for this job','https://res.cloudinary.com/nct682000/image/upload/v1629284158/mkiq51mfvjfzitvdfhxn.pdf',NULL,1,4,2),(4,'testt','I want to apply for this job','https://res.cloudinary.com/nct682000/image/upload/v1629291195/gcooyamxbwvdjwrjziqk.png',NULL,1,2,3),(5,'aaaaaaaa','aaaaaaaaaaaaa',NULL,NULL,1,2,4),(6,'bbbbbbbbbb','bbbbbbbbbbbbbbbbb','https://res.cloudinary.com/nct682000/image/upload/v1629292155/uyusa9atyvwjo5bunrls.png',NULL,1,4,4),(13,'Apply test again','abcdefgh',NULL,NULL,1,21,8),(14,'Test Date Apply','Test Date Apply',NULL,'2021-09-05 00:00:00',1,22,12);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `career`
--

LOCK TABLES `career` WRITE;
/*!40000 ALTER TABLE `career` DISABLE KEYS */;
INSERT INTO `career` VALUES (3,'Bảo vệ'),(2,'CNTT - Phần cứng'),(1,'CNTT - Phần mềm'),(4,'Khác');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'test',NULL,NULL,2,1),(2,'test 2',NULL,NULL,2,1),(3,'comment',NULL,NULL,23,19),(4,'comment 2',NULL,NULL,22,19);
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
INSERT INTO `interaction` VALUES (1,1,'0');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Quận 1',1),(2,'Hoàn Kiếm',2),(3,'',1),(12,'Hoàn Kiếm',2),(13,'123 Nguyễn Văn Công phường 3 quận Gò Vấp',1),(17,'350 Phan Văn Trị, phường 5, quận Gò Vấp',1);
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
INSERT INTO `rate` VALUES (2,1,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitment`
--

LOCK TABLES `recruitment` WRITE;
/*!40000 ALTER TABLE `recruitment` DISABLE KEYS */;
INSERT INTO `recruitment` VALUES (1,'Mobile Developer',1500000,2500000,'0',NULL,'2021-08-06 00:00:00','2021-08-06 00:00:00',1,1,1),(2,'Web Tester',NULL,NULL,'2',NULL,'2021-07-23 00:00:00','2021-07-29 00:00:00',1,1,1),(3,'System Engineer',8000000,NULL,'2',NULL,'2021-08-15 00:00:00','2021-08-15 00:00:00',1,2,1),(4,'Tuyển 10 bảo vệ nhà hàng',NULL,10000000,'2',NULL,'2021-08-15 00:00:00','2021-08-15 00:00:00',1,3,3),(5,'abcde',500,2000,'1','abc',NULL,NULL,1,4,19),(6,'aaaaa',1,5,'0','test2',NULL,NULL,1,4,23),(7,'ZZZZZ',NULL,NULL,'6','test search',NULL,NULL,1,4,19),(8,'Test Rec',NULL,NULL,'4','',NULL,NULL,1,4,23),(11,'2 Trợ giảng GDCD',2000000,3000000,'1','Mô ta: \r\n - Hỗ trợ giảng viên chính trong quá trình dạy học\r\n - Dậy thay giảng viên chính những tiết ngoài dờ...',NULL,NULL,1,4,19),(12,'Test Date',NULL,NULL,'3','test date','2021-09-05 00:00:00','2021-09-05 00:00:00',1,4,23);
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
INSERT INTO `recruitment_benefit` VALUES (1,1),(1,2);
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
INSERT INTO `recruitment_tag` VALUES (1,1),(1,2);
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
  `commenter_id` int NOT NULL,
  `commented_id` int NOT NULL,
  `comment_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reply_user_id1_idx` (`commenter_id`),
  KEY `fk_reply_user_id2_idx` (`commented_id`),
  KEY `fk_reply_comment_id_idx` (`comment_id`),
  CONSTRAINT `fk_reply_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`),
  CONSTRAINT `fk_reply_user_id1` FOREIGN KEY (`commenter_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_reply_user_id2` FOREIGN KEY (`commented_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
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
  `avatar` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `active` tinyint NOT NULL,
  `location_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_user_location_id_idx` (`location_id`),
  CONSTRAINT `fk_user_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'tuong1','$2a$10$FuMjiCvxB77M1lC5.VBeiOvvyDPRH1i2s/8.1wKGNZcQrieCX7t5S',NULL,NULL,'CÔNG TY CỔ PHẦN TẬP ĐOÀN ĐIỆN TỰ ABC','0',NULL,NULL,NULL,'1',1,1),(2,'tuong2','$2a$10$FuMjiCvxB77M1lC5.VBeiOvvyDPRH1i2s/8.1wKGNZcQrieCX7t5S','A','Nguyen',NULL,'0',NULL,NULL,NULL,'2',1,NULL),(3,'tuong3','$2a$10$FuMjiCvxB77M1lC5.VBeiOvvyDPRH1i2s/8.1wKGNZcQrieCX7t5S',NULL,NULL,'CÔNG TY TNHH AN NINH BCD',NULL,NULL,NULL,NULL,'1',1,2),(4,'tuong4','$2a$10$FuMjiCvxB77M1lC5.VBeiOvvyDPRH1i2s/8.1wKGNZcQrieCX7t5S','B','Tran',NULL,'1',NULL,NULL,NULL,'2',1,NULL),(19,'tuong5','$2a$10$K71GI85mgIQwvR8wZOXjPeK6ZGHI6gGMSGipB7BTJggHkRU2b7Z0K',NULL,NULL,'CÔNG TY TNHH MTV GIÁO DỤC CỘNG ĐỒNG',NULL,'abc@def.edu.vn','0123456789','https://res.cloudinary.com/nct682000/image/upload/v1629979484/mirxdocmcyjn75wqsrg6.png','1',1,17),(20,'admin','$2a$10$FuMjiCvxB77M1lC5.VBeiOvvyDPRH1i2s/8.1wKGNZcQrieCX7t5S',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',1,NULL),(21,'tuong6','$2a$10$uQUmmIYchbof.KeW4W1eb.YTeQT6Dfais3uTqLiWNwaRBn56c11US','Tường','Nguyễn',NULL,NULL,'nct682000@gmail.com','0948822116',NULL,'2',1,NULL),(22,'tuong7','$2a$10$pA8a.Yheu21nqpRMLk6SMuR6bNCndqzNwi4auDSpfWdMSg0xLzYs6','C','Phạm',NULL,'2','nct682000@gmail.com','0123456789','https://res.cloudinary.com/nct682000/image/upload/v1629982630/ojpusiy2z5hufwlw4lin.png','2',1,NULL),(23,'tuong8','$2a$10$mDYE6YTar6BRdIsqpYca9OUMy1qySJvAJ92gWlIHTfpE5vzMOgWPy',NULL,NULL,'CÔNG TY TNHH MTV ABC',NULL,'abc@def.edu.vn','0123456789','https://res.cloudinary.com/nct682000/image/upload/v1629984523/q6tacfxuap9saj5gcwfb.png','1',1,13);
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

-- Dump completed on 2021-09-09 11:43:36
