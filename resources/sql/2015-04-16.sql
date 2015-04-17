-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: localhost    Database: miamip_adoptaprofessor
-- ------------------------------------------------------
-- Server version	5.5.38

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
-- Table structure for table `apiKey`
--

DROP TABLE IF EXISTS `apiKey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apiKey` (
  `user_id` int(11) NOT NULL,
  `apiKey` varchar(255) NOT NULL,
  `last` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `user_fk_idx` (`user_id`),
  CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apiKey`
--

LOCK TABLES `apiKey` WRITE;
/*!40000 ALTER TABLE `apiKey` DISABLE KEYS */;
INSERT INTO `apiKey` VALUES (38,'NPKyGUYQ8jDPpFMUWn0E32qF7IA4m6I9VtHCnGtv07lpM7kJuknynOeuwOySVh1QKJs8pWDp3ZPP69yBuVaRJomgdV88d9ZXTs6i','2015-04-17 01:51:19'),(38,'oU7p0GGm7VpVSeQtcTQv4b52uK9K2N3rIbQIRx4ZsuUlJKOVEFrIQwKkhU4kI8LqjB8a8daBI4WrOLnsqObglWBDQGXyPIZ8k7jt','2015-04-17 01:55:25');
/*!40000 ALTER TABLE `apiKey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentReports`
--

DROP TABLE IF EXISTS `commentReports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commentReports` (
  `reportId` int(11) NOT NULL AUTO_INCREMENT,
  `commentId` int(11) NOT NULL,
  `reporterId` int(11) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reportId`),
  KEY `reporter_fk_idx` (`reporterId`),
  KEY `comment_fk_idx` (`commentId`),
  CONSTRAINT `reporter_fk` FOREIGN KEY (`reporterId`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `comment_fk` FOREIGN KEY (`commentId`) REFERENCES `comments` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentReports`
--

LOCK TABLES `commentReports` WRITE;
/*!40000 ALTER TABLE `commentReports` DISABLE KEYS */;
/*!40000 ALTER TABLE `commentReports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text,
  `fromUserId` int(11) NOT NULL,
  `toUserId` int(11) NOT NULL,
  `imageurl` text,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `fk_table1_users_idx` (`fromUserId`),
  KEY `fk_table1_users1_idx` (`toUserId`),
  CONSTRAINT `fk_table1_users` FOREIGN KEY (`fromUserId`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_table1_users1` FOREIGN KEY (`toUserId`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pictures` (
  `path` text,
  `user_id` int(11) NOT NULL,
  KEY `fk_pictures_users1_idx` (`user_id`),
  CONSTRAINT `fk_pictures_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(20) NOT NULL,
  `website` varchar(70) DEFAULT NULL,
  `usertype` enum('STUDENT','PROFESSOR','ADMINISTRATOR') NOT NULL DEFAULT 'STUDENT',
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `profileimg` text,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `username_2` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('manny','$2y$10$DzQDzpDDl9qITWec7nLdWusGS472XJhDbQqGYc9N2zT1L73rHzTEG',26,'manny01@manny.com',NULL,'ADMINISTRATOR','Manny','Wilson',0,'resources/img/profile/Masoud_milani.jpg'),('hola','$2y$10$2J.fv22dbz8BzaNgJWx2FuqT1xZf4yyI4vEwphZd3O8GEi8scyaBG',31,'hola@hola.com',NULL,'STUDENT',NULL,NULL,NULL,NULL),('mannyw','$2y$10$ueCOZS7cqdLNVVB3lmGYjeFM8v5YwHab6MRZWFnk5cWraQO0qIeEe',33,'ahsdio@lkn.com',NULL,'STUDENT',NULL,NULL,NULL,NULL),('silvia','$2y$10$95PwQyVItqUHIlhxbiSoWeJ/myXzCs4W3luCqvuE8I6XELlXY5sR2',35,'sil81@gmail.com',NULL,'PROFESSOR','silvia','lobato',0,NULL),('javier','$2y$10$IbQ/MiLSJmAjCCSIhWm4mu/h7ZMnepW/4A68Hws2zqcEG9agjAEb.',38,'javier@javier.com',NULL,'PROFESSOR','javier','jevier',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'miamip_adoptaprofessor'
--

--
-- Dumping routines for database 'miamip_adoptaprofessor'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-16 21:56:31
