-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 07, 2025 at 03:08 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@example.com', NULL, '$2y$12$Ctkmy78DPJ4UA0wI0zUh2u/wvX38.gxFQR/UZXk1xeb1fFfd4UG1G', NULL, '2025-10-27 21:07:34', '2025-10-27 21:07:34');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `grand_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `coupon_id` bigint UNSIGNED DEFAULT NULL,
  `coupon_discount` decimal(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `session_id`, `subtotal`, `discount_total`, `tax_total`, `grand_total`, `created_at`, `updated_at`, `coupon_id`, `coupon_discount`) VALUES
(1, NULL, '353015c2-5d1a-4f81-9d6c-aca3ac045fac', '3011.54', '0.00', '0.00', '3011.54', '2025-10-27 21:09:58', '2025-10-27 21:13:40', NULL, '0.00'),
(4, NULL, 'd9148f7a-5eb6-4414-af13-f2ae6868060b', '7070.07', '0.00', '0.00', '7070.07', '2025-10-28 05:09:47', '2025-10-28 05:26:00', NULL, '0.00'),
(6, 2, 'c3ca38b2-a93a-42c5-93da-dac7029d75c8', '1421.08', '0.00', '0.00', '1421.08', '2025-11-03 12:14:39', '2025-11-06 20:42:23', NULL, '0.00'),
(7, NULL, 'b4ced63d-ae22-4fa4-8a91-d22935e7f70e', '0.00', '0.00', '0.00', '0.00', '2025-11-04 13:47:22', '2025-11-04 13:47:22', NULL, '0.00'),
(8, NULL, 'b3174514-68cc-44d8-b659-471a44e25e34', '0.00', '0.00', '0.00', '0.00', '2025-11-04 13:47:22', '2025-11-04 13:47:22', NULL, '0.00'),
(10, NULL, 'f09e6528-3359-4861-a5fa-01bc8be64c01', '0.00', '0.00', '0.00', '0.00', '2025-11-04 13:47:22', '2025-11-04 13:47:22', NULL, '0.00'),
(11, NULL, '7cab69b9-9a9d-4ef0-b697-398b1d538724', '0.00', '0.00', '0.00', '0.00', '2025-11-04 13:47:22', '2025-11-04 13:47:22', NULL, '0.00'),
(12, NULL, '7a75ab85-7841-45fc-8697-f8977a55934c', '0.00', '0.00', '0.00', '0.00', '2025-11-04 13:47:22', '2025-11-04 13:47:22', NULL, '0.00'),
(13, NULL, '2de48361-5933-4ed0-8c1e-c0a3537a0306', '406.00', '0.00', '0.00', '406.00', '2025-11-04 14:33:40', '2025-11-04 16:06:33', NULL, '0.00'),
(15, NULL, '0446dea9-6a52-4dc7-87fb-d708bfe95bef', '0.00', '0.00', '0.00', '0.00', '2025-11-06 19:19:08', '2025-11-06 19:19:08', NULL, '0.00'),
(16, NULL, '4b3b3493-6d98-4b91-93c3-6b87da62aa94', '0.00', '0.00', '0.00', '0.00', '2025-11-06 19:19:10', '2025-11-06 19:19:10', NULL, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL DEFAULT '1',
  `unit_price` decimal(10,2) NOT NULL,
  `line_total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `cart_id`, `product_id`, `quantity`, `unit_price`, `line_total`, `created_at`, `updated_at`) VALUES
(1, 1, 139, 8, '257.35', '2058.80', '2025-10-27 21:09:58', '2025-10-27 21:13:40'),
(2, 1, 122, 3, '66.30', '198.90', '2025-10-27 21:10:03', '2025-10-27 21:10:11'),
(3, 1, 140, 9, '83.76', '753.84', '2025-10-27 21:13:13', '2025-10-27 21:13:19'),
(8, 4, 139, 8, '257.35', '2058.80', '2025-10-28 05:09:47', '2025-10-28 05:25:54'),
(9, 4, 142, 2, '192.78', '385.56', '2025-10-28 05:10:00', '2025-10-28 05:10:04'),
(10, 4, 73, 3, '185.34', '556.02', '2025-10-28 05:13:10', '2025-10-28 05:13:12'),
(11, 4, 74, 6, '127.47', '764.82', '2025-10-28 05:13:15', '2025-10-28 05:13:22'),
(12, 4, 141, 1, '202.01', '202.01', '2025-10-28 05:13:57', '2025-10-28 05:13:57'),
(13, 4, 128, 1, '256.44', '256.44', '2025-10-28 05:14:02', '2025-10-28 05:14:02'),
(14, 4, 1, 3, '289.38', '868.14', '2025-10-28 05:15:35', '2025-10-28 05:15:37'),
(15, 4, 4, 1, '241.35', '241.35', '2025-10-28 05:15:43', '2025-10-28 05:15:43'),
(16, 4, 5, 3, '95.49', '286.47', '2025-10-28 05:15:46', '2025-10-28 05:15:47'),
(17, 4, 6, 2, '79.13', '158.26', '2025-10-28 05:15:48', '2025-10-28 05:15:49'),
(18, 4, 10, 2, '261.77', '523.54', '2025-10-28 05:15:51', '2025-10-28 05:15:52'),
(19, 4, 122, 4, '66.30', '265.20', '2025-10-28 05:25:55', '2025-10-28 05:25:57'),
(20, 4, 97, 2, '251.73', '503.46', '2025-10-28 05:25:58', '2025-10-28 05:26:00'),
(22, 6, 139, 4, '257.35', '1029.40', '2025-11-03 13:20:54', '2025-11-06 19:57:47'),
(23, 7, 139, 1, '257.35', '257.35', '2025-11-04 13:47:22', '2025-11-04 13:47:22'),
(24, 11, 139, 1, '257.35', '257.35', '2025-11-04 13:47:22', '2025-11-04 13:47:22'),
(25, 8, 139, 1, '257.35', '257.35', '2025-11-04 13:47:22', '2025-11-04 13:47:22'),
(26, 12, 139, 1, '257.35', '257.35', '2025-11-04 13:47:22', '2025-11-04 13:47:22'),
(28, 10, 139, 1, '257.35', '257.35', '2025-11-04 13:47:22', '2025-11-04 13:47:22'),
(73, 13, 122, 1, '66.30', '66.30', '2025-11-04 16:05:35', '2025-11-04 16:05:39'),
(74, 13, 97, 1, '251.73', '251.73', '2025-11-04 16:05:37', '2025-11-04 16:05:49'),
(75, 13, 115, 1, '21.28', '21.28', '2025-11-04 16:06:25', '2025-11-04 16:06:25'),
(76, 13, 111, 1, '66.69', '66.69', '2025-11-04 16:06:26', '2025-11-04 16:06:26'),
(79, 15, 139, 1, '257.35', '257.35', '2025-11-06 19:19:09', '2025-11-06 19:19:09'),
(81, 16, 139, 1, '257.35', '257.35', '2025-11-06 19:19:10', '2025-11-06 19:19:10'),
(84, 6, 142, 1, '192.78', '192.78', '2025-11-06 19:57:49', '2025-11-06 20:42:23'),
(85, 6, 122, 3, '66.30', '198.90', '2025-11-06 19:58:01', '2025-11-06 19:58:03');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `slug`, `description`, `image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Quasi quos', 'quasi-quos-7iJT7', 'Vel sed corporis autem nulla eaque sed dicta sint.', NULL, 1, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(2, NULL, 'Inventore et', 'inventore-et-4vPCu', 'Ipsam quo recusandae inventore qui nemo nostrum excepturi.', NULL, 1, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(3, NULL, 'Debitis molestias', 'debitis-molestias-XHrdY', 'Quod et et ut et accusantium voluptatum quos maiores non et velit.', NULL, 1, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(4, NULL, 'Aliquid fugit', 'aliquid-fugit-BcSI1', 'Excepturi iste est corporis rerum sit omnis mollitia aut rerum voluptatum quo et.', NULL, 1, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(5, NULL, 'Aliquid incidunt', 'aliquid-incidunt-PLsMn', 'Dolorum voluptatem recusandae illum sit voluptatem deserunt qui totam quos eaque ipsa.', NULL, 1, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(6, NULL, 'Soluta in', 'soluta-in-qYqzj', 'Voluptatum magnam quia voluptatem illo voluptates a omnis qui.', NULL, 1, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(7, NULL, 'Dicta atque', 'dicta-atque-Yfqj7', 'Quis illum quam iusto voluptates omnis beatae.', NULL, 1, '2025-10-27 21:09:16', '2025-10-27 21:09:16'),
(8, NULL, 'Nesciunt aspernatur', 'nesciunt-aspernatur-il0bn', 'Dolore est ullam impedit ab qui possimus consequuntur sapiente ut quos delectus.', NULL, 1, '2025-10-27 21:09:16', '2025-10-27 21:09:16'),
(9, NULL, 'Voluptatem iste', 'voluptatem-iste-BcjT2', 'Debitis a dolorem quibusdam aliquam dolorem laboriosam unde non placeat id quia eligendi.', NULL, 1, '2025-10-27 21:09:16', '2025-10-27 21:09:16'),
(10, NULL, 'In rerum', 'in-rerum-BacOU', 'Tenetur et explicabo laborum necessitatibus veritatis quis molestiae eaque praesentium dolores.', NULL, 1, '2025-10-27 21:09:16', '2025-10-27 21:09:16'),
(11, NULL, 'Facilis voluptas', 'facilis-voluptas-rLLqK', 'Atque quos quos totam nisi distinctio id maxime sapiente natus consequatur.', NULL, 1, '2025-10-27 21:09:16', '2025-10-27 21:09:16'),
(12, NULL, 'Dolor est', 'dolor-est-c8pnP', 'Recusandae quo distinctio error ut eos sint beatae.', NULL, 1, '2025-10-27 21:09:16', '2025-10-27 21:09:16');

-- --------------------------------------------------------

--
-- Table structure for table `coin_settings`
--

CREATE TABLE `coin_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `coins_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `add_to_cart_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `order_award_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `cod_bonus_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `referral_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `add_to_cart_award` int UNSIGNED NOT NULL DEFAULT '1',
  `add_to_cart_daily_cap` int UNSIGNED NOT NULL DEFAULT '10',
  `order_rate_per` int UNSIGNED NOT NULL DEFAULT '100',
  `order_rate_coins` int UNSIGNED NOT NULL DEFAULT '1',
  `order_min_award` int UNSIGNED NOT NULL DEFAULT '1',
  `cod_bonus` int UNSIGNED NOT NULL DEFAULT '1',
  `referral_signup_bonus` int UNSIGNED NOT NULL DEFAULT '10',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coin_settings`
--

INSERT INTO `coin_settings` (`id`, `coins_enabled`, `add_to_cart_enabled`, `order_award_enabled`, `cod_bonus_enabled`, `referral_enabled`, `add_to_cart_award`, `add_to_cart_daily_cap`, `order_rate_per`, `order_rate_coins`, `order_min_award`, `cod_bonus`, `referral_signup_bonus`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 1, 1, 10, 100, 1, 1, 1, 10, '2025-11-03 12:00:19', '2025-11-06 20:34:22');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `type` enum('percentage','fixed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `minimum_amount` decimal(10,2) DEFAULT NULL,
  `maximum_discount` decimal(10,2) DEFAULT NULL,
  `usage_limit` int DEFAULT NULL,
  `usage_limit_per_user` int DEFAULT NULL,
  `starts_at` date DEFAULT NULL,
  `expires_at` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `applicable_categories` json DEFAULT NULL,
  `applicable_products` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `name`, `description`, `type`, `value`, `minimum_amount`, `maximum_discount`, `usage_limit`, `usage_limit_per_user`, `starts_at`, `expires_at`, `is_active`, `applicable_categories`, `applicable_products`, `created_at`, `updated_at`) VALUES
(1, 'WELCOME10', 'Welcome Discount', 'Get 10% off your first order', 'percentage', '10.00', '50.00', '25.00', 100, 1, '2025-10-28', '2026-01-28', 1, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:09:20'),
(2, 'SAVE20', 'Save $20', 'Get $20 off orders over $100', 'fixed', '20.00', '100.00', NULL, 50, 2, '2025-10-28', '2025-12-28', 1, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:09:20'),
(3, 'FREESHIP', 'Free Shipping', 'Free shipping on any order', 'fixed', '10.00', NULL, NULL, 200, 3, '2025-10-28', '2026-10-28', 1, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:09:20'),
(4, 'HOLIDAY25', 'Holiday Special', '25% off for holiday season', 'percentage', '25.00', '75.00', '50.00', 30, 1, '2025-10-28', '2025-11-27', 1, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:09:20'),
(5, 'STUDENT15', 'Student Discount', '15% off for students', 'percentage', '15.00', '30.00', '30.00', NULL, 5, '2025-10-28', '2026-04-28', 1, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:09:20');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_usages`
--

CREATE TABLE `coupon_usages` (
  `id` bigint UNSIGNED NOT NULL,
  `coupon_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precision` tinyint UNSIGNED NOT NULL DEFAULT '2',
  `thousand_separator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',',
  `decimal_separator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '.',
  `symbol_first` tinyint(1) NOT NULL DEFAULT '1',
  `rate` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `symbol`, `precision`, `thousand_separator`, `decimal_separator`, `symbol_first`, `rate`, `is_active`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'BDT', 'Bangladeshi Taka', '৳', 2, ',', '.', 1, '110.00000000', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(2, 'USD', 'US Dollar', '$', 2, ',', '.', 1, '1.00000000', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(3, 'EUR', 'Euro', '€', 2, '.', ',', 1, '0.92000000', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(4, 'GBP', 'British Pound', '£', 2, ',', '.', 1, '0.78000000', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36');

-- --------------------------------------------------------

--
-- Table structure for table `email_settings`
--

CREATE TABLE `email_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_settings`
--

INSERT INTO `email_settings` (`id`, `key`, `name`, `value`, `description`, `created_at`, `updated_at`) VALUES
(1, 'from_name', 'From Name', 'eCommerce Store', 'The name that appears in the \"From\" field of emails', '2025-10-27 21:07:31', '2025-10-27 21:07:31'),
(2, 'from_email', 'From Email', 'noreply@ecommercestore.com', 'The email address that appears in the \"From\" field of emails', '2025-10-27 21:07:31', '2025-10-27 21:07:31'),
(3, 'order_confirmation_enabled', 'Order Confirmation Emails', '1', 'Send confirmation emails when orders are placed', '2025-10-27 21:07:31', '2025-10-27 21:07:31'),
(4, 'order_status_update_enabled', 'Order Status Update Emails', '1', 'Send emails when order status is updated', '2025-10-27 21:07:31', '2025-10-27 21:07:31');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guest_wishlists`
--

CREATE TABLE `guest_wishlists` (
  `id` bigint UNSIGNED NOT NULL,
  `session_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guest_wishlists`
--

INSERT INTO `guest_wishlists` (`id`, `session_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, '36d19f84-6cfe-4e67-b735-eab3205f824f', 142, '2025-11-04 13:53:18', '2025-11-04 13:53:18'),
(2, '5c8c2412-1590-4928-a4ef-b73019a555b9', 142, '2025-11-04 13:53:18', '2025-11-04 13:53:18'),
(4, '3bb21f9a-97ee-4ca4-ba88-69ca1e2063e0', 142, '2025-11-04 13:53:18', '2025-11-04 13:53:18'),
(5, 'ea6fd2cc-8e7e-43c4-871a-2934fe1314c5', 142, '2025-11-04 13:53:18', '2025-11-04 13:53:18'),
(6, 'ed3cf31e-64d8-43c7-b81c-57e7df231bbd', 142, '2025-11-04 13:53:18', '2025-11-04 13:53:18'),
(39, 'd5683688-9d7b-42fb-b4d3-271012e226df', 139, '2025-11-04 13:55:52', '2025-11-04 13:55:52'),
(48, 'd5683688-9d7b-42fb-b4d3-271012e226df', 142, '2025-11-04 13:55:57', '2025-11-04 13:55:57'),
(49, 'd5683688-9d7b-42fb-b4d3-271012e226df', 122, '2025-11-04 13:59:35', '2025-11-04 13:59:35'),
(50, 'd5683688-9d7b-42fb-b4d3-271012e226df', 97, '2025-11-04 13:59:39', '2025-11-04 13:59:39'),
(63, 'ae906038-ed76-4baf-95e4-5b74bc4d7910', 139, '2025-11-04 16:05:32', '2025-11-04 16:05:32'),
(64, 'ae906038-ed76-4baf-95e4-5b74bc4d7910', 122, '2025-11-04 16:05:34', '2025-11-04 16:05:34');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"d919ff7f-5c1c-4b22-942d-28752a8a9280\",\"displayName\":\"App\\\\Notifications\\\\OrderConfirmation\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:2;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:35:\\\"App\\\\Notifications\\\\OrderConfirmation\\\":2:{s:8:\\\"\\u0000*\\u0000order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"938fb8c7-0cc2-4fd2-9b82-e875bb9560aa\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"},\"createdAt\":1762192819,\"delay\":null}', 0, NULL, 1762192819, 1762192819),
(2, 'default', '{\"uuid\":\"6184333d-4e0e-4f02-9c34-a51c57ee8bdd\",\"displayName\":\"App\\\\Notifications\\\\OrderConfirmation\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:3;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:35:\\\"App\\\\Notifications\\\\OrderConfirmation\\\":2:{s:8:\\\"\\u0000*\\u0000order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:8;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"2b3f746e-e935-4ad4-925a-e9577fe8a31a\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"},\"createdAt\":1762293895,\"delay\":null}', 0, NULL, 1762293895, 1762293895);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_10_23_183914_create_categories_table', 1),
(5, '2025_10_23_183914_create_products_table', 1),
(6, '2025_10_23_183915_create_product_images_table', 1),
(7, '2025_10_23_183916_create_carts_table', 1),
(8, '2025_10_23_183917_create_orders_table', 1),
(9, '2025_10_23_183918_create_order_items_table', 1),
(10, '2025_10_23_183919_create_cart_items_table', 1),
(11, '2025_10_23_190126_create_admins_table', 1),
(12, '2025_10_23_192021_create_permission_tables', 1),
(13, '2025_10_23_202744_create_personal_access_tokens_table', 1),
(14, '2025_10_23_211855_create_user_addresses_table', 1),
(15, '2025_10_23_212524_create_email_settings_table', 1),
(16, '2025_10_23_213639_create_coupons_table', 1),
(17, '2025_10_23_213657_create_coupon_usages_table', 1),
(18, '2025_10_23_213716_add_coupon_fields_to_carts_table', 1),
(19, '2025_10_23_215402_create_payment_gateway_settings_table', 1),
(20, '2025_10_23_215408_create_payment_logs_table', 1),
(21, '2025_10_23_221538_create_newsletter_subscribers_table', 1),
(22, '2025_10_23_221549_create_newsletter_settings_table', 1),
(23, '2025_10_23_223108_create_currencies_table', 1),
(24, '2025_10_23_233551_create_otp_codes_table', 1),
(25, '2025_10_23_234439_create_otp_settings_table', 1),
(26, '2025_10_24_000001_update_users_email_nullable_and_phone_unique', 1),
(27, '2025_10_24_120000_create_site_settings_table', 1),
(28, '2025_10_24_130000_add_coins_to_users_and_create_user_points_table', 1),
(29, '2025_10_24_131000_create_coin_settings_table', 1),
(30, '2025_10_24_132000_add_referral_fields_to_users_table', 1),
(31, '2025_10_24_134000_create_shipping_settings_table', 1),
(32, '2025_11_03_000500_add_slug_to_users_table', 2),
(33, '2025_11_04_120000_create_wishlists_table', 3),
(34, '2025_11_04_120100_add_wishlist_enabled_to_site_settings', 3),
(35, '2025_11_04_120200_create_guest_wishlists_table', 3),
(37, '2025_11_07_022251_add_review_settings_to_site_settings_table', 4),
(39, '2025_11_07_022231_create_product_reviews_table', 5),
(40, '2025_11_07_023046_add_newsletter_settings_to_site_settings_table', 6),
(41, '2025_11_07_024826_add_customer_service_links_to_site_settings_table', 7),
(42, '2025_11_07_025029_create_pages_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_settings`
--

CREATE TABLE `newsletter_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `double_opt_in` tinyint(1) NOT NULL DEFAULT '0',
  `send_welcome_email` tinyint(1) NOT NULL DEFAULT '0',
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `provider_config` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletter_settings`
--

INSERT INTO `newsletter_settings` (`id`, `enabled`, `double_opt_in`, `send_welcome_email`, `provider`, `provider_config`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, 'local', NULL, '2025-10-28 05:16:08', '2025-10-28 05:16:08');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscribers`
--

CREATE TABLE `newsletter_subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscribed_at` timestamp NULL DEFAULT NULL,
  `unsubscribed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletter_subscribers`
--

INSERT INTO `newsletter_subscribers` (`id`, `email`, `name`, `status`, `source`, `token`, `subscribed_at`, `unsubscribed_at`, `created_at`, `updated_at`) VALUES
(1, 'needyamin@gmail.com', NULL, 'subscribed', 'footer', '6559af5d-460a-4063-81a8-ee65f03a8fca', '2025-10-28 05:16:20', NULL, '2025-10-28 05:16:20', '2025-10-28 05:16:20');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `subtotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `grand_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `shipping_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unshipped',
  `billing_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_postcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_postcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `number`, `user_id`, `status`, `subtotal`, `discount_total`, `tax_total`, `shipping_total`, `grand_total`, `currency`, `payment_method`, `payment_status`, `shipping_method`, `shipping_status`, `billing_name`, `billing_email`, `billing_phone`, `billing_address`, `billing_city`, `billing_postcode`, `billing_country`, `shipping_name`, `shipping_phone`, `shipping_address`, `shipping_city`, `shipping_postcode`, `shipping_country`, `created_at`, `updated_at`) VALUES
(1, 'KG9GYYLR4I', NULL, 'pending', '218.16', '0.00', '0.00', '0.00', '218.16', 'USD', 'cod', 'unpaid', NULL, 'unshipped', 'Yamin', 'needyamin@gmail.com', '01878578504', 'Dhaka', 'Dhaka', '7400', 'United States', NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-27 21:59:07', '2025-10-27 21:59:07'),
(2, 'KG9GYYLR4Is', NULL, 'pending', '218.16', '0.00', '0.00', '0.00', '218.16', 'USD', 'cod', 'unpaid', NULL, 'unshipped', 'Yamin', 'needyamin@gmail.com', '01878578504', 'Dhaka', 'Dhaka', '7400', 'United States', NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-27 21:59:07', '2025-10-27 21:59:07'),
(3, 'RIBUQN49OX', NULL, 'pending', '514.70', '0.00', '0.00', '0.00', '514.70', 'USD', 'cod', 'unpaid', NULL, 'unshipped', 'Yamin', 'needyamin@gmail.com', '01878578504', 'Dhaka', 'Dhaka', '7400', 'United States', NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-27 22:04:46', '2025-10-27 22:04:46'),
(4, 'VQUSBNR98F', 2, 'pending', '514.70', '0.00', '0.00', '0.00', '514.70', 'USD', 'cod', 'unpaid', NULL, 'unshipped', 'Md Yamin', 'admins@example.com', 'Hossain', NULL, NULL, NULL, 'United States', NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-03 12:00:18', '2025-11-03 12:00:18'),
(5, 'POS-20251104-214218-583', 3, 'processing', '107544.80', '0.00', '0.00', '0.00', '107544.80', 'BDT', NULL, 'paid', NULL, 'unshipped', 'Md Yamin Hossain', 'needyamin@gmail.com', '018785785041', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-04 15:42:18', '2025-11-04 15:42:18'),
(6, 'POS-20251104-214400-301', 3, 'processing', '107544.80', '0.00', '0.00', '0.00', '107544.80', 'BDT', NULL, 'paid', NULL, 'unshipped', 'Md Yamin Hossain', 'needyamin@gmail.com', '018785785041', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-04 15:44:00', '2025-11-04 15:44:00'),
(7, 'POS-20251104-215225-464', 3, 'processing', '222504.70', '20.00', '0.03', '0.10', '222484.83', 'BDT', NULL, 'paid', NULL, 'unshipped', 'Md Yamin Hossain', '', '018785785041', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-04 15:52:25', '2025-11-04 15:52:25'),
(8, 'HNTWWCHC1B', 3, 'pending', '322.24', '0.00', '0.00', '0.00', '322.24', 'USD', 'cod', 'unpaid', NULL, 'unshipped', 'Md Yamin Hossain', 'needyamin@gmail.com', '018785785041', NULL, 'Dhaka', '7400', 'Canada', NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-04 16:04:55', '2025-11-04 16:04:55');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `line_total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `product_sku`, `quantity`, `unit_price`, `line_total`, `created_at`, `updated_at`) VALUES
(1, 1, 138, 'Enim harum quam', 'RZUDKL4P', 1, '218.16', '218.16', '2025-10-27 21:59:07', '2025-10-27 21:59:07'),
(2, 3, 139, 'Fugit libero non', '6UYOLIHY', 2, '257.35', '514.70', '2025-10-27 22:04:46', '2025-10-27 22:04:46'),
(3, 4, 139, 'Fugit libero non', '6UYOLIHY', 2, '257.35', '514.70', '2025-11-03 12:00:18', '2025-11-03 12:00:18'),
(4, 5, 142, 'Tempora ea et', 'LG1V7BGA', 1, '21205.80', '21205.80', '2025-11-04 15:42:18', '2025-11-04 15:42:18'),
(5, 5, 143, 'Aperiam dolor nemo', 'YNUFC6HG', 10, '8633.90', '86339.00', '2025-11-04 15:42:18', '2025-11-04 15:42:18'),
(6, 6, 142, 'Tempora ea et', 'LG1V7BGA', 1, '21205.80', '21205.80', '2025-11-04 15:44:00', '2025-11-04 15:44:00'),
(7, 6, 143, 'Aperiam dolor nemo', 'YNUFC6HG', 10, '8633.90', '86339.00', '2025-11-04 15:44:00', '2025-11-04 15:44:00'),
(8, 7, 143, 'Aperiam dolor nemo', 'YNUFC6HG', 1, '8633.90', '8633.90', '2025-11-04 15:52:25', '2025-11-04 15:52:25'),
(9, 7, 142, 'Tempora ea et', 'LG1V7BGA', 10, '21205.80', '212058.00', '2025-11-04 15:52:25', '2025-11-04 15:52:25'),
(10, 7, 144, 'Non quia vel', 'CRVV432G', 1, '1812.80', '1812.80', '2025-11-04 15:52:25', '2025-11-04 15:52:25'),
(11, 8, 60, 'Et repellendus est', '2AFXOSZT', 1, '287.05', '287.05', '2025-11-04 16:04:55', '2025-11-04 16:04:55'),
(12, 8, 107, 'Explicabo et maiores', 'L7INGTZR', 1, '35.19', '35.19', '2025-11-04 16:04:55', '2025-11-04 16:04:55');

-- --------------------------------------------------------

--
-- Table structure for table `otp_codes`
--

CREATE TABLE `otp_codes` (
  `id` bigint UNSIGNED NOT NULL,
  `otptable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otptable_id` bigint UNSIGNED DEFAULT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'login',
  `expires_at` timestamp NOT NULL,
  `used_at` timestamp NULL DEFAULT NULL,
  `attempts` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otp_settings`
--

CREATE TABLE `otp_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `email_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `sms_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `length` tinyint UNSIGNED NOT NULL DEFAULT '6',
  `ttl_minutes` tinyint UNSIGNED NOT NULL DEFAULT '10',
  `max_attempts` tinyint UNSIGNED NOT NULL DEFAULT '5',
  `sms_gateway` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_masking` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_api_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_api_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_sender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `otp_settings`
--

INSERT INTO `otp_settings` (`id`, `email_enabled`, `sms_enabled`, `length`, `ttl_minutes`, `max_attempts`, `sms_gateway`, `sms_masking`, `sms_api_url`, `sms_api_key`, `sms_username`, `sms_password`, `sms_sender`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 6, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-06 20:32:24', '2025-11-06 20:32:24');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `content`, `meta_title`, `meta_description`, `meta_keywords`, `is_active`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Help Center', 'help-center', '<h2>Welcome to Our Help Center</h2>\n<p>We are here to help you with any questions or concerns you may have. Below you will find answers to the most frequently asked questions.</p>\n\n<h3>Frequently Asked Questions</h3>\n\n<h4>How do I place an order?</h4>\n<p>Placing an order is easy! Simply browse our products, add items to your cart, and proceed to checkout. You can pay using various payment methods including credit cards, PayPal, or Cash on Delivery.</p>\n\n<h4>How can I track my order?</h4>\n<p>Once your order is shipped, you will receive a tracking number via email. You can use this tracking number to monitor your package\'s journey to your doorstep.</p>\n\n<h4>What if I forgot my password?</h4>\n<p>Click on the \"Forgot Password\" link on the login page. Enter your email address and we\'ll send you instructions to reset your password.</p>\n\n<h4>How do I update my account information?</h4>\n<p>You can update your account information by logging into your account and visiting the Profile section. From there, you can edit your personal details, shipping addresses, and more.</p>\n\n<h4>Do you offer international shipping?</h4>\n<p>Currently, we ship to select countries. Please check our Shipping Info page for more details about shipping destinations and rates.</p>\n\n<h3>Still Need Help?</h3>\n<p>If you can\'t find the answer you\'re looking for, please don\'t hesitate to <a href=\"/page/contact-us\">contact us</a>. Our customer service team is available to assist you.</p>', 'Help Center - Frequently Asked Questions', 'Find answers to frequently asked questions about ordering, shipping, returns, and more.', 'help center, FAQ, customer support, questions, answers', 1, 1, '2025-11-06 20:55:50', '2025-11-06 20:55:50'),
(2, 'Shipping Info', 'shipping-info', '<h2>Shipping Information</h2><p>\r\n</p><p>We want to make sure your order arrives safely and on time. Here\'s everything you need to know about our shipping policies.</p><p>\r\n\r\n</p><h3>Shipping Methods</h3><p>\r\n</p><p>We offer several shipping options to meet your needs:</p><p>\r\n</p><p><br></p><p>\r\n\r\n</p><h3>Shipping Rates\r\n\r\n</h3><h3>Processing Time</h3><p>\r\n</p><p>Orders are typically processed within 1-2 business days. During peak seasons or sales, processing may take up to 3 business days.</p><p>\r\n\r\n</p><h3>International Shipping</h3><p>\r\n</p><p>We currently ship to the following countries:</p><p>\r\n</p><p><br></p><p>\r\n</p><p>International shipping rates vary by destination and are calculated at checkout.</p><p>\r\n\r\n</p><h3>Order Tracking</h3><p>\r\n</p><p>Once your order ships, you\'ll receive a tracking number via email. You can use this number to track your package on the carrier\'s website.</p><p>\r\n\r\n</p><h3>Shipping Restrictions</h3><p>\r\n</p><p>Some items may have shipping restrictions due to size, weight, or regulations. These restrictions will be noted on the product page.</p><p>\r\n\r\n</p><h3>Questions?\r\n</h3><p>If you have any questions about shipping, please <a href=\"/page/contact-us\">contact our customer service team</a>.</p>', 'Shipping Information - Delivery Options & Rates', 'Learn about our shipping methods, rates, processing times, and international shipping options.', 'shipping, delivery, shipping rates, shipping methods, international shipping', 1, 2, '2025-11-06 20:55:50', '2025-11-06 21:00:55'),
(3, 'Returns', 'returns', '<h2>Returns & Refunds Policy</h2>\n<p>We want you to be completely satisfied with your purchase. If you\'re not happy with your order, we\'re here to help.</p>\n\n<h3>Return Policy</h3>\n<p>You have <strong>30 days</strong> from the date of delivery to return items for a full refund or exchange.</p>\n\n<h3>Eligible Items</h3>\n<p>Items must be:</p>\n<ul>\n    <li>Unused and in original condition</li>\n    <li>In original packaging with all tags attached</li>\n    <li>Accompanied by proof of purchase</li>\n</ul>\n\n<h3>Non-Returnable Items</h3>\n<p>The following items cannot be returned:</p>\n<ul>\n    <li>Personalized or customized products</li>\n    <li>Items damaged by misuse or normal wear</li>\n    <li>Items without proof of purchase</li>\n    <li>Digital products or downloadable content</li>\n    <li>Gift cards</li>\n</ul>\n\n<h3>How to Return an Item</h3>\n<ol>\n    <li>Log into your account and go to \"My Orders\"</li>\n    <li>Select the order containing the item you want to return</li>\n    <li>Click \"Request Return\" and select the items</li>\n    <li>Print the return label provided</li>\n    <li>Package the item securely with the return label</li>\n    <li>Drop off at any authorized carrier location</li>\n</ol>\n\n<h3>Return Shipping</h3>\n<p>Return shipping costs are the responsibility of the customer unless the item was defective or incorrect. If you received a wrong or defective item, we\'ll cover the return shipping costs.</p>\n\n<h3>Refund Process</h3>\n<p>Once we receive your return:</p>\n<ul>\n    <li>We\'ll inspect the item within 2-3 business days</li>\n    <li>If approved, your refund will be processed</li>\n    <li>Refunds are issued to the original payment method</li>\n    <li>You\'ll receive your refund within 5-10 business days</li>\n</ul>\n\n<h3>Exchanges</h3>\n<p>We currently don\'t offer direct exchanges. To exchange an item:</p>\n<ol>\n    <li>Return the original item following the return process</li>\n    <li>Place a new order for the item you want</li>\n</ol>\n\n<h3>Damaged or Defective Items</h3>\n<p>If you receive a damaged or defective item, please contact us immediately. We\'ll arrange for a replacement or full refund, including return shipping costs.</p>\n\n<h3>Questions?</h3>\n<p>If you have questions about returns or need assistance, please <a href=\"/page/contact-us\">contact us</a>. Our customer service team is happy to help!</p>', 'Returns & Refunds Policy - Easy Returns', 'Learn about our return policy, how to return items, refund process, and return shipping information.', 'returns, refunds, return policy, exchange, return shipping', 1, 3, '2025-11-06 20:55:50', '2025-11-06 20:55:50'),
(4, 'Contact Us', 'contact-us', '<h2>Get in Touch</h2>\n<p>We\'d love to hear from you! Whether you have a question, feedback, or need assistance, our team is here to help.</p>\n\n<h3>Contact Information</h3>\n<div class=\"row\">\n    <div class=\"col-md-6\">\n        <h4><i class=\"bi bi-envelope\"></i> Email</h4>\n        <p>For general inquiries: <a href=\"mailto:support@example.com\">support@example.com</a></p>\n        <p>For business inquiries: <a href=\"mailto:business@example.com\">business@example.com</a></p>\n    </div>\n    <div class=\"col-md-6\">\n        <h4><i class=\"bi bi-telephone\"></i> Phone</h4>\n        <p>Customer Service: <strong>1-800-123-4567</strong></p>\n        <p>Hours: Monday - Friday, 9:00 AM - 6:00 PM EST</p>\n    </div>\n</div>\n\n<h3>Office Address</h3>\n<p>\n    <strong>eCommerce Store</strong><br>\n    123 Commerce Street<br>\n    Business City, BC 12345<br>\n    United States\n</p>\n\n<h3>Response Time</h3>\n<p>We aim to respond to all inquiries within 24-48 hours during business days. For urgent matters, please call our customer service line.</p>\n\n<h3>Social Media</h3>\n<p>Follow us on social media for updates, promotions, and more:</p>\n<ul>\n    <li><strong>Facebook:</strong> <a href=\"#\" target=\"_blank\">@ecommercestore</a></li>\n    <li><strong>Twitter:</strong> <a href=\"#\" target=\"_blank\">@ecommercestore</a></li>\n    <li><strong>Instagram:</strong> <a href=\"#\" target=\"_blank\">@ecommercestore</a></li>\n    <li><strong>LinkedIn:</strong> <a href=\"#\" target=\"_blank\">eCommerce Store</a></li>\n</ul>\n\n<h3>Frequently Asked Questions</h3>\n<p>Before contacting us, you might find the answer in our <a href=\"/page/help-center\">Help Center</a> or <a href=\"/page/shipping-info\">Shipping Info</a> pages.</p>\n\n<h3>Feedback</h3>\n<p>We value your feedback! If you have suggestions on how we can improve our service, please don\'t hesitate to reach out. Your input helps us serve you better.</p>', 'Contact Us - Get in Touch', 'Contact our customer service team via email, phone, or visit our office. We\'re here to help!', 'contact, customer service, support, email, phone, address', 1, 4, '2025-11-06 20:55:50', '2025-11-06 20:55:50');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway_settings`
--

CREATE TABLE `payment_gateway_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `gateway` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_encrypted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateway_settings`
--

INSERT INTO `payment_gateway_settings` (`id`, `gateway`, `key`, `value`, `description`, `is_encrypted`, `created_at`, `updated_at`) VALUES
(1, 'stripe', 'enabled', '0', 'Enable or disable Stripe payment gateway', 0, '2025-10-27 21:07:36', '2025-10-27 21:09:20'),
(2, 'stripe', 'publishable_key', '', 'Stripe publishable key (starts with pk_)', 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(3, 'stripe', 'secret_key', '', 'Stripe secret key (starts with sk_)', 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(4, 'stripe', 'webhook_secret', '', 'Stripe webhook endpoint secret', 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(5, 'paypal', 'enabled', '0', 'Enable or disable PayPal payment gateway', 0, '2025-10-27 21:07:36', '2025-10-27 21:09:20'),
(6, 'paypal', 'client_id', '', 'PayPal application client ID', 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(7, 'paypal', 'client_secret', '', 'PayPal application client secret', 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(8, 'paypal', 'sandbox_mode', '1', 'Use PayPal sandbox for testing', 0, '2025-10-27 21:07:36', '2025-10-27 21:09:20'),
(9, 'cod', 'enabled', '1', 'Enable or disable Cash on Delivery payment method', 0, '2025-11-06 20:37:51', '2025-11-06 20:38:45');

-- --------------------------------------------------------

--
-- Table structure for table `payment_logs`
--

CREATE TABLE `payment_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `gateway` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin.dashboard', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(2, 'admin.categories.index', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(3, 'admin.categories.create', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(4, 'admin.categories.store', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(5, 'admin.categories.show', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(6, 'admin.categories.edit', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(7, 'admin.categories.update', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(8, 'admin.categories.destroy', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(9, 'admin.products.index', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(10, 'admin.products.create', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(11, 'admin.products.store', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(12, 'admin.products.show', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(13, 'admin.products.edit', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(14, 'admin.products.update', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(15, 'admin.products.destroy', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(16, 'admin.orders.index', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(17, 'admin.orders.show', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(18, 'admin.orders.update', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(19, 'admin.users.index', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(20, 'admin.users.show', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(21, 'admin.users.edit', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(22, 'admin.users.update', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(23, 'admin.users.destroy', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(24, 'admin.users.reset-password', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(25, 'admin.users.toggle-status', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(26, 'admin.email-settings.index', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(27, 'admin.email-settings.update', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(28, 'admin.roles.index', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(29, 'admin.roles.create', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(30, 'admin.roles.store', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(31, 'admin.roles.edit', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(32, 'admin.roles.update', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(33, 'admin.roles.destroy', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(34, 'admin.permissions.index', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(35, 'admin.permissions.create', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(36, 'admin.permissions.store', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(37, 'admin.permissions.edit', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(38, 'admin.permissions.update', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(39, 'admin.permissions.destroy', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(40, 'admin.payment-gateways.index', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(41, 'admin.payment-gateways.show', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(42, 'admin.payment-gateways.update', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(43, 'admin.payment-gateways.toggle-status', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(44, 'admin.payment-gateways.test', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(45, 'admin.currencies.index', 'admin', '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(46, 'admin.currencies.create', 'admin', '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(47, 'admin.currencies.store', 'admin', '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(48, 'admin.currencies.edit', 'admin', '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(49, 'admin.currencies.update', 'admin', '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(50, 'admin.currencies.destroy', 'admin', '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(51, 'admin.currencies.toggle', 'admin', '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(52, 'admin.currencies.default', 'admin', '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(53, 'admin.admins.create', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(54, 'admin.admins.destroy', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(55, 'admin.admins.edit', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(56, 'admin.admins.index', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(57, 'admin.admins.store', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(58, 'admin.admins.update', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(59, 'admin.coin-settings.index', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(60, 'admin.coin-settings.update', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(61, 'admin.coupons.create', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(62, 'admin.coupons.destroy', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(63, 'admin.coupons.edit', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(64, 'admin.coupons.index', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(65, 'admin.coupons.show', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(66, 'admin.coupons.store', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(67, 'admin.coupons.toggle-status', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(68, 'admin.coupons.update', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(69, 'admin.logout', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(70, 'admin.newsletter.destroy', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(71, 'admin.newsletter.index', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(72, 'admin.newsletter.settings.update', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(73, 'admin.newsletter.toggle', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(74, 'admin.otp-settings.index', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(75, 'admin.otp-settings.update', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(76, 'admin.shipping-settings.index', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(77, 'admin.shipping-settings.update', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(78, 'admin.site-settings.index', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(79, 'admin.site-settings.update', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(80, 'admin.users.coins.adjust', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(81, 'admin.users.coins.reset', 'admin', '2025-11-04 13:44:54', '2025-11-04 13:44:54'),
(82, 'admin.activities.carts', 'admin', '2025-11-04 14:38:04', '2025-11-04 14:38:04'),
(83, 'admin.activities.wishlists', 'admin', '2025-11-04 14:38:04', '2025-11-04 14:38:04'),
(84, 'admin.activities.sessions', 'admin', '2025-11-04 14:49:11', '2025-11-04 14:49:11'),
(85, 'admin.activities.sessions.destroy', 'admin', '2025-11-04 14:49:11', '2025-11-04 14:49:11'),
(86, 'admin.activities.sessions.destroy-user', 'admin', '2025-11-04 14:49:11', '2025-11-04 14:49:11'),
(87, 'admin.orders.create', 'admin', '2025-11-04 14:58:28', '2025-11-04 14:58:28'),
(88, 'admin.orders.store', 'admin', '2025-11-04 14:58:28', '2025-11-04 14:58:28'),
(89, 'admin.coupons.preview', 'admin', '2025-11-04 15:24:44', '2025-11-04 15:24:44'),
(90, 'admin.products.json', 'admin', '2025-11-04 15:24:44', '2025-11-04 15:24:44'),
(91, 'admin.products.lookup', 'admin', '2025-11-04 15:24:44', '2025-11-04 15:24:44'),
(92, 'admin.users.lookup', 'admin', '2025-11-04 15:24:44', '2025-11-04 15:24:44'),
(93, 'admin.orders.invoice', 'admin', '2025-11-04 15:56:10', '2025-11-04 15:56:10'),
(94, 'admin.datatables', 'admin', '2025-11-06 20:11:39', '2025-11-06 20:11:39'),
(95, 'admin.reviews.index', 'admin', '2025-11-06 20:25:40', '2025-11-06 20:25:40'),
(96, 'admin.reviews.approve', 'admin', '2025-11-06 20:25:40', '2025-11-06 20:25:40'),
(97, 'admin.reviews.reject', 'admin', '2025-11-06 20:25:40', '2025-11-06 20:25:40'),
(98, 'admin.reviews.destroy', 'admin', '2025-11-06 20:25:40', '2025-11-06 20:25:40'),
(99, 'admin.pages.create', 'admin', '2025-11-06 20:54:16', '2025-11-06 20:54:16'),
(100, 'admin.pages.destroy', 'admin', '2025-11-06 20:54:16', '2025-11-06 20:54:16'),
(101, 'admin.pages.edit', 'admin', '2025-11-06 20:54:16', '2025-11-06 20:54:16'),
(102, 'admin.pages.index', 'admin', '2025-11-06 20:54:16', '2025-11-06 20:54:16'),
(103, 'admin.pages.show', 'admin', '2025-11-06 20:54:16', '2025-11-06 20:54:16'),
(104, 'admin.pages.store', 'admin', '2025-11-06 20:54:16', '2025-11-06 20:54:16'),
(105, 'admin.pages.update', 'admin', '2025-11-06 20:54:16', '2025-11-06 20:54:16');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `compare_at_price` decimal(10,2) DEFAULT NULL,
  `stock` int UNSIGNED NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `sku`, `short_description`, `description`, `price`, `compare_at_price`, `stock`, `is_active`, `is_featured`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Magni molestias in', 'magni-molestias-in-SFcAP', 'MJHHBJ9C', 'Rerum ipsum aspernatur dolores aut temporibus explicabo non voluptate nam sequi.', 'Dignissimos minus a dolores ut aut cum quia beatae. Aut error atque eos deserunt et. Deserunt omnis qui facilis accusamus voluptas rerum sint. Sunt voluptatum quam dolores ea. Quibusdam voluptas quae similique est laudantium.', '289.38', NULL, 149, 1, 0, NULL, NULL, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(2, 1, 'Sit iusto officiis', 'sit-iusto-officiis-Hhl1U', '8ZHUUVQZ', 'Ut quo ipsum quaerat in aliquid dolore ut quod sapiente a error cumque unde dicta ratione amet.', 'Ab dicta tempore quis tempora. Voluptatem officiis ducimus eos itaque blanditiis sunt magnam. Necessitatibus et non sed natus accusantium est. Optio commodi vel sit voluptate repudiandae.', '142.31', '147.81', 141, 1, 0, NULL, NULL, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(3, 1, 'Quisquam odio enim', 'quisquam-odio-enim-it6PI', '3XMA45VX', 'Suscipit dolorem et aperiam nam accusamus deserunt est hic minima totam optio dolor vero temporibus qui quibusdam.', 'Architecto adipisci aperiam tempora vel eaque. Nihil ducimus sed non vero. Autem eaque distinctio tempora aut. Et pariatur maiores fugiat placeat. Ipsam similique corrupti consequatur sequi.', '196.21', NULL, 102, 1, 0, NULL, NULL, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(4, 1, 'Commodi sunt sit', 'commodi-sunt-sit-vuORS', 'GIWBOD2P', 'Ipsum dolor provident quas tenetur debitis voluptatibus aut nobis incidunt at.', 'Iure voluptates omnis neque doloremque. Quia enim alias quisquam rerum dignissimos neque. In illum laudantium ducimus. Est velit sed fugit perspiciatis cum. Ut suscipit et officia et eos. Et in sit illum.', '241.35', NULL, 153, 1, 0, NULL, NULL, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(5, 1, 'Non voluptas eaque', 'non-voluptas-eaque-Gevgx', 'ILIVN4DU', 'Vel asperiores ratione quis in velit beatae quis ut.', 'Eos accusamus cumque similique cum. Quo consequatur aliquam porro dolor quod omnis voluptatibus. Et harum accusamus illum et inventore dicta. Nesciunt ullam eos et facere.', '95.49', NULL, 36, 1, 0, NULL, NULL, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(6, 1, 'Mollitia temporibus maiores', 'mollitia-temporibus-maiores-92hM5', 'SP2SRPR8', 'Provident voluptatem voluptatibus minus fugiat fugit voluptatibus distinctio voluptate porro recusandae consectetur architecto quae.', 'Incidunt eveniet natus qui nemo. Amet omnis debitis ad dolore non fugit. Enim natus aliquam tenetur sint omnis provident sed. Architecto suscipit sunt ea cum iste laboriosam. Autem aliquam assumenda consectetur sequi dolor cupiditate. Possimus consequatur nostrum error qui vitae magni.', '79.13', NULL, 138, 1, 0, NULL, NULL, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(7, 1, 'Debitis officiis deleniti', 'debitis-officiis-deleniti-8TwIz', 'KW4LOENW', 'Voluptate suscipit eligendi commodi quia itaque fuga qui velit dolorem.', 'Ut et quae et id est fugiat. Ipsum eos ipsum debitis quo debitis. Animi saepe vel sit eligendi natus et omnis eligendi. Quis sapiente repellat et voluptatibus sit. Natus cupiditate blanditiis error consequatur est quis.', '267.84', '273.10', 23, 1, 0, NULL, NULL, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(8, 1, 'Quas voluptatem beatae', 'quas-voluptatem-beatae-Ijrmq', 'CQBXEK3V', 'Optio aspernatur corrupti corporis velit earum voluptas delectus dolor.', 'Ut reiciendis dignissimos atque. Aut beatae minima veniam consequuntur adipisci ut est sed. Beatae maiores voluptas repellendus maxime quidem corporis vero. Quibusdam incidunt dolor odio recusandae iste eos fugiat.', '267.81', '288.01', 14, 1, 1, NULL, NULL, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(9, 1, 'Consectetur nulla sapiente', 'consectetur-nulla-sapiente-WiSAD', 'V1BJG60A', 'Qui itaque necessitatibus dicta et non dolorem et vero cumque sequi maiores aut facilis hic.', 'Nihil alias illum odit eos vitae a. Aut est et aut sequi non aut et deserunt. Placeat sunt illum laboriosam. Illum vitae voluptatem placeat odio.', '240.78', NULL, 88, 1, 0, NULL, NULL, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(10, 1, 'Et sequi dolores', 'et-sequi-dolores-f2ThN', 'MMD64F9Y', 'Distinctio asperiores autem voluptatem voluptate eos illo dignissimos dignissimos.', 'Eum voluptatem quasi tempore debitis assumenda. Culpa dolores harum culpa itaque voluptates in illum distinctio. Suscipit et ut voluptate animi pariatur laudantium porro temporibus. Dignissimos debitis perferendis ducimus cum incidunt. Quas laborum explicabo omnis delectus corrupti eveniet sed ad.', '261.77', '287.92', 113, 1, 0, NULL, NULL, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(11, 1, 'Aliquam laboriosam ipsam', 'aliquam-laboriosam-ipsam-9Upqp', 'UEVOHUBB', 'Voluptatibus consequatur laudantium et deleniti nesciunt qui impedit deserunt quia ad tempora.', 'Rerum ut nam perferendis eum. Facilis dolorum autem sed cupiditate et corporis. Hic accusamus suscipit illo eos aut et nisi. Atque at occaecati dolores itaque.', '75.84', NULL, 30, 1, 0, NULL, NULL, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(12, 1, 'Aut alias ad', 'aut-alias-ad-zHqMg', 'U8MVHVCO', 'Corporis sit omnis praesentium vel repellendus magni natus maxime.', 'Laborum et qui et consequuntur odio numquam tempore labore. Eum sunt ab beatae eaque nihil vitae. Nostrum placeat provident enim eos tenetur. Et et placeat praesentium voluptas doloremque sit vel ullam.', '61.64', NULL, 4, 1, 0, NULL, NULL, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(13, 2, 'Doloremque quos maiores', 'doloremque-quos-maiores-KjeMk', 'ANLI3R0P', 'Illum soluta est qui eius ut architecto et.', 'Quia facere molestiae quas. Nihil cumque sed dicta enim aut ipsam nihil. Nesciunt ullam ipsam aperiam dolores exercitationem consequatur. Debitis itaque molestias reprehenderit atque ut. Eos laudantium enim quas et doloremque laudantium minus.', '254.89', NULL, 42, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(14, 2, 'Vel quis maxime', 'vel-quis-maxime-RhNiv', '12FYK8MO', 'Nihil officiis consequatur rerum maxime aut consequuntur quia et ad itaque aut.', 'Id consequatur quod laboriosam ut. Nam harum incidunt minima unde quibusdam. Possimus necessitatibus harum dolor corrupti magni. Mollitia fuga et aut magnam omnis aliquid quidem. Dicta corporis odio commodi ipsa corrupti cum.', '50.81', '82.58', 78, 0, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(15, 2, 'Optio repudiandae eos', 'optio-repudiandae-eos-sTUzA', 'MKCTVVFD', 'Quibusdam veniam possimus culpa dolorum voluptas laboriosam sint expedita sint et minus aut fugiat aut sint expedita.', 'Nihil explicabo vero ipsum aut. Nostrum id iure sequi rem. Et excepturi repudiandae neque odio placeat voluptatum laboriosam. Explicabo placeat atque vel dolor modi. Eligendi ab odit libero sit. Sunt sit numquam molestiae est deleniti consequatur iure.', '121.80', NULL, 57, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(16, 2, 'Accusamus est ut', 'accusamus-est-ut-zMng1', 'JE1RG6Z6', 'Quo non molestias at voluptatem autem nulla beatae odit vel rerum ratione reiciendis quas dolorem ab.', 'Nihil recusandae omnis quibusdam eius ipsum. Eos maiores ea eum. Sint similique magnam maxime qui error. Hic sit quo qui aut corporis voluptas. Ut impedit dicta officiis neque quae voluptatem ut est. Qui ut unde at voluptatum quisquam enim.', '28.25', NULL, 167, 1, 1, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(17, 2, 'Aut repellendus non', 'aut-repellendus-non-1xiTy', 'GPWVLNZJ', 'Quis et quasi iure sint saepe beatae dolor accusantium est qui sunt rerum.', 'Culpa in omnis magnam doloremque facilis nulla. Libero expedita occaecati ut velit illo id. Illum perferendis atque rerum sit. Ipsam repudiandae voluptatibus occaecati porro libero. Blanditiis est eum consequatur suscipit quis quod blanditiis. Ut quis voluptatibus perspiciatis sapiente et optio iure.', '219.81', '246.63', 110, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(18, 2, 'Ipsum veniam ut', 'ipsum-veniam-ut-Rlgh0', 'SYZXIVF9', 'Distinctio assumenda quae praesentium ratione omnis molestiae et aut accusantium.', 'Molestias fugit fugit veniam adipisci tenetur est repellendus. Voluptas et sapiente aut alias deserunt. Voluptatum nobis rerum reprehenderit dicta ipsa in voluptatem. Qui aspernatur rerum blanditiis tempore est.', '66.21', NULL, 60, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(19, 2, 'Voluptate neque blanditiis', 'voluptate-neque-blanditiis-6IjwI', 'WNE5D82W', 'Perferendis doloribus harum facilis rerum accusamus et sed tenetur exercitationem est voluptas quia asperiores illum vero.', 'Quis inventore blanditiis adipisci officiis laboriosam accusantium. Doloremque aut excepturi natus rerum. Et culpa quam qui a nobis dolor. Ea placeat voluptatum sequi commodi molestiae.', '87.27', NULL, 37, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(20, 2, 'Qui atque amet', 'qui-atque-amet-huNPg', '0W5QMXVL', 'Aut id blanditiis sed earum nesciunt facere neque quibusdam.', 'Explicabo aut ab nihil delectus earum. Illum dolorum eius aut consequatur ab saepe. Sint odit ex eum itaque. Dolore adipisci labore delectus quae dicta totam autem.', '261.55', NULL, 42, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(21, 2, 'Porro ipsam fugit', 'porro-ipsam-fugit-uPZi2', 'A2BRRSZG', 'Alias quasi ut facere dolor non et ut qui enim recusandae.', 'Inventore occaecati autem omnis pariatur et rem ratione. Ut illo eum laboriosam assumenda et. Est dignissimos accusantium autem deleniti magnam explicabo quam eos. Recusandae voluptas voluptas dolor quia a totam corporis consectetur.', '150.27', '168.66', 11, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(22, 2, 'Dolores nulla maxime', 'dolores-nulla-maxime-ESIz2', 'BRKV7RNR', 'Quae distinctio facilis natus ut aut et quod aut et deleniti ut.', 'Illum ratione fuga qui est rem totam. Libero aut labore aut sit quidem tempore enim. Et soluta in necessitatibus veniam necessitatibus. Corrupti ipsam qui earum consequuntur eum provident adipisci.', '45.89', NULL, 82, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(23, 2, 'Consequatur magni ex', 'consequatur-magni-ex-Tlqou', 'YQ61HIT3', 'Dolores voluptatem fugit labore omnis sed maiores optio nisi atque.', 'Voluptatem sunt nobis nulla et omnis. Exercitationem nostrum qui molestiae. Omnis voluptatem sint cupiditate molestiae. Expedita autem suscipit impedit possimus dolorem labore molestias. Quaerat at et magnam ut.', '216.77', NULL, 56, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(24, 2, 'Enim delectus sequi', 'enim-delectus-sequi-AhJNd', 'CTV2KJTW', 'Inventore nemo aut ab est cupiditate quia labore aut explicabo.', 'Adipisci quia quibusdam a. Praesentium dolores aut quae commodi. Rem tempore magni in repudiandae fuga.', '221.83', '266.30', 56, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(25, 3, 'Et corrupti suscipit', 'et-corrupti-suscipit-Bqoyd', 'D1L7L2QI', 'Recusandae velit quisquam a debitis aut aliquid officiis perferendis excepturi molestiae eos id quisquam repellendus pariatur.', 'Sint in et sunt amet. Ipsum maxime cumque veniam voluptas velit ad. Illo pariatur necessitatibus ullam inventore. Aliquid non sequi voluptates quas.', '153.10', NULL, 18, 0, 1, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(26, 3, 'Adipisci culpa et', 'adipisci-culpa-et-WfmKf', 'JXUOLI7H', 'Optio molestiae illum quo nostrum dolorum hic eum optio aperiam ipsa exercitationem.', 'Illo earum atque et mollitia et ea. Soluta minus tenetur nisi accusamus magni. Quisquam ad veritatis deserunt voluptatem necessitatibus.', '26.02', '39.12', 149, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(27, 3, 'Consequatur ipsum cumque', 'consequatur-ipsum-cumque-cHhUs', 'NFGDPU4O', 'Velit dignissimos illo sequi magni recusandae unde dolor non vitae consequatur voluptate perferendis quos maxime sequi architecto.', 'Pariatur ipsa incidunt voluptatum est maiores. Qui dolor sit voluptas voluptates doloremque quo accusantium. Reprehenderit dolore est sit qui excepturi. Iure animi nobis commodi odio soluta. Odio omnis vel nobis nisi. Reprehenderit aperiam corporis illum consequuntur dolorum.', '23.68', NULL, 150, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(28, 3, 'Qui expedita omnis', 'qui-expedita-omnis-LpNUu', 'DCALPVEW', 'Vel ut velit ut ad ea amet repudiandae natus occaecati.', 'Autem necessitatibus dolorem et laborum quo voluptatem. Unde est repudiandae doloribus et et voluptatem. Et voluptatem in blanditiis enim est ut. Aliquid distinctio ut quidem veritatis perferendis voluptas ea. Est molestias et ducimus animi officia temporibus voluptatem quisquam. Aut enim eligendi possimus ut ut tenetur neque.', '292.29', NULL, 138, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(29, 3, 'Asperiores ipsam dolor', 'asperiores-ipsam-dolor-pryFC', 'ZZZD3QJ2', 'Possimus ut ut et reprehenderit eum ut perspiciatis fugit.', 'Pariatur unde consectetur placeat exercitationem explicabo. Eligendi facilis molestias temporibus quam in rerum. In aliquid ipsam eaque consequatur labore fuga. Totam nemo minus rerum et aut alias quisquam dolores. Excepturi vel recusandae veritatis delectus voluptas omnis. Laborum ad est quia sit possimus autem.', '183.57', '211.57', 198, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(30, 3, 'Itaque perspiciatis aut', 'itaque-perspiciatis-aut-M6UbR', 'AJBEELLW', 'Quasi inventore voluptatem suscipit ut earum accusamus nihil velit cupiditate eum quia optio quo ipsum ut.', 'Ea eligendi nam iure doloribus dignissimos. Ducimus at ex tempore incidunt libero. Eos architecto ex non vitae illo quae officia. Quasi id enim fuga illum explicabo exercitationem. Fuga est et quo saepe adipisci.', '178.37', '191.21', 26, 0, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(31, 3, 'Molestias excepturi quod', 'molestias-excepturi-quod-U5T8n', 'FRJ5RU7N', 'Magni dolorum id quae hic magni asperiores occaecati ea veniam.', 'Dolore dolore officia voluptates deserunt voluptas sint sed. Qui saepe ut modi fugit. Id beatae corporis laborum cupiditate et atque. Ratione inventore sequi ut dolore voluptatem eos. Alias ut laborum natus quia quae repellat.', '73.13', NULL, 145, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(32, 3, 'Possimus voluptatem eius', 'possimus-voluptatem-eius-s8eaC', 'FW23PYTO', 'Accusantium velit sed saepe inventore a nostrum est accusantium occaecati.', 'Dolore et sunt aut et ducimus voluptatem doloribus sapiente. Amet consequuntur sed ut rerum pariatur voluptatem iure. Nostrum ea placeat ut est quia eveniet quaerat. Velit ipsa voluptas aut ullam repellendus voluptatem maiores eaque.', '39.46', '41.40', 18, 0, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(33, 3, 'Assumenda ut natus', 'assumenda-ut-natus-w4Hg4', 'MAMGCVG9', 'Dolor odit sed laborum nesciunt hic exercitationem a repellat architecto ipsum ratione alias rerum assumenda ut voluptas.', 'Eius exercitationem eligendi qui qui ab. Nam impedit unde labore. Nobis harum laudantium asperiores voluptate sapiente delectus commodi dolores. Enim voluptas sit ea consequatur. Dicta molestiae excepturi voluptatibus velit.', '120.00', NULL, 87, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(34, 3, 'Dolor est omnis', 'dolor-est-omnis-p1csK', 'F11JFUH1', 'Et sequi culpa animi explicabo voluptatibus distinctio rerum tenetur esse dolorem.', 'Corporis fugiat veniam perspiciatis veritatis officia. Consectetur in sint consectetur quo. Voluptate minus maxime recusandae. Ducimus amet quia eveniet ut. Nam facere quo qui magnam. Eligendi doloribus blanditiis ratione hic.', '95.31', NULL, 192, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(35, 3, 'Laudantium dignissimos possimus', 'laudantium-dignissimos-possimus-7KtIx', 'SVXRKKCR', 'Nulla laboriosam voluptatem dolores asperiores nam commodi blanditiis sequi.', 'Sit temporibus consectetur delectus dicta quisquam non voluptate. Ut pariatur excepturi libero et ut. Aut dolorum temporibus accusamus nostrum minus sed.', '240.72', NULL, 89, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(36, 3, 'Sequi omnis molestiae', 'sequi-omnis-molestiae-3ahYJ', '1UKUBNM7', 'In dolores dolorem quibusdam velit qui ab voluptatibus totam sit omnis aut dolorum enim.', 'Soluta incidunt voluptates omnis maiores et eos. Nam harum assumenda cupiditate et enim omnis. Omnis vel velit aut tenetur aspernatur soluta. Dolore eum quia aliquid architecto. Eum quas ex omnis exercitationem blanditiis. Illo ea reiciendis vitae maiores.', '38.87', NULL, 156, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(37, 4, 'Sunt nihil voluptas', 'sunt-nihil-voluptas-abY2F', 'JCFDKXAR', 'Molestiae sed voluptate alias quia est hic esse et sunt magni nisi.', 'Ex consequuntur quidem soluta recusandae. Ea delectus ratione minima officia iusto. Soluta in sint voluptatum qui sint quasi est. Expedita omnis vero culpa laboriosam qui ea nihil. A repellendus beatae omnis dolore.', '136.77', NULL, 18, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(38, 4, 'Alias non reiciendis', 'alias-non-reiciendis-Tdtdy', 'OPGDRWJH', 'Dolores sed perspiciatis delectus sit minus debitis iste provident provident est recusandae atque totam tempore rerum.', 'Non necessitatibus blanditiis iusto dolorum aut inventore corrupti. In et aliquid et fuga. Eos sed odit rerum libero occaecati maiores. Sed corrupti et praesentium explicabo ipsam rerum quod. Ut esse sunt fugit sed. Ut repellendus ex temporibus.', '141.45', NULL, 132, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(39, 4, 'Quae aliquam inventore', 'quae-aliquam-inventore-c8Ra5', 'XBCPKXD1', 'Ad molestiae porro voluptatibus unde nostrum et quis consequatur.', 'Voluptatem ut eaque enim. Ad vitae ut et saepe eos veritatis in. Quasi voluptatum unde illum repellendus odit temporibus voluptatem. Eos neque fuga velit enim sit vel. Laudantium officia culpa et soluta quae.', '232.82', NULL, 12, 1, 1, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(40, 4, 'Consequatur dolor dolorem', 'consequatur-dolor-dolorem-XtUnk', 'IZOJHCWM', 'Ratione voluptatem harum dicta sapiente doloremque qui harum delectus alias nulla ut temporibus quibusdam illo commodi.', 'Voluptate esse molestiae facere. Molestiae exercitationem reprehenderit ut sequi consequuntur inventore et non. Porro aut aut fugiat qui consectetur et. Consequatur nam officiis mollitia explicabo. Exercitationem et tenetur reiciendis et officia rerum.', '98.19', NULL, 116, 0, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(41, 4, 'Enim reiciendis hic', 'enim-reiciendis-hic-oZO8J', 'AJHAJNHL', 'Illum incidunt iste totam necessitatibus enim numquam sed repudiandae.', 'Voluptas voluptatibus accusamus et rerum ut. Unde deleniti reprehenderit libero aut ipsum iure. Autem at aliquid aperiam reprehenderit recusandae sit. Nam non nostrum at modi. Sapiente ut ut repudiandae qui est.', '110.34', NULL, 106, 0, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(42, 4, 'Facere voluptate veniam', 'facere-voluptate-veniam-vEPLk', 'MOADUZEQ', 'Omnis voluptatem eos minima dolor quos et possimus aut quia accusantium.', 'Dolorem qui illo ducimus blanditiis necessitatibus sapiente. Cupiditate cumque dignissimos in dolorum minus dolore. Ipsa non doloribus ducimus aperiam hic magni. Perspiciatis id sit reiciendis at voluptatem eaque ad. Ipsam voluptas rerum distinctio eius officia et qui.', '163.35', '170.74', 38, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(43, 4, 'Omnis soluta omnis', 'omnis-soluta-omnis-ImBu4', 'YQ8WIFIZ', 'Nesciunt dolores illo eos voluptatum in rem eveniet sunt doloremque aut totam numquam.', 'Aut quia qui est dolore. Quis omnis aliquam porro quod voluptatibus ut. Quia fugiat non debitis voluptatibus. Amet voluptatem corporis est. Molestiae unde maxime quod et tenetur qui.', '99.21', NULL, 149, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(44, 4, 'Voluptatum et nulla', 'voluptatum-et-nulla-mP8Ib', 'EOX66DJV', 'Quas est atque est animi dolorem minima molestiae laboriosam sint quasi a.', 'Autem accusamus unde magni ad. Cum iusto rerum tenetur qui nemo debitis dicta. Accusantium aut atque quas error molestiae expedita quidem. Quibusdam excepturi quo at dolore itaque quae.', '262.75', '276.16', 151, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(45, 4, 'Tempora beatae explicabo', 'tempora-beatae-explicabo-HnCV0', 'PLDPPGLW', 'Est occaecati distinctio ut ipsam cumque ut accusamus voluptatem.', 'Temporibus quod necessitatibus veniam quibusdam consectetur nisi accusamus. Corrupti non consequatur sunt repellendus aut consectetur. Omnis reiciendis pariatur quidem consequatur voluptas officia. Non rerum voluptatem laboriosam non est eius.', '269.87', NULL, 142, 0, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(46, 4, 'Laboriosam non dolores', 'laboriosam-non-dolores-xy9nX', 'VR9UUTBF', 'Enim qui ipsam facilis ut doloribus et sed omnis earum non autem enim.', 'Excepturi omnis et nemo esse sit et. Sapiente cupiditate necessitatibus vitae blanditiis. Ipsam rerum ducimus ut nihil commodi laudantium. Incidunt explicabo qui ut est.', '37.66', '69.66', 198, 1, 1, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(47, 4, 'Ea aperiam earum', 'ea-aperiam-earum-7sdoC', 'RA8CJKSU', 'Dolore iste iure omnis aut minima veritatis aut est ut.', 'Voluptatem et ut harum inventore nihil quaerat asperiores. Id corporis quaerat quia inventore quos quas in expedita. Ut quo molestiae iste commodi.', '180.83', NULL, 134, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(48, 4, 'Laudantium harum illo', 'laudantium-harum-illo-8Ybi8', 'HBMQEIAO', 'Incidunt ipsum ut enim sed itaque qui quod.', 'Magnam inventore maxime sint tempora. Possimus reiciendis omnis animi voluptatum. Recusandae qui rerum nemo aut sit vel. Aut quis vitae illum sed aspernatur.', '149.88', NULL, 126, 1, 0, NULL, NULL, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(49, 5, 'Eaque adipisci quia', 'eaque-adipisci-quia-sqszE', 'EOFUSB1Z', 'Numquam nobis dicta est rerum quia nihil dicta voluptatum amet illum aut.', 'Ea in cum molestias ut cupiditate. Repellendus molestiae reprehenderit eveniet quasi ut. Architecto nobis nihil laborum sed accusamus culpa aut. Harum cumque dolorum omnis cupiditate. Eos voluptatum illum nihil et numquam aliquid autem eos. Dolor iusto ipsa nesciunt maiores.', '282.44', NULL, 148, 1, 0, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(50, 5, 'Placeat est corrupti', 'placeat-est-corrupti-tK6tD', 'ENECWPU2', 'Quidem consequatur fugiat sit id ipsum qui sunt aliquam dolores ipsum ut.', 'Et voluptates ea praesentium praesentium numquam. Quia accusamus facere ut fugiat. Maxime omnis praesentium voluptatem a. Voluptatem quod a ea aspernatur consequatur.', '215.29', NULL, 143, 1, 0, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(51, 5, 'Reprehenderit sunt pariatur', 'reprehenderit-sunt-pariatur-RInVg', 'MBVFU9AT', 'Reiciendis alias eius qui porro et voluptatem amet excepturi dicta quasi vel sit quia optio.', 'Eos pariatur sed voluptatem. Sunt sit hic laborum temporibus adipisci aut. Commodi pariatur velit molestias veniam laudantium. Ea molestiae et explicabo dolores nobis eligendi sed dicta. Et totam voluptates doloribus earum.', '184.14', NULL, 41, 1, 0, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(52, 5, 'Facilis eos molestiae', 'facilis-eos-molestiae-PZxfI', '9RXFRG0Q', 'Deleniti doloremque sint accusamus omnis voluptatem error ut vel nostrum unde perspiciatis sint.', 'Explicabo id aut est. Error amet voluptatem et velit voluptatibus commodi ex. Quaerat deleniti dolorem quas a fuga possimus accusamus.', '128.15', NULL, 11, 1, 0, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(53, 5, 'Ullam tenetur qui', 'ullam-tenetur-qui-mspTW', 'KYEDPJRV', 'Illo optio dolores et accusantium labore molestiae et saepe ratione repudiandae nihil qui et cupiditate est eos.', 'Ut architecto est ea omnis aliquam corporis molestiae. Voluptatem velit quod aliquid omnis voluptatem voluptatem voluptatem ut. Dolores et cumque et molestias dolorum voluptatum. Id debitis possimus quia temporibus aspernatur nemo sint.', '125.14', NULL, 143, 1, 0, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(54, 5, 'Voluptas debitis beatae', 'voluptas-debitis-beatae-sVrJc', 'R0ETZVCW', 'Fuga dolorum eum soluta possimus hic ut dolor nostrum quo voluptatibus et magni dignissimos quia.', 'Voluptatem sint hic blanditiis commodi. Ut explicabo aperiam vero aut est nulla aut nobis. Ea et minus quo iste iusto veniam. Quis et quam quas reprehenderit in dolorem esse.', '128.38', '165.13', 83, 1, 1, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(55, 5, 'Sunt et quaerat', 'sunt-et-quaerat-u2Rz5', '6NCUYM8H', 'Rerum fugiat vel autem voluptatum autem nemo quis.', 'Magnam aut hic maiores doloremque minus consequatur. Dolorem ut alias dolor et. Soluta atque quod neque voluptatum. Molestias consequuntur consequatur aperiam et hic reprehenderit.', '283.52', NULL, 42, 1, 0, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(56, 5, 'Distinctio esse iste', 'distinctio-esse-iste-nCo5D', 'BJ1GYHI2', 'Libero nobis molestiae ratione unde sit voluptatibus exercitationem id voluptatem consequatur rerum dolore.', 'Quibusdam nihil omnis magni delectus incidunt qui quos velit. Ut nihil qui officia velit sit consectetur. Autem in rerum hic blanditiis sit itaque et sapiente. Nisi porro et qui. Nam qui ratione fugit aperiam fugiat autem eum.', '51.70', NULL, 183, 1, 0, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(57, 5, 'Occaecati qui repellat', 'occaecati-qui-repellat-HQ4zt', 'NTRXHLWT', 'Qui et iure et est voluptas dolor animi suscipit non quaerat eaque pariatur non tenetur quis.', 'Animi eaque non eaque animi. Ducimus repellendus ducimus occaecati exercitationem assumenda quaerat omnis ipsa. Omnis ad magnam repellat voluptate. Distinctio id tenetur enim sint. Dolorem ut distinctio et eligendi quia consectetur iure.', '205.33', NULL, 186, 1, 1, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(58, 5, 'Deserunt voluptate accusantium', 'deserunt-voluptate-accusantium-qYVKb', 'IWLDJIH5', 'Quisquam illum aut velit voluptate laudantium officiis cumque voluptas laborum vel illo vitae et blanditiis dolorum quaerat.', 'Cum rem libero non at molestiae. Quasi possimus expedita et eveniet dolorem. Voluptatem enim ea aperiam et accusantium deserunt. Distinctio totam earum reiciendis esse est quo a. Quae minima dicta veniam qui totam nobis.', '29.66', NULL, 104, 1, 1, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(59, 5, 'Voluptatibus inventore aspernatur', 'voluptatibus-inventore-aspernatur-9IkKZ', 'Q0CXOQ4S', 'Sit rem reprehenderit nisi dignissimos accusantium magnam sed excepturi qui ut voluptatem consequatur cum ut veritatis.', 'Suscipit laboriosam recusandae non et. Qui et ex quae eos est blanditiis magni. Aut natus nihil enim quod. Enim laudantium deserunt tenetur aut omnis.', '153.08', '162.00', 93, 1, 0, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(60, 5, 'Et repellendus est', 'et-repellendus-est-3K9CG', '2AFXOSZT', 'Est eveniet sed perferendis harum laboriosam omnis aliquam placeat.', 'Doloribus dolorem dolor adipisci ipsa. Voluptatem nobis ut beatae ad eum. Sed similique et ut consequuntur beatae reiciendis saepe aliquid. Animi nisi autem quia quod ducimus nulla commodi.', '287.05', '333.56', 69, 1, 0, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(61, 6, 'Et quos fuga', 'et-quos-fuga-Lieyt', 'FQUCHY6E', 'Similique incidunt necessitatibus velit perspiciatis ea quo ipsam quam blanditiis velit.', 'Numquam veniam doloremque esse officiis sit illum blanditiis optio. Qui praesentium architecto delectus molestiae et fuga. Corrupti consequatur vel fugiat quia.', '17.04', NULL, 128, 1, 0, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(62, 6, 'Corporis excepturi qui', 'corporis-excepturi-qui-TuHzD', '4KQCMXRC', 'Est adipisci consequatur sed expedita eveniet nobis dolores praesentium aut omnis sunt consequatur laborum itaque.', 'Beatae totam praesentium possimus consectetur ea. Quisquam error omnis qui. Rerum odio consequatur sit occaecati. Quo eaque eos illum aut eum et.', '102.58', NULL, 31, 0, 0, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(63, 6, 'Blanditiis magnam minus', 'blanditiis-magnam-minus-eKV3T', 'W5KDJHRI', 'Aliquid ab modi earum quo dicta repellendus fuga sit voluptatem est error.', 'Veritatis fugit neque nobis debitis hic facilis maxime facilis. Aut quia facilis dolor possimus sit et. Hic facilis optio quo sunt aut. Aspernatur omnis eum nobis dolores minima reprehenderit sint. Autem consectetur omnis voluptates ea nihil debitis aut. Reiciendis ea dicta assumenda temporibus tempora hic eveniet.', '205.77', NULL, 8, 1, 1, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(64, 6, 'Quo recusandae aut', 'quo-recusandae-aut-SQxhJ', 'VVUIOOO4', 'Alias odio aut nesciunt fuga voluptatem ut maiores sed reiciendis facere dicta.', 'Nihil aut quo possimus sed dolorem. Enim labore molestiae laboriosam earum molestiae. Deleniti unde quasi veritatis quasi. Repudiandae amet vel eaque. Culpa necessitatibus et ipsum nihil error beatae quia.', '87.37', '136.46', 124, 1, 1, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(65, 6, 'Similique consectetur ipsum', 'similique-consectetur-ipsum-uy5uX', 'SZIXQR7W', 'Recusandae doloribus voluptatem nostrum vel rerum nemo est aliquam doloribus molestias.', 'Cumque sed similique voluptas ad. Consequatur exercitationem sit molestiae nihil et aut numquam. Consequatur cum occaecati in doloremque fugiat eum. Ut consequatur autem voluptatem nihil. Qui et reprehenderit voluptatem quisquam. Velit voluptas iure expedita vel officiis.', '103.77', NULL, 45, 1, 0, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(66, 6, 'Error aut aut', 'error-aut-aut-gwmoY', 'A1LTS3DT', 'Sapiente hic deserunt voluptas tempore corrupti qui reiciendis.', 'Natus impedit rem minima voluptatem ratione natus. Natus inventore dolore quidem at iste amet non. Repellat rem assumenda voluptatum ut nam itaque nesciunt. Soluta sunt aut atque et quasi.', '260.60', NULL, 57, 1, 1, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(67, 6, 'Iure sequi possimus', 'iure-sequi-possimus-SZdzX', '4WELT6UP', 'Omnis vel quia expedita veritatis nisi doloribus nemo modi minus.', 'Ut ad quas dicta sunt. Sint et iusto consequatur quod ut laborum. Quisquam cumque vel nesciunt. Dolores quia explicabo natus est et. Nisi rem totam provident voluptatum quo.', '188.08', '212.98', 133, 1, 0, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(68, 6, 'Neque similique sint', 'neque-similique-sint-Cfiu4', '1ZJOJXBB', 'Sunt molestias et dolores et sunt ipsam id et.', 'Ratione ut laboriosam quas explicabo dolor. Qui accusamus omnis perferendis eveniet. Doloremque earum fugit illo molestias error ut doloremque est. Quaerat nostrum dolorum magni. Inventore qui aut ratione nesciunt esse eos.', '233.47', NULL, 93, 1, 0, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(69, 6, 'Similique incidunt dolor', 'similique-incidunt-dolor-MNT4Y', 'WROBDUEL', 'Itaque incidunt eos totam ullam pariatur incidunt qui cumque voluptatem.', 'Incidunt corporis ratione asperiores rerum voluptas repellat. Voluptate voluptates sit fuga ipsam amet sed quasi sed. At rerum quia expedita doloribus deserunt. Alias dolorum reprehenderit fuga qui.', '36.54', '42.16', 32, 1, 0, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(70, 6, 'Voluptatem vel ut', 'voluptatem-vel-ut-m2gjy', 'YWGMIWNZ', 'Sapiente minima similique provident doloremque minus autem nihil laboriosam et.', 'Perspiciatis qui nihil qui incidunt sequi molestiae. Beatae officiis a ducimus distinctio nihil aut. Quia consequatur deleniti ea consequuntur quis.', '216.93', '221.46', 165, 1, 0, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(71, 6, 'Esse officia totam', 'esse-officia-totam-YObk4', 'YO8T8APS', 'Deleniti ut velit sunt quam maxime distinctio vitae voluptatum eum.', 'Quaerat dolorem quod cum consequuntur. Est repellat illo assumenda fuga nostrum id. Aut et laboriosam dicta sint alias. Reprehenderit vel aut officia rem.', '184.04', NULL, 197, 0, 1, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(72, 6, 'Eos soluta ducimus', 'eos-soluta-ducimus-GKOUM', 'XEG3GR6H', 'Ut unde rerum ab deleniti numquam aut nobis ipsa.', 'Molestiae voluptatem totam est quia quia earum aliquid id. Numquam veritatis nobis omnis voluptas. Nulla et aut cum doloribus. Ipsum eum minus vel laboriosam eius quidem asperiores.', '131.52', NULL, 58, 1, 1, NULL, NULL, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(73, 7, 'Voluptatum repellendus dolores', 'voluptatum-repellendus-dolores-bzGb1', 'AXGAVLRN', 'Ratione ipsam enim nobis consequuntur neque alias iure beatae laboriosam expedita id et ipsa debitis adipisci.', 'Voluptatem soluta error cupiditate unde excepturi aut. Architecto iure inventore fuga minus quod iure est. Similique et dolor dolorum earum officiis porro qui. Ea cum labore sint. Saepe est commodi beatae ipsam quo. Aspernatur voluptas sed cumque at.', '185.34', '216.52', 29, 1, 0, NULL, NULL, '2025-10-27 21:09:16', '2025-10-27 21:09:16'),
(74, 7, 'Molestiae ullam omnis', 'molestiae-ullam-omnis-TYXJ7', 'CSACCEBS', 'Illum quisquam id quas qui veritatis totam aut tempore.', 'Eum dolor qui quia odit. Laudantium nam ut velit ut. Qui voluptas soluta nostrum dignissimos laboriosam aut. Dolores totam ut explicabo hic voluptatibus saepe maiores aliquid.', '127.47', NULL, 19, 1, 0, NULL, NULL, '2025-10-27 21:09:16', '2025-10-27 21:09:16'),
(75, 7, 'Mollitia officiis et', 'mollitia-officiis-et-SC6Ir', 'QPKMFXI3', 'Consequatur doloribus voluptatem vel ut omnis voluptatum labore aut dolor placeat.', 'Dignissimos incidunt inventore error facere. Iusto totam alias quia accusantium reiciendis dicta. Amet qui et rerum et. Beatae praesentium inventore sit adipisci. Eaque tempora adipisci deserunt ea.', '134.49', NULL, 115, 0, 0, NULL, NULL, '2025-10-27 21:09:16', '2025-10-27 21:09:16'),
(76, 7, 'Et quam velit', 'et-quam-velit-wd4Tg', 'LY3WDFVE', 'Maiores cumque laborum et et doloribus harum qui quia possimus explicabo voluptate consequatur iste.', 'Hic ratione quam eveniet omnis dolorum quia quia vel. Aperiam ut qui eligendi laborum quam a possimus. Iste ut eos nemo quaerat nihil. Veniam id cupiditate odio praesentium.', '202.12', NULL, 117, 1, 0, NULL, NULL, '2025-10-27 21:09:16', '2025-10-27 21:09:16'),
(77, 7, 'Aut explicabo laudantium', 'aut-explicabo-laudantium-ITfhJ', 'HYRUJV9M', 'Molestiae qui occaecati eveniet porro quisquam corrupti tempora natus esse.', 'Id pariatur sequi iste et quas quia. Nam quia eaque magnam cumque et fugit molestias. Expedita distinctio voluptas quod nesciunt occaecati in.', '36.51', NULL, 9, 0, 0, NULL, NULL, '2025-10-27 21:09:16', '2025-10-27 21:09:16'),
(78, 7, 'Illo amet quod', 'illo-amet-quod-ENdUJ', 'POHAYTWZ', 'Eius consequatur unde est aut ex commodi recusandae.', 'Veniam reiciendis iste quisquam tempora. Ipsa nesciunt quo dolores facere provident sed repellat quo. At illum culpa voluptatibus.', '65.61', '96.89', 91, 0, 1, NULL, NULL, '2025-10-27 21:09:16', '2025-10-27 21:09:16'),
(79, 7, 'Rerum aspernatur maiores', 'rerum-aspernatur-maiores-AwLWK', 'Y9VVVFOO', 'Autem aspernatur ut ad quis distinctio similique dolore et illum commodi voluptatum.', 'Odio impedit velit qui sint. Aut officia aspernatur sed quos. Iusto et et tempora at tenetur corrupti. Eum sit aliquam saepe quod minima qui. Aut cupiditate exercitationem ipsam suscipit amet.', '7.88', '19.62', 59, 1, 0, NULL, NULL, '2025-10-27 21:09:16', '2025-10-27 21:09:16'),
(80, 7, 'Amet est sequi', 'amet-est-sequi-L2u4n', 'LLZ3GVHQ', 'Assumenda dolorem quod omnis recusandae eum eum perferendis molestiae est molestiae quis eos placeat.', 'Nostrum inventore qui accusamus vitae. Mollitia non aut vel totam et. Accusamus ea ut vitae voluptates perferendis delectus.', '7.35', '16.13', 176, 1, 0, NULL, NULL, '2025-10-27 21:09:16', '2025-10-27 21:09:16'),
(81, 7, 'Voluptatem eos officia', 'voluptatem-eos-officia-6zTI3', 'CXBOJ0GR', 'Quia est eos occaecati minima aut in id hic praesentium quisquam animi tenetur omnis.', 'Quia ab sit id exercitationem est. Eos in minus esse temporibus provident. Asperiores dolor cumque quasi pariatur ut velit corrupti. Qui possimus asperiores tenetur aliquid aliquid. Tenetur provident ut et architecto porro aliquid sunt.', '283.09', '296.01', 18, 1, 0, NULL, NULL, '2025-10-27 21:09:16', '2025-10-27 21:09:16'),
(82, 7, 'Sit beatae aperiam', 'sit-beatae-aperiam-WPx0K', 'NI0FOFQX', 'Dolor molestiae sunt ratione ratione esse sint aut.', 'Illo numquam minima iusto. Molestiae nam qui aperiam et. Officia autem qui sit. Autem quisquam doloremque pariatur unde. Facilis dolor ex necessitatibus praesentium ipsum labore. Molestiae harum assumenda nemo facilis facilis.', '163.58', NULL, 116, 1, 1, NULL, NULL, '2025-10-27 21:09:16', '2025-10-27 21:09:16'),
(83, 7, 'Quia praesentium sunt', 'quia-praesentium-sunt-E0aOq', '4EYCYGNX', 'Laborum sunt corporis sunt officia incidunt qui modi qui quibusdam reprehenderit culpa.', 'Mollitia ipsa explicabo temporibus aliquid dignissimos. Suscipit ut officia fugit omnis laudantium nesciunt. Id nam iusto beatae aut voluptate incidunt. Dicta enim sunt ut. Beatae cupiditate nihil consequatur a reprehenderit. Consequuntur aut ipsum tempore qui ea.', '49.03', NULL, 114, 1, 0, NULL, NULL, '2025-10-27 21:09:16', '2025-10-27 21:09:16'),
(84, 7, 'Non nihil quia', 'non-nihil-quia-mobkG', 'APKRJT2R', 'Quo quos dolores reiciendis reiciendis itaque voluptas ab dolorum accusamus omnis.', 'Libero enim similique dolores doloribus illum iure pariatur odit. Amet sit voluptatem porro perferendis neque minus. Nisi corporis perferendis aut voluptas. Nam corporis quod sint porro quia aut omnis id. Soluta qui error atque adipisci voluptatem.', '205.83', NULL, 74, 1, 0, NULL, NULL, '2025-10-27 21:09:16', '2025-10-27 21:09:16'),
(85, 8, 'Quo enim est', 'quo-enim-est-HQPZt', 'XPLX3TQY', 'Est iure perspiciatis explicabo aut vel et aut molestiae et nesciunt rerum.', 'Vel est dolor deserunt nobis veniam aliquid. Illo placeat ut a sunt aliquid. Quibusdam quia et modi molestiae. Quo magni modi eveniet nihil illum eius repellendus. Ut atque culpa est asperiores aut est dolor reprehenderit. Provident neque saepe quo laboriosam quae.', '80.23', NULL, 168, 1, 0, NULL, NULL, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(86, 8, 'Id sint dolorem', 'id-sint-dolorem-jbkg5', 'UTBV4NIU', 'Omnis magnam voluptatem minima autem voluptas amet asperiores magni id voluptas id qui tempora et nobis.', 'Voluptas et adipisci non earum neque modi perferendis. Id aut perspiciatis dicta qui ut rerum. Maiores amet qui et maiores aliquid. Laboriosam commodi sunt id ut dolor id pariatur repellat. Ut quis velit blanditiis nihil vel fugiat. Ex voluptas facilis voluptatibus.', '97.62', '144.00', 165, 1, 0, NULL, NULL, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(87, 8, 'Dolorum ut quo', 'dolorum-ut-quo-qNxEA', 'CAHSVUV2', 'Ex eius voluptas non unde iste repellendus ipsam sit.', 'Necessitatibus voluptatem maxime omnis ea provident. Voluptates occaecati qui commodi molestiae. Laborum error consectetur aut eaque nihil nulla. Tempore sequi quisquam perferendis. Error modi ipsa non dolorum laboriosam et adipisci.', '43.09', NULL, 68, 1, 0, NULL, NULL, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(88, 8, 'Et fugit in', 'et-fugit-in-TKqg7', '5KAIL7VK', 'Voluptas vel fugiat et voluptatibus sequi molestias numquam nihil.', 'Impedit quas eveniet veritatis culpa sunt tempora veniam non. Neque quia minima odit quis consequatur. Tempora cupiditate sed eligendi eos labore minima earum. Temporibus provident suscipit accusantium eos. Voluptatibus iusto nisi molestiae quidem quibusdam hic. Dolores enim nam illo qui perferendis molestiae repellat.', '140.05', '173.61', 192, 0, 0, NULL, NULL, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(89, 8, 'A consectetur explicabo', 'a-consectetur-explicabo-XBHZC', 'AQIUD1ES', 'Reprehenderit velit tempore aut a labore dolores officia aut est.', 'Est vero distinctio cupiditate quas praesentium enim aut. Aperiam temporibus nemo deleniti est ut necessitatibus quis. Eos nihil rerum et. Et facere voluptatum voluptates ut soluta sequi voluptatem.', '273.36', '291.52', 64, 1, 0, NULL, NULL, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(90, 8, 'Eius et tempore', 'eius-et-tempore-6qK3n', 'PTLTWSTI', 'Eos eveniet ipsa natus totam nostrum nihil corrupti est quia iure dolor recusandae blanditiis est et.', 'Dolor molestias aut unde provident provident occaecati quasi. Voluptas animi hic doloribus qui velit quo. Beatae animi facere accusamus totam ut. Culpa fugiat quae iure possimus minus. Et nulla assumenda et non non. Et sequi magnam qui dolorem aut ullam.', '5.64', NULL, 79, 1, 1, NULL, NULL, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(91, 8, 'Voluptas est in', 'voluptas-est-in-Zlfs0', 'T20SJRZJ', 'A similique et non necessitatibus itaque nesciunt iure.', 'Eum natus eos ut blanditiis odit. Qui iure sint tempora animi sit ipsa eum. Excepturi sunt odit ut aut officia. Hic velit non architecto dolores et quis. Numquam beatae inventore libero minus ullam aperiam. Asperiores enim quam qui harum ea ut.', '185.54', '196.74', 39, 1, 1, NULL, NULL, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(92, 8, 'Assumenda nihil ipsam', 'assumenda-nihil-ipsam-nDdJP', 'X4G9LDRP', 'Enim facere sit optio possimus est nesciunt reprehenderit pariatur.', 'Iste non nemo incidunt voluptatem non. Voluptatem expedita debitis magnam quis eius temporibus. Omnis id ipsa nam reiciendis ut eveniet sequi.', '135.02', '162.46', 63, 1, 0, NULL, NULL, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(93, 8, 'Id dolor enim', 'id-dolor-enim-h6Xu6', 'OYETQVPL', 'Pariatur laudantium delectus aperiam recusandae quae aut labore.', 'Corporis consequatur qui quas. Et est et aut non unde tenetur in illo. Esse voluptas asperiores provident aspernatur. Autem exercitationem excepturi vitae. Vel et sint aut nulla veniam quod.', '109.74', NULL, 63, 1, 0, NULL, NULL, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(94, 8, 'Repellendus tempora dolorem', 'repellendus-tempora-dolorem-nbu52', 'OB70N3T5', 'Ratione exercitationem temporibus illum nulla tempora dignissimos autem expedita dicta sit fugit vel fuga.', 'Est ut illum sint rerum. Et sed necessitatibus voluptatibus cumque. Enim fugit itaque ipsum. Repellendus at ipsum provident et error asperiores maxime.', '296.87', NULL, 147, 0, 0, NULL, NULL, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(95, 8, 'Vitae officia fugiat', 'vitae-officia-fugiat-CSuX5', '9Z1OXAKF', 'At sapiente qui dolor fuga dolorem laboriosam aut et assumenda asperiores.', 'Sed explicabo soluta et. Iste dolor sit praesentium. Molestiae occaecati aspernatur nostrum quaerat enim rem exercitationem natus. Consequatur molestiae sed dolores provident est itaque excepturi.', '40.13', NULL, 76, 1, 0, NULL, NULL, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(96, 8, 'Quasi amet sunt', 'quasi-amet-sunt-1jMTy', 'BF7BOQXJ', 'Autem et modi corrupti et rerum labore dolor dicta dolor.', 'Maxime velit qui quae ipsa aut. Laboriosam quisquam tempora maxime consequuntur quam molestiae vitae. Aut qui sit quis suscipit ut itaque quibusdam. Qui debitis voluptas voluptatem tenetur voluptatem sed ut.', '146.15', '181.98', 156, 1, 0, NULL, NULL, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(97, 9, 'Qui quae dolore', 'qui-quae-dolore-kwT7c', '2YTFHIYY', 'Commodi incidunt iste commodi repudiandae facilis aut rerum sunt vero expedita reprehenderit pariatur itaque asperiores.', 'Eveniet eveniet soluta eius sint ut saepe. Porro recusandae omnis voluptatibus ut harum ut non. Qui corporis quia doloremque voluptas voluptate dolorum. Quos eaque natus adipisci molestiae est et quia.', '251.73', NULL, 139, 1, 1, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(98, 9, 'Similique explicabo aut', 'similique-explicabo-aut-Wlu6f', '5CRR0DXS', 'Saepe voluptas distinctio non deserunt numquam dignissimos sit qui.', 'Cumque officiis animi aut distinctio. Recusandae quia nisi nisi et. Numquam est laborum id. Dolorem ea possimus incidunt et. Deleniti et incidunt corporis dignissimos odit atque.', '287.17', NULL, 112, 1, 0, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(99, 9, 'Sed omnis vero', 'sed-omnis-vero-AKepw', 'DQBJXIDX', 'Quia inventore voluptatem odit est molestiae officia occaecati et adipisci.', 'Laboriosam quis aliquid voluptatem. Voluptatem laborum qui omnis in. Aliquam facere pariatur cupiditate omnis.', '38.02', '51.49', 61, 1, 0, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(100, 9, 'Eum corporis autem', 'eum-corporis-autem-57Z8l', 'C1NBMUPJ', 'Ullam beatae et corporis in fugit praesentium aut non hic tenetur rerum aut voluptatem.', 'Possimus in non hic recusandae voluptatem repellat tenetur. Quaerat vero ratione voluptatibus perferendis earum enim vero. Inventore maiores dolores facilis neque quia quam.', '64.07', NULL, 185, 1, 0, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(101, 9, 'Recusandae qui error', 'recusandae-qui-error-rO2Ne', 'V3LG4MDY', 'Repudiandae doloremque praesentium excepturi modi repudiandae excepturi rem asperiores aut quo doloribus aspernatur doloremque sint.', 'Ipsam et quia qui culpa dolor non iusto aperiam. Ea quasi itaque sunt reiciendis aut dolores repudiandae dolores. Dolore omnis debitis minus rerum aut doloribus qui. Sit minima totam itaque officia hic cupiditate. Harum totam consectetur commodi est.', '239.40', NULL, 196, 1, 0, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(102, 9, 'Et id dolorem', 'et-id-dolorem-6UUln', 'JWH5T2DG', 'Voluptatem rerum enim vero dicta vel quod architecto temporibus voluptatibus.', 'Eum minima consequatur soluta omnis laborum deserunt. Est velit quam eligendi ea quia rerum. Est ratione aperiam fugiat. Quisquam quaerat consequuntur sed accusantium perferendis molestiae. Qui est aut impedit facilis voluptates ducimus autem.', '136.42', NULL, 106, 1, 0, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(103, 9, 'Tempora laudantium accusamus', 'tempora-laudantium-accusamus-epvcm', 'WOCKYMZU', 'Quae totam sapiente consectetur distinctio nam quo quibusdam.', 'Molestias et autem quae velit fugit. Enim unde quo et perspiciatis beatae quia. Officia est sequi tempore officia sint molestias. Aperiam dolores temporibus harum rerum sed qui beatae.', '113.80', '118.78', 150, 1, 0, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(104, 9, 'Et libero qui', 'et-libero-qui-uQNyA', 'DFAOEKA4', 'Ipsa explicabo autem nulla veniam sint sint dolorem error quis totam cum qui.', 'Et quidem sed deleniti rerum sint. Ullam quas tempora tempora atque qui autem fugiat aperiam. Consequatur quia aut sunt rerum voluptatem corrupti sit. A facere minus libero ut.', '91.14', '106.36', 101, 1, 0, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(105, 9, 'Qui quasi est', 'qui-quasi-est-AyZoc', 'WTLXCSQK', 'Nobis beatae minus minima natus eligendi assumenda fuga quaerat eum voluptatibus facilis eos illo quas et sequi.', 'Laboriosam laboriosam temporibus repellendus id autem eaque reiciendis nemo. Dolorem et et consequuntur fugit aut enim. Eum ut eos et repellat velit natus. Aperiam accusantium similique laborum sint neque dolorum.', '153.27', '187.09', 146, 1, 0, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(106, 9, 'Qui quod voluptatem', 'qui-quod-voluptatem-B1yvq', 'M0WZVRTM', 'Nisi assumenda molestiae nihil dicta ipsum molestiae et corporis odio aut rerum saepe dolorem et nobis.', 'Iste quia voluptatem alias quia labore veniam. Voluptate eveniet sequi debitis et aspernatur adipisci. A iste nulla molestiae qui.', '188.66', NULL, 123, 1, 0, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(107, 9, 'Explicabo et maiores', 'explicabo-et-maiores-Jp6LZ', 'L7INGTZR', 'Quas eveniet vero architecto et consequatur voluptatem ducimus qui quos maxime eaque.', 'In placeat perferendis enim odit. Saepe minima nobis soluta quibusdam recusandae et error recusandae. Iure commodi suscipit qui eos ut. Eos aperiam aliquid ut inventore sint.', '35.19', '78.93', 141, 1, 1, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(108, 9, 'Omnis incidunt unde', 'omnis-incidunt-unde-RlZFY', 'R071K3AL', 'Vero perspiciatis adipisci est magnam quis voluptatem eius non provident eius corrupti veniam soluta.', 'Consequatur reiciendis consequatur ut sapiente est aut doloremque. Blanditiis quam optio eum corporis possimus animi voluptatem. Non nulla nostrum vel occaecati dolores. Quis similique explicabo tempore aut. Asperiores labore nostrum voluptatem quia ea alias suscipit consequuntur.', '184.92', NULL, 32, 1, 0, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(109, 10, 'Ut culpa qui', 'ut-culpa-qui-pDszq', 'OCRO14YZ', 'Soluta illum fugit sit nam et sequi optio et cumque officiis ut.', 'Mollitia deserunt enim enim. Nisi laudantium qui est distinctio ut earum. Impedit incidunt et necessitatibus est.', '163.66', '175.23', 60, 1, 0, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18');
INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `sku`, `short_description`, `description`, `price`, `compare_at_price`, `stock`, `is_active`, `is_featured`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(110, 10, 'Repellendus eum ullam', 'repellendus-eum-ullam-5wSkS', 'CVIT6JLB', 'Laboriosam assumenda corrupti eum labore quibusdam vero consectetur ipsam accusantium sequi.', 'Vel iure explicabo pariatur iste dolor ut. Laborum reprehenderit aut aut et iste distinctio eligendi suscipit. Eius sit et omnis recusandae sed enim et. Mollitia qui hic dolor voluptas nulla nulla et. Possimus nesciunt sed in.', '288.10', '336.90', 39, 0, 0, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(111, 10, 'Vel dolorum fugiat', 'vel-dolorum-fugiat-64W90', 'BFDCNAZN', 'Mollitia ducimus esse ea in soluta sapiente voluptatem velit dolor et quo.', 'Debitis ipsum quibusdam asperiores voluptatem amet quidem non. Veritatis ut est dolores veniam qui nemo. Dolor qui harum aspernatur est veniam.', '66.69', NULL, 89, 1, 1, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(112, 10, 'Praesentium voluptatem quam', 'praesentium-voluptatem-quam-F8fn1', 'F08BHMLX', 'Doloremque quis accusantium amet dolorum laudantium iusto illo commodi quisquam autem aliquam unde sed neque.', 'Dolorem aut aut tempora dolorum odio nostrum voluptates. Quas tempora temporibus eum et autem nulla. Illo voluptates odio ut rerum voluptatem quasi. Sit eos illo ea est quam at. Quia dolores et occaecati dolore quod sit nam.', '112.69', '125.32', 61, 1, 0, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(113, 10, 'Cumque eveniet distinctio', 'cumque-eveniet-distinctio-k07ae', 'TW9P6NOH', 'Corporis laudantium aut perspiciatis quia eos est neque natus accusamus veritatis non quam est temporibus delectus.', 'Ab amet et doloribus. Ad eos dignissimos consequatur dolorem quisquam vitae ea. Et adipisci molestias quos. Voluptas qui qui similique dignissimos ullam. Optio doloribus ex consequatur alias consectetur eum eaque cupiditate.', '74.48', NULL, 61, 1, 0, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(114, 10, 'Facilis voluptatem voluptatibus', 'facilis-voluptatem-voluptatibus-o1MqP', '5XRETNXW', 'Architecto ut sequi odit quia atque eum id quis delectus dolor aperiam provident atque voluptas.', 'Aut delectus laboriosam et autem itaque. Temporibus et minus sequi eaque ipsa. Vel reiciendis qui quas recusandae nam. Itaque quo fugiat dolorem aut alias ipsam. Ut eos fuga non hic itaque commodi.', '60.24', '85.03', 143, 1, 0, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(115, 10, 'Est maxime porro', 'est-maxime-porro-OlU6Z', 'QOENWMX7', 'Vel dolor consectetur nisi amet eos sequi et dolorum nulla cupiditate amet incidunt repudiandae.', 'Praesentium optio occaecati cumque rerum necessitatibus sunt nisi. Et delectus reprehenderit enim omnis. Accusantium est eum tempore aliquid enim nam. Placeat ratione ducimus molestias qui nihil.', '21.28', NULL, 20, 1, 1, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(116, 10, 'Laudantium ut sequi', 'laudantium-ut-sequi-iPybD', 'PYHJ5L57', 'Debitis blanditiis inventore quae est et assumenda voluptatem consectetur vel voluptates beatae velit illo reiciendis eos illum.', 'Sunt maiores aut unde voluptatum recusandae odit. Repudiandae exercitationem error maxime et voluptatem quis perspiciatis. Ullam veniam maiores et in accusantium quidem veritatis. Rem qui est quas vero consequuntur amet tempora.', '289.91', '329.57', 198, 0, 0, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(117, 10, 'Atque id distinctio', 'atque-id-distinctio-E7MG7', '8XYMTP89', 'Ut ut optio corporis non mollitia velit iure et explicabo expedita necessitatibus sed.', 'Placeat molestias unde consectetur id ut consequatur. Et libero commodi sapiente ducimus. Consequatur ea eius dolor aliquid. Quos cumque sit unde quia voluptatem dolor. Nisi sit est ut totam fuga eos consequatur a. Neque nihil quos ut quis.', '261.12', '299.15', 94, 1, 0, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(118, 10, 'Totam minus ut', 'totam-minus-ut-FD2CE', 'M4VKWKCP', 'Nobis eius voluptates quidem aspernatur corrupti quidem qui aut explicabo sint soluta delectus ea et natus quasi.', 'Voluptatem aut quia similique perspiciatis porro eos. Eligendi qui nihil rerum. Voluptas vitae hic quos illo unde aliquid placeat. Quia magni et non eum ut expedita magnam. Consectetur aut voluptas eligendi quam et facere quibusdam. Accusantium consectetur porro ex.', '277.05', '307.29', 194, 1, 0, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(119, 10, 'Unde qui laborum', 'unde-qui-laborum-4XHD9', 'WRSGCLNE', 'Quia voluptas quaerat reiciendis ducimus quis modi nihil temporibus quo sequi ipsam cupiditate dolor.', 'Numquam adipisci repellat quia molestiae delectus aliquam maiores. Dolorem praesentium est asperiores voluptas ducimus non. Eum velit eaque est architecto eveniet reiciendis recusandae aspernatur.', '32.30', NULL, 12, 1, 0, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(120, 10, 'Ex facere cum', 'ex-facere-cum-S25d2', 'RCJUHAQB', 'Debitis aliquid modi et eaque soluta voluptatem provident.', 'Officiis nesciunt eum officiis voluptas quos. Perferendis hic cumque aut. Quis quisquam nobis in quia molestiae reprehenderit.', '236.99', NULL, 23, 1, 0, NULL, NULL, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(121, 11, 'Quam vel inventore', 'quam-vel-inventore-iAlZg', 'MLEZKCEM', 'Est quae quam sit dolor dolorem autem vel reiciendis.', 'Nostrum commodi et natus porro non ipsum. Ex molestias beatae vel odit cupiditate. Ullam cupiditate ut et neque.', '109.91', '136.85', 198, 1, 0, NULL, NULL, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(122, 11, 'Maiores consequatur voluptatibus', 'maiores-consequatur-voluptatibus-zb0gr', 'OM4LZIC5', 'Commodi et perspiciatis enim quae rerum atque exercitationem laborum quia ea iusto dolorum velit.', 'Quaerat et doloremque molestiae non architecto blanditiis. Omnis voluptatibus veritatis velit et dolorem deleniti sint. Inventore dolorem voluptatem nihil sit. Modi quis nulla iure maxime qui. Sed voluptatibus quo voluptas ipsa deleniti nihil.', '66.30', NULL, 177, 1, 1, NULL, NULL, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(123, 11, 'Qui ea laborum', 'qui-ea-laborum-yfFOe', 'IF6KLW2W', 'Voluptatem aut voluptatem ea esse non expedita nihil quia.', 'Id distinctio suscipit accusamus ducimus est ad facere. Qui molestiae consequatur laboriosam. Consequuntur nulla sequi quia eos error est aut. Dicta molestias beatae sint sunt vel ut quis.', '268.49', NULL, 139, 1, 0, NULL, NULL, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(124, 11, 'Veritatis exercitationem consequuntur', 'veritatis-exercitationem-consequuntur-srQtz', 'VVVPE14O', 'Velit est vitae explicabo autem quo voluptatem ad quo.', 'Enim est itaque veniam sit sint. Explicabo quos amet enim placeat ut non. Assumenda reprehenderit accusantium iste ut est delectus. Necessitatibus rerum fuga similique sed magnam laborum.', '34.69', NULL, 166, 1, 0, NULL, NULL, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(125, 11, 'Sunt praesentium officia', 'sunt-praesentium-officia-kfLWq', 'A6601QPL', 'Sunt sunt inventore recusandae libero et qui omnis consequatur sed perspiciatis et.', 'Ratione in sit et est in tenetur et aperiam. Unde quisquam officia dicta maxime quisquam laborum. Vero rem consectetur eum tempora quod alias aliquam porro.', '181.97', NULL, 167, 1, 0, NULL, NULL, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(126, 11, 'Itaque quod ratione', 'itaque-quod-ratione-6BRpQ', 'QZEEL90E', 'In dolorum velit voluptatem asperiores minus voluptas officia itaque expedita vero nihil eveniet.', 'Quae sequi quos laborum nemo. Et dicta magnam sunt sit. Enim sit illo assumenda quos rerum rerum. Vel voluptatem saepe voluptas fuga. Non doloribus excepturi illum consequatur. Fuga ut atque repudiandae mollitia consequatur est et nesciunt.', '152.56', NULL, 62, 1, 0, NULL, NULL, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(127, 11, 'Maxime ex rerum', 'maxime-ex-rerum-Qduxc', 'U1VHJLFR', 'Quas architecto corrupti provident sunt fugit placeat culpa dicta repudiandae mollitia fugiat ea velit rerum est eum.', 'Odio accusantium quia ullam. Natus ex repellat aspernatur accusantium animi. Voluptas aut quos veniam excepturi dignissimos id tempore. Cumque fuga nisi aut doloremque.', '226.90', NULL, 124, 1, 0, NULL, NULL, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(128, 11, 'Quo nostrum accusantium', 'quo-nostrum-accusantium-Gkamz', 'V94TDMFM', 'Est rerum incidunt officia suscipit aperiam commodi eius omnis a.', 'Asperiores soluta repellendus ex quo. Vel vitae dicta qui aut et. Aut velit qui et corporis.', '256.44', NULL, 45, 1, 0, NULL, NULL, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(129, 11, 'Nulla ut ullam', 'nulla-ut-ullam-3HLzu', 'LZD9MTKJ', 'Porro reiciendis sit omnis impedit et harum dolore.', 'Hic quaerat quisquam vel eum maiores cum similique eum. Repellat quibusdam sunt non ex. Inventore in iste ipsam omnis aperiam enim. Recusandae repellendus et et provident id doloribus. Voluptatem quo omnis illum sint. Sed vel consequatur quia eos ea delectus consequatur.', '66.85', '96.63', 193, 1, 0, NULL, NULL, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(130, 11, 'Temporibus alias quia', 'temporibus-alias-quia-ADTJ3', 'D84XTNMP', 'Laborum repudiandae sed saepe vel voluptates eligendi omnis suscipit assumenda eos.', 'Non alias nesciunt nulla. Inventore ut qui sit molestiae corporis ut illo. Eos ea voluptatem incidunt temporibus.', '111.65', NULL, 121, 1, 0, NULL, NULL, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(131, 11, 'Commodi tempore recusandae', 'commodi-tempore-recusandae-y2LTo', 'YGS62IOT', 'Quod unde consequatur iure enim pariatur cum minus sunt excepturi aut consectetur quae optio et.', 'Sit temporibus distinctio nemo. Ut voluptatem incidunt voluptates. Impedit adipisci ratione quam aut. Ipsa ut et quo repellendus et. Perferendis nesciunt rem voluptatem pariatur omnis praesentium.', '19.97', '32.29', 182, 1, 0, NULL, NULL, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(132, 11, 'Non quo qui', 'non-quo-qui-bJZAv', 'GXPK6O43', 'Doloribus laboriosam consequatur est et earum et qui non ut quia provident harum temporibus animi sed esse.', 'Id nam dolorem ut dolores. Eos magnam aut quas enim vel quidem. Voluptate dignissimos qui exercitationem eius illo.', '165.05', NULL, 6, 1, 0, NULL, NULL, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(133, 12, 'Ut quia velit', 'ut-quia-velit-KaNiZ', 'RBQLQNWK', 'Porro quae et debitis quasi sit suscipit adipisci ut qui adipisci.', 'Qui aut exercitationem quisquam commodi. Exercitationem nemo dolor exercitationem repudiandae. Accusamus aut ipsa velit.', '233.14', '275.09', 92, 1, 0, NULL, NULL, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(134, 12, 'Nihil eos rem', 'nihil-eos-rem-DK0UL', 'IMEY8GXQ', 'Praesentium est et eius fugiat assumenda porro et reprehenderit facilis dignissimos cupiditate amet et quae sunt.', 'Et exercitationem dolorem qui aut. At dignissimos totam sunt excepturi et quis et libero. Corporis animi quia consectetur molestias.', '256.87', NULL, 42, 1, 0, NULL, NULL, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(135, 12, 'Ut quia corrupti', 'ut-quia-corrupti-HWqe4', '5MNIJXZQ', 'Velit voluptatibus et qui modi voluptatem aspernatur debitis.', 'Omnis sint nostrum et eveniet occaecati nihil sapiente. Omnis alias exercitationem iste quo enim est corporis. Nobis consectetur quasi nisi eius. Culpa labore magni libero voluptatum nihil. Amet exercitationem qui non. Quod autem aliquid rerum non ex dignissimos.', '132.19', NULL, 55, 1, 0, NULL, NULL, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(136, 12, 'Quibusdam eius aliquid', 'quibusdam-eius-aliquid-X2ifb', '3DSOVF9F', 'Quis magnam provident dolore modi sequi corrupti qui beatae vitae voluptatem ratione impedit et.', 'Ut odio aliquam illum officia eligendi quas. Et odio repudiandae sed exercitationem ut possimus. Earum quo excepturi corrupti iure autem qui.', '191.24', NULL, 21, 1, 0, NULL, NULL, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(137, 12, 'Quaerat eligendi sapiente', 'quaerat-eligendi-sapiente-qxBtN', 'LYWLSCB8', 'Hic velit vel cumque commodi omnis eos quod ab ex.', 'Consequatur dolores perferendis aut est consequatur expedita necessitatibus quas. Exercitationem autem quidem aperiam reprehenderit. Sed magnam occaecati excepturi expedita ipsa ratione et qui. Assumenda et aliquam corporis atque. Voluptatibus accusantium mollitia non et quia. Harum non quam quia.', '7.90', '15.91', 2, 1, 0, NULL, NULL, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(138, 12, 'Enim harum quam', 'enim-harum-quam-KI3Rf', 'RZUDKL4P', 'Eos autem modi non dolorem et sunt excepturi tenetur ea et sunt cumque nisi ex ullam.', 'Minima dolores consequuntur perferendis corrupti. Magni dolorem nesciunt adipisci illo animi. Qui nisi sit numquam in id dolore ullam. Repellat exercitationem sed accusantium aut. Impedit quos ipsum officia cum.', '218.16', '226.41', 37, 1, 0, NULL, NULL, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(139, 12, 'Fugit libero non', 'fugit-libero-non-Pokqw', '6UYOLIHY', 'Pariatur cum enim quis maiores vitae ex harum voluptas dicta.', 'Omnis voluptas recusandae omnis omnis temporibus omnis qui. At minima suscipit esse autem recusandae eaque modi. Tempora eos optio aut quis quis atque vitae eius. Voluptates quos nihil labore tempora. Et est veritatis laboriosam possimus voluptatem.', '257.35', NULL, 158, 1, 1, NULL, NULL, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(140, 12, 'Laborum et dignissimos', 'laborum-et-dignissimos-xnJlW', 'WXR3MNPL', 'A veniam dolorum fuga in est sed aut id deserunt consequatur ipsam sapiente magnam.', 'Similique et quos culpa vel aliquam assumenda. Eum sit quia est velit laboriosam consectetur est. Vel reprehenderit maiores eum qui inventore est. Non facilis cupiditate assumenda est. Reprehenderit aperiam id quaerat aspernatur qui.', '83.76', NULL, 24, 1, 0, NULL, NULL, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(141, 12, 'Sint quis id', 'sint-quis-id-rsEvz', 'KISTD1TZ', 'Voluptas ut aliquam consequatur debitis sed et reprehenderit vero rem rerum.', 'Saepe enim quidem ut voluptate itaque. Non saepe possimus fugiat est magni minus porro. Optio quas blanditiis vitae inventore nesciunt. Perferendis et ducimus deserunt deserunt sint aut voluptas distinctio. Nesciunt voluptatibus amet qui in est debitis. In quia accusantium autem magnam rerum quam consequuntur numquam.', '202.01', '206.76', 72, 1, 0, NULL, NULL, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(142, 12, 'Tempora ea et', 'tempora-ea-et-sKGVq', 'LG1V7BGA', 'Reprehenderit voluptas sit ut earum unde ex et aut aut mollitia dolor quo maxime.', 'Aut odio perferendis aut explicabo voluptatibus maxime. Necessitatibus quasi nobis aut voluptatem aut nihil expedita. Aut officiis porro repellendus nemo eius ut sequi. Eius qui est voluptatem debitis quam maxime et. Quasi nostrum magni aliquam commodi consequuntur et. Aut earum reprehenderit necessitatibus nemo esse.', '192.78', NULL, 107, 1, 1, NULL, NULL, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(143, 12, 'Aperiam dolor nemo', 'aperiam-dolor-nemo-CzYmO', 'YNUFC6HG', 'Dolor earum corrupti velit occaecati et quisquam sed.', 'Et quis optio distinctio incidunt assumenda quis praesentium neque. Accusantium possimus at distinctio animi. Sit sed aut eum accusamus quos. Ullam ea sapiente molestias. In repellendus rerum dolores autem consectetur ut.', '78.49', '102.61', 116, 1, 0, NULL, NULL, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(144, 12, 'Non quia vel', 'non-quia-vel-bftzI', 'CRVV432G', 'Aut ducimus est sed molestias ut dolorem itaque velit architecto sit.', 'Quibusdam rem inventore ut quia. Libero modi nihil voluptas qui at aliquam hic. Est corporis omnis earum. Minus recusandae quo commodi aut commodi aspernatur sint. Explicabo molestias exercitationem ut esse amet dignissimos itaque.', '16.48', NULL, 164, 1, 0, NULL, NULL, '2025-10-27 21:09:20', '2025-10-27 21:09:20');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int UNSIGNED NOT NULL DEFAULT '0',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `path`, `position`, `is_primary`, `created_at`, `updated_at`) VALUES
(1, 1, 'products/3cd4ec9c-bbb0-42e7-bd4b-06da68a44161.jpg', 1, 1, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(2, 1, 'products/56894770-c368-47ee-88e3-9bc864447de9.jpg', 1, 0, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(3, 1, 'products/2bb34bf6-d786-4721-a2d7-19d139b79ce6.jpg', 2, 0, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(4, 2, 'products/e1b2e25b-b749-4ed8-86ce-4c7a249fe744.jpg', 1, 1, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(5, 2, 'products/035714a1-4b21-4657-be28-6826c15761bc.jpg', 1, 0, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(6, 2, 'products/b005a1ab-44e4-4396-92a3-16a2a698d185.jpg', 2, 0, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(7, 3, 'products/036dc3e4-82d7-451c-a22d-dc7de66f4323.jpg', 1, 1, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(8, 3, 'products/6ac99faf-6c29-4629-bf2a-99a2ad2220e4.jpg', 1, 0, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(9, 3, 'products/e937dd5f-e4e7-42fe-9c5e-c4246d5aa614.jpg', 2, 0, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(10, 4, 'products/eaa7172f-d7c5-4f74-bf3a-dc85842c96e3.jpg', 1, 1, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(11, 4, 'products/6795e0a5-af0a-4b0b-8596-0ba4bfa08955.jpg', 1, 0, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(12, 4, 'products/61e54244-91f5-4f60-aba2-35c9d6db42c1.jpg', 2, 0, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(13, 5, 'products/2344b43a-ca3a-47a5-b9fe-b4e5ce10ff50.jpg', 1, 1, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(14, 5, 'products/34b80c6b-7574-4ac5-935e-f18fa8f05734.jpg', 1, 0, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(15, 5, 'products/d47e8cdd-1d8d-4a24-beed-c518340197c5.jpg', 2, 0, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(16, 6, 'products/3fa50ea4-302b-40d2-8953-928c15db1166.jpg', 1, 1, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(17, 6, 'products/76319e18-3ebc-4d9a-ad20-4effe655d9e1.jpg', 1, 0, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(18, 6, 'products/50d3acfa-8c15-459e-b35f-16cc7cc15c9b.jpg', 2, 0, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(19, 7, 'products/4141ebdc-804c-4b04-9db4-22e0c7ae6e93.jpg', 1, 1, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(20, 7, 'products/7db85519-6a97-4c1e-92d9-902d1d8481d1.jpg', 1, 0, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(21, 7, 'products/4357bd7f-28fb-4952-89a1-d77430fe6825.jpg', 2, 0, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(22, 8, 'products/46481b86-1dc6-43b9-85ec-4acf1c8fa570.jpg', 1, 1, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(23, 8, 'products/7d95091b-341d-4d21-8fbe-78bf7a26f488.jpg', 1, 0, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(24, 8, 'products/08fe25a4-d22e-4b71-b8d4-3e1c62a186f2.jpg', 2, 0, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(25, 9, 'products/5c8e978a-4188-4808-9f4d-70339230fa55.jpg', 1, 1, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(26, 9, 'products/5970e0e3-670a-4bb6-918e-166295b32ba9.jpg', 1, 0, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(27, 9, 'products/7b130d61-fa7a-4cde-871f-137689c2b87a.jpg', 2, 0, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(28, 10, 'products/2d4d055e-293e-4256-855e-871ef927ad1f.jpg', 1, 1, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(29, 10, 'products/f342a092-45c1-4295-9320-646ee1fec819.jpg', 1, 0, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(30, 10, 'products/9d039e39-766d-43a6-bd5a-f802eb5acba6.jpg', 2, 0, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(31, 11, 'products/19f0b472-5ade-4b0c-8787-e61682d00155.jpg', 1, 1, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(32, 11, 'products/b585ecce-0764-4d6c-9f6b-7e0d726c7872.jpg', 1, 0, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(33, 11, 'products/6b43cfab-34e2-4141-ad95-d0cdc9da9898.jpg', 2, 0, '2025-10-27 21:07:34', '2025-10-27 21:07:34'),
(34, 12, 'products/3a6e8f87-6ffe-48c1-924b-fdfa783640a7.jpg', 1, 1, '2025-10-27 21:07:34', '2025-10-27 21:07:35'),
(35, 12, 'products/3a2808b1-8f75-4340-bdcf-d3dee6fd68c7.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(36, 12, 'products/20a01049-7094-493b-a6d9-8d605e360c16.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(37, 13, 'products/1a95f3d7-1351-4843-b10c-59f0ba52cd56.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(38, 13, 'products/345a3fcb-2b2c-4cc1-b27f-2c2664f99f21.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(39, 13, 'products/ef1e8e91-7a57-42be-bfda-7485329bc635.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(40, 14, 'products/9791c751-a3b7-48f3-844d-363a2f43bf89.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(41, 14, 'products/c047a312-9b47-4294-aa20-bbb02dfcbd8b.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(42, 14, 'products/795552b0-ebb1-4f54-8992-c49cfbdcd2c4.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(43, 15, 'products/b5ed9efb-0708-4c22-b461-1a55d861b139.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(44, 15, 'products/2aa9ed3a-4597-443b-a3f4-4016525dfad2.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(45, 15, 'products/0a8150cd-0537-41ef-adaa-cc5b1d77d061.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(46, 16, 'products/2690c2ad-e4f9-4bee-bab8-5c9586dcd34c.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(47, 16, 'products/f8f13593-f7fb-4f2b-a67d-f44cf5332cf7.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(48, 16, 'products/ba35c07f-1664-49ed-bcca-862300947b7e.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(49, 17, 'products/f34bbaab-2dbc-40cc-9ba3-557a8c1f566e.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(50, 17, 'products/ed28a97e-39bc-4999-aff0-cd78af9d10ee.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(51, 17, 'products/e2c93ab0-3869-427f-971c-5311c35460ab.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(52, 18, 'products/312b88ac-5dc1-4dd4-8e25-381df0462efd.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(53, 18, 'products/7faf24c5-0dc7-41a8-9e85-5070fb1788ed.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(54, 18, 'products/f903ea5b-aa52-4c74-95c5-de411d977373.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(55, 19, 'products/5943cc8a-cbbf-43fa-b1af-a76362eb7834.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(56, 19, 'products/eda9774a-9ed2-4fdc-8f10-7eb85498e359.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(57, 19, 'products/dfe88aff-6776-4f94-9e93-d63397ee6b5b.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(58, 20, 'products/93b24374-4524-46b3-b05f-a9a4e00247d6.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(59, 20, 'products/c9152356-86d0-46d8-a658-12eeb29128b2.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(60, 20, 'products/9d3a0b15-12ce-427c-b231-f44b677687dc.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(61, 21, 'products/222ac685-1721-4ee9-9daf-4f96899e856a.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(62, 21, 'products/5e511ca1-ec05-4db4-9484-7b6c290c26a7.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(63, 21, 'products/6d7be13e-ecef-41f3-877d-3c962c0b564d.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(64, 22, 'products/eb77243e-5d94-4e80-8721-38e10a58850d.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(65, 22, 'products/6eca3462-a76d-4291-b834-24d3b2fbd3e0.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(66, 22, 'products/b9339fc6-43cc-4cc0-965b-12caff4a2f29.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(67, 23, 'products/5a05a319-14fe-4b83-bdc2-9d59f4e30dd3.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(68, 23, 'products/cfbf2920-1e35-409b-b83f-c07d4b8a1d8a.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(69, 23, 'products/77f99024-8553-492b-9290-f51bd052a6ba.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(70, 24, 'products/3eabe55b-0211-40d6-8b39-0f458813e507.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(71, 24, 'products/f887e81e-bb42-45b6-927d-200c9e05c3f2.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(72, 24, 'products/dad390a8-1354-4225-80df-1f261cf0c394.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(73, 25, 'products/09d1f16c-035e-4f79-bce5-60c996eac619.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(74, 25, 'products/078d2aeb-6f1f-404e-bc1e-5434b444d6c3.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(75, 25, 'products/734850e0-053e-4f10-b72e-36e8416a85b1.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(76, 26, 'products/04bf4aa3-6212-4bea-b522-6c531beb5fdd.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(77, 26, 'products/8433097d-0f26-4f8c-b369-c79f25f46939.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(78, 26, 'products/901be7d6-b9f9-4857-b5a4-bc274d935876.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(79, 27, 'products/3c70d276-a8ff-4174-bc4a-b3912060afe6.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(80, 27, 'products/b6d742c7-a70e-4079-9213-76ed37ab43a3.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(81, 27, 'products/79149c16-e910-4687-9520-1aa7fb0d3771.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(82, 28, 'products/ae5ff31c-84d3-4530-80f3-c45e4951ff75.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(83, 28, 'products/80314871-ba0f-4538-bd2e-9ced32b08e72.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(84, 28, 'products/cf26eff0-ca46-4707-a6c4-083eea9b4306.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(85, 29, 'products/b8b2282e-69f9-4c36-9eda-8ef1bf18ff34.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(86, 29, 'products/e693ded6-f38d-41ca-9e4a-62eee0e3d139.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(87, 29, 'products/6853bcfa-647f-40b2-bc95-7a6b9493c1a3.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(88, 30, 'products/6a06d368-825d-44b0-987b-f90160bcd2be.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(89, 30, 'products/b9067350-1618-45d8-94e5-9dc2951efa8b.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(90, 30, 'products/49abec57-2124-47ca-ab75-742cb5c55ff3.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(91, 31, 'products/7516126b-7259-451d-9cbc-5089a087a797.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(92, 31, 'products/f553a738-2c8b-4128-996a-3156ae4b900c.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(93, 31, 'products/ab62a509-a402-4f3d-9a1d-39952881a2c5.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(94, 32, 'products/b6be3d46-e892-4bfc-9af0-794b88ed307f.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(95, 32, 'products/01088f03-4a31-46d0-b687-be688d68b3e7.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(96, 32, 'products/252aa90f-1aa1-43ec-b634-6aa722792de0.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(97, 33, 'products/79aa5afa-651e-4669-afc6-550491045bb9.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(98, 33, 'products/16120a34-d142-40b9-8c69-594d8e7c72fe.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(99, 33, 'products/317ab087-fea6-493e-90d4-243a7698dfbf.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(100, 34, 'products/01a38a35-25e6-45a7-87b8-dcf987c86e28.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(101, 34, 'products/60eb3f8a-c6ed-4b05-8987-808bc0cd2bf9.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(102, 34, 'products/1571cf95-c530-4db3-bd9c-99d8c2227bda.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(103, 35, 'products/86ed174c-f1a6-46c7-8f28-8cdb8dfc5b33.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(104, 35, 'products/295f7016-c56b-4d7e-9d8b-106426b63122.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(105, 35, 'products/44e1c8a6-2908-4ae9-af25-f39cbcd7bd85.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(106, 36, 'products/52685c14-716d-479b-9c46-d578d3b433d3.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(107, 36, 'products/1c919017-ed95-45c1-aa71-cb5f6321987a.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(108, 36, 'products/99cdf9ce-c163-4916-97e3-d4f316c572bf.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(109, 37, 'products/4314788d-0e37-4a0a-b031-664a286ee563.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(110, 37, 'products/a920b5df-8bdc-411b-9aaa-4cfc3f820c38.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(111, 37, 'products/bff59bfa-14f9-48d1-b394-cdbf592cf54f.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(112, 38, 'products/54225ba3-2895-4dfa-bab8-c0236903c05e.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(113, 38, 'products/c9e74558-c669-4d8b-a1bf-76fa4d619da0.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(114, 38, 'products/42d04529-ac7c-4976-b07a-30bc63b980dd.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(115, 39, 'products/ee8bf9ee-627c-462e-9d38-694290ca0bbb.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(116, 39, 'products/7ff44a6a-bc0f-4640-963d-6921bc136279.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(117, 39, 'products/c051148e-df0a-4687-baa8-6a8fab7a5f4e.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(118, 40, 'products/b8cb64f8-c02f-4e4f-881b-dcaed7f3aabe.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(119, 40, 'products/a475d0a4-b05c-4be8-b45a-d9106ce72920.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(120, 40, 'products/9460cd3e-b2e6-4b55-9bf4-ca50ab586e75.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(121, 41, 'products/c6b48d92-e1e6-42d7-85eb-eea059f3d10e.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(122, 41, 'products/63943f27-b3bf-41ae-8aa3-2ee64af60ae7.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(123, 41, 'products/996025ee-273a-4627-9132-1a1cb7d51110.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(124, 42, 'products/c4adbaee-21bb-468e-ace1-4eaaab733829.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(125, 42, 'products/5914202b-c9f6-4e30-b274-8d55ebbaec3d.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(126, 42, 'products/fd607819-af61-4334-b384-0827f75975cf.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(127, 43, 'products/c055f211-09d4-48da-bf84-b5ede0ddd2c1.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(128, 43, 'products/09e6aa2c-9cce-4815-97fb-72eee922f0e7.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(129, 43, 'products/755a98cf-d563-410c-afa7-598860941674.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(130, 44, 'products/1222fe1a-1d93-4347-bc66-09b34352236d.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(131, 44, 'products/0107cbdb-0a62-4899-88b7-33dfdd81ee07.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(132, 44, 'products/e99e45e1-5c59-42e6-bcb1-5bf2f50d69d6.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(133, 45, 'products/167bb869-3c91-42c4-9721-4c5ea8b30c54.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(134, 45, 'products/1519fc6b-53d2-4c02-b67a-3e136e55c85b.jpg', 1, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(135, 45, 'products/762730dd-15a3-4270-8908-b77429c6ae3c.jpg', 2, 0, '2025-10-27 21:07:35', '2025-10-27 21:07:35'),
(136, 46, 'products/eea243bc-c72e-4201-be46-23e53d7ebeae.jpg', 1, 1, '2025-10-27 21:07:35', '2025-10-27 21:07:36'),
(137, 46, 'products/b74a888e-7d9e-4dd4-9bc0-f488cf8f2dea.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(138, 46, 'products/52d871cd-7b9f-4026-ac80-e7c8988f48fc.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(139, 47, 'products/11cf5eb1-95a8-4296-93c8-a7ed49cb2c25.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(140, 47, 'products/dd071a94-0501-427c-a3ad-585830a6b56d.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(141, 47, 'products/73405caa-eea0-4acf-a511-3ae2fe487af0.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(142, 48, 'products/c5fa0d8f-af13-4f14-a0d3-d90ec193ee92.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(143, 48, 'products/dfe5aa12-7577-4d1d-b696-a4186abf7783.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(144, 48, 'products/0c73d1c9-adc0-4ebe-b445-68454ba0e97f.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(145, 49, 'products/6a69cd23-eb29-4ac2-abe0-538b62bfd937.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(146, 49, 'products/5b07ac7a-8b38-4d34-b085-37d335e0de46.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(147, 49, 'products/b8dc2f12-ac26-4039-a95a-a9468b57a271.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(148, 50, 'products/95bc2297-968d-4bc9-8da1-03c47540919c.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(149, 50, 'products/e26312d8-88fd-4503-8e84-df5d1429b40a.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(150, 50, 'products/d49bd127-af98-4164-8b42-13fc89d3acd1.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(151, 51, 'products/67c6613c-a508-426b-8ca0-0082418fb364.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(152, 51, 'products/53350b1d-766c-444b-9953-c41eee7e9a24.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(153, 51, 'products/36127363-b8bd-4526-8833-82575bdf3bc8.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(154, 52, 'products/ac9104a4-233c-40ad-95cb-87110197220a.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(155, 52, 'products/a464bf0a-2b21-4095-a4c0-56b714872503.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(156, 52, 'products/75cf68dd-7c13-4a43-ab6d-6887ffb37882.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(157, 53, 'products/2062f464-835a-4b0e-9c1c-833b477fbcdd.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(158, 53, 'products/178a38a2-6995-4b09-99b1-1379029b2a5c.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(159, 53, 'products/0158aa1c-48ef-4240-b632-ad12e1ba1411.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(160, 54, 'products/5c247662-7fab-4a27-b3c2-18dcc0aa0892.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(161, 54, 'products/4c8b000b-cf89-4bf7-8ae7-93cffb3500db.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(162, 54, 'products/2caf8cf4-2e45-4bca-b71f-109864996880.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(163, 55, 'products/698a0da9-e41c-44fd-92a7-5c72e8276e79.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(164, 55, 'products/5d34d0c8-dfa0-4e6c-ba7a-d27dc82304df.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(165, 55, 'products/053b0606-5078-4275-aee4-ab25d97c4914.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(166, 56, 'products/153c5e75-ab0f-469d-a6eb-33acebd4ad58.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(167, 56, 'products/54f0b8b5-2c90-44a5-a915-d21258d7f6c7.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(168, 56, 'products/7a6ed9b3-150a-44b6-8834-1abac3670168.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(169, 57, 'products/9b615d1e-bac5-4073-9672-af711568a554.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(170, 57, 'products/e219e547-9e91-4a82-a8f7-6b740a81e6b9.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(171, 57, 'products/b5fa546a-8e98-4319-a0a8-2a2be93be530.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(172, 58, 'products/c2b63335-6fca-4fae-8f95-25f3d3f1b871.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(173, 58, 'products/63f79ae2-125b-41ac-b836-e6317bc0abe8.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(174, 58, 'products/83e3e8fe-8df6-4d3b-b531-87ead74cf3e6.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(175, 59, 'products/f3c72806-e6a5-4549-a170-b06b08b8d02a.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(176, 59, 'products/5d4b15e9-4805-4016-b900-b46ed51899c0.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(177, 59, 'products/e5e49072-0960-4edc-98da-18f107afb607.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(178, 60, 'products/1dfd0c90-6c17-49f2-83f9-ee4701afe1d2.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(179, 60, 'products/bab24fbe-29d3-498c-a593-4611007b5275.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(180, 60, 'products/ea11b75c-2687-4559-8142-65484b3a987b.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(181, 61, 'products/2a265d01-7d9c-4d4a-a2ec-7e892e6abaef.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(182, 61, 'products/dafccb7b-b3de-4be9-a84b-be7b39ac46b9.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(183, 61, 'products/7dc0cd4c-0c63-4d75-938f-6ae74a5656bb.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(184, 62, 'products/82c1e5f4-6fec-44ec-a217-85db115474ab.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(185, 62, 'products/59bab136-4340-47ac-bdf7-cc601f2904d2.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(186, 62, 'products/cb9ca2a4-c0f6-4854-82d2-63eda4dc8c53.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(187, 63, 'products/42948524-ed7d-4424-b329-a92067eb3304.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(188, 63, 'products/40f5e0a3-1dc4-464f-b321-d6b3b7bb1678.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(189, 63, 'products/a1496c4d-1c37-4228-875e-b7b0f6a523c4.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(190, 64, 'products/84ec313c-6b9b-4e5d-92b9-a0ed84eb72da.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(191, 64, 'products/08f8e305-469d-46e1-b6d9-d942ffd43eaf.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(192, 64, 'products/45ada8b0-715f-4371-918e-adecb13a231c.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(193, 65, 'products/3a7feb0f-a3f7-47e9-a651-78b909a41fb0.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(194, 65, 'products/65e2f107-3f44-4b2a-aa68-5f32f49fe764.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(195, 65, 'products/765650f8-06f8-4ffc-8721-e1118e14ea43.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(196, 66, 'products/02e44870-5fc8-4a33-b008-b8cba7a71021.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(197, 66, 'products/14e006a9-63c2-404b-bf66-9a6001daccd1.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(198, 66, 'products/ba77954f-2e7e-471a-98a6-36496e695156.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(199, 67, 'products/402a1663-b94a-4666-86d2-2699eaa135c7.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(200, 67, 'products/e45eb91e-e4a8-4cd2-863c-0ed170fb55c8.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(201, 67, 'products/37342108-c2fa-4548-a396-c3a31f5c63cf.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(202, 68, 'products/530af43e-670e-47fd-9e03-12f784ed6201.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(203, 68, 'products/31a75786-873b-4639-9df3-d8e9833d9b0a.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(204, 68, 'products/78ab8c06-5a89-47c0-b1d6-0df2706ba8f2.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(205, 69, 'products/2c5d7334-0993-43cd-984b-402c1b4fe62c.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(206, 69, 'products/bb81d191-3f5b-40f2-8d10-723205850505.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(207, 69, 'products/91780f47-3be1-48b7-80d8-d345be396764.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(208, 70, 'products/2cfdc98b-2b3c-4246-933e-02fbde04f056.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(209, 70, 'products/ba0c3072-2f8e-415c-b5f3-4a74c1012f02.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(210, 70, 'products/97dbb06e-a66b-4d31-9f2a-8f694f7893c7.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(211, 71, 'products/89944154-6239-4be1-8e9c-da07f320327c.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(212, 71, 'products/424a3990-355b-4e45-aadf-56f5ac481830.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(213, 71, 'products/3861b77c-b249-40f3-a20e-b2b4738b6c2f.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(214, 72, 'products/dd776ffe-ee87-441e-a32c-ac03a998b7c1.jpg', 1, 1, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(215, 72, 'products/aa082a2d-e2f1-4e88-8729-788b009d3396.jpg', 1, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(216, 72, 'products/cb74f106-0cf5-4c67-b229-8d12c558e31d.jpg', 2, 0, '2025-10-27 21:07:36', '2025-10-27 21:07:36'),
(217, 73, 'products/5035a9f8-44d2-4cd9-9c4a-e72a4ddeb17f.jpg', 1, 1, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(218, 73, 'products/02c8eb00-ea40-4042-a189-56324d32cb37.jpg', 1, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(219, 73, 'products/777707e3-2857-4543-adae-2ed45aa6dd50.jpg', 2, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(220, 74, 'products/3f1de326-9422-4601-9031-5b0389fe5f52.jpg', 1, 1, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(221, 74, 'products/f4d8d5e3-b5f7-441f-9fea-6f115ce1a92a.jpg', 1, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(222, 74, 'products/6f99ddec-eb3a-43e8-b03b-e1737fdff9f7.jpg', 2, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(223, 75, 'products/97a2e34b-a406-4c51-96ce-8508295fb64f.jpg', 1, 1, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(224, 75, 'products/86d5bb9c-a493-49ae-b442-3be412ea435c.jpg', 1, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(225, 75, 'products/aa6dd447-b05e-4048-b0ec-c43fd91a26b2.jpg', 2, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(226, 76, 'products/5a174c93-4505-4787-a688-6acaa51235ae.jpg', 1, 1, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(227, 76, 'products/764f585d-904b-470d-91be-b081e17f4f84.jpg', 1, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(228, 76, 'products/d15ba5f0-3e7f-4617-b96f-8ef5bd92d4e7.jpg', 2, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(229, 77, 'products/98d4a14f-d59c-415d-baeb-d11d1f6e0fe2.jpg', 1, 1, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(230, 77, 'products/3426e5db-8fa7-4cc6-aa07-c946c26d3e1d.jpg', 1, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(231, 77, 'products/60679269-7b2a-4ff1-b15b-91c4f8786362.jpg', 2, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(232, 78, 'products/2e3a6790-16a1-4356-b19a-9d9759de1f4e.jpg', 1, 1, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(233, 78, 'products/e1d52107-47bf-4ad5-9787-e623554edcfc.jpg', 1, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(234, 78, 'products/50dc4200-dc94-499b-abde-58c1c3a3c3bc.jpg', 2, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(235, 79, 'products/2babd9ed-b3e6-4959-8566-f9aadfcb2398.jpg', 1, 1, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(236, 79, 'products/185bd26f-4df8-44b6-adce-93831adb6ba8.jpg', 1, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(237, 79, 'products/8cb1aa32-9685-44b1-b432-24712bbf49d0.jpg', 2, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(238, 80, 'products/9d608840-1b2d-4d42-b973-857b03787ad4.jpg', 1, 1, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(239, 80, 'products/334142d6-09e0-44a9-958a-add6cec07881.jpg', 1, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(240, 80, 'products/30d02748-fd98-452a-944c-f7a46ed38b4c.jpg', 2, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(241, 81, 'products/a65db070-d6cd-42ff-aa82-4737d7b51552.jpg', 1, 1, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(242, 81, 'products/8e94c84d-5ce2-4a97-a3c8-59a355675369.jpg', 1, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(243, 81, 'products/3bd4cad5-bc9a-4bbd-80ec-531aa33f6c60.jpg', 2, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(244, 82, 'products/b42a73ce-d30f-4985-be28-bd1c4ac98ea2.jpg', 1, 1, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(245, 82, 'products/ebfdddcc-40d1-4d01-8bd1-5e993e52e558.jpg', 1, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(246, 82, 'products/4ce6d873-c712-460a-aafb-e9e24ea6ddbd.jpg', 2, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(247, 83, 'products/75f939f5-86e5-46eb-8229-d1fe879d30cc.jpg', 1, 1, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(248, 83, 'products/2b6eb562-d0b1-4c66-a8df-c045aede3a39.jpg', 1, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(249, 83, 'products/f5b6bf48-8220-4a9b-b381-3c3ea87630e3.jpg', 2, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(250, 84, 'products/65b96871-7221-4a3a-8e02-6d53118fbd7e.jpg', 1, 1, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(251, 84, 'products/e157ebe5-c358-45c7-9e1a-d70786d4d9fa.jpg', 1, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(252, 84, 'products/380dc77d-9ae9-4ac4-bb5e-4cfdc7659664.jpg', 2, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(253, 85, 'products/f493f523-3413-461b-888e-56d9d94db6f4.jpg', 1, 1, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(254, 85, 'products/db3892e2-3632-4f2d-a241-e838bfe3dea9.jpg', 1, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(255, 85, 'products/2f897efd-bf10-40da-a31f-8f6ae4901e9a.jpg', 2, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(256, 86, 'products/b4b6dfae-9181-4910-bda2-e5e8e2c7a651.jpg', 1, 1, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(257, 86, 'products/bc843b35-e912-426c-995a-e9ab36637a22.jpg', 1, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(258, 86, 'products/dd149366-db50-4a29-8133-80da0c495413.jpg', 2, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(259, 87, 'products/faa85358-f5da-4536-ad75-934d111a5a4a.jpg', 1, 1, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(260, 87, 'products/df28f3ec-43de-40c1-a672-4c693207bf45.jpg', 1, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(261, 87, 'products/91b6ba4f-ecf7-4075-972f-92111a6e2b72.jpg', 2, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(262, 88, 'products/666b9b3f-bd8d-469e-9d36-4e42eda03281.jpg', 1, 1, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(263, 88, 'products/61960d6b-32c0-4051-91c7-baf20a0450b7.jpg', 1, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(264, 88, 'products/0b126339-efc5-48b6-a82f-b4d823828e17.jpg', 2, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(265, 89, 'products/a64ca2f9-9b1d-449c-82d5-65fb33cce1f3.jpg', 1, 1, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(266, 89, 'products/18b8ec0f-1499-467e-bc2f-b4f4a47c2990.jpg', 1, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(267, 89, 'products/b2cff7ba-14df-46bd-901c-939110558733.jpg', 2, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(268, 90, 'products/f95beefb-b2d0-49a8-b5ef-fce6aece76bc.jpg', 1, 1, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(269, 90, 'products/943b0a6a-af78-4850-99ad-5ab2d302e678.jpg', 1, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(270, 90, 'products/75422368-7c40-4cb5-a321-93bd4641ac4a.jpg', 2, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(271, 91, 'products/f1a93a72-1707-41d5-8bf0-a86d19fac401.jpg', 1, 1, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(272, 91, 'products/5f6df330-cac5-442d-afe1-9d0890aaa5b3.jpg', 1, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(273, 91, 'products/17b62abc-dcb3-48fe-8cef-7a0fdf7d31e0.jpg', 2, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(274, 92, 'products/96e557e7-e4e6-4fda-a47e-6f877002ef90.jpg', 1, 1, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(275, 92, 'products/10d1db7c-804c-431e-ad2b-270ab962ca60.jpg', 1, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(276, 92, 'products/905b0390-5bdf-4438-9c46-719b2ac0694e.jpg', 2, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(277, 93, 'products/9eba7a8a-1aa3-4bcf-924e-92a1c4ea5f01.jpg', 1, 1, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(278, 93, 'products/4999af00-18e0-46c8-b760-eb0309a22d89.jpg', 1, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(279, 93, 'products/636940e0-ad13-410a-b89e-4913b2368c27.jpg', 2, 0, '2025-10-27 21:09:17', '2025-10-27 21:09:17'),
(280, 94, 'products/a63d2630-5a2f-44b9-93fa-07f0a0112eb4.jpg', 1, 1, '2025-10-27 21:09:17', '2025-10-27 21:09:18'),
(281, 94, 'products/26388be8-aab6-4cac-9f7f-821e15c9511b.jpg', 1, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(282, 94, 'products/8c6631ca-3d62-4c67-a11e-743e5511e428.jpg', 2, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(283, 95, 'products/ae6c9961-4865-4e1a-ad9c-78ceadabc3b4.jpg', 1, 1, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(284, 95, 'products/f2a23961-19e2-4b4d-b368-070539b8eec2.jpg', 1, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(285, 95, 'products/1d632387-9f40-4d64-a75d-518878fc7032.jpg', 2, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(286, 96, 'products/ca42240e-358f-4534-b2ca-2a0ef2781017.jpg', 1, 1, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(287, 96, 'products/1d407092-afb7-4b36-98e4-06eaffb48e58.jpg', 1, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(288, 96, 'products/8945c9bd-302e-4bc7-be95-ca7163ec54e7.jpg', 2, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(289, 97, 'products/8dfd37d4-cbc5-4e54-a963-3d11ea41d20b.jpg', 1, 1, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(290, 97, 'products/574d0fbe-e5b3-4dab-87b9-e51d7141ac84.jpg', 1, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(291, 97, 'products/733d373c-9ad9-45b1-a105-b309fcedd8be.jpg', 2, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(292, 98, 'products/34a48e75-0920-4dd0-a4d5-24ceb8f4828d.jpg', 1, 1, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(293, 98, 'products/31bd1769-27da-41c3-9023-4ea0f3ff6df5.jpg', 1, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(294, 98, 'products/8f6daf73-3e39-4e8f-9aaf-f84facdd286d.jpg', 2, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(295, 99, 'products/a33a08df-2c41-4352-b0cf-e8f934bea066.jpg', 1, 1, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(296, 99, 'products/a91ca678-d5da-4eb0-868f-9a6b28eb4fa8.jpg', 1, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(297, 99, 'products/acb551b1-388f-487d-9d18-d11e5b772ac0.jpg', 2, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(298, 100, 'products/73ce49ae-52ea-477e-b638-25739063f73e.jpg', 1, 1, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(299, 100, 'products/b81442e1-0bc4-4bd5-9c00-563556f13d80.jpg', 1, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(300, 100, 'products/dddfbb3d-c15d-432e-a553-a822670de184.jpg', 2, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(301, 101, 'products/095f8637-da4f-4e5c-9fdc-6f36df0d46fb.jpg', 1, 1, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(302, 101, 'products/6baccfcf-0224-41ad-b148-e7e2e61dcdc9.jpg', 1, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(303, 101, 'products/b1a6cf19-d581-4109-a1a6-afe90accc1ce.jpg', 2, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(304, 102, 'products/006f5c1b-3b87-455e-a30a-bc7cc3003a42.jpg', 1, 1, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(305, 102, 'products/89fb0c4d-a3fe-4db7-88c7-61cba002eb70.jpg', 1, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(306, 102, 'products/c602219d-433b-49c8-844d-353a52eb35af.jpg', 2, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(307, 103, 'products/2edb9a23-deb0-43bd-8751-6ac320250112.jpg', 1, 1, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(308, 103, 'products/9b6f3501-70e8-4c1b-bc55-d22c3369f35f.jpg', 1, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(309, 103, 'products/c1ded198-2e27-4e54-9eea-8342ad6c808f.jpg', 2, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(310, 104, 'products/1b7d5f1b-5827-4a6b-a456-26e041fe87ab.jpg', 1, 1, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(311, 104, 'products/9a3da997-57e1-4cdc-92e2-26c3ce0a9537.jpg', 1, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(312, 104, 'products/146bbdb1-8e53-43f8-aef3-27a8339df204.jpg', 2, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(313, 105, 'products/7fad0890-903f-4e00-b0f8-71cf331775c8.jpg', 1, 1, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(314, 105, 'products/fe0097af-fa3c-492e-b16f-822ac6d6201d.jpg', 1, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(315, 105, 'products/9183e64c-1718-4ceb-b509-e4eeb307f6bb.jpg', 2, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(316, 106, 'products/752f162b-b0a5-4e72-8fd9-985a4b66f40b.jpg', 1, 1, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(317, 106, 'products/787e02bb-39c7-4c97-8498-f96e7afc7137.jpg', 1, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(318, 106, 'products/59248490-ce4c-4923-a10a-d9d5f990a615.jpg', 2, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(319, 107, 'products/3040181f-2d38-4b59-8ead-9ff9b79927a8.jpg', 1, 1, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(320, 107, 'products/452e3b55-4ecb-4829-acce-640a3fb56f5b.jpg', 1, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(321, 107, 'products/888b44ca-d544-43d9-9ef9-3f3301eb4fbd.jpg', 2, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(322, 108, 'products/41aef647-dcdb-4a0e-b0a4-e16ec16611c3.jpg', 1, 1, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(323, 108, 'products/f2eca60f-2b7e-4f8a-85b9-e82a80b253a5.jpg', 1, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(324, 108, 'products/33de12da-d61a-4f45-9b7e-e59f78357897.jpg', 2, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(325, 109, 'products/f32fbe61-f3fe-4892-a4b0-d0b417ccf1a5.jpg', 1, 1, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(326, 109, 'products/2b41843f-125a-488f-952a-7a4fdafe49e3.jpg', 1, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(327, 109, 'products/527cd842-d0fc-4898-b1e3-51a2fa389e4f.jpg', 2, 0, '2025-10-27 21:09:18', '2025-10-27 21:09:18'),
(328, 110, 'products/e1c9fba7-b7a9-465d-8489-caaaadc38257.jpg', 1, 1, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(329, 110, 'products/bf153b99-e997-4cb9-8c91-2bb0a1a95e04.jpg', 1, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(330, 110, 'products/183adedc-d774-454c-ae2c-8249ff3058cb.jpg', 2, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(331, 111, 'products/5893be53-c921-4b78-907d-db262de03a5a.jpg', 1, 1, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(332, 111, 'products/941a882a-b391-4794-9bb0-1b56993c24e5.jpg', 1, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(333, 111, 'products/014a8003-671e-46ac-bc2f-f9235f5b1212.jpg', 2, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(334, 112, 'products/65c8ea49-d302-4108-ae4e-f98342fa717a.jpg', 1, 1, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(335, 112, 'products/ac030d60-3d2c-417b-b165-41bb4a569aad.jpg', 1, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(336, 112, 'products/edf97627-cf61-43e2-9720-3b5d99dd3afc.jpg', 2, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(337, 113, 'products/b7f72659-0dfd-4c96-a692-25933f9929eb.jpg', 1, 1, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(338, 113, 'products/3bac2d84-1aab-4836-b795-14877ef19efb.jpg', 1, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(339, 113, 'products/519ae0df-8f9e-4664-95bb-4760e3a2e037.jpg', 2, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(340, 114, 'products/5d03978b-f77c-4b7c-add0-a22ad4518fea.jpg', 1, 1, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(341, 114, 'products/2dc07dec-243f-450d-a024-db7c5733afbf.jpg', 1, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(342, 114, 'products/c47aaf97-2709-4d3c-bd5c-89e193fea526.jpg', 2, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(343, 115, 'products/afe937da-ef6c-4ec5-933d-4a4f3c8eabd8.jpg', 1, 1, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(344, 115, 'products/745b0dff-8176-4ce5-877b-5c443fc6602f.jpg', 1, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(345, 115, 'products/ad159444-4eae-428d-95db-3d530411e792.jpg', 2, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(346, 116, 'products/6e61a24b-545b-4e4e-968c-8dc0d7b26920.jpg', 1, 1, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(347, 116, 'products/e622e628-19a3-4b0f-83dc-6d4f42c8351f.jpg', 1, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(348, 116, 'products/7b48cc0d-fb0a-4237-b0af-ca1dd5db1151.jpg', 2, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(349, 117, 'products/db47bdb7-e1fc-489c-bcf8-d1813413463c.jpg', 1, 1, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(350, 117, 'products/86e38240-cbba-4130-bf5b-5975c4a1afb0.jpg', 1, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(351, 117, 'products/db0c9e10-8068-4c42-8d38-30bc0335f5dd.jpg', 2, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(352, 118, 'products/d53350ea-6d89-43a2-abf5-6d9ffd4a812e.jpg', 1, 1, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(353, 118, 'products/d1b6f3cd-d9e0-4d9e-9e71-9727f2bbe18a.jpg', 1, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(354, 118, 'products/533bc34c-9119-4253-8706-ac18ccf60494.jpg', 2, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(355, 119, 'products/4f81a1bd-f922-413a-bc42-bbf2cef93dee.jpg', 1, 1, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(356, 119, 'products/7065a56e-6021-42bc-8834-607f637ff6f7.jpg', 1, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(357, 119, 'products/f607aee7-c6e3-4eb9-9c9f-d14b1ec70bf5.jpg', 2, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(358, 120, 'products/94e049a7-7c5b-47d6-825f-8f40d9959af5.jpg', 1, 1, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(359, 120, 'products/6c75d5fd-e6ea-4de6-bf11-0186c14591f3.jpg', 1, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(360, 120, 'products/35f63d8f-7091-4bcb-a9ea-f52365157814.jpg', 2, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(361, 121, 'products/d6a7fc24-61af-41db-b44b-45509d38bf87.jpg', 1, 1, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(362, 121, 'products/febd549c-2156-49b7-a29a-e4e1967bc387.jpg', 1, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(363, 121, 'products/395b3964-1b84-4759-b884-9c4ce322e8cd.jpg', 2, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(364, 122, 'products/8033480c-170d-438a-b196-ca005575df5f.jpg', 1, 1, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(365, 122, 'products/ed5c67e2-13a5-4c8a-8f0f-541211c1c5f5.jpg', 1, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(366, 122, 'products/52e81890-161e-4598-9280-1cee40d524dd.jpg', 2, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(367, 123, 'products/1bfff2ff-d523-4551-b8b1-bc997c9176ed.jpg', 1, 1, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(368, 123, 'products/e2bad185-1049-4afa-af7b-e83c1641e8d2.jpg', 1, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(369, 123, 'products/fbf90afd-bbba-4844-9fae-d889e99c126b.jpg', 2, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(370, 124, 'products/6685168a-41a2-4d17-a35f-e50ca982343d.jpg', 1, 1, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(371, 124, 'products/dfea7a21-be96-4184-92ec-e4a0554aa554.jpg', 1, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(372, 124, 'products/f9f22eb1-27df-47b7-b790-c19383d97e8e.jpg', 2, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(373, 125, 'products/ba50e356-0f23-497e-b4f9-d7b6ceab0d04.jpg', 1, 1, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(374, 125, 'products/3f42e815-d77a-4c2a-bdec-98fa8178c541.jpg', 1, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(375, 125, 'products/f220320f-2e44-4f61-b8f5-1dd05d266f83.jpg', 2, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(376, 126, 'products/330ce7cd-97cf-4585-b502-dcea20761e5b.jpg', 1, 1, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(377, 126, 'products/939ccf8b-85b0-4c7b-81c5-2ef765b26c13.jpg', 1, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(378, 126, 'products/5ef00ac0-2a33-4d2c-9e75-abeaa3aa8b3d.jpg', 2, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(379, 127, 'products/29328564-4feb-4527-9fa7-f72137d42372.jpg', 1, 1, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(380, 127, 'products/fcd730de-c182-45fd-ae94-e8469c3b8439.jpg', 1, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(381, 127, 'products/21787b45-7dd2-488c-a0a1-fad400b80a62.jpg', 2, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(382, 128, 'products/9bae11c6-3dca-4fed-9422-1f6f0a561ac1.jpg', 1, 1, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(383, 128, 'products/22fe44a2-209f-4500-ac1b-3e629e19a809.jpg', 1, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(384, 128, 'products/0f78bece-66b5-4bec-8984-831f2caac9c8.jpg', 2, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(385, 129, 'products/be8b6cea-a526-4931-b1a3-51e7ad02673e.jpg', 1, 1, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(386, 129, 'products/4f7a377e-e958-48d9-a8ff-ae49842693d1.jpg', 1, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(387, 129, 'products/514e3bb5-9d6d-45d2-9154-133a55565864.jpg', 2, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(388, 130, 'products/8973a8a2-8d88-41c9-91ed-b8f78f535a75.jpg', 1, 1, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(389, 130, 'products/3f2422d1-509c-4396-b68d-b61e626e9106.jpg', 1, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(390, 130, 'products/6ab1417d-f4ab-454b-b84f-2766c273314d.jpg', 2, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(391, 131, 'products/cc7e4d19-21b2-4fcc-8d98-7fdc904219f6.jpg', 1, 1, '2025-10-27 21:09:19', '2025-10-27 21:09:20'),
(392, 131, 'products/f0482a0b-6dc3-4131-9737-ed452ab833e9.jpg', 1, 0, '2025-10-27 21:09:19', '2025-10-27 21:09:19'),
(393, 131, 'products/26d6b3ac-a762-48dd-857c-c1b98d704e72.jpg', 2, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(394, 132, 'products/69ee3722-4b4f-41eb-8de5-f1addfae5424.jpg', 1, 1, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(395, 132, 'products/3b0f68bc-0b7b-4fd5-8aa4-ee9c152dd97d.jpg', 1, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(396, 132, 'products/3fe5adfd-d7c4-4ac9-b81a-46c777defdce.jpg', 2, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(397, 133, 'products/11f849d3-6565-4f81-8a7e-b10d20129e90.jpg', 1, 1, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(398, 133, 'products/1745ee3f-06d1-4bdf-af5f-cbca13adb924.jpg', 1, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(399, 133, 'products/ad53fe8f-ed3d-4932-8d4b-3e321940a5a6.jpg', 2, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(400, 134, 'products/1c5a29f2-7792-400a-bbbd-8fcec19caf4d.jpg', 1, 1, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(401, 134, 'products/ccb0873d-5711-4764-9026-e7b4bdcc879f.jpg', 1, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(402, 134, 'products/bf5831af-f4f3-46e4-95da-c25a57abb407.jpg', 2, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(403, 135, 'products/dd9ba97a-f031-4b82-bd5f-c98f31eaefbf.jpg', 1, 1, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(404, 135, 'products/a9cdbcbf-cd04-4a15-b303-159f236a6a5c.jpg', 1, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(405, 135, 'products/fb76a5df-29c8-451d-83f6-5834db43c4cb.jpg', 2, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(406, 136, 'products/601ea6f7-3cef-44cb-9b97-9e511f7cc8cd.jpg', 1, 1, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(407, 136, 'products/03f35220-3a1f-4cc8-841d-ac705f9f98b7.jpg', 1, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(408, 136, 'products/5421b244-786f-4614-a6ce-2573eae0f3ab.jpg', 2, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(409, 137, 'products/635685dc-9e8a-48e1-b86d-48ab0373b777.jpg', 1, 1, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(410, 137, 'products/d9f6d624-6e8a-43b4-a5e3-7e3420e3bec9.jpg', 1, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(411, 137, 'products/36e48350-395c-46fe-88cf-4b96caf170e0.jpg', 2, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(412, 138, 'products/a2536047-363d-4ac9-94ac-2c12eb0112a4.jpg', 1, 1, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(413, 138, 'products/e3068bec-9847-44dd-b62a-4fa542f1cc83.jpg', 1, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(414, 138, 'products/a8a6a49c-429e-49e2-b4a7-9be96eac4e5e.jpg', 2, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(415, 139, 'products/c9da365b-94e1-45bf-b949-17e9bd2d5ebf.jpg', 1, 1, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(416, 139, 'products/4b334afa-9d08-4d9a-879d-b00b75029373.jpg', 1, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(417, 139, 'products/cbb08b86-285e-4ba5-8a55-0e518a96c538.jpg', 2, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(418, 140, 'products/39e9b4cc-6f4f-443c-8ac8-3673ea63b1d1.jpg', 1, 1, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(419, 140, 'products/c4d54b5d-3ffb-45ea-ad91-e40282a543f4.jpg', 1, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(420, 140, 'products/89efb582-1bdd-4a7b-89fd-16d4929eae89.jpg', 2, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(421, 141, 'products/a1b28bca-17e8-4b71-a294-27a940eeed78.jpg', 1, 1, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(422, 141, 'products/546e68f4-830b-4daa-96e7-1e5128f4e3ab.jpg', 1, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(423, 141, 'products/e3432c2b-7a44-4973-85e5-3f21f30522c6.jpg', 2, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(424, 142, 'products/e3d5cce6-b5e4-487d-914e-0d431c9d9b78.jpg', 1, 1, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(425, 142, 'products/99a68128-453f-4bbe-a3a6-97d771999c7a.jpg', 1, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(426, 142, 'products/0a767465-081a-4699-855c-20eaf989ffca.jpg', 2, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(427, 143, 'products/2ff97f57-c5e6-4ca2-9814-b394f2b93091.jpg', 1, 1, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(428, 143, 'products/193ed975-ac0f-4f7e-837d-2f4013742dba.jpg', 1, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(429, 143, 'products/e99521d4-518e-47cd-8ca0-48d170f87795.jpg', 2, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(430, 144, 'products/eaa2be39-ea69-42ab-b199-8907c512a742.jpg', 1, 1, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(431, 144, 'products/94c8b98e-6210-4a56-a361-f260ffd3bab8.jpg', 1, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20'),
(432, 144, 'products/be2dd69a-ebea-4587-b366-e25f13642d3f.jpg', 2, 0, '2025-10-27 21:09:20', '2025-10-27 21:09:20');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `rating` int UNSIGNED NOT NULL DEFAULT '5',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `is_verified_purchase` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `product_id`, `user_id`, `order_id`, `rating`, `title`, `comment`, `is_approved`, `is_verified_purchase`, `created_at`, `updated_at`) VALUES
(1, 138, 2, NULL, 2, 'test', 'https://ecommercelaravel.test/admin/site-settings', 1, 0, '2025-11-06 20:30:37', '2025-11-06 20:30:57');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin', '2025-10-27 21:07:34', '2025-10-27 21:07:34');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('16KDVLUFvP2zglZFsyQm2F6ulfi4c5IHn67Bi4cu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0) Gecko/20100101 Firefox/144.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidkdZazVTeWphOW5uMmV6ZUZucERMeWd5QzlrbERGeVg5N1RMdFNXRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vZWNvbW1lcmNlbGFyYXZlbC50ZXN0IjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762484502),
('1KWI7wNYpkYnFDbVUnzAHQPUDJ30BOsvEn4uxoRT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0) Gecko/20100101 Firefox/144.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMlVzdTUydzlIS0hnMVE3bWdvUlp0dEZZMnpUNHpvNjV0NW9zNnUzaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9lY29tbWVyY2VsYXJhdmVsLnRlc3QvYWRtaW4vcHJvZHVjdHMvMTM5L2pzb24iO3M6NToicm91dGUiO3M6MTk6ImFkbWluLnByb2R1Y3RzLmpzb24iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762479775),
('6cjFUSgi9GWvh8igYvbL0dZo1TPZH7Eek14gdJ6P', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0) Gecko/20100101 Firefox/144.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXFwa2VPMjZZMlRUYU1yUGZyWjVjaTNzMWpDSVVkaXN6NTZidDlsUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9lY29tbWVyY2VsYXJhdmVsLnRlc3QvbG9naW4iO3M6NToicm91dGUiO3M6NToibG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762479975),
('aLkew6ZyVg0SHHxZCVVmzd641lualv2hrBsg1Mrw', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0) Gecko/20100101 Firefox/144.0', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiWlpicWJ0MUJ3dDhNVllDd2FXNU54TkxoZ0lHMlB1RWJ1amtlSGlISCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vZWNvbW1lcmNlbGFyYXZlbC50ZXN0IjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjE5OiJ3aXNobGlzdF9zZXNzaW9uX2lkIjtzOjM2OiI0ODlkNTA3Ny1kMWRkLTRiYzEtOTUwMy01OTEzMzEzOTkzNzYiO3M6MzoidXJsIjthOjA6e31zOjUyOiJsb2dpbl9hZG1pbl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjE1OiJjYXJ0X3Nlc3Npb25faWQiO3M6MzY6IjJkZWRjZWY0LWQ2MWYtNDI5MC1hZGRlLTYzZDg3ZmZkMTQwOCI7fQ==', 1762484882),
('aQHiBXxxUwdQ385o50r1OBDlHVd82UyZXjgfRPqA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0) Gecko/20100101 Firefox/144.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib01EZFJhMFZ2em15S3FmUFU5MUxUdkNGTENXSnhKdlRlUkE2dzQxeSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9lY29tbWVyY2VsYXJhdmVsLnRlc3QvYWRtaW4vcHJvZHVjdHMvMTQwL2pzb24iO3M6NToicm91dGUiO3M6MTk6ImFkbWluLnByb2R1Y3RzLmpzb24iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762479774),
('Dx10nybjiBaBeIE6PhTHTWx4PgI2bk6DCMaSEpQU', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0) Gecko/20100101 Firefox/144.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTWNxVUQ0Q0lzbHlEZUJHeFlUUlltMERzTnJnRFJGdzlhdkNNMTdTTyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0ODoiaHR0cDovL2Vjb21tZXJjZWxhcmF2ZWwudGVzdC9hZG1pbi9zaXRlLXNldHRpbmdzIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly9lY29tbWVyY2VsYXJhdmVsLnRlc3QvYWRtaW4vc2l0ZS1zZXR0aW5ncyI7czo1OiJyb3V0ZSI7czoyNToiYWRtaW4uc2l0ZS1zZXR0aW5ncy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762479975),
('fLHjKrEVvVxWGvutfQwIGnNq9DofoO81Mzr4rV15', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0) Gecko/20100101 Firefox/144.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkxUUUtBVnlBWVlLa044NTRNOXljeW41WkU2dlF5dVFwemRudXFYdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9lY29tbWVyY2VsYXJhdmVsLnRlc3QvYWRtaW4vcHJvZHVjdHMvMTM4L2pzb24iO3M6NToicm91dGUiO3M6MTk6ImFkbWluLnByb2R1Y3RzLmpzb24iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762479781),
('HkBddLVSxIolgEABAMqmLkTPpvJkf0gUwlRS1eJJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0) Gecko/20100101 Firefox/144.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3M5eTV2Vk5PYUdVMFdyVzNtTDc3M2I5UkJOZTh2c2kxUmkwSlJXaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9lY29tbWVyY2VsYXJhdmVsLnRlc3QvbG9naW4iO3M6NToicm91dGUiO3M6NToibG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762479980),
('rSSgMQHTE3bMaiRY8EfFctHHXneZKIxSHr7Bv72J', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0) Gecko/20100101 Firefox/144.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUk0dll4WTlGOFp3OVE5MVN5VG03TlZxejZ3bWVQeEk1OWtoSkcxdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vZWNvbW1lcmNlbGFyYXZlbC50ZXN0IjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762484787),
('u0IU0R8sgLa7Ve2nABoEuuzJgKoKtlXtIDQGmv2E', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0) Gecko/20100101 Firefox/144.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkxRVVM1MHR1S3JQVDF0WGY1c1U5Q0RpY3hUY0tVWE9ZdDVxTTRDVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9lY29tbWVyY2VsYXJhdmVsLnRlc3QvYWRtaW4vcHJvZHVjdHMvMTM2L2pzb24iO3M6NToicm91dGUiO3M6MTk6ImFkbWluLnByb2R1Y3RzLmpzb24iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762479782),
('uchuZ97PIAE1k7pNLrpTMu6VLGuNEHvrDeKihBzx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0) Gecko/20100101 Firefox/144.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlY1SFBoZDRSSzNVcVd2Tmtob0pISGw1NkhoaEtTaG14RjRuZ1JHZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9lY29tbWVyY2VsYXJhdmVsLnRlc3QvYWRtaW4vcHJvZHVjdHMvMTM3L2pzb24iO3M6NToicm91dGUiO3M6MTk6ImFkbWluLnByb2R1Y3RzLmpzb24iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762479781),
('Yg3wwI5G6gb8uvYGrggidTUaXFmTLps5q0zGtEBQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0) Gecko/20100101 Firefox/144.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMG1VMUllMkJBTHM3aGxZQ1hiOFJ2M2ltekRTdmRqcURSclAzVlVLQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9lY29tbWVyY2VsYXJhdmVsLnRlc3QvcHJvZHVjdHM/c2VsZWN0PTEiO3M6NToicm91dGUiO3M6MTQ6InByb2R1Y3RzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762479768),
('ysbbt6UgOpqJXKqH2M1eE0VNKt6sNqC6axahoWHL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0) Gecko/20100101 Firefox/144.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMEV1UVJFeTFURXZqZklHR2xEMGcwbTJMb2kyUGhUZU9Uajd4MWJEUiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0ODoiaHR0cDovL2Vjb21tZXJjZWxhcmF2ZWwudGVzdC9hZG1pbi9vcmRlcnMvY3JlYXRlIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly9lY29tbWVyY2VsYXJhdmVsLnRlc3QvYWRtaW4vb3JkZXJzL2NyZWF0ZSI7czo1OiJyb3V0ZSI7czoxOToiYWRtaW4ub3JkZXJzLmNyZWF0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762479980),
('ywohRnUqlaDRxbEq1Tc9APtYwu2FPHQ1lwGBT2RT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWNCMzA0ZjJDUklEalV5bmNYU0NTaEpjQVZOdGdoV3NlV1Q5d1VKdyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vZWNvbW1lcmNlbGFyYXZlbC50ZXN0IjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762483957);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_settings`
--

CREATE TABLE `shipping_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `free_shipping_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `free_shipping_min_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `country_rates` json DEFAULT NULL,
  `global_rate_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `global_rate_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'flat',
  `global_rate_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_settings`
--

INSERT INTO `shipping_settings` (`id`, `enabled`, `free_shipping_enabled`, `free_shipping_min_total`, `country_rates`, `global_rate_enabled`, `global_rate_type`, `global_rate_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '0.00', '[]', 0, 'flat', '0.00', '2025-10-27 21:55:26', '2025-11-06 20:34:47');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `site_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'eCommerce Store',
  `site_tagline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `privacy_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cookies_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `help_center_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_info_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `returns_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_us_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wishlist_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `reviews_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `reviews_require_purchase` tinyint(1) NOT NULL DEFAULT '0',
  `reviews_require_approval` tinyint(1) NOT NULL DEFAULT '1',
  `reviews_allow_anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `newsletter_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `newsletter_double_opt_in` tinyint(1) NOT NULL DEFAULT '1',
  `newsletter_send_welcome_email` tinyint(1) NOT NULL DEFAULT '1',
  `social_facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `site_name`, `site_tagline`, `logo_url`, `favicon_url`, `meta_title`, `meta_description`, `meta_keywords`, `footer_text`, `privacy_url`, `terms_url`, `cookies_url`, `help_center_url`, `shipping_info_url`, `returns_url`, `contact_us_url`, `wishlist_enabled`, `reviews_enabled`, `reviews_require_purchase`, `reviews_require_approval`, `reviews_allow_anonymous`, `newsletter_enabled`, `newsletter_double_opt_in`, `newsletter_send_welcome_email`, `social_facebook`, `social_twitter`, `social_instagram`, `social_linkedin`, `created_at`, `updated_at`) VALUES
(1, 'eCommerce Store', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, NULL, '2025-10-27 21:07:53', '2025-11-06 20:42:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coins_balance` bigint UNSIGNED NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referral_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `referred_by_user_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `coins_balance`, `remember_token`, `referral_code`, `created_at`, `updated_at`, `referred_by_user_id`) VALUES
(1, 'Test User', 'test@example.com', NULL, NULL, '$2y$12$AwDMdgvWT/T5xKlYWhKeEODviCRLY.hqyNZyIXdD2x0V0DMCwl3sC', 0, NULL, NULL, '2025-10-27 21:07:33', '2025-10-27 21:07:33', NULL),
(2, 'Md Yamin', 'admins@example.com', 'Hossain', NULL, '$2y$12$KQVVzgqwIbSWG.XfYD8LiupMlxAblTM8uvXSay.hqQFt6tZL4id1O', 8, NULL, 'E1F21BBA', '2025-11-03 11:59:47', '2025-11-06 19:58:01', NULL),
(3, 'Md Yamin Hossain', NULL, '018785785041', NULL, '$2y$12$Qo9BF.arbMGB4v1Dd2yCJ.dEN6z8c11FtgZv3pr0CNhZUV8hlJkIW', 3, NULL, 'AA213B4D', '2025-11-04 14:02:14', '2025-11-04 16:04:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'billing',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_points`
--

CREATE TABLE `user_points` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` bigint NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_id` bigint UNSIGNED DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_points`
--

INSERT INTO `user_points` (`id`, `user_id`, `type`, `amount`, `description`, `related_type`, `related_id`, `meta`, `created_at`, `updated_at`) VALUES
(1, 2, 'order_place', 5, 'Order placed', 'App\\Models\\Order', 4, '{\"order_id\": 4}', '2025-11-03 12:00:19', '2025-11-03 12:00:19'),
(2, 2, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 22, '{\"product_id\": 139}', '2025-11-03 13:20:55', '2025-11-03 13:20:55'),
(3, 3, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 30, '{\"product_id\": 111}', '2025-11-04 14:04:57', '2025-11-04 14:04:57'),
(4, 3, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 31, '{\"product_id\": 139}', '2025-11-04 14:11:27', '2025-11-04 14:11:27'),
(5, 3, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 32, '{\"product_id\": 122}', '2025-11-04 14:11:31', '2025-11-04 14:11:31'),
(6, 3, 'remove_from_cart', -1, 'Removed from cart', 'App\\Models\\CartItem', 31, '{\"product_id\": 139}', '2025-11-04 14:11:45', '2025-11-04 14:11:45'),
(10, 3, 'remove_from_cart', -1, 'Removed from cart', 'App\\Models\\CartItem', 31, '{\"product_id\": 139}', '2025-11-04 14:11:45', '2025-11-04 14:11:45'),
(11, 3, 'remove_from_cart', -1, 'Removed from cart', 'App\\Models\\CartItem', 32, '{\"product_id\": 122}', '2025-11-04 14:12:58', '2025-11-04 14:12:58'),
(15, 3, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 33, '{\"product_id\": 122}', '2025-11-04 14:13:02', '2025-11-04 14:13:02'),
(16, 3, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 34, '{\"product_id\": 139}', '2025-11-04 14:13:06', '2025-11-04 14:13:06'),
(17, 3, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 35, '{\"product_id\": 142}', '2025-11-04 14:15:54', '2025-11-04 14:15:54'),
(18, 3, 'remove_from_cart', -1, 'Removed from cart', 'App\\Models\\CartItem', 34, '{\"product_id\": 139}', '2025-11-04 14:15:57', '2025-11-04 14:15:57'),
(19, 3, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 36, '{\"product_id\": 139}', '2025-11-04 14:15:58', '2025-11-04 14:15:58'),
(20, 3, 'remove_from_cart', -1, 'Removed from cart', 'App\\Models\\CartItem', 33, '{\"product_id\": 122}', '2025-11-04 14:16:01', '2025-11-04 14:16:01'),
(21, 3, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 37, '{\"product_id\": 122}', '2025-11-04 14:16:02', '2025-11-04 14:16:02'),
(22, 3, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 38, '{\"product_id\": 97}', '2025-11-04 14:17:30', '2025-11-04 14:17:30'),
(23, 3, 'remove_from_cart', -1, 'Removed from cart', 'App\\Models\\CartItem', 38, '{\"product_id\": 97}', '2025-11-04 14:17:32', '2025-11-04 14:17:32'),
(24, 3, 'remove_from_cart', -1, 'Removed from cart', 'App\\Models\\CartItem', 37, '{\"product_id\": 122}', '2025-11-04 14:17:33', '2025-11-04 14:17:33'),
(25, 3, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 39, '{\"product_id\": 122}', '2025-11-04 14:17:34', '2025-11-04 14:17:34'),
(26, 3, 'remove_from_cart', -1, 'Removed from cart', 'App\\Models\\CartItem', 36, '{\"product_id\": 139}', '2025-11-04 14:17:39', '2025-11-04 14:17:39'),
(27, 3, 'remove_from_cart', -1, 'Removed from cart', 'App\\Models\\CartItem', 30, '{\"product_id\": 111}', '2025-11-04 14:19:17', '2025-11-04 14:19:17'),
(28, 3, 'remove_from_cart', -1, 'Removed from cart', 'App\\Models\\CartItem', 39, '{\"product_id\": 122}', '2025-11-04 14:20:13', '2025-11-04 14:20:13'),
(30, 3, 'order_place', 3, 'Order placed', 'App\\Models\\Order', 8, '{\"order_id\": 8}', '2025-11-04 16:04:55', '2025-11-04 16:04:55'),
(31, 2, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 84, '{\"product_id\": 142}', '2025-11-06 19:57:49', '2025-11-06 19:57:49'),
(32, 2, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 85, '{\"product_id\": 122}', '2025-11-06 19:58:01', '2025-11-06 19:58:01');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_session_id_index` (`session_id`),
  ADD KEY `carts_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cart_items_cart_id_product_id_unique` (`cart_id`,`product_id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `coin_settings`
--
ALTER TABLE `coin_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_usages_user_id_foreign` (`user_id`),
  ADD KEY `coupon_usages_order_id_foreign` (`order_id`),
  ADD KEY `coupon_usages_coupon_id_user_id_index` (`coupon_id`,`user_id`),
  ADD KEY `coupon_usages_coupon_id_session_id_index` (`coupon_id`,`session_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currencies_code_unique` (`code`);

--
-- Indexes for table `email_settings`
--
ALTER TABLE `email_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_settings_key_unique` (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `guest_wishlists`
--
ALTER TABLE `guest_wishlists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `guest_wishlists_session_id_product_id_unique` (`session_id`,`product_id`),
  ADD KEY `guest_wishlists_product_id_foreign` (`product_id`),
  ADD KEY `guest_wishlists_session_id_index` (`session_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `newsletter_settings`
--
ALTER TABLE `newsletter_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `newsletter_subscribers_email_unique` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_number_unique` (`number`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `otp_codes`
--
ALTER TABLE `otp_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `otp_codes_otptable_type_otptable_id_index` (`otptable_type`,`otptable_id`),
  ADD KEY `otp_codes_channel_index` (`channel`),
  ADD KEY `otp_codes_identifier_index` (`identifier`),
  ADD KEY `otp_codes_code_index` (`code`),
  ADD KEY `otp_codes_purpose_index` (`purpose`),
  ADD KEY `otp_codes_expires_at_index` (`expires_at`);

--
-- Indexes for table `otp_settings`
--
ALTER TABLE `otp_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_gateway_settings`
--
ALTER TABLE `payment_gateway_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_gateway_settings_gateway_key_unique` (`gateway`,`key`),
  ADD KEY `payment_gateway_settings_gateway_index` (`gateway`);

--
-- Indexes for table `payment_logs`
--
ALTER TABLE `payment_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_logs_gateway_action_index` (`gateway`,`action`),
  ADD KEY `payment_logs_created_at_index` (`created_at`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_order_id_foreign` (`order_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `shipping_settings`
--
ALTER TABLE `shipping_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `users_referral_code_unique` (`referral_code`),
  ADD KEY `users_referred_by_user_id_foreign` (`referred_by_user_id`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_points`
--
ALTER TABLE `user_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_points_related_type_related_id_index` (`related_type`,`related_id`),
  ADD KEY `user_points_user_id_type_index` (`user_id`,`type`),
  ADD KEY `user_points_type_index` (`type`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wishlists_user_id_product_id_unique` (`user_id`,`product_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `coin_settings`
--
ALTER TABLE `coin_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `email_settings`
--
ALTER TABLE `email_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guest_wishlists`
--
ALTER TABLE `guest_wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `newsletter_settings`
--
ALTER TABLE `newsletter_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `otp_codes`
--
ALTER TABLE `otp_codes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `otp_settings`
--
ALTER TABLE `otp_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment_gateway_settings`
--
ALTER TABLE `payment_gateway_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payment_logs`
--
ALTER TABLE `payment_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=433;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shipping_settings`
--
ALTER TABLE `shipping_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_points`
--
ALTER TABLE `user_points`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  ADD CONSTRAINT `coupon_usages_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_usages_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_usages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `guest_wishlists`
--
ALTER TABLE `guest_wishlists`
  ADD CONSTRAINT `guest_wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_referred_by_user_id_foreign` FOREIGN KEY (`referred_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_points`
--
ALTER TABLE `user_points`
  ADD CONSTRAINT `user_points_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
