-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2023 at 01:08 PM
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
-- Database: `ie104_group2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_login_name` varchar(100) NOT NULL,
  `admin_password` varchar(100) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_full_name` varchar(100) NOT NULL,
  `admin_avt_img` varchar(100) DEFAULT NULL,
  `admin_birth` date NOT NULL,
  `admin_sex` tinyint(1) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_phone` varchar(10) NOT NULL,
  `admin_address` text DEFAULT NULL,
  `admin_role` varchar(100) DEFAULT 'Owner',
  `admin_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_login_name`, `admin_password`, `admin_name`, `admin_full_name`, `admin_avt_img`, `admin_birth`, `admin_sex`, `admin_email`, `admin_phone`, `admin_address`, `admin_role`, `admin_active`) VALUES
(1, '21522436', '$2a$08$gacaZP8P7lcQeHoiW9fgkOr47/Y0vHv3HOixU1rELCc6rkv0oDw9K', 'Nhung', 'Nguyễn Thị Hồng Nhung', 'admin_1.jpg', '2003-04-02', 1, '21522436@gmail.techtwo.vn', '0987296708', 'Ký túc xá khu A: Đường Tạ Quang Bửu, Khu phố 6, Phường Linh Trung, Thành phố Thủ Đức, Thành phố Hồ Chí Minh', 'Owner', 1);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `customer_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `cart_quantity` int(11) NOT NULL,
  `cart_added_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`customer_id`, `product_variant_id`, `cart_quantity`, `cart_added_date`) VALUES
(1, 15, 1, '2023-12-18 18:46:34'),
(1, 40, 1, '2023-12-18 18:47:38'),
(1, 52, 1, '2023-12-18 18:14:08'),
(1, 58, 1, '2023-12-18 18:25:08'),
(1, 62, 1, '2023-12-18 18:14:02'),
(1, 72, 1, '2023-12-18 18:25:16'),
(3, 3, 3, '2023-11-01 04:40:58'),
(4, 32, 3, '2023-11-26 19:45:13'),
(5, 22, 2, '2023-11-26 19:45:13'),
(5, 31, 2, '2023-11-26 19:45:13'),
(6, 4, 2, '2023-11-26 19:45:13'),
(6, 19, 2, '2023-11-26 19:45:13'),
(7, 7, 1, '2023-11-26 19:45:13'),
(8, 3, 10, '2023-11-26 19:45:13'),
(8, 24, 3, '2023-11-26 19:45:13'),
(10, 11, 5, '2023-11-26 19:45:13'),
(10, 28, 1, '2023-11-26 19:45:13'),
(13, 34, 1, '2023-12-15 14:16:52');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_img` varchar(100) NOT NULL,
  `categorry_type` varchar(50) NOT NULL DEFAULT 'Điện máy',
  `category_added_date` date NOT NULL DEFAULT current_timestamp(),
  `category_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_img`, `categorry_type`, `category_added_date`, `category_is_display`) VALUES
(1, 'Máy lạnh', 'may_lanh.png', 'Điện máy', '2023-11-17', 1),
(2, 'Máy giặt', 'may_giat.png', 'Điện máy', '2023-11-17', 1),
(3, 'Tivi', 'tivi.png', 'Điện tử', '2023-11-17', 1),
(4, 'Điện thoại', 'dien_thoai.png', 'Điện tử', '2023-11-17', 1),
(5, 'Laptop, Máy tính', 'laptop.png', 'Điện tử', '2023-11-17', 1),
(6, 'Tablet, Máy tính bảng', 'tablet.png', 'Điện tử', '2023-11-17', 1),
(7, 'Tủ lạnh', 'tu_lanh.png', 'Điện máy', '2023-11-17', 1),
(8, 'Nồi cơm', 'noi_com.png', 'Đồ dùng nhà bếp', '2023-11-17', 1),
(9, 'Nồi chiên', 'noi_chien.png', 'Đồ dùng nhà bếp', '2023-11-17', 1),
(10, 'Bếp điện', 'bep_dien.png', 'Đồ dùng nhà bếp', '2023-11-17', 1),
(11, 'Máy sấy', 'may_say.png', 'Gia dụng', '2023-11-17', 1),
(12, 'Máy lọc nước', 'may_loc_nuoc.png', 'Gia dụng', '2023-11-17', 1),
(13, 'Quạt điều hòa', 'quat_dieu_hoa.png', 'Gia dụng', '2023-11-17', 1),
(14, 'Quạt', 'quat.png', 'Gia dụng', '2023-11-17', 1),
(15, 'Tủ đông', 'tu_dong.png', 'Điện máy', '2023-11-17', 1),
(16, 'Máy nước nóng', 'may_nuoc_nong.png', 'Điện máy', '2023-11-17', 1),
(17, 'Máy lọc không khí', 'may_loc_khong_khi.png', 'Gia dụng', '2023-11-17', 1),
(18, 'Bếp hồng ngoại', 'bep_hong_ngoai.png', 'Đồ dùng nhà bếp', '2023-11-17', 1),
(19, 'Bếp từ', 'bep_tu.png', 'Đồ dùng nhà bếp', '2023-11-17', 1),
(20, 'Bếp ga', 'bep_ga.png', 'Đồ dùng nhà bếp', '2023-11-17', 1),
(21, 'Bình đun siêu tốc', 'binh_dun_sieu_toc.png', 'Đồ dùng nhà bếp', '2023-11-17', 1),
(22, 'Máy xay sinh tố', 'may_xay_sinh_to.png', 'Đồ dùng nhà bếp', '2023-11-17', 1),
(23, 'Máy ép trái cây', 'may_ep_trai_cay.png', 'Đồ dùng nhà bếp', '2023-11-17', 1),
(24, 'Máy in', 'may_in.png', 'Điện máy', '2023-11-17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `user_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 31),
(12, 32),
(13, 33);

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `discount_id` int(11) NOT NULL,
  `discount_name` varchar(100) NOT NULL,
  `discount_description` text DEFAULT NULL,
  `discount_start_date` date NOT NULL DEFAULT current_timestamp(),
  `discount_end_date` date NOT NULL DEFAULT current_timestamp(),
  `discount_amount` float NOT NULL,
  `discount_is_display` tinyint(1) NOT NULL DEFAULT 1,
  `discount_img` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`discount_id`, `discount_name`, `discount_description`, `discount_start_date`, `discount_end_date`, `discount_amount`, `discount_is_display`, `discount_img`) VALUES
(1, 'Black Friday', 'Chương trình giảm giá Black Friday', '2023-11-23', '2023-11-30', 10, 1, ''),
(2, 'Vui Tết', 'Chương trình giảm giá dịp Tết', '2024-01-01', '2024-03-01', 15, 1, ''),
(3, 'Vui Trung Thu', 'Chương trình giảm giá dịp Trung Thu', '2023-09-25', '2023-09-30', 20, 1, ''),
(4, 'Back to school', 'Chương trình giảm giá cho học sinh, sinh viên back to school', '2023-11-01', '2024-11-30', 12.5, 1, ''),
(5, 'Kỷ niệm 5 năm thành lập', 'Chương trình giảm giá kỷ niệm 5 năm thành lập của TechTwo', '2023-11-01', '2024-02-29', 10, 1, ''),
(6, '05/05', 'Chương trình giảm giá ngày đôi 05/05', '2023-05-01', '2023-05-31', 18, 1, ''),
(7, '06/06', 'Chương trình giảm giá ngày đôi 06/06', '2023-06-01', '2023-06-30', 15, 1, ''),
(8, '09/09', 'Chương trình giảm giá ngày đôi 09/09', '2023-09-01', '2023-09-30', 10, 1, ''),
(9, '10/10', 'Chương trình giảm giá ngày đôi 10/10', '2023-10-01', '2023-12-31', 12, 1, ''),
(10, '11/11', 'Chương trình giảm giá ngày đôi 11/11', '2023-11-01', '2023-12-31', 10, 1, ''),
(11, '12/12', 'Chương trình giảm giá ngày đôi 12/12', '2023-11-30', '2023-12-13', 12, 1, ''),
(12, '1/1', 'Chương trình giảm giá ngày đôi 1/1', '2023-12-27', '2024-01-02', 11, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `feedback_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `feedback_date` date NOT NULL DEFAULT current_timestamp(),
  `feedback_rate` int(11) NOT NULL DEFAULT 5,
  `feedback_content` text DEFAULT 'Bạn chưa để lại lời nhận xét nào',
  `feedback_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `feedbacks`
--

INSERT INTO `feedbacks` (`feedback_id`, `product_variant_id`, `customer_id`, `order_id`, `feedback_date`, `feedback_rate`, `feedback_content`, `feedback_is_display`) VALUES
(1, 1, 1, 1, '2023-11-02', 5, 'Sản phẩm rất tốt, chất lượng cao.', 1),
(2, 11, 2, 2, '2023-11-02', 4, 'Sản phẩm tốt, nhưng thời gian giao hàng hơi lâu.', 1),
(3, 12, 3, 3, '2023-11-02', 3, 'Sản phẩm bình thường, không quá xuất sắc.', 1),
(5, 4, 5, 5, '2023-11-05', 5, 'Sản phẩm quá tuyệt vời, không có chỗ nào để chê, shop xứng đáng 10 điểm không có nhưng', 1),
(6, 5, 6, 6, '2023-11-07', 4, 'Sản phẩm nhìn chung là tốt tuy nhiên chưa đáp ứng hoàn tòa yêu cầu của tôi', 1),
(7, 4, 7, 7, '2023-11-22', 5, 'Máy lạnh bao mát, bao khỏe, quá phù hợp cho mùa nóng nực, cho shop 10 điểm', 1),
(8, 9, 8, 8, '2023-11-21', 5, 'Máy giặt êm, nhanh, giao hàng sớm hơn dự kiến, nhân viên lắp đặt thân thiện, nhiệt tình', 1),
(9, 12, 8, 9, '2023-11-19', 5, 'Tivi quá xá bự, màn hình đẹp tuyệt vời, nhân viên lắp đặt nhiệt tình', 1),
(10, 24, 8, 10, '2023-11-18', 5, 'Máy tính bảng chạy mượt, màu đẹp, hàng nguyên seal, nhân viên giao hàng vui tính', 1),
(11, 16, 9, 11, '2023-11-26', 4, 'Điện thoại này đẹp lắm, camera xịn xò, nhân viên giao hàng quá trời dễ thương luôn', 1),
(12, 11, 9, 12, '2023-11-19', 5, 'Tivi màn hình to xem bóng đá quá đã lun, nhân viên lắp đặt nhiệt tình, thân thiện', 1),
(13, 10, 10, 13, '2023-11-25', 4, 'Giao hàng nhanh chóng, lặp đặt tận tình, giá quá  ổn so với mấy chỗ khác', 1),
(14, 22, 10, 14, '2023-11-25', 5, 'Máy tính bảng bao đẹp, giao hành nhanh quá trời, lại còn được khuyến mãi, shop 10 điểm', 1),
(500, 2, 5, 8, '2023-12-04', 4, 'Sản phẩm tuyệt vời	 tôi rất hài lòng!', 1),
(501, 14, 2, 3, '2023-12-04', 4, 'Không tệ	 nhưng cần cải thiện một chút.', 1),
(502, 57, 9, 10, '2023-12-04', 5, 'Quá trình mua hàng diễn ra suôn sẻ và sản phẩm chất lượng cao.', 1),
(503, 36, 4, 12, '2023-12-04', 4, 'Một trải nghiệm tích cực	 nhưng có điểm nhỏ cần lưu ý.', 1),
(504, 73, 1, 6, '2023-12-04', 5, 'Dịch vụ khách hàng rất nhanh chóng và thân thiện.', 1),
(505, 5, 8, 11, '2023-12-04', 4, 'Sản phẩm đáng giá đồng tiền bát gạo!', 1),
(506, 21, 3, 7, '2023-12-04', 5, 'Hài lòng với chất lượng và giá trị sản phẩm.', 1),
(507, 46, 6, 9, '2023-12-04', 4, 'Sản phẩm có thể cải thiện thêm một số tính năng.', 1),
(508, 64, 10, 13, '2023-12-04', 4, 'Đó là một lựa chọn tốt	 tôi sẽ mua lại!', 1),
(509, 78, 7, 5, '2023-12-04', 4, 'Chất lượng đáng kinh ngạc	 tôi sẽ giới thiệu cho bạn bè!', 1),
(510, 15, 2, 4, '2023-12-04', 4, 'Nhận được đúng những gì tôi mong đợi	 không có bất kỳ vấn đề gì.', 1),
(511, 39, 4, 8, '2023-12-04', 5, 'Một sự mua sắm trực tuyến tuyệt vời!', 1),
(512, 55, 9, 12, '2023-12-04', 4, 'Sản phẩm tốt	 nhưng giao hàng hơi chậm.', 1),
(513, 68, 1, 10, '2023-12-04', 4, 'Hỗ trợ khách hàng rất chuyên nghiệp và hữu ích.', 1),
(515, 11, 7, 13, '2023-12-04', 4, 'Sản phẩm chất lượng cao với giá phải chăng.', 1),
(516, 29, 3, 11, '2023-12-04', 5, 'Một trải nghiệm mua sắm trực tuyến tuyệt vời!', 1),
(517, 43, 6, 7, '2023-12-04', 5, 'Sản phẩm đáng giá đồng tiền	 tôi rất hài lòng.', 1),
(518, 61, 10, 9, '2023-12-04', 4, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(519, 74, 1, 5, '2023-12-04', 4, 'Sản phẩm chất lượng	 đúng như mô tả.', 1),
(520, 8, 4, 2, '2023-12-04', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(521, 34, 9, 1, '2023-12-04', 5, 'Rất hài lòng với dịch vụ của bạn.', 1),
(522, 59, 2, 10, '2023-12-04', 4, 'Sản phẩm không tồi	 nhưng có thể cải thiện.', 1),
(523, 67, 7, 12, '2023-12-04', 4, 'Tôi rất hài lòng với sự chuyên nghiệp của bạn.', 1),
(525, 16, 6, 11, '2023-12-04', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(526, 41, 1, 7, '2023-12-04', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(527, 54, 5, 13, '2023-12-04', 4, 'Sản phẩm không tệ	 nhưng không phải là hoàn hảo.', 1),
(528, 69, 8, 9, '2023-12-04', 4, 'Sản phẩm đáng giá đồng tiền.', 1),
(529, 76, 10, 6, '2023-12-04', 4, 'Một trải nghiệm mua sắm tích cực.', 1),
(530, 22, 4, 5, '2023-12-04', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(531, 48, 9, 2, '2023-12-04', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(532, 63, 2, 12, '2023-12-04', 4, 'Dịch vụ giao hàng nhanh chóng và đáng tin cậy.', 1),
(533, 77, 7, 8, '2023-12-04', 4, 'Sản phẩm đúng như hình ảnh	 tôi rất hài lòng.', 1),
(534, 9, 1, 4, '2023-12-04', 5, 'Chất lượng sản phẩm vượt quá mong đợi.', 1),
(535, 35, 6, 10, '2023-12-04', 5, 'Sản phẩm đáng mua	 giá trị tốt.', 1),
(536, 52, 3, 13, '2023-12-04', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện.', 1),
(537, 70, 8, 9, '2023-12-04', 4, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(539, 13, 4, 11, '2023-12-04', 4, 'Chất lượng sản phẩm đáng giá mỗi xu.', 1),
(540, 27, 9, 5, '2023-12-04', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(541, 5, 3, 2, '2023-12-04', 4, 'Sản phẩm rất thú vị và độc đáo.', 1),
(542, 18, 6, 8, '2023-12-04', 4, 'Chưa hài lòng với dịch vụ giao hàng.', 1),
(543, 63, 9, 10, '2023-12-04', 5, 'Một trải nghiệm mua sắm tuyệt vời!', 1),
(544, 41, 2, 4, '2023-12-04', 3, 'Không hài lòng với chất lượng sản phẩm.', 1),
(545, 27, 7, 12, '2023-12-04', 5, 'Đáng giá mỗi đồng bỏ ra!', 1),
(546, 8, 5, 6, '2023-12-04', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(547, 32, 3, 11, '2023-12-04', 4, 'Chưa hài lòng với tính năng sản phẩm.', 1),
(548, 54, 10, 9, '2023-12-04', 4, 'Rất hài lòng với chất lượng dịch vụ.', 1),
(549, 69, 1, 5, '2023-12-04', 5, 'Sản phẩm đáng giá tiền.', 1),
(550, 77, 8, 7, '2023-12-04', 4, 'Sản phẩm đúng như mô tả.', 1),
(551, 15, 2, 4, '2023-12-04', 4, 'Chất lượng sản phẩm không tốt như mong đợi.', 1),
(552, 39, 4, 8, '2023-12-04', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(553, 55, 9, 12, '2023-12-04', 4, 'Giao hàng nhanh	 nhưng sản phẩm không đạt yêu cầu.', 1),
(554, 68, 1, 10, '2023-12-04', 4, 'Sản phẩm đúng như hình	 tôi rất hài lòng.', 1),
(556, 11, 7, 13, '2023-12-04', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(557, 29, 3, 11, '2023-12-04', 5, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(558, 43, 6, 7, '2023-12-04', 5, 'Sản phẩm chất lượng cao với giá trị tốt nhất.', 1),
(559, 61, 10, 9, '2023-12-04', 4, 'Sản phẩm đáng giá đồng tiền.', 1),
(560, 74, 1, 5, '2023-12-04', 4, 'Đã nhận được đúng sản phẩm mình mong đợi.', 1),
(561, 8, 4, 2, '2023-12-04', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(562, 34, 9, 1, '2023-12-04', 5, 'Rất hài lòng với dịch vụ của bạn.', 1),
(563, 59, 2, 10, '2023-12-04', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện thêm', 1),
(564, 67, 7, 12, '2023-12-04', 4, 'Tôi rất hài lòng với sự chuyên nghiệp của bạn.', 1),
(566, 16, 6, 11, '2023-12-04', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(567, 41, 1, 7, '2023-12-04', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(568, 54, 5, 13, '2023-12-04', 4, 'Sản phẩm không tệ	 nhưng không phải là hoàn hảo.', 1),
(569, 69, 8, 9, '2023-12-04', 4, 'Sản phẩm đáng giá đồng tiền.', 1),
(570, 76, 10, 6, '2023-12-04', 4, 'Một trải nghiệm mua sắm tích cực.', 1),
(571, 22, 4, 5, '2023-12-04', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(572, 48, 9, 2, '2023-12-04', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(573, 63, 2, 12, '2023-12-04', 4, 'Dịch vụ giao hàng nhanh chóng và đáng tin cậy.', 1),
(574, 77, 7, 8, '2023-12-04', 4, 'Sản phẩm đúng như hình ảnh	 tôi rất hài lòng.', 1),
(575, 9, 1, 4, '2023-12-04', 5, 'Chất lượng sản phẩm vượt quá mong đợi.', 1),
(576, 35, 6, 10, '2023-12-04', 5, 'Sản phẩm đáng mua	 giá trị tốt.', 1),
(577, 52, 3, 13, '2023-12-04', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện.', 1),
(578, 70, 8, 9, '2023-12-04', 4, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(580, 13, 4, 11, '2023-12-04', 4, 'Chất lượng sản phẩm đáng giá mỗi xu.', 1),
(581, 27, 9, 5, '2023-12-04', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(582, 5, 3, 2, '2023-12-04', 4, 'Sản phẩm rất thú vị và độc đáo.', 1),
(583, 18, 6, 8, '2023-12-04', 4, 'Chưa hài lòng với dịch vụ giao hàng.', 1),
(584, 63, 9, 10, '2023-12-04', 5, 'Một trải nghiệm mua sắm tuyệt vời!', 1),
(585, 41, 2, 4, '2023-12-04', 3, 'Không hài lòng với chất lượng sản phẩm.', 1),
(586, 27, 7, 12, '2023-12-04', 5, 'Đáng giá mỗi đồng bỏ ra!', 1),
(587, 8, 5, 6, '2023-12-04', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(588, 32, 3, 11, '2023-12-04', 4, 'Chưa hài lòng với tính năng sản phẩm.', 1),
(589, 69, 1, 5, '2023-12-04', 5, 'Sản phẩm đáng giá tiền.', 1),
(590, 77, 8, 7, '2023-12-04', 4, 'Sản phẩm đúng như mô tả.', 1),
(591, 15, 2, 4, '2023-12-04', 4, 'Chất lượng sản phẩm không tốt như mong đợi.', 1),
(592, 39, 4, 8, '2023-12-04', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(593, 55, 9, 12, '2023-12-04', 4, 'Giao hàng nhanh	 nhưng sản phẩm không đạt yêu cầu.', 1),
(594, 68, 1, 10, '2023-12-04', 4, 'Sản phẩm đúng như hình	 tôi rất hài lòng.', 1),
(596, 11, 7, 13, '2023-12-04', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(597, 29, 3, 11, '2023-12-04', 5, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(598, 43, 6, 7, '2023-12-04', 5, 'Sản phẩm chất lượng cao với giá trị tốt nhất.', 1),
(599, 61, 10, 9, '2023-12-04', 4, 'Sản phẩm đáng giá đồng tiền.', 1),
(600, 74, 1, 5, '2023-12-04', 4, 'Đã nhận được đúng sản phẩm mình mong đợi.', 1),
(601, 8, 4, 2, '2023-12-04', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(602, 34, 9, 1, '2023-12-04', 5, 'Rất hài lòng với dịch vụ của bạn.', 1),
(603, 59, 2, 10, '2023-12-04', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện một chút.', 1),
(604, 67, 7, 12, '2023-12-04', 4, 'Tôi rất hài lòng với sự chuyên nghiệp của bạn.', 1),
(606, 16, 6, 11, '2023-12-04', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(607, 41, 1, 7, '2023-12-04', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(608, 54, 5, 13, '2023-12-04', 4, 'Sản phẩm không tệ	 nhưng không phải là hoàn hảo.', 1),
(609, 69, 8, 9, '2023-12-04', 4, 'Sản phẩm đáng giá đồng tiền.', 1),
(610, 76, 10, 6, '2023-12-04', 4, 'Một trải nghiệm mua sắm tích cực.', 1),
(611, 22, 4, 5, '2023-12-04', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(612, 48, 9, 2, '2023-12-04', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(613, 63, 2, 12, '2023-12-04', 4, 'Dịch vụ giao hàng nhanh chóng và đáng tin cậy.', 1),
(614, 77, 7, 8, '2023-12-04', 4, 'Sản phẩm đúng như hình ảnh	 tôi rất hài lòng.', 1),
(615, 9, 1, 4, '2023-12-04', 5, 'Chất lượng sản phẩm vượt quá mong đợi.', 1),
(616, 35, 6, 10, '2023-12-04', 5, 'Sản phẩm đáng mua	 giá trị tốt.', 1),
(617, 52, 3, 13, '2023-12-04', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện.', 1),
(618, 70, 8, 9, '2023-12-04', 4, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(620, 1, 5, 8, '2023-12-05', 4, 'Sản phẩm tuyệt vời	 tôi rất hài lòng!', 1),
(621, 15, 2, 3, '2023-12-05', 4, 'Không tệ	 nhưng cần cải thiện một chút.', 1),
(622, 34, 9, 10, '2023-12-05', 5, 'Quá trình mua hàng diễn ra suôn sẻ và sản phẩm chất lượng cao.', 1),
(623, 33, 4, 12, '2023-12-05', 4, 'Một trải nghiệm tích cực	 nhưng có điểm nhỏ cần lưu ý.', 1),
(624, 12, 1, 6, '2023-12-05', 5, 'Dịch vụ khách hàng rất nhanh chóng và thân thiện.', 1),
(625, 51, 8, 11, '2023-12-05', 4, 'Sản phẩm đáng giá đồng tiền bát gạo!', 1),
(626, 34, 3, 7, '2023-12-05', 5, 'Hài lòng với chất lượng và giá trị sản phẩm.', 1),
(627, 23, 6, 9, '2023-12-05', 4, 'Sản phẩm có thể cải thiện thêm một số tính năng.', 1),
(628, 22, 10, 13, '2023-12-05', 4, 'Đó là một lựa chọn tốt	 tôi sẽ mua lại!', 1),
(629, 18, 7, 5, '2023-12-05', 4, 'Chất lượng đáng kinh ngạc	 tôi sẽ giới thiệu cho bạn bè!', 1),
(630, 25, 2, 4, '2023-12-05', 4, 'Nhận được đúng những gì tôi mong đợi	 không có bất kỳ vấn đề gì.', 1),
(631, 49, 4, 8, '2023-12-05', 5, 'Một sự mua sắm trực tuyến tuyệt vời!', 1),
(632, 55, 9, 12, '2023-12-05', 4, 'Sản phẩm tốt	 nhưng giao hàng hơi chậm.', 1),
(633, 48, 1, 10, '2023-12-05', 4, 'Hỗ trợ khách hàng rất chuyên nghiệp và hữu ích.', 1),
(634, 12, 5, 6, '2023-12-05', 5, 'Không có gì để chê	 tôi rất hài lòng!', 1),
(635, 11, 7, 13, '2023-12-05', 4, 'Sản phẩm chất lượng cao với giá phải chăng.', 1),
(636, 39, 3, 11, '2023-12-05', 5, 'Một trải nghiệm mua sắm trực tuyến tuyệt vời!', 1),
(637, 43, 6, 7, '2023-12-05', 5, 'Sản phẩm đáng giá đồng tiền	 tôi rất hài lòng.', 1),
(638, 41, 10, 9, '2023-12-05', 4, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(639, 44, 1, 5, '2023-12-05', 4, 'Sản phẩm chất lượng	 đúng như mô tả.', 1),
(640, 28, 4, 2, '2023-12-05', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(641, 24, 9, 1, '2023-12-05', 5, 'Rất hài lòng với dịch vụ của bạn.', 1),
(642, 19, 2, 10, '2023-12-05', 4, 'Sản phẩm không tồi	 nhưng có thể cải thiện.', 1),
(643, 17, 7, 12, '2023-12-05', 4, 'Tôi rất hài lòng với sự chuyên nghiệp của bạn.', 1),
(644, 12, 3, 8, '2023-12-05', 5, 'Đúng như mong đợi	 tuyệt vời!', 1),
(645, 26, 6, 11, '2023-12-05', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(646, 11, 1, 7, '2023-12-05', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(647, 14, 5, 13, '2023-12-05', 4, 'Sản phẩm không tệ	 nhưng không phải là hoàn hảo.', 1),
(648, 29, 8, 9, '2023-12-05', 4, 'Sản phẩm đáng giá đồng tiền.', 1),
(649, 26, 10, 6, '2023-12-05', 4, 'Một trải nghiệm mua sắm tích cực.', 1),
(650, 32, 4, 5, '2023-12-05', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(651, 48, 9, 2, '2023-12-05', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(652, 43, 2, 12, '2023-12-05', 4, 'Dịch vụ giao hàng nhanh chóng và đáng tin cậy.', 1),
(653, 37, 7, 8, '2023-12-05', 4, 'Sản phẩm đúng như hình ảnh	 tôi rất hài lòng.', 1),
(654, 49, 1, 4, '2023-12-05', 5, 'Chất lượng sản phẩm vượt quá mong đợi.', 1),
(655, 45, 6, 10, '2023-12-05', 5, 'Sản phẩm đáng mua	 giá trị tốt.', 1),
(656, 42, 3, 13, '2023-12-05', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện.', 1),
(657, 40, 8, 9, '2023-12-05', 4, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(658, 43, 1, 7, '2023-12-05', 4, 'Sản phẩm tốt	 nhưng có thể cải thiện một chút.', 1),
(659, 33, 4, 11, '2023-12-05', 4, 'Chất lượng sản phẩm đáng giá mỗi xu.', 1),
(660, 57, 9, 5, '2023-12-05', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(661, 3, 3, 2, '2023-12-05', 4, 'Sản phẩm rất thú vị và độc đáo.', 1),
(662, 28, 6, 8, '2023-12-05', 4, 'Chưa hài lòng với dịch vụ giao hàng.', 1),
(663, 33, 9, 10, '2023-12-05', 5, 'Một trải nghiệm mua sắm tuyệt vời!', 1),
(664, 11, 2, 4, '2023-12-05', 3, 'Không hài lòng với chất lượng sản phẩm.', 1),
(665, 17, 7, 12, '2023-12-05', 5, 'Đáng giá mỗi đồng bỏ ra!', 1),
(666, 56, 5, 6, '2023-12-05', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(667, 33, 3, 11, '2023-12-05', 4, 'Chưa hài lòng với tính năng sản phẩm.', 1),
(668, 52, 10, 9, '2023-12-05', 4, 'Rất hài lòng với chất lượng dịch vụ.', 1),
(669, 57, 1, 5, '2023-12-05', 5, 'Sản phẩm đáng giá tiền.', 1),
(670, 34, 8, 7, '2023-12-05', 4, 'Sản phẩm đúng như mô tả.', 1),
(671, 17, 2, 4, '2023-12-05', 4, 'Chất lượng sản phẩm không tốt như mong đợi.', 1),
(672, 29, 4, 8, '2023-12-05', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(673, 19, 9, 12, '2023-12-05', 4, 'Giao hàng nhanh	 nhưng sản phẩm không đạt yêu cầu.', 1),
(674, 76, 1, 10, '2023-12-05', 4, 'Sản phẩm đúng như hình	 tôi rất hài lòng.', 1),
(675, 44, 5, 6, '2023-12-05', 5, 'Không có gì để phàn nàn	 sản phẩm tốt.', 1),
(676, 46, 7, 13, '2023-12-05', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(677, 32, 3, 11, '2023-12-05', 5, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(678, 56, 6, 7, '2023-12-05', 5, 'Sản phẩm chất lượng cao với giá trị tốt nhất.', 1),
(679, 67, 10, 9, '2023-12-05', 4, 'Sản phẩm đáng giá đồng tiền.', 1),
(680, 45, 1, 5, '2023-12-05', 4, 'Đã nhận được đúng sản phẩm mình mong đợi.', 1),
(681, 61, 4, 2, '2023-12-05', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(682, 39, 9, 1, '2023-12-05', 5, 'Rất hài lòng với dịch vụ của bạn.', 1),
(683, 51, 2, 10, '2023-12-05', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện thêm', 1),
(684, 62, 7, 12, '2023-12-05', 4, 'Tôi rất hài lòng với sự chuyên nghiệp của bạn.', 1),
(685, 1, 3, 8, '2023-12-05', 5, 'Đúng như mong đợi	 tuyệt vời!', 1),
(686, 9, 6, 11, '2023-12-05', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(687, 10, 1, 7, '2023-12-05', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(688, 4, 5, 13, '2023-12-05', 4, 'Sản phẩm không tệ	 nhưng không phải là hoàn hảo.', 1),
(689, 5, 8, 9, '2023-12-05', 4, 'Sản phẩm đáng giá đồng tiền.', 1),
(690, 6, 10, 6, '2023-12-05', 4, 'Một trải nghiệm mua sắm tích cực.', 1),
(691, 7, 4, 5, '2023-12-05', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(692, 8, 9, 2, '2023-12-05', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(693, 4, 2, 12, '2023-12-05', 4, 'Dịch vụ giao hàng nhanh chóng và đáng tin cậy.', 1),
(694, 37, 7, 8, '2023-12-05', 4, 'Sản phẩm đúng như hình ảnh	 tôi rất hài lòng.', 1),
(695, 32, 1, 4, '2023-12-05', 5, 'Chất lượng sản phẩm vượt quá mong đợi.', 1),
(696, 45, 6, 10, '2023-12-05', 5, 'Sản phẩm đáng mua	 giá trị tốt.', 1),
(697, 11, 3, 13, '2023-12-05', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện.', 1),
(698, 38, 8, 9, '2023-12-05', 4, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(699, 67, 1, 7, '2023-12-05', 4, 'Sản phẩm tốt	 nhưng có thể cải thiện một chút.', 1),
(700, 10, 4, 11, '2023-12-05', 4, 'Chất lượng sản phẩm đáng giá mỗi xu.', 1),
(701, 11, 9, 5, '2023-12-05', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(702, 19, 3, 2, '2023-12-05', 4, 'Sản phẩm rất thú vị và độc đáo.', 1),
(703, 20, 6, 8, '2023-12-05', 4, 'Chưa hài lòng với dịch vụ giao hàng.', 1),
(704, 49, 9, 10, '2023-12-05', 5, 'Một trải nghiệm mua sắm tuyệt vời!', 1),
(705, 50, 2, 4, '2023-12-05', 3, 'Không hài lòng với chất lượng sản phẩm.', 1),
(706, 61, 7, 12, '2023-12-05', 5, 'Đáng giá mỗi đồng bỏ ra!', 1),
(707, 62, 5, 6, '2023-12-05', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(708, 58, 3, 11, '2023-12-05', 4, 'Chưa hài lòng với tính năng sản phẩm.', 1),
(709, 52, 1, 5, '2023-12-05', 5, 'Sản phẩm đáng giá tiền.', 1),
(710, 75, 8, 7, '2023-12-05', 4, 'Sản phẩm đúng như mô tả.', 1),
(711, 71, 2, 4, '2023-12-05', 4, 'Chất lượng sản phẩm không tốt như mong đợi.', 1),
(713, 55, 9, 12, '2023-12-05', 4, 'Giao hàng nhanh	 nhưng sản phẩm không đạt yêu cầu.', 1),
(714, 68, 1, 10, '2023-12-05', 4, 'Sản phẩm đúng như hình	 tôi rất hài lòng.', 1),
(716, 11, 7, 13, '2023-12-05', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(717, 29, 3, 11, '2023-12-05', 5, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(718, 43, 6, 7, '2023-12-05', 5, 'Sản phẩm chất lượng cao với giá trị tốt nhất.', 1),
(719, 61, 10, 9, '2023-12-05', 4, 'Sản phẩm đáng giá đồng tiền.', 1),
(720, 74, 1, 5, '2023-12-05', 4, 'Đã nhận được đúng sản phẩm mình mong đợi.', 1),
(721, 8, 4, 2, '2023-12-05', 4, 'Sản phẩm đáng giá mỗi xu.', 1),
(722, 34, 9, 1, '2023-12-05', 5, 'Rất hài lòng với dịch vụ của bạn.', 1),
(723, 59, 2, 10, '2023-12-05', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện một chút.', 1),
(724, 67, 7, 12, '2023-12-05', 4, 'Tôi rất hài lòng với sự chuyên nghiệp của bạn.', 1),
(726, 16, 6, 11, '2023-12-05', 4, 'Sản phẩm chất lượng	 giao hàng nhanh chóng.', 1),
(727, 41, 1, 7, '2023-12-05', 5, 'Rất hài lòng với sự chăm sóc khách hàng.', 1),
(728, 54, 5, 13, '2023-12-05', 4, 'Sản phẩm không tệ	 nhưng không phải là hoàn hảo.', 1),
(729, 69, 8, 9, '2023-12-05', 4, 'Sản phẩm đáng giá đồng tiền.', 1),
(730, 76, 10, 6, '2023-12-05', 4, 'Một trải nghiệm mua sắm tích cực.', 1),
(731, 22, 4, 5, '2023-12-05', 5, 'Sản phẩm tốt	 giá cả hợp lý.', 1),
(732, 48, 9, 2, '2023-12-05', 4, 'Rất hài lòng với chất lượng sản phẩm.', 1),
(733, 63, 2, 12, '2023-12-05', 4, 'Dịch vụ giao hàng nhanh chóng và đáng tin cậy.', 1),
(734, 77, 7, 8, '2023-12-05', 4, 'Sản phẩm đúng như hình ảnh	 tôi rất hài lòng.', 1),
(735, 9, 1, 4, '2023-12-05', 5, 'Chất lượng sản phẩm vượt quá mong đợi.', 1),
(736, 35, 6, 10, '2023-12-05', 5, 'Sản phẩm đáng mua	 giá trị tốt.', 1),
(737, 52, 3, 13, '2023-12-05', 4, 'Sản phẩm không tệ	 nhưng có thể cải thiện.', 1),
(738, 70, 8, 9, '2023-12-05', 4, 'Dịch vụ giao hàng nhanh chóng và an toàn.', 1),
(740, 33, 1, 4, '2023-12-17', 5, 'Nhung nguyễn test', 1),
(741, 6, 1, 1, '2023-12-17', 2, 'Máy giặt tồi quá', 1),
(742, 23, 1, 1, '2023-12-17', 1, 'Mới mua một ngày mà hỏng', 1),
(743, 62, 1, 1, '2023-12-17', 5, 'Hàng tốt, giá rẻ', 1),
(756, 9, 1, 42, '2023-12-17', 3, 'Bạn không để lại lời nhận xét nào', 1),
(757, 17, 1, 42, '2023-12-17', 4, 'Sản phẩm tốt quá nè', 1),
(758, 18, 1, 42, '2023-12-17', 2, 'Bạn không để lại lời nhận xét nào', 1),
(759, 44, 1, 42, '2023-12-17', 4, 'Bạn không để lại lời nhận xét nào', 1),
(760, 62, 1, 5, '2023-12-17', 5, 'Sản phẩm tuyệt vời', 1);

--
-- Triggers `feedbacks`
--
DELIMITER $$
CREATE TRIGGER `insert_after_feedbacks` AFTER INSERT ON `feedbacks` FOR EACH ROW BEGIN
    DECLARE avg_rate DECIMAL(10, 1) ;
    DECLARE product_id INT(11) ;
    DECLARE product_variant_id INT(11);
   
    SET product_variant_id = NEW.product_variant_id;
    
    SET product_id = (SELECT product_variants.product_id 
    FROM product_variants 
    WHERE product_variants.product_variant_id = product_variant_id);
    
    SET avg_rate =  (SELECT AVG(feedbacks.feedback_rate) 
     FROM feedbacks, product_variants 
     WHERE feedbacks.product_variant_id = product_variants.product_variant_id 
     AND product_variants.product_id = product_id 
     GROUP BY product_variants.product_id);
    
    UPDATE products 
    SET products.product_rate = avg_rate
    WHERE products.product_id = product_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `feedback_imgs`
--

CREATE TABLE `feedback_imgs` (
  `feedback_img_id` int(11) NOT NULL,
  `feedback_id` int(11) NOT NULL,
  `feedback_img_name` varchar(100) NOT NULL,
  `feedback_img_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `feedback_imgs`
--

INSERT INTO `feedback_imgs` (`feedback_img_id`, `feedback_id`, `feedback_img_name`, `feedback_img_is_display`) VALUES
(1, 1, 'fb_1_1.png', 1),
(2, 1, 'fb_1_2.png', 1),
(3, 1, 'fb_1_3.png', 1),
(4, 1, 'fb_1_4.png', 1),
(5, 2, 'fb_2_1.png', 1),
(6, 2, 'fb_2_2.png', 1),
(7, 2, 'fb_2_3.png', 1),
(8, 3, 'fb_3_1.png', 1),
(9, 3, 'fb_3_2.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `notification_type_id` int(11) NOT NULL,
  `notification_title` varchar(100) NOT NULL,
  `notification_subtitle` text DEFAULT NULL,
  `notification_content` text NOT NULL,
  `notification_date` date NOT NULL DEFAULT current_timestamp(),
  `notification_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `notification_type_id`, `notification_title`, `notification_subtitle`, `notification_content`, `notification_date`, `notification_is_display`) VALUES
(1, 1, 'Đơn hàng mới', 'Bạn có một đơn hàng mới đang chờ xử lý.', 'Đơn hàng mới đã được đặt thành công. Vui lòng kiểm tra và xử lý đơn hàng.', '2023-11-02', 1),
(2, 2, 'Đơn hàng đã được vận chuyển', 'Đơn hàng của bạn đã được vận chuyển và đang trên đường đến tay bạn.', 'Đơn hàng đã được vận chuyển thành công. Bạn có thể theo dõi trạng thái đơn hàng tại đây.', '2023-11-02', 1),
(3, 3, 'Đơn hàng đã được giao', 'Đơn hàng của bạn đã được giao đến địa chỉ của bạn.', 'Đơn hàng đã được giao thành công. Vui lòng kiểm tra và xác nhận đơn hàng.', '2023-11-02', 1),
(4, 4, 'Thanh toán đã được nhận', 'Thanh toán của bạn cho đơn hàng đã được nhận.', 'Thanh toán đã được nhận thành công. Vui lòng kiểm tra email của bạn để biết thêm chi tiết.', '2023-11-02', 1),
(5, 5, 'Phản hồi đã được nhận', 'Bạn đã nhận được phản hồi từ khách hàng.', 'Khách hàng đã phản hồi về sản phẩm của bạn. Vui lòng kiểm tra và xử lý phản hồi này.', '2023-11-02', 1),
(6, 6, 'Giảm giá 50% cho tất cả sản phẩm', 'Cơ hội mua sắm tuyệt vời!', 'Từ ngày 03/11/2023 đến ngày 09/11/2023, chúng tôi giảm giá 50% cho tất cả sản phẩm. Đây là cơ hội tuyệt vời để bạn mua sắm với giá ưu đãi.', '2023-11-02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notification_types`
--

CREATE TABLE `notification_types` (
  `notification_type_id` int(11) NOT NULL,
  `notification_type_name` varchar(100) NOT NULL,
  `notification_type_img` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `notification_types`
--

INSERT INTO `notification_types` (`notification_type_id`, `notification_type_name`, `notification_type_img`) VALUES
(1, 'Order placed', 'order_placed.jpg'),
(2, 'Order shipped', 'order_shipped.jpg'),
(3, 'Order delivered', 'order_delivered.jpg'),
(4, 'Payment received', 'payment_received.jpg'),
(5, 'Feedback received', 'feedback_received.jpg'),
(6, 'Sale', 'sale.jpg'),
(7, 'Lucky Customer', 'lucky_customer.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL DEFAULT 1,
  `order_name` varchar(100) NOT NULL,
  `order_phone` varchar(10) NOT NULL,
  `order_date` date NOT NULL DEFAULT current_timestamp(),
  `order_delivery_date` date NOT NULL,
  `order_delivery_address` varchar(100) NOT NULL,
  `order_note` text NOT NULL,
  `order_total_before` int(11) DEFAULT 0,
  `order_total_after` int(11) NOT NULL DEFAULT 0,
  `paying_method_id` int(11) NOT NULL DEFAULT 1,
  `order_paying_date` date NOT NULL,
  `order_is_paid` tinyint(1) NOT NULL,
  `order_status` enum('Chờ thanh toán','Đang giao hàng','Hoàn thành','Đã hủy') DEFAULT 'Chờ thanh toán'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `staff_id`, `order_name`, `order_phone`, `order_date`, `order_delivery_date`, `order_delivery_address`, `order_note`, `order_total_before`, `order_total_after`, `paying_method_id`, `order_paying_date`, `order_is_paid`, `order_status`) VALUES
(1, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-11-02', '2023-11-04', '123 Nguyen Van Troi Street, Ward 12, District 5, Ho Chi Minh City', 'Kiểm hàng trước', 13470000, 13470000, 1, '2023-11-30', 1, 'Hoàn thành'),
(2, 2, 2, 'Trần Thị Bình', '0987654322', '2023-11-02', '2023-11-05', '456 Le Van Luong Street, Ward 10, District 2, Ho Chi Minh City', 'Giao vào giờ hành chính 8h đến 16h', 54540000, 54540000, 1, '2023-11-30', 1, 'Hoàn thành'),
(3, 3, 3, 'Lê Quang Yên', '0987654323', '2023-11-02', '2023-11-06', '789 Tran Hung Dao Street, Ward 6, District 1, Ho Chi Minh City', 'Đóng gói kỹ', 50980000, 50980000, 1, '2023-11-30', 1, 'Hoàn thành'),
(4, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-11-02', '2023-11-04', '123 Nguyen Van Troi Street, Ward 12, District 5, Ho Chi Minh City', 'Kiểm hàng trước', 46380000, 41742000, 1, '2023-11-30', 1, 'Hoàn thành'),
(5, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-11-02', '2023-11-05', '456 Le Van Luong Street, Ward 10, District 2, Ho Chi Minh City', 'Giao vào giờ hành chính 8h đến 16h', 8980000, 8980000, 1, '2023-11-30', 0, 'Hoàn thành'),
(6, 1, 3, 'Phan Nguyễn Hải Yến', '0987654321', '2023-11-02', '2023-11-06', '123 Nguyen Van Troi Street, Ward 12, District 5, Ho Chi Minh City', 'Đóng gói kỹ', 21780000, 19166400, 1, '2023-11-30', 0, 'Đã hủy'),
(7, 7, 3, 'Phan Thanh Danh', '0987654327', '2023-11-20', '2023-11-22', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', '', 23980000, 23980000, 1, '2023-11-30', 0, 'Đã hủy'),
(8, 8, 3, 'Mai Văn Tiên', '0987654328', '2023-11-19', '2023-11-21', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', 'Giao sau giờ hành chính', 27980000, 27980000, 1, '2023-11-30', 0, 'Đã hủy'),
(9, 8, 3, 'Mai Văn Tiên', '0987654328', '2023-11-16', '2023-11-18', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', 'Giao giờ hành chính', 10470000, 10470000, 1, '2023-11-30', 0, 'Đã hủy'),
(10, 8, 3, 'Mai Văn Tiên', '0987654328', '2023-11-16', '2023-11-17', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', 'Giao sau 10h sáng', 22490000, 22490000, 1, '2023-11-30', 0, 'Đã hủy'),
(11, 1, 3, 'Phan Nguyễn Hải Yến', '0987654321', '2023-11-25', '2023-11-26', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', 'Giao sau 1h chiều', 11380000, 11380000, 1, '2023-11-30', 0, 'Đã hủy'),
(12, 1, 3, 'Phan Nguyễn Hải Yến', '0987654321', '2023-11-16', '2023-11-18', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', 'Giao gấp', 46380000, 41742000, 1, '2023-11-30', 0, 'Đã hủy'),
(13, 2, 3, 'Trần Thị Bình', '0987654322', '2023-11-23', '2023-11-25', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', 'Tránh rơi vỡ đơn hàng của tôi', 15940000, 15940000, 1, '2023-11-30', 1, 'Hoàn thành'),
(14, 2, 3, 'Trần Thị Bình', '0987654322', '2023-11-24', '2023-11-25', 'KTX khu A, ĐHQG, Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', 'Giao  hỏa tốc cho  tôi', 7780000, 7780000, 1, '2023-11-30', 1, 'Đang giao hàng'),
(39, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-12-05', '0000-00-00', 'tới nhà Nhung nguyễn Phường 4 Quận 8 Hồ Chí Minh', '', NULL, 0, 1, '0000-00-00', 1, 'Hoàn thành'),
(40, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-12-17', '0000-00-00', 'KTX Khu A Phường 4 Quận 4 Hồ Chí Minh', '', 19490000, 19490000, 2, '0000-00-00', 0, 'Chờ thanh toán'),
(41, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-12-17', '0000-00-00', 'KTX khu A Phường 7 Quận 2 Vũng Tàu', '', NULL, 0, 1, '0000-00-00', 1, 'Đang giao hàng'),
(42, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-12-17', '0000-00-00', 'Tới nhà Nhung Phường 4 Quận 4 Hồ Chí Minh', '', 58470000, 58470000, 1, '0000-00-00', 1, 'Hoàn thành'),
(43, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-12-18', '0000-00-00', 'Nhung Nguyễn Phường Tân Hưng Quận 7 Hồ Chí Minh', 'Boom hàng', 35970000, 35970000, 1, '0000-00-00', 1, 'Đang giao hàng'),
(44, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-12-18', '0000-00-00', 'Nhung mua Phường Tân Thuận Đông Quận 7 Hồ Chí Minh', 'Không mua', NULL, 0, 2, '0000-00-00', 0, 'Đã hủy'),
(45, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-12-18', '0000-00-00', 'yến bom hàng Phường 1 Quận 8 Hồ Chí Minh', 'Đừng có gửi', NULL, 0, 2, '0000-00-00', 0, 'Đã hủy'),
(46, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-12-18', '0000-00-00', 'Tới ngõ nhỏ Phường 16 Quận 5 Hồ Chí Minh', 'Kiểm hàng trước', 76470000, 68823000, 1, '0000-00-00', 1, 'Hoàn thành'),
(47, 1, 1, 'Lý Phi Lân', '0987654321', '2023-12-18', '0000-00-00', 'KTX b Phường 2 Quận 8 Hồ Chí Minh', '', NULL, 0, 1, '0000-00-00', 1, 'Hoàn thành'),
(48, 1, 1, 'Hương vi', '0987654321', '2023-12-18', '0000-00-00', 'Hương vi nhà bà tám Phường 2 Quận 8 Hồ Chí Minh', '', NULL, 0, 1, '0000-00-00', 1, 'Hoàn thành'),
(49, 1, 1, 'Lê Đức Mạnh', '0987654321', '2023-12-18', '0000-00-00', 'Tới nhà chòi Phường An Phú Quận 2 Hồ Chí Minh', 'Giao tận tay', NULL, 0, 1, '0000-00-00', 1, 'Hoàn thành'),
(50, 1, 1, 'Phan Nguyễn Hải Yến', '0987654321', '2023-12-18', '0000-00-00', 'KTX khu A Phường Tân Thuận Đông Quận 7 Hồ Chí Minh', '', NULL, 0, 2, '0000-00-00', 0, 'Chờ thanh toán');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `order_detail_quantity` int(11) NOT NULL,
  `order_detail_price_before` int(11) DEFAULT 0,
  `order_detail_price_after` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_variant_id`, `order_detail_quantity`, `order_detail_price_before`, `order_detail_price_after`) VALUES
(1, 6, 2, 3790000, 3790000),
(1, 23, 2, 3490000, 3490000),
(1, 62, 1, 4490000, 4490000),
(2, 37, 3, 9090000, 9090000),
(2, 59, 2, 5690000, 5690000),
(3, 14, 2, 25490000, 25490000),
(4, 33, 2, 23190000, 20871000),
(5, 62, 2, 4490000, 4490000),
(6, 67, 2, 10890000, 9583200),
(7, 12, 2, 11990000, 11990000),
(8, 72, 2, 13990000, 13990000),
(9, 23, 3, 3490000, 3490000),
(10, 13, 1, 22490000, 22490000),
(11, 59, 2, 5690000, 5690000),
(12, 33, 2, 23190000, 20871000),
(13, 11, 2, 7970000, 7970000),
(14, 33, 10, 23190000, 20871000),
(14, 60, 1, 3890000, 3890000),
(39, 1, 1, 6990000, 6990000),
(40, 44, 1, 19490000, 19490000),
(40, 73, 1, 1550000, 1550000),
(41, 25, 1, 17690000, 17690000),
(42, 9, 1, 4990000, 4990000),
(42, 17, 1, 7990000, 7191000),
(42, 18, 1, 25490000, 22941000),
(42, 44, 1, 19490000, 19490000),
(43, 15, 3, 11990000, 11990000),
(43, 16, 1, 10990000, 10990000),
(44, 63, 1, 3490000, 3490000),
(45, 63, 1, 3490000, 3490000),
(46, 16, 4, 10990000, 9616250),
(46, 18, 1, 25490000, 22941000),
(46, 26, 1, 19990000, 19990000),
(46, 41, 1, 22890000, 22890000),
(47, 50, 2, 36490000, 36490000),
(48, 77, 1, 5590000, 5590000),
(49, 42, 4, 79990000, 79990000),
(50, 36, 1, 10990000, 9671200);

--
-- Triggers `order_details`
--
DELIMITER $$
CREATE TRIGGER `delete_before_order_details` BEFORE DELETE ON `order_details` FOR EACH ROW BEGIN
    -- Update orders
    UPDATE orders
    SET
        order_total_after = (
            SELECT SUM(order_detail_price_after * order_detail_quantity)
            FROM order_details
            WHERE order_id = OLD.order_id
        ),
        order_total_before = (
            SELECT SUM(order_detail_price_before * order_detail_quantity)
            FROM order_details
            WHERE order_id = OLD.order_id
        )
    WHERE order_id = OLD.order_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_before_order_details` BEFORE INSERT ON `order_details` FOR EACH ROW BEGIN
    -- Calculate new prices
    SET NEW.order_detail_price_before = (
        SELECT product_variant_price
        FROM product_variants
        WHERE product_variant_id = NEW.product_variant_id
    );

    SET NEW.order_detail_price_after = COALESCE(
        (
            SELECT view_product_variants.product_variant_price * (1 - view_product_variants.discount_amount / 100)
            FROM view_product_variants
            WHERE view_product_variants.product_variant_id = NEW.product_variant_id
        ),
        NEW.order_detail_price_before
    );
    
    -- Set default value if order_detail_price_after is NULL
    IF NEW.order_detail_price_after IS NULL THEN
        SET NEW.order_detail_price_after = (
        SELECT product_variant_price
        FROM product_variants
        WHERE product_variant_id = NEW.product_variant_id
    );
    END IF;

    -- Update orders
    UPDATE orders
    SET
        order_total_after = (
            SELECT SUM(NEW.order_detail_price_after * NEW.order_detail_quantity)
            FROM order_details
            WHERE order_id = NEW.order_id
        ),
        order_total_before = (
            SELECT SUM(NEW.order_detail_price_before * NEW.order_detail_quantity)
            FROM order_details
            WHERE order_id = NEW.order_id
        )
    WHERE order_id = NEW.order_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_before_order_details` BEFORE UPDATE ON `order_details` FOR EACH ROW BEGIN
    -- Calculate new prices
    SET NEW.order_detail_price_before = (
        SELECT product_variant_price
        FROM product_variants
        WHERE product_variant_id = NEW.product_variant_id
    );

    SET NEW.order_detail_price_after = COALESCE(
        (
            SELECT view_product_variants.product_variant_price * (1 - view_product_variants.discount_amount / 100)
            FROM view_product_variants
            WHERE view_product_variants.product_variant_id = NEW.product_variant_id
        ),
        NEW.order_detail_price_before
    );
    
    -- Set default value if order_detail_price_after is NULL
    IF NEW.order_detail_price_after IS NULL THEN
        SET NEW.order_detail_price_after = (
        SELECT product_variant_price
        FROM product_variants
        WHERE product_variant_id = NEW.product_variant_id
    );
    END IF;

    -- Update orders
    UPDATE orders
    SET
        order_total_after = (
            SELECT SUM(NEW.order_detail_price_after * NEW.order_detail_quantity)
            FROM order_details
            WHERE order_id = NEW.order_id
        ),
        order_total_before = (
            SELECT SUM(NEW.order_detail_price_before * NEW.order_detail_quantity)
            FROM order_details
            WHERE order_id = NEW.order_id
        )
    WHERE order_id = NEW.order_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `paying_methods`
--

CREATE TABLE `paying_methods` (
  `paying_method_id` int(11) NOT NULL,
  `paying_method_name` varchar(100) NOT NULL,
  `paying_method_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `paying_methods`
--

INSERT INTO `paying_methods` (`paying_method_id`, `paying_method_name`, `paying_method_is_display`) VALUES
(1, 'Ví điện tử MoMo', 1),
(2, 'Thẻ ngân hàng', 1),
(3, 'Thẻ tín dụng', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `product_avt_img` varchar(100) NOT NULL,
  `product_rate` float NOT NULL,
  `product_description` text DEFAULT NULL,
  `product_period` int(11) DEFAULT NULL,
  `product_view_count` int(11) DEFAULT NULL,
  `product_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `supplier_id`, `product_avt_img`, `product_rate`, `product_description`, `product_period`, `product_view_count`, `product_is_display`) VALUES
(1, 1, 'Máy lạnh Midea Inverter MSAGA-10CRDN8', 17, 'P1_avt.jpg', 4.7, '<p><strong><em>Máy lạnh Midea Inverter 1 HP MSAGA-10CRDN8 là\n    dòng máy lạnh 1 chiều (chỉ làm lạnh), sở hữu công nghệ Inverter Quattro, chế độ iEco/Gear tiết kiệm điện\n    năng, máy hoạt động êm ái, bền bỉ. Trang bị chế độ làm lạnh nhanh Boost, bộ lọc bụi 2 lớp HD,&nbsp;công nghệ\n    lọc kép Dual Filtration</em></strong><strong><em> làm sạch không khí, đảm bảo an toàn sức khỏe cho cả gia\n    đình.&nbsp;</em></strong></p>\n<h3>Tổng quan thiết kế</h3>\n<p><strong>Dàn lạnh</strong></p>\n<p>- Chiếc&nbsp;máy lạnh Midea&nbsp;này được thiết kế với tông màu trắng chủ đạo, đường nét thiết kế cứng cáp mạnh mẽ,\nphù hợp\nvới nhiều kiểu không gian nội thất, từ phòng khách đến nhà bếp hay phòng ngủ.&nbsp;</p>\n<p>- <strong>Màn hình hiển thị nhiệt độ</strong> trên dàn lạnh giúp quan sát và điều chỉnh nhiệt độ dễ dàng, đặc biệt là\nvào ban đêm.</p>\n<p><strong>Dàn nóng</strong></p>\n<p>- Thiết kế hình chữ nhật, vỏ bằng thép chắc chắn.&nbsp;</p>\n<p>- Trang bị <strong>ống dẫn gas bằng đồng </strong>có khả năng làm lạnh nhanh, độ bền cao. <strong>Lá tản nhiệt bằng\nnhôm</strong>&nbsp;giúp máy vận hành ổn định, góp phần nâng cao hiệu quả làm lạnh.&nbsp;</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/302746/may-lanh-midea-msaga-10crdn8-070523-111154.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Midea Inverter 1 HP MSAGA-10CRDN8 - Tổng quan thiết kế\"\n    src=\"https://cdn.tgdd.vn/Products/Images/2002/302746/may-lanh-midea-msaga-10crdn8-070523-111154.jpg\"></a>\n</p>\n<h3>Công nghệ làm lạnh</h3>\n<p>- Công suất làm lạnh <strong>1 HP - 9.500 BTU</strong>, cung cấp nhiệt độ làm lạnh tối ưu cho không gian có diện tích\ndưới 15m² (từ 30 đến 45 m³).</p>\n<p>- Công nghệ làm lạnh nhanh<strong> Boost</strong> giúp làm lạnh không gian, mang lại cảm giác mát mẻ dễ chịu, quá\ntrình làm lạnh nhanh sẽ kết thúc khi nhiệt độ phòng đạt nhiệt độ cài đặt.&nbsp;</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/302746/may-lanh-midea-msaga-10crdn8-070523-111155.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Midea Inverter 1 HP MSAGA-10CRDN8 - Công nghệ làm lạnh\"\n    src=\"https://cdn.tgdd.vn/Products/Images/2002/302746/may-lanh-midea-msaga-10crdn8-070523-111155.jpg\"></a>\n</p>\n<h3>Cơ chế thổi gió</h3>\n<p>- Chế độ gió<strong> tùy chỉnh điều khiển lên xuống</strong> giúp người dùng chủ động hơn khi điều khiển luồng khí\nlạnh theo hướng như mong muốn.&nbsp;</p>\n<p>-&nbsp;<strong>Follow me - Cảm biến nhiệt độ trên remote</strong>: dù ở bất kỳ vị trí nào với remote bên cạnh, bạn\nvẫn có thể tận hưởng bầu không khí máy lạnh với chế độ này.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/302746/may-lanh-midea-msaga-10crdn8-070523-111157.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Midea Inverter 1 HP MSAGA-10CRDN8 - Cơ chế thổi gió\"\n    src=\"https://cdn.tgdd.vn/Products/Images/2002/302746/may-lanh-midea-msaga-10crdn8-070523-111157.jpg\"></a>\n</p>\n<h3>Công nghệ tiết kiệm điện</h3>\n<p>- Công nghệ&nbsp;Inverter Quattro cho hiệu suất làm lạnh cao nhưng vẫn đảm\nbảo mức tiêu thụ năng lượng thấp nhất cho người dùng.</p>\n<p>- Chức năng<strong> iEco</strong>&nbsp;cho bạn sử dụng thiết bị ở khoảng 24 - 30°C trong thời gian dài, tăng cường\ntiết kiệm điện. Chế độ<strong>&nbsp;Gear </strong>thay đổi<strong>&nbsp;</strong>được&nbsp;3 mức tùy chỉnh công\nsuất: 50%, 75% và 100%, nhờ đó người dùng có thể kiểm soát mức điện năng tiêu thụ, giảm chi phí điện hàng tháng tối\nưu.&nbsp;</p>\n<p>- Nhãn năng lượng <strong>5 sao</strong>, hiệu suất năng lượng 4.48. Mức tiêu thụ điện năng<strong>&nbsp;0.75\nkW/h</strong>.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/302746/may-lanh-midea-msaga-10crdn8-070523-111159.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Midea Inverter 1 HP MSAGA-10CRDN8 - Công nghệ tiết kiệm điện\"\n    src=\"https://cdn.tgdd.vn/Products/Images/2002/302746/may-lanh-midea-msaga-10crdn8-070523-111159.jpg\"></a>\n</p>\n<h3>Khả năng kháng khuẩn, khử mùi</h3>\n<p>- <strong>Bộ lọc bụi 2 lớp HD</strong>: có tác dụng lọc sạch bụi bẩn cùng các tác nhân gây dị ứng trong không khí,\ntrả lại không gian trong lành, góp phẩn bảo vệ an toàn sức khỏe cho cả gia đình.&nbsp;</p>\n<p>- <strong>Công nghệ lọc kép Dual Filtration </strong>loại bỏ được các hạt bụi mịn, nâng cao chất lượng không khí\ntrong ngôi nhà bạn.&nbsp;</p>\n<p>-&nbsp;<strong>Chức năng tự làm sạch</strong>: tránh nấm mốc và vi khuẩn phát triển, giúp kéo dài tuổi thọ cho máy,\nđồng thời góp phần mang lại bầu không khí trong lành cho người sử dụng.&nbsp;</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/302746/may-lanh-midea-msaga-10crdn8-070523-111202.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Midea Inverter 1 HP MSAGA-10CRDN8 - Khả năng kháng khuẩn, khử mùi\"\n    src=\"https://cdn.tgdd.vn/Products/Images/2002/302746/may-lanh-midea-msaga-10crdn8-070523-111202.jpg\"></a>\n</p>\n<h3>Tiện ích</h3>\n<p>-&nbsp;Chế độ hút ẩm: có tác dụng hút bớt độ ẩm trong không khí,\nmang lại cảm giác khô ráo, dễ chịu, đặc biệt là vào những ngày mưa hoặc trời nồm ẩm ướt.&nbsp;</p>\n<p>-&nbsp;<strong>Hẹn giờ bật tắt máy</strong>: người dùng chỉ cần hẹn thời gian máy lạnh sử dụng, không cần tỉnh giấc\ngiữa đêm để điều chỉnh lại mức nhiệt độ hoặc bật/tắt máy.&nbsp;</p>\n<p>- Chế độ chỉ sử dụng quạt Fan Only: khi bật\nchế độ này, máy lạnh như một chiếc quạt thổi gió vào những ngày hè, chỉ làm mát mà không làm lạnh.</p>\n<p>-&nbsp;<strong>Remote có đèn LED</strong>: người dùng dễ dàng điều chỉnh thông số của&nbsp;máy lạnh&nbsp;theo nhu\ncầu sử dụng mà không cần bật đèn giữa đêm.&nbsp;</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/302746/may-lanh-midea-msaga-10crdn8-080523-104311.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Midea Inverter 1 HP MSAGA-10CRDN8 - Tiện ích\"\n    src=\"https://cdn.tgdd.vn/Products/Images/2002/302746/may-lanh-midea-msaga-10crdn8-080523-104311.jpg\"></a>\n</p>\n<p><em>Tóm lại, máy lạnh Midea Inverter 1 HP MSAGA-10CRDN8</em><em> có thiết kế sang trọng, công nghệ Inverter Quattro,\niEco/Gear tiết kiệm điện năng, trang bị bộ lọc bụi 2 lớp HD,&nbsp;Dual Filtration</em>&nbsp;<em>cho bầu không\nkhí trong lành cùng nhiều tiện ích tiện lợi khác. Thiết bị sở hữu khả năng làm lạnh tốt với công suất 1 HP, phù\nhợp với căn phòng có diện tích dưới 15m² (từ 30 đến 45 m³).</em></p>', 36, 1000, 1),
(2, 1, 'Máy lạnh TCL Inverter TAC-13CSD/XAB1I', 5, 'P2_avt.jpg', 4, '<p><strong><em>Máy lạnh TCL Inverter 2 HP\n    TAC-18CSD/XAB1I&nbsp;</em></strong><em><strong>được trang bị nhiều tính năng như bộ lọc HD hạn chế\nvi khuẩn, hạt, mùi và bụi</strong></em><em><strong>. Trang bị công nghệ Eco và AI Inverter&nbsp;giúp tiết\nkiệm điện năng hiệu quả,&nbsp;</strong></em><em><strong>chuẩn năng lượng&nbsp;5 sao (hiệu suất năng lượng4.64). Ngoài ra còn đa dạng các tiện ích khác như kiểm soát độ ẩm, cảm biến nhiệt I Feel,...</strong></em>\n</p>\n<h3>Thiết kế</h3>\n<p><strong>Dàn lạnh:</strong></p>\n<p>- Máy lạnh sở hữu kiểu thiết kế hình hộp chữ nhật nằm ngang truyền thống với các đường nét được bo tròn tinh tế.</p>\n<p>-&nbsp;Tiện quan sát và điều chỉnh khi cần thiết với&nbsp;<strong>màn hình hiển thị nhiệt độ ngay trên dàn\nlạnh.</strong></p>\n<p><strong>Dàn nóng:</strong></p>\n<p>- Dàn nóng mang vẻ ngoài cứng cáp và thiết kế tối giản. Lớp vỏ máy được làm từ chất liệu dày dặn,&nbsp;<strong>chịu\nđược các điều kiện khắc nghiệt</strong>&nbsp;bên ngoài môi trường lắp đặt<strong>.&nbsp;</strong>Các bo mạch\nđược bảo vệ tối ưu hơn.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/307169/may-lanh-tcl-inverter-2-hp-tac-18csd-xab1i-150523-020124.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh TCL Inverter 2 HP TAC-18CSD/XAB1I - Thiết kế\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/2002/307169/may-lanh-tcl-inverter-2-hp-tac-18csd-xab1i-150523-020124.jpg\"></a>\n</p>\n<p>* Hình ảnh chỉ mang tính chất minh họa</p>\n<h3>Công nghệ làm lạnh</h3>\n<p>-&nbsp;Máy lạnh TCL\nInverter&nbsp;có công suất hoạt động&nbsp;<strong>2 HP</strong>, đáp ứng cho phạm vi làm lạnh từ <strong>20\n- 30m² (từ 60 đến 80m³).</strong></p>\n<p>-&nbsp;Công nghệ làm lạnh nhanh Turbo: Sau khi người dùng\nnhấn vào&nbsp;<strong>nút Turbo</strong> trên remote, nhiệt độ được hạ xuống <strong>18℃</strong> chỉ trong vòng\n<strong>30s.&nbsp;</strong>Bạn sẽ được tận hưởng không khí mát mẻ gần như tức thì.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/307169/may-lanh-tcl-inverter-2-hp-tac-18csd-xab1i-150523-020337.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh TCL Inverter 2 HP TAC-18CSD/XAB1I - Làm lạnh nhanh\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/2002/307169/may-lanh-tcl-inverter-2-hp-tac-18csd-xab1i-150523-020337.jpg\"\n></a></p>\n<p>* Hình ảnh chỉ mang tính chất minh họa</p>\n<h3>Cơ chế thổi gió</h3>\n<p>-&nbsp;Máy lạnh TCL 2 HP&nbsp;này có khả năng&nbsp;<strong>tuỳ chỉnh điều\nkhiển lên xuống trái phải tự động</strong>, hơi lạnh lan tỏa rộng khắp.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/307169/may-lanh-tcl-inverter-2-hp-tac-18csd-xab1i-150523-020403.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh TCL Inverter 2 HP TAC-18CSD/XAB1I - thổi gió\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/2002/307169/may-lanh-tcl-inverter-2-hp-tac-18csd-xab1i-150523-020403.jpg\"\n></a></p>\n<p>* Hình ảnh chỉ mang tính chất minh họa</p>\n<h3>Các công nghệ tiết kiệm điện</h3>\n<p>- <strong>Công nghệ AI Inverter</strong> kết hợp <strong>Eco</strong> được trang bị trên&nbsp;máy lạnh&nbsp;giúp tiết kiệm điện năng, giảm chi phí điện hằng tháng. Ngoài ra,\nmáy còn <strong>vận hành êm ái</strong> và duy trì nhiệt độ ổn định.</p>\n<p>- Sản phẩm đạt chuẩn&nbsp;<strong>5 sao (Hiệu suất năng lượng 4.64).</strong></p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/307169/may-lanh-tcl-inverter-2-hp-tac-18csd-xab1i-150523-020735.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh TCL Inverter 2 HP TAC-18CSD/XAB1I - Tiết kiệm diện\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/2002/307169/may-lanh-tcl-inverter-2-hp-tac-18csd-xab1i-150523-020735.jpg\"\n></a></p>\n<p>* Hình ảnh chỉ mang tính chất minh họa</p>\n<h3>Khả năng lọc không khí - sức khoẻ</h3>\n<p><strong>Bộ lọc HD</strong>&nbsp;với chức năng chính là lọc sạch không khí, vi khuẩn, mùi và các hạt siêu nhỏ bên\ntrong phòng. Sức khỏe của các thành viên trong nhà sẽ được bảo vệ tốt hơn.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/307169/may-lanh-tcl-inverter-2-hp-tac-18csd-xab1i-150523-020936.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh TCL Inverter 2 HP TAC-18CSD/XAB1I - Tiết kiệm điện\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/2002/307169/may-lanh-tcl-inverter-2-hp-tac-18csd-xab1i-150523-020936.jpg\"\n></a></p>\n<p>* Hình ảnh chỉ mang tính chất minh họa</p>\n<h3>Tiện ích</h3>\n<p>-&nbsp;<strong>Cảm biến nhiệt độ I Feel</strong>:&nbsp;Cảm biến <strong>tích hợp trên remote&nbsp;</strong>xác định\nsự chênh lệch nhiệt độ trên máy và thân nhiệt của bạn. Từ đó máy lạnh sẽ điều tiết hơi lạnh đến vị trí đặt remote,\nbạn sẽ cảm nhận được sự mát mẻ, sảng khoái.</p>\n<p>-&nbsp;<strong>Chế độ kiểm soát độ ẩm</strong>:&nbsp;Chế độ này phát tán các&nbsp;<strong>phân tử\nnước</strong>&nbsp;cho da hấp thụ, làn da của bạn sẽ luôn được căng trẻ mỗi ngày.</p>\n<p>-&nbsp;Chế độ bảo vệ nguồn điện: Bảo vệ mạch điện trong nhà, tăng độ bền cho&nbsp;máy lạnh\nTCL&nbsp;này.</p>\n<p>- Ngoài ra, chế độ đảo gió đa chiều tạo điều kiện cho luồng không khí lạnh lan tỏa nhanh khắp phòng.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/307169/may-lanh-tcl-inverter-2-hp-tac-18csd-xab1i-150523-020234.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh TCL Inverter 2 HP TAC-18CSD/XAB1I - Tiện ích\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/2002/307169/may-lanh-tcl-inverter-2-hp-tac-18csd-xab1i-150523-020234.jpg\"\n></a></p>\n<p>* Hình ảnh chỉ mang tính chất minh họa</p>\n<p><em>Tóm lại, máy\nlạnh TCL Inverter 2 HP TAC-18CSD/XAB1I</em><em> lọc sạch khuẩn nhờ bộ lọc HD, tiết kiệm chi phí điện\nhằng tháng nhờ công nghệ AI Inverter và Eco. Công nghệ làm lạnh nhanh Turbo, làm lạnh nhanh chóng. Ngoài ra, các\ntiện ích như&nbsp;cảm biến nhiệt độ I Feel,&nbsp;chế độ kiểm soát độ ẩm,... sẽ hỗ trợ bạn tối ưu quá trình sử\ndụng máy.</em></p>', 36, 1200, 1),
(3, 1, 'Máy lạnh Funiki HIC09TMU.ST3', 11, 'P3_avt.jpg', 4, '<p><em><strong>Máy lạnh Funiki 1HP HIC09TMU.ST3 sở hữu công nghệ Inverter\n    giúp tiết kiệm điện năng, chế độ làm lạnh nhanh Turbo giúp tăng tốc làm lạnh, người dùng sẽ không mất quá\n    nhiều thời gian để đạt được mức nhiệt độ mình mong muốn.</strong></em></p>\n<h3>Tổng quan thiết kế</h3>\n<p><strong>Dàn lạnh:&nbsp;</strong></p>\n<p>-<strong>&nbsp;</strong><strong>Máy lạnh Funiki </strong>1HP HIC09TMU.ST3&nbsp;có vỏ bằng nhựa với tông màu\ntrắng phù hợp với nhiều kiểu thiết kế không gian, từ phòng khách đến nhà bếp hay phòng ngủ.</p>\n<p>-&nbsp;Màn hình hiển thị nhiệt độ trên dàn lạnh dễ dàng quan sát.</p>\n<p><strong>Dàn nóng: </strong></p>\n<p>- Thiết kế hình chữ nhật, vỏ bằng thép chắc chắn.</p>\n<p>-<strong>&nbsp;</strong>Có ống dẫn gas được làm bằng đồng với lá tản nhiệt bằng nhôm có lớp bảo\nvệ&nbsp;<strong>Golden Fin</strong>&nbsp;độ bền cao tăng tuổi thọ của máy, chịu được điều kiện thời tiết khắc nghiệt\nnhư sương muối, gió biển hay mưa bão.&nbsp;</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/272060/funiki-1-hp-hic09tmust3-061222-025914.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Funiki Inverter 1 HP HIC09TMU.ST3 - Tổng quan thiết kế\"\n    src=\"https://cdn.tgdd.vn/Products/Images/2002/272060/funiki-1-hp-hic09tmust3-061222-025914.jpg\"></a></p>\n<h3>Công nghệ làm lạnh</h3>\n<p>- Công suất làm lạnh <strong>1&nbsp;HP - 9000 BTU</strong>&nbsp;nên hơi lạnh có thể đảm bảo cho\nkhông gian<strong> dưới&nbsp;15m².</strong></p>\n<p>- Chế độ Turbo&nbsp;giúp tăng tốc độ làm lạnh tránh việc mất thời gian chờ đợi\nmáy tạo ra hơi lạnh.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/272060/funiki-1-hp-hic09tmust3-061222-025920.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Funiki Inverter 1 HP HIC09TMU.ST3 - Công nghệ làm lạnh\"\n    src=\"https://cdn.tgdd.vn/Products/Images/2002/272060/funiki-1-hp-hic09tmust3-061222-025920.jpg\"\n    ></a></p>\n<h3>Cơ chế thổi gió</h3>\n<p>- Máy sử dụng cơ chế điều khiển cánh đảo gió lên xuống, trái phải tùy chỉnh tay nên hơi lạnh có thể lan toả đồng đều\nđến nhiều nơi trong phòng.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/272060/funiki-1-hp-hic09tmust3-061222-025916.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Funiki Inverter 1 HP HIC09TMU.ST3 - Cơ chế thổi gió\"\n    src=\"https://cdn.tgdd.vn/Products/Images/2002/272060/funiki-1-hp-hic09tmust3-061222-025916.jpg\"\n    ></a></p>\n<h3>Công nghệ tiết kiệm</h3>\n<p>- Công nghệ Inverter giúp máy lạnh hoạt động êm ái, tiết kiệm điện năng với mức tiêu thụ chỉ\n0.745 kWh.</p>\n<p>- <strong>Chế độ tiết kiệm năng lượng Eco</strong> giúp máy hoạt động ở mức công suất trung bình, tiết kiệm điện năng\nhiệu quả.</p>\n<p>- Máy lạnh đạt nhãn năng lượng&nbsp;5 sao (Hiệu suất năng lượng 4.50).</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/272060/funiki-1-hp-hic09tmust3-061222-025921.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Funiki Inverter 1 HP HIC09TMU.ST3 - Công nghệ tiết kiệm điện\"\n    src=\"https://cdn.tgdd.vn/Products/Images/2002/272060/funiki-1-hp-hic09tmust3-061222-025921.jpg\"\n    ></a></p>\n<h3>Khả năng lọc không khí</h3>\n<p>-<strong> Lưới lọc Nano bạc</strong> bên trong dàn lạnh có khả năng loại bỏ vi khuẩn một cách nhanh chóng mang đến\nkhông gian an toàn cho người dùng.</p>\n<p>-&nbsp;<strong>Tính năng tự làm sạch</strong>&nbsp;giúp máy tự vệ sinh dàn lạnh, tạo ra bầu không khí trong lành,\nđồng thời tiết kiệm chi phí vệ sinh máy lạnh.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/272060/funiki-1-hp-hic09tmust3-061222-025918.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Funiki Inverter 1 HP HIC09TMU.ST3 - Khả năng lọc không khí\"\n    src=\"https://cdn.tgdd.vn/Products/Images/2002/272060/funiki-1-hp-hic09tmust3-061222-025918.jpg\"\n   ></a></p>\n<h3>Đa dạng tiện ích sử dụng</h3>\n<p>- <strong>Chế độ Sleep</strong> giúp bạn có một giấc ngủ sâu nhờ vào việc tự điều chỉnh nhiệt độ sao cho thích hợp\nnhất, tạo sự thoải mái vào ban đêm.</p>\n<p>-&nbsp; Với tính năng chẩn đoán lỗi, khi máy gặp lỗi thì lỗi này sẽ được hiển thị trên dàn lạnh giúp người dùng kịp\nthời điều chỉnh, sửa chữa.</p>\n<p>- &nbsp;Nếu bị mất điện đột ngột, chức năng tự khởi động giúp máy khởi động sau khi có điện trở lại.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/272060/funiki-1-hp-hic09tmust3-230322-110548.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Funiki Inverter 1 HP HIC09TMU.ST3 - Chế độ ngủ Sleep\"\n    src=\"https://cdn.tgdd.vn/Products/Images/2002/272060/funiki-1-hp-hic09tmust3-230322-110548.jpg\"\n    ></a></p>\n<p><em>Về tổng quan, <strong>máy lạnh\n    </strong>Funiki 1HP HIC09TMU.ST3 sở hữu khả năng làm lạnh tốt với công suất 1&nbsp;HP - 9000 BTU, phù\nhợp với diện tích phòng dưới 15m². Nổi bật với công nghệ Inverter và chế độ Eco giúp tối ưu khả năng tiết kiệm\nđiện năng. Cộng thêm chế độ Turbo giúp tăng tốc độ làm lạnh, đi kèm là khả năng lọc không khí, bụi bẩn với lưới\nlọc Nano bạc cùng với lớp bảo vệ Golden Fin trên dàn lạnh giúp máy có tuổi thọ cao hơn, đây xứng đáng là lựa\nchọn ổn cho giải pháp làm mát căn phòng nhà bạn.</em></p>', 24, 950, 1),
(4, 1, 'Máy lạnh Casper Inverter TC-09IS35', 4, 'P4_avt.jpg', 4.5, '<p><strong><em>Máy lạnh Casper Inverter 1 HP TC-09IS35 cho\n    khả năng làm mát hiệu quả với chế độ làm lạnh nhanh Turbo, tự động điều chỉnh nhiệt độ với cảm biến nhiệt độ\n    iFeel, sử dụng tiết kiệm điện với công nghệ&nbsp;I-saving, tăng tuổi thọ thiết bị với chức năng tự làm sạch\n    iClean.</em></strong></p>\n<h3>Tổng quan thiết kế</h3>\n<p><strong>Dàn lạnh</strong></p>\n<p>-&nbsp;Casper TC-09IS35 thiết kế bo cạnh viền, tông màu trắng thanh lịch cho tổng thể thiết kế sang trọng, tinh tế,\ntrang trí hài hòa với các món đồ nội thất khác trong gian phòng của bạn.&nbsp;</p>\n<p><strong>Dàn nóng</strong></p>\n<p>- Thiết kế hình khối đơn giản, chất liệu vỏ ngoài có độ bền chắc cao, giữ cho các linh kiện bên trong an toàn trước\ncác điều kiện thời tiết khắc nghiệt, duy trì hệ thống hoạt động&nbsp;hiệu quả trong thời gian dài.&nbsp;</p>\n<p>-&nbsp;Ống dẫn gas làm từ đồng, dàn tản nhiệt cũng bằng chất liệu đồng mạ vàng nhẹ bền, dễ dàng lắp đặt.<strong> Bề\nmặt dàn tản nhiệt được mạ vàng</strong> cho hiệu quả chống ăn mòn tốt, gia tăng độ bền và đảm bảo hoạt động\nthiết bị tối ưu.&nbsp;</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/2002/302745/casper-tc-09is35-280223-125132.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Casper Inverter 1 HP TC-09IS35 - Thiết kế\"\n    src=\"https://cdn.tgdd.vn/Products/Images/2002/302745/casper-tc-09is35-280223-125132.jpg\"></a></p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3>Công nghệ làm lạnh</h3>\n<p>- Công suất <strong>1 HP</strong>&nbsp;thích hợp dùng cho phạm vi làm lạnh với diện tích dưới 15m².</p>\n<p>-&nbsp;Chức năng<strong> Turbo </strong>khi khởi động, máy lạnh Casper&nbsp;sẽ vận hành ở mức công suất lớn để\nnhanh chóng làm lạnh không gian phòng đến mức nhiệt cài đặt trong thời gian chỉ tầm 20 đến 30 phút.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/2002/302745/casper-tc-09is35-280223-125205.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Casper Inverter 1 HP TC-09IS35 - Công nghệ làm lạnh\"\n    src=\"https://cdn.tgdd.vn/Products/Images/2002/302745/casper-tc-09is35-280223-125205.jpg\"></a></p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3>Cơ chế thổi gió</h3>\n<p>-&nbsp;Máy lạnh&nbsp;có\ncơ chế điều khiển lên xuống tự động, trái phải tùy chỉnh tay, hơi lạnh lan tỏa đều.&nbsp;</p>\n<p>-&nbsp;Chức năng <strong>iFeel</strong>: từ cảm biến nhiệt trên remote, máy sẽ nhận tín hiệu và điều chỉnh tăng, giảm\nnhiệt độ tùy theo nhiệt độ của cơ thể con người, giúp cho bạn luôn cảm thấy dễ chịu, tránh được tình trạng bị sốc\nnhiệt khi mới bật máy.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/2002/302745/casper-tc-09is35-280223-125231.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Casper Inverter 1 HP TC-09IS35 - Cơ chế thổi gió\"\n    src=\"https://cdn.tgdd.vn/Products/Images/2002/302745/casper-tc-09is35-280223-125231.jpg\"\n    ></a></p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3>Công nghệ tiết kiệm</h3>\n<p>- Máy nén có hiệu năng mạnh mẽ cùng công nghệ <strong>I-saving</strong> giúp&nbsp;điều chỉnh nhiệt độ theo hình xoắn\ncho thiết bị kiểm soát nhiệt độ dễ dàng, tiết kiệm điện năng tiêu thụ đến 30 - 50% điện năng.&nbsp;</p>\n<p>- Nhãn năng lượng: 5 sao (Hiệu suất năng lượng 4.31).</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/2002/302745/casper-tc-09is35-280223-125259.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Casper Inverter 1 HP TC-09IS35 - Công nghệ tiết kiệm\"\n    src=\"https://cdn.tgdd.vn/Products/Images/2002/302745/casper-tc-09is35-280223-125259.jpg\"\n   ></a></p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3>Đa dạng tiện ích sử dụng</h3>\n<p>- Chức năng iClean: thiết bị sẽ đóng băng dàn lạnh, sau đó\nrã đông, cuốn trôi đi chất bẩn rồi mới làm khô các bộ phận bên trong dàn lạnh, ngăn ngừa vi khuẩn, nấm mốc hình\nthành và phát triển. Nhờ đó, giúp duy trì khả năng làm lạnh tốt, giảm chi phí vệ sinh máy.&nbsp;</p>\n<p>- <strong>Tự khởi động lại sau khi có điện</strong>: khi máy bị ngắt đột ngột do cúp điện, vào thời điểm có điện lại,\nthiết bị sẽ tự động chạy theo thiết lập đã cài đặt trước đó.</p>\n<p>- <strong>Cơ chế bảo vệ an toàn kép phát hiện rò rỉ thông minh</strong>: giúp kéo dài tuổi thọ máy, cho người dùng an\ntâm hơn khi sử dụng thiết bị.&nbsp;</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/2002/302745/casper-tc-09is35-280223-125313.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Casper Inverter 1 HP TC-09IS35 - Đa dạng tiện ích sử dụng\"\n    src=\"https://cdn.tgdd.vn/Products/Images/2002/302745/casper-tc-09is35-280223-125313.jpg\"\n   ></a></p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<p><em>Có thể thấy rằng, dòng&nbsp;máy lạnh Inverter&nbsp;này sở hữu các công nghệ tiên tiến như công\nnghệ tiết kiệm điện&nbsp;I-saving lọc không khí, chế độ làm lạnh nhanh Turbo, cảm biến nhiệt độ iFeel, cơ chế\nbảo vệ an toàn kép phát hiện rò rỉ thông minh,... cùng với mức công suất 1 HP, là thiết bị tốt cho phòng có diện\ntích dưới&nbsp;15m².</em></p>', 36, 1100, 1),
(5, 1, 'Máy lạnh Midea Inverter MSAGA-13CRDN8', 17, 'P5_avt.jpg', 4, '<p><em><strong>Máy lạnh Midea Inverter 1.5 HP MSAGA-13CRDN8 có khả năng làm lạnh nhanh nhờ công\n    nghệ</strong></em><i><strong> Boost&nbsp;</strong></i><em><strong>và cho hiệu quả tiết kiệm điện đáng kể\n    nhờ&nbsp;</strong></em><strong><i>Inverter Quattroi, Eco và Gear</i></strong><em><strong>. Hơn nữa, máy lạnh\n    còn có thể hút ẩm, thích hợp sử dụng trong những ngày trời ẩm ướt, mưa gió khó chịu.</strong></em></p>\n<h3>Thiết kế</h3>\n<p><strong>Dàn lạnh:</strong></p>\n<p>- <strong>Máy lạnh Midea Inverter 1.5 HP MSAGA-13CRDN8</strong> sở hữu <strong>gam màu trắng với chất liệu vỏ máy\nbằng nhựa cao cấp</strong>, có độ bền tốt.</p>\n<p>- Mặt trước dàn lạnh còn được <strong>thiết kế thêm màn hình hiển thị nhiệt độ</strong>, giúp người dùng quan sát\nnhanh chóng nhiệt độ của máy lạnh đang hoạt động.</p>\n<p><strong>Dàn nóng:</strong></p>\n<p>- Có kiểu <strong>hình hộp chữ nhật gọn gàng, màu trắng</strong> với phần vỏ máy cứng cáp.</p>\n<p>- Lá tản nhiệt bên trong dàn lạnh và dàn nóng làm <strong>bằng nhôm</strong>.</p>\n<p>- <strong>Ống dẫn gas bằng đồng</strong> cho hiệu quả truyền nhiệt tốt và bền bỉ.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/302747/may-lanh-midea-inverter-15-hp-msaga-13crdn8-090523-052005.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Midea Inverter 1.5 HP MSAGA-13CRDN8\"\n    src=\"https://cdn.tgdd.vn/Products/Images/2002/302747/may-lanh-midea-inverter-15-hp-msaga-13crdn8-090523-052005.jpg\"></a>\n</p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3>Công nghệ làm lạnh</h3>\n<p>- Máy lạnh Midea có công suất hoạt động <strong>1.5 HP</strong>, phù hợp diện tích căn\nphòng từ <strong>15 - 20m²</strong>.</p>\n<p>- Sản phẩm có khả năng <strong>làm lạnh, hút ẩm</strong> hoặc có thể <strong>chỉ sử dụng quạt</strong> để làm mát.\n</p>\n<p>- <strong>Chế độ làm lạnh nhanh Boost</strong>: Máy lạnh có thể <strong>hạ nhanh chóng nhiệt độ</strong> trong căn\nphòng đến nhiệt độ được cài đặt, nhờ đó giúp người dùng tận hưởng được bầu không khí mát lạnh trong khoảng thời gian\nngắn nhất sau khi kích hoạt chế độ này.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/302747/may-lanh-midea-inverter-15-hp-msaga-13crdn8-2.jpg\"\nonclick=\"return false;\"><img\n    alt=\"Máy lạnh Midea Inverter 1.5 HP MSAGA-13CRDN8 - Công suất 1.5HP phù hợp diện tích căn phòng từ 15 - 20m2, trang bị chế độ làm lạnh nhanh Boost \"\n    src=\"https://cdn.tgdd.vn/Products/Images/2002/302747/may-lanh-midea-inverter-15-hp-msaga-13crdn8-2.jpg\"></a>\n</p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3>Cơ chế thổi gió</h3>\n<p>- <strong>Chế độ chỉ sử dụng quạt Fan Only</strong>: Khi kích hoạt chế độ Fan Only, máy lạnh Midea 1.5 HP này sử dụng\nbộ phận quạt bên trong dàn lạnh\n<strong>để làm mát, chứ không tỏa ra hơi lạnh</strong>, phù hợp dùng trong những ngày trời mát thuận tiện mà không\ncần phải sử dụng quạt điện thông thường.\n</p>\n<p>- <strong>Cảm biến nhiệt độ Follow me trên remote</strong>: Máy lạnh sẽ điều chỉnh cánh đảo gió <strong>hướng về khu\nvực có đặt remote để nhanh chóng hạ nhiệt độ</strong> (đến nhiệt độ mà người dùng cài đặt), giúp người dùng luôn\ncảm thấy mát đều khi ở xung quanh khu vực có đặt remote máy lạnh.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/302747/may-lanh-midea-inverter-15-hp-msaga-13crdn8-3.jpg\"\nonclick=\"return false;\"><img\n    alt=\"Máy lạnh Midea Inverter 1.5 HP MSAGA-13CRDN8 - Trang bị chế độ quạt chỉ làm mát không làm lạnh phù hợp cho những ngày trời ẩm ướt\"\n    src=\"https://cdn.tgdd.vn/Products/Images/2002/302747/may-lanh-midea-inverter-15-hp-msaga-13crdn8-3.jpg\"></a>\n</p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3>Các công nghệ tiết kiệm điện</h3>\n<p>- Máy lạnh Midea Inverter 1.5 HP này có khả năng tiết kiệm\nđiện.</p>\n<p>- <strong>Trang bị công nghệ Inverter Quattro</strong>: Kết hợp <strong>4 chức năng</strong> giúp máy lạnh Midea đạt\nhiệu quả làm lạnh cao nhất mà vẫn sử dụng điện tiết kiệm, hoạt động tốt trong cả điều kiện môi trường khắc nghiệt.\nTrong đó, nổi bật là:&nbsp;</p>\n<ul>\n<li><strong>Chức năng Gear</strong>: Cho phép người dùng tự điều chỉnh công suất theo<strong> 3 mức</strong>:\n<strong>50%, 75% và 100%</strong> theo nhu cầu sử dụng, để tiết kiệm điện theo ý muốn người dùng.\n</li>\n<li><strong>Chức năng iEco</strong>: Đảm bảo giấc ngủ ngon cho người dùng suốt 8 tiếng mà vẫn mang lại hiệu quả\n<strong>tiết kiệm điện đến 60%</strong> mà máy lạnh tiêu thụ.\n</li>\n</ul>\n<h3>Khả năng lọc không khí - sức khoẻ</h3>\n<p>- <strong>Công nghệ Dual Filtration</strong>: Có khả năng loại bỏ bụi bẩn và vi khuẩn tối ưu,<strong> giúp bầu không\nkhí bên trong căn phòng luôn tươi mát</strong>, góp phần bảo vệ sức khỏe cho người dùng.</p>\n<p>- <strong>Bộ lọc bụi 2 lớp HD</strong>: Giúp <strong>lọc sạch hiệu quả các hạt bụi mịn</strong> (kể cả bụi mịn\nPM2.5)<strong> và nhiều tác nhân gây dị ứng khác </strong>bên trong không khí, nhằm bảo vệ sức khỏe cho người dùng.\n</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/302747/may-lanh-midea-inverter-15-hp-msaga-13crdn8-4.jpg\"\nonclick=\"return false;\"><img\n    alt=\"Máy lạnh Midea Inverter 1.5 HP MSAGA-13CRDN8 - Công nghệ Dual Filtration loại bỏ bụi bẩn và vi khuẩn tối ưu, mang lại bầu không khí sạch khuẩn cho căn phòng\"\n    src=\"https://cdn.tgdd.vn/Products/Images/2002/302747/may-lanh-midea-inverter-15-hp-msaga-13crdn8-4.jpg\"></a>\n</p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3>Tiện ích</h3>\n<p>- <strong>Chức năng hút ẩm</strong>: Giúp không khí bên trong căn phòng<strong> luôn khô ráo, tránh gây cảm giác khó\nchịu</strong> cho người dùng vào những ngày trời ẩm ướt khi nằm máy lạnh.</p>\n<p>- <strong>Hẹn giờ bật tắt máy</strong>: Giúp người dùng <strong>kiểm soát thời gian hoạt động của máy lạnh</strong>,\nphù hợp sử dụng khi ngủ, để không làm ảnh hưởng đến giấc ngủ ngon và đảm bảo hiệu quả tiết kiệm điện.</p>\n<p>- <strong>Chức năng tự làm sạch</strong>: Có khả năng tự động sấy khô hệ thống làm mát bên trong dàn lạnh,\n<strong>tránh cho vi khuẩn và nấm mốc phát triển,</strong> làm ảnh hưởng đến độ bền máy cũng như đảm bảo hiệu quả\nlàm mát mà sản phẩm mang lại.\n</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/302747/tien-ich-midea-inverter-15-hp-msaga-13crdn8.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Midea Inverter 1.5 HP MSAGA-13CRDN8\"\n    src=\"https://cdn.tgdd.vn/Products/Images/2002/302747/tien-ich-midea-inverter-15-hp-msaga-13crdn8.jpg\"></a>\n</p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<p><em>Tóm lại, máy lạnh Midea Inverter 1.5 HP MSAGA-13CRDN8 có khả năng hút ẩm và hẹn giờ bật tắt tiện lợi cho việc sử\ndụng. Ngoài ra, máy lạnh cũng cho khả năng tiết kiệm điện đáng kể và làm mát nhanh, hiệu quả trong suốt quá\ntrình sử dụng.</em></p>\n', 36, 850, 1),
(6, 2, 'Máy giặt Sharp ES-Y75HV-S', 6, 'P6_avt.jpg', 3, '<p><i><strong>Máy giặt Sharp 7.5 kg ES-Y75HV-S có khối lượng giặt 7.5 kg phù hợp với gia đình có 2 - 3 thành viên, được\n    trang bị 4 chương trình giặt đáp ứng được nhu cầu giặt giũ cơ bản của gia đình.</strong></i></p>\n<h3>Tổng quan thiết kế</h3>\n<p>- Máy giặt có kiểu dáng máy giặt cửa trên - lồng đứng, gam màu xám dễ dàng kết hợp với nội thất trong gia đình.</p>\n<p>-&nbsp;Máy giặt Sharp&nbsp;có bảng điều\nkhiển <strong>tiếng Việt</strong>, nút nhấn điều khiển dễ dàng các chương trình giặt.</p>\n<p>- Nắp máy được làm bằng <strong>nhựa ABS</strong> chắc chắn, sử dụng bền lâu.</p>\n<p>- Lồng giặt được làm từ <strong>kim loại sơn tĩnh điện</strong> bền bỉ, an toàn và thân thiện với môi trường.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1944/310181/sharp-75-kg-es-y75hv-s-120923-104430.jpg\"\nonclick=\"return false;\"><img alt=\"Máy giặt Sharp 7.5 Kg ES-Y75HV-S - Thiết kế\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1944/310181/sharp-75-kg-es-y75hv-s-120923-104430.jpg\"></a></p>\n<h3>Khối lượng giặt và chương trình giặt</h3>\n<p>- Khối lượng giặt<strong>&nbsp;</strong>7.5 kg phù hợp cho nhu cầu sử dụng của gia đình <strong>2 - 3 thành viên</strong>, có thể\ngiặt được <strong>10 - 12 bộ quần áo/lần giặt.</strong></p>\n<p>- Tích hợp sẵn<strong> 4&nbsp;chương trình giặt</strong> cơ bản: Giặt nhanh, giặt thường, giặt nhẹ, đồ dày. Chương\ntrình giặt nhanh giúp bạn làm sạch nhanh quần áo với quần áo mỏng nhẹ hoặc khối lượng quần áo ít.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1944/310181/sharp-75-kg-es-y75hv-s-120923-104423.jpg\"\nonclick=\"return false;\"><img alt=\"Máy giặt Sharp 7.5 Kg ES-Y75HV-S - Chương trình giặt\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1944/310181/sharp-75-kg-es-y75hv-s-120923-104423.jpg\"></a></p>\n<h3>Công nghệ giặt đặc biệt</h3>\n<p><strong>Công nghệ Fuzzy Logic</strong> tự động chọn chế độ giặt và lượng nước phù hợp với lượng đồ giặt có sẵn trong\nlồng giặt giúp tiết kiệm nước và thời gian giặt.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1944/310181/sharp-75-kg-es-y75hv-s-120923-104427.jpg\"\nonclick=\"return false;\"><img alt=\"Máy giặt Sharp 7.5 Kg ES-Y75HV-S - Công nghệ giặt\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1944/310181/sharp-75-kg-es-y75hv-s-120923-104427.jpg\"></a></p>\n<h3>Động cơ</h3>\n<p>Máy giặt được trang bị kiểu động cơ <strong>truyền\nđộng gián tiếp dây curoa</strong>, nhãn năng lượng 4 sao cùng công suất tiêu thụ điện <strong>13.93\nWh/kg.</strong></p>\n<h3>Tiện ích</h3>\n<p>- Khóa trẻ em: Khóa các phím chức năng khi kích hoạt tính năng này, giúp hạn chế trẻ đùa\nnghịch trên bảng điều khiển hoặc vô tình thao tác sai.</p>\n<p>- Hẹn giờ giặt: Lên lịch dễ dàng vào mốc thời gian mong muốn, đảm bảo có quần áo luôn sạch khi\ncần.</p>\n<p>- Tự khởi động lại khi có điện giúp quá trình giặt tiếp tục diễn ra đến hết chu trình giặt.\n</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1944/310181/sharp-75-kg-es-y75hv-s-120923-104428.jpg\"\nonclick=\"return false;\"><img alt=\"Máy giặt Sharp 7.5 Kg ES-Y75HV-S - Tiện ích\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1944/310181/sharp-75-kg-es-y75hv-s-120923-104428.jpg\"></a></p>\n<p><i>Nhìn chung, Máy giặt Sharp 7.5 kg ES-Y75HV-S là sự lựa chọn phù hợp cho gia đình có 2 - 3 thành viên, máy trang bị chương trình\ngiặt đáp ứng cơ bản cho nhu cầu giặt giũ thông thường của gia đình.</i></p>', 12, 1, 1),
(7, 2, 'Máy giặt LG AI DD Inverter FV1410S4B', 3, 'P7_avt.jpg', 5, '<p><strong><i>Máy giặt LG AI DD Inverter 10 kg FV1410S4B được tích hợp sẵn 14 chương trình giặt tiện lợi, công nghệ AI\n    DD chăm sóc thông minh giúp bảo vệ sợi vải, công nghệ giặt tiết kiệm TurboWash giặt sạch nhanh chóng, tiết\n    kiệm thời gian cùng công nghệ Inverter tiết kiệm điện năng, vận hành êm ái.</i></strong></p>\n<h3>Tổng quan thiết kế</h3>\n<p>- Kiểu dáng máy giặt cửa trước - lồng\nngang, với màu đen sang trọng kết hợp dễ dàng với nội thất trong nhà.</p>\n<p>- Máy giặt LG có bảng điều khiển <strong>song\nngữ Anh - Việt</strong>, núm xoay, nút nhấn, cảm ứng và có màn hình hiển thị giúp người dùng thuận tiện thao tác\nsử dụng.</p>\n<p>- Nắp máy giặt được làm bằng <strong>kính chịu lực</strong> dễ dàng vệ sinh và quan sát được bên trong.</p>\n<p>- Lồng giặt được làm từ <strong>thép không gỉ </strong>ngăn ngừa vi khuẩn có hại, giúp quần áo được sạch hơn, tăng độ\nbền cho máy giặt.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1944/310433/lg-fv1410s4b-170723-040135.jpg\"\nonclick=\"return false;\"><img alt=\"Máy giặt LG Inverter 10 kg FV1410S4B - Thiết kế\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1944/310433/lg-fv1410s4b-170723-040135.jpg\"></a></p>\n<p><i>*Hình ảnh chỉ mang tính chất minh họa sản phẩm</i></p>\n<h3>Khối lượng giặt và chương trình giặt</h3>\n<p>- Khối lượng giặt 10 kg\nphù hợp cho gia đình từ 5 - 7 thành viên hoặc giặt khoảng 15 - 16 bộ quần áo/lần giặt.</p>\n<p>- Tích hợp sẵn 14 chương trình giặt phù hợp cho nhu cầu giặt giữ khác nhau: TurboWash 59, giặt hơi nước đồ trẻ em,\ngiặt ngừa dị ứng, giặt nhanh 14 phút,... Chương trình giặt ngừa dị ứng giúp loại bỏ các mạt bụi\ncó thể gây dị ứng hoặc các vấn đề về hô hấp.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1944/310433/lg-fv1410s4b-170723-040822.jpg\"\nonclick=\"return false;\"><img alt=\"Máy giặt LG Inverter 10 kg FV1410S4B - Khối lượng giặt\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1944/310433/lg-fv1410s4b-170723-040822.jpg\"></a></p>\n<p><i>*Hình ảnh chỉ mang tính chất minh họa sản phẩm</i></p>\n<h3>Công nghệ đặc biệt</h3>\n<p>- Công nghệ AI DD chăm sóc thông minh, bảo vệ sợi vải, AI DD không chỉ phát hiện trọng lượng\nmà còn cảm nhận độ mềm của vải và tự chọn các chuyển động tối ưu cho vải.</p>\n<p>-\nCông nghệ giặt tiết kiệm TurboWash giặt sạch nhanh chóng, tiết kiệm thời gian giặt giũ. Nhờ sử dụng hai vòi\nxả nước tốc độ nhanh và mạnh, giúp các phân tử nước có thể thẩm thấu và đánh tan các bụi bẩn trong thời gian nhanh\nhơn. Ở chế độ xả vải, máy giặt xả sạch và nhanh hơn nhờ dòng nước áp lực cao. Bên cạnh đó, máy giặt còn quay với tốc\nđộ quay cao hơn, mang đến thời gian giặt nhanh hơn.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1944/310433/ai-dd-lg-fv1410s4b-3.jpg\"\nonclick=\"return false;\"><img alt=\"Máy giặt LG AI DD Inverter 10 kg FV1410S4B\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1944/310433/ai-dd-lg-fv1410s4b-3.jpg\"\n    title=\"Máy giặt LG AI DD Inverter 10 kg FV1410S4B\"></a></p>\n<p><i>*Hình ảnh chỉ mang tính chất minh họa sản phẩm</i></p>\n<h3>Động cơ - công nghệ tiết kiệm điện</h3>\n<p>- Được trang bị động cơ truyền động trực tiếp kết hợp cùng <strong>công nghệ Inverter </strong>giúp máy giặt vận hành\nêm ái, tiết kiệm điện năng.\n</p>\n<p>- Nhãn năng lượng chuẩn <strong>5 sao</strong>, hiệu suất sử dụng điện <strong>20 Wh/kg.</strong></p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1944/310433/inverter-lg-fv1410s4b-5.jpg\"\nonclick=\"return false;\"><img alt=\"Máy giặt LG Inverter 10 kg FV1410S4B - công nghệ inverter\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1944/310433/inverter-lg-fv1410s4b-5.jpg\"\n    title=\"Máy giặt LG Inverter 10 kg FV1410S4B - công nghệ inverter\"></a></p>\n<p><i>*Hình ảnh chỉ mang tính chất minh họa sản phẩm</i></p>\n<h3>Tiện ích</h3>\n<p>- Hẹn giờ giặt: Lên lịch dễ dàng với mốc thời gian mong muốn, đảm bảo quần áo luôn sạch sẽ khi\nbạn cần.</p>\n<p>- Khóa trẻ em: Khóa các phím chức năng khi bật tính năng này lên, giúp tránh tình trạng trẻ\nthao tác trên bảng điều khiển.</p>\n<p>- Thêm đồ trong khi giặt: Dễ dàng thêm đồ khi máy đang hoạt động mà bạn vô tình sót quần áo\ncần giặt.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1944/310433/tien-ich-lg-fv1410s4b-7.jpg\"\nonclick=\"return false;\"><img alt=\"Máy giặt LG Inverter 10 kg FV1410S4B\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1944/310433/tien-ich-lg-fv1410s4b-7.jpg\"\n    title=\"Máy giặt LG Inverter 10 kg FV1410S4B\"></a></p>\n<p><i>*Hình ảnh chỉ mang tính chất minh họa sản phẩm</i></p>\n<p>- <strong>Điều khiển từ xa thông qua ứng dụng LG ThinQ</strong> giúp bạn chủ động trong việc cho máy hoạt động, theo\ndõi lượng điện năng tiêu thụ cũng như biết được máy đang gặp vấn đề gì.</p>\n<p><i>Máy giặt LG AI DD Inverter 10 kg FV1410S4B khối lượng giặt 10 kg phù hợp cho gia đình 5 - 7 thành viên hoặc\nkhoảng 15 - 16 bộ quần áo/lần giặt, đa dạng lựa chọn chương trình giặt phù hợp với 14 chương trình giặt.</i></p>\n', 12, 1200, 1);
INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `supplier_id`, `product_avt_img`, `product_rate`, `product_description`, `product_period`, `product_view_count`, `product_is_display`) VALUES
(8, 2, 'Máy giặt LG AI DD Inverter \nFV1410S4P', 3, 'P8_avt.jpg', 4, '<h3 style=\"text-align: justify;\">Thiết kế hiện đại, nhỏ gọn với gam màu tinh tế</h3>\n<p style=\"text-align: justify;\">Máy giặt LG AI DD Inverter 10 kg FV1410S4P&nbsp;có kiểu dáng nhỏ gọn cùng tông màu tinh tế\n    phù hợp với mọi không gian nội thất của gia đình Việt.&nbsp;</p>\n<p style=\"text-align: justify;\">Bảng điều khiển song ngữ Anh – Việt có nút xoay và màn hình LED hiển thị rõ ràng, giúp\n    người dùng dễ dàng thao tác và sử dụng.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1944/255492/lg-inverter-10-kg-fv1410s4p-210322-034423.jpg\"\n        onclick=\"return false;\"><img\n            alt=\"Máy giặt LG Inverter 10 kg FV1410S4P - Thiết kế hiện đại, nhỏ gọn với gam màu tinh tế\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1944/255492/lg-inverter-10-kg-fv1410s4p-210322-034423.jpg\"\n            title=\"Máy giặt LG Inverter 10 kg FV1410S4P - Thiết kế hiện đại, nhỏ gọn với gam màu tinh tế\"></a></p>\n<p style=\"text-align: justify;\"><em style=\"text-align: justify;\">*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3 style=\"text-align: justify;\">Tiện lợi với 14 chương trình giặt khác nhau được tích hợp sẵn</h3>\n<p style=\"text-align: justify;\">Chiếc máy giặt LG cửa trước này được tích hợp 14 chương trình giặt khác\n    nhau, bao gồm: chu trình tải về, giặt\n    chăn ga, giặt hơi nước đồ trẻ em, giặt ngừa dị ứng, giặt nhanh 30 phút, giặt nhẹ, giặt tay + đồ len, giặt tiết kiệm\n    cotton, và 6 chương trình giặt khác.&nbsp;</p>\n<p style=\"text-align: justify;\">Trong đó, chương trình giặt ngừa dị ứng được giặt ở nhiệt độ cao, tiêu diệt tối đa các\n    chất gây dị ứng, phù hợp dùng cho quần áo trẻ em hoặc những người có làn da nhạy cảm.&nbsp;</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1944/255492/lg-inverter-10-kg-fv1410s4p-210322-034427.jpg\"\n        onclick=\"return false;\"><img\n            alt=\"Máy giặt LG Inverter 10 kg FV1410S4P - Tiện lợi với 14 chương trình giặt khác nhau được tích hợp sẵn\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1944/255492/lg-inverter-10-kg-fv1410s4p-210322-034427.jpg\"\n            title=\"Máy giặt LG Inverter 10 kg FV1410S4P - Tiện lợi với 14 chương trình giặt khác nhau được tích hợp sẵn\"></a></p>\n<p style=\"text-align: justify;\"><em style=\"text-align: justify;\">*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3 style=\"text-align: justify;\">Khối lượng giặt 10 kg\n    phù hợp cho gia đình từ 5 - 7 thành viên</h3>\n<p style=\"text-align: justify;\">Nếu bạn có nhu cầu lựa chọn máy giặt cho gia đình từ 5 - 7 thành viên hoặc khối lượng đồ\n    giặt hàng ngày nhiều thì máy giặt LG này với khối lượng giặt 10 kg sẽ là một lựa chọn đáng cân nhắc.&nbsp;</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1944/255492/lg-inverter-10-kg-fv1410s4p-210322-034420.jpg\"\n        onclick=\"return false;\"><img\n            alt=\"Máy giặt LG Inverter 10 kg FV1410S4P - Khối lượng giặt 10 kg phù hợp cho gia đình từ 5 - 7 thành viên\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1944/255492/lg-inverter-10-kg-fv1410s4p-210322-034420.jpg\"\n            title=\"Máy giặt LG Inverter 10 kg FV1410S4P - Khối lượng giặt 10 kg phù hợp cho gia đình từ 5 - 7 thành viên\"></a>\n</p>\n<p style=\"text-align: justify;\"><em style=\"text-align: justify;\">*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3 style=\"text-align: justify;\">Bảo vệ sợi vải, giữ dáng quần áo nhờ công nghệ AI DD</h3>\n<p style=\"text-align: justify;\">Chiếc máy giặt LG Inverter này còn được trang bị ứng dụng trí tuệ nhân tạo\n    AI không những phát hiện chính xác khối lượng đồ giặt mà còn cảm nhận được độ mềm của sợi vải. Từ đó tối ưu chương\n    trình giặt cho phù hợp.&nbsp;</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1944/255492/may-giat-lg-inverter-10-kg-fv1410s4p-sp08.jpg\"\n        onclick=\"return false;\"><img\n            alt=\"Máy giặt LG Inverter 10 kg FV1410S4P - Bảo vệ sợi vải, giữ dáng quần áo nhờ công nghệ AI DD\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1944/255492/may-giat-lg-inverter-10-kg-fv1410s4p-sp08.jpg\"\n            title=\"Máy giặt LG Inverter 10 kg FV1410S4P - Bảo vệ sợi vải, giữ dáng quần áo nhờ công nghệ AI DD\"></a></p>\n<p style=\"text-align: justify;\"><em style=\"text-align: justify;\">*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3 style=\"text-align: justify;\">Giặt nhanh hơn và sạch hơn với công nghệ TurboWash</h3>\n<p style=\"text-align: justify;\">Điểm nổi bật ở chiếc máy giặt này là công nghệ TurboWash cho hiệu quả giặt sạch trong\n    thời gian ngắn. Công nghệ Turbo Wash sử dụng vòi xả nước mạnh từ các phía trong lồng giặt với tốc độ cao giúp các\n    vết bẩn trên quần áo được loại bỏ nhanh hơn.&nbsp;</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1944/255492/lg-inverter-10-kg-fv1410s4p-210322-034437.jpg\"\n        onclick=\"return false;\"><img\n            alt=\"Máy giặt LG Inverter 10 kg FV1410S4P - Giặt nhanh hơn và sạch hơn với công nghệ TurboWash\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1944/255492/lg-inverter-10-kg-fv1410s4p-210322-034437.jpg\"\n            title=\"Máy giặt LG Inverter 10 kg FV1410S4P - Giặt nhanh hơn và sạch hơn với công nghệ TurboWash\"></a></p>\n<p style=\"text-align: justify;\"><em style=\"text-align: justify;\">*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3 style=\"text-align: justify;\">Loại bỏ tác nhân gây dị ứng, giảm nhăn nhờ công nghệ giặt hơi nước\n        Steam</h3>\n<p style=\"text-align: justify;\">Nhờ công nghệ giặt hơi nước, máy giặt LG có khả năng diệt khuẩn\n    tối ưu đến 99.99%, loại bỏ các tác nhân dị ứng trên quần áo bằng hơi nước nóng, giúp bảo vệ làn da và sức khỏe của\n    người dùng. Bên cạnh đó, công nghệ này còn giúp giảm nhăn quần áo và hạn chế phai màu sợi vải.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1944/255492/lg-inverter-10-kg-fv1410s4p-210322-034439.jpg\"\n        onclick=\"return false;\"><img\n            alt=\"Máy giặt LG Inverter 10 kg FV1410S4P - Loại bỏ tác nhân gây dị ứng, giảm nhăn nhờ công nghệ giặt hơi nước Steam\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1944/255492/lg-inverter-10-kg-fv1410s4p-210322-034439.jpg\"\n            title=\"Máy giặt LG Inverter 10 kg FV1410S4P - Loại bỏ tác nhân gây dị ứng, giảm nhăn nhờ công nghệ giặt hơi nước Steam\"></a>\n</p>\n<p style=\"text-align: justify;\"><em style=\"text-align: justify;\">*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<p style=\"text-align: justify;\"><i>*Hiệp hội dị ứng Anh quốc Allergy UK là một tổ chức từ thiện hàng đầu về y tế dành\n        cho người bị dị ứng, được thành lập vào năm 1991 với tên gọi Quỹ Dị ứng của Anh (British Allergy Foundation –\n        BAF). Đến năm 2002, tổ chức đổi tên thành Allergy UK.</i></p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1944/255492/lg-inverter-10-kg-fv1410s4p-251121-084936.jpg\"\n        onclick=\"return false;\"><img alt=\"Kết quả chứng nhận thử nghiệm công nghệ giặt hơi nước Steam\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1944/255492/lg-inverter-10-kg-fv1410s4p-251121-084936.jpg\"\n           title=\"Kết quả chứng nhận thử nghiệm công nghệ giặt hơi nước Steam\"></a></p>\n<p style=\"text-align: justify;\"><i>Công nghệ hơi nước Steam trên máy giặt LG được Cố vấn Khoa học về Dị ứng Vương quốc\n        Anh công nhận có thể loại bỏ 99,9% vi khuẩn gây bệnh.</i></p>\n<h3 style=\"text-align: justify;\">Giảm thiểu hư tổn, chăm sóc sợi vải thông minh nhờ công nghệ 6 Motion DD</h3>\n<p style=\"text-align: justify;\">Bằng cách mô phỏng theo các bước giặt bằng tay như đập, nén, đảo, nhào trộn, quay và chà\n    xát, công nghệ giặt 6 chuyển động giúp quần áo vừa sạch sâu mà không bị xoắn rối, giảm thiểu nguy cơ sờn rách sợi\n    vải, đảm bảo quần áo của gia đình được bền đẹp lâu hơn.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1944/255492/may-giat-lg-inverter-10-kg-fv1410s4p-sp03.jpg\"\n        onclick=\"return false;\"><img\n            alt=\"Máy giặt LG Inverter 10 kg FV1410S4P - Giảm thiểu hư tổn, chăm sóc sợi vải thông minh nhờ công nghệ 6 Motion DD\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1944/255492/may-giat-lg-inverter-10-kg-fv1410s4p-sp03.jpg\"\n            title=\"Máy giặt LG Inverter 10 kg FV1410S4P - Giảm thiểu hư tổn, chăm sóc sợi vải thông minh nhờ công nghệ 6 Motion DD\"></a>\n</p>\n<p style=\"text-align: justify;\"><em style=\"text-align: justify;\">*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3 style=\"text-align: justify;\">Tiết kiệm điện, vận hành ổn định với công nghệ Inverter</h3>\n<p style=\"text-align: justify;\">Máy giặt LG Inverter 10 kg FV1410S4P&nbsp;được trang bị công nghệ Inverter không chỉ\n    giúp máy vận hành ổn định mà còn góp phần tiết kiệm điện năng hiệu quả. Nhờ đó, bạn không còn phải lo lắng về chi\n    phí tiền điện, nước hàng tháng.&nbsp;</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1944/255492/lg-inverter-10-kg-fv1410s4p-210322-034431.jpg\"\n        onclick=\"return false;\"><img\n            alt=\"Máy giặt LG Inverter 10 kg FV1410S4P - Tiết kiệm điện, vận hành ổn định với công nghệ Inverter\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1944/255492/lg-inverter-10-kg-fv1410s4p-210322-034431.jpg\"\n            title=\"Máy giặt LG Inverter 10 kg FV1410S4P - Tiết kiệm điện, vận hành ổn định với công nghệ Inverter\"></a>\n</p>\n<p style=\"text-align: justify;\"><em style=\"text-align: justify;\">*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3 style=\"text-align: justify;\">Hạn chế việc sót quần áo khi giặt với tính năng Add Item</h3>\n<p style=\"text-align: justify;\">Với tính năng này, người dùng dễ dàng thêm đồ vào máy kể cả khi máy đang hoạt động chỉ\n    với thao tác đơn giản, không lo sót quần áo khi giặt.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1944/255492/lg-inverter-10-kg-fv1410s4p-210322-034435.jpg\"\n        onclick=\"return false;\"><img\n            alt=\"Máy giặt LG Inverter 10 kg FV1410S4P - Hạn chế việc sót quần áo khi giặt với tính năng Add Item\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1944/255492/lg-inverter-10-kg-fv1410s4p-210322-034435.jpg\"\n            title=\"Máy giặt LG Inverter 10 kg FV1410S4P - Hạn chế việc sót quần áo khi giặt với tính năng Add Item\"></a>\n</p>\n<p style=\"text-align: justify;\"><em style=\"text-align: justify;\">*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3 style=\"text-align: justify;\">Điều khiển máy giặt từ xa thông qua ứng dụng Smart\n        ThinQ</h3>\n<p style=\"text-align: justify;\">Bạn có thể kết nối máy giặt&nbsp;này với ứng dụng Smart ThinQ để điều khiển từ xa, hẹn giờ giặt và\n    lựa chọn chương trình giặt phù hợp.&nbsp;</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1944/255492/lg-inverter-10-kg-fv1410s4p-210322-034429.jpg\"\n        onclick=\"return false;\"><img alt=\"Máy giặt LG Inverter 10 kg FV1410S4P - Smart ThinQ\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1944/255492/lg-inverter-10-kg-fv1410s4p-210322-034429.jpg\"\n            title=\"Máy giặt LG Inverter 10 kg FV1410S4P - Smart ThinQ\"></a></p>\n<p style=\"text-align: justify;\"><em>*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<p style=\"text-align: justify;\">Nhìn chung, với những tính năng và công nghệ hiện đại như giặt hơi nước, công nghệ\n    Inverter, công nghệ giặt 6 Motion DD kết hợp trí thông minh nhân tạo AI DD thì chiếc máy giặt LG Inverter 10 kg\n    FV1410S4P sẽ là lựa chọn lý tưởng cho gia đình từ 5 - 7 thành viên.&nbsp;</p>', 12, 950, 1),
(9, 2, 'Máy giặt Whirlpool Inverter FWEB8002FW', 18, 'P9_avt.jpg', 4.6, '<p style=\"text-align: justify;\"><strong><i>Máy giặt Whirlpool\n    FreshCare Inverter 8 kg FWEB8002FW</i></strong><em><strong><strong>&nbsp;</strong>sở hữu động cơ\ntruyền động gián tiếp với công nghệ Inverter giúp máy vận hành êm ái và tiết kiệm điện năng. Công nghệ cảm\nbiến thông minh 6th SENSE tự động điều chỉnh lượng nước giặt dựa trên khối lượng quần áo giúp tiết kiệm điện\nvà nước đến 45%.</strong></em></p>\n<h3 style=\"text-align: justify;\">Tổng quan thiết kế</h3>\n<p style=\"text-align: justify;\">- Kiểu dáng: máy giặt cửa trước – lồng ngang. Gam màu trắng tinh tế\nlàm nổi bật sự sang trọng cho không gian phòng giặt giũ.</p>\n<p style=\"text-align: justify;\">- <strong>Bảng điều khiển cảm ứng Tiếng Anh</strong> cùng <strong>màn hình LED</strong>\nhiển thị thông số rõ ràng. Ngôn ngữ hiển thị của máy giặt Whirlpool là tiếng Anh, điều này đôi\nkhi sẽ gây bất tiện cho người sử dụng, đặc biệt là những người lớn tuổi trong nhà.&nbsp;</p>\n<p style=\"text-align: justify;\">- Nắp máy màu đen được làm bằng chất liệu <strong>mạ chrome,</strong>&nbsp;chắc chắn cho\nphần cửa máy giặt.&nbsp;</p>\n<p style=\"text-align: justify;\">- Lồng giặt bằng <strong>thép không gỉ </strong>cao cấp giúp hạn chế tối đa mảng bám và\ngỉ sét trong quá trình sử dụng.&nbsp;</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1944/275564/whirlpool-fweb8002fw-040422-113743.jpg\"\nonclick=\"return false;\"><img alt=\"Máy giặt Whirlpool Inverter 8 kg FWEB8002FW - Tổng quan thiết kế\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1944/275564/whirlpool-fweb8002fw-040422-113743.jpg\"\ntitle=\"Máy giặt Whirlpool Inverter 8 kg FWEB8002FW - Tổng quan thiết kế\"></a></p>\n<p style=\"text-align: justify;\"><em style=\"text-align: justify;\">* Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3 style=\"text-align: justify;\">Khối lượng giặt và chương trình giặt</h3>\n<p style=\"text-align: justify;\">- Khối lượng giặt <strong>tối đa 8 kg</strong>, phù hợp sử dụng cho những <strong>gia\nđình từ 3 – 5 người</strong> hoặc gia đình có ít thành viên hơn nhưng nhu cầu giặt giũ cao.&nbsp;</p>\n<p style=\"text-align: justify;\">- <strong>Tích hợp 10 chương trình giặt tiện lợi</strong> phù hợp với chất liệu quần áo\nvà mục đích giặt khác nhau: đồ len, giặt ngừa dị ứng, giặt nhanh, giặt tiết kiệm,… Chương trình giặt ngừa dị ứng giúp loại bỏ hiệu quả các chất gây dị ứng, đặc biệt an toàn với làn da\ntrẻ nhỏ.&nbsp;</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1944/275564/whirlpool-fweb8002fw-031122-043544.jpg\"\nonclick=\"return false;\"><img\nalt=\"Máy giặt Whirlpool Inverter 8 kg FWEB8002FW - Khối lượng giặt và chương trình giặt\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1944/275564/whirlpool-fweb8002fw-031122-043544.jpg\"\ntitle=\"Máy giặt Whirlpool Inverter 8 kg FWEB8002FW - Khối lượng giặt và chương trình giặt\"></a></p>\n<p style=\"text-align: justify;\"><em style=\"text-align: justify;\">* Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3 style=\"text-align: justify;\">Công nghệ giặt đặc biệt</h3>\n<p style=\"text-align: justify;\">- <strong>Công nghệ cảm biến thông minh 6th SENSE</strong> tự động điều chỉnh lượng\nnước, vòng quay phù hợp với khối lượng quần áo cần giặt, tiết kiệm điện và nước đến 45%.</p>\n<p style=\"text-align: justify;\">- <strong>Chương trình giặt sát khuẩn Sanitize Wash</strong> tiêu diệt vi khuẩn và loại\nbỏ các chất gây dị ứng trong quá trình giặt, an toàn cho làn da nhạy cảm, đặc biệt là trẻ nhỏ.&nbsp;</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1944/275564/whirlpool-fweb8002fw-040422-113825.jpg\"\nonclick=\"return false;\"><img alt=\"Máy giặt Whirlpool Inverter 8 kg FWEB8002FW - Công nghệ giặt đặc biệt\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1944/275564/whirlpool-fweb8002fw-040422-113825.jpg\"\ntitle=\"Máy giặt Whirlpool Inverter 8 kg FWEB8002FW - Công nghệ giặt đặc biệt\"></a></p>\n<p style=\"text-align: justify;\"><em style=\"text-align: justify;\">* Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3 style=\"text-align: justify;\">Tiết kiệm điện năng</h3>\n<p style=\"text-align: justify;\">- Kiểu động cơ: <strong>Truyền động gián tiếp (dây Curoa)</strong> tích hợp công nghệ Inverter giúp máy vận hành ổn định, êm ái, đồng thời cải\nthiện hiệu suất giặt, tiết kiệm điện năng sử dụng cho gia đình.&nbsp;</p>\n<p style=\"text-align: justify;\">- Nhãn năng lượng <strong>chuẩn 5 sao</strong>, hiệu suất sử dụng điện là <strong>12.5\nWh/kg</strong>.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1944/275564/whirlpool-fweb8002fw-040422-113844.jpg\"\nonclick=\"return false;\"><img alt=\"Máy giặt Whirlpool Inverter 8 kg FWEB8002FW - Tiết kiệm điện năng\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1944/275564/whirlpool-fweb8002fw-040422-113844.jpg\"\ntitle=\"Máy giặt Whirlpool Inverter 8 kg FWEB8002FW - Tiết kiệm điện năng\"></a></p>\n<p style=\"text-align: justify;\"><em style=\"text-align: justify;\">* Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3 style=\"text-align: justify;\">Tiện ích</h3>\n<p style=\"text-align: justify;\">- Khóa trẻ em: tránh trường hợp trẻ nhỏ thao tác\nvận hành trên bảng điều khiển.</p>\n<p style=\"text-align: justify;\">- Thêm đồ trong khi giặt: hạn chế bỏ sót quần áo\ntrong khi giặt.&nbsp;</p>\n<p style=\"text-align: justify;\">- Tự khởi động lại khi có điện: máy giặt có khả\nnăng ghi nhớ chương trình giặt khi bị cúp điện đột ngột. Nếu có điện trở lại, bạn chỉ cần bấm nút Start, máy giặt sẽ tiếp\ntục vận hành theo chương trình giặt đã ghi nhớ, giúp tiết kiệm tối ưu thời gian và năng lượng.&nbsp;</p>\n<p style=\"text-align: justify;\">- <strong>Khử trùng lồng giặt ở 90°C</strong> giúp ngăn chặn sự phát triển của vi khuẩn,\nnấm mốc, bảo vệ an toàn cho cả gia đình.&nbsp;</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1944/275564/whirlpool-fweb8002fw-040422-113901.jpg\"\nonclick=\"return false;\"><img alt=\"Máy giặt Whirlpool Inverter 8 kg FWEB8002FW - Tiện ích\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1944/275564/whirlpool-fweb8002fw-040422-113901.jpg\"\ntitle=\"Máy giặt Whirlpool Inverter 8 kg FWEB8002FW - Tiện ích\"></a></p>\n<p style=\"text-align: justify;\"><em>* Hình ảnh chỉ mang tính chất minh họa</em></p>\n<p style=\"text-align: justify;\"><em>Nhìn chung, <strong>máy giặt Whirlpool Inverter 8 kg FWEB8002FW</strong> được trang\nbị công nghệ Inverter tiết kiệm điện, công nghệ cảm biến thông minh 6th SENSE, chương trình giặt sát khuẩn\nSanitize Wash, khử trùng lồng giặt ở 90 độ C,… cùng 10 chương trình giặt được tích hợp sẵn. Với khối lượng giặt\ntối đa 8 kg sẽ là sự lựa chọn tuyệt vời cho những gia đình từ 3 - 5 thành viên.&nbsp;&nbsp;</em></p>', 12, 1100, 1),
(10, 2, 'Máy giặt Samsung Inverter WW10TP44DSB/SV', 1, 'P10_avt.jpg', 4.3, '<h3>Phân tích độ bẩn, tối ưu chu trình giặt với công nghệ giặt thông minh AI Wash</h3>\n<p>Máy giặt Samsung Inverter 10kg WW10TP44DSB/SV\n    sử dụng công nghệ giặt thông minh AI Wash khi được trang bị 4 loại cảm biến bao gồm: <strong>độ bẩn</strong> và\n    <strong>khối lượng đồ</strong>, <strong>lượng nước, lượng nước giặt/xả</strong> nhờ đó tối ưu hóa được chu trình\n    giặt, giúp bạn không cần phải tính toán nhiều khi giặt nữa.\n</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1944/236508/samsung-10kg-ww10tp44dsb-sv-150823-050757.jpg\"\n        onclick=\"return false;\"><img alt=\"Máy giặt Samsung Inverter 10 kg WW10TP44DSB/SV - Công nghệ giặt AI Wash\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1944/236508/samsung-10kg-ww10tp44dsb-sv-150823-050757.jpg\"\n            title=\"Máy giặt Samsung Inverter 10 kg WW10TP44DSB/SV - Công nghệ giặt AI Wash\"></a></p>\n<h3>Ghi nhớ tự động, đề xuất chế độ giặt phù hợp nhờ bảng điều khiển thông minh AI Control</h3>\n<p>Chiếc máy giặt Samsung này được trang bị bảng điều khiển thông minh AI có khả\n    năng <strong>ghi nhớ thói quen sử dụng</strong>, từ đó <strong>đề xuất</strong> cho bạn chế độ giặt và cài đặt yêu\n    thích. Hơn nữa, màn hình hiển thị thông minh các quy trình giặt, giúp người dùng dễ hiểu và thao tác nhanh chóng hơn\n    khi sử dụng.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1944/236508/samsung-10kg-ww10tp44dsb-sv-150823-050758.jpg\"\n        onclick=\"return false;\"><img alt=\"Máy giặt Samsung Inverter 10 kg WW10TP44DSB/SV - Bảng điều khiển AI Control\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1944/236508/samsung-10kg-ww10tp44dsb-sv-150823-050758.jpg\"\n            title=\"Máy giặt Samsung Inverter 10 kg WW10TP44DSB/SV - Bảng điều khiển AI Control\"></a></p>\n<p>Không những thế, bạn còn có thể điều khiển máy từ xa thông qua điện thoại, chỉ cần&nbsp;điện thoại thông\n    minh&nbsp;cài đặt ứng dụng SmartThings là bạn có thể\n    điều khiển các chức năng máy giặt dễ dàng, bạn có thể điều khiển ở mọi nơi, bất cứ khi nào mà bạn muốn.</p>\n<p><em><strong>Lưu ý:&nbsp;</strong>SmartThings không thể khởi động máy giặt, bạn cần bật nguồn điện cho máy trước để có\n        thể sử dụng.</em></p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1944/236508/samsung-10kg-ww10tp44dsb-sv-150823-050808.jpg\"\n        onclick=\"return false;\"><img\n            alt=\"Máy giặt Samsung Inverter 10 kg WW10TP44DSB/SV - Điều khiển từ xa qua ứng dụng SmartThing\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1944/236508/samsung-10kg-ww10tp44dsb-sv-150823-050808.jpg\"\n            title=\"Máy giặt Samsung Inverter 10 kg WW10TP44DSB/SV - Điều khiển từ xa qua ứng dụng SmartThing\"></a></p>\n<h3>Phân bổ nước giặt xả tối ưu với ngăn nước giặt xả AI Dispenser</h3>\n<p>Chỉ cần đổ một lần nước giặt và nước xả vào ngăn AI Dispenser, mỗi khi hoạt động thì ngăn thông minh này sẽ tự động\n    phân bổ lượng nước giặt/xả nhờ vào cảm biến khối lượng đồ và độ bẩn của AI Wash giúp tối ưu lượng chất giặt xả.</p>\n<p>Nhờ có AI Dispenser mà bạn không cần tính toán lượng chất giặt xả cần dùng và sử dụng tiết kiệm hơn. Với mỗi lần đổ\n    đầy, bạn có thể dùng lên đến 14 lần giặt (tùy vào lượng đồ, chất liệu đồ và độ bẩn mà số lần có thể thay đổi).</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1944/236508/samsung-10kg-ww10tp44dsb-sv-150823-050800.jpg\"\n        onclick=\"return false;\"><img alt=\"Máy giặt Samsung Inverter 10 kg WW10TP44DSB/SV - Tự phân bổ nước giặt\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1944/236508/samsung-10kg-ww10tp44dsb-sv-150823-050800.jpg\"\n            title=\"Máy giặt Samsung Inverter 10 kg WW10TP44DSB/SV - Tự phân bổ nước giặt\"></a></p>\n<h3>Tạo bọt xà phòng siêu mịn, tăng cường hiệu quả giặt sạch cùng công nghệ EcoBubble</h3>\n<p>Máy giặt Samsung WW10TP44DSB/SV còn sử dụng công nghệ EcoBubble cho phép đánh tan nước giặt/bột giặt thành những bong\n    bóng xà phòng siêu mịn, những bọt này thẩm thấu nhanh và sâu vào bên trong sợi vải để loại bỏ vết bẩn cứng đầu dễ\n    dàng.</p>\n<p>Công nghệ này giúp hiệu quả giặt sạch hơn đến <strong>24%</strong>, chống phai màu quần áo và bảo vệ chất liệu vải\n    được tốt hơn đến <strong>45%.</strong></p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1944/236508/samsung-10kg-ww10tp44dsb-sv-150823-050801.jpg\"\n        onclick=\"return false;\"><img alt=\"Máy giặt Samsung Inverter 10 kg WW10TP44DSB/SV - Công nghệ bong bóng\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1944/236508/samsung-10kg-ww10tp44dsb-sv-150823-050801.jpg\"\n            title=\"Máy giặt Samsung Inverter 10 kg WW10TP44DSB/SV - Công nghệ bong bóng\"></a></p>\n<h3>Làm sạch sâu, rút ngắn thời gian giặt giũ nhờ công nghệ QuickDrive</h3>\n<p>Công nghệ QuickDrive là sự kết hợp của 3 yếu tố: công nghệ EcoBubble, vòi phun nước mạnh, tốc độ xoay của lồng giặt\n    giúp đẩy nhanh thời gian thẩm thấu của bọt xà phòng siêu mịn vào trong sợi vải, góp phần giảm thời gian giặt xuống\n    chỉ còn<strong> 39 phút.</strong></p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1944/236508/samsung-10kg-ww10tp44dsb-sv-150823-050803.jpg\"\n        onclick=\"return false;\"><img alt=\"Máy giặt Samsung Inverter 10 kg WW10TP44DSB/SV - Công nghệ QuickDrive\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1944/236508/samsung-10kg-ww10tp44dsb-sv-150823-050803.jpg\"\n            title=\"Máy giặt Samsung Inverter 10 kg WW10TP44DSB/SV - Công nghệ QuickDrive\"></a></p>\n<h3>Giảm thiểu độ ồn, chống rung tốt với công nghệ VRT Plus™</h3>\n<p>Mẫu <a href=\"https://www.dienmayxanh.com/may-giat-samsung?g=tu-95-10-kg-5-7-nguoi\" target=\"_blank\"\n        title=\"xem thêm máy giặt Samsung 10kg\" type=\"xem thêm máy giặt Samsung 10kg\">máy giặt Samsung 10kg</a> này được\n    trang bị công nghệ VRT Plus™ có khả năng <strong>cảm biến được mức độ rung lắc</strong> của lồng giặt khi hoạt động,\n    từ đó điều chỉnh lại để giảm bớt độ rung ồn với <strong>hiệu suất lên đến 30%</strong> cũng như tối ưu hóa quá trình\n    vận hành của động cơ máy giặt.&nbsp;</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1944/236508/samsung-10kg-ww10tp44dsb-sv-150823-050804.jpg\"\n        onclick=\"return false;\"><img alt=\"Máy giặt Samsung Inverter 10 kg WW10TP44DSB/SV - Công nghệ chống rung\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1944/236508/samsung-10kg-ww10tp44dsb-sv-150823-050804.jpg\"\n            title=\"Máy giặt Samsung Inverter 10 kg WW10TP44DSB/SV - Công nghệ chống rung\"></a></p>\n<h3>Tiêu thụ điện năng hiệu quả, vận hành êm nhờ động cơ Digital Inverter</h3>\n<p>Động cơ Digital Inverter cũng góp phần giúp cho chiếc máy giặt Samsung lồng\n    ngang này được hoạt động êm ái và bền bỉ khi trang bị <strong>nam châm vĩnh cửu,</strong> nhằm giảm thiểu\n    mức độ ma sát giữa các động cơ khi máy giặt vận hành.</p>\n<p>Công nghệ này cũng giúp cho chiếc máy giặt sử dụng tiết kiệm điện năng hơn, bền bỉ hơn.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1944/236508/samsung-10kg-ww10tp44dsb-sv-150823-050806.jpg\"\n        onclick=\"return false;\"><img alt=\"Máy giặt Samsung Inverter 10 kg WW10TP44DSB/SV - Công nghệ Inverter\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1944/236508/samsung-10kg-ww10tp44dsb-sv-150823-050806.jpg\"\n            title=\"Máy giặt Samsung Inverter 10 kg WW10TP44DSB/SV - Công nghệ Inverter\"></a></p>\n<h3>Khối lượng giặt 10 kg, phù hợp gia đình 5 - 7 người</h3>\n<p>Samsung Inverter WW10TP44DSB/SV đáp ứng nhu cầu giặt giũ cho những gia đình có từ <strong>5 - 7</strong> người với\n    khối lượng 10 kg, hoặc\n    những hộ gia đình có nhu cầu làm sạch số lượng quần áo nhiều trong mỗi lần giặt giũ.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1944/236508/Slider/samsung-10kg-ww10tp44dsb-sv-280321-1038579.jpg\"\n        onclick=\"return false;\"><img\n            alt=\"Máy giặt Samsung Inverter 10kg WW10TP44DSB/SV-Khối lượng giặt 10kg, phù hợp gia đình 5 - 7 người\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1944/236508/Slider/samsung-10kg-ww10tp44dsb-sv-280321-1038579.jpg\"></a>\n</p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<p><em>Tóm lại, Samsung Inverter 10kg WW10TP44DSB/SV là chiếc máy giặt phù hợp cho những gia đình từ 5 - 7 người. Thiết\n        bị được trang bị nhiều công nghệ thông minh giúp cho việc giặt giũ trở nên nhanh chóng mà vẫn mang lại hiệu quả\n        tiết kiệm điện nước và chất giặt tẩy. Đây chắc chắn là chiếc máy giặt mà bạn không thể bỏ qua cho nhu cầu sắp\n        tới.</em></p>\n', 12, 850, 1),
(11, 3, 'Google Tivi TCL 4K 58P635 ', 5, 'P11_avt.jpg', 4.2, '<p style=\"text-align: justify;\"><i><strong>Google Tivi TCL 4K 58 inch 58P635 sở hữu\n    thiết kế sang trọng, màn hình siêu mỏng kích thước 58 inch, độ phân giải 4K sắc nét, công nghệ HDR10 tối ưu\n    độ sáng, độ tương phản cho trải nghiệm xem phim tuyệt vời. Tích hợp hệ điều hành Google TV với giao diện\n    trực quan, dễ sử dụng cùng kho ứng dụng giải trí đa dạng, phong phú.&nbsp;</strong></i></p>\n<h3 style=\"text-align: justify;\">Tổng quan thiết kế</h3>\n<p style=\"text-align: justify;\">- Google Tivi TCL 58P635 có thiết kế liền mạch, kiểu dáng sang trọng, đường viền siêu\nmỏng. Màn hình kích thước 58 inch phù hợp cho phòng khách, phòng làm việc, phòng ngủ, phòng họp,…</p>\n<p style=\"text-align: justify;\">- <strong>Chân đế chữ V úp ngược</strong> bằng nhựa cao cấp, được thiết kế gần 2 góc của\ntivi giúp giữ cân bằng cho sản phẩm giúp đặt để chắc chắn trên kệ tủ.&nbsp;</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/303927/google-tivi-tcl-4k-58-inch-58p635-170323-090926.png\"\nonclick=\"return false;\"><img alt=\"Google Tivi TCL 4K 58 inch 58P635 - Thiết kế\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1942/303927/google-tivi-tcl-4k-58-inch-58p635-170323-090926.png\"\n    title=\"Google Tivi TCL 4K 58 inch 58P635 - Thiết kế\"></a>\n</p>\n<p style=\"text-align: justify;\"><em>* Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3 style=\"text-align: justify;\">Công nghệ hình ảnh</h3>\n<p style=\"text-align: justify;\">- <strong>Độ phân giải 4K</strong> cho độ nét gấp 4 lần\nFull HD.&nbsp;</p>\n<p style=\"text-align: justify;\">- Công nghệ <strong>HDR10 </strong>hay còn gọi là dải tương phản\nđộng cao, là tính năng tăng thêm độ tương phản và màu sắc trên tivi, vùng sáng lẫn vùng tối được thể hiện đầy đủ chi\ntiết trên một khung hình.&nbsp;<br>- Chế độ <strong>Game Mode</strong> giúp tối ưu hóa cài đặt của tivi sao cho phù\nhợp với các thiết bị trò chơi điện tử như Xbox, Play Station. Đồng thời, chế độ này cho phép tivi bỏ qua 1 số bộ xử\nlý trên video từ trò chơi.&nbsp;</p>\n<p style=\"text-align: justify;\">Mời bạn xem thêm:&nbsp;Những độ phân giải màn hình phổ biến hiện nay trên tivi</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/303927/google-tivi-tcl-4k-58-inch-58p635-170323-085619.jpg\"\nonclick=\"return false;\"><img alt=\"Google Tivi TCL 4K 58 inch 58P635 - Công nghệ hình ảnh\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1942/303927/google-tivi-tcl-4k-58-inch-58p635-170323-085619.jpg\"\n    title=\"Google Tivi TCL 4K 58 inch 58P635 - Công nghệ hình ảnh\"></a>\n</p>\n<p style=\"text-align: justify;\"><em style=\"text-align: justify;\">* Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3 style=\"text-align: justify;\">Công nghệ âm thanh</h3>\n<p style=\"text-align: justify;\">- <strong>Tivi</strong> sở hữu <strong>2 loa</strong> với <strong>tổng công suất loa\n19W.</strong></p>\n<p style=\"text-align: justify;\">- Công nghệ <strong>Dolby Audio</strong> tạo hiệu ứng âm thanh vòm phát ra từ\nnhiều hướng, đồng thời cải thiện độ chi tiết của âm thanh, từ đó chất âm trở nên truyền cảm, trung thực hơn.&nbsp;\n</p>\n<p style=\"text-align: justify;\">- <strong>DTS (Digital Theater Systems)</strong>\nlà công nghệ âm thanh kỹ thuật số, cho phép giả lập hiệu ứng âm thanh 9.1, cho chất lượng âm thanh hoàn hảo\nhơn.&nbsp;</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/303927/google-tivi-tcl-4k-58-inch-58p635-170323-085453.jpg\"\nonclick=\"return false;\"><img alt=\"Google Tivi TCL 4K 58 inch 58P635 - Công nghệ âm thanh\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1942/303927/google-tivi-tcl-4k-58-inch-58p635-170323-085453.jpg\"\n    title=\"Google Tivi TCL 4K 58 inch 58P635 - Công nghệ âm thanh\"></a></p>\n<p style=\"text-align: justify;\"><em style=\"text-align: justify;\">* Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3 style=\"text-align: justify;\">Hệ điều hành</h3>\n<p style=\"text-align: justify;\">- <strong>Hệ điều hành Google TV</strong> với thiết kế giao diện thân thiện với người\ndùng, đơn giản, dễ sử dụng.</p>\n<p style=\"text-align: justify;\">- Hệ điều hành với hơn <strong>700.000 ứng dụng</strong>, hỗ trợ cả tiếng Việt và tiếng\nAnh, trong đó có nhiều ứng dụng phổ biến như YouTube, Netflix, Clip TV, FPT Play, VieON, trình duyệt web,…cho bạn\nthỏa sức khám phá và giải trí.&nbsp;</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/303927/google-tivi-tcl-4k-58-inch-58p635-170323-085512.jpg\"\nonclick=\"return false;\"><img alt=\"Google Tivi TCL 4K 58 inch 58P635 - Hệ điều hành\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1942/303927/google-tivi-tcl-4k-58-inch-58p635-170323-085512.jpg\"\n    title=\"Google Tivi TCL 4K 58 inch 58P635 - Hệ điều hành\"></a></p>\n<p style=\"text-align: justify;\"><em style=\"text-align: justify;\">* Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3 style=\"text-align: justify;\">Tiện ích</h3>\n<p style=\"text-align: justify;\">- <strong>Tìm kiếm bằng giọng nói tiếng\nViệt trên YouTube</strong>, hỗ trợ trợ lý ảo <strong>Google Assistant</strong>.&nbsp;</p>\n<p style=\"text-align: justify;\">- Điều khiển tivi bằng điện thoại qua ứng dụng <strong>Google Cast</strong>.</p>\n<p style=\"text-align: justify;\">- Trang bị <strong>remote thông minh tích\nhợp micro tìm kiếm bằng giọng nói</strong>.&nbsp;</p>\n<p style=\"text-align: justify;\">- Trình chiếu hình ảnh, video từ điện thoại lên màn hình tivi qua tính năng\n<strong>Chromecast</strong>, <a\nhref=\"https://www.dienmayxanh.com/kinh-nghiem-hay/cach-dieu-khien-smart-tivi-tcl-2016-bang-dien-thoa-832578\"\ntarget=\"_blank\"\ntitle=\"4 cách điều khiển Smart tivi TCL bằng điện thoại cực đơn giản, tiện lợi\"><strong>T-Cast</strong></a>.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/303927/google-tivi-tcl-4k-58-inch-58p635-170323-085401.jpg\"\nonclick=\"return false;\"><img alt=\"Google Tivi TCL 4K 58 inch 58P635 - Tiện ích\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1942/303927/google-tivi-tcl-4k-58-inch-58p635-170323-085401.jpg\"\n    title=\"Google Tivi TCL 4K 58 inch 58P635 - Tiện ích\"></a></p>\n<p style=\"text-align: justify;\"><em style=\"text-align: justify;\">* Hình ảnh chỉ mang tính chất minh họa</em></p>\n<p style=\"text-align: justify;\"><em>Nhìn chung, với thiết kế sang trọng, màn hình 58 inch độ phân giải 4K sắc nét, tái\ntạo khung hình sinh động với HDR10, đem đến chất âm sinh động, rõ ràng nhờ Dolby Audio, hệ điều hành Google TV\nvới hơn 700.000 ứng dụng phong phú, điều khiển linh hoạt bằng giọng nói tiếng Việt,… Google Tivi TCL 4K 58 inch\n58P635 là chiếc tivi mà bạn không thể bỏ qua.&nbsp;</em></p>\n', 12, 1, 1),
(12, 3, 'Smart Tivi QLED 4K Samsung QA55Q65A', 1, 'P12_avt.jpg', 4.6, '<p><strong>Lưu ý</strong></p>\n<p>- Khách hàng đang sử dụng sản phẩm TV Samsung có trợ lý ảo Google sẽ không thể tiếp tục sử dụng tính năng này từ ngày\n    01/03/2024.&nbsp;</p>\n<p>- Sản phẩm được trang bị trợ lý Bixby tiếng Việt sẽ được kích hoạt dự kiến tháng 03/2024.&nbsp;</p>\n<h3>Thiết kế thanh mảnh, màn hình tràn viền 4 cạnh ấn tượng</h3>\n<p>>Smart Tivi QLED 4K 55 inch Samsung QA55Q65A với thiết kế\n    với màn hình tràn viền 4 cạnh, cho người dùng trải nghiệm khung hình giải trí trên tivi chân thực như thực tế đang\n    xảy ra trước mắt.</p>\n<p>Tivi Samsung 55 inch có chân đế\n    được thiết kế gọn gàng, vững chắc. Mang lại sự thanh lịch, sang trọng cho chiếc tivi, phù hợp trưng bày ở phòng\n    khách, phòng ngủ,...</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1942/235642/2.jpg\" onclick=\"return false;\"><img\n            alt=\"Thiết kế - Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1942/235642/2.jpg\"\n            title=\"Thiết kế - Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"></a></p>\n<h3>Hình ảnh sắc nét với gần 8.3 triệu điểm ảnh nhờ độ phân giải 4K</h3>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1942/235642/3.jpg\" onclick=\"return false;\"><img\n            alt=\"Độ phân giải 4K - Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1942/235642/3.jpg\"\n            title=\"Độ phân giải 4K - Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"></a></p>\n<h3>Màu sắc hiển thị rực rỡ, tự nhiên với khả năng hiển thị 100% dải màu nhờ màn hình chấm lượng tử Quantum Dot (QLED)\n</h3>\n<p>Samsung trang bị cho chiếc Smart tivi này công nghệ màn hình chấm lượng tử\n    Quantum Dot với khả năng hiển thị 100% dải sắc màu, giúp người dùng có thể thưởng thức được những hình ảnh trên tivi\n    với màu sắc vô cùng rực rỡ và sống động.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1942/235642/4.jpg\" onclick=\"return false;\"><img\n            alt=\"Quantum Dot - Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1942/235642/4.jpg\"\n            title=\"Quantum Dot - Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"></a></p>\n<h3>Tối ưu tỷ lệ độ tương phản, tự động điều chỉnh màu sắc với bộ xử lý Quantum Lite mạnh mẽ</h3>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1942/235642/5.jpg\" onclick=\"return false;\"><img\n            alt=\"Quantum Lite - Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1942/235642/5.jpg\"\n            title=\"Quantum Lite - Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"></a></p>\n<h3>Hình ảnh được tăng cường độ tương phản nhờ công nghệ Quantum HDR</h3>\n<p><a href=\"https://www.dienmayxanh.com/tivi-samsung\" target=\"_blank\"\n        title=\"Xem thêm các tivi Samsung đang bán tại Điện máy XANH\">Tivi Samsung</a> với công nghệ Quantum HDR giúp\n    hình ảnh tăng cường độ tương phản, độ chi tiết hình ảnh. Người dùng có thể thưởng thức được những cảnh quay vô cùng\n    hoàn hảo và ấn tượng.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1942/235642/6.jpg\" onclick=\"return false;\"><img\n            alt=\"Quantum HDR - Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1942/235642/6.jpg\"\n            title=\"Quantum HDR - Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"></a></p>\n<h3>Kiểm soát đèn nền tốt nhờ công nghệ đèn nền Dual LED</h3>\n<p>Công nghệ đèn nền Dual LED cho phép điều chỉnh nhiệt độ màu sắc để chính xác hơn. Từ đó giúp cải thiện ánh sáng, độ\n    tương phản cao hơn. Giúp người xem có thể trải nghiệm những nội dung chất lượng màu sắc hình ảnh tối ưu nhất.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1942/235642/7.jpg\" onclick=\"return false;\"><img\n            alt=\"Dual LED - Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1942/235642/7.jpg\"\n            title=\"Dual LED - Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"></a></p>\n<h3>Nâng cao khả năng hiển thị màu sắc, màu đen sâu, màu trắng tinh khiết nhờ công nghệ <a\n        href=\"https://www.dienmayxanh.com/kinh-nghiem-hay/cong-nghe-hinh-anh-tren-tivi-samsung-838738#supreme-uhd-dimming\"\n        target=\"_blank\" title=\"Supreme UHD Dimming\">Supreme UHD Dimming</a></h3>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1942/235642/8.jpg\" onclick=\"return false;\"><img\n            alt=\"Supreme UHD Dimming - Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1942/235642/8.jpg\"\n            title=\"Supreme UHD Dimming - Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"></a></p>\n<h3>Các cảnh chuyển động mượt mà, không bị nhòe nhờ công nghệ Motion Xcelerator Turbo</h3>\n<p>Người xem có thể tận hưởng những phút giây giải trí, những khung hình game tuyệt đẹp và dễ dàng chiến thắng mọi thử\n    thách trên chiếc tivi Samsung 4K này. Bởi vì được trang bị\n    công nghệ Motion Xcelerator Turbo giúp hình ảnh mượt mà, đặc biệt các cảnh chuyển không bị rung lắc.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1942/235642/9.jpg\" onclick=\"return false;\"><img\n            alt=\"Motion Xcelerator Turbo - Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1942/235642/9.jpg\"\n            title=\"Motion Xcelerator Turbo - Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"></a></p>\n<h3><br>Trải nghiệm âm thanh vòm chuyển động theo hình ảnh mạnh mẽ nhờ công nghệ Object Tracking Sound Lite (OTS Lite)\n</h3>\n<p>Công nghệ Object Tracking Sound Lite (OTS Lite) được trang bị nhiều loa, giúp người nghe cảm nhận âm thanh 3 chiều\n    sống động, chân thực như đang xem ở rạp chiếu phim.<a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1942/235642/11.jpg\" onclick=\"return false;\"><img\n            alt=\"Object Tracking Sound Lite (OTS Lite) - Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1942/235642/11.jpg\"\n            title=\"Object Tracking Sound Lite (OTS Lite) - Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"></a></p>\n<h3>Giao diện dễ dùng, kho ứng dụng phong phú với hệ điều hành Tizen™</h3>\n<p>Smart tivi Samsung có hệ điều hành\n    Tizen™ giao diện trực quan dễ dùng, thân thiện với các thành viên trong gia đình. Thỏa thích giải trí với kho ứng\n    dụng vô cùng phong phú như: Spotify, FPT Play, Galaxy Play, VTVCab ON, ClipTV,...&nbsp;</p>\n<h3><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1942/235642/qled-4k-samsung-qa55q65a-020823-025644.jpg\"\n        onclick=\"return false;\"><img alt=\"Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1942/235642/qled-4k-samsung-qa55q65a-020823-025644.jpg\"\n            title=\"Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"></a></h3>\n<h3>Điều khiển tivi bằng điện thoại dễ dàng thông qua ứng dụng <a\n        href=\"https://www.dienmayxanh.com/kinh-nghiem-hay/nhung-giao-dien-tivi-thong-minh-co-ban-nhat-hien-n-577614#tizen\"\n        target=\"_blank\" title=\"SmartThings\">SmartThings</a></h3>\n<h3><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1942/235642/13.jpg\" onclick=\"return false;\"><img\n            alt=\"SmartThings - Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1942/235642/13.jpg\"\n            title=\"SmartThings - Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"></a></h3>\n<h3>Thưởng thức hai nội dung trên màn hình tivi với tính năng Multi View</h3>\n<p>Với chiếc tivi này người xem sẽ không bỏ lỡ những chương trình, những phút giây của trận đấu quan trọng,... vì được\n    trang bị tính năng Multi View có thể chiếu hai nội dung song song cùng lúc, một bên là nội dung của tivi, còn một\n    bên nội dung chiếu từ màn hình điện thoại tivi.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1942/235642/15.jpg\" onclick=\"return false;\"><img\n            alt=\"tính năng Multi View\" src=\"https://cdn.tgdd.vn/Products/Images/1942/235642/15.jpg\"\n            title=\"tính năng Multi View\"></a></p>\n<h3>Chiếu màn hình điện thoại lên tivi đơn giản nhờ các tính năng AirPlay 2 (thiết bị Apple) và Tap View (Samsung)</h3>\n<p>Ngoài tính năng AirPlay 2 thì Samsung còn trang bị thêm cho chiếc tivi Samsung QLED này tính năng Tap View, người\n    dùng chỉ cần chạm nhẹ điện thoại vào các\n    cạnh tivi để nhận tín hiệu và từ đó có thể chia sẻ những video giải trí, hình ảnh từ điện thoại sang tivi một cách\n    dễ dàng.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1942/235642/Slider/qled-4k-samsung-qa55q65a-290321-09510115.jpg\"\n        onclick=\"return false;\"><img\n            alt=\"AirPlay 2 (thiết bị Apple) và Tap View (Samsung) - Smart Tivi QLED 4K 55 inch Samsung QA55Q65A\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1942/235642/Slider/qled-4k-samsung-qa55q65a-290321-09510115.jpg\"></a>\n</p>\n<h3>Đa dạng các cổng kết nối</h3>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1942/235642/Slider/Untitled-1-1020x571.png\"\n        onclick=\"return false;\"><img alt=\"Cổng kết nối\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1942/235642/Slider/Untitled-1-1020x571.png\"></a></p>\n\n', 24, 1200, 1);
INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `supplier_id`, `product_avt_img`, `product_rate`, `product_description`, `product_period`, `product_view_count`, `product_is_display`) VALUES
(13, 4, 'iPhone 15', 21, 'P13_avt.jpg', 4, '<h3><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-131023-034959.jpg\"\n    onclick=\"return false;\"><img alt=\"iPhone 15 Pro Max Tổng quan\"\n        src=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-131023-034959.jpg\" style=\"font-size: 13px;\"\n        title=\"iPhone 15 Pro Max Tổng quan\"></a></h3>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-131023-035001.jpg\"\n    onclick=\"return false;\"><img alt=\"iPhone 15 Pro Max Thông số kỹ thuật và tính năng\"\n        src=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-131023-035001.jpg\"\n        title=\"iPhone 15 Pro Max Thông số kỹ thuật và tính năng\"></a></p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-131023-035003.jpg\"\n    onclick=\"return false;\"><img alt=\"iPhone 15 Pro Max So sánh\"\n        src=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-131023-035003.jpg\"\n        title=\"iPhone 15 Pro Max So sánh\"></a></p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-131023-035005.jpg\"\n    onclick=\"return false;\"><img alt=\"iPhone 15 Pro Max Chuyển đổi\"\n        src=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-131023-035005.jpg\"\n        title=\"iPhone 15 Pro Chuyển đổi\"></a></p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-131023-035007.jpg\"\n    onclick=\"return false;\"><img alt=\"iPhone 15 Pro Max Phụ kiện\"\n        src=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-131023-035007.jpg\"\n        title=\"iPhone 15 Pro Max Phụ kiện\"></a></p>\n<h3><strong>So sánh iPhone 15 Pro Max&nbsp;1 TB và các sản phẩm iPhone 15 Series khác?</strong></h3>\n<h3><br>So sánh iPhone 15 Pro Max 1 TB và iPhone 14 Pro Max 1 TB: Có đáng để nâng cấp?</h3>\n<p><span style=\"text-align: justify;\">Dưới đây sẽ là bảng tổng hợp thông số kỹ thuật giữa hai thế hệ&nbsp;</span>điện\nthoại iPhone<span style=\"text-align: justify;\">:</span></p>\n<h3>Apple đã thông báo iPhone 15&nbsp;Pro&nbsp;Max&nbsp;1 TB tại sự kiện\nthường niên vào tháng 09/2023, máy thu hút sự quan tâm lớn nhờ việc trang bị chip mạnh Apple A17 Pro và chuyển đổi\nsang cổng kết nối Type-C thay vì sử dụng cổng Lightning như các phiên bản trước đó.</h3>\n<h3 style=\"text-align: justify;\">Thiết kế vuông vắn sang trọng</h3>\n<p style=\"text-align: justify;\">Về thiết kế, iPhone 15 Pro Max<span style=\"text-align: justify;\">&nbsp;1 TB</span> vẫn\nsẽ tiếp tục sử dụng kiểu dáng vuông vức đặc trưng như một vài thế hệ trước đây. Với bộ khung và mặt lưng làm phẳng,\nđiều này giúp tổng thể chiếc máy trở nên thanh lịch và sang trọng.</p>\n<p style=\"text-align: justify;\">Khác với những thế hệ trước, phần viền giờ đây sẽ không còn làm từ chất liệu thép không\ngỉ mà thay vào đó là Titanium. Loại vật liệu này làm tăng thêm phần cứng cáp cho khả năng chống chịu va đập và hạn\nchế hư hỏng tốt hơn. Ngoài ra, titanium còn tối ưu khối lượng để giúp máy nhẹ hơn nhằm tạo cảm giác cầm nắm thoải\nmái.</p>\n<p style=\"text-align: justify;\">Mặt lưng của iPhone 15 Pro Max<span style=\"text-align: justify;\">&nbsp;1 TB</span> được\nlàm từ kính cường lực cao cấp với lớp hoàn thiện kiểu nhám. Điều này tạo ra một sự kết hợp độc đáo giữa vẻ đẹp và\ntính chất chống trầy xước mang đến sự sang trọng và đẳng cấp cho thiết bị.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-130923-102854.jpg\"\n    onclick=\"return false;\"><img alt=\"Thiết kế điện thoại - iPhone 15 Pro Max\"\n        src=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-130923-102854.jpg\"\n        style=\"text-align: justify;\" title=\"Thiết kế điện thoại - iPhone 15 Pro Max\"></a></p>\n<p style=\"text-align: justify;\">iPhone 15 Pro Max<span style=\"text-align: justify;\">&nbsp;1 TB</span> tiếp tục sử dụng\n\"Dynamic Island\" dựa trên phần hình notch dạng tai thỏ. Đây là một sự kết hợp giữa sự đẹp mắt và trình thao tác ứng\ndụng nhanh, giúp người dùng dễ dàng truy cập và quản lý ứng dụng yêu thích một cách thuận tiện.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-130923-103025.jpg\"\n    onclick=\"return false;\"><img alt=\"Thiết kế điện thoại - iPhone 15 Pro Max\"\n        src=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-130923-103025.jpg\"\n        style=\"text-align: justify;\" title=\"Thiết kế điện thoại - iPhone 15 Pro Max\"></a></p>\n<p style=\"text-align: justify;\">Viền màn hình mỏng giúp tăng cường tỷ lệ màn hình so với thân máy, tạo ra một bề mặt\nhiển thị lớn hơn trong một thiết bị có kích thước tổng thể tương tự khi so với iPhone 14 Pro Max. Điều này đồng\nnghĩa với việc bạn sẽ có một không gian xem tuyệt đẹp để thưởng thức nội dung, từ phim ảnh đến ứng dụng và trò chơi.\n</p>\n<h3 style=\"text-align: justify;\">Hỗ trợ cổng kết nối Type-C</h3>\n<p style=\"text-align: justify;\">Một trong những cải tiến đáng chú ý nhất của iPhone 15 Pro Max<span\n    style=\"text-align: justify;\">&nbsp;1 TB</span> so với các thế hệ trước đó là việc thay thế cổng Lightning bằng\ncổng Type-C, một sự đổi mới quan trọng trong cách kết nối và sử dụng thiết bị của Apple.&nbsp;</p>\n<p style=\"text-align: justify;\">Cổng Type-C được biết đến với khả năng truyền dữ liệu nhanh chóng và hiệu quả. Sự chuyển\nđổi sang Type-C giúp iPhone 15 Pro Max<span style=\"text-align: justify;\">&nbsp;1 TB</span> có khả năng truyền tải\ntập tin lớn, sao lưu dữ liệu và đồng bộ hóa dễ dàng hơn bao giờ hết. Điều này đặc biệt hữu ích khi bạn muốn chia sẻ\nhình ảnh và video chất lượng cao hoặc sao lưu dữ liệu quan trọng nhanh chóng.</p>\n<p style=\"text-align: justify;\">Bên cạnh đó, cổng Type-C đã trở thành một tiêu chuẩn kết nối trong ngành công nghiệp\ncông nghệ, nó không chỉ dành riêng cho sản phẩm Apple. Điều này có nghĩa là bạn có thể sử dụng cùng một cáp và bộ\nsạc cho nhiều thiết bị khác nhau, từ laptop đến tai nghe và các thiết bị Android. Điều này mang lại sự tiện lợi và\ntiết kiệm không gian cho người dùng khi tối ưu bớt số lượng cáp sạc.</p>\n<h3 style=\"text-align: justify;\">Chụp ảnh sắc nét với camera 48 MP</h3>\n<p style=\"text-align: justify;\">Bộ 3 camera sau trên iPhone 15 Pro Max&nbsp;1 TB không chỉ đơn giản là một tập hợp các\nống kính mà là một cỗ máy chụp ảnh và quay video tinh tế, đáp ứng mọi nhu cầu của các nhiếp ảnh gia chuyên nghiệp và\nngười dùng thông thường.&nbsp;</p>\n<p style=\"text-align: justify;\">Camera chính với độ phân giải 48 MP là \"trái tim\" của hệ thống camera. Với khả năng chụp\nảnh sắc nét và chi tiết, là lựa chọn lý tưởng cho việc bắt gọn những khoảnh khắc đáng nhớ. Đặc biệt, độ phân giải\ncao này cho phép bạn zoom vào chi tiết mà không làm mất đi chất lượng.</p>\n<p style=\"text-align: justify;\">Ngoài ra, <span style=\"text-align: justify;\">chiếc&nbsp;</span>điện thoại chụp ảnh quay\nphim<span style=\"text-align: justify;\">&nbsp;này</span> còn được trang bị camera tele 12 MP, giúp bạn tiến gần vào\nđối\ntượng mà không mất đi chất lượng hình ảnh. Khả năng zoom quang học 5x cho phép bạn chụp ảnh từ xa mà vẫn giữ được độ\nnét và chi tiết, là lựa chọn tuyệt vời cho việc chụp chân dung hoặc các tình huống cần zoom xa.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-130923-103905.jpg\"\n    onclick=\"return false;\"><img alt=\"Camera điện thoại - iPhone 15 Pro Max\"\n        src=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-130923-103905.jpg\"\n        style=\"text-align: justify;\" title=\"Camera điện thoại - iPhone 15 Pro Max\"></a></p>\n<p style=\"text-align: justify;\">Cuối cùng là camera góc siêu rộng có độ phân giải 12 MP, camera này cho phép mở rộng góc\nnhìn để bạn chụp ảnh phong cảnh, kiến trúc hoặc những bức ảnh rộng lớn với độ rộng đặc biệt. Điều này làm nổi bật\ncác chi tiết và sự bao quát, tạo nên những bức ảnh ấn tượng.</p>\n<p style=\"text-align: justify;\">Với tốc độ khung hình 60 fps (khung hình mỗi giây) đi cùng với chuẩn 4K, vì thế video\nquay được từ điện thoại sẽ trở nên mượt mà và sắc nét hơn. Điều này đặc biệt quan trọng khi bạn muốn ghi lại các\nchuyển động nhanh như thể thao, nhảy cá nhân hoặc video chuyển động đầy hấp dẫn.&nbsp;</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-130923-103910.jpg\"\n    onclick=\"return false;\"><img alt=\"Camera điện thoại - iPhone 15 Pro Max\"\n        src=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-130923-103910.jpg\"\n        style=\"text-align: justify;\" title=\"Camera điện thoại - iPhone 15 Pro Max\"></a></p>\n<p style=\"text-align: justify;\">Để đảm bảo rằng bạn luôn có những bức ảnh và video mượt mà và không bị mờ, iPhone 15 Pro\nMax&nbsp;1 TB được trang bị tính năng chống rung. Điều này đặc biệt hữu ích trong điều kiện ánh sáng yếu hoặc khi\nbạn đang quay video di động.</p>\n<p style=\"text-align: justify;\">Camera trước với độ phân giải 12 MP đảm bảo rằng mọi cuộc gọi video của bạn sẽ đạt độ\nnét cao và chất lượng hình ảnh xuất sắc. Khả năng chụp ảnh tự sướng cũng trở nên thú vị hơn khi bạn có thể tạo ra\nnhững bức ảnh tự sướng sắc nét với màu sắc tươi sáng và độ chi tiết cao.</p>\n<p style=\"text-align: justify;\">Hơn nữa, camera trước của điện thoại còn được trang bị tính năng quay video 4K. Bạn có\nthể ghi lại các video vlog chất lượng cao, chia sẻ cuộc trò chuyện video với độ phân giải đỉnh cao hoặc tạo ra nội\ndung video chuyên nghiệp trực tiếp từ điện thoại di động của mình.</p>\n<h3 style=\"text-align: justify;\">Trang bị màn hình OLED 6.7 inch</h3>\n<p style=\"text-align: justify;\">iPhone 15 Pro Max&nbsp;1 TB sử dụng tấm nền OLED, một công nghệ màn hình tiên tiến. OLED\ntạo ra màu sắc tươi sáng và độ tương phản cao, giúp mọi hình ảnh và video trở nên sống động và chân thực.</p>\n<p style=\"text-align: justify;\">Hơn hết, màn hình của iPhone 15 Pro Max&nbsp;1 TB còn được hỗ trợ nhiều công nghệ màn\nhình khác như True Tone, HDR và dải màu DCI-P3 giúp tái tạo màu một cách chuẩn xác để mang đến cảm nhận chân thực\nkhi xem nội dung.</p>\n<p style=\"text-align: justify;\">Với độ phân giải Super Retina XDR lên tới 1290 x 2796 pixel, mọi nội dung trên màn hình\ntrở nên sắc nét và rõ ràng. Khả năng hiển thị độ chi tiết cao giúp bạn thưởng thức hình ảnh và video với độ chân\nthực tuyệt đỉnh.</p>\n<p style=\"text-align: justify;\">Màn hình lớn với kích thước 6.7 inch giúp bạn chiêm ngưỡng nội dung một cách rộng rãi.\nXem phim, chơi trò chơi hoặc làm việc trên màn hình rộng này trở nên dễ dàng và thoải mái. Ngoài ra, điện thoại còn\nhỗ trợ tần số quét 120 Hz để tạo ra hiệu ứng mượt mà và phản hồi nhanh chóng, tạo cảm giác đã mắt khi xem phim hay\nchơi game.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-130923-104241.jpg\"\n    onclick=\"return false;\"><img alt=\"Màn hình điện thoại - iPhone 15 Pro Max\"\n        src=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-130923-104241.jpg\"\n        style=\"text-align: justify;\" title=\"Màn hình điện thoại - iPhone 15 Pro Max\"></a></p>\n<p style=\"text-align: justify;\">iPhone 15 Pro Max&nbsp;1 TB có khả năng đạt độ sáng tối đa lên tới 2000 nits, cho phép\nbạn sử dụng điện thoại một cách dễ dàng dưới ánh nắng mặt trời mạnh mẽ.\nĐộ sáng này làm cho mọi nội dung trên màn hình nổi bật và rực rỡ. Giờ đây người dùng có thể dễ dàng xem bản đồ để\nvừa di chuyển hay trả lời tin nhắn ngoài trời nắng gắt mà ít gặp phải khó khăn.</p>\n<p style=\"text-align: justify;\">Mặt kính cường lực được sử dụng trên iPhone 15 Pro Max&nbsp;1 TB là một loại mặt kính\nchất lượng cao, chế tạo từ vật liệu Ceramic Shield chống trầy xước và chống va đập. Điều này giúp màn hình điện\nthoại bền bỉ hơn, hạn chế được các vấn đề hư hỏng trước các vết trầy xước nhỏ do tiếp xúc với vật cứng như chìa khóa\nhoặc tiền xu trong túi.</p>\n<h3 style=\"text-align: justify;\">Trang bị chip Apple A17 Pro</h3>\n<p style=\"text-align: justify;\">Vi xử lý Apple A17 Pro là mẫu chip mới trong năm 2023 và được Apple cho ra mắt lần đầu\ntiền trên iPhone 15 Pro Max&nbsp;1 TB. Với sự nâng cấp mạnh về sức mạnh, nó mang đến hiệu năng đỉnh cao và khả năng\nxử lý nhanh chóng cho bất kỳ tác vụ. Điều này không chỉ đảm bảo rằng bạn có thể chạy mọi ứng dụng mượt mà mà còn cho\nphép bạn thực hiện nhiều tác vụ đồng thời mà không gặp trở ngại.</p>\n<p style=\"text-align: justify;\">Với RAM 8 GB, iPhone 15 Pro Max&nbsp;1 TB không bao giờ bị hạn chế bởi sự thiếu hụt bộ\nnhớ. Bạn có thể chơi các trò chơi đòi hỏi sự mượt mà và đồ họa cao, chỉnh sửa ảnh và video chuyên nghiệp hoặc duyệt\nweb với nhiều tab mà không lo ngại về hiệu suất. RAM lớn này đảm bảo rằng mọi tác vụ được thực hiện nhanh chóng và\nhiệu quả.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-130923-104358.jpg\"\n    onclick=\"return false;\"><img alt=\"Cấu hình điện thoại - iPhone 15 Pro Max\"\n        src=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-130923-104358.jpg\"\n        style=\"text-align: justify;\" title=\"Cấu hình điện thoại - iPhone 15 Pro Max\"></a></p>\n<p style=\"text-align: justify;\">iOS 17 là phiên bản hệ điều hành mới nhất của Apple, được thiết kế để tối ưu hóa tối đa\nhiệu năng của thiết bị. Với sự tương tác mượt mà, tính năng bảo mật nâng cao và nhiều cải tiến về sáng tạo, iOS 17\ngiúp bạn tận dụng tối đa sức mạnh của <span style=\"text-align: justify;\">c</span><span\n    style=\"text-align: justify;\">chiếc&nbsp;</span>điện thoại chơi game cấu hình cao.</p>\n<h3 style=\"text-align: justify;\">Pin lớn đi cùng khả năng sạc nhanh</h3>\n<p style=\"text-align: justify;\">Với dung lượng pin lên tới 4422 mAh, iPhone 15 Pro Max&nbsp;1 TB mang đến thời lượng pin\nđáng kinh ngạc. Bạn có thể sử dụng điện thoại cả ngày mà không cần lo lắng về việc sạc lại. Điều này đặc biệt hữu\ních khi bạn đang du lịch hoặc sử dụng ứng dụng đòi hỏi nhiều năng lượng.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-130923-104602.jpg\"\n    onclick=\"return false;\"><img alt=\"Pin và sạc điện thoại - iPhone 15 Pro Max\"\n        src=\"https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-130923-104602.jpg\"\n        style=\"text-align: justify;\" title=\"Pin và sạc điện thoại - iPhone 15 Pro Max\"></a></p>\n<p style=\"text-align: justify;\">Khả năng sạc nhanh 20 W trên iPhone 15 Pro Max 1 TB cho phép bạn nạp lại pin nhanh chóng\nvà hiệu quả. Với chỉ một thời gian ngắn sạc, bạn có thể sử dụng điện thoại trong thời gian dài. Điều này rất hữu ích\nkhi bạn cần sạc pin nhanh trước khi ra khỏi nhà hoặc khi bạn đang trong tình huống cần gấp.</p>\n<h3 style=\"text-align: justify;\">Có nên mua iPhone 15 Pro Max&nbsp;1 TB?</h3>\n<p style=\"text-align: justify;\">iPhone 15 Pro Max&nbsp;1 TB là một chiếc điện thoại thông minh cao cấp với nhiều ưu điểm\nnổi bật, bao gồm thiết kế đẹp mắt, hiệu năng mạnh mẽ, camera tuyệt vời và mức giá cạnh tranh. Nếu bạn đang tìm kiếm\nmột chiếc điện thoại có thể đáp ứng tốt mọi nhu cầu sử dụng, thì iPhone 15 Pro Max&nbsp;1 TB là một lựa chọn đáng\ncân nhắc.</p>\n<h3 style=\"text-align: justify;\">Lý do nên mua iPhone 15 Pro Max&nbsp;1 TB tại Điện máy XANH</h3>\n<p style=\"text-align: justify;\">iPhone 15 Pro&nbsp;Max&nbsp;1 TB là một trong những chiếc điện thoại thông minh cao cấp\nnằm trong bộ sản phẩm&nbsp;iPhone 15 series&nbsp;của Apple, sở hữu nhiều tính năng\nvà công nghệ tiên tiến. Nếu bạn đang có ý định mua iPhone 15 Pro&nbsp;Max&nbsp;1 TB, Điện máy XANH là một lựa chọn\nđáng cân nhắc.</p>\n<p style=\"text-align: justify;\"><strong>•&nbsp;Sản phẩm chính hãng, chất lượng cao:</strong>&nbsp;Điện máy XANH cam kết\ncung cấp sản phẩm iPhone 15 Pro&nbsp;Max&nbsp;1 TB chính hãng, có nguồn gốc xuất xứ rõ ràng, được kiểm tra kỹ lưỡng\ntrước khi bán ra thị trường.</p>\n<p style=\"text-align: justify;\"><strong>•&nbsp;Giá cả cạnh tranh:&nbsp;</strong>Điện máy XANH thường xuyên có các chương\ntrình khuyến mãi, giảm giá và tặng quà kèm theo khi mua iPhone 15 Pro&nbsp;Max&nbsp;1 TB. Điều này giúp bạn tiết\nkiệm chi phí khi mua iPhone 15 Pro Max&nbsp;1 TB.</p>\n<p style=\"text-align: justify;\"><strong>•&nbsp;Dịch vụ hậu mãi chu đáo:&nbsp;</strong>Điện máy XANH cung cấp dịch vụ bảo\nhành chính hãng cho iPhone 15 Pro&nbsp;Max&nbsp;1 TB với thời gian dài lâu. Ngoài ra, bạn còn có thể sử dụng dịch vụ\nsửa chữa, hỗ trợ kỹ thuật chuyên nghiệp của Điện máy XANH.</p>\n<p style=\"text-align: justify;\"><strong>•&nbsp;Tùy chọn trả góp linh hoạt:</strong>&nbsp;Điện máy XANH cung cấp các lựa\nchọn trả góp phù hợp với nhu cầu và khả năng tài chính của bạn. Điều này giúp bạn mua được sản phẩm với giá iPhone\n15 pro Max như mong muốn mà không cần thanh toán toàn bộ số tiền một lúc.</p>\n<p style=\"text-align: justify;\"><strong>•&nbsp;Tiện lợi khi mua sắm:&nbsp;</strong>Điện máy XANH có hệ thống cửa hàng\nrộng khắp cả nước, giúp bạn dễ dàng mua sắm trực tiếp. Ngoài ra, bạn cũng có thể mua sắm online qua website của Điện\nmáy XANH một cách tiện lợi và nhanh chóng.</p>\n<h3 style=\"text-align: justify;\">Câu hỏi thường gặp trước khi mua iPhone 15 Pro Max&nbsp;1 TB</h3>\n<p style=\"text-align: justify;\"><strong>iPhone 15 Pro Max&nbsp;1 TB có mấy màu?</strong></p>\n<p style=\"text-align: justify;\">iPhone 15 Pro Max&nbsp;1 TB được ra mắt với 4 màu sắc: Titan tự nhiên (Natural\nTitanium), Titan trắng (White Titanium), Titan đen (Black Titanium), Titan xanh (Blue Titanium).</p>\n<p style=\"text-align: justify;\"><strong>Camera của iPhone 15 Pro Max&nbsp;1 TB có chụp ảnh tốt không?</strong></p>\n<p style=\"text-align: justify;\">Câu trả lời là có. Camera của iPhone 15 Pro Max&nbsp;1 TB có độ phân giải lên đến 48 MP,\nkhẩu độ lớn và nhiều tính năng chụp ảnh tiên tiến. Điều này giúp iPhone 15 Pro Max có thể chụp ảnh sắc nét, sống\nđộng và chuyên nghiệp.</p>\n<p style=\"text-align: justify;\"><strong>iPhone 15 Pro Max</strong>&nbsp;1 TB<strong> chạy chip gì và mạnh mẽ ra\n    sao?</strong></p>\n<p style=\"text-align: justify;\">iPhone 15 Pro Max&nbsp;1 TB sử dụng con chip A17 Pro, là con chip mạnh mẽ nhất hiện nay\ncủa Apple. A17 Pro mang đến hiệu năng xử lý vượt trội, giúp iPhone 15 Pro Max có thể chạy mượt mà mọi ứng dụng và\ngame.</p>\n<h3 style=\"text-align: justify;\">Giá bán iPhone 15 Pro&nbsp;Max&nbsp;1 TB tại Điện máy XANH</h3>\n<p style=\"text-align: justify;\">Dưới đây là bảng tổng hợp giá bán iPhone 15 Pro&nbsp;Max&nbsp;1 TB cho từng phiên bản bộ\nnhớ cho cả thị trường Việt Nam và Quốc Tế:</p>\n<p style=\"text-align: justify;\">Tổng kết, iPhone 15 Pro Max&nbsp;1 TB là một chiếc điện thoại đáng giá được nâng cấp\nmạnh mẽ về hiệu năng, camera và thiết kế bên ngoài. Được xem là sự lựa chọn lý tưởng dành cho những khách hàng đang\ntìm mua một chiếc điện thoại mạnh mẽ thời thượng, vừa mang đến trải nghiệm giải trí tốt nhưng vẫn đảm bảo sự mạnh mẽ\nđể xử lý tốt mọi công việc.</p>\n', 12, 1, 1),
(14, 4, 'Điện thoại Xiaomi 13T 5G', 8, 'P14_avt.jpg', 4, '<p><strong>Tuần trước, thương hiệu phụ Redmi của Xiaomi đã tổ chức một sự kiện tại Trung Quốc để ra mắt các thiết bị Redmi. Giờ đây, công ty đã tổ chức một sự kiện toàn cầu để công bố các thiết bị dành cho thị trường quốc tế.&nbsp;</strong></p>\n\n<p>Xiaomi đã trình làng bộ đôi flagship cao cấp <a href=\"https://www.viettablet.com/xiaomi-13t\" target=\"_blank\">Xiaomi 13T</a> và <a href=\"https://www.viettablet.com/xiaomi-13t-pro\" target=\"_blank\">Xiaomi 13T Pro</a>. Chúng xuất hiện với tư cách là sản phẩm kế thừa cho Xiaomi 12T và Xiaomi 12T Pro năm ngoái. Đây cũng là 2 mẫu điện thoại tiếp theo tham gia vào dòng sản phẩm Xiaomi 13. Với Xiaomi 13T, hãng đã khéo léo chế tạo một chiếc điện thoại thông minh đạt được sự cân bằng hoàn hảo giữa sự sang trọng và hiệu năng hàng đầu, tự hào với camera vượt trội và thiết kế bên ngoài tuyệt vời. Vậy Xiaomi 13T có gì mà đỉnh vậy, cùng Viettablet đánh giá trong bài viết này nhé!</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"https://cdn.viettablet.com/images/companies/1/dien-thoai-xiaomi/xiaomi-13t/danh-gia-xiaomi-13t-1.jpg?1695874677093\" style=\"width: 780px; height: 520px;\"></p>\n\n<h3>Thiết kế Xiaomi 13T: sang trọng, chắc chắn nhưng vẫn mỏng nhẹ</h3>\n\n<p>Từ cái nhìn đầu tiên, chúng ta có thể thấy rằng Xiaomi 13T giống hệt Redmi K60 Ultra về thiết kế với khung hình hộp khá vuông vức và mô-đun máy ảnh hình vuông ở mặt sau.&nbsp;Thiết kế trên các dòng Xiaomi ngày càng trở nên tinh tế hơn, có thể nói năm 2023 cũng là năm đột phá nhất với hàng loạt những mẫu smartphone mỏng nhẹ nhưng vẫn toát lên vẻ sang trọng và tính thẩm mỹ cao cấp. Xiaomi 13T được ra mắt với 3 tùy chọn màu bao gồm Đen, Xanh Tuyết Sơn (Xanh Dương), và Xanh Thảo Nguyên (Xanh Lá). Trong đó, biến thể Xanh Thảo Nguyên có trọng lượng nặng nhất với thông số 197g. Tuy nhiên có số này vẫn là rất thấp so với các mẫu Samsung trong tầm giá.&nbsp;</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"https://cdn.viettablet.com/images/companies/1/dien-thoai-xiaomi/xiaomi-13t/danh-gia-xiaomi-13t-2.jpg?1695874684728\" style=\"width: 780px; height: 520px;\"></p>\n\n<p>Chất liệu da thuần chay BioComfor trên tùy chọn Xanh Tuyết Sơn cũng cực lỳ đặc biệt. Mặc dù chúng ta đã bắt gặp chất liệu này trên những mẫu Xiaomi được ra mắt từ đầu năm, nhưng không thể phủ nhận rằng, Xiaomi 13T mang lại cảm giác cực kỳ thu hút. Việc thao tác và sử dụng cũng tạo cho mình cảm giác cực kỳ thoải mái với mặt da mềm mại vừa đủ, và hạn chế được hoàn toàn tình trạng bám dính mồ hôi và dấu vân tay khó chịu.</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"https://cdn.viettablet.com/images/companies/1/dien-thoai-xiaomi/xiaomi-13t/danh-gia-xiaomi-13t-4.jpg?1695874691795\" style=\"width: 780px; height: 520px;\"></p>\n\n<p>Ngoài ra, Xiaomi 13T sở hữu phần khung viền bằng nhôm cao cấp, cùng với kính cường lực Gorilla Glass Type 5 chắc chắn. Ngoài ra, với 2 tùy chọn Xanh Thảo Nguyên và Đen, thì mặt lưng sẽ được hoàn thiện bằng kính. Xiaomi cũng tuyên bố rằng mẫu smartphone mới này đạt chuẩn IP68, cung cấp khả năng chống tia nước cũng như chống bụi ở mức độ nhất định.</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"https://cdn.viettablet.com/images/companies/1/dien-thoai-xiaomi/xiaomi-13t/danh-gia-xiaomi-13t-3.jpg?1695874698051\" style=\"width: 780px; height: 520px;\"></p>\n\n<h3>Màn hình Xiaomi 13T: AMOLED 144Hz - chê cái gì nữa!</h3>\n\n<p>Xiaomi 13T được trang bị màn hình Crystal Res 6,67 inches rõ nét và sống động. Tốc độ làm mới lên tới 144Hz và độ phân giải 1,5K (2712 x 1220) giúp cải thiện đáng kể trải nghiệm xem và chơi game. Màn hình có chế độ độ sáng tối đa&nbsp;1200 nits và độ sáng tối đa 2600 nits. Nó bao phủ 100% gam màu DCI-P3 và hỗ trợ Dolby Vision® và HDR10+. Bằng cách tăng cường độ tương phản giữa các yếu tố tối và sáng của hình ảnh, nó cho phép khôi phục kết cấu chân thực của các chi tiết, mang lại độ bão hòa màu cân bằng hơn.</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"https://cdn.viettablet.com/images/companies/1/dien-thoai-xiaomi/xiaomi-13t/danh-gia-xiaomi-13t-5.jpg?1695874705230\" style=\"width: 780px; height: 520px;\"></p>\n\n<p>Xiaomi 13T cũng hỗ trợ DCI-P3, là không gian màu được sử dụng trong ngành điện ảnh kỹ thuật số. Nó xác định một phạm vi màu cụ thể có thể được tái tạo trên máy chiếu và màn hình rạp chiếu phim kỹ thuật số. DCI-P3 có dải màu rộng hơn sRGB, không gian màu DCI-P3 bao gồm phần lớn hơn của quang phổ khả kiến, đặc biệt là ở vùng xanh lục và đỏ, cho phép thể hiện màu sắc sống động và chính xác hơn trong phim và các nội dung khác được thiết kế cho rạp chiếu phim kỹ thuật số.</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"https://cdn.viettablet.com/images/companies/1/dien-thoai-xiaomi/xiaomi-13t/danh-gia-xiaomi-13t-6.jpg?1695874711397\" style=\"width: 780px; height: 520px;\"></p>\n\n<h3>Camera Xiaomi 13T: Xiaomi - Leica sự kết hợp out trình cả thị trường</h3>\n\n<p>Trong vài năm qua, Xiaomi đã phải vật lộn để theo kịp về công nghệ camera so với những gã khổng lồ trong ngành như Apple và Samsung. Nhưng đó không phải là tình huống bây giờ. Sự hợp tác gần đây giữa Xiaomi và thương hiệu uy tín của Đức là Leica đã mang lại kết quả ấn tượng với ống kính xuất sắc, thiết bị quang học tiên tiến, tạo ra thứ gì đó thực sự phi thường và kết quả đã nói lên điều đó.</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"https://cdn.viettablet.com/images/companies/1/dien-thoai-xiaomi/xiaomi-13t/danh-gia-xiaomi-13t-8.jpg?1695874730102\" style=\"width: 780px; height: 520px;\"></p>\n\n<p>Xiaomi 13T cung cấp nhiều phong cách chụp ảnh riêng biệt để người dùng có thể lựa chọn với một chiếc máy ảnh hoàn toàn tuyệt vời. Chế độ Pro cung cấp cho người dùng rất nhiều chức năng mạnh mẽ, cho phép người dùng dễ dàng tinh chỉnh hình ảnh của mình bằng cách điều chỉnh Tone, Tonality, và Texture trong phần cài đặt sẵn. Tính năng này cung cấp cho người dùng khả năng lưu giữ nhiều chi tiết và màu sắc hơn trong quá trình xử lý hậu kỳ, cho phép họ lưu các cài đặt &nbsp;ưa thích của mình. Camera trước 20MP cho ảnh chụp xuất sắc, ngay cả trong điều kiện ánh sáng yếu.</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"https://cdn.viettablet.com/images/companies/1/dien-thoai-xiaomi/xiaomi-13t/danh-gia-xiaomi-13t-9.jpg?1695874748228\" style=\"width: 780px; height: 520px;\"></p>\n\n<h3>Cấu hình Xiaomi 13T: Mạnh mẽ nhưng hơi nặng&nbsp;</h3>\n\n<p>Bên dưới Xiaomi 13T, bạn sẽ tìm thấy con chip MediaTek Dimensity 8200-Ultra chạy bộ xử lý Octa-core 8 nhân với tốc độ nhanh như chớp. CPU bao gồm tổng cộng 3 cụm, với tốc độ xử lý lên tới 3.1GHz. Xiaomi 13T cũng được trang bị chip đồ họa GPU Arm Mali-G610 phát hành vào ngày 25 tháng 5 năm 2021, được thiết kế dành riêng cho điện thoại thông minh tầm trung. GPU này có 6 lõi hoạt động ở tần số xung nhịp tối đa 950 MHz.</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"https://cdn.viettablet.com/images/companies/1/dien-thoai-xiaomi/xiaomi-13t/danh-gia-xiaomi-13t-7.jpg?1695874764959\" style=\"width: 780px; height: 520px;\"></p>\n\n<p>Hiệu suất của Arm Mali-G610 cao hơn đáng kể so với Qualcomm Adreno 650 hoạt động ở tần số 600 MHz. Việc bổ sung thêm RAM 8GB hoặc 12GB sẽ mang lại bộ nhớ và dung lượng lưu trữ dồi dào cho người dùng, cho phép họ dễ dàng chơi các game đồ họa nặng mà không gặp vấn đề gì. Xiaomi cũng đưa ra thị trường hai cấu hình chính bao gồm 12GB/256GB và 8GB/256GB, cung cấp không gian lưu trữ rộng rãi và tài nguyên dồi dào cho người dùng. Giống như nhiều model Xiaomi khác, Xiaomi 13T không có khe cắm thẻ Micro SD bổ sung.&nbsp;</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"https://cdn.viettablet.com/images/companies/1/dien-thoai-xiaomi/xiaomi-13t/danh-gia-xiaomi-13t-10.jpg?1695874773086\" style=\"width: 780px; height: 520px;\"></p>\n\n<p>MIUI 14 của Xiaomi hoạt động liền mạch trên hệ điều hành Android 13. Nhìn chung, mình khóa hài lòng với trải nghiệm vì hầu hết các tính năng đều hoạt động tốt. Vấn đề duy nhất mình nhận thấy là mức tiêu thụ RAM khá cao. Ngay cả khi không chạy bất kỳ ứng dụng nền nào, mức sử dụng RAM của Xiaomi 13T vẫn cao một cách đáng ngạc nhiên, chỉ còn lại khoảng 34% bộ nhớ khả dụng.</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"https://cdn.viettablet.com/images/companies/1/dien-thoai-xiaomi/xiaomi-13t/danh-gia-xiaomi-13t-11.jpg?1695874780090\" style=\"width: 780px; height: 520px;\"></p>\n\n<p>Mặc dù Xiaomi 13T không có khả năng sạc không dây nhưng nó được bù đắp bằng bộ sạc 67W khá nhanh. Trên thực tế, Xiaomi 13T có thể sạc từ 0-29% trong vòng 10 phút. Về nhiệt độ, với những hoạt động cơ bản, mức nhiệt sẽ nằm trong khoảng 29-31°C, tương đối thấp. Tuy nhiên, trong những điều kiện đòi hỏi khắt khe hơn, nhiệt độ có thể tăng vọt lên tới 40°C và hơn thế nữa. Xiaomi cũng cung cấp cho người dùng ba cấu hình tiết kiệm pin để lựa chọn: Battery Saver, Balanced và Performance.</p>\n\n', 24, 1200, 1),
(15, 5, 'Laptop Lenovo Ideapad 3 15ITL6 i3 1115G4 (82H803SGVN)', 33, 'P15_avt.jpg', 4.3, '<h3>Khoác lên mình một thiết kế hiện đại, sang trọng cùng với khả năng chạy các tác vụ một cách&nbsp;mượt mà nhờ bộ xử\n    lý thế hệ 11. Laptop Lenovo Ideapad 3 15ITL6 i3 1115G4 (82H803SGVN) là một sự lựa chọn hoàn hảo dành cho học sinh, sinh viên và nhân\n    viên văn phòng.</h3>\n<p>• Mang phong cách hiện đại, tối giản với thiết kế <strong>vỏ nhựa</strong> cùng cân nặng <strong>1.65 kg</strong> và\n    dày khoảng <strong>19.9 mm</strong>&nbsp;đủ nhỏ gọn để bạn có thể dễ dàng bỏ vào balo mang đi khắp mọi nơi.</p>\n<p>• Laptop học tập - văn phòng&nbsp;với\n    tính năng<strong> bảo mật vân tay </strong>giúp&nbsp;bạn dễ dàng đăng nhập vào máy mà không cần nhập mật khẩu. Đồng\n    thời, <strong>công tắc khóa camera</strong> và <strong>TPM 2.0</strong> cung cấp những chức năng an ninh, bảo mật cơ\n    bản giúp bảo mật thông tin, hình ảnh một cách tốt hơn, tránh những phần mềm độc hại tấn công, sao chép thông tin.\n</p>\n<p>• Tuy nhiên một điều rất đáng tiếc ở chiếc laptop&nbsp;này là bàn phím không trang bị đèn,\n    chính vì thế bạn nên sử dụng ở nơi có đầy đủ ánh sáng để dễ dàng cho thao tác gõ phím hơn.</p>\n<p>• Kết nối nhanh chóng và truyền xuất dữ liệu chính xác hơn với các thiết thiết bị tương thích qua các cổng USB 2.0,\n    USB 3.2, USB Type-C, HDMI và khe SD.</p>\n<p>•Laptop lenovo sở hữu chip <strong>Intel Core i3\n        1115G4 Gen 11</strong> cho khả năng xử lý tốt các tác vụ văn phòng hay giải trí đa phương tiện. Card đồ họa tích\n    hợp <strong>Intel UHD Graphics </strong>trên<strong>&nbsp;</strong>laptop lenovo ideapad&nbsp;cung cấp hiệu\n    suất xử lý đồ họa mạnh mẽ, giúp bạn thực hiện chỉnh sửa hình ảnh 2D và video hiệu quả.</p>\n<p>• Bộ nhớ <strong>RAM 8 GB DDR4 2 khe</strong> và có thể nâng cấp tối đa 16 GB giúp người dùng mở lên đến hàng chục\n    tab Chrome, thao tác chuyển qua lại giữa các ứng dụng nhanh chóng,...<strong>&nbsp;</strong>Bạn có thể yên tâm vừa\n    làm việc vừa nghe nhạc giải trí mà không lo giật, đơ máy.</p>\n<p>• Ngoài ra, với ổ cứng <strong>256 GB SSD NVMe PCIe</strong> giúp việc vận hành máy một cách nhanh chóng, mang lại\n    không gian lưu trữ vừa đủ rất thích hợp cho các công việc ít lưu trữ như văn phòng. Đồng thời, để thỏa mãn nhu cầu,\n    bạn cũng có thể tháo ra lắp thanh khác tối đa <strong>1 TB</strong> cho không gian lưu trữ lớn hơn.</p>\n<p>• Máy sở hữu màn hình <strong>15.6 inch</strong> với độ phân giải <strong>Full HD</strong> <strong>(1920 x\n        1080)&nbsp;</strong>và <strong>tấm nền IPS</strong> cho không gian hiển thị rộng với hình ảnh sắc nét mang lại\n    trải nghiệm tuyệt vời khi xem phim hoặc chơi game. Độ sáng màn hình <strong>300 nits</strong> cùng với công nghệ\n    chống chói<strong> Anti Glare</strong> giữ màu sắc hình ảnh luôn tươi tắn và chống lóa màn hình ngay cả khi sử dụng\n    ở điều kiện ánh sáng mạnh.</p>\n<p>• Bên cạnh đó, <strong>Dolby Audio</strong> giúp tối ưu hóa chất lượng, cho chất âm trong trẻo hơn, chân thật hơn\n    giúp bạn đắm chìm trong không gian âm thanh sống động, mang đến những phút giây giải trí thoải mái, ấn tượng.</p>', 24, 1, 1),
(16, 5, 'Laptop Acer Gaming Nitro 5 AN515 58 769J i7 12700H (NH.QFHSV.003)', 43, 'P16_avt.jpg', 3.5, '<h3>Được xây dựng dựa trên tinh thần tạo ra những trải nghiệm gaming xuất sắc, laptop\n        Acer Gaming Nitro 5 AN515 58 769J i7 12700H (NH.QFHSV.003)&nbsp;luôn không ngừng khẳng định vị thế để trở\n    thành lựa chọn hàng đầu trong phân khúc. Với sự kết hợp của màn hình đẹp, sức mạnh và diện mạo mới, laptop sẵn sàng\n    đối mặt với mọi thách thức từ người dùng là game thủ đến nhà sáng tạo.</h3>\n<h3>Hiệu năng ấn tượng chinh phục các tựa game</h3>\n<p>Sức mạnh nội tại từ chip xử lý <strong>Intel Core i7 12700H </strong>với <strong>14 nhân</strong> và <strong>20\n        luồng</strong> có khả năng xử lý nhiều tác vụ đa nhiệm và ứng dụng nặng. Điều này rất hữu ích cho các công việc\n    đòi hỏi nhiều tài nguyên như chỉnh sửa video, thiết kế đồ họa, cho bạn thỏa sức chiến những trận đấu bom tấn AAA,\n    stream game, coding,...</p>\n<p>Card <strong>NVIDIA GeForce RTX 3050</strong> mang lại hiệu suất ấn tượng. Với dung lượng&nbsp;<strong>4 GB</strong>,\n    GPU cung cấp cho laptop khả năng xử lý video nhanh chóng, thích hợp cho\n    việc chơi các tựa game hiện đại, đáp ứng tốt các phần mềm chỉnh sửa ảnh, video, render 2D, 3D.&nbsp;</p>\n<p><strong>RAM 8 GB DDR4</strong> cho phép bạn thực hiện nhiều tác vụ cùng lúc mà không gặp trở ngại lớn. Để đảm bảo\n    hiệu suất tối ưu cho các ứng dụng đòi hỏi nhiều bộ nhớ, máy cho phép bạn nâng cấp lên <strong>32 GB</strong>, các\n    ứng dụng chỉnh sửa video, xử lý ảnh, các trò chơi nặng cũng sẽ được thực hiện mượt mà hơn.</p>\n<p>Ổ cứng <strong>512 GB SSD NVMe PCIe 4.0</strong> cung cấp tốc độ truy cập dữ liệu nhanh, giúp khởi động hệ thống chỉ\n    trong nháy mắt, mở ứng dụng trơn tru và giảm thời gian tải trong mọi trò chơi. Máy cũng hỗ trợ thêm một khe\n    <strong>SSD M.2 PCIe</strong> và một khe <strong>HDD SATA 2.5 inch </strong>mang lại sự linh hoạt cho việc nâng cấp\n    và mở rộng lưu trữ của người dùng.</p>\n<h3>Khung hình và âm thanh lý tưởng hóa trải nghiệm gaming&nbsp;</h3>\n<p>Màn hình của laptop Acer Gaming Nitro <strong>15.6 inch\n    </strong>với độ phân giải <strong>Full HD (1920 x 1080)</strong>, mang lại hình ảnh sắc nét, giúp bạn nhìn thấy các\n    chi tiết nhỏ và phản ứng nhanh trong trò chơi.</p>\n<p><strong>Tấm nền IPS</strong> cung cấp góc nhìn rộng và màu sắc chính xác, làm cho hình ảnh không bị biến dạng khi bạn\n    xem nội dung từ các góc khác nhau. Tần số quét <strong>144 Hz </strong>giúp giảm thiểu hiện tượng giật hình và làm\n    cho các khung hình mượt mà hơn, đặc biệt trong các game chuyển động nhanh như CS:GO, Esports,...</p>\n<p>Màn hình của Nitro 5 sử dụng công nghệ&nbsp;<strong>LED Backlit</strong> tăng cường độ sáng, tạo ra sự rõ ràng hơn về\n    màu sắc và chi tiết trong hình ảnh. Với công nghệ độc quyền từ nhà Acer là <strong>Acer ComfyView</strong> giảm ánh\n    sáng phản xạ từ màn hình, tạo ra một trải nghiệm hiển thị thoải mái hơn trong điều kiện ánh sáng mạnh.</p>\n<p>Công<strong> </strong>nghệ<strong> Spatial Audio</strong> cho bạn được đắm chìm trong môi trường âm thanh vòm 3D để\n    nghe rõ từng hơi thở, bước chân của các nhân vật trong đấu trường ảo để game thủ sống trọn và bắt kịp từng khoảnh\n    khắc kịch tính nhất.</p>\n<p><strong>Acer Purified Voice</strong>&nbsp;giúp loại bỏ tiếng ồn và tiếng vọng không mong muốn, đảm bảo rằng cuộc trò\n    chuyện qua microphone sẽ luôn rõ ràng và dễ nghe. Điều này làm cho việc tham gia chiến game đa người chơi và gọi\n    video trên laptop Acer Nitro trở nên trơn tru hơn.</p>\n<p>Bạn cũng sẽ cảm nhận được âm thanh sắc nét, cân bằng và tự nhiên, từ những chi tiết nhỏ nhất đến những tông trầm mạnh\n    mẽ nhờ công nghệ&nbsp;<strong>Acer TrueHarmony</strong>. <strong>DTS X:Ultra Audio,&nbsp;</strong>có khả năng giả\n    lập âm thanh vòm sống động tạo ra trải nghiệm đa chiều thú vị, đưa bạn vào thế giới âm nhạc, gaming chân thực như\n    bước ra từ ngoài đời.</p>\n<h3>Diện mạo đậm chất gaming mới mẻ, hầm hố</h3>\n<p><strong>Màu đen</strong> Obsidian Black trên chiếc laptop Acer đem đến sự mạnh mẽ và lịch lãm không chỉ phù hợp cho\n    game thủ mà còn hướng tới người dùng văn phòng, sáng tạo. Lớp <strong>vỏ nhựa chất lượng cao</strong> với khối\n    lượng<strong> 2.5 kg</strong>&nbsp;mang đến một cảm giác cầm nắm chắc tay, phù hợp với một laptop gaming mà vẫn đảm\n    bảo tính di động.</p>\n<p>Chiếc Acer Nitro mang diện mạo nổi bật với các đường gấp khúc mang hiệu ứng hologram hiếu chiến, kết\n    hợp&nbsp;<strong>đèn nền bàn phím RGB chuyển màu 4 vùng</strong> tạo nên không gian chơi game cuốn hút, giúp bạn hòa\n    mình vào thế giới ảo dễ dàng hơn.</p>\n<p>Chiếc&nbsp;laptop gaming&nbsp;này cũng được trang bị USB\n    Type-C đa chức năng, hỗ trợ USB, DisplayPort và Thunderbolt 4, mang lại tốc độ truyền tải dữ liệu nhanh chóng. Các\n    cổng USB 3.2, HDMI và jack tai nghe 3.5 mm cũng được tích hợp để đáp ứng nhu cầu kết nối đa dạng của người dùng.</p>', 12, 1200, 1),
(17, 6, 'iPad 9 WiFi 64GB', 38, 'P17_avt.jpg', 4, '<h3>iPad 9 WiFi 64GB&nbsp;- sản phẩm thuộc phân khúc&nbsp;máy tính\n    bảng&nbsp;giá rẻ của Apple, sở hữu kiểu dáng đơn\ngiản, cấu hình mạnh mẽ cùng camera rõ nét, có thể thoải mái sử dụng trong thời gian dài và đây sẽ là lựa chọn phù\nhợp cho mọi đối tượng người dùng.&nbsp;</h3>\n<h3>Vẻ ngoài sang trọng, đẹp mắt</h3>\n<p>Sở hữu một thiết kế quen thuộc của dòng iPad 10.2 inch, vỏ máy làm từ aluminum có độ bền cao.&nbsp;Theo đó là 2 màu\nsắc cơ bản là xám và bạc để bạn có thể lựa chọn cho phù hợp với phong cách, cá tính của bạn.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-2.jpg\"\n    onclick=\"return false;\"><img alt=\"Vỏ ngoài tối giản bền bỉ - iPad 9 WiFi 64GB \"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-2.jpg\" \n        title=\"Vỏ ngoài tối giản bền bỉ - iPad 9 WiFi 64GB \"></a></p>\n<p>Nút Home vẫn được giữ lại trên phiên bản này, cảm biến vân tay Touch ID được tích hợp ở phím Home giúp mở khóa thiết\nbị tiện lợi và bảo mật hơn.&nbsp;</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-3.jpg\"\n    onclick=\"return false;\"><img alt=\"Cảm biến vân tay - iPad 9 WiFi 64GB \"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-3.jpg\" \n        title=\"Cảm biến vân tay - iPad 9 WiFi 64GB \"></a></p>\n<p>Với độ mỏng chỉ 7.5 mm và khối lượng 487 g, cho người dùng cầm nắm và thao tác dễ dàng. Máy có kích thước vừa phải,\nkhông chiếm nhiều diện tích trong túi đồ của bạn nên cực thuận tiện khi mang theo bên mình khi đi học, đi làm hay\ncông tác.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-1.jpg\"\n    onclick=\"return false;\"><img alt=\"Kiểu dáng thanh lịch, sang trọng - iPad 9 WiFi 64GB \"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-1.jpg\" \n        title=\"Kiểu dáng thanh lịch, sang trọng - iPad 9 WiFi 64GB \"></a></p>\n<h3>Màn hình Retina tái hiện văn bản, hình ảnh chi tiết&nbsp;</h3>\n<p>Máy tính bảng&nbsp;iPad 9 WiFi 64GB có&nbsp;màn hình Retina có độ phân giải 1620 x 2160 Pixels cung cấp hình ảnh mịn\nđẹp, màu sắc rực rỡ, cho bạn dễ dàng nhìn rõ các chi tiết trong khung hình.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-5.jpg\"\n    onclick=\"return false;\"><img alt=\"Màn hình Retina với độ phân giải cao - iPad 9 WiFi 64GB \"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-5.jpg\" \n        title=\"Màn hình Retina với độ phân giải cao - iPad 9 WiFi 64GB \"></a></p>\n<p>Kích thước màn hình 10.2 inch cho phạm vi quan sát rộng, nhìn được nhiều nội dung hơn, trang bị công nghệ True Tone\nnâng cao trải nghiệm xem khi thiết bị có thể tự động điều chỉnh nhiệt độ màu màn hình theo điều kiện ánh sáng môi\ntrường để hiển thị hình ảnh tự nhiên, thoải mái khi quan sát hơn.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-4.jpg\"\n    onclick=\"return false;\"><img alt=\"Màn hình 10.2 inch sắc nét - iPad 9 WiFi 64GB \"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-4.jpg\" \n        title=\"Màn hình 10.2 inch sắc nét - iPad 9 WiFi 64GB \"></a></p>\n<p>Ngoài ra, máy cũng được trang bị loa stereo ấn tượng, kết hợp cùng với khả năng hiển thị tuyệt vời thì iPad 9 sẽ mang\nlại các trải nghiệm sử dụng trọn vẹn hơn.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-6.jpg\"\n    onclick=\"return false;\"><img alt=\"Được trang bị loa Stereo - iPad 9 WiFi 64GB \"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-6.jpg\" \n        title=\"Được trang bị loa Stereo - iPad 9 WiFi 64GB \"></a></p>\n<h3>Ghi hình sắc nét cùng hệ thống camera&nbsp;</h3>\n<p>iPad 9 được trang bị camera sau có độ phân giải 8 MP có thể quay video đạt chuẩn Full HD 1080p&nbsp;30fps, hỗ trợ\nzoom video 3x. Cùng với tính năng lấy nét tự động liền mạch cho bạn tha hồ sáng tạo những video tuyệt đẹp để chia sẻ\nvới mọi người.&nbsp;</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-10.jpg\"\n    onclick=\"return false;\"><img alt=\"Camera sau hỗ trợ nhiều tính năng - iPad 9 WiFi 64GB \"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-10.jpg\" \n        title=\"Camera sau hỗ trợ nhiều tính năng - iPad 9 WiFi 64GB \"></a></p>\n<p>Camera sau có khả năng chụp toàn cảnh, hỗ trợ zoom kỹ thuật số lên đến 5x cùng công nghệ ổn định hình ảnh tự động\ngiúp cho bạn dễ dàng tạo nên album ảnh chuyên nghiệp. Camera sau còn hỗ trợ công nghệ&nbsp;AR&nbsp;quét tài liệu và\ntrải nghiệm các ứng dụng đi kèm phong phú.&nbsp;</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-9.jpg\"\n    onclick=\"return false;\"><img alt=\"Chụp ảnh chuyên nghiệp - iPad 9 WiFi 64GB \"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-9.jpg\"\n        title=\"Chụp ảnh chuyên nghiệp - iPad 9 WiFi 64GB \"></a></p>\n<p>Camera trước Ultra Wide 12 MP có góc rộng đến 122 độ, hỗ trợ chế độ quay như Full HD 60 fps giúp bạn tạo ra những\nvideo nghệ thuật ấn tượng, thể hiện được sức sáng tạo độc đáo của mình.&nbsp;</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-7.jpg\"\n    onclick=\"return false;\"><img alt=\"Camera Ultra Wide 12 MP - Camera Ultra Wide\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-7.jpg\"\n        title=\"Camera Ultra Wide 12 MP - Camera Ultra Wide\"></a></p>\n<p>Hơn nữa, camera này còn hỗ trợ Center Stage, một công nghệ đã được sử dụng trên <a\n    href=\"https://www.dienmayxanh.com/may-tinh-bang-apple-ipad\" target=\"_blank\"\n    title=\"Tham khảo iPad Pro chính hãng\">máy tính bảng iPad</a>, có khả năng tự động phát hiện và điều chỉnh khung\nhình khi bạn đang di chuyển hoặc có người cùng tham gia, giúp chủ thể luôn được nổi bật trong khung hình.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-8.jpg\"\n    onclick=\"return false;\"><img alt=\"Công nghệ Center Stage - iPad 9 WiFi 64GB \"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-8.jpg\" \n        title=\"Công nghệ Center Stage - iPad 9 WiFi 64GB \"></a></p>\n<p>Center Stage không chỉ hoạt động trên&nbsp;Face Time mà còn hỗ trợ cho nhiều ứng dụng video phổ biến khác giúp bạn\ntham gia các cuộc họp, giao lưu, trò chuyện trực tuyến thuận lợi, tiện ích hơn.&nbsp;</p>\n<h3>Chip khỏe, hiệu suất cao&nbsp;</h3>\n<p>Hoạt động CPU nhanh hơn 20% so với sản phẩm tiền nhiệm nhờ tích hợp bộ xử lý A13 Bionic 6 nhân, cùng với 3 GB RAM đảm\nbảo cho máy luôn vận hành mạnh mẽ khi chạy ứng dụng đồ họa chuyên nghiệp hay chơi các game yêu cầu cấu hình cao.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-11.jpg\"\n    onclick=\"return false;\"><img alt=\"Chip Apple A13 Bionic 6 nhân - iPad 9 WiFi 64GB \"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-11.jpg\" \n        title=\"Chip Apple A13 Bionic 6 nhân - iPad 9 WiFi 64GB \"></a></p>\n<p>Gấp đôi dung lượng lưu trữ so với iPad 8, máy tính bảng có&nbsp;ROM 64 GB&nbsp;hỗ\ntrợ khả năng lưu trữ dữ liệu phong phú, ngoài ra nếu bạn cần thêm không gian lưu trữ nhiều dữ liệu hơn có thể sử\ndụng iCloud - dịch vụ lưu trữ đám mây&nbsp;của Apple.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-13.jpg\"\n    onclick=\"return false;\"><img alt=\"Dung lượng bộ nhớ - iPad 9 WiFi 64GB \"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-13.jpg\" \n        title=\"Dung lượng bộ nhớ - iPad 9 WiFi 64GB \"></a></p>\n<p>iPad Gen 9 64GB cài đặt sẵn hệ điều hành iPadOS 15, giúp\ntác vụ đa nhiệm trực quan hơn, các tính năng Split View và Slide Over tối ưu cho bạn dễ dàng khám phá tiện ích của\nthiết bị, bố cục widget cải tiến, kho ứng dụng cho phép đơn giản hóa trải nghiệm cá nhân.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-14.jpg\"\n    onclick=\"return false;\"><img alt=\"iPadOS đa nhiệm ổn định - iPad 9 WiFi 64GB \"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-14.jpg\" \n        title=\"iPadOS đa nhiệm ổn định - iPad 9 WiFi 64GB \"></a></p>\n<p>Bên cạnh đó ứng dụng Live Text sử dụng trí thông minh tự động nhận dạng văn bản trong hình ảnh một cách dễ dàng, bạn\ncó thể copy sang các trình soạn thảo văn bản hoặc dịch nó sang ngôn ngữ khác.</p>\n<p>iPad 9 có thể làm việc được với bàn phím thông minh Apple,&nbsp;Apple Pencil 1, kết nối nhanh chóng giúp người dùng\nghi chú, phác họa, thực hiện các tác vụ văn phòng tiện lợi ngay cả khi đang ở quán cà phê.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-15.jpg\"\n    onclick=\"return false;\"><img alt=\"Tương thích với Apple Pencil 1 - iPad 9 WiFi 64GB \"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-15.jpg\" \n        title=\"Tương thích với Apple Pencil 1 - iPad 9 WiFi 64GB \"></a></p>\n<h3>Đáp ứng nhu cầu giải trí cả ngày&nbsp;</h3>\n<p>Cung cấp năng lượng cho máy là viên pin 32.4 Wh tương đương với 8600 mAh, kết hợp với chip A13 Bionic giúp giảm hao\nphí năng lượng, cho thời gian trải nghiệm dài hơn, đáp ứng nhu cầu nghe nhạc, duyệt web, chơi game của bạn cả ngày\ndài.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-16.jpg\"\n    onclick=\"return false;\"><img alt=\"Dung lượng pin 32.4 Wh - iPad 9 WiFi 64GB \"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/247517/ipad-gen-9-16.jpg\"\n        title=\"Dung lượng pin 32.4 Wh - iPad 9 WiFi 64GB \"></a></p>\n<p>Tích hợp công nghệ sạc nhanh&nbsp;cho tốc độ tối đa 20 W, thiết bị được nạp đầy pin nhanh chóng, đảm bảo bất cứ khi\nnào bạn cần, máy đều sẵn sàng để bạn giải trí, làm việc tùy thích.&nbsp;</p>\n<p>iPad 9 WiFi 64GB vẫn duy trì các điểm mạnh của dòng iPad nhờ thiết kế hiện đại, hiệu suất sử dụng tối ưu, thời gian\ndùng đáp ứng nhu cầu sử dụng hằng ngày, cùng với hệ thống camera ấn tượng, đây sẽ là lựa chọn đáng chú ý nếu bạn\nđang muốn mua cho mình một chiếc máy tính bảng.</p>', 30, 1, 1);
INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `supplier_id`, `product_avt_img`, `product_rate`, `product_description`, `product_period`, `product_view_count`, `product_is_display`) VALUES
(18, 6, 'iPad Air 5 M1 Wifi Cellular 64GB', 38, 'P18_avt.jpg', 4.9, '<h3>iPad Air 5 M1 Wifi Cellular 64GB ra mắt với một cấu hình “khủng\n    long” mang đến khả năng chiến tốt mọi tác vụ, bên cạnh đó đây còn là phiên bản được hỗ trợ kết nội mạng di động giúp\n    bạn có thể kết nối internet kể cả khi di chuyển ra bên ngoài vùng phủ sóng wifi.</h3>\n<h3>Thiết kế trẻ trung hiện đại</h3>\n<p>Được phủ lên mình một lớp áo làm từ hợp kim nhôm cao cấp cùng kiểu thiết kế vuông vức, giúp máy toát lên vẻ sang\n    trọng và cao cấp hơn, bên cạnh đó iPad Air 5 M1 còn được hoàn thiện mặt lưng nhám giúp hạn chế bám dấu vân tay và mồ\n    hôi trong quá trình sử dụng.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/522/274155/ipad-air-5-m1-wifi-cellular-64gb-290422-031628.jpg\"\n        onclick=\"return false;\"><img alt=\"Vẻ ngoài cao cấp - iPad Air 5 M1 Wifi Cellular 64GB\"\n            src=\"https://cdn.tgdd.vn/Products/Images/522/274155/ipad-air-5-m1-wifi-cellular-64gb-290422-031628.jpg\"\n            title=\"Vẻ ngoài cao cấp - iPad Air 5 M1 Wifi Cellular 64GB\"></a>\n</p>\n<h3>Giải trí đã hơn trên màn hình kích thước lớn</h3>\n<p>iPad Air 5 M1 sử dụng tấm nền Retina IPS LCD có kích thước lên đến 10.9 inch và độ phân giải 1640 x 2360 Pixels giúp\n    tại hiện hình ảnh một cách rõ nét, chân thực, màu sắc cho ra có độ tương phản cao và trường nhìn rộng, mang đến một\n    trải nghiệm xem phim hay chơi game vô cùng tuyệt vời.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/522/274155/ipad-air-5-m1-wifi-cellular-64gb-290422-031630.jpg\"\n        onclick=\"return false;\"><img alt=\"Màn hình hiển thị chất lượng- iPad Air 5 M1 Wifi Cellular 64GB\"\n            src=\"https://cdn.tgdd.vn/Products/Images/522/274155/ipad-air-5-m1-wifi-cellular-64gb-290422-031630.jpg\"\n            title=\"Màn hình hiển thị chất lượng- iPad Air 5 M1 Wifi Cellular 64GB\"></a>\n</p>\n<h3>Chụp ảnh hay quay phim chất lượng</h3>\n<p>Máy được trang bị camera trước và sau có chung độ phân giải lên đến 12 MP, giúp bạn có được những bức ảnh sắc nét hay\n    thước phim chất lượng nhờ camera sau hỗ trợ quay phim chuẩn 4K. Giờ đây bạn cũng có thể thỏa thích selfie hay video\n    call mà không quá lo lắng đến vấn đề ảnh bị mờ hay nhiễu hạt.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/522/274155/ipad-air-5-m1-wifi-cellular-64gb-290422-031634.jpg\"\n        onclick=\"return false;\"><img alt=\"Camera chụp ảnh sắc nét - iPad Air 5 M1 Wifi Cellular 64GB\"\n            src=\"https://cdn.tgdd.vn/Products/Images/522/274155/ipad-air-5-m1-wifi-cellular-64gb-290422-031634.jpg\"\n           title=\"Camera chụp ảnh sắc nét - iPad Air 5 M1 Wifi Cellular 64GB\"></a></p>\n<h3>Hiệu năng hàng đầu phân khúc</h3>\n<p>Con chip trang bị bên trong iPad Air 5 M1 là Apple M1 8 nhân, được xem là chipset di động mạnh mẽ hàng đầu trên các\n    dòng sản phẩm máy tính bảng hiện nay (04/2022), các tác vụ chơi game đồ họa cao hay chỉnh sửa video nâng cao đều được máy xử lý vô\n    cùng trơn tru.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/522/274155/ipad-air-5-m1-wifi-cellular-64gb-290422-031636.jpg\"\n        onclick=\"return false;\"><img alt=\"Hiệu năng mạnh mẽ hàng đầu - iPad Air 5 M1 Wifi Cellular 64GB\"\n            src=\"https://cdn.tgdd.vn/Products/Images/522/274155/ipad-air-5-m1-wifi-cellular-64gb-290422-031636.jpg\"\n            title=\"Hiệu năng mạnh mẽ hàng đầu - iPad Air 5 M1 Wifi Cellular 64GB\"></a></p>\n<h3>Hỗ trợ sạc nhanh 20 W</h3>\n<p>Cung cấp năng lượng cho máy là viên pin có dung lượng vừa phải - 28.6 Wh (~ 7587 mAh), tuy không phải là một con số\n    quá ấn tượng trong tầm giá nhưng đây vẫn là mức có thể đáp ứng thời gian sử dụng cho bạn tương đối lâu dài, cùng với\n    đó công nghệ sạc nhanh 20 W giúp bạn quay lại công việc và giải trí nhanh chóng.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/522/274155/ipad-air-5-m1-wifi-cellular-64gb-290422-031638.jpg\"\n        onclick=\"return false;\"><img alt=\"Sở hữu viên pin lớn - iPad Air 5 M1 Wifi Cellular 64GB\"\n            src=\"https://cdn.tgdd.vn/Products/Images/522/274155/ipad-air-5-m1-wifi-cellular-64gb-290422-031638.jpg\"\n            title=\"Sở hữu viên pin lớn - iPad Air 5 M1 Wifi Cellular 64GB\"></a></p>\n<p>iPad Air 5 M1 Wifi Cellular 64GB thực sự là một sự lựa chọn đáng mua dành cho những ai muốn nâng cấp những trải\n    nghiệm của bạn thân, nhằm phục vụ công việc một cách nhanh chóng hay có được những phút giây giải trí chơi game hay\n    xem phim được tốt hơn, qua những gì mà nó mang lại thì mức giá trang bị như vậy là hoàn toàn xứng đáng.</p>', 12, 1200, 1),
(19, 7, 'Tủ lạnh Samsung Inverter RF48A4010M9/SV', 1, 'P19_avt.jpg', 4, '<h3>Sử dụng 2 dàn lạnh độc lập Twin Cooling Plus giúp lạnh đồng đều</h3>\n<p>Tủ lạnh này sử dụng công nghệ hiện\n    đại nên trong quá trình hoạt động mọi ngóc ngách của tủ được làm lạnh nhanh chóng, nên thực phẩm được bảo quản tốt\n    hơn.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1943/236996/samsung-rf48a4010m9-sv1-1.jpg\"\n        onclick=\"return false;\"><img\n            alt=\"Tủ lạnh Samsung Inverter 488 lít RF48A4010M9/SV - 2 dàn lạnh độc lập Twin Cooling Plus\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1943/236996/samsung-rf48a4010m9-sv1-1.jpg\" \n            title=\"Tủ lạnh Samsung Inverter 488 lít RF48A4010M9/SV - 2 dàn lạnh độc lập Twin Cooling Plus\"></a></p>\n<h3>Thiết kế Multi Door hiện đại, có tiện ích lấy nước bên ngoài</h3>\n<p>Tủ lạnh Samsung Inverter 488 lít RF48A4010M9/SV được thiết kế với dạng Multi Door nhiều cửa nên có thể lấy thực phẩm ở những ngăn riêng tránh thất thoát hơi lạnh ra\n    ngoài.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1943/236996/samsung-rf48a4010m9-sv2-1.jpg\"\n        onclick=\"return false;\"><img alt=\"Tủ lạnh Samsung Inverter 488 lít RF48A4010M9/SV - Thiết kế hiện đại\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1943/236996/samsung-rf48a4010m9-sv2-1.jpg\"\n            title=\"Tủ lạnh Samsung Inverter 488 lít RF48A4010M9/SV - Thiết kế hiện đại\"></a></p>\n<h3>Bảo quản thực phẩm tươi ngon nhờ ngăn rau quả giữ ẩm tốt&nbsp;</h3>\n<p>Rau củ sẽ được bảo quản lạnh tốt và luôn tươi ngon hơn khi để trong ngăn rau quả. Bởi ngăn này&nbsp;<strong>luôn giữ\n        độ ẩm phù hợp với rau củ có trong ngăn</strong>.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1943/236996/samsung-rf48a4010m9-sv3-1.jpg\"\n        onclick=\"return false;\"><img alt=\"Tủ lạnh Samsung Inverter 488 lít RF48A4010M9/SV - Ngăn rau củ giữ ẩm\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1943/236996/samsung-rf48a4010m9-sv3-1.jpg\" \n            title=\"Tủ lạnh Samsung Inverter 488 lít RF48A4010M9/SV - Ngăn rau củ giữ ẩm\"></a></p>\n<h3>Với thiết kế có thể lấy nước bên ngoài mà không cần mở tủ, vô cùng tiện lợi.</h3>\n<p>Được trang bị tiện ích lấy nước ngay bên ngoài mà không cần mở cánh tủ, tránh làm khí lạnh thoát ra ngoài lãng phí.\n</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1943/236996/samsung-rf48a4010m9-sv4-1.jpg\"\n        onclick=\"return false;\"><img alt=\"Tủ lạnh Samsung Inverter 488 lít RF48A4010M9/SV - Lấy nước ngoài\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1943/236996/samsung-rf48a4010m9-sv4-1.jpg\" \n            title=\"Tủ lạnh Samsung Inverter 488 lít RF48A4010M9/SV - Lấy nước ngoài\"></a></p>\n<h3>&nbsp;Sử dụng công nghệ Digital Inverter tiết kiệm điện, hoạt động êm\n    ái</h3>\n<p>Tủ lạnh Samsung Inverter này có trang bị công nghệ Digital Inverter hiện đại, nên<strong> tiêu tốn ít điện năng\n    </strong>trong quá trình hoạt động. Đặc biệt là <strong>luôn vận hành êm ái</strong> tạo sự thoải mái cho không gian\n    vì không gây tiếng ồn.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1943/236996/samsung-rf48a4010m9-sv5-1.jpg\"\n        onclick=\"return false;\"><img alt=\"Tủ lạnh Samsung Inverter 488 lít RF48A4010M9/SV - Công nghệ Digital Inverter\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1943/236996/samsung-rf48a4010m9-sv5-1.jpg\" \n            title=\"Tủ lạnh Samsung Inverter 488 lít RF48A4010M9/SV - Công nghệ Digital Inverter\"></a></p>\n<h3>Khử mùi hôi khó chịu nhờ bộ lọc than hoạt tính Deodorizer</h3>\n<p>Chiếc tủ lạnh Samsung sử dụng nguyên liệu<strong>&nbsp;</strong>bộ lọc than hoạt tính Deodorizer có khả năng loại bỏ mùi\n    hôi có trong tủ, mang đến sự tươi mới và an toàn thực phẩm cho người dùng.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1943/236996/samsung-rf48a4010m9-sv6-1.jpg\"\n        onclick=\"return false;\"><img\n            alt=\"Tủ lạnh Samsung Inverter 488 lít RF48A4010M9/SV - Bộ lọc than hoạt tính Deodorizer\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1943/236996/samsung-rf48a4010m9-sv6-1.jpg\" \n            title=\"Tủ lạnh Samsung Inverter 488 lít RF48A4010M9/SV - Bộ lọc than hoạt tính Deodorizer\"></a></p>\n<h3>Dung tích sử dụng 488 lít&nbsp;phù hợp với gia đình từ 4 – 5 thành viên</h3>\n<p>Điều đặc biệt mà sản phẩm này mang lại là có <strong>ngăn đá là 159 lít</strong> và <strong>ngăn lạnh là 329\n        lít</strong> chứa được nhiều loại thực phẩm. Có thể phù hợp cho gia đình có<strong> 4 - 5 thành viên.</strong>\n</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1943/236996/samsung-rf48a4010m9-sv9.jpg\"\n        onclick=\"return false;\"><img alt=\"Tủ lạnh Samsung Inverter 488 lít RF48A4010M9/SV - Dung tích 488 lít\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1943/236996/samsung-rf48a4010m9-sv9.jpg\" \n            title=\"Tủ lạnh Samsung Inverter 488 lít RF48A4010M9/SV - Dung tích 488 lít\"></a></p>\n<p>Đây là một sản phẩm sở hữu nhiều tính năng ưu việt, phục vụ cho một cuộc sống hiện đại. Những tính năng mà tủ lạnh\n    mang lại như giữ lạnh tốt, bảng điều khiển ngoài, ngăn rau củ rộng, sử dụng ít điện năng nhưng vẫn đảm bảo thực phẩm\n    luôn tươi ngon mang đến cuộc sống tiện nghi. Nếu gia đình bạn có thói quen thường xuyên mua nhiều thực phẩm thì đây\n    là lựa chọn dành cho bạn.</p>', 24, 1, 1),
(20, 7, 'Tủ lạnh Toshiba Inverter GR-RF610WE-PGV(22)-XK', 7, 'P20_avt.jpg', 4, '<h3><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/1943/228369/toshiba-gr-rf610we-pgv-22-xk-060923-045316.jpg\"\n    onclick=\"return false;\"><img alt=\"Tủ lạnh Toshiba Inverter 511 lít Multi Door GR-RF610WE-PGV(22)-XK\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1943/228369/toshiba-gr-rf610we-pgv-22-xk-060923-045316.jpg\"\n        title=\"Tủ lạnh Toshiba Inverter 511 lít Multi Door GR-RF610WE-PGV(22)-XK\"></a>\n</h3>\n<p><em>Tủ lạnh Toshiba Inverter 511 lít Multi Door GR-RF610WE-PGV(22)-XK&nbsp;thiết kế tủ hiện đại với bề mặt gương sang\n    trọng cùng gam màu đen\n    ấn tượng, là điểm nhấn trong không gian sống của gia đình. Tủ lạnh trang bị công nghệ Dual Cooling hai dàn lạnh\n    độc lập làm lạnh hiệu quả cùng công nghệ Origin Inverter tiết kiệm điện năng, vận hành êm ái. Có ngăn cấp đông\n    linh hoạt Flexible Zone giúp điều chỉnh nhiệt độ phù hợp với nước uống, thực phẩm khô và rau củ, ngăn tăng cường\n    độ ẩm Moisture Zone giúp điều chỉnh độ ẩm thích hợp với các loại trái cây và rau củ.</em></p>\n<p>- Kiểu dáng&nbsp;tủ lạnh multidoor 4 cửa&nbsp;với bề mặt gương đen góp phần cho không gian\nsống trở nên sang trọng.</p>\n<p>- Dung tích sử dụng&nbsp;511 lít&nbsp;phù hợp gia đình từ 4 - 5 thành viên hoặc gia đình có ít thành viên hơn nhưng\ncó nhu cầu lưu trữ thực phẩm cao.</p>\n<p>-&nbsp;Tủ lạnh Toshiba&nbsp;trang bị&nbsp;<strong>công nghệ Dual Cooling</strong>&nbsp;hai dàn lạnh độc lập, duy trì\nđộ ẩm\nvà tránh ngăn mùi thực phẩm.</p>\n<p>-&nbsp;<strong>Công nghệ PureBio</strong>&nbsp;kết hợp tia Plasma có tác dụng loại sạch vi khuẩn và khử mùi tối đa\ncho tủ lạnh.</p>\n<p>-<strong>&nbsp;Ngăn cấp đông linh hoạt Flexible Zone</strong>&nbsp;giúp điều chỉnh nhiệt độ phù hợp với nước uống,\nthực phẩm khô và rau củ.&nbsp;<strong>Ngăn tăng cường độ ẩm Moisture Zone</strong>&nbsp;giúp điều chỉnh độ ẩm thích\nhợp với các loại trái cây và rau củ.</p>\n<p>-&nbsp;<strong>Công nghệ Origin Inverter</strong>&nbsp;tiết kiệm điện năng, vận hành bền bỉ.</p>\n<p>- Đa dạng tiện ích được tích hợp trên&nbsp;tủ lạnh: Bảng điều khiển cảm ứng bên ngoài, chuông báo khi quên đóng cửa,\nchế độ cấp đông\nnhanh,...</p>\n', 24, 1200, 1),
(21, 8, 'Nồi cơm điện tử Philips HD4515/55', 15, 'P21_avt.jpg', 5, '<p style=\"text-align: justify;\"><i><strong>Nồi cơm điện\n    tử&nbsp;Philips 1.8 lít HD4515/55</strong></i><i><strong> sử dụng công nghệ nấu 3D nấu cơm chín đều\ntơi xốp, lòng nồi bằng hợp kim phủ 6 lớp đá Maifan (lớp tráng Bakuhanseki siêu bền), tích hợp nhiều chế độ\ncài sẵn tiện lợi,… giúp bạn trổ tài chế biến nhiều món ngon chỉ với 1 thiết bị.&nbsp;</strong></i></p>\n<h3 style=\"text-align: justify;\">Công nghệ nấu, công suất - Dung tích</h3>\n<p style=\"text-align: justify;\">- Công suất 790 - 940W kết hợp công nghệ nấu 3D cho ra cơm chín đều, hạt cơm tơi xốp,\ngiữ lại tối đa lượng dưỡng chất trong gạo.</p>\n<p style=\"text-align: justify;\">-&nbsp;Dung tích 1.8\nlít, nấu được khoảng 8 - 10 cốc gạo, phù hợp sử dụng cho 4 - 6 người ăn.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1922/299636/noi-com-dien-tu-philips-18-lit-hd4515-55-220823-042118.gif\"\nonclick=\"return false;\"><img alt=\"Nồi cơm điện tử Philips 1.8 lít HD4515/55 - Công nghệ nấu\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1922/299636/noi-com-dien-tu-philips-18-lit-hd4515-55-220823-042118.gif\"\n style=\"height: 436px; width: 780px;\"\ntitle=\"Nồi cơm điện tử Philips 1.8 lít HD4515/55 - Công nghệ nấu\"></a>\n</p>\n<h3 style=\"text-align: justify;\">Bảng điều khiển - Chương trình cài đặt sẵn</h3>\n<p style=\"text-align: justify;\">- Bảng điều khiển nút nhấn to rõ, có kèm chú thích tiếng Anh.</p>\n<p style=\"text-align: justify;\">- Tích hợp đa dạng chương trình giúp bạn chế biến các món ăn đa dạng, dễ dàng như: gạo\ntrắng, giữ ấm, gạo lứt, cơm sushi, súp, hấp, nấu nhanh, nấu chậm, cháo, hầm, làm bánh.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1922/299636/noi-com-dien-tu-philips-18-lit-hd4515-55-220823-041935.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi cơm điện tử Philips 1.8 lít HD4515/55 - Chế độ \"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1922/299636/noi-com-dien-tu-philips-18-lit-hd4515-55-220823-041935.jpg\"\nstyle=\"height: 436px; width: 780px;\"\ntitle=\"Nồi cơm điện tử Philips 1.8 lít HD4515/55 - Chế độ \"></a>\n</p>\n<h3 style=\"text-align: justify;\">Thiết kế, chất liệu của sản phẩm</h3>\n<p style=\"text-align: justify;\">-&nbsp;Nồi cơm điện&nbsp;tông màu trắng trang nhã,\nmẫu mã hiện đại, thiết kế dây điện có thể tháo rời.</p>\n<p style=\"text-align: justify;\">- Lòng nồi dày&nbsp;1.427&nbsp;mm được làm bằng hợp kim phủ 6 lớp đá Maifan (lớp tráng\nBakuhanseki) chống dính dày bền, nấu cơm ngon, giữ ấm hiệu quả. Bakuhanseki là đá tự nhiên, có chứa các khoáng chất\nvà các nguyên tố vi lượng, siêu bền và cứng hơn gấp 6 lần, giúp lòng nồi cứng cáp, gia nhiệt tốt, an toàn và dễ vệ\nsinh.</p>\n<p style=\"text-align: justify;\">- Nắp trong có thể tháo rời, tiện vệ sinh và lau chùi.&nbsp;</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1922/299636/noi-com-dien-tu-philips-18-lit-hd4515-55-220823-042014.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi cơm điện tử Philips 1.8 lít HD4515/55 - Lòng nồi \"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1922/299636/noi-com-dien-tu-philips-18-lit-hd4515-55-220823-042014.jpg\"\nstyle=\"height: 436px; width: 780px;\"\ntitle=\"Nồi cơm điện tử Philips 1.8 lít HD4515/55 - Lòng nồi \"></a></p>\n<h3 style=\"text-align: justify;\">Tiện ích</h3>\n<p>- Mẫu&nbsp;nồi cơm điện Philips&nbsp;này trang bị tính\nnăng hẹn giờ lên đến 24 giờ, giữ ấm tối đa 24 giờ, hỗ trợ bạn nấu cơm chủ động thời gian hơn.</p>\n<p><i><strong>Lưu ý:</strong></i>&nbsp;Tính năng hẹn giờ và giữ ấm còn tùy thuộc vào khí hậu, loại gạo,... để nồi chế\nbiến được món ăn thơm ngon, đảm bảo dinh dưỡng nhất có thể.</p>\n<p>- Có xửng hấp kèm theo để bạn tiện chế biến những món hấp đơn giản: bánh bao, xôi, trứng hấp,...</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1922/299636/noi-com-dien-tu-philips-18-lit-hd4515-55-220823-042043.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi cơm điện tử Philips 1.8 lít HD4515/55 - Tiện ích\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1922/299636/noi-com-dien-tu-philips-18-lit-hd4515-55-220823-042043.jpg\"\nstyle=\"height: 436px; width: 780px;\"\ntitle=\"Nồi cơm điện tử Philips 1.8 lít HD4515/55 - Tiện ích\"></a></p>\n<h3 style=\"text-align: justify;\">Phụ kiện đi kèm</h3>\n<p style=\"text-align: justify;\">- Phụ kiện kèm theo bao gồm: cốc đong, muỗng cơm, xửng hấp.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1922/299636/noi-com-dien-tu-philips-18-lit-hd4515-55-191222-034952.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi cơm điện tử Philips 1.8 lít HD4515/55 - Phụ kiện\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1922/299636/noi-com-dien-tu-philips-18-lit-hd4515-55-191222-034952.jpg\"\ntitle=\"Nồi cơm điện tử Philips 1.8 lít HD4515/55 - Phụ kiện\"></a></p>\n<p style=\"text-align: justify;\"><i>Nồi cơm điện tử Philips 1.8 lít\nHD4515/55</i>&nbsp;<em>đến từ thương hiệu uy tín Philips của Hà Lan, sở hữu nhiều chương trình tự động,\ncông nghệ nấu 3D cùng lòng nồi phủ lớp đá Maifan bền tốt sẽ giúp bạn chế biến những bữa cơm thơm ngon, giữ lại\nnhiều dưỡng chất trong gạo.</em></p>', 24, 1, 1),
(22, 8, 'Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520', 13, 'P22_avt.jpg', 4, '<p><em><strong>Nồi cơm điện nắp gài BlueStone 1.8\n    lít RCB-5520</strong></em>&nbsp;<i><strong>trang bị công nghệ 1D nấu cơm chín nhanh, lòng\nnồi hợp kim nhôm phủ chống dính bền tốt, điều chỉnh bằng nút gạt dễ sử dụng,... là sản phẩm tiện lợi\nhỗ trợ chế biến những bữa cơm thơm ngon cho gia đình.</strong></i></p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-1a-1.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Tổng quan\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-1a-1.jpg\"\n title=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Tổng quan\"></a></p>\n<h3>Công nghệ nấu, công suất - Dung tích</h3>\n<p>- Công suất 700W kết hợp công nghệ 1D giúp nấu cơm chín nhanh, rút ngắn\nthời gian nấu nướng cho người nội trợ.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-2a.gif\"\nonclick=\"return false;\"><img alt=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Công nghệ\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-2a.gif\"\n title=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Công nghệ\"></a></p>\n<p>- Dung tích 1.8 lít, nấu được 8 - 10 cốc gạo kèm nồi, phù hợp cho gia đình 4 - 6 người.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-3a-1.jpg\"\nonclick=\"return false;\"><img\nalt=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Dung tích, công suất\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-3a-1.jpg\"\n title=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Dung tích, công suất\"></a></p>\n<h3>Bảng điều khiển - Chế độ nấu</h3>\n<p>- Bảng điều khiển nút gạt đơn giản, có kèm đèn báo trạng thái hoạt động, dễ thao tác ngay cả với người lớn\ntuổi.</p>\n<p>- Mẫu nồi cơm điện này có 2 chế\nđộ: nấu cơm và giữ ấm.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-4a-1.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Bảng điều khiển\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-4a-1.jpg\"\ntitle=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Bảng điều khiển\"></a></p>\n<h3>Thiết kế của sản phẩm</h3>\n<p>- Mẫu&nbsp;nồi cơm điện\nBlueStone&nbsp;này được thiết kế màu vàng đồng hiện đại, làm tăng vẻ đẹp thẩm mỹ cho không gian bếp.\n</p>\n<p>- Lòng nồi dày khoảng 1.5 mm bằng hợp kim nhôm phủ lớp chống dính, gia nhiệt tốt giúp cơm chín đều, thơm\nngon, chống dính cháy, dễ vệ sinh.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-5a-1.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Lòng nồi\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-5a-1.jpg\"\ntitle=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Lòng nồi\"></a></p>\n<h3>Tiện ích - Phụ kiện</h3>\n<p>- Có xửng hấp đi kèm, hỗ trợ bạn hấp những món đơn giản: bánh bao, khoai,... nhanh chóng và tiện lợi.</p>\n<p>- Phụ kiện: xửng hấp, muỗng múc cơm, cốc đong.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-6a-1.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Tiện ích\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1922/189688/bluestone-rcb-5520-6a-1.jpg\"\ntitle=\"Nồi cơm điện nắp gài BlueStone 1.8 lít RCB-5520 - Tiện ích\"></a></p>\n\n', 24, 1200, 1),
(23, 9, 'Lò chiên không dầu Ferroli FAF-12M 12 lít', 19, 'P23_avt.jpg', 4.8, '<p><em><strong>Lò chiên không dầu&nbsp;</strong></em><i><strong>Ferroli FAF-12M 12 lít giúp bạn chiên lượng lớn thực\n    phẩm cùng lúc hoặc nướng gà nguyên con nhờ dung tích 12 lít, có nhiều phụ kiện đi kèm hỗ trợ bạn nấu nướng\n    thuận tiện, bảng điều khiển nút xoay đơn giản, dễ dàng điều chỉnh chức năng.</strong></i></p>\n<h3>Dung tích - Công suất&nbsp;</h3>\n<p>- Thiết kế&nbsp;nồi chiên không dầu&nbsp;kết hợp lò nướng, dung tích 12 lít, chế biến được gà nguyên con khoảng 1.5\nkg.</p>\n<p>- Công suất hoạt động 1800W cho khả năng chiên nướng nhanh, rút ngắn thời gian chờ đợi.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/9418/309914/lo-chien-khong-dau-ferroli-faf-12m-12-lit-060923-055222.jpg\"\nonclick=\"return false;\"><img alt=\"Lò chiên không dầu Ferroli FAF-12M 12 lít - Dung tích \"\n    src=\"https://cdn.tgdd.vn/Products/Images/9418/309914/lo-chien-khong-dau-ferroli-faf-12m-12-lit-060923-055222.jpg\"\n    style=\"height: 436px; width: 780px;\" title=\"Lò chiên không dầu Ferroli FAF-12M 12 lít - Dung tích\"></a>\n</p>\n<h3>Công nghệ chiên, nướng - Nhiệt độ, thời gian</h3>\n<p>- Công nghệ làm nóng bằng thanh nhiệt điện trở giúp thức ăn chín đều các mặt, giảm lượng dầu mỡ tối đa.</p>\n<p>- Nhiệt độ lò có thể điều chỉnh từ 80 - 200°C, thời gian từ 0 - 60 phút.&nbsp;</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/9418/309914/lo-chien-khong-dau-ferroli-faf-12m-12-lit-060923-055248.gif\"\nonclick=\"return false;\"><img alt=\"Lò chiên không dầu Ferroli FAF-12M 12 lít - Công nghệ \"\n    src=\"https://cdn.tgdd.vn/Products/Images/9418/309914/lo-chien-khong-dau-ferroli-faf-12m-12-lit-060923-055248.gif\"\n    style=\"height: 436px; width: 780px;\" title=\"Lò chiên không dầu Ferroli FAF-12M 12 lít - Công nghệ \"></a>\n</p>\n<h3>Thiết kế, chất liệu sản phẩm&nbsp;</h3>\n<p>- Mẫu&nbsp;nồi chiên không dầu Ferroli&nbsp;FAF-12M 12 lít thiết kế 2 trong 1, kết hợp giữa nồi chiên không dầu và lò\nnướng, cửa kính trong suốt thuận tiện cho việc nấu nướng,&nbsp;thích hợp với hầu hết mọi không gian bếp.</p>\n<p>- Vỏ ngoài làm bằng nhựa ABS cao cấp, an toàn, kháng vỡ, dễ lau chùi.</p>\n<p>- Khoang lò bằng thép mạ kẽm, bền tốt, nấu ăn an toàn, thuận tiện vệ sinh sau khi nấu nướng.&nbsp;</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/9418/309914/lo-chien-khong-dau-ferroli-faf-12m-12-lit-220923-090045.jpg\"\nonclick=\"return false;\"><img alt=\"Lò chiên không dầu Ferroli FAF-12M 12 lít - Khoang lò\"\n    src=\"https://cdn.tgdd.vn/Products/Images/9418/309914/lo-chien-khong-dau-ferroli-faf-12m-12-lit-220923-090045.jpg\"\n    style=\"height: 436px; width: 780px;\" title=\"Lò chiên không dầu Ferroli FAF-12M 12 lít - Khoang lò\"></a>\n</p>\n<h3>Bảng điều khiển</h3>\n<p>- Bảng điều khiển nút xoay dễ thao tác, tiện điều chỉnh nhiệt độ và thời gian chiên nướng.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/9418/309914/lo-chien-khong-dau-ferroli-faf-12m-12-lit-060923-055343.jpg\"\nonclick=\"return false;\"><img alt=\"Lò chiên không dầu Ferroli FAF-12M 12 lít - Bảng điều khiển \"\n    src=\"https://cdn.tgdd.vn/Products/Images/9418/309914/lo-chien-khong-dau-ferroli-faf-12m-12-lit-060923-055343.jpg\"\n    style=\"height: 436px; width: 780px;\" title=\"Lò chiên không dầu Ferroli FAF-12M 12 lít - Bảng điều khiển \"></a>\n</p>\n<h3>Tiện ích - Phụ kiện đi kèm</h3>\n<p>- Sở hữu thiết kế 2 trong 1: kết hợp giữa nồi chiên không dầu và lò nướng, giúp chế biến thực phẩm hạn chế dầu mỡ.\n</p>\n<p>-&nbsp;Nắp kính trong suốt&nbsp;và có đèn trong khoang lò để bạn dễ quan sát thức ăn lúc đang nấu.</p>\n<p>- Lò có đèn báo hoạt động, giúp người dùng tiện theo dõi trạng thái hoạt động của lò.</p>\n<p>- Trang bị quạt đối lưu đưa nhiệt lượng tỏa đều khoang lò, chế biến thức ăn chín đều các mặt.</p>\n<p>- Phụ kiện bao gồm: giỏ chiên, khay nướng, 2 vỉ nướng, khay xiên quay, tay cầm và xiên quay.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/9418/309914/lo-chien-khong-dau-ferroli-faf-12m-12-lit-060923-055855.jpg\"\nonclick=\"return false;\"><img alt=\"Lò chiên không dầu Ferroli FAF-12M 12 lít - Tiện ích\"\n    src=\"https://cdn.tgdd.vn/Products/Images/9418/309914/lo-chien-khong-dau-ferroli-faf-12m-12-lit-060923-055855.jpg\"\n    style=\"height: 436px; width: 780px;\" title=\"Lò chiên không dầu Ferroli FAF-12M 12 lít - Tiện ích\"></a>\n</p>\n<h3>Cách vệ sinh lò và lưu ý khi sử dụng</h3>\n<p>- Không sử dụng miếng cọ rửa bằng kim loại, chất tẩy rửa có tính ăn mòn, miếng len thép, hoặc khăn có sạn,... để lau\nbên ngoài, bên trong và các phụ kiện của lò chiên, hãy sử dụng miếng bọt biển hoặc vải mềm có tẩm chất tẩy rửa nhẹ\nhoặc khăn giấy với chất tẩy rửa kính dạng xịt để làm sạch.&nbsp;</p>\n<p>- Mở cửa lò chiên trong 10 - 15 phút để làm khô bên trong lò chiên và khung cửa sau mỗi lần sử dụng.</p>\n<p>- Không dùng vật thô cứng hoặc dụng cụ kim loại sắc nhọn để cạo cửa kính.</p>\n<p>Lò chiên không dầu Ferroli FAF-12M 12 lít​</i><em><i>&nbsp;mẫu mã hiện đại, dung tích lớn thuận tiện chiên số lượng\n    nhiều thực phẩm, làm bánh, nướng gà nguyên con,... là thiết bị gia dụng hữu ích, hỗ trợ tối ưu cho người nội\n    trợ trong việc nấu nướng.</i></em></p>\n', 12, 0, 1),
(24, 9, 'Nồi chiên không dầu Kangaroo KG42AF1', 14, 'P24_avt.jpg', 4.6, '<h3>Nồi chiên không dầu\n    Kangaroo&nbsp;với vỏ nhựa dày bền cách nhiệt, dễ lau chùi, dung tích tổng 4 lít và dung tích sử dụng 3.5 lít\nphục vụ thoải mái cho gia đình 3 – 5 người ăn</h3>\n<p>Nồi với màu đen hiện đại và sang trọng, kiểu dáng mềm mại, gọn gàng dễ kết hợp trong nhiều không gian bếp.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/2063/217555/noi-chien-khong-dau-kangaroo-kg42af1-1-2.jpg\"\n    onclick=\"return false;\"><img alt=\"Thiết kế - Nồi chiên không dầu Kangaroo KG42AF1 4 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/2063/217555/noi-chien-khong-dau-kangaroo-kg42af1-1-2.jpg\"\n        title=\"Thiết kế - Nồi chiên không dầu Kangaroo KG42AF1 4 lít\"></a></p>\n<h3>Chiên nướng ngon không cần dùng dầu ăn, tiết giảm đến 80% lượng chất béo dư thừa an toàn hơn cho sức khỏe</h3>\n<p>Công suất hoạt động 1400W, làm nóng nhanh bằng thanh nhiệt, nồi có chế độ bảo vệ tự ngắt khi quá nhiệt tránh hư hại\ncho thiết bị và an toàn hơn cho người sử dụng.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/2063/217555/noi-chien-khong-dau-kangaroo-kg42af1-2-1.jpg\"\n    onclick=\"return false;\"><img alt=\"Chiên nướng không dầu - Nồi chiên không dầu Kangaroo KG42AF1 4 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/2063/217555/noi-chien-khong-dau-kangaroo-kg42af1-2-1.jpg\"\n        title=\"Chiên nướng không dầu - Nồi chiên không dầu Kangaroo KG42AF1 4 lít\"></a></p>\n<h3>Rổ chiên dung tích sử dụng 3.5 lít, có tay cầm rời tháo lắp bằng nút gạt thuận tiện khi sử dụng, chống nóng bỏng cho\nngười dùng</h3>\n<p>Khay chiên (gồm rổ chiên + lòng nồi) được phủ lớp chống dính Ceramic bền tốt, hạn chế dính cháy thực phẩm, tiện vệ\nsinh.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/2063/217555/noi-chien-khong-dau-kangaroo-kg42af1-4-1.jpg\"\n    onclick=\"return false;\"><img alt=\"Rổ chiên có tay cầm rời - Nồi chiên không dầu Kangaroo KG42AF1 4 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/2063/217555/noi-chien-khong-dau-kangaroo-kg42af1-4-1.jpg\"\n       title=\"Rổ chiên có tay cầm rời - Nồi chiên không dầu Kangaroo KG42AF1 4 lít\"></a></p>\n<h3>Nhiệt độ nướng 80 - 200 độ C cho món nướng chuẩn ngon, hẹn giờ nấu 30 phút hỗ trợ người dùng rảnh tay với những việc\nbếp núc khác&nbsp;</h3>\n<p>Bảng điều khiển núm vặn\ndùng đơn giản với 2 núm độc lập chỉnh nhiệt độ nấu và hẹn giờ nấu, màn hình hiển thị tiện quan sát chế độ đang hoạt\nđộng.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/2063/217555/noi-chien-khong-dau-kangaroo-kg42af1-5-1.jpg\"\n    onclick=\"return false;\"><img alt=\"Bảng điều khiển - Nồi chiên không dầu Kangaroo KG42AF1 4 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/2063/217555/noi-chien-khong-dau-kangaroo-kg42af1-5-1.jpg\"\n        title=\"Bảng điều khiển - Nồi chiên không dầu Kangaroo KG42AF1 4 lít\"></a></p>\n<p><strong>Lưu ý khi sử dụng nồi chiên không dầu:</strong></p>\n<p>- Thực phẩm trước khi đưa vào nồi chiên cần được làm sạch và ráo nước.</p>\n<p>- Không cho quá nhiều thực phẩm vào cùng một lúc tránh đầy thức ăn và thức ăn không chín đều.</p>\n<p>- Chiên xong chờ thức ăn và lò nguội bớt trước khi lấy ra ngoài và chiên thêm mẻ tiếp theo.</p>\n<p>- Rút điện, chờ thiết bị nguội ít nhất 30 phút sau khi nấu rồi mới tiến hành vệ sinh.</p>\n<p>- Rửa khay chiên bằng nước nóng với một chút nước rửa chén và miếng vải mềm.</p>\n<p>Nồi chiên không dầu Kangaroo KG42AF1 4 lít thiết kế tiện\ndụng hơn, dùng an toàn, bền tốt, cho gia đình những bữa ăn ngon nhanh gọn, dinh dưỡng, có lợi hơn cho sức khỏe.</p>', 12, 1050, 1),
(25, 10, 'Bếp từ hồng ngoại lắp âm Pramie 2108', 16, 'P25_avt.jpg', 4.6, '\n<h3 style=\"text-align: justify;\">Bếp từ hồng ngoại\n    Pramie&nbsp;thương hiệu Pramie - Đức, sản xuất tại Malaysia, thiết kế lắp âm hiện đại</h3>\n<p style=\"text-align: justify;\">1 vùng nấu từ, 1 vùng nấu hồng ngoại sử dụng linh hoạt, tiện lợi cho nhu cầu\nhàng ngày. Với tổng công suất 4400W, bếp sử dụng điện nối qua aptomat (CB).</p>\n<p style=\"text-align: justify;\"><strong>Hãng Pramie hỗ trợ miễn phí cắt lỗ đá để lắp âm cho bếp Pramie trên\n    toàn quốc.</strong></p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108--1.jpg\"\n    onclick=\"return false;\"><img alt=\"Lắp âm sang trọng - Bếp từ hồng ngoại Pramie 2108\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108--1.jpg\"\n         title=\"Lắp âm sang trọng - Bếp từ hồng ngoại Pramie 2108\"></a></p>\n<h3 style=\"text-align: justify;\">Vùngbếp từ công suất 2200W, có chức năng nấu nhanh qua chế độ Booster với công suất\nđến 3000W</h3>\n<p style=\"text-align: justify;\">Nấu ăn nhanh chóng, an toàn, sử dụng với các nồi chảo có đáy nhiễm từ.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108-2a.jpg\"\n    onclick=\"return false;\"><img alt=\"Bếp từ hồng ngoại lắp âm Pramie 2108 - Chảo, nồi nhiễm từ\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108-2a.jpg\"\n        title=\"Bếp từ hồng ngoại lắp âm Pramie 2108 - Chảo, nồi nhiễm từ\"></a></p>\n<h3 style=\"text-align: justify;\">Vùng bếp hồng ngoại&nbsp;công suất 2200W, dùng với mọi loại nồi chảo</h3>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108-8.jpg\"\n    onclick=\"return false;\"><img alt=\"Hồng ngoại có công suất 2200W\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108-8.jpg\"\n        title=\"Hồng ngoại có công suất 2200W\"></a></p>\n<h3 style=\"text-align: justify;\">Mặt kính Ceramic thương hiệu K+ (Pháp) cao cấp cho khả năng chịu lực và\nchịu nhiệt tốt, chịu sốc nhiệt cao, chống trầy hiệu quả, sáng bóng dễ&nbsp;lau chùi</h3>\n<p style=\"text-align: justify;\">Người dùng an tâm về độ mới, độ bền của mặt bếp và sự ổn định khi vận hành.\n</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108-4.jpg\"\n    onclick=\"return false;\"><img alt=\"Kính cao cấp - Bếp từ hồng ngoại Pramie 2108\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108-4.jpg\"\n       title=\"Kính cao cấp - Bếp từ hồng ngoại Pramie 2108\"></a></p>\n<h3 style=\"text-align: justify;\">Bảng\n    điều khiển&nbsp;cảm ứng&nbsp;chạm trượt thao tác nhạy bén, thiết kế độc lập cho từng vùng nấu\nvới 9 mức công suất tùy chỉnh theo nhu cầu</h3>\n<p style=\"text-align: justify;\">Chức năng hẹn giờ cho phép người dùng chủ động thời gian dùng&nbsp;bếp từ hồng ngoại, an tâm làm những\ncông việc khác mà không lo món ăn quá nhiệt, cháy khét.</p>\n<p style=\"text-align: justify;\">Vô hiệu hóa bảng điều khiển khi bếp từ đang hoạt động, duy trì chế độ cài\nđặt trước đó và tránh người dùng, trẻ nhỏ vô tình chạm tay vào không gây thay đổi chương trình nấu.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108-5.jpg\"\n    onclick=\"return false;\"><img alt=\"Điều khiển nhạy bén - Bếp từ hồng ngoại Pramie 2108\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108-5.jpg\"\n       title=\"Điều khiển nhạy bén - Bếp từ hồng ngoại Pramie 2108\"></a></p>\n<h3 style=\"text-align: justify;\">Hỗ trợ các tính năng an toàn</h3>\n<p style=\"text-align: justify;\">-&nbsp;Cảnh báo mặt bếp nóng&nbsp;hiển thị cảnh báo để\ntránh chạm vào mặt bếp còn nóng.</p>\n<p style=\"text-align: justify;\">- Tự nhận diện kích cỡ nồi chảo: chỉ làm nóng vùng để nồi chảo chứ không\nphải hoàn toàn vùng nấu để tiết kiệm thời gian và năng lượng.</p>\n<p style=\"text-align: justify;\">&nbsp;<a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108-270122-040447.jpg\"\n    onclick=\"return false;\"><img alt=\"Bếp từ hồng ngoại Pramie 2108 với nhiều tính năng an toàn\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/237343/hong-ngoai-pramie-2108-270122-040447.jpg\"\n      title=\"Bếp từ hồng ngoại Pramie 2108 với nhiều tính năng an toàn\"></a></p>\n<p style=\"text-align: justify;\">Lưu ý:</p>\n<p style=\"text-align: justify;\">- Đặt bếp ở vị trí chắc chắn, cân bằng, cách xa tường tầm 15 cm để tản nhiệt\nnhanh.</p>\n<p style=\"text-align: justify;\">- Không nên nấu ăn với công suất tối đa quá lâu vì dễ gây cháy thức ăn và\nlâu dần có thể làm giảm tuổi thọ bếp.</p>\n<p style=\"text-align: justify;\">- Khi nấu ăn xong, nên vệ sinh bếp để giữ bếp mới lâu.</p>\n<p style=\"text-align: justify;\">Bếp từ hồng ngoại Pramie 2108 phục vụ tốt\ncho các gia đình muốn tận dụng sự tiện nghi của cả 2 loại bếp điện, dùng an toàn, bền tốt, nấu ăn nhanh\ntiết kiệm thời gian.</p>\n', 36, 1250, 1),
(26, 10, 'Bếp hồng ngoại 3 vùng nấu lắp âm Smeg SE363ETB ', 20, 'P26_avt.jpg', 4.4, '<p><i><strong>Sản phẩm bếp hồng ngoại 3 vùng nấu lắp âm Smeg SE363ETB (536.64.101) chất lượng cao thương hiệu Smeg của\n    Ý, sản xuất tại Ý với thiết kế lắp âm sang trọng, cao cấp chuẩn Châu Âu, mang đến nét đẹp cho không gian bếp\n    hiện đại.</strong></i></p>\n<h3>Công suất - Kích thước vùng nấu</h3>\n<p>- Tổng công suất đạt 5700W, nấu ăn nhanh, tiết kiệm thời gian cho việc bếp núc.</p>\n<p>- Vùng nấu trái phía trên công suất 1200W, vùng nấu trái dưới 1800W, vùng nấu phải với 3 có 3 công suất\n1050/1950/2700W hoạt động mạnh mẽ.</p>\n<p>-&nbsp;Vùng nấu trái trên đường kính Ø14.8 cm, vùng nấu trái dưới&nbsp;Ø18.4 cm, vùng nấu phải có 3 vòng nhiệt đường\nkính lần lượt Ø15.0 - Ø21.6 - Ø28.8 cm cho phép sử dụng linh hoạt với nhiều cỡ nồi chảo vô cùng tiện lợi.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/3305/252499/smeg-se363etb-53664101-230322-045913.gif\"\nonclick=\"return false;\"><img alt=\"Công suất lớn, vùng nấu rộng rãi\"\n    src=\"https://cdn.tgdd.vn/Products/Images/3305/252499/smeg-se363etb-53664101-230322-045913.gif\"\n    title=\"Công suất lớn, vùng nấu rộng rãi\"></a></p>\n<h3>Thiết kế</h3>\n<p>- Bếp hồng ngoại Smeg SE363ETB\n(536.64.101) thiết kế hiện đại, sang đẹp với 3 vùng đa kích thước rộng rãi.</p>\n<p>-&nbsp;Bếp hồng ngoại&nbsp;có&nbsp;mặt kính Ceramic&nbsp;- Smeg cao cấp của Ý, khả năng chịu lực\nvà chịu nhiệt tốt, ít bị trầy xước, giữ bếp gia nhiệt hiệu quả, luôn sáng đẹp như mới.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/3305/252499/smeg-se363etb-53664101-230322-045916.jpg\"\nonclick=\"return false;\"><img alt=\"Thiết kế sang trọng, cho gian bếp thêm phần đẳng cấp\"\n    src=\"https://cdn.tgdd.vn/Products/Images/3305/252499/smeg-se363etb-53664101-230322-045916.jpg\"\n     title=\"Thiết kế sang trọng, cho gian bếp thêm phần đẳng cấp\"></a></p>\n<h3>Tiện ích</h3>\n<p>- 9 mức công suất và nhiệt độ, linh hoạt tùy chỉnh cho phù hợp với từng món ăn khác nhau.</p>\n<p>- Bảng điều khiển cảm ứng nhạy, điều chỉnh độc lập 3 vùng nấu.</p>\n<p>- Trang bị&nbsp;chức năng hẹn\ngiờ&nbsp;thông minh hỗ trợ người nội trợ kiểm soát tốt thời gian sử dụng bếp, rảnh tay cho những công việc\nkhác mà không lo món nấu quá nhiệt.</p>\n<p>- Bếp không kén nồi, dùng được với mọi loại&nbsp;nồi,&nbsp chảo, tiết kiệm đáng kể chi phí đầu tư mua dụng cụ\nnấu, có thể tận dụng các nồi chảo có sẵn.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/3305/252499/smeg-se363etb-53664101-230322-045918.jpg\"\nonclick=\"return false;\"><img alt=\"Nhiều tiện ích đi kèm hỗ trợ người dùng tối đa\"\n    src=\"https://cdn.tgdd.vn/Products/Images/3305/252499/smeg-se363etb-53664101-230322-045918.jpg\"\n     title=\"Nhiều tiện ích đi kèm hỗ trợ người dùng tối đa\"></a></p>\n<h3>Tính năng an toàn</h3>\n<p>-&nbsp;Khóa bảng điều\nkhiển, đảm bảo an toàn cho gia đình, đặc biệt gia đình có con nhỏ.</p>\n<p>- Tính năng&nbsp;tự ngắt khi quá\nnhiệt&nbsp;giúp tránh cháy nổ.</p>\n<p>- Tự ngắt khi tràn nước.</p>\n<p>- Cảnh báo mặt bếp còn nóng, tránh bị bỏng.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/3305/252499/smeg-se363etb-53664101-230322-045920.jpg\"\nonclick=\"return false;\"><img alt=\"Nhiều tính năng an toàn bảo vệ người dùng\"\n    src=\"https://cdn.tgdd.vn/Products/Images/3305/252499/smeg-se363etb-53664101-230322-045920.jpg\"\n     title=\"Nhiều tính năng an toàn bảo vệ người dùng\"></a></p>\n<p><strong>Sử dụng bếp hồng ngoại an toàn</strong></p>\n<p>- Lắp đặt bếp âm theo đúng hướng dẫn của nhà sản xuất, đảm bảo khu vực đun nấu thông thoáng.</p>\n<p>- Tránh các tác động gây trầy xước mặt bếp sẽ ảnh hưởng đến hiệu quả gia nhiệt, mất thẩm mỹ.</p>\n<p>- Bếp hồng ngoại có thể lưu nhiệt sau quá trình sử dụng, cẩn trọng để tránh bị phỏng.</p>\n<p><i>Bếp hồng ngoại Smeg SE363ETB (536.64.101) là thương\nhiệu Ý, sản xuất tại Ý chất lượng cao, thiết kế 3 vùng nấu rộng rãi, công suất lớn 5700W, 9 mức nhiệt điều khiển\ncảm ứng cùng nhiều tính năng hẹn giờ, khóa điều khiển, cảnh báo bếp nóng là một lựa chọn hoàn hảo cho gia đình\nbạn.</i></p>', 24, 950, 1),
(27, 6, 'Máy tính bảng Samsung Galaxy Tab A7 Lite', 1, 'P27_avt.jpg', 3.8, '<h3 style=\"text-align: justify;\">Với mức giá hợp lý, Galaxy\n    Tab A7 Lite là mẫu máy tính bảng\nđược Samsung tạo ra nhằm hướng\nđến đối tượng người dùng đang tìm cho mình một thiết bị giải trí cơ bản với màn hình lớn, hỗ trợ đầy đủ kết nối để\ncó thể truy cập mạng nhanh mọi lúc mọi nơi.</h3>\n<h3 style=\"text-align: justify;\">Chip 8 nhân cho trải nghiệm mượt mà</h3>\n<p style=\"text-align: justify;\">Với vi xử lý MediaTek MT8768T 8 nhân xung nhịp tối đa đạt 2.3 GHz, có thể thấy Galaxy\nTab A7 Lite là một chiếc máy tính bảng hướng đến những nhu cầu giải trí cơ bản, mọi tác vụ như đọc báo, lướt\nFacebook hay chơi các tựa game nhẹ đều hoạt động khá tốt và ổn định.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/522/237325/samsung-galaxy-tab-a7-lite-09.jpg\"\n    onclick=\"return false;\"><img alt=\"Galaxy Tab A7 Lite | Trang bị con chip Helio P22T đến từ MediaTek\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/237325/samsung-galaxy-tab-a7-lite-09.jpg\"\n        title=\"Galaxy Tab A7 Lite | Trang bị con chip Helio P22T đến từ MediaTek\"></a></p>\n<p style=\"text-align: justify;\">Máy cũng được trang bị&nbsp;RAM 3 GB&nbsp;hỗ trợ cho việc đa nhiệm được tốt\nhơn.&nbsp;Bộ nhớ trong 32 GB&nbsp;và có hỗ trợ thẻ\nnhớ mở rộng tối đa 1 TB cho bạn có nhiều không gian lưu trữ hơn.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/522/237325/samsung-galaxy-tab-a7-lite-008.jpg\"\n    onclick=\"return false;\"><img alt=\"Galaxy Tab A7 Lite | RAM 3 GB, ROM 32 GB hỗ trợ thẻ nhớ mở rộng lên đến 1 TB\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/237325/samsung-galaxy-tab-a7-lite-008.jpg\"\n        title=\"Galaxy Tab A7 Lite | RAM 3 GB, ROM 32 GB hỗ trợ thẻ nhớ mở rộng lên đến 1 TB\"></a></p>\n<p style=\"text-align: justify;\">Với viên pin 5100 mAh cùng sự tối ưu bởi vi xử lý Helio P22T tiết kiệm điện năng, đảm\nbảo cho Galaxy Tab A7 Lite có thể hoạt động liên tục trong nhiều giờ liền với các tác vụ thông thường.&nbsp;</p>\n<p style=\"text-align: justify;\">Dù chỉ trang bị phụ kiện sạc 7.75 W đi kèm, nhưng Galaxy Tab A7 Lite hỗ\ntrợ&nbsp;sạc&nbsp;với công suất tối đa 15 W, người dùng có thể mua thêm phụ kiện sạc tương thích để đạt tốc độ sạc\ntối ưu nhất.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/522/237325/samsung-galaxy-tab-a7-lite-007.jpg\"\n    onclick=\"return false;\"><img alt=\"Galaxy Tab A7 Lite | Hỗ trợ sạc nhanh 15 W\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/237325/samsung-galaxy-tab-a7-lite-007.jpg\"\n         title=\"Galaxy Tab A7 Lite | Hỗ trợ sạc nhanh 15 W\"></a></p>\n<p style=\"text-align: justify;\">Galaxy Tab A7 Lite sẽ hoạt động với giao diện người dùng OneUI 3.1 được Samsung tùy biến\ntrên Android 11, mang đến tính năng mới và trải nghiệm với những thao tác vuốt chạm mượt mà.</p>\n<h3 style=\"text-align: justify;\">Giải trí hoàn hảo với màn hình lớn và âm thanh stereo</h3>\n<p style=\"text-align: justify;\">Về phần hiển thị, Galaxy Tab A7 Lite được trang bị màn hình có kích thước 8.7 inch, phần\nviền xung quanh được làm mỏng tối ưu cho trải nghiệm xem phim, chơi game được tốt hơn.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/522/237325/samsung-galaxy-tab-a7-lite-001.jpg\"\n    onclick=\"return false;\"><img alt=\"Galaxy Tab A7 Lite | Trang bị màn hình kích thước lớn 8.7 inch\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/237325/samsung-galaxy-tab-a7-lite-001.jpg\"\n        title=\"Galaxy Tab A7 Lite | Trang bị màn hình kích thước lớn 8.7 inch\"></a></p>\n<p style=\"text-align: justify;\">Với tấm nền TFT LCD, độ phân giải 800 x 1340 pixel, chất lượng hiển thị trên Galaxy Tab\nA7 Lite dừng ở mức tạm ổn, bạn vẫn có màn hình rõ nét, hiển thị nhiều nội dung hơn khi lướt web đọc tin tức mà không\nphải cuộn trang lên xuống nhiều lần.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/522/237325/samsung-galaxy-tab-a7-lite-009.jpg\"\n    onclick=\"return false;\"><img alt=\"Galaxy Tab A7 Lite | Tấm nền TFT LCD, độ phân giải 800 x 1340 pixel\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/237325/samsung-galaxy-tab-a7-lite-009.jpg\"\n        title=\"Galaxy Tab A7 Lite | Tấm nền TFT LCD, độ phân giải 800 x 1340 pixel\"></a></p>\n<p style=\"text-align: justify;\">Galaxy Tab A7 Lite nâng cấp trải nghiệm giải trí của bạn với loa stereo công nghệ Dolby\nAtmos tạo ra không gian âm thanh sống động cho bạn đắm chìm trong thế giới giải trí với những bộ phim hay những bài\nhát mà bạn yêu thích.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/522/237325/samsung-galaxy-tab-a7-lite-005.jpg\"\n    onclick=\"return false;\"><img\n        alt=\"Galaxy Tab A7 Lite | Loa stereo Dolby Atmos tạo ra không gian âm thanh sống động\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/237325/samsung-galaxy-tab-a7-lite-005.jpg\"\n       \n        title=\"Galaxy Tab A7 Lite | Loa stereo Dolby Atmos tạo ra không gian âm thanh sống động\"></a></p>\n<h3 style=\"text-align: justify;\">Thiết kế gọn nhẹ cao cấp</h3>\n<p style=\"text-align: justify;\">Galaxy Tab A7 Lite sở hữu thiết kế nhôm nguyên khối thay vì chất liệu nhựa thường thấy\ncủa những dòng máy giá rẻ, đồng thời chất liệu này cũng giúp cho việc tản nhiệt ở mặt lưng tốt hơn.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/522/237325/samsung-galaxy-tab-a7-lite-002.jpg\"\n    onclick=\"return false;\"><img alt=\"Galaxy Tab A7 Lite | Thiết kế mặt lưng\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/237325/samsung-galaxy-tab-a7-lite-002.jpg\"\n        title=\"Galaxy Tab A7 Lite | Thiết kế mặt lưng\"></a></p>\n<p style=\"text-align: justify;\">Với độ mỏng chỉ 8 mm và nặng 371 g, Galaxy Tab A7 Lite sẽ cho bạn cảm giác cầm nắm rất\nthoải mái, rất thích hợp dùng để giải trí, chơi game trong những lúc nghỉ ngơi hay khi di chuyển trên tàu xe.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/522/237325/samsung-galaxy-tab-a7-lite-07.jpg\"\n    onclick=\"return false;\"><img alt=\"Galaxy Tab A7 Lite | Thiết kế gọn nhẹ, cầm nắm thoải mái\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/237325/samsung-galaxy-tab-a7-lite-07.jpg\"\n        title=\"Galaxy Tab A7 Lite | Thiết kế gọn nhẹ, cầm nắm thoải mái\"></a></p>\n<h3 style=\"text-align: justify;\">Kết nối mạng nhanh, hỗ trợ nghe gọi</h3>\n<p style=\"text-align: justify;\">Bên cạnh những chuẩn kết nối mạng như Wi-Fi, 4G giúp bạn truy cập mạng với tốc độ cao ở\nbất kỳ đâu thì bạn cũng có thể lắp sim nghe gọi, biến Galaxy Tab A7 Lite trở thành một chiếc điện\n    thoại “siêu lớn” hỗ trợ tốt cho việc liên lạc được thuận tiện hơn.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/522/237325/samsung-galaxy-tab-a7-lite-003.jpg\"\n    onclick=\"return false;\"><img alt=\"Galaxy Tab A7 Lite | Camera sau 8 MP\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/237325/samsung-galaxy-tab-a7-lite-003.jpg\"\n        title=\"Galaxy Tab A7 Lite | Camera sau 8 MP\"></a></p>\n<p style=\"text-align: justify;\">Thiết bị trang bị đầy đủ camera trước và sau với độ phân giải lần lượt là 2 MP và 8 MP,\nkhá hữu ích để bạn gọi video call hay lưu lại cuộc sống hằng ngày của gia đình mình.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/522/237325/samsung-galaxy-tab-a7-lite-010.jpg\"\n    onclick=\"return false;\"><img alt=\"Galaxy Tab A7 Lite | Giao diện chụp ảnh \"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/237325/samsung-galaxy-tab-a7-lite-010.jpg\"\n       title=\"Galaxy Tab A7 Lite | Giao diện chụp ảnh \"></a></p>\n<p style=\"text-align: justify;\">Tóm lại, Galaxy Tab A7 Lite đáp ứng tốt nhu cầu giải trí của người dùng phổ thông trên\nmàn hình lớn có thể thay thế cho smartphone. Sản phẩm rất thích hợp làm thiết bị giải trí dành cho gia đình, các bé\ncó thể vừa học vừa chơi, người già có thể sử dụng để đọc báo cập nhật tin tức mỗi ngày.</p>', 12, 1200, 1);
INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `supplier_id`, `product_avt_img`, `product_rate`, `product_description`, `product_period`, `product_view_count`, `product_is_display`) VALUES
(28, 1, 'Máy lạnh Nagakawa Inverter 1.5 HP NIS-C12R2H10', 42, 'P28_avt.jpg', 4.9, '<h3>Diệt khuẩn, khử mùi nhờ chức năng tự làm sạch Auto Clean</h3>\n<p>Máy lạnh Nagakawa Inverter 1.5 HP NIS-C12R2H10 nhờ chức năng tự làm sạch Auto Clean sẽ loại bỏ vi khuẩn, nấm mốc hiệu\n    quả đến 99.9% và làm khô nước còn đọng lại ở dàn tản nhiệt.</p>\n<p>Chức năng tự làm sạch có tác dụng chính là làm sạch, môi trường sinh sôi của mầm bệnh bị triệt tiêu, tạo nên bầu\n    không khí trong lành. Đồng thời, nâng cao tuổi thọ sử dụng máy lạnh, tiết kiệm chi phí vệ sinh cho gia đình.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/2002/235745/Slider/nagakawa-nis-c12r2h10-040321-03011910.jpg\"\n        onclick=\"return false;\"><img alt=\"Máy lạnh Nagakawa Inverter 1.5 HP NIS-C12R2H10 - Tự làm sạch\"\n            src=\"https://cdn.tgdd.vn/Products/Images/2002/235745/Slider/nagakawa-nis-c12r2h10-040321-03011910.jpg\"></a>\n</p>\n<h3>Bầu không khí trong lành với hệ thống làm sạch không khí 5 lớp</h3>\n<p>Hệ thống làm sạch không khí với màng lọc 5 lớp, màng này có tác dụng chính là làm sạch không khí nhờ màng lọc loại bỏ\n    các tác nhân có ảnh hưởng xấu đến sức khỏe như vi khuẩn, bụi bẩn, nấm mốc... một cách hiệu quả nhất.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/2002/235745/Slider/nagakawa-nis-c12r2h10-040321-0301082.jpg\"\n        onclick=\"return false;\"><img alt=\"Máy lạnh Nagakawa Inverter 1.5 HP NIS-C12R2H10 - Bộ lọc 5 lớp\"\n            src=\"https://cdn.tgdd.vn/Products/Images/2002/235745/Slider/nagakawa-nis-c12r2h10-040321-0301082.jpg\"></a>\n</p>\n<p>&nbsp;</p>\n<h3>Công nghệ Inverter tiết kiệm điện, vận hành êm ái, ổn định</h3>\n<p>Máy lạnh NIS-C12R2H10 được ứng dụng công nghệ Inverter hiện đại, hoạt động êm ái, bền bỉ. Nhiệt độ trong phòng luôn\n    duy trì ở mức ổn định, giảm chi phí tiền điện hằng tháng đáng kể cho bạn.</p>\n<p>Ngoài ra, chức năng tiết kiệm năng lượng Economy được tích hợp trên máy lạnh cũng góp phần tiết kiệm năng lượng tối\n    ưu.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/2002/235745/Slider/nagakawa-nis-c12r2h10-040321-0301125.jpg\"\n        onclick=\"return false;\"><img alt=\"Máy lạnh Nagakawa Inverter 1.5 HP NIS-C12R2H10 - Tiết kiệm điện\"\n            src=\"https://cdn.tgdd.vn/Products/Images/2002/235745/Slider/nagakawa-nis-c12r2h10-040321-0301125.jpg\"></a>\n</p>\n<h3>Cảm biến nhiệt độ thông minh trên remote I Feel</h3>\n<p>Trên remote của&nbsp;máy lạnh Nagakawa&nbsp;được tích hợp cảm biến nhiệt độ thông minh I Feel. Cảm biến này có tác\n    dụng chính là truyền tín hiệu đến dàn lạnh về nhiệt độ ở môi trường xung quanh nơi đặt remote mà nó cảm nhận được.\n</p>\n<p>Do đó, bạn chỉ cần đặt remote bên cạnh người là có thể tận hưởng luồng không khí mát lạnh như ý muốn.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/2002/235745/Slider/nagakawa-nis-c12r2h10-040321-0301104.jpg\"\n        onclick=\"return false;\"><img alt=\"Máy lạnh Nagakawa Inverter 1.5 HP NIS-C12R2H10 - Cảm biến nhiệt độ thông minh\"\n            src=\"https://cdn.tgdd.vn/Products/Images/2002/235745/Slider/nagakawa-nis-c12r2h10-040321-0301104.jpg\"></a>\n</p>\n<h3>Thiết kế hiện đại, phù hợp với phòng có diện tích từ 15 - 20 m2</h3>\n<p>Máy lạnh Nagakawa Inverter NIS-C12R2H10 có thiết kế hiện đại với tông màu trắng sang trọng, phù hợp với mọi không\n    gian nội thất trong gia đình.</p>\n<p>Với công suất làm lạnh 1.5 HP, chiếc máy lạnh Nagakawa phù hợp với diện tích từ 15 - 20 m2.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/2002/235745/Slider/nagakawa-nis-c12r2h10-040321-0301147.jpg\"\n        onclick=\"return false;\"><img alt=\"Máy lạnh Nagakawa Inverter 1.5 HP NIS-C12R2H10 - Công suất 1.5 HP\"\n            src=\"https://cdn.tgdd.vn/Products/Images/2002/235745/Slider/nagakawa-nis-c12r2h10-040321-0301147.jpg\"></a>\n</p>\n<h3>Làm lạnh nhanh tức thì với chế độ Super</h3>\n<p>Chế độ Super sẽ tăng cường hiệu suất hoạt động của máy lạnh ngay khi chế độ này được kích hoạt, nhằm đạt được tốc độ\n    làm lạnh nhanh, đem đến bầu không gian mát lạnh tức thì mà không cần chờ đợi lâu.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/2002/235745/Slider/nagakawa-nis-c12r2h10-040321-0301136.jpg\"\n        onclick=\"return false;\"><img alt=\"Máy lạnh Nagakawa Inverter 1.5 HP NIS-C12R2H10 - Làm lạnh nhanh\"\n            src=\"https://cdn.tgdd.vn/Products/Images/2002/235745/Slider/nagakawa-nis-c12r2h10-040321-0301136.jpg\"></a>\n</p>\n<h3>Không gian khô ráo, thoáng đãng nhờ tính năng hút ẩm</h3>\n<p>Tính năng hút ẩm sẽ thích hợp vào những ngày thời tiết ẩm ương, độ ẩm không khí cao. Nhờ khả năng làm giảm hơi ẩm\n    trong không khí, trả lại không gian khô ráo, dễ chịu.</p>\n<p><em><strong>Lưu ý:</strong> Tính năng hút ẩm chỉ có tác dụng giúp giảm độ ẩm trong không khí chứ không có tác dụng\n        làm lạnh.</em></p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/2002/235745/Slider/nagakawa-nis-c12r2h10-040321-0301093.jpg\"\n        onclick=\"return false;\"><img alt=\"Máy lạnh Nagakawa Inverter 1.5 HP NIS-C12R2H10 - Chế độ hút ẩm\"\n            src=\"https://cdn.tgdd.vn/Products/Images/2002/235745/Slider/nagakawa-nis-c12r2h10-040321-0301093.jpg\"></a>\n</p>\n<h3>Dễ dàng theo dõi nhiệt độ vào ban đêm với đèn LED hiển thị nhiệt độ</h3>\n<p>Với đèn LED hiển thị dịu nhẹ trên dàn lạnh, vào ban đêm bạn sẽ dễ dàng theo dõi cũng như điều chỉnh nhiệt độ cho máy\n    thay vì phải dùng đèn để soi nhiệt độ trên remote sau đó điều chỉnh như một số dòng máy lạnh thông thường.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/2002/235745/Slider/212-780x433.jpg\"\n        onclick=\"return false;\"><img alt=\"Máy lạnh Nagakawa Inverter 1.5 HP NIS-C12R2H10 - Đèn LED\"\n            src=\"https://cdn.tgdd.vn/Products/Images/2002/235745/Slider/212-780x433.jpg\"\n            title=\"Máy lạnh Nagakawa Inverter 1.5 HP NIS-C12R2H10 - Đèn LED\"></a></p>\n<h3>Tăng hiệu suất làm lạnh với chế độ đảo gió 4D</h3>\n<p>Chế độ đảo gió 4D cho phép cánh đảo gió có thể đảo gió theo phương đứng (lên/xuống) và phương ngang (trái/phải) giúp\n    tạo ra những luồng không khí lạnh được lan tỏa đều khắp đến mọi nơi trong phòng.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/2002/235745/Slider/nagakawa-nis-c12r2h10-040321-0301168.jpg\"\n        onclick=\"return false;\"><img alt=\"Máy lạnh Nagakawa Inverter 1.5 HP NIS-C12R2H10 - Chức năng đảo gió 4D\"\n            src=\"https://cdn.tgdd.vn/Products/Images/2002/235745/Slider/nagakawa-nis-c12r2h10-040321-0301168.jpg\"></a>\n</p>\n<h3>Chức năng tự khởi động lại khi có điện tiện lợi</h3>\n<p>Nhờ chức năng tự khởi động lại khi có điện, máy lạnh sẽ tự ghi nhớ được các thông số cài đặt của máy vận hành trước\n    khi nguồn điện bị ngắt đột ngột. Khi có nguồn điện, máy lạnh sẽ tự khởi động theo những thông số đã ghi nhớ trước\n    đó.</p>\n<p>Do đó, bạn không cần tốn nhiều thời gian thiết lập lại các thông số cho máy lạnh hoạt động.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/2002/235745/Slider/nagakawa-nis-c12r2h10-040321-0301179.jpg\"\n        onclick=\"return false;\"><img alt=\"Máy lạnh Nagakawa Inverter 1.5 HP NIS-C12R2H10 - Tự khởi động lại khi có điện\"\n            src=\"https://cdn.tgdd.vn/Products/Images/2002/235745/Slider/nagakawa-nis-c12r2h10-040321-0301179.jpg\"></a>\n</p>\n<h3>Dàn trao đổi nhiệt mạ xanh BlueFin chống ăn mòn, chống bám bẩn</h3>\n<p>Dàn trao đổi nhiệt của máy lạnh Nagakawa được phủ lớp BlueFin màu xanh có tác dụng chống ăn mòn, chống bám bẩn hiệu\n    quả, hạn chế những ảnh hưởng của thời tiết khắc nghiệt, tăng khả năng chống chọi, sử dụng bền bỉ.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/2002/235745/Slider/nagakawa-nis-c12r2h10-040321-0301050.jpg\"\n        onclick=\"return false;\"><img alt=\"Máy lạnh Nagakawa Inverter 1.5 HP NIS-C12R2H10 - Dàn trao đổi nhiệt BlueFin\"\n            src=\"https://cdn.tgdd.vn/Products/Images/2002/235745/Slider/nagakawa-nis-c12r2h10-040321-0301050.jpg\"></a>\n</p>\n<p>Nhìn chung, máy lạnh Nagakawa Inverter 1.5 HP NIS-C12R2H10 là chiếc máy lạnh phù hợp cho những hộ gia đình có nhu cầu\n    làm lạnh cho diện tích căn phòng từ 15 - 20 m2. Với nhiều chế độ tiện lợi, bên cạnh tiết kiệm điện, làm lạnh nhanh\n    tức thì, máy lạnh sẽ đem đến những trải nghiệm tuyệt vời khi sử dụng.</p>', 24, 200, 1),
(29, 1, 'Máy lạnh Samsung Inverter 1.5 HP AR13CYHAAWKNSV', 1, 'P29_avt.jpg', 4, '<p style=\"text-align: justify;\"><em><strong>Máy lạnh Samsung Inverter 1.5 HP\n    AR13CYHAAWKNSV là dòng máy lạnh 1 chiều sở hữu công nghệ Digital Inverter Boost tiết kiệm điện năng,\nchế độ làm lạnh nhanh Fast Cooling, làm lạnh đều với tự động đảo gió 4 hướng. Bên cạnh đó, máy lạnh còn được\ntrang bị bộ lọc Copper Anti-bacteria Filter cho hiệu quả lọc sạch bụi bẩn, vi khuẩn tối ưu.</strong></em>\n</p>\n<h3 style=\"text-align: justify;\">Tổng quan thiết kế</h3>\n<p style=\"text-align: justify;\">- Máy lạnh Samsung này sở hữu lớp vỏ ngoài cứng cáp, gam màu trắng thanh\nnhã, đi kèm thiết kế với <strong>các cạnh được bo tròn nhẹ nhàng</strong>, phù hợp với nhiều không gian nội thất\nkhác nhau.&nbsp;</p>\n<p style=\"text-align: justify;\">- <strong>Ống dẫn gas bằng đồng</strong> nguyên chất bền bỉ, khả năng chịu ăn mòn tốt,\nđồng thời truyền nhiệt nhanh, ổn định trong suốt quá trình máy hoạt động. Đi kèm theo đó là <strong>lá tản nhiệt\nbằng nhôm</strong> có kích thước gọn nhẹ, thuận tiện cho việc di chuyển và lắp đặt.&nbsp;</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/304229/may-lanh-samsung-inverter-15-hp-ar13cyhaawknsv-240323-111801.png\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Samsung Inverter 1.5 HP AR13CYHAAWKNSV - Thiết kế\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/2002/304229/may-lanh-samsung-inverter-15-hp-ar13cyhaawknsv-240323-111801.png\"\ntitle=\"Máy lạnh Samsung Inverter 1.5 HP AR13CYHAAWKNSV - Thiết kế\"></a>\n</p>\n<p style=\"text-align: justify;\"><em style=\"text-align: justify;\">* Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3 style=\"text-align: justify;\">Công nghệ tiết kiệm điện</h3>\n<p style=\"text-align: justify;\">- <strong>Eco </strong>là chế độ tiết kiệm điện năng, khi sử dụng chế độ này, máy\nlạnh</strong> sẽ tự động làm mát và tạm dừng khi đạt tới nhiệt độ mong muốn. Sau khi nhiệt độ phòng tăng\ntừ 1 – 2 độ C, máy lạnh sẽ làm mát trở lại, quá trình sẽ lặp lại liên tục trong suốt thời gian hoạt động.&nbsp;</p>\n<p style=\"text-align: justify;\">- Công nghệ <strong>Digital Inverter\nBoost</strong> đẩy nhanh tốc độ làm lạnh không khí đến 43%, đồng thời <strong>tiết kiệm đến 68% điện\nnăng</strong>.</p>\n<p style=\"text-align: justify;\">- Sử dụng <strong>Gas R32</strong> thân thiện với môi trường, giúp làm lạnh nhanh, tiết\nkiệm điện.&nbsp;</p>\n<p style=\"text-align: justify;\">- Sản phẩm có tem năng lượng đạt chuẩn <strong>5 sao</strong>, hiệu suất năng lượng\n<strong>4.60</strong>.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/304229/may-lanh-samsung-inverter-15-hp-ar13cyhaawknsv-240323-112320.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Samsung Inverter 1.5 HP AR13CYHAAWKNSV - Công nghệ tiết kiệm điện\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/2002/304229/may-lanh-samsung-inverter-15-hp-ar13cyhaawknsv-240323-112320.jpg\"\ntitle=\"Máy lạnh Samsung Inverter 1.5 HP AR13CYHAAWKNSV - Công nghệ tiết kiệm điện\"></a></p>\n<p style=\"text-align: justify;\"><em style=\"text-align: justify;\">* Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3 style=\"text-align: justify;\">Khả năng lọc không khí</h3>\n<p style=\"text-align: justify;\">- Bộ lọc <strong>Copper Anti-bacteria Filter</strong> là bộ lọc phân tử đồng kháng khuẩn\ncó khả năng loại bỏ bụi bẩn tối ưu, đồng thời diệt khuẩn hiệu quả, mang lại bầu không khí trong lành cho người sử\ndụng. Hơn nữa, bộ lọc này dễ dàng tháo gỡ tiện lợi cho việc vệ sinh máy định kỳ.&nbsp;</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/304229/may-lanh-samsung-inverter-15-hp-ar13cyhaawknsv-290323-111750.jpg\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Samsung Inverter 1.5 HP AR13CYHAAWKNSV - Khả năng lọc không khí\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/2002/304229/may-lanh-samsung-inverter-15-hp-ar13cyhaawknsv-290323-111750.jpg\"\ntitle=\"Máy lạnh Samsung Inverter 1.5 HP AR13CYHAAWKNSV - Khả năng lọc không khí\"></a></p>\n<p style=\"text-align: justify;\"><em style=\"text-align: justify;\">* Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3 style=\"text-align: justify;\">Công nghệ làm lạnh</h3>\n<p style=\"text-align: justify;\">- Công suất làm lạnh <strong>1.5 HP</strong>&nbsp;phù hợp cho không gian có diện tích\n<strong>từ 15 - 20m² (từ 40 đến 60m³)</strong>.</p>\n<p style=\"text-align: justify;\">- Công nghệ làm lạnh nhanh <strong>Fast Cooling</strong> giúp\nphân tán nhanh không khí mát lạnh đến mọi ngóc ngách trong phòng.&nbsp;</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/304229/may-lanh-samsung-inverter-15-hp-ar13cyhaawknsv-240323-113244.jpg\"\nonclick=\"return false;\"><img\nalt=\"Máy lạnh Samsung Inverter 1.5 HP AR13CYHAAWKNSV - Công nghệ làm lạnh nhanh Fast Cooling\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/2002/304229/may-lanh-samsung-inverter-15-hp-ar13cyhaawknsv-240323-113244.jpg\"\ntitle=\"Máy lạnh Samsung Inverter 1.5 HP AR13CYHAAWKNSV - Công nghệ làm lạnh nhanh Fast Cooling\"></a></p>\n<p style=\"text-align: justify;\"><em style=\"text-align: justify;\">* Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3 style=\"text-align: justify;\">Cơ chế thổi gió</h3>\n<p style=\"text-align: justify;\">- Máy lạnh Samsung Inverter 1.5 HP AR13CYHAAWKNSV hoạt động với chế độ gió <strong>tùy\nchỉnh điều khiển lên xuống, trái phải tự động</strong>.&nbsp;</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/304229/may-lanh-samsung-inverter-15-hp-ar13cyhaawknsv-240323-113321.png\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Samsung Inverter 1.5 HP AR13CYHAAWKNSV - Cơ chế thổi gió\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/2002/304229/may-lanh-samsung-inverter-15-hp-ar13cyhaawknsv-240323-113321.png\"\ntitle=\"Máy lạnh Samsung Inverter 1.5 HP AR13CYHAAWKNSV - Cơ chế thổi gió\"></a></p>\n<p style=\"text-align: justify;\"><em style=\"text-align: justify;\">* Hình ảnh chỉ mang tính chất minh họa</em></p>\n<p style=\"text-align: justify;\">- Chế độ Wind-Free</strong> được biết đến là công\nnghệ làm lạnh tức thì, <strong>không thổi trực tiếp gió buốt vào người</strong> sử dụng. Khi chọn chế độ này, làn\ngió mát lạnh sẽ thổi nhẹ nhàng qua 23.000 lỗ siêu nhỏ ở mặt trước của máy, luồng khí được phân tán và chuyển động\nvới vận tốc cực thấp, mang lại sự thoải mái dễ chịu nhất cho người dùng.&nbsp;</p>\n<h3 style=\"text-align: justify;\">Tiện ích</h3>\n<p style=\"text-align: justify;\">- Chế độ ngủ ngon <strong>Good Sleep</strong> cho bạn giấc ngủ sâu nhờ vào việc tự động\nđiều chỉnh nhiệt độ phù hợp, tiết kiệm đến 36% điện năng.</p>\n<p style=\"text-align: justify;\">- Chức năng <strong>khử ẩm</strong> phù hợp với những ngày thời tiết mưa gió ẩm ướt, độ\nẩm trong không khí cao, mang đến không gian khô ráo thoải mái cho người sử dụng.</p>\n<p style=\"text-align: justify;\">- Tính năng <strong>Auto Clean</strong> tự động làm sạch bộ trao đổi nhiệt, tiết kiệm\nthời gian và chi phí vệ sinh, đồng thời ngăn chặn nấm mốc phát triển.</p>\n<p style=\"text-align: justify;\">- <strong>Tự khởi động lại khi có\nđiện</strong>: máy lạnh tự động vận hành lại khi nguồn điện được phục hồi.&nbsp;</p>\n<p style=\"text-align: justify;\">- Hẹn giờ bật tắt máy</strong>: người\ndùng chủ động cài đặt thời gian bật/tắt máy lạnh theo nhu cầu sử dụng.&nbsp;</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/2002/304229/may-lanh-samsung-inverter-15-hp-ar13cyhaawknsv-240323-113540.png\"\nonclick=\"return false;\"><img alt=\"Máy lạnh Samsung Inverter 1.5 HP AR13CYHAAWKNSV - Tiện ích\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/2002/304229/may-lanh-samsung-inverter-15-hp-ar13cyhaawknsv-240323-113540.png\"\ntitle=\"Máy lạnh Samsung Inverter 1.5 HP AR13CYHAAWKNSV - Tiện ích\"></a></p>\n<p style=\"text-align: justify;\"><em>* Hình ảnh chỉ mang tính chất minh họa</em></p>\n<p style=\"text-align: justify;\"><em>Nếu bạn có nhu cầu lắp máy lạnh cho không gian phòng có diện tích từ 15 - 20m² (từ\n40 đến 60m³), muốn trải nghiệm công nghệ Digital Inverter Boost, chế độ Eco, bộ lọc Copper Anti-bacteria Filter,\ncông nghệ làm lạnh nhanh Fast Cooling, chức năng hẹn giờ bật tắt máy,…. thì máy lạnh Samsung Inverter 1.5 HP\nAR13CYHAAWKNSV sẽ là một sự lựa chọn đáng cân nhắc dành cho gia đình bạn.&nbsp;</em></p>', 24, 400, 1),
(30, 3, 'Smart Tivi QLED 4K 75 inch Samsung QA75Q80C', 1, 'P30_avt.jpg', 4.8, '<p><strong><em>Smart Tivi QLED 4K 75 inch Samsung\n    QA75Q80C&nbsp;mang đến niềm tự hào cho gia chủ với thiết kế sang trọng, màn hình 75 inch hiển thị\nhình ảnh 4K sống động nhờ trang bị&nbsp;bộ xử lý Neural Quantum 4K AI 20 nơ-ron&nbsp;mạnh mẽ,&nbsp;công nghệ\nDirect Full Array 8X hiển thị hình ảnh chi tiết,&nbsp;Real Depth Enhancer tái tạo khung hình chuẩn như mắt\nnhìn, công nghệ Dolby Atmos, OTS Lite&nbsp;mang đến âm vòm theo dõi chuyển động hình ảnh cuốn hút, trợ lý ảo\nBixby cho bạn điều khiển tivi bằng khẩu lệnh dễ dàng.</em></strong></p>\n<h3>Tổng quan thiết kế</h3>\n<p>-&nbsp;Mẫu&nbsp;Smart tivi Samsung&nbsp;này có thiết kế\ntinh giản, kết cấu gọn gàng, đường viền thanh mảnh bao bọc và tăng cường bảo vệ màn hình. Chân đế được làm từ kim\nloại<strong>&nbsp;</strong>bền chắc, chống biến dạng, đặt&nbsp;tivi&nbsp;trên bàn, kệ tủ ổn định, không lo mất thăng\nbằng.&nbsp;</p>\n<p>-&nbsp;Màn\nhình 75 inch&nbsp;là lựa chọn phù hợp cho những không gian trưng bày có diện tích rộng rãi như phòng khách,\nphòng ngủ gia đình, phòng hội nghị của công ty, showroom.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/303214/smart-tivi-qled-4k-75-inch-samsung-qa75q80c-190323-102100.jpg\"\nonclick=\"return false;\"><img alt=\"Smart Tivi QLED 4K 75 inch Samsung QA75Q80C - Tổng quan thiết kế\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1942/303214/smart-tivi-qled-4k-75-inch-samsung-qa75q80c-190323-102100.jpg\"\ntitle=\"Smart Tivi QLED 4K 75 inch Samsung QA75Q80C - Tổng quan thiết kế\"></a>\n</p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa sản phẩm</em></p>\n<h3>Công nghệ hình ảnh</h3>\n<p>- Màn hình <strong>QLED</strong> hiển thị hình ảnh độ phân giải&nbsp;4K&nbsp;rõ nét.&nbsp;</p>\n<p>-&nbsp;Bộ xử lý&nbsp;<strong>Neural Quantum 4K AI 20 nơ-ron</strong>&nbsp;với trí tuệ nhân tạo nâng cao hình ảnh lên\nchuẩn 4K, điều chỉnh thông minh hình ảnh, âm thanh để người xem có được những giây phút giải trí tuyệt vời.&nbsp;\n</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/303210/smart-tivi-neo-qled-4k-75-inch-samsung-qa75qn85c-090323-044610.jpg\"\nonclick=\"return false;\"><img alt=\"Smart Tivi Neo QLED 4K 75 inch Samsung QA75QN85C - Công nghệ hình ảnh\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1942/303210/smart-tivi-neo-qled-4k-75-inch-samsung-qa75qn85c-090323-044610.jpg\"\ntitle=\"Smart Tivi Neo QLED 4K 75 inch Samsung QA75QN85C - Công nghệ hình ảnh\"></a>\n</p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa sản phẩm</em></p>\n<p>-&nbsp;Công nghệ&nbsp;<strong>Real Depth Enhancer </strong>nâng cao độ tương phản, các chi tiết của đối tượng chính\ntrong khung hình để tái hiện hình ảnh có độ sâu chân thật như mắt người nhìn.</p>\n<p>-&nbsp;Công nghệ&nbsp;Direct Full Array 8X&nbsp;truyền tải sắc\nđen và sắc trắng hoàn hảo mang đến cho bạn thước phim sáng rõ cùng chi tiết sắc nét.&nbsp;</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/303214/smart-tivi-qled-4k-75-inch-samsung-qa75q80c-190323-095301.jpg\"\nonclick=\"return false;\"><img alt=\"Smart Tivi QLED 4K 75 inch Samsung QA75Q80C - Công nghệ hình ảnh\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1942/303214/smart-tivi-qled-4k-75-inch-samsung-qa75q80c-190323-095301.jpg\"\ntitle=\"Smart Tivi QLED 4K 75 inch Samsung QA75Q80C - Công nghệ hình ảnh\"></a>\n</p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa sản phẩm</em></p>\n<p>- Màu sắc chuẩn chứng nhận <strong>PANTONE</strong>, công nghệ <strong>Quantum Dot </strong>hiển thị 100% dải màu tạo\nnên hình ảnh mang sắc màu cuộc sống, rực rỡ, đẹp mắt trong mọi mức độ sáng.</p>\n<p>- Công nghệ&nbsp;<strong>Quantum HDR+&nbsp;</strong>phân tích chuyên sâu khung hình để tinh chỉnh độ tương phản, tái\nhiện màu sắc tươi tắn với chi tiết ấn tượng.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/303214/smart-tivi-qled-4k-75-inch-samsung-qa75q80c-210323-025528.jpg\"\nonclick=\"return false;\"><img alt=\"Chứng nhận PANTONE - Smart Tivi QLED 4K 75 inch Samsung QA75Q80C\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1942/303214/smart-tivi-qled-4k-75-inch-samsung-qa75q80c-210323-025528.jpg\"\ntitle=\"Chứng nhận PANTONE - Smart Tivi QLED 4K 75 inch Samsung QA75Q80C\"></a></p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa sản phẩm</em></p>\n<p>-&nbsp;Motion Xcelerator Turbo+&nbsp;nâng\ncao chuyển động với tần số quét&nbsp;120 Hz cho bạn chiêm ngưỡng và trải nghiệm game mượt mà, không còn tình trạng\nnhòe, mờ.&nbsp;</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/303214/smart-tivi-qled-4k-75-inch-samsung-qa75q80c-210323-025633.jpg\"\nonclick=\"return false;\"><img alt=\"Motion Xcelerator Turbo+ - Smart Tivi QLED 4K 75 inch Samsung QA75Q80C\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1942/303214/smart-tivi-qled-4k-75-inch-samsung-qa75q80c-210323-025633.jpg\"\ntitle=\"Motion Xcelerator Turbo+ - Smart Tivi QLED 4K 75 inch Samsung QA75Q80C\"></a></p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa sản phẩm</em></p>\n<h3>Công nghệ âm thanh</h3>\n<p>-&nbsp;Hệ thống loa&nbsp;<strong>4.2 kênh</strong>,&nbsp;tổng công suất&nbsp;<strong>40W</strong>, tái tạo âm thanh\nrõ ràng, trung thực.</p>\n<p>- Công nghệ&nbsp;Dolby Atmos&nbsp;tạo nên âm thanh đa chiều cho\ntrải nghiệm mạnh mẽ như chất âm đang trôi quanh bạn, cuốn hút trong từng nội dung.&nbsp;</p>\n<p>-&nbsp;OTS Lite&nbsp;với\nthiết kế 2 loa giả lập ở trên và 2 loa vật lý ở dưới cho âm thanh vòm phát ra theo từng chuyển động của hình ảnh cho\ncảm giác chân thật hơn.&nbsp;</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/303214/smart-tivi-qled-4k-75-inch-samsung-qa75q80c-190323-095318.jpg\"\nonclick=\"return false;\"><img alt=\"Smart Tivi QLED 4K 75 inch Samsung QA75Q80C - Công nghệ âm thanh\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1942/303214/smart-tivi-qled-4k-75-inch-samsung-qa75q80c-190323-095318.jpg\"\ntitle=\"Smart Tivi QLED 4K 75 inch Samsung QA75Q80C - Công nghệ âm thanh\"></a></p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa sản phẩm</em></p>\n<p>- AVA, công nghệ tăng cường tiếng đàm\nthoại lớn hơn so với độ ồn trong môi trường bên ngoài nhằm giúp bạn nghe rõ đoạn trò chuyện trên màn hình.</p>\n<p>-&nbsp;Công nghệ&nbsp;Q-Symphony 3.0&nbsp;cho bạn chìm đắm trong giai điệu sôi động được tạo nên bởi sự đồng bộ\nthăng hoa của loa tivi và loa thanh.&nbsp;</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/303210/smart-tivi-neo-qled-4k-75-inch-samsung-qa75qn85c-090323-045615.jpg\"\nonclick=\"return false;\"><img alt=\"Smart Tivi Neo QLED 4K 75 inch Samsung QA75QN85C - Công nghệ âm thanh\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1942/303210/smart-tivi-neo-qled-4k-75-inch-samsung-qa75qn85c-090323-045615.jpg\"\ntitle=\"Smart Tivi Neo QLED 4K 75 inch Samsung QA75QN85C - Công nghệ âm thanh\"></a></p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa sản phẩm</em></p>\n<h3>Hệ điều hành</h3>\n<p>- Sử dụng hệ điều hành&nbsp;<strong>Tizen™</strong>&nbsp;tiên tiến có giao diện màn hình trực quan, cho bạn quan sát\nvà lựa chọn các nội dung linh hoạt, tiết kiệm thời gian. Kho ứng dụng phong phú, phục vụ tốt cho nhu cầu trải nghiệm\nđa dạng của tất cả thành viên trong gia đình.&nbsp;</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/303214/smart-tivi-qled-4k-75-inch-samsung-qa75q80c-190323-095335.jpg\"\nonclick=\"return false;\"><img alt=\"Smart Tivi QLED 4K 75 inch Samsung QA75Q80C - Hệ điều hành\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1942/303214/smart-tivi-qled-4k-75-inch-samsung-qa75q80c-190323-095335.jpg\"\ntitle=\"Smart Tivi QLED 4K 75 inch Samsung QA75Q80C - Hệ điều hành\"></a></p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa sản phẩm</em></p>\n<h3>Tiện ích</h3>\n<p>-Google Duo&nbsp;cung cấp cho bạn cơ hội được trò chuyện thân\nmật với người thân ở xa qua màn hình tivi chân thật. Lưu ý để trải nghiệm ứng dụng, cần mua thêm camera ngoài.</p>\n<p>- Hỗ trợ trợ lý ảo&nbsp;<strong>Bixby</strong>&nbsp;(có tiếng Việt) để bạn dễ dàng điều khiển thiết bị bằng giọng nói\ncủa mình.&nbsp;</p>\n<p>-&nbsp;Ứng dụng&nbsp;SmartThings&nbsp;cho việc thao tác, điều khiển hoạt động\ncác thiết bị điện tử trong nhà dễ dàng khi bạn chẳng cần đứng dậy để bật đèn trong phòng hay khởi động robot hút\nbụi.&nbsp;</p>\n<p>- Sử dụng tính năng&nbsp;<strong>Multi View </strong>để xem nội dung từ nhiều nguồn cùng một lúc qua tivi\nSamsung, nâng cao hiệu suất giải trí và làm việc tối ưu.&nbsp;</p>\n<p>- Tính năng&nbsp;AirPlay 2&nbsp;(iPhone),&nbsp;<strong>Screen\nMirroring</strong>&nbsp;(Android),&nbsp;Tap View&nbsp;cho phép trình chiếu video, hình ảnh, tin tức\ntừ&nbsp;điện\nthoại&nbsp;lên tivi để chia sẻ với mọi người tiện lợi.&nbsp;</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/303214/smart-tivi-qled-4k-75-inch-samsung-qa75q80c-190323-095402.jpg\"\nonclick=\"return false;\"><img alt=\"Smart Tivi QLED 4K 75 inch Samsung QA75Q80C - Tiện ích\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/1942/303214/smart-tivi-qled-4k-75-inch-samsung-qa75q80c-190323-095402.jpg\"\ntitle=\"Smart Tivi QLED 4K 75 inch Samsung QA75Q80C - Tiện ích\"></a></p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa sản phẩm</em></p>\n<p><i>Với thành công từ sản phẩm Smart Tivi QLED 4K 75 inch Samsung QA75Q80B được ra mắt năm 2022, Samsung ra mắt phiên\nbản năm 2023&nbsp;</i><em><i>Smart</i> Tivi QLED 4K 75 inch Samsung QA75Q80C rất thích hợp để bố trí trong phòng\ncó diện tích lớn với màn hình 75 inch, hiển thị hình ảnh 4K siêu thực, âm thanh đa chiều cho cảm giác như đang ở\nrạp chiếu phim nhờ hỗ trợ bộ xử lý, công nghệ hình ảnh, âm thanh hiện đại,&nbsp;hệ điều hành Tizen™ với kho ứng\ndụng đa dạng. Bên cạnh đó, còn nhiều tiện ích như gọi video Google Duo, điều khiển tivi bằng giọng nói tiếng\nViệt với Bixby, xem nhiều nội dung trên tivi với Multi View,...</em></p>\n', 24, 200, 1),
(31, 3, 'Google Tivi Sony 4K 75 inch KD-75X85L', 2, 'P31_avt.jpg', 4.3, '<p><strong><i>Google Tivi Sony 4K 75 inch KD-75X85L màn hình 75 inch, độ phân giải 4K cho hình ảnh sắc nét. X-Motion\n    Clarity cho hình ảnh, cảnh hành động nhanh luôn mượt mà và rõ nét. </i></strong><i><strong>Màn hình sử dụng\n    công nghệ Full Array LED với độ tương phản cao cho cảm giác chân thực.&nbsp;</strong></i><strong><i>Công\n    nghệ Dolby Atmos cùng với S-Force Front Surround tạo âm thanh 3 chiều sống động.&nbsp;Hệ điều hành Google TV\n    có giao diện bắt mắt dễ nhìn, dễ dàng thao tác.</i></strong></p>\n<h3>Tổng quan thiết kế&nbsp;</h3>\n<p>-<strong>&nbspMàn hình lớn 75 inch</strong> kết\nhợp đường viền nhựa vân nét mảnh màu đen chìm giúp làm nổi bật màn hình của tivi Sony KD-75X85L, cho người xem hoàn\ntoàn đắm chìm vào nội dung đang được trình chiếu chỉ trong phút chốc.&nbsp;</p>\n<p>-&nbsp;Tivi&nbsp;sử dụng chân đế hình chữ T úp ngược thanh mảnh\nnhưng vẫn chắc chắn, dễ dàng bố trí trong mọi không gian phòng khách, phòng họp, phòng hội nghị,... hoặc bạn có thể\ntreo tường như một khung tranh lớn, tăng thêm tính sang trọng, tinh tế cho không gian.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/307268/google-tivi-sony-4k-75-inch-kd-75x85l-160523-024624.jpg\"\nonclick=\"return false;\"><img alt=\"Tổng quan thiết kế - Google Tivi Sony 4K 75 inch KD-75X85L\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1942/307268/google-tivi-sony-4k-75-inch-kd-75x85l-160523-024624.jpg\"\n    title=\"Tổng quan thiết kế - Google Tivi Sony 4K 75 inch KD-75X85L\"></a>\n</p>\n<p><i>*Hình ảnh chỉ mang tính chất minh họa</i></p>\n<h3>Công nghệ hình ảnh&nbsp;</h3>\n<p>- Tivi Sony có độ phân giải 4K cho hình ảnh sắc nét gấp 4 lần độ\nphân giải Full HD.&nbsp;</p>\n<p>- Màn hình<strong>&nbsp;Full Array LED</strong> tái tạo độ tương phản chân thực ở các vùng sáng và tối để mang đến\nnhững khung cảnh đầy chi tiết.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/307268/google-tivi-sony-4k-75-inch-kd-75x85l-160523-024707.jpg\"\nonclick=\"return false;\"><img alt=\"Full Arrray Led - Google Tivi Sony 4K 75 inch KD-75X85L\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1942/307268/google-tivi-sony-4k-75-inch-kd-75x85l-160523-024707.jpg\"\n    title=\"Full Arrray Led - Google Tivi Sony 4K 75 inch KD-75X85L\"></a></p>\n<p><i>*Hình ảnh chỉ mang tính chất minh họa</i></p>\n<p>- Màu sắc trở nên sống động, độ sáng và độ tương phản cao nhờ <strong>bộ xử lý X1 4K HDR</strong> giúp khung cảnh trở\nnên cực kỳ sống động để mọi thứ đều có cảm giác chân thực.</p>\n<p><strong>- Công nghệ Triluminos Pro</strong> tái\ntạo xuất sắc các màu đỏ, xanh lá cây và xanh dương - những màu mà tivi thường khó hiển thị được chính xác nhằm làm\nphong phú trải nghiệm xem của người dùng bằng bảng màu đa dạng hơn và các sắc thái màu tự nhiên hơn.&nbsp;</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/307268/google-tivi-sony-4k-75-inch-kd-75x85l-080623-034752.jpg\"\nonclick=\"return false;\"><img alt=\"Công nghệ hình ảnh - Google Tivi Sony 4K 75 inch KD-75X85L\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1942/307268/google-tivi-sony-4k-75-inch-kd-75x85l-080623-034752.jpg\"\n   title=\"Công nghệ hình ảnh - Google Tivi Sony 4K 75 inch KD-75X85L\"></a></p>\n<p><strong>- Công nghệ hình ảnh&nbsp;4K X-Reality\n    PRO</strong>&nbsp;nâng cấp chất lượng từng điểm ảnh cho độ rõ nét vượt trội. Các điểm ảnh trên nhiều\nkhung hình được phân tích, đồng thời hình ảnh được tinh chỉnh và làm sắc nét theo thời gian thực.</p>\n<p><strong>- X-Motion Clarity </strong>sử dụng bộ điều khiển tấm màn hình độc lập để tối ưu hóa việc phát sáng, cho\nkhung cảnh luôn mượt mà và rõ nét mà không mất đi độ sáng.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/307268/google-tivi-sony-4k-75-inch-kd-75x85l-080623-034815.jpg\"\nonclick=\"return false;\"><img alt=\"Công nghệ hình ảnh - Google Tivi Sony 4K 75 inch KD-75X85L\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1942/307268/google-tivi-sony-4k-75-inch-kd-75x85l-080623-034815.jpg\"\n    title=\"Công nghệ hình ảnh - Google Tivi Sony 4K 75 inch KD-75X85L\"></a></p>\n<p><i>*Hình ảnh chỉ mang tính chất minh họa</i></p>\n<p>- Khám phá trải nghiệm chơi game hoàn toàn mới với&nbsp;<strong>tính năng Game Menu</strong>&nbsp;giúp hỗ trợ hàng\nloạt tính năng độc đáo như: Tâm bắn, kiểu ngắm tâm bắn, bộ cân bằng đen,.. chiến tốt mọi game và giảm độ trễ khi\nchơi game nhờ&nbsp;<strong>công nghệ Auto Low Latency Mode (ALLM).&nbsp;</strong></p>\n<p>- Chơi game mượt mà với chế độ 4K cùng 120fps và&nbsp;<strong>120Hz</strong>&nbsp;<strong>VRR</strong>,&nbsp;loại bỏ\nđộ trễ đầu vào và hiện tương xé hình.&nbsp;</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/307267/google-tivi-sony-4k-65-inch-kd-65x85l-070623-055109.jpg\"\nonclick=\"return false;\"><img alt=\"Google Tivi Sony 4K 75 inch KD-75X85L - Công nghệ hình ảnh\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1942/307267/google-tivi-sony-4k-65-inch-kd-65x85l-070623-055109.jpg\"\n    title=\"Google Tivi Sony 4K 65 inch KD-65X85L - Công nghệ hình ảnh\"></a></p>\n<p><i>*Hình ảnh chỉ mang tính chất minh họa</i></p>\n<h3>Công nghệ âm thanh&nbsp;</h3>\n<p><strong>- Loa X-Balanced </strong>có tác dụng tăng chất lượng âm thanh, cho làn âm rõ nét trong từng cảnh phim hay\ntrong bản nhạc giao hưởng thính phòng đỉnh cao.</p>\n<p><strong>- S-Master Digital Amplifier</strong> là công nghệ loại bỏ tiếng ồn, độ nhiễu đến mức tối ưu, nhờ đó người\ndùng sẽ được trải nghiệm những âm thanh trong trẻo, tự nhiên và mượt mà.</p>\n<p>- Công nghệ âm thanh vòm <strong>Dolby Atmos</strong> cùng với <strong>S-Force Front\n    Surround</strong> mang cơ chế truyền tải âm thanh của rạp chiếu phim, những thanh âm sẽ truyền đi mọi\nhướng, chân thật và chi tiết.</p>\n<p><strong>- Công nghệ DTS&nbsp;Digital Surround </strong>âm\nthanh chuyển động theo từng khung hình, bạn sẽ cảm nhận những vật thể trong phim như vượt ra khỏi màn hình, sống\nđộng và có chiều sâu.</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/307268/google-tivi-sony-4k-75-inch-kd-75x85l-080623-034933.jpg\"\nonclick=\"return false;\"><img alt=\"Công nghệ âm thanh - Google Tivi Sony 4K 75 inch KD-75X85L\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1942/307268/google-tivi-sony-4k-75-inch-kd-75x85l-080623-034933.jpg\"\n    title=\"Công nghệ âm thanh - Google Tivi Sony 4K 75 inch KD-75X85L\"></a></p>\n<p><i>*Hình ảnh chỉ mang tính chất minh họa</i></p>\n<h3>Hệ điều hành&nbsp;</h3>\n<p><strong>- Google TV</strong> được biết\nđến là hệ điều hành có giao diện gọn gàng, thao tác tiện lợi.</p>\n<p>- Hệ điều hành trên tivi Sony này được tích hợp khá nhiều các ứng dụng giải trí đỉnh cao như: <strong>FPT Play,\nGalaxy Play (Fim+), Netflix, VieON, YouTube.</strong></p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/307268/google-tivi-sony-4k-75-inch-kd-75x85l-080623-034952.jpg\"\nonclick=\"return false;\"><img alt=\"Hệ điều hành - Google Tivi Sony 4K 75 inch KD-75X85L\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1942/307268/google-tivi-sony-4k-75-inch-kd-75x85l-080623-034952.jpg\"\n     title=\"Hệ điều hành - Google Tivi Sony 4K 75 inch KD-75X85L\"></a></p>\n<p><i>*Hình ảnh chỉ mang tính chất minh họa</i></p>\n<h3>Tiện ích&nbsp;</h3>\n<p>- Tích hợp <strong>trợ lý ảo Google\n    Assistant</strong> hỗ trợ tiếng Việt.</p>\n<p><strong>- Tìm kiếm giọng nói tiếng Việt 3 miền ở chế\n    độ rảnh tay </strong>(hand-free voice search - nói trực tiếp vào tivi) hoặc<strong> thông qua\nremote.</strong></p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/307268/google-tivi-sony-4k-75-inch-kd-75x85l-160523-024928.jpg\"\nonclick=\"return false;\"><img alt=\"Tiện ích - Google Tivi Sony 4K 75 inch KD-75X85L\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1942/307268/google-tivi-sony-4k-75-inch-kd-75x85l-160523-024928.jpg\"\n    title=\"Tiện ích - Google Tivi Sony 4K 75 inch KD-75X85L\"></a></p>\n<p><i>*Hình ảnh chỉ mang tính chất minh họa</i></p>\n<p>- Dễ dàng phát phim, chương trình tivi, ảnh và nhiều nội dung khác trực tiếp từ điện thoại lên tivi nhờ<strong>\nAirPlay 2 (iPhone), Chromecast.</strong></p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/307268/google-tivi-sony-4k-75-inch-kd-75x85l-160523-024948.jpeg\"\nonclick=\"return false;\"><img alt=\"Chiếu hình từ điện thoại lên tivi - Google Tivi Sony 4K 75 inch KD-75X85L\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1942/307268/google-tivi-sony-4k-75-inch-kd-75x85l-160523-024948.jpeg\"\n     title=\"Chiếu hình từ điện thoại lên tivi - Google Tivi Sony 4K 75 inch KD-75X85L\"></a></p>\n<p><i>*Hình ảnh chỉ mang tính chất minh họa</i></p>\n<p>- Duy trì liên lạc với người thân, tổ chức các buổi họp trực tuyến để làm việc, phát triển kinh doanh hiệu quả\ncùng<strong> Bravia CAM (mua thêm camera)</strong>, ứng dụng cho\nphép kết nối và trò chuyện video qua tivi tiện lợi.&nbsp;</p>\n<p><a class=\"preventdefault\"\nhref=\"https://cdn.tgdd.vn/Products/Images/1942/307268/google-tivi-sony-4k-75-inch-kd-75x85l-160523-025013.jpg\"\nonclick=\"return false;\"><img alt=\"Bravia Cam -vGoogle Tivi Sony 4K 75 inch KD-75X85L\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1942/307268/google-tivi-sony-4k-75-inch-kd-75x85l-160523-025013.jpg\"\n    title=\"Bravia Cam -vGoogle Tivi Sony 4K 75 inch KD-75X85L\"></a></p>\n<p><i>*Hình ảnh chỉ mang tính chất minh họa</i></p>\n<p><i>Nhìn chung,&nbsp;Google Tivi Sony 4K 75 inch KD-75X85L&nbsp;mang lại trải\nnghiệm xem hoàn hảo với hình ảnh chi tiết, sắc nét, màu sắc chân thực, chuyển cảnh mượt mà,... Âm thanh vòm sống\nđộng với công suất 20W như trong rạp chiếu, đáp ứng nhu cầu giải trí cho những người thích trải nghiệm tivi màn\nhình lớn.</i></p>', 24, 200, 1),
(32, 5, 'Laptop Apple MacBook Pro 14 inch M3 Max 2023 14-core CPU/36GB/1TB/30-core GPU ', 34, 'P32_avt.jpg', 4.6, '<h3>MacBook Pro 14 inch M3 Max\n    2023 30-core GPU một sản phẩm đỉnh cao của laptop hiện đại, đang gây tiếng vang trong thế giới máy tính với\nhiệu năng và tích hợp tài nguyên không giới hạn. Với nhiều lõi CPU và GPU mạnh mẽ hơn bất kỳ sản phẩm nào, bộ nhớ\nthống nhất rộng lớn, chip M3 Max thách thức mọi giới hạn về hiệu suất và khả năng cho các nhiệm vụ đòi hỏi cao.</h3>\n<h3>Bùng nổ cùng hiệu năng mạnh mẽ</h3>\n<p>Nối đuôi sự thành công trước, hãng Apple đã cho ra con chip <strong>Apple M3 Max </strong>trong việc sử dụng tiến\ntrình sản xuất <strong>3 nm</strong> và <strong>92 tỷ bóng bán dẫn </strong>cho thấy sự đột phá về hiệu năng và hiệu\nquả trong công nghệ sản xuất. Sử dụng công nghệ sản xuất tiến tiến giúp M3 Max tăng hiệu năng mà không tăng tiêu thụ\nnăng lượng, điều này có lợi cho thời lượng pin và hiệu quả cho thiết bị.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/44/318232/apple-macbook-pro-14-inch-m3-max-2023-14-core-hinh-6.jpg\"\n    onclick=\"return false;\"><img alt=\"Apple MacBook Pro 14 inch M3 Max 2023 14-core CPU - Hiệu năng\"\n        src=\"https://cdn.tgdd.vn/Products/Images/44/318232/apple-macbook-pro-14-inch-m3-max-2023-14-core-hinh-6.jpg\"\n         title=\"Apple MacBook Pro 14 inch M3 Max 2023 14-core CPU - Hiệu năng\"></a>\n</p>\n<p>Với CPU <strong>14 nhân</strong> và GPU <strong>30 nhân</strong>, M3 Max có khả năng xử lý nhanh chóng và đáng kinh\nngạc, đáp ứng tốt cho các công việc đặc thù đòi hỏi hiệu năng cao.&nbsp;</p>\n<p>Đối với CPU, như hãng đã công bố trước đó xử lý nhanh hơn <strong>50%</strong> so với chip M2 Max và lên tới\n<strong>80%</strong> so với chip M1 Max giúp M3 Pro đáp ứng hiệu quả mọi nhiệm vụ đòi hỏi hiệu suất cao bao gồm mô\nphỏng, đồ họa 3D, biên tập video và nhiều ứng dụng tính toán nặng khác.</p>\n<p>Đối với GPU, hỗ trợ của vi kiến trúc mới <strong>Dynamic Caching</strong>, công nghệ<strong> Mesh shading</strong> và\n<strong>Ray tracing</strong> trên con chip M3 Max là một điểm quan trọng khi nói về khả năng đồ họa và giải trí của\nsản phẩm. Các công nghệ này thường được sử dụng để cải thiện hiệu suất và chất lượng hình ảnh. Ngoài ra, thông tin\nvề GPU trên M3 Max có hiệu năng nhanh hơn <strong>20%</strong> so với M2 Max và <strong>50%</strong> so với M1 Max\ncàng làm cho nó trở thành một sự lựa chọn mạnh mẽ cho các tác vụ đòi hỏi tính toán, xử lý hình ảnh, phân tích khoa\nhọc và giải trí phức tạp.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/44/318232/apple-macbook-pro-14-inch-m3-max-2023-14-core-hinh-1-1.jpg\"\n    onclick=\"return false;\"><img alt=\"Apple MacBook Pro 14 inch M3 Max 2023 14-core CPU - Chip M3 Max\"\n        src=\"https://cdn.tgdd.vn/Products/Images/44/318232/apple-macbook-pro-14-inch-m3-max-2023-14-core-hinh-1-1.jpg\"\n         title=\"Apple MacBook Pro 14 inch M3 Max 2023 14-core CPU - Chip M3 Max\"></a>\n</p>\n<p>Macbook Pro được trang bị thanh <strong>RAM</strong>\n<strong>36 GB</strong>, tốc độ băng thông vượt trội <strong>300 GB/s</strong> cho phép bạn xử lý đồng thời nhiều ứng\ndụng và tác vụ tài nguyên phức tạp. Bên cạnh đó, ổ cứng <strong>SSD 1 TB</strong> cho bạn tốc độ truy xuất lý tưởng\nvà không gian lưu trữ dữ liệu rộng lớn.</p>\n<p>Sở hữu một thời lượng pin ấn tượng lên đến <strong>18 giờ</strong> cho bạn thoải mái sử dụng và tối ưu hóa hoạt động\ntrong thời gian dài mà không cần sạc thường xuyên.</p>\n<h3>Đốt phá về chất lượng hình ảnh</h3>\n<p>Với màn hình<strong> 14.2 inch</strong> lý tưởng cùng độ phân giải<strong> Liquid Retina XDR display (3024 x 1964)\n</strong>đem đến những không gian hiển thị với những thước phim chất lượng, rõ nét nhất.</p>\n<p>Màn hình Liquid Retina XDR trên sản phẩm M3 Max mang trong mình công nghệ <strong>Extreme Dynamic Range\n    (XDR)</strong> giúp toàn màn hình hiển thị độ sáng duy trì lên đến <strong>1000 nits </strong>và<strong> 1600\n    nits </strong>cho nội dung <strong>HDR</strong>. Với việc được hiệu chỉnh, màn hình sẵn sàng đáp ứng các yêu cầu\nchuyên nghiệp. Bên cạnh đó, việc sở hữu&nbsp;<strong>Wide color (P3)</strong> hỗ trợ phổ màu rộng hơn so với không\ngian màu sRGB, cho phép bạn sử dụng nhiều màu sắc và tông màu.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/44/318232/apple-macbook-pro-14-inch-m3-max-2023-14-core-hinh-2.jpg\"\n    onclick=\"return false;\"><img alt=\"Apple MacBook Pro 14 inch M3 Max 2023 14-core CPU - Màn hình\"\n        src=\"https://cdn.tgdd.vn/Products/Images/44/318232/apple-macbook-pro-14-inch-m3-max-2023-14-core-hinh-2.jpg\"\n         title=\"Apple MacBook Pro 14 inch M3 Max 2023 14-core CPU - Màn hình\"></a></p>\n<p>Công nghệ<strong> True Tone</strong> giúp tối ưu hóa trải nghiệm người dùng và làm cho việc sử dụng máy trở nên dễ\nchịu cho thị giác. Thêm vào đó, laptop còn trang bị công nghệ <strong>Promotion</strong> giúp mọi thao tác từ cuộn\nđến chơi game đều trở nên siêu mượt và nhanh nhạy, tự động điều chỉnh để phù hợp với chuyển động của nội dung và tốc\nđộ làm mới lên đến <strong>120 Hz</strong>.</p>\n<p>Ngoài ra, MacBook Pro 14 inch sở hữu <strong>hệ thống 6\n    loa</strong> cùng dãy công nghệ <strong>Spatial Audio</strong>, <strong>Dolby Atmos</strong> tạo nên một trải\nnghiệm âm thanh vô cùng ấn tượng và đỉnh cao. Điều này cho bạn tận hưởng không gian âm đa chiều, cảm nhận mọi chi\ntiết và đắm chìm trong nội dung đa phương tiện với chất lượng xuất sắc.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/44/318232/apple-macbook-pro-14-inch-m3-max-2023-14-core-hinh-7.jpg\"\n    onclick=\"return false;\"><img alt=\"Apple MacBook Pro 14 inch M3 Max 2023 14-core CPU - Âm thanh\"\n        src=\"https://cdn.tgdd.vn/Products/Images/44/318232/apple-macbook-pro-14-inch-m3-max-2023-14-core-hinh-7.jpg\"\n         title=\"Apple MacBook Pro 14 inch M3 Max 2023 14-core CPU - Âm thanh\"></a></p>\n<h3>Thiết kế sang trọng thân thiện với môi trường</h3>\n<p>Dòng lapto này không chỉ đẹp mắt với các tông\nmàu<strong>&nbsp;</strong>đậm tính doanh nhân mà còn được tạo nên với sự quan tâm đến từng chi tiết và chất lượng.\nLớp vỏ máy được tích hợp công nghệ đột phá chứa chất<strong> anode</strong> hóa giúp hạn chế tối đa tình trạng bám\ndấu vân tay, giúp máy luôn giữ được vẻ sạch sẽ và sang trọng. Ngoài ra, vỏ máy được làm bằng<strong> 100% nhôm tái\n    chế</strong>, giúp giảm tác động đến môi trường với sự phát triển bền vững.&nbsp;</p>\n<p>Với khối lượng <strong>1.61 kg </strong>nhỏ gọn bạn hoàn toàn có thể yên tâm bỏ vào balo mang đi từ trường học đến\nquán cafe thậm chí mang đi công tác cũng không gặp vấn đề gì. Hãng vẫn trang bị <strong>Touch ID </strong>cho người\ndùng tăng cường tính bảo mật và tiện lợi, đặc biệt khi họ muốn tránh việc phải nhập mật khẩu dài và phức tạp. Bàn\nphím còn được cập nhật thêm <strong>đèn nền</strong>&nbsp;đơn sắc trắng phù hợp cho bạn sử dụng trong môi trường\nthiếu sáng.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/44/318232/apple-macbook-pro-14-inch-m3-max-2023-14-core-hinh-9.jpg\"\n    onclick=\"return false;\"><img alt=\"Apple MacBook Pro 14 inch M3 Max 2023 14-core CPU - Touch ID\"\n        src=\"https://cdn.tgdd.vn/Products/Images/44/318232/apple-macbook-pro-14-inch-m3-max-2023-14-core-hinh-9.jpg\"\n        title=\"Apple MacBook Pro 14 inch M3 Max 2023 14-core CPU - Touch ID\"></a></p>\n<p>Macbook Pro 14 inch có dãy cổng giao tiếp đa tiện lợi giúp bạn kết nối nhanh chóng với các thiết bị ngoại vi khác gồm\ncác cổng như Thunderbolt 4, USB 4 (up to 40 Gb/s), Jack tai nghe 3.5 mm, MagSafe 3 cải tiến và tối ưu hóa để cung\ncấp kết nối và sạc nhanh và hiệu quả hơn và HDMI.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/44/318232/apple-macbook-pro-14-inch-m3-max-2023-14-core-hinh-8.jpg\"\n    onclick=\"return false;\"><img alt=\"Apple MacBook Pro 14 inch M3 Max 2023 14-core CPU - Cổng kết nối\"\n        src=\"https://cdn.tgdd.vn/Products/Images/44/318232/apple-macbook-pro-14-inch-m3-max-2023-14-core-hinh-8.jpg\"\n        title=\"Apple MacBook Pro 14 inch M3 Max 2023 14-core CPU - Cổng kết nối\"></a></p>\n<p>MacBook Pro 14 inch M3 Max 2023 30-core GPU không chỉ là một chiếc laptop thông thường, mà là một nguồn cảm hứng,\ncông cụ đồng hành không thể thiếu cho những người sáng tạo và yêu công nghệ trong phân khúc laptop đồ họa - kỹ thuật. Đó là sự lựa\nchọn hàng đầu cho những ai đang tìm kiếm một máy tính cá nhân đẳng cấp, đáng tin cậy và tiện lợi để đáp ứng mọi nhu\ncầu của họ.</p>', 24, 1000, 1);
INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `supplier_id`, `product_avt_img`, `product_rate`, `product_description`, `product_period`, `product_view_count`, `product_is_display`) VALUES
(33, 5, 'Laptop Apple MacBook Air 13 inch M1 2020 8-core CPU/8GB/256GB/7-core GPU (MGN63SA/A) ', 34, 'P33_avt.jpg', 4.5, '<h3>MacBook Air M1 2020&nbsp;sở hữu\n    thiết kế sang trọng nhỏ gọn có thể dễ dàng mang theo bên mình. Cấu hình máy với hiệu năng xử lý nhanh, đạt hiệu quả\n    cao với chip Apple M1 mới, sẽ là trợ thủ đắc lực hỗ trợ bạn tốt trong mọi công việc.</h3>\n<h3>Hiệu năng xử lý tốt, thao tác mượt mà</h3>\n<p>Apple MacBook Air 2020 được trang bị chip&nbsp;Apple\n        M1 hiện đại với&nbsp;<strong>CPU 8 nhân</strong> gồm 4 nhân cho hiệu năng cao và 4 nhân tiết kiệm năng\n    lượng. Đây là vi xử lý chạy trên cấu trúc&nbsp;ARM cho hiệu năng xử lý nhanh hơn <strong>3,5 lần</strong> so với thế\n    hệ trước, pin dùng được lâu dài hơn lên đến 10 giờ đồng hồ.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-280323-125154.jpg\"\n        onclick=\"return false;\"><img alt=\"Apple MacBook Air M1 2020 - Làm việc với hình ảnh\"\n            src=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-280323-125154.jpg\"\n           title=\"Apple MacBook Air M1 2020 - Làm việc với hình ảnh\"></a>\n</p>\n<p>Với tốc độ xử lý nhanh chóng, MacBook Air có thể đảm nhận các tác vụ cực kỳ chuyên sâu như chỉnh sửa ảnh chuyên\n    nghiệp và chơi game ổn nhờ card đồ họa tích hợp&nbsp;<strong>7 nhân GPU</strong>.&nbsp;GPU trong M1 với năng suất\n    hoạt động tốt có thể đáp ứng các thao tác trên các ứng dụng văn phòng hoặc các ứng dụng thiết kế như: Photoshop,\n    Ai,... mà không lo giật lag.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-280323-125156.jpg\"\n        onclick=\"return false;\"><img alt=\"Apple MacBook Air M1 2020 - Render video\"\n            src=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-280323-125156.jpg\"\n             title=\"Apple MacBook Air M1 2020 - Render video\"></a>\n</p>\n<p>Máy trang bị <strong>RAM 8 GB</strong> giúp bạn có thể thực hiện nhiều tác vụ cùng lúc trên nhiều ứng dụng như vừa\n    nghe nhạc trên YouTube, vừa làm việc trên Photoshop với tốc độ xử lý nhanh chóng và trôi chảy, không có hiện tượng\n    đứng máy và giật.</p>\n<p>Máy tính có ổ cứng&nbsp;<strong>SSD 256 GB</strong> giúp&nbsp;khởi chạy ứng dụng và mở tệp ngay lập tức, thao tác\n    cuộn trong Safari mượt mà hơn, nhờ đó bạn có thể truy cập và làm việc trên các ứng dụng nhanh chóng mà không lo gián\n    đoạn. Khả năng lưu trữ dữ liệu lớn nên bạn có thể yên tâm lưu trữ tệp công việc, bài hát hoặc bộ phim mình yêu\n    thích.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-280323-125153.jpg\"\n        onclick=\"return false;\"><img alt=\"Apple MacBook Air M1 2020 - RAM\"\n            src=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-280323-125153.jpg\"\n             title=\"Apple MacBook Air M1 2020 - RAM\"></a></p>\n<p>Với chip M1 thì hệ điều hành macOS cũng được nâng cấp đáng kể, ngoài tốc độ xử lý và phản hồi vô cùng nhanh chóng thì\n    kho ứng dụng cũng được cập nhật lớn nhất từ trước đến nay.&nbsp;</p>\n<h3>Thiết kế gọn nhẹ, thời trang</h3>\n<p>MacBook Air 2020 có vẻ ngoài đẳng cấp\n    với vỏ kim loại nguyên khối cứng cáp và độ bền hoàn hảo, tạo nên vẻ sang trọng cá tính cho người sở hữu.</p>\n<p>Khối lượng máy tính chỉ <strong>1.29 kg</strong>, độ dày&nbsp;<strong>4.1 mm</strong> đến <strong>16.1 mm</strong>\n    gọn nhẹ, linh động giúp bạn dễ dàng mang theo bên mình và làm việc ở bất kỳ đâu.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-280323-125152.jpg\"\n        onclick=\"return false;\"><img alt=\"Apple MacBook Air M1 2020 - Thiết kế\"\n            src=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-280323-125152.jpg\"\n             title=\"Apple MacBook Air M1 2020 - Thiết kế\"></a></p>\n<p>Bàn phím trên Macbook M1 được chăm chút kỹ lưỡng, các phím bấm rộng, tạo cảm\n    giác thoải mái khi sử dụng, cũng như tốc độ đánh máy nhanh chóng, hiệu quả. Ngoài ra, đèn nền&nbsp;được\n    tích hợp giúp bạn có thể làm việc hiệu quả ngay trong điều kiện thiếu ánh sáng.</p>\n<p><strong>Bảo mật vân tay</strong> giúp bạn có thể bảo mật các dữ liệu quan trọng tốt hơn, tránh người lạ xâm nhập máy\n    và đăng nhập nhanh hơn chỉ với một thao tác chạm.&nbsp;</p>\n<p>Apple MacBook Air 2020&nbsp;được trang bị 2 cổng\n    kết nối Thunderbolt 3 (USB-C) có tốc độ truyền dữ liệu lên đến <strong>40 Gb/s</strong>, nhanh gấp <strong>2\n        lần</strong> so với Thunderbolt 2 thuận tiện kết nối với các thiết bị khác. Ngoài ra, hỗ trợ các kết nối không\n    dây như:&nbsp;<strong>Wi-Fi 6 AX201</strong>, <strong>Bluetooth 5.0</strong>.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-280323-125159.jpg\"\n        onclick=\"return false;\"><img alt=\"Apple MacBook Air M1 2020 - Kết nối\"\n            src=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-280323-125159.jpg\"\n             title=\"Apple MacBook Air M1 2020 - Kết nối\"></a></p>\n<h3>Màn hình&nbsp;Retina cao cấp</h3>\n<p>Laptop&nbsp;với màn\n    hình&nbsp;<strong>Retina</strong><strong> </strong>và sở hữu kích thước&nbsp;<strong>13.3 inch</strong>&nbsp;giúp\n    bạn thưởng thức hình ảnh từ mọi góc độ với chất lượng sắc nét nhất, hình ảnh cũng trở nên mịn màng và đẹp mắt hơn.\n</p>\n<p><strong>Công nghệ IPS</strong> trên&nbsp;MacBook Air cho góc nhìn rộng hơn, độ tương phản và độ sáng tăng cường.\n    Ngoài ra, máy còn kết hợp công nghệ&nbsp;True Tone&nbsp;giúp&nbsp;cảm biến nhận biết ánh sáng và màu sắc xung quanh, từ\n    đó điều chỉnh nhiệt độ màu của máy sao cho phù hợp, từ đó giúp tăng trải nghiệm sử dụng của người dùng.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-280323-125150.jpg\"\n        onclick=\"return false;\"><img alt=\"Apple MacBook Air M1 2020 - Màn hình\"\n            src=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-280323-125150.jpg\"\n            title=\"Apple MacBook Air M1 2020 - Màn hình\"></a></p>\n<p>Laptop Apple MacBook Air M1 256GB với\n    hiệu năng đủ dùng cùng thiết kế&nbsp;máy tính mỏng nhẹ,\n        thời trang sẽ là sự lựa chọn tuyệt vời dành cho bạn nếu muốn tìm một chiếc máy tính vừa sang trọng vừa đem\n    lại hiệu năng xử lý tốt.</p>', 24, 1000, 1),
(34, 5, 'Laptop HP 15s fq5229TU i3 1215U/8GB/512GB/Win11 (8U237PA) ', 32, 'P34_avt.jpg', 4, '<h3>Laptop HP 15s fq5229TU i3 1215U\n        (8U237PA) với thiết kế hiện đại, hiệu năng ổn định cùng mức giá phải chăng, chắc chắn sẽ trở thành người bạn\n    đồng hành đáng tin cậy cho sinh viên và người đi làm để hoàn thành một cách hiệu quả mọi công việc và giải trí hàng\n    ngày.</h3>\n<p>• Người dùng có thể soạn thảo văn bản, làm các trang tính phức tạp, tạo các bản trình chiếu trên Word, nhập liệu trên\n    Excel hay thiết kế hình ảnh đơn giản trên Canva,... cũng như xem phim giải trí và chơi game nhẹ với hiệu suất xử lý\n    tốt từ bộ vi xử lý&nbsp;<strong>Intel Core i3 Alder Lake - 1215U </strong>và card tích hợp&nbsp;<strong>Intel UHD\n        Graphics </strong>trên chiếc laptop học tập - văn phòng này.</p>\n<p>• Bộ nhớ <strong>RAM 8 GB</strong> cho khả năng đa nhiệm mượt mà, bạn sẽ không còn lo lắng về việc laptop bị lag hay đơ khi mở đồng thời nhiều tab công\n    việc hoặc chuyển đổi qua lại giữa các tác vụ khác nhau. Ngoài ra, RAM cũng có hỗ trợ nâng cấp lên đến <strong>16\n        GB</strong> để đáp ứng tốt cho các nhu cầu công việc cao hơn.</p>\n<p>• Ổ cứng <strong>SSD NVMe PCIe</strong>&nbsp;dung lượng <strong>512 GB </strong>không chỉ giúp tăng tốc quá trình\n    khởi động hệ thống mà còn cung cấp không gian lưu trữ rộng rãi cho tất cả các tệp tin của bạn.</p>\n<p>• Màn hình kích thước <strong>15.6 inch</strong> với độ phân giải <strong>Full HD (1920 x 1080)</strong> mang đến cho\n    hình ảnh rõ nét, chi tiết và mượt mà cho việc trải nghiệm đa nội dung. Ngoài ra, công nghệ chống chói <strong>Anti\n        Glare</strong> giúp hạn chế hiện tượng ánh sáng phản chiếu trên màn hình, giúp bạn làm việc một cách hiệu quả\n    hơn, ngay cả khi ở ngoài trời hoặc dưới ánh sáng mạnh.</p>\n<p>•&nbsp;Hệ thống <strong>loa kép </strong>trên laptop HP đem đến âm thanh vượt trội, rõ ràng và\n    sống động, tạo nên trải nghiệm âm nhạc và xem phim tuyệt vời.</p>\n<p>• Với thiết kế <strong>vỏ nhựa</strong> bền bỉ và gam <strong>màu bạc</strong> tinh tế, laptop HP cơ bản không chỉ có diện mạo\n    hiện đại, đẹp mắt mà còn có khả năng chịu va đập tốt, phù hợp để bạn mang theo bất cứ nơi đâu. Máy có khối lượng\n    <strong>1.69 kg</strong>, vừa vặn và không quá khó khăn để bạn mang theo bên mình phục vụ công việc.</p>\n<p>• Thiết bị có đa dạng cổng kết nối như: USB Type-C, Jack tai nghe 3.5 mm, USB Type-A, HDMI và khe SD để truyền xuất\n    dữ liệu nhanh chóng khi cần thiết.</p>', 199, 123, 1),
(35, 7, 'Tủ lạnh Samsung Inverter 256 lít RT25M4032BU/SV', 1, 'P35_avt.jpg', 4.2, '<h3>Bảo quản thực phẩm tươi sống, sử dụng trong ngày không cần rã đông với ngăn đông mềm -1 độ C Optimal Fresh Zone</h3>\n<p>Tủ lạnh Samsung Inverter 256 lít\n        RT25M4032BU/SV&nbsp;được trang bị ngăn đông mềm -1 độ C Optimal Fresh Zone&nbsp;có tác dụng giữ thực phẩm\n    tươi sống còn trọn dưỡng chất, hoàn toàn không đông đá ở nhiệt độ đông mềm lý tưởng -1°C. Như thế, thịt cá hoàn toàn\n    không bị đông đá giúp bạn có thể nấu ăn ngay không cần rã đông, dễ dàng cắt thái và chế biến trong ngày.</p>\n<p>Lưu ý, chỉ nên sử dụng ngăn đông mềm này với các thực phẩm muốn chế biến trong ngày, nếu muốn trữ lâu hơn, bạn nên\n    dùng ngăn đông để bảo quản tốt nhất.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1943/220326/samsung-rt25m4032bu-sv-240823-052850.jpg\"\n        onclick=\"return false;\"><img alt=\"Tủ lạnh Samsung Inverter 256 lít RT25M4032BU/SV - Ngăn đông mềm\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1943/220326/samsung-rt25m4032bu-sv-240823-052850.jpg\"\n             title=\"Tủ lạnh Samsung Inverter 256 lít RT25M4032BU/SV - Ngăn đông mềm\"></a></p>\n<h3>Kháng khuẩn, khử mùi hiệu quả với Deodorizing Filter</h3>\n<p>Bộ lọc giúp loại bỏ hoàn toàn những mùi hôi khó chịu, khử các vi khuẩn, nấm mốc bên trong tủ, giúp cho không khí\n    trong tủ lạnh luôn tươi mát và thực phẩm không bị nhiễm bẩn, giữ trọn vị tươi ngon.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1943/220326/samsung-rt25m4032bu-sv-140922-051317.jpg\"\n        onclick=\"return false;\"><img alt=\"Tủ lạnh Samsung Inverter 256 lít RT25M4032BU/SV - Bộ lọc kháng khuẩn khử mùi\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1943/220326/samsung-rt25m4032bu-sv-140922-051317.jpg\"\n             title=\"Tủ lạnh Samsung Inverter 256 lít RT25M4032BU/SV - Bộ lọc kháng khuẩn khử mùi\"></a></p>\n<h3>Tiện lợi hơn cho người sử dụng với hệ thống khay kệ chịu lực, dễ di chuyển</h3>\n<p>Hệ thống khay kệ chịu lực, dễ di chuyển của tủ lạnh Samsung giúp cho bạn có thể yên tâm lưu trữ nhiều thực phẩm, sắp xếp gọn\n    gàng và lấy thức ăn một cách nhanh chóng.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1943/220326/samsung-rt25m4032bu-sv-140922-051319.jpg\"\n        onclick=\"return false;\"><img alt=\"Tủ lạnh Samsung Inverter 256 lít RT25M4032BU/SV - Khay kính chịu lực\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1943/220326/samsung-rt25m4032bu-sv-140922-051319.jpg\"\n             title=\"Tủ lạnh Samsung Inverter 256 lít RT25M4032BU/SV - Khay kính chịu lực\"></a></p>\n<h3>Tiết kiệm điện năng, vận hành êm và ổn định với công nghệ Digital Inverter</h3>\n<p>Công nghệ Digital Inverter&nbsp;trên tủ lạnh Samsung ngăn đá trên có khả năng tiết kiệm điện năng tiêu thụ,\n    giảm độ ồn, giảm hao mòn và tăng tuổi thọ của tủ lạnh.</p>\n<h3>Khí lạnh đồng đều khắp tủ với công nghệ làm lạnh vòm All Around Cooling</h3>\n<p>Công nghệ làm lạnh All Around Cooling có khả năng kiểm soát và đưa khí lạnh đi đồng đều bên trong tủ lạnh,&nbsp;lan\n    tỏa đều khắp mọi ngóc ngách, giúp nhiệt độ và độ ẩm luôn được duy trì ổn định ở khắp các ngăn tủ.&nbsp;</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1943/220326/samsung-rt25m4032bu-sv-140922-051321.jpg\"\n        onclick=\"return false;\"><img alt=\"Tủ lạnh Samsung Inverter 256 lít RT25M4032BU/SV - Làm lạnh vòm\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1943/220326/samsung-rt25m4032bu-sv-140922-051321.jpg\"\n             title=\"Tủ lạnh Samsung Inverter 256 lít RT25M4032BU/SV - Làm lạnh vòm\"></a></p>\n<h3>Kiểu dáng hiện đại, sang trọng</h3>\n<p>Tủ lạnh Samsung Inverter với thiết kế thời thượng, sắc đen\n    sang trọng nhưng vẫn gọn gàng vừa tiết kiệm không gian cũng vừa đóng vai trò điểm nhấn nổi bật cho căn bếp của bạn.\n</p>\n<p><strong>Lưu ý: Khi mua tủ lạnh Samsung Inverter 256 lít RT25M4032BU/SV từ ngày 01/11/2022 sẽ được bảo hành động cơ\n        máy nén 20 năm. Các sản phẩm mua trước ngày 01/11/2022 đều được bảo hành động cơ máy nén 10 năm.</strong></p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1943/220326/Slider/-samsung11.jpg\"\n        onclick=\"return false;\"><img alt=\"Thiết kế\" \n            src=\"https://cdn.tgdd.vn/Products/Images/1943/220326/Slider/-samsung11.jpg\"></a></p>\n<h3>Dung tích 256 lít đáp ứng nhu cầu sử dụng của các gia đình từ 2 - 3 thành viên</h3>\n<p>Với dung tích&nbsp;tủ lạnh Samsung 256 lít&nbsp;sẽ đáp ứng được nhu cầu sử dụng, trữ thực phẩm\n    cho những gia đình từ 2 đến 3 người, đảm bảo cuộc sống của bạn luôn trọn vẹn với những thực phẩm tươi ngon.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1943/220326/samsung-rt25m4032bu-sv-051022-050559.jpg\"\n        onclick=\"return false;\"><img alt=\"Tủ lạnh Samsung Inverter 256 lít RT25M4032BU/SV - Dung tích\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1943/220326/samsung-rt25m4032bu-sv-051022-050559.jpg\"\n             title=\"Tủ lạnh Samsung Inverter 256 lít RT25M4032BU/SV - Dung tích\"></a></p>\n<p>Nhìn chung, chiếc tủ lạnh Samsung 256 lít này với những công nghệ hiện đại độc quyền như ngăn đông mềm Optimal Fresh\n    Zone,... sẽ giúp cho việc trữ thực phẩm của bạn tốt hơn, thực phẩm vẫn tươi ngon như lúc vừa mới mua. Đây sẽ là lựa\n    chọn lý tưởng cho những gia đình có từ 2 đến 3 thành viên.</p>', 24, 1000, 1),
(36, 7, 'Tủ lạnh Sharp Inverter 401 lít Multi Door SJ-FXP480VG-CH', 6, 'P36_avt.jpg', 4, '<h3>Loại bỏ mùi hôi và vi khuẩn nhờ công nghệ&nbsp;Plasmacluster Ion&nbsp;và&nbsp;bộ lọc với các phân tử Ag+Cu Nano&nbsp;</h3>\n<p>Plasmacluster Ion sẽ giải phóng các ion âm với mật độ cao và các ion này sẽ bám vào vi khuẩn, nấm mốc làm phá hủy cấu\n    trúc của chúng giúp loại bỏ vi khuẩn một cách hiệu quả.</p>\n<p>Bên cạnh đó chiếc tủ lạnh Sharp này còn được trang bị thêm bộ lọc với các phân tử Ag+Cu Nano giúp giữ lại các vi\n    khuẩn gây mùi có kích thước nhỏ giữ tủ lạnh luôn thoáng mát, sạch khuẩn an toàn cho sức khỏe.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1943/230652/sharp-sj-fxp480vg-ch-240620-090605.jpg\"\n        onclick=\"return false;\"><img alt=\"Tủ lạnh Sharp Inverter 401 lít SJ-FXP480VG-CH - công nghệ plasmacluster\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1943/230652/sharp-sj-fxp480vg-ch-240620-090605.jpg\"\n             title=\"Tủ lạnh Sharp Inverter 401 lít SJ-FXP480VG-CH - công nghệ plasmacluster\"></a></p>\n<h3>Làm đông thực phẩm nhanh chóng với chế độ làm đông nhanh</h3>\n<p>Chế độ này có khả năng đưa nhiệt độ ngăn đông xuống -25⁰C làm đông thực phẩm nhanh chóng giúp bảo quản thực phẩm tốt\n    hơn và giúp làm đá nhanh hơn đáp ứng tốt nhu cầu sử dụng của bạn.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1943/230652/sharp-sj-fxp480vg-ch-240720-090718.jpg\"\n        onclick=\"return false;\"><img alt=\"Tủ lạnh Sharp Inverter 401 lít SJ-FXP480VG-CH - Làm Đông Nhanh\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1943/230652/sharp-sj-fxp480vg-ch-240720-090718.jpg\"\n             title=\"Tủ lạnh Sharp Inverter 401 lít SJ-FXP480VG-CH - Làm Đông Nhanh\"></a></p>\n<h3>Thiết kế mặt gương mờ sang trọng</h3>\n<p>Tủ lạnh Sharp Inverter 401 lít SJ-FXP480VG-CH&nbsp;sở\n    hữu gam màu vàng đồng nổi bật kết hợp cùng đường nét thiết kế tinh tế và cửa tủ mặt gương mờ tôn lên vẻ cao cấp,\n    sang trọng cho gian bếp của bạn.</p>\n<p>Tủ lạnh thuộc dòng tủ lạnh Frenchdoor 4 cửa mới lạ không chỉ góp phần làm đẹp cho không gian bếp mà còn giúp tối ưu\n    hóa không gian lưu trữ thực phẩm.</p>\n<p><strong>Lưu ý: Khi mua sản phẩm tủ lạnh Sharp Inverter 401 lít SJ-FXP480VG-CH từ ngày 01/4/2022 sẽ được bảo hành\n        chính hãng 2 năm. Các sản phẩm mua trước ngày 01/04/2022 vẫn bảo hành 1 năm.</strong></p>\n<p>&nbsp;</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1943/230652/sharp-sj-fxp480vg-ch-240820-090812.jpg\"\n        onclick=\"return false;\"><img alt=\"Tủ lạnh Sharp Inverter 401 lít SJ-FXP480VG-CH - Thiết Kế Mặt Gương\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1943/230652/sharp-sj-fxp480vg-ch-240820-090812.jpg\"\n             title=\"Tủ lạnh Sharp Inverter 401 lít SJ-FXP480VG-CH - Thiết Kế Mặt Gương\"></a></p>\n<p>Với dung tích sử dụng là 401 lít đáp ứng nhu cầu chứa thực phẩm của gia đình có từ 4 - 5 thành viên trong vài ngày,\n    bạn không cần phải đi mua thực phẩm thường xuyên nữa giúp tiết kiệm thời gian và công sức.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1943/230652/sharp-sj-fxp480vg-ch-240920-090900.jpg\"\n        onclick=\"return false;\"><img alt=\"Tủ lạnh Sharp Inverter 401 lít SJ-FXP480VG-CH - Dung Tích\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1943/230652/sharp-sj-fxp480vg-ch-240920-090900.jpg\"\n             title=\"Tủ lạnh Sharp Inverter 401 lít SJ-FXP480VG-CH - Dung Tích\"></a></p>\n<h3>Ngăn ngừa nấm mốc khi không sử dụng với chức năng&nbsp;Holiday</h3>\n<p>Khi đi du lịch hoặc công tác bạn lo lắng tủ lạnh không sử dụng vài ngày sẽ sinh ra nấm mốc và mùi hôi khó chịu, với chức năng Holiday\n    giúp kiểm soát ngăn đông và ngăn mát ở nhiệt độ thấp đảm bảo tủ lạnh không sinh ra nấm mốc và vi khuẩn gây mùi khi\n    bạn không sử dụng tủ lạnh.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1943/230652/sharp-sj-fxp480vg-ch-240920-090955.jpg\"\n        onclick=\"return false;\"><img alt=\"Tủ lạnh Sharp Inverter 401 lít SJ-FXP480VG-CH - Chức Năng Ngày Nghỉ Holiday\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1943/230652/sharp-sj-fxp480vg-ch-240920-090955.jpg\"\n             title=\"Tủ lạnh Sharp Inverter 401 lít SJ-FXP480VG-CH - Chức Năng Ngày Nghỉ Holiday\"></a>\n</p>\n<h3>Tiết kiệm điện năng tối ưu với công nghệ J-Tech Inverter và chế độ&nbsp;Extra Eco</h3>\n<p>Tủ lạnh Sharp được\n    trang bị động cơ Inverter không chỉ giúp bạn tiết kiệm điện năng mà còn cho khả năng vận hành êm ái không\n    ảnh hưởng đến chất lượng sinh hoạt của gia đình, hoạt động bền bỉ và giúp làm lạnh ổn định.&nbsp;</p>\n<p>Chế độ Extra Eco giúp điều chỉnh công suất làm lạnh sao cho phù hợp với lượng thực phẩm được chứa trong tủ, góp phần\n    tiết kiệm điện năng nhưng vẫn không gây ảnh hưởng đến chất lượng thực phẩm bên trong.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1943/230652/sharp-sj-fxp480vg-ch-210821-1112521.png\"\n        onclick=\"return false;\"><img\n            alt=\"Tủ lạnh Sharp Inverter 401 lít SJ-FXP480VG-CH - Công Nghệ J-Tech Inverter và Eco\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1943/230652/sharp-sj-fxp480vg-ch-210821-1112521.png\"\n            title=\"Tủ lạnh Sharp Inverter 401 lít SJ-FXP480VG-CH - Công Nghệ J-Tech Inverter và Eco\"></a></p>\n<h3>Lan tỏa hơi lạnh đồng đều, làm lạnh thực phẩm hiệu quả với công nghệ làm lạnh đa chiều</h3>\n<p>Công nghệ làm lạnh đa chiều trên chiếc tủ lạnh Inverter này sẽ thổi các luồng khí lạnh theo nhiều hướng khác nhau, mang\n    hơi lạnh đến mọi ngóc ngách kể cả khi tủ lạnh được lấp đầy thực phẩm giúp thực phẩm của bạn được làm lạnh hiệu quả,\n    bạn có thể yên tâm lưu trữ thực phẩm cho nhiều ngày mà không lo bị hỏng do thiếu hơi lạnh.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1943/230652/sharp-sj-fxp480vg-ch-241120-091148.jpg\"\n        onclick=\"return false;\"><img alt=\"Tủ lạnh Sharp Inverter 401 lít SJ-FXP480VG-CH - Làm Lạnh\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1943/230652/sharp-sj-fxp480vg-ch-241120-091148.jpg\"\n             title=\"Tủ lạnh Sharp Inverter 401 lít SJ-FXP480VG-CH - Làm Lạnh\"></a></p>\n<h3>Ngăn rau quả giữ ẩm giúp thực phẩm luôn tươi ngon&nbsp;</h3>\n<p>Với thiết kế hộp kín cùng nhiệt độ ổn định, người dùng hoàn toàn có thể yên tâm khi lưu trữ rau củ quả mà không cần\n    lo lắng bị khô héo hay mất chất dinh dưỡng.&nbsp;</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1943/230652/sharp-sj-fxp480vg-ch-241220-091256.jpg\"\n        onclick=\"return false;\"><img alt=\"Tủ lạnh Sharp Inverter 401 lít SJ-FXP480VG-CH - Ngăn Rau Giữ Ẩm\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1943/230652/sharp-sj-fxp480vg-ch-241220-091256.jpg\"\n             title=\"Tủ lạnh Sharp Inverter 401 lít SJ-FXP480VG-CH - Ngăn Rau Giữ Ẩm\"></a></p>\n<h3>Bảng điều khiển cảm ứng bên ngoài tiện lợi</h3>\n<p>Bảng điều khiển cảm ứng được tích hợp bên ngoài cửa tủ giúp bạn dễ dàng tùy chỉnh nhiệt độ bên trong tủ mà không phải\n    mở cửa tủ nhiều lần tránh tình trạng hao phí điện năng.</p>\n<p>Ngoài ra, tủ lạnh còn trang bị thêm chuông báo mở cửa, chuông này sẽ reo khi bạn mở cửa quá lâu hay\n    không đóng kín cửa giúp tránh thất thoát hơi lạnh ảnh hưởng đến thực phẩm và tiết kiệm điện năng.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1943/230652/sharp-sj-fxp480vg-ch-241320-091348.jpg\"\n        onclick=\"return false;\"><img alt=\"Tủ lạnh Sharp Inverter 401 lít SJ-FXP480VG-CH - Chuông Báo Cửa Mở\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1943/230652/sharp-sj-fxp480vg-ch-241320-091348.jpg\"\n             title=\"Tủ lạnh Sharp Inverter 401 lít SJ-FXP480VG-CH - Chuông Báo Cửa Mở\"></a></p>\n<p>Tủ lạnh Sharp Inverter 401 lít SJ-FXP480VG-CH với những tính năng khá nổi bật như trên chắc chắn sẽ là sự lựa chọn\n    phù hợp với các nhu cầu lưu trữ thực phẩm của bạn.</p>', 24, 800, 1),
(37, 7, 'Tủ lạnh LG Inverter 519 lít Side By Side GR-B256BL', 3, 'P37_avt.jpg', 4.5, '<p><strong><em>Tủ lạnh LG Inverter 519 lít GR-B256BL</em></strong><em><strong>&nbsp;thuộc dòng tủ lạnh Side by side, có\n    sự kết hợp giữa&nbsp;Smart Inverter và Linear Inverter&nbsp;giúp vận hành êm ái, tiết kiệm điện năng. Bên\n    cạnh đó, công nghệ làm lạnh đa chiều mang hơi lạnh lan tỏa đều và&nbsp;bộ lọc khử mùi than hoạt tính loại bỏ\n    mùi hôi hiệu quả.</strong></em></p>\n<h3>Tổng quan thiết kế</h3>\n<p>- Thuộc dòng&nbsptủ lạnh Side by side, chất liệu cửa tủ được làm từ thép không\ngỉ bền đẹp với thời gian, màu đen sang trọng phù hợp với nhiều kiểu thiết kế nội thất.</p>\n<p>- Tay nắm cửa được thiết kế âm tinh tế giúp tổng thể gọn gàng, tối giản và hiện đại.</p>\n<p>- Không gian phù hợp nhất để đặt tủ là nhà bếp, tạo sự hiện đại và tiện nghi.</p>\n<p>- Dung tích<strong>&nbsp;519 lít&nbsp;</strong>thích hợp với gia đình&nbsp;từ 4 - 5 thành viên&nbsp;hoặc ít thành\nviên hơn nhưng nhu cầu trữ thực phẩm cao.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1943/309316/lg-gr-b256bl-140623-035119.jpg\"\nonclick=\"return false;\"><img alt=\"Tủ lạnh LG Inverter 519 lít GR-B256BL\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1943/309316/lg-gr-b256bl-140623-035119.jpg\"\n     title=\"Tủ lạnh LG Inverter 519 lít GR-B256BL\"></a></p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3>Ngăn lạnh</h3>\n<p>- Dung tích:&nbsp;<strong>335 lít.</strong></p>\n<p>- Được trang bị nhiều ngăn kính chịu lực trong tủ và các ngăn trên cánh cửa tủ, ngăn rau củ kích thước lớn giúp bạn\ntrữ được nhiều thực phẩm hơn.</p>\n<h3>Ngăn đá</h3>\n<p>- Dung tích:&nbsp;<strong>184 lít.</strong></p>\n<p>- Phần ngăn đông cũng có các ngăn kệ và hộc ngăn đá để sắp xếp thực phẩm, kết hợp với các ngăn kệ trên cánh tủ giúp\ntăng không gian lưu trữ.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1943/309316/lg-gr-b256bl-140623-034743.jpg\"\nonclick=\"return false;\"><img alt=\"Tủ lạnh LG Inverter 519 lít GR-B256BL\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1943/309316/lg-gr-b256bl-140623-034743.jpg\" \n    title=\"Tủ lạnh LG Inverter 519 lít GR-B256BL\"></a></p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3>Công nghệ tiết kiệm điện</h3>\n<p>- Công nghệ&nbsp;<strong>Linear Inverter</strong>&nbsp;cho khả năng kiểm soát nhiệt độ ổn định, mức biến thiên nhiệt\nđộ dao động trong khoảng 0.5°C. Từ đó giúp cho thực phẩm của bạn được lưu trữ tươi ngon trong thời gian dài.</p>\n<p>- Công nghệ<b>&nbsp;Smart</b>&nbsp;<strong>Inverter</strong>&nbsp;giúp máy nén&nbsp;tủ lạnh&nbsp;hoạt động bền bỉ,\ntiết kiệm điện năng nhưng vẫn giữ được hiệu quả làm lạnh cao.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1943/309316/lg-gr-b256bl-140623-034738.jpg\"\nonclick=\"return false;\"><img alt=\"Tủ lạnh LG Inverter 519 lít GR-B256BL\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1943/309316/lg-gr-b256bl-140623-034738.jpg\" \n    title=\"Tủ lạnh LG Inverter 519 lít GR-B256BL\"></a></p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3>Công nghệ làm lạnh + Công nghệ bảo quản thực phẩm</h3>\n<p>-&nbsp;Tủ lạnh\nLG&nbsp;được trang bị hệ thống làm lạnh đa chiều mang hơi lạnh lan tỏa nhanh chóng và đồng đều, bảo quản\nthực phẩm tối ưu.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1943/309316/lg-gr-b256bl-140623-034745.jpg\"\nonclick=\"return false;\"><img alt=\"Tủ lạnh LG Inverter 519 lít GR-B256BL\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1943/309316/lg-gr-b256bl-140623-034745.jpg\" \n    title=\"Tủ lạnh LG Inverter 519 lít GR-B256BL\"></a></p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<p>-&nbsp;<strong>Linear Cooling</strong>&nbsp;duy trì nhiệt độ luôn ổn định ở mức ±0,5℃, nhờ đó tạo điều kiện bảo quản\nthực phẩm trong thời gian dài mà vẫn trọn vẹn dưỡng chất.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1943/309316/lg-gr-b256bl-140623-034740.jpg\"\nonclick=\"return false;\"><img alt=\"Tủ lạnh LG Inverter 519 lít GR-B256BL\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1943/309316/lg-gr-b256bl-140623-034740.jpg\" \n    title=\"Tủ lạnh LG Inverter 519 lít GR-B256BL\"></a></p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3>Công nghệ kháng khuẩn, khử mùi</h3>\n<p><strong>Bộ lọc than hoạt tính</strong>&nbsp;có tác dụng khử mùi tanh thịt cá, giữ cho không gian tủ không bị ám mùi\nvà tươi mát. Ngoài ra bộ lọc giữ cho thực phẩm tươi ngon và sạch khuẩn trong thời gian dài.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1943/309316/lg-gr-b256bl-140623-034747.jpg\"\nonclick=\"return false;\"><img alt=\"Tủ lạnh LG Inverter 519 lít GR-B256BL\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1943/309316/lg-gr-b256bl-140623-034747.jpg\" \n    title=\"Tủ lạnh LG Inverter 519 lít GR-B256BL\"></a></p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<h3>Tiện ích</h3>\n<p>Bảng điều khiển bên ngoài giúp bạn thao tác điều chỉnh nhiệt độ, các chế độ dễ dàng hơn. Điều này còn giúp hạn chế\nthất thoát hơi lạnh, tiết kiệm điện năng.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/1943/309316/lg-gr-b256bl-140623-034742.jpg\"\nonclick=\"return false;\"><img alt=\"Tủ lạnh LG Inverter 519 lít GR-B256BL\"\n    src=\"https://cdn.tgdd.vn/Products/Images/1943/309316/lg-gr-b256bl-140623-034742.jpg\" \n    title=\"Tủ lạnh LG Inverter 519 lít GR-B256BL\"></a></p>\n<p><em>*Hình ảnh chỉ mang tính chất minh họa</em></p>\n<p><em>Tóm lại,&nbsp;tủ lạnh LG Inverter 519 lít GR-B256BL<strong>&nbsp;</strong>thiết kế hiện\nđại, màu đen sang trọng, dùng cho gia đình có 4 - 5 thành viên với dung tích lớn lên tới 519&nbsp;lít. Công nghệ\nSmart Inverter và bảng điều khiển bên ngoài, tủ sẽ giảm thiểu được việc tiêu hao điện năng khi sử dụng, bộ lọc\nthan hoạt tính, khử mùi hôi hiệu quả.</em></p>', 24, 200, 1),
(38, 9, 'Nồi chiên không dầu Sunhouse SHD4062 6 lít', 24, 'P38_avt.jpg', 5, '<h3>Nồi chiên không dầu Sunhouse&nbsp;với dung tích sử dụng 5.5\n    lít có thể chiên gà vịt nguyên con khoảng 1.5 kg</h3>\n<p>Dung tích sử dụng lớn, phù hợp cho các gia đình đông người tầm 4 - 6 người thường xuyên nấu nướng, chế biến đa dạng\n    món ngon.&nbsp;</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit-8a.jpg\"\n        onclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4062 5.5 lít - Dung tích sử dụng\"\n            src=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit-8a.jpg\"\n             title=\"Nồi chiên không dầu Sunhouse SHD4062 5.5 lít - Dung tích sử dụng\"></a></p>\n<h3>Hoạt động mạnh mẽ với công suất 1600W, công nghệ Rapid Air&nbsp;giúp cho thức ăn chín nhanh, giòn bên ngoài, mềm bên\n    trong</h3>\n<p>Sử dụng nồi chiên không dầu giúp chiên nướng thực phẩm giảm đến 80% chất béo, bảo vệ sức khỏe gia đình.&nbsp;</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit-b.jpg\"\n        onclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4062 - Dung tích sử dụng\"\n            src=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit-b.jpg\" \n            title=\"Nồi chiên không dầu Sunhouse SHD4062 - Dung tích sử dụng\"></a></p>\n<h3>Lòng nồi bằng thép phủ chống dính bền tốt, an toàn khi nấu, hạn chế dính cháy, dễ dàng vệ sinh</h3>\n<p>Lòng nồi có thể sử dụng được với máy rửa chén, thuận tiện vệ sinh sau khi chiên nướng.&nbsp;</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit637926342256156195-1020x570.jpg\"\n        onclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4062 6 lít - Chất liệu\"\n            src=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit637926342256156195-1020x570.jpg\"\n             title=\"Nồi chiên không dầu Sunhouse SHD4062 6 lít - Chất liệu\"></a>\n</p>\n<h3>Bảng điều khiển nút\n        xoay đơn giản, tiện thao tác</h3>\n<p>Điều chỉnh được nhiệt độ trong khoảng 100 - 200 °C, thời gian 0 - 30 phút, phù hợp với hầu hết các món chiên nướng cơ\n    bản.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit-070722-113113.jpg\"\n        onclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4062 - Bảng điều khiển\"\n            src=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit-070722-113113.jpg\"\n             title=\"Nồi chiên không dầu Sunhouse SHD4062 - Bảng điều khiển\"></a></p>\n<h3>Thiết kế màu đen trung tính, chất liệu bền bỉ, an toàn, dễ lau chùi sau khi sử dụng</h3>\n<p>Thiết kế sang trọng với mặt trước thân nồi cấu tạo từ inox 304 cao cấp có độ bóng bề mặt cao, chịu lực chịu nhiệt\n    tốt, chống trầy xước. Phần còn lại của thân nồi bằng nhựa PP bền bỉ, dễ dàng vệ sinh để có vẻ bề ngoài luôn như mới.\n</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit-2a-1.jpg\"\n        onclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4062 5.5 lít - Thiết kế\"\n            src=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit-2a-1.jpg\" \n            title=\"Nồi chiên không dầu Sunhouse SHD4062 5.5 lít - Thiết kế\"></a></p>\n<h3>Nồi\n        chiên không dầu&nbsp;tự ngắt khi quá nhiệt, tự ngắt&nbsp;khi thức ăn chín giúp&nbsp;đảm bảo an toàn cho\n    thiết bị và nguồn điện</h3>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit-070722-113109.jpg\"\n        onclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4062 - Tiện ích\"\n            src=\"https://cdn.tgdd.vn/Products/Images/9418/258338/sunhouse-shd4062-55-lit-070722-113109.jpg\"\n            title=\"Nồi chiên không dầu Sunhouse SHD4062 - Tiện ích\"></a></p>\n<p><strong>Lưu ý khi sử dụng:</strong></p>\n<p>- Xem kỹ hướng dẫn của nhà sản xuất trước khi sử dụng.</p>\n<p>- Nên đặt nồi ngay ngắn trên mặt bàn, kệ rồi mới vận hành.</p>\n<p>- Không dùng búi sắt để cọ rửa lòng nồi, tránh bị trầy xước.&nbsp;</p>\n<p>Nồi chiên không dầu Sunhouse SHD4062 6 lít của thương\n    hiệu Việt Nam - Sunhouse, thiết kế hiện đại, dung tích lớn 6 lít, công nghệ chiên không dầu&nbsp;Rapid Air, công\n    suất&nbsp;1600W, hẹn giờ 30 phút, chuẩn bị món ăn ngon, ít béo nhanh chóng, tiện dụng trong mọi gia đình.&nbsp;</p>', 24, 200, 1),
(39, 9, 'Nồi chiên không dầu Sunhouse SHD4035 9 lít', 24, 'P39_avt.jpg', 4, '<p><em><strong>Nồi chiên không dầu\n</strong></em><strong><i>Sunhouse SHD4035 9 lít</i></strong>&nbsp;<em><strong>được trang bị công nghệ\nlàm nóng Rapid Air,</strong></em><i><strong><em><strong>&nbsp;</strong></em>công suất 1800W, dung tích sử\ndụng 9 lít, bảng điều khiển nút xoay dễ sử dụng, tự ngắt khi quá nhiệt, có quạt đối lưu,... là thiết bị hữu\ních giúp bạn chế biến nhiều món chiên rán hạn chế dầu mỡ cho gia đình.</strong></i></p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-1a.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4035 - Tổng quan\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-1a.jpg\" \ntitle=\"Nồi chiên không dầu Sunhouse SHD4035 - Tổng quan\"></a></p>\n<h3>Dung tích - Công suất</h3>\n<p>- Dung tích tổng 9.5 lít, dung tích sử dụng 9 lít, chiên được gà nguyên con khoảng 1.5 kg.</p>\n<p>- Công suất 1800W giúp chiên nướng thực phẩm nhanh chóng, tiết kiệm tối đa thời gian nấu nướng cho các bà nội trợ.\n</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-6a.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4035 9 lít - Dung tích\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-6a.jpg\" \ntitle=\"Nồi chiên không dầu Sunhouse SHD4035 9 lít - Dung tích\"></a></p>\n<h3>Công nghệ chiên, nướng - Nhiệt độ, thời gian</h3>\n<p>- Công nghệ làm nóng&nbsp;Rapid Air, chế biến thức ăn chín đều các mặt bên\nngoài, chín mềm phần thịt bên trong.&nbsp;</p>\n<p>- Nhiệt độ nồi có thể điều chỉnh từ 100 - 200°C, thời gian từ 0 - 30 phút, dễ dàng điều chỉnh thông số phù hợp với\nnhiều nguyên liệu nấu ăn.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-2a.gif\"\nonclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4035 - Công nghệ\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-2a.gif\" \ntitle=\"Nồi chiên không dầu Sunhouse SHD4035 - Công nghệ\"></a></p>\n<h3>Thiết kế, chất liệu của sản phẩm</h3>\n<p>- Vỏ ngoài làm bằng inox 304 và nhựa P cao cấp, bền tốt, an toàn, dễ lau chùi.</p>\n<p>- Lòng nồi thép phủ chống dính bền bỉ, chống bám bẩn, dễ lau chùi, an toàn cho sức khoẻ.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/275125/vi-vn-sunhouse-shd4035-9-lit-4a.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4035 9 lít - Chất liệu\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/9418/275125/vi-vn-sunhouse-shd4035-9-lit-4a.jpg\"\n title=\"Nồi chiên không dầu Sunhouse SHD4035 9 lít - Chất liệu\"></a></p>\n<h3>Bảng điều khiển</h3>\n<p>- Bảng điều khiển cơ với các nút\nxoay đơn giản, có đèn báo trạng thái hoạt động,&nbsp;dễ dàng sử dụng.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-3a-1.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4035 - Bảng điều khiển\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-3a-1.jpg\" \ntitle=\"Nồi chiên không dầu Sunhouse SHD4035 - Bảng điều khiển\"></a></p>\n<h3>Tiện ích</h3>\n<p>- Trang bị&nbsp;quạt đối lưu giúp khí\nnóng tỏa đều lòng nồi, cho ra thực phẩm chín đều các mặt.</p>\n<p>- Tự động ngắt khi quá nhiệt, đảm bảo an toàn tối đa cho người sử dụng.&nbsp;</p>\n<p>- Nồi chiên không dầu có\nđèn báo hoạt động để người dùng tiện theo dõi tình trạng nấu nướng của nồi.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-5a-1.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4035 - Tiện ích\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-5a-1.jpg\" \ntitle=\"Nồi chiên không dầu Sunhouse SHD4035 - Tiện ích\"></a></p>\n<h3>Phụ kiện đi kèm</h3>\n<p>- Vỉ tách dầu.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-5a.jpg\"\nonclick=\"return false;\"><img alt=\"Nồi chiên không dầu Sunhouse SHD4035 9 lít - Vỉ tách dầu\"\nsrc=\"https://cdn.tgdd.vn/Products/Images/9418/275125/sunhouse-shd4035-9-lit-5a.jpg\" \ntitle=\"Nồi chiên không dầu Sunhouse SHD4035 9 lít - Vỉ tách dầu\"></a></p>\n<h3>Cách vệ sinh thiết bị&nbsp;</h3>\n<p>- Không được ngâm dây nguồn, phích cắm trong nước hoặc bất kỳ chất lỏng khác.</p>\n<p>- Vệ sinh sau mỗi lần sử dụng.</p>\n<p>- Sử dụng vải mềm hoặc bàn chải nhà bếp có lông mềm để loại bỏ những thức ăn cứng đầu. Không dùng miếng sắt cứng hoặc\nvật cứng vì chúng sẽ làm hỏng lớp chống dính.</p>\n<p>- Không sử dụng các chất tẩy rửa thô hoặc có tính mài mòn. Mặt bên ngoài có thể lau sạch bằng vải mềm và ẩm.</p>\n<p>- Có thể ngâm các phụ kiện chiên nướng vào nước để dễ dàng loại bỏ mảng bám dính nếu có.</p>\n<p>- Làm sạch thanh gia nhiệt bằng bàn chải mềm để loại bỏ những mảnh vụn thức ăn.</p>\n<p><em>Nồi chiên không\ndầu&nbsp;</em><i>Sunhouse&nbsp;SHD4035 9 lít,\nmàu đen hiện đại, thích hợp sử dụng trong gian bếp gia đình, là thiết bị hữu ích đối với những bà nội trợ đam mê\nlàm bánh hoặc những người yêu thích đồ ăn chiên rán vừa thơm ngon lại vừa hạn chế dầu mỡ.</i></p>', 24, 200, 1),
(40, 9, 'Nồi chiên không dầu BlueStone AFB-5878 5.5 lít ', 13, 'P40_avt.jpg', 4, '<h3>Nồi chiên không dầu\n    BlueStone&nbsp;mang thiết kế hiện đại, sang trọng với kiểu dáng lạ mắt</h3>\n<p>Vỏ nhựa PP nhám bền bỉ, cách nhiệt và mặt trước viền inox sáng bóng, chống trầy tốt, mới lâu.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-044021-054006.jpg\"\n    onclick=\"return false;\"><img alt=\"Sang trọng - Nồi chiên không dầu Bluestone AFB-5878 5.5 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-044021-054006.jpg\"\n         title=\"Sang trọng - Nồi chiên không dầu Bluestone AFB-5878 5.5 lít\"></a></p>\n<h3>Dung tích tổng 6.5 lít,&nbsp;dung tích sử\n    dụng 5.5 lít có thể chiên nướng dễ dàng khoảng 2 - 3 miếng sườn 0.5 kg cùng lúc</h3>\n<p>Ngoài ra, bạn còn có thể dùng nồi chiên không dầu để chế biến các món như khoai tây chiên, gà rán, làm bánh… đa dạng\nbữa ăn gia đình.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-051721-031722-1.jpg\"\n    onclick=\"return false;\"><img alt=\"Dung tích sử dụng 5.5 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-051721-031722-1.jpg\"\n        title=\"Dung tích sử dụng 5.5 lít\"></a></p>\n<h3>Khay hứng dầu và rổ chiên chống dính tiện dụng, rổ chiên chất liệu hợp kim nhôm với lớp chống dính Greblon cao cấp\n</h3>\n<p>Giúp nồi không chỉ bắt và giữ nhiệt tốt mà còn chiên nướng ngon, an toàn sức khỏe. Rổ chiên dễ tháo rời, tiện vệ sinh\nsau khi sử dụng.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-051721-031738.jpg\"\n    onclick=\"return false;\"><img alt=\"Chống dính - Nồi chiên không dầu Bluestone AFB-5878 5.5 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-051721-031738.jpg\"\n        title=\"Chống dính - Nồi chiên không dầu Bluestone AFB-5878 5.5 lít\"></a></p>\n<h3>Bảng điều\n    khiển cảm ứng nhạy bén với màn hình Led tiện theo dõi, dễ tùy chỉnh 8 chế độ nấu được cài đặt sẵn, hẹn giờ\ntối đa đến 60 phút, lựa chọn nhiệt độ chiên lên đến 200 độ C</h3>\n<p>Cho bạn chủ động hơn trong việc chuẩn bị những món ăn ngon với nồi chiên.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-044021-054030.jpg\"\n    onclick=\"return false;\"><img alt=\"Hiện đại, dễ dùng - Nồi chiên không dầu Bluestone AFB-5878 5.5 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-044021-054030.jpg\"\n         title=\"Hiện đại, dễ dùng - Nồi chiên không dầu Bluestone AFB-5878 5.5 lít\"></a></p>\n<h3>Công suất 1700W, chiên nướng ngon nhờ công nghệ Rapid Air</h3>\n<p>Công nghệ Rapid Air đối lưu hiệu quả luồng nhiệt, làm chín thực phẩm nhanh chóng mà không cần hoặc chỉ cần dùng rất\nít dầu mỡ, giảm thiểu đến 80% lượng dầu mỡ thừa so với việc chiên thực phẩm thông thường, gia tăng lợi ích bảo vệ\nsức khỏe, an tâm thưởng thức những món ngon yêu thích.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-044021-054035.jpg\"\n    onclick=\"return false;\"><img alt=\"Chiên nướng ngon - Nồi chiên không dầu Bluestone AFB-5878 5.5 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-044021-054035.jpg\"\n         title=\"Chiên nướng ngon - Nồi chiên không dầu Bluestone AFB-5878 5.5 lít\"></a></p>\n<h3>Nồi chiên không dầu có khóa nắp,\ntránh vô tình tháo lòng nồi khi đang nấu nướng, bảo vệ an toàn cho cả thiết bị và người dùng</h3>\n<p>Kết hợp với chế độ tự ngắt khi kéo rổ chiên, bạn sẽ an tâm hơn khi sử dụng nồi chiên tại gia đình.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-044021-054040.jpg\"\n    onclick=\"return false;\"><img alt=\"An toàn - Nồi chiên không dầu Bluestone AFB-5878 5.5 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/9418/232457/bluestone-afb-5878-55-lit-044021-054040.jpg\"\n         title=\"An toàn - Nồi chiên không dầu Bluestone AFB-5878 5.5 lít\"></a></p>\n<p><strong>Lưu ý khi sử dụng</strong></p>\n<p>- Vệ sinh nồi trước khi sử dụng lần đầu. Thường xuyên vệ sinh các bộ phận, mặt ngoài nồi để đảm bảo độ bền, an toàn\nsức khỏe suốt thời gian sử dụng.</p>\n<p>- Khi sử dụng chiên thức ăn cần lưu ý không nên chiên quá nhiều thức ăn cùng lúc thức ăn sẽ bị mềm.</p>\n<p>- Không nên chiên thức ăn quá lâu, nhiệt độ trong nồi sẽ làm khô thức ăn.</p>\n<p>Nồi chiên không dầu BlueStone AFB-5878 5.5 lít hứa\nhẹn là người bạn đồng hành lý tưởng trong gian bếp người nội trợ, vừa giúp chế biến những món ăn ngon, lại đảm bảo\ntốt hơn cho sức khỏe gia đình.</p>', 24, 100, 1),
(41, 9, 'Nồi chiên không dầu Kangaroo KG52AF1A 5 lít', 14, 'P41_avt.jpg', 4, '<h3>Nồi chiên không\n    dầu Kangaroo&nbsp;thiết kế hiện đại, gọn đẹp, tăng tính thẩm mỹ cho không gian bếp</h3>\n<p>Dung tích tổng 5 lít, dung tích sử dụng 4.5 lít, phục vụ tốt trong các gia đình có từ 4 - 6 thành viên.&nbsp;Có chân\nđế chống trượt bám chặt vào mặt bàn, kệ, đảm bảo nồi không bị nghiêng hay rung lắc, nấu ăn an toàn, hiệu quả.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/2063/217569/noi-chien-khong-dau-kangaroo-kg52af1a-1-1.jpg\"\n    onclick=\"return false;\"><img alt=\"Thiết kế hiện đại, gọn đẹp - Nồi chiên không dầu Kangaroo KG52AF1A 5 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/2063/217569/noi-chien-khong-dau-kangaroo-kg52af1a-1-1.jpg\"\n         title=\"Thiết kế hiện đại, gọn đẹp - Nồi chiên không dầu Kangaroo KG52AF1A 5 lít\"></a></p>\n<h3>Sử dụng chiên, nướng thực phẩm không cần dùng dầu nên giúp giảm dầu mỡ trong thực phẩm cho món ăn chín ngon, không\nngán</h3>\n<p>Công suất lớn 2000W kết hợp công nghệ làm nóng Rapid Air giúp làm thực phẩm chín nhanh, đều.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/2063/217569/noi-chien-khong-dau-kangaroo-kg52af1a-2-1.jpg\"\n    onclick=\"return false;\"><img\n        alt=\"Sử dụng chiên, nướng thực phẩm không cần dùng dầu - Nồi chiên không dầu Kangaroo KG52AF1A 5 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/2063/217569/noi-chien-khong-dau-kangaroo-kg52af1a-2-1.jpg\"\n        title=\"Sử dụng chiên, nướng thực phẩm không cần dùng dầu - Nồi chiên không dầu Kangaroo KG52AF1A 5 lít\"></a></p>\n<h3>Nồi chiên không dầu&nbsp;thiết kế\nbảng điều khiển cảm ứng\nmàn hình LED hiển thị rõ ràng, quan sát dễ dàng</h3>\n<p>Điều chỉnh các mức nhiệt độ từ 80 - 200 độ C, 8 thực đơn nấu, hẹn giờ tối đa đến 60 phút dễ dàng.</p>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/2063/217569/noi-chien-khong-dau-kangaroo-kg52af1a-3-1.jpg\"\n    onclick=\"return false;\"><img\n        alt=\"Bảng điều khiển nút nhấn điện tử cùng đèn LED hiển thị - Nồi chiên không dầu Kangaroo KG52AF1A 5 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/2063/217569/noi-chien-khong-dau-kangaroo-kg52af1a-3-1.jpg\"\n        title=\"Bảng điều khiển nút nhấn điện tử cùng đèn LED hiển thị - Nồi chiên không dầu Kangaroo KG52AF1A 5 lít\"></a>\n</p>\n<h3>Rổ chiên bằng kim loại bền bỉ, phủ chống dính, hạn chế thức ăn dính cháy, dễ vệ sinh</h3>\n<p><a class=\"preventdefault\"\n    href=\"https://cdn.tgdd.vn/Products/Images/2063/217569/noi-chien-khong-dau-kangaroo-kg52af1a-4-1.jpg\"\n    onclick=\"return false;\"><img\n        alt=\"Khay tách dầu, khay chiên bằng kim loại bền bỉ - Nồi chiên không dầu Kangaroo KG52AF1A 5 lít\"\n        src=\"https://cdn.tgdd.vn/Products/Images/2063/217569/noi-chien-khong-dau-kangaroo-kg52af1a-4-1.jpg\"\n        title=\"Khay tách dầu, khay chiên bằng kim loại bền bỉ - Nồi chiên không dầu Kangaroo KG52AF1A 5 lít\"></a>\n</p>\n<p><strong>Sử dụng nồi chiên không dầu hiệu quả:</strong></p>\n<p>- Đặt nồi chiên không dầu ở vị trí thăng bằng, không gần các nguồn phát nhiệt cao, nguồn nước.</p>\n<p>- Không nhét thực phẩm quá đầy vào trong nồi, thức ăn sẽ không chín đều và có nguy cơ làm giảm độ bền của sản phẩm.\n</p>\n<p>- Cần để cho nồi nguội hoàn toàn rồi mới bắt đầu vệ sinh.</p>\n<p>Nồi chiên không dầu Kangaroo KG52AF1A 5 lít&nbsp;dễ\ndùng, mẫu đẹp, độ bền cao, xứng đáng có mặt trong mọi gia đình hiện đại.</p>', 24, 100, 1);
INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `supplier_id`, `product_avt_img`, `product_rate`, `product_description`, `product_period`, `product_view_count`, `product_is_display`) VALUES
(42, 9, 'Nồi chiên không dầu Hafele AF-T5A (535.43.712) 5 lít', 40, 'P42_avt.jpg', 4, '<h3 style=\"text-align: justify;\">Nồi chiên không dầu Hafele&nbsp;thiết\n    kế trang nhã, sang trọng với vỏ nhựa - inox bóng đẹp, tăng tính thẩm mỹ cho mọi căn bếp gia đình</h3>\n<p>Dung tích sử dụng của nồi chiên&nbsp;5 lít&nbsp;có thể\n    nướng được 4 - 5 đùi gà cùng lúc.</p>\n<p><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/9418/233494/hafele-af-t5a-5-lit-090822-112311.jpg\"\n        onclick=\"return false;\"><img alt=\"Nồi chiên không dầu Hafele AF-T5A (535.43.712) - Dung tích sử dụng\"\n            src=\"https://cdn.tgdd.vn/Products/Images/9418/233494/hafele-af-t5a-5-lit-090822-112311.jpg\"\n            title=\"Nồi chiên không dầu Hafele AF-T5A (535.43.712) - Dung tích sử dụng\"></a></p>\n<h3>Điều khiển&nbsp;cảm ứng&nbsp;có chỉ\n    dẫn rõ ràng với màn hình hiển thị rõ nét, dễ thao tác</h3>\n<p>Điều chỉnh nhiệt độ từ 80 - 200 độ C, hẹn giờ lên đến 60 phút.</p>\n<p>Giữ cho&nbsp;nồi chiên không dầu&nbsp;dùng bền lâu và đảm\n    bảo an toàn cho mọi người với tính năng tự động ngắt khi quá nhiệt.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/233494/bn-dk.jpg\"\n        onclick=\"return false;\"><img\n            alt=\"Bảng điều khiển hiển thị rõ các chức năng - Nồi chiên không dầu Hafele AF-T5A 5 lít\"\n            src=\"https://cdn.tgdd.vn/Products/Images/9418/233494/bn-dk.jpg\" \n            title=\"Bảng điều khiển hiển thị rõ các chức năng - Nồi chiên không dầu Hafele AF-T5A 5 lít\"></a></p>\n<h3>Có 8 chương trình chiên được cài đặt sẵn thời gian nhiệt độ đơn giản, giúp chuẩn bị thức ăn thơm ngon hơn</h3>\n<p>Menu được cài đặt sẵn bao gồm: Khoai tây chiên, thịt nướng, gà, tôm, bít tết, bánh, rau củ, cá,...</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/233494/chuc-nang-naau.jpg\"\n        onclick=\"return false;\"><img alt=\"Chức năng nấu đa dạng - Nồi chiên không dầu Hafele AF-T5A 5 lít\"\n            src=\"https://cdn.tgdd.vn/Products/Images/9418/233494/chuc-nang-naau.jpg\"\n            title=\"Chức năng nấu đa dạng - Nồi chiên không dầu Hafele AF-T5A 5 lít\"></a></p>\n<h3>Công suất 2000W cùng tích hợp quạt đối lưu giúp luân chuyển nhiệt lượng khắp khoang nồi cho thức ăn chín\n    đều,&nbsp;tiết kiệm điện năng tiêu thụ</h3>\n<p>Công nghệ làm nóng Rapid Air cùng công suất 2000W&nbsp;làm nóng nồi nhanh, giúp thức ăn chín mau, tiết kiệm điện.</p>\n<p>Giúp thực phẩm chín vàng đều và nhanh chóng, thưởng thức món ăn ngon miệng hơn.</p>\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/233494/untitled-1.jpg\"\n        onclick=\"return false;\"><img alt=\"Công suất 2000W - Nồi chiên không dầu Hafele AF-T5A 5 lít\"\n            src=\"https://cdn.tgdd.vn/Products/Images/9418/233494/untitled-1.jpg\" \n            title=\"Công suất 2000W - Nồi chiên không dầu Hafele AF-T5A 5 lít\"></a></p>\n<h3 style=\"text-align: justify;\">Lòng nồi bằng kim loại phủ chống dính&nbsp;cao cấp và an toàn tuyệt đối</h3>\n<p style=\"text-align: justify;\">Rổ chiên phủ lớp chống dính dễ tháo rời, tiện vệ sinh sau khi sử dụng.</p>\n<p style=\"text-align: justify;\"><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/9418/233494/2.jpg\"\n        onclick=\"return false;\"><img alt=\"Dễ tháo rời, tiện vệ sinh - Nồi chiên không dầu Hafele AF-T5A 5 lít\"\n            src=\"https://cdn.tgdd.vn/Products/Images/9418/233494/2.jpg\" \n            title=\"Dễ tháo rời, tiện vệ sinh - Nồi chiên không dầu Hafele AF-T5A 5 lít\"></a></p>\n<p>Chân đế chống trượt dùng chắc chắn trên mọi mặt phẳng, để nồi hoạt động ổn định, tránh nghiêng đổ.</p>\n<p><strong>Lưu ý khi sử dụng:</strong></p>\n<p>- Vệ sinh nồi trước khi sử dụng lần đầu. Thường xuyên vệ sinh các bộ phận, mặt ngoài nồi để đảm bảo độ bền, an toàn\n    sức khỏe suốt thời gian sử dụng.</p>\n<p>- Khi sử dụng chiên thức ăn cần lưu ý không nên chiên quá nhiều thức ăn cùng lúc thức ăn sẽ bị mềm.</p>\n<p>- Không nên chiên thức ăn quá lâu, nhiệt độ trong nồi sẽ làm khô thức ăn.</p>\n<p>Nồi chiên không\n        dầu Hafele AF-T5A 5 lít&nbsp;là thiết bị nấu ăn hiện đại của nhãn hiệu Đức - Hafele sở hữu kiểu dáng đẹp\n    mắt, chế biến được nhiều món ngon, dễ sử dụng, giá cả hợp lý, rất thích hợp cho bạn.</p>', 24, 100, 1),
(43, 2, 'Máy giặt Toshiba 7 Kg AW-L805AV', 7, 'P43_avt.jpg', 4, '<h3>\n    Thiết kế tối giản, sang trọng, hiện đại với khối lượng giặt 7 kg phù hợp cho\n    gia đình 2 - 3 người\n  </h3>\n  <p>Máy giặt Toshiba 7 Kg AW-L805AV (SG) &nbsp;có màu xám bạc\n    <strong>vừa toát lên vẻ sang trọng, hiện đại vừa đảm bảo vệ sinh</strong> hơn\n    trong quá trình sử dụng.&nbsp;\n  </p>\n  <p>\n    Với thiết kế&nbsp; cửa trên, lồng đứng và có&nbsp;<strong>khối lượng giặt là 7 kg</strong>&nbsp;này sẽ\n    phù hợp với những gia đình có&nbsp;<strong>2 - 3 thành viên</strong\n    >.&nbsp;Hoặc với gia đình có đông thành viên hơn nhưng nhu cầu giặt giũ ít thì\n    vẫn là lựa chọn phù hợp cho gia đình bạn.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1944/239156/toshiba-7-kg-aw-l805av-sg-150922-023646-1.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Máy giặt Toshiba 7 Kg AW-L805AV (SG) - Khối lượng 7 kg\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1944/239156/toshiba-7-kg-aw-l805av-sg-150922-023646-1.jpg\"\n        title=\"Máy giặt Toshiba 7 Kg AW-L805AV (SG) - Khối lượng 7 kg\"></a>\n  </p>\n  <h3>8 chương trình giặt tiện lợi, đáp ứng nhiều nhu cầu giặt giũ</h3>\n  <p>\n    Máy giặt được trang bị bảng điều khiển bằng song ngữ Anh - Việt với các nút\n    nhấn dễ sử dụng. Bên cạnh đó, máy giặt còn được trang bị thêm 8 chương trình\n    giặt như: giặt nhanh, giặt đồ mỏng, giặt đồ dày, giặt thường, giặt đồ jeans,\n    giặt chăn mền, chương trình ghi nhớ, vệ sinh lồng giặt&nbsp;<a\n      href=\"https://www.dienmayxanh.com/may-giat/toshiba-7-kg-aw-l805av-sg#top-tskt\"\n      target=\"_blank\"\n      title=\"xem thêm tại thông số kỹ thuật\"\n      >(Xem thêm chi tiết tại bảng TSKT)</a\n    >.&nbsp;Đối với chương trình giặt đồ mỏng, các loại quần áo có vải mỏng, khó\n    giặt, dễ hư sẽ được giặt nhẹ nhàng mà không ảnh hưởng đến chất lượng\n    vải.&nbsp;\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1944/239156/toshiba-7-kg-aw-l805av-sg-280322-123153.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Máy giặt Toshiba 7 Kg AW-L805AV (SG) - 8 chương trình giặt\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1944/239156/toshiba-7-kg-aw-l805av-sg-280322-123153.jpg\"\n        title=\"Máy giặt Toshiba 7 Kg AW-L805AV (SG) - 8 chương trình giặt\"></a>\n  </p>\n  <h3>\n    Vừa giặt sạch, vừa bảo vệ quần áo với lồng giặt ngôi sao pha lê\n  </h3>\n  <p>\n    Lồng giặt ngôi sao pha lê với các gờ nổi hình ngôi sao, xen kẽ là các lỗ nhỏ\n    dẫn nước khắp lồng giặt tạo tác động nhẹ nhàng lên quần áo.\n    <strong\n      >Vừa đảm bảo giặt sạch, vừa chống sờn sợi vải, lưu trữ mùi hương lâu\n      hơn</strong\n    >. Nhờ thế sẽ giúp bảo vệ quần áo của bạn một cách tốt nhất.&nbsp;\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1944/239156/toshiba-7-kg-aw-l805av-sg-080823-022017.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\" Máy giặt Toshiba 7 Kg AW-L805AV (SG) - Lồng giặt ngôi sao pha lê\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1944/239156/toshiba-7-kg-aw-l805av-sg-080823-022017.jpg\"\n        title=\" Máy giặt Toshiba 7 Kg AW-L805AV (SG) - Lồng giặt ngôi sao pha lê\"></a>\n  </p>\n  <h3>Bảo vệ từng sợi vải và hạn chế xoắn rối nhờ chuyển động giặt đảo chiều</h3>\n  <p>\n    Việc quần áo xoắn bị rối nhau sẽ làm hư hỏng, giãn vải và tốn nhiều thời gian\n    và sức lực gỡ chúng ra sau khi giặt xong. Với công nghệ giặt<strong>\n      chuyển động giặt đảo chiều</strong\n    >, lồng giặt sẽ xoay cùng chiều kim đồng hồ và ngược lại để quần áo không bị\n    xoắn rối, bạn chỉ cần thiết lập các thông số rồi để máy vận hành mà không phải\n    lo ngại về tình trạng này.&nbsp;\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1944/239156/toshiba-7-kg-aw-l805av-sg-150922-023651.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Máy giặt Toshiba 7 Kg AW-L805AV (SG) - Chế độ giăt đảo chiều\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1944/239156/toshiba-7-kg-aw-l805av-sg-150922-023651.jpg\"\n        title=\"Máy giặt Toshiba 7 Kg AW-L805AV (SG) - Chế độ giăt đảo chiều\"></a>\n  </p>\n  <h3>\n    Loại bỏ các xơ vải, bụi bẩn nhờ tính&nbsp;năng vệ sinh lồng giặt&nbsp;\n  </h3>\n  <p>\n    Với khả năng vệ sinh lồng giặt trên máy giặt Toshiba\n    7 Kg AW-L805AV (SG) sẽ giúp loại bỏ được các xơ vải, bụi bẩn hay cặn bột giặt\n    đọng lại trong lồng giặt, từ đó hạn chế được mùi hôi và tình trạng dị ứng cũng\n    như đảm bảo cho quần áo các lần giặt sau được sạch sẽ hơn.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1944/239156/toshiba-7-kg-aw-l805av-sg-080823-022047.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Máy giặt Toshiba 7 Kg AW-L805AV (SG) - Vệ sinh lồng giặt\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1944/239156/toshiba-7-kg-aw-l805av-sg-080823-022047.jpg\"\n        title=\"Máy giặt Toshiba 7 Kg AW-L805AV (SG) - Vệ sinh lồng giặt\"></a>\n  </p>\n  <h3> Chế độ khóa trẻ em đảm bảo an toàn tuyệt đối&nbsp;\n  </h3>\n  <p>\n    Với <strong>chế độ khóa trẻ em</strong> sẽ làm mất tác dụng của các nút điều\n    khiển trên máy giặt Toshiba (trừ nút nguồn). Nhờ vậy\n    <strong>ngăn được trẻ em nghịch phá</strong> trong lúc máy hoạt động, đảm bảo\n    an toàn cho gia đình bạn.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1944/239156/toshiba-7-kg-aw-l805av-sg-080823-022119.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Máy giặt Toshiba 7 Kg AW-L805AV (SG) - Khóa trẻ em\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1944/239156/toshiba-7-kg-aw-l805av-sg-080823-022119.jpg\"\n        title=\"Máy giặt Toshiba 7 Kg AW-L805AV (SG) - Khóa trẻ em\"></a>\n  </p>\n  <h3>Tiết kiệm nước nhờ chế độ cân chỉnh mực nước thông minh&nbsp;</h3>\n  <p>\n    Nhờ vào khả năng tự động cân chỉnh mực nước sử dụng dựa vào khối lượng quần áo\n    trong quá trình giặt giũ, giúp tiết kiệm nước hiệu quả đáng kể, tránh gây lãng\n    phí nguồn nước, từ đó tiết kiệm kha khá chi phí tiền nước cho gia đình bạn\n    hàng tháng.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1944/239156/toshiba-7-kg-aw-l805av-sg-080823-022241.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Máy giặt Toshiba 7 Kg AW-L805AV (SG) - Tiết kiệm nước\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1944/239156/toshiba-7-kg-aw-l805av-sg-080823-022241.jpg\"\n        title=\"Máy giặt Toshiba 7 Kg AW-L805AV (SG) - Tiết kiệm nước\"></a>\n  </p>\n  <h3>An toàn hơn với nắp máy bằng kính cường lực giảm chấn chống kẹt tay</h3>\n  <p>\n    Nắp máy bằng kính chịu lực có giảm chấn đóng chậm&nbsp;giúp cho cửa máy giặt\n    đóng lại nhẹ nhàng, tránh tình trạng khi sử dụng vô ý không đóng cửa, cửa sập\n    lại quá nhanh gây chấn thương hay kẹt tay.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1944/239156/toshiba-7-kg-aw-l805av-sg-080823-022315.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Máy giặt Toshiba 7 Kg AW-L805AV (SG) - Nắp kính chịu lực\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1944/239156/toshiba-7-kg-aw-l805av-sg-080823-022315.jpg\"\n        title=\"Máy giặt Toshiba 7 Kg AW-L805AV (SG) - Nắp kính chịu lực\"></a>\n  </p>\n  <p>\n    Nhìn chung, với những ưu điểm nổi bật như: giặt đảo chiều, vệ sinh lồng giặt,\n    khoá trẻ em,... thì máy giặt Toshiba 7 Kg AW-L805AV (SG) sẽ rất phù hợp với\n    gia đình có <strong>2 - 3 thành viên</strong>&nbsp;hay các bạn sinh viên với\n    diện tích không gian nhỏ.\n  </p>', 24, 1000, 1),
(44, 2, 'Máy giặt Aqua Inverter 8.5 kg AQD-A852J BK', 9, 'P44_avt.jpg', 4.3, '<p>\n    <i\n      ><strong\n        >Máy giặt Aqua Inverter 8.5 kg AQD-A852J BK được thiết kế hiện đại theo\n        kiểu dáng máy giặt lồng ngang, lồng giặt lớn 525 mm nâng cao hiệu quả giặt\n        giũ, giảm xoắn rối áo quần.&nbsp;Công nghệ cân bằng AI DBT giúp máy vận\n        hành êm ái, ổn định.&nbsp;Truyền động gián tiếp dây curoa kết hợp cùng\n        động cơ Inverter giúp tiết kiệm điện năng tiêu thụ.</strong\n      ></i\n    >\n  </p>\n  <h3>Tổng quan thiết kế</h3>\n  <p>\n    - Kiểu dáng: Thiết kế dạng máy cửa trước - lồng ngang</strong>&nbsp;phong cách hiện đại,&nbsp;tông màu đen sang trọng, tạo điểm nhấn sang\n    trọng cho không gian sống của gia đình.&nbsp;\n  </p>\n  <p>\n    - <strong>Bảng điều khiển</strong>&nbsp;<strong>song ngữ Anh - Việt</strong\n    >&nbsp;kết hợp cùng núm xoay điều khiển cùng nút nhấn có màn hình hiển thị rõ\n    ràng, dễ hiểu giúp cho việc giặt giũ trở nên dễ dàng hơn.\n  </p>\n  <p>\n    - Nắp máy được làm bằng <strong>kính chịu lực</strong>&nbsp;với khả năng giảm\n    chấn, hạn chế kẹt tay, bảo vệ khung cửa máy giặt Aqua.\n  </p>\n  <p>\n    - Lồng giặt được làm từ <strong>thép không gỉ</strong> giúp quần áo được sạch\n    hơn, ngăn ngừa vi khuẩn có hại và tăng độ bền cho máy giặt.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1944/307237/may-giat-aqua-inverter-85-kg-aqd-a852j-bk-250523-014021.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Máy giặt Aqua Inverter 8.5 kg AQD-A852J BK - Thiết kế\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1944/307237/may-giat-aqua-inverter-85-kg-aqd-a852j-bk-250523-014021.jpg\"\n        title=\"Máy giặt Aqua Inverter 8.5 kg AQD-A852J BK - Thiết kế\"></a>\n  </p>\n  <p><em>*Hình ảnh chỉ mang tính chất minh họa sản phẩm</em></p>\n  <h3>Khối lượng giặt và chương trình giặt</h3>\n  <p>\n    - Khối lượng giặt <strong>8.5 kg</strong> phù hợp cho nhu cầu giặt giũ của gia\n    đình từ <strong>3 - 5 thành viên.</strong>&nbsp;\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1944/307237/may-giat-aqua-inverter-85-kg-aqd-a852j-bk-250523-014050.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Máy giặt Aqua Inverter 8.5 kg AQD-A852J BK - Khối lượng giặt\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1944/307237/may-giat-aqua-inverter-85-kg-aqd-a852j-bk-250523-014050.jpg\"\n        title=\"Máy giặt Aqua Inverter 8.5 kg AQD-A852J BK - Khối lượng giặt\"></a>\n  </p>\n  <p><em>*Hình ảnh chỉ mang tính chất minh họa sản phẩm</em></p>\n  <p>\n    - Được tích hợp sẵn<strong> 15 chương trình giặt</strong> phù hợp cho nhu cầu\n    giặt giũ khác nhau: Giặt tiêu chuẩn, giặt nhanh 15 phút, giặt Refresh, giặt\n    cotton, giặt đồ trẻ em,…(xem chi tiết tại thông số kỹ thuật). <strong>Giặt Refresh</strong> giúp quần áo loại bỏ mùi hôi, ngăn ngừa sự\n    phát triển của vi khuẩn bằng hơi nước ấm thẩm thấu sâu vào từng sợi vải, cho\n    quần áo của bạn luôn trông như mới.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1944/307237/may-giat-aqua-inverter-85-kg-aqd-a852j-bk-160523-115238.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Máy giặt Aqua Inverter 8.5 kg AQD-A852J BK - Chế độ giặt Refresh\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1944/307237/may-giat-aqua-inverter-85-kg-aqd-a852j-bk-160523-115238.jpg\"\n        title=\"Máy giặt Aqua Inverter 8.5 kg AQD-A852J BK - Chế độ giặt Refresh\"></a>\n  </p>\n  <p><em>*Hình ảnh chỉ mang tính chất minh họa sản phẩm</em></p>\n  <h3>Công nghệ đặc biệt</h3>\n  <p>Smart Dual Spray</strong>\n    tự làm sạch mặt trong cửa và vòng đệm cửa, các tia nước sẽ tự động làm sạch\n    các xơ vải còn sót lại bên trong mặt cửa và vòng đệm cửa sau mỗi lần giặt,\n    giúp quần áo lấy ra được sạch sẽ hơn, loại bỏ xơ vải cho lần giặt tiếp theo.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1944/307237/may-giat-aqua-inverter-85-kg-aqd-a852j-bk-250523-014125.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Máy giặt Aqua Inverter 8.5 kg AQD-A852J BK - Công nghệ giặt\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1944/307237/may-giat-aqua-inverter-85-kg-aqd-a852j-bk-250523-014125.jpg\"\n        title=\"Máy giặt Aqua Inverter 8.5 kg AQD-A852J BK - Công nghệ giặt\"></a>\n  </p>\n  <p><em>*Hình ảnh chỉ mang tính chất minh họa sản phẩm</em></p>\n  <p>\n  <strong>Lồng giặt hình gối Pillow</strong>được thiết kế có nhiều lỗ thoát nước nhỏ chỉ 2.5 mm giúp dễ dàng giặt sạch\n    quần áo, bảo vệ quần áo tránh hiện tượng xơ vải mắc vào lỗ thoát nước.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1944/307237/may-giat-aqua-inverter-85-kg-aqd-a852j-bk-160523-115241.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Máy giặt Aqua Inverter 8.5 kg AQD-A852J BK - Lồng giặt Pillow\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1944/307237/may-giat-aqua-inverter-85-kg-aqd-a852j-bk-160523-115241.jpg\"\n        title=\"Máy giặt Aqua Inverter 8.5 kg AQD-A852J BK - Lồng giặt Pillow\"></a>\n  </p>\n  <p><em>*Hình ảnh chỉ mang tính chất minh họa sản phẩm</em></p>\n  <p>\n    Máy giặt được thiết kế đặc biệt, đường kính\n    <strong>lồng giặt TO 525 mm</strong>, giúp giặt sạch hơn, giảm xoắn rối quần\n    áo.\n  </p>\n  <p>\n    <strong>Công nghệ cân bằng AI DBT</strong> đảm bảo vận hành máy giặt êm ái và\n    mạnh mẽ dưới khối lượng lớn và thiết kế máy giặt nhỏ gọn.\n  </p>\n  <h3>Động cơ - Công nghệ tiết kiệm điện</h3>\n  <p>\n    - Kiểu động cơ: <strong>Truyền động gián tiếp dây curoa</strong> kết hợp cùng<strong>động cơ Inverter</strong>\n    giúp tiết kiệm điện năng tiêu thụ.\n  </p>\n  <p>\n    - Nhãn năng lượng chuẩn <strong>5 sao</strong>, hiệu suất sử dụng điện là\n    <strong>15.6 Wh/kg</strong>.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1944/307237/may-giat-aqua-inverter-85-kg-aqd-a852j-bk-250523-014202.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Máy giặt Aqua Inverter 8.5 kg AQD-A852J BK - Công nghệ Inverter\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1944/307237/may-giat-aqua-inverter-85-kg-aqd-a852j-bk-250523-014202.jpg\"\n        title=\"Máy giặt Aqua Inverter 8.5 kg AQD-A852J BK - Công nghệ Inverter\"></a>\n  </p>\n  <p><em>*Hình ảnh chỉ mang tính chất minh họa sản phẩm</em></p>\n  <h3>Tiện ích</h3>\n  <p>\n    - <strong>Giặt nhanh 15 phút:</strong> Giặt nhanh lượng quần áo ít, quần áo ít\n    bẩn, quần áo mỏng chỉ trong 15 phút.\n  </p>\n  <p>\n    -<strong>Hẹn giờ giặt:</strong>\n    Cho phép bạn dễ dàng lên lịch giặt đồ vào các mốc thời gian mong muốn, đảm bảo\n    quần áo luôn sạch sẽ và sẵn sàng khi bạn cần chúng.\n  </p>\n  <p>\n    - Khóa trẻ em:</strong>\n    Khóa các phím chức năng, hạn chế trẻ em đùa nghịch, thao tác trên máy.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1944/307237/may-giat-aqua-inverter-85-kg-aqd-a852j-bk-250523-014331.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Máy giặt Aqua Inverter 8.5 kg AQD-A852J BK - Tiện ích\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1944/307237/may-giat-aqua-inverter-85-kg-aqd-a852j-bk-250523-014331.jpg\"\n        title=\"Máy giặt Aqua Inverter 8.5 kg AQD-A852J BK - Tiện ích\"></a>\n  </p>\n  <p><em>*Hình ảnh chỉ mang tính chất minh họa sản phẩm</em></p>\n  <p>\n    <em\n      >Máy giặt Aqua Inverter 8.5 kg AQD-A852J BK\n      có khối lượng giặt 8.5 kg phù hợp cho nhu cầu giặt giũ của gia đình 3 - 5\n      thành viên. Ngoài ra, công nghệ cân bằng AI DBT vận hành êm ái giảm rung lắc\n      và tiếng ồn hiệu quả.</em\n    >\n  </p>', 24, 1200, 1),
(45, 4, 'Điện thoại OPPO A38', 22, 'P45_avt.jpg', 4, '<h3 style=\"text-align: justify\"> OPPO A38\n    tiếp tục là sản phẩm giá rẻ được OPPO mở bán chính hãng tại thị trường Việt\n    Nam. Máy được ra mắt vào tháng 09/2023 và gây ấn tượng bởi mức giá bán phải\n    chăng, cấu hình ổn cùng camera có độ phân giải tới 50 MP.\n  </h3>\n  <h3 style=\"text-align: justify\">Thiết kế trẻ trung hiện đại</h3>\n  <p style=\"text-align: justify\">\n    OPPO A38 là đại diện của sự tinh tế và hiện đại trong thiết kế di động. Với\n    dáng vẻ vuông vắn, góc cạnh sắc sảo, thiết bị này tạo nên cái nhìn sang trọng\n    và cực kỳ hợp xu hướng.&nbsp;\n  </p>\n  <p style=\"text-align: justify\">\n    Thiết kế của OPPO A38 được cấu tạo từ các chất liệu như khung nhựa và mặt lưng\n    thủy tinh hữu cơ, kết hợp với kiểu hoàn thiện bề mặt nhám nhẹ giúp cho mặt\n    lưng của máy có khả năng hạn chế bám dấu vân tay và kháng xước tốt hơn so với\n    những kiểu nhẵn bóng thông thường.\n  </p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/42/275435/oppo-a58-020823-030938.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Thiết kế điện thoại - OPPO A58\"\n        src=\"https://cdn.tgdd.vn/Products/Images/42/275435/oppo-a58-020823-030938.jpg\"\n        style=\"text-align: justify\"\n        title=\"Thiết kế điện thoại - OPPO A58\"></a>\n  </p>\n  <p style=\"text-align: justify\">\n    Với khối lượng chỉ 190 g, OPPO A38 đem lại cảm giác cầm nắm nhẹ nhàng và thoải\n    mái, tạo điều kiện thuận lợi cho việc sử dụng hàng ngày và di chuyển. Bạn có\n    thể dễ dàng cầm nắm xem phim hay chơi game trong nhiều giờ liền mà ít khi cảm\n    thấy mỏi tay.\n  </p>\n  <p style=\"text-align: justify\">\n    Đối với OPPO A38, hãng trang bị cho máy một cảm biến vân tay được đặt ở cạnh\n    bên với vị trí vừa phải, nhờ vậy mà người dùng có thể mở khóa thiết bị dễ dàng\n    chỉ với 1 tay. Với độ nhận diện chính xác và nhanh chóng, vì thế A38 có thể\n    làm bạn an tâm hơn trước những vấn đề liên quan đến bảo mật.\n  </p>\n  <h3 style=\"text-align: justify\">Sử dụng màn hình IPS LCD 90 Hz</h3>\n  <p style=\"text-align: justify\">\n    OPPO A38 được trang bị một tấm nền IPS LCD, giúp tái hiện màu sắc tự nhiên và\n    độ tương phản cao. Khả năng hiển thị màu sắc rực rỡ làm cho các hình ảnh,\n    video và nội dung đa phương tiện trở nên sống động và chân thực.\n  </p>\n  <p style=\"text-align: justify\">\n    Màn hình này có độ phân giải HD+ (720 x 1612 Pixels), vì thế OPPO A38 đem lại\n    sự chi tiết tinh tế và độ rõ nét ổn. Mỗi chi tiết trên màn hình sẽ được hiển\n    thị một cách rõ ràng, cho bạn trải nghiệm thoải mái khi sử dụng điện thoại để\n    xem phim mà ít khi cảm thấy bị rỗ màn hình.\n  </p>\n  <p style=\"text-align: justify\">\n    Tuy nhiên thì đây cũng là sản phẩm giá rẻ, vậy nên việc trang bị màn hình HD+\n    cũng dẫn đến một vài bất tiện trong lúc trải nghiệm, cụ thể như điện thoại\n    sẽ không bật được các chuẩn độ phân giải cao khi xem video trên YouTube hay\n    Netflix.\n  </p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/42/275435/oppo-a58-020823-030941.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Màn hình điện thoại - OPPO A58\"\n        src=\"https://cdn.tgdd.vn/Products/Images/42/275435/oppo-a58-020823-030941.jpg\"\n        style=\"text-align: justify\"\n        title=\"Màn hình điện thoại - OPPO A58\"></a>\n  </p>\n  <p style=\"text-align: justify\">\n    Với kích thước rộng lên tới 6.56 inch, màn hình OPPO A38 mở ra một không gian\n    rộng lớn cho bạn thưởng thức các nội dung yêu thích. Dù là duyệt web, xem phim\n    hay chơi game, bạn sẽ được đắm chìm trong từng hình ảnh với sự thoải mái và\n    thỏa mãn tuyệt đối.\n  </p>\n  <p style=\"text-align: justify\">\n    Độ sáng màn hình lên đến 720 nits của OPPO A38 cho phép bạn đọc và xem nội\n    dung ngay cả trong điều kiện ánh sáng mạnh. Để có thể sử dụng dễ dàng hơn,\n    người dùng nên hạn chế bật các chế độ ban đêm hay làm giảm ánh sáng trắng khi\n    đang sử dụng máy ngoài trời nhằm giúp mọi nội dung có thể hiển thị rõ ràng\n    hơn.\n  </p>\n  <p style=\"text-align: justify\">\n    OPPO A38 không chỉ đem lại trải nghiệm tốt về hình ảnh mà còn chú trọng đến\n    khả năng bảo vệ. Với kính cường lực Panda, màn hình sẽ hạn chế được rủi ro hư\n    hỏng khi va đập, xước, và các yếu tố gây hại khác, đảm bảo cho màn hình luôn\n    trong trạng thái tốt nhất.\n  </p>\n  <p style=\"text-align: justify\">\n    Với tần số quét lên tới 90 Hz, màn hình của OPPO A38 đem lại sự mượt mà tuyệt\n    vời khi cuộn trang, di chuyển trong giao diện và thậm chí là khi chơi game. Sự\n    tương tác mượt mà này mang đến trải nghiệm thú vị và cuốn hút, khiến bạn hoàn\n    toàn đắm chìm vào thế giới của màn hình.\n  </p>\n  <h3 style=\"text-align: justify\">Hiệu năng xử lý tốt các tác vụ thường ngày</h3>\n  <p style=\"text-align: justify\">\n    Đằng sau vẻ ngoại hình bắt mắt của OPPO A38 là sự mạnh mẽ của vi xử lý\n    MediaTek Helio G85 8 nhân. Với tốc độ xử lý mạnh mẽ và khả năng đa nhiệm ổn\n    định, chiếc điện thoại này sẽ đảm bảo mọi trải nghiệm của bạn đều thực hiện\n    một cách dễ dàng và ít khi xảy ra các hiện tượng như giật lag.\n  </p>\n  <p style=\"text-align: justify\">\n    Là mẫu&nbsp; điện thoại RAM 4 GB, OPPO A38 không chỉ đem lại khả năng xử lý nhanh chóng mà còn đảm bảo hiệu\n    năng liên tục và ổn định. Bạn có thể dễ dàng chuyển đổi giữa các ứng dụng, mở\n    nhiều tab trình duyệt cùng lúc.\n  </p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/42/275435/oppo-a58-020823-030942.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Cấu hình điện thoại - OPPO A58\"\n        src=\"https://cdn.tgdd.vn/Products/Images/42/275435/oppo-a58-020823-030942.jpg\"\n        style=\"text-align: justify\"\n        title=\"Cấu hình điện thoại - OPPO A58\"></a>\n  </p>\n  <p style=\"text-align: justify\">\n    Tuy nhiên thì đây là mức RAM khá cơ bản, nên khi chơi các tựa game đồ họa cao\n    sẽ không thực sự tốt cho lắm. Vì thế nếu chọn OPPO A38 làm một chiếc điện\n    thoại chơi game cấu hình cao để leo rank thì đây thực sự không phải là một lựa\n    chọn lý tưởng.\n  </p>\n  <p style=\"text-align: justify\">\n    OPPO A38 được trang bị hệ điều hành Android 13, phiên bản mới nhất và tiên\n    tiến nhất của hệ điều hành di động Android. Điều này mang đến cho bạn trải\n    nghiệm mới mẻ với giao diện thân thiện, tính năng đa dạng và khả năng tùy\n    chỉnh cao. Bạn có thể tận dụng tối đa các tính năng độc đáo của Android 13 để\n    tạo ra một trải nghiệm cá nhân hoá và tiện lợi cho mình.\n  </p>\n  <h3 style=\"text-align: justify\">Trang bị camera chính đến 50 MP</h3>\n  <p style=\"text-align: justify\">\n    Với camera chính 50 MP, OPPO A38 sẽ chinh phục bạn bằng khả năng bắt lấy mọi\n    chi tiết và sắc nét trong từng bức ảnh. Bất kể bạn đang chụp cảnh đẹp tự nhiên\n    hay chân dung, camera này sẽ đảm bảo mỗi hình ảnh bạn chụp đều thể hiện sự\n    chất lượng tối ưu.\n  </p>\n  <p style=\"text-align: justify\">\n    Camera phụ 2 MP trên OPPO A38 giúp bạn chụp ảnh một cách sắc nét, đồng thời\n    tạo ra hiệu ứng xóa phông ảo diệu. Điều này giúp chủ thể trong bức ảnh nổi bật\n    hơn và tạo nên sự tập trung đáng kể. Tích hợp tính năng tự động lấy nét,\n    camera này sẽ giúp bạn dễ dàng chụp bức ảnh hoàn hảo mà không cần lo lắng về\n    việc điều chỉnh các vùng lấy nét.\n  </p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/42/275435/oppo-a58-020823-030949.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Camera điện thoại - OPPO A58\"\n        src=\"https://cdn.tgdd.vn/Products/Images/42/275435/oppo-a58-020823-030949.jpg\"\n        style=\"text-align: justify\"\n        title=\"Camera điện thoại - OPPO A58\"></a>\n  </p>\n  <p style=\"text-align: justify\">\n    Được hỗ trợ chế độ ban đêm tối ưu, OPPO A38 sẽ giúp bạn chụp ảnh trong điều\n    kiện ánh sáng yếu mà vẫn đảm bảo chất lượng ảnh tối ưu. Khả năng tăng cường\n    chất lượng ảnh chụp trong đêm giúp bạn tạo ra những tác phẩm nhiếp ảnh độc đáo\n    và ấn tượng, làm cho mọi khoảnh khắc trở nên đáng nhớ.\n  </p>\n  <p style=\"text-align: justify\">\n    Với camera trước 5 MP, OPPO A38 đảm bảo bạn luôn có những bức ảnh selfie tự\n    tin và tươi sáng một cách rõ ràng. Hỗ trợ tính năng làm đẹp và xóa phông,\n    chiếc&nbsp; điện thoại OPPO dòng A&nbsp;này giúp bạn tạo ra những bức ảnh selfie hoàn hảo để tôn lên vẻ đẹp tự\n    nhiên của bạn.\n  </p>\n  <h3 style=\"text-align: justify\">Pin lớn và hỗ trợ sạc nhanh 33 W</h3>\n  <p style=\"text-align: justify\">\n    Với dung lượng pin lên đến 5000 mAh, OPPO A38 sẽ đảm bảo bạn có thể sử dụng\n    điện thoại suốt cả ngày mà không cần lo lắng về việc sạc lại. Khả năng sử dụng\n    lâu dài giúp bạn thoải mái thực hiện các hoạt động, làm việc và giải trí mà\n    không lo đi tìm nguồn sạc.\n  </p>\n  <p style=\"text-align: justify\">\n    Khả năng sạc siêu nhanh SuperVOOC 33 W của OPPO A38 sẽ khiến bạn phải kinh\n    ngạc. Chiếc điện thoại sẽ được nạp đầy năng lượng chỉ trong thời gian ngắn,\n    giúp bạn trở lại trạng thái hoạt động một cách nhanh chóng sau mỗi lần sạc.\n  </p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/42/275435/oppo-a58-020823-030952.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Pin và khả năng sạc điện thoại - OPPO A58\"\n        src=\"https://cdn.tgdd.vn/Products/Images/42/275435/oppo-a58-020823-030952.jpg\"\n        style=\"text-align: justify\"\n        title=\"Pin và khả năng sạc điện thoại - OPPO A58\"></a>\n  </p>\n  <p style=\"text-align: justify\">\n    Tổng kết, OPPO A38 có thể xem là một trong những sự lựa chọn đáng cân nhắc ở\n    thời điểm hiện tại, vừa có mức giá bán phải chăng cùng cấu hình ổn trong tầm\n    giá, vì thế máy có thể là lựa chọn tối ưu dành cho các bạn học sinh - sinh\n    viên khi đang tìm mua cho mình một chiếc điện thoại Android &nbsp;có thể đáp ứng nhu cầu tra cứu học tập trong thời gian dài.\n  </p>', 12, 1500, 1),
(46, 4, 'Điện thoại vivo Y36 128GB', 23, 'P46_avt.jpg', 4, '<h3 style=\"text-align: justify\">\n    Vivo Y36 128GB\n     là một trong những lựa chọn đáng chú ý của thương hiệu vivo trong dòng sản\n     phẩm điện thoại thông minh. Với tính năng và cấu hình kỹ thuật ưu việt, vivo\n     Y36 128GB hứa hẹn sẽ mang đến cho người dùng trải nghiệm đỉnh cao và thú vị.\n   </h3>\n   <h3 style=\"text-align: justify\">Hoàn thiện với các chất liệu cao cấp</h3>\n   <p style=\"text-align: justify\">\n     Với thiết kế vuông vắn, vivo Y36 tạo nên một sự hài hòa tinh tế giữa vẻ cổ\n     điển và hiện đại. Góc cạnh được thiết kế tinh xảo, tạo nên một diện mạo mạnh\n     mẽ và chắc chắn cho chiếc điện thoại.\n   </p>\n   <p style=\"text-align: justify\">\n     vivo Y36 được kết tinh từ sự kết hợp hoàn hảo giữa khung kim loại chắc chắn và\n     mặt lưng kính cứng cáp. Khung kim loại không chỉ tạo nên độ bền và đẳng cấp,\n     mà còn mang lại cảm giác chắc chắn khi cầm nắm. Mặt lưng kính không chỉ thể\n     hiện sự sang trọng mà còn tạo nên hiệu ứng ánh sáng độc đáo, khiến vivo Y36\n     trở thành một tác phẩm nghệ thuật đẹp mắt.\n   </p>\n   <p style=\"text-align: justify\">\n     <a\n       class=\"preventdefault\"\n       href=\"https://cdn.tgdd.vn/Products/Images/42/311120/vivo-y36-128gb-260723-093443.jpg\"\n       onclick=\"return false;\"\n       ><img\n         alt=\"vivo Y36 128GB - Thiết kế\"\n         src=\"https://cdn.tgdd.vn/Products/Images/42/311120/vivo-y36-128gb-260723-093443.jpg\"\n         style=\"text-align: justify\"\n         title=\"vivo Y36 128GB - Thiết kế\"></a>\n   </p>\n   <p style=\"text-align: justify\">\n     vivo Y36 đem đến hai lựa chọn màu sắc thời thượng: xanh và đen. Mỗi màu sắc\n     đều tạo nên một cái nhìn riêng biệt và phong cách độc đáo cho chiếc smartphone. Màu xanh tươi mới và tinh tế thể hiện sự trẻ trung và sáng tạo, trong khi\n     màu đen lịch lãm và cổ điển tạo nên vẻ đẳng cấp và thời thượng.\n   </p>\n   <p style=\"text-align: justify\">\n     Mặc dù sở hữu thiết kế vuông vắn và khung kim loại, vivo Y36 vẫn mang lại cảm\n     giác cầm nắm đầm tay và thoải mái cho người dùng. Với khối lượng 202 g, vivo\n     Y36 không chỉ đảm lại sự cầm nắm thuận tiện mà còn tạo nên sự cân đối hoàn\n     hảo.\n   </p>\n   <p style=\"text-align: justify\">\n     vivo Y36 không ngừng đặt sự tin tưởng của người dùng lên hàng đầu. Với khả\n     năng kháng nước và bụi theo chuẩn IP54, vivo Y36 sẵn sàng đối mặt với mọi tình\n     huống, từ những ngày mưa đến những hành trình khám phá thiên nhiên hoang dã.\n     Bạn có thể yên tâm sử dụng vivo Y36 mà không cần lo lắng về những tác động từ\n     nước và bụi bẩn.\n   </p>\n   <h3 style=\"text-align: justify\">Nâng cao trải nghiệm với màn hình sắc nét</h3>\n   <p style=\"text-align: justify\">\n     Với tấm nền IPS LCD tiên tiến, màn hình vivo Y36 mang đến cho bạn những hình\n     ảnh tinh tế và chân thực, từ màu sắc tươi sáng cho đến độ sắc nét. Đồng thời,\n     công nghệ này còn đảm bảo góc nhìn rộng rãi và ổn định, để bạn có thể thưởng\n     thức nội dung mà không bị giới hạn.\n   </p>\n   <p style=\"text-align: justify\">Điện thoại vivo\n     được hỗ trợ độ phân giải Full HD+ (1080 x 2388 Pixels), màn hình vivo Y36 cho\n     phép bạn thấy rõ từng chi tiết nhỏ trong hình ảnh và video. Những hình ảnh sắc\n     nét cùng với độ phân giải cao sẽ làm cho trải nghiệm của bạn trở nên sống động\n     và ấn tượng.\n   </p>\n   <p style=\"text-align: justify\">\n     <a\n       class=\"preventdefault\"\n       href=\"https://cdn.tgdd.vn/Products/Images/42/311120/vivo-y36-128gb-260723-092130.jpg\"\n       onclick=\"return false;\"\n       ><img\n         alt=\"vivo Y36 128GB - Màn hình\"\n         src=\"https://cdn.tgdd.vn/Products/Images/42/311120/vivo-y36-128gb-260723-092130.jpg\"\n         style=\"text-align: justify\"\n         title=\"vivo Y36 128GB - Màn hình\"></a>\n   </p>\n   <p style=\"text-align: justify\">\n     Nhờ có kích thước lớn 6.64 inch, màn hình vivo Y36 giúp bạn tận hưởng không\n     giới hạn nội dung, từ xem phim, chơi game cho đến lướt web. Kích thước này\n     giúp bạn thoải mái và tự do sử dụng màn hình mọi lúc, mọi nơi.\n   </p>\n   <p style=\"text-align: justify\">\n     Màn hình vivo Y36 sở hữu tần số quét 90 Hz, tạo nên một trải nghiệm mượt mà và\n     sảng khoái hơn khi cuộn màn hình, chơi game hoặc thực hiện các thao tác khác\n     trên điện thoại vivo dòng Y. Sự mượt mà này sẽ khiến cho mọi hoạt động trên màn hình trở nên trơn tru và\n     thú vị hơn.\n   </p>\n   <h3 style=\"text-align: justify\">Cấu hình ổn trong tầm giá</h3>\n   <p style=\"text-align: justify\">\n     vivo Y36 được trang bị bộ xử lý Snapdragon 680 8 nhân, mang đến sự mạnh mẽ và\n     hiệu quả đỉnh cao. Khả năng xử lý nhanh chóng và mượt mà của chip Snapdragon\n     680 sẽ khiến mọi tác vụ từ mở ứng dụng, chơi game đến xem video trở nên suôn\n     sẻ và không gặp khó khăn.\n   </p>\n   <p style=\"text-align: justify\">\n     Với bộ nhớ RAM 8 GB, vivo Y36 không ngừng đưa ra những tốc độ xử lý nhanh\n     chóng và hiệu năng mượt mà. Bạn có thể mở nhiều ứng dụng cùng lúc, chuyển đổi\n     linh hoạt và trải nghiệm mọi thứ mà không cần lo lắng về hiện tượng giật lag.\n   </p>\n   <p style=\"text-align: justify\">\n     <a\n       class=\"preventdefault\"\n       href=\"https://cdn.tgdd.vn/Products/Images/42/311120/vivo-y36-128gb-260723-092128.jpg\"\n       onclick=\"return false;\"\n       ><img\n         alt=\"vivo Y36 128GB - Hiệu năng\"\n         src=\"https://cdn.tgdd.vn/Products/Images/42/311120/vivo-y36-128gb-260723-092128.jpg\"\n         style=\"text-align: justify\"\n         title=\"vivo Y36 128GB - Hiệu năng\"></a>\n   </p>\n   <p style=\"text-align: justify\">\n     Việc hỗ trợ tính năng mở rộng RAM của vivo Y36 khiến cho trải nghiệm của bạn\n     trở nên mượt mà hơn bao giờ hết. Bạn có thể tận dụng tối đa dung lượng bộ nhớ\n     để thực hiện những tác vụ phức tạp và cùng lúc mở nhiều ứng dụng mà không phải\n     lo lắng về hiệu suất.\n   </p>\n   <p style=\"text-align: justify\">\n     vivo Y36 chạy trên hệ điều hành Android 13, đem đến cho bạn những tính năng hiện đại, giao diện tối ưu và trải nghiệm\n     người dùng tốt nhất. Hệ điều hành này không chỉ đảm bảo sự ổn định mà còn mang\n     lại khả năng tùy biến linh hoạt, để bạn có thể cá nhân hóa thiết bị theo phong\n     cách riêng của mình.\n   </p>\n   <h3 style=\"text-align: justify\">Sở hữu camera 50 MP chụp ảnh sắc nét</h3>\n   <p style=\"text-align: justify\">\n     vivo Y36 gây ấn tượng mạnh với hệ thống camera sau gồm 2 ống kính - một ống\n     kính chính 50 MP và một ống kính phụ 2 MP. Ống kính chính với độ phân giải cao\n     sẽ đưa bạn đến gần hơn với mọi chi tiết, cho phép bạn tái hiện chân thực những\n     khoảnh khắc đẹp.&nbsp;\n   </p>\n   <p style=\"text-align: justify\">\n     Ống kính phụ 2 MP hỗ trợ tính năng xóa phông, giúp tạo ra những bức ảnh nghệ\n     thuật với hiệu ứng nền xóa mờ, tạo điểm nhấn cho chủ thể chính.\n   </p>\n   <p style=\"text-align: justify\">\n     vivo Y36 không ngừng mở ra cánh cửa nhiếp ảnh chuyên nghiệp với tính năng phơi\n     sáng kép, tính năng này cho phép bạn tạo ra các bức ảnh độc đáo khi lồng ghép\n     được nhiều khung cảnh thú vị vào trong hình. Bạn có thể tùy chỉnh các tham số\n     phơi sáng như ISO, tốc độ màn trập và cân bằng trắng để đắm chìm trong một thế\n     giới ánh sáng đầy tinh tế và sáng tạo.\n   </p>\n   <p style=\"text-align: justify\">\n     <a\n       class=\"preventdefault\"\n       href=\"https://cdn.tgdd.vn/Products/Images/42/311120/vivo-y36-128gb-260723-093438.jpg\"\n       onclick=\"return false;\"\n       ><img\n         alt=\"vivo Y36 128GB - Camera\"\n         src=\"https://cdn.tgdd.vn/Products/Images/42/311120/vivo-y36-128gb-260723-093438.jpg\"\n         style=\"text-align: justify\"\n         title=\"vivo Y36 128GB - Camera\"></a>\n   </p>\n   <p style=\"text-align: justify\">\n     Với tính năng siêu độ phân giải, vivo Y36 sẽ mang lại những hình ảnh chất\n     lượng tuyệt vời đến từng chi tiết. Bạn sẽ không còn lo lắng về việc mất đi độ\n     sắc nét khi phóng to hay in ấn bức ảnh. Mọi chi tiết sẽ được bắt giữ một cách\n     chân thực và rõ ràng.\n   </p>\n   <p style=\"text-align: justify\">\n     Camera trước của vivo Y36 với độ phân giải 16 MP không chỉ đơn thuần là một\n     công cụ chụp ảnh tự sướng mà còn là một \"chuyên gia\" trong việc chụp ảnh đêm.\n     Bạn có thể tự tin thể hiện phong cách và bắt giữ mọi khoảnh khắc đẹp ngay cả\n     trong điều kiện ánh sáng khó khăn.\n   </p>\n   <h3 style=\"text-align: justify\">Trang bị pin lớn và khả năng sạc nhanh 44 W</h3>\n   <p style=\"text-align: justify\">\n     Với dung lượng pin lớn 5000 mAh, vivo Y36 cho phép bạn dùng điện thoại suốt cả\n     ngày mà không cần lo lắng về việc hết pin. Bạn có thể thoải mái thực hiện mọi\n     tác vụ, từ xem phim, lướt web cho đến chơi game mà không cần phải lo lắng về\n     thời gian sạc lại.\n   </p>\n   <p style=\"text-align: justify\">\n     Khả năng sạc siêu nhanh 44 W của vivo Y36 đem đến một sự tiện lợi chưa từng\n     có. Chỉ trong một thời gian ngắn, bạn có thể sạc pin lên đủ để sử dụng cả\n     ngày. Đặc biệt, tính năng sạc này còn giúp tiết kiệm thời gian đáng kể trong\n     việc sạc lại điện thoại.\n   </p>\n   <p style=\"text-align: justify\">\n     <a\n       class=\"preventdefault\"\n       href=\"https://cdn.tgdd.vn/Products/Images/42/311120/vivo-y36-128gb-260723-092127.jpg\"\n       onclick=\"return false;\"\n       ><img\n         alt=\"vivo Y36 128GB - Bảo mật vân tay\"\n         src=\"https://cdn.tgdd.vn/Products/Images/42/311120/vivo-y36-128gb-260723-092127.jpg\"\n         style=\"text-align: justify\"\n         title=\"vivo Y36 128GB - Bảo mật vân tay\"></a>\n   </p>\n   <p style=\"text-align: justify\">\n     Tóm lại, vivo Y36 đã tạo dấu ấn riêng trong phân khúc điện thoại thông minh\n     với những ưu điểm đáng chú ý. Màn hình tươi sáng, khả năng sáng tạo từ hệ\n     thống camera đa dạng và hiệu suất đáng tin cậy, giúp mang đến một trải nghiệm\n     di động vượt trội.&nbsp;\n   </p>', 12, 900, 1),
(47, 4, 'Điện thoại realme C53 (6GB/128GB)', 25, 'P47_avt.jpg', 4.3, '<h3 style=\"text-align: justify\">\n    Với sự phát triển không ngừng của công nghệ di động, việc tìm kiếm một chiếc\n    điện thoại phù hợp với nhu cầu của học sinh - sinh viên không còn là điều khó\n    khăn. Trong số các tùy chọn trên thị trường, realme C53\n    nổi lên như một tuyệt tác hoàn hảo, mang đến sự kết hợp lý tưởng giữa giá trị\n    và chất lượng.\n  </h3>\n  <h3 style=\"text-align: justify\">Tạo hình vuông vắn, thiết kế sang trọng</h3>\n  <p style=\"text-align: justify\">\n    realme C53 sở hữu một thiết kế vuông vắn, làm chủ yếu từ nhựa nên mang đến cảm\n    giác cầm nắm thoải mái nhờ khối lượng không quá lớn. Điện thoại có độ hoàn\n    thiện khá cao khi các chi tiết đều được hoàn thiện tỉ mỉ, cứng cáp, máy không\n    quá ọp ẹp nên vẫn mang đến trải nghiệm cầm nắm an tâm hơn, thoải mái hơn.\n  </p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/42/306785/realme-c53-6.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Thiết kế sang trọng - realme C53\"\n        src=\"https://cdn.tgdd.vn/Products/Images/42/306785/realme-c53-6.jpg\"\n        title=\"Thiết kế sang trọng - realme C53\"></a>\n  </p>\n  <p style=\"text-align: justify\">\n    Với màn hình giọt nước tinh tế, điện thoại\n    này không chỉ gây ấn tượng về kiểu thiết kế hình notch mà còn về phần tối ưu\n    diện tích cực kỳ tốt, nó không thực sự chiếm nhiều diện tích màn hình nên trải\n    nghiệm khi xem nội dung vẫn trở nên thoải mái và vô cùng dễ chịu trên một\n    chiếc máy giá rẻ.\n  </p>\n  <h3 style=\"text-align: justify\">Màn hình lớn và tần số quét cao</h3>\n  <p style=\"text-align: justify\">\n    Được trang bị màn hình IPS LCD kích thước 6.74 inch, vì vậy realme C53 cho\n    trải nghiệm xem phim và chơi game cực thích với không gian hiển thị lớn, màu\n    sắc cũng trong trẻo và sinh động tạo cảm giác chân thực.\n  </p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/42/306785/realme-c53-4-1.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Hiển thị sắc nét - realme C53\"\n        src=\"https://cdn.tgdd.vn/Products/Images/42/306785/realme-c53-4-1.jpg\"\n        title=\"Hiển thị sắc nét - realme C53\"></a>\n  </p>\n  <p style=\"text-align: justify\">\n    Màn hình của máy đạt độ phân giải HD+ đảm bảo hình ảnh rõ nét, trong khi tốc\n    độ làm mới 90 Hz mang đến sự mượt mà trong quá trình sử dụng. Ngoài ra độ sáng\n    560 nits cũng sẽ giúp cho điện thoại realme\n    hiển thị nội dung rõ ràng hơn dưới ánh sáng mạnh.\n  </p>\n  <h3 style=\"text-align: justify\">Trang bị 2 camera cùng nhiều tính năng</h3>\n  <p style=\"text-align: justify\">\n    realme C53 được trang bị hệ thống camera chất lượng với hai camera sau 50 MP\n    và 0.08 MP giúp bạn có thể chụp ảnh sắc nét và chi tiết, bắt lấy mọi khoảnh\n    khắc quan trọng. Bên cạnh đó điện thoại còn được trang bị thêm nhiều tính năng\n    chụp ảnh cực kỳ thú vị như: Siêu độ phân giải, chuyên nghiệp, xóa phông, chụp\n    đêm, HDR,...\n  </p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/42/306785/realme-c53-5.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Chụp ảnh sắc nét - realme C53\"\n        src=\"https://cdn.tgdd.vn/Products/Images/42/306785/realme-c53-5.jpg\"\n        title=\"Chụp ảnh sắc nét - realme C53\"></a>\n  </p>\n  <p style=\"text-align: justify\">\n    Ở phần mặt trước, chiếc điện thoại này sẽ được tích hợp camera selfie 8 MP cho\n    phép bạn chụp ảnh tự sướng và tham gia cuộc trò chuyện video với độ nét cao.\n    Mặc dù là một chiếc máy giá rẻ nhưng realme vẫn mang đến khá nhiều các tính\n    năng chuyên nghiệp cho camera trước, các tính năng có thể kể đến như: Xóa\n    phông, làm đẹp, hiệu ứng Bokeh,...\n  </p>\n  <h3 style=\"text-align: justify\">Hiệu năng ổn định</h3>\n  <p style=\"text-align: justify\">\n    Với hệ điều hành Android 13 và chip Unisoc T612, realme C53 đáp ứng tốt các\n    nhu cầu sử dụng hằng ngày một cách ổn định từ việc lướt web, xem phim cho đến\n    chụp ảnh. Ngoài ra người dùng cũng có thể chơi tốt một vài tựa game có mức đồ\n    họa cơ bản như: Temple Run, Subway Surfers, Candy Crush Saga,...\n  </p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/42/306785/realme-c53-3.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Hiệu năng ổn định - realme C53\"\n        src=\"https://cdn.tgdd.vn/Products/Images/42/306785/realme-c53-3.jpg\"\n        title=\"Hiệu năng ổn định - realme C53\"></a>\n  </p>\n  <p style=\"text-align: justify\">\n    Là một chiếc\n    điện thoại RAM 6 GB\n    và bộ nhớ trong 128 GB, điều này giúp máy hoạt động mượt mà hơn cho những tác\n    vụ đa nhiệm chuyển ứng dụng, không gian lưu trữ cũng đủ lớn để có thể tải\n    xuống nhiều dữ liệu mà không gặp khó khăn cho việc đầy bộ nhớ.\n  </p>\n  <h3 style=\"text-align: justify\">\n    Trang bị viên pin 5000 mAh cùng sạc siêu nhanh 33 W\n  </h3>\n  <p style=\"text-align: justify\">\n    Điểm đáng chú ý của realme C53 là viên pin 5000 mAh dung lượng lớn, cùng với\n    đó là con chip và màn hình không tiêu tốn quá nhiều điện năng cho phép bạn sử\n    dụng thoải mái suốt cả ngày mà không cần lo lắng về việc sạc pin.&nbsp;\n  </p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/42/306785/realme-c53-2-1.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Viên pin dung lượng lớn - realme C53\"\n        src=\"https://cdn.tgdd.vn/Products/Images/42/306785/realme-c53-2-1.jpg\"\n        title=\"Viên pin dung lượng lớn - realme C53\"></a>\n  </p>\n  <p style=\"text-align: justify\">\n    Với sạc nhanh 33 W trên realme C53, điện thoại cũng sẽ nhanh chóng có đủ năng\n    lượng để tiếp tục hoạt động, khi chỉ cần đâu đó hơn 1 giờ đồng hồ là đã có thể\n    nạp đầy từ 0 cho đến 100% dung lượng pin.\n  </p>\n  <p style=\"text-align: justify\">\n    realme C53 là một sự lựa chọn hấp dẫn trong tầm giá với những ưu điểm nổi bật.\n    Với màn hình lớn, camera chất lượng và hiệu năng tốt, nó sẽ là người bạn đồng\n    hành đáng tin cậy cho nhu cầu hằng ngày của bạn với những bạn đang tìm kiếm\n    một chiếc điện thoại Android\n    có mức giá tốt và cấu hình nổi bật trong phân khúc.\n  </p>', 12, 1300, 1);
INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `supplier_id`, `product_avt_img`, `product_rate`, `product_description`, `product_period`, `product_view_count`, `product_is_display`) VALUES
(48, 6, 'Samsung Galaxy Tab A9+ 5G', 1, 'P48_avt.jpg', 4.2, '\n<h3 style=\"text-align: justify\"> Samsung Galaxy Tab A9+ 5G\n    là một lựa chọn tuyệt vời cho những người dùng đang tìm kiếm một máy tính bảng\n    giá cả phải chăng với màn hình rộng 11 inch, hiệu năng ổn định và khả năng kết\n    nối internet 5G.\n  </h3>\n  <h3 style=\"text-align: justify\">Thiết kế vuông vức hiện đại</h3>\n  <p style=\"text-align: justify\">\n    Sự tươi mới và tinh tế là những ấn tượng mà bất kỳ ai cũng có thể dễ dàng nhận\n    ra đầu tiên khi nhìn thấy Galaxy Tab A9+ 5G. Máy tính bảng có thiết kế hiện\n    đại và thanh lịch với mặt lưng phẳng và khung viền kim loại, giúp tạo nên vẻ\n    ngoài sang trọng, đẳng cấp.&nbsp;\n  </p>\n  <p style=\"text-align: justify\">\n    Vỏ ngoài của máy được làm từ kim loại nguyên khối, mang lại sự cứng cáp và bền\n    bỉ. Chất liệu kim loại cũng giúp máy có khả năng chống trầy xước và chống va\n    đập tốt. Đặc biệt, bề mặt kim loại được xử lý nhám giúp tăng độ bám tay và hạn\n    chế trơn trượt. Hơn hết, cách làm này còn tạo nên điểm nhấn riêng biệt cho sản\n    phẩm.\n  </p>\n  <p style=\"text-align: justify\">\n    Galaxy Tab A9+ 5G mang đến sự đa dạng và phong phú cho người dùng với ba tùy\n    chọn màu sắc: Xám, Bạc và Xanh dương. Mỗi màu sắc đều mang một vẻ đẹp riêng,\n    giúp người dùng thể hiện cá tính và phong cách của bản thân.\n  </p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/522/315390/samsung-galaxy-tab-a9-251023-103947.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Thiết kế máy tính bảng - Samsung Galaxy Tab A9+ 5G\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/315390/samsung-galaxy-tab-a9-251023-103947.jpg\"\n        style=\"text-align: justify\"\n        title=\"Thiết kế máy tính bảng - Samsung Galaxy Tab A9+ 5G\"></a>\n  </p>\n  <p style=\"text-align: justify\">\n    Đặc biệt, Galaxy Tab A9+ 5G được trang bị công nghệ Dolby Atmos, mang đến trải\n    nghiệm âm thanh đỉnh cao, sống động và chân thực, chi tiết với âm trầm mạnh mẽ\n    và âm cao rõ ràng. Bạn có thể tận hưởng trọn vẹn từng giai điệu, âm thanh\n    trong các bộ phim, bài hát hoặc trò chơi.\n  </p>\n  <p style=\"text-align: justify\">\n    Không chỉ vậy, Galaxy Tab A9+ 5G còn được trang bị cổng sạc Type-C và cổng tai\n    nghe 3.5 mm. Cổng Type-C giúp bạn sạc nhanh thiết bị, trong khi cổng tai nghe\n    3.5 mm giúp bạn kết nối với các phụ kiện âm thanh một cách dễ dàng. Sự kết hợp\n    này mang đến sự tiện lợi và linh hoạt cho người dùng.\n  </p>\n  <p style=\"text-align: justify\">\n    Galaxy Tab A9+ 5G là phiên bản hỗ trợ gắn SIM, mang đến sự tiện lợi và linh\n    hoạt cho người dùng. Khi không có Wi-Fi, bạn có thể dễ dàng lắp SIM và truy\n    cập internet mọi lúc, mọi nơi. Khả năng kết nối 5G giúp tốc độ truy cập\n    internet nhanh chóng và ổn định, đáp ứng nhu cầu sử dụng của cả công việc và\n    giải trí.\n  </p>\n  <h3 style=\"text-align: justify\">Màn hình lớn, độ phân giải cao</h3>\n  <p style=\"text-align: justify\">\n    Galaxy Tab A9+ 5G sở hữu màn hình TFT LCD với kích thước 11 inch, mang đến\n    trải nghiệm hình ảnh sống động và chân thực. Công nghệ TFT LCD hiển thị màu\n    sắc tự nhiên và sáng rõ, giúp người dùng tận hưởng trọn vẹn từng khoảnh khắc\n    giải trí. Kích thước màn hình lớn cũng mang lại không gian rộng rãi, thoải mái\n    cho việc xem phim, đọc sách hoặc làm việc.\n  </p>\n  <p style=\"text-align: justify\">\n    Màn hình của Galaxy Tab A9+ 5G có độ phân giải cao lên đến 1200 x 1920 pixel,\n    mang đến trải nghiệm hình ảnh mãn nhãn. Độ phân giải cao này giúp tái hiện\n    hình ảnh sắc nét và chi tiết, điều này làm cho việc xem video, xem hình ảnh và\n    làm việc trên máy tính bảng trở nên thú vị và chuyên nghiệp hơn.\n  </p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/522/315390/samsung-galaxy-tab-a9-251023-103949.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Kích thước màn hình - Samsung Galaxy Tab A9+ 5G\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/315390/samsung-galaxy-tab-a9-251023-103949.jpg\"\n        style=\"text-align: justify\"\n        title=\"Kích thước màn hình - Samsung Galaxy Tab A9+ 5G\"></a>\n  </p>\n  <p style=\"text-align: justify\">\n    Ngoài ra, máy cũng được hỗ trợ tần số quét màn hình 90 Hz, giúp mang đến sự\n    mượt mà trong từng cử chỉ vuốt chạm, từ đó làm tăng sự thích thú cho mọi tác\n    vụ mà bạn sử dụng\n  </p>\n  <h3 style=\"text-align: justify\">\n    Trang bị camera 8 MP và hỗ trợ quay video Full HD\n  </h3>\n  <p style=\"text-align: justify\">\n    Galaxy Tab A9+ 5G là một chiếc máy tính bảng Samsung đa năng, không chỉ đáp ứng nhu cầu giải trí mà còn hỗ trợ tốt cho công việc và\n    học tập. Một trong những tính năng nổi bật của máy là khả năng chụp ảnh.\n  </p>\n  <p style=\"text-align: justify\">\n    Camera sau 8 MP của máy có thể chụp rõ ràng và sắc nét các dòng chữ, giúp bạn\n    dễ dàng sao chép hoặc lưu trữ thông tin từ sách, bài giảng hoặc các tài liệu\n    công việc. Với khả năng này, Galaxy Tab A9+ 5G là một lựa chọn lý tưởng cho\n    những người cần một thiết bị có thể đồng hành cùng họ trong công việc và học\n    tập.\n  </p>\n  <p style=\"text-align: justify\">\n    Ngoài ra, camera sau 8 MP của máy cung cấp khả năng quay video Full HD. Điều\n    này cho phép bạn ghi lại các sự kiện và khoảnh khắc quan trọng trong cuộc sống\n    một cách rõ ràng và chân thực. Mặc dù không phải là chất lượng video chuyên\n    nghiệp, nhưng nó đủ để lưu giữ những khoảnh khắc đáng nhớ và sáng tạo ra nội\n    dung video cá nhân.\n  </p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/522/315390/samsung-galaxy-tab-a9-251023-103951.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Camera máy tính bảng - Samsung Galaxy Tab A9+ 5G\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/315390/samsung-galaxy-tab-a9-251023-103951.jpg\"\n        style=\"text-align: justify\"\n        title=\"Camera máy tính bảng - Samsung Galaxy Tab A9+ 5G\"></a>\n  </p>\n  <p style=\"text-align: justify\">\n    Camera trước 5 MP của máy có khả năng chụp ảnh rõ ràng và tương đối sáng đi\n    cùng với đó là một vài tính năng khá nổi bật như: Làm đẹp, chụp đêm, HDR,..\n    cho phép bạn tự tin thể hiện bản thân trong các cuộc gọi video, họp trực tuyến\n    hoặc chia sẻ những khoảnh khắc đời thường lên mạng xã hội.\n  </p>\n  <h3 style=\"text-align: justify\">Sử dụng chip Snapdragon 695</h3>\n  <p style=\"text-align: justify\">\n    Galaxy Tab A9+ 5G nổi bật với chip Snapdragon 695, một con chip mạnh mẽ trong\n    phân khúc giúp máy tính bảng &nbsp;hoạt động hiệu quả và trơn tru. Chip được thiết kế để đáp ứng tốt nhu\n    cầu của người dùng, từ các tác vụ cơ bản như lướt web, soạn thảo văn bản đến\n    các tác vụ phức tạp hơn như chơi game, chỉnh sửa video ngắn.\n  </p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/522/315390/samsung-galaxy-tab-a9-251023-103952.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Hiệu năng máy tính bảng - Samsung Galaxy Tab A9+ 5G\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/315390/samsung-galaxy-tab-a9-251023-103952.jpg\"\n        style=\"text-align: justify\"\n        title=\"Hiệu năng máy tính bảng - Samsung Galaxy Tab A9+ 5G\"></a>\n  </p>\n  <p style=\"text-align: justify\">\n    Galaxy Tab A9+ 5G sở hữu RAM 4 GB, một mức dung lượng vừa đủ cho các tác vụ cơ\n    bản như lướt web, soạn thảo văn bản, xem video. Tuy nhiên, khi mở nhiều ứng\n    dụng cùng lúc hoặc có nhiều ứng dụng chạy ngầm, máy có thể bị chậm lại. Để cải\n    thiện hiệu năng, người dùng nên hạn chế mở nhiều ứng dụng không cần thiết và\n    tắt hoàn toàn các ứng dụng khi không sử dụng.\n  </p>\n  <p style=\"text-align: justify\">\n    Về khả năng lưu trữ, Galaxy Tab A9+ 5G được trang bị 64 GB bộ nhớ trong, đủ để\n    lưu trữ hàng trăm ảnh, video và tệp tin. Ngoài ra, máy còn hỗ trợ mở rộng bộ\n    nhớ lên đến 1 TB qua thẻ Micro SD, giúp người dùng có thể lưu trữ thoải mái mà\n    không lo thiếu không gian.\n  </p>\n  <h3 style=\"text-align: justify\">Trang bị viên pin có dung lượng 7040 mAh</h3>\n  <p style=\"text-align: justify\">\n    Galaxy Tab A9+ 5G nổi bật với viên pin khủng 7040 mAh, giúp máy tính bảng hoạt\n    động bền bỉ cả ngày dài. Với dung lượng này, bạn có thể thoải mái sử dụng máy\n    tính bảng cho các tác vụ cơ bản như duyệt web, xem video, nghe nhạc, thậm chí\n    là chơi game nhẹ mà không lo hết pin sớm.\n  </p>\n  <p style=\"text-align: justify\">\n    Một điểm trừ của Galaxy Tab A9+ 5G là công suất sạc chỉ hỗ trợ 15 W. Điều này\n    khiến thời gian sạc đầy viên pin 7040 mAh khá lâu. Do đó, nếu bạn muốn sử dụng\n    máy tính bảng ngay sau khi sạc, bạn cần phải kiên nhẫn. Tuy nhiên, nếu bạn\n    quản lý thời gian sạc hợp lý, bạn vẫn có thể sử dụng máy tính bảng suốt cả\n    ngày mà không gặp vấn đề gì.\n  </p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/522/315390/samsung-galaxy-tab-a9-251023-103954.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Pin trên máy tính bảng - Samsung Galaxy Tab A9+ 5G\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/315390/samsung-galaxy-tab-a9-251023-103954.jpg\"\n        style=\"text-align: justify\"\n        title=\"Pin trên máy tính bảng - Samsung Galaxy Tab A9+ 5G\"></a>\n  </p>\n  <p style=\"text-align: justify\">\n    Tổng kết, đây là một chiếc máy tính bảng Galaxy Tab dòng A\n    đáng cân nhắc cho những người dùng đang tìm kiếm một thiết bị giải trí gia\n    đình. Với màn hình lớn, thời lượng pin dài và giá cả phải chăng, Galaxy Tab\n    A9+ 5G có thể đáp ứng tốt nhu cầu của mọi thành viên trong gia đình từ phụ\n    huynh lớn tuổi cho đến con trẻ.\n  </p>\n   ', 12, 500, 1),
(49, 6, 'Xiaomi Redmi Pad SE 4GB', 8, 'P49_avt.jpg', 4.5, '\n<h3>Xiaomi Redmi Pad SE 4GB\n    nổi bật trong dòng máy tính bảng tầm trung với thiết kế tinh tế, pin lớn và\n    hiệu năng ấn tượng. Máy sở hữu một loạt tính năng nổi bật, làm cho nó trở\n    thành một lựa chọn hoàn hảo cho cả giải trí, công việc và học tập.\n  </h3>\n  <h3>Thiết kế thanh mảnh sang trọng</h3>\n  <p>\n    Xiaomi Redmi Pad SE nổi bật với thiết kế vuông vắn nhờ mặt lưng cùng bộ khung\n    được làm theo kiểu phẳng. Sự kết hợp này mang lại cho máy một vẻ ngoại hình\n    thời thượng và sang trọng. Thiết kế mỏng nhẹ cùng với sự tinh tế và thanh lịch\n    đã làm nên một chiếc máy tính bảng vượt trội về thẩm mỹ.\n  </p>\n  <p>\n    Mặt lưng và bộ khung của Xiaomi Redmi Pad SE được chế tạo liền mạch với nhau,\n    sử dụng chất liệu kim loại cao cấp. Điều này không chỉ tạo ra sự hài hòa tinh\n    tế trong thiết kế mà còn giúp máy trở nên cứng cáp và bền bỉ hơn. Khả năng kết\n    hợp chất liệu kim loại và thiết kế liền mạch mang đến một ngoại hình đẳng cấp,\n    làm cho Xiaomi Redmi Pad SE nổi bật giữa các máy tính bảng khác trong cùng\n    phân khúc.\n  </p>\n  <p>\n    Mặt lưng của Xiaomi Redmi Pad SE được hoàn thiện theo kiểu nhám, tạo ra một\n    cảm giác độc đáo và hấp dẫn ngay từ cái nhìn đầu tiên. Sự kết hợp giữa thẩm mỹ\n    và tính năng làm cho mặt lưng này trở thành một trong những điểm đặc biệt nổi\n    bật của sản phẩm.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/522/310029/xiaomi-redmi-pad-se-6.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Vẻ ngoài đẹp mắt - Xiaomi Redmi Pad SE\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/310029/xiaomi-redmi-pad-se-6.jpg\"\n        style=\"text-align: justify\"\n        title=\"Vẻ ngoài đẹp mắt - Xiaomi Redmi Pad SE\"></a>\n  </p>\n  <p>\n    Không chỉ là một yếu tố thẩm mỹ, hoàn thiện mặt lưng nhám còn mang lại nhiều\n    lợi ích trong việc sử dụng máy. Cách làm này tạo ra một bề mặt chống trượt,\n    giúp bạn cầm máy vững chắc và tránh nguy cơ rơi rớt. Nó cũng giúp máy dễ dàng\n    lau sạch và chống lại vết bẩn như mồ hôi và dấu vân tay, giữ cho sản phẩm luôn\n    giữ được vẻ và bền bỉ theo thời gian.\n  </p>\n  <p>\n    Một trong những điểm đặc biệt của máy tính bảng Xiaomi Redmi Pad SE là khối\n    lượng của nó. Với 478 gram, sản phẩm này thực sự là một lựa chọn tuyệt vời cho\n    người dùng có nhu cầu sử dụng máy trong thời gian dài.\n  </p>\n  <p>\n    Sự nhẹ nhàng của máy&nbsp;tính bảng mang lại một trải nghiệm cầm nắm nhẹ nhàng\n    và thuận tiện trong việc di chuyển. Bạn có thể thỏa sức duyệt web, xem phim\n    hoặc làm việc trong thời gian dài mà ít khi cảm thấy mệt mỏi. Đây thực sự là\n    một lợi thế đặc biệt khi bạn cần di chuyển nhiều và muốnmáy tính bảng\n    luôn sẵn sàng để phục vụ mọi nhu cầu của bạn.\n  </p>\n  <p>\n    Xiaomi Redmi Pad SE trang bị hệ thống 4 loa đa hướng giúp tạo ra một không\n    gian âm thanh bao quát. Với bốn loa đặt ở các góc khác nhau của máy&nbsp;tính\n    bảng, bạn sẽ có cảm giác như mình được bao quanh bởi âm thanh sống động và\n    mạnh mẽ. Điều này không chỉ làm cho việc xem phim và nghe nhạc trở nên thú vị\n    hơn mà còn mang đến trải nghiệm chơi game ấn tượng.\n  </p>\n  <p>\n    Xiaomi không ngừng tối ưu hóa trải nghiệm âm thanh trên máy&nbsp;tính bảng của\n    họ và Redmi Pad SE không phải là ngoại lệ. Sản phẩm này tích hợp công nghệ âm\n    thanh Dolby Atmos, giúp tạo ra âm thanh chất lượng cao với hiệu ứng âm thanh\n    3D sống động. Bạn sẽ cảm nhận được âm thanh xung quanh bạn, từ tiếng rơi từ\n    trên cao đến tiếng bước chân từ phía sau, tạo nên trải nghiệm giải trí thực sự\n    tuyệt vời.\n  </p>\n  <p>\n    Máy&nbsp;tính bảng này cũng hỗ trợ Hi-Res Audio, giúp tái tạo âm thanh chất\n    lượng cao, rõ ràng và sắc nét. Những chi tiết âm thanh mịn màng và không bị\n    méo mó giúp bạn nghe nhạc hoặc xem phim một cách chân thực hơn bao giờ\n    hết.&nbsp;\n  </p>\n  <h3>Màn hình IPS LCD kích thước lớn</h3>\n  <p>\n    Với tấm nền IPS LCD, màn hình của Xiaomi Redmi Pad SE tái hiện nội dung với\n    màu sắc chân thực và góc nhìn rộng, đảm bảo rằng bạn sẽ thấy mọi chi tiết với\n    độ tương phản tốt và màu sắc tự nhiên. Tuy nhiên, so với công nghệ màn hình\n    AMOLED, màu sắc trên màn hình này có thể không thực sự tươi lắm và màu đen\n    không được tái hiện sâu.\n  </p>\n  <p>\n    Độ phân giải 1200 x 1920 Pixels cho phép màn hình hiển thị mọi loại nội dung\n    một cách rõ ràng và sắc nét, có lợi cho việc xem video trực tuyến trên các ứng\n    dụng như YouTube và Netflix bởi máy cho phép bạn tận hưởng chất lượng hình ảnh\n    cao hơn.&nbsp;\n  </p>\n  <p>\n    Màn hình kích thước 11 inch trên Xiaomi Redmi Pad SE là một phần quan trọng\n    đóng vai trò trong việc tạo ra trải nghiệm sử dụng đa dạng và thoải mái trên\n    máy&nbsp;tính bảng này.\n  </p>\n  <p>\n    Kích thước màn hình 11 inch đủ lớn để hiển thị đầy đủ mọi loại nội dung. Điều\n    này có nghĩa rằng bạn sẽ không cảm thấy bị hạn chế trong việc xem video, đọc\n    sách, duyệt web hoặc làm việc trên máy tính bảng. Hình ảnh và văn bản được\n    hiển thị rõ ràng và dễ đọc, tạo nên một trải nghiệm thú vị và tiện ích.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/522/310029/xiaomi-redmi-pad-se-1.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Màn hình sắc nét - Xiaomi Redmi Pad SE\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/310029/xiaomi-redmi-pad-se-1.jpg\"\n        style=\"text-align: justify\"\n        title=\"Màn hình sắc nét - Xiaomi Redmi Pad SE\"></a>\n  </p>\n  <p>\n    Màn hình 11 inch không chỉ cho phép hiển thị nhiều nội dung hơn mà còn tạo ra\n    một không gian làm việc lớn, đặc biệt hữu ích cho người dùng cần làm các công\n    việc chỉnh sửa hình ảnh, thiết kế đồ họa hoặc thậm chí làm việc nhóm từ xa qua\n    các phần mềm như Figma. Bạn có đủ không gian để tổ chức các ứng dụng và cửa sổ\n    làm việc một cách thoải mái, giúp tăng hiệu suất và sự tiện lợi.\n  </p>\n  <p>\n    Tần số quét cao 90 Hz trên màn hình làm cho hiển thị trở nên tối ưu hơn, giúp\n    giảm hiện tượng nhấp nháy và mờ nhạt trong các tình huống đòi hỏi chuyển động\n    nhanh. Điều này làm cho Xiaomi Redmi Pad SE trở nên hoàn hảo cho việc chơi\n    game, xem video thể thao hoặc làm bất kỳ việc nào đòi hỏi sự mượt mà và sắc\n    nét trong chuyển động.\n  </p>\n  <p>\n    Ngoài ra, tần số quét 90 Hz còn giúp làm giảm mệt mỏi của mắt khi bạn sử dụng\n    máy trong thời gian dài. Công nghệ này giúp giảm hiện tượng màn hình nhấp nháy\n    và giúp mắt bạn không bị căng thẳng trong quá trình sử dụng máy vào ban đêm.\n  </p>\n  <p>\n    Chiếc&nbsp;máy tính bảng Xiaomi &nbsp;này&nbsp;đã đạt được chứng nhận giảm ánh sáng xanh từ TUV Rheinland,\n    cho phép máy bảo vệ mắt tối ưu, giúp giảm thiểu tác động từ ánh sáng xanh khi\n    bạn sử dụng máy vào ban đêm, đảm bảo rằng bạn có một trải nghiệm làm việc hoặc\n    giải trí thoải mái và giảm áp lực gây cho đôi mắt của mình.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/522/310029/xiaomi-redmi-pad-se-2.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Ổn định với mọi tác vụ - Xiaomi Redmi Pad SE\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/310029/xiaomi-redmi-pad-se-2.jpg\"\n        style=\"text-align: justify\"\n        title=\"Ổn định với mọi tác vụ - Xiaomi Redmi Pad SE\"></a>\n  </p>\n  <h3>Trang bị đầy đủ camera trước và sau</h3>\n  <p>\n    Camera sau 8 MP trên Xiaomi Redmi Pad SE là một công cụ đáng tin cậy để bạn\n    nắm bắt các khoảnh khắc quan trọng. Với khả năng chụp ảnh có độ chi tiết tương\n    đối tốt, từ đó nạn có thể lưu giữ những hình ảnh phong cảnh đẹp, ghi lại thông\n    tin hữu ích cho công việc hoặc học tập và chia sẻ những kí ức đáng nhớ.\n  </p>\n  <p>\n    Camera sau cũng hỗ trợ quay video Full HD, giúp bạn ghi lại các sự kiện và\n    khoảnh khắc trong cuộc sống với độ chi tiết tương đối tốt. Điều này làm cho\n    máy&nbsp;tính bảng này trở thành một công cụ hữu ích cho việc quay video tạo\n    nội dung, ghi chép hội họp hoặc học tập từ xa.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/522/310029/xiaomi-redmi-pad-se-5.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Hỗ trợ quay chụp cơ bản - Xiaomi Redmi Pad SE\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/310029/xiaomi-redmi-pad-se-5.jpg\"\n        style=\"text-align: justify\"\n        title=\"Hỗ trợ quay chụp cơ bản - Xiaomi Redmi Pad SE\"></a>\n  </p>\n  <p>\n    Camera trước 5 MP trên Xiaomi Redmi Pad SE đáp ứng tốt nhu cầu gọi video và\n    selfie. Bạn có thể thực hiện cuộc gọi video với chất lượng nằm ở mức khá, giúp\n    selfie hay tham gia hội họp online một cách thuận lợi mà ít khi gặp khó khăn\n    về hình ảnh.\n  </p>\n  <h3>Sử dụng chipset đến từ Qualcomm</h3>\n  <p>\n    Chipset Snapdragon 680 của Qualcomm là một thành phần chính giúp máy&nbsp;tính\n    bảng Xiaomi Redmi Pad SE đạt được sự ổn định trong hiệu năng và hiệu quả về\n    tiết kiệm năng lượng. Chip này vừa có giá thành tương tối thấp nhưng vẫn đem\n    đến hiệu suất tốt để đáp ứng nhiều nhu cầu một cách mượt mà.\n  </p>\n  <p>\n    Snapdragon 680 được thiết kế với 8 nhân xử lý, bao gồm cả nhân Cortex-A77 và\n    Cortex-A55, tạo nên sự cân nhắc hoàn hảo giữa hiệu suất và tiết kiệm năng\n    lượng. Những nhân mạnh mẽ này cung cấp khả năng xử lý ổn định cho các tác vụ\n    đa nhiệm, xử lý ứng dụng nhanh chóng và đáng tin cậy trong khi bạn duyệt web,\n    xem video hoặc thậm chí chơi game nhẹ.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/522/310029/xiaomi-redmi-pad-se-4.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Hiệu năng ổn định - Xiaomi Redmi Pad SE\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/310029/xiaomi-redmi-pad-se-4.jpg\"\n        style=\"text-align: justify\"\n        title=\"Hiệu năng ổn định - Xiaomi Redmi Pad SE\"></a>\n  </p>\n  <p>\n    Snapdragon 680 cũng được tối ưu hóa để tiết kiệm năng lượng một cách hiệu quả.\n    Điều này có nghĩa rằng bạn có thể sử dụng máy trong thời gian dài mà không cần\n    lo lắng về việc sạc pin. Công nghệ tiết kiệm năng lượng của Qualcomm giúp kéo\n    dài thời gian sử dụng máy và giảm thiểu tiêu thụ pin của các phần mềm chạy\n    ngầm khi máy không hoạt động.\n  </p>\n  <p>\n    Đây là một mẫu máy tính bảng RAM 4 GB, một mức RAM tương đối khá hạn chế so với một số sản phẩm khác trên thị\n    trường. Mặc dù vậy, RAM này vẫn đủ để đa nhiệm một cách mượt mà cho một vài\n    ứng dụng cùng lúc. Tuy nhiên, để đảm bảo hiệu suất ổn định hơn và tránh tình\n    trạng giật lag, người dùng nên thường xuyên đóng các ứng dụng không cần thiết\n    để tạo không gian trống cho bộ nhớ đệm giúp máy vận hành tốt hơn.\n  </p>\n  <h3>Tích hợp viên pin lớn với 8000 mAh</h3>\n  <p>\n    Với pin 8000 mAh, Xiaomi Redmi Pad SE có thể hoạt động liên tục trong nhiều\n    giờ, thậm chí cả ngày dài mà không cần phải sạc lại, rất hữu ích khi bạn đang\n    trong các cuộc họp quan trọng, dự án sáng tạo hoặc thậm chí trong những chuyến\n    du lịch dài hạn. Pin lớn này giúp bạn tập trung vào công việc hoặc giải trí\n    thay vì lo lắng về việc sạc pin liên tục.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/522/310029/xiaomi-redmi-pad-se-6.png\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Viên pin lớn - Xiaomi Pad SE 6GB\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/310029/xiaomi-redmi-pad-se-6.png\"\n        style=\"text-align: justify\"\n        title=\"Viên pin lớn - Xiaomi Pad SE 6GB\"></a>\n  </p>\n  <p>\n    Tuy nhiên, một điểm hạn chế của chiếc&nbsp; máy tính bảng pin khủng&nbsp;này&nbsp;là tốc độ sạc khá chậm với công suất chỉ 10 W, có nghĩa rằng\n    để sạc đầy pin 8000 mAh, bạn sẽ cần một thời gian khá dài. Để tối ưu hóa thời\n    gian, người dùng thường nên sạc máy vào đêm, tức là sau khi sử dụng trong ngày\n    và trước khi đi ngủ, giúp bạn tiết kiệm thời gian và đảm bảo rằng máy luôn sẵn\n    sàng cho ngày tiếp theo.\n  </p>\n  <p>\n    Nhờ sự kết hợp giữa hiệu suất ổn định và tiết kiệm năng lượng của Snapdragon\n    680, Xiaomi Redmi Pad SE là một máy&nbsp;tính bảng đa năng có khả năng xử lý\n    mượt mà và duyệt web nhanh chóng, đồng thời cung cấp thời gian sử dụng cực kỳ\n    dài lâu. Thực sự là một lựa chọn phù hợp cho nhu cầu giải trí hay công việc ở\n    mức cơ bản.\n  </p>\n   ', 18, 2400, 1),
(50, 6, 'iPad Pro M2 12.9 inch WiFi 512GB', 38, 'P50_avt.jpg', 3.7, '\n<h3 style=\"text-align: justify\">\n    iPad Pro M2 12.9 inch WiFi 512GB\n      là cái tên được mong đợi nhất năm 2022 đối với thị trường máy tính bảng trên\n      toàn cầu, máy được trang bị con chip Apple M2 mạnh mẽ, có hiệu năng tiệm cận\n      so với những dòng laptop cao cấp, điều này giúp cho máy có thể xử lý công việc\n      một cách nhanh chóng cũng như mang đến trải nghiệm mượt mà trong lúc chơi game\n      đồ họa cao.\n    </h3>\n    <h3 style=\"text-align: justify\">Tỏa sáng với diện mạo hợp xu hướng</h3>\n    <p style=\"text-align: justify\">\n      Qua vẻ bề ngoài thì gần như iPad Pro M2 không có sự khác biệt nào đối với thế\n      hệ trước đó, vẫn sẽ là kiểu tạo hình vuông vức truyền thống đi kèm mặt lưng và\n      bộ khung được làm liền mạch với nhau, điều này đem đến cái nhìn nguyên khối\n      sang trọng cũng như gia tăng được độ bền bỉ cho thiết bị.\n    </p>\n    <p style=\"text-align: justify\">\n      Điểm ấn tượng nhất về phần thiết kế mà hầu hết mọi người dùng đều cảm nhận\n      được ngay từ lần đầu tiên là về độ mỏng của máy, với kích thước chỉ khoảng 6.4\n      mm nên máy tính bảng &nbsp;toát lên được vẻ ngoài thanh mảnh - tinh tế và cực kỳ sang trọng.\n    </p>\n    <p style=\"text-align: justify\">\n      <a\n        class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/522/295464/ipad-pro-m2-129-wifi-512gb-271022-105918.jpg\"\n        onclick=\"return false;\"\n        ><img\n          alt=\"Diện mạo thời thượng - iPad Pro M2 12.9 inch WiFi 512GB\"\n          src=\"https://cdn.tgdd.vn/Products/Images/522/295464/ipad-pro-m2-129-wifi-512gb-271022-105918.jpg\"\n          title=\"Diện mạo thời thượng - iPad Pro M2 12.9 inch WiFi 512GB\"></a>\n    </p>\n    <h3 style=\"text-align: justify\">Hiệu năng bức phá mọi giới hạn</h3>\n    <p style=\"text-align: justify\">\n      iPad Pro M2 đã hoàn toàn phá vỡ được giới hạn về hiệu năng trên tablet khi bên\n      trong máy là con chip cao cấp từng có mặt trên laptop, đây chính là điểm vượt\n      trội mà dường như chưa có bất kỳ nhà sản xuất thiết bị tablet nào làm được\n      ngoài ông trùm Apple.\n    </p>\n    <p style=\"text-align: justify\">\n      <a\n        class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/522/295464/ipad-pro-m2-129-wifi-512gb-271022-105920.jpg\"\n        onclick=\"return false;\"\n        ><img\n          alt=\"Hiệu năng mạnh mẽ - iPad Pro M2 12.9 inch WiFi 512GB\"\n          src=\"https://cdn.tgdd.vn/Products/Images/522/295464/ipad-pro-m2-129-wifi-512gb-271022-105920.jpg\"\n          title=\"Hiệu năng mạnh mẽ - iPad Pro M2 12.9 inch WiFi 512GB\"></a>\n    </p>\n    <p style=\"text-align: justify\">\n      Apple M2 trên thế hệ máy tính bảng năm nay vẫn sẽ giữ nguyên số lõi cơ bản và\n      không bị cắt giảm như Apple M1 trước đó. Máy hoạt động với 8 lõi CPU và 10 lõi\n      GPU, sức mạnh của chip được ghi nhận là khá lớn khi M2 có hiệu năng nhanh hơn\n      15% và tốc độ xử lý đồ họa tốt hơn 35% đối với M1.\n    </p>\n    <p style=\"text-align: justify\">\n      <a\n        class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/522/295464/ipad-pro-m2-129-wifi-512gb-271022-105921.jpg\"\n        onclick=\"return false;\"\n        ><img\n          alt=\"Hiệu năng mạnh mẽ - iPad Pro M2 12.9 inch WiFi 512GB\"\n          src=\"https://cdn.tgdd.vn/Products/Images/522/295464/ipad-pro-m2-129-wifi-512gb-271022-105921.jpg\"\n          title=\"Hiệu năng mạnh mẽ - iPad Pro M2 12.9 inch WiFi 512GB\"></a>\n    </p>\n    <p style=\"text-align: justify\">\n      Bên cạnh đó thì đây còn là máy tính bảng RAM 8 GB, được chạy trên hệ điều hành iPadOS 16 nhiều tính năng. Điều này mang lại\n      cho thiết bị một khả năng xử lý đa nhiệm tốt cũng như cân bằng được phần cứng\n      và phần mềm hiệu quả hơn.\n    </p>\n    <p style=\"text-align: justify\">\n      <a\n        class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/522/295464/ipad-pro-m2-129-wifi-512gb-271022-105925.jpg\"\n        onclick=\"return false;\"\n        ><img\n          alt=\"Hiệu năng mạnh mẽ - iPad Pro M2 12.9 inch WiFi 512GB\"\n          src=\"https://cdn.tgdd.vn/Products/Images/522/295464/ipad-pro-m2-129-wifi-512gb-271022-105925.jpg\"\n          title=\"Hiệu năng mạnh mẽ - iPad Pro M2 12.9 inch WiFi 512GB\"></a>\n    </p>\n    <p style=\"text-align: justify\">\n      Nhờ có hiệu năng cao như vậy nên các công việc như chỉnh sửa video, thiết kế\n      hình ảnh hay dựng các mô hình AR và 3D cũng sẽ trở nên dễ dàng hơn. Nếu như\n      các ứng dụng bạn thường dùng trên laptop có hỗ trợ tablet thì iPad Pro M2 sẽ\n      là sản phẩm rất đáng mua dành cho bạn, vừa có thể hỗ trợ quay chụp cùng thân\n      hình thanh mảnh giúp cho máy có thể đồng hành bạn đi đến bất kỳ đâu một cách\n      tiện lợi.\n    </p>\n    <p style=\"text-align: justify\">\n      <a\n        class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/522/295464/ipad-pro-m2-129-wifi-512gb-271022-105923.jpg\"\n        onclick=\"return false;\"\n        ><img\n          alt=\"Xử lý công việc hiệu quả - iPad Pro M2 12.9 inch WiFi 512GB\"\n          src=\"https://cdn.tgdd.vn/Products/Images/522/295464/ipad-pro-m2-129-wifi-512gb-271022-105923.jpg\"\n          title=\"Xử lý công việc hiệu quả - iPad Pro M2 12.9 inch WiFi 512GB\"></a>\n    </p>\n    <h3 style=\"text-align: justify\">Trải nghiệm hình ảnh một cách sống động</h3>\n    <p style=\"text-align: justify\">\n      Máy tính bảng iPad\n      sở hữu màn hình có kích thước 12.9 inch cùng tấm nền Liquid Retina XDR\n      mini-LED LCD. Điều này giúp cho iPad Pro M2 trở thành thiết bị lý tưởng dành\n      cho những nhà sáng tạo nội dung thiên về khối ngành thiết kế - đồ họa nhờ\n      không gian thao tác rộng rãi, độ chuẩn xác về màu cao để hạn chế tình trạng\n      sai lệch màu sắc sau khi in ấn.\n    </p>\n    <p style=\"text-align: justify\">\n      <a\n        class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/522/295464/ipad-pro-m2-129-wifi-512gb-271022-105926.jpg\"\n        onclick=\"return false;\"\n        ><img\n          alt=\"Độ chính xác màu sắc cao - iPad Pro M2 12.9 inch WiFi 512GB\"\n          src=\"https://cdn.tgdd.vn/Products/Images/522/295464/ipad-pro-m2-129-wifi-512gb-271022-105926.jpg\"\n          title=\"Độ chính xác màu sắc cao - iPad Pro M2 12.9 inch WiFi 512GB\"></a>\n    </p>\n    <p style=\"text-align: justify\">\n      Ngoài ra Apple còn hỗ trợ cho màn hình tần số quét 120 Hz và nhà Táo gọi đây\n      là công nghệ ProMotion của riêng hãng, nó giúp mang lại sự nhanh chóng trong\n      việc phản hồi thông tin mỗi khi bạn vuốt chạm. Ngoài ra công nghệ này còn\n      tương thích với Apple Pencil 2 tốt hơn để tạo cho người dùng cảm giác sử dụng\n      chân thật như đang viết trên giấy.\n    </p>\n    <p style=\"text-align: justify\">\n      <a\n        class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/522/295464/ipad-pro-m2-129-wifi-512gb-271022-105941.jpg\"\n        onclick=\"return false;\"\n        ><img\n          alt=\"Tương thích với Apple Pencil 2 - iPad Pro M2 12.9 inch WiFi 512GB\"\n          src=\"https://cdn.tgdd.vn/Products/Images/522/295464/ipad-pro-m2-129-wifi-512gb-271022-105941.jpg\"\n          title=\"Tương thích với Apple Pencil 2 - iPad Pro M2 12.9 inch WiFi 512GB\"></a>\n    </p>\n    <h3 style=\"text-align: justify\">Hỗ trợ quay phim chất lượng cao</h3>\n    <p style=\"text-align: justify\">\n      Mặt lưng của tablet sẽ được trang bị 2 camera trong đó cảm biến chính có độ\n      phân giải 12 MP cùng camera góc siêu rộng 10 MP. Để có thể thu lại bức hình có\n      màu sắc chân thực hơn thì hãng cũng đã hỗ trợ cho iPad công nghệ Smart HDR 4\n      và bộ lọc màu, nhằm giúp người dùng có thể tự tùy chỉnh chất lượng ảnh sao cho\n      ưng ý nhất.\n    </p>\n    <p style=\"text-align: justify\">\n      <a\n        class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/522/295464/ipad-pro-m2-129-wifi-512gb-271022-105933.jpg\"\n        onclick=\"return false;\"\n        ><img\n          alt=\"Camera chất lượng - iPad Pro M2 12.9 inch WiFi 512GB\"\n          src=\"https://cdn.tgdd.vn/Products/Images/522/295464/ipad-pro-m2-129-wifi-512gb-271022-105933.jpg\"\n          title=\"Camera chất lượng - iPad Pro M2 12.9 inch WiFi 512GB\"></a>\n    </p>\n    <p style=\"text-align: justify\">\n      Bên cạnh đó thì máy cũng có thể thu lại những thước phim chất lượng cao nhờ\n      chuẩn video tối đa được hỗ trợ là 4K - tốc độ khung hình 60, kèm theo đó là\n      công nghệ chống rung OIS tiên tiến với khả năng hạn chế rung lắc khi quay phim\n      ở những trường hợp đòi hỏi phải thường xuyên di chuyển.\n    </p>\n    <p style=\"text-align: justify\">\n      <a\n        class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/522/295464/ipad-pro-m2-129-wifi-512gb-271022-105935.jpg\"\n        onclick=\"return false;\"\n        ><img\n          alt=\"Hỗ trợ quay video chuẩn chuyên nghiệp - iPad Pro M2 12.9 inch WiFi 512GB\"\n          src=\"https://cdn.tgdd.vn/Products/Images/522/295464/ipad-pro-m2-129-wifi-512gb-271022-105935.jpg\"\n          title=\"Hỗ trợ quay video chuẩn chuyên nghiệp - iPad Pro M2 12.9 inch WiFi 512GB\"></a>\n    </p>\n    <p style=\"text-align: justify\">\n      Có thể thấy\n      máy tính bảng iPad Pro M2\n      là sản phẩm rất đáng để đầu tư cho công việc hay nâng cấp trải nghiệm thường\n      ngày của bạn, với những tính năng cao cấp cùng bộ thông số xịn sò như trên,\n      đây hoàn toàn là thiết bị có chất lượng tương xứng với giá tiền bạn phải bỏ\n      ra.\n    </p>\n     ', 12, 2500, 1),
(51, 6, 'Lenovo Tab M10 (Gen 3) 3GB/32GB', 33, 'P51_avt.jpg', 4.3, '\n<h3 style=\"text-align: justify\"> Lenovo Tab M10 (Gen 3) 3GB/32GB &nbsp;mẫu máy tính bảng sở hữu cấu hình ổn, thiết kế cao cấp trong tầm giá\n    phù hợp với các nhu cầu cơ bản như đọc báo, xem phim, phục vụ học tập và làm\n    việc online.\n  </h3>\n  <h3 style=\"text-align: justify\">Vẻ ngoài thanh lịch, tinh tế</h3>\n  <p style=\"text-align: justify\"> Lenovo &nbsp;mang đến người dùng một thiết kế cao cấp nhờ mặt lưng được làm từ nhựa\n    và kim loại nguyên khối làm tăng độ sang trọng cũng như cầm nắm rất thoải mái.\n  </p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/522/285039/lenovo-tab-m10-gen-3-270722-052645.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Thiết kế tinh tế - Lenovo Tab M10 Gen3\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/285039/lenovo-tab-m10-gen-3-270722-052645.jpg\"\n        title=\"Thiết kế tinh tế - Lenovo Tab M10 Gen3\"></a>\n  </p>\n  <p style=\"text-align: justify\">\n    Màn hình kích thước 10.1 inch các cạnh viền được làm khá mỏng cho không gian\n    hiển thị lớn giúp bạn xem được nhiều thông tin mà nhưng vẫn cho trải nghiệm\n    cầm nắm nhẹ nhàng, dễ dàng thao tác.\n  </p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/522/285039/lenovo-tab-m10-gen-3-250722-093253.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Màn hình hiển thị chi tiết - Lenovo Tab M10 Gen3\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/285039/lenovo-tab-m10-gen-3-250722-093253.jpg\"\n        title=\"Màn hình hiển thị chi tiết - Lenovo Tab M10 Gen3\"></a>\n  </p>\n  <p style=\"text-align: justify\">\n    M10 Gen 3 được trang bị công nghệ màn hình IPS LCD với độ phân giải 1200 x\n    1920 Pixels mang đến chất lượng hiển thị tốt, mặc dù không quá xuất sắc nhưng\n    đủ dùng cho các nhu cầu cơ bản hằng ngày.\n  </p>\n  <p style=\"text-align: justify\">\n    Máy sở hữu cho mình bộ đôi loa kép đi cùng với công nghệ âm thanh Dolby Atmos,\n    giúp trải nghiệm xem phim, nghe nhạc trên máy tính bảng thêm sống động, tuyệt\n    vời.&nbsp;\n  </p>\n  <h3 style=\"text-align: justify\">Hiệu năng mượt mà với các tác vụ cơ bản</h3>\n  <p style=\"text-align: justify\">\n    Lenovo Tab M10 sử dụng vi xử lý Unisoc T610 với tốc độ tối đa là 1.8\n    GHz.&nbsp;Máy tính bảng có RAM 3 GB&nbsp;có thể đáp ứng đủ nhu cầu cơ bản, từ lướt web, xem phim và chơi những\n    tựa game đơn giản.\n  </p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/522/285039/lenovo-tab-m10-gen-3-270722-053430.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Hiệu năng ổn định - Lenovo Tab M10 Gen3\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/285039/lenovo-tab-m10-gen-3-270722-053430.jpg\"\n        title=\"Hiệu năng ổn định - Lenovo Tab M10 Gen3\"></a>\n  </p>\n  <p style=\"text-align: justify\">\n    Ngoài ra,&nbsp;máy tính bảng&nbsp;còn được hỗ trợ sim 4G tốc độ cao, tích hợp nhiều tính năng thông minh,\n    biến máy tính bảng trở thành một chiếc điện thoại có màn hình lớn giúp cho bạn\n    có thể dễ dàng trao đổi dữ liệu, thông tin hơn.\n  </p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/522/285039/lenovo-tab-m10-gen-3-270722-054118.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Hỗ trợ nghe gọi - Lenovo Tab M10 Gen3\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/285039/lenovo-tab-m10-gen-3-270722-054118.jpg\"\n        title=\"Hỗ trợ nghe gọi - Lenovo Tab M10 Gen3\"></a>\n  </p>\n  <p style=\"text-align: justify\">\n    Lenovo Tab được trang bị viên pin Li-Po rất thông dụng, năng lượng tràn đầy\n    5000 mAh. Vì thế, viên pin cung cấp nguồn hoạt động xuyên suốt cho máy cả ngày\n    dài mà không gặp bất kỳ khó khăn nào.\n  </p>\n  <h3 style=\"text-align: justify\">Hệ thống camera chất lượng</h3>\n  <p style=\"text-align: justify\">\n    Lenovo Tab M10 được trang bị bộ đôi camera trước và sau với độ phân giải lần\n    lượt là 5 MP và 8 MP. Mặc dù không quá xuất sắc nhưng vẫn đủ dùng cho các nhu\n    cầu cơ bản như họp, học online.\n  </p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/522/285039/lenovo-tab-m10-gen-3-270722-054247.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Camera hỗ trợ HDR - Lenovo Tab M10 Gen3\"\n        src=\"https://cdn.tgdd.vn/Products/Images/522/285039/lenovo-tab-m10-gen-3-270722-054247.jpg\"\n        title=\"Camera hỗ trợ HDR - Lenovo Tab M10 Gen3\"></a>\n  </p>\n  <p style=\"text-align: justify\">\n    Với cấu hình và các tính năng kể trên Lenovo Tab M10 Gen 3 là chiếc máy hoàn\n    toàn phù hợp với với những gia đình có các con em nhỏ, đang cần một chiếc máy\n    tính bảng đáp ứng tốt nhu cầu học tập, giải trí, xem video hằng ngày.\n  </p>\n   ', 12, 2200, 1),
(52, 8, 'Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH', 6, 'P52_avt.jpg', 4.2, '\n<p>\n    <em><strong>Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH</strong></em\n    ><em\n      ><strong\n        ><strong\n          >&nbsp;với nhiều chế độ cài sẵn,&nbsp;công nghệ nhiệt 3D nấu cơm ngon,\n          hẹn giờ đến 24 giờ, bảng điều khiển tiếng Việt dễ hiểu,... là công cụ\n          đắc lực trong căn bếp gia đình.</strong\n        ></strong\n      ></em\n    >\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-140323-043120.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Tổng quan\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-140323-043120.jpg\"\n        title=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Tổng quan\"></a>\n  </p>\n  <h3>Công nghệ nấu, công suất - Dung tích</h3>\n  <p>\n    - Công suất 835W kết hợp&nbsp;công nghệ nấu 3D giúp nồi nấu cơm chín đều, tơi\n    xốp, giữ lại được dinh dưỡng trong hạt gạo.\n  </p>\n  <p>\n    -&nbsp; Dung tích 1.8 lít&nbsp;nấu được 8 - 10 cốc gạo kèm nồi, đáp ứng tốt khẩu phần ăn cho 4 - 6\n    người.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-140323-043155.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Dung tích\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-140323-043155.jpg\"\n        title=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Dung tích\"></a>\n  </p>\n  <h3>Bảng điều khiển - Chương trình cài đặt sẵn</h3>\n  <p>\n    - Bảng điều khiển nút nhấn dễ dùng, có chú thích tiếng Việt kèm màn hình hiển\n    thị, tiện quan sát và điều chỉnh các chức năng.\n  </p>\n  <p>\n    -<strong> </strong>Đa dạng chương trình cài đặt sẵn giúp bạn nấu nhiều món\n    ngon: gạo lứt, hấp, gạo nếp, bánh,&nbsp; cháo, súp, gạo trắng, giữ ấm.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-140323-043215.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Bảng điều khiển\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-140323-043215.jpg\"\n        title=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Bảng điều khiển\"></a>\n  </p>\n  <h3>Thiết kế, chất liệu của sản phẩm</h3>\n  <p>\n    - Mẫu&nbsp; nồi cơm điện Sharp &nbsp;này được thiết kế màu trắng trang nhã, có bảng điều khiển nằm phía\n    trước độc lạ, làm tăng vẻ đẹp thẩm mỹ cho không gian bếp.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-011122-043358.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Thiết kế\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-011122-043358.jpg\"\n        title=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Thiết kế\"></a>\n  </p>\n  <p>\n    - Lòng nồi nhôm phủ chống dính bền tốt, dày 1.183 mm, gia nhiệt hiệu quả giúp\n    cơm chín đều, chống dính cháy, tiện vệ sinh.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-140323-043241.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Lòng nồi\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-140323-043241.jpg\"\n        title=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Lòng nồi\"\n    /></a>\n  </p>\n  <h3>Tiện ích - Phụ kiện</h3>\n  <p>\n    - Giữ ấm cơm đến 12 giờ và hẹn giờ nấu đến 24 giờ, hỗ trợ bạn căn chỉnh thời\n    gian nấu nướng linh hoạt hơn.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-140323-043305.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Tiện ích\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-140323-043305.jpg\"\n        title=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Tiện ích\"\n    /></a>\n  </p>\n  <p>\n    - Phụ kiện đi kèm&nbsp; nồi cơm điện: cốc đong, muỗng cơm, muỗng canh, xửng hấp.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-011122-043404.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Xửng hấp\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/296809/noi-com-dien-tu-sharp-18-lit-ks-com183mv-wh-011122-043404.jpg\"\n        title=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH - Xửng hấp\"\n    /></a>\n  </p>\n  <p>\n    <em>Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH</em>&nbsp;<i\n      >đến từ thương hiệu uy tín của Nhật Bản - Sharp, sở hữu nhiều chương trình\n      nấu, chất liệu lòng nồi bền tốt, nhiều tiện ích: hẹn giờ đến 24 giờ, có xửng\n      hấp đi kèm,... hỗ trợ bạn nấu nướng đa dạng món ngon một cách thuận tiện.</i\n    >\n  </p>\n   ', 12, 2200, 1),
(53, 8, 'Nồi cơm điện tử Sharp 1.8 lít KS-COM194EV-BK', 6, 'P53_avt.jpg', 4, '\n<p>\n    <strong\n      ><i>\n      Nồi cơm điện tử Sharp 1.8 lít KS-COM194EV-BK &nbsp;có lòng nồi phủ lớp chống dính giúp nấu cơm ngon, giữ ấm tốt, đa\n        dạng chương trình cài sẵn với nhiều loại gạo khác nhau, giữ ấm đến 24 giờ\n        tiện lợi.</i\n      ></strong\n    >\n  </p>\n  <h3>Công nghệ nấu, công suất - Dung tích</h3>\n  <p>\n    - Công suất 790W cùng công nghệ nấu 3D với bộ gia nhiệt được lắp đặt phía\n    trên, mặt bên và phía dưới tạo ra năng lượng nhiệt mạnh mẽ, đảm bảo hương vị\n    thơm ngon trong từng hạt gạo.\n  </p>\n  <p>\n    -&nbsp; Dung tích 1.8 lít &nbsp;nấu được 8 - 10 cốc gạo đi kèm theo nồi, đáp ứng tốt khẩu phần ăn cho 4\n    - 6 người.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/311384/noi-com-dien-tu-sharp-18-lit-ks-com194ev-bk-201023-115017.gif\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM194EV-BK - Công nghệ \"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/311384/noi-com-dien-tu-sharp-18-lit-ks-com194ev-bk-201023-115017.gif\"\n        style=\"height: 436px; width: 780px\"\n        title=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM194EV-BK - Công nghệ \"></a>\n  </p>\n  <h3>Bảng điều khiển - Chương trình cài đặt sẵn</h3>\n  <p>\n    - Bảng điều khiển nút nhấn có màn hình hiển thị hỗ trợ tiếng Việt giúp bạn\n    quan sát chức năng, thời gian nấu thêm rõ ràng, tiện lợi.\n  </p>\n  <p>\n    -<strong>&nbsp;</strong>Đa dạng chương trình cài đặt sẵn giúp bạn nấu nhiều\n    món ngon: cháo, cơm niêu, giữ ấm, hấp, làm bánh, ngũ cốc, nấu nhanh, nấu thông\n    thường và súp.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/311384/noi-com-dien-tu-sharp-18-lit-ks-com194ev-bk-201023-115128.gif\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM194EV-BK - Nút nhấn\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/311384/noi-com-dien-tu-sharp-18-lit-ks-com194ev-bk-201023-115128.gif\"\n        style=\"height: 436px; width: 780px\"\n        title=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM194EV-BK - Nút nhấn\"></a>\n  </p>\n  <h3>Thiết kế, chất liệu của sản phẩm</h3>\n  <p>\n    - Mẫu&nbsp; nồi cơm điện Sharp &nbsp;này sở hữu vẻ ngoài sang trọng, bóng sáng với màu đen - xám, góp phần\n    tạo nên vẻ đẹp hiện đại, thời thượng cho không gian bếp.\n  </p>\n  <p>\n    - Lòng nồi hợp kim phủ lớp chống dính với lớp phủ trong PTFE và lớp phủ ngoài\n    Organosilicon, dày bền đến 2.2 mm,<strong>&nbsp;</strong>cầm chắc tay, an toàn\n    khi nấu, hạn chế cháy dính.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/311384/noi-com-dien-tu-sharp-18-lit-ks-com194ev-bk-201023-115153.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM194EV-BK - Dung tích\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/311384/noi-com-dien-tu-sharp-18-lit-ks-com194ev-bk-201023-115153.jpg\"\n        style=\"height: 436px; width: 780px\"\n        title=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM194EV-BK - Dung tích\"></a>\n  </p>\n  <h3>Tiện ích - Phụ kiện</h3>\n  <p>\n    - Giữ ấm cơm đến 24 giờ, hỗ trợ bạn căn chỉnh thời gian nấu nướng linh hoạt\n    hơn.&nbsp;<strong\n      >Lưu ý: Hãng khuyến cáo thời gian giữ ấm tốt nhất là 12 giờ (tùy thuộc vào\n      loại gạo, khí hậu,...).</strong\n    >\n  </p>\n  <p>- Hẹn giờ nấu đến 15 giờ.</p>\n  <p>\n    - Phụ kiện đi kèm&nbsp; nồi cơm điện: cốc đong, muỗng cơm, muỗng canh và xửng hấp.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/311384/noi-com-dien-tu-sharp-18-lit-ks-com194ev-bk-201023-115216.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM194EV-BK - Tiện ích\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/311384/noi-com-dien-tu-sharp-18-lit-ks-com194ev-bk-201023-115216.jpg\"\n        style=\"height: 436px; width: 780px\"\n        title=\"Nồi cơm điện tử Sharp 1.8 lít KS-COM194EV-BK - Tiện ích\"></a>\n  </p>\n  <p>\n    <i\n      >Nồi cơm điện tử Sharp 1.8 lít KS-COM194EV-BK&nbsp;thuộc&nbsp;thương hiệu uy\n      tín của Nhật Bản, đa dạng chương trình nấu để bạn trổ tài làm nhiều món ngon\n      cho gia đình, màu sắc sang trọng, chất liệu lòng nồi bền tốt, công nghệ nấu\n      3D chế biến hạt cơm mềm xốp, chín đều, bảo toàn dinh dưỡng trong gạo. Đây\n      chắc chắn là sự lựa chọn xứng đáng cho không gian bếp nhà bạn.</i\n    >\n  </p>\n   ', 12, 1800, 1);
INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `supplier_id`, `product_avt_img`, `product_rate`, `product_description`, `product_period`, `product_view_count`, `product_is_display`) VALUES
(54, 8, 'Nồi cơm điện Toshiba', 7, 'P54_avt.jpg', 4, '\n<div>\n    <h3> Nồi cơm điện Toshiba \n      RC-18NMFVN(WT) thiết kế chắc chắn, màu trắng sang trọng\n    </h3>\n  </div>\n  <p>Góp phần tôn thêm nét đẹp hiện đại của mọi không gian bếp.</p>\n  <p>\n    Thêm một đặc điểm nổi bật của chiếc nồi này là đáy nồi nghiên 60 độ giúp tạo\n    lực chéo 60 độ để khi nấu cơm sôi, gạo sẽ được trộn từ dưới đáy lên trên nên\n    gạo sẽ nở đều, cơm chín ngon hơn.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-1.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-1.jpg\"\n        title=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"></a>\n  </p>\n  <h3> Nồi cơm điện &nbsp;này có dung tích 1.8 lít đáp ứng nhu cầu cơm cho&nbsp; gia đình 4 – 6 thành viên\n  </h3>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-2.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-2.jpg\"\n        title=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"></a>\n  </p>\n  <h3>\n    Nấu cơm nhanh chín, tiết kiệm điện với công suất 800W cùng&nbsp;công nghệ nấu\n    3D\n  </h3>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-3.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-3.jpg\"\n        title=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"></a>\n  </p>\n  <h3>Lòng nồi 3 lớp dày 4 mm, bằng hợp kim nhôm phủ lớp chống dính bền bỉ</h3>\n  <p>\n    An toàn cho sức khỏe, cho hạt cơm chín tơi, ngon và&nbsp; dễ chùi rửa &nbsp;sau khi dùng.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-4.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-4.jpg\"\n        title=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"></a>\n  </p>\n  <h3>\n    Nhiều chế độ nấu tự động, giữ ấm, hâm nóng, hẹn giờ nấu tiện dụng với bảng\n    điều khiển điện tử có màn hình hiển thị\n  </h3>\n  <p>\n    Các chế độ nấu tự động như:&nbsp; nấu gạo trắng, gạo trộn, nấu nhanh,\n     nấu cháo, lên men làm bánh,làm bánh, nấu súp, luộc trứng,... giúp bạn chế biến các món ăn đa dạng, dễ dàng. &nbsp;\n  </p>\n  <p>\n    Ngoài ra,&nbsp; nồi cơm điện tử &nbsp;còn có chức năng hâm nóng, giữ ấm đến 30 tiếng, hẹn giờ nấu tới 24\n    tiếng đem đến cho người nội trợ nhiều sự tiện lợi khi nấu ăn.&nbsp; Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN&nbsp;với các nút bấm có chú thích chức năng sử dụng rõ ràng giúp bạn điều\n    chỉnh các chức năng, chế độ nấu dễ dàng, chính xác.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-9.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-9.jpg\"\n        style=\"height: 1200px; width: 800px\"\n        title=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"></a>\n  </p>\n  <h3>Nồi có xửng hấp giúp bạn hấp bánh bao, rau củ quả tiện lợi</h3>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-6.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-6.jpg\"\n        title=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"></a>\n  </p>\n  <h3>Muỗng lấy cơm, cốc đong gạo giúp nấu cơm dễ dàng</h3>\n  <p>\n    Bên cạnh đó, nồi còn trang bị kệ để muỗng lấy cơm cho phép bạn bảo quản muỗng\n    lấy cơm sạch sẽ, gọn gàng hơn.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-7.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1922/92601/noi-com-dien-toshiba-rc-18nmfvn-wt-7.jpg\"\n        title=\"Nồi cơm điện tử Toshiba 1.8 lít RC-18NMFVN(WT)\"></a>\n  </p>\n  <p>\n   Nồi cơm điện tử Toshiba &nbsp;1.8 lít RC-18NMFVN(WT) đến từ thương hiệu Toshiba – Nhật Bản, sản xuất\n    tại Thái Lan chất lượng tốt, nấu cơm ngon, dùng bền.\n  </p>\n   ', 12, 1600, 1),
(55, 10, 'Bếp điện từ đôi BlueStone ICB-6818', 13, 'P55_avt.jpg', 4.8, '\n<h3>\n    Bếp điện từ đôi BlueStone ICB-6818\n      lắp đặt âm sang trọng, gia tăng nét đẹp cho không gian đun nấu\n    </h3>\n    <p>Bếp từ\n      với tổng công suất 4000W nấu ăn cực nhanh chóng, 2 vùng nấu hỗ trợ đun nấu\n      tiện lợi hơn. Với tổng công suất này, bếp sử dụng điện nối qua aptomat (CB).\n    </p>\n    <p>\n      <a\n        class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-9.jpg\"\n        onclick=\"return false;\"\n        ><img\n          alt=\"Sang trọng, tiện dụng - Bếp điện từ đôi Bluestone ICB-6818\"\n          src=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-9.jpg\"\n          title=\"Sang trọng, tiện dụng - Bếp điện từ đôi Bluestone ICB-6818\"></a>\n    </p>\n    <h3>\n      Mặt bếp bằng kính Ceramic chịu nhiệt cao cấp, chống trầy hiệu quả, sáng bóng\n      lâu, dễ chùi rửa, giữ bếp luôn mới\n    </h3>\n    <p>\n      <a\n        class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-10.jpg\"\n        onclick=\"return false;\"\n        ><img\n          alt=\"Mặt bếp cao cấp, bền tốt - Bếp điện từ đôi Bluestone ICB-6818\"\n          src=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-10.jpg\"\n          title=\"Mặt bếp cao cấp, bền tốt - Bếp điện từ đôi Bluestone ICB-6818\"></a>\n    </p>\n    <h3>Độ dày mặt kính&nbsp;0.4 cm siêu bền</h3>\n    <p>\n      <a\n        class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-11.jpg\"\n        onclick=\"return false;\"\n        ><img\n          alt=\"Mặt kính dày -  Bếp điện từ đôi Bluestone ICB-6818\"\n          src=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-11.jpg\"\n          title=\"Mặt kính dày -  Bếp điện từ đôi Bluestone ICB-6818\"></a>\n    </p>\n    <h3>\n     Bảng điều khiển cảm ứng\n      nhạy bén với đèn Led hiển thị, cho phép tùy chỉnh 9 mức công suất theo món nấu\n    </h3>\n    <p>\n      Với bộ vi mạch cải tiến, bếp cho phép sử dụng mức công suất thấp nấu ổn định\n      (không bật tắt) trong thời gian dài, giữ thức ăn không bị cháy khét và tiết\n      kiệm điện, thuận tiện cho các món ninh hầm.\n    </p>\n    <p>\n      <a\n        class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-12.jpg\"\n        onclick=\"return false;\"\n        ><img\n          alt=\"Bảng điều khiển cảm ứng -  Bếp điện từ đôi Bluestone ICB-6818\"\n          src=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-12.jpg\"\n          title=\"Bảng điều khiển cảm ứng -  Bếp điện từ đôi Bluestone ICB-6818\"></a>\n    </p>\n    <h3>\n      Chế độ hẹn giờ\n      nấu lên đến 99 phút cho người dùng thực sự làm chủ thời gian đun nấu, chuẩn bị\n      bữa ăn hoàn hảo cả khi bận rộn\n    </h3>\n    <p>\n      <a\n        class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-13.jpg\"\n        onclick=\"return false;\"\n        ><img\n          alt=\"Hẹn giờ tiện lợi -  Bếp điện từ đôi Bluestone ICB-6818\"\n          src=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-13.jpg\"\n          title=\"Hẹn giờ tiện lợi -  Bếp điện từ đôi Bluestone ICB-6818\"></a>\n    </p>\n    <h3>\n      An toàn sử dụng hơn với tính năng khóa bảng điều khiển và chế độ tự ngắt khi\n      bếp quá tải\n    </h3>\n    <p>\n      <a\n        class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-14.jpg\"\n        onclick=\"return false;\"\n        ><img\n          alt=\"Sử dụng an toàn -  Bếp điện từ đôi Bluestone ICB-6818\"\n          src=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-14.jpg\"\n          title=\"Sử dụng an toàn -  Bếp điện từ đôi Bluestone ICB-6818\"></a>\n    </p>\n    <p>Lưu ý:</p>\n    <p>\n      Sản phẩm có công suất 4000W, cần lắp đặt thêm các vật tư để đảm bảo an toàn\n      hơn trong quá trình sử dụng. Mua ngay ở Điện máy XANH để được miễn phí công\n      lắp đặt và đảm bảo an toàn bởi người có chuyên môn.\n    </p>\n    <p>\n      <a\n        class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-15.jpg\"\n        onclick=\"return false;\"\n        ><img\n          alt=\"Lắp đặt sản phẩm - Bếp điện từ đôi lắp âm Bluestone ICB-6818\"\n          src=\"https://cdn.tgdd.vn/Products/Images/1982/203699/bep-dien-tu-doi-bluestone-icb-6818-15.jpg\"\n          title=\"Lắp đặt sản phẩm - Bếp điện từ đôi lắp âm Bluestone ICB-6818\"></a>\n    </p>\n    <p>Lưu ý: bếp phù hợp với nồi/chảo có đường kính đáy&nbsp;từ 14 cm trở lên.</p>\n    <p>\n     Bếp từ BlueStone\n      thiết kế đẹp, dùng tiện lợi, đơn giản mà an toàn, phục vụ tích cực cho công\n      việc bếp núc của người nội trợ.\n    </p>\n     ', 24, 1500, 1),
(56, 10, 'Bếp từ đôi lắp âm Hafele HC-I2712A (536.61.716)', 40, 'P56_avt.jpg', 4, '\n<h3 style=\"text-align: justify\">\n    Bếp từ thương hiệu Hafele của Đức, sản xuất và nhập khẩu nguyên chiếc từ\n    Malaysia đảm bảo chất lượng, mẫu mã\n  </h3>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a-261021-052852.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Thương hiệu Đức, sản xuất Malaysia - Bếp từ đôi Hafele HC-I2712A (536.61.716)\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a-261021-052852.jpg\"\n        title=\"Thương hiệu Đức, sản xuất Malaysia - Bếp từ đôi Hafele HC-I2712A (536.61.716)\"></a>\n  </p>\n  <h3 style=\"text-align: justify\">\n    Mặt kính Ceramic thương hiệu Schott Ceran (Đức) cao cấp có độ bền vượt trội\n  </h3>\n  <p style=\"text-align: justify\">\n    Chất liệu sáng bóng dễ&nbsp; lau chùi, khả năng chống trầy xước tốt, chịu lực và chịu nhiệt, ổn định hiệu suất đun\n    nấu trong suốt thời gian sử dụng.\n  </p>\n  <p style=\"text-align: justify\">\n  Bảng điều khiển&nbsp;cảm ứng trượt &nbsp;hỗ trợ 8 mức công suất tùy chỉnh theo nhu cầu, có tính năng ủ ấm tiện\n    lợi.\n  </p>\n  <p style=\"text-align: justify\">\n    Chức năng hẹn giờ nấu tối đa đến 99 phút giúp người dùng chủ động hơn trong\n    quá trình nấu nướng với&nbsp; bếp từ, có thể rảnh tay cho các công việc khác trong khi chờ thức ăn chín.\n  </p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a3.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Chất liệu cao cấp - Bếp từ đôi Hafele HC-I2712A\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a3.jpg\"\n        title=\"Chất liệu cao cấp - Bếp từ đôi Hafele HC-I2712A\"></a>\n  </p>\n  <h3 style=\"text-align: justify\">\n    Trang bị công nghệ Inverter tiết kiệm điện năng hiệu quả\n  </h3>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a-261021-054129.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Công nghệ Inverter - Bếp từ đôi Hafele HC-I2712A (536.61.716)\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a-261021-054129.jpg\"\n        title=\"Công nghệ Inverter - Bếp từ đôi Hafele HC-I2712A (536.61.716)\"></a>\n  </p>\n  <h3 style=\"text-align: justify\">\n  Bếp từ Hafele\n    HC-I2712A sang trọng với kiểu lắp đặt âm tiện lợi, 2 vùng nấu kích\n    thước&nbsp;Ø195 mm\n  </h3>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a1.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Lắp âm sang trọng - Bếp từ đôi Hafele HC-I2712A\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a1.jpg\"\n        title=\"Lắp âm sang trọng - Bếp từ đôi Hafele HC-I2712A\"></a>\n  </p>\n  <h3 style=\"text-align: justify\">\n  Bếp từ có tổng công suất 4200W, mỗi vùng nấu tối đa 2000W và đạt 2200W khi sử dụng Booster gia nhiệt nhanh\n  </h3>\n  <p style=\"text-align: justify\">\n    Chức năng Booster chỉ sử dụng được 1 vùng nấu trong 1 thời điểm, không thể sử\n    dụng Booster cùng lúc cho 2 vùng nấu.\n  </p>\n  <p>Với tổng công suất này, bếp sử dụng điện nối qua aptomat (CB).</p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a2-1.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Nấu ăn nhanh - Bếp từ đôi Hafele HC-I2712A\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a2-1.jpg\"\n        title=\"Nấu ăn nhanh - Bếp từ đôi Hafele HC-I2712A\"></a>\n  </p>\n  <h3 style=\"text-align: justify\">\n    Bếp từ kén nồi, cần chọn&nbsp; nồi &nbsp;chảo có đế nhiễm từ (gang, inox 430) để đảm bảo hiệu quả gia nhiệt, nấu\n    ăn nhanh\n  </h3>\n  <p>Lưu ý: bếp phù hợp với nồi/chảo có đường kính đáy&nbsp;12 - 26 cm.</p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a-261021-053455.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Loại nồi sử dụng - Bếp từ đôi Hafele HC-I2712A (536.61.716)\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a-261021-053455.jpg\"\n        title=\"Loại nồi sử dụng - Bếp từ đôi Hafele HC-I2712A (536.61.716)\"></a>\n  </p>\n  <h3 style=\"text-align: justify\">Trang bị nhiều tính năng an toàn</h3>\n  <p style=\"text-align: justify\">\n    Bao gồm:&nbsp; Cảnh báo mặt bếp nóng, tự tắt khi không có nồi, nhận diện nồi chảo, âm báo nồi nấu không phù hợp\n    và khóa trẻ em.\n  </p>\n  <p style=\"text-align: justify\">\n    - Cảnh báo mặt bếp nóng với đèn báo chữ H tránh trường hợp người dùng vô tình\n    chạm phải gây nóng bỏng.\n  </p>\n  <p style=\"text-align: justify\">- Tự ngắt khi không có nồi trên bếp.</p>\n  <p style=\"text-align: justify\">\n    - Nhận diện kích cỡ đáy nồi/chảo:&nbsp;chỉ gia nhiệt trong khoảng đáy nồi được\n    quy định giúp tiết kiệm lượng điện năng tiêu thụ.\n  </p>\n  <p style=\"text-align: justify\">\n    - Âm báo nồi nấu không phù hợp: Giúp người dùng nhận biết và thay thế nồi chảo\n    khác để có thể sử dụng trên bếp từ.\n  </p>\n  <p style=\"text-align: justify\">\n    - Khóa trẻ em giúp vô hiệu hóa bảng điều khiển khi bếp từ đang hoạt động, đảm\n    bảo bếp vẫn hoạt động theo chế độ đã cài đặt mà không bị ảnh hưởng do vô tình\n    va chạm với bảng điều khiển, an tâm hơn khi khu vực đun nấu có trẻ nhỏ.&nbsp;\n  </p>\n  <p style=\"text-align: justify\">\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a6.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"An toàn - Bếp từ đôi Hafele HC-I2712A\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/236629/doi-hafele-hc-i2712a6.jpg\"\n        title=\"An toàn - Bếp từ đôi Hafele HC-I2712A\"></a>\n  </p>\n  <p style=\"text-align: justify\"><strong>Lưu ý:</strong></p>\n  <p style=\"text-align: justify\">\n    - Đặt bếp ở vị trí chắc chắn, cân bằng, khoảng cách trống tối thiểu 50 mm xung\n    quanh lỗ cắt.\n  </p>\n  <p style=\"text-align: justify\">\n    - Khi gặp sự cố hoặc muốn thay đổi vị trí bếp, vui lòng gọi chuyên viên, không\n    tự ý làm để tránh rủi ro.\n  </p>\n  <p style=\"text-align: justify\">- Đọc kỹ hướng dẫn sử dụng sản phẩm.</p>\n  <p style=\"text-align: justify\">\n    - Không nên nấu ăn với công suất tối đa quá lâu vì dễ gây cháy thức ăn và lâu\n    dần có thể làm giảm tuổi thọ bếp.\n  </p>\n  <p style=\"text-align: justify\">\n    - Khi nấu ăn xong, nên để mặt bếp nguội và tiến hành vệ sinh bếp để giữ bếp\n    mới lâu.\n  </p>\n  <p style=\"text-align: justify\">\n  Bếp từ đôi Hafele HC-I2712A &nbsp;sản xuất và nhập khẩu từ Malaysia, hẹn giờ lên tới 99 phút, trang bị\n    nhiều tính năng an toàn và tiện ích hiện đại đáp ứng tốt nhu cầu nấu nướng\n    trong gia đình.\n  </p>\n   ', 12, 1400, 1),
(57, 10, 'Bếp từ hồng ngoại lắp âm Kangaroo KG852i', 14, 'P57_avt.jpg', 4, '<h3>\n    Thiết kế 2 vùng nấu 2 món cùng lúc: 1 vùng, 1 vùng&nbsp;bếp từ\n    giúp tiết kiệm thời gian chế biến thực phẩm\n  </h3>\n  <p>\n    Vùng từ chỉ sử dụng nồi có đáy nhiễm từ chất liệu inox 430 và gang, vùng hồng\n    ngoại không kén nồi.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/252062/hong-ngoai-kangaroo-kg852i-200122-035454.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Thiết kế 2 vùng nấu\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/252062/hong-ngoai-kangaroo-kg852i-200122-035454.jpg\"\n        title=\"Thiết kế 2 vùng nấu\"></a>\n  </p>\n  <h3> Bếp từ&nbsp;hồng ngoại &nbsp;Kangaroo với tổng công suất 4000W khi mở hai bếp cùng lúc\n  </h3>\n  <p>\n    Vùng từ 2000W, đạt 2400W khi sử dụng Booster&nbsp; gia nhiệt nhanh, vùng hồng ngoại 2000W.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/252062/hong-ngoai-kangaroo-kg852i-200122-035546.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Tổng công suất 3600W\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/252062/hong-ngoai-kangaroo-kg852i-200122-035546.jpg\"\n        title=\"Tổng công suất 3600W\"></a>\n  </p>\n  <h3>\n    Bảng điều khiển cảm ứng trượt, màn hình hiển thị rõ ràng, dễ dàng thao tác chỉ với cái trượt nhẹ\n  </h3>\n  <p>\n    Chức năng hẹn giờ &nbsp;giúp&nbsp;linh hoạt trong quá trình nấu, phù hợp với các món ninh, hầm,\n    om,... và bếp&nbsp;sẽ tự tắt sau khi hoàn thành.\n  </p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/252062/hong-ngoai-kangaroo-kg852i-200122-035806.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Bảng điều khiển cảm ứng trượt đi kèm chức năng hẹn giờ\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/252062/hong-ngoai-kangaroo-kg852i-200122-035806.jpg\"\n        title=\"Bảng điều khiển cảm ứng trượt đi kèm chức năng hẹn giờ\"></a>\n  </p>\n  <h3>\n    Bếp từ Kangaroo &nbsp;sở hữu các tính năng an toàn, tăng độ bền sản phẩm và đảm bảo an toàn\n    cho người sử dụng\n  </h3>\n  <p>- Tính năng dừng bếp tạm thời khi đang gián đoạn với một công việc khác.</p>\n  <p>\n    - Tự ngắt khi bếp nóng quá tải, khi không có nồi giúp duy trì độ bền bỉ cho\n    bếp.\n  </p>\n  <p>\n    -&nbsp;Chức năng khóa bảng điều khiển khi kích hoạt sẽ vô hiệu hóa toàn bàn\n    phím ngăn người dùng thay đổi các cài đặt trước đó, bảo vệ an toàn cho gia\n    đình có trẻ nhỏ.\n  </p>\n  <p>- Tự nhận diện kích cỡ đáy nồi giúp hoạt động ổn định và hiệu quả.</p>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/252062/hong-ngoai-kangaroo-kg852i-200122-035904.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Bếp sở hữu nhiều tính năng an toàn\"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/252062/hong-ngoai-kangaroo-kg852i-200122-035904.jpg\"\n        title=\"Bếp sở hữu nhiều tính năng an toàn\"></a>\n  </p>\n  <h3>\n    Mặt kính Crystal (Trung Quốc) khả năng chịu nhiệt tốt với độ sáng bóng cao, làm sạch đơn giản\n  </h3>\n  <p>\n    <a\n      class=\"preventdefault\"\n      href=\"https://cdn.tgdd.vn/Products/Images/1982/252062/hong-ngoai-kangaroo-kg852i-10-2.jpg\"\n      onclick=\"return false;\"\n      ><img\n        alt=\"Mặt bếp - Bếp từ hồng ngoại lắp âm Kangaroo KG852i \"\n        src=\"https://cdn.tgdd.vn/Products/Images/1982/252062/hong-ngoai-kangaroo-kg852i-10-2.jpg\"\n        title=\"Mặt bếp - Bếp từ hồng ngoại lắp âm Kangaroo KG852i \"></a>\n  </p>\n  <p><strong>Lưu ý:</strong></p>\n  <p>- Sử dụng với nguồn điện áp ổn định để kéo dài tuổi thọ bếp.</p>\n  <p>- Xem kỹ hướng dẫn được nhà sản xuất cung cấp để dùng đúng cách, an toàn.</p>\n  <p>\n    - Mặt bếp không sử dụng vật sắc nhọn để cạo vết bẩn hoặc dùng búi sắt vệ sinh\n    vì dễ làm trầy xước.\n  </p>\n  <p>\n  Bếp từ hồng ngoại lắp âm Kangaroo KG852i&nbsp; thiết kế sang trọng, chất lượng cao với những tính năng an toàn, là lựa chọn\n    tuyệt vời cho mọi gia đình hiện đại.\n  </p>', 12, 1300, 1),
(58, 3, 'Smart Tivi NanoCell LG 4K 75 inch 75NANO76SQA ', 3, 'P58_avt.jpg', 4, '<p><em><strong>Smart Tivi NanoCell LG 4K 75 inch\n            75NANO76SQA thể hiện khung hình 4K rực rỡ với công nghệ NanoCell, cuốn hút người dùng từ âm thanh tinh chỉnh\n            theo nội dung, thỏa mãn nhu cầu giải trí cùng kho ứng dụng phong phú webOS 22, mang đến lựa chọn tuyệt vời\n            cho gia đình bạn.</strong></em></p>\n<h3>Tổng quan thiết kế</h3>\n<p >-&nbsp;Smart Tivi\n        NanoCell LG 4K 75 inch 75NANO76SQA phù hợp cho các phòng có diện tích trung bình lớn nhờ thiết kế thanh mảnh với\n        <strong>kích thước màn hình 75 inch</strong> cùng chân đế bán nguyệt có thể tháo rời, bố trí để\n        bàn hay treo tường linh hoạt.\n</p>\n<p >- Chân đế bằng <strong>chất liệu nhựa lõi kim loại</strong> độ\n    cứng chắc cao, nâng đỡ tốt màn hình, đảm bảo thẩm mỹ cho mọi không gian bố trí.</p>\n<p ><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1942/278572/smart-nanocell-lg-4k-75-inch-75nano76sqa-1-1.jpg\"\n        onclick=\"return false;\"><img\n            alt=\"Sang trọng - Smart Tivi NanoCell LG 4K 75 inch 75NANO76SQA\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1942/278572/smart-nanocell-lg-4k-75-inch-75nano76sqa-1-1.jpg\"\n            title=\"Sang trọng - Smart Tivi NanoCell LG 4K 75 inch 75NANO76SQA\"></a>\n</p>\n<p><em >*Hình ảnh chỉ mang tính chất minh họa sản\n        phẩm</em></p>\n<h3 >Công nghệ hình ảnh</h3>\n<p >- Hiển thị sắc nét, sống động với <strong>độ phân giải\n        4K&nbsp;(3.840 x 2.160)</strong>.</p>\n<p >- <strong>Dải màu rộng&nbsp;Nano Color</strong> mang thế giới màu sắc tự nhiên lên màn hình tivi\n        NanoCell&nbsp;tái hiện màu sắc chân thực, ấn tượng đến từng chi tiết nhỏ, cuốn hút thị giác ngay khi đối diện.\n</p>\n<p>-&nbsp;Tivi&nbsp;tối ưu\n        hình ảnh và màu sắc hiển thị qua&nbsp;<strong>bộ xử lý α5 Gen5 AI 4K</strong>, đồng thời, nội\n        dung đầu vào được nâng cấp lên chuẩn gần 4K nhờ&nbsp;công nghệ&nbsp;<strong>4K AI\n            Upscaling</strong>. Vì thế người xem luôn được trải nghiệm khung hình tốt nhất.\n<p>- Tăng cường độ tương phản cho hình ảnh có chiều sâu, lột tả\n    chân thực các chi tiết và thông điệp hình ảnh qua&nbsp;<strong>các định dạng HDR</strong>&nbsp;(Active\n    HDR,&nbsp;HDR10 Pro,&nbsp;HDR Dynamic Tone Mapping)&nbsp;và&nbsp;<strong>HLG</strong>, lôi cuốn cảm xúc người xem.\n</p>\n<p >-&nbsp;Màn hình game mượt mà, chiến game sảng khoái\n    nhờ<strong> chế độ game HGIG</strong>&nbsp;và&nbsp;<strong>công nghệ giảm độ trễ&nbsp;Auto Low Latency Mode\n        (ALLM)</strong>.</p>\n<p >- Cảm nhận rõ ý đồ của nhà làm phim khi thưởng thức phim điện\n    ảnh qua<strong>&nbsp;chế độ làm phim&nbsp;FilmMaker Mode</strong>.</p>\n<p ><a class=\"preventdefault\"\n        href=\"https://cdn.tgdd.vn/Products/Images/1942/278572/smart-nanocell-lg-4k-75-inch-75nano76sqa-230522-032322.jpg\"\n        onclick=\"return false;\"><img\n            alt=\"Smart Tivi NanoCell LG 4K 75 inch 75NANO76SQA - Công nghệ hình ảnh\"\n            src=\"https://cdn.tgdd.vn/Products/Images/1942/278572/smart-nanocell-lg-4k-75-inch-75nano76sqa-230522-032322.jpg\"\n            title=\"Smart Tivi NanoCell LG 4K 75 inch 75NANO76SQA - Công nghệ hình ảnh\"></a></p>\n', 12, 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `product_detail_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_detail_name` varchar(100) NOT NULL,
  `product_detail_value` text DEFAULT NULL,
  `product_detail_unit` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`product_detail_id`, `product_id`, `product_detail_name`, `product_detail_value`, `product_detail_unit`) VALUES
(1, 1, 'Loại máy', '1 chiều (chỉ làm lạnh)Có Inverter', NULL),
(2, 1, 'Công suất làm lạnh', '1 HP - 9.500 BTU', NULL),
(3, 1, 'Phạm vi làm lạnh hiệu quả', 'Dưới 15m² (từ 30 đến 45m³)', NULL),
(4, 1, 'Lọc bụi, kháng khuẩn, khử mùi', 'Bộ lọc bụi 2 lớp HDCông nghệ lọc kép Dual Filtratio', NULL),
(5, 1, 'Công nghệ tiết kiệm điện', 'iEco/GearInverter Quattro', NULL),
(6, 1, 'Làm lạnh nhanh', 'Boost', NULL),
(7, 1, 'Tiện ích', 'Chế độ Avoid Me (Breeze Away)Chế độ chỉ sử dụng quạt Fan Only - chỉ làm mát, không làm lạnhChức năng hút ẩmChức năng tự làm sạchFollow me - chức năng cài đặt nhiệt độ tại vị trí remoteHẹn giờ bật tắt máyKhóa remote điều khiểnMàn hình hiển thị nhiệt độ trên dàn lạnhRemote có đèn LED', NULL),
(8, 1, 'Tiêu thụ điện', '0.75 kW/h5 sao (Hiệu suất năng lượng 4.48)', NULL),
(9, 1, 'Dàn lạnh', 'Dài 72.6 cm - Cao 29.1 cm - Dày 21 cm - Nặng 8.2 kg', NULL),
(10, 1, 'Dàn nóng', 'Dài 80 cm - Cao 49.5 cm - Dày 26.2 cm - Nặng 21.7 kg', NULL),
(11, 1, 'Hãng', 'Midea.', NULL),
(12, 2, 'Loại máy', '1 chiều (chỉ làm lạnh)Có Inverter', NULL),
(13, 2, 'Công suất làm lạnh', '1.5 HP - 12.000 BTU', NULL),
(14, 2, 'Phạm vi làm lạnh hiệu quả', 'Từ 15 - 20m² (từ 40 đến 60 m³)', NULL),
(15, 2, 'Lọc bụi, kháng khuẩn, khử mùi', 'Bộ lọc HD giúp lọc sạch không khí', NULL),
(16, 2, 'Công nghệ tiết kiệm điện', 'AI InverterEco', NULL),
(17, 2, 'Làm lạnh nhanh', 'Turbo', NULL),
(18, 2, 'Tiện ích', 'Chế độ bảo vệ nguồn điệnChế độ kiểm soát độ ẩmCảm biến nhiệt độ I FeelMàn hình hiển thị nhiệt độ trên dàn lạnhĐảo gió đa chiều tạo luồng không khí lạnh lan tỏa nhanh khắp phòng', NULL),
(19, 2, 'Tiêu thụ điện', '1.13 kW/h5 sao (Hiệu suất năng lượng 4.41)', NULL),
(20, 2, 'Dàn lạnh', 'Dài 78.2 cm - Cao 24.8 cm - Dày 19.6 cm - Nặng 7.5 kg', NULL),
(21, 2, 'Dàn nóng', 'Dài 75.4 cm - Cao 44 cm - Dày 22.4 cm - Nặng 20 kg', NULL),
(22, 2, 'Hãng', 'TCL', NULL),
(23, 3, 'Loại máy', '1 chiều (chỉ làm lạnh)Có Inverter', NULL),
(24, 3, 'Công suất làm lạnh', '1 HP - 9.000 BTU', NULL),
(25, 3, 'Phạm vi làm lạnh hiệu quả', 'Dưới 15m² (từ 30 đến 45m³)', NULL),
(26, 3, 'Lọc bụi, kháng khuẩn, khử mùi', 'Lưới lọc Nano Ag', NULL),
(27, 3, 'Công nghệ tiết kiệm điện', 'EcoInverter', NULL),
(28, 3, 'Làm lạnh nhanh', 'Turbo', NULL),
(29, 3, 'Tiện ích', 'Chức năng tự chẩn đoán lỗiChức năng tự làm sạchMàn hình hiển thị nhiệt độ trên dàn lạnhSleep ModeTự khởi động lại khi có điệcầu điện trở lại', NULL),
(30, 3, 'Tiêu thụ điện', '0.745 kW/h5 sao (Hiệu suất năng lượng 4.50 )', NULL),
(31, 3, 'Dàn lạnh', 'Dài 72.5 cm - Cao 28.5 cm - Dày 19.4 cm - Nặng 7.4 kg', NULL),
(32, 3, 'Dàn nóng', 'Dài 80 cm - Cao 49.5 cm - Dày 25.5 cm - Nặng 21.7 kg', NULL),
(33, 3, 'Hãng', 'Funiki', NULL),
(34, 4, 'Loại máy', '1 chiều (chỉ làm lạnh)Có Inverter', NULL),
(35, 4, 'Công suất làm lạnh', '1 HP - 9.000 BTU', NULL),
(36, 4, 'Phạm vi làm lạnh hiệu quả', 'Dưới 15m² (từ 30 đến 45m³)', NULL),
(37, 4, 'Công nghệ tiết kiệm điện', 'Công nghệ I-saving', NULL),
(38, 4, 'Làm lạnh nhanh', 'Turbo', NULL),
(39, 4, 'Tiện ích', 'Chức năng tự động làm sạch iCleanCơ chế bảo vệ an toàn kép phát hiện rò rỉ thông minhCảm biến nhiệt độ iFeelMàn hình hiển thị nhiệt độ trên dàn lạnhTự khởi động lại khi có điệcầu điện trở lại', NULL),
(40, 4, 'Tiêu thụ điện', '0.98 kW/h5 sao (Hiệu suất năng lượng 4.31)', NULL),
(41, 4, 'Dàn lạnh', 'Dài 70.8 cm - Cao 28.2 cm - Dày 19.3 cm - Nặng 6.5 kg', NULL),
(42, 4, 'Dàn nóng', 'Dài 72.7 cm - Cao 45.5 cm - Dày 24.2 cm - Nặng 17.5 kg', NULL),
(43, 4, 'Hãng', 'Casper', NULL),
(44, 5, 'Loại máy', '1 chiều (chỉ làm lạnh)Có Inverter', NULL),
(45, 5, 'Công suất làm lạnh', '1.5 HP - 12.000 BTU', NULL),
(46, 5, 'Phạm vi làm lạnh hiệu quả', 'Từ 15 - 20m² (từ 40 đến 60 m³)', NULL),
(47, 5, 'Lọc bụi, kháng khuẩn, khử mùi', 'Bộ lọc bụi 2 lớp HDCông nghệ lọc kép Dual Filtratio', NULL),
(48, 5, 'Công nghệ tiết kiệm điện', 'iEco/GearInverter Quattro', NULL),
(49, 5, 'Làm lạnh nhanh', 'Boost', NULL),
(50, 5, 'Tiện ích', 'Chế độ Avoid Me (Breeze Away)Chế độ chỉ sử dụng quạt Fan Only - chỉ làm mát, không làm lạnhChức năng hút ẩmChức năng tự làm sạchFollow me - chức năng cài đặt nhiệt độ tại vị trí remoteHẹn giờ bật tắt máyKhóa remote điều khiểnMàn hình hiển thị nhiệt độ trên dàn lạnhRemote có đèn LED', NULL),
(51, 5, 'Tiêu thụ điện', '1.06 kW/h5 sao (Hiệu suất năng lượng 4.87)', NULL),
(52, 5, 'Dàn lạnh', 'Dài 83.5 cm - Cao 29.5 cm - Dày 20.8 cm - Nặng 9 kg', NULL),
(53, 5, 'Dàn nóng', 'Dài 72 cm - Cao 49.5 cm - Dày 27 cm - Nặng 21.2 kg', NULL),
(54, 5, 'Hãng', 'Midea', NULL),
(55, 6, 'Loại máy', 'Cửa trênLồng đứng', NULL),
(56, 6, 'Khối lượng giặt', '7.5 KgTừ 2 - 3 người', NULL),
(57, 6, 'Kiểu động cơ', 'Truyền động gián tiếp (dây Curoa)', NULL),
(58, 6, 'Công nghệ giặt', 'Công nghệ Fuzzy LogicHệ thống xoáy nước 3 chiều', NULL),
(59, 6, 'Tiện ích', 'Hẹn giờ giặtKhóa trẻ emTự khởi động lại khi có điện', NULL),
(60, 6, 'Bảng điều khiển', 'Tiếng Việt nút nhấn', NULL),
(61, 6, 'Chất liệu lồng giặt', 'Thép không gỉ', NULL),
(62, 6, 'Kích thước - Khối lượng', 'Cao 91.1 cm - Ngang 53.7 cm - Sâu 55 cm - Nặng 29 kg', NULL),
(63, 6, 'Hãng', 'Sharp', NULL),
(64, 7, 'Loại máy', 'Cửa trướcLồng ngangCó Inverter', NULL),
(65, 7, 'Khối lượng giặt', '10 KgTừ 5 - 7 người', NULL),
(66, 7, 'Kiểu động cơ', 'Truyền động trực tiếp', NULL),
(67, 7, 'Công nghệ giặt', 'Công nghệ AI DD bảo vệ sợi vảiCông nghệ giặt tiết kiệm TurboWash', NULL),
(68, 7, 'Tiện ích', 'Cho phép điều khiển máy giặt từ xa qua ứng dụng LG ThinQChẩn đoán lỗi Smart DiagnosisHẹn giờ giặtKhóa trẻ emThêm đồ trong khi giặtVệ sinh lồng giặt', NULL),
(69, 7, 'Bảng điều khiển', 'Song ngữ Anh - Việt có nút xoay, nút nhấn và màn hình hiển thị', NULL),
(70, 7, 'Chất liệu lồng giặt', 'Thép không gỉ', NULL),
(71, 7, 'Kích thước - Khối lượng', 'Cao 85 cm - Ngang 59.2 cm - Sâu 60 cm - Nặng 70 kg', NULL),
(72, 7, 'Hãng', 'LG', NULL),
(73, 8, 'Loại máy', 'Cửa trướcLồng ngangCó Inverter', NULL),
(74, 8, 'Khối lượng giặt', '10 KgTừ 5 - 7 người', NULL),
(75, 8, 'Kiểu động cơ', 'Truyền động trực tiếp - sử dụng trí tuệ nhân tạo', NULL),
(76, 8, 'Công nghệ giặt', 'Công nghệ AI DD bảo vệ sợi vảiCông nghệ giặt 6 motion DDCông nghệ giặt hơi nước Steam (cửa trước)Công nghệ giặt tiết kiệm TurboWash', NULL),
(77, 8, 'Tiện ích', 'Cho phép điều khiển máy giặt từ xa qua ứng dụng SmartThinQHẹn giờ giặtKhóa trẻ emThêm đồ trong khi giặt', NULL),
(78, 8, 'Bảng điều khiển', 'Song ngữ Anh - Việt, có nút xoay, màn hình hiển thị', NULL),
(79, 8, 'Chất liệu lồng giặt', 'Thép không gỉ', NULL),
(80, 8, 'Kích thước - Khối lượng', 'Cao 85 cm - Ngang 60 cm - Sâu 58.5 cm - Nặng 80 kg', NULL),
(81, 8, 'Hãng', 'LG', NULL),
(82, 9, 'Loại máy', 'Cửa trướcLồng ngangCó Inverter', NULL),
(83, 9, 'Khối lượng giặt', '8 KgTừ 3 - 5 người', NULL),
(84, 9, 'Kiểu động cơ', 'Truyền động gián tiếp (dây Curoa)', NULL),
(85, 9, 'Công nghệ giặt', 'Công nghệ cảm biến thông minh 6th SENSESanitize Wash - Chương trình giặt sát khuẩn loại bỏ vi khuẩn', NULL),
(86, 9, 'Tiện ích', 'Chống nhănKhóa trẻ emKhử trùng lồng giặt ở 90°CThêm đồ trong khi giặtTự khởi động lại khi có điện', NULL),
(87, 9, 'Bảng điều khiển', 'Tiếng Anh cảm ứng có màn hình hiển thị', NULL),
(88, 9, 'Chất liệu lồng giặt', 'Thép không gỉ', NULL),
(89, 9, 'Kích thước - Khối lượng', 'Cao 85 cm - Ngang 60 cm - Sâu 56.5 cm - Nặng 63 kg', NULL),
(90, 9, 'Hãng', 'Whirlpool', NULL),
(91, 10, 'Loại máy', 'Cửa trướcLồng ngangCó Inverter', NULL),
(92, 10, 'Khối lượng giặt', '10 KgTừ 5 - 7 người', NULL),
(93, 10, 'Kiểu động cơ', 'Truyền động gián tiếp (dây Curoa)', NULL),
(94, 10, 'Công nghệ giặt', 'AI Dispenser tự động cân chỉnh lượng nước giặt, nước xảAI Wash tối ưu lượng nước giặt xả, lượng nước và thời gian giặtBảng điều khiển AI control tự động ghi nhớ chế độ giặtCông nghệ giặt bong bóng Eco BubbleGiặt hơi nước Hygiene SteamKết nối với điện thoại thông qua ứng dụng SmartThingsQuickDrive giặt xả hiệu quả chỉ trong 39 phútVRT Plus ™ giảm rung ồn đến 30%', NULL),
(95, 10, 'Tiện ích', 'Chống nhănKhóa trẻ emTự động vệ sinh lồng giặtVệ sinh lồng giặt', NULL),
(96, 10, 'Bảng điều khiển', 'Tiếng Việt', NULL),
(97, 10, 'Chất liệu lồng giặt', 'Thép không gỉ', NULL),
(98, 10, 'Kích thước - Khối lượng', 'Cao 85 cm - Ngang 60 cm - Sâu 62.5 cm - Nặng 67 kg', NULL),
(99, 10, 'Hãng', 'Samsung', NULL),
(100, 11, 'Loại máy', 'Google Tivi 58 inch 4K', NULL),
(101, 11, 'Hệ điều hành', 'Google TV', NULL),
(102, 11, 'Ứng dụng phổ biến', 'Clip TV, FPT Play, Netflix, Trình duyệt web, VieON, YouTube', NULL),
(103, 11, 'Công nghệ hình ảnh', 'Game Mode, HDR10, HLG, Smart HDR', NULL),
(104, 11, 'Điều khiển bằng giọng nói', 'Google Assistant có tiếng Việt, Tìm kiếm giọng nói trên YouTube bằng tiếng Việt', NULL),
(105, 11, 'Remote thông minh', 'Remote tích hợp micro tìm kiếm bằng giọng nói', NULL),
(106, 11, 'Chiếu hình từ điện thoại lên TV', 'Chromecast, T-Cast', NULL),
(107, 11, 'Kích thước', 'Ngang 128.5 cm - Cao 80.1 cm - Dày 12.85 cm', NULL),
(108, 11, 'Năm ra mắt', '2022', NULL),
(109, 11, 'Hãng', 'TCL', NULL),
(110, 12, 'Loại máy', 'Smart Tivi QLED 55 inch 4K', NULL),
(111, 12, 'Hệ điều hành', 'Tizen™', NULL),
(112, 12, 'Ứng dụng phổ biến', 'Clip TV, FPT Play, Galaxy Play (Fim+), MP3 Zing, MyTV, Netflix, POPS Kids, Spotify, Trình duyệt web, VieON, YouTube', NULL),
(113, 12, 'Công nghệ hình ảnh', 'Ambient Mode, Brightness/Color Detection, Chuyển động mượt Motion Xcelerator Turbo, Giảm độ trễ chơi game Auto Low Latency Mode (ALLM), HDR10+, Quantum Dot, Quantum HDR, Super Ultra Wide Game View & Game Bar, Supreme UHD Dimming', NULL),
(114, 12, 'Điều khiển bằng giọng nói', 'Bixby có tiếng Việt, Tìm kiếm giọng nói trên YouTube bằng tiếng Việt', NULL),
(115, 12, 'Remote thông minh', 'One Remote sạc qua USB C & ánh sáng', NULL),
(116, 12, 'Chiếu hình từ điện thoại lên TV', 'AirPlay 2, Tap View', NULL),
(117, 12, 'Kích thước', 'Ngang 123.2 cm - Cao 76.4 cm - Dày 24.9 cm', NULL),
(118, 12, 'Năm ra mắt', '2021', NULL),
(119, 12, 'Hãng', 'Samsung', NULL),
(120, 13, 'Màn hình', 'OLED 6.1\" Super Retina XDR', NULL),
(121, 13, 'Hệ điều hành', 'iOS 17', NULL),
(122, 13, 'Camera sau', 'Chính 48 MP & Phụ 12 MP', NULL),
(123, 13, 'Camera trước', '12 MP', NULL),
(124, 13, 'Chip', 'Apple A16 Bionic', NULL),
(125, 13, 'RAM', '6 GB', NULL),
(126, 13, 'Dung lượng lưu trữ', '256 GB', NULL),
(127, 13, 'SIM', '1 Nano SIM & 1 eSIM, Hỗ trợ 5G', NULL),
(128, 13, 'Pin, Sạc', '3349 mAh, 20 W', NULL),
(129, 14, 'Màn hình', 'AMOLED 6.67\" 1.5K', NULL),
(130, 14, 'Hệ điều hành', 'Android 13', NULL),
(131, 14, 'Camera sau', 'Chính 50 MP & Phụ 50 MP, 12 MP', NULL),
(132, 14, 'Camera trước', '20 MP', NULL),
(133, 14, 'Chip', 'MediaTek Dimensity 8200-Ultra', NULL),
(134, 14, 'RAM', '12 GB', NULL),
(135, 14, 'Dung lượng lưu trữ', '256 GB', NULL),
(136, 14, 'SIM', '2 Nano SIM, Hỗ trợ 5G', NULL),
(137, 14, 'Pin, Sạc', '5000 mAh, 67 W', NULL),
(138, 15, 'CPU', 'i3-1115G4 3GHz', NULL),
(139, 15, 'RAM', '8 GB DDR4 2 khe (1 khe 8 GB onboard + 1 khe trống) 3200 MHz', NULL),
(140, 15, 'Ổ cứng', '256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB (2280) / 512 GB (2242))', NULL),
(141, 15, 'Màn hình', '15.6\" Full HD (1920 x 1080)', NULL),
(142, 15, 'Card màn hình', 'Card tích hợp Intel UHD', NULL),
(143, 15, 'Cổng kết nối', '1 x USB 2.0, 1 x USB 3.2, 1 x USB Type-C (chỉ hỗ trợ truyền dữ liệu), HDMI, Jack tai nghe 3.5 mm', NULL),
(144, 15, 'Hệ điều hành', 'Windows 11 Home SL', NULL),
(145, 15, 'Thiết kế', 'Vỏ nhựa', NULL),
(146, 15, 'Kích thước, khối lượng', 'Dài 359.2 mm - Rộng 236.5 mm - Dày 19.9 mm - Nặng 1.65 kg', NULL),
(147, 15, 'Thời điểm ra mắt', '2023', NULL),
(148, 16, 'CPU', 'i7-12700H 2.30 GHz', NULL),
(149, 16, 'RAM', '8 GB DDR4 2 khe (1 khe 8 GB + 1 khe rời) 3200 MHz', NULL),
(150, 16, 'Ổ cứng', '512 GB SSD NVMe PCIe 4.0 (Có thể tháo ra, lắp thanh khác tối đa 1 TB), Hỗ trợ khe cắm HDD SATA 2.5 inch mở rộng (nâng cấp tối đa 1 TB), Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng', NULL),
(151, 16, 'Màn hình', '15.6\" Full HD (1920 x 1080) 144Hz', NULL),
(152, 16, 'Card màn hình', 'Card rời RTX 3050 4GB', NULL),
(153, 16, 'Cổng kết nối', '1 x USB Type-C (hỗ trợ USB, DisplayPort, Thunderbolt 4), 3 x USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45)', NULL),
(154, 16, 'Đặc biệt', 'Có đèn bàn phím', NULL),
(155, 16, 'Hệ điều hành', 'Windows 11 Home SL', NULL),
(156, 16, 'Thiết kế', 'Vỏ nhựa', NULL),
(157, 16, 'Kích thước, khối lượng', 'Dài 360.4 mm - Rộng 271.00 mm - Dày 25.9 mm - Nặng 2.5 kg', NULL),
(158, 16, 'Thời điểm ra mắt', '2022', NULL),
(159, 17, 'Màn hình', '10.2\" Retina IPS LCD', NULL),
(160, 17, 'Hệ điều hành', 'iPadOS 15', NULL),
(161, 17, 'Chip', 'Apple A13 Bionic', NULL),
(162, 17, 'RAM', '3 GB', NULL),
(163, 17, 'Dung lượng lưu trữ', '64 GB', NULL),
(164, 17, 'Kết nối', 'Nghe gọi qua FaceTime', NULL),
(165, 17, 'Camera sau', '8 MP', NULL),
(166, 17, 'Camera trước', '12 MP', NULL),
(167, 17, 'Pin, Sạc', '32.4 Wh (~8600 mAh), 20 W', NULL),
(168, 18, 'Màn hình', '10.9\" Retina IPS LCD', NULL),
(169, 18, 'Hệ điều hành', 'iPadOS 15', NULL),
(170, 18, 'Chip', 'Apple M1', NULL),
(171, 18, 'RAM', '8 GB', NULL),
(172, 18, 'Dung lượng lưu trữ', '64 GB', NULL),
(173, 18, 'Kết nối', '5G, Nghe gọi qua FaceTime', NULL),
(174, 18, 'SIM', '1 Nano SIM & 1 eSIM', NULL),
(175, 18, 'Camera sau', '12 MP', NULL),
(176, 18, 'Camera trước', '12 MP', NULL),
(177, 18, 'Pin, Sạc', '28.6 Wh (~7587 mAh), 20 W', NULL),
(178, 27, 'Màn hình', '8.7\"TFT LCD', NULL),
(179, 27, 'Hệ điều hành', 'Android 11', NULL),
(180, 27, 'Chip', 'MediaTek MT8768T', NULL),
(181, 27, 'RAM', '3 GB', NULL),
(182, 27, 'Dung lượng lưu trữ', '32 GB', NULL),
(183, 27, 'Kết nối', 'Hỗ trợ 4G, Có nghe gọi', NULL),
(184, 27, 'SIM', '1 Nano SIM', NULL),
(185, 27, 'Camera sau', '8 MP', NULL),
(186, 27, 'Camera trước', '2 MP', NULL),
(187, 27, 'Pin, Sạc', '5100 mAh, 15 W', NULL),
(188, 27, 'Hãng', 'Samsung', NULL),
(189, 19, 'Kiểu tủ', 'Multi Door', NULL),
(190, 19, 'Dung tích sử dụng', '488 lít - 4 - 5 người', NULL),
(191, 19, 'Công nghệ tiết kiệm điện', 'Chế độ kỳ nghỉ tiết kiệm điện, Digital Inverter', NULL),
(192, 19, 'Công nghệ làm lạnh', '2 dàn lạnh độc lập Twin Cooling Plus™, Công nghệ làm lạnh No Frost, Làm lạnh nhanh', NULL),
(193, 19, 'Công nghệ kháng khuẩn khử mùi', 'Bộ lọc than hoạt tính Deodorizer', NULL),
(194, 19, 'Công nghệ bảo quản thực phẩm', 'Ngăn rau quả giữ ẩm', NULL),
(195, 19, 'Tiện ích', 'Bảng điều khiển bên ngoài, Chuông báo khi quên đóng cửa, Chế độ kỳ nghỉ, Có khóa, Làm đông nhanh', NULL),
(196, 19, 'Kích thước - Khối lượng', 'Cao 179.3 cm - Rộng 83.3 cm - Sâu 74 cm - Nặng 99 kg', NULL),
(197, 19, 'Nơi sản xuất', 'Trung Quốc', NULL),
(198, 19, 'Năm ra mắt', '2021', NULL),
(199, 19, 'Hãng', 'Samsung', NULL),
(200, 20, 'Kiểu tủ', 'Multi Door', NULL),
(201, 20, 'Dung tích sử dụng', '511 lít - 4 - 5 người', NULL),
(202, 20, 'Công nghệ tiết kiệm điện', 'Chế độ kỳ nghỉ tiết kiệm điện, Origin Inverter', NULL),
(203, 20, 'Công nghệ làm lạnh', 'Công nghệ 2 dàn lạnh độc lập, Tấm hợp kim giữ nhiệt Alloy Cooling', NULL),
(204, 20, 'Công nghệ kháng khuẩn khử mùi', 'Công nghệ PureBio kết hợp tia Plasma', NULL),
(205, 20, 'Công nghệ bảo quản thực phẩm', 'Giữ nguyên hương vị với Flexible Zone, Tăng cường dưỡng chất với Moisture Zone', NULL),
(206, 20, 'Tiện ích', 'Bảng điều khiển bên ngoài, Chuông báo khi quên đóng cửa, Chế độ cấp đông nhanh, Có khóa, Làm lạnh nhanh, Ngăn giữ hương vị không cần rã đông Flexible Zone', NULL),
(207, 20, 'Kích thước - Khối lượng', 'Cao 189.8 cm - Rộng 83.3 cm - Sâu 64.8 cm - Nặng 107 kg', NULL),
(208, 20, 'Nơi sản xuất', 'Trung Quốc', NULL),
(209, 20, 'Năm ra mắt', '2020', NULL),
(210, 20, 'Hãng', 'Toshiba', NULL),
(211, 21, 'Loại nồi', 'Nồi cơm điện tử', NULL),
(212, 21, 'Dung tích', '1.8 lít, Số người ăn 4 - 6 người', NULL),
(213, 21, 'Công suất', '790 - 940W', NULL),
(214, 21, 'Lòng nồi dày', '1.427 mm, Hợp kim phủ đá Maifan chống dính (Bakuhanseki)', NULL),
(215, 21, 'Điều khiển', 'Nút nhấn có màn hình hiển thị', NULL),
(216, 21, 'Tiện ích', 'Có xửng hấp, Giữ ấm 24 giờ, Hẹn giờ 24 giờ', NULL),
(217, 21, 'Thương hiệu của', 'Hà Lan', NULL),
(218, 21, 'Hãng', 'Philips', NULL),
(219, 22, 'Loại nồi', 'Nồi cơm nắp gài', NULL),
(220, 22, 'Dung tích', '1.8 lít, Số người ăn 4 - 6 người', NULL),
(221, 22, 'Công suất', '700W', NULL),
(222, 22, 'Lòng nồi dày', '1.5 mm, Hợp kim nhôm phủ chống dính', NULL),
(223, 22, 'Điều khiển', 'Nút gạt', NULL),
(224, 22, 'Tiện ích', 'Có xửng hấp', NULL),
(225, 22, 'Thương hiệu của', 'Singapore', NULL),
(226, 22, 'Hãng', 'BlueStone', NULL),
(227, 23, 'Dung tích tổng', '12 lít', NULL),
(228, 23, 'Dung tích sử dụng', '12 lít', NULL),
(229, 23, 'Điều chỉnh', '80 - 200°C, 0 - 60 phút', NULL),
(230, 23, 'Phụ kiện chính', '2 vỉ nướng, Giỏ chiên, Khay nướng, Khay xiên quay, Tay cầm, Xiên nướng gà', NULL),
(231, 23, 'Chất liệu nồi', 'Khoang lò thép mạ kẽm, Vỏ nhựa ABS', NULL),
(232, 23, 'Công nghệ, công suất', 'Thanh nhiệt điện trở 1800W', NULL),
(233, 23, 'Chức năng nấu', 'Chiên, nướng thực phẩm', NULL),
(234, 23, 'Bảng điều khiển', 'Nút xoay', NULL),
(235, 23, 'Tiện ích', 'Có đèn báo hoạt động, Nắp kính trong suốt, quan sát được quá trình nấu, Quạt đối lưu, Đèn trong khoang lò', NULL),
(236, 23, 'Năm ra mắt', '2023', NULL),
(237, 23, 'Thương hiệu của', 'Ý', NULL),
(238, 23, 'Hãng', 'Ferroli', NULL),
(239, 24, 'Dung tích tổng', '4 lít', NULL),
(240, 24, 'Dung tích sử dụng', '3.5 lít', NULL),
(241, 24, 'Điều chỉnh', '80 - 200°C, 0 - 30 phút', NULL),
(242, 24, 'Phụ kiện chính', 'Rổ chiên', NULL),
(243, 24, 'Chất liệu nồi', 'Khay chiên phủ chống dính Ceramic', NULL),
(244, 24, 'Công nghệ, công suất', 'Làm nóng điện trở nhiệt 1400W', NULL),
(245, 24, 'Chức năng nấu', 'Chiên, nướng thực phẩm', NULL),
(246, 24, 'Bảng điều khiển', 'Nút xoay', NULL),
(247, 24, 'Tiện ích', 'Tay cầm bọc nhựa cách nhiệt, Tự ngắt khi quá nhiệt, Tự động ngắt khi kéo lòng nồi', NULL),
(248, 24, 'Năm ra mắt', '2019', NULL),
(249, 24, 'Thương hiệu của', 'Việt Nam', NULL),
(250, 24, 'Hãng', 'Kangaroo', NULL),
(251, 25, 'Loại bếp', 'Bếp từ hồng ngoại, Bếp âm cần lắp CB', NULL),
(252, 25, 'Công suất vùng nấu', 'Hồng ngoại: 2200W - Từ: 2200/3000W', NULL),
(253, 25, 'Chất liệu mặt bếp', 'Kính Ceramic - K+ (Pháp)', NULL),
(254, 25, 'Bảng điều khiển', 'Cảm ứng', NULL),
(255, 25, 'Loại nồi nấu', 'Vùng từ sử dụng nồi có đáy nhiễm từ, vùng hồng ngoại không kén nồi', NULL),
(256, 25, 'Tính năng an toàn', 'Cảnh báo khi không có nồi, Cảnh báo mặt bếp nóng, Khóa bảng điều khiển, Tự ngắt khi bếp nóng quá tải, Tự ngắt khi điện áp quá cao/thấp, Tự tắt bếp khi nước tràn đến bảng điều khiển, Tự tắt khi không sử dụng', NULL),
(257, 25, 'Tiện ích', 'Bảng điều khiển cảm ứng trượt, Chức năng làm nóng nhanh, Có hẹn giờ, Công nghệ Inverter tiết kiệm điện', NULL),
(258, 25, 'Kích thước lỗ đá', 'Ngang 68 cm - Dọc 39 cm', NULL),
(259, 25, 'Thương hiệu của', 'Đức', NULL),
(260, 25, 'Hãng', 'Pramie', NULL),
(261, 26, 'Loại bếp', 'Bếp hồng ngoại 3 vùng nấu, Bếp âm cần lắp CB', NULL),
(262, 26, 'Công suất vùng nấu', 'Trái dưới: 1800W - Trái trên: 1200W - Phải: 1050 - 1950 - 2700W', NULL),
(263, 26, 'Chất liệu mặt bếp', 'Kính Ceramic - Smeg (Ý)', NULL),
(264, 26, 'Bảng điều khiển', 'Cảm ứng', NULL),
(265, 26, 'Loại nồi nấu', 'Tất cả loại nồi', NULL),
(266, 26, 'Tính năng an toàn', 'Cảnh báo mặt bếp nóng, Khóa bảng điều khiển, Tự ngắt khi bếp nóng quá tải, Tự tắt bếp khi nước tràn đến bảng điều khiển', NULL),
(267, 26, 'Tiện ích', 'Có hẹn giờ', NULL),
(268, 26, 'Kích thước lỗ đá', 'Ngang 56 cm - Dọc 49 cm', NULL),
(269, 26, 'Thương hiệu của', 'Ý', NULL),
(270, 26, 'Hãng', 'Smeg', NULL),
(271, 28, 'Loại máy', '1 chiều (chỉ làm lạnh)Có Inverter', NULL),
(272, 28, 'Công suất làm lạnh', '1.5 HP - 12.000 BTU', NULL),
(273, 28, 'Phạm vi làm lạnh hiệu quả', 'Từ 15 - 20m² (từ 40 đến 60 m³)', NULL),
(274, 28, 'Lọc bụi, kháng khuẩn, khử mùi', 'Hệ thống làm sạch không khí tích hợp 5 lớp', NULL),
(275, 28, 'Công nghệ tiết kiệm điện', 'EconomyInverter', NULL),
(276, 28, 'Làm lạnh nhanh', 'Super', NULL),
(277, 28, 'Tiện ích', 'Chế độ hoạt động thông minh SmartChế độ vận hành khi ngủChức năng hút ẩmChức năng tự làm sạchChức năng đảo gió 4DCảm biến nhiệt độ iFeelDàn tản nhiệt Blue Fin phủ ion Ag+ kháng khuẩnHoạt động siêu êm QuietHẹn giờ bật tắt máyMàn hình hiển thị nhiệt độ trên dàn lạnhRemote có đèn LEDTự khởi động lại khi có điện', NULL),
(278, 28, 'Tiêu thụ điện', '1.22 kW/h5 sao (Hiệu suất năng lượng 4.66)', NULL),
(279, 28, 'Dàn lạnh', 'Dài 82.2 cm - Cao 25.8 cm - Dày 20.3 cm - Nặng 7.5 kg', NULL),
(280, 28, 'Dàn nóng', 'Dài 72 cm - Cao 48.2 cm - Dày 25.7 cm - Nặng 22.5 kg', NULL),
(281, 29, 'Loại máy', '1 chiều (chỉ làm lạnh)Có Inverter', NULL),
(282, 29, 'Công suất làm lạnh', '1.5 HP - 12.000 BTU', NULL),
(283, 29, 'Phạm vi làm lạnh hiệu quả', 'Từ 15 - 20m² (từ 40 đến 60 m³)', NULL),
(284, 29, 'Lọc bụi, kháng khuẩn, khử mùi', 'Bộ lọc Copper Anti-bacteria Filter', NULL),
(285, 29, 'Công nghệ tiết kiệm điện', 'Digital Inverter BoostEco', NULL),
(286, 29, 'Làm lạnh nhanh', 'Fast Cooling', NULL),
(287, 29, 'Tiện ích', 'Chế độ ngủ ngon Good SleepChế độ Wind-Free cho hơi lạnh thoải máiChức năng khử ẩmChức năng tự làm sạch Auto CleanHẹn giờ bật tắt máyMàn hình hiển thị nhiệt độ trên dàn lạnhTự khởi động lại khi có điện', NULL),
(288, 29, 'Tiêu thụ điện', '1.16 kW/h5 sao (Hiệu suất năng lượng 4.60)', NULL),
(289, 29, 'Dàn lạnh', 'Dài 82 cm - Cao 29.9 cm - Dày 21.5 cm - Nặng 9.2 kg', NULL),
(290, 29, 'Dàn nóng', 'Dài 72 cm - Cao 54.8 cm - Dày 26.5 cm - Nặng 22.6 kg', NULL),
(291, 30, 'Loại tivi', 'Smart Tivi QLED75 inch4K', NULL),
(292, 30, 'Hệ điều hành', 'Tizen™', NULL),
(293, 30, 'Ứng dụng phổ biến', 'Amazon Prime videoApple TVClip TVFPT PlayMyTVNetflixSpotifyTrình duyệt webVieONYouTube', NULL),
(294, 30, 'Công nghệ hình ảnh', 'Ambient Mode+Chuyển động mượt Motion Xcelerator Turbo+Chế độ Game Motion PlusChống xé hình FreeSync Premium ProCăn chỉnh hình ảnh tự động bảo vệ mắt EyeComfortGiảm độ trễ chơi game Auto Low Latency Mode (ALLM)Góc nhìn rộng Wide Viewing AngleMàu sắc chuẩn chứng nhận PANTONEQuantum DotQuantum HDR+Real Depth EnhancerSuper Ultra Wide Game View & Game BarSupreme UHD DimmingĐèn nền Direct Full Array 8X 96 vùng kiểm soát', NULL),
(295, 30, 'Điều khiển bằng giọng nói', 'Bixby có tiếng ViệtTìm kiếm giọng nói trên YouTube bằng tiếng Việt', NULL),
(296, 30, 'Remote thông minh', 'One Remote sạc qua USB C & ánh sáng', NULL),
(297, 30, 'Chiếu hình từ điện thoại lên TV', 'AirPlay 2Screen MirroringTap View', NULL),
(298, 30, 'Kích thước', 'Ngang 167.06 cm - Cao 101.89 cm - Dày 31.35 cm', NULL),
(299, 30, 'Năm ra mắt', '2023', NULL),
(300, 30, 'Hãng', 'Samsung', NULL),
(301, 31, 'Loại tivi', 'Google Tivi75 inch4K', NULL),
(302, 31, 'Hệ điều hành', 'Google TV', NULL),
(303, 31, 'Ứng dụng phổ biến', 'FPT PlayGalaxy Play (Fim+)NetflixVieONYouTube', NULL),
(304, 31, 'Công nghệ hình ảnh', 'Dolby VisionGiảm độ trễ chơi game Auto Low Latency Mode (ALLM)HDR10HLGLàm mượt chuyển động XR Motion ClarityNâng cấp hình ảnh 4K X-Reality PROTinh năng Game MenuTính năng chơi game 4K 120fpsTăng cường màu sắc Triluminos ProTăng cường tương phản Dynamic Contrast EnhancerX-tended Dynamic RangeĐồng bộ khung hình/tần số quét chơi game VRR', NULL),
(305, 31, 'Điều khiển bằng giọng nói', 'Google Assistant có tiếng ViệtTìm kiếm giọng nói trên YouTube bằng tiếng Việt', NULL),
(306, 31, 'Remote thông minh', 'Remote tích hợp micro tìm kiếm bằng giọng nói', NULL),
(307, 31, 'Chiếu hình từ điện thoại lên TV', 'AirPlay 2Chromecast', NULL),
(308, 31, 'Kích thước', 'Ngang 167.1 cm - Cao 103.7 cm - Dày 39.9 cm', NULL),
(309, 31, 'Năm ra mắt', '2023', NULL),
(310, 31, 'Hãng', 'Sony', NULL),
(311, 32, 'CPU', 'Apple M3', 'Max300 GB/s memory bandwidth'),
(312, 32, 'RAM', '36 GB', NULL),
(313, 32, 'Ổ cứng', '1 TB SSD', NULL),
(314, 32, 'Màn hình', '14.2\" Liquid Retina XDR display (3024 x 1964)120Hz', NULL),
(315, 32, 'Card màn hình', 'Card tích hợp30 nhân GPU', NULL),
(316, 32, 'Cổng kết nối', '3 x Thunderbolt 4 (hỗ trợ DisplayPort, Thunderbolt 4 (up to 40Gb/s), USB 4 (up to 40Gb/s))HDMIJack tai nghe 3.5 mmMagSafe 3', NULL),
(317, 32, 'Đặc biệt', 'Có đèn bàn phím', NULL),
(318, 32, 'Hệ điều hành', 'macOS Sonoma', NULL),
(319, 32, 'Thiết kế', 'Vỏ nhôm tái chế 100%', NULL),
(320, 32, 'Kích thước, khối lượng', 'Dài 312.6 mm - Rộng 221.2 mm - Dày 15.5 mm - Nặng 1.61 kg', NULL),
(321, 33, 'CPU', 'Apple M1', NULL),
(322, 33, 'RAM', '8 GB', NULL),
(323, 33, 'Ổ cứng', '256 GB SSD', NULL),
(324, 33, 'Màn hình', '13.3\" Retina (2560 x 1600)', NULL),
(325, 33, 'Card màn hình', 'Card tích hợp7 nhân GPU', NULL),
(326, 33, 'Cổng kết nối', '2 x Thunderbolt 3 (USB-C)Jack tai nghe 3.5 mm', NULL),
(327, 33, 'Đặc biệt', 'Có đèn bàn phím', NULL),
(328, 33, 'Hệ điều hành', 'macOS', NULL),
(329, 33, 'Thiết kế', 'Vỏ kim loại nguyên khối', NULL),
(330, 33, 'Kích thước, khối lượng', 'Dài 304.1 mm - Rộng 212.4 mm - Dày 4.1 mm đến 16.1 mm - Nặng 1.29 kg', NULL),
(331, 34, 'CPU', 'i3, 1215U, 1.2GHz', NULL),
(332, 34, 'RAM', '8 GB DDR4 2 khe (1 khe 8 GB + 1 khe rời) 3200 MHz', NULL),
(333, 34, 'Ổ cứng', '512 GB SSD NVMe PCIe', NULL),
(334, 34, 'Màn hình', '15.6\" Full HD (1920 x 1080)', NULL),
(335, 34, 'Card màn hình', 'Card tích hợp Intel UHD', NULL),
(336, 34, 'Cổng kết nối', '1 x USB Type-C (chỉ hỗ trợ truyền dữ liệu)2 x USB Type-AHDMIJack tai nghe 3.5 mm', NULL),
(337, 34, 'Hệ điều hành', 'Windows 11 Home SL', NULL),
(338, 34, 'Thiết kế', 'Vỏ nhựa', NULL),
(339, 34, 'Kích thước, khối lượng', 'Dài 358.5 mm - Rộng 242 mm - Dày 17.9 mm - Nặng 1.69 kg', NULL),
(340, 34, 'Thời điểm ra mắt', '2023', NULL),
(341, 35, 'Kiểu tủ', 'Ngăn đá trên', NULL),
(342, 35, 'Dung tích sử dụng', '256 lít - 2 - 3 người', NULL),
(343, 35, 'Công nghệ tiết kiệm điện', 'Digital Inverter', NULL),
(344, 35, 'Công nghệ làm lạnh', 'Công nghệ All-around Cooling giúp kiểm soát chặt chẽ sự thay đổi nhiệt độ', NULL),
(345, 35, 'Công nghệ kháng khuẩn khử mùi', 'Bộ lọc than hoạt tính Deodorizer', NULL),
(346, 35, 'Công nghệ bảo quản thực phẩm', 'Ngăn rau củ lớn giữ ẩm Big BoxNgăn đông mềm -1 độ C Optimal Fresh Zone', NULL),
(347, 35, 'Tiện ích', 'Ngăn kéo Easy Slide giúp lấy thực phẩm dễ dàng', NULL),
(348, 35, 'Kích thước - Khối lượng', 'Cao 163.5 cm - Rộng 55.5 cm - Sâu 63.7 cm - Nặng 47.5 kg', NULL),
(349, 35, 'Nơi sản xuất', 'Việt Nam', NULL),
(350, 35, 'Năm ra mắt', '2020', NULL),
(351, 36, 'Kiểu tủ', 'Multi Door', NULL),
(352, 36, 'Dung tích sử dụng', '401 lít - 4 - 5 người', NULL),
(353, 36, 'Công nghệ tiết kiệm điện', 'Chế độ Extra EcoChế độ kỳ nghỉ tiết kiệm điệnJ-tech Inverter', NULL),
(354, 36, 'Công nghệ làm lạnh', 'Làm lạnh đa chiều', NULL),
(355, 36, 'Công nghệ kháng khuẩn khử mùi', 'Bộ lọc với các phân tử Ag+Cu NanoPlasmacluster Ion', NULL),
(356, 36, 'Công nghệ bảo quản thực phẩm', 'Ngăn rau củ giữ ẩm Humidity Control', NULL),
(357, 36, 'Tiện ích', 'Bảng điều khiển bên ngoàiChuông báo khi quên đóng cửaChế độ cấp đông nhanhKhoá trẻ em', NULL),
(358, 36, 'Kích thước - Khối lượng', 'Cao 180 cm - Rộng 79 cm - Sâu 68 cm - Nặng 97 kg', NULL),
(359, 36, 'Nơi sản xuất', 'Trung Quốc', NULL),
(360, 36, 'Năm ra mắt', '2020', NULL),
(361, 37, 'Kiểu tủ', 'Tủ lớn - Side by side', NULL),
(362, 37, 'Dung tích sử dụng', '519 lít - 4 - 5 người', NULL),
(363, 37, 'Công nghệ tiết kiệm điện', 'Linear InverterSmart Inverter', NULL),
(364, 37, 'Công nghệ làm lạnh', 'Làm lạnh đa chiều', NULL),
(365, 37, 'Công nghệ kháng khuẩn khử mùi', 'Bộ lọc khử mùi than hoạt tính', NULL),
(366, 37, 'Công nghệ bảo quản thực phẩm', 'Linear Cooling', NULL),
(367, 37, 'Tiện ích', 'Bảng điều khiển bên ngoài', NULL),
(368, 37, 'Kích thước - Khối lượng', 'Cao 178.6 cm - Rộng 91 cm - Sâu 64.3 cm - Nặng 83 kg', NULL),
(369, 37, 'Nơi sản xuất', 'Trung Quốc', NULL),
(370, 37, 'Năm ra mắt', '2023', NULL),
(371, 38, 'Dung tích tổng', '6 lít', NULL),
(372, 38, 'Dung tích sử dụng', '5.5 lít', NULL),
(373, 38, 'Điều chỉnh', '100 - 200°C0 - 30 phút', NULL),
(374, 38, 'Phụ kiện chính', 'Rổ chiên', NULL),
(375, 38, 'Chất liệu nồi', 'Lòng nồi thép phủ chống dínhVỏ inox 304 và nhựa PP', NULL),
(376, 38, 'Công nghệ, công suất', 'Rapid Air1600W', NULL),
(377, 38, 'Chức năng nấu', 'Chiên, nướng thực phẩm', NULL),
(378, 38, 'Bảng điều khiển', 'Nút xoay', NULL),
(379, 38, 'Tiện ích', 'Có đèn báo hoạt động Tự ngắt khi quá nhiệt Tự động ngắt khi kéo lòng nồi', NULL),
(380, 38, 'Năm ra mắt', '2021', NULL),
(381, 39, 'Dung tích tổng', '9.5 lít', NULL),
(382, 39, 'Dung tích sử dụng', '9 lít', NULL),
(383, 39, 'Điều chỉnh', '100 - 200°C0 - 30 phút', NULL),
(384, 39, 'Phụ kiện chính', 'Vỉ tách dầu', NULL),
(385, 39, 'Chất liệu nồi', 'Lòng nồi thép phủ chống dínhVỏ inox và nhựa PP', NULL),
(386, 39, 'Công nghệ, công suất', 'Rapid Air1800W', NULL),
(387, 39, 'Chức năng nấu', 'Chiên, nướng thực phẩm', NULL),
(388, 39, 'Bảng điều khiển', 'Nút xoay', NULL),
(389, 39, 'Tiện ích', 'Có đèn báo hoạt động Quạt đối lưu Tự ngắt khi quá nhiệt', NULL),
(390, 39, 'Năm ra mắt', '2022', NULL),
(391, 40, 'Dung tích tổng', '6.5 lít', NULL),
(392, 40, 'Dung tích sử dụng', '5.5 lít', NULL),
(393, 40, 'Điều chỉnh', '80 - 200°C0 - 60 phút', NULL),
(394, 40, 'Phụ kiện chính', 'Rổ chiên', NULL),
(395, 40, 'Chất liệu nồi', 'Lòng nồi hợp kim nhôm phủ chống dính GreblonVỏ bằng nhựa PP', NULL),
(396, 40, 'Công nghệ, công suất', 'Rapid Air1700W', NULL),
(397, 40, 'Chức năng nấu', 'Chiên, nướng thực phẩm', NULL),
(398, 40, 'Bảng điều khiển', 'Cảm ứng có màn hình hiển thị', NULL),
(399, 40, 'Tiện ích', '8 chương trình cài đặt sẵn Có thể vệ sinh bằng máy rửa chén Ghi nhớ chương trình nấu Tự ngắt khi quá nhiệt Tự động ngắt khi kéo lòng nồi', NULL),
(400, 40, 'Năm ra mắt', '2020', NULL),
(401, 41, 'Dung tích tổng', '5 lít', NULL),
(402, 41, 'Dung tích sử dụng', '4.5 lít', NULL),
(403, 41, 'Điều chỉnh', '80 - 200°C0 - 60 phút', NULL),
(404, 41, 'Phụ kiện chính', 'Rổ chiên', NULL),
(405, 41, 'Chất liệu nồi', 'Lòng nồi kim loại phủ chống dínhVỏ nhựa chịu nhiệt cao cấp', NULL),
(406, 41, 'Công nghệ, công suất', 'Rapid Air2000W', NULL),
(407, 41, 'Chức năng nấu', 'Chiên, nướng thực phẩm', NULL),
(408, 41, 'Bảng điều khiển', 'Cảm ứng có màn hình hiển thị', NULL),
(409, 41, 'Tiện ích', '8 chương trình cài đặt sẵn Chân đế chống trượt Tay cầm bọc nhựa cách nhiệt Tính năng tạm dừng Tự ngắt khi quá nhiệt Tự động ngắt khi kéo lòng nồi', NULL),
(410, 41, 'Năm ra mắt', '2019', NULL),
(411, 42, 'Dung tích tổng', '5.5 lít', NULL),
(412, 42, 'Dung tích sử dụng', '5 lít', NULL),
(413, 42, 'Điều chỉnh', '80 - 200°C0 - 60 phút', NULL),
(414, 42, 'Phụ kiện chính', 'Rổ chiên', NULL),
(415, 42, 'Chất liệu nồi', 'Lòng nồi kim loại phủ chống dínhVỏ nhựa và inox', NULL),
(416, 42, 'Công nghệ, công suất', 'Rapid Air2000W', NULL),
(417, 42, 'Chức năng nấu', 'Chiên, nướng thực phẩm', NULL),
(418, 42, 'Bảng điều khiển', 'Cảm ứng có màn hình hiển thị', NULL),
(419, 42, 'Tiện ích', '8 chương trình cài đặt sẵn Chân đế chống trượt Quạt đối lưu Tự động ngắt khi kéo lòng nồiTự ngắt khi quá nhiệt', NULL),
(420, 42, 'Năm ra mắt', '2020', NULL),
(421, 43, 'Loại máy', 'Cửa trên, Lồng đứng', NULL),
(422, 43, 'Khối lượng giặt', '7 Kg, Từ 2 - 3 người', NULL),
(423, 43, 'Kiểu động cơ', 'Truyền động gián tiếp (dây Curoa)', NULL),
(424, 43, 'Công nghệ giặt', 'Chuyển động giặt đảo chiều gỡ rối quần áo, Chức năng tự cân chỉnh tiết kiệm nước, Công nghệ suy luận ảo Fuzzy Logic, Lồng giặt ngôi sao pha lê, Mâm giặt 864 lỗ tạo tia nước phun ngược ngăn quần áo chạm vào mâm', NULL),
(425, 43, 'Tiện ích', 'Cho phép tùy chỉnh chuyên sâu từng chu trình, Chức năng ghi nhớ các tùy chọn yêu thích, Hẹn giờ bắt đầu giặt, Khóa trẻ em, Nắp máy trợ lực chống kẹt tay, Tự khởi động lại khi có điện, Vệ sinh lồng giặt', NULL),
(426, 43, 'Bảng điều khiển', 'Song ngữ Anh - Việt có nút nhấn', NULL),
(427, 43, 'Chất liệu lồng giặt', 'Thép không gỉ', NULL),
(428, 43, 'Kích thước - Khối lượng', 'Cao 92 cm - Ngang 51.5 cm - Sâu 55 cm - Nặng 33 kg', NULL),
(429, 43, 'Hãng', 'Toshiba', NULL),
(430, 44, 'Loại máy', 'Cửa trước, Lồng ngang, Có Inverter', NULL),
(431, 44, 'Khối lượng giặt', '8.5 Kg, Từ 3 - 5 người', NULL),
(432, 44, 'Kiểu động cơ', 'Truyền động gián tiếp (dây Curoa)', NULL),
(433, 44, 'Công nghệ giặt', 'Công nghệ cân bằng AIDBT, Làm mới quần áo bằng hơi nước Refresh, Lồng giặt lớn 525 mm, Lồng giặt PillowSmart Dual Spray tự làm sạch mặt trong cửa, Vòng đệm cửa kháng khuẩn ABT', NULL),
(434, 44, 'Tiện ích', 'Giặt nhanh 15 phútHẹn giờ giặt, Khóa trẻ em', NULL),
(435, 44, 'Bảng điều khiển', 'Song ngữ Anh - Việt có nút xoay, nút nhấn và màn hình hiển thị', NULL),
(436, 44, 'Chất liệu lồng giặt', 'Thép không gỉ', NULL),
(437, 44, 'Kích thước - Khối lượng', 'Cao 84.1 cm - Ngang 59.5 cm - Sâu 50 cm - Nặng 58 kg', NULL),
(438, 44, 'Hãng', 'Aqua', NULL),
(439, 45, 'Màn hình', 'IPS LCD, 6.56\"HD+', NULL),
(440, 45, 'Hệ điều hành', 'Android 13', NULL),
(441, 45, 'Camera sau', 'Chính 50 MP & Phụ 2 MP', NULL),
(442, 45, 'Camera trước', '5 MP', NULL),
(443, 45, 'Chip', 'MediaTek Helio G85', NULL),
(444, 45, 'RAM', '4 GB', NULL),
(445, 45, 'Dung lượng lưu trữ', '128 GB', NULL),
(446, 45, 'SIM', '2 Nano SIM, Hỗ trợ 4G', NULL),
(447, 45, 'Pin, Sạc', '5000 mAh, 33 W', NULL),
(448, 46, 'Màn hình', 'IPS LCD, 6.64\"Full HD+', NULL),
(449, 46, 'Hệ điều hành', 'Android 13', NULL),
(450, 46, 'Camera sau', 'Chính 50 MP & Phụ 2 MP', NULL),
(451, 46, 'Camera trước', '16 MP', NULL),
(452, 46, 'Chip', 'Snapdragon 680', NULL),
(453, 46, 'RAM', '8 GB', NULL),
(454, 46, 'Dung lượng lưu trữ', '128 GB', NULL),
(455, 46, 'SIM', '2 Nano SIM, Hỗ trợ 4G', NULL),
(456, 46, 'Pin, Sạc', '5000 mAh, 44 W', NULL),
(457, 47, 'Màn hình', 'IPS LCD, 6.74\"HD+', NULL),
(458, 47, 'Hệ điều hành', 'Android 13', NULL),
(459, 47, 'Camera sau', 'Chính 50 MP & Phụ 0.08 MP', NULL),
(460, 47, 'Camera trước', '8 MP', NULL),
(461, 47, 'Chip', 'Unisoc Tiger T612', NULL),
(462, 47, 'RAM', '6 GB', NULL),
(463, 47, 'Dung lượng lưu trữ', '128 GB', NULL),
(464, 47, 'SIM', '2 Nano SIM, Hỗ trợ 4G', NULL),
(465, 47, 'Pin, Sạc', '5000 mAh, 33 W', NULL),
(466, 48, 'Màn hình', '11\", TFT LCD', NULL),
(467, 48, 'Hệ điều hành', 'Android 13', NULL),
(468, 48, 'Chip', 'Snapdragon 695', NULL),
(469, 48, 'RAM', '4 GB', NULL),
(470, 48, 'Dung lượng lưu trữ', '64 GB', NULL),
(471, 48, 'Kết nối', '5G, Có nghe gọi', NULL),
(472, 48, 'SIM', '1 Nano SIM', NULL),
(473, 48, 'Camera sau', '8 MP', NULL),
(474, 48, 'Camera trước', '5 MP', NULL),
(475, 48, 'Pin, Sạc', '7040 mAh, 15 W', NULL),
(476, 48, 'Hãng', 'Samsung', NULL),
(477, 49, 'Màn hình', '11\", IPS LCD', NULL),
(478, 49, 'Hệ điều hành', 'Android 13', NULL),
(479, 49, 'Chip', 'Snapdragon 680 8 nhân', NULL),
(480, 49, 'RAM', '4 GB', NULL),
(481, 49, 'Dung lượng lưu trữ', '128 GB', NULL),
(482, 49, 'Camera sau', '8 MP', NULL),
(483, 49, 'Camera trước', '5 MP', NULL),
(484, 49, 'Pin, Sạc', '8000 mAh, 10 W', NULL),
(485, 50, 'Màn hình', '12.9\", Liquid Retina XDR', NULL),
(486, 50, 'Hệ điều hành', 'iPadOS 16', NULL),
(487, 50, 'Chip', 'Apple M2 8 nhân', NULL),
(488, 50, 'RAM', '8 GB', NULL),
(489, 50, 'Dung lượng lưu trữ', '512 GB', NULL),
(490, 50, 'Kết nối', 'Nghe gọi qua FaceTime', NULL),
(491, 50, 'Camera sau', 'Chính 12 MP & Phụ 10 MP, TOF 3D LiDAR', NULL),
(492, 50, 'Camera trước', '12 MP', NULL),
(493, 50, 'Pin, Sạc', '40.88 Wh (~ 10.835 mAh), 20 W', NULL),
(494, 51, 'Màn hình', '10.1\"IPS LCD', NULL),
(495, 51, 'Hệ điều hành', 'Android 11', NULL),
(496, 51, 'Chip', 'Unisoc T610', NULL),
(497, 51, 'RAM', '3 GB', NULL),
(498, 51, 'Dung lượng lưu trữ', '32 GB', NULL),
(499, 51, 'Kết nối', 'Hỗ trợ 4G, Có nghe gọi', NULL),
(500, 51, 'SIM', '1 Nano SIM', NULL),
(501, 51, 'Camera sau', '8 MP', NULL),
(502, 51, 'Camera trước', '5 MP', NULL),
(503, 51, 'Pin, Sạc', '5000 mAh, 10 W', NULL),
(504, 52, 'Loại nồi', 'Nồi cơm điện tử', NULL),
(505, 52, 'Dung tích', '1.8 lít, Số người ăn 4 - 6 người', NULL),
(506, 52, 'Công suất', '835W', NULL),
(507, 52, 'Lòng nồi dày', '1.183 mm, Nhôm phủ chống dính', NULL),
(508, 52, 'Điều khiển', 'Nút nhấn có màn hình hiển thị', NULL),
(509, 52, 'Tiện ích', 'Có xửng hấp, Giữ ấm 12 giờHẹn giờ 24 giờ', NULL),
(510, 52, 'Thương hiệu của', 'Nhật Bản', NULL),
(511, 52, 'Hãng', 'Sharp', NULL),
(512, 53, 'Loại nồi', 'Nồi cơm điện tử', NULL),
(513, 53, 'Dung tích', '1.8 lít, Số người ăn 4 - 6 người', NULL),
(514, 53, 'Công suất', '790W', NULL),
(515, 53, 'Lòng nồi dày', '2.2 mmHợp kim nhôm phủ chống dính', NULL),
(516, 53, 'Điều khiển', 'Nút nhấn có màn hình hiển thị', NULL),
(517, 53, 'Tiện ích', 'Có xửng hấp, Giữ ấm 24 giờ, Hẹn giờ đến 15 giờ', NULL),
(518, 53, 'Thương hiệu của', 'Nhật Bản', NULL),
(519, 53, 'Hãng', 'Sharp', NULL),
(520, 54, 'Loại nồi', 'Nồi cơm điện tử', NULL),
(521, 54, 'Dung tích', '1.8 lít, Số người ăn 4 - 6 người', NULL),
(522, 54, 'Công suất', '800W', NULL),
(523, 54, 'Lòng nồi dày', '4 mm, Hợp kim nhôm phủ chống dính', NULL),
(524, 54, 'Điều khiển', 'Nút nhấn có màn hình hiển thị', NULL),
(525, 54, 'Tiện ích', 'Có xửng hấp, Giữ ấm lên đến 30 giờ, Hẹn giờ 24 giờ', NULL),
(526, 54, 'Thương hiệu của', 'Nhật Bản', NULL),
(527, 54, 'Hãng', 'Toshiba', NULL),
(528, 55, 'Loại bếp', 'Bếp từ đôi, Bếp âm cần lắp CB', NULL),
(529, 55, 'Công suất vùng nấu', 'Trái: 2000W - Phải: 2000W', NULL),
(530, 55, 'Chất liệu mặt bếp', 'Kính Ceramic', NULL),
(531, 55, 'Bảng điều khiển', 'Cảm ứng', NULL),
(532, 55, 'Loại nồi nấu', 'Chỉ sử dụng loại nồi có đế nhiễm từ', NULL),
(533, 55, 'Tính năng an toàn', 'Khóa bảng điều khiển, Tự ngắt khi bếp nóng quá tải', NULL),
(534, 55, 'Tiện ích', 'Có hẹn giờ', NULL),
(535, 55, 'Kích thước lỗ đá', 'Ngang 69.5 cm - Dọc 39.5 cm', NULL),
(536, 55, 'Thương hiệu của', 'Singapore', NULL),
(537, 55, 'Hãng', 'BlueStone', NULL),
(538, 56, 'Loại bếp', 'Bếp từ đôi, Bếp âm cần lắp CB', NULL),
(539, 56, 'Công suất vùng nấu', 'Trái: 2000/2200W - Phải: 2000/2200W', NULL),
(540, 56, 'Chất liệu mặt bếp', 'Kính Ceramic - Schott Ceran (Đức)', NULL),
(541, 56, 'Bảng điều khiển', 'Cảm ứng', NULL),
(542, 56, 'Loại nồi nấu', 'Chỉ sử dụng loại nồi có đế nhiễm từ', NULL),
(543, 56, 'Tính năng an toàn', 'Cảnh báo mặt bếp nóng, Cảnh báo nồi chảo không phù hợp, Khóa bảng điều khiển, Tự ngắt khi không có nồi, Tự nhận diện kích cỡ đáy nồi', NULL),
(544, 56, 'Tiện ích', 'Bảng điều khiển cảm ứng trượt, Chức năng làm nóng nhanh, Có hẹn giờ, Công nghệ Inverter tiết kiệm điện', NULL),
(545, 56, 'Kích thước lỗ đá', 'Ngang 68 cm - Dọc 38 cm', NULL),
(546, 56, 'Thương hiệu của', 'Đức', NULL),
(547, 56, 'Hãng', 'Hafele', NULL),
(548, 57, 'Loại bếp', 'Bếp từ hồng ngoại, Bếp âm cần lắp CB', NULL),
(549, 57, 'Công suất vùng nấu', 'Trái (Từ): 2000/2400W - Phải (Hồng ngoại): 2000W', NULL),
(550, 57, 'Chất liệu mặt bếp', 'Mặt kính Crystal - Trung Quốc', NULL),
(551, 57, 'Bảng điều khiển', 'Cảm ứng', NULL),
(552, 57, 'Loại nồi nấu', 'Vùng từ sử dụng nồi có đáy nhiễm từ, vùng hồng ngoại không kén nồi', NULL),
(553, 57, 'Tính năng an toàn', 'Cảnh báo nồi chảo không phù hợp, Khóa bảng điều khiển, Tính năng dừng bếp tạm thời, Tự ngắt khi bếp nóng quá tải, Tự ngắt khi không có nồi, Tự nhận diện kích cỡ đáy nồi', NULL),
(554, 57, 'Tiện ích', 'Bảng điều khiển cảm ứng trượt, Chức năng làm nóng nhanh, Có hẹn giờ', NULL),
(555, 57, 'Kích thước lỗ đá', 'Ngang 67.5 cm - Dọc 40.5 cm', NULL),
(556, 57, 'Thương hiệu của', 'Việt Nam', NULL),
(557, 57, 'Hãng', 'Kangaroo', NULL),
(571, 58, 'Loại tivi', 'Smart TV NanoCell75 inch4K', NULL),
(572, 58, 'Hệ điều hành', 'WebOS 22', NULL),
(573, 58, 'Ứng dụng phổ biến', 'Clip TVFPT PlayGalaxy Play (Fim+)MyTVNetflixNhaccuatuiPOPS KidsSpotifyTrình duyệt webTV 360VieONVTVcab ONYouTubeYouTube Kids', NULL),
(574, 58, 'Công nghệ hình ảnh', 'Active HDRChế độ game HGiGChế độ hình ảnh phù hợp nội dungDải màu rộng Nano ColorGiảm độ trễ chơi game Auto Low Latency Mode (ALLM)HDR Dynamic Tone MappingHDR10 ProHLGNâng cấp hình ảnh AI Picture Pro 4KNâng cấp độ phân giải 4K AI UpscalingTương thích bộ mã hóa Video decoder (VP9, AV1)Tương thích HEVC', NULL),
(575, 58, 'Điều khiển bằng giọng nói', 'Alexa (Chưa có tiếng Việt)Google Assistant (Chưa có tiếng Việt)LG Voice Search - tìm kiếm bằng giọng nói tiếng ViệtNhận diện giọng nói LG Voice RecognitionTìm kiếm giọng nói trên YouTube bằng tiếng Việt', NULL),
(576, 58, 'Remote thông minh', 'Magic Remote', NULL),
(577, 58, 'Chiếu hình từ điện thoại lên TV', 'AirPlay 2Screen Share', NULL),
(578, 58, 'Kích thước', 'Ngang 167.8 cm - Cao 104.5 cm - Dày 37.8 cm', NULL),
(579, 58, 'Năm ra mắt', '2022', NULL),
(580, 58, 'Hãng', 'LG', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_imgs`
--

CREATE TABLE `product_imgs` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `image_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `product_imgs`
--

INSERT INTO `product_imgs` (`image_id`, `product_id`, `image_name`, `image_is_display`) VALUES
(1, 1, 'P1_1.jpg', 1),
(2, 1, 'P1_2.jpg', 1),
(3, 1, 'P1_3.jpg', 1),
(4, 1, 'P1_4.jpg', 1),
(5, 1, 'P1_5.jpg', 1),
(6, 2, 'P2_1.jpg', 1),
(7, 2, 'P2_2.jpg', 1),
(8, 2, 'P2_3.jpg', 1),
(9, 2, 'P2_4.jpg', 1),
(10, 2, 'P2_5.jpg', 1),
(11, 3, 'P3_1.jpg', 1),
(12, 3, 'P3_2.jpg', 1),
(13, 3, 'P3_3.jpg', 1),
(14, 3, 'P3_4.jpg', 1),
(15, 3, 'P3_5.jpg', 1),
(16, 4, 'P4_1.jpg', 1),
(17, 4, 'P4_2.jpg', 1),
(18, 4, 'P4_3.jpg', 1),
(19, 4, 'P4_4.jpg', 1),
(20, 4, 'P4_5.jpg', 1),
(21, 5, 'P5_1.jpg', 1),
(22, 5, 'P5_2.jpg', 1),
(23, 5, 'P5_3.jpg', 1),
(24, 5, 'P5_4.jpg', 1),
(25, 5, 'P5_5.jpg', 1),
(26, 6, 'P6_1.jpg', 1),
(27, 6, 'P6_2.jpg', 1),
(28, 6, 'P6_3.jpg', 1),
(29, 6, 'P6_4.jpg', 1),
(30, 6, 'P6_5.jpg', 1),
(31, 7, 'P7_1.jpg', 1),
(32, 7, 'P7_2.jpg', 1),
(33, 7, 'P7_3.jpg', 1),
(34, 7, 'P7_4.jpg', 1),
(35, 7, 'P7_5.jpg', 1),
(36, 8, 'P8_1.jpg', 1),
(37, 8, 'P8_2.jpg', 1),
(38, 8, 'P8_3.jpg', 1),
(39, 8, 'P8_4.jpg', 1),
(40, 8, 'P8_5.jpg', 1),
(41, 9, 'P9_1.jpg', 1),
(42, 9, 'P9_2.jpg', 1),
(43, 9, 'P9_3.jpg', 1),
(44, 9, 'P9_4.jpg', 1),
(45, 9, 'P9_5.jpg', 1),
(46, 10, 'P10_1.jpg', 1),
(47, 10, 'P10_2.jpg', 1),
(48, 10, 'P10_3.jpg', 1),
(49, 10, 'P10_4.jpg', 1),
(50, 10, 'P10_5.jpg', 1),
(51, 11, 'P11_1.jpg', 1),
(52, 11, 'P11_2.jpg', 1),
(53, 11, 'P11_3.jpg', 1),
(54, 11, 'P11_4.jpg', 1),
(55, 11, 'P11_5.jpg', 1),
(56, 12, 'P12_1.jpg', 1),
(57, 12, 'P12_2.jpg', 1),
(58, 12, 'P12_3.jpg', 1),
(59, 12, 'P12_4.jpg', 1),
(60, 12, 'P12_5.jpg', 1),
(61, 13, 'P13_1.jpg', 1),
(62, 13, 'P13_2.jpg', 1),
(63, 13, 'P13_3.jpg', 1),
(64, 13, 'P13_4.jpg', 1),
(65, 13, 'P13_5.jpg', 1),
(66, 14, 'P14_1.jpg', 1),
(67, 14, 'P14_2.jpg', 1),
(68, 14, 'P14_3.jpg', 1),
(69, 14, 'P14_4.jpg', 1),
(70, 14, 'P14_5.jpg', 1),
(71, 15, 'P15_1.jpg', 1),
(72, 15, 'P15_2.jpg', 1),
(73, 15, 'P15_3.jpg', 1),
(74, 15, 'P15_4.jpg', 1),
(75, 15, 'P15_5.jpg', 1),
(76, 16, 'P16_1.jpg', 1),
(77, 16, 'P16_2.jpg', 1),
(78, 16, 'P16_3.jpg', 1),
(79, 16, 'P16_4.jpg', 1),
(80, 16, 'P16_5.jpg', 1),
(81, 17, 'P17_1.jpg', 1),
(82, 17, 'P17_2.jpg', 1),
(83, 17, 'P17_3.jpg', 1),
(84, 17, 'P17_4.jpg', 1),
(85, 17, 'P17_5.jpg', 1),
(86, 18, 'P18_1.jpg', 1),
(87, 18, 'P18_2.jpg', 1),
(88, 18, 'P18_3.jpg', 1),
(89, 18, 'P18_4.jpg', 1),
(90, 18, 'P18_5.jpg', 1),
(91, 19, 'P19_1.jpg', 1),
(92, 19, 'P19_2.png', 1),
(93, 19, 'P19_3.png', 1),
(94, 19, 'P19_4.png', 1),
(95, 19, 'P19_5.png', 1),
(96, 20, 'P20_1.jpg', 1),
(97, 20, 'P20_2.jpg', 1),
(98, 20, 'P20_3.jpg', 1),
(99, 20, 'P20_4.jpg', 1),
(100, 20, 'P20_5.jpg', 1),
(101, 21, 'P21_1.jpg', 1),
(102, 21, 'P21_2.gif', 1),
(103, 21, 'P21_3.jpg', 1),
(104, 21, 'P21_4.jpg', 1),
(105, 21, 'P21_5.jpg', 1),
(106, 22, 'P22_1.jpg', 1),
(107, 22, 'P22_2.gif', 1),
(108, 22, 'P22_3.jpg', 1),
(109, 22, 'P22_4.jpg', 1),
(110, 22, 'P22_5.jpg', 1),
(111, 23, 'P23_1.jpg', 1),
(112, 23, 'P23_2.jpg', 1),
(113, 23, 'P23_3.gif', 1),
(114, 23, 'P23_4.jpg', 1),
(115, 23, 'P23_5.jpg', 1),
(116, 24, 'P24_1.jpg', 1),
(117, 24, 'P24_2.jpg', 1),
(118, 24, 'P24_3.jpg', 1),
(119, 24, 'P24_4.jpg', 1),
(120, 24, 'P24_5.jpg', 1),
(121, 25, 'P25_1.jpg', 1),
(122, 25, 'P25_2.jpg', 1),
(123, 25, 'P25_3.jpg', 1),
(124, 25, 'P25_4.jpg', 1),
(125, 25, 'P25_5.jpg', 1),
(126, 26, 'P26_1.jpg', 1),
(127, 26, 'P26_2.gif', 1),
(128, 26, 'P26_3.jpg', 1),
(129, 26, 'P26_4.jpg', 1),
(130, 26, 'P26_5.jpg', 1),
(131, 27, 'P27_1.jpg', 1),
(132, 27, 'P27_2.jpg', 1),
(133, 27, 'P27_3.jpg', 1),
(134, 27, 'P27_4.jpg', 1),
(135, 27, 'P27_5.jpg', 1),
(136, 28, 'P28_1.jpg', 1),
(137, 28, 'P28_2.jpg', 1),
(138, 28, 'P28_3.jpg', 1),
(139, 28, 'P28_4.jpg', 1),
(140, 28, 'P28_5.jpg', 1),
(141, 29, 'P29_1.jpg', 1),
(142, 29, 'P29_2.jpg', 1),
(143, 29, 'P29_3.jpg', 1),
(144, 29, 'P29_4.jpg', 1),
(145, 29, 'P29_5.jpg', 1),
(146, 30, 'P30_1.jpg', 1),
(147, 30, 'P30_2.jpg', 1),
(148, 30, 'P30_3.jpg', 1),
(149, 30, 'P30_4.jpg', 1),
(150, 30, 'P30_5.jpg', 1),
(151, 31, 'P31_1.jpg', 1),
(152, 31, 'P31_2.jpg', 1),
(153, 31, 'P31_3.jpg', 1),
(154, 31, 'P31_4.jpg', 1),
(155, 31, 'P31_5.jpg', 1),
(160, 58, 'P58_5.gif', 1),
(161, 32, 'P32_1.jpg', 1),
(162, 32, 'P32_2.jpg', 1),
(163, 32, 'P32_3.jpg', 1),
(164, 32, 'P32_4.jpg', 1),
(165, 32, 'P32_5.jpg', 1),
(166, 33, 'P33_1.jpg', 1),
(167, 33, 'P33_2.jpg', 1),
(168, 33, 'P33_3.jpg', 1),
(169, 33, 'P33_4.jpg', 1),
(170, 33, 'P33_5.jpg', 1),
(171, 34, 'P34_1.jpg', 1),
(172, 34, 'P34_2.jpg', 1),
(173, 34, 'P34_3.jpg', 1),
(174, 34, 'P34_4.jpg', 1),
(175, 34, 'P34_5.jpg', 1),
(176, 35, 'P35_1.jpg', 1),
(177, 35, 'P35_2.jpg', 1),
(178, 35, 'P35_3.jpg', 1),
(179, 35, 'P35_4.jpg', 1),
(180, 35, 'P35_5.jpg', 1),
(181, 36, 'P36_1.jpg', 1),
(182, 36, 'P36_2.jpg', 1),
(183, 36, 'P36_3.png', 1),
(184, 36, 'P36_4.png', 1),
(185, 36, 'P36_5.jpg', 1),
(186, 37, 'P37_1.jpg', 1),
(187, 37, 'P37_2.jpg', 1),
(188, 37, 'P37_3.jpg', 1),
(189, 37, 'P37_4.jpg', 1),
(190, 37, 'P37_5.jpg', 1),
(191, 38, 'P38_1.jpg', 1),
(192, 38, 'P38_2.jpg', 1),
(193, 38, 'P38_3.jpg', 1),
(194, 38, 'P38_4.jpg', 1),
(195, 38, 'P38_5.jpg', 1),
(196, 39, 'P39_1.jpg', 1),
(197, 39, 'P39_2.jpg', 1),
(198, 39, 'P39_3.jpg', 1),
(199, 39, 'P39_4.jpg', 1),
(200, 39, 'P39_5.jpg', 1),
(201, 40, 'P40_1.jpg', 1),
(202, 40, 'P40_2.jpg', 1),
(203, 40, 'P40_3.jpg', 1),
(204, 40, 'P40_4.jpg', 1),
(205, 40, 'P40_5.jpg', 1),
(206, 41, 'P41_1.jpg', 1),
(207, 41, 'P41_2.jpg', 1),
(208, 41, 'P41_3.jpg', 1),
(209, 41, 'P41_4.jpg', 1),
(210, 41, 'P41_5.jpg', 1),
(211, 42, 'P42_1.jpg', 1),
(212, 42, 'P42_2.jpg', 1),
(213, 42, 'P42_3.jpg', 1),
(214, 42, 'P42_4.jpg', 1),
(215, 42, 'P42_5.jpg', 1),
(216, 43, 'P43_1.jpg', 1),
(217, 43, 'P43_2.jpg', 1),
(218, 43, 'P43_3.jpg', 1),
(219, 43, 'P43_4.jpg', 1),
(220, 43, 'P43_5.jpg', 1),
(221, 44, 'P44_1.jpg', 1),
(222, 44, 'P44_2.jpg', 1),
(223, 44, 'P44_3.jpg', 1),
(224, 44, 'P44_4.jpg', 1),
(225, 44, 'P44_5.jpg', 1),
(226, 45, 'P45_1.jpg', 1),
(227, 45, 'P45_2.jpg', 1),
(228, 45, 'P45_3.jpg', 1),
(229, 45, 'P45_4.jpg', 1),
(230, 45, 'P45_5.jpg', 1),
(231, 46, 'P46_1.jpg', 1),
(232, 46, 'P46_2.jpg', 1),
(233, 46, 'P46_3.jpg', 1),
(234, 46, 'P46_4.jpg', 1),
(235, 46, 'P46_5.jpg', 1),
(236, 47, 'P47_1.jpg', 1),
(237, 47, 'P47_2.jpg', 1),
(238, 47, 'P47_3.jpg', 1),
(239, 47, 'P47_4.jpg', 1),
(240, 47, 'P47_5.jpg', 1),
(241, 48, 'P48_1.jpg', 1),
(242, 48, 'P48_2.jpg', 1),
(243, 48, 'P48_3.jpg', 1),
(244, 48, 'P48_4.jpg', 1),
(245, 48, 'P48_5.jpg', 1),
(246, 49, 'P49_1.jpg', 1),
(247, 49, 'P49_2.jpg', 1),
(248, 49, 'P49_3.jpg', 1),
(249, 49, 'P49_4.jpg', 1),
(250, 49, 'P49_5.jpg', 1),
(251, 50, 'P50_1.jpg', 1),
(252, 50, 'P50_2.jpg', 1),
(253, 50, 'P50_3.jpg', 1),
(254, 50, 'P50_4.jpg', 1),
(255, 50, 'P50_5.jpg', 1),
(256, 51, 'P51_1.jpg', 1),
(257, 51, 'P51_2.jpg', 1),
(258, 51, 'P51_3.jpg', 1),
(259, 51, 'P51_4.jpg', 1),
(260, 51, 'P51_5.jpg', 1),
(261, 52, 'P52_1.jpg', 1),
(262, 52, 'P52_2.jpg', 1),
(263, 52, 'P52_3.jpg', 1),
(264, 52, 'P52_4.jpg', 1),
(265, 52, 'P52_5.jpg', 1),
(266, 53, 'P53_1.jpg', 1),
(267, 53, 'P53_2.jpg', 1),
(268, 53, 'P53_3.jpg', 1),
(269, 53, 'P53_4.jpg', 1),
(270, 53, 'P53_5.jpg', 1),
(271, 54, 'P54_1.jpg', 1),
(272, 54, 'P54_2.jpg', 1),
(273, 54, 'P54_3.jpg', 1),
(274, 54, 'P54_4.jpg', 1),
(275, 54, 'P54_5.jpg', 1),
(276, 55, 'P55_1.jpg', 1),
(277, 55, 'P55_2.jpg', 1),
(278, 55, 'P55_3.jpg', 1),
(279, 55, 'P55_4.jpg', 1),
(280, 55, 'P55_5.jpg', 1),
(281, 56, 'P56_1.jpg', 1),
(282, 56, 'P56_2.jpg', 1),
(283, 56, 'P56_3.jpg', 1),
(284, 56, 'P56_4.jpg', 1),
(285, 56, 'P56_5.jpg', 1),
(286, 57, 'P57_1.jpg', 1),
(287, 57, 'P57_2.jpg', 1),
(288, 57, 'P57_3.jpg', 1),
(289, 57, 'P57_4.jpg', 1),
(290, 57, 'P57_5.jpg', 1),
(291, 58, 'P58_1.jpg', 1),
(292, 58, 'P58_2.gif', 1),
(293, 58, 'P58_3.gif', 1),
(294, 58, 'P58_4.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `product_variant_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `product_variant_name` varchar(100) NOT NULL,
  `product_variant_price` float NOT NULL,
  `product_variant_available` int(11) NOT NULL,
  `product_variant_is_stock` tinyint(1) DEFAULT NULL,
  `product_variant_is_bestseller` tinyint(1) DEFAULT NULL,
  `product_variant_added_date` date NOT NULL DEFAULT current_timestamp(),
  `product_variant_is_display` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`product_variant_id`, `product_id`, `discount_id`, `product_variant_name`, `product_variant_price`, `product_variant_available`, `product_variant_is_stock`, `product_variant_is_bestseller`, `product_variant_added_date`, `product_variant_is_display`) VALUES
(1, 1, 1, '1 PH', 6990000, 100, 1, 1, '2023-11-18', 1),
(2, 2, 1, '1.5 PH', 6990000, 200, 1, 0, '2023-11-18', 1),
(3, 3, 1, '1 PH', 6690000, 100, 1, 1, '2023-11-18', 1),
(4, 4, 1, '1 PH', 6990000, 200, 1, 0, '2023-11-18', 1),
(5, 5, 1, '1.5 PH', 7990000, 100, 1, 1, '2023-11-18', 1),
(6, 6, 2, '7.5 Kg', 3790000, 100, 1, 1, '2023-11-18', 1),
(7, 7, 2, '10 Kg - Đen', 11590000, 100, 1, 1, '2023-11-18', 1),
(8, 8, 2, '10 Kg', 11490000, 100, 1, 1, '2023-11-18', 1),
(9, 9, 2, '8 Kg - Trắng', 4990000, 100, 1, 1, '2023-11-18', 1),
(10, 10, 2, '10 Kg - Đen', 10890000, 100, 1, 1, '2023-11-18', 1),
(11, 11, 3, '58 inch', 7970000, 100, 1, 1, '2023-11-18', 1),
(12, 12, 3, '55 inch', 11990000, 100, 1, 1, '2023-11-18', 1),
(13, 13, 4, 'Hồng nhạt - 128GB', 22490000, 100, 1, 1, '2023-11-18', 1),
(14, 13, 4, 'Hồng nhạt - 256GB', 25490000, 100, 1, 1, '2023-11-29', 1),
(15, 14, 4, 'Xanh lá - 12GB', 11990000, 100, 1, 1, '2023-11-18', 1),
(16, 14, 4, 'Xanh lá - 8GB', 10990000, 100, 1, 1, '2023-11-18', 1),
(17, 15, 5, 'Xám', 7990000, 100, 1, 1, '2023-11-18', 1),
(18, 16, 5, 'Đen', 25490000, 100, 1, 1, '2023-11-18', 1),
(19, 17, 6, 'Bạc-64GB', 7990000, 100, 1, 1, '2023-11-18', 1),
(20, 17, 6, 'Xám-64GB', 7990000, 100, 1, 1, '2023-11-18', 1),
(21, 18, 6, '64GB', 17490000, 100, 1, 1, '2023-11-18', 1),
(22, 18, 6, '256GB', 23390000, 100, 1, 1, '2023-11-18', 1),
(23, 27, 6, 'Xám', 3490000, 100, 1, 0, '2023-11-18', 1),
(24, 27, 6, 'Bạc', 3490000, 100, 1, 0, '2023-11-18', 1),
(25, 19, 7, 'Xám', 17690000, 100, 1, 1, '2023-11-18', 1),
(26, 20, 7, 'Đen', 19990000, 100, 1, 1, '2023-11-18', 1),
(27, 21, 8, 'Trắng', 1485000, 100, 1, 1, '2023-11-18', 1),
(28, 22, 8, 'Vàng đồng', 600000, 100, 1, 1, '2023-11-18', 1),
(29, 23, 9, 'Đen', 1590000, 100, 1, 1, '2023-11-18', 1),
(30, 24, 9, 'Đen', 1290000, 100, 1, 1, '2023-11-18', 1),
(31, 25, 10, 'Bếp từ hồng ngoại', 7390000, 100, 1, 1, '2023-11-18', 1),
(32, 25, 10, 'Bếp từ đôi', 7390000, 100, 1, 1, '2023-11-18', 1),
(33, 26, 10, 'Đen', 23190000, 100, 1, 1, '2023-11-18', 1),
(34, 28, 1, '1.5 HP', 6990000, 120, 1, 0, '2023-12-02', 1),
(35, 28, 1, '2 HP', 13930000, 24, 1, 0, '2023-12-02', 1),
(36, 29, 9, '1.5 HP', 10990000, 100, 1, 1, '2023-12-02', 1),
(37, 29, 2, '1 HP', 9090000, 50, 1, 1, '2023-12-02', 1),
(38, 30, 6, '75 inch', 29290000, 10, 1, 1, '2023-12-02', 1),
(39, 30, 3, '98 inch', 100990000, 10, 1, 1, '2023-12-02', 1),
(40, 31, 6, '75 inch', 39890000, 10, 1, 1, '2023-12-02', 1),
(41, 31, 6, '55 inch', 22890000, 4, 1, 1, '2023-12-02', 1),
(42, 32, 11, 'Đen', 79990000, 10, 1, 1, '2023-12-02', 1),
(43, 32, 11, 'Bạc', 79990000, 10, 1, 1, '2023-12-02', 1),
(44, 33, 2, 'Xám', 19490000, 10, 1, 1, '2023-12-02', 1),
(45, 33, 2, 'Bạc', 19490000, 10, 1, 1, '2023-12-02', 1),
(46, 43, 1, '10Kg', 9900000, 100, 1, 1, '2023-11-19', 1),
(47, 43, 1, '12Kg', 11900000, 100, 1, 1, '2023-11-19', 1),
(48, 44, 1, '10Kg - Đen', 8900000, 100, 1, 1, '2023-11-19', 1),
(49, 44, 1, '10Kg - Trắng', 8900000, 100, 1, 1, '2023-11-19', 1),
(50, 50, 3, 'Đen', 36490000, 100, 1, 1, '2023-11-19', 1),
(51, 50, 3, 'Trắng', 36490000, 100, 1, 1, '2023-11-19', 1),
(52, 52, 4, '1 lít', 690000, 100, 1, 1, '2023-11-19', 1),
(53, 52, 4, '1.8 lít', 990000, 100, 1, 1, '2023-11-19', 1),
(54, 53, 4, '1 lít', 1090000, 100, 1, 1, '2023-11-19', 1),
(55, 53, 4, '1.8 lít', 1490000, 100, 1, 1, '2023-11-19', 1),
(56, 55, 5, 'Bếp từ đôi', 3990000, 50, 1, 1, '2023-11-19', 1),
(57, 55, 5, 'Bếp từ đơn', 2590000, 50, 1, 1, '2023-11-19', 1),
(58, 45, 2, 'Vàng', 4900000, 100, 1, 1, '2023-11-19', 1),
(59, 46, 2, 'Xanh', 5690000, 100, 1, 1, '2023-11-19', 1),
(60, 47, 2, 'Vàng', 3890000, 100, 1, 1, '2023-11-19', 1),
(61, 48, 3, 'Xám đen', 6990000, 100, 1, 1, '2023-11-19', 1),
(62, 49, 3, 'Xanh ngọc', 4490000, 100, 1, 1, '2023-11-19', 1),
(63, 51, 3, 'Xám', 3490000, 100, 1, 1, '2023-11-19', 1),
(64, 54, 4, '1.8 lít', 2835000, 100, 1, 1, '2023-11-19', 1),
(65, 56, 5, 'Bếp từ đôi', 7490000, 50, 1, 1, '2023-11-19', 1),
(66, 57, 5, 'Bếp từ hồng ngoại', 5190000, 50, 1, 1, '2023-11-19', 1),
(67, 34, 11, 'Xám', 10890000, 100, 1, 1, '2023-12-02', 1),
(68, 35, 11, '256 lít - Đen ', 7190000, 100, 1, 0, '2023-12-02', 1),
(69, 35, 5, '236 lít - Đen ', 6290000, 10, 1, 0, '2023-12-02', 1),
(70, 36, 2, '401 lít - Vàng ', 15680000, 10, 1, 0, '2023-12-02', 1),
(71, 36, 2, '401 lít - Đen ', 15680000, 10, 1, 0, '2023-12-02', 1),
(72, 37, 2, '519 lít - Đen ', 13990000, 10, 1, 1, '2023-12-02', 1),
(73, 38, 11, '6 lít - Đen', 1550000, 100, 1, 0, '2023-12-02', 1),
(74, 39, 11, '9 lít -  Đen ', 1780000, 20, 1, 1, '2023-12-02', 1),
(75, 40, 11, '6.5 lít - Bạc ', 1790000, 30, 1, 1, '2023-12-02', 1),
(76, 41, 11, '5 lít - Đen', 2086000, 40, 1, 0, '2023-12-02', 1),
(77, 42, 11, '5.5 lít - Bạc ', 5590000, 44, 1, 1, '2023-12-02', 1),
(78, 58, 11, '75 inch', 25890000, 100, 1, 0, '2023-12-02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `staff_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `staff_role` varchar(100) NOT NULL,
  `staff_description` text DEFAULT NULL,
  `staff_added_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`staff_id`, `user_id`, `staff_role`, `staff_description`, `staff_added_date`) VALUES
(1, 11, 'Giám đốc', 'Chịu trách nhiệm quản lý chung công ty', '2023-11-27'),
(2, 12, 'Trưởng phòng kinh doanh', 'Chịu trách nhiệm quản lý hoạt động kinh doanh của công ty', '2023-11-27'),
(3, 13, 'Nhân viên kinh doanh', 'Chịu trách nhiệm bán hàng và phát triển khách hàng', '2023-11-27'),
(4, 14, 'Nhân viên kỹ thuật', 'Chịu trách nhiệm hỗ trợ kỹ thuật cho khách hàng', '2023-11-27'),
(5, 15, 'Nhân viên chăm sóc khách hàng', 'Chịu trách nhiệm chăm sóc khách hàng và giải quyết các vấn đề của khách hàng', '2023-11-27');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_logo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `supplier_logo`) VALUES
(1, 'Samsung', 'samung.png'),
(2, 'Sony', 'sony.png'),
(3, 'LG', 'lg.png'),
(4, 'Casper', 'casper.png'),
(5, 'TCL', 'tcl.png'),
(6, 'Sharp', 'sharp.png'),
(7, 'TOSHIBA', 'toshiba.png'),
(8, 'Xiaomi', 'xiaomi.png'),
(9, 'AQUA', 'aqua.png'),
(10, 'Panasonic', 'panasonic.png'),
(11, 'Funiki', 'funiki.png'),
(12, 'BOSCH', 'bosch.png'),
(13, 'BlueStone', 'blustone.png'),
(14, 'Kangaroo', 'kangaroo.png'),
(15, 'Philips', 'philips.png'),
(16, 'Pramie', 'pramie.png'),
(17, 'Media', 'media.png'),
(18, 'Whirlpool', 'whirlpool.png'),
(19, 'Ferroli', 'ferroli.png'),
(20, 'Smeg', 'smeg.png'),
(21, 'iPhone', 'iphone.png'),
(22, 'OPPO\r\n', 'oppo.png'),
(23, 'vivo', 'vivo.png'),
(24, 'SunHouse', 'sunhouse.png'),
(25, 'realme', 'realme.png'),
(26, 'beko', 'beko.png'),
(27, 'HITACHI', 'hitachi.png'),
(28, 'Bear', 'bear.png'),
(29, 'CRYSTAL', 'crystal.png'),
(30, 'LOCK&LOCK', 'lockvslock.png'),
(31, 'CUCKOO', 'cuckoo.png'),
(32, 'hp', 'hp.png'),
(33, 'Lenovo', 'lenovo.png'),
(34, 'MacBook', 'macbook.png'),
(35, 'msi', 'msi.png'),
(36, 'DELL', 'dell.png'),
(37, 'ASUS', 'asus.png'),
(38, 'iPad', 'ipad.png'),
(39, 'Masstel', 'masstel.png'),
(40, 'Hafele', 'hafele.png'),
(41, 'DAIKIN', 'daikin.png'),
(42, 'Nagakawa', 'nagakawa.png'),
(43, 'Acer', 'acer.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_login_name` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_avt_img` varchar(100) DEFAULT NULL,
  `user_birth` date DEFAULT NULL,
  `user_sex` enum('Nữ','Nam') DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_phone` char(10) NOT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `user_register_date` date NOT NULL DEFAULT current_timestamp(),
  `user_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_login_name`, `user_password`, `user_name`, `user_avt_img`, `user_birth`, `user_sex`, `user_email`, `user_phone`, `user_address`, `user_register_date`, `user_active`) VALUES
(1, '0987654321', '$2a$08$z6uK/g62SytTVamrrt.9J.C3uDPoqNVN.fl0ZVARVuDu.WAtQcuv2', 'Phan Nguyễn Hải Yến', 'user1.png', '2023-12-05', 'Nữ', 'haiyen@gmail.com', '0987654321', 'An Bình, Dĩ An, Bình Dương', '2023-08-01', 1),
(2, '0987654322', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Trần Thị Bình', 'user2.png', '1991-02-02', 'Nữ', 'user2@example.com', '0987654322', 'TP. Hồ Chí Minh', '2023-01-01', 1),
(3, '0987654323', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Lê Quang Yên', 'user3.png', '1990-01-01', 'Nam', 'user3@example.com', '0987654323', 'Hà Nội', '2023-01-01', 1),
(4, '0987654324', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Trương Quang Phú', 'user4.png', '1990-01-01', 'Nam', 'user4@example.com', '0987654324', 'Hải Dương', '2023-01-01', 1),
(5, '0987654325', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Trần Thiên Lộc', 'user5.png', '1990-01-01', 'Nam', 'user5@example.com', '0987654325', 'Hà Nội', '2023-01-01', 1),
(6, '0987654326', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Nguyễn Phú Cường', 'user6.png', '1999-03-03', 'Nam', 'user6@example.com', '0987654326', 'Đà Nẵng', '2023-01-01', 1),
(7, '0987654327', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Phan Thanh Danh', 'user7.png', '1999-03-03', 'Nam', 'user7@example.com', '0987654327', 'Đồng Nai', '2023-01-01', 1),
(8, '0987654328', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Mai Văn Tiên', 'user8.png', '1999-03-03', 'Nam', 'user8@example.com', '0987654328', 'Đà Nẵng', '2023-01-01', 1),
(9, '0987654329', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Tô Thanh Lộc', 'user9.png', '1999-03-03', 'Nam', 'user9@example.com', '0987654329', 'Bình Phước', '2023-01-01', 1),
(10, '0987654330', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Nguyễn Nhựt Tiến', 'user10.png', '1999-03-03', 'Nam', 'user10@example.com', '0987654330', 'Cần Thơ', '2023-01-01', 1),
(11, '0987654331', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Lý Văn Nghĩa', 'user11.png', '1999-03-03', 'Nam', 'user11@example.com', '0987654331', '', '2023-01-01', 1),
(12, '0987654332', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Hồ Thị Mai', 'user12.png', '1999-03-03', 'Nữ', 'user12@example.com', '0987654332', 'Bình Dương', '2023-01-01', 1),
(13, '0987654333', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Lê Bích Tuyền', 'user13.png', '1999-03-03', 'Nữ', 'user13@example.com', '0987654333', 'Bình Dương', '2023-01-01', 1),
(14, '0987654334', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Lê Hồng Bảo Trinh', 'user14.png', '1999-03-03', 'Nữ', 'user14@example.com', '0987654334', 'Bình Dương', '2023-01-01', 1),
(15, '0987654335', '$2a$08$eOIGRuOHME.s5d0c740JCuAtlEMupog/udCJwqHn9PC1jAQXPPX.e', 'Nguyễn Hoàng PHương Linh', 'user15.png', '1999-03-03', 'Nữ', 'user15@example.com', '0987654335', 'Bình Dương', '2023-01-01', 1),
(31, '0987296708', '$2a$08$YzCffpozMPsdIMzoZ21M7.lbdOBdOgCobDdKZaZpU8u6RgUeb9zUm', 'Hồng Nhung', NULL, NULL, NULL, NULL, '0987296708', NULL, '2023-12-15', 1),
(32, '0997654321', '$2a$08$m34kubjtYr2Hd5YufiNuUOTkGX92FjTKJ6dklXfgFKiWdCA7fRc.e', 'Hồng Nhung', NULL, NULL, NULL, NULL, '0997654321', NULL, '2023-12-15', 1),
(33, '0887654321', '$2a$08$EX.tL8w9RDCIXlHXR8/yIuzFkaUFqPDiNuE7vZJCNxzD5u1f5KzcK', 'Linh Phương', NULL, NULL, NULL, NULL, '0887654321', NULL, '2023-12-15', 1);

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `after_insert_users` AFTER INSERT ON `users` FOR EACH ROW BEGIN
    INSERT INTO customers (user_id)
    VALUES (NEW.user_id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_notification`
--

CREATE TABLE `user_notification` (
  `user_id` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `user_notification_is_read` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `user_notification`
--

INSERT INTO `user_notification` (`user_id`, `notification_id`, `user_notification_is_read`) VALUES
(1, 1, 0),
(1, 2, 0),
(1, 3, 0),
(1, 4, 0),
(1, 5, 0),
(1, 6, 0),
(2, 1, 0),
(2, 2, 0),
(2, 3, 0),
(2, 4, 0),
(2, 6, 0),
(3, 6, 0),
(4, 6, 0),
(5, 6, 0),
(6, 6, 0),
(7, 6, 0),
(8, 6, 0),
(9, 6, 0),
(10, 6, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_cart`
-- (See below for the actual view)
--
CREATE TABLE `view_cart` (
`customer_id` int(11)
,`cart_quantity` int(11)
,`product_id` int(11)
,`product_name` varchar(100)
,`product_avt_img` varchar(100)
,`product_rate` float
,`product_view_count` int(11)
,`product_period` int(11)
,`category_id` int(11)
,`category_name` varchar(100)
,`product_variant_id` int(11)
,`product_variant_name` varchar(100)
,`product_variant_price` float
,`product_variant_available` int(11)
,`product_variant_is_bestseller` tinyint(1)
,`discount_amount` float
,`discount_description` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_cate_admin`
-- (See below for the actual view)
--
CREATE TABLE `view_cate_admin` (
`category_id` int(11)
,`category_name` varchar(100)
,`category_img` varchar(100)
,`categorry_type` varchar(50)
,`category_added_date` date
,`category_is_display` tinyint(1)
,`product_count` bigint(21)
,`revenue` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_count_cart`
-- (See below for the actual view)
--
CREATE TABLE `view_count_cart` (
`customer_id` int(11)
,`user_id` int(11)
,`count_cart` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_dashboard`
-- (See below for the actual view)
--
CREATE TABLE `view_dashboard` (
`customer_count` bigint(21)
,`quantity_sold` decimal(42,0)
,`revenue` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_discounts`
-- (See below for the actual view)
--
CREATE TABLE `view_discounts` (
`discount_id` int(11)
,`discount_name` varchar(100)
,`discount_description` text
,`discount_start_date` date
,`discount_end_date` date
,`discount_amount` float
,`discount_is_display` tinyint(1)
,`discount_img` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_getchart_revenue`
-- (See below for the actual view)
--
CREATE TABLE `view_getchart_revenue` (
`year` int(4)
,`month` int(2)
,`order_success` bigint(21)
,`revenue` decimal(32,0)
,`order_cancel` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_getchart_top5_product`
-- (See below for the actual view)
--
CREATE TABLE `view_getchart_top5_product` (
`product_variant_id` int(11)
,`quantity_sold` decimal(32,0)
,`revenue` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_notifications`
-- (See below for the actual view)
--
CREATE TABLE `view_notifications` (
`notification_id` int(11)
,`notification_type_id` int(11)
,`notification_title` varchar(100)
,`notification_subtitle` text
,`notification_content` text
,`notification_date` date
,`notification_is_display` tinyint(1)
,`user_id` int(11)
,`user_notification_is_read` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_order`
-- (See below for the actual view)
--
CREATE TABLE `view_order` (
`order_id` int(11)
,`customer_id` int(11)
,`staff_id` int(11)
,`order_name` varchar(100)
,`order_phone` varchar(10)
,`order_date` date
,`order_delivery_date` date
,`order_delivery_address` varchar(100)
,`order_note` text
,`order_total_before` int(11)
,`order_total_after` int(11)
,`paying_method_id` int(11)
,`order_paying_date` date
,`order_is_paid` tinyint(1)
,`order_status` enum('Chờ thanh toán','Đang giao hàng','Hoàn thành','Đã hủy')
,`paying_method_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_orders`
-- (See below for the actual view)
--
CREATE TABLE `view_orders` (
`order_id` int(11)
,`customer_id` int(11)
,`staff_id` int(11)
,`order_name` varchar(100)
,`order_phone` varchar(10)
,`order_date` date
,`order_delivery_date` date
,`order_delivery_address` varchar(100)
,`order_note` text
,`order_total_before` int(11)
,`order_total_after` int(11)
,`paying_method_id` int(11)
,`order_paying_date` date
,`order_is_paid` tinyint(1)
,`order_status` enum('Chờ thanh toán','Đang giao hàng','Hoàn thành','Đã hủy')
,`paying_method_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_order_detail`
-- (See below for the actual view)
--
CREATE TABLE `view_order_detail` (
`order_id` int(11)
,`product_variant_id` int(11)
,`order_detail_quantity` int(11)
,`order_detail_price_before` int(11)
,`order_detail_price_after` int(11)
,`product_id` int(11)
,`product_name` varchar(100)
,`product_avt_img` varchar(100)
,`product_variant_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_products_admin`
-- (See below for the actual view)
--
CREATE TABLE `view_products_admin` (
`product_id` int(11)
,`product_name` varchar(100)
,`product_avt_img` varchar(100)
,`product_rate` float
,`product_view_count` int(11)
,`product_period` int(11)
,`category_id` int(11)
,`category_name` varchar(100)
,`product_variant_id` int(11)
,`product_variant_name` varchar(100)
,`product_variant_price` float
,`product_variant_available` int(11)
,`product_variant_is_bestseller` tinyint(1)
,`discount_amount` float
,`discount_description` text
,`product_count` bigint(21)
,`quantity_sold` decimal(42,0)
,`revenue` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_products_info`
-- (See below for the actual view)
--
CREATE TABLE `view_products_info` (
`product_id` int(11)
,`category_id` int(11)
,`product_name` varchar(100)
,`supplier_id` int(11)
,`product_avt_img` varchar(100)
,`product_rate` float
,`product_description` text
,`product_period` int(11)
,`product_view_count` int(11)
,`product_is_display` tinyint(1)
,`product_variant_id` int(11)
,`discount_id` int(11)
,`product_variant_name` varchar(100)
,`product_variant_price` float
,`product_variant_available` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_products_resume`
-- (See below for the actual view)
--
CREATE TABLE `view_products_resume` (
`product_id` int(11)
,`product_name` varchar(100)
,`product_avt_img` varchar(100)
,`product_rate` float
,`product_view_count` int(11)
,`category_id` int(11)
,`category_name` varchar(100)
,`product_variant_id` int(11)
,`product_variant_is_bestseller` tinyint(1)
,`product_variant_price` float
,`product_lastdate_added` date
,`discount_amount` float
,`discount_description` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_product_feedbacks`
-- (See below for the actual view)
--
CREATE TABLE `view_product_feedbacks` (
`product_variant_name` varchar(100)
,`product_id` int(11)
,`feedback_id` int(11)
,`product_variant_id` int(11)
,`customer_id` int(11)
,`order_id` int(11)
,`feedback_date` date
,`feedback_rate` int(11)
,`feedback_content` text
,`feedback_is_display` tinyint(1)
,`feedback_img_id` int(11)
,`feedback_img_name` varchar(100)
,`user_name` varchar(100)
,`user_avt_img` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_product_variants`
-- (See below for the actual view)
--
CREATE TABLE `view_product_variants` (
`product_id` int(11)
,`product_name` varchar(100)
,`product_avt_img` varchar(100)
,`product_rate` float
,`product_view_count` int(11)
,`product_period` int(11)
,`category_id` int(11)
,`category_name` varchar(100)
,`product_variant_id` int(11)
,`product_variant_name` varchar(100)
,`product_variant_price` float
,`product_variant_available` int(11)
,`product_variant_is_bestseller` tinyint(1)
,`discount_amount` float
,`discount_description` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_product_variant_detail`
-- (See below for the actual view)
--
CREATE TABLE `view_product_variant_detail` (
`product_variant_id` int(11)
,`product_id` int(11)
,`discount_id` int(11)
,`product_variant_name` varchar(100)
,`product_variant_price` float
,`product_variant_available` int(11)
,`product_variant_is_stock` tinyint(1)
,`product_variant_is_bestseller` tinyint(1)
,`product_variant_added_date` date
,`product_variant_is_display` tinyint(1)
,`discount_name` varchar(100)
,`discount_description` text
,`discount_start_date` date
,`discount_end_date` date
,`discount_amount` float
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_user`
-- (See below for the actual view)
--
CREATE TABLE `view_user` (
`user_id` int(11)
,`user_login_name` varchar(100)
,`user_password` varchar(100)
,`user_name` varchar(100)
,`user_avt_img` varchar(100)
,`user_birth` varchar(10)
,`user_sex` enum('Nữ','Nam')
,`user_email` varchar(100)
,`user_phone` char(10)
,`user_address` varchar(255)
,`user_register_date` date
,`user_active` tinyint(1)
,`customer_id` int(11)
,`staff_id` int(11)
,`staff_role` varchar(100)
,`staff_description` text
);

-- --------------------------------------------------------

--
-- Structure for view `view_cart`
--
DROP TABLE IF EXISTS `view_cart`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_cart`  AS SELECT `carts`.`customer_id` AS `customer_id`, `carts`.`cart_quantity` AS `cart_quantity`, `view_product_variants`.`product_id` AS `product_id`, `view_product_variants`.`product_name` AS `product_name`, `view_product_variants`.`product_avt_img` AS `product_avt_img`, `view_product_variants`.`product_rate` AS `product_rate`, `view_product_variants`.`product_view_count` AS `product_view_count`, `view_product_variants`.`product_period` AS `product_period`, `view_product_variants`.`category_id` AS `category_id`, `view_product_variants`.`category_name` AS `category_name`, `view_product_variants`.`product_variant_id` AS `product_variant_id`, `view_product_variants`.`product_variant_name` AS `product_variant_name`, `view_product_variants`.`product_variant_price` AS `product_variant_price`, `view_product_variants`.`product_variant_available` AS `product_variant_available`, `view_product_variants`.`product_variant_is_bestseller` AS `product_variant_is_bestseller`, `view_product_variants`.`discount_amount` AS `discount_amount`, `view_product_variants`.`discount_description` AS `discount_description` FROM (`carts` left join `view_product_variants` on(`carts`.`product_variant_id` = `view_product_variants`.`product_variant_id`)) ORDER BY `carts`.`cart_added_date` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `view_cate_admin`
--
DROP TABLE IF EXISTS `view_cate_admin`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_cate_admin`  AS SELECT `categories`.`category_id` AS `category_id`, `categories`.`category_name` AS `category_name`, `categories`.`category_img` AS `category_img`, `categories`.`categorry_type` AS `categorry_type`, `categories`.`category_added_date` AS `category_added_date`, `categories`.`category_is_display` AS `category_is_display`, coalesce(`product_counts`.`product_count`,0) AS `product_count`, coalesce(sum(`order_details`.`order_detail_price_after`),0) AS `revenue` FROM ((`categories` left join (select `products`.`category_id` AS `category_id`,count(0) AS `product_count` from `products` group by `products`.`category_id`) `product_counts` on(`categories`.`category_id` = `product_counts`.`category_id`)) left join `order_details` on(`order_details`.`product_variant_id` in (select `view_products_resume`.`product_variant_id` from (`view_products_resume` join `orders`) where `view_products_resume`.`category_id` = `categories`.`category_id` and `orders`.`order_id` = `order_details`.`order_id` and `orders`.`order_is_paid` = 1 and `orders`.`order_status` = 'Hoàn thành'))) GROUP BY `categories`.`category_id`, `categories`.`category_name` ;

-- --------------------------------------------------------

--
-- Structure for view `view_count_cart`
--
DROP TABLE IF EXISTS `view_count_cart`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_count_cart`  AS SELECT `customers`.`customer_id` AS `customer_id`, `users`.`user_id` AS `user_id`, count(`carts`.`product_variant_id`) AS `count_cart` FROM ((`users` left join `customers` on(`users`.`user_id` = `customers`.`customer_id`)) left join `carts` on(`carts`.`customer_id` = `customers`.`customer_id`)) GROUP BY `customers`.`customer_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_dashboard`
--
DROP TABLE IF EXISTS `view_dashboard`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_dashboard`  AS SELECT `dashboard_customer`.`customer_count` AS `customer_count`, sum(`dashboard_order`.`quantity_sold`) AS `quantity_sold`, sum(`dashboard_order`.`revenue`) AS `revenue` FROM ((select count(0) AS `customer_count` from `customers`) `dashboard_customer` join (select count(0) AS `quantity_sold`,sum(`orders`.`order_total_after`) AS `revenue` from `orders` where `orders`.`order_is_paid` = 1 and `orders`.`order_status` = 'Hoàn thành' group by `orders`.`order_id`) `dashboard_order`) ;

-- --------------------------------------------------------

--
-- Structure for view `view_discounts`
--
DROP TABLE IF EXISTS `view_discounts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_discounts`  AS SELECT `discounts`.`discount_id` AS `discount_id`, `discounts`.`discount_name` AS `discount_name`, `discounts`.`discount_description` AS `discount_description`, `discounts`.`discount_start_date` AS `discount_start_date`, `discounts`.`discount_end_date` AS `discount_end_date`, `discounts`.`discount_amount` AS `discount_amount`, `discounts`.`discount_is_display` AS `discount_is_display`, `discounts`.`discount_img` AS `discount_img` FROM `discounts` WHERE cast(`discounts`.`discount_end_date` as date) > current_timestamp() AND cast(`discounts`.`discount_start_date` as date) < current_timestamp() AND `discounts`.`discount_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Structure for view `view_getchart_revenue`
--
DROP TABLE IF EXISTS `view_getchart_revenue`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_getchart_revenue`  AS SELECT `success`.`year` AS `year`, `success`.`month` AS `month`, `success`.`order_success` AS `order_success`, `success`.`revenue` AS `revenue`, `cancel`.`order_cancel` AS `order_cancel` FROM ((select year(`orders`.`order_date`) AS `year`,month(`orders`.`order_date`) AS `month`,count(`orders`.`order_id`) AS `order_success`,sum(`orders`.`order_total_after`) AS `revenue` from `orders` where `orders`.`order_is_paid` = 1 group by year(`orders`.`order_date`),month(`orders`.`order_date`)) `success` left join (select year(`orders`.`order_date`) AS `year`,month(`orders`.`order_date`) AS `month`,count(`orders`.`order_id`) AS `order_cancel` from `orders` where `orders`.`order_status` = 'Đã hủy' group by year(`orders`.`order_date`),month(`orders`.`order_date`)) `cancel` on(`cancel`.`year` = `success`.`year` and `cancel`.`month` = `success`.`month`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_getchart_top5_product`
--
DROP TABLE IF EXISTS `view_getchart_top5_product`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_getchart_top5_product`  AS SELECT `order_details`.`product_variant_id` AS `product_variant_id`, sum(`order_details`.`order_detail_quantity`) AS `quantity_sold`, sum(`order_details`.`order_detail_price_after` * `order_details`.`order_detail_quantity`) AS `revenue` FROM (`orders` left join `order_details` on(`order_details`.`order_id` = `orders`.`order_id`)) WHERE `orders`.`order_status` = 'Hoàn thành' GROUP BY `order_details`.`product_variant_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_notifications`
--
DROP TABLE IF EXISTS `view_notifications`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_notifications`  AS SELECT `notifications`.`notification_id` AS `notification_id`, `notifications`.`notification_type_id` AS `notification_type_id`, `notifications`.`notification_title` AS `notification_title`, `notifications`.`notification_subtitle` AS `notification_subtitle`, `notifications`.`notification_content` AS `notification_content`, `notifications`.`notification_date` AS `notification_date`, `notifications`.`notification_is_display` AS `notification_is_display`, `user_notification`.`user_id` AS `user_id`, `user_notification`.`user_notification_is_read` AS `user_notification_is_read` FROM (`notifications` left join `user_notification` on(`notifications`.`notification_id` = `user_notification`.`notification_id`)) WHERE `notifications`.`notification_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Structure for view `view_order`
--
DROP TABLE IF EXISTS `view_order`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_order`  AS SELECT `orders`.`order_id` AS `order_id`, `orders`.`customer_id` AS `customer_id`, `orders`.`staff_id` AS `staff_id`, `orders`.`order_name` AS `order_name`, `orders`.`order_phone` AS `order_phone`, `orders`.`order_date` AS `order_date`, `orders`.`order_delivery_date` AS `order_delivery_date`, `orders`.`order_delivery_address` AS `order_delivery_address`, `orders`.`order_note` AS `order_note`, `orders`.`order_total_before` AS `order_total_before`, `orders`.`order_total_after` AS `order_total_after`, `orders`.`paying_method_id` AS `paying_method_id`, `orders`.`order_paying_date` AS `order_paying_date`, `orders`.`order_is_paid` AS `order_is_paid`, `orders`.`order_status` AS `order_status`, `paying_methods`.`paying_method_name` AS `paying_method_name` FROM (`orders` left join `paying_methods` on(`orders`.`paying_method_id` = `paying_methods`.`paying_method_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_orders`
--
DROP TABLE IF EXISTS `view_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_orders`  AS SELECT `orders`.`order_id` AS `order_id`, `orders`.`customer_id` AS `customer_id`, `orders`.`staff_id` AS `staff_id`, `orders`.`order_name` AS `order_name`, `orders`.`order_phone` AS `order_phone`, `orders`.`order_date` AS `order_date`, `orders`.`order_delivery_date` AS `order_delivery_date`, `orders`.`order_delivery_address` AS `order_delivery_address`, `orders`.`order_note` AS `order_note`, `orders`.`order_total_before` AS `order_total_before`, `orders`.`order_total_after` AS `order_total_after`, `orders`.`paying_method_id` AS `paying_method_id`, `orders`.`order_paying_date` AS `order_paying_date`, `orders`.`order_is_paid` AS `order_is_paid`, `orders`.`order_status` AS `order_status`, `paying_methods`.`paying_method_name` AS `paying_method_name` FROM (`orders` left join `paying_methods` on(`orders`.`paying_method_id` = `paying_methods`.`paying_method_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_order_detail`
--
DROP TABLE IF EXISTS `view_order_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_order_detail`  AS SELECT `order_details`.`order_id` AS `order_id`, `order_details`.`product_variant_id` AS `product_variant_id`, `order_details`.`order_detail_quantity` AS `order_detail_quantity`, `order_details`.`order_detail_price_before` AS `order_detail_price_before`, `order_details`.`order_detail_price_after` AS `order_detail_price_after`, `view_product_variants`.`product_id` AS `product_id`, `view_product_variants`.`product_name` AS `product_name`, `view_product_variants`.`product_avt_img` AS `product_avt_img`, `view_product_variants`.`product_variant_name` AS `product_variant_name` FROM (`order_details` left join `view_product_variants` on(`order_details`.`product_variant_id` = `view_product_variants`.`product_variant_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_products_admin`
--
DROP TABLE IF EXISTS `view_products_admin`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_products_admin`  AS SELECT `view_product_variants`.`product_id` AS `product_id`, `view_product_variants`.`product_name` AS `product_name`, `view_product_variants`.`product_avt_img` AS `product_avt_img`, `view_product_variants`.`product_rate` AS `product_rate`, `view_product_variants`.`product_view_count` AS `product_view_count`, `view_product_variants`.`product_period` AS `product_period`, `view_product_variants`.`category_id` AS `category_id`, `view_product_variants`.`category_name` AS `category_name`, `view_product_variants`.`product_variant_id` AS `product_variant_id`, `view_product_variants`.`product_variant_name` AS `product_variant_name`, `view_product_variants`.`product_variant_price` AS `product_variant_price`, `view_product_variants`.`product_variant_available` AS `product_variant_available`, `view_product_variants`.`product_variant_is_bestseller` AS `product_variant_is_bestseller`, `view_product_variants`.`discount_amount` AS `discount_amount`, `view_product_variants`.`discount_description` AS `discount_description`, count(`view_product_variants`.`product_variant_id`) AS `product_count`, sum(`r`.`quantity_sold`) AS `quantity_sold`, sum(`r`.`revenue`) AS `revenue` FROM (`view_product_variants` left join (select `order_details`.`product_variant_id` AS `product_variant_id`,count(`order_details`.`product_variant_id`) AS `quantity_sold`,sum(`order_details`.`order_detail_price_after`) AS `revenue` from (`orders` left join `order_details` on(`orders`.`order_id` = `order_details`.`order_id`)) where `orders`.`order_is_paid` <> 0 and `orders`.`order_status` = 'Hoàn thành' group by `order_details`.`product_variant_id`) `r` on(`view_product_variants`.`product_variant_id` = `r`.`product_variant_id`)) GROUP BY `view_product_variants`.`product_id` ORDER BY sum(`r`.`revenue`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `view_products_info`
--
DROP TABLE IF EXISTS `view_products_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_products_info`  AS SELECT `products`.`product_id` AS `product_id`, `products`.`category_id` AS `category_id`, `products`.`product_name` AS `product_name`, `products`.`supplier_id` AS `supplier_id`, `products`.`product_avt_img` AS `product_avt_img`, `products`.`product_rate` AS `product_rate`, `products`.`product_description` AS `product_description`, `products`.`product_period` AS `product_period`, `products`.`product_view_count` AS `product_view_count`, `products`.`product_is_display` AS `product_is_display`, `product_variants`.`product_variant_id` AS `product_variant_id`, `product_variants`.`discount_id` AS `discount_id`, `product_variants`.`product_variant_name` AS `product_variant_name`, `product_variants`.`product_variant_price` AS `product_variant_price`, `product_variants`.`product_variant_available` AS `product_variant_available` FROM (`products` join `product_variants`) WHERE `products`.`product_id` = `product_variants`.`product_id` AND `product_variants`.`product_variant_is_stock` = 1 AND `product_variants`.`product_variant_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Structure for view `view_products_resume`
--
DROP TABLE IF EXISTS `view_products_resume`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_products_resume`  AS SELECT `products`.`product_id` AS `product_id`, `products`.`product_name` AS `product_name`, `products`.`product_avt_img` AS `product_avt_img`, `products`.`product_rate` AS `product_rate`, `products`.`product_view_count` AS `product_view_count`, `categories`.`category_id` AS `category_id`, `categories`.`category_name` AS `category_name`, `a`.`product_variant_id` AS `product_variant_id`, `c`.`product_variant_is_bestseller` AS `product_variant_is_bestseller`, `a`.`min_price` AS `product_variant_price`, `b`.`max_date` AS `product_lastdate_added`, `view_discounts`.`discount_amount` AS `discount_amount`, `view_discounts`.`discount_description` AS `discount_description` FROM (((select `product_variants`.`product_id` AS `product_id`,max(`product_variants`.`product_variant_added_date`) AS `max_date` from `product_variants` group by `product_variants`.`product_id`) `b` left join (((`products` left join (select `product_variants`.`product_id` AS `product_id`,`product_variants`.`discount_id` AS `discount_id`,`product_variants`.`product_variant_id` AS `product_variant_id`,min(`product_variants`.`product_variant_price`) AS `min_price` from `product_variants` group by `product_variants`.`product_id`) `a` on(`products`.`product_id` = `a`.`product_id`)) left join `view_discounts` on(`a`.`discount_id` = `view_discounts`.`discount_id`)) left join `categories` on(`categories`.`category_id` = `products`.`category_id`)) on(`products`.`product_id` = `b`.`product_id`)) left join (select `product_variants`.`product_id` AS `product_id`,`product_variants`.`product_variant_is_bestseller` AS `product_variant_is_bestseller` from `product_variants` where `product_variants`.`product_variant_is_bestseller` = 1 group by `product_variants`.`product_id`) `c` on(`products`.`product_id` = `c`.`product_id`)) WHERE `products`.`product_is_display` = 1 GROUP BY `products`.`product_id` ;

-- --------------------------------------------------------

--
-- Structure for view `view_product_feedbacks`
--
DROP TABLE IF EXISTS `view_product_feedbacks`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product_feedbacks`  AS SELECT `product_variants`.`product_variant_name` AS `product_variant_name`, `product_variants`.`product_id` AS `product_id`, `feedbacks`.`feedback_id` AS `feedback_id`, `feedbacks`.`product_variant_id` AS `product_variant_id`, `feedbacks`.`customer_id` AS `customer_id`, `feedbacks`.`order_id` AS `order_id`, `feedbacks`.`feedback_date` AS `feedback_date`, `feedbacks`.`feedback_rate` AS `feedback_rate`, `feedbacks`.`feedback_content` AS `feedback_content`, `feedbacks`.`feedback_is_display` AS `feedback_is_display`, `feedback_imgs`.`feedback_img_id` AS `feedback_img_id`, `feedback_imgs`.`feedback_img_name` AS `feedback_img_name`, `view_user`.`user_name` AS `user_name`, `view_user`.`user_avt_img` AS `user_avt_img` FROM (((`product_variants` left join `feedbacks` on(`product_variants`.`product_variant_id` = `feedbacks`.`product_variant_id`)) left join `feedback_imgs` on(`feedbacks`.`feedback_id` = `feedback_imgs`.`feedback_id`)) left join `view_user` on(`view_user`.`customer_id` = `feedbacks`.`customer_id`)) WHERE `feedbacks`.`feedback_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Structure for view `view_product_variants`
--
DROP TABLE IF EXISTS `view_product_variants`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product_variants`  AS SELECT `products`.`product_id` AS `product_id`, `products`.`product_name` AS `product_name`, `products`.`product_avt_img` AS `product_avt_img`, `products`.`product_rate` AS `product_rate`, `products`.`product_view_count` AS `product_view_count`, `products`.`product_period` AS `product_period`, `categories`.`category_id` AS `category_id`, `categories`.`category_name` AS `category_name`, `product_variants`.`product_variant_id` AS `product_variant_id`, `product_variants`.`product_variant_name` AS `product_variant_name`, `product_variants`.`product_variant_price` AS `product_variant_price`, `product_variants`.`product_variant_available` AS `product_variant_available`, `product_variants`.`product_variant_is_bestseller` AS `product_variant_is_bestseller`, `view_discounts`.`discount_amount` AS `discount_amount`, `view_discounts`.`discount_description` AS `discount_description` FROM (((`products` left join `product_variants` on(`products`.`product_id` = `product_variants`.`product_id`)) left join `view_discounts` on(`product_variants`.`discount_id` = `view_discounts`.`discount_id`)) left join `categories` on(`categories`.`category_id` = `products`.`category_id`)) WHERE `categories`.`category_id` = `products`.`category_id` AND `products`.`product_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Structure for view `view_product_variant_detail`
--
DROP TABLE IF EXISTS `view_product_variant_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product_variant_detail`  AS SELECT `product_variants`.`product_variant_id` AS `product_variant_id`, `product_variants`.`product_id` AS `product_id`, `product_variants`.`discount_id` AS `discount_id`, `product_variants`.`product_variant_name` AS `product_variant_name`, `product_variants`.`product_variant_price` AS `product_variant_price`, `product_variants`.`product_variant_available` AS `product_variant_available`, `product_variants`.`product_variant_is_stock` AS `product_variant_is_stock`, `product_variants`.`product_variant_is_bestseller` AS `product_variant_is_bestseller`, `product_variants`.`product_variant_added_date` AS `product_variant_added_date`, `product_variants`.`product_variant_is_display` AS `product_variant_is_display`, `view_discounts`.`discount_name` AS `discount_name`, `view_discounts`.`discount_description` AS `discount_description`, `view_discounts`.`discount_start_date` AS `discount_start_date`, `view_discounts`.`discount_end_date` AS `discount_end_date`, `view_discounts`.`discount_amount` AS `discount_amount` FROM (`product_variants` left join `view_discounts` on(`product_variants`.`discount_id` = `view_discounts`.`discount_id`)) WHERE `product_variants`.`product_variant_is_display` = 1 ;

-- --------------------------------------------------------

--
-- Structure for view `view_user`
--
DROP TABLE IF EXISTS `view_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user`  AS SELECT `users`.`user_id` AS `user_id`, `users`.`user_login_name` AS `user_login_name`, `users`.`user_password` AS `user_password`, `users`.`user_name` AS `user_name`, `users`.`user_avt_img` AS `user_avt_img`, date_format(`users`.`user_birth`,'%d/%m/%Y') AS `user_birth`, `users`.`user_sex` AS `user_sex`, `users`.`user_email` AS `user_email`, `users`.`user_phone` AS `user_phone`, `users`.`user_address` AS `user_address`, `users`.`user_register_date` AS `user_register_date`, `users`.`user_active` AS `user_active`, `customers`.`customer_id` AS `customer_id`, `staffs`.`staff_id` AS `staff_id`, `staffs`.`staff_role` AS `staff_role`, `staffs`.`staff_description` AS `staff_description` FROM ((`users` left join `customers` on(`users`.`user_id` = `customers`.`user_id`)) left join `staffs` on(`users`.`user_id` = `staffs`.`user_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_login_name` (`admin_login_name`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`customer_id`,`product_variant_id`),
  ADD KEY `fk_carts_product_variants` (`product_variant_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_customers_users` (`user_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`discount_id`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `fk_order_id` (`order_id`),
  ADD KEY `fk_customer_id` (`customer_id`),
  ADD KEY `fk_product_variant_id` (`product_variant_id`);

--
-- Indexes for table `feedback_imgs`
--
ALTER TABLE `feedback_imgs`
  ADD PRIMARY KEY (`feedback_img_id`),
  ADD KEY `fk_feedback_id` (`feedback_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `fk_notifications_notification_types` (`notification_type_id`);

--
-- Indexes for table `notification_types`
--
ALTER TABLE `notification_types`
  ADD PRIMARY KEY (`notification_type_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_orders_customers` (`customer_id`),
  ADD KEY `fk_orders_staffs` (`staff_id`),
  ADD KEY `fk_paying_method_id` (`paying_method_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_id`,`product_variant_id`),
  ADD KEY `fk_order_details_product_variants` (`product_variant_id`);

--
-- Indexes for table `paying_methods`
--
ALTER TABLE `paying_methods`
  ADD PRIMARY KEY (`paying_method_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_products_categories` (`category_id`),
  ADD KEY `fk_products_suppliers` (`supplier_id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`product_detail_id`,`product_id`),
  ADD KEY `fk_product_details_products` (`product_id`);

--
-- Indexes for table `product_imgs`
--
ALTER TABLE `product_imgs`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `fk_product_id` (`product_id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`product_variant_id`,`product_id`) USING BTREE,
  ADD KEY `fk_product_variants_products` (`product_id`),
  ADD KEY `fk_products_variants_discounts` (`discount_id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `fk_staffs_users` (`user_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_notification`
--
ALTER TABLE `user_notification`
  ADD PRIMARY KEY (`user_id`,`notification_id`),
  ADD KEY `fk_user_notification_notifications` (`notification_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=761;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notification_types`
--
ALTER TABLE `notification_types`
  MODIFY `notification_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `paying_methods`
--
ALTER TABLE `paying_methods`
  MODIFY `paying_method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `product_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=581;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `product_variant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `fk_carts_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `fk_carts_product_variants` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`product_variant_id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fk_customers_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `fk_product_variant_id` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`product_variant_id`);

--
-- Constraints for table `feedback_imgs`
--
ALTER TABLE `feedback_imgs`
  ADD CONSTRAINT `fk_feedback_id` FOREIGN KEY (`feedback_id`) REFERENCES `feedbacks` (`feedback_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notifications_notification_types` FOREIGN KEY (`notification_type_id`) REFERENCES `notification_types` (`notification_type_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `fk_orders_staffs` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`),
  ADD CONSTRAINT `fk_paying_method_id` FOREIGN KEY (`paying_method_id`) REFERENCES `paying_methods` (`paying_method_id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_order_details_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `fk_order_details_product_variants` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`product_variant_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `fk_products_suppliers` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`);

--
-- Constraints for table `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `fk_product_details_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `product_imgs`
--
ALTER TABLE `product_imgs`
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `fk_product_variants_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `fk_products_variants_discounts` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`discount_id`);

--
-- Constraints for table `staffs`
--
ALTER TABLE `staffs`
  ADD CONSTRAINT `fk_staffs_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `user_notification`
--
ALTER TABLE `user_notification`
  ADD CONSTRAINT `fk_user_notification_notifications` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`),
  ADD CONSTRAINT `fk_user_notification_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
