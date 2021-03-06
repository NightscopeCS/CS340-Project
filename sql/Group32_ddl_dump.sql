-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 05, 2020 at 12:42 PM
-- Server version: 10.4.13-MariaDB-log
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs340_ishihark`
--

-- --------------------------------------------------------

--
-- Table structure for table `Beans`
--

DROP TABLE IF EXISTS `Beans`;
CREATE TABLE `Beans` (
  `beanID` int(20) NOT NULL,
  `beanName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `Beans`:
--

--
-- Dumping data for table `Beans`
--

INSERT INTO `Beans` (`beanID`, `beanName`) VALUES
(1, 'Liberica'),
(2, 'Robusta'),
(3, 'Arabica'),
(4, 'Columbia'),
(5, 'Arabica Peaberry'),
(6, 'Brazillian Peaberry'),
(7, 'Etiopian Arabica');

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
CREATE TABLE `Customers` (
  `customerID` int(20) NOT NULL,
  `customerName` varchar(255) NOT NULL,
  `customerStreet` varchar(255) NOT NULL,
  `customerCity` varchar(255) NOT NULL,
  `customerState` varchar(255) NOT NULL,
  `customerPostalCode` varchar(255) NOT NULL,
  `customerCountry` varchar(255) NOT NULL,
  `customerPhone` varchar(255) NOT NULL,
  `customerEmail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `Customers`:
--

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`customerID`, `customerName`, `customerStreet`, `customerCity`, `customerState`, `customerPostalCode`, `customerCountry`, `customerPhone`, `customerEmail`) VALUES
(1, 'Georgia J.', '45 West State', 'Chicago', 'IL', '60611', 'USA', '312-777-9999', 'GJ@georgia.com'),
(2, 'SightGlee Coffee', '212 7th Howard St.', 'San Francisco', 'CA', '94108', 'USA', '415-888-8888', 'SC@sightglee.com'),
(3, 'Bird Coffee', '5 E 100th', 'New York', 'NY', '10012', 'USA', '212-111-2222', 'BC@birdcoffee.com'),
(5, 'Cafe Du Mond', '845 Decatur St.', 'New Orleans', 'LA', '70112', 'USA', '318-333-1111', 'CDM@cafedumond.com'),
(8, 'Cafe Rose Montana', '958 NW Highway', 'Darby', 'MT', '59829', 'USA', '406-185-8855', 'CRN@caferosemontana');

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
CREATE TABLE `Orders` (
  `orderID` int(20) NOT NULL,
  `customerID` int(11) DEFAULT NULL,
  `orderDate` date NOT NULL,
  `shippedDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `Orders`:
--   `customerID`
--       `Customers` -> `customerID`
--

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`orderID`, `customerID`, `orderDate`, `shippedDate`) VALUES
(1, 1, '2020-06-14', '2020-06-25'),
(2, 2, '2020-06-20', '2020-07-02'),
(3, 3, '2020-07-01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Orders_Products`
--

DROP TABLE IF EXISTS `Orders_Products`;
CREATE TABLE `Orders_Products` (
  `orderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `productQTY` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `Orders_Products`:
--   `orderID`
--       `Orders` -> `orderID`
--   `productID`
--       `Products` -> `productID`
--

--
-- Dumping data for table `Orders_Products`
--

INSERT INTO `Orders_Products` (`orderID`, `productID`, `productQTY`) VALUES
(1, 2, 3),
(1, 4, 1),
(1, 5, 2),
(2, 1, 4),
(3, 1, 3),
(3, 2, 5),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
CREATE TABLE `Products` (
  `productID` int(20) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `supplierID` int(11) DEFAULT NULL,
  `productPrice` double(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `Products`:
--   `supplierID`
--       `Suppliers` -> `supplierID`
--

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`productID`, `productName`, `supplierID`, `productPrice`) VALUES
(1, 'SuuweetCF', 2, 20.78),
(2, 'Espresso7', 1, 30.50),
(3, 'CentralWay', 2, 25.98),
(4, 'SantosaOrganic', 3, 35.63),
(5, 'CostaricaTime', 4, 40.71);

-- --------------------------------------------------------

--
-- Table structure for table `Products_Beans`
--

DROP TABLE IF EXISTS `Products_Beans`;
CREATE TABLE `Products_Beans` (
  `beanID` int(11) NOT NULL,
  `productID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `Products_Beans`:
--   `beanID`
--       `Beans` -> `beanID`
--   `productID`
--       `Products` -> `productID`
--

--
-- Dumping data for table `Products_Beans`
--

INSERT INTO `Products_Beans` (`beanID`, `productID`) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 4),
(3, 1),
(3, 2),
(4, 4),
(4, 5),
(5, 3),
(5, 5),
(6, 5),
(7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Suppliers`
--

DROP TABLE IF EXISTS `Suppliers`;
CREATE TABLE `Suppliers` (
  `supplierID` int(20) NOT NULL,
  `supplierName` varchar(255) NOT NULL,
  `supplierStreet` varchar(255) NOT NULL,
  `supplierCity` varchar(255) NOT NULL,
  `supplierState` varchar(255) NOT NULL,
  `supplierPostalCode` varchar(255) NOT NULL,
  `supplierCountry` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `Suppliers`:
--

--
-- Dumping data for table `Suppliers`
--

INSERT INTO `Suppliers` (`supplierID`, `supplierName`, `supplierStreet`, `supplierCity`, `supplierState`, `supplierPostalCode`, `supplierCountry`) VALUES
(1, 'mc Food Products', '155 NW St. Helens', 'New York', 'NY', '10012', 'USA'),
(2, 'Joes Gig Coffee', '29213 89nd Ave', 'Kent', 'WA', '98032', 'USA'),
(3, 'Coffee Bean Roaster', '3/8 Arkwrights Rd.', 'Rockingham', 'WA', '6168', 'Australia'),
(4, 'SA Coffee & Tea', '215 Concord Pkwy', 'South Concord', 'NC', '28027', 'USA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Beans`
--
ALTER TABLE `Beans`
  ADD PRIMARY KEY (`beanID`);

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `customerID` (`customerID`);

--
-- Indexes for table `Orders_Products`
--
ALTER TABLE `Orders_Products`
  ADD PRIMARY KEY (`orderID`,`productID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`productID`),
  ADD KEY `supplierID` (`supplierID`);

--
-- Indexes for table `Products_Beans`
--
ALTER TABLE `Products_Beans`
  ADD PRIMARY KEY (`beanID`,`productID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `Suppliers`
--
ALTER TABLE `Suppliers`
  ADD PRIMARY KEY (`supplierID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Beans`
--
ALTER TABLE `Beans`
  MODIFY `beanID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Customers`
--
ALTER TABLE `Customers`
  MODIFY `customerID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `orderID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Products`
--
ALTER TABLE `Products`
  MODIFY `productID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Suppliers`
--
ALTER TABLE `Suppliers`
  MODIFY `supplierID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `Customers` (`customerID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Orders_Products`
--
ALTER TABLE `Orders_Products`
  ADD CONSTRAINT `Orders_Products_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `Orders` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Orders_Products_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `Products` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`supplierID`) REFERENCES `Suppliers` (`supplierID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Products_Beans`
--
ALTER TABLE `Products_Beans`
  ADD CONSTRAINT `Products_Beans_ibfk_1` FOREIGN KEY (`beanID`) REFERENCES `Beans` (`beanID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Products_Beans_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `Products` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
