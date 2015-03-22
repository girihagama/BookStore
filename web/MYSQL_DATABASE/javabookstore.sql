-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2015 at 10:58 AM
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
CREATE DATABASE IF NOT EXISTS `javabookstore` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `javabookstore`;

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE IF NOT EXISTS `author` (
  `a_ID` int(10) NOT NULL AUTO_INCREMENT,
  `a_Name` varchar(100) NOT NULL,
  `a_DOB` date DEFAULT NULL,
  `a_Desc` text,
  PRIMARY KEY (`a_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `b_ID` int(10) NOT NULL AUTO_INCREMENT,
  `b_Title` varchar(100) NOT NULL,
  `b_Image` mediumblob NOT NULL,
  `b_Edition` varchar(20) DEFAULT NULL,
  `b_Year` year(4) DEFAULT NULL,
  `a_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`b_ID`),
  UNIQUE KEY `b_Title` (`b_Title`),
  KEY `a_ID` (`a_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `c_ID` int(20) NOT NULL AUTO_INCREMENT,
  `u_Name` varchar(20) NOT NULL,
  `b_ID` int(20) NOT NULL,
  `c_Qty` int(5) NOT NULL,
  PRIMARY KEY (`c_ID`),
  KEY `user` (`u_Name`),
  KEY `book` (`b_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `m_ID` int(10) NOT NULL AUTO_INCREMENT,
  `u_Name` varchar(20) NOT NULL,
  `m_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `m_Content` text NOT NULL,
  `m_ReadState` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`m_ID`),
  KEY `u_Name` (`u_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `n_ID` int(10) NOT NULL,
  `n_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `u_Name` varchar(20) NOT NULL,
  `n_Content` text NOT NULL,
  `n_ReadState` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`n_ID`),
  KEY `u_Name` (`u_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE IF NOT EXISTS `sale` (
  `s_ID` int(10) NOT NULL AUTO_INCREMENT,
  `u_Name` varchar(20) NOT NULL,
  `s_Date` date NOT NULL,
  `b_ID` int(10) NOT NULL,
  `s_Qty` int(8) NOT NULL,
  `s_Amount` int(10) NOT NULL,
  PRIMARY KEY (`s_ID`),
  UNIQUE KEY `b_ID` (`b_ID`),
  KEY `u_Name` (`u_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE IF NOT EXISTS `stock` (
  `st_ID` int(10) NOT NULL AUTO_INCREMENT,
  `b_ID` int(10) NOT NULL,
  `sup_ID` int(10) NOT NULL,
  `st_Date` date NOT NULL,
  `st_Qty` int(8) NOT NULL,
  `st_Price` int(10) NOT NULL,
  PRIMARY KEY (`st_ID`),
  KEY `b_ID` (`b_ID`),
  KEY `sup_ID` (`sup_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `suplier`
--

CREATE TABLE IF NOT EXISTS `suplier` (
  `sup_ID` int(10) NOT NULL AUTO_INCREMENT,
  `sup_Name` varchar(100) NOT NULL,
  `sup_ConNo` char(12) NOT NULL,
  `sup_Mail` text,
  `sup_AddressLine1` varchar(50) NOT NULL,
  `sup_AddressLine2` varchar(50) DEFAULT NULL,
  `sup_AddressLine3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sup_ID`),
  UNIQUE KEY `sup_Name` (`sup_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `u_Name` varchar(20) NOT NULL,
  `u_Pass` varchar(20) NOT NULL,
  `u_Privilege` tinyint(1) NOT NULL,
  `u_RegDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `u_Mail` varchar(200) NOT NULL,
  `u_TPN` varchar(12) DEFAULT NULL,
  `u_addLine1` varchar(50) NOT NULL,
  `u_addLine2` varchar(50) DEFAULT NULL,
  `u_addLine3` varchar(50) DEFAULT NULL,
  `u_CardNo` char(16) DEFAULT NULL,
  `u_image` mediumblob,
  PRIMARY KEY (`u_Name`),
  UNIQUE KEY `u_Mail` (`u_Mail`),
  UNIQUE KEY `u_CardNo` (`u_CardNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE IF NOT EXISTS `wishlist` (
  `b_ID` int(10) NOT NULL,
  `u_Name` varchar(20) NOT NULL,
  UNIQUE KEY `b_ID` (`b_ID`,`u_Name`),
  KEY `wishlistUser` (`u_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_Author` FOREIGN KEY (`a_ID`) REFERENCES `author` (`a_ID`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cartBook` FOREIGN KEY (`b_ID`) REFERENCES `book` (`b_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cartUser` FOREIGN KEY (`u_Name`) REFERENCES `user` (`u_Name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messageUser` FOREIGN KEY (`u_Name`) REFERENCES `user` (`u_Name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `saleBook` FOREIGN KEY (`b_ID`) REFERENCES `book` (`b_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `saleCustomer` FOREIGN KEY (`u_Name`) REFERENCES `user` (`u_Name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stockBook` FOREIGN KEY (`b_ID`) REFERENCES `book` (`b_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stockSupplier` FOREIGN KEY (`sup_ID`) REFERENCES `suplier` (`sup_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlistBook` FOREIGN KEY (`b_ID`) REFERENCES `book` (`b_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wishlistUser` FOREIGN KEY (`u_Name`) REFERENCES `user` (`u_Name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
