-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: mern_base
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `acad_cal`
--

DROP TABLE IF EXISTS `acad_cal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acad_cal` (
  `S_No` int NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`S_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acad_cal`
--

LOCK TABLES `acad_cal` WRITE;
/*!40000 ALTER TABLE `acad_cal` DISABLE KEYS */;
INSERT INTO `acad_cal` VALUES (1,'Start of Semester','9th January, 2025'),(2,'Athletic Meet','20th-21st February, 2025'),(3,'Convocation','28th February, 2025 (Tentative)'),(4,'Anand Utsav','6th-7th March, 2025'),(5,'First Mid Semester Examination','17th-21st March, 2025'),(6,'College Foundation Day','8th April, 2025'),(7,'Second Mid Semester Examination','12th-16th May, 2025'),(8,'Preparatory Holidays','17th-22nd May, 2025'),(9,'End Semester Examinations','23rd May, 2025 onwards'),(10,'End Semester Practical Examinations','After End Semester Examinations'),(11,'PhD Six Month Progress Presentation for session Jan-June, 2025','9th-20th June, 2025'),(12,'Summer Vacations','----');
/*!40000 ALTER TABLE `acad_cal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones`
--

DROP TABLE IF EXISTS `milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `milestones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `milestone` varchar(255) NOT NULL,
  `due_date` date NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones`
--

LOCK TABLES `milestones` WRITE;
/*!40000 ALTER TABLE `milestones` DISABLE KEYS */;
INSERT INTO `milestones` VALUES (1,'Project Kickoff','2024-01-15','Kickoff meeting with all stakeholders.'),(2,'Requirement Gathering Complete','2024-01-31','All requirements documented and approved.'),(3,'Design Phase Completion','2024-02-20','Wireframes and mockups finalized.'),(4,'MVP Development Complete','2024-03-30','Minimum viable product ready for testing.'),(5,'User Acceptance Testing','2024-04-15','Testing phase completed with user feedback.'),(6,'Project Go-Live','2024-05-01','Product deployed to production environment.'),(11,'New frontpage','2025-06-30','To Make new wireframe for new front page and mockup');
/*!40000 ALTER TABLE `milestones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(50) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Wireless Mouse',25.99,'Electronics'),(2,'Keyboard',49.99,'Electronics'),(3,'Desk Chair',89.50,'Furniture'),(4,'Notebook',3.99,'Stationery'),(5,'Water Bottle',12.00,'Accessories'),(6,'Smartphone Case',15.75,'Electronics'),(7,'Desk Lamp',35.40,'Furniture'),(8,'Bluetooth Speaker',60.99,'Electronics'),(9,'Coffee Mug',8.25,'Accessories'),(10,'Pen Set',5.50,'Stationery');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `milestone_id` int NOT NULL,
  `task_name` text NOT NULL,
  `status` enum('Pending','In Progress','Completed') DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `assigned_to` varchar(255) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `milestone_id` (`milestone_id`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`milestone_id`) REFERENCES `milestones` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,1,'Schedule a kickoff meeting with all stakeholders.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(2,1,'Prepare a presentation outlining the project goals, timeline, and deliverables.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(3,1,'Share meeting agenda and resources with stakeholders.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(4,1,'Document key points discussed during the kickoff meeting.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(5,2,'Identify stakeholders for requirement gathering.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(6,2,'Schedule interviews or workshops with stakeholders.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(7,2,'Document functional and non-functional requirements.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(8,2,'Get approval for the documented requirements from key stakeholders.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(9,3,'Create wireframes for all screens/pages.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(10,3,'Develop mockups based on approved wireframes.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(11,3,'Present mockups to stakeholders for feedback.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(12,3,'Revise mockups based on feedback and finalize the design.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(13,4,'Set up the project environment (development and staging).','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(14,4,'Develop core features defined for the MVP.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(15,4,'Perform internal testing of the MVP features.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(16,4,'Deploy the MVP to the staging environment for review.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(17,5,'Define UAT test cases and scenarios.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(18,5,'Invite key users to perform UAT.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(19,5,'Document feedback and issues reported during UAT.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(20,5,'Resolve critical issues identified in UAT.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(21,5,'Obtain approval from users for the UAT phase.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(22,6,'Create a deployment checklist for production.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(23,6,'Migrate the application from staging to production.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(24,6,'Perform post-deployment testing.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(25,6,'Provide stakeholders with training and documentation.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(26,6,'Officially announce the go-live to the team and stakeholders.','Pending','2024-12-25 08:04:54','2024-12-25 08:04:54',NULL,NULL),(35,11,'WireFrame','Pending','2025-06-08 07:51:06','2025-06-08 07:51:06','Kirpal',NULL),(36,11,'Mockup','Pending','2025-06-08 07:51:06','2025-06-08 07:51:06','Sunny',NULL);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_logs`
--

DROP TABLE IF EXISTS `user_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_logs`
--

LOCK TABLES `user_logs` WRITE;
/*!40000 ALTER TABLE `user_logs` DISABLE KEYS */;
INSERT INTO `user_logs` VALUES (1,'1','2024-12-06 19:43:19','log','loggedin','{}'),(2,'1','2024-12-09 19:47:19','log','loggedin','{}'),(3,'1','2024-12-09 22:10:21','log','loggedin','{}'),(4,'1','2024-12-10 01:17:43','log','loggedin','{}'),(5,'1','2024-12-10 18:48:20','log','loggedin','{}'),(6,'1','2024-12-10 19:19:46','log','loggedin','{}'),(7,'1','2024-12-23 16:54:57','log','loggedin','{}'),(8,'1','2024-12-23 17:07:17','log','loggedin','{}'),(9,'1','2024-12-23 18:04:47','log','loggedin','{}'),(10,'1','2024-12-23 19:12:32','log','loggedin','{}'),(11,'1','2024-12-23 19:50:45','log','loggedin','{}'),(12,'1','2024-12-23 20:44:48','log','loggedin','{}'),(13,'1','2024-12-24 17:17:38','log','loggedin','{}'),(14,'1','2024-12-24 18:37:08','log','loggedin','{}'),(15,'1','2024-12-24 19:15:41','log','loggedin','{}'),(16,'1','2024-12-24 19:22:42','log','loggedin','{}'),(17,'1','2024-12-24 19:28:24','log','loggedin','{}'),(18,'1','2024-12-24 19:36:35','log','loggedin','{}'),(19,'1','2024-12-25 01:11:10','log','loggedin','{}'),(20,'1','2024-12-25 01:15:02','log','loggedin','{}'),(21,'1','2024-12-25 03:22:51','log','loggedin','{}'),(22,'1','2024-12-25 04:54:39','log','loggedin','{}'),(23,'1','2024-12-25 17:54:50','log','loggedin','{}'),(24,'1','2024-12-25 22:15:02','log','loggedin','{}'),(25,'1','2024-12-25 22:52:28','log','loggedin','{}'),(26,'1','2024-12-26 02:25:36','log','loggedin','{}'),(27,'1','2024-12-26 02:26:01','log','loggedin','{}'),(28,'1','2024-12-26 02:28:04','log','loggedin','{}'),(29,'1','2024-12-26 05:07:35','log','loggedin','{}'),(30,'1','2024-12-26 05:14:15','log','loggedin','{}'),(31,'1','2024-12-26 05:15:55','log','loggedin','{}'),(32,'1','2024-12-26 05:16:16','log','loggedin','{}'),(33,'1','2024-12-26 05:27:50','log','loggedin','{}'),(34,'1','2024-12-26 14:17:43','log','loggedin','{}'),(35,'1','2024-12-26 14:18:02','log','loggedin','{}'),(36,'1','2024-12-26 15:42:51','log','loggedin','{}'),(37,'1','2025-02-06 22:31:30','log','loggedin','{}'),(38,'1','2025-02-08 18:15:06','log','loggedin','{}'),(39,'1','2025-02-08 19:18:10','log','loggedin','{}'),(40,'1','2025-02-12 03:26:13','log','loggedin','{}'),(41,'1','2025-02-12 03:26:46','log','loggedin','{}'),(42,'1','2025-02-24 00:04:52','log','loggedin','{}'),(43,'1','2025-02-24 19:31:24','log','loggedin','{}'),(44,'1','2025-02-25 03:08:09','log','loggedin','{}'),(45,'1','2025-03-05 03:26:58','log','loggedin','{}'),(46,'1','2025-03-31 22:11:29','log','loggedin','{}'),(47,'1','2025-04-04 23:47:55','log','loggedin','{}'),(48,'1','2025-04-05 21:42:18','log','loggedin','{}'),(49,'1','2025-04-07 00:47:50','log','loggedin','{}'),(50,'1','2025-04-07 14:59:32','log','loggedin','{}'),(51,'1','2025-04-07 15:39:00','log','loggedin','{}'),(52,'1','2025-04-07 19:13:35','log','loggedin','{}'),(53,'1','2025-04-07 19:15:44','log','loggedin','{}'),(54,'1','2025-04-07 19:31:46','log','loggedin','{}'),(55,'1','2025-04-19 20:22:05','log','loggedin','{}'),(56,'1','2025-04-19 20:43:24','log','loggedin','{}'),(57,'1','2025-04-24 03:09:31','log','loggedin','{}'),(58,'1','2025-04-24 22:06:42','log','loggedin','{}'),(59,'2','2025-04-24 22:11:26','log','loggedin','{}'),(60,'2','2025-04-24 22:12:03','log','loggedin','{}'),(61,'1','2025-04-24 22:14:23','log','loggedin','{}'),(62,'1','2025-05-24 20:31:53','log','loggedin','{}'),(63,'2','2025-06-08 18:08:39','log','loggedin','{}'),(64,'2','2025-06-08 18:09:00','log','loggedin','{}'),(65,'1','2025-06-08 18:09:45','log','loggedin','{}'),(66,'1','2025-06-09 04:59:48','log','loggedin','{}'),(67,'1','2025-06-09 16:08:30','log','loggedin','{}'),(68,'1','2025-06-09 16:20:10','log','loggedin','{}'),(69,'1','2025-06-10 15:57:19','log','loggedin','{}');
/*!40000 ALTER TABLE `user_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_sessions`
--

DROP TABLE IF EXISTS `user_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `token_id` varchar(100) DEFAULT NULL,
  `token_validity` datetime DEFAULT NULL,
  `device_id` varchar(100) DEFAULT NULL,
  `device_ua` text,
  `device_ip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_sessions`
--

LOCK TABLES `user_sessions` WRITE;
/*!40000 ALTER TABLE `user_sessions` DISABLE KEYS */;
INSERT INTO `user_sessions` VALUES (9,1,'2024-12-05 09:44:41','JwR4qeHNuq3tFw0TvjLmLwjm3pjNGxFU','2024-12-09 09:56:50','W5Jlamn1m0rxhb9zMWX9palassUHK0jR','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:134.0) Gecko/20100101 Firefox/134.0','::ffff:127.0.0.1'),(10,1,'2024-12-09 11:10:20','YfNXOE96VhGECadAZgMu9LrSEXJxiv9w','2025-06-10 05:34:04','MliDFvFwgKsWXGXxvnomNwnXFGUPtLil','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:133.0) Gecko/20100101 Firefox/133.0','::ffff:127.0.0.1'),(11,1,'2024-12-25 11:52:28','n2pRM9UsUseQGBPQe5VzWXlJyrfU5W2g','2024-12-25 12:41:02','PAdByrcQ8um18eIDx2W0wW72BGWYP3tC','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','::1'),(12,1,'2025-04-07 08:31:46','2EFxvMpuGInZseNsXA0vLYk8f7C6FT3y','2025-04-07 09:01:46','ReCjFSu52Tj9HEuhLmPyo9FXDEFyvlAz','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36','::1'),(13,2,'2025-04-24 11:11:26','k4KCqAddb0Z5NB2UiOfv6O4ONdXSCVjn','2025-06-08 14:39:00','MliDFvFwgKsWXGXxvnomNwnXFGUPtLil','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:137.0) Gecko/20100101 Firefox/137.0','::ffff:127.0.0.1');
/*!40000 ALTER TABLE `user_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_types`
--

DROP TABLE IF EXISTS `user_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `per_csl` text,
  `is_admin` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_types`
--

LOCK TABLES `user_types` WRITE;
/*!40000 ALTER TABLE `user_types` DISABLE KEYS */;
INSERT INTO `user_types` VALUES (1,'admin','all:all',1),(2,'staff','entity:method',0);
/*!40000 ALTER TABLE `user_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usertype_id` int DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `pass_hash` varchar(100) DEFAULT NULL,
  `pass_attempts` int DEFAULT NULL,
  `locked_untill` datetime DEFAULT NULL,
  `locked_count` int DEFAULT '0',
  `is_active` int DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `mobile_UNIQUE` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'/uploads/user_img/default.png','Sunny Saini','sunny@devologix.com','9876543210','fQQ9aJTWHaSeZc3rChkwN1FcAShtebVDgAHmJ98Av3Sp2ZZ1DBWtY1YHZKtQZ9zN','e65ab1674f5a496594c9939eaf8fdd4b285cddd1',0,'2024-12-04 17:10:02',0,1),(2,1,'/uploads/user_img/default.png','Sunny','sunnysaini@gmail.com','7986677845','YfaElEcNC9IN0FWQ66UkRx88PHscyvVw','30bb242f6a4e6ad9dd9f928662c62a7f31560f86',2,NULL,0,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-10 10:38:25
