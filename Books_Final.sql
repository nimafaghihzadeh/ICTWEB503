-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Jun 17, 2021 at 01:20 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dlib`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `AuthorID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
  `LastName` text CHARACTER SET utf8 COLLATE utf8_persian_ci,
  `BirthDate` date DEFAULT NULL,
  `Image` varchar(200) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`AuthorID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`AuthorID`, `FirstName`, `LastName`, `BirthDate`, `Image`) VALUES
(1, 'Other', NULL, NULL, NULL),
(8, 'Nima', 'joooojooo', '2009-05-21', 'images/authors/rsa1.jpg'),
(9, 'Nima', 'joooojooo', '2009-05-21', ''),
(10, 'Nima', 'gkkmkl', '2009-05-21', ''),
(11, 'Nima', 'Faghihzadeh', '2021-06-10', ''),
(12, 'Amir', 'Amiri', '2021-06-10', ''),
(13, 'Nima', 'Nabavi', '2021-06-03', 'images/authors/and2.png');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `BookID` int(11) NOT NULL AUTO_INCREMENT,
  `BookName` varchar(255) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
  `BookTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
  `CreatedDate` date DEFAULT NULL,
  `LastUpdatedDate` date DEFAULT NULL,
  `CopiesSold` varchar(255) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
  `PublishedYear` int(11) DEFAULT NULL,
  `AuthorID` int(255) DEFAULT NULL,
  `ImagePath` varchar(255) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`BookID`),
  KEY `author` (`AuthorID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`BookID`, `BookName`, `BookTitle`, `CreatedDate`, `LastUpdatedDate`, `CopiesSold`, `PublishedYear`, `AuthorID`, `ImagePath`) VALUES
(4, 'unity', 'PHP:Home Page', '2021-06-10', '2021-06-10', '1', 2020, 0, 'images/authors/unity.jpg'),
(5, 'BootStrap', 'BootStrap', '2021-06-10', '2021-06-10', '1', 0, 9, 'images/authors/bs2.png'),
(6, 'Csharp', 'Csharp', '2021-06-10', '2021-06-10', '1', 0, 12, 'images/authors/cs3.png'),
(7, 'C Sharp', 'C Sharp Programming', '2021-06-10', '2021-06-10', '112', 2021, 12, 'images/books/cs4.png');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `TrackingID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(255) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `BookID` int(11) NOT NULL,
  `DateUpdated` date NOT NULL,
  PRIMARY KEY (`TrackingID`),
  KEY `FK-Username` (`Username`),
  KEY `FK-BookID` (`BookID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`TrackingID`, `Username`, `BookID`, `DateUpdated`) VALUES
(1, 'admin', 4, '2021-06-10'),
(2, 'admin', 4, '2021-06-10'),
(3, 'admin', 4, '2021-06-10'),
(4, 'admin', 5, '2021-06-10');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE IF NOT EXISTS `registration` (
  `Username` varchar(255) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `FirstName` varchar(255) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `LastName` varchar(255) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `Password` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `Role` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `Image` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`Username`, `FirstName`, `LastName`, `Password`, `Role`, `Image`) VALUES
('admin', 'mahdi', 'mahdi', '$2y$10$NwrxMTn790Ch8kbSD6.WiuGmp7BtNDBqX.UiirouOpldB2Zt9a57O', 'Admin', 'images/authors/and3.png'),
('user1', 'Amir', 'Amiri', '$2y$10$t6vr3RoAktoZPb1eZ3Y8t.ZeDXrZpwgCP/HlYyDIG7spAsnLt7Nca', 'User', 'images/authors/150x150-speed.png');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
