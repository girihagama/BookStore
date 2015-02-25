-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2015 at 06:19 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `javabookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `u_Name` varchar(20) NOT NULL,
  `u_Pass` varchar(20) NOT NULL,
  `u_privilege` tinyint(1) NOT NULL,
  `u_regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `u_TPN` varchar(12) DEFAULT NULL,
  `u_addLine1` varchar(20) DEFAULT NULL,
  `u_addLine2` varchar(40) DEFAULT NULL,
  `u_addLine3` varchar(40) DEFAULT NULL,
  `u_CardNo` char(16) DEFAULT NULL,
  `u_image` mediumblob,
  PRIMARY KEY (`u_Name`),
  UNIQUE KEY `u_CardNo` (`u_CardNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`u_Name`, `u_Pass`, `u_privilege`, `u_regDate`, `u_TPN`, `u_addLine1`, `u_addLine2`, `u_addLine3`, `u_CardNo`, `u_image`) VALUES
('user', 'user', 0, '2015-02-09 13:18:41', '+94012345678', 'addLine1', 'addLine2', 'addLine3', '1234654376543267', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
