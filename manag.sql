-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2024 at 06:18 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `manag`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `prn` varchar(50) NOT NULL,
  `rollno` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `branch` varchar(50) DEFAULT NULL,
  `division` varchar(10) DEFAULT NULL,
  `batch` varchar(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`prn`, `rollno`, `name`, `year`, `branch`, `division`, `batch`, `date`, `subject`, `status`) VALUES
('23sc114282016', 221, 'CHOUGULE SHUBHAM ULHAS', 0, 'cse', 'b', 'b3', '2024-09-05', 'dbms', 'Absent'),
('23sc114282017', 62, 'CHOUGULE SHUBHAM ULHAS', 0, 'cse', 'b', 'b3', '2024-09-05', 'os', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `studentdata`
--

CREATE TABLE `studentdata` (
  `student_id` int(11) NOT NULL,
  `prn` varchar(20) NOT NULL,
  `rollno` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `year` varchar(11) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `div` mediumtext NOT NULL,
  `batch` varchar(20) NOT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studentdata`
--

INSERT INTO `studentdata` (`student_id`, `prn`, `rollno`, `name`, `year`, `branch`, `div`, `batch`, `address`, `phone`, `username`, `password`) VALUES
(1, '23sc114282017', '62', 'CHOUGULE SHUBHAM ULHAS', 'ty', 'cse', 'b', 'b3', 'Banwadi, Karad, Satara', '09075737702', 'sid', '1234'),
(2, '', '', '', '', '', '', '', '', '', '', ''),
(3, '23sc114282016', '221', 'CHOUGULE SHUBHAM ULHAS', 'ty', 'cse', 'b', 'b3', 'Banwadi, Karad, Satara', '09075737702', 'parth', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `subject_name` varchar(100) NOT NULL,
  `department` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject_name`, `department`) VALUES
(1, 'os', 'cse'),
(4, 'dbms', 'cse');

-- --------------------------------------------------------

--
-- Table structure for table `teacherdata`
--

CREATE TABLE `teacherdata` (
  `id` int(11) NOT NULL,
  `Name` varchar(1000) NOT NULL,
  `tyear` varchar(1002) NOT NULL,
  `tbranch` varchar(1000) NOT NULL,
  `tdiv` varchar(1000) NOT NULL,
  `phone` varchar(1000) NOT NULL,
  `address` varchar(300) NOT NULL,
  `username` varchar(1000) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacherdata`
--

INSERT INTO `teacherdata` (`id`, `Name`, `tyear`, `tbranch`, `tdiv`, `phone`, `address`, `username`, `password`) VALUES
(1, 'halale', 'third', 'b', 'b', '21384132165', 'devgad', 'halale', '1234'),
(2, 'halale', 'third', 'b', 'b', '21384132165', 'devgad', 'halale', '1234'),
(11, 'CHOUGULE SHUBHAM ULHAS', 'ty', 'cse', 'b', '09075737702', 'Banwadi, Karad, Satara', 'a', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`prn`,`rollno`);

--
-- Indexes for table `studentdata`
--
ALTER TABLE `studentdata`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `prn` (`prn`) USING BTREE;

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacherdata`
--
ALTER TABLE `teacherdata`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `studentdata`
--
ALTER TABLE `studentdata`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `teacherdata`
--
ALTER TABLE `teacherdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
