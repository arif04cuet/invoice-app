-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 06, 2022 at 04:22 PM
-- Server version: 8.0.28-0ubuntu0.20.04.3
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crater-invoice`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_street_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_street_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int UNSIGNED DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `name`, `address_street_1`, `address_street_2`, `city`, `state`, `country_id`, `zip`, `phone`, `fax`, `type`, `user_id`, `created_at`, `updated_at`, `company_id`) VALUES
(1, NULL, NULL, NULL, 'Dhaka', NULL, 18, '1207', '01717348147', NULL, NULL, NULL, '2021-03-17 08:47:32', '2021-03-17 15:00:40', 1),
(2, 'BCS P60 FTC Cooperative Society Ltd.', NULL, NULL, NULL, NULL, NULL, NULL, '+880 1716-022840', NULL, 'billing', 2, '2021-03-17 14:54:13', '2021-03-17 14:54:13', NULL),
(3, 'dailybazar.com.bd - Hub Daily Bazar Limited', NULL, NULL, NULL, NULL, 18, NULL, '+880 1833-387151', NULL, 'billing', 3, '2021-03-17 15:06:36', '2021-03-17 15:06:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unique_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `logo`, `unique_hash`, `created_at`, `updated_at`) VALUES
(1, 'Arstech', NULL, 'cqeyijYywZnKNIC1Lkks', '2021-03-17 08:43:43', '2021-03-17 08:47:32');

-- --------------------------------------------------------

--
-- Table structure for table `company_settings`
--

CREATE TABLE `company_settings` (
  `id` int UNSIGNED NOT NULL,
  `option` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company_settings`
--

INSERT INTO `company_settings` (`id`, `option`, `value`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'invoice_auto_generate', 'YES', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(2, 'payment_auto_generate', 'YES', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(3, 'estimate_auto_generate', 'YES', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(4, 'save_pdf_to_disk', 'NO', 1, '2021-03-17 08:43:44', '2021-03-18 04:06:35'),
(5, 'invoice_mail_body', 'You have received a new invoice from <b>{COMPANY_NAME}</b>.</br>Please download using the button below:', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(6, 'estimate_mail_body', 'You have received a new estimate from <b>{COMPANY_NAME}</b>.</br>Please download using the button below:', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(7, 'payment_mail_body', 'Thank you for the payment.</b></br>Please download your payment receipt using the button below:', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(8, 'invoice_company_address_format', '<h3><strong>{COMPANY_NAME}</strong></h3><p>{COMPANY_ADDRESS_STREET_1}</p><p>{COMPANY_ADDRESS_STREET_2}</p><p>{COMPANY_CITY} {COMPANY_STATE}</p><p>{COMPANY_COUNTRY}  {COMPANY_ZIP_CODE}</p><p>{COMPANY_PHONE}</p>', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(9, 'invoice_shipping_address_format', '<h3>{SHIPPING_ADDRESS_NAME}</h3><p>{SHIPPING_ADDRESS_STREET_1}</p><p>{SHIPPING_ADDRESS_STREET_2}</p><p>{SHIPPING_CITY}  {SHIPPING_STATE}</p><p>{SHIPPING_COUNTRY}  {SHIPPING_ZIP_CODE}</p><p>{SHIPPING_PHONE}</p>', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(10, 'invoice_billing_address_format', '<h3>{BILLING_ADDRESS_NAME}</h3><p>{BILLING_ADDRESS_STREET_1}</p><p>{BILLING_ADDRESS_STREET_2}</p><p>{BILLING_CITY}  {BILLING_STATE}</p><p>{BILLING_COUNTRY}  {BILLING_ZIP_CODE}</p><p>{BILLING_PHONE}</p>', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(11, 'estimate_company_address_format', '<h3><strong>{COMPANY_NAME}</strong></h3><p>{COMPANY_ADDRESS_STREET_1}</p><p>{COMPANY_ADDRESS_STREET_2}</p><p>{COMPANY_CITY} {COMPANY_STATE}</p><p>{COMPANY_COUNTRY}  {COMPANY_ZIP_CODE}</p><p>{COMPANY_PHONE}</p>', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(12, 'estimate_shipping_address_format', '<h3>{SHIPPING_ADDRESS_NAME}</h3><p>{SHIPPING_ADDRESS_STREET_1}</p><p>{SHIPPING_ADDRESS_STREET_2}</p><p>{SHIPPING_CITY}  {SHIPPING_STATE}</p><p>{SHIPPING_COUNTRY}  {SHIPPING_ZIP_CODE}</p><p>{SHIPPING_PHONE}</p>', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(13, 'estimate_billing_address_format', '<h3>{BILLING_ADDRESS_NAME}</h3><p>{BILLING_ADDRESS_STREET_1}</p><p>{BILLING_ADDRESS_STREET_2}</p><p>{BILLING_CITY}  {BILLING_STATE}</p><p>{BILLING_COUNTRY}  {BILLING_ZIP_CODE}</p><p>{BILLING_PHONE}</p>', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(14, 'payment_company_address_format', '<h3><strong>{COMPANY_NAME}</strong></h3><p>{COMPANY_ADDRESS_STREET_1}</p><p>{COMPANY_ADDRESS_STREET_2}</p><p>{COMPANY_CITY} {COMPANY_STATE}</p><p>{COMPANY_COUNTRY}  {COMPANY_ZIP_CODE}</p><p>{COMPANY_PHONE}</p>', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(15, 'payment_from_customer_address_format', '<h3>{BILLING_ADDRESS_NAME}</h3><p>{BILLING_ADDRESS_STREET_1}</p><p>{BILLING_ADDRESS_STREET_2}</p><p>{BILLING_CITY} {BILLING_STATE} {BILLING_ZIP_CODE}</p><p>{BILLING_COUNTRY}</p><p>{BILLING_PHONE}</p>', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(16, 'currency', '25', 1, '2021-03-17 08:43:44', '2021-03-17 14:18:45'),
(17, 'time_zone', 'Asia/Dhaka', 1, '2021-03-17 08:43:44', '2021-03-17 14:18:45'),
(18, 'language', 'en', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(19, 'fiscal_year', '7-6', 1, '2021-03-17 08:43:44', '2021-03-17 14:18:45'),
(20, 'carbon_date_format', 'd M Y', 1, '2021-03-17 08:43:44', '2021-03-17 14:18:45'),
(21, 'moment_date_format', 'DD MMM YYYY', 1, '2021-03-17 08:43:44', '2021-03-17 14:18:45'),
(22, 'notification_email', 'noreply@crater.in', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(23, 'notify_invoice_viewed', 'NO', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(24, 'notify_estimate_viewed', 'NO', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(25, 'tax_per_item', 'NO', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(26, 'discount_per_item', 'NO', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(27, 'invoice_prefix', 'INV', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(28, 'estimate_prefix', 'EST', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(29, 'payment_prefix', 'PAY', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phonecode` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`, `phonecode`) VALUES
(1, 'AF', 'Afghanistan', 93),
(2, 'AL', 'Albania', 355),
(3, 'DZ', 'Algeria', 213),
(4, 'AS', 'American Samoa', 1684),
(5, 'AD', 'Andorra', 376),
(6, 'AO', 'Angola', 244),
(7, 'AI', 'Anguilla', 1264),
(8, 'AQ', 'Antarctica', 0),
(9, 'AG', 'Antigua And Barbuda', 1268),
(10, 'AR', 'Argentina', 54),
(11, 'AM', 'Armenia', 374),
(12, 'AW', 'Aruba', 297),
(13, 'AU', 'Australia', 61),
(14, 'AT', 'Austria', 43),
(15, 'AZ', 'Azerbaijan', 994),
(16, 'BS', 'Bahamas The', 1242),
(17, 'BH', 'Bahrain', 973),
(18, 'BD', 'Bangladesh', 880),
(19, 'BB', 'Barbados', 1246),
(20, 'BY', 'Belarus', 375),
(21, 'BE', 'Belgium', 32),
(22, 'BZ', 'Belize', 501),
(23, 'BJ', 'Benin', 229),
(24, 'BM', 'Bermuda', 1441),
(25, 'BT', 'Bhutan', 975),
(26, 'BO', 'Bolivia', 591),
(27, 'BA', 'Bosnia and Herzegovina', 387),
(28, 'BW', 'Botswana', 267),
(29, 'BV', 'Bouvet Island', 0),
(30, 'BR', 'Brazil', 55),
(31, 'IO', 'British Indian Ocean Territory', 246),
(32, 'BN', 'Brunei', 673),
(33, 'BG', 'Bulgaria', 359),
(34, 'BF', 'Burkina Faso', 226),
(35, 'BI', 'Burundi', 257),
(36, 'KH', 'Cambodia', 855),
(37, 'CM', 'Cameroon', 237),
(38, 'CA', 'Canada', 1),
(39, 'CV', 'Cape Verde', 238),
(40, 'KY', 'Cayman Islands', 1345),
(41, 'CF', 'Central African Republic', 236),
(42, 'TD', 'Chad', 235),
(43, 'CL', 'Chile', 56),
(44, 'CN', 'China', 86),
(45, 'CX', 'Christmas Island', 61),
(46, 'CC', 'Cocos (Keeling) Islands', 672),
(47, 'CO', 'Colombia', 57),
(48, 'KM', 'Comoros', 269),
(49, 'CG', 'Congo', 242),
(50, 'CD', 'Congo The Democratic Republic Of The', 242),
(51, 'CK', 'Cook Islands', 682),
(52, 'CR', 'Costa Rica', 506),
(53, 'CI', 'Cote D Ivoire (Ivory Coast)', 225),
(54, 'HR', 'Croatia (Hrvatska)', 385),
(55, 'CU', 'Cuba', 53),
(56, 'CY', 'Cyprus', 357),
(57, 'CZ', 'Czech Republic', 420),
(58, 'DK', 'Denmark', 45),
(59, 'DJ', 'Djibouti', 253),
(60, 'DM', 'Dominica', 1767),
(61, 'DO', 'Dominican Republic', 1809),
(62, 'TP', 'East Timor', 670),
(63, 'EC', 'Ecuador', 593),
(64, 'EG', 'Egypt', 20),
(65, 'SV', 'El Salvador', 503),
(66, 'GQ', 'Equatorial Guinea', 240),
(67, 'ER', 'Eritrea', 291),
(68, 'EE', 'Estonia', 372),
(69, 'ET', 'Ethiopia', 251),
(70, 'XA', 'External Territories of Australia', 61),
(71, 'FK', 'Falkland Islands', 500),
(72, 'FO', 'Faroe Islands', 298),
(73, 'FJ', 'Fiji Islands', 679),
(74, 'FI', 'Finland', 358),
(75, 'FR', 'France', 33),
(76, 'GF', 'French Guiana', 594),
(77, 'PF', 'French Polynesia', 689),
(78, 'TF', 'French Southern Territories', 0),
(79, 'GA', 'Gabon', 241),
(80, 'GM', 'Gambia The', 220),
(81, 'GE', 'Georgia', 995),
(82, 'DE', 'Germany', 49),
(83, 'GH', 'Ghana', 233),
(84, 'GI', 'Gibraltar', 350),
(85, 'GR', 'Greece', 30),
(86, 'GL', 'Greenland', 299),
(87, 'GD', 'Grenada', 1473),
(88, 'GP', 'Guadeloupe', 590),
(89, 'GU', 'Guam', 1671),
(90, 'GT', 'Guatemala', 502),
(91, 'XU', 'Guernsey and Alderney', 44),
(92, 'GN', 'Guinea', 224),
(93, 'GW', 'Guinea-Bissau', 245),
(94, 'GY', 'Guyana', 592),
(95, 'HT', 'Haiti', 509),
(96, 'HM', 'Heard and McDonald Islands', 0),
(97, 'HN', 'Honduras', 504),
(98, 'HK', 'Hong Kong S.A.R.', 852),
(99, 'HU', 'Hungary', 36),
(100, 'IS', 'Iceland', 354),
(101, 'IN', 'India', 91),
(102, 'ID', 'Indonesia', 62),
(103, 'IR', 'Iran', 98),
(104, 'IQ', 'Iraq', 964),
(105, 'IE', 'Ireland', 353),
(106, 'IL', 'Israel', 972),
(107, 'IT', 'Italy', 39),
(108, 'JM', 'Jamaica', 1876),
(109, 'JP', 'Japan', 81),
(110, 'XJ', 'Jersey', 44),
(111, 'JO', 'Jordan', 962),
(112, 'KZ', 'Kazakhstan', 7),
(113, 'KE', 'Kenya', 254),
(114, 'KI', 'Kiribati', 686),
(115, 'KP', 'Korea North', 850),
(116, 'KR', 'Korea South', 82),
(117, 'KW', 'Kuwait', 965),
(118, 'KG', 'Kyrgyzstan', 996),
(119, 'LA', 'Laos', 856),
(120, 'LV', 'Latvia', 371),
(121, 'LB', 'Lebanon', 961),
(122, 'LS', 'Lesotho', 266),
(123, 'LR', 'Liberia', 231),
(124, 'LY', 'Libya', 218),
(125, 'LI', 'Liechtenstein', 423),
(126, 'LT', 'Lithuania', 370),
(127, 'LU', 'Luxembourg', 352),
(128, 'MO', 'Macau S.A.R.', 853),
(129, 'MK', 'Macedonia', 389),
(130, 'MG', 'Madagascar', 261),
(131, 'MW', 'Malawi', 265),
(132, 'MY', 'Malaysia', 60),
(133, 'MV', 'Maldives', 960),
(134, 'ML', 'Mali', 223),
(135, 'MT', 'Malta', 356),
(136, 'XM', 'Man (Isle of)', 44),
(137, 'MH', 'Marshall Islands', 692),
(138, 'MQ', 'Martinique', 596),
(139, 'MR', 'Mauritania', 222),
(140, 'MU', 'Mauritius', 230),
(141, 'YT', 'Mayotte', 269),
(142, 'MX', 'Mexico', 52),
(143, 'FM', 'Micronesia', 691),
(144, 'MD', 'Moldova', 373),
(145, 'MC', 'Monaco', 377),
(146, 'MN', 'Mongolia', 976),
(147, 'MS', 'Montserrat', 1664),
(148, 'MA', 'Morocco', 212),
(149, 'MZ', 'Mozambique', 258),
(150, 'MM', 'Myanmar', 95),
(151, 'NA', 'Namibia', 264),
(152, 'NR', 'Nauru', 674),
(153, 'NP', 'Nepal', 977),
(154, 'AN', 'Netherlands Antilles', 599),
(155, 'NL', 'Netherlands The', 31),
(156, 'NC', 'New Caledonia', 687),
(157, 'NZ', 'New Zealand', 64),
(158, 'NI', 'Nicaragua', 505),
(159, 'NE', 'Niger', 227),
(160, 'NG', 'Nigeria', 234),
(161, 'NU', 'Niue', 683),
(162, 'NF', 'Norfolk Island', 672),
(163, 'MP', 'Northern Mariana Islands', 1670),
(164, 'NO', 'Norway', 47),
(165, 'OM', 'Oman', 968),
(166, 'PK', 'Pakistan', 92),
(167, 'PW', 'Palau', 680),
(168, 'PS', 'Palestinian Territory Occupied', 970),
(169, 'PA', 'Panama', 507),
(170, 'PG', 'Papua new Guinea', 675),
(171, 'PY', 'Paraguay', 595),
(172, 'PE', 'Peru', 51),
(173, 'PH', 'Philippines', 63),
(174, 'PN', 'Pitcairn Island', 0),
(175, 'PL', 'Poland', 48),
(176, 'PT', 'Portugal', 351),
(177, 'PR', 'Puerto Rico', 1787),
(178, 'QA', 'Qatar', 974),
(179, 'RE', 'Reunion', 262),
(180, 'RO', 'Romania', 40),
(181, 'RU', 'Russia', 70),
(182, 'RW', 'Rwanda', 250),
(183, 'SH', 'Saint Helena', 290),
(184, 'KN', 'Saint Kitts And Nevis', 1869),
(185, 'LC', 'Saint Lucia', 1758),
(186, 'PM', 'Saint Pierre and Miquelon', 508),
(187, 'VC', 'Saint Vincent And The Grenadines', 1784),
(188, 'WS', 'Samoa', 684),
(189, 'SM', 'San Marino', 378),
(190, 'ST', 'Sao Tome and Principe', 239),
(191, 'SA', 'Saudi Arabia', 966),
(192, 'SN', 'Senegal', 221),
(193, 'RS', 'Serbia', 381),
(194, 'SC', 'Seychelles', 248),
(195, 'SL', 'Sierra Leone', 232),
(196, 'SG', 'Singapore', 65),
(197, 'SK', 'Slovakia', 421),
(198, 'SI', 'Slovenia', 386),
(199, 'XG', 'Smaller Territories of the UK', 44),
(200, 'SB', 'Solomon Islands', 677),
(201, 'SO', 'Somalia', 252),
(202, 'ZA', 'South Africa', 27),
(203, 'GS', 'South Georgia', 0),
(204, 'SS', 'South Sudan', 211),
(205, 'ES', 'Spain', 34),
(206, 'LK', 'Sri Lanka', 94),
(207, 'SD', 'Sudan', 249),
(208, 'SR', 'Suriname', 597),
(209, 'SJ', 'Svalbard And Jan Mayen Islands', 47),
(210, 'SZ', 'Swaziland', 268),
(211, 'SE', 'Sweden', 46),
(212, 'CH', 'Switzerland', 41),
(213, 'SY', 'Syria', 963),
(214, 'TW', 'Taiwan', 886),
(215, 'TJ', 'Tajikistan', 992),
(216, 'TZ', 'Tanzania', 255),
(217, 'TH', 'Thailand', 66),
(218, 'TG', 'Togo', 228),
(219, 'TK', 'Tokelau', 690),
(220, 'TO', 'Tonga', 676),
(221, 'TT', 'Trinidad And Tobago', 1868),
(222, 'TN', 'Tunisia', 216),
(223, 'TR', 'Turkey', 90),
(224, 'TM', 'Turkmenistan', 7370),
(225, 'TC', 'Turks And Caicos Islands', 1649),
(226, 'TV', 'Tuvalu', 688),
(227, 'UG', 'Uganda', 256),
(228, 'UA', 'Ukraine', 380),
(229, 'AE', 'United Arab Emirates', 971),
(230, 'GB', 'United Kingdom', 44),
(231, 'US', 'United States', 1),
(232, 'UM', 'United States Minor Outlying Islands', 1),
(233, 'UY', 'Uruguay', 598),
(234, 'UZ', 'Uzbekistan', 998),
(235, 'VU', 'Vanuatu', 678),
(236, 'VA', 'Vatican City State (Holy See)', 39),
(237, 'VE', 'Venezuela', 58),
(238, 'VN', 'Vietnam', 84),
(239, 'VG', 'Virgin Islands (British)', 1284),
(240, 'VI', 'Virgin Islands (US)', 1340),
(241, 'WF', 'Wallis And Futuna Islands', 681),
(242, 'EH', 'Western Sahara', 212),
(243, 'YE', 'Yemen', 967),
(244, 'YU', 'Yugoslavia', 38),
(245, 'ZM', 'Zambia', 260),
(246, 'ZW', 'Zimbabwe', 263);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `precision` int NOT NULL,
  `thousand_separator` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `decimal_separator` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `swap_currency_symbol` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `precision`, `thousand_separator`, `decimal_separator`, `swap_currency_symbol`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', '$', 2, ',', '.', 0, '2021-03-17 08:43:43', '2021-03-17 08:43:43'),
(2, 'British Pound', 'GBP', '£', 2, ',', '.', 0, '2021-03-17 08:43:43', '2021-03-17 08:43:43'),
(3, 'Euro', 'EUR', '€', 2, '.', ',', 0, '2021-03-17 08:43:43', '2021-03-17 08:43:43'),
(4, 'South African Rand', 'ZAR', 'R', 2, '.', ',', 0, '2021-03-17 08:43:43', '2021-03-17 08:43:43'),
(5, 'Danish Krone', 'DKK', 'kr', 2, '.', ',', 1, '2021-03-17 08:43:43', '2021-03-17 08:43:43'),
(6, 'Israeli Shekel', 'ILS', 'NIS ', 2, ',', '.', 0, '2021-03-17 08:43:43', '2021-03-17 08:43:43'),
(7, 'Swedish Krona', 'SEK', 'kr', 2, '.', ',', 1, '2021-03-17 08:43:43', '2021-03-17 08:43:43'),
(8, 'Kenyan Shilling', 'KES', 'KSh ', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(9, 'Kuwaiti Dinar', 'KWD', 'KWD ', 3, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(10, 'Canadian Dollar', 'CAD', 'C$', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(11, 'Philippine Peso', 'PHP', 'P ', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(12, 'Indian Rupee', 'INR', '₹', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(13, 'Australian Dollar', 'AUD', '$', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(14, 'Singapore Dollar', 'SGD', 'S$', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(15, 'Norske Kroner', 'NOK', 'kr', 2, '.', ',', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(16, 'New Zealand Dollar', 'NZD', '$', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(17, 'Vietnamese Dong', 'VND', '₫', 0, '.', ',', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(18, 'Swiss Franc', 'CHF', 'Fr.', 2, '\'', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(19, 'Guatemalan Quetzal', 'GTQ', 'Q', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(20, 'Malaysian Ringgit', 'MYR', 'RM', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(21, 'Brazilian Real', 'BRL', 'R$', 2, '.', ',', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(22, 'Thai Baht', 'THB', '฿', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(23, 'Nigerian Naira', 'NGN', '₦', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(24, 'Argentine Peso', 'ARS', '$', 2, '.', ',', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(25, 'Bangladeshi Taka', 'BDT', 'Tk', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(26, 'United Arab Emirates Dirham', 'AED', 'DH ', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(27, 'Hong Kong Dollar', 'HKD', 'HK$', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(28, 'Indonesian Rupiah', 'IDR', 'Rp', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(29, 'Mexican Peso', 'MXN', '$', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(30, 'Egyptian Pound', 'EGP', 'E£', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(31, 'Colombian Peso', 'COP', '$', 2, '.', ',', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(32, 'West African Franc', 'XOF', 'CFA ', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(33, 'Chinese Renminbi', 'CNY', 'RMB ', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(34, 'Rwandan Franc', 'RWF', 'RF ', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(35, 'Tanzanian Shilling', 'TZS', 'TSh ', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(36, 'Netherlands Antillean Guilder', 'ANG', 'NAƒ', 2, '.', ',', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(37, 'Trinidad and Tobago Dollar', 'TTD', 'TT$', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(38, 'East Caribbean Dollar', 'XCD', 'EC$', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(39, 'Ghanaian Cedi', 'GHS', '‎GH₵', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(40, 'Bulgarian Lev', 'BGN', 'Лв.', 2, ' ', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(41, 'Aruban Florin', 'AWG', 'Afl. ', 2, ' ', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(42, 'Turkish Lira', 'TRY', 'TL ', 2, '.', ',', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(43, 'Romanian New Leu', 'RON', 'RON', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(44, 'Croatian Kuna', 'HRK', 'kn', 2, '.', ',', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(45, 'Saudi Riyal', 'SAR', '‎SِAR', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(46, 'Japanese Yen', 'JPY', '¥', 0, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(47, 'Maldivian Rufiyaa', 'MVR', 'Rf', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(48, 'Costa Rican Colón', 'CRC', '₡', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(49, 'Pakistani Rupee', 'PKR', 'Rs ', 0, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(50, 'Polish Zloty', 'PLN', 'zł', 2, ' ', ',', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(51, 'Sri Lankan Rupee', 'LKR', 'LKR', 2, ',', '.', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(52, 'Czech Koruna', 'CZK', 'Kč', 2, ' ', ',', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(53, 'Uruguayan Peso', 'UYU', '$', 2, '.', ',', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(54, 'Namibian Dollar', 'NAD', '$', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(55, 'Tunisian Dinar', 'TND', '‎د.ت', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(56, 'Russian Ruble', 'RUB', '₽', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(57, 'Mozambican Metical', 'MZN', 'MT', 2, '.', ',', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(58, 'Omani Rial', 'OMR', 'ر.ع.', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(59, 'Ukrainian Hryvnia', 'UAH', '₴', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(60, 'Macanese Pataca', 'MOP', 'MOP$', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(61, 'Taiwan New Dollar', 'TWD', 'NT$', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(62, 'Dominican Peso', 'DOP', 'RD$', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(63, 'Chilean Peso', 'CLP', '$', 2, '.', ',', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(64, 'Serbian Dinar', 'RSD', 'RSD', 2, '.', ',', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(65, 'Kyrgyzstani som', 'KGS', 'С̲ ', 2, '.', ',', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(66, 'Iraqi Dinar', 'IQD', 'ع.د', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(67, 'Peruvian Soles', 'PEN', 'S/', 2, ',', '.', 0, '2021-03-17 08:43:44', '2021-03-17 08:43:44');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `placeholder` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `options` json DEFAULT NULL,
  `boolean_answer` tinyint(1) DEFAULT NULL,
  `date_answer` date DEFAULT NULL,
  `time_answer` time DEFAULT NULL,
  `string_answer` text COLLATE utf8_unicode_ci,
  `number_answer` bigint UNSIGNED DEFAULT NULL,
  `date_time_answer` datetime DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `order` bigint UNSIGNED NOT NULL DEFAULT '1',
  `company_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` bigint UNSIGNED NOT NULL,
  `custom_field_valuable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `custom_field_valuable_id` int UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `boolean_answer` tinyint(1) DEFAULT NULL,
  `date_answer` date DEFAULT NULL,
  `time_answer` time DEFAULT NULL,
  `string_answer` text COLLATE utf8_unicode_ci,
  `number_answer` bigint UNSIGNED DEFAULT NULL,
  `date_time_answer` datetime DEFAULT NULL,
  `custom_field_id` bigint UNSIGNED NOT NULL,
  `company_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_logs`
--

CREATE TABLE `email_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `mailable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mailable_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_logs`
--

INSERT INTO `email_logs` (`id`, `from`, `to`, `subject`, `body`, `mailable_type`, `mailable_id`, `created_at`, `updated_at`) VALUES
(1, 'crater@gmail.com', 'bcsp60ftccoop@gmail.com', 'New Invoice', 'You have received a new invoice from <b>Arstech</b>.</br>Please download using the button below:', 'Crater\\Models\\Invoice', '1', '2021-03-17 14:59:11', '2021-03-17 14:59:11');

-- --------------------------------------------------------

--
-- Table structure for table `estimates`
--

CREATE TABLE `estimates` (
  `id` int UNSIGNED NOT NULL,
  `estimate_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `estimate_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reference_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_per_item` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount_per_item` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `discount` decimal(15,2) DEFAULT NULL,
  `discount_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount_val` bigint UNSIGNED DEFAULT NULL,
  `sub_total` bigint UNSIGNED NOT NULL,
  `total` bigint UNSIGNED NOT NULL,
  `tax` bigint UNSIGNED NOT NULL,
  `unique_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `estimate_template_id` int UNSIGNED DEFAULT NULL,
  `company_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `creator_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_items`
--

CREATE TABLE `estimate_items` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `discount_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `unit_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` decimal(15,2) DEFAULT NULL,
  `discount_val` bigint UNSIGNED DEFAULT NULL,
  `price` bigint UNSIGNED NOT NULL,
  `tax` bigint UNSIGNED NOT NULL,
  `total` bigint UNSIGNED NOT NULL,
  `item_id` int UNSIGNED DEFAULT NULL,
  `estimate_id` int UNSIGNED NOT NULL,
  `company_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_templates`
--

CREATE TABLE `estimate_templates` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `estimate_templates`
--

INSERT INTO `estimate_templates` (`id`, `name`, `view`, `path`, `created_at`, `updated_at`) VALUES
(1, 'Template 1', 'estimate1', '/assets/img/PDF/Template1.png', '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(2, 'Template 2', 'estimate2', '/assets/img/PDF/Template2.png', '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(3, 'Template 3', 'estimate3', '/assets/img/PDF/Template3.png', '2021-03-17 08:43:44', '2021-03-17 08:43:44');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int UNSIGNED NOT NULL,
  `expense_date` date NOT NULL,
  `attachment_receipt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` bigint UNSIGNED NOT NULL,
  `notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `expense_category_id` int UNSIGNED NOT NULL,
  `company_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `creator_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_disks`
--

CREATE TABLE `file_disks` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'REMOTE',
  `driver` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `set_as_default` tinyint(1) NOT NULL DEFAULT '0',
  `credentials` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `file_disks`
--

INSERT INTO `file_disks` (`id`, `name`, `type`, `driver`, `set_as_default`, `credentials`, `created_at`, `updated_at`) VALUES
(1, 'local_public', 'SYSTEM', 'local', 0, '\"{\\\"driver\\\":\\\"local\\\",\\\"root\\\":\\\"\\\\/home\\\\/arif03cuet\\\\/Code\\\\/php\\\\/rnd\\\\/crater-invoice\\\\/storage\\\\/app\\\\/public\\\",\\\"url\\\":\\\"http:\\\\/\\\\/invoiceapp.local\\\\/\\\\/storage\\\",\\\"visibility\\\":\\\"public\\\"}\"', '2021-03-17 08:43:42', '2021-03-17 08:43:42'),
(2, 'local_private', 'SYSTEM', 'local', 1, '\"{\\\"root\\\":\\\"\\\\/home\\\\/arif03cuet\\\\/Code\\\\/php\\\\/rnd\\\\/crater-invoice\\\\/storage\\\\/app\\\",\\\"driver\\\":\\\"local\\\"}\"', '2021-03-17 08:43:42', '2021-03-17 08:43:42');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int UNSIGNED NOT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `invoice_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reference_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `paid_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax_per_item` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount_per_item` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `discount_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` decimal(15,2) DEFAULT NULL,
  `discount_val` bigint UNSIGNED DEFAULT NULL,
  `sub_total` bigint UNSIGNED NOT NULL,
  `total` bigint UNSIGNED NOT NULL,
  `tax` bigint UNSIGNED NOT NULL,
  `due_amount` bigint UNSIGNED NOT NULL,
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` tinyint(1) NOT NULL DEFAULT '0',
  `unique_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_template_id` int UNSIGNED DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `company_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `creator_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_date`, `due_date`, `invoice_number`, `reference_number`, `status`, `paid_status`, `tax_per_item`, `discount_per_item`, `notes`, `discount_type`, `discount`, `discount_val`, `sub_total`, `total`, `tax`, `due_amount`, `sent`, `viewed`, `unique_hash`, `invoice_template_id`, `user_id`, `company_id`, `created_at`, `updated_at`, `creator_id`) VALUES
(1, '2021-03-17', '2021-03-24', 'INV-000001', NULL, 'COMPLETED', 'PAID', 'NO', 'NO', '<p><strong>Payment Method:</strong><br>Brac Bank:<br>A/C Name: ARSTECH</p><p>A/C Number: 1514204625025001<br>Shaymoli Branch</p><p><br></p>', 'fixed', '0.00', 0, 900000, 900000, 0, 0, 1, 1, 'GLV6N74pbMVb1Dqr8nPv', 2, 2, 1, '2021-03-17 02:57:46', '2021-05-02 14:55:57', 1),
(2, '2021-03-17', '2021-03-24', 'INV-000002', NULL, 'COMPLETED', 'PAID', 'NO', 'NO', '<p><strong>Payment Method:<br>Brac Bank:</strong><br>A/C Name: ARSTECH</p><p>A/C Number: 1514204625025001<br>Shaymoli Branch</p><p><br><strong>bKash:</strong></p><p>Name: Arif Hossain<br>Number: 01717348147</p>', 'fixed', '0.00', 0, 600000, 600000, 0, 0, 0, 0, 'qP7MVLYGgYMgm1DepN8n', 2, 3, 1, '2021-03-17 03:09:02', '2021-04-18 07:27:13', 1),
(3, '2021-04-18', '2021-04-25', 'INV-000003', NULL, 'COMPLETED', 'PAID', 'NO', 'NO', '<p>Brac Bank:<br>A/C Name: ARSTECH</p><p>A/C Number: 1514204625025001<br>Shaymoli Branch<br><br>Bkash: 01717348147</p>', 'fixed', '0.00', 0, 240000, 240000, 0, 0, 0, 0, 'nO6qNrj2xP4gmeMVvG17', 2, 3, 1, '2021-04-18 01:31:49', '2021-05-02 14:58:07', 1),
(4, '2021-06-15', '2021-06-25', 'INV-000004', NULL, 'COMPLETED', 'PAID', 'NO', 'NO', '<p>Brac Bank:<br>A/C Name: ARSTECH</p><p>A/C Number: 1514204625025001<br>Shaymoli Branch</p><p></p><p>BKash:</p><p>Name: Arif Hossain<br>Number: 01717348147</p>', 'fixed', '0.00', 0, 1500000, 1500000, 0, 0, 1, 0, 'pqR81G67x1jxVrme4POY', 3, 3, 1, '2021-06-14 10:41:54', '2021-10-08 02:14:53', 1),
(5, '2021-06-15', '2021-06-30', 'INV-000005', NULL, 'COMPLETED', 'PAID', 'NO', 'NO', '<p>Brac Bank:<br>A/C Name: ARSTECH</p><p>A/C Number: 1514204625025001<br>Shaymoli Branch</p>', 'fixed', '0.00', 0, 900000, 900000, 0, 0, 1, 0, 'O1e6D4M7x6ObVGY2q8rj', 3, 2, 1, '2021-06-15 04:46:40', '2021-10-08 02:14:02', 1),
(6, '2021-10-08', '2021-10-15', 'INV-000006', NULL, 'DRAFT', 'UNPAID', 'NO', 'NO', '<p>Brac Bank:<br>A/C Name: ARSTECH</p><p>A/C Number: 1514204625025001<br>Shaymoli Branch</p>', 'fixed', '0.00', 0, 3000000, 3000000, 0, 3000000, 0, 0, 'e8V1DGOqxnexnjNmpYRv', 3, 2, 1, '2021-10-07 14:23:29', '2021-10-07 14:23:29', 1),
(7, '2021-10-08', '2021-10-15', 'INV-000007', NULL, 'DRAFT', 'UNPAID', 'NO', 'NO', '<p>Brac Bank:<br>A/C Name: ARSTECH</p><p>A/C Number: 1514204625025001<br>Shaymoli Branch</p>', 'fixed', '0.00', 0, 900000, 900000, 0, 900000, 0, 0, 'qR842vOYbG7xePMGLn7N', 3, 2, 1, '2021-10-08 02:30:16', '2021-10-08 02:30:16', 1),
(8, '2022-04-06', '2022-04-13', 'INV-000008', NULL, 'DRAFT', 'UNPAID', 'NO', 'NO', '<p>Brac Bank:<br>A/C Name: ARSTECH</p><p>A/C Number: 1514204625025001<br>Shaymoli Branch</p>', 'fixed', '0.00', 0, 1800000, 1800000, 0, 1800000, 0, 0, 'R64pMOj8bv1be7qDL1NG', 3, 2, 1, '2022-04-06 10:14:35', '2022-04-06 10:14:35', 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `discount_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` bigint UNSIGNED NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `unit_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` decimal(15,2) DEFAULT NULL,
  `discount_val` bigint UNSIGNED NOT NULL,
  `tax` bigint UNSIGNED NOT NULL,
  `total` bigint UNSIGNED NOT NULL,
  `invoice_id` int UNSIGNED NOT NULL,
  `item_id` int UNSIGNED DEFAULT NULL,
  `company_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `name`, `description`, `discount_type`, `price`, `quantity`, `unit_name`, `discount`, `discount_val`, `tax`, `total`, `invoice_id`, `item_id`, `company_id`, `created_at`, `updated_at`) VALUES
(4, 'Software Support and Hosting Charge', NULL, 'fixed', 300000, '3.00', NULL, '0.00', 0, 0, 900000, 1, 1, 1, '2021-03-17 15:17:32', '2021-03-17 15:17:32'),
(6, 'Hosting service Fee per month', 'September 2020\nOctober 2020\nNovember 2020\nDecember 2020\nJanuary 2021\nFebruary 2021', 'fixed', 100000, '6.00', NULL, '0.00', 0, 0, 600000, 2, 2, 1, '2021-03-17 15:21:43', '2021-03-17 15:21:43'),
(8, 'Maintenance work on dailybazar.com.bd', '1. Order didn\'t come to mail. (mail2dailybazar@gmail.com). \n2. Search option didn\'t work. \n3. Contact us option mail didn\'t come. \ntotal 2 hours.', 'fixed', 240000, '1.00', NULL, '0.00', 0, 0, 240000, 3, 3, 1, '2021-04-18 07:33:00', '2021-04-18 07:33:00'),
(15, 'Hosting service Fee per month', 'April 2021 - June 2021', 'fixed', 100000, '3.00', NULL, '0.00', 0, 0, 300000, 4, 2, 1, '2021-06-15 04:44:04', '2021-06-15 04:44:04'),
(16, 'Hosting service Fee per month', 'July 2021 - June 2022 (advanced)', 'fixed', 100000, '12.00', NULL, '0.00', 0, 0, 1200000, 4, 2, 1, '2021-06-15 04:44:04', '2021-06-15 04:44:04'),
(17, 'Software Support and Hosting Charge', 'April 2021 - June 2021', 'fixed', 300000, '3.00', NULL, '0.00', 0, 0, 900000, 5, 1, 1, '2021-06-15 04:46:41', '2021-06-15 04:46:41'),
(20, 'Samity Software Enhancement', '50% of total payment tk. 60,000/=', 'fixed', 3000000, '1.00', NULL, '0.00', 0, 0, 3000000, 6, 4, 1, '2021-10-08 02:26:52', '2021-10-08 02:26:52'),
(21, 'Software Support and Hosting Charge', 'July 2021 - September 2021', 'fixed', 300000, '3.00', NULL, '0.00', 0, 0, 900000, 7, 1, 1, '2021-10-08 02:30:16', '2021-10-08 02:30:16'),
(23, 'Software Support and Hosting Charge', 'October 2021 - March 2022', 'fixed', 300000, '6.00', NULL, '0.00', 0, 0, 1800000, 8, 1, 1, '2022-04-06 16:15:32', '2022-04-06 16:15:32');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_templates`
--

CREATE TABLE `invoice_templates` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoice_templates`
--

INSERT INTO `invoice_templates` (`id`, `name`, `view`, `path`, `created_at`, `updated_at`) VALUES
(1, 'Template 1', 'invoice1', '/assets/img/PDF/Template1.png', '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(2, ' Template 2', 'invoice2', '/assets/img/PDF/Template2.png', '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(3, 'Template 3', 'invoice3', '/assets/img/PDF/Template3.png', '2021-03-17 08:43:44', '2021-03-17 08:43:44');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` bigint UNSIGNED NOT NULL,
  `company_id` int UNSIGNED DEFAULT NULL,
  `unit_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `creator_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `description`, `unit`, `price`, `company_id`, `unit_id`, `created_at`, `updated_at`, `creator_id`) VALUES
(1, 'Software Support and Hosting Charge', NULL, NULL, 300000, 1, NULL, '2021-03-17 14:56:13', '2021-03-17 14:56:13', 1),
(2, 'Hosting service Fee per month', NULL, NULL, 100000, 1, NULL, '2021-03-17 15:07:16', '2021-03-17 15:07:16', 1),
(3, 'Maintenance work on dailybazar.com.bd', NULL, NULL, 120000, 1, NULL, '2021-04-18 07:29:19', '2021-04-18 07:29:19', 1),
(4, 'Samity Software Enhancement', NULL, NULL, 6000000, 1, NULL, '2021-10-08 02:16:13', '2021-10-08 02:16:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `collection_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int UNSIGNED NOT NULL,
  `manipulations` text COLLATE utf8_unicode_ci NOT NULL,
  `custom_properties` text COLLATE utf8_unicode_ci NOT NULL,
  `responsive_images` text COLLATE utf8_unicode_ci NOT NULL,
  `order_column` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conversions_disk` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_11_071840_create_companies_table', 1),
(2, '2014_10_11_125754_create_currencies_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2016_05_13_060834_create_settings_table', 1),
(6, '2017_04_11_064308_create_units_table', 1),
(7, '2017_04_11_081227_create_items_table', 1),
(8, '2017_04_11_140447_create_invoice_templates_table', 1),
(9, '2017_04_12_090759_create_invoices_table', 1),
(10, '2017_04_12_091015_create_invoice_items_table', 1),
(11, '2017_05_04_141701_create_estimate_templates_table', 1),
(12, '2017_05_05_055609_create_estimates_table', 1),
(13, '2017_05_05_073927_create_notifications_table', 1),
(14, '2017_05_06_173745_create_countries_table', 1),
(15, '2017_10_02_123501_create_estimate_items_table', 1),
(16, '2018_11_02_133825_create_ expense_categories_table', 1),
(17, '2018_11_02_133956_create_expenses_table', 1),
(18, '2019_08_30_072639_create_addresses_table', 1),
(19, '2019_09_02_053155_create_payment_methods_table', 1),
(20, '2019_09_03_135234_create_payments_table', 1),
(21, '2019_09_14_120124_create_media_table', 1),
(22, '2019_09_21_052540_create_tax_types_table', 1),
(23, '2019_09_21_052548_create_taxes_table', 1),
(24, '2019_09_26_145012_create_company_settings_table', 1),
(25, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(26, '2020_02_01_063235_create_custom_fields_table', 1),
(27, '2020_02_01_063509_create_custom_field_values_table', 1),
(28, '2020_05_12_154129_add_user_id_to_expenses_table', 1),
(29, '2020_09_07_103054_create_file_disks_table', 1),
(30, '2020_09_22_153617_add_columns_to_media_table', 1),
(31, '2020_09_26_100951_create_user_settings_table', 1),
(32, '2020_10_01_102913_add_company_to_addresses_table', 1),
(33, '2020_10_17_074745_create_notes_table', 1),
(34, '2020_10_24_091934_change_value_column_to_text_on_company_settings_table', 1),
(35, '2020_11_23_050206_add_creator_in_invoices_table', 1),
(36, '2020_11_23_050252_add_creator_in_estimates_table', 1),
(37, '2020_11_23_050316_add_creator_in_payments_table', 1),
(38, '2020_11_23_050333_add_creator_in_expenses_table', 1),
(39, '2020_11_23_050406_add_creator_in_items_table', 1),
(40, '2020_11_23_065815_add_creator_in_users_table', 1),
(41, '2020_11_23_074154_create_email_logs_table', 1),
(42, '2020_12_02_064933_update_crater_version_320', 1),
(43, '2020_12_02_090527_update_crater_version_400', 1),
(44, '2020_12_08_065715_change_description_and_notes_column_type', 1),
(45, '2020_12_08_133131_update_crater_version_401', 1),
(46, '2020_12_23_061302_update_crater_version_402', 1),
(47, '2020_12_31_100816_update_crater_version_403', 1),
(48, '2021_01_22_085644_update_crater_version_404', 1),
(49, '2021_03_03_155223_add_unit_name_to_pdf', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `type`, `name`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'Invoice', 'Brac Bank', '<p>Brac Bank:<br>A/C Name: ARSTECH</p><p>A/C Number: 1514204625025001<br>Shaymoli Branch</p>', '2021-03-17 15:19:07', '2021-03-17 15:19:07'),
(2, 'Invoice', 'bKash', '<p>Name: Arif Hossain<br>Number: 01717348147</p>', '2021-03-17 15:20:01', '2021-03-17 15:20:01');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_date` date NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `amount` bigint UNSIGNED NOT NULL,
  `unique_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `invoice_id` int UNSIGNED DEFAULT NULL,
  `company_id` int UNSIGNED DEFAULT NULL,
  `payment_method_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `creator_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `payment_number`, `payment_date`, `notes`, `amount`, `unique_hash`, `user_id`, `invoice_id`, `company_id`, `payment_method_id`, `created_at`, `updated_at`, `creator_id`) VALUES
(1, 'PAY-000001', '2021-04-01', NULL, 600000, '9DnKdyr4GB6GXZYR1lO3', 3, 2, 1, 5, '2021-04-18 07:27:13', '2021-04-18 07:27:13', 1),
(2, 'PAY-000002', '2021-05-02', NULL, 900000, '7ZX4yVe9zKBzr6b3RYxn', 2, 1, 1, 4, '2021-05-02 14:55:57', '2021-05-02 14:55:57', 1),
(3, 'PAY-000003', '2021-05-02', NULL, 240000, '6b97nRBOGy5zlDeZK3Vr', 3, 3, 1, 5, '2021-05-02 14:58:07', '2021-05-02 14:58:07', 1),
(4, 'PAY-000004', '2021-07-01', NULL, 900000, 'e4dVBOylLYxGxrD3nX17', 2, 5, 1, 4, '2021-10-08 02:14:02', '2021-10-08 02:14:02', 1),
(5, 'PAY-000005', '2021-07-01', NULL, 1500000, 'Dn3Z1O9RL4Bz6V4B5bxy', 3, 4, 1, 5, '2021-10-08 02:14:53', '2021-10-08 02:14:53', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'Cash', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(2, 'Check', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(3, 'Credit Card', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(4, 'Bank Transfer', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(5, 'bKash', 1, '2021-04-18 07:26:50', '2021-04-18 07:26:50');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `option` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `option`, `value`, `created_at`, `updated_at`) VALUES
(1, 'version', '4.0.4', '2021-03-17 08:43:42', '2021-03-17 08:43:43'),
(2, 'profile_complete', 'COMPLETED', '2021-03-17 08:43:43', '2021-03-17 14:48:45');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int UNSIGNED NOT NULL,
  `tax_type_id` int UNSIGNED NOT NULL,
  `invoice_id` int UNSIGNED DEFAULT NULL,
  `estimate_id` int UNSIGNED DEFAULT NULL,
  `invoice_item_id` int UNSIGNED DEFAULT NULL,
  `estimate_item_id` int UNSIGNED DEFAULT NULL,
  `item_id` int UNSIGNED DEFAULT NULL,
  `company_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` bigint UNSIGNED NOT NULL,
  `percent` decimal(5,2) NOT NULL,
  `compound_tax` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_types`
--

CREATE TABLE `tax_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percent` decimal(5,2) NOT NULL,
  `compound_tax` tinyint NOT NULL DEFAULT '0',
  `collective_tax` tinyint NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `company_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'box', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(2, 'cm', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(3, 'dz', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(4, 'ft', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(5, 'g', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(6, 'in', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(7, 'kg', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(8, 'km', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(9, 'lb', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(10, 'mg', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44'),
(11, 'pc', 1, '2021-03-17 08:43:44', '2021-03-17 08:43:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `github_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enable_portal` tinyint(1) DEFAULT NULL,
  `currency_id` int UNSIGNED DEFAULT NULL,
  `company_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `creator_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `role`, `remember_token`, `facebook_id`, `google_id`, `github_id`, `contact_name`, `company_name`, `website`, `enable_portal`, `currency_id`, `company_id`, `created_at`, `updated_at`, `creator_id`) VALUES
(1, 'Arif Hossain', 'arif04cuet@gmail.com', NULL, '$2y$10$DY3XoJlZXoguvRKYVWjTqe8UAKj8WOJ9cww56JqZ82QZdILoxz9yG', 'super admin', 'ZoxnaahaeX0olLBIZ6XMFVVm59hBM0BWtxHhXLxEe0eYELOXhkcoDujqkypq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-03-17 08:43:43', '2021-10-07 20:02:51', NULL),
(2, 'BCS P60 FTC Cooperative Society Ltd.', 'bcsp60ftccoop@gmail.com', '+880 1716-022840', '$2y$10$ouDc0voXwjYX98RVmTTj9uDSqATZAEqd2IZME4VvVXpYMYiagb2N6', 'customer', NULL, NULL, NULL, NULL, 'BCS P60 FTC Cooperative Society Ltd.', NULL, 'http://p60ftcsociety.org.bd/', NULL, 25, 1, '2021-03-17 14:54:13', '2021-03-17 14:54:13', 1),
(3, 'dailybazar.com.bd - Hub Daily Bazar Limited', 'creativeshofiq@gmail.com', '+880 1833-387151', '$2y$10$R/DOUq3ZmT.f8CT66PYpdem9A07rwiwCib4tWKNgnwyXZd6ZUQZie', 'customer', NULL, NULL, NULL, NULL, 'dailybazar.com.bd - Hub Daily Bazar Limited', NULL, 'https://dailybazar.com.bd/', NULL, 25, 1, '2021-03-17 15:06:36', '2021-03-17 15:06:36', 1),
(4, 'rafsan', 'rafsan@gmail.com', 'admin123', '$2y$10$BX4tCa3ZTjrhP83ww2wQuOIWvOMeDsUAO2O7a5BiUJ.08gakvxqVu', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-03-18 04:09:35', '2021-03-18 04:09:35', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_settings`
--

CREATE TABLE `user_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_settings`
--

INSERT INTO `user_settings` (`id`, `key`, `value`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'language', 'en', 1, '2021-03-17 14:48:45', '2021-03-17 14:48:45'),
(2, 'language', 'en', 4, '2021-03-18 04:09:35', '2021-03-18 04:09:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_country_id_foreign` (`country_id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`),
  ADD KEY `addresses_company_id_foreign` (`company_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_settings`
--
ALTER TABLE `company_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countries_id_index` (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_fields_company_id_foreign` (`company_id`);

--
-- Indexes for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_field_values_custom_field_id_foreign` (`custom_field_id`),
  ADD KEY `custom_field_values_company_id_foreign` (`company_id`);

--
-- Indexes for table `email_logs`
--
ALTER TABLE `email_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estimates`
--
ALTER TABLE `estimates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estimates_user_id_foreign` (`user_id`),
  ADD KEY `estimates_estimate_template_id_foreign` (`estimate_template_id`),
  ADD KEY `estimates_company_id_foreign` (`company_id`),
  ADD KEY `estimates_creator_id_foreign` (`creator_id`);

--
-- Indexes for table `estimate_items`
--
ALTER TABLE `estimate_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estimate_items_item_id_foreign` (`item_id`),
  ADD KEY `estimate_items_estimate_id_foreign` (`estimate_id`),
  ADD KEY `estimate_items_company_id_foreign` (`company_id`);

--
-- Indexes for table `estimate_templates`
--
ALTER TABLE `estimate_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_expense_category_id_foreign` (`expense_category_id`),
  ADD KEY `expenses_company_id_foreign` (`company_id`),
  ADD KEY `expenses_user_id_foreign` (`user_id`),
  ADD KEY `expenses_creator_id_foreign` (`creator_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_company_id_foreign` (`company_id`);

--
-- Indexes for table `file_disks`
--
ALTER TABLE `file_disks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_invoice_template_id_foreign` (`invoice_template_id`),
  ADD KEY `invoices_user_id_foreign` (`user_id`),
  ADD KEY `invoices_company_id_foreign` (`company_id`),
  ADD KEY `invoices_creator_id_foreign` (`creator_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_items_item_id_foreign` (`item_id`),
  ADD KEY `invoice_items_company_id_foreign` (`company_id`);

--
-- Indexes for table `invoice_templates`
--
ALTER TABLE `invoice_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_company_id_foreign` (`company_id`),
  ADD KEY `items_unit_id_foreign` (`unit_id`),
  ADD KEY `items_creator_id_foreign` (`creator_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`),
  ADD KEY `payments_invoice_id_foreign` (`invoice_id`),
  ADD KEY `payments_company_id_foreign` (`company_id`),
  ADD KEY `payments_payment_method_id_foreign` (`payment_method_id`),
  ADD KEY `payments_creator_id_foreign` (`creator_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_methods_company_id_foreign` (`company_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taxes_tax_type_id_foreign` (`tax_type_id`),
  ADD KEY `taxes_invoice_id_foreign` (`invoice_id`),
  ADD KEY `taxes_estimate_id_foreign` (`estimate_id`),
  ADD KEY `taxes_invoice_item_id_foreign` (`invoice_item_id`),
  ADD KEY `taxes_estimate_item_id_foreign` (`estimate_item_id`),
  ADD KEY `taxes_item_id_foreign` (`item_id`),
  ADD KEY `taxes_company_id_foreign` (`company_id`);

--
-- Indexes for table `tax_types`
--
ALTER TABLE `tax_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_types_company_id_foreign` (`company_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_company_id_foreign` (`company_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_currency_id_foreign` (`currency_id`),
  ADD KEY `users_company_id_foreign` (`company_id`),
  ADD KEY `users_creator_id_foreign` (`creator_id`);

--
-- Indexes for table `user_settings`
--
ALTER TABLE `user_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_settings_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `company_settings`
--
ALTER TABLE `company_settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_logs`
--
ALTER TABLE `email_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `estimates`
--
ALTER TABLE `estimates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estimate_items`
--
ALTER TABLE `estimate_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estimate_templates`
--
ALTER TABLE `estimate_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_disks`
--
ALTER TABLE `file_disks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `invoice_templates`
--
ALTER TABLE `invoice_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_types`
--
ALTER TABLE `tax_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_settings`
--
ALTER TABLE `user_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `company_settings`
--
ALTER TABLE `company_settings`
  ADD CONSTRAINT `company_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD CONSTRAINT `custom_fields_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD CONSTRAINT `custom_field_values_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `custom_field_values_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`);

--
-- Constraints for table `estimates`
--
ALTER TABLE `estimates`
  ADD CONSTRAINT `estimates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `estimates_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `estimates_estimate_template_id_foreign` FOREIGN KEY (`estimate_template_id`) REFERENCES `estimate_templates` (`id`),
  ADD CONSTRAINT `estimates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `estimate_items`
--
ALTER TABLE `estimate_items`
  ADD CONSTRAINT `estimate_items_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `estimate_items_estimate_id_foreign` FOREIGN KEY (`estimate_id`) REFERENCES `estimates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `estimate_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expenses_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expenses_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_invoice_template_id_foreign` FOREIGN KEY (`invoice_template_id`) REFERENCES `invoice_templates` (`id`),
  ADD CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `items_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `items_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD CONSTRAINT `payment_methods_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taxes`
--
ALTER TABLE `taxes`
  ADD CONSTRAINT `taxes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `taxes_estimate_id_foreign` FOREIGN KEY (`estimate_id`) REFERENCES `estimates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `taxes_estimate_item_id_foreign` FOREIGN KEY (`estimate_item_id`) REFERENCES `estimate_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `taxes_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `taxes_invoice_item_id_foreign` FOREIGN KEY (`invoice_item_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `taxes_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `taxes_tax_type_id_foreign` FOREIGN KEY (`tax_type_id`) REFERENCES `tax_types` (`id`);

--
-- Constraints for table `tax_types`
--
ALTER TABLE `tax_types`
  ADD CONSTRAINT `tax_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_settings`
--
ALTER TABLE `user_settings`
  ADD CONSTRAINT `user_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
