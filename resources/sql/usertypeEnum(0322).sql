-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 22, 2015 at 03:52 PM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.6

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

--
-- Dumping data for table `apiKey`
--

INSERT INTO `apiKey` (`user_id`, `apiKey`, `last`) VALUES
(29, 'zIXP2RHi2M3vjgnfOMgzNzshuP51ex8Of6DiXlA07DwrTTHHFXgtxJL1yQ3NocBDieVgzvgH9N92GQKmN1PlKAnjrq6QCHtUWpbw', '2015-03-17 01:27:36'),
(35, '3yebgbGaepbvmG0rpY0vJtAmdm7eLDMPb00scHCq7OVtuWUUUVqEo01Cm8R8MDXYEXqRF3hMSdfnaah45HJuIK64SXcFB9Ef756N', '2015-03-17 02:01:20'),
(35, 'k5ZH56G2Pnwn99tsJmW8feOWAr1PCx4XD4EIakL0IhoRrRjaegitu7q5yrVbZZ8C4Nlf76fQoDIPv1ZKiieMqESZ6Na5NiHS537d', '2015-03-17 02:03:15'),
(35, 'eFkwmbkVQhJ5gXIS1zwqfHHE18cheYmsEGZ1SkWICGOSDxLE7h5mZN00VdhacDDRkCScWOVyuKr8icNpuSMtFNtB0KLdoo4I0WVX', '2015-03-17 02:08:50'),
(29, 'mDkEz73s1xbrWayjbqumCJKPY6iCAGPWjaBThElibxK7IirTJVflFZbD5tgGa6DtgemyTIR4fBcXUDQDz6Ze6bScE8SPewivKE3D', '2015-03-21 18:38:55'),
(29, '3wLuXTtWbTI392VEzx17QuKY6ZY9pNVskGWhzpeLjWOtYJ8yh9F8Dp7Kp5TOTPhdvdv5DJQWGFqFpydGHSPliW5I2ZxWOO9k1FqF', '2015-03-21 18:40:04'),
(29, 'H3lb8qgGO4FeiWhn3tLdpLy1uV8nWGfEKAPT16APaf3sclQgOBten1gRXofU5uyP5oJ6ujWEy07LlY1azupWwFOu43o9yXZElILP', '2015-03-21 23:42:13'),
(29, 'GjsH2QGe5X92SXzHU8ODefACPdiJQDoxXQe0GUeMRnOKlorgwgTLwtnlHF5yjt5gjjg0evM6TBQeZiuvzog5SDrAjw8DZdUjxbjL', '2015-03-22 01:06:14'),
(29, 'jAyCCrzhwhWl72jVDvzdPAno9m1pyFGSgfuSH49dl6zs9ToMoX0eynCHJD7ijNbz3FsLJBY5IyxRrVEQTE4r1G9Lkg4E4fd8UFTE', '2015-03-22 01:19:01'),
(29, 'NC9rsBT9usJSuK9K0yYTiX9BRUFgWS6KvgbXR57myQe3BnNBVMueJEQAyvQvoXgTdsQ5xYr6PF9q3X2ZJxesc43LAUhYRxR5ZIbx', '2015-03-22 01:55:29'),
(29, 'VPI8Px5ptuJbNIV637w7w3YwsfGChAtcpclfJrFdVooI7jObqliXpgtRwauOKY0aampUN57JuvrBPgMfC5d1mGTSQoGBmHLw3bqR', '2015-03-22 02:05:43'),
(29, 'ihPUttYPZDDcXkROjW0yXg0jYfRFpjxHAmC4QAUPdx2bRTZbQ0JNhJ6fZXUpgs7ROJWEkQuyoxJfrJqhJa40UbgT8aipCphr9e6t', '2015-03-22 02:13:10'),
(29, 'lUED4Q8GDu5GrurviwMcwxa9EJ7cQtFcnkQsaZ8OteuVJVr1reeXLp7q8fCZIhc5C2xM2GAvV4rE0SGs7UqTkyjsNWswdECPHaCJ', '2015-03-22 02:13:42'),
(29, '4A2s8LIzu9QejVfd6v7fFqEiQWKZaQtfqvIzgr8LAYZUUf80KffqGUJwRtv2jYhKu0jLrrw1qwVkL4lvjAWZvFwm81or0GbuGvf7', '2015-03-22 02:22:36'),
(29, 'zUb7uK1cycgDWZqiLUSru7aCbWzIBGnbAyi4jkgSxwvuwVMhQFIkMTXXPxFrd3CNBVRVg8NNEjiaf4s5Jaqw3ouTV9l8dXVPTNK9', '2015-03-22 02:36:17'),
(29, 'inucaaRbYCWeyfG0ZUfpV8BSV3PFCSQUgk7rvYCtBzIaOpaNjqdfyO7uRWatP0o6lwyRual5K4gztqnNRA3poaUg74KX593rFBj9', '2015-03-22 02:42:22'),
(29, 'h2OOMlzyoF9kYLcvXKJD0R5UR14OzISRKHFx2e5qUfLS1YoYI7BJYGDQHIEhqx8beOIh3NIX2uQ4te2cmDVlkyc2gQjHosSDgAVj', '2015-03-22 02:43:56'),
(29, 'dszy6DbAbzPnzI6ckefCp5HLfhLQFTnSlXqsAB2LbS9KAgXVvcyVhgGxxroclL5GJv8j6b5i3f2Ew0A1c8WuoD1W4p9qbe6VJfeQ', '2015-03-22 02:44:27'),
(29, 'pQ6UTqvk4idRTbZmzwj7SzD8X73VLWZbM65FxB0BUetNptaY0u6S4J01R4WD0VON1TtzvtapHDd76n67RcZVV0WM4Sp5OeSQ8lpD', '2015-03-22 18:06:55'),
(29, 'UDdUz2dVn4p1wKPXd9VBF3WlkEoRLbWFO9zncNjARIBotqmGAhifleAGTYxF9ukYDUlQIFqzo2YRtky3CQiX5TEYRbD1FYZjTlaB', '2015-03-22 18:07:48'),
(29, 'rsY0t4ig57ygVkt8yyYoTfjcUNMo6LOxdMyHRRXXYwdUQH2pf0N8g7lbV8z2Toz7a8O2ZMZYidS9UVzaVnjcvEnqNWsGk2NvbCya', '2015-03-22 18:19:38'),
(29, 'Qj6i8d0in9zbyArDhV8BJmvDl67edcE4vKnEYnWlxww57YJoTRZDevgzCnNQzrV5ciJaFGvdd2jk02IUUIx8eNIRawIKXDQaWzkB', '2015-03-22 18:48:55'),
(26, 'VBRpOY7nBZTU8e03xfzxU888K9U2bMj6oavc9DAKDuFLIFPgUoNPxVXi5SkgEEn3OSfYwPI9knU23KjY86NG2KY7DiohXLlMEAKa', '2015-03-22 19:20:50'),
(26, 'qRBTJ3B3FRVSVHejmF7k9nBN5zbTJH39zF2iIDlovhgrZvKlaSGkfh7lQjez0iIzXKSGoe4TvkkuP5P0XvkdNszDLNdM5Wm3GeJ5', '2015-03-22 19:35:47'),
(26, 'vBEyI4Zdx4w5EyzVYr6aJJrtrg7l7fEDQibzmaMUfjZTRzPQ0V0JEsd6JkrRz5uqoGZKRMF66EZYePPeLQYqibw2wYT54ows4vdV', '2015-03-22 19:37:03'),
(26, 'rpCV1VbZTZRqLhUeGmKGkC2sEE5rkBqM02I1YT1RSTiEacSRzCxUfAmTerkz2Km3N44LY6DRZVva7n1H0zBf9X8oosYrdlv0qAMo', '2015-03-22 19:37:43'),
(29, 'XvK1tKxed1EYiGsQ0WWzYLcF9zQBhaFfGph9aOonQ2m8IOZJKVjJGvoQ4frmq7B6xTfHHD4xGrGpfF80AsKhX972pzpPG1VdUbVB', '2015-03-22 19:37:59'),
(29, 'OKmdIwlcLEJl7BIs6lfbOMPR7h8XfFt4pQi7mDj7h3spEbRKx7WmULd13lYi0snpiFxFiRNAUgZzsRj0YfmT1AU4VTnWlKlEqSjI', '2015-03-22 19:41:15');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
`comment_id` int(11) NOT NULL,
  `text` varchar(45) DEFAULT NULL,
  `commentfrom` int(11) NOT NULL,
  `users_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE IF NOT EXISTS `pictures` (
  `path` text,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
`user_id` int(11) NOT NULL,
  `email` varchar(20) NOT NULL,
  `website` varchar(70) DEFAULT NULL,
  `usertype` enum('STUDENT','PROFESSOR') NOT NULL DEFAULT 'STUDENT',
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `user_id`, `email`, `website`, `usertype`, `firstname`, `lastname`, `title`) VALUES
('manny', '$2y$10$DzQDzpDDl9qITWec7nLdWusGS472XJhDbQqGYc9N2zT1L73rHzTEG', 26, 'manny01@manny.com', NULL, 'PROFESSOR', 'Manny', 'Wilson', NULL),
('javier', '$2y$10$Ds0OGUEGsFdB8tp/enG4zO.YjEfRLZq5kIjYZNc4xNmII.fBkqYqy', 29, 'asd@asd.com', NULL, 'STUDENT', 'Javier', 'Carmona', NULL),
('hola', '$2y$10$2J.fv22dbz8BzaNgJWx2FuqT1xZf4yyI4vEwphZd3O8GEi8scyaBG', 31, 'hola@hola.com', NULL, 'STUDENT', NULL, NULL, NULL),
('mannyw', '$2y$10$ueCOZS7cqdLNVVB3lmGYjeFM8v5YwHab6MRZWFnk5cWraQO0qIeEe', 33, 'ahsdio@lkn.com', NULL, 'STUDENT', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`comment_id`), ADD KEY `fk_table1_users_idx` (`commentfrom`), ADD KEY `fk_table1_users1_idx` (`users_user_id`);

--
-- Indexes for table `pictures`
--
ALTER TABLE `pictures`
 ADD KEY `fk_pictures_users1_idx` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `username` (`username`), ADD UNIQUE KEY `username_2` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
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
