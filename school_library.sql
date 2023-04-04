-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2023 at 02:34 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_library`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `address` varchar(25) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `contact`, `address`, `username`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'Andre', '0813', 'Malang', 'andre', '874a17d408274a6014f7a0d5f1bedc6a', '2023-02-01 01:52:00', '2023-02-01 02:09:06'),
(3, 'andre', '09876543', 'malang', 'andre', '202cb962ac59075b964b07152d234b70', '2023-02-21 03:11:55', '2023-02-21 03:11:55'),
(4, 'andre', '09876543', 'malang', 'andre', '202cb962ac59075b964b07152d234b70', '2023-02-21 03:25:11', '2023-02-21 03:25:11');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `isbn`, `title`, `author`, `publisher`, `category`, `stock`, `cover`, `createdAt`, `updatedAt`) VALUES
(1, '12312', 'buku 1', 'andre', 'andre', 'Novel', 20, 'cover-1675653045868.png', '2023-02-06 03:10:45', '2023-02-06 03:10:45'),
(2, '12312', 'buku 2', 'rafi', 'andre', 'Novel', 15, 'cover-1675732274280.png', '2023-02-06 03:11:42', '2023-02-07 01:11:14'),
(7, '2', 'Between Moment and Story', 'Rafi Adrian', 'Andre', 'Novel', 15, NULL, '2023-03-12 12:18:49', '2023-03-12 12:18:49'),
(8, '3', 'Between Us', 'Rafi Adrian', 'Andre', 'Novel', 10, NULL, '2023-03-13 01:08:05', '2023-03-13 01:08:05'),
(9, '123', 'Tes 1', 'Andre', 'Andre', 'Novel', 10, NULL, '2023-04-03 01:13:46', '2023-04-03 01:13:46');

-- --------------------------------------------------------

--
-- Table structure for table `borrows`
--

CREATE TABLE `borrows` (
  `id` int(11) NOT NULL,
  `memberID` int(11) NOT NULL,
  `adminID` int(11) NOT NULL,
  `date_of_borrow` datetime NOT NULL,
  `date_of_return` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrows`
--

INSERT INTO `borrows` (`id`, `memberID`, `adminID`, `date_of_borrow`, `date_of_return`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, '2023-02-08 00:00:00', '2023-02-07 17:00:00', 1, '2023-02-08 02:01:41', '2023-02-08 02:19:09'),
(2, 1, 1, '2023-02-08 00:00:00', '2023-02-13 17:00:00', 1, '2023-02-08 02:02:54', '2023-02-14 01:39:02'),
(3, 1, 1, '2023-02-08 00:00:00', '2023-02-10 00:00:00', 0, '2023-02-08 02:03:47', '2023-02-08 02:03:47'),
(4, 1, 1, '2023-02-08 00:00:00', '2023-02-10 00:00:00', 0, '2023-02-21 02:04:01', '2023-02-21 02:04:01'),
(5, 1, 1, '2023-02-08 00:00:00', '0000-00-00 00:00:00', 0, '2023-02-21 04:05:50', '2023-02-21 04:05:50');

-- --------------------------------------------------------

--
-- Table structure for table `details_of_borrows`
--

CREATE TABLE `details_of_borrows` (
  `id` int(11) NOT NULL,
  `borrowID` int(11) NOT NULL,
  `bookID` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `details_of_borrows`
--

INSERT INTO `details_of_borrows` (`id`, `borrowID`, `bookID`, `qty`, `createdAt`, `updatedAt`) VALUES
(1, 2, 1, 2, '2023-02-08 02:02:54', '2023-02-08 02:02:54'),
(2, 3, 1, 2, '2023-02-08 02:03:47', '2023-02-08 02:03:47'),
(3, 4, 1, 2, '2023-02-21 02:04:01', '2023-02-21 02:04:01'),
(4, 5, 1, 2, '2023-02-21 04:05:50', '2023-02-21 04:05:50');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `name`, `gender`, `contact`, `address`, `createdAt`, `updatedAt`, `photo`) VALUES
(1, 'Soekarno', 'Male', '021-223311', 'Tokyo, Japan', '2023-01-31 01:08:57', '2023-01-31 01:08:57', NULL),
(2, 'Soeharto', 'Male', '0331-474747', 'Beijing, China', '2023-01-31 01:08:57', '2023-01-31 01:08:57', NULL),
(3, 'Megawati', 'Female', '091-23981', 'Bangkok, Thailand', '2023-01-31 01:08:57', '2023-01-31 01:08:57', NULL),
(18, 'Adrian', 'Male', '08132887', 'Sawojajar', '2023-02-07 00:53:59', '2023-02-07 00:59:14', 'cover-1675731554733.png'),
(19, 'Prasetya', 'Male', '0813348573269', 'Malang', '2023-02-07 01:12:10', '2023-02-07 01:12:10', 'cover-1675732330651.png'),
(20, 'Andre', 'Male', '0812', 'Malang', '2023-02-21 02:22:43', '2023-02-21 02:22:43', 'cover-1676946163141.png'),
(21, 'rafiadpr', 'Male', '081234567890', 'Malang', '2023-03-13 06:30:16', '2023-03-13 06:30:16', NULL),
(22, 'icun', 'Male', '081234567890', 'Malang', '2023-03-19 11:18:47', '2023-04-03 00:37:30', NULL),
(25, 'Tes 2', 'Male', '081234567890', 'Malang', '2023-03-29 01:14:43', '2023-03-29 01:14:43', 'cover-1680052483369.jpg'),
(26, 'tes', 'Male', '012479823', 'malang', '2023-04-03 03:04:37', '2023-04-03 03:10:40', 'cover-1680491440566.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20230130013238-create-book.js'),
('20230130015659-create-member.js'),
('20230130015816-create-admin.js'),
('20230130015946-create-borrow.js'),
('20230130020337-create-details-of-borrow.js'),
('20230206073658-create-member.js'),
('20230207003254-modify_member_add_new_fields.js');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borrows`
--
ALTER TABLE `borrows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `memberID` (`memberID`),
  ADD KEY `adminID` (`adminID`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `details_of_borrows`
--
ALTER TABLE `details_of_borrows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `borrowID` (`borrowID`),
  ADD KEY `bookID` (`bookID`),
  ADD KEY `qty` (`qty`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `borrows`
--
ALTER TABLE `borrows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `details_of_borrows`
--
ALTER TABLE `details_of_borrows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrows`
--
ALTER TABLE `borrows`
  ADD CONSTRAINT `borrows_ibfk_1` FOREIGN KEY (`adminID`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `borrows_ibfk_2` FOREIGN KEY (`memberID`) REFERENCES `members` (`id`);

--
-- Constraints for table `details_of_borrows`
--
ALTER TABLE `details_of_borrows`
  ADD CONSTRAINT `details_of_borrows_ibfk_1` FOREIGN KEY (`borrowID`) REFERENCES `borrows` (`id`),
  ADD CONSTRAINT `details_of_borrows_ibfk_2` FOREIGN KEY (`bookID`) REFERENCES `books` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
