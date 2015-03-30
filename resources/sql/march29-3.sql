CREATE DATABASE  IF NOT EXISTS `miamip_adoptaprofessor` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `miamip_adoptaprofessor`;
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
  `last` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apiKey`
--

LOCK TABLES `apiKey` WRITE;
/*!40000 ALTER TABLE `apiKey` DISABLE KEYS */;
INSERT INTO `apiKey` VALUES (29,'zIXP2RHi2M3vjgnfOMgzNzshuP51ex8Of6DiXlA07DwrTTHHFXgtxJL1yQ3NocBDieVgzvgH9N92GQKmN1PlKAnjrq6QCHtUWpbw','2015-03-17 01:27:36'),(35,'3yebgbGaepbvmG0rpY0vJtAmdm7eLDMPb00scHCq7OVtuWUUUVqEo01Cm8R8MDXYEXqRF3hMSdfnaah45HJuIK64SXcFB9Ef756N','2015-03-17 02:01:20'),(35,'k5ZH56G2Pnwn99tsJmW8feOWAr1PCx4XD4EIakL0IhoRrRjaegitu7q5yrVbZZ8C4Nlf76fQoDIPv1ZKiieMqESZ6Na5NiHS537d','2015-03-17 02:03:15'),(35,'eFkwmbkVQhJ5gXIS1zwqfHHE18cheYmsEGZ1SkWICGOSDxLE7h5mZN00VdhacDDRkCScWOVyuKr8icNpuSMtFNtB0KLdoo4I0WVX','2015-03-17 02:08:50'),(29,'mDkEz73s1xbrWayjbqumCJKPY6iCAGPWjaBThElibxK7IirTJVflFZbD5tgGa6DtgemyTIR4fBcXUDQDz6Ze6bScE8SPewivKE3D','2015-03-21 18:38:55'),(29,'3wLuXTtWbTI392VEzx17QuKY6ZY9pNVskGWhzpeLjWOtYJ8yh9F8Dp7Kp5TOTPhdvdv5DJQWGFqFpydGHSPliW5I2ZxWOO9k1FqF','2015-03-21 18:40:04'),(29,'H3lb8qgGO4FeiWhn3tLdpLy1uV8nWGfEKAPT16APaf3sclQgOBten1gRXofU5uyP5oJ6ujWEy07LlY1azupWwFOu43o9yXZElILP','2015-03-21 23:42:13'),(29,'GjsH2QGe5X92SXzHU8ODefACPdiJQDoxXQe0GUeMRnOKlorgwgTLwtnlHF5yjt5gjjg0evM6TBQeZiuvzog5SDrAjw8DZdUjxbjL','2015-03-22 01:06:14'),(29,'jAyCCrzhwhWl72jVDvzdPAno9m1pyFGSgfuSH49dl6zs9ToMoX0eynCHJD7ijNbz3FsLJBY5IyxRrVEQTE4r1G9Lkg4E4fd8UFTE','2015-03-22 01:19:01'),(29,'NC9rsBT9usJSuK9K0yYTiX9BRUFgWS6KvgbXR57myQe3BnNBVMueJEQAyvQvoXgTdsQ5xYr6PF9q3X2ZJxesc43LAUhYRxR5ZIbx','2015-03-22 01:55:29'),(29,'VPI8Px5ptuJbNIV637w7w3YwsfGChAtcpclfJrFdVooI7jObqliXpgtRwauOKY0aampUN57JuvrBPgMfC5d1mGTSQoGBmHLw3bqR','2015-03-22 02:05:43'),(29,'ihPUttYPZDDcXkROjW0yXg0jYfRFpjxHAmC4QAUPdx2bRTZbQ0JNhJ6fZXUpgs7ROJWEkQuyoxJfrJqhJa40UbgT8aipCphr9e6t','2015-03-22 02:13:10'),(29,'lUED4Q8GDu5GrurviwMcwxa9EJ7cQtFcnkQsaZ8OteuVJVr1reeXLp7q8fCZIhc5C2xM2GAvV4rE0SGs7UqTkyjsNWswdECPHaCJ','2015-03-22 02:13:42'),(29,'4A2s8LIzu9QejVfd6v7fFqEiQWKZaQtfqvIzgr8LAYZUUf80KffqGUJwRtv2jYhKu0jLrrw1qwVkL4lvjAWZvFwm81or0GbuGvf7','2015-03-22 02:22:36'),(29,'zUb7uK1cycgDWZqiLUSru7aCbWzIBGnbAyi4jkgSxwvuwVMhQFIkMTXXPxFrd3CNBVRVg8NNEjiaf4s5Jaqw3ouTV9l8dXVPTNK9','2015-03-22 02:36:17'),(29,'inucaaRbYCWeyfG0ZUfpV8BSV3PFCSQUgk7rvYCtBzIaOpaNjqdfyO7uRWatP0o6lwyRual5K4gztqnNRA3poaUg74KX593rFBj9','2015-03-22 02:42:22'),(29,'h2OOMlzyoF9kYLcvXKJD0R5UR14OzISRKHFx2e5qUfLS1YoYI7BJYGDQHIEhqx8beOIh3NIX2uQ4te2cmDVlkyc2gQjHosSDgAVj','2015-03-22 02:43:56'),(29,'dszy6DbAbzPnzI6ckefCp5HLfhLQFTnSlXqsAB2LbS9KAgXVvcyVhgGxxroclL5GJv8j6b5i3f2Ew0A1c8WuoD1W4p9qbe6VJfeQ','2015-03-22 02:44:27'),(29,'pQ6UTqvk4idRTbZmzwj7SzD8X73VLWZbM65FxB0BUetNptaY0u6S4J01R4WD0VON1TtzvtapHDd76n67RcZVV0WM4Sp5OeSQ8lpD','2015-03-22 18:06:55'),(29,'UDdUz2dVn4p1wKPXd9VBF3WlkEoRLbWFO9zncNjARIBotqmGAhifleAGTYxF9ukYDUlQIFqzo2YRtky3CQiX5TEYRbD1FYZjTlaB','2015-03-22 18:07:48'),(29,'rsY0t4ig57ygVkt8yyYoTfjcUNMo6LOxdMyHRRXXYwdUQH2pf0N8g7lbV8z2Toz7a8O2ZMZYidS9UVzaVnjcvEnqNWsGk2NvbCya','2015-03-22 18:19:38'),(29,'Qj6i8d0in9zbyArDhV8BJmvDl67edcE4vKnEYnWlxww57YJoTRZDevgzCnNQzrV5ciJaFGvdd2jk02IUUIx8eNIRawIKXDQaWzkB','2015-03-22 18:48:55'),(26,'VBRpOY7nBZTU8e03xfzxU888K9U2bMj6oavc9DAKDuFLIFPgUoNPxVXi5SkgEEn3OSfYwPI9knU23KjY86NG2KY7DiohXLlMEAKa','2015-03-22 19:20:50'),(26,'qRBTJ3B3FRVSVHejmF7k9nBN5zbTJH39zF2iIDlovhgrZvKlaSGkfh7lQjez0iIzXKSGoe4TvkkuP5P0XvkdNszDLNdM5Wm3GeJ5','2015-03-22 19:35:47'),(26,'vBEyI4Zdx4w5EyzVYr6aJJrtrg7l7fEDQibzmaMUfjZTRzPQ0V0JEsd6JkrRz5uqoGZKRMF66EZYePPeLQYqibw2wYT54ows4vdV','2015-03-22 19:37:03'),(26,'rpCV1VbZTZRqLhUeGmKGkC2sEE5rkBqM02I1YT1RSTiEacSRzCxUfAmTerkz2Km3N44LY6DRZVva7n1H0zBf9X8oosYrdlv0qAMo','2015-03-22 19:37:43'),(29,'XvK1tKxed1EYiGsQ0WWzYLcF9zQBhaFfGph9aOonQ2m8IOZJKVjJGvoQ4frmq7B6xTfHHD4xGrGpfF80AsKhX972pzpPG1VdUbVB','2015-03-22 19:37:59'),(29,'OKmdIwlcLEJl7BIs6lfbOMPR7h8XfFt4pQi7mDj7h3spEbRKx7WmULd13lYi0snpiFxFiRNAUgZzsRj0YfmT1AU4VTnWlKlEqSjI','2015-03-22 19:41:15'),(29,'xSPaLE5U2VMdtuRLZvAMLQgAasiJwvO4nEe8jk3lgPzJkqvjW56HVmi6OBPl6EpuiEDBZGXfwwZQXuaTAgBwDUCsvrNC5d6oSJ0R','2015-03-23 23:02:46'),(29,'pM9Fxqb8terL6OvYm0DasgH56C25mHgLtpr0QD9jRA4XpzVMzzX1PF7Vha1DRipkIQlytuRk5Wivvdh5Me7CUeyboAPfSeAA4V8y','2015-03-23 23:03:04'),(29,'ATsje7SOMAW9Ti44l4Q6GloHl1Q84MRFFjZTqRHcrEllXpqiuhoaCNSYOI7TuYyahx3IoLVQqhcnHDFbU4lxSevHXDAsB8CTGGB5','2015-03-23 23:03:21');
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
  CONSTRAINT `comment_fk` FOREIGN KEY (`commentId`) REFERENCES `comments` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentReports`
--

LOCK TABLES `commentReports` WRITE;
/*!40000 ALTER TABLE `commentReports` DISABLE KEYS */;
INSERT INTO `commentReports` VALUES (9,1,26,'2015-03-30 00:24:36'),(10,1,26,'2015-03-30 00:24:59'),(11,2,26,'2015-03-30 00:25:04'),(12,3,26,'2015-03-30 00:25:06'),(13,1,26,'2015-03-30 00:25:26'),(14,2,26,'2015-03-30 00:25:28'),(15,3,26,'2015-03-30 00:25:32'),(16,6,26,'2015-03-30 01:15:31'),(17,5,26,'2015-03-30 01:15:32'),(18,4,26,'2015-03-30 01:15:34'),(19,3,26,'2015-03-30 01:15:36'),(20,2,26,'2015-03-30 01:15:38');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'Hello Professor',29,26,NULL,'2015-03-30 01:07:50'),(2,'Hi Professor',29,26,'resources/img/portfolio4.jpg','2015-03-30 01:08:05'),(3,NULL,29,26,'resources/img/portfolio3.jpg','2015-03-30 01:08:17'),(4,'Hi Professor',29,26,NULL,'2015-03-30 01:13:55'),(5,'Hi Professor',29,26,NULL,'2015-03-30 01:14:07'),(6,'Hi Professor',29,26,NULL,'2015-03-30 01:14:30');
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
  `usertype` enum('STUDENT','PROFESSOR') NOT NULL DEFAULT 'STUDENT',
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `profileimg` text,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `username_2` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('manny','$2y$10$DzQDzpDDl9qITWec7nLdWusGS472XJhDbQqGYc9N2zT1L73rHzTEG',26,'manny01@manny.com',NULL,'PROFESSOR','Manny','Wilson',NULL,NULL),('javier','$2y$10$Ds0OGUEGsFdB8tp/enG4zO.YjEfRLZq5kIjYZNc4xNmII.fBkqYqy',29,'asd@asd.com',NULL,'STUDENT','Javier','Carmona',NULL,NULL),('hola','$2y$10$2J.fv22dbz8BzaNgJWx2FuqT1xZf4yyI4vEwphZd3O8GEi8scyaBG',31,'hola@hola.com',NULL,'STUDENT',NULL,NULL,NULL,NULL),('mannyw','$2y$10$ueCOZS7cqdLNVVB3lmGYjeFM8v5YwHab6MRZWFnk5cWraQO0qIeEe',33,'ahsdio@lkn.com',NULL,'STUDENT',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2015-03-29 21:29:56
