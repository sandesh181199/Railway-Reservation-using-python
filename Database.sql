-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2019 at 11:47 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cn_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `station_id` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `station_name` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`station_id`, `station_name`) VALUES
('ABH', 'Ambarnath'),
('ADI', 'Ahmedabad Junction'),
('ANND', 'Anand Junction'),
('BBS', 'Mumbai CST'),
('BCT', 'Mumbai Central'),
('BCY', 'Varanasi City'),
('BDTS', 'Bandra Terminus'),
('BPL', 'Bhopal Junction'),
('BPRD', 'Barpeta Road'),
('BRC', 'Vadodara Junction'),
('BVC', 'Bhavnagar Trmus'),
('BVI', 'Borivali'),
('CDG', 'Chandigarh'),
('CSTM', 'Mumbai CST'),
('DDN', 'Dehradun'),
('DEC', 'Delhi Cantt.'),
('DEE', 'Delhi S Rohilla'),
('GD', 'Gonda Junction'),
('GHY', 'Guwahati'),
('GKP', 'Gorakhpur Junction'),
('HW', 'Haridwar'),
('HWH', 'Howrah Junction'),
('JBP', 'Jabalpur'),
('JP', 'Jaipur'),
('KGP', 'Kharagpur Junction'),
('KLK', 'Kalka'),
('KOTA', 'Kota Junction'),
('KYN', 'Kalyan Junction'),
('LC', 'Lucknow City'),
('LJN', 'Lucknow New'),
('MTC', 'Meerut City Junction'),
('NZM', 'Hazrat Nizammudin'),
('PNP', 'Panipat Junction'),
('PUNE', 'Pune Junction'),
('RJT', 'Rajkot Junction'),
('SMNH', 'Somnath'),
('SNP', 'Sonipat Junction'),
('SNSI', 'Sainagar Shirdi'),
('TVC', 'Trivandrum Central'),
('UD', 'Udupi'),
('UJN', 'Ujjain Junction');

-- --------------------------------------------------------

--
-- Table structure for table `train`
--

CREATE TABLE `train` (
  `train_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `train_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `train_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `source_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dest_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seats` int(11) NOT NULL,
  `fare` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `train`
--

INSERT INTO `train` (`train_id`, `train_name`, `train_type`, `source_id`, `dest_id`, `seats`, `fare`) VALUES
('11464', 'JBP Somnath Express', 'Express', 'JBP', 'SMNH', 25, 520),
('12010', 'Shatabdi Express', 'Express', 'ADI', 'BCT', 50, 1025),
('12431', 'Rajdhani Express', 'Express', 'TVC', 'NZM', 100, 4500),
('12509', 'Guwahati Express', 'Express', 'BBS', 'GHY', 40, 600),
('14096', 'Himalayan Queen', 'Special', 'KLK', 'DEE', 50, 120),
('15008', 'LJN BCY Express', 'Express', 'LJN', 'BCY', 25, 300),
('19020', 'Dehradun Express', 'Express', 'DDN', 'BDTS', 40, 555),
('19580', 'DEE RJT Express', 'Express', 'DEE', 'BVC', 25, 495),
('51033', 'Shirdi Fast Passenger', 'Passenger', 'CSTM', 'SNSI', 50, 175);

-- --------------------------------------------------------

--
-- Table structure for table `train_status`
--

CREATE TABLE `train_status` (
  `train_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `available_date` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `booked_seats` int(11) DEFAULT NULL,
  `available_seat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `train_status`
--

INSERT INTO `train_status` (`train_id`, `available_date`, `booked_seats`, `available_seat`) VALUES
('11464', '2017-04-11', 2, 98),
('12010', '2017-04-14', 0, 100),
('12431', '2017-04-11', 0, 100),
('12509', '2017-04-14', 1, 100),
('14096', '2017-04-10', 0, 100),
('14096', '2017-04-12', 0, 100),
('14096', '2017-04-13', 0, 100),
('14096', '2017-04-14', 0, 100),
('14096', '2017-04-15', 0, 100),
('15008', '2017-04-10', 0, 100),
('15008', '2017-04-13', 0, 100),
('15008', '2017-04-14', 0, 100),
('15008', '2017-04-15', 25, 100),
('15008', '2017-04-16', 0, 100),
('19020', '2017-04-10', 1, 100),
('19020', '2017-04-11', 0, 100),
('19020', '2017-04-12', 0, 100),
('19020', '2017-04-13', 0, 100),
('19020', '2017-04-14', 0, 100),
('19020', '2017-04-15', 0, 100),
('19020', '2017-04-16', 0, 100),
('19580', '2017-04-14', 0, 99),
('51033', '2017-04-10', 0, 100),
('51033', '2017-04-11', 0, 99),
('51033', '2017-04-12', 0, 100),
('51033', '2017-04-13', 0, 100),
('51033', '2017-04-14', 0, 100),
('51033', '2017-04-15', 0, 100),
('51033', '2017-04-16', 0, 100);

-- --------------------------------------------------------

--
-- Table structure for table `user_booking`
--

CREATE TABLE `user_booking` (
  `email_id` varchar(31) COLLATE utf8_unicode_ci NOT NULL,
  `source_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `destination_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `train_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `no_of_seats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_booking`
--

INSERT INTO `user_booking` (`email_id`, `source_id`, `destination_id`, `train_id`, `no_of_seats`) VALUES
('sandeshvanwadi@gmail.com', 'JBP', 'SMNH', '11464', -1),
('jayeshpawar929@gmail.com', 'ADI', 'BCT', '12010', 1),
('sandeshvanwadi123@gmail.com', 'JBP', 'SMNH', '11464', 2),
('sandeshvanwadi156@gmail.com', 'JBP', 'SMNH', '11464', 98),
('sandeshvanwadi345@gmail.com', 'sandesh', 'ABP', 'SMNH', 1),
('dhiraj@gmail.com', 'JBP', 'SMNH', '11464', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `email_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `gender` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`email_id`, `password`, `name`, `gender`, `mobile`, `city`, `state`) VALUES
('dhiraj@gmail.com', 'sandy', 'dhiraj', 'm', '9527315508', 'pune', 'maha'),
('jayeshpawar99@gmail.com', 'jayesh', 'Jayesh Pawar', 'M', '1234567890', 'Nanded', 'Maharastra'),
('namankumar12@gmail.com', 'naman', 'Naman Kumar', 'M', '1234567890', 'Bihar', 'Bihar'),
('sandeshvanwadi1899@gmail.com', 'sandesh', 'Sandesh Vanwadi', 'M', '1234567890', 'Pune', 'Maharastra'),
('sandeshvanwadi9239@gmail.com', 'sandy', 'Sandesh Vanwadi', 'M', '1234567890', 'Satana', 'Maharatra');

-- --------------------------------------------------------

--
-- Table structure for table `waiting_list`
--

CREATE TABLE `waiting_list` (
  `email_id` varchar(31) COLLATE utf8_unicode_ci NOT NULL,
  `source_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `destination_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `train_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `no_of_seats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`station_id`);

--
-- Indexes for table `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`train_id`),
  ADD KEY `source_id` (`source_id`),
  ADD KEY `dest_id` (`dest_id`);

--
-- Indexes for table `train_status`
--
ALTER TABLE `train_status`
  ADD PRIMARY KEY (`train_id`,`available_date`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`email_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `train`
--
ALTER TABLE `train`
  ADD CONSTRAINT `train_ibfk_1` FOREIGN KEY (`source_id`) REFERENCES `station` (`station_id`),
  ADD CONSTRAINT `train_ibfk_2` FOREIGN KEY (`dest_id`) REFERENCES `station` (`station_id`);

--
-- Constraints for table `train_status`
--
ALTER TABLE `train_status`
  ADD CONSTRAINT `train_status_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`train_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
