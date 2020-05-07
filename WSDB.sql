-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2020-05-06 17:48:21
-- 服务器版本： 10.4.11-MariaDB
-- PHP 版本： 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `assignment`
--

DELIMITER $$
--
-- 存储过程
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `test_multi_sets` ()  begin
        select user() as first_col;
        select user() as first_col, now() as second_col;
        select user() as first_col, now() as second_col, now() as third_col;
        end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `available`
--

CREATE TABLE `available` (
  `lesson_id` int(20) NOT NULL,
  `class_time` time(4) NOT NULL,
  `ordered_lesson_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `belong`
--

CREATE TABLE `belong` (
  `customer_id` int(20) NOT NULL,
  `vip_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `coach`
--

CREATE TABLE `coach` (
  `coach_id` int(20) NOT NULL,
  `age` int(2) NOT NULL,
  `coach_entry_time` date NOT NULL,
  `avg_star` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `coach_star`
--

CREATE TABLE `coach_star` (
  `coach_id` int(10) NOT NULL,
  `coach_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(20) NOT NULL,
  `date` date NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `customer`
--

CREATE TABLE `customer` (
  `customer_id` varchar(100) NOT NULL,
  `customer_second_name` varchar(100) NOT NULL,
  `customer_first_name` varchar(100) NOT NULL,
  `customer_password` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `customer_age` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `scheduled_hours` varchar(100) NOT NULL,
  `remaining_hours` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_second_name`, `customer_first_name`, `customer_password`, `phone_number`, `customer_age`, `date_of_birth`, `scheduled_hours`, `remaining_hours`) VALUES
('1830026021', 'Dai', 'Adam', '12345678', '1234567890', '', '2020-05-04', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `customer_evaluate`
--

CREATE TABLE `customer_evaluate` (
  `customer_id` int(20) NOT NULL,
  `coach_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `customer_has_recharge`
--

CREATE TABLE `customer_has_recharge` (
  `customer_id` int(20) NOT NULL,
  `recharge_manager_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `evaluation`
--

CREATE TABLE `evaluation` (
  `coach_name` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `stars` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `leave_message`
--

CREATE TABLE `leave_message` (
  `customer_id` int(20) NOT NULL,
  `comment_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `lesson`
--

CREATE TABLE `lesson` (
  `lesson_id` int(10) NOT NULL,
  `lesson_name` varchar(30) NOT NULL,
  `lesson_available_hour` int(4) NOT NULL,
  `lesson_remaining_hour` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `manager`
--

CREATE TABLE `manager` (
  `manager_id` int(10) NOT NULL,
  `manager_entry_time` date NOT NULL,
  `manager_age` int(2) NOT NULL,
  `manager_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `manager_recharge`
--

CREATE TABLE `manager_recharge` (
  `manager_id` int(10) NOT NULL,
  `recharge_manager_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `ordered`
--

CREATE TABLE `ordered` (
  `class_time` time(4) NOT NULL,
  `ordered_lesson_name` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `recharge_record`
--

CREATE TABLE `recharge_record` (
  `recharge_manager_name` varchar(30) NOT NULL,
  `recharge_date` date NOT NULL,
  `amount` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `vip_customer`
--

CREATE TABLE `vip_customer` (
  `vip_id` int(20) NOT NULL,
  `vip_first_name` varchar(20) NOT NULL,
  `vip_last_name` varchar(20) NOT NULL,
  `vip_phone_numer` int(11) NOT NULL,
  `vip_remaining_hour` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转储表的索引
--

--
-- 表的索引 `belong`
--
ALTER TABLE `belong`
  ADD UNIQUE KEY `customer_id` (`customer_id`,`vip_id`);

--
-- 表的索引 `coach`
--
ALTER TABLE `coach`
  ADD PRIMARY KEY (`coach_id`),
  ADD UNIQUE KEY `coach_id` (`coach_id`);

--
-- 表的索引 `coach_star`
--
ALTER TABLE `coach_star`
  ADD UNIQUE KEY `coach_id` (`coach_id`);

--
-- 表的索引 `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- 表的索引 `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- 表的索引 `customer_evaluate`
--
ALTER TABLE `customer_evaluate`
  ADD UNIQUE KEY `customer_id` (`customer_id`);

--
-- 表的索引 `customer_has_recharge`
--
ALTER TABLE `customer_has_recharge`
  ADD UNIQUE KEY `customer_id` (`customer_id`,`recharge_manager_name`);

--
-- 表的索引 `evaluation`
--
ALTER TABLE `evaluation`
  ADD PRIMARY KEY (`coach_name`,`date`);

--
-- 表的索引 `leave_message`
--
ALTER TABLE `leave_message`
  ADD UNIQUE KEY `customer_id` (`customer_id`,`comment_id`);

--
-- 表的索引 `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`lesson_id`),
  ADD UNIQUE KEY `lesson_id` (`lesson_id`);

--
-- 表的索引 `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`manager_id`);

--
-- 表的索引 `manager_recharge`
--
ALTER TABLE `manager_recharge`
  ADD UNIQUE KEY `manager_id` (`manager_id`);

--
-- 表的索引 `ordered`
--
ALTER TABLE `ordered`
  ADD PRIMARY KEY (`class_time`,`ordered_lesson_name`);

--
-- 表的索引 `recharge_record`
--
ALTER TABLE `recharge_record`
  ADD PRIMARY KEY (`recharge_manager_name`,`recharge_date`);

--
-- 表的索引 `vip_customer`
--
ALTER TABLE `vip_customer`
  ADD PRIMARY KEY (`vip_id`),
  ADD UNIQUE KEY `vip_id` (`vip_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
