-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 05, 2015 at 10:43 PM
-- Server version: 5.5.40-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `miamip_adoptaprofessor`
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
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
`user_id` int(11) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `user_id`, `email`) VALUES
('manny', '$2y$10$DzQDzpDDl9qITWec7nLdWusGS472XJhDbQqGYc9N2zT1L73rHzTEG', 26, 'manny01@manny.com'),
('javier', '$2y$10$Ds0OGUEGsFdB8tp/enG4zO.YjEfRLZq5kIjYZNc4xNmII.fBkqYqy', 29, 'asd@asd.com'),
('hola', '$2y$10$2J.fv22dbz8BzaNgJWx2FuqT1xZf4yyI4vEwphZd3O8GEi8scyaBG', 31, 'hola@hola.com'),
('mannyw', '$2y$10$ueCOZS7cqdLNVVB3lmGYjeFM8v5YwHab6MRZWFnk5cWraQO0qIeEe', 33, 'ahsdio@lkn.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `username` (`username`), ADD UNIQUE KEY `username_2` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
