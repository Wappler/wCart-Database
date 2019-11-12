-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 12, 2019 at 01:45 AM
-- Server version: 5.6.17-log
-- PHP Version: 7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wcart`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `CompanyID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CompanyAddress` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CompanyCity` varchar(90) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CompanyState` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CompanyZip` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CompanyCountry` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CompanyEmail` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CompanyPhone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CompanyWebsite` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CompanyLogo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CompanyID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`CompanyID`, `CompanyName`, `CompanyAddress`, `CompanyCity`, `CompanyState`, `CompanyZip`, `CompanyCountry`, `CompanyEmail`, `CompanyPhone`, `CompanyWebsite`, `CompanyLogo`) VALUES
(1, 'Anachronistic Fashion House', 'Deventerstraat 513', 'Apeldoorn', 'Gelderland', '7233 RE', 'Nederland', 'info@anachronistic.com', '+31 (0)555 555555', 'https://anachronistic.com', 'assets/images/Anachronistic_logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerEmail` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CustomerPassword` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CustomerFirstName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CustomerLastName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CustomerAddress` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CustomerCity` varchar(90) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CustomerState` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CustomerZip` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CustomerCountry` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CustomerPhone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CustomerEmailVerified` tinyint(1) DEFAULT '0',
  `CustomerRegistrationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CustomerVerificationCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CustomerIP` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `CustomerEmail`, `CustomerPassword`, `CustomerFirstName`, `CustomerLastName`, `CustomerAddress`, `CustomerCity`, `CustomerState`, `CustomerZip`, `CustomerCountry`, `CustomerPhone`, `CustomerEmailVerified`, `CustomerRegistrationDate`, `CustomerVerificationCode`, `CustomerIP`) VALUES
(1, 'customer@wappler.io', 'customerwappler', 'John', 'Schmidt', 'Capitool 50', 'Enschede', 'Overijssel', '7521 PL', 'Netherlands', NULL, 0, '2019-11-11 04:29:59', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE IF NOT EXISTS `orderdetails` (
  `DetailID` int(11) NOT NULL AUTO_INCREMENT,
  `DetailOrderID` int(11) NOT NULL,
  `DetailProductID` int(11) NOT NULL,
  `DetailName` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `DetailPrice` float NOT NULL,
  `DetailSKU` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DetailQuantity` int(11) NOT NULL,
  PRIMARY KEY (`DetailID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderCustomerID` int(11) NOT NULL,
  `OrderAmount` float NOT NULL,
  `OrderShipName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `OrderShipAddress` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `OrderShipAddress2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `OrderCity` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `OrderState` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `OrderZip` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `OrderCountry` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `OrderPhone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `OrderPostage` float NOT NULL,
  `OrderTax` float NOT NULL,
  `OrderEmail` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `OrderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OrderShipped` tinyint(1) NOT NULL DEFAULT '0',
  `OrderTrackingNumber` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `ProductID` int(12) NOT NULL AUTO_INCREMENT,
  `ProductSKU` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ProductName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ProductPrice` float NOT NULL,
  `ProductWeight` float NOT NULL,
  `ProductCartDesc` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `ProductShortDesc` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `ProductLongDesc` text COLLATE utf8_unicode_ci NOT NULL,
  `ProductThumb` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ProductImage` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ProductCategoryID` int(11) DEFAULT NULL,
  `ProductUpdateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ProductStock` float DEFAULT NULL,
  `ProductLive` tinyint(1) DEFAULT '0',
  `ProductUnlimited` tinyint(1) DEFAULT '1',
  `ProductLocation` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=MyISAM AUTO_INCREMENT=991 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ProductSKU`, `ProductName`, `ProductPrice`, `ProductWeight`, `ProductCartDesc`, `ProductShortDesc`, `ProductLongDesc`, `ProductThumb`, `ProductImage`, `ProductCategoryID`, `ProductUpdateDate`, `ProductStock`, `ProductLive`, `ProductUnlimited`, `ProductLocation`) VALUES
(1, '000-0001', 'Cotton T-Shirt', 9.99, 3, 'Light Cotton T-Shirt', 'A light cotton T-Shirt made with 100% real cotton.', 'A light cotton T-Shirt made with 100% real cotton.\r\n\r\nMade right here in the USA for over 15 years, this t-shirt is lightweight and durable.', 'assets/images/t_shirt.jpg', '', 5, '2019-10-12 00:00:50', 100, 1, 0, NULL),
(2, '000-0004', 'Los Angeles', 179.99, 8, 'Track and Trail', 'A rugged track and trail athletic shoe', 'A rugged track and trail athletic shoe', 'assets/images/shoe.jpg', '', 4, '2019-10-12 00:00:08', 10, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UserPassword` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UserLevel` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
