CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jobeet` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jobeet`;

--
-- Table structure for table `affiliates`
--

DROP TABLE IF EXISTS `affiliates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliates` (
                              `id` int(11) NOT NULL AUTO_INCREMENT,
                              `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `active` tinyint(1) NOT NULL,
                              `created_at` datetime NOT NULL,
                              PRIMARY KEY (`id`),
                              UNIQUE KEY `UNIQ_108C6A8F5F37A13B` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliates`
--

LOCK TABLES `affiliates` WRITE;
/*!40000 ALTER TABLE `affiliates` DISABLE KEYS */;
INSERT INTO `affiliates` VALUES (1,'http://www.sensiolabs.com/','contact@sensiolabs.com','sensio_labs',1,'2022-01-02 15:01:27'),(2,'http://www.knplabs.com/','hello@knplabs.com','knp_labs',1,'2022-01-02 15:01:27'),(3,'https://gabrieldelosrios.dev','gab.delosrios@gmail.com','61624f20e6f35425a3f4',0,'2022-01-02 18:22:07'),(4,'https://gabrieldelosrios.dev','gab.delosrios@gmail.com','25a704ef9c8b1839d737',0,'2022-01-02 18:28:56');
/*!40000 ALTER TABLE `affiliates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliates_categories`
--

DROP TABLE IF EXISTS `affiliates_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliates_categories` (
                                         `affiliate_id` int(11) NOT NULL,
                                         `category_id` int(11) NOT NULL,
                                         PRIMARY KEY (`affiliate_id`,`category_id`),
                                         KEY `IDX_87BE21809F12C49A` (`affiliate_id`),
                                         KEY `IDX_87BE218012469DE2` (`category_id`),
                                         CONSTRAINT `FK_87BE218012469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
                                         CONSTRAINT `FK_87BE21809F12C49A` FOREIGN KEY (`affiliate_id`) REFERENCES `affiliates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliates_categories`
--

LOCK TABLES `affiliates_categories` WRITE;
/*!40000 ALTER TABLE `affiliates_categories` DISABLE KEYS */;
INSERT INTO `affiliates_categories` VALUES (1,11),(2,10),(2,11),(3,10),(3,11),(4,10),(4,11);
/*!40000 ALTER TABLE `affiliates_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
                              `id` int(11) NOT NULL AUTO_INCREMENT,
                              `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (10,'Design','design'),(11,'Programming','programming'),(12,'Manager','manager'),(13,'Administrator','administrator');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_migration_versions` (
                                               `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
                                               `executed_at` datetime DEFAULT NULL,
                                               `execution_time` int(11) DEFAULT NULL,
                                               PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20211227144105','2021-12-29 19:17:51',212);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `category_id` int(11) NOT NULL,
                        `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                        `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                        `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                        `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                        `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                        `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                        `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
                        `how_to_apply` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
                        `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                        `public` tinyint(1) NOT NULL,
                        `activated` tinyint(1) NOT NULL,
                        `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                        `expires_at` datetime NOT NULL,
                        `created_at` datetime NOT NULL,
                        `updated_at` datetime NOT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `UNIQ_A8936DC55F37A13B` (`token`),
                        KEY `IDX_A8936DC512469DE2` (`category_id`),
                        CONSTRAINT `FK_A8936DC512469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (70,11,'full-time','Sensio Labs','sensio-labs.gif','http://www.sensiolabs.com/','Web Developer','Paris, France','You\'ve already developed websites with symfony and you want to work with Open-Source technologies. You have a minimum of 3 years experience in web development with PHP or Java and you wish to participate to development of Web 2.0 sites using the best frameworks available.','Send your resume to fabien.potencier [at] sensio.com','job_sensio_labs',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(71,10,'part-time','Extreme Sensio','extreme-sensio.gif','http://www.extreme-sensio.com/','Web Designer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in.','Send your resume to fabien.potencier [at] sensio.com','job_extreme_sensio',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(72,11,'full-time','Company 100',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_100',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(73,11,'full-time','Company 101',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_101',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(74,11,'full-time','Company 102',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_102',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(75,11,'full-time','Company 103',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_103',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(76,11,'full-time','Company 104',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_104',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(77,11,'full-time','Company 105',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_105',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(78,11,'full-time','Company 106',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_106',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(79,11,'full-time','Company 107',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_107',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(80,11,'full-time','Company 108',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_108',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(81,11,'full-time','Company 109',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_109',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(82,11,'full-time','Company 110',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_110',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(83,11,'full-time','Company 111',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_111',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(84,11,'full-time','Company 112',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_112',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(85,11,'full-time','Company 113',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_113',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(86,11,'full-time','Company 114',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_114',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(87,11,'full-time','Company 115',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_115',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(88,11,'full-time','Company 116',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_116',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(89,11,'full-time','Company 117',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_117',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(90,11,'full-time','Company 118',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_118',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(91,11,'full-time','Company 119',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_119',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(92,11,'full-time','Company 120',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_120',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(93,11,'full-time','Company 121',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_121',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(94,11,'full-time','Company 122',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_122',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(95,11,'full-time','Company 123',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_123',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(96,11,'full-time','Company 124',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_124',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(97,11,'full-time','Company 125',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_125',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(98,11,'full-time','Company 126',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_126',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(99,11,'full-time','Company 127',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_127',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(100,11,'full-time','Company 128',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_128',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(101,11,'full-time','Company 129',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_129',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27'),(102,11,'full-time','Company 130',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_130',1,1,'job@example.com','2022-02-01 15:01:27','2022-01-02 15:01:27','2022-01-02 15:01:27');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'user','user','user@email.org','user@email.org',1,'YlJggLzC4S6S3KOn/Das7qvM5eTYyoLlnPFujb/xGf0','$argon2i$v=19$m=65536,t=4,p=1$TnlkVm1RZVhWM2twQkl5SA$3uu+sFBpDmWTL22ni+U6wDpikPNC8Hv92ZFJ7Z3hBlI',NULL,NULL,NULL,'a:0:{}'),(5,'admin','admin','admin@email.org','admin@email.org',1,'978GtVThj9W4bCz1Yek2X4yxo5v/bNqxnc2lglicY5U','$argon2i$v=19$m=65536,t=4,p=1$MDdkVFdUU2xWVkJpNUN2Ug$klD5wD6WNyiZvliAKvoVqZNgOHx/cUPWCDthzq953OA','2022-01-02 17:58:42',NULL,NULL,'a:1:{i:0;s:10:\"ROLE_ADMIN\";}');
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
