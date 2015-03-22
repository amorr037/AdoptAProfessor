-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 10, 2015 at 05:46 PM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `adoptaprof`
--

-- --------------------------------------------------------

--
-- Table structure for table `apiKey`
--

CREATE TABLE IF NOT EXISTS `apiKey` (
  `user_id` int(11) NOT NULL,
  `apiKey` varchar(255) NOT NULL,
  `last` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(45) DEFAULT NULL,
  `commentfrom` int(11) NOT NULL,
  `users_user_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_table1_users_idx` (`commentfrom`),
  KEY `fk_table1_users1_idx` (`users_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE IF NOT EXISTS `pictures` (
  `path` text,
  `user_id` int(11) NOT NULL,
  KEY `fk_pictures_users1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(20) NOT NULL,
  `website` varchar(70) DEFAULT NULL,
  `usertype` varchar(1) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `username_2` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `user_id`, `email`, `website`, `usertype`, `firstname`, `lastname`, `title`) VALUES
('manny', '$2y$10$DzQDzpDDl9qITWec7nLdWusGS472XJhDbQqGYc9N2zT1L73rHzTEG', 26, 'manny01@manny.com', NULL, '', NULL, NULL, NULL),
('javier', '$2y$10$Ds0OGUEGsFdB8tp/enG4zO.YjEfRLZq5kIjYZNc4xNmII.fBkqYqy', 29, 'asd@asd.com', NULL, '', NULL, NULL, NULL),
('hola', '$2y$10$2J.fv22dbz8BzaNgJWx2FuqT1xZf4yyI4vEwphZd3O8GEi8scyaBG', 31, 'hola@hola.com', NULL, '', NULL, NULL, NULL),
('mannyw', '$2y$10$ueCOZS7cqdLNVVB3lmGYjeFM8v5YwHab6MRZWFnk5cWraQO0qIeEe', 33, 'ahsdio@lkn.com', NULL, '', NULL, NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_table1_users` FOREIGN KEY (`commentfrom`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table1_users1` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pictures`
--
ALTER TABLE `pictures`
  ADD CONSTRAINT `fk_pictures_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
