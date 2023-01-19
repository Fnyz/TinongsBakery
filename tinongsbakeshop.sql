-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2023 at 01:19 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tinongsbakeshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cus_id` int(11) NOT NULL,
  `cus_fname` varchar(300) DEFAULT NULL,
  `cus_lname` varchar(300) DEFAULT NULL,
  `cus_phone` int(13) DEFAULT NULL,
  `cus_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cus_updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cus_id`, `cus_fname`, `cus_lname`, `cus_phone`, `cus_created_at`, `cus_updated_at`) VALUES
(1, 'John', 'Doe', 956783231, '2023-01-16 03:50:08', '2023-01-16 03:50:08'),
(2, 'Mary jane', 'Betasolo', 923314124, '2023-01-16 03:50:18', '2023-01-16 03:50:18'),
(3, 'Walk in Customer', '', 0, '2023-01-17 00:14:58', '2023-01-17 00:14:58');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prod_id` int(11) NOT NULL,
  `prod_name` varchar(300) DEFAULT NULL,
  `prod_price` double(9,2) DEFAULT NULL,
  `prod_quan` int(11) DEFAULT NULL,
  `prod_desc` varchar(500) DEFAULT NULL,
  `prod_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `prod_updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prod_id`, `prod_name`, `prod_price`, `prod_quan`, `prod_desc`, `prod_created_at`, `prod_updated_at`) VALUES
(1, 'Pan burikat', 15.00, 53, 'Lami ni basa basa!', '2023-01-18 17:22:54', '2023-01-17 03:17:09'),
(2, 'Bahug bahug', 5.00, -3, 'lami nga bahug bahug !', '2023-01-18 17:23:15', '2023-01-16 02:33:43'),
(3, 'Pande bugdol', 10.00, 17, 'Lami na bugdo!', '2023-01-17 09:52:51', '2023-01-17 00:23:22'),
(4, 'Insaimada', 15.00, 100, 'Lamion na pan!', '2023-01-17 09:52:03', '2023-01-17 09:52:03'),
(5, 'Ube cheese desal', 20.00, 95, 'Tam is na ube!', '2023-01-17 09:53:05', '2023-01-17 09:52:28');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transac_id` int(11) NOT NULL,
  `transac_code` varchar(200) DEFAULT NULL,
  `transac_total` double(9,2) DEFAULT NULL,
  `transac_quan` int(11) DEFAULT NULL,
  `cus_id` int(11) DEFAULT NULL,
  `transac_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `transac_updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `transac_payment` double(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transac_id`, `transac_code`, `transac_total`, `transac_quan`, `cus_id`, `transac_created_at`, `transac_updated_at`, `transac_payment`) VALUES
(24, '2023011769910', 35.00, 3, 3, '2023-01-17 09:51:14', '2023-01-17 09:51:14', 1000.00),
(25, '2023011785048', 200.00, 16, 2, '2023-01-17 09:53:35', '2023-01-17 09:53:35', 1000.00),
(26, '2023011834460', 60.00, 4, 3, '2023-01-18 17:23:59', '2023-01-18 17:23:59', 500.00);

-- --------------------------------------------------------

--
-- Table structure for table `trans_history`
--

CREATE TABLE `trans_history` (
  `trans_id` int(11) NOT NULL,
  `prod_id` int(11) DEFAULT NULL,
  `cus_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `trans_code` varchar(200) DEFAULT NULL,
  `sub_price` double(9,2) DEFAULT NULL,
  `sub_quantity` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trans_history`
--

INSERT INTO `trans_history` (`trans_id`, `prod_id`, `cus_id`, `user_id`, `trans_code`, `sub_price`, `sub_quantity`, `created_date`) VALUES
(164, 1, 3, 1, '2023011769910', 15.00, 1, '2023-01-17 09:51:00'),
(165, 3, 3, 1, '2023011769910', 20.00, 2, '2023-01-17 09:51:08'),
(166, 5, 2, 1, '2023011785048', 60.00, 3, '2023-01-17 09:52:43'),
(167, 3, 2, 1, '2023011785048', 50.00, 5, '2023-01-17 09:52:51'),
(168, 1, 2, 1, '2023011785048', 75.00, 5, '2023-01-17 09:52:57'),
(169, 2, 2, 1, '2023011785048', 15.00, 3, '2023-01-17 09:53:18'),
(170, 1, 3, 1, '2023011834460', 60.00, 4, '2023-01-18 17:22:54');

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `user_id` int(11) NOT NULL,
  `user_fname` varchar(300) DEFAULT NULL,
  `user_lname` varchar(300) DEFAULT NULL,
  `user_phone` int(13) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `user_pass` varchar(200) DEFAULT NULL,
  `user_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`user_id`, `user_fname`, `user_lname`, `user_phone`, `username`, `user_pass`, `user_created_at`, `user_updated_at`) VALUES
(1, 'John', 'Doe', 123456789, 'Admin', 'Admin', '2023-01-17 06:51:43', '2023-01-17 10:57:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cus_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transac_id`),
  ADD KEY `cus_id` (`cus_id`);

--
-- Indexes for table `trans_history`
--
ALTER TABLE `trans_history`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `prod_id` (`prod_id`),
  ADD KEY `cus_id` (`cus_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transac_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `trans_history`
--
ALTER TABLE `trans_history`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT for table `user_account`
--
ALTER TABLE `user_account`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`);

--
-- Constraints for table `trans_history`
--
ALTER TABLE `trans_history`
  ADD CONSTRAINT `trans_history_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`),
  ADD CONSTRAINT `trans_history_ibfk_2` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`),
  ADD CONSTRAINT `trans_history_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
