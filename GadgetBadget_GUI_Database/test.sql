-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2021 at 09:56 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `researcher`
--

CREATE TABLE `researcher` (
  `researcherID` int(255) NOT NULL,
  `researcherName` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `researcherEmail` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `researcherNumber` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `researcherAddress` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `researcherProductType` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `researcherReDate` varchar(255) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `researcher`
--

INSERT INTO `researcher` (`researcherID`, `researcherName`, `researcherEmail`, `researcherNumber`, `researcherAddress`, `researcherProductType`, `researcherReDate`) VALUES
(4, 'maji', 'majintha.cgmail.com', '0766525850', 'sandakelum,newlane,milliduwa,galle', 'on going', '12/21/21'),
(7, 'madawa', 'madawa123gmail@.com', '0112456442', 'temple road galle', 'on update', '1/12/21'),
(8, 'majintha crishan', 'majintha.c@gmail.com', '0766525850', '\'sandakelum\',New lane,milliduwa,galle', 'new', '12.11.10'),
(9, 'ajantha', 'gmail@.com', '011456328', 'newSilva,midle road,col', 'on going', '21/01/21');

-- --------------------------------------------------------

--
-- Table structure for table `researcher_gui`
--

CREATE TABLE `researcher_gui` (
  `researcherID` int(255) NOT NULL,
  `researcherName` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `researcherEmail` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `researcherNumber` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `researcherAddress` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `researcherProductType` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `researcherReDate` varchar(255) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `researcher_gui`
--

INSERT INTO `researcher_gui` (`researcherID`, `researcherName`, `researcherEmail`, `researcherNumber`, `researcherAddress`, `researcherProductType`, `researcherReDate`) VALUES
(13, 'majintha', 'majintha.@cgmail.com', '0766525850', '\"Sandakelum\",New lane,Millidduwa,Galle', 'On-going', '21/02/2021'),
(14, 'Crishan', 'Crishan.d@gmail.com', '09122244293', '\"crishan\",Temple road,galle', 'finished', '05/12/2019');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `researcher`
--
ALTER TABLE `researcher`
  ADD PRIMARY KEY (`researcherID`);

--
-- Indexes for table `researcher_gui`
--
ALTER TABLE `researcher_gui`
  ADD PRIMARY KEY (`researcherID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `researcher`
--
ALTER TABLE `researcher`
  MODIFY `researcherID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `researcher_gui`
--
ALTER TABLE `researcher_gui`
  MODIFY `researcherID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
