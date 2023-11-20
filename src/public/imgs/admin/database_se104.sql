-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2023 at 08:05 AM
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
-- Database: `database_se104`
--

-- --------------------------------------------------------

--
-- Table structure for table `accofea`
--

CREATE TABLE `accofea` (
  `fea_id` int(11) NOT NULL,
  `acco_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accofea`
--

INSERT INTO `accofea` (`fea_id`, `acco_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 4),
(3, 1),
(3, 2),
(3, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `accoimg`
--

CREATE TABLE `accoimg` (
  `acco_id` int(11) NOT NULL,
  `acco_img_url` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accoimg`
--

INSERT INTO `accoimg` (`acco_id`, `acco_img_url`) VALUES
(1, 'accomodation_1.jpg'),
(1, 'accomodation_2.jpg'),
(1, 'accomodation_3.jpg'),
(1, 'accomodation_4.jpg'),
(1, 'accomodation_5.jpg'),
(2, 'accomodation_1.jpg'),
(2, 'accomodation_2.jpg'),
(2, 'accomodation_3.jpg'),
(2, 'accomodation_5.jpg'),
(3, 'accomodation_2.jpg'),
(3, 'accomodation_3.jpg'),
(3, 'accomodation_4.jpg'),
(3, 'accomodation_5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `accommodation`
--

CREATE TABLE `accommodation` (
  `acco_id` int(11) NOT NULL,
  `acco_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `acco_star` int(11) NOT NULL,
  `acco_tiny_img_url` varchar(50) DEFAULT NULL,
  `acco_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `acco_logan` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `acco_detail` text DEFAULT NULL,
  `acco_exac_location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `prov_id` int(11) NOT NULL,
  `acco_location_link` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accommodation`
--

INSERT INTO `accommodation` (`acco_id`, `acco_type`, `acco_star`, `acco_tiny_img_url`, `acco_name`, `acco_logan`, `acco_detail`, `acco_exac_location`, `city_id`, `prov_id`, `acco_location_link`) VALUES
(1, 'hotel', 4, 'acc001.jpg', 'Khách sạn Mộng mơ', 'Luxury Accommodation', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '123 Main Street', 1, 1, 'https://maps.app.goo.gl/kZiXnCysM2YhsziDA'),
(2, 'resort', 5, 'acc002.jpg', 'Resort Lò vi Sóng', 'Experience Paradise', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '456 Beach Road', NULL, 2, 'https://maps.app.goo.gl/fXrs4eMmpP117TY38'),
(3, 'resort', 5, 'acc003.jpg', 'Resort Bình Yên', 'Experience Paradise', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '456 Beach Road', 5, 6, 'https://maps.app.goo.gl/oNLhb8VppARxbcUt9'),
(4, 'guest_house', 2, 'acc004.jpg', 'Guest House C', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '789 Mountain View', NULL, 3, 'https://maps.app.goo.gl/uVpVjbCYiLKLyd517');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_nickname` varchar(50) NOT NULL,
  `admin_pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_nickname`, `admin_pass`) VALUES
(1, 'admin1', 'password1'),
(2, 'admin2', 'password2'),
(3, 'admin3', 'password3');

-- --------------------------------------------------------

--
-- Table structure for table `authuser`
--

CREATE TABLE `authuser` (
  `au_user_id` int(11) NOT NULL,
  `au_user_first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `au_user_last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `au_user_email` varchar(50) NOT NULL,
  `au_user_pass` varchar(50) NOT NULL,
  `au_user_avt_url` varchar(50) DEFAULT NULL,
  `au_user_sex` varchar(6) DEFAULT NULL,
  `au_user_birthday` date DEFAULT NULL,
  `bank_default_id` int(11) DEFAULT NULL,
  `debit_default_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authuser`
--

INSERT INTO `authuser` (`au_user_id`, `au_user_first_name`, `au_user_last_name`, `au_user_email`, `au_user_pass`, `au_user_avt_url`, `au_user_sex`, `au_user_birthday`, `bank_default_id`, `debit_default_id`) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 'password1', 'user_1.jpg', NULL, NULL, NULL, NULL),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 'password2', 'user_2.jpg', NULL, NULL, NULL, NULL),
(3, 'Mike', 'Johnson', 'mike.johnson@example.com', 'password3', 'user_3.jpg', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bankcard`
--

CREATE TABLE `bankcard` (
  `bank_id` int(11) NOT NULL,
  `bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bank_branch` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bank_num` varchar(16) NOT NULL,
  `bank_name_pers` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `au_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bankcard`
--

INSERT INTO `bankcard` (`bank_id`, `bank_name`, `bank_branch`, `bank_num`, `bank_name_pers`, `au_user_id`) VALUES
(1, 'Bank A', 'Branch A', '1111222233334444', 'John Doe', 1),
(2, 'Bank B', 'Branch B', '5555222233334444', 'John Doe_', 1),
(3, 'Bank B', 'Branch B', '5555666677778888', 'Jane Smith', 2);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `book_id` int(11) NOT NULL,
  `acco_id` int(11) NOT NULL,
  `au_user_id` int(11) NOT NULL,
  `book_datetime` datetime NOT NULL,
  `book_start_datetime` datetime NOT NULL,
  `book_end_datetime` datetime NOT NULL,
  `book_num_adult` int(11) NOT NULL,
  `book_num_child` int(11) NOT NULL,
  `book_cost_before` float NOT NULL,
  `book_cost_after` float NOT NULL DEFAULT 0,
  `book_first_name` char(50) NOT NULL,
  `book_last_name` char(50) NOT NULL,
  `book_email` varchar(50) NOT NULL,
  `book_phone` char(10) NOT NULL,
  `pay_id` int(11) NOT NULL,
  `book_note` text DEFAULT NULL,
  `cancel_cost` float NOT NULL,
  `book_status` int(11) NOT NULL,
  `book_is_paid` int(11) NOT NULL,
  `rea_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`book_id`, `acco_id`, `au_user_id`, `book_datetime`, `book_start_datetime`, `book_end_datetime`, `book_num_adult`, `book_num_child`, `book_cost_before`, `book_cost_after`, `book_first_name`, `book_last_name`, `book_email`, `book_phone`, `pay_id`, `book_note`, `cancel_cost`, `book_status`, `book_is_paid`, `rea_id`) VALUES
(1, 1, 1, '2023-10-27 10:00:00', '2023-11-01 14:00:00', '2023-11-05 11:00:00', 2, 0, 7800000, 4800000, 'John', 'Doe', 'john@example.com', '1234567890', 1, NULL, 0, 1, 1, NULL),
(2, 1, 2, '2023-10-28 11:30:00', '2023-11-02 12:00:00', '2023-11-03 10:00:00', 2, 0, 2000000, 2000000, 'Jane', 'Smith', 'jane@example.com', '9876543210', 2, NULL, 0, 1, 1, NULL),
(3, 1, 3, '2023-10-29 09:15:00', '2023-11-04 15:00:00', '2023-11-06 12:00:00', 2, 0, 2200000, 1200000, 'Michael', 'Johnson', 'michael@example.com', '5555555555', 3, NULL, 0, 1, 1, NULL),
(4, 1, 1, '2023-10-30 14:45:00', '2023-11-07 13:00:00', '2023-11-08 09:00:00', 2, 0, 5200000, 3200000, 'Emily', 'Brown', 'emily@example.com', '1111111111', 1, NULL, 0, 1, 1, NULL),
(5, 1, 2, '2023-10-31 16:30:00', '2023-11-09 10:00:00', '2023-11-11 17:00:00', 2, 0, 2800000, 1800000, 'David', 'Wilson', 'david@example.com', '9999999999', 2, NULL, 0, 1, 1, NULL),
(6, 1, 3, '2023-11-01 12:00:00', '2023-11-12 14:30:00', '2023-11-15 11:00:00', 2, 0, 2500000, 2500000, 'Sarah', 'Jackson', 'sarah@example.com', '7777777777', 1, NULL, 0, 1, 1, NULL),
(7, 1, 1, '2023-11-02 10:30:00', '2023-11-16 09:00:00', '2023-11-18 12:00:00', 2, 0, 2900000, 1900000, 'Robert', 'Anderson', 'robert@example.com', '2222222222', 2, NULL, 0, 1, 1, NULL),
(8, 1, 2, '2023-11-03 15:15:00', '2023-11-19 11:30:00', '2023-11-21 10:00:00', 2, 0, 5400000, 3400000, 'Olivia', 'Thomas', 'olivia@example.com', '8888888888', 3, NULL, 0, 1, 1, NULL),
(9, 1, 3, '2023-11-04 11:45:00', '2023-11-22 14:00:00', '2023-11-24 09:30:00', 2, 0, 2400000, 1400000, 'Daniel', 'Martinez', 'daniel@example.com', '4444444444', 1, NULL, 0, 1, 1, NULL),
(10, 1, 1, '2023-11-05 09:00:00', '2023-11-25 10:30:00', '2023-11-27 12:00:00', 2, 0, 2400000, 1400000, 'Sophia', 'Garcia', 'sophia@example.com', '6666666666', 2, NULL, 0, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bookingdetail`
--

CREATE TABLE `bookingdetail` (
  `book_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `book_room_cost_before` float NOT NULL,
  `book_room_cost_after` float NOT NULL,
  `book_num_room` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookingdetail`
--

INSERT INTO `bookingdetail` (`book_id`, `room_id`, `book_room_cost_before`, `book_room_cost_after`, `book_num_room`) VALUES
(1, 1, 2500000, 1500000, 2),
(1, 2, 2800000, 1800000, 1),
(2, 3, 2000000, 2000000, 1),
(3, 4, 2200000, 1200000, 1),
(4, 5, 2600000, 1600000, 2),
(5, 6, 2800000, 1800000, 1),
(6, 7, 2500000, 2500000, 1),
(7, 8, 2900000, 1900000, 1),
(8, 9, 2700000, 1700000, 2),
(9, 10, 2400000, 1400000, 1),
(10, 10, 2400000, 1400000, 1);

--
-- Triggers `bookingdetail`
--
DELIMITER $$
CREATE TRIGGER `trg_UpdateBookingTotalCost_Insert` AFTER INSERT ON `bookingdetail` FOR EACH ROW BEGIN
    -- Calculate the total cost from BookingDetails
    SET @book_id_int = NEW.book_id;
    -- Calculate the total cost and update the book_total_cost column in the Booking table
    UPDATE Booking
    SET book_cost_after = (
        SELECT SUM(bd.book_room_cost_after * bd.book_num_room)
        FROM BookingDetail bd
        WHERE bd.book_id = @book_id_int
    ),  book_cost_before = (
        SELECT SUM(bd.book_room_cost_before * bd.book_num_room)
        FROM BookingDetail bd
        WHERE bd.book_id = @book_id_int
    )
    WHERE book_id = @book_id_int;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_UpdateBookingTotalCost_Update` AFTER UPDATE ON `bookingdetail` FOR EACH ROW BEGIN
    -- Calculate the total cost from BookingDetails
    SET @book_id_int = NEW.book_id;
    -- Calculate the total cost and update the book_total_cost column in the Booking table
    UPDATE Booking
    SET book_cost_after = (
        SELECT SUM(bd.book_room_cost_after * bd.book_num_room)
        FROM BookingDetail bd
        WHERE bd.book_id = @book_id_int
    ),  book_cost_before = (
        SELECT SUM(bd.book_room_cost_before * bd.book_num_room)
        FROM BookingDetail bd
        WHERE bd.book_id = @book_id_int
    )
    WHERE book_id = @book_id_int;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city_url` varchar(50) DEFAULT NULL,
  `prov_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`, `city_url`, `prov_id`) VALUES
(1, 'Thành phố Hồ Chí Minh', NULL, 1),
(2, 'Thành phố Đà Nẵng', NULL, 3),
(3, 'Thành phố Hải Phòng', NULL, 4),
(4, 'Thành phố Cần Thơ', NULL, 5),
(5, 'Thành phố Vũng Tàu', NULL, 6);

-- --------------------------------------------------------

--
-- Table structure for table `debitcard`
--

CREATE TABLE `debitcard` (
  `debit_id` int(11) NOT NULL,
  `debit_num` varchar(16) NOT NULL,
  `debit_end_date` datetime NOT NULL,
  `debit_CCV` varchar(10) NOT NULL,
  `debit_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `debit_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `debit_postal` varchar(10) NOT NULL,
  `au_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `debitcard`
--

INSERT INTO `debitcard` (`debit_id`, `debit_num`, `debit_end_date`, `debit_CCV`, `debit_name`, `debit_address`, `debit_postal`, `au_user_id`) VALUES
(1, '1111222233334444', '2023-12-31 23:59:59', '123', 'John Doe', '123 Main Street', '12345', 1),
(2, '9999111111112222', '2025-03-31 23:59:59', '789', 'Mike Johnson', '789 Oak Street', '54321', 3),
(3, '9999888811112222', '2025-03-31 23:59:59', '789', 'Mike Johnson', '789 Oak Street', '54321', 3);

-- --------------------------------------------------------

--
-- Table structure for table `extension`
--

CREATE TABLE `extension` (
  `exte_id` int(11) NOT NULL,
  `exte_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `extension`
--

INSERT INTO `extension` (`exte_id`, `exte_name`) VALUES
(1, 'Buffet sáng'),
(4, 'Thú cưng'),
(3, 'Thuốc lá'),
(2, 'Wifi');

-- --------------------------------------------------------

--
-- Table structure for table `feature`
--

CREATE TABLE `feature` (
  `fea_id` int(11) NOT NULL,
  `fea_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feature`
--

INSERT INTO `feature` (`fea_id`, `fea_name`) VALUES
(3, 'Giáp biển'),
(2, 'Không cần thanh toán trước'),
(1, 'Miễn phí hủy');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `noti_id` int(11) NOT NULL,
  `noti_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `noti_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `noti_subtitle` text DEFAULT NULL,
  `noti_datetime` datetime DEFAULT NULL,
  `noti_content` text NOT NULL,
  `noti_dest_url` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`noti_id`, `noti_type`, `noti_title`, `noti_subtitle`, `noti_datetime`, `noti_content`, `noti_dest_url`) VALUES
(1, 'Type 1', 'CẬP NHẬT MẬT KHẨU', 'Bạn vừa cập nhật mật khẩu thành công. Hãy đảm bảo rằng hành động này được thực hiện bởi bạn.', '2023-10-27 10:30:00', 'Content of Notification 1', NULL),
(2, 'Type 2', 'HÈ THẢ GA CÙNG 2WAYS', 'Tận hưởng mùa hè sôi động của bạn với những ưu đãi lớn nhất từ 2WAYS Vũng Tàu, đặt phòng ngay!!!', '2023-10-28 14:45:00', 'Content of Notification 2', NULL),
(3, 'Type 1', 'CẬP NHẬT MẬT KHẨU', 'Bạn vừa cập nhật mật khẩu thành công. Hãy đảm bảo rằng hành động này được thực hiện bởi bạn.', '2023-10-29 09:15:00', 'Content of Notification 3', NULL),
(4, 'Type 2', 'HÈ THẢ GA CÙNG 2WAYS', 'Tận hưởng mùa hè sôi động của bạn với những ưu đãi lớn nhất từ 2WAYS Vũng Tàu, đặt phòng ngay!!!', '2023-10-30 12:00:00', 'Content of Notification 4', NULL),
(5, 'Type 2', 'HÈ THẢ GA CÙNG 2WAYS', NULL, '2023-10-31 16:30:00', 'Content of Notification 5', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payingmethod`
--

CREATE TABLE `payingmethod` (
  `pay_id` int(11) NOT NULL,
  `pay_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payingmethod`
--

INSERT INTO `payingmethod` (`pay_id`, `pay_name`) VALUES
(2, 'bankcard'),
(1, 'cash'),
(3, 'debitcard');

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `prov_id` int(11) NOT NULL,
  `prov_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prov_url` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`prov_id`, `prov_name`, `prov_url`) VALUES
(1, 'Hồ Chí Minh', 'Ho+Chi+Minh+City'),
(2, 'Hà Nội', 'Hanoi'),
(3, 'Đà Nẵng', 'Da+Nang'),
(4, 'Hải Phòng', 'Haiphong'),
(5, 'Cần Thơ', 'Can+Tho'),
(6, 'Bà Rịu - Vũng Tàu', 'Ba+Ria+-+Vung+Tau');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `au_user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `rating_datetime` datetime NOT NULL,
  `rating_context` text DEFAULT NULL,
  `rating_point` decimal(10,1) NOT NULL,
  `rating_show` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`au_user_id`, `room_id`, `rating_datetime`, `rating_context`, `rating_point`, `rating_show`) VALUES
(1, 1, '2023-10-27 14:30:00', 'The room was clean and comfortable.', 9.5, 0),
(1, 1, '2023-10-28 14:30:00', 'The room was clean and comfortable.', 9.5, 0),
(1, 1, '2023-10-29 14:30:00', 'The room was clean and comfortable.', 9.0, 0),
(1, 1, '2023-10-30 14:30:00', 'The room was clean and comfortable.', 9.0, 0),
(1, 1, '2023-10-31 14:30:00', 'The room was clean and comfortable.', 9.0, 0),
(1, 4, '2023-10-30 16:15:00', 'The staff was friendly and helpful.', 8.5, 0),
(2, 2, '2023-10-28 11:00:00', 'Great service and amenities.', 9.0, 0),
(2, 2, '2023-10-29 11:00:00', 'Great service and amenities.', 9.0, 0),
(2, 2, '2023-10-30 11:00:00', 'Great service and amenities.', 8.5, 0),
(2, 2, '2023-10-31 11:00:00', 'Great service and amenities.', 8.5, 0),
(2, 5, '2023-10-31 13:30:00', 'The room was spacious and well-maintained.', 9.0, 0),
(3, 3, '2023-10-29 09:45:00', 'The room had a nice view.', 9.0, 0);

--
-- Triggers `rating`
--
DELIMITER $$
CREATE TRIGGER `trg_RoomAvgRating_Insert` AFTER INSERT ON `rating` FOR EACH ROW BEGIN
    DECLARE total_points FLOAT;
    DECLARE total_ratings INT;
    -- Calculate total rating points and quantity for the specific room_id
    SELECT SUM(rating_point), COUNT(*) 
    INTO total_points, total_ratings
    FROM Rating
    WHERE room_id = NEW.room_id;
    -- Update avg_rating in RoomType table
    UPDATE RoomType
    SET room_avg_rating = IF(total_ratings > 0, total_points / total_ratings, 0)
    WHERE room_id = NEW.room_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_RoomCountRating_Insert` AFTER INSERT ON `rating` FOR EACH ROW BEGIN
    DECLARE room_id_int INT;
    DECLARE count_ratings INT;
    SELECT NEW.room_id, COUNT(*)
    INTO room_id_int, count_ratings
    FROM Rating
    WHERE room_id = NEW.room_id
    GROUP BY room_id;
    UPDATE RoomType
    SET room_count_rating = count_ratings
    WHERE room_id = room_id_int;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `reasoncancel`
--

CREATE TABLE `reasoncancel` (
  `rea_id` int(11) NOT NULL,
  `rea_description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reasoncancel`
--

INSERT INTO `reasoncancel` (`rea_id`, `rea_description`) VALUES
(2, 'Chỗ nghỉ yêu cầu hủy'),
(6, 'Không phải lý do trên'),
(5, 'Lý do cá nhân/chuyến đi bị hủy'),
(3, 'Số lượng hoặc nhu cầu của tôi thay đổi'),
(1, 'Tôi đã tìm được lựa chọn chỗ nghỉ thay thế'),
(4, 'Đổi ngày hoặc điểm đến');

-- --------------------------------------------------------

--
-- Table structure for table `roomexte`
--

CREATE TABLE `roomexte` (
  `room_id` int(11) NOT NULL,
  `exte_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roomexte`
--

INSERT INTO `roomexte` (`room_id`, `exte_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 3),
(4, 2),
(5, 1),
(5, 2),
(6, 3),
(7, 1),
(8, 2),
(9, 2),
(10, 2),
(10, 3),
(10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `roomtype`
--

CREATE TABLE `roomtype` (
  `room_id` int(11) NOT NULL,
  `room_class` varchar(50) NOT NULL,
  `room_type` varchar(10) NOT NULL,
  `room_max_adult` int(11) NOT NULL,
  `room_max_child` int(11) NOT NULL,
  `room_single_bed` int(11) NOT NULL,
  `room_double_bed` int(11) NOT NULL,
  `room_total` int(11) NOT NULL,
  `room_details_img_url` varchar(50) DEFAULT NULL,
  `room_area` decimal(10,2) DEFAULT NULL,
  `room_cost` decimal(10,2) NOT NULL,
  `room_discount` decimal(10,2) DEFAULT NULL,
  `room_date_end_discount` date DEFAULT NULL,
  `room_avg_rating` float DEFAULT 0,
  `room_count_rating` int(11) DEFAULT 0,
  `acco_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roomtype`
--

INSERT INTO `roomtype` (`room_id`, `room_class`, `room_type`, `room_max_adult`, `room_max_child`, `room_single_bed`, `room_double_bed`, `room_total`, `room_details_img_url`, `room_area`, `room_cost`, `room_discount`, `room_date_end_discount`, `room_avg_rating`, `room_count_rating`, `acco_id`) VALUES
(1, 'Standard', 'Single', 1, 0, 1, 0, 10, 'room_1.jpg', 25.50, 1000000.00, NULL, NULL, 9.2, 5, 1),
(2, 'Deluxe', 'Double', 2, 1, 0, 1, 5, 'room_2.jpg', 35.00, 2000000.00, 0.10, '2023-01-31', 8.75, 4, 1),
(3, 'Suite', 'Family', 2, 2, 1, 2, 3, 'room_1.jpg', 45.20, 3000000.00, NULL, NULL, 9, 1, 2),
(4, 'Standard', 'Single', 1, 0, 1, 0, 8, 'room_6.jpg', 30.00, 1200000.00, 0.05, '2023-02-28', 8.5, 1, 3),
(5, 'Superior', 'Double', 2, 1, 0, 1, 6, 'room_3.jpg', 28.50, 1800000.00, NULL, NULL, 9, 1, 4),
(6, 'Suite', 'Family', 2, 2, 1, 2, 4, 'room_7.jpg', 50.00, 3500000.00, 0.15, '2023-03-31', 0, 0, 3),
(7, 'Standard', 'Single', 1, 0, 1, 0, 12, 'room_4.jpg', 32.00, 1500000.00, NULL, NULL, 0, 0, 2),
(8, 'Deluxe', 'Double', 2, 1, 0, 1, 7, 'room_1.jpg', 38.00, 2200000.00, 0.20, '2023-04-30', 0, 0, 1),
(9, 'Suite', 'Family', 2, 2, 1, 2, 5, 'room_3.jpg', 48.70, 3200000.00, NULL, NULL, 0, 0, 2),
(10, 'Standard', 'Single', 1, 0, 1, 0, 9, 'room_2.jpg', 29.80, 1100000.00, 0.10, '2023-05-31', 0, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `roomtypeimg`
--

CREATE TABLE `roomtypeimg` (
  `room_id` int(11) NOT NULL,
  `room_type_image_url` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roomtypeimg`
--

INSERT INTO `roomtypeimg` (`room_id`, `room_type_image_url`) VALUES
(1, 'room_1.jpg'),
(1, 'room_2.jpg'),
(1, 'room_3.jpg'),
(1, 'room_4.jpg'),
(2, 'room_1.jpg'),
(2, 'room_2.jpg'),
(2, 'room_3.jpg'),
(2, 'room_4.jpg'),
(3, 'room_1.jpg'),
(3, 'room_2.jpg'),
(3, 'room_3.jpg'),
(3, 'room_4.jpg'),
(4, 'room_1.jpg'),
(4, 'room_2.jpg'),
(4, 'room_3.jpg'),
(4, 'room_4.jpg'),
(5, 'room_1.jpg'),
(5, 'room_2.jpg'),
(5, 'room_3.jpg'),
(5, 'room_4.jpg'),
(6, 'room_1.jpg'),
(6, 'room_2.jpg'),
(6, 'room_3.jpg'),
(6, 'room_4.jpg'),
(7, 'room_1.jpg'),
(7, 'room_2.jpg'),
(7, 'room_3.jpg'),
(7, 'room_4.jpg'),
(8, 'room_1.jpg'),
(8, 'room_2.jpg'),
(8, 'room_3.jpg'),
(8, 'room_4.jpg'),
(9, 'room_1.jpg'),
(9, 'room_2.jpg'),
(9, 'room_3.jpg'),
(9, 'room_4.jpg'),
(10, 'room_1.jpg'),
(10, 'room_2.jpg'),
(10, 'room_3.jpg'),
(10, 'room_4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `usernoti`
--

CREATE TABLE `usernoti` (
  `au_user_id` int(11) NOT NULL,
  `noti_id` int(11) NOT NULL,
  `usernoti_is_read` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usernoti`
--

INSERT INTO `usernoti` (`au_user_id`, `noti_id`, `usernoti_is_read`) VALUES
(1, 1, 1),
(1, 2, 0),
(2, 3, 1),
(3, 4, 0),
(3, 5, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_authuser`
-- (See below for the actual view)
--
CREATE TABLE `view_authuser` (
`au_user_first_name` varchar(50)
,`au_user_last_name` varchar(50)
,`au_user_email` varchar(50)
,`au_user_avt_url` varchar(50)
,`au_user_sex` varchar(6)
,`au_user_birthday` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_booking_history`
-- (See below for the actual view)
--
CREATE TABLE `view_booking_history` (
`acco_name` varchar(100)
,`book_id` int(11)
,`book_datetime` datetime
,`book_start_datetime` datetime
,`book_end_datetime` datetime
,`book_cost_before` float
,`book_cost_after` float
,`book_full_name` double
,`book_status` int(11)
,`book_is_paid` int(11)
,`au_user_id` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_name_fea`
-- (See below for the actual view)
--
CREATE TABLE `view_name_fea` (
`acco_id` int(11)
,`fea_name` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_room_exte`
-- (See below for the actual view)
--
CREATE TABLE `view_room_exte` (
`room_id` int(11)
,`exte_name` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_room_rating`
-- (See below for the actual view)
--
CREATE TABLE `view_room_rating` (
`au_user_id` int(11)
,`room_id` int(11)
,`rating_datetime` datetime
,`rating_context` text
,`rating_point` decimal(10,1)
,`rating_show` int(11)
,`acco_id` int(11)
,`au_user_full_name` double
);

-- --------------------------------------------------------

--
-- Structure for view `view_authuser`
--
DROP TABLE IF EXISTS `view_authuser`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_authuser`  AS SELECT `authuser`.`au_user_first_name` AS `au_user_first_name`, `authuser`.`au_user_last_name` AS `au_user_last_name`, `authuser`.`au_user_email` AS `au_user_email`, `authuser`.`au_user_avt_url` AS `au_user_avt_url`, `authuser`.`au_user_sex` AS `au_user_sex`, `authuser`.`au_user_birthday` AS `au_user_birthday` FROM `authuser` ;

-- --------------------------------------------------------

--
-- Structure for view `view_booking_history`
--
DROP TABLE IF EXISTS `view_booking_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_booking_history`  AS SELECT `accommodation`.`acco_name` AS `acco_name`, `booking`.`book_id` AS `book_id`, `booking`.`book_datetime` AS `book_datetime`, `booking`.`book_start_datetime` AS `book_start_datetime`, `booking`.`book_end_datetime` AS `book_end_datetime`, `booking`.`book_cost_before` AS `book_cost_before`, `booking`.`book_cost_after` AS `book_cost_after`, `booking`.`book_first_name`+ ' ' + `booking`.`book_last_name` AS `book_full_name`, `booking`.`book_status` AS `book_status`, `booking`.`book_is_paid` AS `book_is_paid`, `booking`.`au_user_id` AS `au_user_id` FROM (`accommodation` join `booking`) WHERE `accommodation`.`acco_id` = `booking`.`acco_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_name_fea`
--
DROP TABLE IF EXISTS `view_name_fea`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_name_fea`  AS SELECT `accommodation`.`acco_id` AS `acco_id`, `feature`.`fea_name` AS `fea_name` FROM ((`accommodation` join `feature`) join `accofea`) WHERE `accommodation`.`acco_id` = `accofea`.`acco_id` AND `accofea`.`fea_id` = `feature`.`fea_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_room_exte`
--
DROP TABLE IF EXISTS `view_room_exte`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_room_exte`  AS SELECT `roomtype`.`room_id` AS `room_id`, `extension`.`exte_name` AS `exte_name` FROM ((`roomtype` join `extension`) join `roomexte`) WHERE `roomtype`.`room_id` = `roomexte`.`room_id` AND `roomexte`.`exte_id` = `extension`.`exte_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_room_rating`
--
DROP TABLE IF EXISTS `view_room_rating`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_room_rating`  AS SELECT `rating`.`au_user_id` AS `au_user_id`, `rating`.`room_id` AS `room_id`, `rating`.`rating_datetime` AS `rating_datetime`, `rating`.`rating_context` AS `rating_context`, `rating`.`rating_point` AS `rating_point`, `rating`.`rating_show` AS `rating_show`, `roomtype`.`acco_id` AS `acco_id`, `authuser`.`au_user_first_name`+ ' ' + `authuser`.`au_user_last_name` AS `au_user_full_name` FROM ((`roomtype` join `rating`) join `authuser`) WHERE `roomtype`.`room_id` = `rating`.`room_id` AND `authuser`.`au_user_id` = `rating`.`au_user_id` AND `rating`.`rating_show` = 1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accofea`
--
ALTER TABLE `accofea`
  ADD PRIMARY KEY (`fea_id`,`acco_id`),
  ADD KEY `acco_id` (`acco_id`);

--
-- Indexes for table `accoimg`
--
ALTER TABLE `accoimg`
  ADD PRIMARY KEY (`acco_id`,`acco_img_url`);

--
-- Indexes for table `accommodation`
--
ALTER TABLE `accommodation`
  ADD PRIMARY KEY (`acco_id`),
  ADD UNIQUE KEY `acco_id` (`acco_id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `prov_id` (`prov_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_id` (`admin_id`),
  ADD UNIQUE KEY `admin_nickname` (`admin_nickname`);

--
-- Indexes for table `authuser`
--
ALTER TABLE `authuser`
  ADD PRIMARY KEY (`au_user_id`),
  ADD UNIQUE KEY `au_user_id` (`au_user_id`),
  ADD UNIQUE KEY `au_user_email` (`au_user_email`),
  ADD KEY `FK_bank_id` (`bank_default_id`),
  ADD KEY `FK_debit_id` (`debit_default_id`);

--
-- Indexes for table `bankcard`
--
ALTER TABLE `bankcard`
  ADD PRIMARY KEY (`bank_id`),
  ADD UNIQUE KEY `bank_id` (`bank_id`),
  ADD KEY `au_user_id` (`au_user_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `book_id` (`book_id`),
  ADD KEY `pay_id` (`pay_id`),
  ADD KEY `rea_id` (`rea_id`),
  ADD KEY `au_user_id` (`au_user_id`),
  ADD KEY `acco_id` (`acco_id`);

--
-- Indexes for table `bookingdetail`
--
ALTER TABLE `bookingdetail`
  ADD PRIMARY KEY (`book_id`,`room_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`),
  ADD UNIQUE KEY `city_id` (`city_id`),
  ADD UNIQUE KEY `city_name` (`city_name`),
  ADD KEY `prov_id` (`prov_id`);

--
-- Indexes for table `debitcard`
--
ALTER TABLE `debitcard`
  ADD PRIMARY KEY (`debit_id`),
  ADD UNIQUE KEY `debit_id` (`debit_id`),
  ADD KEY `au_user_id` (`au_user_id`);

--
-- Indexes for table `extension`
--
ALTER TABLE `extension`
  ADD PRIMARY KEY (`exte_id`),
  ADD UNIQUE KEY `exte_id` (`exte_id`),
  ADD UNIQUE KEY `exte_name` (`exte_name`);

--
-- Indexes for table `feature`
--
ALTER TABLE `feature`
  ADD PRIMARY KEY (`fea_id`),
  ADD UNIQUE KEY `fea_id` (`fea_id`),
  ADD UNIQUE KEY `fea_name` (`fea_name`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`noti_id`),
  ADD UNIQUE KEY `noti_id` (`noti_id`);

--
-- Indexes for table `payingmethod`
--
ALTER TABLE `payingmethod`
  ADD PRIMARY KEY (`pay_id`),
  ADD UNIQUE KEY `pay_id` (`pay_id`),
  ADD UNIQUE KEY `pay_name` (`pay_name`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`prov_id`),
  ADD UNIQUE KEY `prov_id` (`prov_id`),
  ADD UNIQUE KEY `prov_name` (`prov_name`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`au_user_id`,`room_id`,`rating_datetime`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `reasoncancel`
--
ALTER TABLE `reasoncancel`
  ADD PRIMARY KEY (`rea_id`),
  ADD UNIQUE KEY `rea_id` (`rea_id`),
  ADD UNIQUE KEY `rea_description` (`rea_description`);

--
-- Indexes for table `roomexte`
--
ALTER TABLE `roomexte`
  ADD PRIMARY KEY (`room_id`,`exte_id`),
  ADD KEY `exte_id` (`exte_id`);

--
-- Indexes for table `roomtype`
--
ALTER TABLE `roomtype`
  ADD PRIMARY KEY (`room_id`),
  ADD UNIQUE KEY `room_id` (`room_id`),
  ADD KEY `acco_id` (`acco_id`);

--
-- Indexes for table `roomtypeimg`
--
ALTER TABLE `roomtypeimg`
  ADD PRIMARY KEY (`room_id`,`room_type_image_url`);

--
-- Indexes for table `usernoti`
--
ALTER TABLE `usernoti`
  ADD PRIMARY KEY (`au_user_id`,`noti_id`),
  ADD KEY `noti_id` (`noti_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accommodation`
--
ALTER TABLE `accommodation`
  MODIFY `acco_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `authuser`
--
ALTER TABLE `authuser`
  MODIFY `au_user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bankcard`
--
ALTER TABLE `bankcard`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `debitcard`
--
ALTER TABLE `debitcard`
  MODIFY `debit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `extension`
--
ALTER TABLE `extension`
  MODIFY `exte_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `feature`
--
ALTER TABLE `feature`
  MODIFY `fea_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `noti_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payingmethod`
--
ALTER TABLE `payingmethod`
  MODIFY `pay_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `prov_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reasoncancel`
--
ALTER TABLE `reasoncancel`
  MODIFY `rea_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roomtype`
--
ALTER TABLE `roomtype`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accofea`
--
ALTER TABLE `accofea`
  ADD CONSTRAINT `accofea_ibfk_1` FOREIGN KEY (`fea_id`) REFERENCES `feature` (`fea_id`),
  ADD CONSTRAINT `accofea_ibfk_2` FOREIGN KEY (`acco_id`) REFERENCES `accommodation` (`acco_id`);

--
-- Constraints for table `accoimg`
--
ALTER TABLE `accoimg`
  ADD CONSTRAINT `accoimg_ibfk_1` FOREIGN KEY (`acco_id`) REFERENCES `accommodation` (`acco_id`);

--
-- Constraints for table `accommodation`
--
ALTER TABLE `accommodation`
  ADD CONSTRAINT `accommodation_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`),
  ADD CONSTRAINT `accommodation_ibfk_2` FOREIGN KEY (`prov_id`) REFERENCES `province` (`prov_id`);

--
-- Constraints for table `authuser`
--
ALTER TABLE `authuser`
  ADD CONSTRAINT `FK_bank_id` FOREIGN KEY (`bank_default_id`) REFERENCES `bankcard` (`bank_id`),
  ADD CONSTRAINT `FK_debit_id` FOREIGN KEY (`debit_default_id`) REFERENCES `debitcard` (`debit_id`);

--
-- Constraints for table `bankcard`
--
ALTER TABLE `bankcard`
  ADD CONSTRAINT `bankcard_ibfk_1` FOREIGN KEY (`au_user_id`) REFERENCES `authuser` (`au_user_id`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`pay_id`) REFERENCES `payingmethod` (`pay_id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`rea_id`) REFERENCES `reasoncancel` (`rea_id`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`au_user_id`) REFERENCES `authuser` (`au_user_id`),
  ADD CONSTRAINT `booking_ibfk_4` FOREIGN KEY (`acco_id`) REFERENCES `accommodation` (`acco_id`);

--
-- Constraints for table `bookingdetail`
--
ALTER TABLE `bookingdetail`
  ADD CONSTRAINT `bookingdetail_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `booking` (`book_id`),
  ADD CONSTRAINT `bookingdetail_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `roomtype` (`room_id`);

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`prov_id`) REFERENCES `province` (`prov_id`);

--
-- Constraints for table `debitcard`
--
ALTER TABLE `debitcard`
  ADD CONSTRAINT `debitcard_ibfk_1` FOREIGN KEY (`au_user_id`) REFERENCES `authuser` (`au_user_id`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`au_user_id`) REFERENCES `authuser` (`au_user_id`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `roomtype` (`room_id`);

--
-- Constraints for table `roomexte`
--
ALTER TABLE `roomexte`
  ADD CONSTRAINT `roomexte_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `roomtype` (`room_id`),
  ADD CONSTRAINT `roomexte_ibfk_2` FOREIGN KEY (`exte_id`) REFERENCES `extension` (`exte_id`);

--
-- Constraints for table `roomtype`
--
ALTER TABLE `roomtype`
  ADD CONSTRAINT `roomtype_ibfk_1` FOREIGN KEY (`acco_id`) REFERENCES `accommodation` (`acco_id`);

--
-- Constraints for table `roomtypeimg`
--
ALTER TABLE `roomtypeimg`
  ADD CONSTRAINT `roomtypeimg_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `roomtype` (`room_id`);

--
-- Constraints for table `usernoti`
--
ALTER TABLE `usernoti`
  ADD CONSTRAINT `usernoti_ibfk_1` FOREIGN KEY (`au_user_id`) REFERENCES `authuser` (`au_user_id`),
  ADD CONSTRAINT `usernoti_ibfk_2` FOREIGN KEY (`noti_id`) REFERENCES `notification` (`noti_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
