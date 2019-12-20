-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2019 at 12:58 PM
-- Server version: 10.4.10-MariaDB
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
-- Database: `wf-riedl-codereview5`
--

-- --------------------------------------------------------

--
-- Table structure for table `additionalcharges`
--

CREATE TABLE `additionalcharges` (
  `add_ID` int(11) NOT NULL,
  `Damage` varchar(30) DEFAULT NULL,
  `Additional_costs` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `additionalcharges`
--

INSERT INTO `additionalcharges` (`add_ID`, `Damage`, `Additional_costs`) VALUES
(1, 'Blechschaden', 400),
(2, 'Kratzer', 250);

-- --------------------------------------------------------

--
-- Table structure for table `agency`
--

CREATE TABLE `agency` (
  `Agency_ID` int(11) NOT NULL,
  `Agency_Name` varchar(30) NOT NULL,
  `Agency_Address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `agency`
--

INSERT INTO `agency` (`Agency_ID`, `Agency_Name`, `Agency_Address`) VALUES
(1, 'Sixt', 'Wagramerstraße 55');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `Bill_ID` int(11) NOT NULL,
  `Agency_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Car_ID` int(11) NOT NULL,
  `Add_ID` int(11) NOT NULL,
  `Start_ID` int(11) NOT NULL,
  `End_ID` int(11) NOT NULL,
  `Bill_costs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`Bill_ID`, `Agency_ID`, `Customer_ID`, `Car_ID`, `Add_ID`, `Start_ID`, `End_ID`, `Bill_costs`) VALUES
(2, 1, 1, 1, 1, 1, 1, 4000);

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `Car_ID` int(11) NOT NULL,
  `Car_Type` varchar(30) NOT NULL,
  `Car_Name` varchar(30) NOT NULL,
  `Car_km` int(11) NOT NULL,
  `Agency_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`Car_ID`, `Car_Type`, `Car_Name`, `Car_km`, `Agency_ID`) VALUES
(1, 'Audi', 'A3', 40000, 1),
(2, 'BMW', 'I3', 4000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `carend`
--

CREATE TABLE `carend` (
  `CarEnd_ID` int(11) NOT NULL,
  `CarEndTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Customer_ID` int(11) NOT NULL,
  `Car_ID` int(11) NOT NULL,
  `Location_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carend`
--

INSERT INTO `carend` (`CarEnd_ID`, `CarEndTime`, `Customer_ID`, `Car_ID`, `Location_ID`) VALUES
(1, '2019-12-20 09:47:43', 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `carstart`
--

CREATE TABLE `carstart` (
  `CarStart_ID` int(11) NOT NULL,
  `CarStartTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Customer_ID` int(11) NOT NULL,
  `Car_ID` int(11) NOT NULL,
  `Location_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carstart`
--

INSERT INTO `carstart` (`CarStart_ID`, `CarStartTime`, `Customer_ID`, `Car_ID`, `Location_ID`) VALUES
(1, '2019-12-20 09:47:29', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_ID` int(11) NOT NULL,
  `Customer_Name` varchar(30) NOT NULL,
  `Customer_address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_ID`, `Customer_Name`, `Customer_address`) VALUES
(1, 'Franz Heinrich', 'HeinrichStraße 44');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `Location_ID` int(11) NOT NULL,
  `Location_address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`Location_ID`, `Location_address`) VALUES
(1, 'Karlsplatz'),
(2, 'Schwedenplatz');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additionalcharges`
--
ALTER TABLE `additionalcharges`
  ADD PRIMARY KEY (`add_ID`);

--
-- Indexes for table `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`Agency_ID`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`Bill_ID`),
  ADD KEY `Agency_ID` (`Agency_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Car_ID` (`Car_ID`),
  ADD KEY `Add_ID` (`Add_ID`),
  ADD KEY `Start_ID` (`Start_ID`),
  ADD KEY `End_ID` (`End_ID`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`Car_ID`),
  ADD KEY `Agency_ID` (`Agency_ID`);

--
-- Indexes for table `carend`
--
ALTER TABLE `carend`
  ADD PRIMARY KEY (`CarEnd_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Car_ID` (`Car_ID`),
  ADD KEY `Location_ID` (`Location_ID`);

--
-- Indexes for table `carstart`
--
ALTER TABLE `carstart`
  ADD PRIMARY KEY (`CarStart_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Car_ID` (`Car_ID`),
  ADD KEY `Location_ID` (`Location_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_ID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`Location_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `additionalcharges`
--
ALTER TABLE `additionalcharges`
  MODIFY `add_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `agency`
--
ALTER TABLE `agency`
  MODIFY `Agency_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `Bill_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `Car_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `carend`
--
ALTER TABLE `carend`
  MODIFY `CarEnd_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carstart`
--
ALTER TABLE `carstart`
  MODIFY `CarStart_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `Location_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`Agency_ID`) REFERENCES `agency` (`Agency_ID`),
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`customer_ID`),
  ADD CONSTRAINT `bill_ibfk_3` FOREIGN KEY (`Car_ID`) REFERENCES `car` (`Car_ID`),
  ADD CONSTRAINT `bill_ibfk_4` FOREIGN KEY (`Add_ID`) REFERENCES `additionalcharges` (`add_ID`),
  ADD CONSTRAINT `bill_ibfk_5` FOREIGN KEY (`Start_ID`) REFERENCES `carstart` (`CarStart_ID`),
  ADD CONSTRAINT `bill_ibfk_6` FOREIGN KEY (`End_ID`) REFERENCES `carend` (`CarEnd_ID`);

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`Agency_ID`) REFERENCES `agency` (`Agency_ID`);

--
-- Constraints for table `carend`
--
ALTER TABLE `carend`
  ADD CONSTRAINT `carend_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`customer_ID`),
  ADD CONSTRAINT `carend_ibfk_2` FOREIGN KEY (`Car_ID`) REFERENCES `car` (`Car_ID`),
  ADD CONSTRAINT `carend_ibfk_3` FOREIGN KEY (`Location_ID`) REFERENCES `location` (`Location_ID`);

--
-- Constraints for table `carstart`
--
ALTER TABLE `carstart`
  ADD CONSTRAINT `carstart_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`customer_ID`),
  ADD CONSTRAINT `carstart_ibfk_2` FOREIGN KEY (`Car_ID`) REFERENCES `car` (`Car_ID`),
  ADD CONSTRAINT `carstart_ibfk_3` FOREIGN KEY (`Location_ID`) REFERENCES `location` (`Location_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
