-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2025 at 09:05 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prototype2`
--

-- --------------------------------------------------------

--
-- Table structure for table `weather`
--

CREATE TABLE `weather` (
  `id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `main_weather` varchar(255) DEFAULT NULL,
  `condition` text DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `pressure` float DEFAULT NULL,
  `humidity` float DEFAULT NULL,
  `wind` float DEFAULT NULL,
  `wind_direction` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `weather`
--

INSERT INTO `weather` (`id`, `city_name`, `date_time`, `main_weather`, `condition`, `temperature`, `pressure`, `humidity`, `wind`, `wind_direction`) VALUES
(12, 'Biratnagar', '2025-01-24 20:01:35', 'Clear', 'clear sky', 13.1, 1013, 89, 2.38, 81),
(13, 'colombo', '2025-01-24 20:02:38', 'Clouds', 'overcast clouds', 23.97, 1009, 90, 4.94, 20),
(14, 'tokyo', '2025-01-24 20:02:50', 'Clouds', 'overcast clouds', 5.98, 1021, 78, 5.69, 19),
(15, 'kolkata', '2025-01-24 20:02:59', 'Mist', 'mist', 18.97, 1012, 88, 1.54, 50),
(16, 'moscow', '2025-01-24 20:03:15', 'Clouds', 'broken clouds', -1.65, 1022, 63, 2.34, 196),
(17, 'kabul', '2025-01-24 20:03:29', 'Clear', 'clear sky', -4.15, 1031, 36, 3.73, 221),
(18, 'london', '2025-01-24 20:03:48', 'Clouds', 'overcast clouds', 8.07, 1000, 75, 3.09, 170),
(19, 'scotland', '2025-01-24 20:03:59', 'Clear', 'clear sky', 5.05, 1024, 39, 2.06, 290),
(20, 'paris', '2025-01-24 20:04:08', 'Clouds', 'overcast clouds', 12.87, 1004, 82, 8.23, 190),
(21, 'Berlin', '2025-01-24 20:04:35', 'Rain', 'moderate rain', 6.83, 1007, 92, 5.36, 197);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `weather`
--
ALTER TABLE `weather`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `weather`
--
ALTER TABLE `weather`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
