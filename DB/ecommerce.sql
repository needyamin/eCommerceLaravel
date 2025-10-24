-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 24, 2025 at 10:28 PM
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
(1, 'Admin', 'admin@example.com', NULL, '$2y$12$AVmkSGczMfWYV2uUgPips.pq3paAjzN7Xz7DkMxaBwSeqnowKOILW', NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44');

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
(1, NULL, '9ebeb850-9198-44dc-91e3-44b83916b826', '287.70', '0.00', '0.00', '287.70', '2025-10-23 12:57:59', '2025-10-23 12:58:19', NULL, '0.00'),
(2, NULL, '45a91a91-34b6-4bc9-a087-68f75e2e9cc0', '2383.36', '0.00', '0.00', '2383.36', '2025-10-23 14:16:47', '2025-10-23 20:15:18', NULL, '0.00'),
(4, NULL, 'a1e92ad4-2f93-4a89-9107-0f6e1dfc8444', '666.44', '0.00', '0.00', '666.44', '2025-10-23 20:15:52', '2025-10-23 20:16:12', NULL, '0.00'),
(7, 1, 'f0b81161-27cb-4989-976a-7afc4924a21b', '452.80', '0.00', '0.00', '452.80', '2025-10-24 11:40:14', '2025-10-24 16:14:11', NULL, '0.00'),
(10, NULL, '19fbff58-bcd7-41b8-bd8c-b7e1b6ca09f5', '19.85', '0.00', '0.00', '19.85', '2025-10-24 15:23:11', '2025-10-24 15:23:23', NULL, '0.00');

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
(1, 1, 67, 1, '9.91', '9.91', '2025-10-23 12:57:59', '2025-10-23 12:57:59'),
(2, 1, 64, 1, '277.79', '277.79', '2025-10-23 12:58:01', '2025-10-23 12:58:01'),
(17, 2, 477, 2, '110.99', '221.98', '2025-10-23 17:28:13', '2025-10-23 19:55:21'),
(23, 2, 500, 1, '239.60', '239.60', '2025-10-23 19:15:29', '2025-10-23 19:55:23'),
(25, 2, 496, 2, '78.27', '156.54', '2025-10-23 19:21:53', '2025-10-23 20:15:04'),
(26, 2, 446, 1, '235.69', '235.69', '2025-10-23 19:23:44', '2025-10-23 20:15:16'),
(27, 2, 460, 1, '78.12', '78.12', '2025-10-23 19:25:38', '2025-10-23 20:15:18'),
(28, 2, 464, 1, '243.08', '243.08', '2025-10-23 19:25:40', '2025-10-23 19:25:40'),
(30, 2, 471, 4, '60.70', '242.80', '2025-10-23 19:28:49', '2025-10-23 19:29:41'),
(31, 2, 481, 2, '55.58', '111.16', '2025-10-23 19:28:50', '2025-10-23 19:29:15'),
(32, 2, 470, 7, '22.55', '157.85', '2025-10-23 19:28:54', '2025-10-23 19:28:57'),
(33, 2, 469, 1, '19.85', '19.85', '2025-10-23 19:52:20', '2025-10-23 20:15:11'),
(34, 2, 504, 3, '126.81', '380.43', '2025-10-23 19:52:34', '2025-10-23 19:52:37'),
(35, 2, 485, 1, '296.26', '296.26', '2025-10-23 20:10:35', '2025-10-23 20:15:08'),
(36, 4, 477, 3, '110.99', '332.97', '2025-10-23 20:15:52', '2025-10-23 20:16:12'),
(37, 4, 469, 4, '19.85', '79.40', '2025-10-23 20:15:55', '2025-10-23 20:16:00'),
(38, 4, 504, 1, '126.81', '126.81', '2025-10-23 20:16:03', '2025-10-23 20:16:03'),
(39, 4, 470, 1, '22.55', '22.55', '2025-10-23 20:16:05', '2025-10-23 20:16:05'),
(40, 4, 471, 1, '60.70', '60.70', '2025-10-23 20:16:07', '2025-10-23 20:16:07'),
(41, 4, 473, 3, '14.67', '44.01', '2025-10-23 20:16:09', '2025-10-23 20:16:11'),
(91, 10, 469, 1, '19.85', '19.85', '2025-10-24 15:23:14', '2025-10-24 15:23:14'),
(121, 7, 485, 1, '296.26', '296.26', '2025-10-24 15:49:26', '2025-10-24 15:49:26'),
(122, 7, 496, 2, '78.27', '156.54', '2025-10-24 15:49:27', '2025-10-24 16:14:11');

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
(1, NULL, 'Sit labore', 'sit-labore-5R2tm', 'Et voluptatem et ut enim aperiam est earum dolor qui voluptatem similique et.', NULL, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(2, NULL, 'Nemo corrupti', 'nemo-corrupti-go1RG', 'Odio laboriosam omnis blanditiis dolor doloremque qui magnam.', NULL, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(3, NULL, 'Ut quis', 'ut-quis-58Wud', 'Et aliquid sed nostrum tenetur quidem reprehenderit.', NULL, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(4, NULL, 'Adipisci eaque', 'adipisci-eaque-muFn7', 'Dolores rerum sed et labore consequuntur rerum ipsam praesentium soluta velit ut provident similique.', NULL, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(5, NULL, 'Est accusantium', 'est-accusantium-FTCh9', 'Nulla qui autem et repellendus voluptatem quis rerum qui sit voluptatibus et aliquid.', NULL, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(6, NULL, 'Quaerat enim', 'quaerat-enim-UPFnv', 'Odio neque aut esse harum accusamus sint rerum repudiandae qui aut alias laborum.', NULL, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(7, NULL, 'Ab et', 'ab-et-RnXjL', 'Aut mollitia aut voluptates accusamus rerum aspernatur veritatis quia unde ut dolorum.', NULL, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(8, NULL, 'Error eum', 'error-eum-cqyOb', 'Quae dicta consequatur dignissimos dolorum eos et placeat facere voluptatum qui.', NULL, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(9, NULL, 'Iste explicabo', 'iste-explicabo-OZNqn', 'Sit dolorem qui magnam omnis excepturi rerum ut quae voluptatem iusto.', NULL, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(10, NULL, 'Ex velit', 'ex-velit-KRGdE', 'Voluptatum sapiente omnis dicta asperiores ullam repellendus aut in.', NULL, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(11, NULL, 'Delectus aspernatur', 'delectus-aspernatur-KV7gk', 'Harum excepturi nemo corrupti odio vitae et deserunt voluptatem.', NULL, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(12, NULL, 'Rerum nesciunt', 'rerum-nesciunt-v7tCP', 'Sequi illo facere ut culpa enim voluptates hic enim sapiente.', NULL, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(13, NULL, 'Ex aut', 'ex-aut-t8tm7', 'Deserunt dignissimos et et qui qui sed sed voluptas culpa magnam delectus vitae fugiat.', NULL, 1, '2025-10-23 13:22:35', '2025-10-23 13:22:35'),
(14, NULL, 'Laboriosam modi', 'laboriosam-modi-sV6Px', 'Dolorem doloremque sunt et tempore repudiandae est eos nesciunt exercitationem ex minus consectetur minima.', NULL, 1, '2025-10-23 13:22:35', '2025-10-23 13:22:35'),
(15, NULL, 'Doloribus est', 'doloribus-est-4ZSec', 'Repellendus quos adipisci veniam sunt eaque dolorum consectetur.', NULL, 1, '2025-10-23 13:22:35', '2025-10-23 13:22:35'),
(16, NULL, 'Quo est', 'quo-est-wnWfF', 'Amet dolorum iusto eveniet et accusantium eos.', NULL, 1, '2025-10-23 13:22:35', '2025-10-23 13:22:35'),
(17, NULL, 'Et eveniet', 'et-eveniet-8urhF', 'Sunt enim aut doloribus voluptatem molestias placeat rerum rem qui aut.', NULL, 1, '2025-10-23 13:22:35', '2025-10-23 13:22:35'),
(18, NULL, 'Modi quam', 'modi-quam-gXI4L', 'Explicabo velit dolorem voluptas non quia magnam vitae quis unde inventore sed.', NULL, 1, '2025-10-23 13:22:35', '2025-10-23 13:22:35'),
(19, NULL, 'Eum odit', 'eum-odit-P6T8m', 'Quidem molestias possimus recusandae qui perferendis consequatur quaerat blanditiis animi unde omnis.', NULL, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(20, NULL, 'Ea ut', 'ea-ut-i51OJ', 'Dicta consectetur inventore aut explicabo sit et ad harum consequatur consequatur dolore voluptatum.', NULL, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(21, NULL, 'Et possimus', 'et-possimus-mkAqZ', 'Quis aut iste sit cumque iure est odio dolorem ducimus dolores officia voluptatem.', NULL, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(22, NULL, 'Quam voluptatem', 'quam-voluptatem-pglJw', 'Similique corrupti ea eum et hic et sunt et qui est.', NULL, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(23, NULL, 'Reprehenderit neque', 'reprehenderit-neque-mmnOd', 'Et reiciendis qui omnis impedit libero praesentium quisquam harum sint natus asperiores et dicta magnam.', NULL, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(24, NULL, 'Possimus quibusdam', 'possimus-quibusdam-BGSoA', 'Omnis tenetur officiis laboriosam qui id quia.', NULL, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(25, NULL, 'Et earum', 'et-earum-2ei0e', 'Iusto aliquid velit possimus non sunt deserunt est rem dolorem veniam aperiam sequi ipsa.', NULL, 1, '2025-10-23 15:24:44', '2025-10-23 15:24:44'),
(28, NULL, 'Sed assumenda', 'sed-assumenda-47OPI', 'Nihil soluta dolor odio facere minus quis ut dolorem.', NULL, 1, '2025-10-23 15:24:44', '2025-10-23 15:24:44'),
(29, NULL, 'Sit qui', 'sit-qui-RKy4i', 'Exercitationem laudantium qui dolor est voluptas sapiente.', NULL, 1, '2025-10-23 15:24:44', '2025-10-23 15:24:44'),
(30, NULL, 'Consectetur architecto', 'consectetur-architecto-GzhzF', 'Quaerat et ipsa dolores consequatur sint molestiae consequatur ut quibusdam sunt magnam.', NULL, 1, '2025-10-23 15:24:44', '2025-10-23 15:24:44'),
(31, NULL, 'Qui quis', 'qui-quis-V2Q3u', 'Et ipsum repudiandae ad quia eos et et deserunt exercitationem eveniet fugit.', NULL, 1, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(32, NULL, 'Et at', 'et-at-eURuA', 'Ut aut commodi sit veritatis dolor maiores iusto qui nostrum perspiciatis illo et.', NULL, 1, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(33, NULL, 'Dolorem corrupti', 'dolorem-corrupti-7Hece', 'Quo quo voluptate aut cupiditate error et mollitia maiores eius reprehenderit neque.', NULL, 1, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(34, NULL, 'Esse vel', 'esse-vel-szeZH', 'Eum nihil iure itaque adipisci aut animi qui est facilis.', NULL, 1, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(35, NULL, 'Aut est', 'aut-est-Jh26K', 'Ipsum beatae adipisci est sit ut quia sunt magnam non cumque inventore odit porro.', NULL, 1, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(36, NULL, 'Sed sunt', 'sed-sunt-nhRtZ', 'At est explicabo illo consequatur molestiae molestias in ullam voluptas.', NULL, 1, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(37, NULL, 'Quaerat et', 'quaerat-et-C9iyG', 'Voluptatibus voluptatem enim recusandae sit mollitia libero nisi.', NULL, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(38, NULL, 'Assumenda est', 'assumenda-est-Wg6Sy', 'Tempore aspernatur fuga officia beatae consequatur perferendis ducimus id cumque voluptas non.', NULL, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(39, NULL, 'Deleniti aut', 'deleniti-aut-tqYUl', 'Quis qui distinctio sequi voluptas officia qui dolorum dolore est repellendus sit ab nulla.', NULL, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(40, NULL, 'Eius eaque', 'eius-eaque-aNKWw', 'Quasi ea voluptatem dolor in voluptatibus eum voluptatem ducimus sed exercitationem dolore tenetur ex.', NULL, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(41, NULL, 'Voluptatem neque', 'voluptatem-neque-MHwpr', 'Eius eos blanditiis animi et itaque ex atque amet est accusamus amet accusamus distinctio.', NULL, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(42, NULL, 'Ut assumenda', 'ut-assumenda-YK5FX', 'Nesciunt nobis qui mollitia quo magnam rerum culpa nostrum autem placeat.', NULL, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40');

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
(1, 1, 1, 1, 1, 1, 5, 5, 5, 5, 5, 5, 5, '2025-10-24 15:06:31', '2025-10-24 15:06:45');

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
(1, 'WELCOME10', 'Welcome Discount', 'Get 10% off your first order', 'percentage', '10.00', '50.00', '25.00', 100, 1, '2025-10-23', '2026-01-23', 1, NULL, NULL, '2025-10-23 15:40:24', '2025-10-23 15:40:24'),
(2, 'SAVE20', 'Save $20', 'Get $20 off orders over $100', 'fixed', '20.00', '100.00', NULL, 50, 2, '2025-10-23', '2025-12-23', 1, NULL, NULL, '2025-10-23 15:40:24', '2025-10-23 15:40:24'),
(3, 'FREESHIP', 'Free Shipping', 'Free shipping on any order', 'fixed', '10.00', NULL, NULL, 200, 3, '2025-10-23', '2026-10-23', 1, NULL, NULL, '2025-10-23 15:40:24', '2025-10-23 15:40:24'),
(4, 'HOLIDAY25', 'Holiday Special', '25% off for holiday season', 'percentage', '25.00', '75.00', '50.00', 30, 1, '2025-10-23', '2025-11-22', 1, NULL, NULL, '2025-10-23 15:40:24', '2025-10-23 15:40:24'),
(5, 'STUDENT15', 'Student Discount', '15% off for students', 'percentage', '15.00', '30.00', '30.00', NULL, 5, '2025-10-23', '2026-04-23', 1, NULL, NULL, '2025-10-23 15:40:24', '2025-10-23 15:40:24');

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
(1, 'USD', 'US Dollar', '$', 2, ',', '.', 1, '1.00000000', 1, 0, '2025-10-23 16:33:10', '2025-10-24 13:49:31'),
(2, 'BDT', 'Bangladeshi TK', '৳', 0, ',', '0', 1, '1.00000000', 1, 1, '2025-10-23 16:33:10', '2025-10-24 13:49:22'),
(3, 'GBP', 'British Pound', '£', 2, ',', '.', 1, '0.78000000', 1, 0, '2025-10-23 16:33:10', '2025-10-24 13:49:31');

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
(1, 'from_name', 'From Name', 'eCommerce Store', 'The name that appears in the \"From\" field of emails', '2025-10-23 15:26:19', '2025-10-23 15:26:19'),
(2, 'from_email', 'From Email', 'noreply@ecommercestore.com', 'The email address that appears in the \"From\" field of emails', '2025-10-23 15:26:19', '2025-10-23 15:26:19'),
(3, 'order_confirmation_enabled', 'Order Confirmation Emails', '1', 'Send confirmation emails when orders are placed', '2025-10-23 15:26:19', '2025-10-23 15:26:19'),
(4, 'order_status_update_enabled', 'Order Status Update Emails', '1', 'Send emails when order status is updated', '2025-10-23 15:26:19', '2025-10-23 15:26:19');

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
(1, 'default', '{\"uuid\":\"096d2e89-adc2-4330-b644-5d51a7cfb80c\",\"displayName\":\"App\\\\Notifications\\\\OrderConfirmation\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:35:\\\"App\\\\Notifications\\\\OrderConfirmation\\\":2:{s:8:\\\"\\u0000*\\u0000order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"57dd110c-24da-4530-8452-dcaeb3f232f4\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"},\"createdAt\":1761327284,\"delay\":null}', 0, NULL, 1761327284, 1761327284);

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
(11, '2025_10_23_190126_create_admins_table', 2),
(12, '2025_10_23_192021_create_permission_tables', 3),
(13, '2025_10_23_202744_create_personal_access_tokens_table', 4),
(14, '2025_10_23_211839_add_phone_to_users_table', 5),
(15, '2025_10_23_211855_create_user_addresses_table', 5),
(16, '2025_10_23_212524_create_email_settings_table', 6),
(17, '2025_10_23_213639_create_coupons_table', 7),
(18, '2025_10_23_213657_create_coupon_usages_table', 7),
(19, '2025_10_23_213716_add_coupon_fields_to_carts_table', 7),
(20, '2025_10_23_215402_create_payment_gateway_settings_table', 8),
(21, '2025_10_23_215408_create_payment_logs_table', 8),
(22, '2025_10_23_221538_create_newsletter_subscribers_table', 9),
(23, '2025_10_23_221549_create_newsletter_settings_table', 9),
(24, '2025_10_23_223108_create_currencies_table', 10),
(25, '2025_10_23_233551_create_otp_codes_table', 11),
(26, '2025_10_23_234439_create_otp_settings_table', 12),
(27, '2025_10_24_004611_add_sms_columns_to_otp_settings_table', 13),
(28, '2025_10_24_120000_create_site_settings_table', 14),
(29, '2025_10_24_131000_create_coin_settings_table', 15),
(30, '2025_10_24_130000_add_coins_to_users_and_create_user_points_table', 16),
(31, '2025_10_24_132000_add_referral_fields_to_users_table', 17),
(32, '2025_10_24_133000_add_flags_to_coin_settings_table', 18),
(33, '2025_10_24_134000_create_shipping_settings_table', 19),
(34, '2025_10_24_134500_add_global_rate_to_shipping_settings_table', 20);

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
(1, 1, 0, 0, 'local', NULL, '2025-10-23 16:21:02', '2025-10-23 16:21:02');

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
(1, 'needyamin@gmail.com', NULL, 'subscribed', 'footer', '7dcd0281-c461-4fab-9b1c-31b92ec54e2c', '2025-10-23 16:21:21', '2025-10-23 16:21:17', '2025-10-23 16:21:10', '2025-10-23 16:21:21');

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
(1, 'RMSSDPEPFO', 1, 'processing', '234.96', '0.00', '0.00', '0.00', '234.96', 'USD', NULL, 'unpaid', NULL, 'shipped', 'API Test User', 'apitest@example.com', '123-456-7890', '123 Test Street', 'Test City', '12345', 'Test Country', 'API Test User', '123-456-7890', '123 Test Street', 'Test City', '12345', 'Test Country', '2025-10-23 14:31:56', '2025-10-23 15:57:58'),
(2, 'XN8LTG2C6Z', 1, 'pending', '78.27', '0.00', '0.00', '0.00', '78.27', 'USD', NULL, 'unpaid', NULL, 'unshipped', 'Test User', 'test@example.com', '01878578504', NULL, NULL, NULL, 'United States', NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-24 11:34:43', '2025-10-24 11:34:43'),
(3, 'VGHCCQGUOP', NULL, 'pending', '312.48', '0.00', '0.00', '0.00', '312.48', 'USD', NULL, 'unpaid', NULL, 'unshipped', 'Md Yamin Hossain', 'otitheedev@gmail.com', '01907802744', 'Police Plaza Concord, Tower-A, Floor #8N, 10E, Plot #02, Road #144, Gulshan-1, Dhaka-1212.', 'Gulshan-1', '1212', 'United States', NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-24 14:09:00', '2025-10-24 14:09:00');

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
(1, 1, 1, 'Quis eius ea', 'VEZ0HKT7', 2, '117.48', '234.96', '2025-10-23 14:31:56', '2025-10-23 14:31:56'),
(2, 2, 496, 'Incidunt expedita quo', 'XQBGOUAH', 1, '78.27', '78.27', '2025-10-24 11:34:43', '2025-10-24 11:34:43'),
(3, 3, 460, 'Voluptatem porro fuga', 'X3T8LQAY', 4, '78.12', '312.48', '2025-10-24 14:09:00', '2025-10-24 14:09:00');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sms_api_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_api_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_sender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `otp_settings`
--

INSERT INTO `otp_settings` (`id`, `email_enabled`, `sms_enabled`, `length`, `ttl_minutes`, `max_attempts`, `sms_gateway`, `sms_masking`, `created_at`, `updated_at`, `sms_api_url`, `sms_api_key`, `sms_username`, `sms_password`, `sms_sender`) VALUES
(1, 1, 0, 6, 10, 5, NULL, NULL, '2025-10-23 18:33:04', '2025-10-23 18:33:04', NULL, NULL, NULL, NULL, NULL);

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
(1, 'stripe', 'enabled', '1', 'Enable or disable this payment gateway', 0, '2025-10-23 15:58:17', '2025-10-23 16:13:39'),
(2, 'stripe', 'publishable_key', '', 'Stripe publishable key (starts with pk_)', 0, '2025-10-23 15:58:17', '2025-10-23 15:58:17'),
(3, 'stripe', 'secret_key', '', 'Stripe secret key (starts with sk_)', 1, '2025-10-23 15:58:17', '2025-10-23 15:58:17'),
(4, 'stripe', 'webhook_secret', '', 'Stripe webhook endpoint secret', 1, '2025-10-23 15:58:17', '2025-10-23 15:58:17'),
(5, 'paypal', 'enabled', '1', 'Enable or disable this payment gateway', 0, '2025-10-23 15:58:17', '2025-10-23 16:13:46'),
(6, 'paypal', 'client_id', '', 'PayPal application client ID', 0, '2025-10-23 15:58:17', '2025-10-23 15:58:17'),
(7, 'paypal', 'client_secret', '', 'PayPal application client secret', 1, '2025-10-23 15:58:17', '2025-10-23 15:58:17'),
(8, 'paypal', 'sandbox_mode', '1', 'Use PayPal sandbox for testing', 0, '2025-10-23 15:58:17', '2025-10-23 15:58:17');

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
(1, 'manage products', 'admin', '2025-10-23 13:22:35', '2025-10-23 13:22:35'),
(2, 'manage categories', 'admin', '2025-10-23 13:22:35', '2025-10-23 13:22:35'),
(3, 'manage orders', 'admin', '2025-10-23 13:22:35', '2025-10-23 13:22:35'),
(4, 'Admin', 'admin', '2025-10-23 13:34:30', '2025-10-23 13:34:30'),
(5, 'admin.dashboard', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(6, 'admin.categories.index', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(7, 'admin.categories.create', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(8, 'admin.categories.store', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(9, 'admin.categories.show', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(10, 'admin.categories.edit', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(11, 'admin.categories.update', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(12, 'admin.categories.destroy', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(13, 'admin.products.index', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(14, 'admin.products.create', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(15, 'admin.products.store', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(16, 'admin.products.show', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(17, 'admin.products.edit', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(18, 'admin.products.update', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(19, 'admin.products.destroy', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(20, 'admin.orders.index', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(21, 'admin.orders.show', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(22, 'admin.orders.update', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(23, 'admin.roles.index', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(24, 'admin.roles.create', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(25, 'admin.roles.store', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(26, 'admin.roles.edit', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(27, 'admin.roles.update', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(28, 'admin.roles.destroy', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(29, 'admin.permissions.index', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(30, 'admin.permissions.create', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(31, 'admin.permissions.store', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(32, 'admin.permissions.edit', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(33, 'admin.permissions.update', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(34, 'admin.permissions.destroy', 'admin', '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(35, 'admin.users.index', 'admin', '2025-10-23 15:24:42', '2025-10-23 15:24:42'),
(36, 'admin.users.show', 'admin', '2025-10-23 15:24:42', '2025-10-23 15:24:42'),
(37, 'admin.users.edit', 'admin', '2025-10-23 15:24:42', '2025-10-23 15:24:42'),
(38, 'admin.users.update', 'admin', '2025-10-23 15:24:42', '2025-10-23 15:24:42'),
(39, 'admin.users.destroy', 'admin', '2025-10-23 15:24:42', '2025-10-23 15:24:42'),
(40, 'admin.users.reset-password', 'admin', '2025-10-23 15:24:42', '2025-10-23 15:24:42'),
(41, 'admin.users.toggle-status', 'admin', '2025-10-23 15:24:42', '2025-10-23 15:24:42'),
(42, 'admin.email-settings.index', 'admin', '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(43, 'admin.email-settings.update', 'admin', '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(44, 'admin.payment-gateways.index', 'admin', '2025-10-23 16:09:39', '2025-10-23 16:09:39'),
(45, 'admin.payment-gateways.show', 'admin', '2025-10-23 16:09:39', '2025-10-23 16:09:39'),
(46, 'admin.payment-gateways.update', 'admin', '2025-10-23 16:09:39', '2025-10-23 16:09:39'),
(47, 'admin.payment-gateways.toggle-status', 'admin', '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(48, 'admin.payment-gateways.test', 'admin', '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(49, 'admin.currencies.index', 'admin', '2025-10-23 17:25:39', '2025-10-23 17:25:39'),
(50, 'admin.currencies.create', 'admin', '2025-10-23 17:25:39', '2025-10-23 17:25:39'),
(51, 'admin.currencies.store', 'admin', '2025-10-23 17:25:39', '2025-10-23 17:25:39'),
(52, 'admin.currencies.edit', 'admin', '2025-10-23 17:25:39', '2025-10-23 17:25:39'),
(53, 'admin.currencies.update', 'admin', '2025-10-23 17:25:39', '2025-10-23 17:25:39'),
(54, 'admin.currencies.destroy', 'admin', '2025-10-23 17:25:39', '2025-10-23 17:25:39'),
(55, 'admin.currencies.toggle', 'admin', '2025-10-23 17:25:39', '2025-10-23 17:25:39'),
(56, 'admin.currencies.default', 'admin', '2025-10-23 17:25:39', '2025-10-23 17:25:39'),
(57, 'admin.logout', 'admin', '2025-10-24 13:34:56', '2025-10-24 13:34:56'),
(58, 'admin.coupons.index', 'admin', '2025-10-24 13:34:56', '2025-10-24 13:34:56'),
(59, 'admin.coupons.create', 'admin', '2025-10-24 13:34:56', '2025-10-24 13:34:56'),
(60, 'admin.coupons.store', 'admin', '2025-10-24 13:34:56', '2025-10-24 13:34:56'),
(61, 'admin.coupons.show', 'admin', '2025-10-24 13:34:56', '2025-10-24 13:34:56'),
(62, 'admin.coupons.edit', 'admin', '2025-10-24 13:34:56', '2025-10-24 13:34:56'),
(63, 'admin.coupons.update', 'admin', '2025-10-24 13:34:56', '2025-10-24 13:34:56'),
(64, 'admin.coupons.destroy', 'admin', '2025-10-24 13:34:56', '2025-10-24 13:34:56'),
(65, 'admin.coupons.toggle-status', 'admin', '2025-10-24 13:34:56', '2025-10-24 13:34:56'),
(66, 'admin.newsletter.index', 'admin', '2025-10-24 13:34:56', '2025-10-24 13:34:56'),
(67, 'admin.newsletter.settings.update', 'admin', '2025-10-24 13:34:56', '2025-10-24 13:34:56'),
(68, 'admin.newsletter.toggle', 'admin', '2025-10-24 13:34:56', '2025-10-24 13:34:56'),
(69, 'admin.newsletter.destroy', 'admin', '2025-10-24 13:34:56', '2025-10-24 13:34:56'),
(70, 'admin.otp-settings.index', 'admin', '2025-10-24 13:34:56', '2025-10-24 13:34:56'),
(71, 'admin.otp-settings.update', 'admin', '2025-10-24 13:34:56', '2025-10-24 13:34:56'),
(72, 'admin.site-settings.index', 'admin', '2025-10-24 13:34:56', '2025-10-24 13:34:56'),
(73, 'admin.site-settings.update', 'admin', '2025-10-24 13:34:56', '2025-10-24 13:34:56'),
(74, 'admin.admins.create', 'admin', '2025-10-24 14:12:13', '2025-10-24 14:12:13'),
(75, 'admin.admins.destroy', 'admin', '2025-10-24 14:12:13', '2025-10-24 14:12:13'),
(76, 'admin.admins.edit', 'admin', '2025-10-24 14:12:13', '2025-10-24 14:12:13'),
(77, 'admin.admins.index', 'admin', '2025-10-24 14:12:13', '2025-10-24 14:12:13'),
(78, 'admin.admins.store', 'admin', '2025-10-24 14:12:13', '2025-10-24 14:12:13'),
(79, 'admin.admins.update', 'admin', '2025-10-24 14:12:13', '2025-10-24 14:12:13'),
(80, 'admin.coin-settings.update', 'admin', '2025-10-24 15:05:25', '2025-10-24 15:05:25'),
(81, 'admin.coin-settings.index', 'admin', '2025-10-24 15:05:45', '2025-10-24 15:05:45'),
(82, 'admin.users.coins.adjust', 'admin', '2025-10-24 15:05:45', '2025-10-24 15:05:45'),
(83, 'admin.users.coins.reset', 'admin', '2025-10-24 15:48:55', '2025-10-24 15:48:55'),
(84, 'admin.shipping-settings.index', 'admin', '2025-10-24 16:17:41', '2025-10-24 16:17:41'),
(85, 'admin.shipping-settings.update', 'admin', '2025-10-24 16:17:41', '2025-10-24 16:17:41');

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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'auth_token', 'e2af56f4e93bfc1e309210720116795a9154f90f59da2d1fabb1616a3509e0f4', '[\"*\"]', NULL, NULL, '2025-10-23 14:31:52', '2025-10-23 14:31:52');

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
(1, 1, 'Quis eius ea', 'quis-eius-ea-XyVTf', 'VEZ0HKT7', 'Illum quisquam voluptas distinctio rem sunt repellendus dolorem ducimus et tempore voluptate a veritatis.', 'Vel explicabo doloremque aliquam hic quam. Totam ex eaque in et. A tempore consequatur nemo dignissimos asperiores quia tempore. Consectetur voluptas consectetur repellat ea ab illum. Velit est aut pariatur soluta quibusdam porro autem.', '117.48', NULL, 147, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(2, 1, 'Aut perspiciatis aliquid', 'aut-perspiciatis-aliquid-DFQbk', '0TIB0BL1', 'Blanditiis et natus et eum recusandae autem aut quidem et sit nesciunt molestiae.', 'Ut aspernatur eos harum tenetur ut quam in. Nisi harum eveniet repellat dolor cum voluptatum aliquam nostrum. Eligendi est illum eum iusto praesentium. Esse dolorem explicabo ea reiciendis quam culpa quas reprehenderit. Nisi ut nesciunt deserunt sed voluptatem. Ullam sunt assumenda totam alias est animi.', '289.83', NULL, 173, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(3, 1, 'Voluptatem pariatur quasi', 'voluptatem-pariatur-quasi-blJBg', 'ENPLDUKF', 'Reiciendis culpa id rerum veritatis aut ut voluptates qui reiciendis fugiat.', 'Quis dicta sit repellat eaque corporis earum. Est assumenda esse voluptatum. Itaque doloremque pariatur fugit autem iure doloribus voluptatem. Sapiente dolorum earum non hic dolores. Ipsam repudiandae sint sed provident tenetur.', '62.82', '76.11', 123, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(4, 1, 'Doloremque quae doloremque', 'doloremque-quae-doloremque-iBJ9T', 'NGJLMUFL', 'Suscipit veniam rerum nulla reprehenderit consequatur temporibus quisquam mollitia est quam officiis.', 'Eaque et saepe dolorum odio. Dolor et aut voluptates pariatur voluptatibus atque qui. Cupiditate in enim voluptates nostrum eius ut. Eveniet nobis cumque aut expedita dolores exercitationem. Sed velit qui consectetur nobis quos. Tempora quisquam aut minima eveniet.', '116.54', NULL, 150, 1, 1, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(5, 1, 'Quia aut deserunt', 'quia-aut-deserunt-NX0N1', 'MIH6HZKW', 'Voluptatem cum qui laboriosam voluptatem totam quam explicabo fugit.', 'Mollitia omnis doloribus excepturi consequuntur. Occaecati iure rerum fugiat ut ut. Ut voluptatem est similique eius. Explicabo similique necessitatibus sed. Aperiam ex similique ipsam libero nostrum modi quos. Delectus ut omnis est.', '257.17', NULL, 34, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(6, 1, 'Molestiae aperiam quod', 'molestiae-aperiam-quod-aFIc2', 'XMZOL2JO', 'Nostrum quaerat in doloremque alias delectus eius est vitae fugit earum laudantium exercitationem rerum autem aspernatur.', 'Accusantium assumenda sint harum. Eligendi autem nobis et id repudiandae est. Hic consequatur perspiciatis cum hic voluptatibus dolores voluptates ut. Et sed nam dolores ratione non deserunt odit.', '124.16', '131.85', 188, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(7, 1, 'Dolorum voluptatem laborum', 'dolorum-voluptatem-laborum-Dd0A6', 'WQWBWUFD', 'Aliquid omnis et est assumenda expedita facere quos.', 'Voluptatibus aut laboriosam omnis quam. Et repellendus quia animi provident dolor. Amet sed nemo dolorum omnis magnam sint. Cumque sit ex nihil ab dicta magni nobis. Quod et vero quam omnis perferendis.', '222.19', NULL, 40, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(8, 1, 'Deserunt exercitationem facere', 'deserunt-exercitationem-facere-PKGR5', 'CSPLKIUA', 'Et ipsa omnis aspernatur sunt dolorum quo itaque et eveniet pariatur neque ratione eaque magni commodi.', 'Iure praesentium accusamus necessitatibus voluptas. Labore sed id consequatur et. Voluptatibus molestiae odio quo consequatur ipsam.', '40.51', '59.65', 113, 0, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(9, 1, 'Sunt explicabo quod', 'sunt-explicabo-quod-ieeye', '3LI8PJ1Q', 'Dicta ad ea nulla totam magni vel soluta porro ut illo qui placeat.', 'Sunt aliquid dignissimos dolores vel architecto ducimus hic. Sit magni numquam hic distinctio et. Et quisquam nemo aperiam et esse est quia optio. Sed quas ipsa enim velit expedita sit. Cum vitae nihil vitae recusandae pariatur ipsa.', '227.13', NULL, 120, 1, 1, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(10, 1, 'Omnis suscipit molestias', 'omnis-suscipit-molestias-wjvBm', 'Y8NPEQLP', 'Dignissimos suscipit dolor sit quae in aut eum quo eaque totam architecto incidunt sunt sit.', 'Voluptas voluptate rerum quia ea error corporis. Delectus necessitatibus placeat fuga est praesentium dolore. Rerum neque doloribus atque. Molestiae asperiores consequatur id facere labore. Harum qui pariatur rerum voluptas et at.', '44.29', '66.73', 195, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(11, 1, 'Dolores nam sunt', 'dolores-nam-sunt-alGDm', 'FITYYRJD', 'Ipsum veniam aut consequuntur quia recusandae est sunt qui aperiam eligendi.', 'Et sit nihil tempore accusantium. Molestias rerum quis voluptatem necessitatibus est ea. Quos quis et distinctio incidunt. Animi impedit ut soluta dicta. Exercitationem et non earum vel necessitatibus numquam. Aut repudiandae praesentium doloribus illo.', '242.99', '264.96', 89, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(12, 1, 'In veritatis voluptatibus', 'in-veritatis-voluptatibus-Ixgo9', 'RFDTBTDU', 'Dolores omnis delectus vero ea sunt nulla veniam expedita.', 'Delectus et ab repellat odit quia nulla eligendi eum. Sequi similique quo qui iste dolores officiis et ut. Fugit aperiam facilis et voluptas optio in. Mollitia nobis eligendi architecto neque. Numquam et impedit nam id eaque repellat.', '280.01', NULL, 137, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(13, 2, 'Distinctio et molestias', 'distinctio-et-molestias-RoKxo', 'E6ICEQDI', 'Et odit quos non dolores illo hic voluptatem vitae deserunt enim iure in exercitationem eveniet nulla ut.', 'Sint cumque consequuntur ratione placeat veritatis. Fugit blanditiis nulla aut explicabo. Autem quidem inventore modi voluptatum mollitia totam.', '29.87', NULL, 81, 1, 1, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(14, 2, 'Sint sed voluptatem', 'sint-sed-voluptatem-3lDKZ', 'SXYRZ6TO', 'Labore dolorum in ducimus corrupti quod est earum repellendus quia culpa in voluptatum rerum debitis molestiae ut.', 'Et quos voluptatum minus adipisci omnis similique ut sint. Libero delectus eos est rerum ut omnis et. Sint accusamus asperiores blanditiis. Sunt ut sint sint minus neque. Hic officia dolorum occaecati et labore.', '249.75', NULL, 180, 0, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(15, 2, 'Aut sequi nobis', 'aut-sequi-nobis-hfhUl', '0VRLQDTM', 'Dicta molestiae voluptas modi omnis saepe velit molestias exercitationem ut ullam odio atque fugit.', 'Facere impedit sit inventore natus. Omnis fugiat beatae rem nostrum facere consectetur nam. Impedit aperiam incidunt a explicabo. Eos quidem et eius qui esse quo. Unde velit doloremque rerum ea aperiam non voluptatem. Quod esse veniam tempora tenetur atque sed est.', '278.75', NULL, 41, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(16, 2, 'Maxime expedita minima', 'maxime-expedita-minima-ZKq1I', 'N0N5TMO8', 'Rerum laborum quod nesciunt ut et accusantium culpa nulla magni excepturi deserunt alias non.', 'Omnis alias fuga dolorum repudiandae placeat dolorem. Accusamus incidunt facere rem maiores commodi reprehenderit. Quia est sint et veniam laborum ut amet. Voluptatem voluptatum rerum nostrum quia. Reiciendis eos suscipit aut officia ut.', '230.53', NULL, 65, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(17, 2, 'Sapiente quia ipsum', 'sapiente-quia-ipsum-lWQ5E', 'J8I5HJ1F', 'Fugiat distinctio animi sunt et et et ut voluptatem et voluptate facilis voluptates provident est nemo.', 'Corporis et id ab aut consequuntur error enim praesentium. Quae reprehenderit quia quia nulla. Error facere at aut architecto ut rerum. Recusandae omnis sint atque sit amet modi a. Culpa repudiandae aut ab et quo.', '220.09', '259.70', 172, 0, 1, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(18, 2, 'Et dolorem fugiat', 'et-dolorem-fugiat-roVAi', 'IE5NXY40', 'Minus explicabo alias natus quia ducimus ex accusamus iure.', 'Ut enim architecto adipisci voluptas repellat dolorem est. Libero recusandae reiciendis et quo veritatis. Enim possimus porro illo repellendus quis est error. Ut accusantium voluptatem autem blanditiis aut ut omnis.', '212.98', NULL, 136, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(19, 2, 'Et dolores possimus', 'et-dolores-possimus-jd9hF', 'JV75BFUY', 'Modi mollitia et dolorem et sed tempora odit eveniet cumque inventore rerum quas iste.', 'Inventore magnam necessitatibus dicta est ea quia aut. Non porro assumenda quae in sint iste suscipit. Doloribus sint maiores eveniet rerum blanditiis voluptatum eos. Dolorum numquam possimus eum ex quia repellat nihil. Ipsa optio alias voluptatem incidunt doloremque vitae beatae consequatur.', '117.59', '129.08', 96, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(20, 2, 'Voluptatem voluptas repellendus', 'voluptatem-voluptas-repellendus-9DSgX', 'LHEDWHRY', 'Omnis quia soluta quas et rerum qui perferendis.', 'Ducimus nostrum aliquam dolor omnis in. Autem iure in ipsa est nemo veniam soluta. Nam aut consequatur earum officia quia maxime dolores. Consequatur sit et illum facilis qui ipsam doloribus. Sequi et enim enim accusamus magnam eaque repellat enim. Iure quia voluptatum enim.', '13.29', NULL, 115, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(21, 2, 'Rem numquam est', 'rem-numquam-est-UFwNw', 'KGLPK1PW', 'Maxime ratione ut sit iusto rerum occaecati sit ipsum officiis.', 'Totam repellendus nemo illo et explicabo. Veritatis facere quia aut explicabo nostrum. Eum praesentium illum est deleniti error iusto. Neque explicabo odio minus vel doloremque.', '83.38', NULL, 46, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(22, 2, 'Voluptatem at tenetur', 'voluptatem-at-tenetur-beTyL', 'HSUJLNF2', 'Voluptatum veniam rerum sit voluptatem consequatur quae et accusamus qui.', 'Facilis est fuga recusandae facilis totam dolorum. Id nisi provident ab perferendis perferendis odio ratione. Et aspernatur mollitia deserunt neque quibusdam quibusdam.', '224.08', '245.39', 19, 1, 1, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(23, 2, 'Corporis earum nisi', 'corporis-earum-nisi-VSJEO', 'EMYTQW0G', 'Facilis nobis facilis iure cum est esse ut dolorem quo similique distinctio ut architecto omnis dolorum impedit.', 'Numquam consequuntur optio sint omnis. Possimus eos ea aperiam. Repudiandae reiciendis iusto sunt quibusdam suscipit similique.', '289.06', NULL, 77, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(24, 2, 'Officia excepturi amet', 'officia-excepturi-amet-EXfBD', 'PBDXKG1G', 'Vel enim numquam et id vel qui incidunt corporis velit rerum officia sunt non mollitia rerum.', 'Amet minus sint ipsam quia. Quia eum quam dolorem incidunt inventore. Alias amet dolorem sit explicabo et rerum.', '57.70', NULL, 160, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(25, 3, 'Sit accusamus incidunt', 'sit-accusamus-incidunt-l6QyD', 'R9K9QWJV', 'Delectus aperiam maxime fugit consectetur minus assumenda consequatur ex modi ea nihil ut quis distinctio iusto.', 'Nihil exercitationem labore enim. Quasi aut molestias et nostrum et. Voluptas tempora incidunt ducimus possimus consequuntur. Commodi voluptatem velit omnis iusto nihil praesentium. Beatae dolore quia et dolor sunt.', '48.09', NULL, 18, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(26, 3, 'Labore excepturi voluptatibus', 'labore-excepturi-voluptatibus-EnAcE', 'OX1FF7EV', 'Ipsam similique nihil sint facere explicabo omnis quam doloremque atque quia placeat omnis.', 'Quasi velit numquam cumque nobis iure debitis necessitatibus. Alias dolor minima accusantium aliquam cum cum consequatur. Fugiat quaerat pariatur excepturi ea accusantium in beatae. Quia quo est in deserunt placeat cupiditate laudantium atque. Qui autem corrupti ratione voluptas rerum.', '208.77', NULL, 148, 1, 1, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(27, 3, 'Sed qui ea', 'sed-qui-ea-FyksG', '7TJQUVPL', 'Qui quasi quas sed iusto laboriosam et aut architecto minus aspernatur voluptate enim.', 'Quod facilis ducimus sed est libero vitae debitis. Maiores aut voluptas ea dolores quos eos. Eius quasi dolores repellat officiis voluptatem quia tenetur. A necessitatibus quis veritatis tempora in. Eos quia commodi amet id possimus totam qui.', '137.99', NULL, 147, 1, 1, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(28, 3, 'Quos atque saepe', 'quos-atque-saepe-6Vcyj', 'IFV3XKQI', 'Sapiente error est aliquid fugit nulla atque nisi cumque ab praesentium excepturi sit ut fugit consequuntur molestiae.', 'Velit provident omnis assumenda sit veniam commodi. Quis et sequi perferendis ipsam illum similique sunt est. Dolores natus omnis delectus autem dolor ut et magnam. Quasi tempore laudantium deleniti sint illo doloremque. Rerum recusandae sit qui cupiditate officiis et.', '198.08', NULL, 141, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(29, 3, 'Consequatur repellat ut', 'consequatur-repellat-ut-zi7bK', 'EMPQQMLG', 'Eum minima omnis aliquid dolores qui aspernatur et ea voluptatem ratione eaque recusandae velit.', 'Ut aut consequatur officia saepe aperiam consequatur. Doloribus natus ut soluta vero officiis est quia. Ab eius delectus soluta vero explicabo.', '81.75', NULL, 79, 0, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(30, 3, 'Deleniti est debitis', 'deleniti-est-debitis-LOsD4', 'JYUUSTS5', 'Et incidunt voluptatibus qui enim quo perspiciatis pariatur laudantium ea itaque nihil consequatur ipsa est aut.', 'Itaque est ducimus voluptatibus quos dolorem aut consequatur. In sunt blanditiis laborum quos nemo. Nam fugit modi dolor soluta tempora at. Sed et laboriosam aut incidunt.', '138.39', '159.78', 195, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(31, 3, 'Consequatur expedita et', 'consequatur-expedita-et-6iY1V', '1CBQ6FYD', 'Id non recusandae illo illo unde fuga quo ducimus rem explicabo voluptas possimus libero accusamus quis voluptatem.', 'Atque tenetur officiis non magnam amet. Blanditiis qui quae voluptas voluptatum minima. Magni quia tenetur nihil voluptatem sint pariatur. Rem blanditiis nobis ad dolores eius totam officia.', '184.99', NULL, 36, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(32, 3, 'Accusamus ut dignissimos', 'accusamus-ut-dignissimos-tSYeF', 'SECEZRPS', 'Et corrupti omnis et consequatur est in corrupti quas velit in voluptatibus ut.', 'Necessitatibus qui molestiae vel occaecati voluptatem. Consectetur et impedit corporis corporis nam et nemo. Est et debitis amet similique molestias. Nobis debitis magni debitis neque.', '14.03', NULL, 69, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(33, 3, 'Magni aspernatur et', 'magni-aspernatur-et-aHSPA', '12JLGKGE', 'Laudantium atque sint dolor deleniti eius cumque voluptatum voluptatem repellendus magni exercitationem.', 'Autem labore in labore voluptas molestiae aut. Quod ex fugit non harum. Voluptates enim eveniet et velit ducimus et soluta. Quia minus odio nihil nihil est ut perspiciatis fuga.', '117.25', NULL, 123, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(34, 3, 'Quas recusandae et', 'quas-recusandae-et-mpzob', '2O64KOTZ', 'Voluptate voluptas quam et omnis ipsum sed eligendi.', 'Nam eaque accusantium sit minus odio error expedita. Maiores ipsum aut tenetur et illo rerum consequatur libero. Nemo explicabo architecto dolore delectus distinctio quia corporis. Libero est qui porro dolor velit assumenda.', '220.41', '226.38', 191, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(35, 3, 'Aliquam deserunt omnis', 'aliquam-deserunt-omnis-xUafC', '9YHFXLER', 'Minima dolorem rem id maiores odit perspiciatis aut minus nihil est.', 'Inventore pariatur minima mollitia iusto dolorum dicta ea. Quasi praesentium ab eaque molestias. Et earum saepe ab aut eius et illum. Ex omnis laborum ipsam impedit cupiditate alias consectetur. Voluptates repudiandae accusamus molestiae ut et qui consequatur.', '104.05', NULL, 100, 1, 0, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(36, 3, 'Temporibus non aut', 'temporibus-non-aut-XiJGq', 'QZ1HH8OY', 'Quo eos ad consectetur sit maxime qui architecto necessitatibus autem nam qui voluptas voluptatem quia et est.', 'Non aut blanditiis aut consequatur. Repellendus voluptate amet nulla ex. Reiciendis deleniti blanditiis corporis minima exercitationem. Et sequi enim quod magni ipsa quis quae.', '282.53', NULL, 196, 0, 1, NULL, NULL, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(37, 4, 'Molestiae commodi reprehenderit', 'molestiae-commodi-reprehenderit-4HuKw', 'KYHWHH51', 'Explicabo vitae officia fuga et dicta quis molestiae enim perferendis eaque perferendis.', 'Explicabo eius sed rem blanditiis aliquid reiciendis sunt quis. Numquam quasi sequi iusto consequatur minima voluptas. Recusandae laudantium totam nam fuga aspernatur corrupti. Ut consequatur animi neque facilis quo quam quia praesentium. Quia dolores quos aut reprehenderit beatae fugit. In possimus aperiam neque consequuntur.', '48.58', '80.51', 52, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(38, 4, 'Ad quia rerum', 'ad-quia-rerum-euj2v', 'NFT8NMGQ', 'Iste rerum ad autem rerum cumque et veniam praesentium dolorum quidem maiores quo.', 'Consequatur et explicabo sit officia in ut. Autem aut eos voluptates corporis maxime necessitatibus. Laboriosam ratione cumque vitae culpa. Ab aut dolorem in nobis sed et. Sed enim deserunt repudiandae reiciendis voluptate id omnis.', '99.10', NULL, 103, 1, 1, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(39, 4, 'At culpa eius', 'at-culpa-eius-cla9h', 'PAC0RWD1', 'Enim veritatis ex omnis necessitatibus velit sint aut laboriosam a rerum quod aut commodi non magnam.', 'Est nemo unde delectus nihil. Hic nam et repellendus. Et et excepturi quasi ut.', '203.69', '243.05', 131, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(40, 4, 'Omnis exercitationem omnis', 'omnis-exercitationem-omnis-P6OiQ', 'VUXSRWG0', 'Nobis aut error et veritatis mollitia sit placeat iste qui ut accusantium voluptatibus eius veniam.', 'Rerum qui et dolore sit rerum ea aut. Voluptatem id quia soluta ea. Animi facilis quia itaque at laudantium. Sit blanditiis aut ut veniam.', '51.20', NULL, 44, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(41, 4, 'Iusto repudiandae accusantium', 'iusto-repudiandae-accusantium-jeHJG', '1ZXA5OFT', 'Vel voluptatibus quas asperiores alias fugiat est nisi tempore quae qui ut corrupti vel totam saepe.', 'Doloribus adipisci nobis quia voluptatibus nesciunt accusantium. Quidem inventore voluptas eum nobis qui. Qui quidem sint qui vitae.', '140.66', NULL, 47, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(42, 4, 'Distinctio nesciunt porro', 'distinctio-nesciunt-porro-whibl', 'NSHKTQZR', 'Error autem totam odit perferendis at quisquam occaecati autem quis.', 'Consectetur sunt accusantium est vel placeat corporis. Aut iste quam nam voluptas voluptatem nihil. Vero dignissimos dolorem soluta enim eos est unde.', '129.91', NULL, 118, 0, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(43, 4, 'Qui ad earum', 'qui-ad-earum-Mi9B9', 'CYDRRLOR', 'Eligendi iusto dolores quam pariatur enim incidunt occaecati eos animi dolores aut quo harum.', 'Doloremque quia maxime enim asperiores. Quos repellendus sint in. Eum doloremque consectetur omnis explicabo voluptatem eius. Aut pariatur molestias adipisci est iure illum.', '257.30', NULL, 120, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(44, 4, 'Qui porro excepturi', 'qui-porro-excepturi-4UO8A', 'OLHV7BQI', 'Perferendis sint blanditiis quae eum magnam totam at saepe cumque quis ut ut.', 'Expedita placeat quas aperiam provident illo. Quia est ut earum repudiandae culpa iste assumenda. Quis placeat iure voluptas aut minus.', '151.56', NULL, 157, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(45, 4, 'Asperiores et laboriosam', 'asperiores-et-laboriosam-ghTUa', 'NBLLUOZL', 'Voluptas qui aperiam similique alias est laborum sint dolorem consequatur ipsum accusamus odit aliquid quisquam voluptatem.', 'Aperiam nisi tenetur aperiam molestiae exercitationem qui. Ut quasi eligendi nesciunt aut occaecati. Excepturi veritatis architecto in esse ea iusto incidunt. Ratione aut dolorem temporibus suscipit repudiandae aut commodi. Autem voluptas voluptatum quia dolorem consequatur error unde. Eum necessitatibus in doloremque quia voluptatem hic nulla.', '137.76', NULL, 4, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(46, 4, 'Quis non consequatur', 'quis-non-consequatur-yAvbY', 'EIJBGF6F', 'Veniam voluptas in laborum sed odio quia praesentium saepe suscipit nam qui est.', 'In omnis dolore architecto. Adipisci dolore maxime aperiam autem dolorem et dolor natus. Officia sit tempora aspernatur corrupti. Eaque sed aspernatur atque dicta quisquam adipisci. Facilis rem asperiores illo sint non.', '224.77', '274.35', 41, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(47, 4, 'Vel autem dicta', 'vel-autem-dicta-2ii0s', '7L31D7QY', 'Sed temporibus optio magnam ut aut voluptatem quibusdam saepe quas.', 'Repellendus rerum ea a quasi aut cumque qui est. Architecto hic ab dolor facere numquam labore. Similique nihil optio recusandae non. Eos velit consectetur excepturi sed numquam omnis nam eligendi. Placeat eum ea quo molestias. A autem corrupti beatae autem atque.', '46.66', NULL, 1, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(48, 4, 'Sit mollitia quis', 'sit-mollitia-quis-VOpQ2', 'YDIRFX4R', 'Itaque ipsa qui dolor est accusamus quam aut ut.', 'Et iste aut tempore saepe. Eligendi velit laudantium dignissimos laboriosam cumque minus. Est quam ipsum sit quasi repellat voluptatibus officia. Aliquam rerum nam iure excepturi sequi praesentium. Et expedita illo illum quaerat temporibus quia.', '95.44', NULL, 136, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(49, 5, 'Hic et dolorem', 'hic-et-dolorem-po4qV', '5VSCJPQU', 'Doloremque temporibus est doloremque sint numquam veritatis fugiat ullam.', 'Debitis aut non quos. Est qui veniam minima voluptatem atque. Et perferendis ut cum dolor vel qui aliquam. Deleniti accusamus molestias consequatur vel dolores optio eius eveniet. Id ullam reiciendis eos rem sed et. Non qui omnis repellendus est sapiente qui.', '275.49', NULL, 79, 0, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(50, 5, 'Enim accusantium ab', 'enim-accusantium-ab-gjZ3W', '2WDDSLVN', 'Nam officia mollitia id dicta qui earum sed adipisci iusto iusto sunt ipsa numquam.', 'Quis nobis omnis aspernatur. Autem et quisquam sed voluptatem illo. Et qui quod error repellendus sit eum. Reprehenderit libero eum neque eos ut qui.', '235.65', NULL, 131, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(51, 5, 'Occaecati est voluptatem', 'occaecati-est-voluptatem-tNzTh', 'LWULCKLL', 'Blanditiis et unde corrupti amet quis ex quas beatae vitae voluptas minus autem quibusdam omnis.', 'Accusamus quo possimus ut repellendus dolores. Consequatur quibusdam ut voluptas vel dignissimos velit deleniti quis. Voluptatem perferendis deleniti autem est. Eaque consectetur accusantium sapiente recusandae. Asperiores velit quia autem eveniet porro maiores doloribus.', '289.60', NULL, 137, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(52, 5, 'Ut porro fugit', 'ut-porro-fugit-I1Ejl', 'JFYR0QHV', 'Consectetur nisi dolore autem iusto omnis eligendi autem qui corrupti ad voluptatem.', 'Reiciendis ad qui magnam quo. Itaque qui ipsum eos nulla eum possimus qui. Sed quasi ea eveniet. Cupiditate praesentium qui consectetur sunt qui cum.', '47.98', '62.05', 193, 1, 1, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(53, 5, 'Quaerat placeat reiciendis', 'quaerat-placeat-reiciendis-TEL3J', 'BJFEAYLC', 'Sint commodi omnis et voluptatem temporibus impedit et est sed suscipit magnam quidem officiis.', 'Voluptatem qui voluptatem repellat dolor placeat. Maxime qui vel cumque distinctio. Ex eaque cumque assumenda ab fuga rem velit aut. Error nemo et non. Eum omnis delectus rerum nihil est.', '142.52', NULL, 2, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(54, 5, 'Illo ut sed', 'illo-ut-sed-H6mSL', 'CGJXCJDT', 'Officia placeat iure perspiciatis laboriosam nulla sed mollitia amet dolorem minima reiciendis fuga eum et beatae magnam.', 'Enim perspiciatis in iure. Nam quidem sapiente non quam. Molestias qui illum enim recusandae quia. Perferendis fugit animi in fugiat adipisci. Nulla nesciunt deserunt quis repellat nihil corrupti quas.', '233.96', NULL, 157, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(55, 5, 'Qui nihil perspiciatis', 'qui-nihil-perspiciatis-jGKmg', 'VKP5W2N4', 'Nulla numquam quas minima sequi fugit qui voluptatem ea ad quam quibusdam provident deserunt hic.', 'Eaque enim delectus asperiores voluptatem libero. Voluptas qui eaque eaque quam quos est. Fugiat optio similique voluptatem ipsum eum dolor. Quasi voluptatem et minus quis. Necessitatibus facere aliquam in similique totam odio quos molestiae.', '157.47', '173.21', 59, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(56, 5, 'Dignissimos veritatis magnam', 'dignissimos-veritatis-magnam-RqJqf', 'I92SUSDH', 'Et velit adipisci labore et aut sed molestiae blanditiis vel accusantium veritatis voluptatibus officia et consequatur quis.', 'Ut qui quibusdam quia cupiditate non sunt deserunt. Ea quos et earum porro rem eligendi rerum. Facere iusto nostrum autem id.', '278.74', NULL, 166, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(57, 5, 'Corrupti culpa voluptate', 'corrupti-culpa-voluptate-5zD8K', 'O8HYRCQJ', 'Et repellendus iure qui ut praesentium non quia qui occaecati.', 'Quae quod quasi quis impedit similique. Error vel et ea accusamus cumque ipsam rerum. Sed sed similique inventore expedita unde. Accusantium veniam ad vel nesciunt eveniet beatae. Aut et ut perspiciatis dolor. Voluptas ut ipsum doloribus quia modi nihil.', '46.13', NULL, 188, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(58, 5, 'Saepe voluptatem aut', 'saepe-voluptatem-aut-nS7cq', 'PBWDCWIY', 'A id ullam provident fugiat optio laborum eligendi.', 'Porro vitae quas aut quia molestias ipsa totam corporis. Ut in molestiae totam et delectus libero. Praesentium temporibus natus et repellat.', '213.81', NULL, 132, 1, 1, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(59, 5, 'Corrupti fugit magni', 'corrupti-fugit-magni-LHifS', '1IN1HFPP', 'Ullam ut pariatur sapiente aut veniam animi assumenda nulla incidunt iure cupiditate itaque.', 'Magni voluptates doloremque a vitae. Asperiores tempore labore fugiat voluptates consequuntur cupiditate id. Officiis et perspiciatis qui accusantium. Illo ea enim quo quis ea. Qui vel perspiciatis voluptates in velit est. Sequi quas minus doloribus minus qui.', '134.06', NULL, 108, 0, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(60, 5, 'Blanditiis pariatur quisquam', 'blanditiis-pariatur-quisquam-JbQSm', '9PMQGIZP', 'Enim fugiat mollitia veniam aliquam minima sequi aliquam aspernatur.', 'Quia dolor illum tenetur nihil excepturi. Fuga quam consequatur velit dolores ea. Ipsum quas molestiae nobis quia minima. Eaque et eum commodi ea distinctio tempore.', '116.57', '148.31', 183, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(61, 6, 'Dolores vitae quisquam', 'dolores-vitae-quisquam-sKXiW', 'HKEWJERD', 'Voluptatem neque quas et doloribus dolores id sunt fugiat nesciunt ratione.', 'Sed quod repellendus nostrum eius fugit error. Voluptatibus molestias dolore ut voluptatem consequatur voluptatem. Quos vero autem dicta rerum incidunt autem consequatur. Quaerat asperiores enim quo non ut cumque veniam. Sit iusto sint delectus odit sunt labore corporis. Quia id ratione voluptate vero.', '226.03', NULL, 103, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(62, 6, 'Necessitatibus eligendi rerum', 'necessitatibus-eligendi-rerum-XVq8s', '1YDOFTNM', 'Sed quidem eligendi provident provident consequatur delectus et incidunt laboriosam praesentium est explicabo aut.', 'Quis quasi ad ea. Illo quis reiciendis suscipit ullam beatae modi eum iste. Vitae vitae exercitationem pariatur porro.', '269.54', NULL, 44, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(63, 6, 'Sed voluptas numquam', 'sed-voluptas-numquam-PFbBp', '4VCRCI24', 'Id et neque sint itaque accusamus voluptatem quia in sit quam aspernatur sit.', 'Repudiandae est ea quia nobis a aliquam ea. Earum velit reiciendis omnis nesciunt. Animi vel architecto ullam dolor veritatis. Et ex debitis vel et libero reiciendis. Eos et non assumenda aliquid id saepe et laboriosam. Rerum a sunt reiciendis.', '28.96', NULL, 15, 0, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(64, 6, 'Sit iusto cumque', 'sit-iusto-cumque-ehCMg', '2WOP0BA0', 'Voluptatibus non veritatis rerum neque eum ab quia ad ut ratione animi aut excepturi quibusdam.', 'Porro eius suscipit et et est. Praesentium iusto dolorum quidem dolorem velit. Adipisci ratione quam sunt deserunt sed maxime pariatur. Esse animi voluptatem doloremque hic distinctio esse voluptatum. Aperiam blanditiis est aut eaque.', '277.79', NULL, 124, 1, 1, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(65, 6, 'Aspernatur rerum qui', 'aspernatur-rerum-qui-Oe9NO', 'RMDYZRBB', 'Ipsam et quisquam nesciunt voluptas debitis qui itaque.', 'Ipsum placeat in quia. Aspernatur quis pariatur magni maxime eius et. Repellendus necessitatibus soluta animi ex laborum harum voluptatem. A et nam impedit veritatis. Rerum ratione odit asperiores voluptatem accusantium earum accusamus. Necessitatibus hic quos et.', '284.12', '328.56', 149, 0, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(66, 6, 'Ut atque fugit', 'ut-atque-fugit-GTfUH', 'L3BTRITS', 'Qui officiis voluptas ad et aspernatur aliquid necessitatibus voluptatum voluptatibus culpa.', 'Et qui est nam ullam aut amet. Quae qui earum et. Rem in nam saepe aliquid magnam voluptatem velit voluptates. Consequatur aut voluptates dolorem beatae. Incidunt ullam magnam atque est est soluta molestias.', '96.19', NULL, 151, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(67, 6, 'Consequuntur voluptas quod', 'consequuntur-voluptas-quod-vsu1u', '7HIQ5SY3', 'Explicabo ea quos eos magnam ut voluptates quibusdam voluptatem in aut sunt ea voluptates voluptatem nam quibusdam.', 'Nesciunt corporis ea aut natus consequatur. Eum ad quasi rerum mollitia. Atque amet doloribus earum voluptas quia ipsam.', '9.91', NULL, 188, 1, 1, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(68, 6, 'Exercitationem error id', 'exercitationem-error-id-bVoWU', 'RTZNX7ZU', 'Ut similique voluptates reiciendis voluptatibus amet incidunt labore distinctio magni at ut voluptate.', 'Fuga vel quis consectetur error quia cum. Hic error eveniet eos velit unde aspernatur officiis. Consequatur dignissimos voluptatem et eum. Nulla et hic voluptatem. Nemo cupiditate distinctio perspiciatis repellendus neque facilis ipsa.', '159.90', NULL, 29, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(69, 6, 'Voluptatem provident ut', 'voluptatem-provident-ut-byssW', 'LHIBXF57', 'Culpa et deserunt rerum eum repellendus nobis nihil minus quia occaecati soluta voluptate.', 'Delectus sit velit laboriosam voluptate quae sapiente rem. Possimus sint veniam dicta sint quis molestiae consequatur. Autem quas itaque facilis dicta nulla atque sunt dolor. Dicta magnam modi debitis pariatur voluptas omnis in. Saepe mollitia dicta distinctio debitis aut repellendus debitis minus.', '223.23', NULL, 22, 0, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(70, 6, 'Laborum quia consequatur', 'laborum-quia-consequatur-ui8ql', 'IWMFZTDM', 'Quis hic explicabo atque ut laboriosam odio aspernatur qui rerum harum.', 'Nihil fugit et non eius. Qui quas cupiditate natus et autem rerum. Placeat ut repudiandae voluptatem dolor placeat qui id. Dolor magni ipsam temporibus. Tempore omnis quia alias laboriosam voluptatem aperiam.', '262.18', NULL, 7, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(71, 6, 'Quia nemo ipsam', 'quia-nemo-ipsam-FnJbH', '666ETQAP', 'Debitis non pariatur et eligendi minima beatae commodi qui maxime beatae.', 'Ea rem occaecati autem eligendi est adipisci iure. Qui quia fuga corporis eveniet. Tempora esse aut dolor eaque iste. Veniam et ut nihil maxime corrupti autem dolores et. Praesentium facere repudiandae tempore dolor consequatur sint explicabo suscipit.', '75.04', NULL, 13, 0, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(72, 6, 'Et sunt dignissimos', 'et-sunt-dignissimos-4UdYS', 'EFTACUGK', 'Consequatur saepe magni facere fugit atque quae est fuga quo iure earum.', 'Eligendi occaecati optio voluptas rerum. Eum rerum accusantium ducimus eaque reprehenderit. Est explicabo quia magni nulla corporis. Dolorem voluptatibus consequatur veniam voluptatem perferendis perspiciatis est.', '28.25', '49.97', 182, 1, 0, NULL, NULL, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(73, 7, 'Nesciunt hic vitae', 'nesciunt-hic-vitae-MUsYf', 'DBCBPOL2', 'Quae quam distinctio ducimus nihil eum officiis possimus et.', 'Repellendus sunt repudiandae aperiam natus dolore. Placeat ipsa modi est at saepe fuga. Aspernatur perferendis non dolores rerum quibusdam.', '265.77', '310.11', 183, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(74, 7, 'Aut recusandae sit', 'aut-recusandae-sit-sDt0V', '1VF7NAIB', 'Dolorem magnam dolores commodi sed nulla iusto ab iusto in quia blanditiis aspernatur provident corrupti ad.', 'Qui eum laborum placeat quo eum. Eius qui labore molestiae odit. Molestiae in vel aut numquam.', '286.10', NULL, 5, 0, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(75, 7, 'Adipisci consequatur dolores', 'adipisci-consequatur-dolores-3xpgc', 'AXU1WNKI', 'Repudiandae et corrupti sed mollitia aut voluptatem consequatur optio quis ratione dicta esse neque temporibus.', 'Et quaerat voluptate molestias officiis. Ab magni adipisci omnis quo nulla aliquid dolorem qui. Temporibus non nobis aut quia.', '77.87', NULL, 50, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(76, 7, 'Itaque voluptas minus', 'itaque-voluptas-minus-nI7cd', 'NMAVYZF8', 'Voluptatibus nam et saepe sed laborum voluptas odit praesentium numquam.', 'Quasi et et dolorem sint quis facere laudantium. Nulla tempora dignissimos eos ratione. Voluptatibus voluptatem quae facere rerum. Qui velit totam consequatur sapiente aliquam.', '265.77', NULL, 70, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(77, 7, 'Omnis consequuntur laudantium', 'omnis-consequuntur-laudantium-mn21H', 'K0CHGXVL', 'Modi temporibus officia aliquam earum veritatis non nihil quia non.', 'Voluptatum culpa et optio omnis. Minima omnis accusantium occaecati consequatur. Illum quam perspiciatis esse et. Labore aperiam sunt dolorem accusantium. Ea dolorum minima et. Eos et facilis aspernatur sit nisi ratione dolor.', '152.28', NULL, 192, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(78, 7, 'Rerum molestias est', 'rerum-molestias-est-SAVw8', '0H2BULJ8', 'Porro voluptas ab suscipit eligendi aliquid vel dolorem ducimus et enim atque repellat tempora fuga neque.', 'Magnam et occaecati alias eius eligendi nesciunt quia. Ea sint voluptas laborum praesentium libero mollitia. Atque laborum ex nihil esse soluta mollitia quae. Illum facere omnis esse fugiat. Laborum iusto totam dolor laboriosam magnam quisquam.', '29.33', NULL, 142, 0, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(79, 7, 'Sint error perspiciatis', 'sint-error-perspiciatis-ZzZuO', 'YUGIHGNS', 'Atque ut natus vero dolores id aut facilis sit.', 'Doloremque aut asperiores dolore esse fugit ut ut quasi. Veritatis voluptas ut pariatur qui praesentium hic eligendi. Inventore vel corrupti voluptatem et aut. Quibusdam sunt reiciendis debitis tenetur. Aliquid nihil explicabo laudantium natus voluptatem possimus debitis.', '273.86', NULL, 78, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(80, 7, 'Aut et quia', 'aut-et-quia-Ew36m', 'LT2FWSIZ', 'Asperiores eveniet debitis consequuntur amet nihil quia magni consequatur suscipit quo voluptas laudantium nostrum quia aut dolor.', 'Quae suscipit enim eum eos nobis sequi. Ea at fuga dicta ab et rerum vero. Dolor sed quis omnis quasi.', '9.36', '38.72', 17, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(81, 7, 'Sapiente ut velit', 'sapiente-ut-velit-GXLUu', 'Z8AWNLWW', 'Quasi sed a quia id a repudiandae qui ut repellat velit facilis aut aut id iure.', 'Aut maiores et a nisi itaque tenetur. Amet libero quis quia. Fugiat velit sunt suscipit voluptatem dignissimos autem minus. Aspernatur blanditiis quasi repellat numquam repudiandae qui.', '297.75', NULL, 50, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(82, 7, 'Est minima quia', 'est-minima-quia-KkRXB', 'ISP5UUFY', 'Pariatur occaecati error quae dignissimos ea et aut facere et eveniet.', 'Accusantium consequatur voluptatem architecto. Animi incidunt ipsam non explicabo tempore quia enim quasi. Exercitationem non qui quo consequatur cumque eveniet.', '202.81', NULL, 125, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(83, 7, 'Pariatur sed enim', 'pariatur-sed-enim-5bu76', 'SVY5JG4N', 'Nam quas quo sed quis veniam sequi at impedit repellendus velit dolores doloribus.', 'Distinctio aut omnis consectetur molestiae. Quia ut dolore quaerat. Ea praesentium sed dolores aut.', '276.69', '314.70', 191, 1, 1, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(84, 7, 'Sunt nostrum sed', 'sunt-nostrum-sed-TMokA', 'DHX93XEW', 'Voluptatem est pariatur quaerat rerum est ab commodi.', 'Sequi debitis exercitationem rerum enim illo autem placeat quaerat. Unde ut sed eos qui soluta qui ratione. Voluptatem impedit sed cum tenetur doloremque et.', '213.42', '230.87', 51, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(85, 8, 'Quo aut similique', 'quo-aut-similique-amNMY', 'OIHPVL61', 'Officiis delectus nulla ab dignissimos quis nulla quis.', 'Aliquam atque quia hic tempore perferendis omnis autem. Illo libero qui vitae sed. Sed sit rerum molestiae aut. Cumque cum architecto aut optio. Quis rem laudantium aut aliquid ipsum itaque.', '209.25', NULL, 150, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(86, 8, 'Maxime exercitationem id', 'maxime-exercitationem-id-A5GA4', '4QWE08XA', 'Molestiae molestiae et cupiditate eum voluptates voluptates maiores.', 'Explicabo repellendus sint alias et velit. Quibusdam libero accusantium eveniet exercitationem earum. Architecto et vero ut voluptatem commodi tenetur. Tenetur repellendus quia iste nisi voluptatem soluta deleniti. Nobis esse est impedit magni enim sit.', '298.12', '302.60', 81, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(87, 8, 'Ut vel mollitia', 'ut-vel-mollitia-A1kLJ', 'ZECEWPQ1', 'Accusamus consequatur expedita facere beatae doloremque blanditiis quaerat at aut recusandae non illum veritatis consequatur.', 'Cum nemo porro distinctio rem ullam architecto laudantium. Ut unde at est quaerat maiores. Quisquam sint unde minima incidunt animi.', '180.90', NULL, 123, 1, 1, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(88, 8, 'Consequuntur amet impedit', 'consequuntur-amet-impedit-Bgf2v', 'W5HHG3KA', 'Et maiores ex perferendis consectetur nobis nisi error nesciunt laboriosam asperiores accusamus.', 'Earum ut vitae ea ducimus optio aut. Optio aut rem ut tempore. Vitae nihil amet nemo maxime autem asperiores et. Aperiam molestiae nostrum consectetur. Reprehenderit animi in minus similique. Et aperiam impedit dolor et sapiente quis consequatur quae.', '121.59', '155.42', 40, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(89, 8, 'Aspernatur commodi et', 'aspernatur-commodi-et-EK92e', 'FYE5LOVO', 'Et ea voluptas aut beatae ab esse possimus optio impedit vitae mollitia dolor necessitatibus consequatur at.', 'Porro et assumenda totam et quibusdam. Fugit dicta aspernatur qui. Qui quasi quibusdam quia natus sapiente expedita. Est fuga tempora et id labore illum.', '238.14', NULL, 71, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(90, 8, 'Facilis praesentium occaecati', 'facilis-praesentium-occaecati-LD5gw', 'DANKH7XA', 'Eos et quasi est aspernatur officiis ipsam sed ipsa vel illo quaerat sit eius quidem pariatur.', 'Aut aspernatur asperiores modi earum commodi quia. Ut non sint quidem sunt quam et saepe. Laborum doloremque repudiandae totam ab. Nemo debitis ex at consequatur ut labore qui neque.', '12.15', '17.12', 159, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(91, 8, 'Laboriosam enim aut', 'laboriosam-enim-aut-B7Khf', 'GPLIR6LH', 'Est rem excepturi dolore harum eos cupiditate sapiente tempore quia quo voluptatibus.', 'Velit voluptas non sapiente fugit non soluta aliquam. Natus officia expedita ut ad quae qui. Consequuntur magnam quisquam qui quasi quos molestiae molestiae.', '283.01', NULL, 12, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(92, 8, 'Voluptatem harum veritatis', 'voluptatem-harum-veritatis-XyRDZ', 'SIGZD5PW', 'Deserunt similique error corrupti tempore fugiat necessitatibus enim odio.', 'Aspernatur quia eum aut enim qui voluptatem. Quidem ut dolorem magni saepe recusandae harum. Omnis praesentium expedita qui velit corporis sed. Eum rerum possimus est animi explicabo dolorem. Non nihil quo provident possimus vel et. Labore enim facere odio esse hic aut.', '75.50', NULL, 11, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(93, 8, 'Neque suscipit velit', 'neque-suscipit-velit-zMNsn', 'LJ0MT6BA', 'Ullam accusamus facilis et consequatur autem esse molestias et dignissimos et.', 'Blanditiis facere ut dolor laboriosam molestiae cum dolores est. Non modi rem architecto debitis. Laborum quos et eum atque architecto. Quia eius ratione et temporibus non. Incidunt consectetur molestias laboriosam beatae saepe vel qui voluptatem.', '112.11', NULL, 24, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(94, 8, 'Quidem aspernatur temporibus', 'quidem-aspernatur-temporibus-fnfeG', 'IWKX7STA', 'Voluptatum voluptas iure est quis veniam aut modi dignissimos eum sequi non blanditiis qui praesentium a hic.', 'Magnam dolorem iure aut quis id odio illo. Id quam omnis velit quo sit. Culpa et inventore dolor repellat. Beatae et quos provident quae laborum.', '116.94', '140.33', 162, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(95, 8, 'Molestiae ipsam sequi', 'molestiae-ipsam-sequi-l080M', 'HQ6FMLQL', 'Quo mollitia a porro veniam dolorem tempora id eum consectetur id totam in in.', 'Rerum similique sit ipsam quae in possimus. Excepturi dolores ut velit cumque magni ut ut. Saepe veniam voluptate labore qui et error. Quisquam quo vel deserunt mollitia. Voluptatibus quia praesentium est aperiam qui.', '192.81', '231.27', 80, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(96, 8, 'Non saepe nesciunt', 'non-saepe-nesciunt-Hxwzh', 'DIW23HKI', 'Autem unde quia numquam facere libero nesciunt ea alias.', 'Tempora inventore et consequatur quis veniam. Nesciunt dolorem explicabo et fugiat tempora sed. Culpa quibusdam voluptate qui et voluptates quibusdam. Excepturi ut vitae itaque consequatur. Soluta mollitia fugit laudantium. Unde possimus molestiae cumque qui vel consequatur.', '130.89', '165.82', 50, 1, 1, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(97, 9, 'Vel et eveniet', 'vel-et-eveniet-3ZHFt', 'GJ337NWT', 'Voluptatem nam cupiditate nulla blanditiis qui voluptates sit odio laboriosam veniam eos voluptas.', 'Tempora qui corrupti dolore nemo est modi. Dicta eum mollitia sed aut. Maxime autem necessitatibus velit mollitia. Sed illum numquam debitis.', '297.95', NULL, 48, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(98, 9, 'Sed aut tempora', 'sed-aut-tempora-ifmPD', 'DFWM6HZO', 'Accusamus voluptate quasi quia neque qui id saepe deleniti ea qui dolor eligendi.', 'Fugiat adipisci ratione laborum consequatur voluptatem et. Reprehenderit sed sint omnis aut molestiae. Eos natus delectus sed molestias dolores assumenda.', '7.60', '10.01', 63, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(99, 9, 'Dicta saepe tempore', 'dicta-saepe-tempore-LKjGi', 'CINZ59PN', 'Dignissimos incidunt est repudiandae sequi possimus cumque corporis saepe dolores dolorum.', 'Beatae eaque aperiam quia blanditiis voluptate blanditiis temporibus. Earum aut voluptates beatae mollitia architecto. Ut incidunt quisquam harum minima.', '114.85', NULL, 170, 1, 1, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(100, 9, 'Quia qui delectus', 'quia-qui-delectus-7nUQf', '6VZ1HLFF', 'Omnis saepe eius iusto aliquam reprehenderit suscipit quisquam eos reprehenderit inventore soluta et eligendi voluptatem.', 'Consequatur quo voluptas qui cupiditate praesentium commodi dolorem unde. Totam consequuntur necessitatibus reiciendis voluptas. Dolores qui necessitatibus laudantium rerum et dignissimos veniam pariatur. Eveniet voluptates ut temporibus repellat at. Molestias odit laudantium debitis ullam eaque.', '200.71', NULL, 48, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(101, 9, 'Est voluptates molestiae', 'est-voluptates-molestiae-1HHxg', 'VJH1PMNF', 'Autem velit animi voluptatem quasi aut eius cupiditate quis quae in natus.', 'Occaecati nemo et voluptas neque cum autem quo. Aut quo autem maxime sunt et reprehenderit. Et nam consequatur provident quidem in. Aliquam sit numquam qui vero culpa debitis.', '186.90', NULL, 45, 1, 1, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(102, 9, 'Natus reiciendis ut', 'natus-reiciendis-ut-VO7ma', 'BHR6PVPL', 'Velit ullam sequi suscipit incidunt nulla deserunt est expedita odit recusandae ea consequatur ut molestias.', 'Qui exercitationem quam aspernatur odio neque. Et voluptas non porro corporis occaecati. Quaerat esse accusantium quisquam blanditiis esse sit.', '271.96', NULL, 22, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(103, 9, 'Perspiciatis ipsa qui', 'perspiciatis-ipsa-qui-NFJsC', 'SSGDJAWJ', 'Aperiam eos quos consequatur dolores non enim praesentium.', 'Rerum veritatis fuga id possimus quis cumque est. Et eligendi numquam alias ut quidem non porro. Quod beatae harum omnis dolorem. Voluptates impedit non hic dolor. Earum at qui non doloremque sit.', '199.94', NULL, 67, 0, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(104, 9, 'Est recusandae deleniti', 'est-recusandae-deleniti-lhdjI', 'VNXBYBNL', 'Dolore possimus id veritatis qui distinctio illum inventore distinctio consectetur rerum ut ex et omnis velit.', 'Sit voluptatem aut nemo saepe et eveniet nesciunt. Iure consequatur dignissimos reprehenderit aut inventore. Nihil ut assumenda suscipit at qui. Qui temporibus est rem et.', '39.50', NULL, 74, 1, 1, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(105, 9, 'Molestiae ab non', 'molestiae-ab-non-dH1I9', 'WU63D9IS', 'Ullam totam non sunt itaque dolore provident explicabo aperiam non perferendis sit qui et dolorum hic ab.', 'Officia labore voluptatem est voluptatem voluptatem. Atque rerum laboriosam laboriosam laboriosam ad. Similique nihil nostrum excepturi recusandae dolorem. Molestiae fugiat sunt est voluptatem.', '72.05', NULL, 120, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(106, 9, 'Culpa sunt voluptas', 'culpa-sunt-voluptas-aR31y', 'P8X8HRFB', 'Pariatur molestias ipsam vel fugiat vitae officia assumenda ut voluptas provident.', 'Et ea doloremque quisquam consequatur ullam dolor. Ex et reiciendis provident unde inventore culpa voluptates. Laudantium ducimus ullam architecto et vel. Animi et ab quam odit et porro repellat. Debitis quo asperiores nemo minus quidem ducimus aut.', '134.68', '177.92', 200, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(107, 9, 'Quidem nulla voluptas', 'quidem-nulla-voluptas-MmLNP', 'FHLXCPUV', 'Iure corrupti omnis qui natus et voluptatibus suscipit ipsam excepturi id repudiandae similique.', 'Ut quod dolor dolor incidunt qui. Sunt magnam similique repellendus. Mollitia laborum qui aspernatur magni eius et et.', '110.90', NULL, 4, 1, 1, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(108, 9, 'Fuga sunt sed', 'fuga-sunt-sed-oXSDM', 'F2WN9R0N', 'Dignissimos aspernatur consequatur ipsam architecto non cumque placeat iure necessitatibus tempora dolor cum sit sequi porro reprehenderit.', 'Et alias sit ut ut culpa alias. Est ut asperiores repudiandae odit. Consequatur voluptatum pariatur non maxime. Vitae quia non magni sit et perferendis.', '88.90', NULL, 158, 1, 0, NULL, NULL, '2025-10-23 13:07:44', '2025-10-23 13:07:44');
INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `sku`, `short_description`, `description`, `price`, `compare_at_price`, `stock`, `is_active`, `is_featured`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(109, 10, 'Excepturi facere illo', 'excepturi-facere-illo-Myb1N', 'AMAGMNXH', 'Aut vitae praesentium ut dolor voluptates et quis ad placeat necessitatibus aut et quos est illo qui.', 'Qui natus suscipit laboriosam dolores. Et vel ipsum natus quod ut modi. Fuga illum suscipit unde et. Nemo et distinctio omnis adipisci et. Nihil porro est et est in voluptatum. Voluptas non doloremque cumque inventore.', '76.81', NULL, 86, 1, 1, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(110, 10, 'Totam dolor consequuntur', 'totam-dolor-consequuntur-goIs2', '3PLOMRFQ', 'Dolorem culpa a veniam rerum est perspiciatis in distinctio.', 'Deserunt hic ipsa similique culpa voluptatem ea et placeat. Et id asperiores voluptatibus nobis ex. Laudantium qui pariatur dolorem totam qui omnis est. Eos atque consequatur dolore error. Enim modi non ut quia quia.', '238.40', '243.54', 40, 1, 1, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(111, 10, 'Occaecati aut molestias', 'occaecati-aut-molestias-5mfFc', 'OY6WDONJ', 'Est debitis nam quos error amet soluta et soluta accusamus pariatur voluptate recusandae quae doloribus dicta consequatur.', 'Saepe cumque et iusto. Necessitatibus nulla quia consectetur sequi expedita optio. Reprehenderit aut veritatis ut eos. Saepe exercitationem voluptate sapiente officiis ut provident. Quisquam ipsam beatae sed et quia exercitationem est.', '208.98', NULL, 62, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(112, 10, 'Quia doloremque repellendus', 'quia-doloremque-repellendus-80T08', 'I6C1YEMN', 'Velit facilis dolore ipsum ut dolore numquam ut quibusdam deserunt.', 'Quod tempore sed deleniti culpa maxime sit. Eius provident consequatur necessitatibus et. Velit et quia facilis recusandae perferendis consequuntur modi. Labore quia pariatur voluptatem quis quis reprehenderit quo. Minima qui reprehenderit veniam cumque quam sit soluta. Quas quia quia totam quos.', '250.74', NULL, 98, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(113, 10, 'Impedit atque sit', 'impedit-atque-sit-onT3E', '8IDRYVUB', 'Quis repellat nam delectus mollitia vel expedita laboriosam odio modi tempore qui sit vero.', 'Magni alias ut enim nulla. In ullam quia vel consequuntur dolores omnis. Minima aut quia omnis distinctio.', '146.98', NULL, 64, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(114, 10, 'Tempora provident sed', 'tempora-provident-sed-L6T6Z', 'YSNJVPZY', 'Sit et dolores similique qui velit illo quod.', 'Quos odio nostrum eos sunt hic nisi. Omnis sit qui quibusdam deleniti eligendi laborum. Eaque voluptates ipsam ipsam eos. Eos perferendis et modi sunt deleniti fuga. Nostrum recusandae possimus nobis odio dolorem.', '91.10', NULL, 0, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(115, 10, 'Mollitia ut adipisci', 'mollitia-ut-adipisci-O1GCg', 'MRHH1D3F', 'Eos consequatur laboriosam dolorem ipsam iusto aliquid quo ratione atque culpa eius blanditiis temporibus.', 'Pariatur officia laudantium labore dolor quibusdam. Officiis aliquam quasi assumenda culpa hic velit porro. Ea molestias laboriosam inventore non nihil distinctio optio dolores. Necessitatibus perferendis corrupti repellat sunt explicabo et. Cum corrupti omnis beatae dolor praesentium.', '219.70', NULL, 189, 1, 1, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(116, 10, 'Quisquam est totam', 'quisquam-est-totam-dtnlo', '9SKHO48J', 'Magnam sequi quaerat hic eius velit quos occaecati cum sit dolorem quo minus quos.', 'Id id vel id voluptatum veritatis eos. Qui ex est illo maxime ipsa est. Placeat culpa eius placeat blanditiis adipisci molestias et. Cumque eos vitae porro consequatur enim consequatur.', '11.78', NULL, 17, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(117, 10, 'Et culpa perspiciatis', 'et-culpa-perspiciatis-fJub0', 'M2GYFKVK', 'Ipsa id architecto veniam sed ea consequatur minus exercitationem excepturi optio atque voluptatum.', 'Dolorum ab quaerat quia voluptatem alias perferendis ut nostrum. Maiores rerum tempora maiores repudiandae quia sed aut quia. Nulla deserunt dolorum rem id. Omnis voluptatem modi voluptates maxime est. Vitae aut perferendis nisi ex. Omnis accusamus enim maiores rem sit et et.', '263.59', NULL, 112, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(118, 10, 'Voluptatum praesentium ea', 'voluptatum-praesentium-ea-ZoptF', 'H96FRSKD', 'Ut similique nulla magnam ratione perspiciatis voluptatem pariatur dolorem fugit sunt consequatur illo.', 'Laudantium qui in enim aliquam. Cumque ut odio pariatur perspiciatis non autem ea. Laudantium et porro perspiciatis deleniti necessitatibus magni natus.', '38.01', NULL, 140, 1, 1, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(119, 10, 'Pariatur et sequi', 'pariatur-et-sequi-VLAss', 'MSJSOWCS', 'Minima et et et incidunt laborum perspiciatis quis cupiditate qui in id in culpa porro.', 'Consequuntur aut voluptatem voluptates velit iure magnam minima. Itaque qui laborum doloremque assumenda possimus nulla omnis non. Pariatur vel aut officiis nisi qui aut modi. Qui quia cum ullam consequuntur non ipsum. Possimus nihil voluptas recusandae et neque qui. Eos nam qui a.', '274.82', NULL, 24, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(120, 10, 'Eius praesentium illum', 'eius-praesentium-illum-3xOjb', 'X36FETU2', 'Quas vel voluptas magnam non non sit omnis voluptas ex quia officiis ut est eligendi neque.', 'Tenetur debitis alias quasi ut quam consequatur. Fugiat incidunt magnam ducimus quis rerum placeat id. Et quasi natus minima error. Veritatis fugit itaque quod dolor. Et quia quia odit unde distinctio eos.', '182.24', NULL, 111, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(121, 11, 'Omnis quos aut', 'omnis-quos-aut-5K4NA', 'FDMNYQ2U', 'Consectetur aliquid ad cum laboriosam nesciunt placeat et numquam aut cum quae dolorem.', 'Eos id laudantium labore nemo dignissimos illum. Adipisci ut quidem vero rem error dignissimos. Non itaque et aut ipsa sed adipisci. Qui aut quasi enim nulla et pariatur recusandae. Distinctio sunt unde dolor sit in.', '115.86', NULL, 186, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(122, 11, 'Ut itaque et', 'ut-itaque-et-LLULQ', '5MMW1MGH', 'Quo et sint aliquam dolorem aut amet et cum sequi tempore et molestiae distinctio.', 'Rerum consequatur at temporibus nulla velit. Et a et voluptas et eum voluptas pariatur. Deserunt numquam possimus ducimus inventore. Voluptatem nesciunt doloremque et sint et in.', '215.08', '229.40', 199, 1, 1, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(123, 11, 'Sit rerum nam', 'sit-rerum-nam-CIgt0', 'IMJIZ7GW', 'Consectetur quibusdam tempora eum veniam rerum et magnam.', 'Est sint dolor consequuntur est expedita mollitia ipsum. Odio labore nihil quaerat ut et dolores sunt magnam. Aspernatur atque nulla nihil. Libero earum nisi eligendi culpa ab quo.', '139.25', '174.36', 123, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(124, 11, 'Ipsam sit praesentium', 'ipsam-sit-praesentium-7oQgP', 'IDADWLLU', 'Autem autem sed ipsa id ad aut eaque occaecati ut.', 'Autem ducimus consequatur dolor et. Molestiae qui quia perspiciatis possimus. Ab quis voluptates vel minus quibusdam et et. Quos perspiciatis voluptate ea sed facilis ullam sed. Ratione recusandae porro qui. Dolores harum temporibus debitis officiis aut.', '211.70', NULL, 39, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(125, 11, 'Dolorem ut nam', 'dolorem-ut-nam-RFwFY', 'RMZ5CKOC', 'Aliquid fugit voluptas enim dignissimos illum pariatur sint blanditiis non excepturi illum voluptatem.', 'Cupiditate est et alias in. Molestias sed consequatur qui architecto blanditiis aut non. Possimus reprehenderit eaque non animi molestias. Dolorum voluptas deleniti dignissimos. Est eum sapiente aut sequi praesentium nihil delectus. Sed eum sit qui suscipit.', '146.08', NULL, 130, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(126, 11, 'A id vitae', 'a-id-vitae-CmC08', '0QWVKZ5J', 'Pariatur dolores dolor voluptatum quo vero nobis est ipsa officia aliquam non.', 'Consequuntur qui reiciendis voluptatem excepturi. Quasi optio officia consequatur dignissimos et perferendis. Maxime reprehenderit est asperiores doloremque officia aliquid vel. Cum quis qui numquam reiciendis vel qui porro. Commodi impedit necessitatibus cumque vel rem accusantium velit. Nihil itaque cum ut laudantium et voluptas doloribus.', '138.35', '164.95', 82, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(127, 11, 'Vel ut fugit', 'vel-ut-fugit-QWr6t', 'QOUGSOCD', 'Neque non et voluptatum cupiditate et laborum sed aliquid non quam omnis enim repudiandae harum cum.', 'Est repudiandae ut ut voluptatem aut et. Fugiat iure omnis nihil sit ducimus modi. Et aut minus cum. Non earum et officiis excepturi accusamus non. Dolor ipsum animi et id corrupti ut voluptatibus aut. Veniam qui quaerat ad commodi.', '125.82', '131.78', 135, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(128, 11, 'Recusandae quo repudiandae', 'recusandae-quo-repudiandae-kPJGl', 'B9ASH9KB', 'Itaque quasi molestiae eos aliquam aut numquam et eos dolorem dolores voluptas vel.', 'Aut iste odio sit voluptas. Nihil dolores ex aut dolorem. Quae sunt temporibus et fuga architecto enim. Non corrupti laboriosam officia quae molestiae. Aut quaerat architecto nisi ut rem eum sapiente.', '237.25', NULL, 173, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(129, 11, 'Id repellat cupiditate', 'id-repellat-cupiditate-vjLrx', 'JIFB6FOW', 'Unde temporibus aut in quae ea et ut quam beatae asperiores laudantium optio ad magni non qui.', 'Harum voluptas eos vitae deserunt. Qui ut omnis ut pariatur explicabo deserunt non eos. Aliquam non facere autem delectus. Debitis ut veniam excepturi explicabo blanditiis non. Quis sint non doloremque ullam id illo adipisci.', '23.36', '72.14', 61, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(130, 11, 'Est sit in', 'est-sit-in-0PD3O', '3FORBS5X', 'Quia ab doloremque quo porro officia autem voluptas et laboriosam iusto libero dignissimos et repellat nemo ipsa.', 'Ut perspiciatis accusamus vero suscipit. Debitis eligendi corporis sint. In eum autem eligendi dolore repellendus. Omnis fuga id illo placeat reprehenderit quidem. Quia quis odio numquam ipsum aut consectetur vel.', '222.50', NULL, 184, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(131, 11, 'Sint aut nisi', 'sint-aut-nisi-FNtdR', 'CI1KCZNO', 'Explicabo quis aut eius similique tenetur distinctio qui nam rerum atque fugit.', 'Eum quos id quia voluptate eos illum vero. Temporibus aut et possimus beatae ut eaque vel. Tempora dignissimos repellat voluptatibus alias et consequuntur mollitia. Cumque voluptatibus beatae laborum modi voluptas. Doloremque excepturi maiores consequatur labore adipisci ipsum.', '116.06', '119.87', 32, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(132, 11, 'Tempore officia voluptatum', 'tempore-officia-voluptatum-EwKur', 'XWJN4O3B', 'Reiciendis neque adipisci qui quas deserunt ea molestiae corporis odio doloribus ut magnam non repellat repellendus.', 'Sint repellat fugit possimus sapiente repudiandae quia delectus maiores. Culpa sit aperiam labore. Nemo omnis numquam rerum aperiam et similique quasi. Hic autem aut omnis est perspiciatis repellendus.', '212.78', NULL, 53, 0, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(133, 12, 'Et veniam dignissimos', 'et-veniam-dignissimos-s5zM7', 'GLL4FOPE', 'Qui fugit id iste aut nemo aut enim.', 'Quas mollitia ullam consequuntur voluptatem. Porro corrupti iusto et ut. Nisi consequatur placeat exercitationem suscipit id sapiente.', '163.31', NULL, 38, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(134, 12, 'Rerum voluptas architecto', 'rerum-voluptas-architecto-8q5gY', 'HPBECHZB', 'Sed saepe aliquid doloribus qui dolorem facere et aut delectus exercitationem qui nesciunt.', 'Distinctio est quaerat voluptas deserunt natus quaerat. Magni est et dolorum est est accusantium quis. Animi perspiciatis assumenda tenetur aut. Et error dolor qui aut iusto qui ipsam.', '201.74', NULL, 80, 0, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(135, 12, 'Atque inventore dignissimos', 'atque-inventore-dignissimos-0lLyQ', 'CVY6U6YU', 'Assumenda enim corrupti quisquam ut doloribus ut eaque alias numquam sint quo quo neque eum qui.', 'Magnam doloremque neque molestiae perspiciatis explicabo fugiat nemo. Consequatur odio dolor id id in. Perferendis velit sed vel voluptatem voluptas quis. Unde et aut tenetur et totam.', '31.30', NULL, 175, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(136, 12, 'Et voluptas velit', 'et-voluptas-velit-NuzVu', 'NIH0RW98', 'Pariatur quia autem voluptatem ipsum accusantium sed cumque totam earum facere deserunt vitae velit in sapiente.', 'Tempora aliquid temporibus quia. Et fugit nihil et porro illum est. Sed officiis possimus et quia doloremque veniam tempora sed. Dolore libero corporis ut consequatur modi et ullam molestiae.', '155.36', NULL, 60, 0, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(137, 12, 'Minima adipisci quis', 'minima-adipisci-quis-kxWZL', 'JIRF4FG4', 'In rem aut et et et consequatur dignissimos et amet incidunt quod voluptate omnis fuga.', 'Dolor consequatur iusto officiis et aliquam autem consequuntur. Est voluptates laudantium dicta molestiae sit hic ducimus. Ea fugit maiores sunt hic dolores voluptatem. Magnam aperiam reprehenderit cupiditate aut. Excepturi quia ut quidem eos sed est.', '133.06', NULL, 20, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(138, 12, 'Earum dolorem optio', 'earum-dolorem-optio-fLjTV', 'NHFALUCX', 'Animi rerum sint eum est dicta sint inventore ut corrupti.', 'Dolores blanditiis totam neque. Debitis assumenda et odio est corrupti quod. Sapiente qui blanditiis numquam adipisci possimus cupiditate autem. Magni dicta at quaerat voluptatem.', '55.94', NULL, 28, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(139, 12, 'Laborum quisquam asperiores', 'laborum-quisquam-asperiores-rqSeO', 'IXIROV1P', 'Voluptas inventore deserunt molestias non sint et cumque ut iste commodi.', 'Aut id vel quisquam iste temporibus cumque. Sed dolores asperiores minus dolorum doloribus rerum. Voluptates dolor animi ea ea fugiat. Ratione laudantium quia corrupti vero atque assumenda. Modi sit est ea architecto.', '45.67', NULL, 52, 1, 1, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(140, 12, 'Harum et maxime', 'harum-et-maxime-dxvM4', '0LMEO8ND', 'Aut architecto numquam tempore itaque voluptas quis aut non sunt corrupti ipsa est.', 'Reiciendis iste accusamus ut aut reiciendis accusamus quasi. Ab atque qui animi quia. Ratione quod ut et alias necessitatibus assumenda. Consequatur hic voluptate architecto maiores eum est. Ut aut quos quibusdam.', '25.53', NULL, 110, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(141, 12, 'Autem ea vel', 'autem-ea-vel-8V6hL', '15OSQHRO', 'Recusandae possimus alias ratione ullam eaque voluptatem tempora et facere modi voluptates.', 'Numquam vel alias enim dicta sequi esse. Quia voluptas sint quo eaque quo. Et ut dolor repellendus. Ut consequuntur voluptatem soluta esse atque voluptatibus ut. Temporibus adipisci molestias adipisci enim. Inventore id aspernatur architecto ut dicta.', '49.87', '94.54', 49, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(142, 12, 'Ipsa reprehenderit hic', 'ipsa-reprehenderit-hic-Ehixc', 'MBVNWRFO', 'Aperiam nostrum vero itaque quia accusamus et quia est aliquam voluptate.', 'Aperiam voluptas vel eaque ad consectetur. Officiis est consequatur magni. Et dolores provident labore qui provident molestiae voluptatem. Enim repudiandae ea quod velit.', '97.28', '123.15', 95, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(143, 12, 'Animi error debitis', 'animi-error-debitis-z4fTp', 'MHFCEQP8', 'Doloremque debitis accusamus similique nobis ullam occaecati aperiam qui quis illo incidunt fugit distinctio voluptate.', 'Mollitia sunt vel ut. Voluptas eos id omnis aspernatur. Deserunt ex explicabo eos et voluptate. Placeat fuga omnis eius qui beatae praesentium pariatur dolores. Delectus distinctio quis non quia rerum. Et atque et vel et.', '207.77', NULL, 56, 1, 1, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(144, 12, 'Aut id quas', 'aut-id-quas-DJwl5', 'EVFMN31P', 'Quibusdam velit sed alias qui harum voluptas blanditiis recusandae ipsam deserunt sapiente similique eaque autem.', 'Temporibus natus natus voluptas ut et. Nam tempora sunt aut voluptatem quas adipisci. Laborum maxime dolores odio temporibus animi. Porro est soluta dolor veniam ut omnis. Eum voluptas et et dignissimos suscipit placeat sequi.', '22.86', '58.07', 196, 1, 0, NULL, NULL, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(145, 13, 'Facilis doloribus quia', 'facilis-doloribus-quia-IP1r2', 'MASOPFOO', 'Nobis voluptates officia sed reprehenderit quam cum unde quia nobis unde quia sit et nihil.', 'Accusantium excepturi tenetur dignissimos quas voluptates cum. Nam libero iure sed beatae occaecati consequatur ipsum. Et soluta quia voluptas debitis incidunt corporis vero nostrum. Autem qui omnis dicta architecto sint. Omnis neque dolorem rerum. Neque aperiam libero animi accusamus.', '207.29', NULL, 190, 1, 0, NULL, NULL, '2025-10-23 13:22:35', '2025-10-23 13:22:35'),
(146, 13, 'Sint consequatur quae', 'sint-consequatur-quae-Jkf9i', 'QSQEWG9P', 'Doloremque aut est itaque ab cupiditate in et autem vel praesentium eaque ipsam incidunt molestiae expedita dolorum.', 'Sed tempora necessitatibus quo dolorem optio doloribus veniam. Doloremque sunt et temporibus facilis sunt at suscipit. Error expedita deleniti voluptas est eum.', '246.06', NULL, 157, 1, 0, NULL, NULL, '2025-10-23 13:22:35', '2025-10-23 13:22:35'),
(147, 13, 'Est voluptatibus maiores', 'est-voluptatibus-maiores-YARp0', 'D3OBRVRX', 'Esse eligendi eos unde voluptatum ut porro commodi enim eos laboriosam tempore vel sint.', 'Illo sit id rerum iusto. Natus eligendi provident magni et cupiditate. Sequi eum sequi explicabo suscipit velit labore. Incidunt doloribus eaque sit inventore et.', '270.72', NULL, 23, 1, 0, NULL, NULL, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(148, 13, 'Voluptas quibusdam aperiam', 'voluptas-quibusdam-aperiam-9tjuh', 'BOBNAEHF', 'Dolores ut et ipsa placeat quis illum assumenda aliquam eius eveniet aut.', 'Nostrum delectus quisquam fuga enim voluptatem et. Rerum ratione voluptatem iure ut. Est qui ex et quidem repellendus. Labore quae hic et perspiciatis.', '227.60', NULL, 65, 1, 0, NULL, NULL, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(149, 13, 'Maxime aut deserunt', 'maxime-aut-deserunt-qXgc4', 'C9URRWZM', 'Unde cumque hic qui et delectus qui minima velit ut ea autem nulla aliquid aut ab.', 'Facilis quisquam maiores odio. Sed recusandae id est molestias impedit eum molestias corrupti. Blanditiis et dolorum consequatur doloribus.', '14.72', NULL, 64, 1, 0, NULL, NULL, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(150, 13, 'Quod et quisquam', 'quod-et-quisquam-XreeW', '1GJG9GA5', 'Sint iure quas aut assumenda qui aliquam dolorem.', 'Autem doloribus suscipit ab doloribus. Iure quis facere tempora nobis voluptatem. Temporibus dolorem illo qui optio quam nisi. Omnis sequi vel non accusamus libero sed. Accusamus nemo perferendis commodi aut error.', '54.76', NULL, 114, 1, 0, NULL, NULL, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(151, 13, 'Enim eos dolorum', 'enim-eos-dolorum-7Y4zO', 'A6HYYPPQ', 'Modi qui cupiditate rem vel quia quia incidunt.', 'Nemo sequi exercitationem quos totam. Mollitia pariatur et sed officia eum odio. Qui eum iste sed tempore ullam aspernatur. Eveniet in incidunt odio dicta. Libero repellat rerum cum et facere officia libero.', '72.16', NULL, 138, 1, 0, NULL, NULL, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(152, 13, 'Omnis consequatur omnis', 'omnis-consequatur-omnis-4Zc4N', 'QJFDVJMP', 'Omnis eius iure ut et sit consequatur et pariatur quo fuga sit vel tenetur voluptatem ab id.', 'Eos enim aut consequuntur modi. Tempore nihil quisquam explicabo voluptatem in quos cupiditate earum. Iusto corrupti consequatur commodi minus. Adipisci in voluptas accusantium dolorum corporis. Rem sed ea vel sed voluptas ad ipsam.', '295.52', NULL, 123, 1, 0, NULL, NULL, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(153, 13, 'Quas nihil illum', 'quas-nihil-illum-hNLzH', '4JIOELTU', 'Unde accusamus in dicta deserunt fuga eos ut dolore.', 'Id possimus est laborum facilis nobis magnam illo. Aut aperiam voluptas in voluptates occaecati voluptatibus qui occaecati. Officiis beatae occaecati quod voluptates earum sunt. Eveniet atque et et. Minima quos aut ad vel qui aut nesciunt. Corporis nesciunt eos harum in rerum earum id.', '128.46', '160.95', 75, 1, 0, NULL, NULL, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(154, 13, 'Harum sed aliquam', 'harum-sed-aliquam-XPBpW', 'RK2SKAJ6', 'Perspiciatis vero optio et quia perferendis praesentium accusamus illo qui voluptatum illo.', 'Ipsa eaque pariatur iusto incidunt dolorum. Aliquam blanditiis consequatur blanditiis delectus minima impedit. Mollitia et repudiandae voluptas aut. Commodi omnis facilis aut at est. Commodi laborum dolorum deleniti consequatur hic saepe.', '247.03', '273.06', 21, 1, 0, NULL, NULL, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(155, 13, 'Et omnis corporis', 'et-omnis-corporis-wtbIw', 'ZL0R2VR7', 'Quis voluptate quia quia aut laudantium modi modi repellendus vero iure enim veritatis qui quod sunt.', 'Magni aliquam iste reiciendis sed. Eum suscipit est maiores enim veniam iste reiciendis et. Voluptatem corrupti accusantium animi. Ut voluptatibus ab odit incidunt. Sit aperiam dolore minima quo qui atque. Vel consequatur perferendis ut ullam quibusdam praesentium.', '216.61', NULL, 145, 1, 0, NULL, NULL, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(156, 13, 'Aspernatur id et', 'aspernatur-id-et-U2lkK', '4CYD1JON', 'Sit qui quasi reiciendis consequatur consequatur voluptas dolor consequatur commodi explicabo deleniti voluptas odit eos.', 'Eos magnam nam dolor distinctio. Similique dolor deleniti aut optio sunt est. Illo rem aut sint voluptatem accusamus. Ea dolore aut eos illum quia eligendi temporibus error.', '205.26', NULL, 160, 1, 0, NULL, NULL, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(157, 14, 'Ad ut velit', 'ad-ut-velit-BfCCB', 'JVQ0BPPP', 'Rem hic tempore magnam earum a voluptatem vero magnam provident est delectus aut ea et fuga.', 'Ipsum animi earum quia sequi fuga. Nobis quam quos dolorum aut. Laboriosam sunt aliquam quis sint perspiciatis aut omnis. Rerum voluptatem voluptas voluptatem est reprehenderit quaerat. Eaque repudiandae enim optio quia sunt fuga.', '40.20', '61.15', 46, 1, 0, NULL, NULL, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(158, 14, 'Omnis qui mollitia', 'omnis-qui-mollitia-Ks0Zj', 'SWSI9H9A', 'Nisi necessitatibus qui voluptatibus ad dolores perspiciatis delectus est delectus odio ut et et aut.', 'Ducimus culpa aut modi sequi. Qui quibusdam excepturi laborum tempora. Explicabo eius dignissimos vitae. Culpa omnis ut molestiae excepturi amet dolorem magni veritatis. Velit dolore culpa fugit ipsa.', '100.10', NULL, 0, 1, 1, NULL, NULL, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(159, 14, 'Facere nisi repellat', 'facere-nisi-repellat-oyHLx', 'SXQSIENY', 'Velit et ut omnis voluptas architecto quidem corporis nostrum.', 'Quo consequuntur illo blanditiis aperiam vero. Voluptatem dicta facere molestiae mollitia maiores. Veritatis praesentium voluptate nihil iusto. Et sit sit nesciunt beatae minus qui ut. Est architecto amet ut. Quia sit provident sapiente nesciunt deleniti reiciendis.', '285.30', NULL, 41, 1, 1, NULL, NULL, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(160, 14, 'Cumque non omnis', 'cumque-non-omnis-JHjUi', 'R1WLH5C5', 'Porro quidem dolore et molestias accusantium esse exercitationem vel ad ratione enim et voluptatem ut accusantium est.', 'Repellendus neque repudiandae vel. Aliquid tempore omnis nisi quia perspiciatis. Aut dolorum voluptas ut nisi quisquam aut consequatur. Reiciendis consectetur corrupti blanditiis architecto dolores.', '217.14', '255.23', 19, 1, 0, NULL, NULL, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(161, 14, 'Veniam perferendis numquam', 'veniam-perferendis-numquam-xj2eB', 'KQZ4FH1Q', 'Aut esse maiores dolores non dicta ipsa corrupti nostrum possimus maxime alias.', 'Et quidem iusto adipisci doloremque et. Autem eligendi error excepturi facilis in quia. Adipisci sed ab distinctio exercitationem. Labore laborum et repudiandae et perferendis. Veritatis voluptatum culpa sit nobis quo. Adipisci optio aut et aut consectetur in sint.', '234.22', '245.47', 69, 1, 0, NULL, NULL, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(162, 14, 'Sapiente omnis explicabo', 'sapiente-omnis-explicabo-NCeTV', 'EJPWZ1AN', 'Blanditiis vel et tempore asperiores iusto dicta quis nihil libero eius corrupti.', 'Ut ratione eius id aperiam et cumque iste. Temporibus ut a minima dolorum doloremque. Tenetur voluptas qui impedit perferendis quis voluptas libero. Fugit porro autem mollitia dolorum quam praesentium officiis. Et quia et est rerum.', '94.62', NULL, 44, 1, 0, NULL, NULL, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(163, 14, 'Laudantium veniam atque', 'laudantium-veniam-atque-Ab0H6', 'TIXL7SG8', 'Animi autem illo nemo et exercitationem nostrum aut neque.', 'Itaque earum ut qui libero. Qui deleniti repellendus asperiores quis a dolores aliquid. Omnis aliquid illum pariatur.', '274.15', '298.42', 58, 1, 0, NULL, NULL, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(164, 14, 'Reiciendis non et', 'reiciendis-non-et-A0gHB', 'YMRCEN7P', 'Animi voluptates alias pariatur illum ex ut corrupti recusandae omnis odit vero.', 'Sunt omnis perspiciatis veniam. Quos ut eum et dicta vitae itaque et. Sed asperiores laboriosam est rerum dicta laborum. In quia architecto est et ut assumenda dolor. Exercitationem dolorum eos dolores distinctio.', '168.99', NULL, 64, 1, 0, NULL, NULL, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(165, 14, 'Rerum et nisi', 'rerum-et-nisi-FKYiM', 'S5ZTSETZ', 'Ut consequatur voluptatem accusamus id facilis omnis qui reiciendis cumque quibusdam vel autem nesciunt voluptatem.', 'Reiciendis quae consectetur labore nemo et. Voluptatibus a doloribus cupiditate cum provident. Nostrum sit placeat est deserunt dolor qui ut ipsa. Porro sint veritatis laboriosam alias similique.', '128.24', '150.29', 82, 0, 1, NULL, NULL, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(166, 14, 'Unde sit ipsum', 'unde-sit-ipsum-Eitbf', '6H0ZUUX6', 'Dolorum tempora ducimus aperiam pariatur deleniti est praesentium ut distinctio sequi.', 'Numquam voluptas ut dignissimos qui. Laborum eaque doloribus dignissimos voluptatem corporis voluptatem saepe. Eaque architecto veritatis doloribus ipsam facilis. Molestiae optio inventore voluptates fuga quam. Aut aut aut est illo maxime voluptatem asperiores.', '178.70', NULL, 151, 1, 0, NULL, NULL, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(167, 14, 'Ducimus corrupti aut', 'ducimus-corrupti-aut-9N4RS', 'WI4OQRTF', 'Delectus cum dolorum quis adipisci reiciendis velit neque ut qui ex ab perspiciatis sit ut blanditiis.', 'Sit in deserunt fugiat quia doloribus et qui. Libero perspiciatis et assumenda tenetur. Sint est tenetur voluptates facilis. Aut atque quas ut officia vero cum. Eum nulla necessitatibus quo temporibus.', '280.70', NULL, 63, 0, 0, NULL, NULL, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(168, 14, 'Nesciunt vel beatae', 'nesciunt-vel-beatae-rEVho', '0ZHPTOS7', 'Quam aspernatur hic tempora illum sunt voluptate incidunt enim aut et.', 'Vitae ipsa ipsum quae quod fugit. Harum harum dolorum ipsum dolorem. Explicabo accusantium qui quisquam qui illum itaque. Eum velit non aspernatur inventore ut occaecati. Facere dolores deleniti et quia delectus.', '6.13', NULL, 120, 1, 0, NULL, NULL, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(169, 15, 'Laboriosam doloribus magnam', 'laboriosam-doloribus-magnam-oYHeG', 'FBZNF0VE', 'Cumque architecto magni tempora velit labore delectus sunt velit.', 'Officiis sunt eos nam nam modi doloribus repellat vel. Nam labore quo quas velit distinctio nemo. Necessitatibus error nihil amet et odio.', '194.20', NULL, 29, 1, 1, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(170, 15, 'Et molestiae sint', 'et-molestiae-sint-c6WFM', '1SZT4BLO', 'Modi reprehenderit consequatur optio fugiat ut vitae consequatur sit nemo aut enim.', 'Qui vel blanditiis omnis voluptatem quia. Occaecati rerum occaecati adipisci consequatur sed est culpa. Eum et eum quia ipsam. Omnis rerum totam alias dolor.', '145.37', NULL, 135, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(171, 15, 'Qui illo eum', 'qui-illo-eum-6EWNf', 'ZAUW5DSX', 'Velit et est molestias exercitationem quis ea odit et odit mollitia et iste provident rerum provident.', 'Beatae quis aut cumque dolor qui et. Sequi ducimus voluptatem cupiditate unde est occaecati iusto voluptates. Porro earum est dignissimos est est vel. Qui sit perferendis earum. Recusandae labore perspiciatis earum maiores et impedit. Et quae et quia eos illo.', '212.07', NULL, 83, 1, 1, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(172, 15, 'Fugiat alias corporis', 'fugiat-alias-corporis-pXv4p', '1ENIKBKH', 'In numquam rerum optio molestiae in voluptas maiores voluptatum est quo illo quia occaecati consequatur.', 'Ut a sint voluptatem voluptate. Excepturi quidem molestiae velit et. Nobis eos unde dolorem odio. Harum animi qui delectus quidem. Et molestias fugit et.', '11.80', NULL, 193, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(173, 15, 'Sit aut minus', 'sit-aut-minus-8Fcg8', 'E1RQ50VF', 'Sit deleniti quam repellat alias velit illum quis beatae.', 'Quis similique nobis rerum aut commodi qui. Culpa a nulla dolor aliquam at id repellendus soluta. Molestias ut ea minima labore perspiciatis. Tempore voluptatem ratione quis sunt.', '117.21', NULL, 192, 1, 1, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(174, 15, 'Consectetur esse maiores', 'consectetur-esse-maiores-kNRI9', '28B9B8IR', 'Non et dignissimos rerum non eum magni voluptatem consequatur.', 'Dolorem modi repellendus est eum. Nihil neque cupiditate accusamus quisquam aut asperiores. Id aut est sunt inventore recusandae rem nisi eligendi. Voluptates perspiciatis eos maiores beatae.', '229.91', NULL, 180, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(175, 15, 'Ipsa molestias consequatur', 'ipsa-molestias-consequatur-aEc1b', '3DIZS8RY', 'Rerum voluptas facere modi amet nobis veritatis ea praesentium sunt non rerum ut.', 'Est sint ut aut accusantium. Asperiores officia sit fugit non aut. Aut quod illum nostrum consectetur temporibus veniam sint. Quia doloribus atque est laudantium aut. Corrupti culpa ut eos. Nobis ullam magni molestias est.', '206.70', '209.71', 101, 1, 1, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(176, 15, 'Distinctio perspiciatis est', 'distinctio-perspiciatis-est-OB4R4', 'V0IAUOCR', 'Perspiciatis aliquam quis atque id perspiciatis est rem eius vel.', 'Consequatur labore dolorem quo quam nobis ea. Amet consectetur quia quos eum pariatur non provident. Occaecati est culpa sunt. Repudiandae aperiam officia necessitatibus omnis laudantium excepturi assumenda.', '249.46', NULL, 73, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(177, 15, 'Doloribus rerum ut', 'doloribus-rerum-ut-AY5Yn', 'QQGFSZAB', 'Assumenda rerum harum beatae neque tempore vero consequuntur ratione voluptatem doloribus quod et aut odio delectus eos.', 'Quos voluptatem modi ad ex tempore corporis tenetur. Magni est rerum et at consequatur rem. Quia corrupti animi rerum aut. Aperiam vero commodi asperiores sed. Est autem laboriosam esse suscipit itaque non. Consequuntur cum alias nisi maxime minus earum aut.', '224.51', NULL, 33, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(178, 15, 'Autem nobis id', 'autem-nobis-id-6HKBx', 'LCM3GKJW', 'Assumenda excepturi reiciendis vel nobis eos vel non laboriosam doloremque non aut sit enim voluptas soluta ad.', 'Quaerat a quia aut et error. Et aut dolorum fugiat ex non. Aut non animi inventore unde non modi quas quam. Voluptas et culpa voluptatem a qui delectus tenetur. Autem fuga enim qui sint voluptas.', '28.16', NULL, 150, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(179, 15, 'Et voluptas doloribus', 'et-voluptas-doloribus-ZQ0Tg', 'DJPW4A2K', 'Ducimus voluptate tenetur fugiat mollitia ipsum autem delectus quidem.', 'Omnis excepturi eum vel nostrum. Quasi voluptatem non necessitatibus animi eaque a. Omnis eum dolor aperiam nisi. Rerum est qui molestiae quos eum aut. Repellat corporis repudiandae magnam fuga dicta sed quidem.', '15.64', '21.73', 183, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(180, 15, 'Iure nihil ut', 'iure-nihil-ut-m4SrX', '3MUCLG7I', 'Quod voluptatem quaerat quia a totam et nulla ut modi et praesentium aut.', 'Incidunt id molestiae nihil dolores. Nulla et et mollitia delectus repellat rerum et. Incidunt nihil non earum cupiditate accusamus sunt eos. Iusto sint eos iure debitis et.', '155.42', '164.26', 75, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(181, 16, 'Laborum nisi est', 'laborum-nisi-est-9EMNL', 'NI3DNJGK', 'Aut sapiente praesentium reiciendis laudantium animi rerum adipisci et natus quod et nihil quod earum.', 'Ullam iusto recusandae et corporis non cumque. Vero sunt doloremque ut quae beatae. Voluptatem ea praesentium cum iusto esse aut et. Autem enim quos tempore placeat tempore velit.', '132.80', NULL, 130, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(182, 16, 'Perferendis tempore minus', 'perferendis-tempore-minus-p0BAO', 'QHLBOOMO', 'Veritatis ullam doloribus facilis dolor numquam minima impedit ratione ipsum magni animi autem consequatur.', 'A voluptatum quia nulla optio. Et porro quis nihil est magni in. Porro iusto dolorum a quibusdam et sunt. Eum eaque omnis aperiam et eos beatae voluptas aut. Minus ut et modi impedit hic fugiat cum autem.', '49.31', NULL, 195, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(183, 16, 'Unde labore voluptatibus', 'unde-labore-voluptatibus-Wex1K', 'LODKRFBR', 'Et sit est ut maiores ea nesciunt aut impedit velit necessitatibus reiciendis iste consectetur.', 'Consectetur perferendis et explicabo consequuntur. A voluptas suscipit ut et ratione rerum non. Id ipsam tempora aliquam dolorum.', '32.30', NULL, 185, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(184, 16, 'Et voluptas et', 'et-voluptas-et-jqoKm', 'QTCUQE2E', 'Sed et est sit dolorem totam dolor beatae ab et nisi.', 'Corrupti aliquid qui earum eos non ratione. Sunt magni earum est commodi architecto nemo rerum. Sed rem rem repudiandae excepturi officiis.', '18.28', '59.49', 115, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(185, 16, 'Aliquid et aspernatur', 'aliquid-et-aspernatur-ixlH8', 'SX4N2FRY', 'Et magni unde delectus id voluptatem aut rem.', 'Explicabo voluptas sint illum blanditiis voluptatem voluptatem dolorum. Aperiam rerum aliquam hic laudantium. Fuga voluptatem fugit ea sunt veniam esse sapiente. Distinctio consequatur autem fuga ut incidunt et.', '235.99', NULL, 61, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(186, 16, 'Sunt occaecati in', 'sunt-occaecati-in-0gHoo', 'Y9FSOQDP', 'Et natus quia eum magnam quia quo amet.', 'Mollitia debitis et ullam vel. Vero maiores voluptatem iste quia cumque voluptatum. Exercitationem illum nam et qui soluta ex. Error assumenda non voluptatem nam in ipsa eum.', '153.94', '193.77', 49, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(187, 16, 'Aspernatur minima sed', 'aspernatur-minima-sed-7JFSI', 'M2HFTK05', 'Consequatur mollitia repellat molestias necessitatibus est repudiandae odit labore suscipit excepturi ullam.', 'Voluptate sequi aut quod neque dolor qui. Rem esse ex hic quidem quod blanditiis et. Sit cupiditate hic nulla assumenda excepturi. Voluptatem voluptas magnam labore veritatis.', '110.80', '149.98', 3, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(188, 16, 'Ea culpa laboriosam', 'ea-culpa-laboriosam-pt79C', '1CYTXIQG', 'Magni quasi omnis cum tempora aliquam consequatur sint eius ullam et eius nulla id.', 'At vel eaque quisquam similique. Voluptas minus id placeat qui soluta quidem. Reiciendis quo qui eos cumque ducimus voluptas. Odit saepe veniam quae qui ipsa at qui.', '75.04', '117.11', 93, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(189, 16, 'Fuga fuga impedit', 'fuga-fuga-impedit-JMeiI', 'SYELBIZE', 'Optio itaque a ipsum consequuntur esse rerum iste ipsam dolorem.', 'Ad tenetur voluptatem iusto facere itaque atque. Distinctio fuga dolorum ut est. Et laboriosam est cum qui. Repudiandae aspernatur dolores adipisci et. Ea velit et dolorum est voluptas quidem id. Eaque quia ab et ut.', '231.34', NULL, 109, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(190, 16, 'Et distinctio error', 'et-distinctio-error-Rb007', 'U3WIAJAY', 'Animi quia voluptates cum illum dolores fugiat excepturi deleniti.', 'Ad corporis et quo odit eum quisquam. Quisquam minima eligendi illo. Eveniet saepe animi atque dolores enim dolor.', '194.31', NULL, 26, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(191, 16, 'Voluptates magni repudiandae', 'voluptates-magni-repudiandae-eeHSt', 'AD6U54RQ', 'Suscipit ut id officia eos sunt ipsam sint tenetur ut.', 'Error illum aut reprehenderit repellat id voluptas. Consequuntur distinctio ab qui velit id minima cumque. Qui consequatur veniam minima ut voluptatum eaque veniam. Molestias pariatur quo voluptatem sed qui repellat.', '116.82', NULL, 200, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(192, 16, 'Omnis et et', 'omnis-et-et-oHvDS', 'TBSFW2SM', 'Dicta magni et nemo accusamus delectus commodi qui possimus sed dolorem ut et.', 'Aut harum animi magnam tenetur excepturi itaque possimus. Eum ea iure ipsum fuga corrupti et. Perferendis dolor autem ullam voluptates modi rerum placeat. Cupiditate voluptatem in fugiat quia.', '217.23', NULL, 74, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(193, 17, 'Sit tenetur fugiat', 'sit-tenetur-fugiat-EaTxV', 'YD6GVAUI', 'Consequuntur dolore vero autem molestias placeat nostrum maxime distinctio dolore sequi.', 'Qui et natus corporis quia iusto quis corporis. Praesentium quia quibusdam reiciendis facilis explicabo. Et reiciendis incidunt atque explicabo molestiae est. Est provident repellendus occaecati culpa asperiores hic provident. Ut et ea molestiae rerum.', '156.21', NULL, 13, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(194, 17, 'Qui inventore quis', 'qui-inventore-quis-Vkb01', 'AFRUW3G2', 'Dolorem sunt et itaque voluptatibus ea voluptatem sed qui in cum dolores quia magnam aperiam numquam.', 'Velit aliquam ut blanditiis praesentium eius consectetur sit incidunt. Ea veniam velit vero ut autem aliquid. Beatae nobis voluptas veritatis excepturi. Dolorem et magnam quis. Fugit tenetur fugiat nesciunt et.', '223.64', NULL, 53, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(195, 17, 'Sit aut saepe', 'sit-aut-saepe-pcooj', 'AMC0FJMM', 'Molestiae natus alias quo hic id nobis non et pariatur aliquam.', 'Assumenda consequatur et vitae cupiditate. Aut libero totam adipisci accusamus vero quidem itaque. Ab non sint illum repellendus et ut. Sit sint porro sapiente ut soluta nam voluptates. Impedit non consequatur qui totam quidem molestiae dolor. Ut voluptatem molestiae modi eum quia.', '242.69', NULL, 166, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(196, 17, 'Et porro animi', 'et-porro-animi-K5Jd6', 'YZOJHBLM', 'Temporibus qui velit suscipit repellendus consequatur dignissimos quae odio iste placeat et.', 'Tenetur odit atque enim officiis eaque dicta. Omnis illum alias qui consequatur rerum aut. Exercitationem temporibus vel molestiae adipisci.', '130.43', NULL, 35, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(197, 17, 'Commodi est dignissimos', 'commodi-est-dignissimos-1nCcv', 'EORWNRZW', 'Voluptatem pariatur assumenda qui illum fugit facere et.', 'Et accusantium quia ex aliquid laudantium corrupti. Optio similique debitis quia aut quos natus. Voluptas nobis iure atque perferendis consequatur alias maxime qui.', '15.95', NULL, 76, 1, 1, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(198, 17, 'Minima quidem praesentium', 'minima-quidem-praesentium-Mo73g', 'HGGHQPMY', 'Quaerat aut officia modi sunt ullam nulla vitae rerum voluptatibus illo ad.', 'Laboriosam quasi corrupti reprehenderit. Quo amet ut quam id. Iste inventore aut culpa blanditiis aut nulla laborum. Illum adipisci veritatis maxime et.', '282.59', NULL, 146, 0, 1, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(199, 17, 'Asperiores rerum perferendis', 'asperiores-rerum-perferendis-ytrb5', '0XFMTXYA', 'Aliquid aut earum et ut iure ipsum facilis dolorum provident quis ratione eligendi aut placeat.', 'Commodi ullam sed vel impedit. Id est occaecati vero est. Neque rem omnis optio explicabo. Dolore ab cupiditate ducimus quia assumenda.', '132.35', NULL, 119, 1, 0, NULL, NULL, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(200, 5, 'Expedita corporis id', 'expedita-corporis-id-paTUw', 'LJWZCT1B', 'Neque est non officiis optio iure corporis iste dolor ab ut.', 'Magnam ut quia odio corporis eos. Sed iure quis dolorem nihil quae quia voluptatem. Rerum quidem quo voluptatem enim. Culpa omnis voluptatem impedit aut.', '56.71', NULL, 35, 1, 0, NULL, NULL, '2025-10-23 13:22:38', '2025-10-23 13:41:50'),
(201, 17, 'Odio consectetur eos', 'odio-consectetur-eos-D2YJ4', 'KQSYB60N', 'Rerum sint dignissimos totam error accusantium dolorem molestiae vero suscipit modi dolorem aut officiis ipsam.', 'In dolore et eos sapiente velit aut aut doloribus. Ea veritatis voluptas quia provident aut et molestiae. Itaque eius inventore natus nostrum nisi at. Voluptate perferendis mollitia et quaerat mollitia. Dolores dolores occaecati et. Nihil hic omnis suscipit est repudiandae illum aliquid non.', '209.91', NULL, 72, 1, 0, NULL, NULL, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(202, 17, 'Debitis et et', 'debitis-et-et-LUVxo', 'WSYTAZPA', 'Aut ea illo autem quibusdam autem debitis minus et et voluptatum asperiores veritatis eius.', 'Praesentium ut corporis maiores est pariatur. Aut assumenda laboriosam ducimus est. Et cum iste omnis aperiam. Sint minima alias fugiat qui ut rerum. Aperiam hic est recusandae sapiente quos ad dolore ullam. Et corporis hic sed minima temporibus alias animi.', '137.03', NULL, 91, 1, 0, NULL, NULL, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(203, 17, 'Id error adipisci', 'id-error-adipisci-h213G', 'BOJBCXI0', 'Fuga repellendus assumenda amet adipisci ut eum sunt dolorem est qui.', 'A et eius quia ea. Modi aspernatur est quis soluta et facilis iste. Id perspiciatis itaque velit harum deserunt dolor facere.', '215.97', NULL, 109, 0, 0, NULL, NULL, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(204, 17, 'Ullam molestiae dolor', 'ullam-molestiae-dolor-wfbn5', '34EWZSO7', 'Et totam omnis sed qui id sint aliquam corrupti.', 'Possimus quibusdam qui accusantium vel autem. Quo rerum magni beatae nihil est. Illum voluptas aut sed in nostrum eos ratione.', '69.32', NULL, 21, 0, 0, NULL, NULL, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(205, 18, 'Voluptatum rem qui', 'voluptatum-rem-qui-cbcgE', 'ZFN3P3QI', 'Qui quos placeat voluptatem id doloribus quidem sunt a.', 'Recusandae hic qui tempora est. Molestiae dolor vero aut mollitia perspiciatis tenetur. Reprehenderit soluta labore sit voluptatem. Possimus ipsa doloremque ut cupiditate quia. Ex aut sunt fugit ipsam.', '112.22', NULL, 35, 1, 0, NULL, NULL, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(206, 18, 'Deserunt ex eos', 'deserunt-ex-eos-FEcxo', '4GT4ER1H', 'Ut dolor minus veritatis nam optio sequi nobis a aut repudiandae eligendi doloremque quo.', 'Molestiae quasi dicta id quod delectus. Repudiandae sequi aut nulla consequuntur dolorem in. Nulla porro nam neque sit. Excepturi necessitatibus cum eos iste et.', '104.46', '127.36', 103, 1, 0, NULL, NULL, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(207, 18, 'Quis nihil est', 'quis-nihil-est-KD0Dh', '5BPTNSWB', 'Voluptas et quo aut ut repudiandae qui animi sit dolor autem porro praesentium a eaque.', 'Deleniti ex ducimus voluptatum eligendi deleniti et ipsam. Et accusantium veniam omnis sint. Sit autem accusamus mollitia vel. Dolor est nulla delectus sed. Voluptatibus repellendus officia dolore impedit consequatur.', '150.81', NULL, 9, 0, 0, NULL, NULL, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(208, 18, 'At unde est', 'at-unde-est-pmECu', 'XQDPIL3M', 'Totam impedit qui mollitia rerum provident laborum ullam quia soluta porro dignissimos vel omnis nam.', 'Quo veritatis neque et aut. Impedit rem occaecati unde dolore laborum vero minus. Ea sint officiis et. Minima at rem nihil necessitatibus.', '192.43', NULL, 66, 1, 0, NULL, NULL, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(209, 18, 'Necessitatibus deleniti debitis', 'necessitatibus-deleniti-debitis-mUWlo', '4NKXKEAU', 'Enim eaque quis sunt omnis illo id voluptatibus dolor dolore iste et consequuntur.', 'Eos vel excepturi non non est. Inventore velit vero aliquam quo culpa corporis. A qui accusantium blanditiis nam vel.', '96.25', NULL, 30, 1, 0, NULL, NULL, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(210, 18, 'Laborum autem est', 'laborum-autem-est-FfJ0s', 'PDIZPLKL', 'Molestias quo repellat sed qui accusamus aut eum aut fugiat.', 'Ad inventore nulla sed qui consequatur libero. Quas corrupti sunt nam similique deleniti id commodi. Qui consequatur quis saepe amet. Voluptas magni deleniti ducimus.', '152.42', NULL, 50, 1, 0, NULL, NULL, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(211, 18, 'Quis autem et', 'quis-autem-et-VKpKH', 'TLD81A8T', 'Velit aut molestiae eius sunt nihil consectetur officiis doloribus dignissimos.', 'Magnam odio aliquam non et recusandae aliquid. Sint cum maiores itaque at sint consectetur dolor officiis. Ipsum laudantium rerum aut voluptatum minus odio. Facere incidunt ab odit est quis eum voluptatem.', '22.38', '33.90', 164, 1, 1, NULL, NULL, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(212, 18, 'Dicta qui quos', 'dicta-qui-quos-WBZNl', 'QA1HJQKR', 'Voluptatem aut eaque sunt delectus aut voluptatibus itaque et.', 'Libero maiores eos ut. Ut est qui quibusdam harum. Qui quaerat natus itaque incidunt animi aut. Officiis modi nemo incidunt sed assumenda esse est. Laboriosam culpa unde sapiente accusamus ea et autem. Fugiat autem et dolor blanditiis alias laborum mollitia.', '292.81', NULL, 50, 1, 0, NULL, NULL, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(213, 18, 'Magni rem eum', 'magni-rem-eum-PsQiH', 'BVOKS8DG', 'Recusandae error aut qui voluptates suscipit natus qui minima aliquam repellat.', 'Laborum fugit excepturi aperiam sint. Optio id impedit ea sint. Totam ea alias earum exercitationem. Harum quasi debitis minus a. Ullam quia vel necessitatibus quos officia expedita. Et blanditiis illo assumenda dolor quam et consequuntur.', '169.70', NULL, 131, 1, 0, NULL, NULL, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(214, 18, 'Cupiditate expedita ipsum', 'cupiditate-expedita-ipsum-We1XU', 'DNGYYNZD', 'Maiores explicabo non eaque temporibus voluptas facilis eos tenetur molestiae.', 'Molestiae architecto aut corporis consequatur occaecati qui et. Non vitae optio autem. Rerum sunt possimus alias dignissimos deleniti enim amet dolor. Rerum fuga est tempore maxime non.', '276.21', '300.27', 62, 1, 0, NULL, NULL, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(215, 18, 'Ad amet voluptate', 'ad-amet-voluptate-k5IzZ', 'ES9ZH4SF', 'Omnis aut sit corporis quia vitae dolorem dolorem id ut omnis quia dolores debitis nihil.', 'Nostrum exercitationem quasi dolore perferendis sint quam nam. Animi labore inventore harum soluta a nostrum est. Et ullam sed quia ut vero in cum. Error libero rerum odio placeat ipsa.', '24.65', NULL, 133, 1, 0, NULL, NULL, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(216, 18, 'Rerum eligendi consequatur', 'rerum-eligendi-consequatur-3IOLs', '2O20CBYN', 'Perspiciatis ducimus totam eligendi dignissimos dolore laborum ut.', 'Aspernatur quas dignissimos nihil accusantium corrupti non. Provident natus natus qui sint aperiam excepturi repudiandae. Nobis esse quod quidem alias commodi voluptatem. Eos repellendus totam delectus amet. Ipsa rem qui dolores perferendis architecto autem voluptatem.', '149.11', NULL, 87, 1, 0, NULL, NULL, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(217, 19, 'Est velit ullam', 'est-velit-ullam-KZQzI', 'ZEI8CYTE', 'Laudantium corporis velit ea quo enim quaerat iure voluptate qui expedita.', 'In libero necessitatibus ut mollitia. Nihil et et illo neque ad. Autem sed in expedita aliquam ut sed enim. Non nemo molestiae reprehenderit minus et placeat. Expedita perspiciatis ad qui voluptatem harum quam.', '171.64', NULL, 132, 1, 0, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55');
INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `sku`, `short_description`, `description`, `price`, `compare_at_price`, `stock`, `is_active`, `is_featured`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(218, 19, 'Consequatur quis provident', 'consequatur-quis-provident-SReVa', 'Q9GXFCO4', 'Cupiditate rerum asperiores labore occaecati libero excepturi magni magni sit facilis.', 'Doloribus illum quis porro ipsa dolores in et. Iure a et rem aliquam. Nisi necessitatibus ducimus voluptatem accusamus autem quis et ut. Omnis fugiat dolores voluptatem aliquam.', '268.49', NULL, 56, 1, 0, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(219, 19, 'Ducimus est provident', 'ducimus-est-provident-u9wsS', '8SIEFT1R', 'Voluptas porro possimus porro laborum iste voluptatem velit at.', 'Eligendi et eligendi sunt illo iure blanditiis aut. Facere esse dolorem iusto consectetur. Porro soluta qui officia deserunt non. Repellendus assumenda beatae consequatur.', '48.08', NULL, 85, 1, 0, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(220, 19, 'Amet ut doloremque', 'amet-ut-doloremque-Jeq2S', 'PJ0INEM4', 'Ut corrupti reprehenderit facilis est quis sed voluptatem et quia perferendis libero numquam molestias ut est.', 'Quo ipsa officiis cupiditate quod illo consequuntur. Maiores voluptas cumque eos possimus. Sed eum nobis qui minima.', '217.63', '259.01', 56, 1, 0, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(221, 19, 'Laboriosam ullam est', 'laboriosam-ullam-est-kM8T0', 'FO7VHCD6', 'Qui ea dolor minima quia doloremque a cupiditate dolorum culpa.', 'Ex sed labore voluptatibus. Dolorem perspiciatis maiores esse quia omnis dolore porro tempore. Reprehenderit omnis possimus accusantium ut architecto omnis libero qui. Accusamus in a possimus sapiente doloribus.', '113.31', NULL, 155, 1, 0, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(222, 19, 'Eligendi error qui', 'eligendi-error-qui-WWUzN', 'M4LZN9KN', 'Autem et dolorem nulla aliquid nostrum rem aut fuga cum minima tempore non qui cupiditate repudiandae.', 'Unde aut accusamus qui esse soluta quibusdam ea. Est ad ullam consequatur optio magnam. Ut ea eveniet sit facilis quam animi sequi ad. Laudantium alias est et eaque quod deleniti vitae tempore. Sed assumenda magni nostrum non.', '31.21', NULL, 33, 1, 0, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(223, 19, 'Non at facere', 'non-at-facere-IWe3H', 'Y5KQPUV1', 'Repellendus eveniet molestiae non exercitationem aperiam iusto harum dignissimos impedit delectus.', 'Unde eum deleniti eos. Dolorem nisi architecto beatae voluptatibus. Inventore unde consequatur occaecati. Ipsa aliquid doloribus qui neque quia dolores magni. Quia debitis provident est voluptates ipsa voluptatem.', '208.41', NULL, 11, 1, 0, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(224, 19, 'Molestiae adipisci quod', 'molestiae-adipisci-quod-2dgfv', 'QZVJB5R5', 'Ut adipisci reprehenderit fuga ut voluptatem quasi minus repudiandae aut totam totam.', 'Aut et aut natus cumque dolorem harum. Velit vel porro deserunt sapiente consequatur. Molestiae officia consequatur voluptas nulla.', '215.38', '241.48', 64, 1, 0, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(225, 19, 'Accusamus laboriosam sapiente', 'accusamus-laboriosam-sapiente-UjM3J', 'UZF7TAGJ', 'Facere dolores totam ex ipsam assumenda corporis in.', 'Labore consequatur ea ducimus dolor sed. Rem ut molestias sed eaque et nam atque est. Reprehenderit sit deleniti dignissimos at quidem rerum. Perferendis a mollitia similique ad harum. Aut praesentium soluta nemo non.', '204.75', '242.83', 142, 1, 0, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(226, 19, 'Odit tempore facilis', 'odit-tempore-facilis-lA8VH', 'CEC2VRGU', 'Voluptatum aut cupiditate optio eos unde quia reprehenderit nemo a maxime est quas vel quo rerum.', 'Voluptas alias ut magnam ipsum veritatis eum. Dolore quia voluptatem enim voluptas assumenda. Non sit atque qui eos nulla. Dolor est ut et iste laborum aliquam doloremque. Sequi corrupti mollitia nemo aut soluta sunt. Similique perspiciatis iusto saepe impedit.', '192.57', NULL, 55, 1, 0, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(227, 19, 'Incidunt sit quia', 'incidunt-sit-quia-yyjUk', 'YJE2OHA5', 'Quasi inventore enim aut dolorem facere veritatis molestiae dolore sit quis culpa non.', 'Et aut consectetur fugit. Sequi cum vero autem. Sed temporibus voluptatem ipsa sed non. Qui cum ipsa similique asperiores hic sint. Dolor perferendis id ut.', '142.54', '145.56', 56, 1, 1, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(228, 19, 'Nostrum laboriosam amet', 'nostrum-laboriosam-amet-vxBFU', 'KTVJICSW', 'Voluptatibus ea unde iure voluptas enim corrupti deserunt voluptas error excepturi quis velit placeat.', 'Ex distinctio et quo vitae et vitae. Ut ut nihil consequatur ut et magni reiciendis quo. Dolorem voluptas et velit. Consequatur cumque veritatis et et. Ipsam qui maiores consectetur est.', '67.87', NULL, 23, 1, 0, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(229, 20, 'Animi officia blanditiis', 'animi-officia-blanditiis-SbdVn', 'OWTWIQJI', 'Voluptatibus ratione molestiae similique minima eius qui voluptatum.', 'Error ea alias atque et. Fuga odio minima qui rem neque in in ratione. Et et architecto autem ipsa. Sed sit doloremque neque velit doloribus voluptas sed nesciunt. Libero quaerat quaerat ratione quo. Consequuntur eos consectetur cum reprehenderit assumenda nihil.', '67.05', NULL, 16, 1, 0, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(230, 20, 'Rerum pariatur fugit', 'rerum-pariatur-fugit-g6NBo', 'T43OZJ3A', 'Odio quibusdam aliquam facilis quia dolores eligendi at praesentium exercitationem consequatur impedit pariatur quibusdam voluptas suscipit totam.', 'Aliquid et aliquid commodi quaerat sunt modi esse. Non sit aspernatur reprehenderit et explicabo. Omnis molestiae et expedita sapiente qui ut. Occaecati eius at distinctio aut ea veritatis.', '25.78', NULL, 13, 0, 0, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(231, 20, 'Rerum quis et', 'rerum-quis-et-f1fkl', 'SBLTVNSO', 'Assumenda exercitationem rerum ut quia asperiores non qui dolor velit at dolores non sit.', 'Consequatur unde perspiciatis itaque sit sit. Et qui fugit quasi dolores assumenda consequuntur. Doloremque a quis mollitia aut non ut aut.', '80.23', NULL, 200, 1, 0, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(232, 20, 'Necessitatibus voluptas vel', 'necessitatibus-voluptas-vel-5nNZu', 'XDA02MA8', 'Rem commodi sequi nulla doloremque eos reprehenderit id ut rerum non sit autem a.', 'Perferendis tempora odit non aperiam. Ipsam facilis aut consequuntur. Est corrupti adipisci suscipit aspernatur iure omnis.', '235.27', NULL, 128, 1, 0, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(233, 20, 'Illo magnam voluptatem', 'illo-magnam-voluptatem-yAMrj', 'N6IQDS9T', 'Quod pariatur sapiente impedit aut non rem sequi soluta dolor rerum et sed autem.', 'Dolores vero quis id iusto. Nulla tenetur ducimus reiciendis quod tempora ipsam adipisci quia. Eveniet et occaecati iure et vel est ut. Deleniti ea delectus vero sed placeat similique voluptatem.', '203.39', NULL, 14, 1, 1, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(234, 20, 'Est rerum quia', 'est-rerum-quia-Z4tNi', 'UF8FU28U', 'Impedit aut illo quis id tempore et laudantium laudantium.', 'Vitae quae provident architecto debitis tempore rerum. Distinctio sed mollitia enim vitae perspiciatis iure quia. A est sit assumenda fugiat qui qui.', '113.29', NULL, 95, 1, 0, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(235, 20, 'Sequi et debitis', 'sequi-et-debitis-rCTSE', 'IMYKT2GI', 'Consequuntur sunt ipsa qui sed sed dolor necessitatibus.', 'Expedita nesciunt ab consequatur commodi delectus. Inventore ducimus aperiam aut dolor. Unde quaerat odio dolor distinctio consequatur veritatis perferendis sit.', '115.36', '157.75', 198, 1, 0, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(236, 20, 'Et ipsum repellendus', 'et-ipsum-repellendus-T3HLY', 'K5RDMBGE', 'Est necessitatibus sed corporis numquam quo saepe aut voluptatem voluptates et molestiae.', 'Sint et hic voluptas modi eum sit in. Veniam vero ratione perspiciatis doloremque animi ea id. Tempora ut aut id ipsum. Id rem beatae porro incidunt voluptatum. Est voluptatem officiis veniam est excepturi.', '157.26', NULL, 57, 1, 0, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(237, 20, 'Ullam sunt molestias', 'ullam-sunt-molestias-iNP4J', 'TOBIXHJL', 'Laudantium eos ut est omnis consequatur possimus repellendus perspiciatis sunt et.', 'Veniam fugit accusantium quisquam et voluptatibus qui odit non. Accusantium dignissimos officia fugit et harum non culpa. Omnis dolor tempore iure voluptatem est dolores. Qui dignissimos dolor qui et voluptas. Voluptatum debitis nihil perferendis error vel voluptatum totam. Qui ut dolore est officia tempora quia.', '68.56', NULL, 118, 1, 0, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(238, 20, 'Porro aut qui', 'porro-aut-qui-4mNAM', 'JM6WLUYM', 'Pariatur nisi aut id id ut non id et.', 'Inventore ratione et quis voluptatem. Blanditiis aliquid vel qui aut. Vitae asperiores sit aliquam. Modi possimus consequuntur iste non atque laudantium in minima. Voluptatem ut molestiae voluptas incidunt eos perspiciatis eaque. Repellendus reprehenderit voluptatem deserunt vel impedit sit.', '177.92', NULL, 188, 1, 1, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(239, 20, 'Sunt eos pariatur', 'sunt-eos-pariatur-IAme4', 'KA8J5VXF', 'Qui ad voluptas et non rerum a tempora temporibus ut id earum in vel harum.', 'Est minima velit fugiat ab asperiores quia. Enim praesentium temporibus omnis nihil incidunt nemo quisquam vitae. Reprehenderit numquam eos quaerat nostrum voluptatum deserunt. Rerum aut vel alias accusantium tempore sed. Non eligendi reiciendis quo porro non. Qui minima doloribus iusto itaque in reprehenderit.', '89.77', '114.06', 104, 1, 0, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(240, 20, 'Illo minima assumenda', 'illo-minima-assumenda-M4vqc', 'M2MBIPVR', 'Fugit laborum eius porro ut optio tempore voluptatibus et enim.', 'Quo qui molestiae dolor porro occaecati voluptatum. Eligendi magnam quaerat qui quia nemo sed. Id libero animi numquam aliquid nesciunt odio odio. Non sit molestiae exercitationem voluptates. Recusandae vel eos aliquam sit qui.', '189.61', NULL, 18, 1, 0, NULL, NULL, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(241, 21, 'Excepturi quasi omnis', 'excepturi-quasi-omnis-6FDO8', 'ZU9I8JKU', 'Ut et qui quia ut saepe eum tempore sunt.', 'Harum unde quia non. Qui voluptatibus earum illum atque nostrum. Ea earum soluta deleniti doloribus culpa.', '105.12', NULL, 17, 0, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(242, 21, 'Nihil impedit eligendi', 'nihil-impedit-eligendi-ovq1O', 'UC1601HM', 'Quis adipisci repellat fugit sed enim aut et asperiores nesciunt sunt tempora.', 'Quia mollitia optio inventore porro sunt doloribus. Sit quas laudantium est dicta unde optio. Voluptas tenetur voluptatem ratione quia id cumque. Distinctio esse et placeat nam est deleniti assumenda enim.', '230.64', NULL, 70, 0, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(243, 21, 'Accusamus consequatur aliquam', 'accusamus-consequatur-aliquam-U7AMg', '4N9IE7UN', 'Enim odio ut error dignissimos rerum facilis quidem dolor assumenda.', 'Inventore enim et tempore repellat illo quo. Id vero eligendi qui. Vel ipsum commodi molestias nisi quia qui. Iure quo id cupiditate repellat.', '174.56', '195.28', 163, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(244, 21, 'Fugit et ipsa', 'fugit-et-ipsa-JjEW2', 'MSRX1ZXG', 'Perferendis fugiat voluptas numquam eos nemo dignissimos placeat commodi aut corrupti distinctio aperiam quidem.', 'Architecto neque tempora voluptas saepe ab nemo dolore. Atque ipsum tempora quasi autem fugit incidunt. Itaque similique quo qui. Unde voluptate dignissimos pariatur occaecati non ut.', '67.62', NULL, 64, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(245, 21, 'Hic et facere', 'hic-et-facere-UbJrK', 'VIRT05OZ', 'Laudantium praesentium non repellendus quisquam sed saepe reprehenderit praesentium iure nam.', 'Exercitationem illo aut cupiditate ratione quisquam dicta cum. Deleniti reiciendis veniam voluptate. Adipisci aspernatur at consequatur odit doloremque eligendi voluptatum nam.', '209.31', NULL, 56, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(246, 21, 'Et non ut', 'et-non-ut-lQavz', 'VCW1G2HZ', 'Esse veniam eum harum ab veritatis expedita velit eos ut.', 'Et excepturi consequatur atque nisi. Neque provident voluptates sapiente ut atque velit officia. Ut corporis voluptas et. Vero et perspiciatis quo. Accusantium non quasi sed.', '249.75', NULL, 127, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(247, 21, 'Eaque rerum voluptate', 'eaque-rerum-voluptate-cSII2', 'AF7QPZOZ', 'Eum corporis omnis inventore perspiciatis veritatis sed dicta qui eum omnis adipisci fugiat optio voluptatum culpa et.', 'In esse sint voluptatibus. Quo omnis omnis voluptatem dolor inventore ipsa et. In voluptatum ut quia qui sunt et tempora laborum.', '225.37', NULL, 17, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(248, 21, 'Amet cupiditate nobis', 'amet-cupiditate-nobis-7JLT6', '33SC2SUH', 'Minus et ea qui consequatur est distinctio iste ipsum at dolor.', 'Est perspiciatis repudiandae ab autem vel. Fugit aut quia porro vel porro autem ab. Nulla voluptatem omnis maiores voluptate natus nam. Architecto dolorem enim quia.', '228.93', NULL, 160, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(249, 21, 'Fugiat sint placeat', 'fugiat-sint-placeat-1QpAw', 'CBGDL0JD', 'Labore cumque error culpa recusandae sit ut voluptatem iure qui quia.', 'Laboriosam ex maiores itaque aut. Voluptatibus mollitia consequatur et ipsam molestias voluptatem. Non quia saepe quia. Aperiam quia est omnis ea rerum.', '9.22', NULL, 57, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(250, 21, 'Quia maxime quos', 'quia-maxime-quos-pCk0V', '75SSYG22', 'Qui ut eum necessitatibus eos iste est et aspernatur animi consectetur laboriosam earum.', 'Quibusdam temporibus at dolores earum quas eligendi ipsam. Sunt harum voluptatem totam dignissimos quaerat quo. Dolor et vitae ad quidem quis itaque. Nemo quia soluta eveniet eligendi aut eaque.', '85.51', NULL, 189, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(251, 21, 'Architecto natus nihil', 'architecto-natus-nihil-dcjai', 'OGLTFKZZ', 'Ut omnis officia in nesciunt enim aut saepe dolor animi ut praesentium et quidem ipsa sit.', 'Voluptatem veritatis et sit modi nihil. Sed doloremque unde ipsam autem. Doloremque esse qui rerum quasi. Sit quisquam vel eaque molestiae.', '291.02', NULL, 49, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(252, 21, 'Voluptatem repellat sint', 'voluptatem-repellat-sint-RfSpP', 'HJJQDEP2', 'Nesciunt non harum corporis veniam ipsa doloremque sit dicta non accusamus est.', 'Dolorem hic ut fugiat rerum. Impedit ad officiis qui perspiciatis. Commodi aut dolores commodi minus.', '73.46', NULL, 110, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(253, 22, 'Ut voluptatem corporis', 'ut-voluptatem-corporis-E3CrD', 'EDWCD2JX', 'Distinctio qui delectus optio iusto debitis et recusandae nihil ab rerum similique totam odio dolorem.', 'Totam sequi ea quisquam ullam et iste. Accusantium incidunt vel reprehenderit doloremque. Excepturi necessitatibus ut qui cupiditate blanditiis repellat voluptas. Dolore et iusto porro libero doloremque et facilis esse.', '205.93', NULL, 153, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(254, 22, 'Perspiciatis beatae explicabo', 'perspiciatis-beatae-explicabo-N311k', 'BBSI6WBW', 'Velit ea aut praesentium voluptatibus quidem voluptatem sequi molestiae sed.', 'Nam ad occaecati qui sed fugiat. Impedit perferendis animi hic sunt deleniti. Nemo facilis sapiente quod quis ut omnis.', '71.94', NULL, 1, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(255, 22, 'Animi tenetur unde', 'animi-tenetur-unde-sH7mp', 'L6YL9HCB', 'Alias similique impedit velit deleniti placeat sequi aut voluptatem qui necessitatibus soluta impedit fugiat voluptates.', 'Autem et qui vel voluptatem occaecati beatae architecto. Ut minus aliquid similique voluptatibus saepe et. Est veritatis consequuntur hic alias autem quia consectetur. Rerum esse sapiente est voluptas.', '24.66', NULL, 166, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(256, 22, 'Qui vero rerum', 'qui-vero-rerum-5jXtk', 'F03UUCEA', 'Maxime et maiores sit assumenda debitis a culpa omnis dignissimos quam.', 'Natus voluptate et et corrupti omnis. Dolores iste laboriosam vel vel sit omnis velit. Consequuntur aperiam sed vero quaerat. Officiis odit reiciendis soluta reiciendis quasi dolorem culpa.', '201.81', '216.91', 193, 0, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(257, 22, 'Et rem laboriosam', 'et-rem-laboriosam-RD8DE', 'F9LAVUSB', 'Deserunt iusto voluptates neque et eos eligendi qui.', 'Neque eos iure doloribus voluptate sed consequatur. Non aliquam sapiente aspernatur dicta ut quis. Et aut ut illo. Doloremque omnis non et aspernatur dolor.', '256.68', NULL, 141, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(258, 22, 'Et placeat et', 'et-placeat-et-kx2rz', 'CSF9WSJW', 'Dolore in quia incidunt quidem sequi nobis possimus possimus at explicabo sit in iusto deserunt velit.', 'Suscipit quo consectetur similique nobis voluptatem et dolorem. Nesciunt blanditiis dolorem fuga nesciunt quia sunt. Doloribus quas aliquam dolore. Beatae fuga quod dolores laudantium. Eaque reiciendis officia qui quo est reiciendis ut.', '104.15', '134.94', 114, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(259, 22, 'Tenetur quia cumque', 'tenetur-quia-cumque-7jyCh', 'QMDIF98H', 'Accusamus veritatis eligendi voluptatem id temporibus dicta quae vitae molestias molestiae et et assumenda explicabo commodi.', 'Molestiae ut ipsum quae. Blanditiis ullam at aut autem. Voluptatem non qui sint. Enim quo corrupti rem fugiat ipsum non sunt. Ratione cum architecto in officia ut.', '152.21', NULL, 126, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(260, 22, 'Nihil ullam quia', 'nihil-ullam-quia-f0Q4v', 'X5RSIZ8L', 'Atque voluptatum aliquid voluptas non quo in aut tenetur atque ipsa nihil quia.', 'Earum sequi architecto voluptas provident. Magnam aut eligendi nemo earum ullam. Vitae ullam corrupti alias quos et voluptatum mollitia. Eos a quis iste.', '274.28', NULL, 158, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(261, 22, 'Est ducimus quibusdam', 'est-ducimus-quibusdam-cc5p5', 'N3ZCAPAR', 'Aut nihil quibusdam quia beatae ut aliquid eum et praesentium natus voluptatum natus quidem tenetur esse enim.', 'Dicta ipsa natus dolorem sunt et blanditiis beatae. Architecto officiis voluptatibus maiores impedit voluptas delectus qui. Aut provident et maiores doloremque. Iure sunt rem laboriosam labore ab.', '179.98', '203.32', 90, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(262, 22, 'Dolores aliquid cumque', 'dolores-aliquid-cumque-3U8Q0', 'WXY29ISQ', 'Quam voluptatem et aliquid illum aspernatur modi asperiores.', 'Nisi dignissimos odio voluptatem et minus. Iste amet qui sit rerum. Numquam excepturi expedita sed ea ex facilis repellendus.', '74.82', NULL, 184, 0, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(263, 22, 'Dolores ut accusamus', 'dolores-ut-accusamus-H0ADU', 'VQ2NNJRO', 'Necessitatibus vel nesciunt iure quasi eaque commodi doloremque dolorum minima.', 'Vero velit nisi sunt. Inventore accusamus nostrum cum accusamus quod ut optio. Non eos explicabo non non laboriosam doloribus voluptatem. Culpa ratione dolore minima sit quos tenetur.', '71.63', '93.01', 199, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(264, 22, 'Vitae deleniti sed', 'vitae-deleniti-sed-Qw618', '2X0REILS', 'Corporis ut dolor dolores non et consequatur voluptatem at.', 'Eum dignissimos illum ut aut. Quae dolorem qui voluptas exercitationem. Et cumque dolorem nostrum totam non. Inventore ad est voluptatem vel.', '95.02', NULL, 24, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(265, 23, 'Nihil ut sed', 'nihil-ut-sed-9cYjB', 'TDRJ8QDX', 'Quos saepe sit ut nihil rerum reprehenderit autem inventore tenetur odit maiores.', 'Nemo dolor deleniti atque consequatur sunt sapiente. Fugiat aperiam eos non autem facilis autem. Odio animi quas reiciendis at et. Et sit occaecati unde nesciunt reiciendis autem.', '123.30', NULL, 67, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(266, 23, 'Iure quis magni', 'iure-quis-magni-wrIG5', 'IS2IKM4R', 'Cupiditate nemo harum a reprehenderit quam quia non voluptates nobis autem pariatur nulla est nam aperiam nihil.', 'Doloribus tempora veritatis sit nihil omnis consequatur. Est et beatae consequatur possimus id itaque hic. Deleniti quo nostrum ipsam non reiciendis. Aliquid quos in modi facilis. Dolores voluptatibus quia aliquid aut. Fugiat optio incidunt dolor laudantium.', '187.44', NULL, 126, 1, 1, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(267, 23, 'Suscipit velit dolores', 'suscipit-velit-dolores-0HH5U', '8KCKIXIB', 'Et enim magni voluptas laudantium dolorem vel voluptatum aspernatur et.', 'Adipisci error ad autem odit expedita molestias. Ut sint voluptas neque veritatis alias at adipisci soluta. Harum alias autem modi nulla sed cum. Tempora repellendus quia libero rem.', '167.59', NULL, 47, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(268, 23, 'Consequatur odit ex', 'consequatur-odit-ex-yWQIn', '4ATYEO4W', 'Vel omnis esse nam neque et autem enim suscipit dolorum quisquam aut voluptas delectus dolor et consequuntur.', 'Eligendi rerum itaque deleniti beatae. Fugit quasi consequatur doloremque nam quibusdam delectus cumque aliquam. Culpa deserunt molestiae est doloribus autem. Blanditiis voluptas et aperiam provident architecto ut.', '12.55', NULL, 88, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(269, 23, 'Quidem eius ipsum', 'quidem-eius-ipsum-1oibc', '6BWYEGTY', 'Officiis omnis eum perferendis vel et doloremque reiciendis aut et.', 'Et ducimus adipisci alias rerum earum et quo. Labore ea aspernatur eligendi voluptatem eaque. At quia atque ipsa provident optio blanditiis aut id. Quos iusto ea nesciunt quis similique omnis qui. Aut aut et perspiciatis ad et voluptatibus omnis.', '183.03', NULL, 18, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(270, 23, 'Et et excepturi', 'et-et-excepturi-I7lfS', 'HVJBBWHP', 'Incidunt cumque dolorem eum repellat dolore in voluptatibus est aliquid quae praesentium cum rem.', 'Rerum cum est officiis cupiditate a id non ducimus. Repellat ut sed occaecati voluptatibus voluptates voluptatem veritatis. Perferendis perspiciatis dolor doloribus reprehenderit quis officia hic.', '288.10', NULL, 170, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(271, 23, 'Illum at sint', 'illum-at-sint-rXnpC', 'AXXC66JO', 'Iure aut velit ad earum officia vel esse modi earum.', 'Voluptates et in voluptas eius facere natus. Inventore perspiciatis nam est reprehenderit minima dolores. Impedit quaerat modi nesciunt alias facere. At aperiam ipsam consequatur et et sed eos. Id ullam sequi sed id ut.', '161.15', '185.83', 55, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(272, 23, 'Atque atque ut', 'atque-atque-ut-XKOtW', 'O7XJNGOO', 'Quis necessitatibus assumenda sit doloribus molestiae velit sint perspiciatis error vero nisi.', 'Sint ut ex modi maxime ex minus quis. Modi qui rem tempora vitae vero ut autem. Aut culpa ut temporibus itaque explicabo impedit autem. Nobis odio et ut ab exercitationem enim accusamus voluptatum.', '48.82', NULL, 21, 1, 1, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(273, 23, 'Dolores sed magni', 'dolores-sed-magni-GbxTI', 'CUSBFUWY', 'In libero ducimus et facilis placeat vel nostrum sunt facere rerum fugiat.', 'Sint eligendi corporis voluptatem rem quisquam amet quisquam. Eos quisquam ipsum non voluptatibus. Soluta molestiae dolorum dicta consequatur aut aliquid. Illo quaerat autem dolores.', '89.50', NULL, 183, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(274, 23, 'Ut quidem necessitatibus', 'ut-quidem-necessitatibus-D55Ao', 'YOPSDK6N', 'Vitae iure dicta impedit ipsam nesciunt ab odit aut sint.', 'Ut omnis eius ipsam dolorem sed. Quibusdam blanditiis omnis non impedit similique. Atque recusandae sequi omnis dignissimos sed. Magni reiciendis amet eius saepe et temporibus qui.', '24.67', '66.15', 151, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(275, 23, 'Aut qui qui', 'aut-qui-qui-HNTMH', 'SOYJHLCH', 'Odio recusandae laborum consequatur ut dolore consequatur voluptatem est vero delectus fuga ut autem error.', 'Ut quidem nisi quia cumque. Nam iste omnis in fugit. Culpa aut voluptate aut qui qui enim. Sit at nulla dolor. Ab asperiores minima culpa facilis eum ullam.', '280.69', NULL, 131, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(276, 23, 'Fugit enim modi', 'fugit-enim-modi-2akjM', 'CHEPVGNF', 'Autem dolore neque magni repellendus ad in beatae provident recusandae ipsam harum qui eligendi quisquam.', 'Dolores quos vel sapiente ut sit tenetur. Voluptatem deleniti laboriosam ut sed aliquid sit harum. Labore delectus ea exercitationem et odit dolore temporibus modi. Veniam minima fugiat est facilis. Suscipit pariatur rerum aut sit.', '120.26', NULL, 81, 1, 0, NULL, NULL, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(277, 24, 'Aperiam eum reiciendis', 'aperiam-eum-reiciendis-3RePv', 'TMXCPLCP', 'Pariatur impedit reiciendis maiores ratione et sit non nihil quam et sit quasi ad iusto voluptas consequatur.', 'Neque et at perspiciatis sint molestias ut modi. Velit consequatur dolorem est. Officiis repellendus eum ut enim voluptas a ut. Debitis quas aperiam ea.', '86.43', NULL, 60, 1, 1, NULL, NULL, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(278, 24, 'Est magnam quam', 'est-magnam-quam-bZP9P', 'TQA1UALR', 'Cumque modi commodi veniam molestiae voluptatibus ipsa beatae delectus natus est quia enim.', 'Id voluptas perspiciatis molestiae sapiente nam. Qui ea magnam omnis recusandae et alias. Est perspiciatis vero est corporis. Eveniet id unde eos et rerum. Soluta et rerum qui incidunt saepe.', '246.26', NULL, 170, 1, 0, NULL, NULL, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(279, 24, 'Qui quo quos', 'qui-quo-quos-3fjNY', 'EZU44WKP', 'Omnis similique aliquam saepe voluptas laborum ut et optio in voluptas ipsam tenetur cumque est rerum libero.', 'Est repellat similique itaque sequi excepturi. Ut autem quo quod. Est ut voluptate odit omnis doloremque itaque.', '15.48', '53.71', 108, 1, 0, NULL, NULL, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(280, 24, 'Impedit molestiae doloribus', 'impedit-molestiae-doloribus-Eet04', '1KWNPJN7', 'Blanditiis deleniti exercitationem non consequatur eaque totam omnis aut.', 'Temporibus eligendi sed a ut. Ut quam hic neque nam rerum. Vel et eveniet pariatur dolorem consequatur quidem.', '150.67', NULL, 46, 0, 0, NULL, NULL, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(281, 24, 'Consequuntur et nemo', 'consequuntur-et-nemo-2lnTB', 'RAPHFTQG', 'Aut est natus est perferendis incidunt et velit quo nostrum a est unde in non sequi aut.', 'Est ut alias quisquam et dolores fuga quidem. Quo minima quod provident iste aut nobis. Veritatis necessitatibus voluptas assumenda et. Quibusdam aspernatur quis quis est. Qui commodi soluta repudiandae qui voluptatem nostrum.', '151.44', NULL, 7, 1, 0, NULL, NULL, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(282, 24, 'Est vitae iure', 'est-vitae-iure-1prwg', 'CYU6GLL6', 'Natus placeat sunt explicabo at id omnis quia consequuntur fuga maxime doloribus voluptates harum sed ad.', 'Qui delectus in consectetur eligendi qui quia est. Facere eaque eos et harum. Necessitatibus est inventore molestiae accusamus incidunt aliquid. Qui consequuntur architecto ullam officia. Quo minima velit dicta. Sapiente quis magni et quisquam sint accusamus qui eum.', '13.59', NULL, 174, 1, 0, NULL, NULL, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(283, 24, 'At quia ut', 'at-quia-ut-NlwQ1', 'WA7NWYTW', 'Voluptates incidunt aut exercitationem et iste enim consequatur.', 'Repudiandae temporibus sequi sit est natus suscipit. Et et atque sunt reprehenderit rerum facere et molestiae. Et libero modi culpa voluptatum corporis ut. Beatae est dolorem tempora aut in dolor. Sint asperiores velit qui id. Reprehenderit perspiciatis molestiae ipsa ex consectetur.', '52.52', '56.04', 177, 1, 0, NULL, NULL, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(284, 24, 'Et enim consequatur', 'et-enim-consequatur-VNjlD', 'PEGCAFZG', 'Molestias animi distinctio et aut eligendi qui sint asperiores cupiditate consectetur.', 'Dolores sunt quas cupiditate ut adipisci corporis ut nihil. Nihil aut asperiores accusantium vitae sit quis eius accusamus. Et maiores pariatur consequatur quas. Enim vel id possimus doloribus. Sunt est consequatur voluptatum minus. Ullam aliquid est quia ea.', '286.94', NULL, 142, 1, 1, NULL, NULL, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(285, 24, 'Ipsa reiciendis veritatis', 'ipsa-reiciendis-veritatis-zzM4r', 'MXJ8XZPG', 'Nemo minus quia earum harum non perferendis culpa.', 'Dolorem qui quos est id autem dolorum adipisci. Fugiat assumenda id molestiae maiores nihil eius quidem. Quia eligendi ea eos similique voluptatem aliquid. Id architecto deserunt aspernatur. Dignissimos sed hic omnis nihil qui unde laudantium. Quia quas quo quod consequatur et.', '195.92', NULL, 190, 1, 0, NULL, NULL, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(286, 24, 'Sed quis non', 'sed-quis-non-qsTIC', 'PGO78UDY', 'Illo repellendus pariatur dolorem vitae non quia sed unde pariatur sit autem ab sed.', 'Quas quas sit nesciunt consequatur aliquid. Fugiat sed placeat nesciunt consequuntur facilis et repudiandae. Quidem necessitatibus quo magnam sint. Velit non sunt ut unde aliquam nesciunt eos. Est ut cumque totam mollitia consequatur. Nulla autem eligendi vel dolorum illo.', '33.51', NULL, 198, 1, 0, NULL, NULL, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(287, 24, 'Error aut quia', 'error-aut-quia-fFTXJ', 'RMREL1E2', 'Eveniet omnis sapiente et sed dolorem adipisci ipsa omnis architecto numquam.', 'Est dolor iusto ut est at. Odio et qui praesentium non dolores. Alias possimus non illum cum voluptas. Molestias est asperiores voluptas quisquam. Dolor sed quis nesciunt ea voluptas ex.', '187.77', NULL, 123, 1, 0, NULL, NULL, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(288, 24, 'Sint perferendis omnis', 'sint-perferendis-omnis-bSb0V', 'EUWBSF7Z', 'Facere unde suscipit magnam magnam velit beatae cum cum.', 'Sit aut culpa ducimus atque tempore. Soluta laboriosam natus quam quis dolorum. Qui vero sed occaecati aut ea. Dolores reiciendis sit iste cumque hic omnis distinctio. Repudiandae est rem corporis qui esse quia quisquam delectus. Iste suscipit veritatis sit accusamus nihil.', '238.69', NULL, 9, 1, 0, NULL, NULL, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(289, 25, 'Asperiores nulla consequatur', 'asperiores-nulla-consequatur-FXZrB', 'GVTQZPQR', 'Quae et sequi et nihil voluptatem deleniti ut.', 'Non recusandae similique architecto sit laudantium quia quae. Sunt ut sunt accusantium. Odio omnis non explicabo fugiat dolore impedit dolorum. Repellat sit id voluptas est est illo sed.', '223.88', NULL, 121, 1, 0, NULL, NULL, '2025-10-23 15:24:44', '2025-10-23 15:24:44'),
(290, 25, 'Aut explicabo ut', 'aut-explicabo-ut-vJibH', 'Y9WRIVHR', 'Eligendi necessitatibus blanditiis unde atque harum voluptatem quia est.', 'Beatae at ut debitis aut aspernatur praesentium. Laudantium accusamus quia veniam molestiae inventore. Perferendis nesciunt eos tenetur dolorem sapiente excepturi rerum.', '172.86', NULL, 147, 1, 0, NULL, NULL, '2025-10-23 15:24:44', '2025-10-23 15:24:44'),
(291, 25, 'Eveniet in quia', 'eveniet-in-quia-ccXWe', 'O69JSELC', 'Quisquam et ut quas esse sed ipsum sit et totam.', 'Pariatur excepturi eos distinctio aut magni error. Nostrum illum illum quam repudiandae mollitia veritatis illo. Aspernatur dolore sequi dignissimos vel fuga neque quas. Unde totam autem mollitia.', '172.58', NULL, 77, 1, 0, NULL, NULL, '2025-10-23 15:24:44', '2025-10-23 15:24:44'),
(292, 25, 'Accusantium in fugiat', 'accusantium-in-fugiat-VQ4ja', 'GZ7GVQJW', 'Voluptates deleniti consequatur quia non consequatur adipisci veritatis eligendi et tempora nisi quos.', 'Delectus temporibus molestiae tenetur numquam dolorem et provident ipsa. Voluptate deleniti explicabo asperiores a eligendi autem magni. Quam in modi dolores deleniti.', '116.28', NULL, 104, 1, 0, NULL, NULL, '2025-10-23 15:24:44', '2025-10-23 15:24:44'),
(293, 25, 'Soluta libero incidunt', 'soluta-libero-incidunt-m29UQ', 'OVKULBYL', 'Facilis quisquam nostrum est at a sed et aspernatur sit cupiditate voluptatem.', 'Omnis magni quae voluptas fugit aut. Quasi non quaerat sapiente et consequatur maxime similique. Nostrum tenetur alias magnam sit. Et assumenda sunt similique dolor. Labore mollitia temporibus eum dicta qui nam omnis et. Alias earum ipsa dignissimos error facilis harum ut.', '92.23', NULL, 11, 1, 0, NULL, NULL, '2025-10-23 15:24:44', '2025-10-23 15:24:44'),
(294, 25, 'Reprehenderit est rerum', 'reprehenderit-est-rerum-Xrke2', 'MI7BREHB', 'Tempora aliquam consequatur velit itaque voluptas nostrum nihil qui exercitationem.', 'Facilis rerum totam qui quos et ipsa. Voluptas aperiam et ex et omnis velit aliquid autem. Earum delectus veritatis dolorum magni. Ut facere quibusdam est architecto sunt. Quasi enim at modi numquam sit quis.', '155.18', '200.51', 40, 0, 0, NULL, NULL, '2025-10-23 15:24:44', '2025-10-23 15:24:44'),
(295, 25, 'Mollitia recusandae et', 'mollitia-recusandae-et-g0Uef', 'DLSYJJW5', 'Molestiae esse ratione et nemo voluptatem at fugiat et voluptatibus ut quo porro officiis aperiam.', 'Laudantium eligendi eveniet soluta perspiciatis. Ab ea odio esse provident voluptas rerum aut vel. Et qui laborum quaerat neque libero laborum. Dolorem non libero commodi.', '148.21', '191.19', 5, 0, 0, NULL, NULL, '2025-10-23 15:24:44', '2025-10-23 15:24:44'),
(296, 25, 'Qui omnis beatae', 'qui-omnis-beatae-aRHWV', 'QOSEH5MB', 'Corrupti deserunt sit quia doloribus cupiditate necessitatibus consequatur praesentium in.', 'Molestiae voluptatem impedit dolorem dolores eum. Praesentium officia atque dolores harum. Enim rerum consequuntur ad quis enim. Qui quisquam consequuntur doloremque maxime. Voluptate nisi quos quibusdam quaerat quasi. Voluptas explicabo officia accusamus laboriosam in assumenda nostrum voluptas.', '121.44', '140.46', 28, 1, 0, NULL, NULL, '2025-10-23 15:24:44', '2025-10-23 15:24:44'),
(297, 25, 'Reiciendis qui quisquam', 'reiciendis-qui-quisquam-FLLPN', 'XA3OEFDU', 'Architecto quae impedit alias velit facilis optio sunt harum illum accusantium ipsa aut laborum rerum esse.', 'Est consequatur quo eaque qui ut vel cumque. Voluptatum qui debitis nemo ab. Et iste delectus ratione id recusandae. Ad praesentium natus quo ipsa omnis voluptatibus praesentium nemo. Officiis facere qui laudantium debitis.', '83.12', NULL, 197, 1, 0, NULL, NULL, '2025-10-23 15:24:44', '2025-10-23 15:24:44'),
(298, 25, 'Aliquid iste veritatis', 'aliquid-iste-veritatis-olUL4', 'CLG2NKQL', 'Molestiae impedit non iure officiis voluptate occaecati similique sed.', 'Id voluptatibus maxime sit possimus. Eligendi quas quia sint consequatur. Debitis earum dignissimos illum.', '208.83', '232.06', 60, 1, 0, NULL, NULL, '2025-10-23 15:24:44', '2025-10-23 15:24:44'),
(299, 25, 'Aut et nulla', 'aut-et-nulla-TC9I0', 'XJ4PMP53', 'Nostrum fuga sed quia perferendis ipsum non id aut recusandae vitae non distinctio omnis esse.', 'Aliquam aspernatur molestias aut est in sit. Qui veniam architecto omnis molestias. Ipsam impedit magni sit est. Quia aspernatur ex labore rerum expedita quia sed dolores.', '89.42', NULL, 91, 1, 0, NULL, NULL, '2025-10-23 15:24:44', '2025-10-23 15:24:44'),
(300, 25, 'Reprehenderit id natus', 'reprehenderit-id-natus-GIcc8', 'JFLVFZ5A', 'Ut ipsa quo rerum dolore necessitatibus praesentium repudiandae ea sit amet deleniti odit repellendus nesciunt dolore et.', 'Ratione modi ex architecto ea. Libero alias voluptates blanditiis eum laborum culpa. Harum ratione a molestias iusto ipsa. Maiores temporibus ipsum deserunt sit autem qui.', '23.33', NULL, 169, 1, 0, NULL, NULL, '2025-10-23 15:24:44', '2025-10-23 15:24:44'),
(301, NULL, 'Corrupti sint cum', 'corrupti-sint-cum-Wztvv', 'VUI02RVK', 'Aut quod velit dignissimos voluptatem doloremque itaque iusto dolorem rem et vero blanditiis optio tenetur.', 'Non dolorem ut fugiat quisquam quas voluptatem quis velit. Eaque non deleniti illo aperiam blanditiis voluptatem quia. Ut magni qui ipsam et quis.', '277.04', NULL, 69, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(302, NULL, 'Qui dolorum ea', 'qui-dolorum-ea-0VhSa', 'HSQ8TSZZ', 'In vero quibusdam quasi illo dolores velit cupiditate debitis optio soluta et harum architecto.', 'Eligendi quibusdam facilis vero quas perspiciatis culpa dolor aut. Soluta rerum est facere odit nesciunt voluptate. Quia quo cumque enim ipsa corporis praesentium. Natus esse amet eaque dignissimos ut. Odit et odio necessitatibus voluptatum delectus ut aut. Dolore magni est omnis sapiente quam.', '57.29', '91.81', 159, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(303, NULL, 'Facere ex vel', 'facere-ex-vel-nJRMa', '94FYNPCW', 'Officia et neque et sint doloribus et eaque minus deserunt.', 'Dolorem veniam qui maxime commodi. Qui molestiae deleniti placeat necessitatibus est quia. Quos velit qui odio nisi consequatur repellendus cum.', '90.76', NULL, 200, 1, 1, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(304, NULL, 'Quidem eum omnis', 'quidem-eum-omnis-4WGzN', 'GTAXSPP2', 'Quas aut rem dicta excepturi qui inventore qui ut voluptatem aut nihil dolor rem iste et.', 'Magni qui sint incidunt quos quidem illo quia et. Quia ipsa cupiditate ipsum numquam esse debitis nihil est. Dicta aliquid nobis qui. Est dolorem veritatis ut optio quo architecto.', '48.82', NULL, 56, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(305, NULL, 'Libero enim cum', 'libero-enim-cum-25hnK', 'MQLMLFFD', 'Cum maiores aliquid voluptates ut esse consectetur debitis facilis et quae nobis.', 'A aut aliquid illo dolor provident debitis. Alias fugiat quae voluptatibus commodi adipisci. Qui placeat aut totam odit nulla dignissimos. Et voluptates porro blanditiis nihil assumenda consequuntur laudantium. Mollitia autem qui error incidunt. Natus facere aut mollitia doloribus accusantium illum quod.', '281.04', NULL, 41, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(306, NULL, 'Consequatur delectus et', 'consequatur-delectus-et-v6RQr', 'Z20FGXNH', 'Rem sunt illo magni voluptatem odit dolores molestias at eaque eaque provident et excepturi architecto a.', 'Cum dignissimos quis rerum. Nemo ipsa quia animi hic. Nesciunt assumenda doloribus nemo unde provident. Asperiores fugit aut accusantium qui porro perferendis illo. Ullam magni fugiat odio quae. Dolorum in labore consequatur nisi explicabo.', '63.90', NULL, 51, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(307, NULL, 'Alias ullam vel', 'alias-ullam-vel-n23ey', 'NYXFDDKZ', 'Quo quae quaerat ut ipsum qui dolorem voluptatem amet et alias harum.', 'Omnis molestiae iusto animi aut velit molestias fugiat. Dolorum doloribus exercitationem est temporibus non. Fugiat nostrum dolores nobis. Corporis eaque quis laudantium veritatis deserunt modi porro. Nam ut suscipit exercitationem tenetur voluptas.', '124.21', '167.39', 125, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(308, NULL, 'Amet totam cupiditate', 'amet-totam-cupiditate-UkJnk', '08EQUGJX', 'Adipisci blanditiis nemo repudiandae eius vel sed non saepe.', 'Accusamus et illum quia fugiat odit nihil sed. Magni suscipit exercitationem quia odio iure dignissimos. Aliquam qui unde quos reiciendis id. Voluptatem necessitatibus perferendis in illo. Laborum ipsam beatae mollitia commodi quia odit vero. Exercitationem aspernatur reiciendis nulla hic qui quas.', '129.56', NULL, 28, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(309, NULL, 'Repellat fugiat qui', 'repellat-fugiat-qui-hbWvr', 'V6NMXTFD', 'Optio quae eum et maxime ex impedit nulla omnis sed aspernatur voluptatem provident harum.', 'Ipsum non molestias dolores ut et. Veritatis eligendi praesentium placeat sit cumque fugit qui alias. Magnam dolorem commodi sunt aliquam consequatur officia. Molestiae ut atque similique maxime tenetur molestias. Quia veniam dolorem totam accusantium soluta perferendis et.', '110.79', NULL, 160, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(310, NULL, 'Nihil est architecto', 'nihil-est-architecto-4aS2h', 'ERCBAKA4', 'Magni voluptatum totam aliquam est ut sunt hic quis omnis.', 'Voluptatem ut et et asperiores. Error nostrum in rerum neque necessitatibus sint non reprehenderit. Repellat in tenetur eum pariatur alias. Sapiente mollitia quod consequatur repellat qui quia asperiores. Enim temporibus enim quis ut ut et.', '91.61', '106.34', 151, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(311, NULL, 'At officiis eum', 'at-officiis-eum-D4YzT', 'PYCDANJR', 'Reiciendis alias qui enim enim quia dolore accusantium ut exercitationem rerum.', 'Voluptate velit qui voluptates ea deleniti ut. Ut consectetur occaecati officia. Ducimus et numquam eligendi aspernatur distinctio. Illo cum ut qui quia numquam animi aut vitae. Fuga non libero at ut quia ratione officiis architecto.', '297.26', NULL, 119, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(312, NULL, 'Quisquam vitae omnis', 'quisquam-vitae-omnis-l9TFR', 'SFLMU1BD', 'Sed eveniet placeat quibusdam mollitia et corporis expedita.', 'Et aut tempora enim dignissimos optio ut rerum. Magni omnis eum qui. Qui adipisci et deserunt. Quam illo asperiores quod enim.', '199.80', NULL, 113, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(313, NULL, 'Quia ut in', 'quia-ut-in-XOrcI', '4B10XXOT', 'Cupiditate dolorem alias accusantium temporibus vel sit tenetur quae vel laudantium.', 'Perferendis earum natus voluptas dolor earum. Voluptatem aut praesentium incidunt quidem libero rerum et. Qui aspernatur praesentium fugiat vel. Animi nihil aut qui qui. Perferendis facilis velit qui maxime possimus non corporis.', '230.63', NULL, 198, 0, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(314, NULL, 'Deserunt laudantium tenetur', 'deserunt-laudantium-tenetur-goUxy', 'W6TACN0P', 'Culpa et iure qui expedita sunt a consequuntur.', 'Et qui et modi consequatur itaque. Nesciunt earum libero sit quisquam deserunt accusamus. Suscipit earum corrupti corporis cupiditate ut. Ut in molestias qui enim consequatur sunt consectetur.', '58.96', NULL, 158, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(315, NULL, 'Accusantium cupiditate asperiores', 'accusantium-cupiditate-asperiores-ZfZZv', 'YA9Y1MYT', 'Ut animi voluptas delectus omnis qui dolores nesciunt nihil assumenda quis.', 'Reprehenderit incidunt in qui nam accusamus quaerat. Eaque rerum magnam aut minus. Eum quis excepturi exercitationem dolores aliquid ipsum. Et repellat corporis vel nulla rerum cum. Est aut autem aliquid vel ratione libero sapiente qui.', '100.99', NULL, 28, 0, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(316, NULL, 'Tenetur eaque alias', 'tenetur-eaque-alias-1YhPa', 'TBHC40ML', 'Quaerat ut eaque quia corporis nostrum omnis aut illo quidem facilis voluptas.', 'Est nobis aut accusantium quibusdam quia. Doloribus perspiciatis deleniti veniam nihil qui sunt culpa aut. Quis delectus voluptas nihil nihil temporibus quo. Qui quo dicta qui ea tenetur. Non aliquam velit enim quae.', '188.72', NULL, 54, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(317, NULL, 'Quae et in', 'quae-et-in-wbemj', 'BDFSRB1F', 'Veniam quis quia assumenda qui vero quae quos consequatur.', 'Aut occaecati non rem praesentium et sunt. Delectus minima laudantium in reiciendis maiores minus. Doloremque maxime accusamus doloremque consequatur accusamus nisi iste. Odio et non aliquid voluptatem nam.', '95.36', '116.55', 184, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(318, NULL, 'Exercitationem est quibusdam', 'exercitationem-est-quibusdam-RNfci', 'WCQWJ2J2', 'Laudantium velit consequatur magnam ad id fugiat sint.', 'Sed voluptas ducimus dolorum eius molestias laboriosam. Quia doloribus sed earum delectus. Enim dolorum vitae minima. Illo dolores quis maiores itaque.', '265.09', NULL, 24, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(319, NULL, 'Dolorum sunt qui', 'dolorum-sunt-qui-4tZqO', 'WMFUQHUR', 'Dolor illo quia ut nostrum culpa consequatur quasi modi ut laborum id.', 'Ut dolores est ea iure illo ea. Magnam reprehenderit omnis voluptatem dolores nihil blanditiis repellat. Aut incidunt provident assumenda quasi a voluptate magnam ducimus.', '113.06', '128.54', 143, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(320, NULL, 'Inventore tenetur et', 'inventore-tenetur-et-qrOSk', 'LYQPUJNX', 'Distinctio amet assumenda praesentium eos aspernatur natus qui rem.', 'Harum sunt molestiae accusantium esse. Illo odit deleniti qui dolorem corporis. Omnis repudiandae aperiam sed ratione exercitationem tenetur. Eum id accusamus architecto dolorem. A officiis quis ut. Iste rerum aut voluptas rerum.', '109.71', NULL, 67, 0, 1, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(321, NULL, 'Labore et consectetur', 'labore-et-consectetur-hbKqH', '6HUD64OF', 'Placeat magnam mollitia cupiditate mollitia maiores nostrum aut unde at.', 'Asperiores quidem sunt incidunt necessitatibus aut magni ipsa quidem. Ut ipsum et quaerat aut magni ipsum. Ipsum assumenda officiis doloremque perspiciatis enim.', '35.72', NULL, 102, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(322, NULL, 'Non sed similique', 'non-sed-similique-aHcYM', 'YGINPP7X', 'Quia officia est ut quibusdam et est quas animi est ducimus voluptas officia esse velit.', 'Enim est quidem a aliquid qui architecto qui aspernatur. Et porro officiis qui qui ipsam sit. Dignissimos tempore est sed aut natus dolorum. Voluptas laudantium autem consectetur veniam. Cupiditate minus dignissimos quas.', '224.85', '271.58', 76, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(323, NULL, 'Et illum ipsam', 'et-illum-ipsam-hhp6v', 'ATPUV7Z4', 'Et aspernatur quia id eius molestiae quo aut sed laboriosam.', 'Voluptatum ullam reprehenderit quasi ut error autem. Maxime maxime sed modi. Est animi ea nulla reiciendis aut. Ut tenetur atque voluptates. Tenetur nisi aut voluptatem qui architecto voluptate rerum.', '274.93', '303.68', 45, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(324, NULL, 'Odio inventore iste', 'odio-inventore-iste-7bq3d', 'XQGAF52A', 'Et unde cum assumenda non consequuntur rerum nam aut iste sit suscipit mollitia aliquam et amet ipsam.', 'Aperiam ipsum ut et voluptatem aut aut eligendi. Quos molestias quis non doloribus corrupti. Cupiditate saepe molestiae iure repudiandae distinctio impedit. Rerum animi et deserunt repellat itaque quidem. Qui ipsam ex enim minus.', '217.95', NULL, 80, 0, 1, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(325, 28, 'Et necessitatibus magnam', 'et-necessitatibus-magnam-o0vYK', 'RB7BVNSP', 'Excepturi possimus deleniti cumque est molestiae dolorum et omnis aliquid omnis.', 'Sit eaque voluptatem magnam eum. Quia expedita placeat earum non eum sed dolorum. Expedita aut aut ut atque. Quam iste ab culpa quia vero quia possimus. Aliquam quae impedit et sit numquam ipsam ipsa. Velit dolores dolorem dolorum magni architecto vitae voluptas.', '61.51', NULL, 125, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(326, 28, 'Voluptate laborum quia', 'voluptate-laborum-quia-E1pYA', '4M3AYJZY', 'Reprehenderit praesentium quae id et voluptas in recusandae sit culpa qui at.', 'Dignissimos animi ut voluptatum ducimus aliquam omnis. Nulla ducimus quis doloremque numquam. Voluptate perspiciatis at aspernatur odit et hic id. Inventore ducimus vero mollitia sint vitae minus. Earum repudiandae fugit provident illo unde voluptas.', '180.22', NULL, 183, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(327, 28, 'Ratione labore unde', 'ratione-labore-unde-EIlHV', 'DFTVT5KA', 'Qui est dicta est pariatur est itaque consequatur ut.', 'Aut quos in velit asperiores dolore eius. Et eligendi est molestias rem quidem dolor mollitia non. A labore eos dolorem facere. Velit et qui quis inventore aspernatur ullam.', '283.91', NULL, 1, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(328, 28, 'Possimus libero tenetur', 'possimus-libero-tenetur-PSGEv', 'LUCOCZ38', 'Qui voluptatem quasi maxime aliquid optio dolorem reiciendis voluptatem.', 'Quod rerum animi ullam aut. Rem et eum ut et praesentium et. Quos est aspernatur sit esse dolor rerum. Repellendus aut tempore pariatur nihil tenetur.', '123.97', '156.96', 40, 1, 1, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45');
INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `sku`, `short_description`, `description`, `price`, `compare_at_price`, `stock`, `is_active`, `is_featured`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(329, 28, 'Dolore magnam fugit', 'dolore-magnam-fugit-wHltm', 'LPCXHXW5', 'Ratione perspiciatis quasi suscipit velit quis unde id architecto qui.', 'Autem sed explicabo ut magnam blanditiis. Aut repellendus omnis consequatur dolor enim. Quasi optio esse ullam quos et fugiat molestiae voluptatem. Enim qui omnis ex quidem et perspiciatis ullam dolores.', '120.71', '128.22', 8, 1, 1, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(330, 28, 'Nam totam atque', 'nam-totam-atque-zJPpw', '8DDKCJMK', 'Excepturi omnis nam cumque soluta aut ut quas qui maxime ducimus quam corporis quia fugit.', 'Quisquam libero perferendis maxime. Iure voluptate odio architecto non qui. Voluptas minima quam aperiam suscipit quos. Voluptate consequatur sint suscipit voluptatem eius impedit. Consectetur aut minus est voluptatum excepturi. Voluptas in delectus in eum.', '125.37', NULL, 183, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(331, 28, 'Rerum ut perferendis', 'rerum-ut-perferendis-UjER6', 'CLYCFQKQ', 'Commodi eius vel autem itaque perspiciatis quos est.', 'Nam quasi optio libero in in explicabo in. Animi exercitationem error sint eius qui facere sed. Culpa non accusantium ut. Impedit ipsa non sed.', '109.52', '145.34', 1, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(332, 28, 'Expedita quod aliquid', 'expedita-quod-aliquid-2rwID', 'GHII1HKW', 'Nulla et aut voluptas unde eius autem quisquam blanditiis neque quae eos sunt ut excepturi.', 'Omnis et voluptatem ut sequi nesciunt. Iure delectus qui architecto facilis at. Et ratione esse quaerat quas. Voluptatem animi quo voluptatum ullam asperiores voluptas est.', '91.59', NULL, 81, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(333, 28, 'Omnis ea dolor', 'omnis-ea-dolor-EOlvu', '99IF0VUJ', 'Esse qui eligendi nostrum vel non rem aut quis.', 'Alias quasi quae rem veniam sequi veniam. Blanditiis et numquam dolorum impedit temporibus saepe. Nesciunt et maiores aliquam illo facere. Consequatur dolorem id quas quo sed.', '41.72', NULL, 49, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(334, 28, 'Omnis omnis quis', 'omnis-omnis-quis-GdnAM', 'H6EEZKYZ', 'Est officiis tempora molestias ut enim sit facilis quia reprehenderit molestias delectus.', 'Aut quo adipisci eius. Asperiores omnis soluta ipsum illum aspernatur voluptatibus. Eos nulla sint sit sit. Est quis quia ut ullam aut.', '147.82', NULL, 107, 0, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(335, 28, 'Eaque cum sed', 'eaque-cum-sed-lTDIS', 'T9CG1EUT', 'Optio mollitia reiciendis amet aliquam quod doloremque explicabo officiis reprehenderit nemo et numquam eius qui.', 'Libero voluptatibus itaque qui odit qui. Nostrum rerum laudantium ex magni saepe vero voluptas omnis. Sed eos esse consequatur.', '102.85', NULL, 190, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(336, 28, 'Illo excepturi voluptatem', 'illo-excepturi-voluptatem-z6aui', 'ZMFSLAZ6', 'Repellat reiciendis molestiae animi rerum omnis aperiam voluptas.', 'Ea voluptatem similique quam maiores omnis sequi itaque qui. Et non placeat ducimus voluptas cum ea consectetur iusto. Quae omnis labore corrupti unde quidem voluptatem. Et molestiae sint doloremque dolorem.', '276.36', NULL, 184, 1, 0, NULL, NULL, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(337, 29, 'Laboriosam repellat corporis', 'laboriosam-repellat-corporis-wrClr', 'LY21GTQK', 'Sint voluptas iusto inventore aut porro qui recusandae perferendis molestiae non dolor.', 'Sunt qui facilis totam quis et. Atque aut temporibus perferendis ducimus vel cupiditate quo. Facere accusantium id quibusdam dolor. Hic quis alias repudiandae sed. Similique voluptatibus soluta magni ratione sint est hic. Et neque accusamus et odio veritatis voluptatem.', '53.53', NULL, 29, 1, 1, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(338, 29, 'Voluptatem dolor asperiores', 'voluptatem-dolor-asperiores-4DqXi', 'X1WDKIJQ', 'Ipsam aliquam ea sit illo adipisci libero repudiandae sunt aut.', 'Consequatur nihil id sapiente cumque corporis beatae. In ullam dolor perspiciatis magni occaecati delectus. Molestiae ipsam eum magnam enim eveniet esse repudiandae. Dolorum commodi eligendi vero ut.', '107.94', NULL, 63, 1, 0, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(339, 29, 'Voluptas atque sit', 'voluptas-atque-sit-mspQ3', '7IIBBXHG', 'Id aut placeat delectus nam et enim labore cumque quas et.', 'Quasi dolores placeat et fuga quia est magnam nihil. Et expedita aliquam voluptas non et. Perspiciatis blanditiis aperiam sed aliquid. Et repudiandae id adipisci asperiores. Minima fuga et modi in reprehenderit.', '252.37', NULL, 93, 1, 0, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(340, 29, 'Provident impedit hic', 'provident-impedit-hic-LXJck', 'C4UFQUIH', 'Dolorum nulla voluptatem non ea eos natus ut nisi fugiat iste.', 'Omnis molestiae asperiores quia reprehenderit. Ex modi earum tempore quasi cumque. Dolorem nostrum ut placeat ipsa nihil. Ut vel mollitia et autem sed magni.', '35.18', '42.17', 9, 1, 0, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(341, 29, 'Odit consequatur non', 'odit-consequatur-non-Th6iw', 'OVOR19IS', 'Modi aut quo aliquid itaque sunt et omnis nam voluptas fuga at.', 'Maxime laborum doloremque rerum aut. Aut maiores modi dolor atque. Sed inventore ea consequatur cupiditate. Velit deleniti qui repellat deserunt soluta eos ullam. Et explicabo est natus accusamus sunt quibusdam. Autem est inventore error odit.', '87.55', NULL, 124, 0, 0, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(342, 29, 'Expedita ea qui', 'expedita-ea-qui-bCvE8', 'VJCLNIMK', 'Eum eum ullam hic dolor aut ut ea omnis maiores ut qui id commodi ut enim.', 'Qui magnam sed ratione accusamus. Veniam vitae est qui. Esse voluptatibus nihil explicabo ut possimus sed quis. Optio est illum odit rerum neque. Doloribus cupiditate quia illo eligendi. Iusto sit optio aperiam eaque et quibusdam dolore.', '222.34', NULL, 174, 1, 0, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(343, 29, 'Culpa quis qui', 'culpa-quis-qui-Z76y1', 'EUOIJ80F', 'Consequuntur excepturi debitis corporis sint aut magnam debitis rerum accusantium.', 'Error consequatur itaque voluptatum. Perferendis sint consequatur ab et. Quis voluptatum omnis ipsa. Harum optio voluptas tempora accusantium.', '163.76', '182.77', 21, 1, 1, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(344, 29, 'Nostrum ea quibusdam', 'nostrum-ea-quibusdam-SuZnk', 'DWVHECXX', 'Adipisci magnam aliquid atque beatae consequatur exercitationem omnis nemo quia excepturi similique.', 'Molestiae saepe et ipsum ab quo. Amet similique odit voluptatem ipsa debitis voluptatem. Eos aut id veniam sunt.', '295.58', NULL, 95, 0, 0, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(345, 29, 'Natus aspernatur architecto', 'natus-aspernatur-architecto-CnD03', '5INGAS4C', 'Harum rerum distinctio suscipit illum repellat ut eos veritatis autem voluptatem cum optio voluptas ut ut incidunt.', 'Labore ut eveniet maxime veniam. Necessitatibus maxime quis aut mollitia libero nisi qui nam. Esse occaecati cupiditate iusto. Nobis autem aut minima iste vero.', '145.09', NULL, 89, 1, 0, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(346, 29, 'Temporibus culpa exercitationem', 'temporibus-culpa-exercitationem-Elt9J', 'SJBLSR98', 'Facere fugit eos hic consequuntur error ea voluptas a qui voluptatem consequatur eum iste quam rerum.', 'Harum eius ullam deserunt et cumque. Voluptatem ratione officiis praesentium ea quos dolor. Libero in repellat ut ea sint. Placeat quas ut a necessitatibus aliquid autem voluptatem. Sed autem error molestias quibusdam. Et sunt amet officiis non.', '193.76', NULL, 111, 1, 0, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(347, 29, 'Dolor qui molestiae', 'dolor-qui-molestiae-FfNSC', 'AHAXWS7K', 'Ut voluptatum vel rerum eos mollitia aperiam nemo reprehenderit nostrum sapiente.', 'Enim est perspiciatis aut perferendis corrupti dolorum. Quibusdam maxime assumenda ducimus qui soluta possimus omnis. Iste natus odio et vitae quia aperiam. Illum autem in atque ea pariatur maiores itaque. Enim tempore sint ipsam qui possimus.', '162.07', NULL, 138, 1, 1, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(348, 29, 'Nihil labore dolorem', 'nihil-labore-dolorem-6ko3l', 'EUWVAHMD', 'Ut qui aut et commodi aut labore voluptatem quod assumenda excepturi libero repellat.', 'Quisquam aut quo provident est omnis. Ex quasi omnis ut sed quibusdam. Sit reiciendis nostrum omnis dolore. Odio voluptatem dolor recusandae corporis aut corporis. Iste dicta eos sed totam. Veniam est ipsa voluptatem doloremque distinctio.', '250.37', '254.98', 71, 1, 0, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(349, 30, 'Fugiat dolore ducimus', 'fugiat-dolore-ducimus-zXXo9', 'Q44ODJYI', 'Cumque commodi sit nam quam dicta nam officiis quia nam illo.', 'Est et id molestias assumenda quae. Nostrum voluptatem animi culpa et doloremque. Aliquid autem cum quo. Et architecto quis neque sed consectetur non.', '58.57', NULL, 70, 1, 0, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(350, 30, 'Facilis laudantium id', 'facilis-laudantium-id-zzigH', 'YDY7VYVP', 'Esse odit illo asperiores adipisci omnis voluptatem culpa reiciendis est iusto numquam nesciunt reiciendis et.', 'Culpa aut velit amet. Magnam illo est impedit quia ut qui. Et repellat praesentium debitis dolorum distinctio est eveniet sed. Placeat voluptatum accusantium est labore laboriosam recusandae est.', '42.43', NULL, 67, 1, 1, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(351, 30, 'Nemo soluta unde', 'nemo-soluta-unde-XynxL', '0HGRYFZV', 'Hic omnis nostrum blanditiis magnam repellendus natus sed perferendis ut minus aliquid magnam neque et non.', 'Neque repudiandae consectetur rerum placeat est. At fugiat dolorem sed atque non optio sed est. Autem magnam iste mollitia ut aut. Blanditiis similique perspiciatis reprehenderit quis qui eos doloribus ut. Et dolorum dolores voluptate voluptatum recusandae totam.', '294.67', NULL, 85, 1, 1, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(352, 30, 'Est sunt molestiae', 'est-sunt-molestiae-bcQ4e', 'VMD3C0VW', 'Velit officiis molestiae voluptatem tenetur assumenda omnis veritatis iure voluptate qui incidunt.', 'Qui libero soluta et velit velit et deserunt. Quia fugiat ut consequatur modi veritatis eum magnam. Eos aut nostrum mollitia ut voluptas. Architecto culpa assumenda atque.', '92.04', '103.55', 106, 1, 0, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(353, 30, 'Praesentium optio aut', 'praesentium-optio-aut-0QTpo', 'G35422QU', 'Veniam qui et quaerat occaecati ipsa nisi voluptatem qui ut et.', 'Deserunt est quia excepturi in asperiores qui aut. Ratione dicta ex vel quis ipsam. Reprehenderit quis et temporibus et iusto enim praesentium. Cupiditate quo dolorem aut ut facere optio. Nemo velit ipsa aut quas dolorem possimus aut. Suscipit ea qui ex eum iure natus eum.', '171.72', NULL, 189, 1, 0, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(354, 30, 'Fugiat et repudiandae', 'fugiat-et-repudiandae-of1sg', 'JH7G7WCJ', 'Id autem voluptatem vero rerum consequatur et expedita rerum voluptates et reiciendis.', 'Alias quo labore aperiam quam. Est vel molestias ut eveniet rerum. Velit tempora id et sed aut quaerat. Quia aliquid dolor est. Ea quis quos possimus fugiat ipsum fuga natus similique.', '46.89', NULL, 174, 0, 1, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(355, 30, 'Aut perferendis impedit', 'aut-perferendis-impedit-0xF1M', 'UX8DPFVE', 'Dolor eius quam consequatur voluptates reprehenderit placeat quisquam perferendis quia.', 'Voluptatum corporis qui quia non veritatis adipisci voluptas deserunt. Ut maxime in nihil adipisci harum. Rerum quas eligendi corrupti voluptatem ipsa non in. Enim totam unde qui consequatur ipsa architecto. Repellendus quia ut nihil et itaque.', '55.37', '97.17', 46, 1, 0, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(356, 30, 'Sunt est iusto', 'sunt-est-iusto-nLIbV', 'AUOMRAT2', 'Inventore nisi repellendus voluptate voluptatem fugiat quo earum quia incidunt facilis quidem numquam sunt eveniet incidunt.', 'Earum fuga nemo quasi hic culpa. Quasi ut facere omnis. Rerum dignissimos nemo vel ipsa similique aut. Nostrum eos ex dolor maxime id. Soluta rerum voluptatem sit neque quo.', '136.90', NULL, 132, 1, 0, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(357, 30, 'Labore ducimus odit', 'labore-ducimus-odit-hcpGA', 'LX1B7GPP', 'Sapiente totam adipisci corrupti enim quis voluptatem sit sint.', 'Consectetur natus et rerum recusandae expedita dolorem quam. Tempore quae consequatur quo maiores doloribus occaecati quis. Veniam et deleniti voluptatem doloribus temporibus molestiae. Sit voluptatem veritatis a.', '265.86', '277.85', 79, 0, 0, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(358, 30, 'Vitae quia ipsum', 'vitae-quia-ipsum-pzmxn', '1NUPI1D5', 'Consectetur voluptate possimus est nam enim et quia sit neque dolorem temporibus soluta.', 'Cum aut quo culpa voluptas alias. Cumque assumenda asperiores esse omnis unde. Sed ea sunt quia quia molestiae.', '67.69', '90.64', 166, 0, 0, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(359, 30, 'Eveniet eos id', 'eveniet-eos-id-vfRyq', '934INHAY', 'Harum possimus expedita incidunt minus voluptas voluptas iusto mollitia cum et tempora.', 'Dignissimos dolores non est est. Tempore unde voluptatem sit similique. Rerum dolor ipsum sit et ut laudantium ipsa ipsa. In et dolores sed aspernatur. Perspiciatis est laborum nihil molestias et suscipit.', '109.80', NULL, 43, 1, 0, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(360, 30, 'Et quia velit', 'et-quia-velit-Y8bTa', 'S5HFB159', 'Cumque nulla in aliquid est totam omnis consequatur itaque et minima.', 'Laudantium eligendi deleniti natus expedita eligendi blanditiis nihil. In perferendis fuga qui nesciunt. Aperiam vel ducimus illo ad. Error et similique excepturi. Totam temporibus est corrupti omnis.', '286.67', '316.25', 136, 1, 0, NULL, NULL, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(361, 31, 'Et itaque qui', 'et-itaque-qui-YCwdI', 'DXAWKTME', 'Quis perferendis temporibus inventore laboriosam et accusantium explicabo corrupti.', 'Qui delectus nihil excepturi perspiciatis est. Laboriosam odit magnam libero perferendis. Sed quasi non impedit laboriosam esse officia. Autem illo in commodi est vel in.', '198.30', NULL, 173, 1, 0, NULL, NULL, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(362, 31, 'Et vero consequuntur', 'et-vero-consequuntur-Xep1Z', 'KYEFTNOP', 'Sit nostrum eos ipsa debitis doloremque officiis omnis at odio voluptatem et.', 'Corrupti est repudiandae perspiciatis omnis reprehenderit non veniam. Fugit tempora temporibus numquam sit vero. Fuga tenetur et molestiae. Nostrum maxime voluptatem sunt et rerum facilis dolorem quidem.', '35.14', '58.71', 36, 1, 0, NULL, NULL, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(363, 31, 'Ipsum est corporis', 'ipsum-est-corporis-XxC3f', 'PMZRCH5F', 'Eum at distinctio est qui qui et non ea nostrum vel aperiam sit officia ut.', 'Nostrum quis non autem ipsa enim quae minima id. Impedit dignissimos nostrum esse et id deleniti optio a. Ut eum eius sint adipisci distinctio. At ducimus deleniti omnis. Earum omnis culpa magni minima vel et. Enim ipsum sit vitae iure numquam quia.', '210.96', '245.26', 26, 1, 1, NULL, NULL, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(364, 31, 'Excepturi quia vero', 'excepturi-quia-vero-Ubkwv', 'RXQAEYEF', 'Doloribus fugit repudiandae autem aliquam itaque totam nemo officiis.', 'Perspiciatis est ex iusto voluptatibus hic non. Temporibus aut laborum natus et distinctio ut. Possimus est et nemo eaque sit. Aut sunt ut maxime sit et deserunt molestiae rerum.', '83.35', '115.00', 80, 1, 1, NULL, NULL, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(365, 31, 'Consequuntur ut voluptatem', 'consequuntur-ut-voluptatem-WOf24', 'NMPEYBJX', 'Nihil sed molestias aliquam optio sint voluptatem voluptatem.', 'Asperiores doloremque enim occaecati inventore odio quia. Ut distinctio ducimus et quisquam fugiat optio accusantium corporis. Illum architecto sed neque. Numquam fugiat eum quae voluptas.', '204.26', NULL, 106, 1, 0, NULL, NULL, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(366, 31, 'Aliquid quam necessitatibus', 'aliquid-quam-necessitatibus-QRbob', 'KZZBGOLX', 'Minima alias est vel molestias minus cumque recusandae sunt hic.', 'Deserunt voluptate voluptate maiores dolores. Doloribus consectetur facilis qui ut sed. Nam est blanditiis nulla explicabo omnis consequatur. Dolores in explicabo suscipit dolorem voluptatem quibusdam.', '252.57', NULL, 151, 1, 0, NULL, NULL, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(367, 31, 'Quis magnam quo', 'quis-magnam-quo-VYs2Z', 'Y3W0U8TC', 'Quis qui tempora molestiae commodi molestiae et mollitia doloribus ducimus officiis vitae ut maiores reiciendis est.', 'Aspernatur officia fuga et aut voluptas asperiores est. Nam laudantium neque rerum. Aut earum cumque et ipsam quia soluta. Esse dolorem et consequatur doloribus delectus. Sit quia explicabo distinctio aut.', '57.79', NULL, 60, 1, 0, NULL, NULL, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(368, 31, 'Unde reprehenderit qui', 'unde-reprehenderit-qui-xDWBr', 'HL7JEEB3', 'Debitis cumque veniam ullam a omnis sequi veniam itaque nihil incidunt dolorum enim qui ex deleniti.', 'Laboriosam rem eius ab vitae excepturi. Voluptatem dignissimos ut eligendi. Voluptas molestias perspiciatis aut inventore quos temporibus. Voluptatibus cupiditate asperiores id quod.', '238.77', NULL, 159, 1, 0, NULL, NULL, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(369, 31, 'Tenetur enim magnam', 'tenetur-enim-magnam-04K2F', '6FMELSC8', 'Corporis eveniet maiores recusandae harum non atque corrupti sint mollitia.', 'Reiciendis ea blanditiis quis iusto. Aut cum pariatur autem nemo et. Non animi necessitatibus est delectus minima repudiandae beatae accusamus. Magni eveniet praesentium mollitia omnis nostrum quia. Enim eaque expedita qui voluptatum fuga odio maxime exercitationem.', '261.18', NULL, 58, 1, 0, NULL, NULL, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(370, 31, 'Eaque rem esse', 'eaque-rem-esse-eEEdT', 'VBPNFTMJ', 'Quo distinctio aut est dolorem magni possimus accusantium.', 'Libero praesentium nobis voluptas optio incidunt. Voluptatem fugiat omnis repellendus. Sint consequatur eligendi esse soluta. Non et eveniet eaque. Aut perspiciatis porro minima sed corrupti voluptatum iusto.', '6.98', NULL, 142, 1, 0, NULL, NULL, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(371, 31, 'Autem dolor accusamus', 'autem-dolor-accusamus-7ULM3', 'PGJTDKC8', 'Error cumque iste fugiat cum libero occaecati ad veniam et.', 'Maiores ut voluptate maiores dignissimos sint. Possimus ipsum consequuntur beatae aut nam. Sapiente ipsum ipsum ut sunt omnis laborum incidunt. Perferendis id earum iusto.', '42.06', NULL, 161, 1, 0, NULL, NULL, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(372, 31, 'Quaerat harum repellendus', 'quaerat-harum-repellendus-BwFI3', 'BTE0H7HP', 'Nemo laboriosam ut delectus facilis reprehenderit et at accusantium optio expedita.', 'Maiores cumque at doloremque voluptatibus modi autem. Laboriosam laborum aut earum asperiores velit dolorem quia neque. Accusamus fuga recusandae explicabo perferendis ea dignissimos sit earum.', '64.35', NULL, 126, 1, 0, NULL, NULL, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(373, 32, 'Esse ut doloremque', 'esse-ut-doloremque-Le7A5', '1EGIG33P', 'Qui sapiente sed dolor alias ut eos non enim enim eos et iste illum est qui.', 'Eos eum ipsa at rerum veniam quasi ut. Delectus quod et ex quo fugiat qui. Adipisci qui asperiores beatae rerum. Molestias quo in veniam dolor magni deleniti sequi. In sunt recusandae amet autem. Est qui aut fuga delectus at.', '104.11', NULL, 17, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(374, 32, 'Sapiente corporis rerum', 'sapiente-corporis-rerum-W58FY', 'T6HAENVK', 'Et commodi itaque qui nemo eos hic ipsa aut error eum aut ipsum culpa.', 'Perspiciatis modi eligendi magni voluptates dolorem et aut fugit. Similique molestiae eos qui iure culpa iure. Dolorem non aut qui recusandae ipsa pariatur. Eos nobis illo distinctio quia dolore aut reiciendis. Id labore laudantium sed consequatur dolore.', '62.52', '107.77', 48, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(375, 32, 'Dignissimos assumenda fugiat', 'dignissimos-assumenda-fugiat-Lvo6W', 'SHE6CPKT', 'Distinctio inventore aut sit delectus iusto laudantium sunt officia.', 'Et cum rerum iure provident similique qui illo. Consequatur est animi et maxime nihil laboriosam. Eveniet ipsa vero eum aperiam. Doloremque debitis voluptas a deleniti dolores non maiores.', '75.36', '97.55', 194, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(376, 32, 'Exercitationem ut vel', 'exercitationem-ut-vel-FagiG', '1DGADDT2', 'Blanditiis suscipit blanditiis qui placeat neque iste occaecati tempora consectetur eaque fugiat perferendis ducimus.', 'Reiciendis voluptas animi voluptate iusto aliquam alias molestiae. Deleniti sint exercitationem quis et natus. Nihil nihil dolores occaecati doloremque voluptatem. Repellat est nesciunt quos laborum.', '85.48', NULL, 169, 0, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(377, 32, 'Aut eius reiciendis', 'aut-eius-reiciendis-6XmGK', 'S7MZ1P6D', 'Quasi fugit praesentium velit et ut facere voluptas nihil consectetur aut non.', 'Ipsam odio officiis distinctio ex officia numquam incidunt. Et velit occaecati nisi vitae voluptatem. Esse aliquam et architecto itaque dolore nihil.', '132.23', NULL, 184, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(378, 32, 'Quo unde nihil', 'quo-unde-nihil-lOiT9', 'ZINDIM3H', 'Enim est nemo quo odio accusantium aut rerum.', 'Aspernatur in deleniti ut consequuntur doloremque quod eum. Qui et sed alias. Et sit autem rerum quo id aperiam velit numquam. Laboriosam suscipit exercitationem ut qui beatae perspiciatis veniam quibusdam. Maxime sint dolores et eum.', '216.60', NULL, 28, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(379, 32, 'Consequatur id enim', 'consequatur-id-enim-zUANQ', '5N4IZGKG', 'Accusamus ullam voluptatem enim delectus soluta repellendus rerum reiciendis voluptatem totam.', 'Molestias est illo voluptate placeat qui iusto vel. Deleniti sapiente repudiandae eum aut. Dolores eligendi hic ad natus odio.', '125.92', NULL, 93, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(380, 32, 'Aut dolor illum', 'aut-dolor-illum-ec5p2', 'KVRAKZI1', 'Minima porro quaerat aliquid sunt odio perferendis eveniet laborum.', 'Rerum fuga qui rem adipisci dolor rerum sapiente error. Itaque aut quidem voluptas nihil. Amet dolor eum ut sunt eligendi inventore voluptas. Reprehenderit nostrum explicabo recusandae neque vel. Sit ipsa minus vero nulla quod.', '119.13', NULL, 153, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(381, 32, 'Aut similique aut', 'aut-similique-aut-sUbN8', 'CXL53GPO', 'Rerum exercitationem facilis pariatur ea autem sint et numquam.', 'Expedita sed rerum sit ea et sunt explicabo officia. Culpa qui iste harum vel aliquid eveniet. Sit fugiat assumenda laudantium in aliquam perspiciatis dolores. Neque praesentium blanditiis odit veniam.', '61.58', NULL, 51, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(382, 32, 'Quam dicta voluptates', 'quam-dicta-voluptates-8h6UJ', 'AIPGHKB7', 'Illo consequatur velit mollitia et laboriosam animi laudantium ut enim.', 'Iste eius et cum velit. Soluta porro minima veniam porro omnis. Ab tempore repellendus ducimus praesentium.', '155.77', NULL, 160, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(383, 32, 'Ullam quidem alias', 'ullam-quidem-alias-7x6nK', 'OIHEXK5L', 'Placeat veniam sint qui aut dolorem quia consequuntur temporibus voluptates est autem quae.', 'Nesciunt ipsa ducimus possimus aliquid deserunt. Nobis veritatis officiis non inventore eveniet minima. Facere ipsa quod voluptatem sint. Alias pariatur facilis enim porro.', '129.37', NULL, 20, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(384, 32, 'Quae impedit molestias', 'quae-impedit-molestias-Eewam', 'MAADL6VT', 'At explicabo saepe dolore doloribus optio sunt asperiores sit quo dignissimos magni commodi quia deleniti quae voluptatibus.', 'Fugiat qui et et dicta id placeat. Delectus veniam quia fuga et aut eius. Suscipit eos est nobis eveniet. Ad consequuntur molestias ad error sed.', '58.46', NULL, 87, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(385, 33, 'Odio et laboriosam', 'odio-et-laboriosam-AeE1h', 'ONPDBBUE', 'Exercitationem doloribus aliquid ut veritatis vel voluptas nam.', 'Enim consequatur veniam numquam minima id. Quia eligendi quos ratione est ipsum aut eligendi a. Quia maiores nesciunt et sit non animi odit. Et facere quis tempore veritatis aut. Nisi odit facilis autem unde.', '197.59', NULL, 151, 1, 1, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(386, 33, 'Nobis cumque rerum', 'nobis-cumque-rerum-0OMv3', 'EZJ4TOHD', 'Aut et maxime dolor accusamus et vel quod.', 'Veritatis totam ut voluptas dolore. Rerum saepe a eos nisi asperiores eaque. At quia libero nemo. Nesciunt possimus repudiandae exercitationem omnis molestiae. Iusto error est omnis sit rerum. Alias provident quod in impedit.', '223.30', NULL, 157, 1, 1, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(387, 33, 'Quaerat blanditiis veniam', 'quaerat-blanditiis-veniam-fItxI', 'MZEG09K8', 'Numquam qui numquam et voluptatum error libero quis earum.', 'Aut voluptatem incidunt odio natus non magni. Deleniti labore fugit odit ut similique. Omnis omnis est non mollitia. Atque voluptatem et et fuga qui reiciendis et.', '13.90', NULL, 122, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(388, 33, 'Sint velit et', 'sint-velit-et-noDuP', 'SIM7RWJN', 'Molestiae dicta tempora eaque nesciunt quia iusto impedit.', 'Expedita et consequuntur est dolore. Laboriosam nisi ut animi consequatur consequatur. Ducimus enim quam vel soluta provident maxime ad. Hic est nesciunt cum eius. Totam voluptas totam voluptas.', '17.42', NULL, 149, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(389, 33, 'Exercitationem praesentium sit', 'exercitationem-praesentium-sit-caKOr', 'HLRXTGHO', 'Molestias delectus veritatis eveniet rerum id quisquam dolorum necessitatibus doloremque omnis dolor dolores aut provident aut.', 'Tempore rerum ad quibusdam dicta incidunt. Ad non repudiandae nisi eligendi libero ullam et. Ea aut molestiae enim eveniet cum. Commodi provident repellat aut ut quaerat deserunt non.', '20.84', NULL, 167, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(390, 33, 'Incidunt rerum incidunt', 'incidunt-rerum-incidunt-7vstX', 'LX5Y60PI', 'Delectus mollitia quis accusantium quibusdam id fugiat sunt est minus blanditiis eum animi voluptatem quidem.', 'Et quod voluptas fugit qui enim laudantium fuga et. Voluptatum eligendi in ea dolorem. Consequuntur qui et consequuntur hic. Assumenda vitae soluta itaque quasi ea.', '32.01', NULL, 66, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(391, 33, 'Quam ipsa quas', 'quam-ipsa-quas-qipto', 'X0P2R47G', 'Iure aliquam quam fugiat ipsum pariatur animi in incidunt facilis est.', 'Inventore maiores praesentium sit autem doloremque. Sed nemo quidem sit autem a nobis. Quidem quas ea harum sit sed optio hic. Quia odit saepe exercitationem minima. Dolorem earum expedita consequatur eligendi. Dignissimos officia doloribus et fugit enim sed.', '98.20', NULL, 82, 0, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(392, 33, 'Ducimus voluptate qui', 'ducimus-voluptate-qui-hnl0p', 'ORKDOI6V', 'Culpa eos quam illo saepe ea molestias magnam et fugit ut quia quibusdam repudiandae a totam consequatur.', 'Impedit quia saepe cupiditate dolor culpa in nesciunt eos. Saepe perferendis quas consequuntur ea ut earum dolor dicta. Aliquam laborum et nesciunt dolores. Quasi qui officiis eius perspiciatis.', '162.73', '199.90', 22, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(393, 33, 'Officiis perferendis debitis', 'officiis-perferendis-debitis-gEMlZ', 'NTXBUCEX', 'Facere expedita hic et sed doloremque amet est dolor quia consectetur et delectus.', 'Et atque asperiores dolores dolore molestias repellat. Praesentium et est quasi nisi labore. Maxime corrupti veniam modi quia. Pariatur voluptatem sed officia libero dolorem quis.', '59.84', NULL, 158, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(394, 33, 'Animi sapiente occaecati', 'animi-sapiente-occaecati-xf7yL', 'MSTWCNZJ', 'Reiciendis officia voluptatem sunt aut commodi aliquid tenetur fugit.', 'Est saepe possimus et rem. Praesentium cum porro itaque sit quisquam. Aut sint quaerat incidunt voluptatem quos quo. Sit eligendi et molestiae aliquam optio aut.', '224.94', NULL, 120, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(395, 33, 'Optio modi possimus', 'optio-modi-possimus-VDtFv', 'TA8SRIMT', 'Sapiente a deleniti voluptatum quasi autem doloremque quis quas quos tempora et.', 'Rerum odio quia labore quia explicabo et quam. Nesciunt praesentium rerum quae dolorem iste illum. Reiciendis sit nemo tenetur rerum voluptatum blanditiis omnis. Et repudiandae animi illo architecto sit tempora aut repellat. Vitae qui aut facere in cum est. Repellat dolorum vel fugiat aperiam aliquam delectus alias.', '27.79', '67.91', 177, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(396, 33, 'Et rerum ad', 'et-rerum-ad-vFMe5', 'M0THLJ4P', 'Ea dicta fugiat qui dolor consequatur consequatur minima sint.', 'Aut voluptatem eligendi libero iure voluptas. Harum nihil expedita quaerat eos at perspiciatis. Et enim aut dolores numquam illo magni hic. Dolorem voluptas et ratione cupiditate occaecati error. Aut ex voluptatem nostrum dolores qui id est.', '22.08', '31.26', 15, 1, 1, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(397, 34, 'Perferendis omnis ea', 'perferendis-omnis-ea-kQ9E1', 'MSWYDCIL', 'Sint ut doloremque quidem vitae quo voluptatem tenetur quas non aperiam eius molestiae sit et nobis nulla.', 'Non fugit consectetur ipsum iure provident impedit mollitia. Quibusdam dolorum non mollitia aspernatur. Ut ea et aliquam et architecto aspernatur aliquam. Quod et est id nam. Non doloremque eius ut doloremque esse perferendis. Asperiores temporibus quaerat omnis et labore delectus.', '273.80', NULL, 35, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(398, 34, 'Sunt a id', 'sunt-a-id-s0U8d', '3P5HV7QS', 'Modi cum ab fugiat tempora quasi dignissimos ullam dolor in harum.', 'Consequatur autem sit tempora est distinctio et saepe. Sit in dolores nisi molestias voluptates quod cumque. Assumenda placeat et sed quis consequatur odio maiores. Ab soluta fugiat dolorem sit sit. Eos nihil ducimus aperiam qui omnis voluptatem.', '182.75', NULL, 185, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(399, 34, 'Non recusandae dolores', 'non-recusandae-dolores-UBLrh', 'I4IY9OAT', 'Culpa explicabo enim atque eum quia in sit labore minus doloremque quaerat voluptate molestiae illo nisi amet.', 'Odio quidem nisi mollitia soluta aliquam ut. Odio veritatis sed ut animi eos sint. Eveniet tempora sit ab ad ut quod. Voluptatem voluptatem veniam est sunt repellendus veniam deserunt est. Natus sequi nesciunt laborum blanditiis. Et ut provident quisquam dolores saepe laudantium.', '85.53', NULL, 16, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(400, 34, 'Sed provident recusandae', 'sed-provident-recusandae-BP0Z1', 'YPOVYOZY', 'Illo consequatur cupiditate ut doloremque impedit sunt maiores sed repellat vel dicta.', 'Eius similique temporibus sit aliquid. Harum eos non dicta reprehenderit veniam. Nemo veritatis hic neque quis. Ut quidem et odio omnis.', '207.43', NULL, 115, 1, 1, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(401, 34, 'Possimus maiores ipsum', 'possimus-maiores-ipsum-hiMyk', 'WJWQPVHI', 'Consequatur porro harum suscipit quaerat aut iure pariatur sunt sint neque ut enim cum reprehenderit qui.', 'Dolore iusto harum temporibus. Dolorem tenetur ipsa minus vel quaerat commodi sed. Quia maxime quo iste ut temporibus et consequuntur. Est sapiente iste dicta cupiditate consequatur qui distinctio. Tempora voluptate magni ratione ab. Adipisci tempora qui quia impedit fugiat aut a.', '165.67', '191.93', 126, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(402, 34, 'Aliquam non totam', 'aliquam-non-totam-lFv9p', 'WTWEYP9B', 'Velit est quia cumque qui voluptatibus cumque occaecati ducimus esse tempora sit porro est fugiat aut.', 'Et est incidunt similique quia quia voluptatem. Non animi at distinctio unde. Laborum nesciunt provident doloremque doloremque debitis. Veniam autem quaerat dolor non fugiat vel sit.', '239.33', '273.53', 6, 0, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(403, 34, 'Quia est corporis', 'quia-est-corporis-H4a09', 'IQOYHFYA', 'Magnam deserunt eligendi velit nulla sint id vero pariatur repudiandae necessitatibus quibusdam quia.', 'Tempora ut molestiae ea autem facere sequi. Beatae eos temporibus labore facilis placeat delectus. Alias et qui quam et sequi.', '93.61', NULL, 84, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(404, 34, 'Quia sapiente labore', 'quia-sapiente-labore-R1JS7', 'OCESQN2E', 'Autem eligendi et quaerat id velit voluptatum rerum in non sed voluptates sunt in ut sapiente qui.', 'Ipsum excepturi nihil laudantium optio unde. Est repellendus veniam numquam optio nisi tempora. Aut eaque officiis perferendis deserunt. Id mollitia esse corrupti et debitis animi id. Facilis animi libero sit sint.', '290.11', NULL, 123, 0, 1, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(405, 34, 'Neque rerum nihil', 'neque-rerum-nihil-TZpuh', 'B3S4DYAZ', 'Quaerat aliquam minima sed architecto sequi neque dolorum.', 'Aliquam excepturi consequatur nulla rerum dolor ullam. Veritatis illo aut facere commodi neque dolore. Eos nihil itaque esse nulla illum.', '240.27', '268.19', 20, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(406, 34, 'Accusantium omnis dolores', 'accusantium-omnis-dolores-xjlLG', 'MQOBOYME', 'Perferendis quo natus odit ducimus quae aperiam optio veritatis possimus sit voluptatem et.', 'Et et dolore ut laboriosam. Quos similique eos quo consequatur. Nihil ea et accusantium quam illo blanditiis. Accusamus in consequatur eos consectetur. Ducimus atque minima optio numquam rerum. Nulla laboriosam accusamus vero.', '230.27', NULL, 151, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(407, 34, 'Dolores eius eos', 'dolores-eius-eos-oyBK5', 'IVJ1SX85', 'Qui aliquam nulla sed qui et necessitatibus illo id maxime ullam molestias.', 'Recusandae qui doloribus veniam facere placeat pariatur. Esse culpa et ut ea est. Doloremque et at totam debitis.', '174.97', NULL, 68, 1, 1, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(408, 34, 'Vel officia eveniet', 'vel-officia-eveniet-3AKRU', 'IPFLSTZ3', 'Ut nihil occaecati ipsam harum et repudiandae ipsum velit.', 'Delectus ut molestias autem. Perspiciatis minima occaecati aperiam voluptas laudantium dolorem. Saepe qui non a odit sint amet. Soluta veritatis repellendus maxime ut fugiat corporis deleniti. Voluptatem voluptas non esse ad. Itaque explicabo qui velit quo molestiae quidem iure.', '211.54', NULL, 81, 1, 0, NULL, NULL, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(409, 35, 'Enim voluptatibus odit', 'enim-voluptatibus-odit-8LDsH', 'I0C0FKR9', 'Aut voluptatem itaque magnam dolorum at itaque architecto assumenda autem omnis quo alias dicta quisquam adipisci.', 'Blanditiis magnam enim autem. Rerum omnis non quae recusandae aut eveniet libero. Dolorem id enim ut in maiores. Iste beatae modi minima.', '32.79', '63.16', 14, 1, 0, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(410, 35, 'Nesciunt nemo rerum', 'nesciunt-nemo-rerum-9eKu8', '5ZBRNZ0V', 'Corporis officiis est odio sunt voluptas vero omnis.', 'Error quia earum ex assumenda alias ad voluptas. Inventore atque similique architecto dolores sed vel atque. Quo esse culpa officiis doloremque beatae quis animi labore.', '287.18', NULL, 124, 1, 0, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(411, 35, 'Facere officia dolores', 'facere-officia-dolores-B0YAE', 'RXUEFMXL', 'Autem et placeat qui nostrum voluptas eveniet sit porro cumque enim.', 'Nemo et officia molestiae pariatur quidem quia unde. Ut et vitae laboriosam provident alias. Earum quasi asperiores amet tempore nam. Et maiores magni aperiam tempora voluptates temporibus hic. Tempore vel dignissimos ratione recusandae qui quasi.', '125.45', NULL, 84, 0, 0, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(412, 35, 'Non molestiae non', 'non-molestiae-non-EtblF', 'TNMOX33M', 'Dolores quam et delectus molestiae nesciunt eaque quibusdam qui eaque tempora similique et ut.', 'Earum quibusdam debitis autem eligendi dignissimos autem. Vitae dolore et ut et. Aspernatur eos distinctio harum qui voluptates. Maxime qui dicta esse animi voluptatibus. Temporibus assumenda ut ut molestiae. Est quia iusto laborum consequatur fugit iusto.', '294.28', NULL, 176, 1, 1, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(413, 35, 'Tempore harum repudiandae', 'tempore-harum-repudiandae-pxLMy', 'XW9KXXLU', 'Excepturi ut pariatur totam corrupti explicabo ratione et est deleniti ipsum eligendi cumque eos.', 'Eos qui soluta eveniet. Quae exercitationem inventore ut vitae. Nesciunt rerum quo dolores qui dolore sequi sit qui. Animi velit eos ea asperiores.', '244.91', NULL, 81, 0, 1, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(414, 35, 'Autem iusto qui', 'autem-iusto-qui-x8sBv', '8SGQ887Q', 'Enim cum temporibus iusto dolor ipsa maiores ut incidunt repudiandae.', 'Fugiat explicabo iure impedit nesciunt assumenda vitae. Dolor aut qui illo eveniet placeat illo. Enim asperiores ut nesciunt ea. Eum blanditiis praesentium tempore adipisci et est molestiae. Deserunt tempora officiis a cumque aut.', '71.38', NULL, 79, 1, 0, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(415, 35, 'Soluta enim architecto', 'soluta-enim-architecto-JHe8P', 'MCOPC9IF', 'Doloribus corrupti in occaecati qui enim sequi quisquam perspiciatis est eum voluptatibus nulla dignissimos ut.', 'Est placeat et architecto fugiat consequatur numquam ut doloremque. Ut voluptas non occaecati recusandae non libero facilis. Eum sed corporis sunt itaque dolor ad. Sint rem consequatur occaecati nemo. Id iure tenetur consectetur ipsum.', '47.06', '83.45', 111, 1, 1, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(416, 35, 'Autem illo modi', 'autem-illo-modi-BOyAn', 'GWTMEGUI', 'Facere commodi non neque consectetur rerum labore ut molestiae dolor minima aliquid et ipsa et.', 'Libero reprehenderit et non consequatur. Nemo quisquam eaque eaque unde est reprehenderit. Et nobis voluptatibus quia. Qui voluptates iure non suscipit reiciendis placeat. Ab quia nam assumenda labore est tenetur ipsa.', '201.29', '236.21', 125, 1, 0, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(417, 35, 'Exercitationem ut dolore', 'exercitationem-ut-dolore-QUrZj', '59JLXTZG', 'Quibusdam enim voluptatibus ut autem molestias dolor ipsam quia unde sint unde repudiandae alias.', 'Quisquam quibusdam ipsam earum vel cum sequi dolores dicta. Hic aperiam excepturi est tempore. Necessitatibus quod vel et incidunt commodi aut occaecati. Assumenda veniam non cum. Ab in eveniet aut rerum qui quisquam et. Esse sit officia ducimus est.', '203.01', '225.41', 0, 1, 0, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(418, 35, 'Quibusdam est sit', 'quibusdam-est-sit-wPwLz', 'W0IHIBD6', 'Qui voluptatem quia quidem qui architecto dolorum veniam veritatis fugit id illum.', 'Quia aut nam reiciendis eveniet. Provident expedita architecto sit dolorum ab dolores et. Nam id natus autem eius. Rerum illo non omnis eum voluptas fugiat labore. Amet nemo et fuga eos.', '225.35', NULL, 66, 1, 0, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(419, 35, 'Deserunt commodi ratione', 'deserunt-commodi-ratione-6mlMH', 'OXAU74GT', 'Quos dolore quasi eius quas enim nemo vero.', 'Provident velit dolor vel perspiciatis quia voluptas. Ullam officiis labore aut nihil optio ut. Voluptas dolor nisi maxime est rerum quaerat repellat.', '284.90', NULL, 93, 1, 0, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(420, 35, 'Et velit perspiciatis', 'et-velit-perspiciatis-zk9KC', 'JDAP4BYQ', 'Optio minus placeat natus nihil perferendis temporibus ab voluptatibus cumque nihil est voluptatibus animi cupiditate in.', 'Quia explicabo est asperiores soluta magnam quae. Ut ex libero laborum asperiores eligendi voluptates. Corrupti non voluptatem deserunt odio aspernatur quidem reiciendis. Assumenda tempora temporibus reiciendis quo enim eveniet quia perspiciatis. Cum et nihil laborum error.', '155.77', NULL, 103, 1, 1, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(421, 36, 'Quis dicta omnis', 'quis-dicta-omnis-8szK9', 'S3DBPP79', 'Eos fugit adipisci aliquid commodi adipisci voluptates id odio.', 'Impedit accusantium illo qui dolorem non et a magnam. Voluptatem a temporibus nihil voluptatem quidem alias pariatur possimus. Fugiat recusandae molestiae perspiciatis accusamus. Voluptatibus est at ipsum velit harum.', '21.75', NULL, 68, 1, 0, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(422, 36, 'Sed magnam dolores', 'sed-magnam-dolores-vRY18', 'HP47NHMG', 'Doloremque repudiandae amet est dolore fugit rerum quo quia aut quis doloremque earum libero aut in.', 'Et ab quod esse facere. Aut minus sed placeat delectus sapiente recusandae quisquam. Suscipit sunt eaque numquam voluptatem corrupti excepturi. Dolorum facilis sequi impedit nihil accusantium dolores eveniet. Nihil et dicta labore animi temporibus facilis.', '276.15', NULL, 15, 1, 0, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(423, 36, 'Neque veniam eos', 'neque-veniam-eos-FnyrK', 'JOEWPW0D', 'Iusto praesentium recusandae ut sed voluptatem maiores eos eligendi aperiam.', 'Suscipit tempore corrupti dolores qui. Mollitia laboriosam aut sapiente expedita qui quisquam. Sint atque iusto culpa dolorem consequuntur velit.', '33.40', NULL, 114, 1, 0, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(424, 36, 'Sunt fugit voluptatem', 'sunt-fugit-voluptatem-KAnx6', 'ZZEOLOLC', 'Vel quaerat praesentium molestiae commodi tempora enim occaecati optio iusto tempora voluptatum tempore.', 'Nihil tempore nemo optio. Molestias quae quae voluptatem. Accusamus dolores voluptas quae quia. Animi omnis rerum eligendi amet est. Enim aut velit rerum sit repellendus error voluptates. Assumenda explicabo voluptas quia at ut similique distinctio accusantium.', '135.37', NULL, 25, 1, 0, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(425, 36, 'Ex enim magni', 'ex-enim-magni-v0meJ', 'WLAEVSIU', 'Ut repellendus sed omnis expedita aut repellat libero eveniet provident sed sit minus enim labore.', 'Sed suscipit quo maiores magnam voluptas maiores fugiat maxime. Qui dolor aut et in. Sed repellendus molestias iure perferendis nisi voluptatem fugiat. Omnis eos quia deserunt dicta maiores.', '32.86', NULL, 185, 1, 0, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(426, 36, 'Voluptas fugit et', 'voluptas-fugit-et-OHHL3', 'IH3MN782', 'Minus quia sint itaque sit cumque nostrum odit libero corrupti eius veritatis rerum laudantium.', 'Ut ex dolores non voluptatem rerum. Sunt quo hic debitis. Dolor omnis quia non voluptas. Ut corrupti unde exercitationem esse doloremque quia eum. Harum sed officiis veritatis aperiam sed facere tempore.', '72.81', '74.11', 172, 1, 0, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(427, 36, 'Beatae ut est', 'beatae-ut-est-0ktsV', 'TYBX5IMX', 'Aspernatur dolorum dolore aspernatur id illo soluta ipsum et autem harum laboriosam et.', 'Sapiente nulla adipisci veniam ut sit tempora reiciendis occaecati. Quod maiores voluptate recusandae. Eos aut nobis ad veritatis asperiores. Rerum iusto rerum deserunt nam et sunt. Molestiae dolores nisi quasi non nisi rerum. Dolor voluptatibus excepturi nihil dolorem magnam.', '5.79', NULL, 76, 1, 1, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(428, 36, 'Repudiandae iure neque', 'repudiandae-iure-neque-dSrlR', 'R1PVWVWL', 'Facere rem non nisi quidem totam molestiae animi repellat natus inventore porro natus et et.', 'Labore at voluptatem odio non. Repudiandae aspernatur corrupti facilis excepturi odit. Ut ab qui in odit dolorum consequatur. In iste eligendi facilis quod assumenda. Et culpa quaerat illum.', '28.20', NULL, 129, 1, 1, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(429, 36, 'Nihil iste est', 'nihil-iste-est-Fbyfj', 'RJPWSBC3', 'Quos est illum veritatis est quo placeat ab.', 'Similique animi voluptatibus et. Minus ab perferendis qui adipisci ipsum recusandae. Nam sunt quas sed ipsum facilis explicabo qui. Iusto et ipsa corrupti qui et esse amet quae. Magnam autem dolores sed ut dolorem vitae maxime.', '277.69', NULL, 180, 1, 0, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(430, 36, 'At deserunt similique', 'at-deserunt-similique-VlE4e', 'VMIDSSTV', 'Iusto placeat dolorem et quia est placeat deserunt aut a doloribus et ut.', 'Velit et et perspiciatis. Esse perferendis sit soluta cupiditate ex cupiditate libero accusantium. Itaque aspernatur ea perferendis ullam. Nihil ipsam fuga accusantium sapiente numquam porro occaecati. Enim dignissimos similique omnis veniam repudiandae.', '67.75', '69.47', 25, 1, 0, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(431, 36, 'Quisquam tenetur est', 'quisquam-tenetur-est-5Cr6e', 'SCHAGBAZ', 'Doloribus autem quia maiores unde tempora vel quisquam quod nemo sit alias aliquid reprehenderit et.', 'Quos voluptas magnam consequatur error dignissimos. Atque aut illum quam magnam sed. Magnam optio accusantium explicabo ut repudiandae eos quia. Incidunt et vero et laborum nesciunt quae.', '228.93', NULL, 93, 0, 0, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(432, 36, 'Amet maxime rem', 'amet-maxime-rem-FmbO3', 'BJ4O5KXT', 'Eius recusandae blanditiis sint et aut qui maiores quasi minus architecto dolorem est autem quos.', 'Vitae dignissimos culpa necessitatibus pariatur qui magnam. Qui ad labore quis. Et ratione qui vel id libero in enim. Sit maiores vel sint rem porro praesentium.', '85.65', '111.51', 6, 1, 0, NULL, NULL, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(433, 37, 'Ullam et molestiae', 'ullam-et-molestiae-a12Jz', 'ZEH0WRDW', 'Fuga sequi voluptas ducimus quia iusto qui voluptatem facere.', 'Eum temporibus qui rerum nostrum. Blanditiis qui sint quae placeat autem repudiandae. Explicabo excepturi eum consequuntur suscipit commodi labore vel.', '281.79', NULL, 175, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(434, 37, 'Aut voluptatum aut', 'aut-voluptatum-aut-Aqq87', 'O24XIMQA', 'Sit reiciendis numquam soluta et labore praesentium non optio quasi quam vel ipsa voluptas maxime nihil.', 'Odio quae et totam porro doloribus maxime est. Cum et quibusdam ut et nisi et quia. Quidem suscipit architecto omnis voluptatum.', '73.20', '91.62', 73, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(435, 37, 'Excepturi amet ullam', 'excepturi-amet-ullam-vVr0I', 'UAFOFZZO', 'In temporibus enim et doloremque est vel temporibus natus distinctio sit perferendis iste voluptas rerum amet enim.', 'Est quasi similique odio alias enim. Officia voluptas sequi quibusdam consequatur quis animi. Asperiores omnis itaque quis reiciendis aliquid. Sed autem debitis omnis nobis aliquid at qui. Natus recusandae aut aut sunt vero. Aliquam exercitationem voluptatibus modi quos.', '79.83', NULL, 56, 1, 1, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(436, 37, 'Velit qui quo', 'velit-qui-quo-AwkSj', 'FKL9EVH3', 'Optio assumenda doloribus rerum aut sed eaque et inventore et expedita alias quaerat ex soluta et.', 'Id sint facilis reiciendis placeat ut. Ea possimus eum ex esse. Itaque et ut vel distinctio. Voluptatem et aut esse ut porro.', '135.62', NULL, 70, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(437, 37, 'Ut et debitis', 'ut-et-debitis-c8j43', '4BL2A3M0', 'Officiis sed explicabo aspernatur accusantium autem nihil asperiores distinctio aut.', 'Vero molestiae natus quae et quo. Et ea itaque tempora ut natus consequuntur. Accusantium ut nobis aperiam non reprehenderit. Ut voluptas error ut eius quasi dicta.', '154.72', NULL, 183, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(438, 37, 'Neque consequuntur non', 'neque-consequuntur-non-e29et', 'STZMUX7C', 'Enim enim voluptas delectus sed rerum et necessitatibus nihil eaque accusamus hic quod laboriosam natus molestiae.', 'Repudiandae dolorum voluptas ut pariatur quo. Sunt quasi quos omnis ipsam fuga voluptatibus ipsa. Quo quia sapiente eaque dolore. Quas nihil vel temporibus aut. Facere omnis possimus dolore saepe est. Animi facere rem quos corporis consequuntur deleniti facilis.', '125.38', '170.33', 113, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40');
INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `sku`, `short_description`, `description`, `price`, `compare_at_price`, `stock`, `is_active`, `is_featured`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(439, 37, 'Animi illum repellat', 'animi-illum-repellat-EpBis', 'OTMZZLWM', 'Ea dolorem quod atque necessitatibus consectetur facilis vel corporis eveniet excepturi suscipit rem blanditiis.', 'Non aut dolor non et corporis. Impedit commodi labore qui expedita atque corporis. Dolor quidem quasi ipsa distinctio ullam sint. Laboriosam consequatur ea eum quisquam quaerat a.', '87.51', NULL, 199, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(440, 37, 'Et numquam iure', 'et-numquam-iure-y2CB0', 'FFRC2TZV', 'Sint ea repellat optio ducimus provident quibusdam dolor qui qui sit.', 'Voluptatem veritatis nesciunt a. Nostrum ea dolore nisi vel nemo sequi. Maxime dolor voluptates neque dolorum autem molestiae sed. Omnis necessitatibus aut odit aperiam. Est quis dolor reiciendis quo magnam et possimus rerum.', '131.14', NULL, 183, 0, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(441, 37, 'Magni laborum dolores', 'magni-laborum-dolores-LDjJD', '1EOBVSRC', 'Nemo reiciendis quaerat dicta provident hic pariatur voluptatem ut omnis velit.', 'Ab voluptas ut quia consequatur. Iusto ducimus molestiae laudantium blanditiis sunt. Maiores asperiores nulla debitis perspiciatis saepe. Temporibus veniam neque commodi aut et modi cumque. Iure explicabo et atque quia autem. Repudiandae sunt eum modi sed ab facere expedita possimus.', '258.01', NULL, 15, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(442, 37, 'Culpa est eligendi', 'culpa-est-eligendi-AVXRx', 'D06IQNW8', 'Eos est reprehenderit unde culpa aliquid quaerat aut qui ipsam ea corporis necessitatibus.', 'Accusamus totam voluptates ipsum. Dolorum earum et et sed sint itaque rerum porro. Enim ipsam quisquam repudiandae perferendis neque et et. Architecto commodi molestiae nisi ducimus aliquam.', '250.51', NULL, 131, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(443, 37, 'Ipsa necessitatibus vel', 'ipsa-necessitatibus-vel-XOV4M', '6XK8AFXV', 'Temporibus eligendi sed debitis blanditiis aut error nemo.', 'Ut et dicta est. Enim deleniti voluptate id alias nobis. Et modi nam debitis voluptate voluptas. Voluptas laborum laboriosam alias quaerat sint provident officia. Quia sed consequatur quo. Facere magni quis et expedita similique ab.', '166.74', '189.12', 44, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(444, 37, 'Molestias nulla inventore', 'molestias-nulla-inventore-JpKd3', '1TPO7QQD', 'Et dolore amet dolor est a eius eum aut ratione facilis et nisi quae delectus impedit.', 'Est fugiat iure laborum est. Iste in repellendus et aut vel repudiandae. Assumenda quia omnis voluptas magni hic temporibus laborum. Pariatur omnis dolorum fugit minima fuga quasi. Unde sequi amet ut. Sed non fugiat fuga ipsum corrupti perferendis et.', '238.24', NULL, 97, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(445, 38, 'Ut et corporis', 'ut-et-corporis-Zkmw1', 'GLKHJ1RU', 'Voluptas sequi fugit et id aspernatur in et qui similique nostrum et optio eligendi eius.', 'Sed sint quas animi explicabo accusantium aut iste. Sit officiis id hic error eius. Doloremque quidem rerum aliquam voluptas repellendus et maiores. Libero et maxime ex cupiditate ipsam sit blanditiis. Ipsum doloribus facere veniam iure.', '59.25', NULL, 89, 0, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(446, 38, 'Omnis aliquid sed', 'omnis-aliquid-sed-N6mKo', 'CQMNRXVV', 'Eligendi eligendi aperiam cumque optio iusto aspernatur ipsam veritatis debitis sit repellendus facilis.', 'Eos provident consectetur ipsum. Temporibus ea nihil illo voluptas architecto. Cum vitae ratione nisi voluptas qui voluptatum. Sit ipsam corporis dolorum.', '235.69', NULL, 172, 1, 1, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(447, 38, 'Labore aut itaque', 'labore-aut-itaque-z4ZCl', 'BX8TMYOK', 'Id est ut reprehenderit odit quam unde est quam non.', 'Officiis totam architecto non rerum magnam consequatur cum. Sed impedit ratione itaque et. Neque sed velit eum ducimus ducimus. Laudantium consequatur sed porro ut eius.', '200.94', '225.40', 155, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(448, 38, 'Nam quasi asperiores', 'nam-quasi-asperiores-bJbEU', 'MUQGKVDC', 'Nesciunt et fugiat excepturi vel quia similique veniam ut beatae rerum odio.', 'Sit voluptatem sed ratione. Ex quis cumque aut architecto. Omnis mollitia corrupti fugit eum. Ea voluptatem iste sunt et harum non ullam qui. Porro sed facilis esse odit dolores.', '229.36', '271.93', 189, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(449, 38, 'Asperiores fugit dolorem', 'asperiores-fugit-dolorem-oD00w', '9HSCLXEQ', 'Rerum quam similique fugit eaque eos vel voluptatem.', 'Voluptatem eum ex quia ut est nihil. Vel aut voluptatem sequi consequatur. Illo sed nesciunt magnam molestiae. Dolore voluptatem aliquid alias itaque facilis. Aut libero repellendus id ut explicabo aut beatae autem.', '155.83', NULL, 142, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(450, 38, 'Sit odit qui', 'sit-odit-qui-LukGQ', 'ED31SXTT', 'Itaque quo dignissimos saepe eos adipisci repellendus at maxime et molestiae id exercitationem quos expedita.', 'Quia et assumenda quia. Autem inventore facilis vitae ut veniam. Omnis vitae et voluptas atque velit. Facere animi consequatur provident ab aperiam. Sit aut vel iste expedita.', '193.27', NULL, 0, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-24 16:07:07'),
(451, 38, 'Ex iusto odio', 'ex-iusto-odio-scbVX', 'RKZPYEOS', 'Debitis aliquid eligendi doloribus iste consequatur non quia corrupti illum.', 'Voluptates provident est iste nulla fuga. Quaerat provident beatae nesciunt labore. Praesentium iusto eum nostrum. Repellendus sint deserunt tempore eaque possimus.', '168.04', NULL, 174, 0, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(452, 38, 'Et et ut', 'et-et-ut-koopX', 'VTCJGZRY', 'Libero laboriosam eius nam consequatur non velit qui est eveniet dolores facere distinctio molestiae saepe iure.', 'Sed qui dolorem qui quam accusantium. Nostrum cupiditate reiciendis facilis rerum qui reprehenderit. Illum ut saepe qui nemo omnis delectus ut.', '120.93', '138.60', 7, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(453, 38, 'Libero ut dolores', 'libero-ut-dolores-rDkVu', 'Q4IGKHH2', 'Aut ipsam consequatur ea quo sit ipsa accusantium doloribus voluptatem inventore.', 'Iusto eius earum aut et. Perferendis nesciunt nesciunt fugit voluptatem autem consectetur odio. Iure doloribus sint at tenetur in. Voluptatem ut voluptatibus eveniet ratione qui. Eligendi doloremque eaque voluptas saepe. Totam officiis et aut a.', '212.87', NULL, 98, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(454, 38, 'Deserunt corrupti possimus', 'deserunt-corrupti-possimus-5ZWKI', 'JRF3FFZ3', 'Ipsum natus aut odit et nobis aut ab sunt voluptas eum quo ut.', 'Et sint praesentium recusandae molestiae. Qui quis sapiente in qui aut sunt culpa. Possimus asperiores cum consequatur molestiae. Suscipit et asperiores sit aspernatur consequatur ut.', '95.48', NULL, 131, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(455, 38, 'Autem autem quisquam', 'autem-autem-quisquam-K2pwA', 'CA5ZZOCG', 'Libero autem omnis ut sed amet earum quibusdam tempora nobis inventore perspiciatis sed impedit aut.', 'Ut sunt ea pariatur voluptate aut minus iusto. Iusto quia voluptas hic exercitationem cum et non ipsum. Consequatur omnis iure est et ut. Illo nulla vero et voluptatem minima voluptatem enim. Eveniet incidunt aspernatur enim animi sit voluptas esse.', '125.76', NULL, 50, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(456, 38, 'Quia excepturi beatae', 'quia-excepturi-beatae-U1VG1', 'ZXJCYLHP', 'Et dolores repellendus est quam vero praesentium et.', 'Et reprehenderit odio omnis tenetur. Possimus quos quas autem nesciunt esse minima vel. Perspiciatis laboriosam autem autem minima dicta amet aliquam. Qui nemo qui iusto consequatur ipsum et aspernatur omnis. Ea omnis vel delectus voluptas. Ex labore accusantium dolores voluptatem doloremque dolores.', '227.31', '252.90', 83, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(457, 39, 'Libero similique magni', 'libero-similique-magni-bN71Q', 'XDM0BC89', 'Voluptatem praesentium in qui temporibus autem est qui minima voluptate provident voluptatem.', 'Sit commodi nihil ea delectus. Tempora alias tenetur eum itaque ex atque ut quia. Perspiciatis voluptatem esse non deserunt excepturi ut. Blanditiis consequuntur autem quo quod sunt placeat. Nihil provident ad et.', '195.17', NULL, 64, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(458, 39, 'Quia praesentium maxime', 'quia-praesentium-maxime-3gs1y', 'RSX0RYJW', 'Eos illo non quam omnis necessitatibus deleniti inventore.', 'Voluptatem consequuntur et sit voluptatibus. Iusto minus autem soluta mollitia repellendus. Reiciendis repellat eius consequuntur vero minus qui ab. Quisquam ipsum et repellendus ducimus incidunt est maiores odio. Eaque facilis dolorum ipsum fuga a ipsa fuga.', '24.65', NULL, 29, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(459, 39, 'Perspiciatis sit et', 'perspiciatis-sit-et-Zv9Qx', 'R985PSXA', 'Officiis architecto est facere non quia id natus odio voluptas.', 'Expedita rem voluptas molestias omnis. Sed enim animi recusandae sed dolorem. Sint doloremque animi laudantium nemo. Deserunt autem commodi qui qui. Maxime est omnis ea et rem. Nobis officia voluptatum occaecati enim dolorem et sequi.', '51.53', NULL, 101, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(460, 39, 'Voluptatem porro fuga', 'voluptatem-porro-fuga-tbYp9', 'X3T8LQAY', 'Magnam officia rem et molestiae architecto sed consequatur et necessitatibus perferendis ipsam ea dicta officia.', 'Quae vel earum id qui. Est qui quo culpa ipsum. Et in ratione quia et omnis voluptatem. Minima consequatur quasi repellendus repellat placeat sit. Delectus reprehenderit consequatur nostrum. Placeat quam voluptatibus sit quam voluptas ab cumque.', '78.12', '93.08', 34, 1, 1, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(461, 39, 'Ducimus totam animi', 'ducimus-totam-animi-2oHnH', 'KEHFJNHW', 'Sapiente consequatur non voluptate facere magnam ad aut sit sit fugit atque mollitia labore deleniti.', 'Consequatur eaque id dicta est alias. Atque odit eligendi libero officiis sed voluptates. Laudantium consequuntur est iste est. Officia labore laboriosam iure incidunt placeat. Nostrum enim voluptatem recusandae necessitatibus.', '297.96', NULL, 136, 0, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(462, 39, 'Occaecati minima corrupti', 'occaecati-minima-corrupti-4fsTj', 'LPABGGOK', 'Assumenda odio omnis eum sint necessitatibus a rerum.', 'Ut minima sapiente omnis incidunt voluptas quis nihil. Laudantium omnis aut natus quis amet eum. Est modi cupiditate quo et sed error quas. Ullam corporis cumque omnis quis id.', '90.37', NULL, 128, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(463, 39, 'Voluptas eveniet officiis', 'voluptas-eveniet-officiis-syI52', '42DZMSWL', 'Dolor debitis rerum et omnis aliquid et numquam porro.', 'Officiis voluptatem blanditiis laboriosam corporis laborum placeat. Eos nam omnis voluptates aut commodi repellat. Eos voluptas harum natus. Placeat deserunt nobis ea quia architecto.', '286.70', NULL, 74, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(464, 39, 'Cumque sapiente suscipit', 'cumque-sapiente-suscipit-nMPqX', 'ENUT1RLV', 'Sed eius laboriosam occaecati sed rerum ea quo voluptatem excepturi repellendus sed enim.', 'Iste rem inventore minima qui aut aut. Eveniet quis excepturi fugiat quia qui ea inventore. Sed et placeat aut voluptatem voluptas dolor. Qui quis labore dolor quo nisi sed ut consequatur. Ut aliquam sunt quod sit cum voluptas.', '243.08', '279.43', 182, 1, 1, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(465, 39, 'Non sit ipsum', 'non-sit-ipsum-uQWdC', 'PHAV8IMK', 'Impedit architecto optio quis sed eum adipisci occaecati voluptatem ipsam quo id est quis perspiciatis quas.', 'Adipisci nulla sed eos consequatur voluptatem. Ducimus ut consequuntur enim ut magnam impedit numquam ipsam. Et velit ut et at totam. Rerum temporibus et reiciendis quam ut.', '90.73', '112.11', 158, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(466, 39, 'Dicta id et', 'dicta-id-et-i66V9', 'MJ9QPUXJ', 'Sed exercitationem alias enim sed alias nihil quisquam qui esse ipsa consectetur id.', 'Et dolor esse saepe laboriosam non. Officia dignissimos aut et et illo nostrum aut. Velit ipsam suscipit et placeat aut. Est sunt exercitationem quo quam adipisci eos sunt consectetur. Voluptas ea veniam itaque.', '127.67', NULL, 54, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(467, 39, 'Aut similique in', 'aut-similique-in-FLoep', 'MNMJTRLV', 'Rerum doloremque in dolorem iusto iure accusamus omnis exercitationem libero voluptatem quidem quas ipsa expedita.', 'Itaque suscipit labore voluptatem et id ab. Accusamus explicabo eligendi consectetur labore nobis vitae sunt. Qui voluptatibus maiores occaecati nihil asperiores dolor. Quasi vitae enim aut sit maxime ex. Sequi deleniti sed vitae fuga eum.', '54.49', '65.85', 41, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(468, 39, 'Suscipit quas vitae', 'suscipit-quas-vitae-Iutdr', 'ZIZDCVNI', 'Cum aperiam sunt vel nihil sit veniam itaque consectetur assumenda nulla autem.', 'Esse quia iure quisquam tempore. Voluptatem necessitatibus nisi et. Est consequatur asperiores accusamus ut cum numquam. Sit ratione quia quia et.', '133.03', NULL, 96, 1, 0, NULL, NULL, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(469, 40, 'Error enim adipisci', 'error-enim-adipisci-nb2wJ', '4WV1APQC', 'Delectus itaque temporibus omnis molestias pariatur esse nemo quia possimus omnis quod temporibus non.', 'Vero nihil et odit deleniti deserunt hic fuga. Numquam quis itaque corrupti commodi voluptates mollitia nihil. Molestias aut esse ut facilis quasi omnis.', '19.85', NULL, 0, 1, 1, NULL, NULL, '2025-10-23 16:09:41', '2025-10-24 15:54:01'),
(470, 40, 'Dignissimos perferendis autem', 'dignissimos-perferendis-autem-5Nvpy', 'YSYPKJTR', 'Dolores dignissimos enim et omnis neque qui quos aperiam labore maiores ut nemo id omnis omnis nihil.', 'Voluptas omnis velit recusandae explicabo qui et et. Non ipsum nihil aut cupiditate. Aut molestias eos quaerat similique magni. Rerum aut aut rem nemo. Sit repellat sunt et provident aut.', '22.55', NULL, 194, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(471, 40, 'Vitae sed amet', 'vitae-sed-amet-3qVUR', 'P1IC5JG4', 'Quae numquam libero expedita sit molestias consequatur repellat quaerat exercitationem et.', 'Sit porro officia expedita vero. Et culpa unde ut totam. Sit explicabo officiis ad perferendis consequatur voluptatibus. Quibusdam accusantium amet necessitatibus quia.', '60.70', NULL, 93, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(472, 40, 'Minima animi ut', 'minima-animi-ut-AQLbw', 'IGWKSSSG', 'Impedit quae officia delectus et natus voluptate voluptas ut.', 'Saepe et fugiat accusamus. Et necessitatibus recusandae delectus. Iusto aut deleniti incidunt recusandae qui ut eum. Quae asperiores ex et corrupti.', '10.30', '31.15', 124, 0, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(473, 40, 'Dolores nobis sapiente', 'dolores-nobis-sapiente-CBRX9', 'EOKK99P2', 'Et sint labore ad sit culpa quis dignissimos amet ullam ex autem dicta.', 'Modi voluptatem sit quas autem vel totam incidunt id. Dolor qui aut ab aut quaerat quo. Magnam dolor quia voluptatem qui distinctio ut. Ea tempore modi illo ipsam quo magni. Architecto voluptate sit velit officiis doloribus aut dolor.', '14.67', NULL, 199, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(474, 40, 'Rerum fuga at', 'rerum-fuga-at-piznS', 'QN2QKP4S', 'Voluptates quia dicta optio sit provident esse perferendis quia placeat cupiditate et aut laboriosam temporibus.', 'Molestiae rem quia porro consectetur est. Dolorum commodi non qui perspiciatis est doloribus nostrum sed. Atque consequatur iure perferendis natus sit vitae. Neque ex dolore culpa sit est omnis.', '231.90', NULL, 0, 1, 1, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(475, 40, 'Esse reprehenderit nesciunt', 'esse-reprehenderit-nesciunt-3szsn', '72LIM5B6', 'Ex odit libero ut tempore rerum fugit dolores cupiditate est.', 'Repellendus reprehenderit porro quibusdam fugit. Suscipit iure nesciunt laborum omnis voluptas. Quasi voluptatum et ut et neque. Fugiat consectetur id possimus sit quae sapiente. Harum voluptatibus tempora dolores deserunt. Vitae alias delectus consequuntur consequatur cum aspernatur.', '212.53', NULL, 83, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(476, 40, 'Totam ducimus numquam', 'totam-ducimus-numquam-mLq1E', 'K9OMF9CH', 'Omnis molestiae nisi in eaque quidem amet eveniet laborum quis ab eos incidunt ipsam omnis.', 'Est ut ut voluptatum sint qui vitae maxime. Velit et et quo repellendus ducimus ea ducimus. Mollitia nihil eaque qui distinctio. Sed autem et commodi. Voluptatem aut ipsa ipsa aut aperiam quibusdam. Est at nostrum explicabo fugiat assumenda fuga accusamus.', '87.52', '135.21', 199, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(477, 40, 'Magnam et reiciendis', 'magnam-et-reiciendis-ufbfH', 'IOWL57WA', 'Architecto debitis itaque neque autem occaecati consectetur et dolor aut dolore aspernatur repudiandae excepturi harum qui quisquam.', 'Ad voluptates a sit distinctio ipsam neque ipsam. Autem vero laudantium voluptatem neque molestias. Explicabo earum ipsa consequatur accusamus aut quia vero. Ut totam beatae atque perspiciatis et earum. Velit deleniti officia in.', '110.99', '137.41', 106, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(478, 40, 'Libero deserunt autem', 'libero-deserunt-autem-fhkza', '5BD445YU', 'Molestiae rerum ipsa non cumque voluptatem soluta minima qui.', 'Sunt iure quod occaecati minima sed ipsa dolor omnis. Non unde iste qui qui. Nisi id odit quo doloremque. Et aut dolores rem exercitationem.', '242.14', NULL, 167, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(479, 40, 'Earum reiciendis sunt', 'earum-reiciendis-sunt-5VcO0', 'MUFA7NNF', 'Fuga officiis rem doloremque accusantium deleniti qui quo quo dicta tempore perspiciatis tempore eligendi laudantium.', 'Eos est accusamus ullam rerum accusamus illo. Pariatur consequatur ab voluptate qui. Temporibus itaque iusto maxime quas officiis. Sed impedit laboriosam sunt quis.', '276.50', NULL, 16, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(480, 40, 'Voluptatem et voluptatem', 'voluptatem-et-voluptatem-1XKBY', 'WPLIHBCP', 'Officiis et minus numquam labore sed ipsam ab.', 'Laborum facere quibusdam ea laudantium tenetur id excepturi. Sit autem aliquam harum ea. In rerum provident consequuntur et ut. Fuga ab non quod iusto enim.', '64.56', NULL, 128, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(481, 41, 'Id accusantium tempore', 'id-accusantium-tempore-KzDXf', 'J5K0ZYUH', 'Alias aut odio quasi pariatur consequuntur architecto odit unde modi illum qui et sit temporibus facilis est.', 'Rerum nobis dignissimos id ut laudantium. Et libero sunt nihil veritatis enim sapiente optio. Dolorem cum quis dolores enim veritatis doloribus. Optio dolor nemo qui dolorum consequatur.', '55.58', NULL, 104, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(482, 41, 'Deleniti eum et', 'deleniti-eum-et-Fs7Tq', '3SMQSWNI', 'Voluptate qui blanditiis voluptatem officia vero suscipit ipsa eius voluptatibus ex hic officia officiis.', 'Delectus ipsam ducimus voluptatem nam voluptates animi. Dolor officia deserunt sint dolores iusto. Alias voluptas itaque nobis labore. Quasi est sed assumenda ab id cupiditate ut. Ut commodi ea voluptatibus. Qui quisquam quos cum nam fugiat.', '276.05', '293.85', 92, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(483, 41, 'Autem labore amet', 'autem-labore-amet-gWTh6', 'YGBST2KB', 'Officia iure quo cumque omnis natus neque odio officiis et repellendus vel sunt et non necessitatibus.', 'Culpa adipisci cupiditate atque consequuntur rerum et unde ut. Reprehenderit assumenda natus inventore numquam tempore. Libero sapiente error illum nesciunt.', '139.35', NULL, 2, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(484, 41, 'Asperiores at fugit', 'asperiores-at-fugit-eU5DK', 'MNTWX6WC', 'Beatae aspernatur officia quos laborum ducimus recusandae nam quia et est.', 'Aut quos placeat distinctio quia sint est enim amet. Vel doloribus quo excepturi quae maiores quod. Voluptatem odio sint qui odio omnis animi. Omnis sequi dolorem aut explicabo voluptatem assumenda.', '23.87', NULL, 178, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(485, 41, 'Sint dolorem enim', 'sint-dolorem-enim-Ifl6H', 'PRXY2X77', 'Libero impedit nobis non tempore fugit ut corrupti perferendis ut fuga tenetur.', 'Maiores nisi qui vitae nisi. Perferendis sunt ipsa qui. Dolores earum et consectetur impedit. Eveniet in perspiciatis aspernatur vel amet at voluptas id. Minima dolorum vel ut suscipit.', '296.26', '317.85', 173, 1, 1, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(486, 41, 'Et similique omnis', 'et-similique-omnis-BFhsk', 'K0QWVYFN', 'Harum nesciunt iusto laborum impedit reiciendis consequatur est.', 'Dolores recusandae et quo eum excepturi ut. Aut molestias accusamus quis occaecati illo. Ut et tempora sed sed temporibus praesentium quo. Eaque voluptatem error doloribus voluptatem sunt veniam aperiam. Voluptas quidem quasi eaque dolore ut laborum reiciendis perferendis.', '231.94', NULL, 18, 0, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(487, 41, 'YAMIN', 'quis-aut-sit-zdkHD', 'I1LXY3PM', 'Doloribus itaque animi et impedit nulla provident assumenda nostrum facilis ea ipsa dolores sit iste.', 'Explicabo at cumque sunt nemo aspernatur accusamus. Est minima in ut consequatur ut nobis eos. Eligendi et culpa id voluptas nemo aut consequatur. Iste quasi quae ut nostrum repellendus ab.', '2600002.00', '50000.00', 0, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-24 16:10:06'),
(488, 41, 'Excepturi voluptatem voluptas', 'excepturi-voluptatem-voluptas-1uN0E', 'WXGVSMTC', 'Nostrum nihil aliquid qui in quisquam molestias saepe qui est occaecati animi qui delectus deleniti.', 'Velit laborum quo consequatur voluptatem dolores molestias dolore. Voluptatum et quisquam voluptate. Porro ut omnis recusandae omnis harum. Rem eum ut rerum accusamus eligendi deleniti.', '278.93', NULL, 49, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(489, 41, 'Est explicabo impedit', 'est-explicabo-impedit-HiL7C', '9GYFSQQM', 'Quia quos voluptates ullam vel rerum id autem inventore.', 'Vel et autem at et quia in atque. Non natus neque voluptas exercitationem quis adipisci autem. Non voluptas quod sunt repellat odio exercitationem ullam. Earum repellendus voluptas dolores ut odit rerum. Sint adipisci ipsum qui reprehenderit ea aut.', '266.15', NULL, 173, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(490, 41, 'Et eos sit', 'et-eos-sit-19BvZ', '4YFFPXZH', 'Molestiae et repellendus sunt tenetur eum est deleniti voluptatum velit mollitia et amet dolores.', 'Ratione sit voluptatem ipsum nemo recusandae et. Quibusdam sint qui quis a quo rerum. Ipsa nam sit voluptatibus nobis rem. Eum eligendi expedita in quo. Voluptatem suscipit quod debitis sed.', '241.09', NULL, 137, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(491, 41, 'Dolorum fugit et', 'dolorum-fugit-et-VbDIQ', 'TDBFB6Q1', 'Consequatur sint corporis quam vel voluptatem quasi commodi laboriosam tenetur voluptatem.', 'Mollitia non rerum neque nobis omnis reprehenderit. Atque dolores dolorem nihil quisquam exercitationem rerum reiciendis qui. Nostrum qui quia earum voluptatibus est autem itaque. Optio sequi numquam est omnis iusto. Quae est esse voluptatem neque.', '57.60', NULL, 154, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(492, 41, 'Earum ducimus aliquid', 'earum-ducimus-aliquid-kNyk6', '3SK5OJ2R', 'Unde expedita voluptas delectus ad maiores omnis nobis nemo ut.', 'Suscipit dolores deleniti et voluptas libero. Occaecati molestiae repudiandae cum nisi. Ducimus ad consequatur iste sed. Iste molestiae accusantium aspernatur ut voluptatem. Assumenda dolor ipsa consequatur nobis ex. Et natus doloribus dolorem minima temporibus nulla exercitationem.', '97.79', NULL, 43, 0, 1, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(493, 42, 'Quis molestiae sequi', 'quis-molestiae-sequi-ywrWf', 'VX2HWUEH', 'Aut aspernatur ipsam sint et incidunt deserunt eligendi molestiae debitis vero sint omnis eveniet maxime harum.', 'Suscipit voluptas omnis est amet. Distinctio autem dolore consectetur adipisci nam eaque laborum. Quisquam error autem optio soluta quos placeat corrupti. Corporis ea mollitia quam distinctio nulla. Aliquam non quo consequatur praesentium itaque.', '45.18', '50.08', 41, 0, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(494, 42, 'Dolor sunt dolor', 'dolor-sunt-dolor-3B9wM', 'MWGNJF3U', 'Accusamus repudiandae est corporis optio sint aspernatur qui.', 'Esse quia at omnis ea dolorem assumenda. Incidunt ut voluptatem repudiandae dolores. Corrupti occaecati nesciunt facere unde aperiam modi est nulla. Labore aut sapiente et dolores nihil.', '116.08', NULL, 108, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(495, 42, 'Eos ab natus', 'eos-ab-natus-81zaO', 'TSY8WGJI', 'Odit esse quis quia qui autem sit provident sint voluptatem qui aut laboriosam cupiditate et.', 'Voluptate autem deleniti et architecto sunt nostrum. Nihil sint accusantium consequatur harum ipsum autem sint rerum. Quo beatae quia rerum eum sed commodi hic architecto.', '252.79', '298.03', 22, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(496, 42, 'Incidunt expedita quo', 'incidunt-expedita-quo-UZAUk', 'XQBGOUAH', 'Quod et quis quia est quo suscipit amet qui consequatur odio voluptatibus recusandae accusamus voluptatem.', 'Cum molestiae omnis et laudantium corporis exercitationem distinctio. Labore omnis laudantium laudantium odio dicta. Aut aut laborum voluptas totam nihil. Saepe deleniti praesentium nostrum quaerat est quo. Illum pariatur sed molestiae ut. Excepturi fuga minus praesentium qui aspernatur praesentium.', '78.27', NULL, 26, 1, 1, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(497, 42, 'Consectetur minima provident', 'consectetur-minima-provident-86xHJ', '2ZZVYJ5B', 'Ducimus veritatis voluptas repellat omnis voluptatem qui a distinctio.', 'Laborum molestiae ipsam laboriosam et nisi corporis. Voluptatem pariatur eaque est. Quia minus velit quo exercitationem. Esse cupiditate sed eos reiciendis hic culpa repellendus. Delectus temporibus non dicta quia. Officia dolorem consequatur et quibusdam velit qui.', '246.67', '251.95', 22, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(498, 42, 'Velit libero non', 'velit-libero-non-GsJID', '2RAIOZKC', 'Iste inventore ipsum omnis est nisi molestiae eos accusamus corporis modi nulla quis et exercitationem autem.', 'Sequi harum deserunt et sed qui tenetur odio repellat. Fugiat nihil nihil rerum. Rerum illo itaque iste. Quasi blanditiis rerum sed recusandae in. Fuga expedita ut voluptas quos ex sunt eum quos. Enim dolores qui iusto qui blanditiis.', '143.19', '171.92', 107, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(499, 42, 'Aspernatur nihil non', 'aspernatur-nihil-non-BVatk', 'OVWBAJH1', 'Et temporibus quasi libero at vel odit omnis officia et nam.', 'Itaque blanditiis placeat rem minima ut. Sit vel quis autem et. Facere dolor praesentium voluptates omnis est provident. Modi est fugiat eum optio quaerat repellat. Sit commodi possimus magnam maxime possimus quam et. Ducimus itaque quidem quaerat vel qui unde recusandae.', '67.66', NULL, 2, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(500, 42, 'Aperiam ut possimus', 'aperiam-ut-possimus-rPCrD', 'ZFLN0R5V', 'Doloribus voluptas pariatur magni facere et doloremque officia totam voluptatem eveniet sint quaerat aut.', 'Ullam tenetur delectus laboriosam et neque dignissimos. Dolores earum reprehenderit vero neque et qui rerum. Similique et modi earum dolor. Est recusandae voluptatem sequi veritatis aut. Sed quaerat dolor et modi quaerat aspernatur. Reiciendis ipsam reprehenderit magnam rem voluptatibus.', '239.60', '250.48', 45, 1, 1, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(501, 42, 'Officia aut est', 'officia-aut-est-AU7Jb', 'RTVJAYJ3', 'Deleniti eum aliquid omnis nulla asperiores minima dolores dicta numquam molestiae.', 'Tempore voluptates amet ut. Illo et perspiciatis explicabo minima ipsam earum reiciendis error. Animi voluptatem dolorum aliquid ut laborum. Et ducimus quia voluptatem.', '240.07', NULL, 197, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(502, 42, 'Minus sapiente facilis', 'minus-sapiente-facilis-lV5Ei', 'E6BHY3OB', 'Dignissimos voluptatum et laudantium sint esse quis odit eos.', 'Sint et id cumque voluptas. Ea et necessitatibus odio eum et autem. Numquam expedita et minima non est. Modi molestiae aut possimus deleniti neque.', '39.89', NULL, 165, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(503, 42, 'Totam aliquid assumenda', 'totam-aliquid-assumenda-MylVv', 'JKW2COMB', 'Vel adipisci distinctio amet enim velit aliquam consequatur magni rerum.', 'Sit dolores non consequatur ducimus. Perferendis necessitatibus inventore nihil eligendi. Cumque ut eius pariatur.', '284.29', NULL, 177, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(504, 42, 'Enim labore non', 'enim-labore-non-oD6m7', 'QEIN1HTP', 'Atque velit aut quidem ut id reprehenderit sit veniam fugiat hic.', 'Vero omnis architecto explicabo similique. Illo sed nobis voluptatibus repellendus soluta rerum sequi. Sit a qui sit perspiciatis ratione adipisci ipsam ipsum. Rem dolor consequatur nisi suscipit pariatur aperiam.', '126.81', NULL, 88, 1, 0, NULL, NULL, '2025-10-23 16:09:41', '2025-10-23 16:09:41');

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
(1, 1, 'https://picsum.photos/seed/ea67f12d-c2b8-3fce-be86-ad6bae9c3f2b/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(2, 1, 'https://picsum.photos/seed/ce4e2567-0164-356c-a802-24b7a2ae3ae2/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(3, 1, 'https://picsum.photos/seed/745d09aa-5f25-387b-b3d4-dda930375e4d/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(4, 2, 'https://picsum.photos/seed/f1fd7c44-3d90-3851-bc32-37bc9f99dedb/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(5, 2, 'https://picsum.photos/seed/876a8d80-a495-331d-9f26-5baf392ae097/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(6, 2, 'https://picsum.photos/seed/1c0d9cea-e409-3dd2-a3b0-e6e5e9b2afdf/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(7, 3, 'https://picsum.photos/seed/fe11d769-f30f-3ec8-ae3f-4e4b28bf55ec/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(8, 3, 'https://picsum.photos/seed/c6e69da2-b3a2-30f8-aa62-5dd3e29d012d/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(9, 3, 'https://picsum.photos/seed/1b55355f-4723-30d6-afcb-7eb51d4ce5f9/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(10, 4, 'https://picsum.photos/seed/9d30d4a6-847e-316a-9639-0b6711236658/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(11, 4, 'https://picsum.photos/seed/75b703ff-4177-3fe8-8f2b-d713a85b1b3b/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(12, 4, 'https://picsum.photos/seed/e101863f-c85c-3142-9e85-f551b11375d8/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(13, 5, 'https://picsum.photos/seed/352ad014-b812-3dc1-87b6-260b279b2e36/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(14, 5, 'https://picsum.photos/seed/fd97fe48-a392-362a-b650-a41ee7f8c2e1/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(15, 5, 'https://picsum.photos/seed/76bf5d2f-473d-3def-abbe-9199378bffad/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(16, 6, 'https://picsum.photos/seed/ab640c0b-0901-366a-845e-da25ba79e422/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(17, 6, 'https://picsum.photos/seed/c03e629b-05e9-3d3d-95ee-c918a05be7cd/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(18, 6, 'https://picsum.photos/seed/717a0514-6031-3f69-964f-529f4c96b55d/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(19, 7, 'https://picsum.photos/seed/fed1cb93-d23b-300f-805a-4830dd61f071/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(20, 7, 'https://picsum.photos/seed/4991ba8a-c629-3864-9711-f203b00556ce/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(21, 7, 'https://picsum.photos/seed/0a64e08b-5471-33b3-a42d-1011092a3826/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(22, 8, 'https://picsum.photos/seed/1d108c72-1505-36f2-8d7a-e29be358a323/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(23, 8, 'https://picsum.photos/seed/7e05df8d-48bf-37a6-bf1d-bd82cd84cbcd/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(24, 8, 'https://picsum.photos/seed/6d3f8775-373e-38b0-bede-8be56eb0b7c2/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(25, 9, 'https://picsum.photos/seed/f981956a-a102-3e1e-8940-d898dc70f11f/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(26, 9, 'https://picsum.photos/seed/bf234cf1-da20-3d19-9f14-3a6d4aeccde3/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(27, 9, 'https://picsum.photos/seed/a95a8ac5-f2f1-3db5-97fa-1843da968d0e/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(28, 10, 'https://picsum.photos/seed/bfe85ffb-d92f-3166-897c-f816bedd2ccd/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(29, 10, 'https://picsum.photos/seed/4b11f2c5-f12e-3f97-b454-0f3d076a4d14/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(30, 10, 'https://picsum.photos/seed/1087e98b-3ee7-3292-a4c0-345273df5bfd/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(31, 11, 'https://picsum.photos/seed/3b4a4301-6d5a-31c0-a2e8-c1c3315fec3a/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(32, 11, 'https://picsum.photos/seed/f337f717-977f-35a4-a36b-fdacd6401692/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(33, 11, 'https://picsum.photos/seed/0bc9804b-3421-3250-b07d-8f15994a3a4d/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(34, 12, 'https://picsum.photos/seed/e4f0241b-7c7a-3989-9ba7-761e7ffb6809/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(35, 12, 'https://picsum.photos/seed/63620186-2f6a-3f06-8d9c-5179dd01d386/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(36, 12, 'https://picsum.photos/seed/55d83c66-662e-3499-a5cc-82f9917551d1/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(37, 13, 'https://picsum.photos/seed/d0ffa10d-4007-3873-9111-32307247e66b/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(38, 13, 'https://picsum.photos/seed/2be825c4-7136-3be9-aec9-118fd9ceb036/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(39, 13, 'https://picsum.photos/seed/ddcb48b6-dad2-32a9-9da4-5e6abe6cd429/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(40, 14, 'https://picsum.photos/seed/ba6214f2-3851-3232-925d-48ae879600ce/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(41, 14, 'https://picsum.photos/seed/3d2c9172-5f99-3904-a683-8e2429c5cdff/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(42, 14, 'https://picsum.photos/seed/8d2b55d9-6a84-38f1-9fa5-9b3643838a60/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(43, 15, 'https://picsum.photos/seed/4c1c07d8-57cc-3ffa-a7e9-27aaa6e8d5f3/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(44, 15, 'https://picsum.photos/seed/26030c82-1d74-3a55-9236-34726e4f1be7/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(45, 15, 'https://picsum.photos/seed/f74d75f0-2178-3f1e-980d-dcfd9f9c0c32/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(46, 16, 'https://picsum.photos/seed/26f4553c-04ef-39d4-8205-ae4a48b36089/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(47, 16, 'https://picsum.photos/seed/535b1e34-1336-3f26-8596-7addb9a06d0e/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(48, 16, 'https://picsum.photos/seed/bab31152-1f9c-34eb-96f5-ebd2ae4ae67e/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(49, 17, 'https://picsum.photos/seed/5ed50c45-cef8-307e-911a-788b6f41e94b/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(50, 17, 'https://picsum.photos/seed/dae3a33e-f9d5-3fb0-825a-979528f98190/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(51, 17, 'https://picsum.photos/seed/0883c546-8130-3aef-9c8e-969a851ea05c/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(52, 18, 'https://picsum.photos/seed/5ed54624-c196-322b-ad45-cf827efa7436/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(53, 18, 'https://picsum.photos/seed/930364ee-518a-3f87-b240-572723791d24/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(54, 18, 'https://picsum.photos/seed/c41dd36b-7c70-347e-b839-ab114d4faa08/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(55, 19, 'https://picsum.photos/seed/2e0cfe8a-213c-3f08-be48-f9498d0c90ee/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(56, 19, 'https://picsum.photos/seed/ac45372f-5ce0-3023-951a-307ae1e5cc5b/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(57, 19, 'https://picsum.photos/seed/0526fcc1-df03-36d1-946e-57b8576f31bb/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(58, 20, 'https://picsum.photos/seed/2787ec37-ca30-3dc8-9175-0840d4f8646e/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(59, 20, 'https://picsum.photos/seed/5712b47d-aace-3ef8-8b78-44bee3f03abc/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(60, 20, 'https://picsum.photos/seed/4a813e57-29f0-3ea0-b59c-7a190f572374/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(61, 21, 'https://picsum.photos/seed/3624a91c-0483-38d8-9097-98b729f75286/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(62, 21, 'https://picsum.photos/seed/36bd0fe0-93c0-34c4-a6ec-017903032785/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(63, 21, 'https://picsum.photos/seed/47c47c1a-fdd9-3172-8640-40ece5fe20d3/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(64, 22, 'https://picsum.photos/seed/adaef7d3-7f64-3ca1-b753-4f2832a3b7e3/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(65, 22, 'https://picsum.photos/seed/f768e4e8-64a9-3c17-8592-d85b35889799/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(66, 22, 'https://picsum.photos/seed/243e3fe0-287d-3f29-9b5c-76bc781164bf/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(67, 23, 'https://picsum.photos/seed/f4ac375c-895e-3477-b255-6e3ab9f30a48/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(68, 23, 'https://picsum.photos/seed/273e62ec-f2ef-38cb-9ecb-f84721a4af56/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(69, 23, 'https://picsum.photos/seed/8d7ff12e-2b24-3d01-8bbf-ce1297c0340d/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(70, 24, 'https://picsum.photos/seed/496fa5d4-29ee-356b-8992-eb9faa20f170/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(71, 24, 'https://picsum.photos/seed/24fa6972-1d28-3c41-abe1-2c828177f5c1/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(72, 24, 'https://picsum.photos/seed/60829977-1335-3f56-8624-81b9ca283446/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(73, 25, 'https://picsum.photos/seed/0ef46fe9-60f9-34be-aa93-bd58e9bae0b9/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(74, 25, 'https://picsum.photos/seed/b3b74299-d381-3649-a81c-95dd6441af27/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(75, 25, 'https://picsum.photos/seed/132e1a1f-af20-302a-aba8-3701d24f6fd7/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(76, 26, 'https://picsum.photos/seed/84f7f2b0-5acf-37fc-be96-78cd52e76844/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(77, 26, 'https://picsum.photos/seed/302b8d36-c9b1-3ebb-8247-d30dd65b45ed/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(78, 26, 'https://picsum.photos/seed/1dfc0002-aee1-34e7-9b91-adfa6da69890/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(79, 27, 'https://picsum.photos/seed/52aeb929-4a42-3c04-b0d2-950fb35f5071/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(80, 27, 'https://picsum.photos/seed/01cd8e01-26cc-362f-834f-63e3fb31b282/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(81, 27, 'https://picsum.photos/seed/a193f5ef-e8e8-3483-8c19-a0052eb7a877/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(82, 28, 'https://picsum.photos/seed/e5bb6f01-a56c-3955-a65e-0abea46d82d0/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(83, 28, 'https://picsum.photos/seed/6b933b39-be30-348f-87f6-f562e7afdd91/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(84, 28, 'https://picsum.photos/seed/e25048c3-9fde-3e13-931d-6daab0bce154/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(85, 29, 'https://picsum.photos/seed/adf971dd-038f-391e-9ceb-931dd551b70a/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(86, 29, 'https://picsum.photos/seed/ee2ea231-c2e7-3ff0-af3b-1bb932cb060c/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(87, 29, 'https://picsum.photos/seed/5c46a92c-6b20-39a1-893d-05f7d1a7da0b/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(88, 30, 'https://picsum.photos/seed/9097961d-faa7-353f-90dd-2ef5272996bd/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(89, 30, 'https://picsum.photos/seed/d327377d-e624-33f4-9968-1a482ee90019/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(90, 30, 'https://picsum.photos/seed/f35a9999-bedc-3e42-88a7-83edbdce94b0/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(91, 31, 'https://picsum.photos/seed/c2f59c36-6d6a-3364-bccb-694f2543e237/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(92, 31, 'https://picsum.photos/seed/4d38a85b-2dac-3680-bdcd-c92cfc25a470/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(93, 31, 'https://picsum.photos/seed/f4779ae9-18db-3093-afc8-63db7a61546c/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(94, 32, 'https://picsum.photos/seed/3b3b6c51-64c6-3d4a-be5e-05c1dcfdfb5a/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(95, 32, 'https://picsum.photos/seed/2f72bc77-7d1d-3d83-a3e0-f2d981bc8a22/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(96, 32, 'https://picsum.photos/seed/5362de25-5113-346e-a4f7-386e4e246016/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(97, 33, 'https://picsum.photos/seed/18ef31ef-d0af-3dd1-984c-cb5cc8d42d0e/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(98, 33, 'https://picsum.photos/seed/86e8c290-bbbf-3d7d-8815-16365b818ed0/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(99, 33, 'https://picsum.photos/seed/4f1b5b95-dc4a-3047-873f-ad47de1b2d03/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(100, 34, 'https://picsum.photos/seed/8510a3dc-405c-3984-af23-eac831110ff5/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(101, 34, 'https://picsum.photos/seed/d12469c8-0987-3f68-bff9-7ae0755d2b32/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(102, 34, 'https://picsum.photos/seed/cceb0be9-c7c3-3c1d-b216-958bd46927f3/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(103, 35, 'https://picsum.photos/seed/2da48544-d179-37b1-a735-6eb9ba185d2f/600/450', 1, 1, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(104, 35, 'https://picsum.photos/seed/6643c9fd-7417-3c7a-b1b5-34ec65da2686/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(105, 35, 'https://picsum.photos/seed/2e078e37-f548-36a8-a861-1f5459a7a394/600/450', 0, 0, '2025-10-23 12:57:13', '2025-10-23 12:57:13'),
(106, 36, 'https://picsum.photos/seed/288651b5-b8ac-349f-8f9c-3ec50ba34116/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(107, 36, 'https://picsum.photos/seed/e47acbc2-8cd4-3193-8373-43bca35b4950/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(108, 36, 'https://picsum.photos/seed/499420fb-041d-3db4-8798-c770f121fc5f/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(109, 37, 'https://picsum.photos/seed/de42fec6-4a7f-3824-8ece-97c4cc4a8e42/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(110, 37, 'https://picsum.photos/seed/bfd26b3c-e27d-30d7-9bfc-9db7f118c773/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(111, 37, 'https://picsum.photos/seed/d2c6594f-bd74-32af-9922-83f13ad670cf/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(112, 38, 'https://picsum.photos/seed/a0eaf1fa-fa50-31e4-9757-0ae03fa7ff90/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(113, 38, 'https://picsum.photos/seed/8fcae4da-55bb-3258-bd88-c484038d9ae1/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(114, 38, 'https://picsum.photos/seed/d1199327-2d89-3bfa-a8cc-a9fc30b82aa8/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(115, 39, 'https://picsum.photos/seed/5c5971f5-4efa-3bc7-bc99-3aeacbf8845b/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(116, 39, 'https://picsum.photos/seed/42086c32-d825-32fe-b780-7033fa014625/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(117, 39, 'https://picsum.photos/seed/34bba3d2-15b9-3301-926b-82d2781ec4f8/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(118, 40, 'https://picsum.photos/seed/8d172533-95a2-398f-82c9-4eeb58668ed0/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(119, 40, 'https://picsum.photos/seed/060b0d5a-d262-3574-a7fd-91849e98a61b/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(120, 40, 'https://picsum.photos/seed/3ec0432a-2704-3cab-9249-535354381660/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(121, 41, 'https://picsum.photos/seed/8e82881b-69c6-3460-900c-ff82ab5d501e/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(122, 41, 'https://picsum.photos/seed/7e2333b3-8a3b-3390-bea8-3e6a91edcc6e/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(123, 41, 'https://picsum.photos/seed/1b7ad805-be3f-3c34-9120-73d520ffe46a/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(124, 42, 'https://picsum.photos/seed/250b02f2-1b7c-3a30-8072-a4acb63b864b/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(125, 42, 'https://picsum.photos/seed/3f461769-fb21-3351-a4d1-9c68bebf6c19/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(126, 42, 'https://picsum.photos/seed/342160d3-af1f-32b5-b98d-2e29c19ac9c4/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(127, 43, 'https://picsum.photos/seed/11917160-b920-391f-80f5-d38b0e780a3d/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(128, 43, 'https://picsum.photos/seed/98a70664-3802-30b6-bd3b-a65e588de57f/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(129, 43, 'https://picsum.photos/seed/2e89c42e-78e6-37a2-b576-43ec88b18c7f/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(130, 44, 'https://picsum.photos/seed/e001dd9e-4cb0-3127-9cbb-954c7abab57a/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(131, 44, 'https://picsum.photos/seed/032e067c-27cd-3974-abd1-8eb52f1de331/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(132, 44, 'https://picsum.photos/seed/8ce2f6e4-201a-39aa-9ec4-b7eee97de843/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(133, 45, 'https://picsum.photos/seed/a8af7bc7-1d40-3145-b98c-db468a1293f0/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(134, 45, 'https://picsum.photos/seed/55a154f0-fad2-3161-97e0-8f5ce7f33ad0/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(135, 45, 'https://picsum.photos/seed/b3f4a3ea-4700-3228-86c0-157144f9b55d/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(136, 46, 'https://picsum.photos/seed/659e65e5-db73-372e-860d-2b029402c9d4/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(137, 46, 'https://picsum.photos/seed/fd7e98b3-2676-312e-aa7f-b6fef76d1323/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(138, 46, 'https://picsum.photos/seed/b912434b-c443-37d3-8ed6-bd48ef5585c2/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(139, 47, 'https://picsum.photos/seed/5b03ef51-b006-307b-9a7f-7ef20b6f0e7f/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(140, 47, 'https://picsum.photos/seed/a0290c48-85ad-3617-bb18-52e66e17fd75/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(141, 47, 'https://picsum.photos/seed/3247b49c-bf71-39a1-b53a-c17e4dd97470/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(142, 48, 'https://picsum.photos/seed/1dbcf751-86d0-358f-9dc3-596fee458168/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(143, 48, 'https://picsum.photos/seed/8372c48b-56f3-337a-b2c6-983b8974dd40/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(144, 48, 'https://picsum.photos/seed/b0863c31-de28-3e54-a7ec-5b1f3b59c84a/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(145, 49, 'https://picsum.photos/seed/f017ad84-24c0-3c76-9ae0-9f971fb22748/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(146, 49, 'https://picsum.photos/seed/78879e6e-eb0b-3237-8a64-af8a62c57a41/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(147, 49, 'https://picsum.photos/seed/bf8962f5-5fe9-33f4-8892-aca8ed6b03cd/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(148, 50, 'https://picsum.photos/seed/bb6a1807-381d-376c-ab6d-f5fc3ee2a8bd/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(149, 50, 'https://picsum.photos/seed/8c152d32-3a7a-3ea0-9410-5294bad7a4ff/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(150, 50, 'https://picsum.photos/seed/e7ef389f-b698-3e9c-ac79-ad60d7739a76/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(151, 51, 'https://picsum.photos/seed/96f68240-c422-362c-a8f4-9eda9606f641/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(152, 51, 'https://picsum.photos/seed/2aa9e28e-34ee-313e-8ccb-999ea1b9ac87/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(153, 51, 'https://picsum.photos/seed/9e8e7f3a-2087-3c41-a6e6-bf7fc4be85d1/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(154, 52, 'https://picsum.photos/seed/f1493ce7-ab70-300f-a66f-b934db594796/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(155, 52, 'https://picsum.photos/seed/1b808593-f3fb-3de2-9d17-4d931a284389/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(156, 52, 'https://picsum.photos/seed/d2e700a6-a68e-399a-b8e7-5ebc9f7f4ae6/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(157, 53, 'https://picsum.photos/seed/0c687281-553c-3567-bbf3-e48462a066a0/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(158, 53, 'https://picsum.photos/seed/285eb98f-8094-3359-8dbc-164200b30dde/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(159, 53, 'https://picsum.photos/seed/1f416bbb-819e-31e0-9b1e-62fb32bb891e/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(160, 54, 'https://picsum.photos/seed/a90eae23-ac22-34e7-927f-51a0498b2d42/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(161, 54, 'https://picsum.photos/seed/0f9801d3-876d-35cd-8af6-3427849e4251/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(162, 54, 'https://picsum.photos/seed/980960d1-ca04-3481-97d3-1e586095f057/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(163, 55, 'https://picsum.photos/seed/57f9dca1-3a18-3a72-8dd5-b5ba9bf2d93a/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(164, 55, 'https://picsum.photos/seed/f434ae9f-33de-39de-bd50-e529f43b758c/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(165, 55, 'https://picsum.photos/seed/17e5187c-cd94-3cf3-a439-1a37f8f2bb07/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(166, 56, 'https://picsum.photos/seed/55ccca3a-b1ec-3542-8443-1481261f354e/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(167, 56, 'https://picsum.photos/seed/74d70152-c693-3d69-b48f-f111b7ea801c/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(168, 56, 'https://picsum.photos/seed/1614468b-c896-3a4c-a8d9-e3f0c3705d3b/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(169, 57, 'https://picsum.photos/seed/19005c00-f224-3235-85c8-090265d6ff96/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(170, 57, 'https://picsum.photos/seed/e5bd0fa6-cd4c-3cc9-9f71-7ba010d0bee8/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(171, 57, 'https://picsum.photos/seed/c89b564a-1e9e-382d-8414-959823f0380f/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(172, 58, 'https://picsum.photos/seed/dcf1a7f7-cb9a-3935-ac0a-4b72dfd5713a/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(173, 58, 'https://picsum.photos/seed/43e6a74c-590f-3cb2-b4b3-64bce6a35d10/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(174, 58, 'https://picsum.photos/seed/b1856b02-be6f-39a0-98e7-4dfaf5bb40f2/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(175, 59, 'https://picsum.photos/seed/5e785421-ba40-37a7-b619-89aa89149fc1/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(176, 59, 'https://picsum.photos/seed/c741c9f1-4500-39e9-957a-e988e3a2f32f/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(177, 59, 'https://picsum.photos/seed/baf3eece-8a4a-3351-9289-46b87ac0e2c3/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(178, 60, 'https://picsum.photos/seed/b8880ac1-318a-3a6b-8ea9-2473a21c828f/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(179, 60, 'https://picsum.photos/seed/08a2a35f-4880-310b-8605-5acf20a0923c/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(180, 60, 'https://picsum.photos/seed/0c6066eb-6c3b-3d29-bf50-bc2d08a2940a/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(181, 61, 'https://picsum.photos/seed/184d6fb6-1add-389b-89d7-84a7271583c3/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(182, 61, 'https://picsum.photos/seed/66d0b904-bf17-3273-a2c7-9e0e97d58929/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(183, 61, 'https://picsum.photos/seed/e638aea5-2f0a-3e7d-83ff-31b30d4bcdcc/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(184, 62, 'https://picsum.photos/seed/93848d5f-55fb-3165-9295-5b33f3ecc5e1/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(185, 62, 'https://picsum.photos/seed/a3eb134a-a473-397e-90d3-24066fb79b52/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(186, 62, 'https://picsum.photos/seed/59430b8a-d0d5-31a5-a5cc-e3dfb0640f58/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(187, 63, 'https://picsum.photos/seed/a537d397-3a19-37f1-87e0-f7079cd721f8/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(188, 63, 'https://picsum.photos/seed/61697feb-c6d2-3067-a2c3-60d004a30c55/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(189, 63, 'https://picsum.photos/seed/912ba34d-079c-3f6a-ac61-88f0871b4b2f/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(190, 64, 'https://picsum.photos/seed/b85b1b29-d5cf-3fdf-9afc-55e3829bfeeb/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(191, 64, 'https://picsum.photos/seed/acabad60-ab30-312b-b347-80d28ff8bc40/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(192, 64, 'https://picsum.photos/seed/ea50f54e-1bd1-3ecd-a92b-c12c83993e18/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(193, 65, 'https://picsum.photos/seed/354bbbde-5fa9-35d5-99f5-057c08f98ef9/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(194, 65, 'https://picsum.photos/seed/e161cfef-f7bb-31c6-971a-1ebc93e9d005/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(195, 65, 'https://picsum.photos/seed/b747c88f-fdfc-38e6-b250-3af309799d5d/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(196, 66, 'https://picsum.photos/seed/f0b909f7-2aba-3cc7-9e3a-d77430e712c0/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(197, 66, 'https://picsum.photos/seed/feee5f8b-eb55-3ad8-8afe-a216b802134d/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(198, 66, 'https://picsum.photos/seed/1afa802a-dc35-3a90-8690-2b3d12af1e7c/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(199, 67, 'https://picsum.photos/seed/c11d6a3f-3855-3277-9296-2f1cea0131ea/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(200, 67, 'https://picsum.photos/seed/a5b0a59f-3133-35d3-b600-78ff7cbf50f8/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(201, 67, 'https://picsum.photos/seed/62e5e351-d944-3787-a590-77e4e1eaee24/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(202, 68, 'https://picsum.photos/seed/0c801a8e-c4b3-3513-85ba-7a13295577dc/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(203, 68, 'https://picsum.photos/seed/7878fff2-403e-3378-90ef-06395d9b6c11/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(204, 68, 'https://picsum.photos/seed/e37bc8db-c549-3872-887f-9ad89031a409/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(205, 69, 'https://picsum.photos/seed/f9013485-6d64-31e8-a7db-72bf3e35d67b/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(206, 69, 'https://picsum.photos/seed/eb5102db-3a39-3be7-8498-9341aa5f5b0e/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(207, 69, 'https://picsum.photos/seed/3ac55c1b-f3f1-3e48-bb3b-5b62bdd3171e/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(208, 70, 'https://picsum.photos/seed/fdeab385-7a73-3751-a8b0-d76d2c4fcbd8/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(209, 70, 'https://picsum.photos/seed/5276d7a5-8779-3378-aea6-d1b91ed70690/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(210, 70, 'https://picsum.photos/seed/3a891498-20a2-38bb-b3e4-7a4c9cabae0c/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(211, 71, 'https://picsum.photos/seed/95c4c9ab-af3a-3eca-bd82-d0f0cd670bd7/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(212, 71, 'https://picsum.photos/seed/4039a829-9459-3ec3-8fa0-35d4609d72d9/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(213, 71, 'https://picsum.photos/seed/e813a2fe-a65c-3e87-8014-46a63dc9be38/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(214, 72, 'https://picsum.photos/seed/5b805b87-b5fb-31ce-bb17-7c9f070a36fd/600/450', 1, 1, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(215, 72, 'https://picsum.photos/seed/1df03514-a569-3661-8828-1181f6b77e80/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(216, 72, 'https://picsum.photos/seed/05951732-0d49-3710-ae88-945fbf265c4a/600/450', 0, 0, '2025-10-23 12:57:14', '2025-10-23 12:57:14'),
(217, 73, 'https://picsum.photos/seed/8fc2810e-67ca-39ed-8359-55817cd88197/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(218, 73, 'https://picsum.photos/seed/58e8315f-3cd2-356a-88a3-5d3fa9b9bca3/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(219, 73, 'https://picsum.photos/seed/e4f248af-d0fd-3fb2-862d-5b9149c2d704/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(220, 74, 'https://picsum.photos/seed/61feffd0-e9fd-35b9-adcd-537257cd6fa6/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(221, 74, 'https://picsum.photos/seed/676b0029-2ab5-3bfe-935d-fffcc8ed339b/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(222, 74, 'https://picsum.photos/seed/f0483201-d6d2-3820-a573-29697ac25447/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(223, 75, 'https://picsum.photos/seed/f8951a51-d9a0-3a8c-bba9-815511f7ebe5/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(224, 75, 'https://picsum.photos/seed/79de1f3d-b782-3668-a6ce-64395a73c228/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(225, 75, 'https://picsum.photos/seed/b6a21cd6-8f7a-3067-b194-b6db3cbcb9eb/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(226, 76, 'https://picsum.photos/seed/1b6ceb88-4f60-3892-8297-0509502c134e/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(227, 76, 'https://picsum.photos/seed/e0eb8dc0-eca0-365e-aa94-01c2891b5f59/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(228, 76, 'https://picsum.photos/seed/7b502f99-f106-31e2-b7cf-2ab133a123b4/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(229, 77, 'https://picsum.photos/seed/63b78372-3443-3a73-8a68-e888734a8d84/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(230, 77, 'https://picsum.photos/seed/abd091b1-54f0-3781-80fc-0b2eda6b70e9/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(231, 77, 'https://picsum.photos/seed/b49aabb7-a006-3611-bf80-93bb23639a27/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(232, 78, 'https://picsum.photos/seed/50719e83-5ba3-3039-b6d2-fc0ba6c9a260/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(233, 78, 'https://picsum.photos/seed/b498cd56-00a1-3baf-9369-0601a4a94d7f/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(234, 78, 'https://picsum.photos/seed/794b6240-e89e-36ec-bbf2-304978c190fd/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(235, 79, 'https://picsum.photos/seed/2dafa7d4-2aff-3bd9-8eac-c4dc98ae3313/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(236, 79, 'https://picsum.photos/seed/0ac915ef-f22c-3008-9d1f-be4231f747c4/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(237, 79, 'https://picsum.photos/seed/63ea4273-6fa2-37d5-9d06-37f14a7a1d18/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(238, 80, 'https://picsum.photos/seed/62df80f1-aa76-3455-ab46-c6c7edb3bd33/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(239, 80, 'https://picsum.photos/seed/a039ad90-c501-343f-94a2-0b0d71076010/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(240, 80, 'https://picsum.photos/seed/6c768b79-875e-377d-882a-48d2b5222f4c/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(241, 81, 'https://picsum.photos/seed/f81c4152-eac3-3aaa-a72e-f7276769d54f/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(242, 81, 'https://picsum.photos/seed/24055643-aa7b-3ffb-8aff-d654d03c1b1e/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(243, 81, 'https://picsum.photos/seed/15b63722-93c8-31f5-8459-03aeb2b26f3b/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(244, 82, 'https://picsum.photos/seed/55993764-5a9a-3770-94a2-6d14c4407790/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(245, 82, 'https://picsum.photos/seed/f8460a56-5f26-314a-9c86-d14fa338af52/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(246, 82, 'https://picsum.photos/seed/8e618ca2-ad9e-37e6-aa8a-ef714dc13668/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(247, 83, 'https://picsum.photos/seed/a638b90c-a395-359e-8c76-6fafe6429f58/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(248, 83, 'https://picsum.photos/seed/cd601a82-5e6d-359c-82d2-4a019d4d6133/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(249, 83, 'https://picsum.photos/seed/b24a0fce-5bc1-3ff7-9510-0e9f74fa4907/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(250, 84, 'https://picsum.photos/seed/494bdf2e-0f39-3626-8ba4-37a06cb839c8/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(251, 84, 'https://picsum.photos/seed/76cf66b9-757a-3680-b118-bf6768ba23e6/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(252, 84, 'https://picsum.photos/seed/e349cd26-e0d6-3c36-9ec3-2e7e23d1061d/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(253, 85, 'https://picsum.photos/seed/82c39834-e193-3f39-ad0a-29a9c034ef55/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(254, 85, 'https://picsum.photos/seed/422ca529-4639-3f02-8785-536bac8747bd/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(255, 85, 'https://picsum.photos/seed/0139012c-045a-33d3-b9fc-da8a11ed36a9/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(256, 86, 'https://picsum.photos/seed/fa6d92b1-2f21-3684-af65-3a385de6d37b/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(257, 86, 'https://picsum.photos/seed/8fb4869d-87ef-3035-a9c9-0a7b75573c6a/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(258, 86, 'https://picsum.photos/seed/c942ba0c-a6f4-3c7a-b117-5482c14222ba/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(259, 87, 'https://picsum.photos/seed/c23cd259-7196-3ec2-b27c-d9ab7a68bf07/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(260, 87, 'https://picsum.photos/seed/67c8c13f-a2fe-34e0-ae5b-6204c90f281c/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(261, 87, 'https://picsum.photos/seed/d5880deb-28cd-3923-8f5a-2f47d71501ed/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(262, 88, 'https://picsum.photos/seed/c924b8f1-fbbf-301a-a08a-af00654430f1/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(263, 88, 'https://picsum.photos/seed/807b033a-1859-30cc-8557-5c9079f6da29/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(264, 88, 'https://picsum.photos/seed/63a49922-e9e0-37f7-a881-ece1a348ea8a/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(265, 89, 'https://picsum.photos/seed/2d929792-ab91-3ee1-b8b1-5bca5fc36506/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(266, 89, 'https://picsum.photos/seed/a56a2b8d-9b7a-3a31-9830-713705091db0/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(267, 89, 'https://picsum.photos/seed/f76b0247-7634-388d-a25c-2980b65c5075/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(268, 90, 'https://picsum.photos/seed/5391c5df-65f9-33e3-8280-c9edd1c44f87/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(269, 90, 'https://picsum.photos/seed/bc17c6ad-0ffd-329d-9c85-439eeda49a8a/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(270, 90, 'https://picsum.photos/seed/ea929ac4-ac48-340a-a679-f9bc5292862c/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(271, 91, 'https://picsum.photos/seed/81a8103e-a0da-3768-a5a0-6ec965bdd872/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(272, 91, 'https://picsum.photos/seed/af7201e3-be41-33fb-97c2-8ea239dd5040/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(273, 91, 'https://picsum.photos/seed/ad433fff-2f0f-3c91-ae66-f8645e608342/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(274, 92, 'https://picsum.photos/seed/836c187f-8051-3f7e-a88f-2c680916c7a2/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(275, 92, 'https://picsum.photos/seed/bb31c0f2-85be-3210-a328-561c85821174/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(276, 92, 'https://picsum.photos/seed/3f7374d7-0fae-3fd9-9cd9-d977ffc2d6f3/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(277, 93, 'https://picsum.photos/seed/a3b5bf42-a58c-3822-8fd2-1d80a19944bd/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(278, 93, 'https://picsum.photos/seed/098d92b2-a65b-382d-96d4-e646cd1f9a89/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(279, 93, 'https://picsum.photos/seed/108235cc-e143-304b-b06f-2ec867261463/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(280, 94, 'https://picsum.photos/seed/d7c1221a-001e-3ed6-9d39-00142ca92471/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(281, 94, 'https://picsum.photos/seed/00020ac6-521e-386f-a5ca-46a9bb31e4d0/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(282, 94, 'https://picsum.photos/seed/fad16d31-a9cd-36e8-b9fa-d6f34673c9b1/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(283, 95, 'https://picsum.photos/seed/596a1bf5-67a7-379f-85ae-5c09e6de6140/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(284, 95, 'https://picsum.photos/seed/73b17ef9-a7bb-306b-9e10-f5ab5c7845f1/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(285, 95, 'https://picsum.photos/seed/15804eaa-7b40-361f-b7cc-8e2ada31b083/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(286, 96, 'https://picsum.photos/seed/47edda2e-ab7d-395b-97f7-ed3d0f5d6538/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(287, 96, 'https://picsum.photos/seed/cf36f231-4fac-3f09-b201-bba4e56d0e8e/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(288, 96, 'https://picsum.photos/seed/0cf80228-164c-3df3-83c0-fce45bb0b962/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(289, 97, 'https://picsum.photos/seed/755d59bf-5081-372a-b99e-17185707ff0e/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(290, 97, 'https://picsum.photos/seed/f75d31ca-2e6d-3d43-b8d7-b72e8a3479e2/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(291, 97, 'https://picsum.photos/seed/bf6ce36e-3062-34d1-97f5-b2485369654a/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(292, 98, 'https://picsum.photos/seed/d43fc35f-093c-3eab-b083-c536cf770663/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(293, 98, 'https://picsum.photos/seed/2c3d8687-2bcf-37eb-a7be-aaba8c6a7fe8/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(294, 98, 'https://picsum.photos/seed/2ccf048e-31b9-3630-8bae-fef3ca6635bf/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(295, 99, 'https://picsum.photos/seed/2698cf63-a86c-3568-ae1f-7915e68890c7/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(296, 99, 'https://picsum.photos/seed/df004ad9-abd6-3f70-a5e1-8dde0fd06e7f/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(297, 99, 'https://picsum.photos/seed/50d767ab-d475-32d4-bfa0-5cb7a7cc66ce/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(298, 100, 'https://picsum.photos/seed/b9ec6262-11db-39f4-ae86-616c9bd49862/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(299, 100, 'https://picsum.photos/seed/dba5adda-2a54-34c3-b9ad-d64a750d5190/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(300, 100, 'https://picsum.photos/seed/74beb763-0b8e-30c4-8cfb-71b5052de18f/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(301, 101, 'https://picsum.photos/seed/af4dfaa1-f87e-3a38-99fb-2d40bfcd9e10/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(302, 101, 'https://picsum.photos/seed/56597024-96de-36ab-a908-72081af28f0b/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(303, 101, 'https://picsum.photos/seed/50006824-8c23-3d55-bcaf-37b21a0ec753/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(304, 102, 'https://picsum.photos/seed/e4a1cdf7-98cb-3a0b-b8cf-616b67b314fc/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(305, 102, 'https://picsum.photos/seed/78df1ad5-f167-3d5b-82a2-01851d42dcb2/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(306, 102, 'https://picsum.photos/seed/0f17eb3e-f463-3ab4-b718-7308e2932e2c/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(307, 103, 'https://picsum.photos/seed/480dc209-d9f7-30db-a403-64299a4a0773/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(308, 103, 'https://picsum.photos/seed/d880af74-56b9-3eb6-8c42-0aade82a1612/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(309, 103, 'https://picsum.photos/seed/5ff524af-95a9-37f4-9d12-47149b0d9888/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(310, 104, 'https://picsum.photos/seed/b3fa6202-041c-3d5e-b733-feca4fc7ccbf/600/450', 1, 1, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(311, 104, 'https://picsum.photos/seed/3a8edeb2-453c-3cab-b81a-f27240ce42a1/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(312, 104, 'https://picsum.photos/seed/de6a74fc-d9ef-3630-a87a-7e793f433374/600/450', 0, 0, '2025-10-23 13:07:44', '2025-10-23 13:07:44'),
(313, 105, 'https://picsum.photos/seed/f7d7d073-7ece-3329-9658-ec2d74e6722b/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(314, 105, 'https://picsum.photos/seed/42c4701a-2226-3eb2-9ce1-88d0119a712c/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(315, 105, 'https://picsum.photos/seed/c3fab451-a1c8-3f94-b38f-29f4065f92b8/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(316, 106, 'https://picsum.photos/seed/79d448db-8bec-3b5d-b4f5-5260e0981912/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(317, 106, 'https://picsum.photos/seed/f500d931-59a4-354e-a653-857a6355854e/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(318, 106, 'https://picsum.photos/seed/ad35bc07-a49e-3027-a331-7d6d3b1e8d15/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(319, 107, 'https://picsum.photos/seed/6a75f2c5-ff13-3af5-ac42-c824c45cc9b8/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(320, 107, 'https://picsum.photos/seed/64de2afa-db00-31f6-99e4-082f8c248010/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(321, 107, 'https://picsum.photos/seed/b132e593-5c2e-3478-9dcf-970e81baca84/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(322, 108, 'https://picsum.photos/seed/9983f499-96d2-36a4-ab5c-141b76b2e7f4/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(323, 108, 'https://picsum.photos/seed/00810ce1-02eb-3da0-9f5d-32818c924d78/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(324, 108, 'https://picsum.photos/seed/3639a270-a406-3034-96a9-89f0fee9779b/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(325, 109, 'https://picsum.photos/seed/bd0cb97b-823f-3690-86b6-29df18698cce/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(326, 109, 'https://picsum.photos/seed/d9d521db-b742-3581-b146-20245f9137d6/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(327, 109, 'https://picsum.photos/seed/f9eb6651-474a-39b3-9125-9eab3edc84c2/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(328, 110, 'https://picsum.photos/seed/8a465b3f-3f1b-3ea1-87e5-f6b0712749fd/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(329, 110, 'https://picsum.photos/seed/91420020-ad3b-311e-9a65-0c9f81701d27/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(330, 110, 'https://picsum.photos/seed/7d23de09-4181-38b9-b58b-e35705bead7c/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(331, 111, 'https://picsum.photos/seed/24f9b6b6-fa2b-382d-9ac4-d10c9a48a754/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(332, 111, 'https://picsum.photos/seed/e19c414f-11c8-344b-b113-6c7c6e324bd8/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(333, 111, 'https://picsum.photos/seed/9a2851d4-7755-3016-a418-46eb22dc5558/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(334, 112, 'https://picsum.photos/seed/1d4c8b0e-916c-3f18-8857-f55665a77cb7/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(335, 112, 'https://picsum.photos/seed/afe8d17e-05e6-3ca9-8210-b8e6945a502d/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(336, 112, 'https://picsum.photos/seed/cc9ead0d-0544-3b5e-b8d2-e2922f0b2746/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(337, 113, 'https://picsum.photos/seed/4b0741ce-6905-393c-91f2-d2edafa6f385/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(338, 113, 'https://picsum.photos/seed/f50d61f5-4608-3e1c-a2b2-b774315dc270/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(339, 113, 'https://picsum.photos/seed/8c542558-f9ab-3c9d-9db3-ae0b008b8d42/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(340, 114, 'https://picsum.photos/seed/c3dbeeec-6f64-306a-a8a4-f33597c852c1/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(341, 114, 'https://picsum.photos/seed/a1779c2a-0092-3d3b-82f9-5951fa25a6f2/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(342, 114, 'https://picsum.photos/seed/6d50f333-0c63-3c3f-a8f2-608a76a5150a/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(343, 115, 'https://picsum.photos/seed/e0d30150-76ad-3e12-baf1-8856b371969a/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(344, 115, 'https://picsum.photos/seed/2d466185-ba46-3b7d-80aa-a8d1760d8dc9/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(345, 115, 'https://picsum.photos/seed/d42472fc-ac34-3bbb-9043-0c0e26e880fe/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(346, 116, 'https://picsum.photos/seed/b0c44065-f2fa-3c1c-9e99-39e58c934ff1/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(347, 116, 'https://picsum.photos/seed/5e704f78-cc7c-3e69-b314-537858e579d5/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(348, 116, 'https://picsum.photos/seed/a44682bd-a157-3483-90a5-9bbce7c1bbaf/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(349, 117, 'https://picsum.photos/seed/e4a1495b-fb9e-3ba6-a6f0-810d47b6f136/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(350, 117, 'https://picsum.photos/seed/f27a0d2e-fe9f-3696-a226-67901600f893/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(351, 117, 'https://picsum.photos/seed/fd7d6816-c169-3290-a7b2-a51ecdabfe18/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(352, 118, 'https://picsum.photos/seed/07f94f57-d668-3d76-a598-0c1cee61c2b5/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(353, 118, 'https://picsum.photos/seed/8b68ed85-12ad-3525-95fc-7ffb7b63c8e9/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(354, 118, 'https://picsum.photos/seed/0d38fc82-0f60-3361-a7b5-1f59156217af/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(355, 119, 'https://picsum.photos/seed/c91463c9-a49b-3b9b-972a-c5dc747e6ea6/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(356, 119, 'https://picsum.photos/seed/8caff9ee-0e5d-3978-b4ad-8defa609f68f/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(357, 119, 'https://picsum.photos/seed/c2e3ff2d-aac5-3c80-81cb-1fc1aa0407d5/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(358, 120, 'https://picsum.photos/seed/48d07431-0eb5-3048-a576-2db339af949a/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(359, 120, 'https://picsum.photos/seed/9c44e7f0-75d7-312c-a071-ac21e1c70b95/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(360, 120, 'https://picsum.photos/seed/1d48e632-78c0-39c9-b1a6-56861fa64576/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(361, 121, 'https://picsum.photos/seed/8cbffc5f-6fa0-3806-9ff4-64e1b76b278c/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(362, 121, 'https://picsum.photos/seed/65b50b22-ebcb-3ce9-994d-ff7c6e3fd43e/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(363, 121, 'https://picsum.photos/seed/69cc44ca-89be-3a90-a94f-dc0437a1bae3/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(364, 122, 'https://picsum.photos/seed/fced1905-a753-3c4b-88db-618220b17597/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(365, 122, 'https://picsum.photos/seed/db69c21c-c0a7-3f5d-9238-5766cd64fa07/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(366, 122, 'https://picsum.photos/seed/9e97ffe3-663f-3354-8725-c513352c8ea6/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(367, 123, 'https://picsum.photos/seed/ab432040-23a8-31d6-8f83-f277e7d5b0fa/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45');
INSERT INTO `product_images` (`id`, `product_id`, `path`, `position`, `is_primary`, `created_at`, `updated_at`) VALUES
(368, 123, 'https://picsum.photos/seed/14d17736-a3a3-317c-b3d4-ae2bf2474f93/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(369, 123, 'https://picsum.photos/seed/419ccd2a-bdff-3748-ae1a-14b87a799460/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(370, 124, 'https://picsum.photos/seed/8677d5bd-ad24-3fc2-b515-c151086c6a64/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(371, 124, 'https://picsum.photos/seed/872f0e13-717e-3beb-ba35-b538896ab044/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(372, 124, 'https://picsum.photos/seed/8692cfdf-138a-3b62-b5f1-278ba3a1b31c/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(373, 125, 'https://picsum.photos/seed/fe08a928-1912-3b3b-a8cd-0ddfed8f3b98/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(374, 125, 'https://picsum.photos/seed/f8b79ad6-e734-3e01-86af-cb275a3b2780/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(375, 125, 'https://picsum.photos/seed/1f3b85e0-0390-3f7f-96c4-591d86d8ebb1/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(376, 126, 'https://picsum.photos/seed/62641d60-6239-3b9a-b3c4-e1e2bfe3be38/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(377, 126, 'https://picsum.photos/seed/6ea95bbe-a73e-3e57-be6f-5a3d9e09003b/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(378, 126, 'https://picsum.photos/seed/b700d18f-0da0-3e84-a4c7-e856a7ab78cc/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(379, 127, 'https://picsum.photos/seed/eb22fac3-39b8-32f1-820a-4d1670580696/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(380, 127, 'https://picsum.photos/seed/508df2b6-8df3-3178-bf2c-b47a70f831c7/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(381, 127, 'https://picsum.photos/seed/0e160b14-8cf0-3f5d-bc86-7b635928c427/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(382, 128, 'https://picsum.photos/seed/a1d3ba3c-28ea-349b-873b-ee3156f8e9ed/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(383, 128, 'https://picsum.photos/seed/01ddbb15-8c97-33f9-9b6c-c07bb2153e3a/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(384, 128, 'https://picsum.photos/seed/88a1496b-2d84-389d-81e7-a7ccec1a8eb0/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(385, 129, 'https://picsum.photos/seed/07a55619-b09c-3907-9e72-4357379d9b73/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(386, 129, 'https://picsum.photos/seed/51814672-beb5-3ff6-8809-08e74a02949d/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(387, 129, 'https://picsum.photos/seed/fd43cbca-bce4-3ed9-82be-321d125a932d/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(388, 130, 'https://picsum.photos/seed/3063f442-6850-324d-9526-74b9333652df/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(389, 130, 'https://picsum.photos/seed/4f7320d5-7927-3166-9432-8e4f738a437b/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(390, 130, 'https://picsum.photos/seed/fc01d6be-6154-3bf9-83d5-a2bd1a801382/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(391, 131, 'https://picsum.photos/seed/bf25d8e0-51b1-3304-b9ef-81943a774fc1/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(392, 131, 'https://picsum.photos/seed/e793c403-49e8-3dc8-a197-2d57d217263d/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(393, 131, 'https://picsum.photos/seed/8f4d93f3-3ab1-37f3-bd43-a0c59cc2ad69/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(394, 132, 'https://picsum.photos/seed/3b6c151d-d4ec-3d02-aa05-d2fcfb92c8e0/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(395, 132, 'https://picsum.photos/seed/195e0013-823c-3300-b372-686e2e274b8a/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(396, 132, 'https://picsum.photos/seed/b55b4b3d-890f-37e6-a69b-9d44ba764ed1/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(397, 133, 'https://picsum.photos/seed/71d8ce4d-027c-3572-805a-02f40c53a19d/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(398, 133, 'https://picsum.photos/seed/2c8b2d5d-053a-300c-8238-0df083ef9c53/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(399, 133, 'https://picsum.photos/seed/64c5ca88-6bd4-3b88-a0dd-4881f5d25da0/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(400, 134, 'https://picsum.photos/seed/24577585-75a6-3d30-abcc-5cdd370544c7/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(401, 134, 'https://picsum.photos/seed/14e17a1e-c171-3d25-8c07-502e840fd2cf/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(402, 134, 'https://picsum.photos/seed/2928816e-7a7d-35fc-bc8d-772884ffacbc/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(403, 135, 'https://picsum.photos/seed/e5b99bc0-8f55-3b41-82ea-9efa27344839/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(404, 135, 'https://picsum.photos/seed/72ce7eb5-5d32-35bc-87c6-6ddfa4f2af42/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(405, 135, 'https://picsum.photos/seed/ce94d237-9209-347a-b051-7684e0807363/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(406, 136, 'https://picsum.photos/seed/42d725cf-bb79-39e4-bf4a-9335c1739772/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(407, 136, 'https://picsum.photos/seed/0e829a24-475b-3e0d-862b-53d302a1f8e4/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(408, 136, 'https://picsum.photos/seed/4c4d7a63-d799-39df-a1d7-39452f247245/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(409, 137, 'https://picsum.photos/seed/be1e0858-199a-3045-8474-83cdd78d1cbb/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(410, 137, 'https://picsum.photos/seed/8b929b19-a3de-3e6a-94f4-f62d7f03cf9f/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(411, 137, 'https://picsum.photos/seed/c7f1bf8b-e887-3fbb-9825-bb98125d3e58/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(412, 138, 'https://picsum.photos/seed/32e224c8-5ded-3c09-be92-c6b9f233646c/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(413, 138, 'https://picsum.photos/seed/b0399ef2-be49-33f3-a0d4-18cf26cd1714/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(414, 138, 'https://picsum.photos/seed/cb864ff7-452f-3948-b749-3b0cf02f4cb2/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(415, 139, 'https://picsum.photos/seed/af196276-d838-3db4-9041-35bd316da950/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(416, 139, 'https://picsum.photos/seed/985c93a1-c2a1-3fb6-9282-43974a2b89f2/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(417, 139, 'https://picsum.photos/seed/062742bd-a745-30e0-945a-c659921e3645/600/450', 0, 0, '2025-10-23 13:07:45', '2025-10-23 13:07:45'),
(418, 140, 'https://picsum.photos/seed/03328920-d17a-3a6d-be56-4cda5883a4f4/600/450', 1, 1, '2025-10-23 13:07:45', '2025-10-23 13:07:46'),
(419, 140, 'https://picsum.photos/seed/57ed3b6a-dfc9-30e7-9619-f4b30d13ee31/600/450', 0, 0, '2025-10-23 13:07:46', '2025-10-23 13:07:46'),
(420, 140, 'https://picsum.photos/seed/22f5921f-8ddd-36a4-941f-c8261434356e/600/450', 0, 0, '2025-10-23 13:07:46', '2025-10-23 13:07:46'),
(421, 141, 'https://picsum.photos/seed/3aa31bff-ed6d-3de4-aca4-e81be5799d4f/600/450', 1, 1, '2025-10-23 13:07:46', '2025-10-23 13:07:46'),
(422, 141, 'https://picsum.photos/seed/d6cac88d-56a3-30d2-aaa9-0e935d570344/600/450', 0, 0, '2025-10-23 13:07:46', '2025-10-23 13:07:46'),
(423, 141, 'https://picsum.photos/seed/91f0d37d-5255-38b5-b0ad-a1b66178ac71/600/450', 0, 0, '2025-10-23 13:07:46', '2025-10-23 13:07:46'),
(424, 142, 'https://picsum.photos/seed/ab63840a-1d85-3c3e-ad64-d3a49e0ab381/600/450', 1, 1, '2025-10-23 13:07:46', '2025-10-23 13:07:46'),
(425, 142, 'https://picsum.photos/seed/6f9ed67c-f36b-393f-9808-cb05f6212d6e/600/450', 0, 0, '2025-10-23 13:07:46', '2025-10-23 13:07:46'),
(426, 142, 'https://picsum.photos/seed/5215aa7c-ba74-32c7-90fd-67b66e0e6797/600/450', 0, 0, '2025-10-23 13:07:46', '2025-10-23 13:07:46'),
(427, 143, 'https://picsum.photos/seed/d9882c9a-f878-3714-ae7b-d2d39fbaffdb/600/450', 1, 1, '2025-10-23 13:07:46', '2025-10-23 13:07:46'),
(428, 143, 'https://picsum.photos/seed/45526771-2149-399e-914e-48b766b22f9e/600/450', 0, 0, '2025-10-23 13:07:46', '2025-10-23 13:07:46'),
(429, 143, 'https://picsum.photos/seed/aa87378b-9b67-3ab7-8e97-d361a46d7044/600/450', 0, 0, '2025-10-23 13:07:46', '2025-10-23 13:07:46'),
(430, 144, 'https://picsum.photos/seed/91caaa75-9236-33f0-aede-68223200e896/600/450', 1, 1, '2025-10-23 13:07:46', '2025-10-23 13:07:46'),
(431, 144, 'https://picsum.photos/seed/26a96373-cb12-3054-b9ab-6be8cb0cc299/600/450', 0, 0, '2025-10-23 13:07:46', '2025-10-23 13:07:46'),
(432, 144, 'https://picsum.photos/seed/6ea3ac61-2603-329c-8b4d-766a444b725c/600/450', 0, 0, '2025-10-23 13:07:46', '2025-10-23 13:07:46'),
(433, 145, 'https://picsum.photos/seed/5adfb89e-f321-3563-993d-82dfdf92117e/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(434, 145, 'https://picsum.photos/seed/1f63ce73-718b-3dc7-9572-934221e813bc/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(435, 145, 'https://picsum.photos/seed/048dd88e-4150-36d6-9eff-154796c49675/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(436, 146, 'https://picsum.photos/seed/a349c8e7-760a-3b14-80d4-f3d130ac2d0d/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(437, 146, 'https://picsum.photos/seed/151cbd01-a861-3860-b36d-e28e4adf5ab5/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(438, 146, 'https://picsum.photos/seed/d60f0001-e232-391b-b7e2-f1b5edce8b49/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(439, 147, 'https://picsum.photos/seed/31e2789e-7609-30a3-a497-92f1bc237759/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(440, 147, 'https://picsum.photos/seed/fa9d9cee-dc96-3d30-ab2f-69395cca2ff4/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(441, 147, 'https://picsum.photos/seed/3b15385f-b2bb-3630-8c51-8870a8b2c7a6/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(442, 148, 'https://picsum.photos/seed/4f77f054-9f18-3daf-bf19-81b98e4262d5/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(443, 148, 'https://picsum.photos/seed/b866a585-6ed5-3bbf-9f33-6d1bb12b995b/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(444, 148, 'https://picsum.photos/seed/16aafc11-c3bd-3a46-980d-c9824e936c7f/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(445, 149, 'https://picsum.photos/seed/283ec598-9777-3030-9480-b5e204db6f81/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(446, 149, 'https://picsum.photos/seed/998ddd66-0076-3f07-a6c3-a0b29b18af3b/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(447, 149, 'https://picsum.photos/seed/f4f268da-84af-362e-804f-e4af0601808b/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(448, 150, 'https://picsum.photos/seed/5d4300a4-db2c-38c3-b7c0-80881ec39396/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(449, 150, 'https://picsum.photos/seed/ca2eff5f-aad1-345e-8a57-256d62da4a05/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(450, 150, 'https://picsum.photos/seed/9abe6778-3a38-324b-bd45-101a87a0f4ef/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(451, 151, 'https://picsum.photos/seed/696e2fbe-4a66-35f3-a027-e62e280c8b0b/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(452, 151, 'https://picsum.photos/seed/560faa33-9526-35fc-a689-caf09ba25ae3/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(453, 151, 'https://picsum.photos/seed/a35a381f-9c44-33a5-be67-96c10e68c28a/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(454, 152, 'https://picsum.photos/seed/2c0baabc-e406-399c-b17d-640ab1fe2f89/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(455, 152, 'https://picsum.photos/seed/e414d54f-b6a0-3e28-b074-de0d49590ff2/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(456, 152, 'https://picsum.photos/seed/5342a66d-912c-32d1-baa6-a34efca067cb/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(457, 153, 'https://picsum.photos/seed/964acd8f-3091-312e-8590-82edd0933d49/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(458, 153, 'https://picsum.photos/seed/5e912528-ccba-35f6-9a78-70aad3967433/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(459, 153, 'https://picsum.photos/seed/cc051828-bf58-38f4-91a1-bbd70c9362e9/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(460, 154, 'https://picsum.photos/seed/381e44ef-8ce3-37cf-be30-c7fda9108cc2/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(461, 154, 'https://picsum.photos/seed/417f5ceb-6936-38d7-b52c-0fb90102efe1/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(462, 154, 'https://picsum.photos/seed/56c2d528-818b-33f3-9211-edae0c71d6b7/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(463, 155, 'https://picsum.photos/seed/714be485-2a97-3fb8-bfd3-ce007f8aa31e/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(464, 155, 'https://picsum.photos/seed/53b86775-ca7b-3d7f-8e7e-4dfc6086df5f/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(465, 155, 'https://picsum.photos/seed/f7b1cf13-67ab-318a-977e-ea8967a52a66/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(466, 156, 'https://picsum.photos/seed/b561517c-7967-37fd-94f8-6f0b28cbd2be/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(467, 156, 'https://picsum.photos/seed/638db683-6e79-3887-8c74-5b530a1a681d/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(468, 156, 'https://picsum.photos/seed/1cf3661a-2c36-3cd3-9a69-f50721a5d8d3/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(469, 157, 'https://picsum.photos/seed/ed3e18ef-1c2c-3510-b519-e170e680c97f/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(470, 157, 'https://picsum.photos/seed/472fa4de-e265-3320-b76f-da36b417ca16/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(471, 157, 'https://picsum.photos/seed/795bfa89-be73-3a9a-9bc0-d0aacefeb221/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(472, 158, 'https://picsum.photos/seed/432b2c73-c92f-3121-b8ff-dc40e0838b07/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(473, 158, 'https://picsum.photos/seed/b058aeee-e86d-3e38-bf1c-e9310e91f615/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(474, 158, 'https://picsum.photos/seed/26c390e1-edb5-37ed-ba45-93928092f501/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(475, 159, 'https://picsum.photos/seed/433faf7d-370f-35d5-9240-8716e157d330/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(476, 159, 'https://picsum.photos/seed/1e08047e-7235-3009-a357-24253a322dcc/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(477, 159, 'https://picsum.photos/seed/37074e86-4b80-3512-b5ca-c0c05c06883f/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(478, 160, 'https://picsum.photos/seed/2609d4a5-834a-38f8-9397-ea6301adb0b4/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(479, 160, 'https://picsum.photos/seed/1cd0a2dd-0189-37ea-9cb2-2bbcdb6a0ab9/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(480, 160, 'https://picsum.photos/seed/b7cc6966-b741-372c-8a67-baec4128eb92/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(481, 161, 'https://picsum.photos/seed/336bdf2c-5665-3dcf-90c4-8c73cce5e080/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(482, 161, 'https://picsum.photos/seed/b20fb085-1380-3dea-b3b7-b276c26460a0/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(483, 161, 'https://picsum.photos/seed/d482364e-07bd-3957-8931-a5e8963caa44/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(484, 162, 'https://picsum.photos/seed/b7837bbb-d31c-3c05-8a22-2eef09643ad2/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(485, 162, 'https://picsum.photos/seed/c4503e65-ef8a-3c08-9b72-3b761c3dbf8d/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(486, 162, 'https://picsum.photos/seed/58d5a275-83ff-3aad-ace4-dc804961ff45/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(487, 163, 'https://picsum.photos/seed/93c1273b-950f-31fa-abb2-77a15df69179/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(488, 163, 'https://picsum.photos/seed/0892ecfc-83e1-307a-b8ea-23b4462ca270/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(489, 163, 'https://picsum.photos/seed/80251ea1-dd58-3084-822c-da9b7ced36b5/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(490, 164, 'https://picsum.photos/seed/4f382b9f-0d24-37bd-9d89-10bdc4f8b4ef/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(491, 164, 'https://picsum.photos/seed/bbd3eb43-b349-3f41-8eeb-2bc98143153c/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(492, 164, 'https://picsum.photos/seed/07e77d8a-6d4f-396a-84fc-20067cc04fdc/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(493, 165, 'https://picsum.photos/seed/aa0d0244-2531-3ae8-93ff-f5de2ad5d3f0/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(494, 165, 'https://picsum.photos/seed/631bc9db-1860-304e-86c2-204d78b31c53/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(495, 165, 'https://picsum.photos/seed/250a497c-1d7c-32a9-85fd-18ff8c91e463/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(496, 166, 'https://picsum.photos/seed/9cf9bf7e-e6cc-3276-a138-a2a6c8dfd379/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(497, 166, 'https://picsum.photos/seed/5576919d-632b-3e74-9f3b-2501de8087f3/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(498, 166, 'https://picsum.photos/seed/3457af35-36de-39af-83ba-7231ba0350d7/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(499, 167, 'https://picsum.photos/seed/06b94d2b-2e04-34a4-9700-7b0f6b7b1cf8/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(500, 167, 'https://picsum.photos/seed/8a47ef07-40d6-361e-9131-1a76d234537c/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(501, 167, 'https://picsum.photos/seed/53ba0fbb-2c62-38ca-89d9-2f9603025278/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(502, 168, 'https://picsum.photos/seed/d5dac7bb-34f0-36a7-a08f-d1ad071bac12/600/450', 1, 1, '2025-10-23 13:22:36', '2025-10-23 13:22:37'),
(503, 168, 'https://picsum.photos/seed/2845a9d6-8c2e-3415-8920-d01660a3c19c/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(504, 168, 'https://picsum.photos/seed/c4d59ebf-8265-38f0-966e-c4af933b6e85/600/450', 0, 0, '2025-10-23 13:22:36', '2025-10-23 13:22:36'),
(505, 169, 'https://picsum.photos/seed/98141665-dd6c-3967-bb1a-cf6588d0338e/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(506, 169, 'https://picsum.photos/seed/0075fb9f-6e83-3e02-84ba-f88f38e6630e/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(507, 169, 'https://picsum.photos/seed/2c728d90-e5dc-3141-aee6-a2a08544315d/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(508, 170, 'https://picsum.photos/seed/f8de8285-d8bc-37eb-a80c-e4a7d415ffe8/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(509, 170, 'https://picsum.photos/seed/4cb76f80-9c6c-375c-b5fa-38975d6eaab4/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(510, 170, 'https://picsum.photos/seed/fd57e61b-683a-31be-8757-f2aa390906ef/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(511, 171, 'https://picsum.photos/seed/77298ae2-b0c1-3066-be8b-394e2642a42f/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(512, 171, 'https://picsum.photos/seed/8ff811bf-6d23-3465-b452-438d5079a5de/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(513, 171, 'https://picsum.photos/seed/8c66194a-b302-325e-8af1-77b8f81e7ce8/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(514, 172, 'https://picsum.photos/seed/e2a539c7-5e71-3c0f-a257-dfbc4feb74cd/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(515, 172, 'https://picsum.photos/seed/9f012d65-a3b7-384a-9649-d7630e20adf8/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(516, 172, 'https://picsum.photos/seed/08a66614-103f-3fe4-b149-948fd2faf547/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(517, 173, 'https://picsum.photos/seed/7297b30f-bb0a-373a-98aa-85d9a2613a30/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(518, 173, 'https://picsum.photos/seed/adc3880b-9065-3af0-a913-2bdb897556c6/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(519, 173, 'https://picsum.photos/seed/b8c7064d-358c-3300-a318-00f65d5df1f3/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(520, 174, 'https://picsum.photos/seed/1f5835bc-afa6-39c6-bf70-ead1e3e60076/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(521, 174, 'https://picsum.photos/seed/ac1fa88a-8f3a-33d6-be8f-d51ee78373b1/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(522, 174, 'https://picsum.photos/seed/452dd4ed-bfbc-31cb-a45f-265d7e6005f0/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(523, 175, 'https://picsum.photos/seed/a1a86185-5ef6-3949-89d9-906b2b931164/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(524, 175, 'https://picsum.photos/seed/bb0cccc1-e50f-3633-acf9-a93a6381b5c1/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(525, 175, 'https://picsum.photos/seed/930d1000-0ae3-3f20-afe0-2773d659d4e2/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(526, 176, 'https://picsum.photos/seed/1d77be0d-0d91-380b-852a-83dd441e81c8/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(527, 176, 'https://picsum.photos/seed/545c0552-6c45-3cb8-b496-a10de07d685b/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(528, 176, 'https://picsum.photos/seed/e545b376-bb91-3809-80cb-5864f44832e9/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(529, 177, 'https://picsum.photos/seed/9e2a0660-afb3-3daf-b49d-d36562fc0a35/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(530, 177, 'https://picsum.photos/seed/3a4c0e7e-888f-3e18-9497-b0bfae411b2c/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(531, 177, 'https://picsum.photos/seed/f42ca28f-95ca-3f8e-97c2-92e404d12840/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(532, 178, 'https://picsum.photos/seed/40fb9731-d4f4-3a62-bf5a-e374954badf7/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(533, 178, 'https://picsum.photos/seed/57b75ca8-3b14-3537-b047-3203a1a266f2/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(534, 178, 'https://picsum.photos/seed/8800b97e-eab9-3795-ba6d-cd2220ec6be7/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(535, 179, 'https://picsum.photos/seed/13860b8d-47ac-32e4-a97c-9e446fa35add/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(536, 179, 'https://picsum.photos/seed/a6d62f91-95b9-31a5-bfa6-40e4b23dc736/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(537, 179, 'https://picsum.photos/seed/778457d3-8751-3f90-a36e-31b138f29ac3/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(538, 180, 'https://picsum.photos/seed/d9a7fc84-aeb8-3388-9606-d013d0f99172/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(539, 180, 'https://picsum.photos/seed/e358b44e-cfb4-3e7d-b9e0-f379264c90b6/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(540, 180, 'https://picsum.photos/seed/1452626a-05b5-3ecb-a878-a1385609d5f2/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(541, 181, 'https://picsum.photos/seed/4c19f549-017a-31e9-acb2-f3ef2744b990/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(542, 181, 'https://picsum.photos/seed/245f7fb6-2549-36fa-92f8-5e91ce31b6d6/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(543, 181, 'https://picsum.photos/seed/f6149639-f9d8-3eaa-a6b5-385bf0a45634/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(544, 182, 'https://picsum.photos/seed/ea1c91ac-4643-3c1b-9ddf-2ee2ad4e0d83/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(545, 182, 'https://picsum.photos/seed/6151f07f-6979-3e53-9eca-262b7eb5e501/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(546, 182, 'https://picsum.photos/seed/a21a0f1e-031b-3f54-af79-b8618d186025/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(547, 183, 'https://picsum.photos/seed/9f5fffa2-1764-3ae4-9d02-020fbc29ae6a/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(548, 183, 'https://picsum.photos/seed/3f42dd5f-b0bb-30db-8d68-c50c3861944b/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(549, 183, 'https://picsum.photos/seed/c3147160-4d3a-38c6-9f58-2890c4f1ad61/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(550, 184, 'https://picsum.photos/seed/c739bb37-6ee5-397e-bcb2-0fb923952f8b/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(551, 184, 'https://picsum.photos/seed/e5d58a81-1b58-3098-9359-2335e35ae496/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(552, 184, 'https://picsum.photos/seed/137d75be-e9c6-38bd-8e82-11c8e2e505b9/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(553, 185, 'https://picsum.photos/seed/f9a93d04-5f61-3341-bd95-7309901dc283/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(554, 185, 'https://picsum.photos/seed/e7154a75-da5c-36f7-bb86-6d7573bce808/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(555, 185, 'https://picsum.photos/seed/8e916e86-249d-3181-a002-3e5a5d50cc7a/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(556, 186, 'https://picsum.photos/seed/d0355933-3f1d-3b93-a284-59b5fa5c28c9/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(557, 186, 'https://picsum.photos/seed/802c4345-11a7-39cd-825f-0893d2a72f44/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(558, 186, 'https://picsum.photos/seed/5c01b8bb-b6a1-3922-9a4e-76c22f34904d/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(559, 187, 'https://picsum.photos/seed/0a6fe6f7-8802-3f13-aaeb-75f58298aa17/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(560, 187, 'https://picsum.photos/seed/d1dfcb31-9c3b-30d0-b20d-0c8e586fedc3/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(561, 187, 'https://picsum.photos/seed/94b2beda-d853-3e23-ae57-e2ad6e238d4b/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(562, 188, 'https://picsum.photos/seed/ec3dde16-f0d1-34b2-b03f-fba24e74d84d/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(563, 188, 'https://picsum.photos/seed/63991a92-6a93-3748-b4e5-d3b73c1a738f/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(564, 188, 'https://picsum.photos/seed/bb2a4e6e-1e67-312a-b9ed-f56cd951fae2/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(565, 189, 'https://picsum.photos/seed/8a7a87bf-3dea-3f65-ab0e-2ca4ba957a34/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(566, 189, 'https://picsum.photos/seed/32f7bca2-34f9-34aa-8f10-e2056826d402/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(567, 189, 'https://picsum.photos/seed/10898385-92de-34ee-870a-f93666ca7d84/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(568, 190, 'https://picsum.photos/seed/14aed870-2bb1-31aa-96a3-eed54539baae/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(569, 190, 'https://picsum.photos/seed/eb9bfc2f-6ff7-3c44-8851-e53e7a658ab8/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(570, 190, 'https://picsum.photos/seed/e7333ad5-4d6f-34de-8c32-66369f6aa1d3/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(571, 191, 'https://picsum.photos/seed/445f146a-f43d-3420-b63c-1a87695c0c87/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(572, 191, 'https://picsum.photos/seed/1ddfe23a-2ec6-3442-bed4-0f71a586f741/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(573, 191, 'https://picsum.photos/seed/96f4bc0e-e5cd-3a5a-b1bf-7a0b78d1c50d/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(574, 192, 'https://picsum.photos/seed/054e5279-675f-3b36-821f-8304f3e3ea78/600/450', 1, 1, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(575, 192, 'https://picsum.photos/seed/38d56f3b-86ca-3b11-9ad1-dd2d95e7e8b8/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(576, 192, 'https://picsum.photos/seed/51a55a80-08c2-3b02-877d-dbce8b21a93c/600/450', 0, 0, '2025-10-23 13:22:37', '2025-10-23 13:22:37'),
(577, 193, 'https://picsum.photos/seed/275ec026-6aff-3da7-9574-2f8527d7fc4b/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(578, 193, 'https://picsum.photos/seed/9d6a6955-7b73-36b3-ae2b-1a3c5377528c/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(579, 193, 'https://picsum.photos/seed/31df7aa6-4871-3d80-8d3a-61e325f7eb40/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(580, 194, 'https://picsum.photos/seed/fe520446-ca21-3f8a-b982-69bd588c7a9e/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(581, 194, 'https://picsum.photos/seed/11c9a091-6826-3698-96ce-6d71034e8d96/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(582, 194, 'https://picsum.photos/seed/d12c26f6-8319-3ae9-80d1-800d429f6ffe/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(583, 195, 'https://picsum.photos/seed/29bb59b9-c898-3586-8b10-b561d47d57ca/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(584, 195, 'https://picsum.photos/seed/9ef30b8a-2b3b-3e58-9218-a52884e6462a/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(585, 195, 'https://picsum.photos/seed/0d34278f-40a8-3a7a-a667-e44dc426a56b/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(586, 196, 'https://picsum.photos/seed/5174decf-39eb-3b94-9296-3847645e7be7/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(587, 196, 'https://picsum.photos/seed/3797f0b6-93ae-31ac-8ca6-a293857d1c4b/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(588, 196, 'https://picsum.photos/seed/1d66ad11-ceed-31c2-a8d8-002fffcc3328/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(589, 197, 'https://picsum.photos/seed/118ab353-b367-3b9a-97a3-2f181172c15f/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(590, 197, 'https://picsum.photos/seed/7d2cc524-ceef-3979-972b-436f864a8c84/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(591, 197, 'https://picsum.photos/seed/d934ffdf-0054-34f8-8cfb-752d3518b904/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(592, 198, 'https://picsum.photos/seed/a7c4ae05-d665-316f-bb9c-81aaab9a3332/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(593, 198, 'https://picsum.photos/seed/74ed9f52-69b0-31fd-80c3-828d3660a33e/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(594, 198, 'https://picsum.photos/seed/b01afa64-8b3e-34aa-8249-d742364822c0/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(595, 199, 'https://picsum.photos/seed/881c157d-4834-3c80-bccf-a7f857f3fbef/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(596, 199, 'https://picsum.photos/seed/7d335277-587c-3ad8-bba1-33454b25307e/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(597, 199, 'https://picsum.photos/seed/4c0e8b97-dffb-36f0-8986-d5c250dedb65/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(598, 200, 'https://picsum.photos/seed/cbd0e9a4-fbba-3742-9b02-5aa648af1a41/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(599, 200, 'https://picsum.photos/seed/3cbd549d-2844-3513-b551-e46cb8e55a84/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(600, 200, 'https://picsum.photos/seed/04aaa317-9f60-37c6-a2ba-aa23dbdfe383/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(601, 201, 'https://picsum.photos/seed/b7cda3c7-876b-3509-9168-3741580c00f7/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(602, 201, 'https://picsum.photos/seed/32575243-234b-3d69-bd63-6923cb3d7ac8/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(603, 201, 'https://picsum.photos/seed/9a89de16-f3ca-3700-870a-8c674ba56330/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(604, 202, 'https://picsum.photos/seed/0ca99c6e-f5f5-37e7-8338-a525aa4cba90/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(605, 202, 'https://picsum.photos/seed/d1c3c297-256d-33ba-86ec-be7ed821fcac/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(606, 202, 'https://picsum.photos/seed/ba0b64b6-03fa-30bd-9dc3-3f7bcc23d41a/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(607, 203, 'https://picsum.photos/seed/bb753523-0076-381e-bffc-0ee364ba46d9/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(608, 203, 'https://picsum.photos/seed/9dab8af3-1898-3ae8-a114-5afc6b0e2a47/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(609, 203, 'https://picsum.photos/seed/a1356cbd-347e-302c-a63e-7d36277e80a9/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(610, 204, 'https://picsum.photos/seed/41106dc4-3e45-3cbf-9345-916bdc9c1d07/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(611, 204, 'https://picsum.photos/seed/ced97196-235b-3369-b746-52fd3afff457/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(612, 204, 'https://picsum.photos/seed/5f2f1bd1-2438-3b06-9737-ce6804719f5b/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(613, 205, 'https://picsum.photos/seed/ebef2567-d138-35df-9cb6-199032f82c47/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(614, 205, 'https://picsum.photos/seed/911674d2-8ab3-339c-bc4b-a994eda27b8a/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(615, 205, 'https://picsum.photos/seed/09c37023-d30b-36d0-a1ba-814235abe920/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(616, 206, 'https://picsum.photos/seed/4c1d3085-03cf-324a-a42b-35b9fa3d877b/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(617, 206, 'https://picsum.photos/seed/5e8360c6-2c53-3ca3-b49a-09d7f7ba8c1c/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(618, 206, 'https://picsum.photos/seed/45c63a4d-5945-3464-93a6-2c0a148ec8e1/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(619, 207, 'https://picsum.photos/seed/7cac980e-cf6c-3fe6-9370-c62eaad8b82d/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(620, 207, 'https://picsum.photos/seed/8100b2ea-040f-3f72-be41-c6f2235b8e34/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(621, 207, 'https://picsum.photos/seed/2ebbb8c0-f198-3cc2-9e1f-1889e653bb97/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(622, 208, 'https://picsum.photos/seed/5b372130-a14c-3750-b86c-9f7f04e14fd1/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(623, 208, 'https://picsum.photos/seed/33f6ee81-a6d3-3afa-8009-a0d2634119d1/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(624, 208, 'https://picsum.photos/seed/a77a6fe3-811b-35f9-8479-e6318cf969ab/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(625, 209, 'https://picsum.photos/seed/2c36d589-3f34-3ddf-9c8e-4109314903cf/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(626, 209, 'https://picsum.photos/seed/fbc1fbe1-928f-3ef5-a037-e733fc9b8cd7/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(627, 209, 'https://picsum.photos/seed/785f52df-efd5-3bfe-903c-0cfaa98c6a89/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(628, 210, 'https://picsum.photos/seed/4b357d8a-70e4-3e1e-aa40-84d270477684/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(629, 210, 'https://picsum.photos/seed/8b67c336-5be2-3579-a2c9-d251a617b959/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(630, 210, 'https://picsum.photos/seed/6c50c2bc-caa1-37ba-9d6a-d7ce84e5ca9a/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(631, 211, 'https://picsum.photos/seed/f1b6da27-9693-3a37-a7c0-aca918fe5221/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(632, 211, 'https://picsum.photos/seed/80a1de5e-b0e5-32d9-b492-b2f8313def0d/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(633, 211, 'https://picsum.photos/seed/84614f1e-e8fd-39ff-9687-3894a9d9bbcc/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(634, 212, 'https://picsum.photos/seed/4859e127-ae40-36ed-af67-9beb664928f0/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(635, 212, 'https://picsum.photos/seed/36ff7bd0-7733-3c44-8ef8-a8134b008b6e/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(636, 212, 'https://picsum.photos/seed/66b6ee47-a191-3982-958a-c04fe2efe728/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(637, 213, 'https://picsum.photos/seed/67c0f974-2335-3199-afdb-5c844a05b3e6/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(638, 213, 'https://picsum.photos/seed/6382294e-30a5-370c-813e-e045330b6e6c/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(639, 213, 'https://picsum.photos/seed/dd41e67c-e0b4-3f3d-b0f8-146d13b47433/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(640, 214, 'https://picsum.photos/seed/735ec314-ceb4-351d-b18f-c3660fe2603a/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(641, 214, 'https://picsum.photos/seed/d5b98339-7222-3417-9f1b-167eb2320e30/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(642, 214, 'https://picsum.photos/seed/818bdeee-fa56-3060-b753-51743e039394/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(643, 215, 'https://picsum.photos/seed/1e403e4a-3111-3e84-9827-d04f66483348/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(644, 215, 'https://picsum.photos/seed/84e2264c-dbce-3cac-a229-bab36b9e0881/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(645, 215, 'https://picsum.photos/seed/b97d22fc-65db-3c72-b19c-9eb47799fef7/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(646, 216, 'https://picsum.photos/seed/9722cd81-15f2-3298-93b9-06e71359e2ea/600/450', 1, 1, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(647, 216, 'https://picsum.photos/seed/8312ec49-fe73-3180-8cb3-4aacdae9139c/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(648, 216, 'https://picsum.photos/seed/470d2c17-8ea9-3f42-bf02-46cd97bbb233/600/450', 0, 0, '2025-10-23 13:22:38', '2025-10-23 13:22:38'),
(649, 217, 'https://picsum.photos/seed/66cc5244-478b-3ba2-b86a-9351fbb37f69/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(650, 217, 'https://picsum.photos/seed/df0987bc-2519-34aa-bf87-cc697fe09e45/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(651, 217, 'https://picsum.photos/seed/eff26028-8893-343f-a7a1-eb2ebbb88611/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(652, 218, 'https://picsum.photos/seed/12364348-041b-3dcb-b183-1cf4aaee7d12/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(653, 218, 'https://picsum.photos/seed/01b91b30-0115-3f70-b54d-b3a7d49f9483/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(654, 218, 'https://picsum.photos/seed/e81ec9a5-df34-3a0d-93e6-d19f46f19c28/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(655, 219, 'https://picsum.photos/seed/025e46ce-f895-33fc-a765-31ae21c42964/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(656, 219, 'https://picsum.photos/seed/c11bd169-dfcd-3d38-95eb-3490ab19a2e7/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(657, 219, 'https://picsum.photos/seed/348990d6-72c6-3dca-b682-4b2752c02d75/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(658, 220, 'https://picsum.photos/seed/7f450486-fced-3074-8911-3b8fc991f95d/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(659, 220, 'https://picsum.photos/seed/83d8ffc3-b6f6-399e-8bc5-c1aae4e9a2e9/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(660, 220, 'https://picsum.photos/seed/5b9d6d04-5480-30a8-a9e3-bd1a76f048fb/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(661, 221, 'https://picsum.photos/seed/1113e55c-6296-30b4-a28a-c4c462aff0d0/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(662, 221, 'https://picsum.photos/seed/03b2c38a-ebf7-319d-a89f-4c1bb0b127bb/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(663, 221, 'https://picsum.photos/seed/17de59ac-623b-35bc-be6a-ab4601f6aaec/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(664, 222, 'https://picsum.photos/seed/15188605-09b8-3243-8891-a8eddb9b9f40/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(665, 222, 'https://picsum.photos/seed/fe2d4f62-cf20-3121-9363-2c9fbbb9096f/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(666, 222, 'https://picsum.photos/seed/649a3dc0-efe6-3d80-838f-411edca5e165/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(667, 223, 'https://picsum.photos/seed/dcc8e2fd-25eb-3d3a-86ce-145e1f89f256/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(668, 223, 'https://picsum.photos/seed/3a0b8cf3-b36a-31ab-9855-6cad4434b642/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(669, 223, 'https://picsum.photos/seed/4d4874ac-a17a-322e-892d-9917c44baf4e/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(670, 224, 'https://picsum.photos/seed/9effed7f-bd35-3217-94d1-943742a5f44b/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(671, 224, 'https://picsum.photos/seed/b3e28b27-7393-3b8b-8d4f-d39857c50f75/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(672, 224, 'https://picsum.photos/seed/ddf3ddb2-37e2-3c77-8210-aee693f9407d/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(673, 225, 'https://picsum.photos/seed/24750c4f-fc6d-319d-8c87-71008bd4fabb/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(674, 225, 'https://picsum.photos/seed/25ad3c36-adee-382e-abc4-f7158a32160c/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(675, 225, 'https://picsum.photos/seed/739ca905-9ed9-3fbc-8238-6a32df7f3787/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(676, 226, 'https://picsum.photos/seed/59d67920-76d3-36d4-b66a-da65ebecfd48/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(677, 226, 'https://picsum.photos/seed/39ddd2ac-ea54-311b-ada9-f796e96bf6e9/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(678, 226, 'https://picsum.photos/seed/836bba52-04a6-34ac-92da-db361fafa9b0/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(679, 227, 'https://picsum.photos/seed/71ac3f59-0155-3a17-a0f9-96fcf349b007/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(680, 227, 'https://picsum.photos/seed/ef2e5ef4-690d-3953-9d47-6cbdbd66041f/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(681, 227, 'https://picsum.photos/seed/937b3863-51c2-333c-842b-016c840f9319/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(682, 228, 'https://picsum.photos/seed/be30ca6f-4762-373e-b002-fb94421c23bf/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(683, 228, 'https://picsum.photos/seed/ecbb747c-f029-34d2-8a24-fcf7dc2c2d43/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(684, 228, 'https://picsum.photos/seed/941c8a10-0c1d-32eb-95c6-53cac3fd0c6f/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(685, 229, 'https://picsum.photos/seed/cbea8492-2c41-31e7-b8ec-af8f701916cb/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(686, 229, 'https://picsum.photos/seed/48f9c270-eb10-360e-a1e6-f4c42a424ecf/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(687, 229, 'https://picsum.photos/seed/37599eb5-0eae-3d73-920f-4d0e276ee13f/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(688, 230, 'https://picsum.photos/seed/cbe20f57-4e3e-3255-94d6-25061dadeee1/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(689, 230, 'https://picsum.photos/seed/01231b4e-3497-337d-8a36-8721355da23a/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(690, 230, 'https://picsum.photos/seed/80fc16c1-92b1-3c10-bdae-f3cb07dab4e4/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(691, 231, 'https://picsum.photos/seed/904303f9-0e1d-337d-880f-dd270dba50de/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(692, 231, 'https://picsum.photos/seed/a03c31f6-2578-391d-b95f-7109d779d1d2/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(693, 231, 'https://picsum.photos/seed/3751ab75-4851-341f-92e5-9787a50c7f94/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(694, 232, 'https://picsum.photos/seed/7f343f92-badf-3238-952c-1820a5d40175/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(695, 232, 'https://picsum.photos/seed/a99d24c1-7fbf-3719-ada3-3b5c4c30831c/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(696, 232, 'https://picsum.photos/seed/d160551c-886b-3cdb-9351-7dd554475041/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(697, 233, 'https://picsum.photos/seed/7b4774c8-967a-3c2a-a48d-64846d4066c9/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(698, 233, 'https://picsum.photos/seed/042aead4-a4a9-3f75-a75d-71ef7a128980/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(699, 233, 'https://picsum.photos/seed/56adbe7e-c63f-3a05-a153-d1ef9372a6c6/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(700, 234, 'https://picsum.photos/seed/911a35a8-ab60-3652-9104-cf31ce6b5a95/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(701, 234, 'https://picsum.photos/seed/c63a5ed6-28d4-373d-aac6-44f1a1e0bf7a/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(702, 234, 'https://picsum.photos/seed/4b7e0e03-284b-35ec-93e4-5a9add918bec/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(703, 235, 'https://picsum.photos/seed/a8741faf-2c42-3ae4-940b-8dc428ecfcb8/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(704, 235, 'https://picsum.photos/seed/c5cb7202-ac53-3140-a670-1101ef425019/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(705, 235, 'https://picsum.photos/seed/5b4aa134-582b-3d7b-8fe9-cfabe9f4db48/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(706, 236, 'https://picsum.photos/seed/2f7ced55-1b95-3f9e-a6d0-70f413d1ff37/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(707, 236, 'https://picsum.photos/seed/018e4549-c53c-3927-93d2-82de5d21e274/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(708, 236, 'https://picsum.photos/seed/6bfec9d2-b38d-3ef3-b077-fc92a990b518/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(709, 237, 'https://picsum.photos/seed/22c60bd1-f4a4-33db-b712-62af24249cf4/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(710, 237, 'https://picsum.photos/seed/9088ffae-2522-3e1e-85a1-08fb0fd3ee0c/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(711, 237, 'https://picsum.photos/seed/c13235fa-2cf6-3e31-938a-2452318557a7/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(712, 238, 'https://picsum.photos/seed/9eb7a1be-aab6-395f-8fda-7c5b4627daed/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(713, 238, 'https://picsum.photos/seed/773c879f-ff02-3693-808c-03c826f1ae17/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(714, 238, 'https://picsum.photos/seed/9d024f04-73e5-38cc-b174-8db3a99d3c8a/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(715, 239, 'https://picsum.photos/seed/b589f111-481e-3a17-ba09-38e49b454026/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(716, 239, 'https://picsum.photos/seed/1a495ff8-0567-39df-b00d-138459403be8/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(717, 239, 'https://picsum.photos/seed/e3f206d4-4228-37bf-ad54-50e24279e639/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(718, 240, 'https://picsum.photos/seed/6a702c09-c38b-302c-ba99-417a5430868b/600/450', 1, 1, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(719, 240, 'https://picsum.photos/seed/ef0eadde-d13a-31ec-93ae-60ad1f08a39e/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(720, 240, 'https://picsum.photos/seed/b10298dc-b75a-3f73-820f-b5039059a1f4/600/450', 0, 0, '2025-10-23 14:22:55', '2025-10-23 14:22:55'),
(721, 241, 'https://picsum.photos/seed/c70e8d92-da0a-3d60-9d85-f56a078340d5/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(722, 241, 'https://picsum.photos/seed/e3d1bc76-b50f-3118-af75-a66522453a1f/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(723, 241, 'https://picsum.photos/seed/f0612147-813f-3f30-abc3-8d0368b57cae/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(724, 242, 'https://picsum.photos/seed/6950e7f6-c679-3995-b8e0-a1b2c0a3b73d/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(725, 242, 'https://picsum.photos/seed/4660f8f7-a6c6-3d42-84c1-ae9e3a9a55ed/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(726, 242, 'https://picsum.photos/seed/2b37ac50-ae49-3e5b-beef-bf464cbada54/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(727, 243, 'https://picsum.photos/seed/9ac1ccd7-05f9-3f3c-b27a-32ac0eb3fd64/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(728, 243, 'https://picsum.photos/seed/675b2a1f-6b3e-38ae-9844-404fa7cecca7/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(729, 243, 'https://picsum.photos/seed/5f57dd67-1748-3c46-87d2-824351baa85d/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(730, 244, 'https://picsum.photos/seed/432c51a0-3234-3b93-9398-7449cb420112/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(731, 244, 'https://picsum.photos/seed/f795a014-a1a7-3519-a80a-a1b50be772a8/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56');
INSERT INTO `product_images` (`id`, `product_id`, `path`, `position`, `is_primary`, `created_at`, `updated_at`) VALUES
(732, 244, 'https://picsum.photos/seed/22dc86ba-8a13-37f6-8f95-c01dea0f07e1/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(733, 245, 'https://picsum.photos/seed/35c2c235-ea53-38e3-9f7b-8d383b292a4e/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(734, 245, 'https://picsum.photos/seed/93bcf466-13b1-3268-94ed-69807e24c085/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(735, 245, 'https://picsum.photos/seed/a08b5bae-c984-3000-9af0-76d4e0c252f8/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(736, 246, 'https://picsum.photos/seed/d5cfdf3f-e9dd-3d1e-b14c-b7674cad03c5/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(737, 246, 'https://picsum.photos/seed/ca4a86fd-7a00-3955-b8e2-a53300f2522c/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(738, 246, 'https://picsum.photos/seed/ef104797-563e-322f-a12b-426c07ae753c/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(739, 247, 'https://picsum.photos/seed/085115a2-67fa-37a8-bcd3-01809412f230/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(740, 247, 'https://picsum.photos/seed/d288bbbc-1f93-3617-a6b5-bcf061d0f2ae/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(741, 247, 'https://picsum.photos/seed/3d5e0cdd-e682-372e-b07c-f52fdbe2beea/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(742, 248, 'https://picsum.photos/seed/b258cd09-4287-356a-b179-b7aeaf5ab1c8/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(743, 248, 'https://picsum.photos/seed/0f46acc7-34a6-3ef1-8996-d2532db3aee9/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(744, 248, 'https://picsum.photos/seed/9f676865-0a47-3e7b-8615-83eab1bf969c/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(745, 249, 'https://picsum.photos/seed/2ad1fbdc-7fe4-3965-bdaf-e088c36fbd1b/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(746, 249, 'https://picsum.photos/seed/2b5dc4b1-830e-346d-a3c0-f88a0efcb7c7/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(747, 249, 'https://picsum.photos/seed/5068e183-1c02-3fbf-b173-963fe038b877/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(748, 250, 'https://picsum.photos/seed/b098b48e-8f71-35e4-8259-ac66202fa2ab/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(749, 250, 'https://picsum.photos/seed/835168cc-2958-31ab-ac9b-0dee31b70cc6/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(750, 250, 'https://picsum.photos/seed/f00354a5-be0c-3e88-9d04-e304e9afc67f/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(751, 251, 'https://picsum.photos/seed/9dc55411-6629-3d4c-9ece-03757649c767/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(752, 251, 'https://picsum.photos/seed/68bff6ae-4346-37d6-80d1-7539aee79456/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(753, 251, 'https://picsum.photos/seed/1450d75d-6f13-3142-941c-d27c4358be76/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(754, 252, 'https://picsum.photos/seed/3a34a091-d040-3194-b8ce-c9dd4efe65d4/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(755, 252, 'https://picsum.photos/seed/298a82b9-a975-3821-8979-f6fb66530717/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(756, 252, 'https://picsum.photos/seed/080fd696-58e8-32c1-b0f5-a9d4b94ff7c9/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(757, 253, 'https://picsum.photos/seed/61c3217f-b129-3acf-a7f1-3b606cdd1de2/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(758, 253, 'https://picsum.photos/seed/17a6790b-45e7-30aa-a7ba-c49efaf60dca/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(759, 253, 'https://picsum.photos/seed/60bcdd6f-b4da-34e5-ae0e-d35601dcbd5f/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(760, 254, 'https://picsum.photos/seed/eb97cd62-f198-3ed0-8498-21415ea5a231/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(761, 254, 'https://picsum.photos/seed/62787377-b51c-3700-887d-9992e7282f4e/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(762, 254, 'https://picsum.photos/seed/c124cc51-bc73-320a-bc85-5705cabb26c3/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(763, 255, 'https://picsum.photos/seed/3bfdac92-05a1-32cd-9032-8a4b56cf3a80/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(764, 255, 'https://picsum.photos/seed/04cdee57-2bbe-3127-a94e-d99e2373a593/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(765, 255, 'https://picsum.photos/seed/608134be-49c4-3df7-9cc6-6d524dbbe48d/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(766, 256, 'https://picsum.photos/seed/fe07b016-01c3-37f0-97ef-10852f30647e/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(767, 256, 'https://picsum.photos/seed/73a2a253-43f5-3215-8e65-2b6182fc28fd/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(768, 256, 'https://picsum.photos/seed/caa7a321-dd7f-3a4b-8845-38f5d91e23a7/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(769, 257, 'https://picsum.photos/seed/7147b984-dc17-3377-bdc5-306689a1a98d/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(770, 257, 'https://picsum.photos/seed/c60810f0-2f80-301f-97ec-28799e4c5851/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(771, 257, 'https://picsum.photos/seed/1bc192aa-f95e-3346-b9e6-8e5444c23234/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(772, 258, 'https://picsum.photos/seed/3070855e-b5b0-3ef4-9922-fabac1040686/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(773, 258, 'https://picsum.photos/seed/a8f0c798-920f-3bbd-9082-714d00967418/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(774, 258, 'https://picsum.photos/seed/0fc7e7ca-5480-3a6d-a0aa-c3bdeaef9c3c/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(775, 259, 'https://picsum.photos/seed/7be67e92-ec49-3cc4-b0b5-e9dae619aeb2/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(776, 259, 'https://picsum.photos/seed/709b768e-98f8-3e2d-bcfe-03d5e6901365/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(777, 259, 'https://picsum.photos/seed/46885967-f0a1-3b87-b838-60873e6f4d7f/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(778, 260, 'https://picsum.photos/seed/342d8f65-920d-3fe0-874c-508879c5dc9f/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(779, 260, 'https://picsum.photos/seed/c876dcb5-46e9-3f9e-ae7d-4d6342fbe6dd/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(780, 260, 'https://picsum.photos/seed/48f2dfcb-bb3e-3589-9072-790023ee19e3/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(781, 261, 'https://picsum.photos/seed/7cb9323f-665b-3397-8934-780aec560c23/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(782, 261, 'https://picsum.photos/seed/58857b4f-8575-36e0-b48e-44c583cd45cb/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(783, 261, 'https://picsum.photos/seed/262b37fa-f521-33e5-a371-8da70c2c7176/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(784, 262, 'https://picsum.photos/seed/6a02c305-dff0-34c1-8aaf-c67d88e7bf90/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(785, 262, 'https://picsum.photos/seed/00eb2c99-40b1-35eb-80a0-2a07f2d8993a/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(786, 262, 'https://picsum.photos/seed/a08702b0-fd06-3d67-af4e-a7840561c560/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(787, 263, 'https://picsum.photos/seed/8469c740-2240-3224-9e79-d6e5148c0749/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(788, 263, 'https://picsum.photos/seed/65505830-79ca-3b43-9b21-08a3f367eb85/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(789, 263, 'https://picsum.photos/seed/fa359dcd-fc08-3fdf-b49d-da7f2cf98a7e/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(790, 264, 'https://picsum.photos/seed/b23bab28-9b40-3165-8e76-55cb52aeb1e6/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(791, 264, 'https://picsum.photos/seed/f70e4f28-4ef0-3141-a2a2-47cff3607952/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(792, 264, 'https://picsum.photos/seed/bb6b6e4f-b989-3ff6-86b1-886394bc2077/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(793, 265, 'https://picsum.photos/seed/25ec0f6b-304a-34bf-9926-c6c81fe3650e/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(794, 265, 'https://picsum.photos/seed/3f96ad93-f80e-3f96-b174-892eca1cc5d2/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(795, 265, 'https://picsum.photos/seed/5829bd0e-9cd3-3c78-8420-aa7230eae28c/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(796, 266, 'https://picsum.photos/seed/6e0b77a0-2be1-344d-b720-1bb81f38e7b2/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(797, 266, 'https://picsum.photos/seed/81fcd53f-a62e-33e2-96f1-5d53f45a5669/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(798, 266, 'https://picsum.photos/seed/b2368e61-d1f1-3004-a31b-561b42dffafb/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(799, 267, 'https://picsum.photos/seed/5b98cc69-66a9-3a0c-90cf-bff72daee3d1/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(800, 267, 'https://picsum.photos/seed/be827f03-9798-307b-ac7d-9c527783777b/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(801, 267, 'https://picsum.photos/seed/2932b3e8-7b35-3112-aa2b-3d7dff4c4f75/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(802, 268, 'https://picsum.photos/seed/d8eb09dc-2e76-3263-b149-86ae50eb8c7e/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(803, 268, 'https://picsum.photos/seed/92f71edd-a349-305e-92d0-3f79dce7ea96/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(804, 268, 'https://picsum.photos/seed/e79c81ea-e006-3607-a106-ea026aa8c3b2/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(805, 269, 'https://picsum.photos/seed/85af967a-bd35-3594-9468-bf27a2728fc6/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(806, 269, 'https://picsum.photos/seed/5d17ce0b-afd5-34ee-867f-996203f5bb22/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(807, 269, 'https://picsum.photos/seed/a7edf16b-1684-3fed-b5d5-03885d92ed2f/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(808, 270, 'https://picsum.photos/seed/d93ce053-4f0d-3545-8224-9997218e617b/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(809, 270, 'https://picsum.photos/seed/eb6172ce-1fc9-3898-aed5-027422cbf440/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(810, 270, 'https://picsum.photos/seed/1062f27a-2c4f-396a-b447-37e39fc1002d/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(811, 271, 'https://picsum.photos/seed/6867bd2f-389e-3344-b16c-8bff0af12b6a/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(812, 271, 'https://picsum.photos/seed/fb1f5119-bd4b-3474-b4da-46b1c65cd980/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(813, 271, 'https://picsum.photos/seed/3d9187eb-973f-3256-a439-9e2b1eb13bdf/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(814, 272, 'https://picsum.photos/seed/1cedec60-bf4b-3468-88a3-d18e375d1875/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(815, 272, 'https://picsum.photos/seed/fece39a5-b7fc-39ae-b967-dfc6914b4683/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(816, 272, 'https://picsum.photos/seed/16387790-5e5a-3317-9240-48531f62ff1d/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(817, 273, 'https://picsum.photos/seed/6fdb9ccd-3eb2-3feb-b4ed-03a36b413b4a/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(818, 273, 'https://picsum.photos/seed/029adee0-c4bd-380b-aba8-a28c89ed61d7/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(819, 273, 'https://picsum.photos/seed/867f43cc-7700-30c6-9890-76a672a836be/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(820, 274, 'https://picsum.photos/seed/c647ca7a-22ed-3423-9713-caf2bc3237fd/600/450', 1, 1, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(821, 274, 'https://picsum.photos/seed/62a1350e-fca9-3084-865f-f5d5533370c5/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(822, 274, 'https://picsum.photos/seed/73546706-67fa-3133-8bca-243a131c14f1/600/450', 0, 0, '2025-10-23 14:22:56', '2025-10-23 14:22:56'),
(823, 275, 'https://picsum.photos/seed/733dd3de-2413-3791-ab83-57d58f0f2cee/600/450', 1, 1, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(824, 275, 'https://picsum.photos/seed/260e7e17-d4fa-39f3-873e-6b956a1684cc/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(825, 275, 'https://picsum.photos/seed/54bdc9ea-0814-3f90-86f1-40fd51a5d764/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(826, 276, 'https://picsum.photos/seed/e9228779-a61a-328d-a482-985d906256e3/600/450', 1, 1, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(827, 276, 'https://picsum.photos/seed/6e3d49b9-84ae-3c44-be44-5779fa9d44b7/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(828, 276, 'https://picsum.photos/seed/f395eb8c-31c2-3bb5-abce-4fc2b85f3b10/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(829, 277, 'https://picsum.photos/seed/f486f070-cd71-3270-b64c-056d5d03c4d0/600/450', 1, 1, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(830, 277, 'https://picsum.photos/seed/6b4f2550-aab3-31d8-b4aa-74fd53c55aab/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(831, 277, 'https://picsum.photos/seed/63cda32b-b18b-341c-a49b-400bd398f9a6/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(832, 278, 'https://picsum.photos/seed/b2790317-1fd1-3241-b94b-51698ed9f693/600/450', 1, 1, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(833, 278, 'https://picsum.photos/seed/4cfa9da5-fed1-3a99-9475-69295b6b5a5f/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(834, 278, 'https://picsum.photos/seed/e9deef3f-1005-3db7-8bec-c4ac27f200b4/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(835, 279, 'https://picsum.photos/seed/ebd005b7-d282-3e38-8112-8f405bb1a8ae/600/450', 1, 1, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(836, 279, 'https://picsum.photos/seed/c79e0e9f-bfef-355e-89ab-b50c0e49152f/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(837, 279, 'https://picsum.photos/seed/357f9f90-48e6-3a97-81c2-c9f02675d650/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(838, 280, 'https://picsum.photos/seed/c4895b33-95c0-3e41-bc84-2b4ba0f6a960/600/450', 1, 1, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(839, 280, 'https://picsum.photos/seed/6e428534-ad6d-398c-ba16-3e9c7255608a/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(840, 280, 'https://picsum.photos/seed/16e6f71c-a6a7-3f13-9ad5-e184ea1f4dd6/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(841, 281, 'https://picsum.photos/seed/d907c4b7-ec06-39b7-8aaf-5b1d098a35f7/600/450', 1, 1, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(842, 281, 'https://picsum.photos/seed/77f92ecd-9c15-3217-b1df-2e167716ef18/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(843, 281, 'https://picsum.photos/seed/dc82e91b-7e3d-3b62-9803-37203979a121/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(844, 282, 'https://picsum.photos/seed/bcf82f01-519d-32e8-918f-8c01eb78d7d5/600/450', 1, 1, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(845, 282, 'https://picsum.photos/seed/02fa3a32-49b8-3489-912a-bf297700d757/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(846, 282, 'https://picsum.photos/seed/bf124bfe-6cd2-3c5f-879b-a8e647b0376e/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(847, 283, 'https://picsum.photos/seed/28f61bcb-aeeb-3679-b9a8-ebb960a08368/600/450', 1, 1, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(848, 283, 'https://picsum.photos/seed/b6541ee3-670e-3be7-b302-93826e24fc7d/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(849, 283, 'https://picsum.photos/seed/6a0a29a2-ee3f-3e69-9268-5716e84b3e92/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(850, 284, 'https://picsum.photos/seed/c512bfad-4f79-3955-9ed4-95b4162d360a/600/450', 1, 1, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(851, 284, 'https://picsum.photos/seed/f19c1e85-338c-386f-ba4c-66ca39b604fb/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(852, 284, 'https://picsum.photos/seed/20d0a93f-0310-3bfe-8a3b-83b701b9d928/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(853, 285, 'https://picsum.photos/seed/8c0d8c2c-c6ee-328c-933c-b741502a0aed/600/450', 1, 1, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(854, 285, 'https://picsum.photos/seed/ee98727f-a8c5-36d8-af39-099abfaa8e48/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(855, 285, 'https://picsum.photos/seed/5c73123f-e146-38f8-881e-2b40d5c9482d/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(856, 286, 'https://picsum.photos/seed/105ab645-28dd-32dc-b272-27564c070352/600/450', 1, 1, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(857, 286, 'https://picsum.photos/seed/a3595ef8-f0bd-3646-8eb8-c476baac0e7e/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(858, 286, 'https://picsum.photos/seed/df9f6e3c-4776-3ab7-a7b9-9a1e8798334f/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(859, 287, 'https://picsum.photos/seed/e2e5115c-95b5-32bb-a88d-05bece2a21b8/600/450', 1, 1, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(860, 287, 'https://picsum.photos/seed/b5e538b5-aedc-38eb-aaf0-0b91945c218f/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(861, 287, 'https://picsum.photos/seed/fe72a7f8-dba6-3459-8cc1-583004e489d4/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(862, 288, 'https://picsum.photos/seed/bacd69d0-7348-3001-aeb9-73c90fb1d49a/600/450', 1, 1, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(863, 288, 'https://picsum.photos/seed/c65c1128-0661-3ccc-8a69-529d5ff15cbd/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(864, 288, 'https://picsum.photos/seed/36551982-d7c2-3719-af9e-34cd0cde1d7a/600/450', 0, 0, '2025-10-23 14:22:57', '2025-10-23 14:22:57'),
(865, 289, 'https://picsum.photos/seed/4e3d08dc-7fb4-34ed-99e2-b56344ddaf2d/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(866, 289, 'https://picsum.photos/seed/f8100dbf-0b65-341a-b141-764d54fb13b1/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(867, 289, 'https://picsum.photos/seed/c86b2fb4-6535-3ac5-bef0-fc5cda780550/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(868, 290, 'https://picsum.photos/seed/c9666291-e2a1-3a0f-8e4d-7214ad3c7b5e/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(869, 290, 'https://picsum.photos/seed/673f68e6-c41b-30f1-b574-0c93c7257796/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(870, 290, 'https://picsum.photos/seed/15806815-28e9-3365-b5f0-958600f8fec1/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(871, 291, 'https://picsum.photos/seed/f11cca96-3156-37e3-9bf7-979f37a0041b/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(872, 291, 'https://picsum.photos/seed/bff2a29c-9d61-3108-ba1d-758cb8218c03/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(873, 291, 'https://picsum.photos/seed/2322bb02-6389-3dad-a49b-d7cecbca30c8/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(874, 292, 'https://picsum.photos/seed/366adc88-a87e-3555-a319-36f866b59cbe/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(875, 292, 'https://picsum.photos/seed/20d83c98-5260-35d8-a589-605020813568/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(876, 292, 'https://picsum.photos/seed/5dd81fd8-cf93-3a4f-a574-c4f06df183cf/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(877, 293, 'https://picsum.photos/seed/6133b275-2e20-3a7f-8b41-114b2a633eeb/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(878, 293, 'https://picsum.photos/seed/eb809b4b-a43a-3bb5-9752-cf8220742e98/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(879, 293, 'https://picsum.photos/seed/f849d0d1-38a8-3424-9c4f-068499bc03e6/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(880, 294, 'https://picsum.photos/seed/619ccf13-3a32-3a9d-b7a6-3472998d118a/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(881, 294, 'https://picsum.photos/seed/f2214c16-ba3f-3733-8423-3da5ac96930c/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(882, 294, 'https://picsum.photos/seed/1bce3abe-c1ad-3d1c-8576-aef2f5c286d9/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(883, 295, 'https://picsum.photos/seed/da1405aa-dd07-3fd9-bd56-07f8e676a520/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(884, 295, 'https://picsum.photos/seed/6ca0cd8c-804c-3aa9-9c15-413f8db07345/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(885, 295, 'https://picsum.photos/seed/9f886488-bb2b-3d4b-89e6-04b769285969/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(886, 296, 'https://picsum.photos/seed/3e9c2eeb-5ea8-3de0-bc8b-86128a477530/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(887, 296, 'https://picsum.photos/seed/9cfbd264-00ee-39c4-9525-6eb3def9821e/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(888, 296, 'https://picsum.photos/seed/8bc2e2f1-6a21-31ce-84c1-270c81f5d7a3/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(889, 297, 'https://picsum.photos/seed/d6b0274c-e37f-3ef3-8d3a-1db7b82826de/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(890, 297, 'https://picsum.photos/seed/683bd44d-c7f3-3bc6-930d-c0537913ecee/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(891, 297, 'https://picsum.photos/seed/e22614c5-bfba-38b2-9801-52b202976bfe/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(892, 298, 'https://picsum.photos/seed/7e8e15ad-96ed-3f55-8c95-df477da53a0e/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(893, 298, 'https://picsum.photos/seed/b8178ba0-fe4c-3a9a-84fa-4d247c6c315a/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(894, 298, 'https://picsum.photos/seed/5ef0cf8e-f2db-3c6c-b376-df40daa6067d/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(895, 299, 'https://picsum.photos/seed/f3e686bd-d788-324e-b0e4-83ec7d88a376/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(896, 299, 'https://picsum.photos/seed/6d84ba02-7397-35a7-8aa2-c97cacc32612/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(897, 299, 'https://picsum.photos/seed/18e37bba-0710-38ed-a558-6a32da64c5a7/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(898, 300, 'https://picsum.photos/seed/1c12a608-692f-36f8-8f3e-63d6a6aa6674/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(899, 300, 'https://picsum.photos/seed/64c2c76a-5649-3251-92b9-ca86f8c13a69/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(900, 300, 'https://picsum.photos/seed/4e8ef412-9fb5-3c78-8289-2b9dc04566b7/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(901, 301, 'https://picsum.photos/seed/d7b056ce-5b66-36c0-a798-7101316b7eef/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(902, 301, 'https://picsum.photos/seed/930180ad-9742-3110-bd49-a366bbe07f47/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(903, 301, 'https://picsum.photos/seed/093853e3-c535-3d9a-a584-e46fd5000ad1/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(904, 302, 'https://picsum.photos/seed/2981e230-99ea-3d81-b96f-83c25a394aa8/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(905, 302, 'https://picsum.photos/seed/37a2d897-e9bd-30e3-8194-f2575469d2da/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(906, 302, 'https://picsum.photos/seed/cddaf3ed-aab1-3fe1-96d6-dcbac497193d/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(907, 303, 'https://picsum.photos/seed/a20aad66-85f8-3efa-87be-0340618b3f8a/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(908, 303, 'https://picsum.photos/seed/738df25a-f403-3a97-b541-281068c630e6/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(909, 303, 'https://picsum.photos/seed/d28c9034-b3d6-3e40-87b5-b1cf066d3b7d/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(910, 304, 'https://picsum.photos/seed/1519f82b-e89b-3ba1-b8ab-c18ce004c1d1/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(911, 304, 'https://picsum.photos/seed/58819615-fc0d-35a0-9a30-ee8d605926b4/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(912, 304, 'https://picsum.photos/seed/ce9059ee-9310-356d-8a3f-50486c194fa1/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(913, 305, 'https://picsum.photos/seed/8f22b1b7-13a6-310d-8ff1-ac53201442bd/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(914, 305, 'https://picsum.photos/seed/01ad0239-248e-315f-805d-34171d839ce7/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(915, 305, 'https://picsum.photos/seed/168caf57-9cdd-3b1e-bc64-e1a9d9d9b185/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(916, 306, 'https://picsum.photos/seed/e49d4dc7-641c-3757-a0b9-d574508bae99/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(917, 306, 'https://picsum.photos/seed/c44ee3cc-309e-326b-954f-9fd35f0fabf5/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(918, 306, 'https://picsum.photos/seed/33086f6e-7426-38a9-b1ca-8f1d573f61e8/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(919, 307, 'https://picsum.photos/seed/43747940-8e4c-35fe-9553-62466a49ccf8/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(920, 307, 'https://picsum.photos/seed/e08ef33f-355f-3be1-b4d5-214fae04c97c/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(921, 307, 'https://picsum.photos/seed/1264bac6-d4cf-357b-9b3e-bf702b738a48/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(922, 308, 'https://picsum.photos/seed/440ce028-7deb-3792-b2e1-3193987c5b35/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(923, 308, 'https://picsum.photos/seed/ab306bbe-4c4c-3bb1-bd0e-978c01c5ee0a/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(924, 308, 'https://picsum.photos/seed/3b6dc6dd-598d-3fbe-8442-bdf04a89c8ff/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(925, 309, 'https://picsum.photos/seed/5ee8bfcb-5514-3553-b9de-f09ad4bd85bc/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(926, 309, 'https://picsum.photos/seed/4602764d-3f34-38bf-80b3-3a85393fa771/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(927, 309, 'https://picsum.photos/seed/35797367-01c2-31ca-a26a-853d6ea3bc3e/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(928, 310, 'https://picsum.photos/seed/96dde5b9-6516-33f8-b6a9-a57939d51eed/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(929, 310, 'https://picsum.photos/seed/67466b5a-1b09-3169-978e-cb3718699761/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(930, 310, 'https://picsum.photos/seed/e6947d15-28f2-3c51-bef6-a041092f73aa/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(931, 311, 'https://picsum.photos/seed/38ad470f-ad5b-3283-aff2-aaf2a86c426e/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(932, 311, 'https://picsum.photos/seed/7f031ee9-de9f-3ee1-a1ed-2141ffbf8110/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(933, 311, 'https://picsum.photos/seed/591ba020-d1d0-358c-a6c4-d274b3d6940c/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(934, 312, 'https://picsum.photos/seed/a7abc072-0f9a-3940-bf46-b7c5c10dda50/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(935, 312, 'https://picsum.photos/seed/0d168f09-c206-377f-8067-d8cdf66da81b/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(936, 312, 'https://picsum.photos/seed/8aa8e677-3002-3677-9ec1-007fc8fc91c4/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(937, 313, 'https://picsum.photos/seed/b8c59e1c-0b26-3d2c-91bf-3cf24324b817/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(938, 313, 'https://picsum.photos/seed/9036820f-3cb3-39db-8a54-e43404571acc/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(939, 313, 'https://picsum.photos/seed/d12b8be5-ed12-3907-aba0-db791903b061/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(940, 314, 'https://picsum.photos/seed/8db96fca-51cf-3756-9a98-92001bc512a6/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(941, 314, 'https://picsum.photos/seed/c3e9510d-baca-3c9d-8823-48313b896483/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(942, 314, 'https://picsum.photos/seed/6f674854-5981-388a-aecc-2c57ac884edc/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(943, 315, 'https://picsum.photos/seed/333d6693-99ae-37ea-8e6b-1859c08d2dc0/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(944, 315, 'https://picsum.photos/seed/b30317f8-7f2d-3e6e-a1cb-451a04d243dc/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(945, 315, 'https://picsum.photos/seed/ae1348c5-4370-32ea-aaf7-b49d39be92d0/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(946, 316, 'https://picsum.photos/seed/45b7b956-db5b-3b73-8022-4945d426dae6/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(947, 316, 'https://picsum.photos/seed/4afb50d3-b531-37a6-9d14-081c2dba8132/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(948, 316, 'https://picsum.photos/seed/a2fdfd8b-048a-37cd-971d-46c57a36fbe0/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(949, 317, 'https://picsum.photos/seed/425dd4ee-f4aa-336d-a697-37df588ce85d/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(950, 317, 'https://picsum.photos/seed/bb2aed07-ef30-38cd-87cb-ee13007b45db/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(951, 317, 'https://picsum.photos/seed/5180b19c-6f2d-38f0-8941-a9cb6de3173d/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(952, 318, 'https://picsum.photos/seed/38a0a97a-c0a1-318f-aa7d-1a080a1a7ff4/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(953, 318, 'https://picsum.photos/seed/e500a87f-587c-34bd-908d-22cbead4ea34/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(954, 318, 'https://picsum.photos/seed/36776839-c2aa-3f1f-a768-505c0469f747/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(955, 319, 'https://picsum.photos/seed/83913016-d0f9-3755-bd82-00125e7bcfef/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(956, 319, 'https://picsum.photos/seed/a94f1167-f3f8-31c0-be17-79cf718f70c0/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(957, 319, 'https://picsum.photos/seed/853a5ac3-ca8c-3b39-92f9-439200c791d6/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(958, 320, 'https://picsum.photos/seed/6c2f8637-4e8a-3f06-94bc-f0a177e791b0/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(959, 320, 'https://picsum.photos/seed/2b01a972-38a9-3921-ad6e-0e82bdd643d2/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(960, 320, 'https://picsum.photos/seed/22d1b07e-3e52-3097-876e-fcb7d03de2a1/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(961, 321, 'https://picsum.photos/seed/b7570a18-934e-31c7-9cc2-c1809f808d25/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(962, 321, 'https://picsum.photos/seed/53386c6f-7958-3d68-8549-8ffb69d266cd/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(963, 321, 'https://picsum.photos/seed/379a974c-e552-3c50-8857-ae6c2d6f7e6d/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(964, 322, 'https://picsum.photos/seed/ad7abf34-2aca-3bd5-91de-53192f4bd456/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(965, 322, 'https://picsum.photos/seed/9155db6c-7ebd-33dd-bd5a-faae66c857ef/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(966, 322, 'https://picsum.photos/seed/6375c674-086c-3fb8-ae85-c69bed907cc4/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(967, 323, 'https://picsum.photos/seed/fdc53969-8c05-38e5-9f6e-e706bf728003/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(968, 323, 'https://picsum.photos/seed/3668bedb-b105-36d7-80cf-15bf6977a473/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(969, 323, 'https://picsum.photos/seed/611de2c7-ccbf-3f57-9c02-4f1a6a7312c1/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(970, 324, 'https://picsum.photos/seed/fa444c4e-d890-3571-9992-610a6422b12b/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(971, 324, 'https://picsum.photos/seed/80837f6b-68d3-3845-8540-195b2ae070c2/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(972, 324, 'https://picsum.photos/seed/948cc956-87d9-358a-bbd1-925bca85114d/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(973, 325, 'https://picsum.photos/seed/8fc512dd-6680-38b3-a453-fa44bb666ffe/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(974, 325, 'https://picsum.photos/seed/711dc5eb-d21f-3da1-ba53-a1a8b425bbf0/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(975, 325, 'https://picsum.photos/seed/0ede9b0c-ddc3-3b62-8c38-1b2b4a3111c6/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(976, 326, 'https://picsum.photos/seed/ceb2346e-3e95-30eb-b953-3363cbf77b7b/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(977, 326, 'https://picsum.photos/seed/0d33c459-5232-3972-af5c-9319dd50e991/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(978, 326, 'https://picsum.photos/seed/596c2c22-7347-39e2-8d45-3d62aafc33e4/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(979, 327, 'https://picsum.photos/seed/b8470c38-9c52-3dd1-b53f-f3d17036b765/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(980, 327, 'https://picsum.photos/seed/7c5a02b0-a78d-3dfa-a357-f3768b85c450/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(981, 327, 'https://picsum.photos/seed/a52ad5b1-e6f3-3cc8-847f-6746b60a5702/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(982, 328, 'https://picsum.photos/seed/d427dcca-5fdf-323f-8214-4422f586e292/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(983, 328, 'https://picsum.photos/seed/31d0b960-350f-33dd-9dcf-a075cfeee87f/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(984, 328, 'https://picsum.photos/seed/887ff9ef-3723-3294-9cf9-d97663040ea9/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(985, 329, 'https://picsum.photos/seed/ce751b05-e4a7-3d49-9b83-93e57be9ae5e/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(986, 329, 'https://picsum.photos/seed/bd3a1813-e41d-3a3e-89b0-cd9b8cc301cd/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(987, 329, 'https://picsum.photos/seed/d83e9ec3-ae24-3785-8b0b-370a553c20c2/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(988, 330, 'https://picsum.photos/seed/46f64452-a194-3d87-862f-11d4be11259f/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(989, 330, 'https://picsum.photos/seed/63ca2ab6-1979-3ccf-9ea7-a437e6bf934c/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(990, 330, 'https://picsum.photos/seed/21e55e71-ba05-3d14-b16c-ee050eaf8768/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(991, 331, 'https://picsum.photos/seed/ca6561ce-4e69-3c97-939f-03be692a2b0c/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(992, 331, 'https://picsum.photos/seed/987bb608-8d52-3c75-9bfa-25e8b6605757/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(993, 331, 'https://picsum.photos/seed/fb2e4d6b-458b-3a10-8b8c-1c5566caa438/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(994, 332, 'https://picsum.photos/seed/d8416217-3a17-3bd1-8369-6958d8dcd9fa/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(995, 332, 'https://picsum.photos/seed/15064ab1-a65b-35d8-a940-6a4f5499058a/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(996, 332, 'https://picsum.photos/seed/74d5a916-c050-32a1-8e58-cdcbddcb445d/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(997, 333, 'https://picsum.photos/seed/1b0490a0-1769-3177-84a3-f6d8000dee4e/600/450', 1, 1, '2025-10-23 15:24:45', '2025-10-23 15:24:46'),
(998, 333, 'https://picsum.photos/seed/ea59fc26-5a4e-3bcb-8874-ca6983553889/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(999, 333, 'https://picsum.photos/seed/e2902001-9fcc-3c89-8343-c8d40c6b40ec/600/450', 0, 0, '2025-10-23 15:24:45', '2025-10-23 15:24:45'),
(1000, 334, 'https://picsum.photos/seed/76f696aa-afd5-3b25-92e4-d1a09b3b2c1d/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1001, 334, 'https://picsum.photos/seed/31d6368d-056a-38d9-8c4c-1611e790ddf3/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1002, 334, 'https://picsum.photos/seed/145e61aa-4600-304d-ac17-2c31eb5a1072/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1003, 335, 'https://picsum.photos/seed/0ed5324e-4b5f-3421-923f-3b4b608de9a2/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1004, 335, 'https://picsum.photos/seed/9e6d8cb0-b5a4-3e48-847b-e1d0b2d69c61/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1005, 335, 'https://picsum.photos/seed/807458de-2a22-30cd-8b99-aac2e2d66a19/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1006, 336, 'https://picsum.photos/seed/7d2bb66f-862d-3939-9367-dea1d2ebefea/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1007, 336, 'https://picsum.photos/seed/7f7072ce-16e9-3a22-84c6-fc125418dbfa/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1008, 336, 'https://picsum.photos/seed/f14a56ae-c46e-31f8-b90f-9b0e8940aac8/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1009, 337, 'https://picsum.photos/seed/bb4e0f5c-d21e-3acc-b193-6d85cc55087f/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1010, 337, 'https://picsum.photos/seed/e22034f2-6d25-3070-be08-690c40940dd4/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1011, 337, 'https://picsum.photos/seed/eb28c8d4-cf97-3f63-87c2-f45fbc5acd36/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1012, 338, 'https://picsum.photos/seed/535fd091-37de-3639-967b-a81bbbf09d40/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1013, 338, 'https://picsum.photos/seed/61c3b7ad-1ed5-3e3e-961a-2100fdeb3ac0/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1014, 338, 'https://picsum.photos/seed/9eab8e82-7942-30e5-ad0d-25d26c8df4b7/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1015, 339, 'https://picsum.photos/seed/37836b54-22f6-3e39-819d-c845c6567aee/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1016, 339, 'https://picsum.photos/seed/171c14e8-f07a-3637-aefd-64073eb8fc54/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1017, 339, 'https://picsum.photos/seed/7aeb9ccc-f1d2-300f-8331-69ea2b1afd19/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1018, 340, 'https://picsum.photos/seed/842e98c9-5b6c-339e-b3f7-f70295189886/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1019, 340, 'https://picsum.photos/seed/1e4d8327-9540-3e12-8664-6599357e4d62/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1020, 340, 'https://picsum.photos/seed/40e60125-2ca1-3ccb-a995-1c494a2f7b2b/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1021, 341, 'https://picsum.photos/seed/26ff5c6e-9f91-33ce-ba4e-16e1217cc79d/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1022, 341, 'https://picsum.photos/seed/56e52166-098b-3aa8-97a0-9d249eaba5ce/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1023, 341, 'https://picsum.photos/seed/314f8a79-5635-3ea4-a300-ffd5c33bbd1e/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1024, 342, 'https://picsum.photos/seed/a70c80b3-5237-3985-beca-22cdc5b3cd1f/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1025, 342, 'https://picsum.photos/seed/635f3806-0f71-3fd1-8aed-1fa47fb2f1bf/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1026, 342, 'https://picsum.photos/seed/113d2b49-a16f-335a-bb04-4732f41e6f6e/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1027, 343, 'https://picsum.photos/seed/41a2caa3-a863-33e2-a431-bcbb905fc90d/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1028, 343, 'https://picsum.photos/seed/d870f023-6fe2-3439-a8c4-a58309086459/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1029, 343, 'https://picsum.photos/seed/1cfecfd5-b1af-309b-9382-afa4f88f2d33/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1030, 344, 'https://picsum.photos/seed/56517d53-6444-38e7-be6d-fb9af8e64364/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1031, 344, 'https://picsum.photos/seed/31853232-3075-3a80-9fd8-d88987a17f83/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1032, 344, 'https://picsum.photos/seed/e89bc501-a3f5-3142-8a3c-09a2c2531353/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1033, 345, 'https://picsum.photos/seed/4de25a55-2021-3adc-b12b-f60ad3483fd7/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1034, 345, 'https://picsum.photos/seed/7ede1998-c7bd-342e-ab1d-ba643e49f4b4/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1035, 345, 'https://picsum.photos/seed/edb9cb46-f0fa-3163-aa19-a4c92ec803f0/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1036, 346, 'https://picsum.photos/seed/bb325f69-d0e4-3c36-b1fb-8e212dc3b71b/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1037, 346, 'https://picsum.photos/seed/862297e3-91b0-32a0-83db-b484728ff35a/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1038, 346, 'https://picsum.photos/seed/f52df271-e41b-341a-858f-1b92cedd5b06/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1039, 347, 'https://picsum.photos/seed/c7be33cc-d1a2-33da-9ba5-f978bad7d2c7/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1040, 347, 'https://picsum.photos/seed/bffdeb0b-28f3-3dc5-9b0d-9782e01509b7/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1041, 347, 'https://picsum.photos/seed/4bc74cb2-1f87-37d7-9847-8e46aa0f799d/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1042, 348, 'https://picsum.photos/seed/e0f3bcf5-d4c9-3539-9a25-1e259a5957bb/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1043, 348, 'https://picsum.photos/seed/948cde27-d6a3-3d19-9370-cb3efbf6479e/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1044, 348, 'https://picsum.photos/seed/e527b3cb-20a8-3172-b410-e7353994eb5a/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1045, 349, 'https://picsum.photos/seed/cb88badc-3bca-372f-aeeb-28b5ee7ed9db/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1046, 349, 'https://picsum.photos/seed/d4bc4788-8839-3e03-b483-c1baa9833b19/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1047, 349, 'https://picsum.photos/seed/a762a0db-7b7d-3ddf-ba11-dc50ad539422/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1048, 350, 'https://picsum.photos/seed/6ca2de04-1847-36ac-b58b-8c9112d6d892/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1049, 350, 'https://picsum.photos/seed/07f5bf28-c289-3a25-a4b5-4c63dc6c9437/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1050, 350, 'https://picsum.photos/seed/4230afc3-b546-3557-ac99-244fdfcd0fd1/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1051, 351, 'https://picsum.photos/seed/390e51a6-434a-3251-b2e5-228a3f73eca9/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1052, 351, 'https://picsum.photos/seed/0e9ccf17-c494-3b6a-895d-52215f66d6a5/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1053, 351, 'https://picsum.photos/seed/493383dd-abb9-38a1-a9f8-c014cf60beca/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1054, 352, 'https://picsum.photos/seed/a32f0952-1e0b-3fe3-a5dc-e27f8168de85/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1055, 352, 'https://picsum.photos/seed/dc85d900-faab-3091-9be9-5e8432748bc1/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1056, 352, 'https://picsum.photos/seed/3840ccdb-3d91-3823-ac92-4867a6e51f66/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1057, 353, 'https://picsum.photos/seed/81f4d2a4-7be3-39c8-88da-5f73e1f16611/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1058, 353, 'https://picsum.photos/seed/6e85db86-b376-3c61-ac51-c821cc7d27e7/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1059, 353, 'https://picsum.photos/seed/3285c569-c1da-36dc-8450-88c3c7abbe07/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1060, 354, 'https://picsum.photos/seed/260e0da2-5ae2-370e-b6cb-6926afd764ad/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1061, 354, 'https://picsum.photos/seed/51f8aebb-7b14-3479-8670-4d3f55240700/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1062, 354, 'https://picsum.photos/seed/84866d98-e71f-353a-b1f5-52060994a199/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1063, 355, 'https://picsum.photos/seed/9f31a515-2f4a-320c-9303-7b438d755c3f/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1064, 355, 'https://picsum.photos/seed/85067761-6d74-31ac-b8a1-ff4bfa105be0/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1065, 355, 'https://picsum.photos/seed/e3fa8582-205e-3638-88a7-bd43cadd6174/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1066, 356, 'https://picsum.photos/seed/7ee5c5cf-9e2a-3a89-9282-42debd7dccd9/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1067, 356, 'https://picsum.photos/seed/d0da34d6-2f77-3ee7-aebb-63915563e6aa/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1068, 356, 'https://picsum.photos/seed/6aa39521-79c9-30bb-9723-b388dbd1d6e7/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1069, 357, 'https://picsum.photos/seed/2ca22e4e-db47-3861-8383-340d54a20b4f/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1070, 357, 'https://picsum.photos/seed/9fefae9f-7e77-3b47-a81c-86c91c94d40c/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1071, 357, 'https://picsum.photos/seed/2a3f3276-8a24-3cd5-a688-823bc6972c0f/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1072, 358, 'https://picsum.photos/seed/b1316e35-75a8-311e-b262-2becde565098/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1073, 358, 'https://picsum.photos/seed/4a05d0fc-7acf-34d2-9e0e-b505d4f182fa/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1074, 358, 'https://picsum.photos/seed/f519bf89-d855-3f86-b85a-e97649d3d7a5/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1075, 359, 'https://picsum.photos/seed/03a3c501-b374-30f1-977a-abbf0399605f/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1076, 359, 'https://picsum.photos/seed/ae6b8abd-0339-394f-a81d-09b987a52059/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1077, 359, 'https://picsum.photos/seed/d76455a6-aa84-3914-9983-a0c295b40a1b/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1078, 360, 'https://picsum.photos/seed/20ac09d5-8770-3c59-aaa1-6a714702ade5/600/450', 1, 1, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1079, 360, 'https://picsum.photos/seed/172cdef5-cc04-3e5d-b7b5-e02c46144090/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1080, 360, 'https://picsum.photos/seed/5a2d3657-35fa-3d05-9b1d-cb84b0103b47/600/450', 0, 0, '2025-10-23 15:24:46', '2025-10-23 15:24:46'),
(1081, 361, 'https://picsum.photos/seed/7f62ddf6-f304-3929-b7a5-7bf047820952/600/450', 1, 1, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(1082, 361, 'https://picsum.photos/seed/1b86aeca-cd77-34f3-9fa5-4294a739898c/600/450', 0, 0, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(1083, 361, 'https://picsum.photos/seed/8a90ee9e-925e-3357-a897-8b698735c954/600/450', 0, 0, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(1084, 362, 'https://picsum.photos/seed/f8dd704b-71e2-3b0b-a2f8-3c917224a6a0/600/450', 1, 1, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(1085, 362, 'https://picsum.photos/seed/72c80912-ae93-315d-b80c-a548e9cef552/600/450', 0, 0, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(1086, 362, 'https://picsum.photos/seed/8fc9eaa0-7e23-30f0-b710-927a49fc9d30/600/450', 0, 0, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(1087, 363, 'https://picsum.photos/seed/31beae14-65d8-39b0-a67b-a5499f5112a6/600/450', 1, 1, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(1088, 363, 'https://picsum.photos/seed/44487b6b-1ad6-3dcf-a91f-a6cc14741cc7/600/450', 0, 0, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(1089, 363, 'https://picsum.photos/seed/6d970c7d-ab22-3e23-9fcd-0804e6c4fc2f/600/450', 0, 0, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(1090, 364, 'https://picsum.photos/seed/b136ece4-d40f-32e9-898b-0fed5f941a23/600/450', 1, 1, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(1091, 364, 'https://picsum.photos/seed/2c2b9b14-6ed0-3036-92bd-06aa9fc119da/600/450', 0, 0, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(1092, 364, 'https://picsum.photos/seed/bbb844de-89db-32fa-8b89-d059d76e5c34/600/450', 0, 0, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(1093, 365, 'https://picsum.photos/seed/3a6fd7ba-3f40-390f-9da3-7ceb244f92bd/600/450', 1, 1, '2025-10-23 15:27:17', '2025-10-23 15:27:18'),
(1094, 365, 'https://picsum.photos/seed/b9c0e701-1130-355b-bce3-34f29f6408fa/600/450', 0, 0, '2025-10-23 15:27:17', '2025-10-23 15:27:17');
INSERT INTO `product_images` (`id`, `product_id`, `path`, `position`, `is_primary`, `created_at`, `updated_at`) VALUES
(1095, 365, 'https://picsum.photos/seed/059bc610-dcb8-3730-b0fa-7ff3f042b8a2/600/450', 0, 0, '2025-10-23 15:27:17', '2025-10-23 15:27:17'),
(1096, 366, 'https://picsum.photos/seed/7ff017ef-4a96-3a4d-8492-fd891c2a1876/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1097, 366, 'https://picsum.photos/seed/ffc18966-caaf-3295-bcde-dbbfbaf1e53b/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1098, 366, 'https://picsum.photos/seed/1e46e86f-11bf-3ac2-b893-688a1e0b29bf/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1099, 367, 'https://picsum.photos/seed/5aa37705-96a8-3380-aa82-a693a3bcbeef/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1100, 367, 'https://picsum.photos/seed/909f2401-ef3a-315e-aeb4-a5bc29f2b087/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1101, 367, 'https://picsum.photos/seed/bd842507-d64b-3c1a-95c6-3e472040ddb0/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1102, 368, 'https://picsum.photos/seed/f539f6e8-b17e-3aa4-9396-34bf4c972a9e/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1103, 368, 'https://picsum.photos/seed/dc5bd431-da26-3381-b494-62ed819b6cae/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1104, 368, 'https://picsum.photos/seed/831087b0-156b-38a7-9a08-2f60bc055a67/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1105, 369, 'https://picsum.photos/seed/8fde8e15-893f-3593-af34-1561a837cdb9/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1106, 369, 'https://picsum.photos/seed/9d933c02-b1cf-374d-a144-d7be98d68db8/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1107, 369, 'https://picsum.photos/seed/ea746a77-5861-3536-b26d-c52404c0fd46/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1108, 370, 'https://picsum.photos/seed/02949056-b72c-3f5b-a893-89997c80a912/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1109, 370, 'https://picsum.photos/seed/dd30b52a-2128-38d3-ab66-8ec099678d55/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1110, 370, 'https://picsum.photos/seed/728e1cf6-f26d-3e00-8544-1f6f27af964a/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1111, 371, 'https://picsum.photos/seed/4e35b595-89b7-39e7-b88b-04afcf752cfe/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1112, 371, 'https://picsum.photos/seed/e1570e1a-9eab-3478-92a5-84becb0aca23/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1113, 371, 'https://picsum.photos/seed/c5360ce4-93b5-31f3-92a0-9a83a73a4f11/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1114, 372, 'https://picsum.photos/seed/470bb7de-bdd5-3ed2-9a34-4b75e84940a3/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1115, 372, 'https://picsum.photos/seed/bfb4f20e-72b5-394c-bebc-adecb7f0c52d/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1116, 372, 'https://picsum.photos/seed/1f33eaec-257b-3026-ae95-c227d98ef43d/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1117, 373, 'https://picsum.photos/seed/2ceb5d2c-768c-3a05-aa4a-6798d4ef893b/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1118, 373, 'https://picsum.photos/seed/2e27ca7a-0efc-3665-b070-9a60e3e3d5f8/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1119, 373, 'https://picsum.photos/seed/b2576f74-97a0-3bce-bb8d-efb18882867b/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1120, 374, 'https://picsum.photos/seed/956bb457-8c48-3e06-8c3a-8cb40a0dea14/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1121, 374, 'https://picsum.photos/seed/1ee0c82f-07a0-375a-acf2-9d5ec23a8227/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1122, 374, 'https://picsum.photos/seed/f7cfe84f-baa3-3df4-ad2f-eb1dbc141d25/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1123, 375, 'https://picsum.photos/seed/b26d2217-ed32-33a2-931f-8f6ff82831be/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1124, 375, 'https://picsum.photos/seed/598be379-9b3a-3450-81d3-1a40287d5385/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1125, 375, 'https://picsum.photos/seed/626a499a-d2e5-39c8-8420-e218121fe1d8/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1126, 376, 'https://picsum.photos/seed/eb5d4547-050a-34bf-a99f-69c75dad30a7/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1127, 376, 'https://picsum.photos/seed/96c88daa-9efb-39c5-9968-2c5c7cba99ab/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1128, 376, 'https://picsum.photos/seed/5657f948-1931-38f9-9153-b4d597b19026/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1129, 377, 'https://picsum.photos/seed/be7a6fd2-88bf-3588-8486-29d89e6e684e/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1130, 377, 'https://picsum.photos/seed/ae8ec2a2-0329-3a06-9bd9-48a42766440a/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1131, 377, 'https://picsum.photos/seed/a030c080-9568-3603-8801-b46f2c62b782/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1132, 378, 'https://picsum.photos/seed/318c5bc0-14a5-38fa-bb3c-82d3faeb9bcf/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1133, 378, 'https://picsum.photos/seed/80dc6ab2-bc6a-3fcd-96b2-397b79c229b3/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1134, 378, 'https://picsum.photos/seed/b5d0801b-c830-3b75-ba4e-a132143131e1/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1135, 379, 'https://picsum.photos/seed/bcac5375-e66d-3fa6-ad98-e0b90b8a4cdc/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1136, 379, 'https://picsum.photos/seed/b9706bab-a239-32c5-94f0-126d7f1be942/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1137, 379, 'https://picsum.photos/seed/bcbe7dfc-038d-3d61-b0d4-e8642464de3a/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1138, 380, 'https://picsum.photos/seed/c1f9742d-fb04-3266-9fec-e6323a744185/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1139, 380, 'https://picsum.photos/seed/38f486fd-83a2-3dd0-8afb-6e162f88566d/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1140, 380, 'https://picsum.photos/seed/18aead39-7fc6-3f7b-9cb9-ead7db756569/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1141, 381, 'https://picsum.photos/seed/e63e0105-a63f-3e5a-9fd7-b505058389a7/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1142, 381, 'https://picsum.photos/seed/b439bb7c-45b9-3d85-b685-58601e8ea1fb/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1143, 381, 'https://picsum.photos/seed/3becf6d4-0130-348c-8ea0-e3b2074c64b9/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1144, 382, 'https://picsum.photos/seed/53a81fce-7d88-3f35-9c18-f439dc12e38c/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1145, 382, 'https://picsum.photos/seed/d645d8c4-44fc-3827-bfc6-b107c83e34c9/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1146, 382, 'https://picsum.photos/seed/f92a41b8-85df-38cb-bc16-d7c2980a6f29/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1147, 383, 'https://picsum.photos/seed/7637ea02-d305-3de3-be92-6816bd19c83d/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1148, 383, 'https://picsum.photos/seed/7d19dbc1-eb79-3eb7-8935-83e8b774c872/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1149, 383, 'https://picsum.photos/seed/4ec74c84-64b7-3525-9661-e0b0c03feafe/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1150, 384, 'https://picsum.photos/seed/6510f9f9-f6d5-3948-8722-d8699a37e156/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1151, 384, 'https://picsum.photos/seed/42c7b853-e15c-3d66-a7ca-04649c2e2647/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1152, 384, 'https://picsum.photos/seed/013fa5dc-8b2f-3c8a-a592-4bed971e33e0/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1153, 385, 'https://picsum.photos/seed/c4e5b8cd-d505-3165-b812-833287e1c712/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1154, 385, 'https://picsum.photos/seed/fb394198-0b91-35c9-9449-125b4b9886ea/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1155, 385, 'https://picsum.photos/seed/754f3a48-4ff2-3aa8-9f5e-9fd189079132/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1156, 386, 'https://picsum.photos/seed/20e4c357-8551-3958-bfea-42f7bf0a2297/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1157, 386, 'https://picsum.photos/seed/7044f601-9661-3e11-9330-01e8e25b49bd/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1158, 386, 'https://picsum.photos/seed/cd623f05-8ab8-38e4-9096-74d8abe14df8/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1159, 387, 'https://picsum.photos/seed/16e12b9e-d776-3bbc-9c56-c9876bf621ca/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1160, 387, 'https://picsum.photos/seed/d924a5eb-a577-3d84-b3e4-7f131772b93d/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1161, 387, 'https://picsum.photos/seed/645b3409-8083-3af9-95c2-98f9e7ad06ef/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1162, 388, 'https://picsum.photos/seed/d628ed79-c86a-30f1-9f00-5ea8aec5dae3/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1163, 388, 'https://picsum.photos/seed/dc99c9ee-4a9e-3cd6-b0b5-b1efd5e89b38/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1164, 388, 'https://picsum.photos/seed/2c100a5d-8ee9-331b-a1e4-bb89e6f4c365/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1165, 389, 'https://picsum.photos/seed/81dbd4f3-b8ca-38a1-8911-65c6eba76fe3/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1166, 389, 'https://picsum.photos/seed/67f5adce-3ae5-3a89-b84c-83d0de1ed934/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1167, 389, 'https://picsum.photos/seed/064197c6-1ddf-3b68-b129-d724f26b452e/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1168, 390, 'https://picsum.photos/seed/efcb3361-d38d-3ab0-a992-6d67439b6a78/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1169, 390, 'https://picsum.photos/seed/9114596f-f01f-3a3f-8308-b1ab04dc4f01/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1170, 390, 'https://picsum.photos/seed/5e93e28c-8a1f-3f8d-84f6-a31e992b4d63/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1171, 391, 'https://picsum.photos/seed/fe2d2aae-88a7-3154-a7ad-991a9dd8089d/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1172, 391, 'https://picsum.photos/seed/d525a23d-4823-3855-b193-6f60d2790326/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1173, 391, 'https://picsum.photos/seed/9f26a7af-17e9-36f3-adeb-1192582ed7f3/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1174, 392, 'https://picsum.photos/seed/8872f022-a576-3055-851c-b00eda28e7b0/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1175, 392, 'https://picsum.photos/seed/58a0e7e1-9f8d-358c-a4e3-5a0bd1b28631/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1176, 392, 'https://picsum.photos/seed/2c4faf0a-6235-367f-876e-231522b8724b/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1177, 393, 'https://picsum.photos/seed/f4046ad3-7832-3af8-85a3-b08d9e1afce1/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1178, 393, 'https://picsum.photos/seed/102714d9-a6a8-3e54-b691-04cb46d81394/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1179, 393, 'https://picsum.photos/seed/d8e365b9-f5be-386b-ad85-de822012ca6a/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1180, 394, 'https://picsum.photos/seed/2f6cc7bd-d7ce-3dcf-9b1f-67d9805ea59e/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1181, 394, 'https://picsum.photos/seed/99e17810-dcbb-3a58-a770-7c84b80f63c7/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1182, 394, 'https://picsum.photos/seed/f7297ad2-db74-3f7c-8f9c-9a30338e446f/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1183, 395, 'https://picsum.photos/seed/520e3266-8a8f-3234-8236-c3d129e31988/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1184, 395, 'https://picsum.photos/seed/ae29835e-1396-3d02-9a20-81033ba7a7e7/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1185, 395, 'https://picsum.photos/seed/a0c8ccb6-a895-3d1a-8fca-a927b7897035/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1186, 396, 'https://picsum.photos/seed/96bd3bff-808f-3ff8-ad3a-481cf54e2a7d/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1187, 396, 'https://picsum.photos/seed/003d130d-6dfb-3d91-9564-d41396b6fa1f/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1188, 396, 'https://picsum.photos/seed/08bcaf78-896b-3839-b36a-7ba48ac87b5a/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1189, 397, 'https://picsum.photos/seed/e14b0fad-a419-3ab0-b79d-367239c754cd/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1190, 397, 'https://picsum.photos/seed/00c80dd8-6af4-3d93-ba95-e9abface413c/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1191, 397, 'https://picsum.photos/seed/4b7b89de-fd41-382d-9b1a-9fa70343ba66/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1192, 398, 'https://picsum.photos/seed/87b57ed1-9665-35cc-a995-63599551f1d6/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1193, 398, 'https://picsum.photos/seed/e3c2cc40-6b49-3cde-8c02-f322d10630b4/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1194, 398, 'https://picsum.photos/seed/89d6aa96-20e3-366d-822a-50829cb1447c/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1195, 399, 'https://picsum.photos/seed/0f52755a-3c70-3494-9876-9717d9b400bb/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1196, 399, 'https://picsum.photos/seed/20291d2c-96a2-3b18-b65a-067481e9ecd4/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1197, 399, 'https://picsum.photos/seed/ddf53c23-9814-3002-bee4-f54a5b68ef5f/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1198, 400, 'https://picsum.photos/seed/a537bb57-bd02-3bbe-9b4e-59aad9dbd4ca/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1199, 400, 'https://picsum.photos/seed/123f00e2-0cc0-306d-b303-ac0fcad73d57/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1200, 400, 'https://picsum.photos/seed/751e0818-c2c6-321d-9887-b6828d9a2879/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1201, 401, 'https://picsum.photos/seed/ad961f37-4087-38a1-a531-e8f052d45238/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1202, 401, 'https://picsum.photos/seed/cdfbaf9b-e33b-3513-85d0-33e5723a75c2/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1203, 401, 'https://picsum.photos/seed/5883c98c-e904-3bf7-8d23-14e93c149e29/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1204, 402, 'https://picsum.photos/seed/150f50a8-7d48-3b25-92a5-29b1e1dfb9c6/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1205, 402, 'https://picsum.photos/seed/f4fb332b-2264-3cb0-abe1-c3eaa6d32acd/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1206, 402, 'https://picsum.photos/seed/b21b90cb-6d3b-3ca2-b414-a0350e7badca/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1207, 403, 'https://picsum.photos/seed/d9b59f5e-7f05-3f7f-b0cf-1bc68f723bc7/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1208, 403, 'https://picsum.photos/seed/1e97b448-22d5-341f-9df2-553b089ef79d/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1209, 403, 'https://picsum.photos/seed/d2e9fd55-8385-340b-b1a5-1629c434bcab/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1210, 404, 'https://picsum.photos/seed/9af5a6a4-17ab-3109-9ef3-0b7d5b77208d/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1211, 404, 'https://picsum.photos/seed/8c005d24-81b7-38f2-a06d-c1f99ce10b2f/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1212, 404, 'https://picsum.photos/seed/b4128d62-468f-3ff5-9cfa-f3c44ab9f91d/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1213, 405, 'https://picsum.photos/seed/d95e4c84-680b-35e2-bb73-17582fb59a17/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1214, 405, 'https://picsum.photos/seed/0e3d1316-52a4-3751-81bf-ab760c06a20f/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1215, 405, 'https://picsum.photos/seed/df98f62f-a589-3b67-b6ce-d02ccd9dab8c/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1216, 406, 'https://picsum.photos/seed/e61c6a47-a968-3e19-ae95-ead9579c029c/600/450', 1, 1, '2025-10-23 15:27:18', '2025-10-23 15:27:19'),
(1217, 406, 'https://picsum.photos/seed/c5a7d7a7-22c5-3de4-b35c-b536125f2196/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1218, 406, 'https://picsum.photos/seed/a8a2a2d3-dadd-363c-a691-d1e1ddcda8ff/600/450', 0, 0, '2025-10-23 15:27:18', '2025-10-23 15:27:18'),
(1219, 407, 'https://picsum.photos/seed/9a120faf-77b9-37c9-a24d-9a6085ba92ed/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1220, 407, 'https://picsum.photos/seed/5a615548-3c77-3270-a0c8-0afbddb71a23/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1221, 407, 'https://picsum.photos/seed/c75c52e1-b743-3dde-a7c3-06bb915c1fc4/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1222, 408, 'https://picsum.photos/seed/19347f17-0f88-3cfd-acd2-1255e2a00ffe/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1223, 408, 'https://picsum.photos/seed/f6b97066-70aa-30e9-8e6f-a3338155b147/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1224, 408, 'https://picsum.photos/seed/300da9f0-6a5d-35af-adba-79bab218a8e1/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1225, 409, 'https://picsum.photos/seed/92181109-e09c-376c-b233-34b2f12f1084/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1226, 409, 'https://picsum.photos/seed/490b282d-dc2c-3f04-b718-45330b528e93/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1227, 409, 'https://picsum.photos/seed/529dbd5f-83a7-33a3-bea8-c0be5c4353bc/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1228, 410, 'https://picsum.photos/seed/0da58c13-3b4b-3aa7-94b1-ab89fc50aafd/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1229, 410, 'https://picsum.photos/seed/2b83a941-6c65-374e-bc48-671d91b6db5a/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1230, 410, 'https://picsum.photos/seed/bfeb0ab3-05f0-3cd9-b3b3-4adca3265dda/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1231, 411, 'https://picsum.photos/seed/38187f98-3613-3e2e-ae55-7444326b1e18/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1232, 411, 'https://picsum.photos/seed/8af7f9ba-9231-3426-ab66-7a337cda52e2/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1233, 411, 'https://picsum.photos/seed/0514c1e1-be10-31f6-9190-2646aae08141/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1234, 412, 'https://picsum.photos/seed/ffe059c1-10e3-3ce7-95bc-054da6f98037/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1235, 412, 'https://picsum.photos/seed/27bf5746-be28-3843-bab0-93bc52bdc444/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1236, 412, 'https://picsum.photos/seed/33398ce9-5bc3-3bd3-b38b-c22b6921ea64/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1237, 413, 'https://picsum.photos/seed/574fbc7c-5842-3db2-809f-76044944e1bc/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1238, 413, 'https://picsum.photos/seed/b9229b52-1212-3676-a2fe-27fa6ab4fed7/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1239, 413, 'https://picsum.photos/seed/8a1dff1a-0635-3fc1-833e-e3057e0573f9/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1240, 414, 'https://picsum.photos/seed/0023931d-804f-3949-88a7-949596e05aa6/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1241, 414, 'https://picsum.photos/seed/5b753dd2-ced4-3818-abc5-ac920f4c5d81/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1242, 414, 'https://picsum.photos/seed/5f6090ad-e26c-3f0e-b36a-8b60f6982dcc/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1243, 415, 'https://picsum.photos/seed/4665636c-6b3c-3a70-86f4-0b57c55990e5/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1244, 415, 'https://picsum.photos/seed/d670df9a-1857-388f-a31a-578e2a6f5d53/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1245, 415, 'https://picsum.photos/seed/50712058-6cf6-30d1-8a8b-a610af6d3acb/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1246, 416, 'https://picsum.photos/seed/8126e556-91aa-3b67-9cbc-6f606437661f/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1247, 416, 'https://picsum.photos/seed/aaa6f223-2b25-3629-b612-b845c7d22407/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1248, 416, 'https://picsum.photos/seed/fde2a620-c86b-30ed-b506-69e3ee1200c6/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1249, 417, 'https://picsum.photos/seed/01578792-4c5c-3ce8-a32c-42c8858e69bc/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1250, 417, 'https://picsum.photos/seed/0253bb0e-e8a8-38f5-992a-5ec60146f661/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1251, 417, 'https://picsum.photos/seed/f758c07a-cec4-3b14-8ded-102cdae84259/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1252, 418, 'https://picsum.photos/seed/374b62b7-77ea-3d23-95eb-66dcfe92d7b9/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1253, 418, 'https://picsum.photos/seed/99b15849-ea0c-39a4-92cf-ebd49b310481/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1254, 418, 'https://picsum.photos/seed/09534511-197d-3a74-878e-84b70b3fd8c0/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1255, 419, 'https://picsum.photos/seed/885bb749-3c11-3c43-b022-52ac5b5f2af0/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1256, 419, 'https://picsum.photos/seed/0deb3e9d-10df-367e-8806-165594affdff/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1257, 419, 'https://picsum.photos/seed/934a4021-508c-331b-a4bb-b648c5f90105/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1258, 420, 'https://picsum.photos/seed/7ac4f9b8-79bb-34a6-a74b-faeab4580ef9/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1259, 420, 'https://picsum.photos/seed/7a7edda9-1ae8-34f7-a50e-1b9e60e3c84f/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1260, 420, 'https://picsum.photos/seed/ab667f60-e47c-3d16-bbfa-1b9ec146328e/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1261, 421, 'https://picsum.photos/seed/0a90f5c3-847d-3a69-a61a-4dce86130a12/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1262, 421, 'https://picsum.photos/seed/083eca79-ded3-3556-9b1f-ebe53382a14a/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1263, 421, 'https://picsum.photos/seed/4a2b2a60-8cb4-3059-82a7-e94f60772619/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1264, 422, 'https://picsum.photos/seed/559908cd-7f40-3e24-afa2-d96262ace380/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1265, 422, 'https://picsum.photos/seed/393d77bd-1a86-3d7b-83fa-dc9cf58e06d6/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1266, 422, 'https://picsum.photos/seed/4a1b77e3-30d8-37cb-925a-0d7d382e21e4/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1267, 423, 'https://picsum.photos/seed/fb48e441-848e-37ea-a04e-5daf54005970/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1268, 423, 'https://picsum.photos/seed/a5212c08-b014-3533-a710-528866292cac/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1269, 423, 'https://picsum.photos/seed/9e15b546-a83d-3bd6-9230-860366469b98/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1270, 424, 'https://picsum.photos/seed/59bb8bb2-6dfc-3fa2-8262-76535c88c8e6/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1271, 424, 'https://picsum.photos/seed/79ec62bb-881d-3d60-8810-f8f2cdb8777a/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1272, 424, 'https://picsum.photos/seed/8746ac27-75d6-315a-85c2-4850b3787ad9/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1273, 425, 'https://picsum.photos/seed/43fb5c80-ec78-3e11-b800-11c8814cefd9/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1274, 425, 'https://picsum.photos/seed/ac084be8-fffb-3420-aa22-9b4632b36540/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1275, 425, 'https://picsum.photos/seed/b680e0fe-5dc7-3ef4-b85e-a3eea95d1ff2/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1276, 426, 'https://picsum.photos/seed/68d011e7-d62a-375a-b148-33f0b7c00df5/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1277, 426, 'https://picsum.photos/seed/87d64104-0bdf-3f9a-b568-9c8807d8d9cc/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1278, 426, 'https://picsum.photos/seed/1afa3bc4-a1b4-3ee3-9641-1d3c5b75985d/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1279, 427, 'https://picsum.photos/seed/83bcc2ef-bf57-37a3-99fc-07a8fe79b49c/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1280, 427, 'https://picsum.photos/seed/ba036f72-1977-3d7a-836a-19babbdf9496/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1281, 427, 'https://picsum.photos/seed/b47ef3e0-59a2-3ba4-91f0-5b220ecf4b90/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1282, 428, 'https://picsum.photos/seed/5824c43a-38f9-3a66-8660-028c38a79b34/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1283, 428, 'https://picsum.photos/seed/c39c7d8d-305c-3f18-adbe-b0a5d244b1d2/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1284, 428, 'https://picsum.photos/seed/c4d6c9e2-6cc1-3199-b4b2-8e032af0d1fa/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1285, 429, 'https://picsum.photos/seed/c504fa70-2568-38a9-a8f4-bd483c3f37e3/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1286, 429, 'https://picsum.photos/seed/75f3de7a-6195-3ab4-af7d-a09a382bf59c/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1287, 429, 'https://picsum.photos/seed/0bc4ddd2-1cc8-3305-b57d-0dba21cda344/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1288, 430, 'https://picsum.photos/seed/054b217c-d361-3f7f-8527-eced8f853aef/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1289, 430, 'https://picsum.photos/seed/31b2ff7f-c999-3991-80d4-cbc8790b6659/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1290, 430, 'https://picsum.photos/seed/82d67fda-70dc-3b4c-a07c-74abae1b72cd/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1291, 431, 'https://picsum.photos/seed/6de9d8f2-ed2e-385c-a715-7e803a4b6ef5/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1292, 431, 'https://picsum.photos/seed/4be17233-1eb6-336e-922f-5501e32cb130/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1293, 431, 'https://picsum.photos/seed/04bc5627-98b9-33f3-8e29-b3e565fed272/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1294, 432, 'https://picsum.photos/seed/308608a3-2fe2-35ac-9885-70ddc584eb5b/600/450', 1, 1, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1295, 432, 'https://picsum.photos/seed/f5115e93-5375-326d-8eca-6c21d97ef80d/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1296, 432, 'https://picsum.photos/seed/9b3877ba-e1d5-3482-871e-1e4e3c1dd0b7/600/450', 0, 0, '2025-10-23 15:27:19', '2025-10-23 15:27:19'),
(1297, 433, 'https://picsum.photos/seed/2a7c8fc7-2d61-3260-95ab-5973b9d0fa9c/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1298, 433, 'https://picsum.photos/seed/accd0745-341d-3d75-9488-262640357617/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1299, 433, 'https://picsum.photos/seed/b2b34ea8-d7aa-3de0-9bf9-c17fd5b641c6/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1300, 434, 'https://picsum.photos/seed/1ae6ca50-5e09-3e4a-8f02-5fe3116275ad/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1301, 434, 'https://picsum.photos/seed/806a6ee5-d74e-3f81-94a0-ed3b74ad43da/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1302, 434, 'https://picsum.photos/seed/d10b1555-507f-3f90-af4d-8012cab7e7c0/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1303, 435, 'https://picsum.photos/seed/b440abf0-8a24-3097-9104-bceb79e7938a/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1304, 435, 'https://picsum.photos/seed/d0bd931b-33c4-3c24-802b-46b8704ca904/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1305, 435, 'https://picsum.photos/seed/91ff688a-ba30-3c28-8db5-9974ba9f50ea/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1306, 436, 'https://picsum.photos/seed/8870d01f-e577-3293-a805-7efce03b02e3/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1307, 436, 'https://picsum.photos/seed/8e47cf92-bdf3-306d-b7fe-b6a41907dca6/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1308, 436, 'https://picsum.photos/seed/d0c31c43-eea3-3d4b-aac7-32431e4b1b6e/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1309, 437, 'https://picsum.photos/seed/e4d9f309-d6b9-3266-b6bd-80dade2da559/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1310, 437, 'https://picsum.photos/seed/1e8aa0bf-6a38-381f-99f2-46579416ccf7/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1311, 437, 'https://picsum.photos/seed/addd689e-bbca-3486-a7e5-f0024d7a9fac/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1312, 438, 'https://picsum.photos/seed/0fd58826-6b97-302b-b8f6-0e286421b6f6/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1313, 438, 'https://picsum.photos/seed/6c8e4a52-ffe1-3c1b-a5f6-5d1b085039da/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1314, 438, 'https://picsum.photos/seed/c99e68da-7201-3c15-8215-2b7d99503dae/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1315, 439, 'https://picsum.photos/seed/f3fc7ec2-712f-3e43-adf0-4c79dc822f75/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1316, 439, 'https://picsum.photos/seed/dda8276a-5a34-3cf1-9204-5c68a25d681c/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1317, 439, 'https://picsum.photos/seed/b77fa447-fd58-313c-bb10-58ef4caa8d18/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1318, 440, 'https://picsum.photos/seed/88213f9c-62be-31c2-81e2-5376be4c9574/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1319, 440, 'https://picsum.photos/seed/c4840d91-3c2f-3b70-aa8c-d86aea699159/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1320, 440, 'https://picsum.photos/seed/f1ced1d9-1319-3f33-a378-28915b2a6dd4/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1321, 441, 'https://picsum.photos/seed/9e52a12e-5def-3f3a-babe-f3bec4a65b4f/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1322, 441, 'https://picsum.photos/seed/f6bd70a4-9228-3d52-855a-ec4c53fc5c5d/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1323, 441, 'https://picsum.photos/seed/52dcb35d-634e-3d7d-b234-39b06306bea5/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1324, 442, 'https://picsum.photos/seed/78a1b1a1-7be6-33aa-8fe2-bf4ae26dc5cd/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1325, 442, 'https://picsum.photos/seed/6d7f767b-1ede-34dc-99a5-d91f61f86687/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1326, 442, 'https://picsum.photos/seed/3fda722f-6a2d-3d01-9dcc-feb6b242690c/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1327, 443, 'https://picsum.photos/seed/8a22f710-8570-3ede-9808-a51d0ca8f563/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1328, 443, 'https://picsum.photos/seed/6ae73e41-4872-3105-a61e-71b8b3e47af4/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1329, 443, 'https://picsum.photos/seed/35d14d83-2afd-31df-9afd-2fd74df23291/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1330, 444, 'https://picsum.photos/seed/971c4b5c-14d7-3fef-8d5c-266a91dc447f/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1331, 444, 'https://picsum.photos/seed/9f203c48-a241-347d-a7ad-3ae51aafe952/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1332, 444, 'https://picsum.photos/seed/bad3218b-52c8-390d-8beb-897311c41e72/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1333, 445, 'https://picsum.photos/seed/0396137e-513c-3a4e-bb55-9e498e91930a/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1334, 445, 'https://picsum.photos/seed/3ae36a52-38b5-3633-bca5-0397eb1bb4ca/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1335, 445, 'https://picsum.photos/seed/feef3090-9c27-31c5-a3f9-a7fb859578cf/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1336, 446, 'https://picsum.photos/seed/13a4856d-d649-3e3f-a695-0281d752c057/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1337, 446, 'https://picsum.photos/seed/22f50bf4-10bb-3202-867c-8c3ffbfbf5b6/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1338, 446, 'https://picsum.photos/seed/6e4de1b4-c742-3e83-b2d9-1cf45fc3f760/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1339, 447, 'https://picsum.photos/seed/9f5362bd-1507-35c2-a1af-7bed2cc01123/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1340, 447, 'https://picsum.photos/seed/17c6abce-ab40-33d5-9897-80d3ee53e961/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1341, 447, 'https://picsum.photos/seed/81127baa-7172-32cd-8242-7bf7d5851358/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1342, 448, 'https://picsum.photos/seed/2b12e00b-2d90-3838-8f35-1e7834641ebb/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1343, 448, 'https://picsum.photos/seed/01c264e3-639a-3ab4-8a49-c17adf94064d/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1344, 448, 'https://picsum.photos/seed/bd535de1-c68c-3761-8a77-779a823d7a36/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1345, 449, 'https://picsum.photos/seed/0127fcb2-46e1-3ffd-8836-4f6e55166bca/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1346, 449, 'https://picsum.photos/seed/3d9d45f3-ebc4-3f5b-8eec-fd494703d6fe/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1347, 449, 'https://picsum.photos/seed/adaa454c-84f7-39d6-92a1-20c0c5caf87e/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1348, 450, 'https://picsum.photos/seed/8b734c0c-c303-33e5-99b1-fdd6d448e003/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1349, 450, 'https://picsum.photos/seed/e67bc405-4f45-39f9-a5a1-e993ccdb198c/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1350, 450, 'https://picsum.photos/seed/481c2e59-1a75-3408-ba74-81910ce06fca/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1351, 451, 'https://picsum.photos/seed/8487d32a-1a75-32da-b200-4470c1a5e07e/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1352, 451, 'https://picsum.photos/seed/e5e1a555-3050-3da0-a767-5d83bd3e5fad/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1353, 451, 'https://picsum.photos/seed/b65717ee-9e0c-3941-ab9f-18e0a9c6e589/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1354, 452, 'https://picsum.photos/seed/3440bfe1-a938-3e49-916e-8e2ec7b77f09/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1355, 452, 'https://picsum.photos/seed/7ac544c7-f542-3da2-8e56-f21fe8a895a0/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1356, 452, 'https://picsum.photos/seed/3523a8a0-9592-3efc-a640-b431936d8982/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1357, 453, 'https://picsum.photos/seed/215f1ee5-8c99-3d83-a685-19ed46b16fac/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1358, 453, 'https://picsum.photos/seed/f747ecef-a056-34de-a8db-71df9754257e/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1359, 453, 'https://picsum.photos/seed/45c49eb0-2827-3f16-8ba0-e0bb73dabef8/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1360, 454, 'https://picsum.photos/seed/9b198f17-3aa5-3510-93da-11f6b4102318/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1361, 454, 'https://picsum.photos/seed/9391d254-2e75-367d-bf6b-f6040fbeb066/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1362, 454, 'https://picsum.photos/seed/62f6932b-fe52-33d0-b759-016c1967300b/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1363, 455, 'https://picsum.photos/seed/151ea595-b389-3d41-b925-b23cdaa172fa/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1364, 455, 'https://picsum.photos/seed/cfaa28d8-31ff-3f3e-8ca1-4a6e1c6647f8/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1365, 455, 'https://picsum.photos/seed/9e9d4fd3-3318-3fec-a6eb-b480160a3645/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1366, 456, 'https://picsum.photos/seed/1503b097-78ad-342b-ac95-f9867116b3b5/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1367, 456, 'https://picsum.photos/seed/d2efecdd-c7ce-3a01-aceb-12ea14469786/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1368, 456, 'https://picsum.photos/seed/76319dd3-e09a-3b60-b974-61343a72485d/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1369, 457, 'https://picsum.photos/seed/86d7d9ac-5c28-3d8f-b9fa-e4159f3fbb75/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1370, 457, 'https://picsum.photos/seed/c6e69c2e-0551-3c07-b1d4-33ae2cf584d6/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1371, 457, 'https://picsum.photos/seed/d924ceeb-598a-32b6-9d79-3368e238651f/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1372, 458, 'https://picsum.photos/seed/b6e97742-2ad3-35e3-86ad-eff47344861c/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1373, 458, 'https://picsum.photos/seed/1c39c483-1fc7-3ec4-ac6e-844d174ba514/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1374, 458, 'https://picsum.photos/seed/f46a0b23-33a6-3fc3-9a4d-10c3d66c3ae2/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1375, 459, 'https://picsum.photos/seed/f9cd6237-455f-3236-b463-3033e54b317c/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1376, 459, 'https://picsum.photos/seed/17549e03-13ab-37d1-894b-fbea5651d891/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1377, 459, 'https://picsum.photos/seed/043b6eea-d7f4-37af-b96b-b6fffa707e2a/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1378, 460, 'https://picsum.photos/seed/b3908407-1f68-30ec-8faf-44b0db9f3797/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1379, 460, 'https://picsum.photos/seed/222a6f33-8240-36f9-9538-fadbafa46e79/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1380, 460, 'https://picsum.photos/seed/d27eb5e0-1044-3bcf-a9c5-497aa767913c/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1381, 461, 'https://picsum.photos/seed/07f9f0eb-9519-3b8c-9692-6aa16871233f/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1382, 461, 'https://picsum.photos/seed/fe706791-d0c6-3120-8510-b435e71b6bb8/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1383, 461, 'https://picsum.photos/seed/772b4421-0cd1-33ff-a175-4256289a069d/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1384, 462, 'https://picsum.photos/seed/5917a280-a6eb-3553-a5b8-2e340450c60e/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1385, 462, 'https://picsum.photos/seed/f12ebca5-7458-3030-9242-6aa9299a9144/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1386, 462, 'https://picsum.photos/seed/058b0249-33a8-3ac6-a13e-dbd20cf9a247/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1387, 463, 'https://picsum.photos/seed/14bbf5f5-64d6-3689-8f59-6ad916866032/600/450', 1, 1, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1388, 463, 'https://picsum.photos/seed/1c782b33-a93f-369c-843b-131671ef6cab/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1389, 463, 'https://picsum.photos/seed/c5a61834-1b05-37a6-a150-1cf3423f1441/600/450', 0, 0, '2025-10-23 16:09:40', '2025-10-23 16:09:40'),
(1390, 464, 'https://picsum.photos/seed/a37b5ced-d0d0-3860-ba3c-b85dbdc4569a/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1391, 464, 'https://picsum.photos/seed/bc148ad9-9954-3e2a-ad0d-02668322b352/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1392, 464, 'https://picsum.photos/seed/64a24d2e-9bea-3d6b-a343-ea3142692113/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1393, 465, 'https://picsum.photos/seed/28f0974d-71c5-3590-abd6-b379b1eeeed1/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1394, 465, 'https://picsum.photos/seed/a947f39e-3aa9-31fb-bda4-e918d22fd7a5/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1395, 465, 'https://picsum.photos/seed/0be21dcd-6b12-3e27-8dff-b4c25c9b4ed5/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1396, 466, 'https://picsum.photos/seed/080552fe-9464-3a26-bce8-2e5e1f9452e2/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1397, 466, 'https://picsum.photos/seed/528d234b-149d-3128-ac8a-101e78b3305f/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1398, 466, 'https://picsum.photos/seed/f3c1e958-2154-39c5-b6d7-ce52b2db1211/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1399, 467, 'https://picsum.photos/seed/f9b82209-f591-3328-8d5a-e80c2c0ec08e/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1400, 467, 'https://picsum.photos/seed/20ef08e0-d5fd-3080-a330-45bcdad65c86/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1401, 467, 'https://picsum.photos/seed/fd85bb25-78ad-3361-a8ac-49eef6c14e3e/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1402, 468, 'https://picsum.photos/seed/a1e35077-8970-3530-ac2b-eea2861afa00/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1403, 468, 'https://picsum.photos/seed/a8b2e8df-af2d-3af7-b944-4a0c4305a7ab/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1404, 468, 'https://picsum.photos/seed/28963766-8de7-3e2b-95e7-f0da5e4010e1/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1405, 469, 'https://picsum.photos/seed/656c978b-b9b3-3401-a1b1-357865fe6dfd/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1406, 469, 'https://picsum.photos/seed/232d3f5d-d539-39cd-9e9b-842046c99757/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1407, 469, 'https://picsum.photos/seed/d2527d31-5aa3-31d2-ab27-71ad83aeadc1/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1408, 470, 'https://picsum.photos/seed/ce6d5fc6-4721-3410-a4d1-e4a897d0fa11/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1409, 470, 'https://picsum.photos/seed/1b76a3ba-5afe-300a-ae72-8643dd3e1fad/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1410, 470, 'https://picsum.photos/seed/f3342965-7960-3427-ad76-1def541379ef/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1411, 471, 'https://picsum.photos/seed/a1e12dcd-79a4-3ccd-85b6-d279fa89cdd0/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1412, 471, 'https://picsum.photos/seed/5c79caaa-5256-34ce-92f6-80425314ec93/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1413, 471, 'https://picsum.photos/seed/6a39a1ca-f040-35ce-acfa-508bc07983c4/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1414, 472, 'https://picsum.photos/seed/a4b8c9d3-404f-301e-aa15-cc30e35eec46/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1415, 472, 'https://picsum.photos/seed/d4bc7c66-a1c8-3cd0-bc08-df16375cd2ad/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1416, 472, 'https://picsum.photos/seed/d17f781b-3eee-39be-8b61-1cd767a8b397/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1417, 473, 'https://picsum.photos/seed/93c99160-037a-3af3-86ac-7a512346ed80/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1418, 473, 'https://picsum.photos/seed/7bd28135-32ed-30f4-a8dc-3be1383ceaac/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1419, 473, 'https://picsum.photos/seed/4fe220b2-8469-3219-a5a6-b9f299ace023/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1420, 474, 'https://picsum.photos/seed/514e3412-0a14-32a1-a364-8006e742a3fe/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1421, 474, 'https://picsum.photos/seed/c094552b-7292-3502-95f6-9e792a36cb52/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1422, 474, 'https://picsum.photos/seed/1969f661-29c1-37c7-b4ea-e29d787d1925/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1423, 475, 'https://picsum.photos/seed/afd5573b-d5f8-3b4b-a60e-ba182d0c028e/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1424, 475, 'https://picsum.photos/seed/dfe6c425-da78-3145-b4a7-9a18d66f8410/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1425, 475, 'https://picsum.photos/seed/2e587df8-f47a-3031-ba2f-7647f4f405d0/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1426, 476, 'https://picsum.photos/seed/7cc0eae2-01f5-3682-a3bf-c48a3ed31a32/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1427, 476, 'https://picsum.photos/seed/0f1d5142-9772-379d-9799-35b1b56c60e1/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1428, 476, 'https://picsum.photos/seed/d2bdcba6-f975-349d-a3b1-f37a25b5f204/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1429, 477, 'https://picsum.photos/seed/573d74f2-82c1-3677-b837-fcc224491fc1/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1430, 477, 'https://picsum.photos/seed/2da1ac4e-12f8-336a-b760-31f43614375e/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1431, 477, 'https://picsum.photos/seed/ba8ae6db-0416-36a1-a5e9-542d7a96391d/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1432, 478, 'https://picsum.photos/seed/2c219d77-0701-3407-a969-8de1d474fd5c/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1433, 478, 'https://picsum.photos/seed/7c503617-527b-3b64-a550-a658280ffc24/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1434, 478, 'https://picsum.photos/seed/db82ccfd-a1b2-3406-9102-25446b6e39ca/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1435, 479, 'https://picsum.photos/seed/c9706c0e-193d-338f-93de-49a603a2810a/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1436, 479, 'https://picsum.photos/seed/031e205c-70a7-3bc0-a812-c4183e2c4881/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1437, 479, 'https://picsum.photos/seed/a818a236-379e-39ed-b8ce-cad601c1b660/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1438, 480, 'https://picsum.photos/seed/92dd37e0-ea50-372c-8aed-64022f9b20d1/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1439, 480, 'https://picsum.photos/seed/1f2b692c-a222-3352-93a3-ce2ad5dd4960/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1440, 480, 'https://picsum.photos/seed/b85c3b3a-3376-3fae-8f90-8607a0c8ee78/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1441, 481, 'https://picsum.photos/seed/adcfeee7-a898-3f60-bfcc-15873abe0975/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1442, 481, 'https://picsum.photos/seed/e998db36-bef8-30bb-b6d7-d1978a436fa7/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1443, 481, 'https://picsum.photos/seed/9c94c7e7-914d-34da-b4ad-393c057c9d7d/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1444, 482, 'https://picsum.photos/seed/e9d29c1c-0d36-392f-b287-2f1918c93976/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1445, 482, 'https://picsum.photos/seed/f338afd9-398a-3a35-a20c-868296052a52/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1446, 482, 'https://picsum.photos/seed/00f6d96c-29c9-357a-8835-a2f02e7fda48/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1447, 483, 'https://picsum.photos/seed/80149058-6a3b-396a-a50d-5237e25ced0f/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1448, 483, 'https://picsum.photos/seed/47efe142-e4d9-3fbd-8a8f-dfa951548cf2/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1449, 483, 'https://picsum.photos/seed/63f2cbb7-726b-34ec-ab2b-baded74e96c2/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1450, 484, 'https://picsum.photos/seed/bc84f444-fdca-3757-b0e3-144a28f32b06/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1451, 484, 'https://picsum.photos/seed/f77ba40c-b9a0-306f-b0d6-47362917712d/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1452, 484, 'https://picsum.photos/seed/9a0b8eb7-60cd-30ba-a9b7-9ab732f22767/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1453, 485, 'https://picsum.photos/seed/308d439f-63e7-35c7-a140-f5cbf7290cb3/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1454, 485, 'https://picsum.photos/seed/ef43ae35-2145-370a-9bb4-b3bea141b73e/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1455, 485, 'https://picsum.photos/seed/b43a0bef-1a23-35b5-b1fb-684738b7e016/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41');
INSERT INTO `product_images` (`id`, `product_id`, `path`, `position`, `is_primary`, `created_at`, `updated_at`) VALUES
(1456, 486, 'https://picsum.photos/seed/95cfc474-20e2-35c1-acf1-412e98467b4e/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1457, 486, 'https://picsum.photos/seed/3d55b4a0-40e2-354a-9309-c9cc64d47805/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1458, 486, 'https://picsum.photos/seed/dc8e6f1c-5779-3f8a-969f-4cdf2615d052/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1459, 487, 'https://picsum.photos/seed/1a3075cc-808a-30cc-af63-5659672c0d7d/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1460, 487, 'https://picsum.photos/seed/e0f0398d-ad6c-3a53-a056-b77e205749b7/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1461, 487, 'https://picsum.photos/seed/ef88e8eb-22ce-3193-b690-b583e5b3c5f0/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1462, 488, 'https://picsum.photos/seed/2f47d132-2467-3157-81c3-eb5f44dedde1/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1463, 488, 'https://picsum.photos/seed/b83a2310-7e68-3ecb-b83b-656bce8f8ee1/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1464, 488, 'https://picsum.photos/seed/c61f707b-dda6-381e-9f7e-ed3948b895f6/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1465, 489, 'https://picsum.photos/seed/10c10efb-e622-30a0-be69-0fde240808f9/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1466, 489, 'https://picsum.photos/seed/c92df5d4-ba15-3318-9593-75b198bd4559/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1467, 489, 'https://picsum.photos/seed/ae4ce498-b171-3cbf-ac73-789faf578f5e/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1468, 490, 'https://picsum.photos/seed/017bc593-b633-3f74-8a76-65d708a2ac94/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1469, 490, 'https://picsum.photos/seed/bdc94f2b-22c2-359c-a28f-0916b396d40c/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1470, 490, 'https://picsum.photos/seed/4ccc3a2d-ed6f-3bbc-914a-f92e6686fe79/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1471, 491, 'https://picsum.photos/seed/8353f5d9-142b-3937-9f58-f3c20e4e5c7f/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1472, 491, 'https://picsum.photos/seed/f5803217-ce9e-3931-972f-695ddaec6ccf/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1473, 491, 'https://picsum.photos/seed/a37f96b4-4d33-3ba4-8b7e-2d41c5dd70b3/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1474, 492, 'https://picsum.photos/seed/e067e67a-87e0-3b1a-a795-9478b3a2c638/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1475, 492, 'https://picsum.photos/seed/7b3bfc7f-e82b-3d5a-a2bf-b35fb0ad10ff/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1476, 492, 'https://picsum.photos/seed/34455b99-fec9-34ec-9ddf-df20f673cc0b/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1477, 493, 'https://picsum.photos/seed/e49d7143-0d04-3b6e-9035-c572efa64b45/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1478, 493, 'https://picsum.photos/seed/38b0e4ab-8f9b-3c67-972f-d3dfebb142b3/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1479, 493, 'https://picsum.photos/seed/2d370f74-64b6-3dd6-8eb2-d58b65d635b3/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1480, 494, 'https://picsum.photos/seed/1fce29a8-bcee-3609-b427-73f11d37b136/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1481, 494, 'https://picsum.photos/seed/08b2993b-4851-37fa-a359-cb816d57db36/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1482, 494, 'https://picsum.photos/seed/6a63ede9-0a6a-38fd-a7f3-6d61f226387a/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1483, 495, 'https://picsum.photos/seed/36aa6037-48e2-3851-83e8-2aa586d8eea3/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1484, 495, 'https://picsum.photos/seed/9abca176-557e-3ed5-9d13-9e718d0e7f19/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1485, 495, 'https://picsum.photos/seed/cc90e56c-db57-338e-881a-44cb78099761/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1486, 496, 'https://picsum.photos/seed/8c6107cb-6fb4-3310-8a9f-79981fd0a675/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1487, 496, 'https://picsum.photos/seed/29d8b7d4-90e3-3923-8fd0-afe506e9422e/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1488, 496, 'https://picsum.photos/seed/39c56e8a-8343-3681-9e97-14d09a69d358/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1489, 497, 'https://picsum.photos/seed/9e65e3cf-eed8-3ca4-a353-d520cf5cc8ef/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1490, 497, 'https://picsum.photos/seed/65b91073-b48c-328a-837d-b85e23b61200/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1491, 497, 'https://picsum.photos/seed/1998901a-4652-33fa-a6ac-240b218b6260/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1492, 498, 'https://picsum.photos/seed/dc5de924-f21a-3727-8f1a-a65844373ef6/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1493, 498, 'https://picsum.photos/seed/ef9f5298-60d4-31dd-9de2-27ff43d4fc55/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1494, 498, 'https://picsum.photos/seed/0f3a57cd-c9a6-365e-b25a-aca4b62536f8/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1495, 499, 'https://picsum.photos/seed/9025ff9f-0990-301c-b412-3d8da7eac8d3/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1496, 499, 'https://picsum.photos/seed/83ac12a1-757a-3eac-a661-9cc6164f5532/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1497, 499, 'https://picsum.photos/seed/9ba36155-1791-36ed-84fb-940491d86c5f/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1498, 500, 'https://picsum.photos/seed/355c9545-6916-35f4-a257-858a2ab7f10b/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1499, 500, 'https://picsum.photos/seed/a91c9854-6538-345b-9b34-5ed7344a2e4e/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1500, 500, 'https://picsum.photos/seed/465037c7-4c65-311b-9205-44b2334be6f8/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1501, 501, 'https://picsum.photos/seed/480101ff-6ae0-3f1c-aa3f-54e71b1cdc41/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1502, 501, 'https://picsum.photos/seed/ac4044a8-14bc-329f-a222-46e421e9c301/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1503, 501, 'https://picsum.photos/seed/57049e23-3b44-304e-8439-7ba2b76b7945/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1504, 502, 'https://picsum.photos/seed/7b946750-918e-3ac5-a7a9-8763a9600e56/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1505, 502, 'https://picsum.photos/seed/460f7237-a5db-3de8-bbb7-056a7160dd18/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1506, 502, 'https://picsum.photos/seed/7807d764-29ae-3fec-b77d-757192fb4b0d/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1507, 503, 'https://picsum.photos/seed/a8936895-16f1-3181-93fc-63149e1954b6/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1508, 503, 'https://picsum.photos/seed/23cc556e-fd67-390d-ba2e-3e8363e26b97/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1509, 503, 'https://picsum.photos/seed/81fb2450-7429-3895-ab6a-a35ca460af0f/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1510, 504, 'https://picsum.photos/seed/54891977-4e96-35d7-93bf-4ed8c50dcd99/600/450', 1, 1, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1511, 504, 'https://picsum.photos/seed/bb7b32d1-8e40-3074-b77d-6d048f7843b7/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41'),
(1512, 504, 'https://picsum.photos/seed/b19c9873-b9e1-3067-9f9b-ebbbd0a958d2/600/450', 0, 0, '2025-10-23 16:09:41', '2025-10-23 16:09:41');

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
(1, 'Super Admin', 'admin', '2025-10-23 13:22:35', '2025-10-23 13:22:35');

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
(85, 1);

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
('77GUZTp3QxtBNGw4Dfel4sYWk50qwt6YnMr06dzR', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0) Gecko/20100101 Firefox/144.0', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiZUFoNExSZ0kzTFFDWUxkQUtXZWNVVk1Tb1M1bVJjd1VHdVNGdzhWVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9lY29tbWVyY2VsYXJhdmVsLnRlc3QvY2FydCI7czo1OiJyb3V0ZSI7czoxMDoiY2FydC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTM6ImN1cnJlbmN5X2NvZGUiO3M6MzoiR0JQIjtzOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MzoidXJsIjthOjA6e31zOjUyOiJsb2dpbl9hZG1pbl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNToiY2FydF9zZXNzaW9uX2lkIjtzOjM2OiJmMGI4MTE2MS0yN2NiLTQ5ODktOTc2YS03YWZjNDkyNGEyMWIiO30=', 1761340031),
('iyQAB4sXYSf3GkChB8wp7E0iVsnTv2erHBluOxze', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSDdaUVg4ZnBhbGQ5Z3RiWVRIWU9MMkJKT1JoT1RZOXk3RHFzS2U0TCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9lY29tbWVyY2VsYXJhdmVsLnRlc3QvY2FydCI7czo1OiJyb3V0ZSI7czoxMDoiY2FydC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTU6ImNhcnRfc2Vzc2lvbl9pZCI7czozNjoiMTlmYmZmNTgtYmNkNy00MWI4LWJkOGMtYjdlMWI2Y2EwOWY1Ijt9', 1761341730),
('m4FavkfVvNnb2xEIu3BIawlNH2cRuiAych6ZSI4X', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0) Gecko/20100101 Firefox/144.0', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoibFUzNFZEa21OUlJYY1BiOVFUcUxtTG9sZ3J0d24waTRSaFYwam82aCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9lY29tbWVyY2VsYXJhdmVsLnRlc3QvYWRtaW4vc2hpcHBpbmctc2V0dGluZ3MiO3M6NToicm91dGUiO3M6Mjk6ImFkbWluLnNoaXBwaW5nLXNldHRpbmdzLmluZGV4Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE1OiJjYXJ0X3Nlc3Npb25faWQiO3M6MzY6ImNjZjY5MWQzLWMxMTYtNGVkYS04ZDJmLTgwYWZlOGIwNGZjOCI7czozOiJ1cmwiO2E6MDp7fXM6NTI6ImxvZ2luX2FkbWluXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjEzOiJyZWZlcnJhbF9jb2RlIjtzOjg6IkVDM0YxMEM1Ijt9', 1761344883),
('NPLAbBI2BIEZAzpW9x0bDuOzZplXALsinkzFG7FS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0) Gecko/20100101 Firefox/144.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWRZUWFVQmNQaHdkaG5uTDZaUzIwQ1FPbjc0V0hZb0hxcjFKb2ZtWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9lY29tbWVyY2VsYXJhdmVsLnRlc3QvYWRtaW4vbG9naW4iO3M6NToicm91dGUiO3M6MTE6ImFkbWluLmxvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1761339188);

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
(1, 1, 0, '500.00', '[]', 1, 'flat', '100.00', '2025-10-24 16:18:48', '2025-10-24 16:27:58');

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

INSERT INTO `site_settings` (`id`, `site_name`, `site_tagline`, `logo_url`, `favicon_url`, `meta_title`, `meta_description`, `meta_keywords`, `footer_text`, `privacy_url`, `terms_url`, `cookies_url`, `social_facebook`, `social_twitter`, `social_instagram`, `social_linkedin`, `created_at`, `updated_at`) VALUES
(1, 'eYamin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-24 13:21:13', '2025-10-24 13:23:36');

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
(1, 'Test User', 'test@example.com', '01878578504', '2025-10-23 12:57:12', '$2y$12$dps5rF9v2Vpj5dSDEkCLUOfCpw1st.4VVmGzg535GsJV.0sMTiUm2', 65, 'dQB7d4guZgQqbv7obIfxU6FOJAGi70TLoudo246aQLy00B8gviZW2yn5vHrt', NULL, '2025-10-23 12:57:13', '2025-10-24 15:49:55', NULL),
(3, 'API Test User', 'apitest@example.com', NULL, NULL, '$2y$12$7fUZ2evFO/2UlOCiSHAf7.rB/w4RZ12/t0h/1n5jGizvhbecDSlme', 0, NULL, NULL, '2025-10-23 14:31:52', '2025-10-23 14:31:52', NULL);

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

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user_id`, `type`, `first_name`, `last_name`, `company`, `address_line_1`, `address_line_2`, `city`, `state`, `postal_code`, `country`, `phone`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'shipping', 'test', 'test', NULL, 'test', 'test', 'test', 'test', '1212', 'United States', '0000000', 0, '2025-10-24 11:19:51', '2025-10-24 11:19:51');

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
(10, 1, 'add_to_cart', 5, 'Added to cart', 'App\\Models\\CartItem', 117, '{\"product_id\": 446}', '2025-10-24 15:49:06', '2025-10-24 15:49:06'),
(11, 1, 'add_to_cart', 5, 'Added to cart', 'App\\Models\\CartItem', 118, '{\"product_id\": 500}', '2025-10-24 15:49:07', '2025-10-24 15:49:07'),
(12, 1, 'add_to_cart', 5, 'Added to cart', 'App\\Models\\CartItem', 119, '{\"product_id\": 460}', '2025-10-24 15:49:07', '2025-10-24 15:49:07'),
(13, 1, 'add_to_cart', 5, 'Added to cart', 'App\\Models\\CartItem', 120, '{\"product_id\": 464}', '2025-10-24 15:49:08', '2025-10-24 15:49:08'),
(14, 1, 'remove_from_cart', -5, 'Removed from cart', 'App\\Models\\CartItem', 117, '{\"product_id\": 446}', '2025-10-24 15:49:16', '2025-10-24 15:49:16'),
(15, 1, 'remove_from_cart', -5, 'Cleared cart', 'App\\Models\\CartItem', 119, '{\"product_id\": 460}', '2025-10-24 15:49:19', '2025-10-24 15:49:19'),
(16, 1, 'remove_from_cart', -5, 'Cleared cart', 'App\\Models\\CartItem', 120, '{\"product_id\": 464}', '2025-10-24 15:49:19', '2025-10-24 15:49:19'),
(17, 1, 'remove_from_cart', -5, 'Cleared cart', 'App\\Models\\CartItem', 118, '{\"product_id\": 500}', '2025-10-24 15:49:19', '2025-10-24 15:49:19'),
(18, 1, 'add_to_cart', 5, 'Added to cart', 'App\\Models\\CartItem', 121, '{\"product_id\": 485}', '2025-10-24 15:49:26', '2025-10-24 15:49:26'),
(19, 1, 'admin_adjust', 10, 'admin_adjust', NULL, NULL, '[]', '2025-10-24 15:49:40', '2025-10-24 15:49:40'),
(20, 1, 'admin_adjust', 50, 'admin_adjust', NULL, NULL, '[]', '2025-10-24 15:49:55', '2025-10-24 15:49:55');

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- AUTO_INCREMENT for table `payment_gateway_settings`
--
ALTER TABLE `payment_gateway_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payment_logs`
--
ALTER TABLE `payment_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=505;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1513;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_points`
--
ALTER TABLE `user_points`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
