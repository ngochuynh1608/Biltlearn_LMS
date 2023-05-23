-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th5 23, 2023 lúc 06:30 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `lms`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `addons`
--

CREATE TABLE `addons` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `features` varchar(255) DEFAULT NULL,
  `version` float DEFAULT NULL,
  `purchase_code` varchar(255) DEFAULT NULL,
  `unique_identifier` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `copies` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_issues`
--

CREATE TABLE `book_issues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `book_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `issue_date` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classes`
--

CREATE TABLE `classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `class_room_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `start_date` int(11) NOT NULL,
  `end_date` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `time_hours` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `classes`
--

INSERT INTO `classes` (`id`, `code`, `name`, `class_room_id`, `subject_id`, `start_date`, `end_date`, `department_id`, `time_hours`, `teacher_id`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 'HZ012930', 'Đào tạo lãnh đạo tập đoàn', 2, 2, 1684346400, 1688061600, 1, 0, 3, 1, '2023-05-13 11:23:47', '2023-05-21 08:07:24'),
(2, '', 'Hello', 0, 22, 0, 0, 0, 0, 0, 1, '2023-05-17 00:38:55', '2023-05-17 00:38:55'),
(3, '', 'Lớp hội nhập 2023', 0, 1, 0, 0, 0, 0, 0, 1, '2023-05-17 01:25:21', '2023-05-17 01:25:21'),
(4, 'HV91203', 'Đào tạo hội nhập Flamingo đại lải', 1, 1, 1684778400, 1685469600, 2, 50, 3, 1, '2023-05-20 07:46:13', '2023-05-21 08:06:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `class_rooms`
--

CREATE TABLE `class_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `class_rooms`
--

INSERT INTO `class_rooms` (`id`, `name`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 'Online', 1, '2023-05-13 11:25:48', '2023-05-13 11:25:48'),
(2, 'Offline', 1, '2023-05-13 11:25:53', '2023-05-13 11:25:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `paypal_supported` int(11) DEFAULT NULL,
  `stripe_supported` int(11) DEFAULT NULL,
  `flutterwave_supported` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `currency`
--

INSERT INTO `currency` (`id`, `name`, `code`, `symbol`, `paypal_supported`, `stripe_supported`, `flutterwave_supported`) VALUES
(1, 'US Dollar', 'USD', '$', 1, 1, 1),
(2, 'Albanian Lek', 'ALL', 'Lek', 0, 1, 0),
(3, 'Algerian Dinar', 'DZD', 'دج', 1, 1, 0),
(4, 'Angolan Kwanza', 'AOA', 'Kz', 1, 1, 0),
(5, 'Argentine Peso', 'ARS', '$', 1, 1, 1),
(6, 'Armenian Dram', 'AMD', '֏', 1, 1, 0),
(7, 'Aruban Florin', 'AWG', 'ƒ', 1, 1, 0),
(8, 'Australian Dollar', 'AUD', '$', 1, 1, 0),
(9, 'Azerbaijani Manat', 'AZN', 'm', 1, 1, 0),
(10, 'Bahamian Dollar', 'BSD', 'B$', 1, 1, 0),
(11, 'Bahraini Dinar', 'BHD', '.د.ب', 1, 1, 0),
(12, 'Bangladeshi Taka', 'BDT', '৳', 1, 1, 0),
(13, 'Barbadian Dollar', 'BBD', 'Bds$', 1, 1, 0),
(14, 'Belarusian Ruble', 'BYR', 'Br', 0, 0, 0),
(15, 'Belgian Franc', 'BEF', 'fr', 1, 1, 0),
(16, 'Belize Dollar', 'BZD', '$', 1, 1, 0),
(17, 'Bermudan Dollar', 'BMD', '$', 1, 1, 0),
(18, 'Bhutanese Ngultrum', 'BTN', 'Nu.', 1, 1, 0),
(19, 'Bitcoin', 'BTC', '฿', 1, 1, 0),
(20, 'Bolivian Boliviano', 'BOB', 'Bs.', 1, 1, 0),
(21, 'Bosnia', 'BAM', 'KM', 1, 1, 0),
(22, 'Botswanan Pula', 'BWP', 'P', 1, 1, 0),
(23, 'Brazilian Real', 'BRL', 'R$', 1, 1, 1),
(24, 'British Pound Sterling', 'GBP', '£', 1, 1, 1),
(25, 'Brunei Dollar', 'BND', 'B$', 1, 1, 0),
(26, 'Bulgarian Lev', 'BGN', 'Лв.', 1, 1, 0),
(27, 'Burundian Franc', 'BIF', 'FBu', 1, 1, 0),
(28, 'Cambodian Riel', 'KHR', 'KHR', 1, 1, 0),
(29, 'Canadian Dollar', 'CAD', '$', 1, 1, 1),
(30, 'Cape Verdean Escudo', 'CVE', '$', 1, 1, 1),
(31, 'Cayman Islands Dollar', 'KYD', '$', 1, 1, 0),
(32, 'CFA Franc BCEAO', 'XOF', 'CFA', 1, 1, 1),
(33, 'CFA Franc BEAC', 'XAF', 'FCFA', 1, 1, 1),
(34, 'CFP Franc', 'XPF', '₣', 1, 1, 0),
(35, 'Chilean Peso', 'CLP', '$', 1, 1, 1),
(36, 'Chinese Yuan', 'CNY', '¥', 1, 1, 0),
(37, 'Colombian Peso', 'COP', '$', 1, 1, 0),
(38, 'Comorian Franc', 'KMF', 'CF', 1, 1, 0),
(39, 'Congolese Franc', 'CDF', 'FC', 1, 1, 1),
(40, 'Costa Rican ColÃ³n', 'CRC', '₡', 1, 1, 0),
(41, 'Croatian Kuna', 'HRK', 'kn', 1, 1, 0),
(42, 'Cuban Convertible Peso', 'CUC', '$, CUC', 1, 1, 0),
(43, 'Czech Republic Koruna', 'CZK', 'Kč', 1, 1, 0),
(44, 'Danish Krone', 'DKK', 'Kr.', 1, 1, 0),
(45, 'Djiboutian Franc', 'DJF', 'Fdj', 1, 1, 0),
(46, 'Dominican Peso', 'DOP', '$', 1, 1, 0),
(47, 'East Caribbean Dollar', 'XCD', '$', 1, 1, 0),
(48, 'Egyptian Pound', 'EGP', 'ج.م', 1, 1, 1),
(49, 'Eritrean Nakfa', 'ERN', 'Nfk', 1, 1, 0),
(50, 'Estonian Kroon', 'EEK', 'kr', 1, 1, 0),
(51, 'Ethiopian Birr', 'ETB', 'Nkf', 1, 1, 0),
(52, 'Euro', 'EUR', '€', 1, 1, 1),
(53, 'Falkland Islands Pound', 'FKP', '£', 1, 1, 0),
(54, 'Fijian Dollar', 'FJD', 'FJ$', 1, 1, 0),
(55, 'Gambian Dalasi', 'GMD', 'D', 1, 1, 1),
(56, 'Georgian Lari', 'GEL', 'ლ', 1, 1, 0),
(57, 'German Mark', 'DEM', 'DM', 1, 1, 0),
(58, 'Ghanaian Cedi', 'GHS', 'GH₵', 1, 1, 1),
(59, 'Gibraltar Pound', 'GIP', '£', 1, 1, 0),
(60, 'Greek Drachma', 'GRD', '₯, Δρχ, Δρ', 1, 1, 0),
(61, 'Guatemalan Quetzal', 'GTQ', 'Q', 1, 1, 0),
(62, 'Guinean Franc', 'GNF', 'FG', 1, 1, 1),
(63, 'Guyanaese Dollar', 'GYD', '$', 1, 1, 0),
(64, 'Haitian Gourde', 'HTG', 'G', 1, 1, 0),
(65, 'Honduran Lempira', 'HNL', 'L', 1, 1, 0),
(66, 'Hong Kong Dollar', 'HKD', '$', 1, 1, 0),
(67, 'Hungarian Forint', 'HUF', 'Ft', 1, 1, 0),
(68, 'Icelandic KrÃ³na', 'ISK', 'kr', 1, 1, 0),
(69, 'Indian Rupee', 'INR', '₹', 1, 1, 0),
(70, 'Indonesian Rupiah', 'IDR', 'Rp', 1, 1, 0),
(71, 'Iranian Rial', 'IRR', '﷼', 1, 1, 0),
(72, 'Iraqi Dinar', 'IQD', 'د.ع', 1, 1, 0),
(73, 'Israeli New Sheqel', 'ILS', '₪', 1, 1, 0),
(74, 'Italian Lira', 'ITL', 'L,£', 1, 1, 0),
(75, 'Jamaican Dollar', 'JMD', 'J$', 1, 1, 0),
(76, 'Japanese Yen', 'JPY', '¥', 1, 1, 0),
(77, 'Jordanian Dinar', 'JOD', 'ا.د', 1, 1, 0),
(78, 'Kazakhstani Tenge', 'KZT', 'лв', 1, 1, 0),
(79, 'Kenyan Shilling', 'KES', 'KSh', 1, 1, 1),
(80, 'Kuwaiti Dinar', 'KWD', 'ك.د', 1, 1, 0),
(81, 'Kyrgystani Som', 'KGS', 'лв', 1, 1, 0),
(82, 'Laotian Kip', 'LAK', '₭', 1, 1, 0),
(83, 'Latvian Lats', 'LVL', 'Ls', 0, 0, 0),
(84, 'Lebanese Pound', 'LBP', '£', 1, 1, 0),
(85, 'Lesotho Loti', 'LSL', 'L', 1, 1, 0),
(86, 'Liberian Dollar', 'LRD', '$', 1, 1, 1),
(87, 'Libyan Dinar', 'LYD', 'د.ل', 1, 1, 0),
(88, 'Lithuanian Litas', 'LTL', 'Lt', 0, 0, 0),
(89, 'Macanese Pataca', 'MOP', '$', 1, 1, 0),
(90, 'Macedonian Denar', 'MKD', 'ден', 1, 1, 0),
(91, 'Malagasy Ariary', 'MGA', 'Ar', 1, 1, 0),
(92, 'Malawian Kwacha', 'MWK', 'MK', 1, 1, 1),
(93, 'Malaysian Ringgit', 'MYR', 'RM', 1, 1, 0),
(94, 'Maldivian Rufiyaa', 'MVR', 'Rf', 1, 1, 0),
(95, 'Mauritanian Ouguiya', 'MRO', 'MRU', 1, 1, 0),
(96, 'Mauritian Rupee', 'MUR', '₨', 1, 1, 0),
(97, 'Mexican Peso', 'MXN', '$', 1, 1, 0),
(98, 'Moldovan Leu', 'MDL', 'L', 1, 1, 0),
(99, 'Mongolian Tugrik', 'MNT', '₮', 1, 1, 0),
(100, 'Moroccan Dirham', 'MAD', 'MAD', 1, 1, 1),
(101, 'Mozambican Metical', 'MZM', 'MT', 1, 1, 0),
(102, 'Myanmar Kyat', 'MMK', 'K', 1, 1, 0),
(103, 'Namibian Dollar', 'NAD', '$', 1, 1, 0),
(104, 'Nepalese Rupee', 'NPR', '₨', 1, 1, 0),
(105, 'Netherlands Antillean Guilder', 'ANG', 'ƒ', 1, 1, 0),
(106, 'New Taiwan Dollar', 'TWD', '$', 1, 1, 0),
(107, 'New Zealand Dollar', 'NZD', '$', 1, 1, 0),
(108, 'Nicaraguan CÃ³rdoba', 'NIO', 'C$', 1, 1, 0),
(109, 'Nigerian Naira', 'NGN', '₦', 1, 1, 1),
(110, 'North Korean Won', 'KPW', '₩', 0, 0, 0),
(111, 'Norwegian Krone', 'NOK', 'kr', 1, 1, 0),
(112, 'Omani Rial', 'OMR', '.ع.ر', 0, 0, 0),
(113, 'Pakistani Rupee', 'PKR', '₨', 1, 1, 0),
(114, 'Panamanian Balboa', 'PAB', 'B/.', 1, 1, 0),
(115, 'Papua New Guinean Kina', 'PGK', 'K', 1, 1, 0),
(116, 'Paraguayan Guarani', 'PYG', '₲', 1, 1, 0),
(117, 'Peruvian Nuevo Sol', 'PEN', 'S/.', 1, 1, 0),
(118, 'Philippine Peso', 'PHP', '₱', 1, 1, 0),
(119, 'Polish Zloty', 'PLN', 'zł', 1, 1, 0),
(120, 'Qatari Rial', 'QAR', 'ق.ر', 1, 1, 0),
(121, 'Romanian Leu', 'RON', 'lei', 1, 1, 0),
(122, 'Russian Ruble', 'RUB', '₽', 1, 1, 0),
(123, 'Rwandan Franc', 'RWF', 'FRw', 1, 1, 1),
(124, 'Salvadoran ColÃ³n', 'SVC', '₡', 0, 0, 0),
(125, 'Samoan Tala', 'WST', 'SAT', 1, 1, 0),
(126, 'Saudi Riyal', 'SAR', '﷼', 1, 1, 0),
(127, 'Serbian Dinar', 'RSD', 'din', 1, 1, 0),
(128, 'Seychellois Rupee', 'SCR', 'SRe', 1, 1, 0),
(129, 'Sierra Leonean Leone', 'SLL', 'Le', 1, 1, 1),
(130, 'Singapore Dollar', 'SGD', '$', 1, 1, 0),
(131, 'Slovak Koruna', 'SKK', 'Sk', 1, 1, 0),
(132, 'Solomon Islands Dollar', 'SBD', 'Si$', 1, 1, 0),
(133, 'Somali Shilling', 'SOS', 'Sh.so.', 1, 1, 0),
(134, 'South African Rand', 'ZAR', 'R', 1, 1, 1),
(135, 'South Korean Won', 'KRW', '₩', 1, 1, 0),
(136, 'Special Drawing Rights', 'XDR', 'SDR', 1, 1, 0),
(137, 'Sri Lankan Rupee', 'LKR', 'Rs', 1, 1, 0),
(138, 'St. Helena Pound', 'SHP', '£', 1, 1, 0),
(139, 'Sudanese Pound', 'SDG', '.س.ج', 1, 1, 0),
(140, 'Surinamese Dollar', 'SRD', '$', 1, 1, 0),
(141, 'Swazi Lilangeni', 'SZL', 'E', 1, 1, 0),
(142, 'Swedish Krona', 'SEK', 'kr', 1, 1, 0),
(143, 'Swiss Franc', 'CHF', 'CHf', 1, 1, 0),
(144, 'Syrian Pound', 'SYP', 'LS', 0, 0, 0),
(145, 'São Tomé and Príncipe Dobra', 'STD', 'Db', 1, 1, 1),
(146, 'Tajikistani Somoni', 'TJS', 'SM', 1, 1, 0),
(147, 'Tanzanian Shilling', 'TZS', 'TSh', 1, 1, 1),
(148, 'Thai Baht', 'THB', '฿', 1, 1, 0),
(149, 'Tongan pa\'anga', 'TOP', '$', 1, 1, 0),
(150, 'Trinidad & Tobago Dollar', 'TTD', '$', 1, 1, 0),
(151, 'Tunisian Dinar', 'TND', 'ت.د', 1, 1, 0),
(152, 'Turkish Lira', 'TRY', '₺', 1, 1, 0),
(153, 'Turkmenistani Manat', 'TMT', 'T', 1, 1, 0),
(154, 'Ugandan Shilling', 'UGX', 'UGX', 1, 1, 1),
(155, 'Ukrainian Hryvnia', 'UAH', '₴', 1, 1, 0),
(156, 'United Arab Emirates Dirham', 'AED', 'إ.د', 1, 1, 0),
(157, 'Uruguayan Peso', 'UYU', '$', 1, 1, 0),
(158, 'Afghan Afghani', 'AFA', '؋', 1, 1, 0),
(159, 'Uzbekistan Som', 'UZS', 'лв', 1, 1, 0),
(160, 'Vanuatu Vatu', 'VUV', 'VT', 1, 1, 0),
(161, 'Venezuelan BolÃvar', 'VEF', 'Bs', 0, 0, 0),
(162, 'Vietnamese Dong', 'VND', '₫', 1, 1, 0),
(163, 'Yemeni Rial', 'YER', '﷼', 1, 1, 0),
(164, 'Zambian Kwacha', 'ZMK', 'ZK', 1, 1, 1),
(165, 'PesosColombian Peso', 'COP', '$', 0, 0, 1),
(166, 'SEPA', 'EUR', '€', 0, 0, 1),
(167, 'Mozambican Metical', 'MZN', 'MT', 0, 0, 1),
(168, 'Peruvian Sol', 'SOL', 'S/', 0, 0, 1),
(169, 'Zambian Kwacha', 'ZMW', 'ZK', 0, 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `daily_attendances`
--

CREATE TABLE `daily_attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `daily_attendances`
--

INSERT INTO `daily_attendances` (`id`, `class_id`, `section_id`, `student_id`, `status`, `session_id`, `school_id`, `timestamp`, `created_at`, `updated_at`) VALUES
(1, 4, 4, 4, 1, 2, 1, 1684692000, '2023-05-22 06:30:05', '2023-05-22 06:30:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `departments`
--

INSERT INTO `departments` (`id`, `name`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 'Kinh doanh', 1, '2023-05-13 11:26:05', '2023-05-13 11:26:05'),
(2, 'Nghiệp vụ', 1, '2023-05-13 11:26:10', '2023-05-13 11:26:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `enrollments`
--

CREATE TABLE `enrollments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `enrollments`
--

INSERT INTO `enrollments` (`id`, `user_id`, `class_id`, `section_id`, `school_id`, `department_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 4, 4, 4, 1, NULL, 2, '2023-05-20 08:28:37', '2023-05-20 08:28:37'),
(2, 6, 4, 4, 1, NULL, 2, '2023-05-22 07:18:47', '2023-05-22 07:18:47'),
(3, 7, 4, 4, 1, NULL, 2, '2023-05-22 08:05:29', '2023-05-22 08:05:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `exams`
--

CREATE TABLE `exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `exam_type` varchar(255) NOT NULL,
  `starting_time` varchar(255) NOT NULL,
  `ending_time` varchar(255) NOT NULL,
  `total_marks` float NOT NULL,
  `status` varchar(255) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `exams`
--

INSERT INTO `exams` (`id`, `name`, `exam_type`, `starting_time`, `ending_time`, `total_marks`, `status`, `class_id`, `subject_id`, `school_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 'Thi cuối kỳ', 'offline', '1685537100', '1684586700', 100, 'pending', 4, 3, 1, 2, '2023-05-20 11:45:51', '2023-05-20 11:45:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `exam_categories`
--

CREATE TABLE `exam_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `exam_categories`
--

INSERT INTO `exam_categories` (`id`, `name`, `school_id`, `session_id`, `timestamp`, `created_at`, `updated_at`) VALUES
(1, 'Thi cuối kỳ', 1, 2, 1684519200, '2023-05-20 11:45:34', '2023-05-20 11:45:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `expenses`
--

INSERT INTO `expenses` (`id`, `expense_category_id`, `class_id`, `date`, `amount`, `school_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 2, 4, 1684605600, '38500000', 1, 2, '2023-05-21 08:55:25', '2023-05-21 08:55:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `school_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 'Thuê giảng viên', 1, 2, '2023-05-21 08:52:42', '2023-05-21 08:52:42'),
(2, 'Phí dịch vụ', 1, 2, '2023-05-21 08:53:18', '2023-05-21 08:53:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `faq`
--

INSERT INTO `faq` (`id`, `title`, `description`) VALUES
(1, 'What is Ekattor 8?', 'Ekattor 8 is a collection of programs designed to assist schools in administering their executive responsibilities on a day-to-day basis. Ekattor 8 is an updated version of Ekattor ERP (Enterprise Resource Planning). Also, Ekattor 8 is designed for SAAS (Software as a Service) projects.'),
(2, 'How can I get developed my customer features?', 'Custom features do not coming with product support. You can contact our support center and send us details about your requirement. If our schedule is open, we can give you a quotation and take your project according to the contract.'),
(5, 'Which license to choose for my client project?', 'If you use academy LMS for a commercial project of a client, you will be required extended license.'),
(6, 'How much time will I get developer support?', 'By default, you are entitled to developer support for 6 months from the date of your purchase. Later on anytime you can renew the support pack if you need developer support. If you don’t need any developer support, you don’t need to buy it.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `frontend_events`
--

CREATE TABLE `frontend_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `global_settings`
--

CREATE TABLE `global_settings` (
  `id` int(11) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `global_settings`
--

INSERT INTO `global_settings` (`id`, `key`, `value`) VALUES
(1, 'system_name', 'Quản lý học tập'),
(2, 'system_title', 'Bitlearn LMS'),
(3, 'system_email', 'info@ionsite.vn'),
(4, 'phone', '0912947499'),
(5, 'address', '199 Dũng Sĩ Thanh Khê'),
(6, 'purchase_code', NULL),
(7, 'system_currency', 'VND'),
(8, 'currency_position', 'right-space'),
(9, 'running_session', '1'),
(10, 'language', 'Vietnam'),
(11, 'payment_settings', '[]'),
(12, 'footer_text', 'By Bitlearn Team'),
(13, 'footer_link', 'https://bitlearn.vn'),
(14, 'version', '1.5'),
(15, 'fax', '0912947499'),
(16, 'timezone', 'Asia/Ho_Chi_Minh'),
(17, 'smtp_protocol', 'smtp'),
(18, 'smtp_crypto', 'tls'),
(19, 'smtp_host', 'smtp.googlemail.com'),
(20, 'smtp_port', '587'),
(21, 'smtp_user', 'your-email'),
(22, 'smtp_pass', 'Email-password'),
(28, 'offline', '{\"status\":\"1\"}'),
(29, 'light_logo', '16846614482.png'),
(30, 'dark_logo', '16846612781.png'),
(31, 'favicon', 'favicon.png'),
(32, 'randCallRange', '30'),
(33, 'help_link', 'http://docs.bitlearn.vn/'),
(34, 'youtube_api_key', 'youtube-api-key'),
(35, 'vimeo_api_key', 'vimeo-api-key'),
(36, 'banner_title', 'Bringing Excellence To Students'),
(37, 'banner_subtitle', 'Empowering and inspiring all students to excel as life long learners'),
(38, 'facebook_link', 'https://www.facebook.com/CreativeitemApps'),
(39, 'twitter_link', 'https://twitter.com/creativeitem'),
(40, 'linkedin_link', 'https://www.linkedin.com/company/creativeitem'),
(41, 'instagram_link', 'http://www.instagram.com/creativeitem'),
(42, 'price_subtitle', 'Choose the best subscription plan for your school'),
(43, 'copyright_text', '2022 Academy, All rights reserved'),
(44, 'contact_email', 'ekattor@domain.com'),
(45, 'frontend_footer_text', 'Ekattor 8 is a collection of programs designed to assist schools in administering their executive responsibilities on a day-to-day basis. It is designed for SAAS (Software as a Service) projects.'),
(46, 'faq_subtitle', 'Frequently asked questions'),
(49, 'frontend_view', '0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gradebooks`
--

CREATE TABLE `gradebooks` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `exam_category_id` int(11) NOT NULL,
  `marks` varchar(255) DEFAULT NULL,
  `comment` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `grades`
--

CREATE TABLE `grades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `grade_point` varchar(255) NOT NULL,
  `mark_from` int(11) NOT NULL,
  `mark_upto` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phrase` varchar(300) DEFAULT NULL,
  `translated` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `language`
--

INSERT INTO `language` (`id`, `name`, `phrase`, `translated`) VALUES
(1, 'english', 'Dashboard', 'Dashboard'),
(2, 'english', 'Home', 'Home'),
(3, 'english', 'Schools', 'Schools'),
(4, 'english', 'Total Schools', 'Total Schools'),
(5, 'english', 'Subscription', 'Subscription'),
(6, 'english', 'Total Active Subscription', 'Total Active Subscription'),
(7, 'english', 'Subscription Payment', 'Subscription Payment'),
(8, 'english', 'Superadmin | Ekator 8', 'Superadmin | Ekator 8'),
(9, 'english', 'Close', 'Close'),
(10, 'english', 'School List', 'School List'),
(11, 'english', 'Create school', 'Create school'),
(12, 'english', 'Pending List', 'Pending List'),
(13, 'english', 'Package', 'Package'),
(14, 'english', 'Subscriptions', 'Subscriptions'),
(15, 'english', 'Subscription Report', 'Subscription Report'),
(16, 'english', 'Pending Request', 'Pending Request'),
(17, 'english', 'Confirmed Payment', 'Confirmed Payment'),
(18, 'english', 'Addons', 'Addons'),
(19, 'english', 'Settings', 'Settings'),
(20, 'english', 'System Settings', 'System Settings'),
(21, 'english', 'Session Manager', 'Session Manager'),
(22, 'english', 'Payment Settings', 'Payment Settings'),
(23, 'english', 'Smtp settings', 'Smtp settings'),
(24, 'english', 'About', 'About'),
(25, 'english', 'Superadmin', 'Superadmin'),
(26, 'english', 'My Account', 'My Account'),
(27, 'english', 'Change Password', 'Change Password'),
(28, 'english', 'Log out', 'Log out'),
(29, 'english', 'Loading...', 'Loading...'),
(30, 'english', 'Heads up!', 'Heads up!'),
(31, 'english', 'Are you sure?', 'Are you sure?'),
(32, 'english', 'Back', 'Back'),
(33, 'english', 'Continue', 'Continue'),
(34, 'english', 'You won\'t able to revert this!', 'You won\'t able to revert this!'),
(35, 'english', 'Yes', 'Yes'),
(36, 'english', 'Cancel', 'Cancel'),
(37, 'english', 'Add School', 'Add School'),
(38, 'english', 'Name', 'Name'),
(39, 'english', 'Address', 'Address'),
(40, 'english', 'Phone', 'Phone'),
(41, 'english', 'Info', 'Info'),
(42, 'english', 'Status', 'Status'),
(43, 'english', 'Action', 'Action'),
(44, 'english', 'Active', 'Active'),
(45, 'english', 'Actions', 'Actions'),
(46, 'english', 'Edit School', 'Edit School'),
(47, 'english', 'Edit', 'Edit'),
(48, 'english', 'Delete', 'Delete'),
(49, 'english', 'School Form', 'School Form'),
(50, 'english', 'Provide all the information required for your school.', 'Provide all the information required for your school.'),
(51, 'english', 'Also provide a admin information with email and passwoard.', 'Also provide a admin information with email and passwoard.'),
(52, 'english', 'So that admin can access the created school.', 'So that admin can access the created school.'),
(53, 'english', 'SCHOOL INFO', 'SCHOOL INFO'),
(54, 'english', 'School Name', 'School Name'),
(55, 'english', 'School Address', 'School Address'),
(56, 'english', 'School Email', 'School Email'),
(57, 'english', 'School Phone', 'School Phone'),
(58, 'english', 'ADMIN INFO', 'ADMIN INFO'),
(59, 'english', 'Gender', 'Gender'),
(60, 'english', 'Select a gender', 'Select a gender'),
(61, 'english', 'Male', 'Male'),
(62, 'english', 'Female', 'Female'),
(63, 'english', 'Blood group', 'Blood group'),
(64, 'english', 'Select a blood group', 'Select a blood group'),
(65, 'english', 'A+', 'A+'),
(66, 'english', 'A-', 'A-'),
(67, 'english', 'B+', 'B+'),
(68, 'english', 'B-', 'B-'),
(69, 'english', 'AB+', 'AB+'),
(70, 'english', 'AB-', 'AB-'),
(71, 'english', 'O+', 'O+'),
(72, 'english', 'O-', 'O-'),
(73, 'english', 'Admin Address', 'Admin Address'),
(74, 'english', 'Admin Phone Number', 'Admin Phone Number'),
(75, 'english', 'Photo', 'Photo'),
(76, 'english', 'Admin Email', 'Admin Email'),
(77, 'english', 'Admin Password', 'Admin Password'),
(78, 'english', 'Submit', 'Submit'),
(79, 'english', 'Pending School List', 'Pending School List'),
(80, 'english', 'No data found', 'No data found'),
(81, 'english', 'Packages', 'Packages'),
(82, 'english', 'Add Package', 'Add Package'),
(83, 'english', 'Price', 'Price'),
(84, 'english', 'Interval', 'Interval'),
(85, 'english', 'Preiod', 'Preiod'),
(86, 'english', 'Filter', 'Filter'),
(87, 'english', 'Export', 'Export'),
(88, 'english', 'PDF', 'PDF'),
(89, 'english', 'CSV', 'CSV'),
(90, 'english', 'Print', 'Print'),
(91, 'english', 'Paid By', 'Paid By'),
(92, 'english', 'Purchase Date', 'Purchase Date'),
(93, 'english', 'Expire Date', 'Expire Date'),
(94, 'english', 'Confirmed Request', 'Confirmed Request'),
(95, 'english', 'Payment For', 'Payment For'),
(96, 'english', 'Payment Document', 'Payment Document'),
(97, 'english', 'Approve', 'Approve'),
(98, 'english', 'Manage Addons', 'Manage Addons'),
(99, 'english', 'Install addon', 'Install addon'),
(100, 'english', 'Add new addon', 'Add new addon'),
(101, 'english', 'System Name', 'System Name'),
(102, 'english', 'System Title', 'System Title'),
(103, 'english', 'System Email', 'System Email'),
(104, 'english', 'Fax', 'Fax'),
(105, 'english', 'Timezone', 'Timezone'),
(106, 'english', 'Footer Text', 'Footer Text'),
(107, 'english', 'Footer Link', 'Footer Link'),
(108, 'english', 'PRODUCT UPDATE', 'PRODUCT UPDATE'),
(109, 'english', 'File', 'File'),
(110, 'english', 'Update', 'Update'),
(111, 'english', 'SYSTEM LOGO', 'SYSTEM LOGO'),
(112, 'english', 'Dark logo', 'Dark logo'),
(113, 'english', 'Light logo', 'Light logo'),
(114, 'english', 'Favicon', 'Favicon'),
(115, 'english', 'Update Logo', 'Update Logo'),
(116, 'english', 'Create Session', 'Create Session'),
(117, 'english', 'Add Session', 'Add Session'),
(118, 'english', 'Active session ', 'Active session '),
(119, 'english', 'Select a session', 'Select a session'),
(120, 'english', 'Activate', 'Activate'),
(121, 'english', 'Session title', 'Session title'),
(122, 'english', 'Options', 'Options'),
(123, 'english', 'Edit Session', 'Edit Session'),
(124, 'english', 'Global Currency', 'Global Currency'),
(125, 'english', 'Select system currency', 'Select system currency'),
(126, 'english', 'Currency Position', 'Currency Position'),
(127, 'english', 'Left', 'Left'),
(128, 'english', 'Right', 'Right'),
(129, 'english', 'Left with a space', 'Left with a space'),
(130, 'english', 'Right with a space', 'Right with a space'),
(131, 'english', 'Update Currency', 'Update Currency'),
(132, 'english', 'Protocol', 'Protocol'),
(133, 'english', 'Smtp crypto', 'Smtp crypto'),
(134, 'english', 'Smtp host', 'Smtp host'),
(135, 'english', 'Smtp port', 'Smtp port'),
(136, 'english', 'Smtp username', 'Smtp username'),
(137, 'english', 'Smtp password', 'Smtp password'),
(138, 'english', 'Save', 'Save'),
(139, 'english', 'Not found', 'Not found'),
(140, 'english', 'About this application', 'About this application'),
(141, 'english', 'Software version', 'Software version'),
(142, 'english', 'Check update', 'Check update'),
(143, 'english', 'PHP version', 'PHP version'),
(144, 'english', 'Curl enable', 'Curl enable'),
(145, 'english', 'Enabled', 'Enabled'),
(146, 'english', 'Purchase code', 'Purchase code'),
(147, 'english', 'Product license', 'Product license'),
(148, 'english', 'invalid', 'invalid'),
(149, 'english', 'Enter valid purchase code', 'Enter valid purchase code'),
(150, 'english', 'Customer support status', 'Customer support status'),
(151, 'english', 'Support expiry date', 'Support expiry date'),
(152, 'english', 'Customer name', 'Customer name'),
(153, 'english', 'Get customer support', 'Get customer support'),
(154, 'english', 'Customer support', 'Customer support'),
(155, 'english', 'Email', 'Email'),
(156, 'english', 'Password', 'Password'),
(157, 'english', 'Forgot password', 'Forgot password'),
(158, 'english', 'Help', 'Help'),
(159, 'english', 'Login', 'Login'),
(160, 'english', 'Total Student', 'Total Student'),
(161, 'english', 'Teacher', 'Teacher'),
(162, 'english', 'Total Teacher', 'Total Teacher'),
(163, 'english', 'Parents', 'Parents'),
(164, 'english', 'Total Parent', 'Total Parent'),
(165, 'english', 'Staff', 'Staff'),
(166, 'english', 'Total Staff', 'Total Staff'),
(167, 'english', 'Todays Attendance', 'Todays Attendance'),
(168, 'english', 'Go to Attendance', 'Go to Attendance'),
(169, 'english', 'Income Report', 'Income Report'),
(170, 'english', 'Year', 'Year'),
(171, 'english', 'Month', 'Month'),
(172, 'english', 'Week', 'Week'),
(173, 'english', 'Upcoming Events', 'Upcoming Events'),
(174, 'english', 'See all', 'See all'),
(175, 'english', 'Admin', 'Admin'),
(176, 'english', 'Users', 'Users'),
(177, 'english', 'Accountant', 'Accountant'),
(178, 'english', 'Librarian', 'Librarian'),
(179, 'english', 'Parent', 'Parent'),
(180, 'english', 'Student', 'Student'),
(181, 'english', 'Teacher Permission', 'Teacher Permission'),
(182, 'english', 'Admissions', 'Admissions'),
(183, 'english', 'Examination', 'Examination'),
(184, 'english', 'Exam Category', 'Exam Category'),
(185, 'english', 'Offline Exam', 'Offline Exam'),
(186, 'english', 'Marks', 'Marks'),
(187, 'english', 'Grades', 'Grades'),
(188, 'english', 'Promotion', 'Promotion'),
(189, 'english', 'Academic', 'Academic'),
(190, 'english', 'Daily Attendance', 'Daily Attendance'),
(191, 'english', 'Class List', 'Class List'),
(192, 'english', 'Class Routine', 'Class Routine'),
(193, 'english', 'Subjects', 'Subjects'),
(194, 'english', 'Gradebooks', 'Gradebooks'),
(195, 'english', 'Syllabus', 'Syllabus'),
(196, 'english', 'Class Room', 'Class Room'),
(197, 'english', 'Department', 'Department'),
(198, 'english', 'Accounting', 'Accounting'),
(199, 'english', 'Student Fee Manager', 'Student Fee Manager'),
(200, 'english', 'Offline Payment Request', 'Offline Payment Request'),
(201, 'english', 'Expense Manager', 'Expense Manager'),
(202, 'english', 'Expense Category', 'Expense Category'),
(203, 'english', 'Back Office', 'Back Office'),
(204, 'english', 'Book List Manager', 'Book List Manager'),
(205, 'english', 'Book Issue Report', 'Book Issue Report'),
(206, 'english', 'Noticeboard', 'Noticeboard'),
(207, 'english', 'Events', 'Events'),
(208, 'english', 'School Settings', 'School Settings'),
(209, 'english', 'School information', 'School information'),
(210, 'english', 'Update settings', 'Update settings'),
(211, 'english', 'Deactive', 'Deactive'),
(212, 'english', 'Session has been activated', 'Session has been activated'),
(213, 'english', 'Update session', 'Update session'),
(214, 'english', 'Admins', 'Admins'),
(215, 'english', 'Create Admin', 'Create Admin'),
(216, 'english', 'User Info', 'User Info'),
(217, 'english', 'Oprions', 'Oprions'),
(218, 'english', 'Edit Admin', 'Edit Admin'),
(219, 'english', 'Teachers', 'Teachers'),
(220, 'english', 'Create Teacher', 'Create Teacher'),
(221, 'english', 'Create Accountant', 'Create Accountant'),
(222, 'english', 'Edit Accountant', 'Edit Accountant'),
(223, 'english', 'Librarians', 'Librarians'),
(224, 'english', 'Create Librarian', 'Create Librarian'),
(225, 'english', 'Edit Librarian', 'Edit Librarian'),
(226, 'english', 'Create Parent', 'Create Parent'),
(227, 'english', 'Edit Parent', 'Edit Parent'),
(228, 'english', 'Students', 'Students'),
(229, 'english', 'Create Student', 'Create Student'),
(230, 'english', 'Generate id card', 'Generate id card'),
(231, 'english', 'Assigned Permission For Teacher', 'Assigned Permission For Teacher'),
(232, 'english', 'Select a class', 'Select a class'),
(233, 'english', 'First select a class', 'First select a class'),
(234, 'english', 'Please select a class and section', 'Please select a class and section'),
(235, 'english', 'Attendance', 'Attendance'),
(236, 'english', 'Permission updated successfully.', 'Permission updated successfully.'),
(237, 'english', 'Admission', 'Admission'),
(238, 'english', 'Bulk student admission', 'Bulk student admission'),
(239, 'english', 'Class', 'Class'),
(240, 'english', 'Section', 'Section'),
(241, 'english', 'Select section', 'Select section'),
(242, 'english', 'Birthday', 'Birthday'),
(243, 'english', 'Select gender', 'Select gender'),
(244, 'english', 'Others', 'Others'),
(245, 'english', 'Student profile image', 'Student profile image'),
(246, 'english', 'Add Student', 'Add Student'),
(247, 'english', 'Create Exam Category', 'Create Exam Category'),
(248, 'english', 'Add Exam Category', 'Add Exam Category'),
(249, 'english', 'Title', 'Title'),
(250, 'english', 'Class test', 'Class test'),
(251, 'english', 'Edit Exam Category', 'Edit Exam Category'),
(252, 'english', 'Midterm exam', 'Midterm exam'),
(253, 'english', 'Final exam', 'Final exam'),
(254, 'english', 'Admission exam', 'Admission exam'),
(255, 'english', 'Create Exam', 'Create Exam'),
(256, 'english', 'Add Exam', 'Add Exam'),
(257, 'english', 'Exam', 'Exam'),
(258, 'english', 'Starting Time', 'Starting Time'),
(259, 'english', 'Ending Time', 'Ending Time'),
(260, 'english', 'Total Marks', 'Total Marks'),
(261, 'english', 'Edit Exam', 'Edit Exam'),
(262, 'english', 'Manage Marks', 'Manage Marks'),
(263, 'english', 'Select category', 'Select category'),
(264, 'english', 'Select class', 'Select class'),
(265, 'english', 'Please select all the fields', 'Please select all the fields'),
(266, 'english', 'Examknation', 'Examknation'),
(267, 'english', 'Create Grade', 'Create Grade'),
(268, 'english', 'Add grade', 'Add grade'),
(269, 'english', 'Grade', 'Grade'),
(270, 'english', 'Grade Point', 'Grade Point'),
(271, 'english', 'Mark From', 'Mark From'),
(272, 'english', 'Mark Upto', 'Mark Upto'),
(273, 'english', 'Promotions', 'Promotions'),
(274, 'english', 'Current session', 'Current session'),
(275, 'english', 'Session from', 'Session from'),
(276, 'english', 'Next session', 'Next session'),
(277, 'english', 'Session to', 'Session to'),
(278, 'english', 'Promoting from', 'Promoting from'),
(279, 'english', 'Promoting to', 'Promoting to'),
(280, 'english', 'Manage promotion', 'Manage promotion'),
(281, 'english', 'Take Attendance', 'Take Attendance'),
(282, 'english', 'Select a month', 'Select a month'),
(283, 'english', 'January', 'January'),
(284, 'english', 'February', 'February'),
(285, 'english', 'March', 'March'),
(286, 'english', 'April', 'April'),
(287, 'english', 'May', 'May'),
(288, 'english', 'June', 'June'),
(289, 'english', 'July', 'July'),
(290, 'english', 'August', 'August'),
(291, 'english', 'September', 'September'),
(292, 'english', 'October', 'October'),
(293, 'english', 'November', 'November'),
(294, 'english', 'December', 'December'),
(295, 'english', 'Select a year', 'Select a year'),
(296, 'english', 'Please select in all fields !', 'Please select in all fields !'),
(297, 'english', 'Classes', 'Classes'),
(298, 'english', 'Create Class', 'Create Class'),
(299, 'english', 'Add class', 'Add class'),
(300, 'english', 'Edit Section', 'Edit Section'),
(301, 'english', 'Edit Class', 'Edit Class'),
(302, 'english', 'Routines', 'Routines'),
(303, 'english', 'Add class routine', 'Add class routine'),
(304, 'english', 'Create Subject', 'Create Subject'),
(305, 'english', 'Add subject', 'Add subject'),
(306, 'english', 'Edit Subject', 'Edit Subject'),
(307, 'english', 'Select a exam category', 'Select a exam category'),
(308, 'english', 'Create syllabus', 'Create syllabus'),
(309, 'english', 'Add syllabus', 'Add syllabus'),
(310, 'english', 'Class Rooms', 'Class Rooms'),
(311, 'english', 'Create Class Room', 'Create Class Room'),
(312, 'english', 'Add class room', 'Add class room'),
(313, 'english', 'Edit Class Room', 'Edit Class Room'),
(314, 'english', 'Departments', 'Departments'),
(315, 'english', 'Create Department', 'Create Department'),
(316, 'english', 'Add department', 'Add department'),
(317, 'english', 'Edit Department', 'Edit Department'),
(318, 'english', 'Add Single Invoice', 'Add Single Invoice'),
(319, 'english', 'Add Mass Invoice', 'Add Mass Invoice'),
(320, 'english', 'All class', 'All class'),
(321, 'english', 'All status', 'All status'),
(322, 'english', 'Paid', 'Paid'),
(323, 'english', 'Unpaid', 'Unpaid'),
(324, 'english', 'Invoice No', 'Invoice No'),
(325, 'english', 'Invoice Title', 'Invoice Title'),
(326, 'english', 'Total Amount', 'Total Amount'),
(327, 'english', 'Created at', 'Created at'),
(328, 'english', 'Paid Amount', 'Paid Amount'),
(329, 'english', 'Expense', 'Expense'),
(330, 'english', 'Create Expense', 'Create Expense'),
(331, 'english', 'Add New Expense', 'Add New Expense'),
(332, 'english', 'Create Expense Category', 'Create Expense Category'),
(333, 'english', 'Add Expense Category', 'Add Expense Category'),
(334, 'english', 'Option', 'Option'),
(335, 'english', 'Edit Expense Category', 'Edit Expense Category'),
(336, 'english', 'Book', 'Book'),
(337, 'english', 'Add book', 'Add book'),
(338, 'english', 'Book name', 'Book name'),
(339, 'english', 'Author', 'Author'),
(340, 'english', 'Copies', 'Copies'),
(341, 'english', 'Available copies', 'Available copies'),
(342, 'english', 'Edit Book', 'Edit Book'),
(343, 'english', 'Book Issue', 'Book Issue'),
(344, 'english', 'Issue Book', 'Issue Book'),
(345, 'english', 'Noticeboard calendar', 'Noticeboard calendar'),
(346, 'english', 'Add New Notice', 'Add New Notice'),
(347, 'english', 'Locales:', 'Locales:'),
(348, 'english', 'Current Plan', 'Current Plan'),
(349, 'english', 'Silver', 'Silver'),
(350, 'english', 'Monthly', 'Monthly'),
(351, 'english', 'Subscription Renew Date', 'Subscription Renew Date'),
(352, 'english', 'Amount To Be Charged', 'Amount To Be Charged'),
(353, 'english', 'Create Event', 'Create Event'),
(354, 'english', 'Event title', 'Event title'),
(355, 'english', 'Date', 'Date'),
(356, 'english', 'Update event', 'Update event'),
(357, 'english', 'Upload addons zip file', 'Upload addons zip file'),
(358, 'english', 'Verified', 'Verified'),
(359, 'english', 'Details info', 'Details info'),
(360, 'english', 'Phone Number', 'Phone Number'),
(361, 'english', 'Designation', 'Designation'),
(362, 'english', 'Save Changes', 'Save Changes'),
(363, 'english', 'Select a status', 'Select a status'),
(364, 'english', 'Update school', 'Update school'),
(365, 'english', 'Package price', 'Package price'),
(366, 'english', 'Package Type', 'Package Type'),
(367, 'english', 'Select a package type', 'Select a package type'),
(368, 'english', 'Trail', 'Trail'),
(369, 'english', 'Select a interval', 'Select a interval'),
(370, 'english', 'Days', 'Days'),
(371, 'english', 'Yearly', 'Yearly'),
(372, 'english', 'Interval Preiod', 'Interval Preiod'),
(373, 'english', 'Description', 'Description'),
(374, 'english', 'Create package', 'Create package'),
(375, 'english', 'Update package', 'Update package'),
(376, 'english', 'Invalid purchase code', 'Invalid purchase code'),
(377, 'english', 'Inactive', 'Inactive'),
(378, 'english', 'Save event', 'Save event'),
(379, 'english', 'Create', 'Create'),
(380, 'english', 'Select a department', 'Select a department'),
(381, 'english', 'One', 'One'),
(382, 'english', 'Two', 'Two'),
(383, 'english', 'Three', 'Three'),
(384, 'english', 'Four', 'Four'),
(385, 'english', 'Five', 'Five'),
(386, 'english', 'Six', 'Six'),
(387, 'english', 'Seven', 'Seven'),
(388, 'english', 'Eight', 'Eight'),
(389, 'english', 'Nine', 'Nine'),
(390, 'english', 'Ten', 'Ten'),
(391, 'english', 'Add students', 'Add students'),
(392, 'english', 'Create category', 'Create category'),
(393, 'english', 'Exam Name', 'Exam Name'),
(394, 'english', 'Select exam category name', 'Select exam category name'),
(395, 'english', 'Subject', 'Subject'),
(396, 'english', 'Starting date', 'Starting date'),
(397, 'english', 'Ending date', 'Ending date'),
(398, 'english', 'Student name', 'Student name'),
(399, 'english', 'Mark', 'Mark'),
(400, 'english', 'Comment', 'Comment'),
(401, 'english', 'Value has been updated successfully', 'Value has been updated successfully'),
(402, 'english', 'Required mark field', 'Required mark field'),
(403, 'english', 'Image', 'Image'),
(404, 'english', 'Enroll to', 'Enroll to'),
(405, 'english', 'Select a section', 'Select a section'),
(406, 'english', 'Attendance Report Of', 'Attendance Report Of'),
(407, 'english', 'Last Update at', 'Last Update at'),
(408, 'english', 'Time', 'Time'),
(409, 'english', 'Please select the required fields', 'Please select the required fields'),
(410, 'english', 'Saturday', 'Saturday'),
(411, 'english', 'Sunday', 'Sunday'),
(412, 'english', 'Monday', 'Monday'),
(413, 'english', 'Tuesday', 'Tuesday'),
(414, 'english', 'Wednesday', 'Wednesday'),
(415, 'english', 'Update subject', 'Update subject'),
(416, 'english', 'Select subject', 'Select subject'),
(417, 'english', 'Assign a teacher', 'Assign a teacher'),
(418, 'english', 'Select a class room', 'Select a class room'),
(419, 'english', 'Day', 'Day'),
(420, 'english', 'Select a day', 'Select a day'),
(421, 'english', 'Thursday', 'Thursday'),
(422, 'english', 'Friday', 'Friday'),
(423, 'english', 'Starting hour', 'Starting hour'),
(424, 'english', 'Starting minute', 'Starting minute'),
(425, 'english', 'Ending hour', 'Ending hour'),
(426, 'english', 'Ending minute', 'Ending minute'),
(427, 'english', 'Add routine', 'Add routine'),
(428, 'english', 'Edit class routine', 'Edit class routine'),
(429, 'english', 'Tittle', 'Tittle'),
(430, 'english', 'Upload syllabus', 'Upload syllabus'),
(431, 'english', 'Select student', 'Select student'),
(432, 'english', 'Select a student', 'Select a student'),
(433, 'english', 'Payment method', 'Payment method'),
(434, 'english', 'Select a payment method', 'Select a payment method'),
(435, 'english', 'Cash', 'Cash'),
(436, 'english', 'Paypal', 'Paypal'),
(437, 'english', 'Paytm', 'Paytm'),
(438, 'english', 'Razorpay', 'Razorpay'),
(439, 'english', 'Create invoice', 'Create invoice'),
(440, 'english', 'Payment date', 'Payment date'),
(441, 'english', 'Print invoice', 'Print invoice'),
(442, 'english', 'Edit Invoice', 'Edit Invoice'),
(443, 'english', 'Amount', 'Amount'),
(444, 'english', 'Select an expense category', 'Select an expense category'),
(445, 'english', 'Edit Expense', 'Edit Expense'),
(446, 'english', 'Issue date', 'Issue date'),
(447, 'english', 'Select book', 'Select book'),
(448, 'english', 'Id', 'Id'),
(449, 'english', 'Pending', 'Pending'),
(450, 'english', 'Update issued book', 'Update issued book'),
(451, 'english', 'Return this book', 'Return this book'),
(452, 'english', 'Notice title', 'Notice title'),
(453, 'english', 'Start date', 'Start date'),
(454, 'english', 'Setup additional date & time', 'Setup additional date & time'),
(455, 'english', 'Start time', 'Start time'),
(456, 'english', 'End date', 'End date'),
(457, 'english', 'End time', 'End time'),
(458, 'english', 'Notice', 'Notice'),
(459, 'english', 'Show on website', 'Show on website'),
(460, 'english', 'Show', 'Show'),
(461, 'english', 'Do not need to show', 'Do not need to show'),
(462, 'english', 'Upload notice photo', 'Upload notice photo'),
(463, 'english', 'Save notice', 'Save notice'),
(464, 'english', 'School Currency', 'School Currency'),
(465, 'english', 'Exam List', 'Exam List'),
(466, 'english', 'Profile', 'Profile'),
(467, 'english', ' Download', ' Download'),
(468, 'english', 'Select a subject', 'Select a subject'),
(469, 'english', 'Welcome, to', 'Welcome, to'),
(470, 'english', 'Fee Manager', 'Fee Manager'),
(471, 'english', 'List Of Books', 'List Of Books'),
(472, 'english', 'Issued Book', 'Issued Book'),
(473, 'english', 'Student Code', 'Student Code'),
(474, 'english', 'Candice Kennedy', 'Candice Kennedy'),
(475, 'english', 'English', 'English'),
(476, 'english', 'Natalie Ashley', 'Natalie Ashley'),
(477, 'english', 'Byron Chase', 'Byron Chase'),
(478, 'english', 'Rafael Hardy', 'Rafael Hardy'),
(479, 'english', 'Mathematics', 'Mathematics'),
(480, 'english', 'Aphrodite Shaffer', 'Aphrodite Shaffer'),
(481, 'english', 'Bangla', 'Bangla'),
(482, 'english', 'Fatima Phillips', 'Fatima Phillips'),
(483, 'english', 'Sydney Pearson', 'Sydney Pearson'),
(484, 'english', 'Drawing', 'Drawing'),
(485, 'english', 'Imani Cooper', 'Imani Cooper'),
(486, 'english', 'Ulric Spencer', 'Ulric Spencer'),
(487, 'english', 'Yoshio Gentry', 'Yoshio Gentry'),
(488, 'english', 'Attendance report', 'Attendance report'),
(489, 'english', 'Of', 'Of'),
(490, 'english', 'Last updated at', 'Last updated at'),
(491, 'english', 'View Marks', 'View Marks'),
(492, 'english', 'Subject name', 'Subject name'),
(493, 'english', 'Pay', 'Pay'),
(494, 'english', 'List Of Book', 'List Of Book'),
(495, 'english', 'Child', 'Child'),
(496, 'english', 'Teaches', 'Teaches'),
(498, 'english', 'Student List', 'Student List'),
(499, 'english', 'Id card', 'Id card'),
(500, 'english', 'Code', 'Code'),
(501, 'english', 'Not found', 'Not found'),
(502, 'english', 'Contact', 'Contact'),
(503, 'english', 'Search Attendance Report', 'Search Attendance Report'),
(504, 'english', 'Please select in all fields !', 'Please select in all fields !'),
(505, 'english', 'Please select student', 'Please select student'),
(506, 'english', 'Download', 'Download'),
(507, 'english', 'Ekattor', 'Ekattor'),
(508, 'english', 'Add  Single Invoice', 'Add  Single Invoice'),
(509, 'english', 'Add  Mass Invoice', 'Add  Mass Invoice'),
(510, 'english', 'Update invoice', 'Update invoice'),
(511, 'english', 'Invoice', 'Invoice'),
(512, 'english', 'Please find below the invoice', 'Please find below the invoice'),
(513, 'english', 'Billing Address', 'Billing Address'),
(514, 'english', 'Due Amount', 'Due Amount'),
(515, 'english', 'Student Fee', 'Student Fee'),
(516, 'english', 'Subtotal', 'Subtotal'),
(517, 'english', 'Due', 'Due'),
(518, 'english', 'Grand Total', 'Grand Total'),
(519, 'english', 'Update book issue information', 'Update book issue information'),
(520, 'english', 'Not Subscribed', 'Not Subscribed'),
(521, 'english', 'You are not subscribed to any plan. Subscribe now.', 'You are not subscribed to any plan. Subscribe now.'),
(522, 'english', 'Subscribe', 'Subscribe'),
(523, 'english', 'Package List', 'Package List'),
(524, 'english', 'Payment | Ekator 8', 'Payment | Ekator 8'),
(525, 'english', 'Make Payment', 'Make Payment'),
(526, 'english', 'Payment Gateway', 'Payment Gateway'),
(527, 'english', 'Offline', 'Offline'),
(528, 'english', 'Addon', 'Addon'),
(529, 'english', 'Invoice Summary', 'Invoice Summary'),
(530, 'english', 'Document of your payment', 'Document of your payment'),
(531, 'english', 'Submit payment document', 'Submit payment document'),
(532, 'english', 'Instruction', 'Instruction'),
(533, 'english', 'Admin will review your payment document and then approve the Payment.', 'Admin will review your payment document and then approve the Payment.'),
(534, 'english', 'Pending Payment', 'Pending Payment'),
(535, 'english', 'You payment request has been sent to Superadmin ', 'You payment request has been sent to Superadmin '),
(536, 'english', 'Suspended', 'Suspended'),
(537, 'english', 'Enter your email address to reset your password.', 'Enter your email address to reset your password.'),
(538, 'english', 'Reset password', 'Reset password'),
(539, 'english', 'Language Settings', 'Language Settings'),
(540, 'english', 'Language', 'Language'),
(541, 'english', 'Edit phrase', 'Edit phrase'),
(542, 'english', 'Delete language', 'Delete language'),
(543, 'english', 'edit_phrase', 'edit_phrase'),
(544, 'english', 'delete_language', 'delete_language'),
(545, 'english', 'System default language can not be removed', 'System default language can not be removed'),
(546, 'english', 'language_list', 'language_list'),
(547, 'english', 'add_language', 'add_language'),
(548, 'english', 'Language list', 'Language list'),
(549, 'english', 'Add language', 'Add language'),
(550, 'english', 'Add new phrase', 'Add new phrase'),
(551, 'english', 'add_new_language', 'add_new_language'),
(552, 'english', 'No special character or space is allowed', 'No special character or space is allowed'),
(553, 'english', 'valid_examples', 'valid_examples'),
(554, 'english', 'No special character or space is allowed', 'No special character or space is allowed'),
(555, 'english', 'Validexamples', 'Validexamples'),
(556, 'english', 'Add new language', 'Add new language'),
(557, 'english', 'Valid examples', 'Valid examples'),
(560, 'english', 'Phrase updated', 'Phrase updated'),
(561, 'english', 'System Language', 'System Language'),
(562, 'english', 'Edit Grade', 'Edit Grade'),
(563, 'english', 'Number of scopy', 'Number of scopy'),
(564, 'english', 'Save book', 'Save book'),
(565, 'english', 'New Password', 'New Password'),
(566, 'english', 'Confirm Password', 'Confirm Password'),
(567, 'english', 'Current Password', 'Current Password'),
(568, 'english', 'Add Parent', 'Add Parent'),
(569, 'english', 'Parent profile image', 'Parent profile image'),
(570, 'english', 'Allowances', 'Allowances'),
(571, 'english', 'Type', 'Type'),
(572, 'english', 'Select child', 'Select child'),
(573, 'english', 'Show student list', 'Show student list'),
(574, 'english', 'Update attendance', 'Update attendance'),
(575, 'english', 'Present All', 'Present All'),
(576, 'english', 'Absent All', 'Absent All'),
(577, 'english', 'present', 'present'),
(578, 'english', 'absent', 'absent'),
(579, 'english', 'not_updated_yet', 'not_updated_yet'),
(580, 'english', '31', '31'),
(581, 'english', 'Not updated yet', 'Not updated yet'),
(582, 'english', 'Update class', 'Update class'),
(583, 'english', 'Edit syllabus', 'Edit syllabus'),
(584, 'english', 'Select expense category', 'Select expense category'),
(585, 'english', 'Filter Options', 'Filter Options'),
(586, 'english', 'Reset', 'Reset'),
(587, 'english', 'Apply', 'Apply'),
(588, 'english', 'Profile info updated successfully', 'Profile info updated successfully'),
(589, 'english', 'not_found', 'not_found'),
(590, 'english', 'No date found', 'No date found'),
(591, 'english', 'No date found', 'No date found'),
(592, 'english', 'Blood ', 'Blood '),
(593, 'english', 'Blood Type', 'Blood Type'),
(594, 'english', 'Help Link', 'Help Link'),
(595, 'english', 'From', 'From'),
(596, 'english', 'To', 'To'),
(597, 'english', 'Select a parent', 'Select a parent'),
(598, 'english', 'Add', 'Add'),
(599, 'english', 'Document', 'Document'),
(600, 'english', 'Decline', 'Decline'),
(601, 'english', 'Number of child:', 'Number of child:'),
(602, 'english', 'Number of child', 'Number of child'),
(603, 'english', 'Parent Create', 'Parent Create'),
(604, 'english', 'Parent Update', 'Parent Update'),
(2452, 'english', 'Version updated successfully', 'Version updated successfully'),
(2453, 'english', 'Website Settings', 'Website Settings'),
(2454, 'english', 'Manage Faq', 'Manage Faq'),
(2455, 'english', 'Visit Website', 'Visit Website'),
(2456, 'english', 'Feature', 'Feature'),
(2457, 'english', 'Faq', 'Faq'),
(2458, 'english', 'School Register Form', 'School Register Form'),
(2459, 'english', 'Admin Name', 'Admin Name'),
(2460, 'english', 'User Account', 'User Account'),
(2461, 'english', 'Our Features', 'Our Features'),
(2462, 'english', 'Features', 'Features'),
(2463, 'english', 'Students Admission', 'Students Admission'),
(2464, 'english', 'Your schools can add their students in two different ways', 'Your schools can add their students in two different ways'),
(2465, 'english', 'Take your students attendance in a smart way', 'Take your students attendance in a smart way'),
(2466, 'english', 'Manage your schools class list whenever you want', 'Manage your schools class list whenever you want'),
(2467, 'english', 'Add different subjects for different classes', 'Add different subjects for different classes'),
(2468, 'english', 'Event Calender', 'Event Calender'),
(2469, 'english', 'The school admin can manage their schools events separately', 'The school admin can manage their schools events separately'),
(2470, 'english', 'Routine', 'Routine'),
(2471, 'english', 'Manage your schools class routine easily', 'Manage your schools class routine easily'),
(2472, 'english', 'Student Information', 'Student Information'),
(2473, 'english', 'Add your students information within a few minute', 'Add your students information within a few minute'),
(2474, 'english', 'Manage syllabuses based on the classes', 'Manage syllabuses based on the classes'),
(2475, 'english', 'Fees Management', 'Fees Management'),
(2476, 'english', 'Pay academic fees in a smart way with Ekattor 8', 'Pay academic fees in a smart way with Ekattor 8'),
(2477, 'english', 'ID Card Generator', 'ID Card Generator'),
(2478, 'english', 'Generate your students ID card whenever you want', 'Generate your students ID card whenever you want'),
(2479, 'english', 'Online Payment Gateway', 'Online Payment Gateway'),
(2480, 'english', 'Pay your subscription and academic fees', 'Pay your subscription and academic fees'),
(2481, 'english', 'Invoice Generator', 'Invoice Generator'),
(2482, 'english', 'Generate invoices to make the payments more reliable', 'Generate invoices to make the payments more reliable'),
(2483, 'english', 'Offline Payment', 'Offline Payment'),
(2484, 'english', 'Complete payment with local money', 'Complete payment with local money'),
(2485, 'english', 'Book List', 'Book List'),
(2486, 'english', 'Manage your schools library within a few clicks', 'Manage your schools library within a few clicks'),
(2487, 'english', 'Manage your schools notices smartly', 'Manage your schools notices smartly'),
(2488, 'english', 'Create and manage your schools exams and categories', 'Create and manage your schools exams and categories'),
(2489, 'english', 'Marks Management', 'Marks Management'),
(2490, 'english', 'Manage your students exam marks', 'Manage your students exam marks'),
(2491, 'english', 'Add and manage grades in the examination', 'Add and manage grades in the examination'),
(2492, 'english', 'Have Any Question', 'Have Any Question'),
(2493, 'english', 'Contact us with any questions', 'Contact us with any questions'),
(2494, 'english', 'Contact Us', 'Contact Us'),
(2495, 'english', 'Social Link', 'Social Link'),
(2496, 'english', 'Register', 'Register'),
(2497, 'english', 'Excel upload', 'Excel upload'),
(2498, 'english', 'GENERAL SETTINGS', 'GENERAL SETTINGS'),
(2499, 'english', 'Banner Title', 'Banner Title'),
(2500, 'english', 'Banner Subtitle', 'Banner Subtitle'),
(2501, 'english', 'Price Subtitle', 'Price Subtitle'),
(2502, 'english', 'Faq Subtitle', 'Faq Subtitle'),
(2503, 'english', 'Facebook Link', 'Facebook Link'),
(2504, 'english', 'Twitter Link', 'Twitter Link'),
(2505, 'english', 'Linkedin Link', 'Linkedin Link'),
(2506, 'english', 'Instagram Link', 'Instagram Link'),
(2507, 'english', 'Contact Mail', 'Contact Mail'),
(2508, 'english', 'Frontend Footer Text', 'Frontend Footer Text'),
(2509, 'english', 'Copyright Text', 'Copyright Text'),
(2510, 'english', 'Frontend View', 'Frontend View'),
(2511, 'english', 'No', 'No'),
(2512, 'english', 'Youtube Api Key', 'Youtube Api Key'),
(2513, 'english', 'Vimeo Api Key', 'Vimeo Api Key'),
(2514, 'english', 'Has to be bigger than', 'Has to be bigger than'),
(3179, 'Vietnam', 'Dashboard', 'Bảng điều khiển'),
(3180, 'Vietnam', 'Home', 'Trang chủ'),
(3181, 'Vietnam', 'Schools', 'Schools'),
(3182, 'Vietnam', 'Total Schools', 'Total Schools'),
(3183, 'Vietnam', 'Subscription', 'Subscription'),
(3184, 'Vietnam', 'Total Active Subscription', 'Total Active Subscription'),
(3185, 'Vietnam', 'Subscription Payment', 'Subscription Payment'),
(3186, 'Vietnam', 'Superadmin | Ekator 8', 'Superadmin | Ekator 8'),
(3187, 'Vietnam', 'Close', 'Close'),
(3188, 'Vietnam', 'School List', 'School List'),
(3189, 'Vietnam', 'Create school', 'Create school'),
(3190, 'Vietnam', 'Pending List', 'Pending List'),
(3191, 'Vietnam', 'Package', 'Package'),
(3192, 'Vietnam', 'Subscriptions', 'Subscriptions'),
(3193, 'Vietnam', 'Subscription Report', 'Subscription Report'),
(3194, 'Vietnam', 'Pending Request', 'Pending Request'),
(3195, 'Vietnam', 'Confirmed Payment', 'Confirmed Payment'),
(3196, 'Vietnam', 'Addons', 'Addons'),
(3197, 'Vietnam', 'Settings', 'Settings'),
(3198, 'Vietnam', 'System Settings', 'System Settings'),
(3199, 'Vietnam', 'Session Manager', 'Session Manager'),
(3200, 'Vietnam', 'Payment Settings', 'Payment Settings'),
(3201, 'Vietnam', 'Smtp settings', 'Smtp settings'),
(3202, 'Vietnam', 'About', 'About'),
(3203, 'Vietnam', 'Superadmin', 'Superadmin'),
(3204, 'Vietnam', 'My Account', 'My Account'),
(3205, 'Vietnam', 'Change Password', 'Change Password'),
(3206, 'Vietnam', 'Log out', 'Log out'),
(3207, 'Vietnam', 'Loading...', 'Loading...'),
(3208, 'Vietnam', 'Heads up!', 'Heads up!'),
(3209, 'Vietnam', 'Are you sure?', 'Are you sure?'),
(3210, 'Vietnam', 'Back', 'Back'),
(3211, 'Vietnam', 'Continue', 'Continue'),
(3212, 'Vietnam', 'You won\'t able to revert this!', 'You won\'t able to revert this!'),
(3213, 'Vietnam', 'Yes', 'Yes'),
(3214, 'Vietnam', 'Cancel', 'Cancel'),
(3215, 'Vietnam', 'Add School', 'Add School'),
(3216, 'Vietnam', 'Name', 'Name'),
(3217, 'Vietnam', 'Address', 'Address'),
(3218, 'Vietnam', 'Phone', 'Phone'),
(3219, 'Vietnam', 'Info', 'Info'),
(3220, 'Vietnam', 'Status', 'Status'),
(3221, 'Vietnam', 'Action', 'Action'),
(3222, 'Vietnam', 'Active', 'Active'),
(3223, 'Vietnam', 'Actions', 'Actions'),
(3224, 'Vietnam', 'Edit School', 'Edit School'),
(3225, 'Vietnam', 'Edit', 'Edit'),
(3226, 'Vietnam', 'Delete', 'Delete'),
(3227, 'Vietnam', 'School Form', 'School Form'),
(3228, 'Vietnam', 'Provide all the information required for your school.', 'Provide all the information required for your school.'),
(3229, 'Vietnam', 'Also provide a admin information with email and passwoard.', 'Also provide a admin information with email and passwoard.'),
(3230, 'Vietnam', 'So that admin can access the created school.', 'So that admin can access the created school.'),
(3231, 'Vietnam', 'SCHOOL INFO', 'SCHOOL INFO'),
(3232, 'Vietnam', 'School Name', 'School Name'),
(3233, 'Vietnam', 'School Address', 'School Address'),
(3234, 'Vietnam', 'School Email', 'School Email'),
(3235, 'Vietnam', 'School Phone', 'School Phone'),
(3236, 'Vietnam', 'ADMIN INFO', 'ADMIN INFO'),
(3237, 'Vietnam', 'Gender', 'Gender'),
(3238, 'Vietnam', 'Select a gender', 'Select a gender'),
(3239, 'Vietnam', 'Male', 'Male'),
(3240, 'Vietnam', 'Female', 'Female'),
(3241, 'Vietnam', 'Blood group', 'Blood group'),
(3242, 'Vietnam', 'Select a blood group', 'Select a blood group'),
(3243, 'Vietnam', 'A+', 'A+'),
(3244, 'Vietnam', 'A-', 'A-'),
(3245, 'Vietnam', 'B+', 'B+'),
(3246, 'Vietnam', 'B-', 'B-'),
(3247, 'Vietnam', 'AB+', 'AB+'),
(3248, 'Vietnam', 'AB-', 'AB-'),
(3249, 'Vietnam', 'O+', 'O+'),
(3250, 'Vietnam', 'O-', 'O-'),
(3251, 'Vietnam', 'Admin Address', 'Admin Address'),
(3252, 'Vietnam', 'Admin Phone Number', 'Admin Phone Number'),
(3253, 'Vietnam', 'Photo', 'Photo'),
(3254, 'Vietnam', 'Admin Email', 'Admin Email'),
(3255, 'Vietnam', 'Admin Password', 'Admin Password'),
(3256, 'Vietnam', 'Submit', 'Submit'),
(3257, 'Vietnam', 'Pending School List', 'Pending School List'),
(3258, 'Vietnam', 'No data found', 'No data found'),
(3259, 'Vietnam', 'Packages', 'Packages'),
(3260, 'Vietnam', 'Add Package', 'Add Package'),
(3261, 'Vietnam', 'Price', 'Price'),
(3262, 'Vietnam', 'Interval', 'Interval'),
(3263, 'Vietnam', 'Preiod', 'Preiod'),
(3264, 'Vietnam', 'Filter', 'Filter'),
(3265, 'Vietnam', 'Export', 'Export'),
(3266, 'Vietnam', 'PDF', 'PDF'),
(3267, 'Vietnam', 'CSV', 'CSV'),
(3268, 'Vietnam', 'Print', 'Print'),
(3269, 'Vietnam', 'Paid By', 'Paid By'),
(3270, 'Vietnam', 'Purchase Date', 'Purchase Date'),
(3271, 'Vietnam', 'Expire Date', 'Expire Date'),
(3272, 'Vietnam', 'Confirmed Request', 'Confirmed Request'),
(3273, 'Vietnam', 'Payment For', 'Payment For'),
(3274, 'Vietnam', 'Payment Document', 'Payment Document'),
(3275, 'Vietnam', 'Approve', 'Approve'),
(3276, 'Vietnam', 'Manage Addons', 'Manage Addons'),
(3277, 'Vietnam', 'Install addon', 'Install addon'),
(3278, 'Vietnam', 'Add new addon', 'Add new addon'),
(3279, 'Vietnam', 'System Name', 'System Name'),
(3280, 'Vietnam', 'System Title', 'System Title'),
(3281, 'Vietnam', 'System Email', 'System Email'),
(3282, 'Vietnam', 'Fax', 'Fax'),
(3283, 'Vietnam', 'Timezone', 'Timezone'),
(3284, 'Vietnam', 'Footer Text', 'Footer Text'),
(3285, 'Vietnam', 'Footer Link', 'Footer Link'),
(3286, 'Vietnam', 'PRODUCT UPDATE', 'PRODUCT UPDATE'),
(3287, 'Vietnam', 'File', 'File'),
(3288, 'Vietnam', 'Update', 'Update'),
(3289, 'Vietnam', 'SYSTEM LOGO', 'SYSTEM LOGO'),
(3290, 'Vietnam', 'Dark logo', 'Dark logo'),
(3291, 'Vietnam', 'Light logo', 'Light logo'),
(3292, 'Vietnam', 'Favicon', 'Favicon'),
(3293, 'Vietnam', 'Update Logo', 'Update Logo'),
(3294, 'Vietnam', 'Create Session', 'Create Session'),
(3295, 'Vietnam', 'Add Session', 'Add Session'),
(3296, 'Vietnam', 'Active session ', 'Active session '),
(3297, 'Vietnam', 'Select a session', 'Select a session'),
(3298, 'Vietnam', 'Activate', 'Activate'),
(3299, 'Vietnam', 'Session title', 'Session title'),
(3300, 'Vietnam', 'Options', 'Options'),
(3301, 'Vietnam', 'Edit Session', 'Edit Session'),
(3302, 'Vietnam', 'Global Currency', 'Global Currency'),
(3303, 'Vietnam', 'Select system currency', 'Select system currency'),
(3304, 'Vietnam', 'Currency Position', 'Currency Position'),
(3305, 'Vietnam', 'Left', 'Left'),
(3306, 'Vietnam', 'Right', 'Right'),
(3307, 'Vietnam', 'Left with a space', 'Left with a space'),
(3308, 'Vietnam', 'Right with a space', 'Right with a space'),
(3309, 'Vietnam', 'Update Currency', 'Update Currency'),
(3310, 'Vietnam', 'Protocol', 'Protocol'),
(3311, 'Vietnam', 'Smtp crypto', 'Smtp crypto'),
(3312, 'Vietnam', 'Smtp host', 'Smtp host'),
(3313, 'Vietnam', 'Smtp port', 'Smtp port'),
(3314, 'Vietnam', 'Smtp username', 'Smtp username'),
(3315, 'Vietnam', 'Smtp password', 'Smtp password'),
(3316, 'Vietnam', 'Save', 'Save'),
(3317, 'Vietnam', 'Not found', 'Not found'),
(3318, 'Vietnam', 'About this application', 'About this application'),
(3319, 'Vietnam', 'Software version', 'Software version'),
(3320, 'Vietnam', 'Check update', 'Check update'),
(3321, 'Vietnam', 'PHP version', 'PHP version'),
(3322, 'Vietnam', 'Curl enable', 'Curl enable'),
(3323, 'Vietnam', 'Enabled', 'Enabled'),
(3324, 'Vietnam', 'Purchase code', 'Purchase code'),
(3325, 'Vietnam', 'Product license', 'Product license'),
(3326, 'Vietnam', 'invalid', 'invalid'),
(3327, 'Vietnam', 'Enter valid purchase code', 'Enter valid purchase code'),
(3328, 'Vietnam', 'Customer support status', 'Customer support status'),
(3329, 'Vietnam', 'Support expiry date', 'Support expiry date'),
(3330, 'Vietnam', 'Customer name', 'Customer name'),
(3331, 'Vietnam', 'Get customer support', 'Get customer support'),
(3332, 'Vietnam', 'Customer support', 'Customer support'),
(3333, 'Vietnam', 'Email', 'Email'),
(3334, 'Vietnam', 'Password', 'Password'),
(3335, 'Vietnam', 'Forgot password', 'Forgot password'),
(3336, 'Vietnam', 'Help', 'Help'),
(3337, 'Vietnam', 'Login', 'Login'),
(3338, 'Vietnam', 'Total Student', 'Total Student'),
(3339, 'Vietnam', 'Teacher', 'Teacher'),
(3340, 'Vietnam', 'Total Teacher', 'Total Teacher'),
(3341, 'Vietnam', 'Parents', 'Parents'),
(3342, 'Vietnam', 'Total Parent', 'Total Parent'),
(3343, 'Vietnam', 'Staff', 'Staff'),
(3344, 'Vietnam', 'Total Staff', 'Total Staff'),
(3345, 'Vietnam', 'Todays Attendance', 'Todays Attendance'),
(3346, 'Vietnam', 'Go to Attendance', 'Go to Attendance'),
(3347, 'Vietnam', 'Income Report', 'Income Report'),
(3348, 'Vietnam', 'Year', 'Year'),
(3349, 'Vietnam', 'Month', 'Month'),
(3350, 'Vietnam', 'Week', 'Week'),
(3351, 'Vietnam', 'Upcoming Events', 'Upcoming Events'),
(3352, 'Vietnam', 'See all', 'See all'),
(3353, 'Vietnam', 'Admin', 'Admin'),
(3354, 'Vietnam', 'Users', 'Users'),
(3355, 'Vietnam', 'Accountant', 'Accountant'),
(3356, 'Vietnam', 'Librarian', 'Librarian'),
(3357, 'Vietnam', 'Parent', 'Parent'),
(3358, 'Vietnam', 'Student', 'Student'),
(3359, 'Vietnam', 'Teacher Permission', 'Teacher Permission'),
(3360, 'Vietnam', 'Admissions', 'Admissions'),
(3361, 'Vietnam', 'Examination', 'Examination'),
(3362, 'Vietnam', 'Exam Category', 'Exam Category'),
(3363, 'Vietnam', 'Offline Exam', 'Offline Exam'),
(3364, 'Vietnam', 'Marks', 'Marks'),
(3365, 'Vietnam', 'Grades', 'Grades'),
(3366, 'Vietnam', 'Promotion', 'Promotion'),
(3367, 'Vietnam', 'Academic', 'Academic'),
(3368, 'Vietnam', 'Daily Attendance', 'Daily Attendance'),
(3369, 'Vietnam', 'Class List', 'Class List'),
(3370, 'Vietnam', 'Class Routine', 'Class Routine'),
(3371, 'Vietnam', 'Subjects', 'Subjects'),
(3372, 'Vietnam', 'Gradebooks', 'Gradebooks'),
(3373, 'Vietnam', 'Syllabus', 'Syllabus'),
(3374, 'Vietnam', 'Class Room', 'Class Room'),
(3375, 'Vietnam', 'Department', 'Department'),
(3376, 'Vietnam', 'Accounting', 'Accounting'),
(3377, 'Vietnam', 'Student Fee Manager', 'Student Fee Manager'),
(3378, 'Vietnam', 'Offline Payment Request', 'Offline Payment Request'),
(3379, 'Vietnam', 'Expense Manager', 'Expense Manager'),
(3380, 'Vietnam', 'Expense Category', 'Expense Category'),
(3381, 'Vietnam', 'Back Office', 'Back Office'),
(3382, 'Vietnam', 'Book List Manager', 'Book List Manager'),
(3383, 'Vietnam', 'Book Issue Report', 'Book Issue Report'),
(3384, 'Vietnam', 'Noticeboard', 'Noticeboard'),
(3385, 'Vietnam', 'Events', 'Events'),
(3386, 'Vietnam', 'School Settings', 'School Settings'),
(3387, 'Vietnam', 'School information', 'School information'),
(3388, 'Vietnam', 'Update settings', 'Update settings'),
(3389, 'Vietnam', 'Deactive', 'Deactive'),
(3390, 'Vietnam', 'Session has been activated', 'Session has been activated'),
(3391, 'Vietnam', 'Update session', 'Update session'),
(3392, 'Vietnam', 'Admins', 'Admins'),
(3393, 'Vietnam', 'Create Admin', 'Create Admin'),
(3394, 'Vietnam', 'User Info', 'User Info'),
(3395, 'Vietnam', 'Oprions', 'Oprions'),
(3396, 'Vietnam', 'Edit Admin', 'Edit Admin'),
(3397, 'Vietnam', 'Teachers', 'Teachers'),
(3398, 'Vietnam', 'Create Teacher', 'Create Teacher'),
(3399, 'Vietnam', 'Create Accountant', 'Create Accountant'),
(3400, 'Vietnam', 'Edit Accountant', 'Edit Accountant'),
(3401, 'Vietnam', 'Librarians', 'Librarians'),
(3402, 'Vietnam', 'Create Librarian', 'Create Librarian'),
(3403, 'Vietnam', 'Edit Librarian', 'Edit Librarian'),
(3404, 'Vietnam', 'Create Parent', 'Create Parent'),
(3405, 'Vietnam', 'Edit Parent', 'Edit Parent'),
(3406, 'Vietnam', 'Students', 'Students'),
(3407, 'Vietnam', 'Create Student', 'Create Student'),
(3408, 'Vietnam', 'Generate id card', 'Generate id card'),
(3409, 'Vietnam', 'Assigned Permission For Teacher', 'Assigned Permission For Teacher'),
(3410, 'Vietnam', 'Select a class', 'Select a class'),
(3411, 'Vietnam', 'First select a class', 'First select a class'),
(3412, 'Vietnam', 'Please select a class and section', 'Please select a class and section'),
(3413, 'Vietnam', 'Attendance', 'Attendance'),
(3414, 'Vietnam', 'Permission updated successfully.', 'Permission updated successfully.'),
(3415, 'Vietnam', 'Admission', 'Admission'),
(3416, 'Vietnam', 'Bulk student admission', 'Bulk student admission'),
(3417, 'Vietnam', 'Class', 'Class'),
(3418, 'Vietnam', 'Section', 'Section'),
(3419, 'Vietnam', 'Select section', 'Select section'),
(3420, 'Vietnam', 'Birthday', 'Birthday'),
(3421, 'Vietnam', 'Select gender', 'Select gender'),
(3422, 'Vietnam', 'Others', 'Others'),
(3423, 'Vietnam', 'Student profile image', 'Student profile image'),
(3424, 'Vietnam', 'Add Student', 'Add Student'),
(3425, 'Vietnam', 'Create Exam Category', 'Create Exam Category'),
(3426, 'Vietnam', 'Add Exam Category', 'Add Exam Category'),
(3427, 'Vietnam', 'Title', 'Title'),
(3428, 'Vietnam', 'Class test', 'Class test'),
(3429, 'Vietnam', 'Edit Exam Category', 'Edit Exam Category'),
(3430, 'Vietnam', 'Midterm exam', 'Midterm exam'),
(3431, 'Vietnam', 'Final exam', 'Final exam'),
(3432, 'Vietnam', 'Admission exam', 'Admission exam'),
(3433, 'Vietnam', 'Create Exam', 'Create Exam'),
(3434, 'Vietnam', 'Add Exam', 'Add Exam'),
(3435, 'Vietnam', 'Exam', 'Exam'),
(3436, 'Vietnam', 'Starting Time', 'Starting Time'),
(3437, 'Vietnam', 'Ending Time', 'Ending Time'),
(3438, 'Vietnam', 'Total Marks', 'Total Marks'),
(3439, 'Vietnam', 'Edit Exam', 'Edit Exam'),
(3440, 'Vietnam', 'Manage Marks', 'Manage Marks'),
(3441, 'Vietnam', 'Select category', 'Select category'),
(3442, 'Vietnam', 'Select class', 'Select class'),
(3443, 'Vietnam', 'Please select all the fields', 'Please select all the fields'),
(3444, 'Vietnam', 'Examknation', 'Examknation'),
(3445, 'Vietnam', 'Create Grade', 'Create Grade'),
(3446, 'Vietnam', 'Add grade', 'Add grade'),
(3447, 'Vietnam', 'Grade', 'Grade'),
(3448, 'Vietnam', 'Grade Point', 'Grade Point'),
(3449, 'Vietnam', 'Mark From', 'Mark From'),
(3450, 'Vietnam', 'Mark Upto', 'Mark Upto'),
(3451, 'Vietnam', 'Promotions', 'Promotions'),
(3452, 'Vietnam', 'Current session', 'Current session'),
(3453, 'Vietnam', 'Session from', 'Session from'),
(3454, 'Vietnam', 'Next session', 'Next session'),
(3455, 'Vietnam', 'Session to', 'Session to'),
(3456, 'Vietnam', 'Promoting from', 'Promoting from'),
(3457, 'Vietnam', 'Promoting to', 'Promoting to'),
(3458, 'Vietnam', 'Manage promotion', 'Manage promotion'),
(3459, 'Vietnam', 'Take Attendance', 'Take Attendance'),
(3460, 'Vietnam', 'Select a month', 'Select a month'),
(3461, 'Vietnam', 'January', 'January'),
(3462, 'Vietnam', 'February', 'February'),
(3463, 'Vietnam', 'March', 'March'),
(3464, 'Vietnam', 'April', 'April'),
(3465, 'Vietnam', 'May', 'May'),
(3466, 'Vietnam', 'June', 'June'),
(3467, 'Vietnam', 'July', 'July'),
(3468, 'Vietnam', 'August', 'August'),
(3469, 'Vietnam', 'September', 'September'),
(3470, 'Vietnam', 'October', 'October'),
(3471, 'Vietnam', 'November', 'November'),
(3472, 'Vietnam', 'December', 'December'),
(3473, 'Vietnam', 'Select a year', 'Select a year'),
(3474, 'Vietnam', 'Please select in all fields !', 'Please select in all fields !'),
(3475, 'Vietnam', 'Classes', 'Classes'),
(3476, 'Vietnam', 'Create Class', 'Create Class'),
(3477, 'Vietnam', 'Add class', 'Add class'),
(3478, 'Vietnam', 'Edit Section', 'Edit Section'),
(3479, 'Vietnam', 'Edit Class', 'Edit Class'),
(3480, 'Vietnam', 'Routines', 'Routines'),
(3481, 'Vietnam', 'Add class routine', 'Add class routine'),
(3482, 'Vietnam', 'Create Subject', 'Create Subject'),
(3483, 'Vietnam', 'Add subject', 'Add subject'),
(3484, 'Vietnam', 'Edit Subject', 'Edit Subject'),
(3485, 'Vietnam', 'Select a exam category', 'Select a exam category'),
(3486, 'Vietnam', 'Create syllabus', 'Create syllabus'),
(3487, 'Vietnam', 'Add syllabus', 'Add syllabus'),
(3488, 'Vietnam', 'Class Rooms', 'Class Rooms'),
(3489, 'Vietnam', 'Create Class Room', 'Create Class Room'),
(3490, 'Vietnam', 'Add class room', 'Add class room'),
(3491, 'Vietnam', 'Edit Class Room', 'Edit Class Room'),
(3492, 'Vietnam', 'Departments', 'Departments'),
(3493, 'Vietnam', 'Create Department', 'Create Department'),
(3494, 'Vietnam', 'Add department', 'Add department'),
(3495, 'Vietnam', 'Edit Department', 'Edit Department'),
(3496, 'Vietnam', 'Add Single Invoice', 'Add Single Invoice'),
(3497, 'Vietnam', 'Add Mass Invoice', 'Add Mass Invoice'),
(3498, 'Vietnam', 'All class', 'All class'),
(3499, 'Vietnam', 'All status', 'All status'),
(3500, 'Vietnam', 'Paid', 'Paid'),
(3501, 'Vietnam', 'Unpaid', 'Unpaid'),
(3502, 'Vietnam', 'Invoice No', 'Invoice No'),
(3503, 'Vietnam', 'Invoice Title', 'Invoice Title'),
(3504, 'Vietnam', 'Total Amount', 'Total Amount'),
(3505, 'Vietnam', 'Created at', 'Created at'),
(3506, 'Vietnam', 'Paid Amount', 'Paid Amount'),
(3507, 'Vietnam', 'Expense', 'Expense'),
(3508, 'Vietnam', 'Create Expense', 'Create Expense'),
(3509, 'Vietnam', 'Add New Expense', 'Add New Expense'),
(3510, 'Vietnam', 'Create Expense Category', 'Create Expense Category'),
(3511, 'Vietnam', 'Add Expense Category', 'Add Expense Category'),
(3512, 'Vietnam', 'Option', 'Option'),
(3513, 'Vietnam', 'Edit Expense Category', 'Edit Expense Category'),
(3514, 'Vietnam', 'Book', 'Book'),
(3515, 'Vietnam', 'Add book', 'Add book'),
(3516, 'Vietnam', 'Book name', 'Book name'),
(3517, 'Vietnam', 'Author', 'Author'),
(3518, 'Vietnam', 'Copies', 'Copies'),
(3519, 'Vietnam', 'Available copies', 'Available copies'),
(3520, 'Vietnam', 'Edit Book', 'Edit Book'),
(3521, 'Vietnam', 'Book Issue', 'Book Issue');
INSERT INTO `language` (`id`, `name`, `phrase`, `translated`) VALUES
(3522, 'Vietnam', 'Issue Book', 'Issue Book'),
(3523, 'Vietnam', 'Noticeboard calendar', 'Noticeboard calendar'),
(3524, 'Vietnam', 'Add New Notice', 'Add New Notice'),
(3525, 'Vietnam', 'Locales:', 'Locales:'),
(3526, 'Vietnam', 'Current Plan', 'Current Plan'),
(3527, 'Vietnam', 'Silver', 'Silver'),
(3528, 'Vietnam', 'Monthly', 'Monthly'),
(3529, 'Vietnam', 'Subscription Renew Date', 'Subscription Renew Date'),
(3530, 'Vietnam', 'Amount To Be Charged', 'Amount To Be Charged'),
(3531, 'Vietnam', 'Create Event', 'Create Event'),
(3532, 'Vietnam', 'Event title', 'Event title'),
(3533, 'Vietnam', 'Date', 'Date'),
(3534, 'Vietnam', 'Update event', 'Update event'),
(3535, 'Vietnam', 'Upload addons zip file', 'Upload addons zip file'),
(3536, 'Vietnam', 'Verified', 'Verified'),
(3537, 'Vietnam', 'Details info', 'Details info'),
(3538, 'Vietnam', 'Phone Number', 'Phone Number'),
(3539, 'Vietnam', 'Designation', 'Designation'),
(3540, 'Vietnam', 'Save Changes', 'Save Changes'),
(3541, 'Vietnam', 'Select a status', 'Select a status'),
(3542, 'Vietnam', 'Update school', 'Update school'),
(3543, 'Vietnam', 'Package price', 'Package price'),
(3544, 'Vietnam', 'Package Type', 'Package Type'),
(3545, 'Vietnam', 'Select a package type', 'Select a package type'),
(3546, 'Vietnam', 'Trail', 'Trail'),
(3547, 'Vietnam', 'Select a interval', 'Select a interval'),
(3548, 'Vietnam', 'Days', 'Days'),
(3549, 'Vietnam', 'Yearly', 'Yearly'),
(3550, 'Vietnam', 'Interval Preiod', 'Interval Preiod'),
(3551, 'Vietnam', 'Description', 'Description'),
(3552, 'Vietnam', 'Create package', 'Create package'),
(3553, 'Vietnam', 'Update package', 'Update package'),
(3554, 'Vietnam', 'Invalid purchase code', 'Invalid purchase code'),
(3555, 'Vietnam', 'Inactive', 'Inactive'),
(3556, 'Vietnam', 'Save event', 'Save event'),
(3557, 'Vietnam', 'Create', 'Create'),
(3558, 'Vietnam', 'Select a department', 'Select a department'),
(3559, 'Vietnam', 'One', 'One'),
(3560, 'Vietnam', 'Two', 'Two'),
(3561, 'Vietnam', 'Three', 'Three'),
(3562, 'Vietnam', 'Four', 'Four'),
(3563, 'Vietnam', 'Five', 'Five'),
(3564, 'Vietnam', 'Six', 'Six'),
(3565, 'Vietnam', 'Seven', 'Seven'),
(3566, 'Vietnam', 'Eight', 'Eight'),
(3567, 'Vietnam', 'Nine', 'Nine'),
(3568, 'Vietnam', 'Ten', 'Ten'),
(3569, 'Vietnam', 'Add students', 'Add students'),
(3570, 'Vietnam', 'Create category', 'Create category'),
(3571, 'Vietnam', 'Exam Name', 'Exam Name'),
(3572, 'Vietnam', 'Select exam category name', 'Select exam category name'),
(3573, 'Vietnam', 'Subject', 'Subject'),
(3574, 'Vietnam', 'Starting date', 'Starting date'),
(3575, 'Vietnam', 'Ending date', 'Ending date'),
(3576, 'Vietnam', 'Student name', 'Student name'),
(3577, 'Vietnam', 'Mark', 'Mark'),
(3578, 'Vietnam', 'Comment', 'Comment'),
(3579, 'Vietnam', 'Value has been updated successfully', 'Value has been updated successfully'),
(3580, 'Vietnam', 'Required mark field', 'Required mark field'),
(3581, 'Vietnam', 'Image', 'Image'),
(3582, 'Vietnam', 'Enroll to', 'Enroll to'),
(3583, 'Vietnam', 'Select a section', 'Select a section'),
(3584, 'Vietnam', 'Attendance Report Of', 'Attendance Report Of'),
(3585, 'Vietnam', 'Last Update at', 'Last Update at'),
(3586, 'Vietnam', 'Time', 'Time'),
(3587, 'Vietnam', 'Please select the required fields', 'Please select the required fields'),
(3588, 'Vietnam', 'Saturday', 'Saturday'),
(3589, 'Vietnam', 'Sunday', 'Sunday'),
(3590, 'Vietnam', 'Monday', 'Monday'),
(3591, 'Vietnam', 'Tuesday', 'Tuesday'),
(3592, 'Vietnam', 'Wednesday', 'Wednesday'),
(3593, 'Vietnam', 'Update subject', 'Update subject'),
(3594, 'Vietnam', 'Select subject', 'Select subject'),
(3595, 'Vietnam', 'Assign a teacher', 'Assign a teacher'),
(3596, 'Vietnam', 'Select a class room', 'Select a class room'),
(3597, 'Vietnam', 'Day', 'Day'),
(3598, 'Vietnam', 'Select a day', 'Select a day'),
(3599, 'Vietnam', 'Thursday', 'Thursday'),
(3600, 'Vietnam', 'Friday', 'Friday'),
(3601, 'Vietnam', 'Starting hour', 'Starting hour'),
(3602, 'Vietnam', 'Starting minute', 'Starting minute'),
(3603, 'Vietnam', 'Ending hour', 'Ending hour'),
(3604, 'Vietnam', 'Ending minute', 'Ending minute'),
(3605, 'Vietnam', 'Add routine', 'Add routine'),
(3606, 'Vietnam', 'Edit class routine', 'Edit class routine'),
(3607, 'Vietnam', 'Tittle', 'Tittle'),
(3608, 'Vietnam', 'Upload syllabus', 'Upload syllabus'),
(3609, 'Vietnam', 'Select student', 'Select student'),
(3610, 'Vietnam', 'Select a student', 'Select a student'),
(3611, 'Vietnam', 'Payment method', 'Payment method'),
(3612, 'Vietnam', 'Select a payment method', 'Select a payment method'),
(3613, 'Vietnam', 'Cash', 'Cash'),
(3614, 'Vietnam', 'Paypal', 'Paypal'),
(3615, 'Vietnam', 'Paytm', 'Paytm'),
(3616, 'Vietnam', 'Razorpay', 'Razorpay'),
(3617, 'Vietnam', 'Create invoice', 'Create invoice'),
(3618, 'Vietnam', 'Payment date', 'Payment date'),
(3619, 'Vietnam', 'Print invoice', 'Print invoice'),
(3620, 'Vietnam', 'Edit Invoice', 'Edit Invoice'),
(3621, 'Vietnam', 'Amount', 'Amount'),
(3622, 'Vietnam', 'Select an expense category', 'Select an expense category'),
(3623, 'Vietnam', 'Edit Expense', 'Edit Expense'),
(3624, 'Vietnam', 'Issue date', 'Issue date'),
(3625, 'Vietnam', 'Select book', 'Select book'),
(3626, 'Vietnam', 'Id', 'Id'),
(3627, 'Vietnam', 'Pending', 'Pending'),
(3628, 'Vietnam', 'Update issued book', 'Update issued book'),
(3629, 'Vietnam', 'Return this book', 'Return this book'),
(3630, 'Vietnam', 'Notice title', 'Notice title'),
(3631, 'Vietnam', 'Start date', 'Start date'),
(3632, 'Vietnam', 'Setup additional date & time', 'Setup additional date & time'),
(3633, 'Vietnam', 'Start time', 'Start time'),
(3634, 'Vietnam', 'End date', 'End date'),
(3635, 'Vietnam', 'End time', 'End time'),
(3636, 'Vietnam', 'Notice', 'Notice'),
(3637, 'Vietnam', 'Show on website', 'Show on website'),
(3638, 'Vietnam', 'Show', 'Show'),
(3639, 'Vietnam', 'Do not need to show', 'Do not need to show'),
(3640, 'Vietnam', 'Upload notice photo', 'Upload notice photo'),
(3641, 'Vietnam', 'Save notice', 'Save notice'),
(3642, 'Vietnam', 'School Currency', 'School Currency'),
(3643, 'Vietnam', 'Exam List', 'Exam List'),
(3644, 'Vietnam', 'Profile', 'Profile'),
(3645, 'Vietnam', ' Download', ' Download'),
(3646, 'Vietnam', 'Select a subject', 'Select a subject'),
(3647, 'Vietnam', 'Welcome, to', 'Welcome, to'),
(3648, 'Vietnam', 'Fee Manager', 'Fee Manager'),
(3649, 'Vietnam', 'List Of Books', 'List Of Books'),
(3650, 'Vietnam', 'Issued Book', 'Issued Book'),
(3651, 'Vietnam', 'Student Code', 'Student Code'),
(3652, 'Vietnam', 'Candice Kennedy', 'Candice Kennedy'),
(3653, 'Vietnam', 'English', 'English'),
(3654, 'Vietnam', 'Natalie Ashley', 'Natalie Ashley'),
(3655, 'Vietnam', 'Byron Chase', 'Byron Chase'),
(3656, 'Vietnam', 'Rafael Hardy', 'Rafael Hardy'),
(3657, 'Vietnam', 'Mathematics', 'Mathematics'),
(3658, 'Vietnam', 'Aphrodite Shaffer', 'Aphrodite Shaffer'),
(3659, 'Vietnam', 'Bangla', 'Bangla'),
(3660, 'Vietnam', 'Fatima Phillips', 'Fatima Phillips'),
(3661, 'Vietnam', 'Sydney Pearson', 'Sydney Pearson'),
(3662, 'Vietnam', 'Drawing', 'Drawing'),
(3663, 'Vietnam', 'Imani Cooper', 'Imani Cooper'),
(3664, 'Vietnam', 'Ulric Spencer', 'Ulric Spencer'),
(3665, 'Vietnam', 'Yoshio Gentry', 'Yoshio Gentry'),
(3666, 'Vietnam', 'Attendance report', 'Attendance report'),
(3667, 'Vietnam', 'Of', 'Of'),
(3668, 'Vietnam', 'Last updated at', 'Last updated at'),
(3669, 'Vietnam', 'View Marks', 'View Marks'),
(3670, 'Vietnam', 'Subject name', 'Subject name'),
(3671, 'Vietnam', 'Pay', 'Pay'),
(3672, 'Vietnam', 'List Of Book', 'List Of Book'),
(3673, 'Vietnam', 'Child', 'Child'),
(3674, 'Vietnam', 'Teaches', 'Teaches'),
(3675, 'Vietnam', 'Student List', 'Student List'),
(3676, 'Vietnam', 'Id card', 'Id card'),
(3677, 'Vietnam', 'Code', 'Code'),
(3678, 'Vietnam', 'Not found', 'Not found'),
(3679, 'Vietnam', 'Contact', 'Contact'),
(3680, 'Vietnam', 'Search Attendance Report', 'Search Attendance Report'),
(3681, 'Vietnam', 'Please select in all fields !', 'Please select in all fields !'),
(3682, 'Vietnam', 'Please select student', 'Please select student'),
(3683, 'Vietnam', 'Download', 'Download'),
(3684, 'Vietnam', 'Ekattor', 'Ekattor'),
(3685, 'Vietnam', 'Add  Single Invoice', 'Add  Single Invoice'),
(3686, 'Vietnam', 'Add  Mass Invoice', 'Add  Mass Invoice'),
(3687, 'Vietnam', 'Update invoice', 'Update invoice'),
(3688, 'Vietnam', 'Invoice', 'Invoice'),
(3689, 'Vietnam', 'Please find below the invoice', 'Please find below the invoice'),
(3690, 'Vietnam', 'Billing Address', 'Billing Address'),
(3691, 'Vietnam', 'Due Amount', 'Due Amount'),
(3692, 'Vietnam', 'Student Fee', 'Student Fee'),
(3693, 'Vietnam', 'Subtotal', 'Subtotal'),
(3694, 'Vietnam', 'Due', 'Due'),
(3695, 'Vietnam', 'Grand Total', 'Grand Total'),
(3696, 'Vietnam', 'Update book issue information', 'Update book issue information'),
(3697, 'Vietnam', 'Not Subscribed', 'Not Subscribed'),
(3698, 'Vietnam', 'You are not subscribed to any plan. Subscribe now.', 'You are not subscribed to any plan. Subscribe now.'),
(3699, 'Vietnam', 'Subscribe', 'Subscribe'),
(3700, 'Vietnam', 'Package List', 'Package List'),
(3701, 'Vietnam', 'Payment | Ekator 8', 'Payment | Ekator 8'),
(3702, 'Vietnam', 'Make Payment', 'Make Payment'),
(3703, 'Vietnam', 'Payment Gateway', 'Payment Gateway'),
(3704, 'Vietnam', 'Offline', 'Offline'),
(3705, 'Vietnam', 'Addon', 'Addon'),
(3706, 'Vietnam', 'Invoice Summary', 'Invoice Summary'),
(3707, 'Vietnam', 'Document of your payment', 'Document of your payment'),
(3708, 'Vietnam', 'Submit payment document', 'Submit payment document'),
(3709, 'Vietnam', 'Instruction', 'Instruction'),
(3710, 'Vietnam', 'Admin will review your payment document and then approve the Payment.', 'Admin will review your payment document and then approve the Payment.'),
(3711, 'Vietnam', 'Pending Payment', 'Pending Payment'),
(3712, 'Vietnam', 'You payment request has been sent to Superadmin ', 'You payment request has been sent to Superadmin '),
(3713, 'Vietnam', 'Suspended', 'Suspended'),
(3714, 'Vietnam', 'Enter your email address to reset your password.', 'Enter your email address to reset your password.'),
(3715, 'Vietnam', 'Reset password', 'Reset password'),
(3716, 'Vietnam', 'Language Settings', 'Language Settings'),
(3717, 'Vietnam', 'Language', 'Language'),
(3718, 'Vietnam', 'Edit phrase', 'Edit phrase'),
(3719, 'Vietnam', 'Delete language', 'Delete language'),
(3720, 'Vietnam', 'edit_phrase', 'edit_phrase'),
(3721, 'Vietnam', 'delete_language', 'delete_language'),
(3722, 'Vietnam', 'System default language can not be removed', 'System default language can not be removed'),
(3723, 'Vietnam', 'language_list', 'language_list'),
(3724, 'Vietnam', 'add_language', 'add_language'),
(3725, 'Vietnam', 'Language list', 'Language list'),
(3726, 'Vietnam', 'Add language', 'Add language'),
(3727, 'Vietnam', 'Add new phrase', 'Add new phrase'),
(3728, 'Vietnam', 'add_new_language', 'add_new_language'),
(3729, 'Vietnam', 'No special character or space is allowed', 'No special character or space is allowed'),
(3730, 'Vietnam', 'valid_examples', 'valid_examples'),
(3731, 'Vietnam', 'No special character or space is allowed', 'No special character or space is allowed'),
(3732, 'Vietnam', 'Validexamples', 'Validexamples'),
(3733, 'Vietnam', 'Add new language', 'Add new language'),
(3734, 'Vietnam', 'Valid examples', 'Valid examples'),
(3735, 'Vietnam', 'Phrase updated', 'Phrase updated'),
(3736, 'Vietnam', 'System Language', 'System Language'),
(3737, 'Vietnam', 'Edit Grade', 'Edit Grade'),
(3738, 'Vietnam', 'Number of scopy', 'Number of scopy'),
(3739, 'Vietnam', 'Save book', 'Save book'),
(3740, 'Vietnam', 'New Password', 'New Password'),
(3741, 'Vietnam', 'Confirm Password', 'Confirm Password'),
(3742, 'Vietnam', 'Current Password', 'Current Password'),
(3743, 'Vietnam', 'Add Parent', 'Add Parent'),
(3744, 'Vietnam', 'Parent profile image', 'Parent profile image'),
(3745, 'Vietnam', 'Allowances', 'Allowances'),
(3746, 'Vietnam', 'Type', 'Type'),
(3747, 'Vietnam', 'Select child', 'Select child'),
(3748, 'Vietnam', 'Show student list', 'Show student list'),
(3749, 'Vietnam', 'Update attendance', 'Update attendance'),
(3750, 'Vietnam', 'Present All', 'Present All'),
(3751, 'Vietnam', 'Absent All', 'Absent All'),
(3752, 'Vietnam', 'present', 'present'),
(3753, 'Vietnam', 'absent', 'absent'),
(3754, 'Vietnam', 'not_updated_yet', 'not_updated_yet'),
(3755, 'Vietnam', '31', '31'),
(3756, 'Vietnam', 'Not updated yet', 'Not updated yet'),
(3757, 'Vietnam', 'Update class', 'Update class'),
(3758, 'Vietnam', 'Edit syllabus', 'Edit syllabus'),
(3759, 'Vietnam', 'Select expense category', 'Select expense category'),
(3760, 'Vietnam', 'Filter Options', 'Filter Options'),
(3761, 'Vietnam', 'Reset', 'Reset'),
(3762, 'Vietnam', 'Apply', 'Apply'),
(3763, 'Vietnam', 'Profile info updated successfully', 'Profile info updated successfully'),
(3764, 'Vietnam', 'not_found', 'not_found'),
(3765, 'Vietnam', 'No date found', 'No date found'),
(3766, 'Vietnam', 'No date found', 'No date found'),
(3767, 'Vietnam', 'Blood ', 'Blood '),
(3768, 'Vietnam', 'Blood Type', 'Blood Type'),
(3769, 'Vietnam', 'Help Link', 'Help Link'),
(3770, 'Vietnam', 'From', 'From'),
(3771, 'Vietnam', 'To', 'To'),
(3772, 'Vietnam', 'Select a parent', 'Select a parent'),
(3773, 'Vietnam', 'Add', 'Add'),
(3774, 'Vietnam', 'Document', 'Document'),
(3775, 'Vietnam', 'Decline', 'Decline'),
(3776, 'Vietnam', 'Number of child:', 'Number of child:'),
(3777, 'Vietnam', 'Number of child', 'Number of child'),
(3778, 'Vietnam', 'Parent Create', 'Parent Create'),
(3779, 'Vietnam', 'Parent Update', 'Parent Update'),
(3780, 'Vietnam', 'Version updated successfully', 'Version updated successfully'),
(3781, 'Vietnam', 'Website Settings', 'Website Settings'),
(3782, 'Vietnam', 'Manage Faq', 'Manage Faq'),
(3783, 'Vietnam', 'Visit Website', 'Visit Website'),
(3784, 'Vietnam', 'Feature', 'Feature'),
(3785, 'Vietnam', 'Faq', 'Faq'),
(3786, 'Vietnam', 'School Register Form', 'School Register Form'),
(3787, 'Vietnam', 'Admin Name', 'Admin Name'),
(3788, 'Vietnam', 'User Account', 'User Account'),
(3789, 'Vietnam', 'Our Features', 'Our Features'),
(3790, 'Vietnam', 'Features', 'Features'),
(3791, 'Vietnam', 'Students Admission', 'Students Admission'),
(3792, 'Vietnam', 'Your schools can add their students in two different ways', 'Your schools can add their students in two different ways'),
(3793, 'Vietnam', 'Take your students attendance in a smart way', 'Take your students attendance in a smart way'),
(3794, 'Vietnam', 'Manage your schools class list whenever you want', 'Manage your schools class list whenever you want'),
(3795, 'Vietnam', 'Add different subjects for different classes', 'Add different subjects for different classes'),
(3796, 'Vietnam', 'Event Calender', 'Event Calender'),
(3797, 'Vietnam', 'The school admin can manage their schools events separately', 'The school admin can manage their schools events separately'),
(3798, 'Vietnam', 'Routine', 'Routine'),
(3799, 'Vietnam', 'Manage your schools class routine easily', 'Manage your schools class routine easily'),
(3800, 'Vietnam', 'Student Information', 'Student Information'),
(3801, 'Vietnam', 'Add your students information within a few minute', 'Add your students information within a few minute'),
(3802, 'Vietnam', 'Manage syllabuses based on the classes', 'Manage syllabuses based on the classes'),
(3803, 'Vietnam', 'Fees Management', 'Fees Management'),
(3804, 'Vietnam', 'Pay academic fees in a smart way with Ekattor 8', 'Pay academic fees in a smart way with Ekattor 8'),
(3805, 'Vietnam', 'ID Card Generator', 'ID Card Generator'),
(3806, 'Vietnam', 'Generate your students ID card whenever you want', 'Generate your students ID card whenever you want'),
(3807, 'Vietnam', 'Online Payment Gateway', 'Online Payment Gateway'),
(3808, 'Vietnam', 'Pay your subscription and academic fees', 'Pay your subscription and academic fees'),
(3809, 'Vietnam', 'Invoice Generator', 'Invoice Generator'),
(3810, 'Vietnam', 'Generate invoices to make the payments more reliable', 'Generate invoices to make the payments more reliable'),
(3811, 'Vietnam', 'Offline Payment', 'Offline Payment'),
(3812, 'Vietnam', 'Complete payment with local money', 'Complete payment with local money'),
(3813, 'Vietnam', 'Book List', 'Book List'),
(3814, 'Vietnam', 'Manage your schools library within a few clicks', 'Manage your schools library within a few clicks'),
(3815, 'Vietnam', 'Manage your schools notices smartly', 'Manage your schools notices smartly'),
(3816, 'Vietnam', 'Create and manage your schools exams and categories', 'Create and manage your schools exams and categories'),
(3817, 'Vietnam', 'Marks Management', 'Marks Management'),
(3818, 'Vietnam', 'Manage your students exam marks', 'Manage your students exam marks'),
(3819, 'Vietnam', 'Add and manage grades in the examination', 'Add and manage grades in the examination'),
(3820, 'Vietnam', 'Have Any Question', 'Have Any Question'),
(3821, 'Vietnam', 'Contact us with any questions', 'Contact us with any questions'),
(3822, 'Vietnam', 'Contact Us', 'Contact Us'),
(3823, 'Vietnam', 'Social Link', 'Social Link'),
(3824, 'Vietnam', 'Register', 'Register'),
(3825, 'Vietnam', 'Excel upload', 'Excel upload'),
(3826, 'Vietnam', 'GENERAL SETTINGS', 'GENERAL SETTINGS'),
(3827, 'Vietnam', 'Banner Title', 'Banner Title'),
(3828, 'Vietnam', 'Banner Subtitle', 'Banner Subtitle'),
(3829, 'Vietnam', 'Price Subtitle', 'Price Subtitle'),
(3830, 'Vietnam', 'Faq Subtitle', 'Faq Subtitle'),
(3831, 'Vietnam', 'Facebook Link', 'Facebook Link'),
(3832, 'Vietnam', 'Twitter Link', 'Twitter Link'),
(3833, 'Vietnam', 'Linkedin Link', 'Linkedin Link'),
(3834, 'Vietnam', 'Instagram Link', 'Instagram Link'),
(3835, 'Vietnam', 'Contact Mail', 'Contact Mail'),
(3836, 'Vietnam', 'Frontend Footer Text', 'Frontend Footer Text'),
(3837, 'Vietnam', 'Copyright Text', 'Copyright Text'),
(3838, 'Vietnam', 'Frontend View', 'Frontend View'),
(3839, 'Vietnam', 'No', 'No'),
(3840, 'Vietnam', 'Youtube Api Key', 'Youtube Api Key'),
(3841, 'Vietnam', 'Vimeo Api Key', 'Vimeo Api Key'),
(3842, 'Vietnam', 'Has to be bigger than', 'Has to be bigger than'),
(3843, 'english', 'Showing', 'Showing'),
(3844, 'Vietnam', 'Showing', 'Showing'),
(3845, 'english', 'data', 'data'),
(3846, 'Vietnam', 'data', 'data'),
(3847, 'english', 'Archive ', 'Archive '),
(3848, 'Vietnam', 'Archive ', 'Archive '),
(3849, 'english', 'Class & Section', 'Class & Section'),
(3850, 'Vietnam', 'Class & Section', 'Class & Section'),
(3851, 'english', 'Expense category name', 'Expense category name'),
(3852, 'Vietnam', 'Expense category name', 'Expense category name'),
(3853, 'english', 'Save category', 'Save category'),
(3854, 'Vietnam', 'Save category', 'Save category'),
(3855, 'english', '', ''),
(3856, 'Vietnam', '', ''),
(3857, 'english', 'Payment', 'Payment'),
(3858, 'Vietnam', 'Payment', 'Payment'),
(3859, 'english', 'Thời gian bắt đầu', 'Thời gian bắt đầu'),
(3860, 'Vietnam', 'Thời gian bắt đầu', 'Thời gian bắt đầu'),
(3861, 'english', 'Thời gian kết thúc', 'Thời gian kết thúc'),
(3862, 'Vietnam', 'Thời gian kết thúc', 'Thời gian kết thúc'),
(3863, 'english', 'Thời lượng', 'Thời lượng'),
(3864, 'Vietnam', 'Thời lượng', 'Thời lượng'),
(3865, 'english', 'Giảng viên', 'Giảng viên'),
(3866, 'Vietnam', 'Giảng viên', 'Giảng viên'),
(3867, 'english', 'Lựa chọn giảng viên', 'Lựa chọn giảng viên'),
(3868, 'Vietnam', 'Lựa chọn giảng viên', 'Lựa chọn giảng viên'),
(3869, 'english', 'Nhập số giờ', 'Nhập số giờ'),
(3870, 'Vietnam', 'Nhập số giờ', 'Nhập số giờ'),
(3871, 'english', 'Thời lượng (số giờ học)', 'Thời lượng (số giờ học)'),
(3872, 'Vietnam', 'Thời lượng (số giờ học)', 'Thời lượng (số giờ học)'),
(3873, 'english', 'Địa điểm', 'Địa điểm'),
(3874, 'Vietnam', 'Địa điểm', 'Địa điểm'),
(3875, 'english', 'Đối tượng', 'Đối tượng'),
(3876, 'Vietnam', 'Đối tượng', 'Đối tượng'),
(3877, 'english', 'Lựa chọn đối tượng đào tạo', 'Lựa chọn đối tượng đào tạo'),
(3878, 'Vietnam', 'Lựa chọn đối tượng đào tạo', 'Lựa chọn đối tượng đào tạo'),
(3879, 'english', 'Điểm danh', 'Điểm danh'),
(3880, 'Vietnam', 'Điểm danh', 'Điểm danh'),
(3881, 'english', 'Lớp học', 'Lớp học'),
(3882, 'Vietnam', 'Lớp học', 'Lớp học'),
(3883, 'english', 'Lịch học', 'Lịch học'),
(3884, 'Vietnam', 'Lịch học', 'Lịch học'),
(3885, 'english', 'Khóa học', 'Khóa học'),
(3886, 'Vietnam', 'Khóa học', 'Khóa học'),
(3887, 'english', 'Điểm số', 'Điểm số'),
(3888, 'Vietnam', 'Điểm số', 'Điểm số'),
(3889, 'english', 'Tài liệu', 'Tài liệu'),
(3890, 'Vietnam', 'Tài liệu', 'Tài liệu'),
(3891, 'english', 'Địa điểm học', 'Địa điểm học'),
(3892, 'Vietnam', 'Địa điểm học', 'Địa điểm học'),
(3893, 'english', 'Thêm học viên', 'Thêm học viên'),
(3894, 'Vietnam', 'Thêm học viên', 'Thêm học viên'),
(3895, 'english', 'Quản lý kết quả', 'Quản lý kết quả'),
(3896, 'Vietnam', 'Quản lý kết quả', 'Quản lý kết quả'),
(3897, 'english', 'Quản lý đào tạo', 'Quản lý đào tạo'),
(3898, 'Vietnam', 'Quản lý đào tạo', 'Quản lý đào tạo'),
(3899, 'english', 'Stripe', 'Stripe'),
(3900, 'Vietnam', 'Stripe', 'Stripe'),
(3901, 'english', 'Flutterwave', 'Flutterwave'),
(3902, 'Vietnam', 'Flutterwave', 'Flutterwave'),
(3903, 'english', 'Paystack', 'Paystack'),
(3904, 'Vietnam', 'Paystack', 'Paystack'),
(3905, 'english', 'Mã lớp', 'Mã lớp'),
(3906, 'Vietnam', 'Mã lớp', 'Mã lớp'),
(3907, 'english', 'Tên lớp', 'Tên lớp'),
(3908, 'Vietnam', 'Tên lớp', 'Tên lớp'),
(3909, 'english', 'Hành động', 'Hành động'),
(3910, 'Vietnam', 'Hành động', 'Hành động'),
(3911, 'english', 'Administrator', 'Administrator'),
(3912, 'Vietnam', 'Administrator', 'Administrator'),
(3913, 'english', 'Chọn khóa học', 'Chọn khóa học'),
(3914, 'Vietnam', 'Chọn khóa học', 'Chọn khóa học'),
(3915, 'english', 'Tên lớp học', 'Tên lớp học'),
(3916, 'Vietnam', 'Tên lớp học', 'Tên lớp học'),
(3917, 'english', 'Tạo lớp', 'Tạo lớp'),
(3918, 'Vietnam', 'Tạo lớp', 'Tạo lớp'),
(3919, 'english', 'Ngày', 'Ngày'),
(3920, 'Vietnam', 'Ngày', 'Ngày'),
(3921, 'english', 'Số tiền', 'Số tiền'),
(3922, 'Vietnam', 'Số tiền', 'Số tiền'),
(3923, 'english', 'Loại chi phí', 'Loại chi phí'),
(3924, 'Vietnam', 'Loại chi phí', 'Loại chi phí'),
(3925, 'english', 'Tạo chi phí', 'Tạo chi phí'),
(3926, 'Vietnam', 'Tạo chi phí', 'Tạo chi phí'),
(3927, 'english', 'Lựa chọn lớp học', 'Lựa chọn lớp học'),
(3928, 'Vietnam', 'Lựa chọn lớp học', 'Lựa chọn lớp học'),
(3929, 'english', 'Chọn loại chi phí', 'Chọn loại chi phí'),
(3930, 'Vietnam', 'Chọn loại chi phí', 'Chọn loại chi phí'),
(3931, 'english', 'Chi phí đào tạo', 'Chi phí đào tạo'),
(3932, 'Vietnam', 'Chi phí đào tạo', 'Chi phí đào tạo'),
(3933, 'english', 'Hạng mục chi phí', 'Hạng mục chi phí'),
(3934, 'Vietnam', 'Hạng mục chi phí', 'Hạng mục chi phí'),
(3935, 'english', 'Dữ liệu chi phí học viên', 'Dữ liệu chi phí học viên'),
(3936, 'Vietnam', 'Dữ liệu chi phí học viên', 'Dữ liệu chi phí học viên'),
(3937, 'english', 'Chi phí', 'Chi phí'),
(3938, 'Vietnam', 'Chi phí', 'Chi phí'),
(3939, 'english', 'Yêu cầu thanh toán', 'Yêu cầu thanh toán'),
(3940, 'Vietnam', 'Yêu cầu thanh toán', 'Yêu cầu thanh toán'),
(3941, 'english', 'Công cụ', 'Công cụ'),
(3942, 'Vietnam', 'Công cụ', 'Công cụ'),
(3943, 'english', 'Bảng thông báo', 'Bảng thông báo'),
(3944, 'Vietnam', 'Bảng thông báo', 'Bảng thông báo'),
(3945, 'english', 'Quản trị viên', 'Quản trị viên'),
(3946, 'Vietnam', 'Quản trị viên', 'Quản trị viên'),
(3947, 'english', 'Học viên', 'Học viên'),
(3948, 'Vietnam', 'Học viên', 'Học viên'),
(3949, 'english', 'Quyền giảng viên', 'Quyền giảng viên'),
(3950, 'Vietnam', 'Quyền giảng viên', 'Quyền giảng viên'),
(3951, 'english', 'Tiện ích', 'Tiện ích'),
(3952, 'Vietnam', 'Tiện ích', 'Tiện ích'),
(3953, 'english', 'Cài đặt', 'Cài đặt'),
(3954, 'Vietnam', 'Cài đặt', 'Cài đặt'),
(3955, 'english', 'Cài đặt hệ thống', 'Cài đặt hệ thống'),
(3956, 'Vietnam', 'Cài đặt hệ thống', 'Cài đặt hệ thống'),
(3957, 'english', 'Quản lý năm học tập', 'Quản lý năm học tập'),
(3958, 'Vietnam', 'Quản lý năm học tập', 'Quản lý năm học tập'),
(3959, 'english', 'Cài đặt thanh toán', 'Cài đặt thanh toán'),
(3960, 'Vietnam', 'Cài đặt thanh toán', 'Cài đặt thanh toán'),
(3961, 'english', 'Mã nhân viên', 'Mã nhân viên'),
(3962, 'Vietnam', 'Mã nhân viên', 'Mã nhân viên'),
(3963, 'english', 'Tên đầy đủ', 'Tên đầy đủ'),
(3964, 'Vietnam', 'Tên đầy đủ', 'Tên đầy đủ'),
(3965, 'english', 'Đơn vị', 'Đơn vị'),
(3966, 'Vietnam', 'Đơn vị', 'Đơn vị'),
(3967, 'english', 'Lựa chọn đơn vị', 'Lựa chọn đơn vị'),
(3968, 'Vietnam', 'Lựa chọn đơn vị', 'Lựa chọn đơn vị'),
(3969, 'english', 'Chức danh', 'Chức danh'),
(3970, 'Vietnam', 'Chức danh', 'Chức danh'),
(3971, 'english', 'Thiết lập đơn vị', 'Thiết lập đơn vị'),
(3972, 'Vietnam', 'Thiết lập đơn vị', 'Thiết lập đơn vị'),
(3973, 'english', 'Thiết lập phòng ban', 'Thiết lập phòng ban'),
(3974, 'Vietnam', 'Thiết lập phòng ban', 'Thiết lập phòng ban'),
(3975, 'english', 'Tài khoản của tôi', 'Tài khoản của tôi'),
(3976, 'Vietnam', 'Tài khoản của tôi', 'Tài khoản của tôi'),
(3977, 'english', 'Thay đổi mật khẩu', 'Thay đổi mật khẩu'),
(3978, 'Vietnam', 'Thay đổi mật khẩu', 'Thay đổi mật khẩu'),
(3979, 'english', 'Trang chủ', 'Trang chủ'),
(3980, 'Vietnam', 'Trang chủ', 'Trang chủ'),
(3981, 'english', 'Tạo đơn vị', 'Tạo đơn vị'),
(3982, 'Vietnam', 'Tạo đơn vị', 'Tạo đơn vị'),
(3983, 'english', 'Tác vụ', 'Tác vụ'),
(3984, 'Vietnam', 'Tác vụ', 'Tác vụ'),
(3985, 'english', 'Chỉnh sửa', 'Chỉnh sửa'),
(3986, 'Vietnam', 'Chỉnh sửa', 'Chỉnh sửa'),
(3987, 'english', 'Xóa', 'Xóa'),
(3988, 'Vietnam', 'Xóa', 'Xóa'),
(3989, 'english', 'Tên đơn vị', 'Tên đơn vị'),
(3990, 'Vietnam', 'Tên đơn vị', 'Tên đơn vị'),
(3991, 'english', 'Tạo mới', 'Tạo mới'),
(3992, 'Vietnam', 'Tạo mới', 'Tạo mới'),
(3993, 'english', 'Cập nhật', 'Cập nhật'),
(3994, 'Vietnam', 'Cập nhật', 'Cập nhật'),
(3995, 'english', 'Phòng ban', 'Phòng ban'),
(3996, 'Vietnam', 'Phòng ban', 'Phòng ban'),
(3997, 'english', 'Lựa chọn phòng ban', 'Lựa chọn phòng ban'),
(3998, 'Vietnam', 'Lựa chọn phòng ban', 'Lựa chọn phòng ban');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `noticeboard`
--

CREATE TABLE `noticeboard` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notice_title` longtext NOT NULL,
  `notice` longtext NOT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `show_on_website` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `noticeboard`
--

INSERT INTO `noticeboard` (`id`, `notice_title`, `notice`, `start_date`, `start_time`, `end_date`, `end_time`, `status`, `show_on_website`, `image`, `school_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 'Thi giữa kỳ', 'Thi giữa kỳ', '05/13/2023', '18:22', '05/13/2023', '18:22', 1, 1, NULL, 1, 2, '2023-05-13 11:23:06', '2023-05-13 11:23:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` varchar(255) NOT NULL,
  `package_type` varchar(255) NOT NULL,
  `interval` varchar(255) NOT NULL,
  `days` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `packages`
--

INSERT INTO `packages` (`id`, `name`, `price`, `package_type`, `interval`, `days`, `status`, `description`, `created_at`, `updated_at`) VALUES
(1, 'ACB', '100', 'paid', 'Monthly', 100, 1, 'ac', '2023-05-13 11:10:07', '2023-05-17 00:36:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `expense_type` longtext NOT NULL,
  `expense_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL,
  `transaction_keys` longtext NOT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `school_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `configuration` longtext NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `status`, `configuration`, `created_at`, `updated_at`) VALUES
(1, 'Offline', 1, '[]', 1571608810, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_history`
--

CREATE TABLE `payment_history` (
  `id` int(11) NOT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `transaction_keys` longtext DEFAULT NULL,
  `document_image` varchar(255) DEFAULT NULL,
  `paid_by` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `payment_history`
--

INSERT INTO `payment_history` (`id`, `payment_type`, `user_id`, `course_id`, `package_id`, `amount`, `school_id`, `transaction_keys`, `document_image`, `paid_by`, `status`, `timestamp`, `created_at`, `updated_at`) VALUES
(1, 'subscription', 2, NULL, 1, 100, 1, '[]', '1_001_C23TST_0_28922 (4).pdf', 'offline', 'approve', 1684287443, '2023-05-17 00:37:23', '2023-05-17 00:37:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `payment_keys` longtext NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0=inactive , 1=active',
  `mode` varchar(255) NOT NULL DEFAULT 'test' COMMENT 'test / live',
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `payment_keys`, `image`, `status`, `mode`, `created_at`, `updated_at`, `school_id`) VALUES
(1, 'offline', '{}', 'offline.png', 1, 'offline', '', '', NULL),
(11, 'paypal', '{\"test_client_id\":\"snd_cl_id_xxxxxxxxxxxxx\",\"test_secret_key\":\"snd_cl_sid_xxxxxxxxxxxx\",\"live_client_id\":\"lv_cl_id_xxxxxxxxxxxxxxx\",\"live_secret_key\":\"lv_cl_sid_xxxxxxxxxxxxxx\"}', 'paypal.png', 1, 'test', NULL, NULL, 1),
(12, 'stripe', '{\"test_key\":\"pk_test_xxxxxxxxxxxxx\",\"test_secret_key\":\"sk_test_xxxxxxxxxxxxxx\",\"public_live_key\":\"pk_live_xxxxxxxxxxxxxx\",\"secret_live_key\":\"sk_live_xxxxxxxxxxxxxx\"}', 'stripe.png', 1, 'test', NULL, NULL, 1),
(13, 'razorpay', '{\"test_key\":\"rzp_test_xxxxxxxxxxxxx\",\"test_secret_key\":\"rzs_test_xxxxxxxxxxxxx\",\"live_key\":\"rzp_live_xxxxxxxxxxxxx\",\"live_secret_key\":\"rzs_live_xxxxxxxxxxxxx\",\"theme_color\":\"#c7a600\"}', 'razorpay.png', 1, 'test', NULL, NULL, 1),
(14, 'paytm', '{\"test_merchant_id\":\"tm_id_xxxxxxxxxxxx\",\"test_merchant_key\":\"tm_key_xxxxxxxxxx\",\"live_merchant_id\":\"lv_mid_xxxxxxxxxxx\",\"live_merchant_key\":\"lv_key_xxxxxxxxxxx\",\"environment\":\"provide-a-environment\",\"merchant_website\":\"merchant-website\",\"channel\":\"provide-channel-type\",\"industry_type\":\"provide-industry-type\"}', 'paytm.png', 1, 'test', NULL, NULL, 1),
(15, 'flutterwave', '{\"test_key\":\"flwp_test_xxxxxxxxxxxxx\",\"test_secret_key\":\"flws_test_xxxxxxxxxxxxx\",\"test_encryption_key\":\"flwe_test_xxxxxxxxxxxxx\",\"public_live_key\":\"flwp_live_xxxxxxxxxxxxxx\",\"secret_live_key\":\"flws_live_xxxxxxxxxxxxxx\",\"encryption_live_key\":\"flwe_live_xxxxxxxxxxxxxx\"}', 'flutterwave.png', 1, 'test', NULL, NULL, 1),
(16, 'paystack', '{\"test_key\":\"pk_test_xxxxxxxxxx\",\"test_secret_key\":\"sk_test_xxxxxxxxxxxxxx\",\"public_live_key\":\"pk_live_xxxxxxxxxxxxxx\",\"secret_live_key\":\"sk_live_xxxxxxxxxxxxxx\"}', 'paystack.png', 1, 'test', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`role_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', '2022-05-17 07:14:27', '2022-05-17 07:14:27'),
(2, 'admin', '2022-05-17 07:14:27', '2022-05-17 07:14:27'),
(3, 'teacher', '2022-05-17 07:15:14', '2022-05-17 07:14:27'),
(4, 'accountant', '2022-05-17 07:15:14', '2022-05-17 07:14:27'),
(5, 'librarian', '2022-05-17 07:15:14', '2022-05-17 07:14:27'),
(6, 'parent', '2022-05-17 07:15:14', '2022-05-17 07:14:27'),
(7, 'student', '2022-05-17 07:15:14', '2022-05-17 07:14:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `routines`
--

CREATE TABLE `routines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `starting_hour` int(11) NOT NULL,
  `ending_hour` int(11) NOT NULL,
  `starting_minute` int(11) NOT NULL,
  `ending_minute` int(11) NOT NULL,
  `day` varchar(255) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `routines`
--

INSERT INTO `routines` (`id`, `class_id`, `section_id`, `subject_id`, `starting_hour`, `ending_hour`, `starting_minute`, `ending_minute`, `day`, `teacher_id`, `room_id`, `school_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 4, 4, 2, 0, 2, 10, 15, 'saturday', 3, 1, 1, 2, '2023-05-20 11:29:58', '2023-05-20 11:29:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `schools`
--

CREATE TABLE `schools` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `school_info` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `running_session` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `school_currency` varchar(255) DEFAULT NULL,
  `currency_position` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `schools`
--

INSERT INTO `schools` (`id`, `title`, `email`, `phone`, `address`, `school_info`, `status`, `running_session`, `created_at`, `updated_at`, `school_currency`, `currency_position`) VALUES
(1, 'Flamingo Group', 'info@flamingogroup.com.vn', '0912947499', 'Hà Nội', 'ACB', 1, 2, '2023-05-13 11:05:46', '2023-05-21 08:50:05', 'VND', 'right-space');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `class_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sections`
--

INSERT INTO `sections` (`id`, `name`, `class_id`, `created_at`, `updated_at`) VALUES
(1, 'T5/2023', 1, '2023-05-13 11:23:47', '2023-05-13 11:24:04'),
(2, 'A', 2, '2023-05-17 00:38:55', '2023-05-17 00:38:55'),
(3, 'A', 3, '2023-05-17 01:25:21', '2023-05-17 01:25:21'),
(4, 'A', 4, '2023-05-20 07:46:13', '2023-05-20 07:46:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_title` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`id`, `session_title`, `status`, `school_id`, `created_at`, `updated_at`) VALUES
(1, '2023', 1, NULL, '2023-05-13 11:02:31', '2023-05-13 11:02:31'),
(2, '2023', 1, 1, '2023-05-13 11:05:46', '2023-05-13 11:05:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student_fee_managers`
--

CREATE TABLE `student_fee_managers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `paid_amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `document_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `student_fee_managers`
--

INSERT INTO `student_fee_managers` (`id`, `title`, `total_amount`, `class_id`, `student_id`, `parent_id`, `payment_method`, `paid_amount`, `status`, `school_id`, `session_id`, `timestamp`, `created_at`, `updated_at`, `document_image`) VALUES
(1, 'Chi phí bồi hoàn', 200000, 4, 4, NULL, 'cash', 200000, 'unpaid', 1, 2, 1684519200, '2023-05-20 08:29:24', '2023-05-20 08:29:24', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `class_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `class_id`, `school_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 'Hôi nhập văn hóa doanh nghiệp', 1, 1, 2, '2023-05-13 11:24:47', '2023-05-13 11:24:47'),
(2, 'Lãnh đạo', 4, 1, 2, '2023-05-20 11:28:14', '2023-05-20 11:28:14'),
(3, 'Hello', 4, 1, 2, '2023-05-20 11:28:25', '2023-05-20 11:28:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `paid_amount` double(8,2) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `transaction_keys` longtext NOT NULL,
  `expire_date` int(11) NOT NULL,
  `date_added` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `package_id`, `school_id`, `paid_amount`, `payment_method`, `transaction_keys`, `expire_date`, `date_added`, `active`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0.00, 'free', '{\"user_id\":\"2\",\"package_id\":\"1\",\"document_file\":\"sample-payment.pdf\"}', 1684239016, 1683979816, 0, 1, '2023-05-13 11:10:16', '2023-05-17 00:37:41'),
(2, 1, 1, 100.00, 'Offline', '{\"document_file\":\"1_001_C23TST_0_28922 (4).pdf\"}', 1943487461, 1684260000, 1, 1, '2023-05-17 00:37:41', '2023-05-17 00:37:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `syllabuses`
--

CREATE TABLE `syllabuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `syllabuses`
--

INSERT INTO `syllabuses` (`id`, `title`, `class_id`, `section_id`, `subject_id`, `file`, `school_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 'Tài liệu học tập', 4, 4, 2, 'class_list_23-05-21.pdf', 1, 2, '2023-05-21 08:32:15', '2023-05-21 08:32:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `teacher_permissions`
--

CREATE TABLE `teacher_permissions` (
  `id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  `attendance` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `teacher_permissions`
--

INSERT INTO `teacher_permissions` (`id`, `class_id`, `section_id`, `school_id`, `teacher_id`, `marks`, `attendance`, `updated_at`) VALUES
(1, 4, 4, 1, 3, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `user_information` longtext DEFAULT NULL,
  `workunit_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `role_id`, `parent_id`, `school_id`, `password`, `code`, `user_information`, `workunit_id`, `department_id`, `designation`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ngoc Huynh', 'info@Ionsite.vn', NULL, 1, NULL, NULL, '$2y$10$vFUMraNuhQ17UStJZaL8peyIl7wz4M67DscwiKHqRf/sXT.fblCVS', NULL, '{\"gender\":\"Male\",\"blood_group\":\"a+\",\"birthday\":1683979351,\"phone\":\"84912947499\",\"address\":\"199 D\\u0169ng S\\u0129 Thanh Kh\\u00ea\",\"photo\":\"user.png\"}', 0, NULL, NULL, NULL, '2023-05-13 11:02:31', '2023-05-13 11:02:31'),
(2, 'Ngoc', 'ngochuynh@ionsite.vn', NULL, 2, NULL, 1, '$2y$10$EZmXDg2gWi4uLnF2akeUzee1RRgsv97HYpr7z69Vm8Il3z6aYdI8e', NULL, '{\"gender\":\"Male\",\"blood_group\":\"a-\",\"birthday\":\"\",\"phone\":\"0912947499\",\"address\":\"199 D\\u0169ng S\\u0129 Thanh Kh\\u00ea\",\"photo\":\"\"}', 0, NULL, NULL, NULL, '2023-05-13 11:05:46', '2023-05-13 11:05:46'),
(3, 'Nguyễn Hoàng', 'nguyenhoang@ionsite.vn', NULL, 3, NULL, 1, '$2y$10$a3Iw5hthKBa7CjJuXD79g.DseKiR9aWWOATTKQ2kvJsNP55szrZS2', NULL, '{\"gender\":\"Male\",\"blood_group\":null,\"birthday\":1683914400,\"phone\":\"0912948499\",\"address\":\"123\",\"photo\":\"\"}', 0, 1, '123', NULL, '2023-05-13 11:28:24', '2023-05-13 11:28:24'),
(4, 'Ngoc Huynh', 'ngochuynh1608@gmail.com', NULL, 7, 5, 1, '$2y$10$EoFx9jaoTcEMk/1fff86vuwQtu2fKiDrJnZa/cn.wKprPmj0g1cmS', '2023-8913-2470', '{\"gender\":\"Male\",\"blood_group\":\"a-\",\"birthday\":713901600,\"phone\":\"0912947499\",\"address\":\"199 D\\u0169ng S\\u0129 Thanh Kh\\u00ea\",\"photo\":\"\"}', 0, NULL, NULL, NULL, '2023-05-20 08:28:37', '2023-05-21 12:16:13'),
(5, 'Ngoc Huynh', 'ngochuynh.ionsite@gmail.com', NULL, 6, NULL, 1, '$2y$10$FVKq5q4Rvo4SO1Ap0k8luu1krrYYAzu2Hj5tiFHVR2kHbxO5T0Q5S', NULL, '{\"gender\":\"Male\",\"blood_group\":\"a-\",\"birthday\":1684605600,\"phone\":\"\\u0110\\u00e0 N\\u1eb5ng\",\"address\":\"199 D\\u0169ng S\\u0129 Thanh Kh\\u00ea\",\"photo\":\"\"}', 0, NULL, NULL, NULL, '2023-05-21 12:16:13', '2023-05-21 12:16:13'),
(6, 'Huỳnh Phúc Ngoc', 'ngochuynh1608@ionsite.vn', NULL, 7, NULL, 1, '$2y$10$bWWWjaF5DwYIVNSTFxN86uD5OD.3GRWvDj5c6pipjBT1HbqTsjtRi', 'NV09120', '{\"phone\":\"0912947499\",\"address\":\"199 D\\u0169ng S\\u0129 Thanh Kh\\u00ea\",\"photo\":\"\"}', 0, 1, NULL, NULL, '2023-05-22 07:18:47', '2023-05-22 07:18:47'),
(7, 'Sher', 'sher@gmailcom', NULL, 7, NULL, 1, '$2y$10$O/FUJwdLf5V/LRhBMtRju.gu.ofttaKoC0sXXOt0fyIhWgkIhHlzW', 'NV0012', '{\"phone\":\"90225987500\",\"address\":\"Gi\\u00e1m \\u0111\\u1ed1c\",\"photo\":\"\"}', 0, 2, NULL, NULL, '2023-05-22 08:05:29', '2023-05-22 08:05:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `work_unit`
--

CREATE TABLE `work_unit` (
  `id` bigint(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `work_unit`
--

INSERT INTO `work_unit` (`id`, `name`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 'Flamingo đải lải', 1, '2023-05-22 13:55:51', '0000-00-00 00:00:00'),
(2, 'Flamingo cát bà', 1, '2023-05-22 13:55:51', '0000-00-00 00:00:00'),
(4, 'HO', 1, '2023-05-22 13:39:59', '2023-05-22 13:39:59');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `book_issues`
--
ALTER TABLE `book_issues`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `class_rooms`
--
ALTER TABLE `class_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `daily_attendances`
--
ALTER TABLE `daily_attendances`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `exam_categories`
--
ALTER TABLE `exam_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `frontend_events`
--
ALTER TABLE `frontend_events`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `global_settings`
--
ALTER TABLE `global_settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `gradebooks`
--
ALTER TABLE `gradebooks`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `noticeboard`
--
ALTER TABLE `noticeboard`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payment_history`
--
ALTER TABLE `payment_history`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Chỉ mục cho bảng `routines`
--
ALTER TABLE `routines`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `student_fee_managers`
--
ALTER TABLE `student_fee_managers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `syllabuses`
--
ALTER TABLE `syllabuses`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `teacher_permissions`
--
ALTER TABLE `teacher_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `work_unit`
--
ALTER TABLE `work_unit`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `addons`
--
ALTER TABLE `addons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `book_issues`
--
ALTER TABLE `book_issues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `class_rooms`
--
ALTER TABLE `class_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT cho bảng `daily_attendances`
--
ALTER TABLE `daily_attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `exam_categories`
--
ALTER TABLE `exam_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `frontend_events`
--
ALTER TABLE `frontend_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `global_settings`
--
ALTER TABLE `global_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `gradebooks`
--
ALTER TABLE `gradebooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `grades`
--
ALTER TABLE `grades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3999;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `noticeboard`
--
ALTER TABLE `noticeboard`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `payment_history`
--
ALTER TABLE `payment_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `routines`
--
ALTER TABLE `routines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `schools`
--
ALTER TABLE `schools`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `student_fee_managers`
--
ALTER TABLE `student_fee_managers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `syllabuses`
--
ALTER TABLE `syllabuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `teacher_permissions`
--
ALTER TABLE `teacher_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `work_unit`
--
ALTER TABLE `work_unit`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
