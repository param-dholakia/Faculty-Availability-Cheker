-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2024 at 08:41 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `param_java`
--

-- --------------------------------------------------------

--
-- Table structure for table `faculty_table`
--

CREATE TABLE `faculty_table` (
  `name` varchar(55) NOT NULL,
  `id` int(11) NOT NULL,
  `pass` varchar(55) NOT NULL,
  `status` varchar(20) DEFAULT 'Unavailable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty_table`
--

INSERT INTO `faculty_table` (`name`, `id`, `pass`, `status`) VALUES
('Hetal Gaudani', 1, 'hvg.cp', 'Available'),
('Kuratulain Kaji', 2, 'kz.cp', 'Unavailable'),
('Chhaya Zala', 3, 'cz.cp', 'Unavailable'),
('Tejas Patel', 4, 'tp.cp', 'Unavailable'),
('Brijesh Patel', 5, 'bpp.cp', 'Unavailable'),
('Mukesh Joshi', 6, 'mtj.ash', 'Unavailable');

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `name` varchar(55) NOT NULL,
  `subject` varchar(25) NOT NULL,
  `branch` varchar(25) NOT NULL,
  `sem` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reminders`
--

INSERT INTO `reminders` (`name`, `subject`, `branch`, `sem`, `date`, `time`) VALUES
('Kuratulain Kaji', 'adv java', 'cp', 5, '2024-11-14', '09:00:00'),
('Kuratulain Kaji', 'python', 'cp', 5, '2024-11-22', '10:29:00'),
('Hetal Gaudani', 'Blockchain', 'CSD', 1, '2024-11-15', '00:50:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
