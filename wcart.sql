-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2019 at 04:42 AM
-- Server version: 5.6.17-log
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wcart`
--

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE IF NOT EXISTS `orderdetails` (
  `DetailID` int(11) NOT NULL AUTO_INCREMENT,
  `DetailOrderID` int(11) NOT NULL,
  `DetailProductID` int(11) NOT NULL,
  `DetailName` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `DetailPrice` float NOT NULL,
  `DetailSKU` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DetailQuantity` int(11) NOT NULL,
  PRIMARY KEY (`DetailID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=991 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ProductSKU`, `ProductName`, `ProductPrice`, `ProductWeight`, `ProductCartDesc`, `ProductShortDesc`, `ProductLongDesc`, `ProductThumb`, `ProductImage`, `ProductCategoryID`, `ProductUpdateDate`, `ProductStock`, `ProductLive`, `ProductUnlimited`, `ProductLocation`) VALUES
(1, '000-0001', 'Cotton T-Shirt', 9.99, 3, 'Light Cotton T-Shirt', 'A light cotton T-Shirt made with 100% real cotton.', 'A light cotton T-Shirt made with 100% real cotton.\r\n\r\nMade right here in the USA for over 15 years, this t-shirt is lightweight and durable.', '', '', 5, '2019-10-12 00:00:50', 100, 1, 0, NULL),
(2, '000-0004', 'Los Angeles', 179.99, 8, 'Track and Trail', 'A rugged track and trail athletic shoe', 'A rugged track and trail athletic shoe', '', '', 4, '2019-10-12 00:00:08', 10, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `CustomerEmail`, `CustomerPassword`, `CustomerFirstName`, `CustomerLastName`, `CustomerAddress`, `CustomerCity`, `CustomerState`, `CustomerZip`, `CustomerCountry`, `CustomerPhone`, `CustomerEmailVerified`, `CustomerRegistrationDate`, `CustomerVerificationCode`, `CustomerIP`) VALUES
(1, 'customer@wappler.io', 'customerwappler', 'John', 'Schmidt', 'Enschede', 'Overijssel', '7521 PL', 0, '2019-10-11 16:02:05', NULL, NULL, NULL, NULL, 'Netherlands', 'Capitool 50', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
