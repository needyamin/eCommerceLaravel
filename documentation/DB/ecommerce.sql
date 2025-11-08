-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 08, 2025 at 08:31 PM
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
(1, 'Admin', 'admin@example.com', NULL, '$2y$12$W9M8.9sUSzEYoswwLnP5me9jQDg25TjYrz2F2q6bdAvIwZFjTykYu', NULL, '2025-11-07 13:50:48', '2025-11-08 14:30:51');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:106:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:18:\"admin.users.lookup\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:15:\"admin.dashboard\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:22:\"admin.categories.index\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:23:\"admin.categories.create\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:22:\"admin.categories.store\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:21:\"admin.categories.show\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:21:\"admin.categories.edit\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:23:\"admin.categories.update\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:24:\"admin.categories.destroy\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:21:\"admin.products.lookup\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:19:\"admin.products.json\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:20:\"admin.products.index\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:21:\"admin.products.create\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:20:\"admin.products.store\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:19:\"admin.products.show\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:19:\"admin.products.edit\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:21:\"admin.products.update\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:22:\"admin.products.destroy\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:19:\"admin.orders.create\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:18:\"admin.orders.store\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:18:\"admin.orders.index\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:17:\"admin.orders.show\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:19:\"admin.orders.update\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:20:\"admin.orders.invoice\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:17:\"admin.users.index\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:16:\"admin.users.show\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:16:\"admin.users.edit\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:18:\"admin.users.update\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:19:\"admin.users.destroy\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:26:\"admin.users.reset-password\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:25:\"admin.users.toggle-status\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:24:\"admin.users.coins.adjust\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:23:\"admin.users.coins.reset\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:29:\"admin.shipping-settings.index\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:30:\"admin.shipping-settings.update\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:26:\"admin.email-settings.index\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:27:\"admin.email-settings.update\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:1:{i:0;i:1;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:17:\"admin.roles.index\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:18:\"admin.roles.create\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:17:\"admin.roles.store\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:16:\"admin.roles.edit\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:18:\"admin.roles.update\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:19:\"admin.roles.destroy\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:23:\"admin.permissions.index\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:24:\"admin.permissions.create\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:23:\"admin.permissions.store\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:22:\"admin.permissions.edit\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:24:\"admin.permissions.update\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:48;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:25:\"admin.permissions.destroy\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:49;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:19:\"admin.coupons.index\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:50;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:20:\"admin.coupons.create\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:51;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:19:\"admin.coupons.store\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:52;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:18:\"admin.coupons.edit\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:53;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:20:\"admin.coupons.update\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:54;a:4:{s:1:\"a\";i:55;s:1:\"b\";s:21:\"admin.coupons.destroy\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:55;a:4:{s:1:\"a\";i:56;s:1:\"b\";s:27:\"admin.coupons.toggle-status\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:56;a:4:{s:1:\"a\";i:57;s:1:\"b\";s:22:\"admin.newsletter.index\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:57;a:4:{s:1:\"a\";i:58;s:1:\"b\";s:23:\"admin.newsletter.toggle\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:58;a:4:{s:1:\"a\";i:59;s:1:\"b\";s:24:\"admin.newsletter.destroy\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:59;a:4:{s:1:\"a\";i:60;s:1:\"b\";s:19:\"admin.reviews.index\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:60;a:4:{s:1:\"a\";i:61;s:1:\"b\";s:21:\"admin.reviews.approve\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:61;a:4:{s:1:\"a\";i:62;s:1:\"b\";s:20:\"admin.reviews.reject\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:62;a:4:{s:1:\"a\";i:63;s:1:\"b\";s:21:\"admin.reviews.destroy\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:63;a:4:{s:1:\"a\";i:64;s:1:\"b\";s:28:\"admin.payment-gateways.index\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:64;a:4:{s:1:\"a\";i:65;s:1:\"b\";s:27:\"admin.payment-gateways.show\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:65;a:4:{s:1:\"a\";i:66;s:1:\"b\";s:29:\"admin.payment-gateways.update\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:66;a:4:{s:1:\"a\";i:67;s:1:\"b\";s:36:\"admin.payment-gateways.toggle-status\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:67;a:4:{s:1:\"a\";i:68;s:1:\"b\";s:27:\"admin.payment-gateways.test\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:68;a:4:{s:1:\"a\";i:69;s:1:\"b\";s:24:\"admin.otp-settings.index\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:1:{i:0;i:1;}}i:69;a:4:{s:1:\"a\";i:70;s:1:\"b\";s:25:\"admin.otp-settings.update\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:1:{i:0;i:1;}}i:70;a:4:{s:1:\"a\";i:71;s:1:\"b\";s:22:\"admin.activities.carts\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:71;a:4:{s:1:\"a\";i:72;s:1:\"b\";s:26:\"admin.activities.wishlists\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:72;a:4:{s:1:\"a\";i:73;s:1:\"b\";s:25:\"admin.activities.sessions\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:73;a:4:{s:1:\"a\";i:74;s:1:\"b\";s:33:\"admin.activities.sessions.destroy\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:74;a:4:{s:1:\"a\";i:75;s:1:\"b\";s:38:\"admin.activities.sessions.destroy-user\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:75;a:4:{s:1:\"a\";i:76;s:1:\"b\";s:21:\"admin.coupons.preview\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:76;a:4:{s:1:\"a\";i:77;s:1:\"b\";s:22:\"admin.currencies.index\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:77;a:4:{s:1:\"a\";i:78;s:1:\"b\";s:23:\"admin.currencies.create\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:78;a:4:{s:1:\"a\";i:79;s:1:\"b\";s:22:\"admin.currencies.store\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:79;a:4:{s:1:\"a\";i:80;s:1:\"b\";s:21:\"admin.currencies.edit\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:80;a:4:{s:1:\"a\";i:81;s:1:\"b\";s:23:\"admin.currencies.update\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:81;a:4:{s:1:\"a\";i:82;s:1:\"b\";s:24:\"admin.currencies.destroy\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:82;a:4:{s:1:\"a\";i:83;s:1:\"b\";s:23:\"admin.currencies.toggle\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:83;a:4:{s:1:\"a\";i:84;s:1:\"b\";s:24:\"admin.currencies.default\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:84;a:4:{s:1:\"a\";i:85;s:1:\"b\";s:25:\"admin.site-settings.index\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:1:{i:0;i:1;}}i:85;a:4:{s:1:\"a\";i:86;s:1:\"b\";s:26:\"admin.site-settings.update\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:1:{i:0;i:1;}}i:86;a:4:{s:1:\"a\";i:87;s:1:\"b\";s:18:\"admin.admins.index\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:87;a:4:{s:1:\"a\";i:88;s:1:\"b\";s:19:\"admin.admins.create\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:88;a:4:{s:1:\"a\";i:89;s:1:\"b\";s:18:\"admin.admins.store\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:89;a:4:{s:1:\"a\";i:90;s:1:\"b\";s:17:\"admin.admins.edit\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:90;a:4:{s:1:\"a\";i:91;s:1:\"b\";s:19:\"admin.admins.update\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:91;a:4:{s:1:\"a\";i:92;s:1:\"b\";s:20:\"admin.admins.destroy\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:92;a:4:{s:1:\"a\";i:93;s:1:\"b\";s:25:\"admin.coin-settings.index\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:1:{i:0;i:1;}}i:93;a:4:{s:1:\"a\";i:94;s:1:\"b\";s:26:\"admin.coin-settings.update\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:1:{i:0;i:1;}}i:94;a:4:{s:1:\"a\";i:95;s:1:\"b\";s:17:\"admin.pages.index\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:95;a:4:{s:1:\"a\";i:96;s:1:\"b\";s:18:\"admin.pages.create\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:96;a:4:{s:1:\"a\";i:97;s:1:\"b\";s:17:\"admin.pages.store\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:97;a:4:{s:1:\"a\";i:98;s:1:\"b\";s:16:\"admin.pages.show\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:98;a:4:{s:1:\"a\";i:99;s:1:\"b\";s:16:\"admin.pages.edit\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:99;a:4:{s:1:\"a\";i:100;s:1:\"b\";s:18:\"admin.pages.update\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:100;a:4:{s:1:\"a\";i:101;s:1:\"b\";s:19:\"admin.pages.destroy\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:101;a:4:{s:1:\"a\";i:102;s:1:\"b\";s:16:\"admin.datatables\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:102;a:4:{s:1:\"a\";i:103;s:1:\"b\";s:13:\"admin.captcha\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:103;a:4:{s:1:\"a\";i:104;s:1:\"b\";s:12:\"admin.logout\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:104;a:4:{s:1:\"a\";i:105;s:1:\"b\";s:16:\"admin.roles.copy\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:105;a:4:{s:1:\"a\";i:106;s:1:\"b\";s:22:\"admin.roles.copy.store\";s:1:\"c\";s:5:\"admin\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}}s:5:\"roles\";a:2:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:11:\"Super Admin\";s:1:\"c\";s:5:\"admin\";}i:1;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:5:\"Admin\";s:1:\"c\";s:5:\"admin\";}}}', 1762720252);

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
(1, NULL, 'fc87ea55-0907-4481-8ada-7491c1ea5ca8', '0.00', '0.00', '0.00', '0.00', '2025-11-07 13:51:54', '2025-11-07 13:51:58', NULL, '0.00'),
(2, 2, NULL, '13.34', '0.00', '0.00', '13.34', '2025-11-08 10:58:02', '2025-11-08 12:19:33', NULL, '0.00'),
(3, 3, NULL, '0.00', '0.00', '0.00', '0.00', '2025-11-08 11:01:23', '2025-11-08 13:36:10', NULL, '0.00'),
(4, NULL, '51193e83-9bf1-49f1-89a8-bfb73387b601', '224.14', '0.00', '0.00', '224.14', '2025-11-08 11:01:47', '2025-11-08 11:01:51', NULL, '0.00'),
(5, NULL, '4cb8a2e0-5a5f-44e7-99f7-4ebd6ec2f19a', '984.35', '0.00', '0.00', '984.35', '2025-11-08 11:03:30', '2025-11-08 11:03:38', NULL, '0.00'),
(6, NULL, '69217dfc-1b5b-418d-9206-7d7f80ffd526', '0.00', '0.00', '0.00', '0.00', '2025-11-08 12:36:46', '2025-11-08 12:36:46', NULL, '0.00'),
(7, NULL, '9ea496b0-36c4-45f7-9f39-67c858b6bf63', '245.37', '0.00', '0.00', '245.37', '2025-11-08 14:02:17', '2025-11-08 14:02:18', NULL, '0.00');

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
(8, 4, 64, 2, '112.07', '224.14', '2025-11-08 11:01:47', '2025-11-08 11:01:51'),
(9, 5, 63, 1, '13.34', '13.34', '2025-11-08 11:03:30', '2025-11-08 11:03:30'),
(10, 5, 64, 1, '112.07', '112.07', '2025-11-08 11:03:32', '2025-11-08 11:03:32'),
(11, 5, 66, 1, '161.94', '161.94', '2025-11-08 11:03:33', '2025-11-08 11:03:33'),
(12, 5, 55, 1, '190.42', '190.42', '2025-11-08 11:03:34', '2025-11-08 11:03:34'),
(13, 5, 26, 1, '104.94', '104.94', '2025-11-08 11:03:35', '2025-11-08 11:03:35'),
(14, 5, 70, 1, '64.97', '64.97', '2025-11-08 11:03:36', '2025-11-08 11:03:36'),
(15, 5, 15, 1, '213.16', '213.16', '2025-11-08 11:03:37', '2025-11-08 11:03:37'),
(16, 5, 24, 1, '123.51', '123.51', '2025-11-08 11:03:38', '2025-11-08 11:03:38'),
(31, 2, 63, 1, '13.34', '13.34', '2025-11-08 12:18:56', '2025-11-08 12:18:56'),
(76, 7, 56, 1, '54.95', '54.95', '2025-11-08 14:02:17', '2025-11-08 14:02:17'),
(77, 7, 55, 1, '190.42', '190.42', '2025-11-08 14:02:18', '2025-11-08 14:02:18');

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
(1, NULL, 'Yamin', 'voluptatem-dicta-P1rT5', 'Labore nihil recusandae dignissimos velit quibusdam incidunt voluptatem molestias facilis non et libero ut.', NULL, 1, '2025-11-07 13:50:48', '2025-11-08 14:08:27'),
(2, 1, 'Shohan', 'dicta-sed-2tsJt', 'Ratione vitae esse in ut nulla expedita.', NULL, 1, '2025-11-07 13:50:48', '2025-11-08 14:08:37'),
(3, NULL, 'Aut voluptatibus', 'aut-voluptatibus-ijx0t', 'Atque repudiandae adipisci amet rerum neque fuga alias molestiae fuga ut maiores veniam.', NULL, 1, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(4, NULL, 'Animi veritatis', 'animi-veritatis-ZssN3', 'Voluptas labore eligendi earum voluptatem quos illum quisquam quis voluptas mollitia amet.', NULL, 1, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(5, NULL, 'Beatae fugiat', 'beatae-fugiat-qX6wj', 'Vel rerum voluptatem provident unde sint ad.', NULL, 1, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(6, NULL, 'Debitis consequatur', 'debitis-consequatur-C9Qhu', 'Itaque cupiditate dolor necessitatibus magni deserunt voluptatem.', NULL, 1, '2025-11-07 13:50:48', '2025-11-07 13:50:48');

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
(1, 1, 1, 1, 1, 1, 1, 10, 100, 1, 1, 1, 10, '2025-11-08 12:16:33', '2025-11-08 12:16:33');

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
(1, 'WELCOME10', 'Welcome Discount', 'Get 10% off your first order', 'percentage', '10.00', '50.00', '25.00', 100, 1, '2025-11-07', '2026-02-07', 1, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(2, 'SAVE20', 'Save $20', 'Get $20 off orders over $100', 'fixed', '20.00', '100.00', NULL, 50, 2, '2025-11-07', '2026-01-07', 1, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(3, 'FREESHIP', 'Free Shipping', 'Free shipping on any order', 'fixed', '10.00', NULL, NULL, 200, 3, '2025-11-07', '2026-11-07', 1, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(4, 'HOLIDAY25', 'Holiday Special', '25% off for holiday season', 'percentage', '25.00', '75.00', '50.00', 30, 1, '2025-11-07', '2025-12-07', 1, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(5, 'STUDENT15', 'Student Discount', '15% off for students', 'percentage', '15.00', '30.00', '30.00', NULL, 5, '2025-11-07', '2026-05-07', 1, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50');

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
(1, 'BDT', 'Bangladeshi Taka', '৳', 2, ',', '.', 1, '110.00000000', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(2, 'USD', 'US Dollar', '$', 2, ',', '.', 1, '1.00000000', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(3, 'EUR', 'Euro', '€', 2, '.', ',', 1, '0.92000000', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(4, 'GBP', 'British Pound', '£', 2, ',', '.', 1, '0.78000000', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50');

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
(1, 'from_name', 'From Name', 'eCommerce Store', 'The name that appears in the \"From\" field of emails', '2025-11-07 13:50:42', '2025-11-07 13:50:42'),
(2, 'from_email', 'From Email', 'noreply@ecommercestore.com', 'The email address that appears in the \"From\" field of emails', '2025-11-07 13:50:42', '2025-11-07 13:50:42'),
(3, 'order_confirmation_enabled', 'Order Confirmation Emails', '1', 'Send confirmation emails when orders are placed', '2025-11-07 13:50:42', '2025-11-07 13:50:42'),
(4, 'order_status_update_enabled', 'Order Status Update Emails', '1', 'Send emails when order status is updated', '2025-11-07 13:50:42', '2025-11-07 13:50:42');

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
(11, '019dba4d-2c7d-4475-83b5-1f6b1a28f8cd', 56, '2025-11-08 14:02:15', '2025-11-08 14:02:15');

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
(32, '2025_11_04_120000_create_wishlists_table', 1),
(33, '2025_11_04_120100_add_wishlist_enabled_to_site_settings', 1),
(34, '2025_11_04_120200_create_guest_wishlists_table', 1),
(35, '2025_11_07_022231_create_product_reviews_table', 1),
(36, '2025_11_07_022251_add_review_settings_to_site_settings_table', 1),
(37, '2025_11_07_023046_add_newsletter_settings_to_site_settings_table', 1),
(38, '2025_11_07_024826_add_customer_service_links_to_site_settings_table', 1),
(39, '2025_11_07_025029_create_pages_table', 1),
(40, '2025_11_08_190255_add_product_display_columns_to_site_settings_table', 2);

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
(1, 'needyamin@gmail.com', NULL, 'unsubscribed', 'home', '60cebf52-ffec-4838-b66d-e6bb893206bc', NULL, NULL, '2025-11-08 11:14:30', '2025-11-08 11:16:56'),
(2, 'otitheedev@gmail.com', NULL, 'unsubscribed', 'home', '05ad0a20-ea3a-4e56-9eed-1c55540a9c1b', NULL, NULL, '2025-11-08 13:36:13', '2025-11-08 13:36:13');

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
(1, 'POS-20251108-181517-121', 1, 'shipped', '44116.60', '100.00', '50.00', '100.00', '44166.60', 'BDT', NULL, 'unpaid', NULL, 'shipped', 'Test User', 'test@example.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-08 12:15:17', '2025-11-08 12:15:36');

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
(1, 1, 63, 'Illum placeat iste', 'JFHW5QRP', 2, '1467.40', '2934.80', '2025-11-08 12:15:17', '2025-11-08 12:15:17'),
(2, 1, 8, 'Consectetur doloribus aut', 'KQXG6JCZ', 1, '14799.40', '14799.40', '2025-11-08 12:15:17', '2025-11-08 12:15:17'),
(3, 1, 63, 'Illum placeat iste', 'JFHW5QRP', 1, '1467.40', '1467.40', '2025-11-08 12:15:17', '2025-11-08 12:15:17'),
(4, 1, 63, 'Illum placeat iste', 'JFHW5QRP', 1, '1467.40', '1467.40', '2025-11-08 12:15:17', '2025-11-08 12:15:17'),
(5, 1, 15, 'Ipsum voluptas quis', 'YNPGBW4N', 1, '23447.60', '23447.60', '2025-11-08 12:15:17', '2025-11-08 12:15:17');

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
(1, 1, 0, 6, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-08 12:16:30', '2025-11-08 12:16:30');

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
(1, 'Help Center', 'help-center', '<h2>Welcome to Our Help Center</h2>\n<p>We are here to help you with any questions or concerns you may have. Below you will find answers to the most frequently asked questions.</p>\n\n<h3>Frequently Asked Questions</h3>\n\n<h4>How do I place an order?</h4>\n<p>Placing an order is easy! Simply browse our products, add items to your cart, and proceed to checkout. You can pay using various payment methods including credit cards, PayPal, or Cash on Delivery.</p>\n\n<h4>How can I track my order?</h4>\n<p>Once your order is shipped, you will receive a tracking number via email. You can use this tracking number to monitor your package\'s journey to your doorstep.</p>\n\n<h4>What if I forgot my password?</h4>\n<p>Click on the \"Forgot Password\" link on the login page. Enter your email address and we\'ll send you instructions to reset your password.</p>\n\n<h4>How do I update my account information?</h4>\n<p>You can update your account information by logging into your account and visiting the Profile section. From there, you can edit your personal details, shipping addresses, and more.</p>\n\n<h4>Do you offer international shipping?</h4>\n<p>Currently, we ship to select countries. Please check our Shipping Info page for more details about shipping destinations and rates.</p>\n\n<h3>Still Need Help?</h3>\n<p>If you can\'t find the answer you\'re looking for, please don\'t hesitate to <a href=\"/page/contact-us\">contact us</a>. Our customer service team is available to assist you.</p>', 'Help Center - Frequently Asked Questions', 'Find answers to frequently asked questions about ordering, shipping, returns, and more.', 'help center, FAQ, customer support, questions, answers', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(2, 'Shipping Info', 'shipping-info', '<h2>Shipping Information</h2>\n<p>We want to make sure your order arrives safely and on time. Here\'s everything you need to know about our shipping policies.</p>\n\n<h3>Shipping Methods</h3>\n<p>We offer several shipping options to meet your needs:</p>\n<ul>\n    <li><strong>Standard Shipping:</strong> 5-7 business days - Free on orders over $50</li>\n    <li><strong>Express Shipping:</strong> 2-3 business days - $15.00</li>\n    <li><strong>Overnight Shipping:</strong> Next business day - $25.00</li>\n</ul>\n\n<h3>Shipping Rates</h3>\n<table class=\"table table-bordered\">\n    <thead>\n        <tr>\n            <th>Order Value</th>\n            <th>Standard Shipping</th>\n            <th>Express Shipping</th>\n        </tr>\n    </thead>\n    <tbody>\n        <tr>\n            <td>Under $50</td>\n            <td>$5.99</td>\n            <td>$15.00</td>\n        </tr>\n        <tr>\n            <td>$50 - $100</td>\n            <td>FREE</td>\n            <td>$15.00</td>\n        </tr>\n        <tr>\n            <td>Over $100</td>\n            <td>FREE</td>\n            <td>$10.00</td>\n        </tr>\n    </tbody>\n</table>\n\n<h3>Processing Time</h3>\n<p>Orders are typically processed within 1-2 business days. During peak seasons or sales, processing may take up to 3 business days.</p>\n\n<h3>International Shipping</h3>\n<p>We currently ship to the following countries:</p>\n<ul>\n    <li>United States</li>\n    <li>Canada</li>\n    <li>United Kingdom</li>\n    <li>Australia</li>\n    <li>Select European countries</li>\n</ul>\n<p>International shipping rates vary by destination and are calculated at checkout.</p>\n\n<h3>Order Tracking</h3>\n<p>Once your order ships, you\'ll receive a tracking number via email. You can use this number to track your package on the carrier\'s website.</p>\n\n<h3>Shipping Restrictions</h3>\n<p>Some items may have shipping restrictions due to size, weight, or regulations. These restrictions will be noted on the product page.</p>\n\n<h3>Questions?</h3>\n<p>If you have any questions about shipping, please <a href=\"/page/contact-us\">contact our customer service team</a>.</p>', 'Shipping Information - Delivery Options & Rates', 'Learn about our shipping methods, rates, processing times, and international shipping options.', 'shipping, delivery, shipping rates, shipping methods, international shipping', 1, 2, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(3, 'Returns', 'returns', '<h2>Returns & Refunds Policy</h2>\n<p>We want you to be completely satisfied with your purchase. If you\'re not happy with your order, we\'re here to help.</p>\n\n<h3>Return Policy</h3>\n<p>You have <strong>30 days</strong> from the date of delivery to return items for a full refund or exchange.</p>\n\n<h3>Eligible Items</h3>\n<p>Items must be:</p>\n<ul>\n    <li>Unused and in original condition</li>\n    <li>In original packaging with all tags attached</li>\n    <li>Accompanied by proof of purchase</li>\n</ul>\n\n<h3>Non-Returnable Items</h3>\n<p>The following items cannot be returned:</p>\n<ul>\n    <li>Personalized or customized products</li>\n    <li>Items damaged by misuse or normal wear</li>\n    <li>Items without proof of purchase</li>\n    <li>Digital products or downloadable content</li>\n    <li>Gift cards</li>\n</ul>\n\n<h3>How to Return an Item</h3>\n<ol>\n    <li>Log into your account and go to \"My Orders\"</li>\n    <li>Select the order containing the item you want to return</li>\n    <li>Click \"Request Return\" and select the items</li>\n    <li>Print the return label provided</li>\n    <li>Package the item securely with the return label</li>\n    <li>Drop off at any authorized carrier location</li>\n</ol>\n\n<h3>Return Shipping</h3>\n<p>Return shipping costs are the responsibility of the customer unless the item was defective or incorrect. If you received a wrong or defective item, we\'ll cover the return shipping costs.</p>\n\n<h3>Refund Process</h3>\n<p>Once we receive your return:</p>\n<ul>\n    <li>We\'ll inspect the item within 2-3 business days</li>\n    <li>If approved, your refund will be processed</li>\n    <li>Refunds are issued to the original payment method</li>\n    <li>You\'ll receive your refund within 5-10 business days</li>\n</ul>\n\n<h3>Exchanges</h3>\n<p>We currently don\'t offer direct exchanges. To exchange an item:</p>\n<ol>\n    <li>Return the original item following the return process</li>\n    <li>Place a new order for the item you want</li>\n</ol>\n\n<h3>Damaged or Defective Items</h3>\n<p>If you receive a damaged or defective item, please contact us immediately. We\'ll arrange for a replacement or full refund, including return shipping costs.</p>\n\n<h3>Questions?</h3>\n<p>If you have questions about returns or need assistance, please <a href=\"/page/contact-us\">contact us</a>. Our customer service team is happy to help!</p>', 'Returns & Refunds Policy - Easy Returns', 'Learn about our return policy, how to return items, refund process, and return shipping information.', 'returns, refunds, return policy, exchange, return shipping', 1, 3, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(4, 'Contact Us', 'contact-us', '<h2>Get in Touch</h2>\n<p>We\'d love to hear from you! Whether you have a question, feedback, or need assistance, our team is here to help.</p>\n\n<h3>Contact Information</h3>\n<div class=\"row\">\n    <div class=\"col-md-6\">\n        <h4><i class=\"bi bi-envelope\"></i> Email</h4>\n        <p>For general inquiries: <a href=\"mailto:support@example.com\">support@example.com</a></p>\n        <p>For business inquiries: <a href=\"mailto:business@example.com\">business@example.com</a></p>\n    </div>\n    <div class=\"col-md-6\">\n        <h4><i class=\"bi bi-telephone\"></i> Phone</h4>\n        <p>Customer Service: <strong>1-800-123-4567</strong></p>\n        <p>Hours: Monday - Friday, 9:00 AM - 6:00 PM EST</p>\n    </div>\n</div>\n\n<h3>Office Address</h3>\n<p>\n    <strong>eCommerce Store</strong><br>\n    123 Commerce Street<br>\n    Business City, BC 12345<br>\n    United States\n</p>\n\n<h3>Response Time</h3>\n<p>We aim to respond to all inquiries within 24-48 hours during business days. For urgent matters, please call our customer service line.</p>\n\n<h3>Social Media</h3>\n<p>Follow us on social media for updates, promotions, and more:</p>\n<ul>\n    <li><strong>Facebook:</strong> <a href=\"#\" target=\"_blank\">@ecommercestore</a></li>\n    <li><strong>Twitter:</strong> <a href=\"#\" target=\"_blank\">@ecommercestore</a></li>\n    <li><strong>Instagram:</strong> <a href=\"#\" target=\"_blank\">@ecommercestore</a></li>\n    <li><strong>LinkedIn:</strong> <a href=\"#\" target=\"_blank\">eCommerce Store</a></li>\n</ul>\n\n<h3>Frequently Asked Questions</h3>\n<p>Before contacting us, you might find the answer in our <a href=\"/page/help-center\">Help Center</a> or <a href=\"/page/shipping-info\">Shipping Info</a> pages.</p>\n\n<h3>Feedback</h3>\n<p>We value your feedback! If you have suggestions on how we can improve our service, please don\'t hesitate to reach out. Your input helps us serve you better.</p>', 'Contact Us - Get in Touch', 'Contact our customer service team via email, phone, or visit our office. We\'re here to help!', 'contact, customer service, support, email, phone, address', 1, 4, '2025-11-07 13:50:50', '2025-11-07 13:50:50');

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
(1, 'stripe', 'enabled', '0', 'Enable or disable Stripe payment gateway', 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(2, 'stripe', 'publishable_key', '', 'Stripe publishable key (starts with pk_)', 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(3, 'stripe', 'secret_key', '', 'Stripe secret key (starts with sk_)', 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(4, 'stripe', 'webhook_secret', '', 'Stripe webhook endpoint secret', 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(5, 'paypal', 'enabled', '0', 'Enable or disable PayPal payment gateway', 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(6, 'paypal', 'client_id', '', 'PayPal application client ID', 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(7, 'paypal', 'client_secret', '', 'PayPal application client secret', 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(8, 'paypal', 'sandbox_mode', '1', 'Use PayPal sandbox for testing', 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50');

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
(1, 'admin.users.lookup', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(2, 'admin.dashboard', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(3, 'admin.categories.index', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(4, 'admin.categories.create', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(5, 'admin.categories.store', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(6, 'admin.categories.show', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(7, 'admin.categories.edit', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(8, 'admin.categories.update', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(9, 'admin.categories.destroy', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(10, 'admin.products.lookup', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(11, 'admin.products.json', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(12, 'admin.products.index', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(13, 'admin.products.create', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(14, 'admin.products.store', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(15, 'admin.products.show', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(16, 'admin.products.edit', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(17, 'admin.products.update', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(18, 'admin.products.destroy', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(19, 'admin.orders.create', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(20, 'admin.orders.store', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(21, 'admin.orders.index', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(22, 'admin.orders.show', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(23, 'admin.orders.update', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(24, 'admin.orders.invoice', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(25, 'admin.users.index', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(26, 'admin.users.show', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(27, 'admin.users.edit', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(28, 'admin.users.update', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(29, 'admin.users.destroy', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(30, 'admin.users.reset-password', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(31, 'admin.users.toggle-status', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(32, 'admin.users.coins.adjust', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(33, 'admin.users.coins.reset', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(34, 'admin.shipping-settings.index', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(35, 'admin.shipping-settings.update', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(36, 'admin.email-settings.index', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(37, 'admin.email-settings.update', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(38, 'admin.roles.index', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(39, 'admin.roles.create', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(40, 'admin.roles.store', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(41, 'admin.roles.edit', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(42, 'admin.roles.update', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(43, 'admin.roles.destroy', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(44, 'admin.permissions.index', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(45, 'admin.permissions.create', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(46, 'admin.permissions.store', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(47, 'admin.permissions.edit', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(48, 'admin.permissions.update', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(49, 'admin.permissions.destroy', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(50, 'admin.coupons.index', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(51, 'admin.coupons.create', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(52, 'admin.coupons.store', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(53, 'admin.coupons.edit', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(54, 'admin.coupons.update', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(55, 'admin.coupons.destroy', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(56, 'admin.coupons.toggle-status', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(57, 'admin.newsletter.index', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(58, 'admin.newsletter.toggle', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(59, 'admin.newsletter.destroy', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(60, 'admin.reviews.index', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(61, 'admin.reviews.approve', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(62, 'admin.reviews.reject', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(63, 'admin.reviews.destroy', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(64, 'admin.payment-gateways.index', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(65, 'admin.payment-gateways.show', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(66, 'admin.payment-gateways.update', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(67, 'admin.payment-gateways.toggle-status', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(68, 'admin.payment-gateways.test', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(69, 'admin.otp-settings.index', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(70, 'admin.otp-settings.update', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(71, 'admin.activities.carts', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(72, 'admin.activities.wishlists', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(73, 'admin.activities.sessions', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(74, 'admin.activities.sessions.destroy', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(75, 'admin.activities.sessions.destroy-user', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(76, 'admin.coupons.preview', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(77, 'admin.currencies.index', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(78, 'admin.currencies.create', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(79, 'admin.currencies.store', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(80, 'admin.currencies.edit', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(81, 'admin.currencies.update', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(82, 'admin.currencies.destroy', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(83, 'admin.currencies.toggle', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(84, 'admin.currencies.default', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(85, 'admin.site-settings.index', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(86, 'admin.site-settings.update', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(87, 'admin.admins.index', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(88, 'admin.admins.create', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(89, 'admin.admins.store', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(90, 'admin.admins.edit', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(91, 'admin.admins.update', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(92, 'admin.admins.destroy', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(93, 'admin.coin-settings.index', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(94, 'admin.coin-settings.update', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(95, 'admin.pages.index', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(96, 'admin.pages.create', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(97, 'admin.pages.store', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(98, 'admin.pages.show', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(99, 'admin.pages.edit', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(100, 'admin.pages.update', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(101, 'admin.pages.destroy', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(102, 'admin.datatables', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(103, 'admin.captcha', 'admin', '2025-11-08 14:29:58', '2025-11-08 14:29:58'),
(104, 'admin.logout', 'admin', '2025-11-08 14:29:58', '2025-11-08 14:29:58'),
(105, 'admin.roles.copy', 'admin', '2025-11-08 14:29:58', '2025-11-08 14:29:58'),
(106, 'admin.roles.copy.store', 'admin', '2025-11-08 14:29:58', '2025-11-08 14:29:58');

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
(1, 1, 'Ex placeat sit', 'ex-placeat-sit-nRMmF', 'FNWYTUEW', 'Veritatis molestiae repellendus nihil consequatur veniam non quis qui aut ipsam minima et consequatur aut maxime adipisci.', 'Minima iusto ratione eos. Ea mollitia numquam nihil repellat. Repellendus temporibus tempore perspiciatis assumenda asperiores.', '40.33', '52.41', 0, 0, 0, NULL, NULL, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(2, 1, 'Quibusdam ut occaecati', 'quibusdam-ut-occaecati-l2P8z', 'HZZPP51H', 'Mollitia perferendis dolores est doloremque sunt natus corporis.', 'Quo quis nihil veniam odio. Quas et nostrum deserunt laboriosam totam quas ullam. Animi dicta totam aut ab temporibus vitae. Exercitationem et ut sapiente rerum adipisci neque nobis. Illum dolores qui nulla aut dolor voluptate et.', '17.25', NULL, 144, 1, 0, NULL, NULL, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(3, 1, 'Et consectetur cumque', 'et-consectetur-cumque-mKv4K', 'BW4FG0N0', 'Ipsum atque nihil nobis accusamus sint laboriosam et doloribus sint dolor qui libero officia.', 'Consequatur iste numquam voluptatum et expedita sed. Assumenda ut praesentium temporibus iure officia. Qui et officia voluptatibus corporis. Dolores iste libero nam molestias ad rerum. Vel aut sunt in molestiae est occaecati minima. Quia sit hic in sit cumque.', '43.63', NULL, 31, 1, 0, NULL, NULL, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(4, 1, 'Minima eum similique', 'minima-eum-similique-SA67Z', 'XGDQAWHE', 'Consectetur qui alias error adipisci id optio necessitatibus possimus distinctio ea nisi quidem ipsam non.', 'Et ducimus ut ipsum excepturi at illo tempora. Corporis eum ab iusto asperiores. Aut dolorem ut excepturi maxime qui eveniet earum qui. Sint sunt voluptatibus quasi vitae minus magni culpa. Suscipit dicta vel distinctio iusto minima qui aut voluptatem. Provident qui laborum deleniti iusto et accusantium.', '293.94', NULL, 9, 1, 1, NULL, NULL, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(5, 1, 'Eius voluptate minima', 'eius-voluptate-minima-82G18', 'CYXGDHBS', 'Rem molestias ex nulla deleniti ratione nobis sed vero consectetur fugit non autem unde est unde.', 'Nemo sit libero atque numquam alias omnis. Molestiae rem non totam similique eos quia. Possimus possimus autem quod sit et asperiores. Nihil provident suscipit consequuntur ducimus aliquam. Possimus aut reprehenderit debitis quos ducimus. Autem sint cum quas ut rem aliquam quam.', '176.24', NULL, 4, 1, 1, NULL, NULL, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(6, 1, 'Distinctio aspernatur architecto', 'distinctio-aspernatur-architecto-PmHLd', 'TSUSNH5Y', 'Voluptatem eaque soluta mollitia alias aut perspiciatis aut repellendus nulla qui aliquid eos.', 'Recusandae eum facilis qui sunt. Eos voluptatem illo blanditiis cum repellendus maiores cupiditate expedita. Ea accusantium vel officia sit asperiores iure. Eos nemo explicabo ratione temporibus labore eligendi earum ut. Necessitatibus adipisci reiciendis ducimus rem nulla et. Libero qui magni deleniti saepe molestias.', '233.75', '280.24', 36, 1, 0, NULL, NULL, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(7, 1, 'Nihil ut reprehenderit', 'nihil-ut-reprehenderit-lPg3G', '6XLYR1DU', 'Vitae odit veritatis suscipit sunt praesentium eum neque blanditiis dolorum cum aut cum velit exercitationem.', 'Dolores omnis omnis quod tempora ipsa eveniet. Enim eius et necessitatibus et. Eos inventore qui ex quod placeat ad delectus laboriosam. Incidunt et aut animi ut dicta labore nihil. Dicta sit et quaerat doloribus similique nam in sit.', '258.78', '268.58', 81, 1, 1, NULL, NULL, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(8, 1, 'Consectetur doloribus aut', 'consectetur-doloribus-aut-0hP5r', 'KQXG6JCZ', 'Iusto fugiat magnam iusto dolor sed laudantium in iusto fugiat aperiam.', 'Repellendus sunt id ea dolores porro debitis sit. Non facilis omnis eum harum. Facere explicabo id vel deserunt ab necessitatibus sint. Sapiente earum vero aut ut. Voluptatem magni et aut et expedita et.', '134.54', NULL, 23, 1, 1, NULL, NULL, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(9, 1, 'Omnis voluptates quia', 'omnis-voluptates-quia-JgXvk', 'MEVBC41V', 'Quia voluptatum similique corporis excepturi quae id eius.', 'Est error labore esse eveniet provident natus reprehenderit. Velit nisi vitae similique rem aut recusandae quo. In quam aut fuga saepe. Rerum voluptate fugiat eum animi ipsam possimus dolorum quaerat. Quas quis iusto non rerum.', '247.31', NULL, 1, 1, 0, NULL, NULL, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(10, 1, 'Et ut commodi', 'et-ut-commodi-ABGwW', 'IUHEQ7W3', 'Expedita modi et occaecati ratione laborum deserunt dolores eos consequuntur accusantium ad.', 'Voluptatem et quae quasi quis suscipit sunt itaque. Quas exercitationem sit quis magni. Vel maxime et qui esse qui perferendis voluptate quo. Quia laborum quae esse assumenda. Numquam quisquam cupiditate qui nobis.', '212.37', NULL, 45, 1, 1, NULL, NULL, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(11, 1, 'Molestias aut aut', 'molestias-aut-aut-ILYEl', 'URZHOA04', 'Cumque omnis accusamus incidunt laborum sequi sint sit sint non rerum.', 'Voluptas dicta dolores sed. Pariatur nam autem sint dolore inventore possimus dignissimos. Culpa possimus rerum error qui. Eligendi quis dolores magnam. Earum ut corporis deleniti non quasi. Explicabo deleniti atque possimus rem.', '79.55', NULL, 191, 1, 1, NULL, NULL, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(12, 1, 'Non provident provident', 'non-provident-provident-QsqJr', 'J1NREX94', 'Ut quisquam voluptatum iste deleniti non ut dolor facere ut modi qui impedit dignissimos fugiat.', 'Non fugiat et earum est porro sunt. Odio molestiae iure est consequatur. Qui omnis odit sint voluptas laborum et. Vero occaecati dolor omnis et officia. Sit ducimus ex dolor perferendis neque asperiores autem.', '40.43', NULL, 36, 1, 0, NULL, NULL, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(13, 2, 'Aperiam fuga earum', 'aperiam-fuga-earum-oeJKX', 'S5FQJ8IG', 'Aut commodi sapiente reiciendis eos illum quo eum quasi laboriosam omnis et nostrum.', 'Architecto enim eum quisquam itaque sit dolorem. Dolor excepturi et voluptatem rerum debitis. Dicta rerum eveniet vero rem minus.', '163.25', NULL, 0, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(14, 2, 'Qui dolorem excepturi', 'qui-dolorem-excepturi-2uGo1', 'ZYX1FESF', 'Harum qui et provident perspiciatis quia praesentium doloremque maiores voluptatibus ad officiis.', 'Est quas repudiandae in mollitia laboriosam. Beatae autem aspernatur quam fugit ut possimus earum. Quae non omnis eos consequatur architecto enim occaecati.', '153.49', '198.22', 96, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(15, 2, 'Ipsum voluptas quis', 'ipsum-voluptas-quis-bD2iN', 'YNPGBW4N', 'Esse quaerat aut voluptas totam quae consectetur magni corporis quisquam.', 'Aperiam ea ut sunt libero dolor dolorem et. Et consectetur blanditiis explicabo sed et sapiente. Et pariatur recusandae similique qui. Pariatur quis nam ab fuga. Itaque excepturi similique pariatur et reprehenderit repudiandae.', '213.16', NULL, 125, 1, 1, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(16, 2, 'Quis est consectetur', 'quis-est-consectetur-qoppL', '16RGQICU', 'Voluptatem reiciendis ratione ullam qui alias deleniti quisquam et officia illo distinctio voluptatem nobis deleniti.', 'Quisquam itaque nemo ut aut praesentium facere. Est sed exercitationem facilis laboriosam quam eveniet. Et praesentium ut voluptatem saepe accusantium et non. Aut voluptas nihil et. Ut quidem nostrum quasi et qui eum assumenda.', '47.92', '56.52', 42, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(17, 2, 'Quaerat sed et', 'quaerat-sed-et-cI28j', 'PRQ45LCF', 'Explicabo voluptatem ipsum est velit enim consequuntur est temporibus aperiam distinctio odit et eligendi harum.', 'Omnis et odio ut ut consequatur. Sint nam distinctio quos ducimus. Esse omnis quia qui. Sit nulla quasi omnis sint. Voluptas quia iure ea facilis quos maiores. Tenetur consequuntur eos et officia quidem numquam et et.', '217.34', '250.62', 30, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(18, 2, 'Omnis perferendis tempore', 'omnis-perferendis-tempore-5i3fY', 'VEHTCFSU', 'Totam voluptatum est rem dolorem et est dignissimos repellat voluptatem consequatur saepe architecto id rerum.', 'Exercitationem vero nihil adipisci quo laudantium suscipit ut. Doloribus rerum temporibus voluptatem excepturi reiciendis distinctio. Necessitatibus reiciendis veritatis voluptas officiis. Eos placeat deserunt perspiciatis omnis modi eius ut. Optio nesciunt harum et eos debitis dolorum est. Maiores velit quia asperiores consequatur tenetur laboriosam.', '220.89', NULL, 135, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(19, 2, 'Eum ea quam', 'eum-ea-quam-OyIiw', 'L1MCHNI2', 'Velit repudiandae ipsum soluta molestias ea quae consequatur distinctio consequuntur repudiandae fuga quis et assumenda fuga.', 'Nihil laudantium est ipsam architecto laborum aut. Sit magnam accusamus accusamus dolor reiciendis. Ea consequatur aliquam et rerum. Culpa qui et ipsa praesentium eaque assumenda molestiae.', '187.23', '206.48', 26, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(20, 2, 'Omnis minima voluptas', 'omnis-minima-voluptas-eYbGq', 'FIE0LAEU', 'Id voluptatem quae eos earum in corporis laboriosam inventore sequi ex ab explicabo maxime.', 'Vero quaerat fuga expedita corrupti. Velit amet vitae natus sequi nostrum quo. Reiciendis laboriosam vel illum illum aut dolorem. Corporis animi ad autem mollitia quidem et perspiciatis. Sapiente nostrum quis veritatis placeat et expedita. Rem qui sunt molestias minima expedita.', '102.71', '111.77', 67, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(21, 2, 'Quasi et in', 'quasi-et-in-QhOBQ', 'QZFRIWVK', 'Perferendis aliquid dolorem vel voluptas excepturi sapiente ratione aperiam expedita qui ex id eum.', 'Est veniam aut ea sequi harum voluptates consectetur. Cumque quod autem doloremque repellat adipisci quae. Quo non nesciunt illum veritatis tempore unde. Deserunt dolorem et soluta eos. Ea reprehenderit et provident temporibus illo. Exercitationem ut cumque qui nemo earum tempore itaque.', '112.72', '128.55', 46, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(22, 2, 'Voluptatem similique sed', 'voluptatem-similique-sed-GVCbx', 'TNG2OTWV', 'Est ut ut qui consequatur sunt a et et expedita labore dolor molestias unde corporis.', 'Error aut quibusdam quos ipsam doloribus qui. Omnis praesentium dolorem quo necessitatibus recusandae quia. Natus rerum quis aspernatur aut. Aut corrupti iure illum. Voluptatem voluptas et modi hic blanditiis dignissimos.', '212.94', NULL, 73, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(23, 2, 'Adipisci nihil enim', 'adipisci-nihil-enim-XXPws', 'G5ABG8MJ', 'Doloremque vel pariatur inventore vero ut nisi eos sed.', 'Aut culpa aut ducimus quia minus. Ut sequi sed odit et doloremque quaerat. Non aspernatur aut consequatur voluptas fugiat quaerat tempora. Sed aut debitis ex numquam et nobis asperiores in. Sed blanditiis molestias molestiae sit vel similique asperiores.', '82.80', '118.16', 85, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(24, 2, 'Mollitia ut sit', 'mollitia-ut-sit-mtmOj', 'PJQIS541', 'Assumenda reprehenderit alias qui dignissimos facilis dolores consectetur rerum ut.', 'Eligendi et atque aut aliquid et quaerat. Delectus voluptatem corporis libero adipisci aliquam. Veritatis exercitationem reprehenderit id iste. Libero modi expedita minima illo quia cupiditate.', '123.51', NULL, 100, 1, 1, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(25, 3, 'Sint nam eius', 'sint-nam-eius-tOSiY', '8KXTTXME', 'Et maxime esse nostrum atque quas pariatur culpa eos corrupti nulla ut accusamus sed ad.', 'Possimus ea dolorem reiciendis et. Quos est autem officia necessitatibus exercitationem quis saepe. Porro assumenda earum est nobis. Numquam possimus voluptatem ea quod assumenda maiores.', '261.70', NULL, 119, 1, 1, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(26, 3, 'Aut sint in', 'aut-sint-in-dMNrv', 'VEBVXFSI', 'Minus amet qui omnis et amet laudantium nihil voluptate eos sed distinctio aperiam perspiciatis quo praesentium ad.', 'Officiis quis eveniet dolores consequatur accusamus. Numquam officia tempore rem magnam. Provident et beatae possimus ipsam ab praesentium dignissimos. Voluptatem hic magni sint aperiam quibusdam. Veritatis placeat quam rerum id. Quasi consequatur perspiciatis voluptas totam laudantium tenetur earum.', '104.94', NULL, 155, 1, 1, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(27, 3, 'Soluta distinctio ratione', 'soluta-distinctio-ratione-qWt8o', 'MJ9O6SKD', 'Blanditiis ipsa quia et velit voluptatem in sit sunt libero cupiditate voluptatem dolore.', 'Voluptatem aspernatur mollitia consequuntur architecto exercitationem est. Dolores soluta et vel. Voluptate ab quisquam quod itaque. Veniam rem quisquam magni ducimus voluptas consequatur ea quasi. Odio ratione dolores suscipit ad neque.', '286.85', '318.20', 77, 1, 1, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(28, 3, 'Sed ducimus quibusdam', 'sed-ducimus-quibusdam-KFEpq', '0JBIDRY2', 'Voluptates veniam et dolore provident illum voluptatum qui nesciunt et fugiat.', 'Ut repellat illo eos quisquam architecto. Molestiae nulla nobis occaecati natus facilis voluptas. Exercitationem a ea velit quibusdam laudantium accusamus ad.', '196.31', '232.73', 21, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(29, 3, 'Necessitatibus ducimus molestiae', 'necessitatibus-ducimus-molestiae-ZSENO', 'RBOHYK8E', 'Quibusdam ut autem fugit distinctio dolorum impedit occaecati aspernatur quam similique.', 'Est non architecto perferendis nesciunt. Nihil ut non consequatur nemo aliquam dolorem. Corrupti et quas sit id quae.', '52.29', '64.78', 135, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(30, 3, 'Provident magnam veritatis', 'provident-magnam-veritatis-u3Aux', 'W5TNL2TP', 'Libero aut a facere repellendus impedit maxime reiciendis quis temporibus porro dolores eligendi magnam et qui ut.', 'Et sapiente unde consequatur sint provident. Ut nulla velit expedita architecto. Dolorem dicta laudantium aut quis quod quia. Velit et exercitationem vel a excepturi quidem. Reprehenderit error quasi illum culpa et eius.', '294.19', '331.16', 6, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(31, 3, 'Quos sint et', 'quos-sint-et-5HURQ', 'DWR5NQKD', 'Illum vero perferendis quos similique repellendus rem et accusantium aspernatur est ut sint.', 'Beatae quibusdam culpa dolorem atque. Ratione nihil ut eveniet accusantium dolor dolor. Et omnis cumque dolores et molestias perferendis. Voluptate assumenda eligendi ut esse minima eius quasi. Excepturi repellat eos id pariatur.', '95.51', NULL, 103, 1, 1, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(32, 3, 'Assumenda enim delectus', 'assumenda-enim-delectus-nFJtI', '7IORT8KB', 'Nam et nihil quaerat neque sunt aut at odio omnis quasi culpa quo commodi omnis quisquam.', 'Itaque asperiores voluptas nisi tempora repudiandae ex omnis. Occaecati beatae et ducimus quia. Sed sapiente velit aliquam ducimus illum unde autem. Amet eveniet accusamus qui incidunt laudantium quia odit.', '62.48', NULL, 17, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(33, 3, 'Consectetur est consequuntur', 'consectetur-est-consequuntur-xUNC7', 'FENF6J3S', 'Aut sint et ab omnis repudiandae cum aliquam.', 'Rem commodi iste velit numquam. Assumenda molestiae dolores hic necessitatibus voluptates ut minima. Corporis tempore ipsum nesciunt consequuntur dolorem. Odio blanditiis rerum qui.', '194.00', NULL, 87, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(34, 3, 'Dolores vero aut', 'dolores-vero-aut-egjUB', 'GJ6RCSBK', 'Voluptates ipsa qui nobis eligendi excepturi temporibus quam corporis est corporis non.', 'Vitae quos blanditiis est dicta architecto ut laudantium. Neque dignissimos ducimus nisi placeat quo nesciunt esse et. Laboriosam esse sit minus maiores. Harum a voluptatem aliquam suscipit inventore tempore porro. In minus libero autem omnis iste repellendus et. Corporis reiciendis numquam ipsa dignissimos.', '261.69', NULL, 108, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(35, 3, 'Earum qui ad', 'earum-qui-ad-PWRue', 'CLB30CGU', 'Aut reprehenderit autem dolores odit ullam quisquam nemo repellendus saepe cumque.', 'Corporis cupiditate odio quia non itaque. Quasi ipsum omnis natus aut. Enim nobis ut laborum et aut eaque repellat. Aut dolorem dolore ut nihil a deserunt itaque.', '165.58', NULL, 102, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(36, 3, 'Iusto illo dolore', 'iusto-illo-dolore-4GgSN', 'RF0D6KA5', 'Dolorem omnis deserunt veniam eaque quia provident enim deserunt odit.', 'Quibusdam ipsam et ex doloremque consequuntur quae fugiat. Qui omnis error et et. Eius eos distinctio hic vero. Ea optio culpa aut sed eum. Ratione voluptatibus deserunt maiores ipsam eos praesentium dolore doloremque.', '276.50', NULL, 24, 1, 1, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(37, 4, 'Tenetur dignissimos officiis', 'tenetur-dignissimos-officiis-hohLH', 'UTSEUIOO', 'Consequatur et consequatur qui delectus libero officiis odit ut distinctio molestiae ea autem eum voluptas neque.', 'Occaecati laborum et molestias. Officiis incidunt tenetur id error. Cupiditate est quam vero sapiente eligendi.', '143.06', '176.27', 75, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(38, 4, 'Rerum neque ut', 'rerum-neque-ut-w7ohD', 'HO16QPUP', 'Nemo voluptatum aut repellat voluptatem quibusdam consequatur eaque consequuntur ipsa voluptatem ut debitis et earum placeat.', 'Dolor dignissimos nemo id nobis eaque. Et architecto sunt facere et. Et autem esse asperiores nihil omnis id. Quae sunt et dolor quasi ex quae amet. Ut quos natus soluta animi.', '77.98', NULL, 162, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(39, 4, 'Qui et sit', 'qui-et-sit-2yxpw', 'GUFW1V6M', 'Itaque vero aut et enim fugit alias vero.', 'Id fugiat provident unde dolores possimus eaque. Consequatur error laboriosam minima. Fugit omnis molestiae et quas sequi. Excepturi est et magnam occaecati dolor ullam et. Debitis deleniti exercitationem et minima.', '269.48', '301.01', 155, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(40, 4, 'Rerum labore id', 'rerum-labore-id-mqRbY', '9MCJDHCP', 'Impedit architecto laudantium laudantium quam unde facere commodi ratione magni distinctio voluptates quasi numquam et.', 'Rem qui cum ut iusto. Quas ut nihil optio libero velit. Ea ut aliquid unde vel natus quidem provident. Perferendis cum aut totam aut doloribus eum vero. Natus quae nam consequatur dolorum velit veritatis qui. Commodi excepturi natus enim iusto quam ut maiores consequatur.', '177.20', NULL, 37, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(41, 4, 'Sint molestiae voluptatem', 'sint-molestiae-voluptatem-XoNXw', 'RLTISTPX', 'Veritatis ullam modi perspiciatis reiciendis veniam vero laboriosam et et voluptatem quos qui eos.', 'Consectetur et velit provident ipsa. Sed necessitatibus reprehenderit omnis non enim quasi omnis ut. Expedita laudantium rerum commodi qui ut. Aut omnis porro non nostrum a.', '297.44', NULL, 120, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(42, 4, 'Quam repellat illum', 'quam-repellat-illum-3ApxU', 'WGI5VHHL', 'Est id quaerat qui ducimus non rerum sed sint veritatis rerum quia non iure est quasi.', 'Rerum officia aut maiores harum et deserunt est voluptate. Eligendi nisi esse laborum voluptas. Quidem non vel error labore voluptatem exercitationem. Molestiae ipsum minus commodi similique. Veritatis at aut optio voluptas aperiam enim.', '115.16', NULL, 193, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(43, 4, 'Sapiente delectus quia', 'sapiente-delectus-quia-3rpZY', 'PQYAJ1OT', 'Praesentium eum eos tempora officia et modi fugit repellat quaerat consequatur.', 'Ut accusamus veniam numquam sit quasi alias. Doloremque numquam sed et est sit. Nobis dolorum soluta repellat et. Earum debitis sit aut libero labore. Itaque sint rerum est amet consequatur. Sed molestias impedit odio.', '246.47', NULL, 176, 0, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(44, 4, 'Occaecati impedit corrupti', 'occaecati-impedit-corrupti-QcNGA', '4QUJVJQB', 'Ut exercitationem accusantium exercitationem nostrum quasi aperiam qui voluptate est officia quia maiores quo laboriosam sapiente.', 'Ab assumenda aut et rerum harum incidunt. Et voluptate amet quisquam ipsa. Enim doloremque est fugiat aut assumenda eligendi. Veritatis voluptatem quo quasi consequatur.', '144.17', '156.03', 37, 0, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(45, 4, 'Nam sint ut', 'nam-sint-ut-mx8ui', 'APERXEBK', 'Quia vel iste modi quis reprehenderit deserunt et quam rerum numquam sapiente laborum laborum commodi quisquam.', 'Ut nesciunt asperiores debitis et consequatur. Corrupti similique dolorem placeat illo. Voluptatem vel sit placeat fugit id quisquam fugiat tenetur.', '168.54', NULL, 36, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(46, 4, 'Non laborum et', 'non-laborum-et-c0K6o', 'UNWKTU4I', 'Sequi dolores reiciendis aliquid adipisci reprehenderit quis soluta et illum voluptatem hic necessitatibus.', 'Occaecati et qui molestiae ea. Aut repudiandae aspernatur vel fugiat tempore esse. Cupiditate quisquam qui animi rem deserunt amet nihil. Consequuntur fugit voluptatem rerum suscipit aut ipsam. Praesentium voluptatem qui sit vitae.', '130.55', NULL, 144, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(47, 4, 'Quidem ut cupiditate', 'quidem-ut-cupiditate-zDwwN', '5SJJUBHF', 'Occaecati ipsa numquam aliquid aliquam ut excepturi consequatur voluptate qui soluta et iure voluptas eligendi dolorum.', 'Harum aut tenetur quo delectus quis. Ut voluptatum illum omnis. Sed voluptatibus magni quia et doloribus rerum dolorum. Laudantium est occaecati quibusdam ex dolores vitae. Voluptate natus animi similique sed.', '196.85', '245.32', 150, 1, 1, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(48, 4, 'Et enim et', 'et-enim-et-ORhrh', 'KVD5Z5WO', 'Quidem suscipit iure ut magni aut consequuntur non qui laudantium nihil pariatur repellat.', 'Ipsum maiores quia cupiditate adipisci unde. Repellendus tempore dolor aliquam non minus sit dignissimos voluptatem. Est quo voluptatibus dignissimos perferendis qui. Quia sunt perferendis rem dolores. Et qui eos animi.', '203.58', NULL, 72, 1, 1, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(49, 5, 'At necessitatibus similique', 'at-necessitatibus-similique-ZRFJE', 'LQH7HOII', 'Et sit ab voluptas fugit consectetur ad quo atque nihil esse.', 'Omnis et totam dolores autem repellendus unde sint similique. Sed eos quia maxime expedita. Sint quaerat non facilis. Et eveniet ullam animi voluptatem architecto qui sint. Quae quam aut qui rerum explicabo eligendi odio consequatur. Non vel maiores accusantium sit et sapiente est.', '129.95', NULL, 24, 0, 1, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(50, 5, 'Velit hic modi', 'velit-hic-modi-kOQgr', 'KURUNRSR', 'Quos cumque saepe est nesciunt mollitia nulla in itaque et illum aut velit.', 'Expedita quam est repellat iste vero non magni. Error hic architecto quia sit. Quo molestias atque voluptate provident est voluptatem. Ut molestiae amet est.', '202.54', NULL, 46, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(51, 5, 'Numquam beatae maxime', 'numquam-beatae-maxime-xMg0I', 'DYYJ36UA', 'Consequatur minus natus molestiae dignissimos rem laborum ut officia sed.', 'Voluptatem dolor facilis possimus praesentium magni alias natus architecto. Et ipsum sit voluptates est sint vel delectus impedit. Cum aliquam incidunt atque iste quisquam earum. Officia fugit saepe voluptatem vel error occaecati.', '255.63', NULL, 31, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(52, 5, 'Repellat enim alias', 'repellat-enim-alias-YrUhC', 'ETQOYO5K', 'Officia qui tenetur quasi consectetur non sapiente aut dolor.', 'Delectus molestiae velit vero consectetur ipsum consequuntur eos. Maiores alias rerum iste magnam. Et quia officiis molestiae quas. Autem mollitia ut vel perspiciatis ex incidunt placeat voluptatem.', '217.41', NULL, 3, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(53, 5, 'Nihil et explicabo', 'nihil-et-explicabo-L04OZ', 'FOXJROCG', 'Qui aut ut excepturi reiciendis et dignissimos nihil voluptatem iusto atque sint possimus earum.', 'Iusto voluptatem tempore repellat qui et mollitia neque. Ea doloremque beatae dolor vero. Quia veritatis nihil quia qui est nesciunt. Voluptatem consequatur vel ducimus voluptatem eos optio esse. Soluta dicta similique veniam dolor velit est.', '84.40', NULL, 40, 1, 0, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(54, 5, 'Aut itaque aut', 'aut-itaque-aut-vNb1J', '4GJR1WDY', 'Velit nam cum dolorem iure et ut nisi quia.', 'Consequatur modi non qui magni. Praesentium totam quis dolorem rerum dolores et. Dignissimos ut voluptate excepturi necessitatibus eaque ut hic laborum. Voluptatum ullam magni tempora sunt rerum amet. Adipisci error in sequi est incidunt.', '185.04', '193.95', 176, 1, 1, NULL, NULL, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(55, 5, 'Dolorem qui id', 'dolorem-qui-id-M23eX', 'FHP37G9L', 'Fugiat architecto totam minus laborum debitis ut provident rerum quia sit sint sed.', 'Officia omnis eveniet laudantium rem quam. Voluptas aspernatur quia repudiandae animi delectus consequatur. Eligendi dolores inventore accusantium harum. Esse error impedit consequatur dolorem et et.', '190.42', NULL, 54, 1, 1, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(56, 5, 'Iste vel dolor', 'iste-vel-dolor-2bSet', 'HISY3IN6', 'Reiciendis nam ut nemo dolore dolor vero numquam ut consectetur est sed aut adipisci est perferendis animi.', 'Dicta sint hic ut distinctio eveniet dolor. Quam in illum quibusdam ut. Assumenda tempore illo commodi et. Soluta aliquid maiores aut modi id sit maxime.', '54.95', NULL, 123, 1, 0, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(57, 5, 'Magni tempora ad', 'magni-tempora-ad-yx7Lx', 'PZOCEV8Z', 'Rem et est illo molestiae dolores quis est.', 'Saepe vero eos nostrum dolores et eum ut. Asperiores et qui esse ipsum tempora omnis. Accusantium voluptas ad voluptatum voluptate. Est repudiandae eum omnis repellat deleniti similique molestiae. Minima eum aut fuga quas harum corrupti amet. Non cum vitae debitis culpa ut.', '15.96', NULL, 55, 1, 0, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(58, 5, 'Nisi commodi ab', 'nisi-commodi-ab-vb5a9', 'DJ9COCC4', 'Dolores numquam consequatur et aperiam illo minima et officia ut quas facilis.', 'Perspiciatis aut illum et enim ex veritatis. Assumenda error adipisci iste. Officia quos eveniet sed provident ab sed optio.', '181.12', NULL, 175, 1, 0, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(59, 5, 'Et eaque itaque', 'et-eaque-itaque-DyNqY', 'JX9VSQVU', 'Iure ipsum id sed ex perspiciatis ut omnis cupiditate.', 'Quisquam aut dolores vel qui. Beatae quod quod mollitia repellat qui consequatur dolorem. Molestiae vel est totam et eum ad voluptatum. Repellat molestias nobis minima et.', '266.79', NULL, 91, 0, 0, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(60, 5, 'Veniam voluptatem dolores', 'veniam-voluptatem-dolores-NiUKG', '13KNNPGD', 'Iste saepe aut consequatur commodi incidunt quas voluptatum praesentium sequi vel rerum velit hic ut eligendi.', 'Sed odio ad inventore adipisci quibusdam quidem. Est omnis quibusdam corporis optio. Temporibus et illo a aliquid praesentium optio. Maiores quibusdam ut consequatur quae eius impedit.', '282.59', '287.80', 6, 0, 1, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(61, 6, 'Omnis dolores laboriosam', 'omnis-dolores-laboriosam-DG31G', 'GHQBN1PH', 'Itaque quidem numquam nulla dolores similique occaecati vitae molestiae fugit et deleniti ea.', 'Eius laudantium iure eum perspiciatis eveniet labore. Consequatur hic incidunt eos quo aliquid rerum voluptas. Quos ut sit inventore delectus quae pariatur voluptatem. Adipisci autem suscipit omnis rerum perspiciatis magni. Perspiciatis neque impedit aut officiis excepturi quisquam. Sunt fugit pariatur sunt est aut sint nulla.', '22.77', NULL, 165, 1, 0, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(62, 6, 'Nobis id enim', 'nobis-id-enim-65Hte', 'WHS0OX3V', 'Natus commodi error laboriosam aut in veniam earum alias nobis aperiam ratione praesentium placeat nihil.', 'Pariatur at tempore doloribus architecto. Consectetur sint id harum sed quibusdam accusantium. Voluptatem ut facilis unde. Et voluptatem quia fugiat et incidunt. Vel sed explicabo et praesentium et in nihil.', '33.10', '40.98', 78, 1, 0, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(63, 6, 'Illum placeat iste', 'illum-placeat-iste-m9J4x', 'JFHW5QRP', 'Minima sunt nam placeat est quis nisi consequatur dolor id aut.', 'Harum itaque vero qui. Qui omnis sint nulla voluptatem placeat aut voluptas. Qui eos dolores et natus. Cum sapiente voluptatem necessitatibus inventore molestias asperiores. Nobis ipsum aut dolorum illo est aliquam recusandae.', '13.34', NULL, 200, 1, 1, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(64, 6, 'Blanditiis eum labore', 'blanditiis-eum-labore-nH2Gc', 'BE61QCAG', 'Laboriosam consequatur error maxime nihil hic dolorem corrupti delectus praesentium sint qui id.', 'Quia blanditiis quibusdam in temporibus omnis officiis. Et expedita provident ab eum deleniti mollitia. Vero quo dolor voluptates esse dolor odio eos. Voluptatum illum doloribus ut et et.', '112.07', '126.41', 106, 1, 1, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(65, 6, 'Nostrum vel consectetur', 'nostrum-vel-consectetur-0nBRy', '1A1UHP8J', 'Impedit rerum nostrum sint et voluptatem ad quos quia.', 'Voluptatem et voluptatem sint. Cum omnis tempore omnis corporis inventore qui. Iste ea esse qui veritatis explicabo tempora quaerat. Beatae quo voluptas commodi beatae. Rem consectetur temporibus laudantium quam tenetur. Aut nesciunt aut incidunt.', '233.35', NULL, 115, 0, 0, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(66, 6, 'Totam quis esse', 'totam-quis-esse-L7ikv', 'K9NTYNHL', 'Dolorum sed ipsam maxime fugiat exercitationem distinctio facere dicta corporis.', 'Est qui illo deserunt nisi non quibusdam similique. Temporibus totam perferendis cupiditate et sapiente optio. Fugiat officia esse iure voluptate autem assumenda quos. Vel alias accusamus et voluptatum excepturi voluptas neque. Aliquam id voluptate ipsam consectetur autem. Harum doloremque consequuntur distinctio.', '161.94', '163.00', 140, 1, 1, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(67, 6, 'Eaque et ut', 'eaque-et-ut-5pVfA', 'RLGR1L9B', 'Magni et amet harum consequatur omnis dignissimos laboriosam fugit nostrum necessitatibus.', 'Voluptatem velit nam voluptatibus ullam doloribus. Explicabo et dolores at sed totam non sed. In quos aspernatur dicta. Temporibus praesentium sequi quo ipsum dolore. Quisquam quae ab vero excepturi. Sint fugiat nihil id similique.', '297.93', NULL, 112, 1, 0, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(68, 6, 'Molestias tempora officia', 'molestias-tempora-officia-cbtji', 'XJUW8QVB', 'Et id aliquid ut dicta consectetur perferendis quos reiciendis.', 'Temporibus aut consequatur veritatis sit. Odio quia tenetur exercitationem ea eligendi maiores nobis. Quaerat quam esse nam. Qui non veritatis sint minima incidunt. Amet consequuntur hic et laborum dolorum. Non non possimus cupiditate cum quidem laboriosam et excepturi.', '200.68', NULL, 181, 1, 0, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(69, 6, 'Quaerat odit laudantium', 'quaerat-odit-laudantium-PMRRa', 'RIQNKLVD', 'Blanditiis natus id temporibus nemo exercitationem sapiente impedit molestiae quidem.', 'Sequi hic voluptates consequatur sed. Odio voluptas officiis perferendis qui ab vel. Fuga commodi in inventore fugit. Deleniti aliquam facere sunt cum. Dolorem provident doloremque repellat libero. Velit aperiam sequi amet consequuntur qui.', '197.00', '221.45', 82, 1, 0, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(70, 6, 'Aut officia vel', 'aut-officia-vel-l7yYg', 'KQ47RDNS', 'Dicta sunt rerum laboriosam vel reprehenderit vitae omnis et nihil et qui.', 'Enim beatae sit dolor et id similique ut assumenda. Odit ipsa ullam nisi ut. Earum accusamus corrupti sequi sint et consequatur.', '64.97', NULL, 76, 1, 1, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(71, 6, 'Et ea aliquid', 'et-ea-aliquid-QTVAA', 'ZCNRL44N', 'Quibusdam consequatur voluptate molestiae est ratione nisi enim officiis enim.', 'Aut odit natus et tenetur culpa aut facilis. Aut ducimus officia autem quae quod. Eius unde praesentium reiciendis et ipsa ad. Numquam iste dolore fugiat blanditiis. Quibusdam quibusdam ullam facere eaque.', '99.01', NULL, 151, 1, 0, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(72, 6, 'Voluptates sapiente et', 'voluptates-sapiente-et-S5Ish', 'VMAEEBVJ', 'Nemo magnam omnis in rem voluptatem itaque omnis rerum atque deleniti ratione culpa dolor est sed quidem.', 'Ipsam ut aut non quo rem. Sequi saepe nihil repudiandae aut ut. Maiores quidem aut aspernatur aut est incidunt sequi. Accusamus est blanditiis fuga rerum voluptatum. Voluptatibus facilis veritatis aut non omnis adipisci. Officiis excepturi et beatae ullam.', '161.47', '179.45', 33, 0, 1, NULL, NULL, '2025-11-07 13:50:50', '2025-11-07 13:50:50');

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
(1, 1, 'products/dca89ba3-ffa1-49dc-bb93-54963d0065df.jpg', 1, 1, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(2, 1, 'products/da265949-9742-4d09-8766-bedf8df2b197.jpg', 1, 0, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(3, 1, 'products/f7b0199b-f2ee-4e4c-b613-1026439e24a2.jpg', 2, 0, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(4, 2, 'products/ee486d5e-dab3-4ac7-9871-c452736ff7b6.jpg', 1, 1, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(5, 2, 'products/a9c1e832-a44b-4c58-961c-f95e6cb75e27.jpg', 1, 0, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(6, 2, 'products/fbf4b620-7c01-42f7-8169-f2dae60f10e5.jpg', 2, 0, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(7, 3, 'products/3a3c92d6-02c6-4cb8-a138-cebf3b49f3a4.jpg', 1, 1, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(8, 3, 'products/d01637a3-1b5b-4d9f-8d85-27bd2742cf6f.jpg', 1, 0, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(9, 3, 'products/b3d2412f-23e4-4a57-9ad1-8a925c44c5a9.jpg', 2, 0, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(10, 4, 'products/efb873de-313f-41e5-8159-6db59777ca05.jpg', 1, 1, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(11, 4, 'products/b2ab17bd-a6f4-4e06-b376-975bf9123628.jpg', 1, 0, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(12, 4, 'products/e16da874-daef-46d0-a00b-0e3c9963c81e.jpg', 2, 0, '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(13, 5, 'products/76d52d58-3288-46fb-8262-13d4bdd0e0d7.jpg', 1, 1, '2025-11-07 13:50:48', '2025-11-07 13:50:49'),
(14, 5, 'products/bdefe285-b9d4-4041-b397-11c79ca85e07.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(15, 5, 'products/fd73dc52-1c39-4237-868b-c7fdd410aba5.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(16, 6, 'products/6675662f-b7c2-47bc-8b1b-756f9ac99835.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(17, 6, 'products/1dbadd36-c4f0-4b4e-b089-22aa290038f1.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(18, 6, 'products/3cf3a7de-ce22-41dd-932c-b4f12f66c0b0.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(19, 7, 'products/1d9fd367-fc28-4357-9cbd-a64fc8ce5dde.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(20, 7, 'products/68193e3e-e476-4269-aae6-1fc5881a1bb0.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(21, 7, 'products/19cc1055-4412-4605-a681-7019d153ca91.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(22, 8, 'products/975c02ca-23cb-4e97-b517-ce73e41901b4.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(23, 8, 'products/e17a3f52-757e-4d7c-ade3-388921cd71bc.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(24, 8, 'products/df403738-0a81-4f47-a8b1-dcf0c8b20528.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(25, 9, 'products/a01419b8-f0f2-40dd-9f0b-d8d2c11da2eb.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(26, 9, 'products/7b9f3b51-9d21-4149-af2c-eb1fc162c24a.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(27, 9, 'products/b74accf4-1ef0-4b59-833d-661169b88a51.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(28, 10, 'products/2f02ccaa-b038-47b1-80e4-1252ab879e9a.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(29, 10, 'products/51c2a5d8-10c9-4326-9deb-22ed4cdf1ede.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(30, 10, 'products/e39686a4-7ec1-4201-a56c-738d948adfae.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(31, 11, 'products/9498fddf-cd9d-48d2-b9ad-710b346393fd.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(32, 11, 'products/9069aedf-246b-4bb9-bf02-57730d8a3a95.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(33, 11, 'products/4f007cd8-ff51-4cab-a2fb-1eb13661055b.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(34, 12, 'products/2109261e-d518-40e9-9b53-82787514aea6.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(35, 12, 'products/b316cb5d-3786-42ae-b23b-d91db48cd327.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(36, 12, 'products/d88e11e8-7e4f-4dd6-bfa0-e7e4ecf9f746.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(37, 13, 'products/59774b20-eefb-4826-8507-742dd1f0b6ee.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(38, 13, 'products/a37173a1-08f7-4942-91a8-8481ec747890.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(39, 13, 'products/ac8817ce-be2d-4552-ac23-1102c8320d0c.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(40, 14, 'products/5a580602-190c-4cbc-aa91-49b728254258.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(41, 14, 'products/1035d714-5f52-4c99-83fe-11f735cea335.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(42, 14, 'products/39a9038e-263a-44e7-9bb1-c0bfcc7902f3.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(43, 15, 'products/6364ae3c-c460-42a8-9d15-d73717a0f49c.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(44, 15, 'products/1c29d1a4-3669-4a7f-a972-da8a5ba17bcc.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(45, 15, 'products/b7592e37-d9ce-4a3b-82af-63be45ae43f4.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(46, 16, 'products/b6563b25-2dae-415c-96b4-3dfefffe2468.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(47, 16, 'products/c6d8906b-9e51-469e-bf4f-e35761dd7457.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(48, 16, 'products/166abd52-e5a6-4ce4-b400-deb3c9007f18.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(49, 17, 'products/761275f7-6ea4-42de-aa8c-39e18bc6edf3.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(50, 17, 'products/629ae35d-c1fd-489e-bd14-8dbfd937e2bb.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(51, 17, 'products/a4129b11-95b2-4c2d-859d-14d8b7d8cbb5.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(52, 18, 'products/faea0180-d63a-413f-babe-3bd803ff43aa.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(53, 18, 'products/fe41f640-a549-4d7c-9622-a8474710fcca.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(54, 18, 'products/e28c8b9d-a887-440d-80ee-ebfdc236d026.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(55, 19, 'products/29373ebc-c108-4f6f-8ced-5d62e824bfc2.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(56, 19, 'products/ff82f18f-95a6-47c5-80ba-15845e2bfcd6.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(57, 19, 'products/cf6edbdb-aba9-4199-a8a9-800a7c27dcd9.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(58, 20, 'products/a2f8d13b-2cd3-4c7d-8876-8e6094f06c32.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(59, 20, 'products/fd6d7b7d-d355-48db-8f12-e5650707e6af.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(60, 20, 'products/1068cd85-c0b1-4ff3-904b-ffda5788cc0c.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(61, 21, 'products/12c3adf6-7162-4dbb-90b0-8d114776f6bf.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(62, 21, 'products/3e7191d4-efa6-4d78-9256-f2afc02f3400.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(63, 21, 'products/fe36a2fd-235d-49ac-9786-3040cb9a9579.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(64, 22, 'products/23e64cff-400a-4818-9d53-adc7424c92ef.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(65, 22, 'products/aa86080b-b8fd-4a7f-bd06-e4588c8621c3.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(66, 22, 'products/ad214df5-83ae-467f-8e11-2880f6c4171b.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(67, 23, 'products/42155b3a-5194-408d-9552-f4a2f0b32dd0.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(68, 23, 'products/b579e801-7ec3-4666-b537-7c2ced507cfa.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(69, 23, 'products/e3357930-b281-4d6d-9b10-0bc773c18b80.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(70, 24, 'products/82b1e72e-c3d3-4531-9ecc-82ae8f6f5c2e.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(71, 24, 'products/060f7735-db5c-4bf8-aa10-3f6f960a4789.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(72, 24, 'products/d21c074b-9fb4-4f8a-98e4-0e754c5f0a42.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(73, 25, 'products/086aace1-28a4-490e-a71b-ec5adf9e2016.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(74, 25, 'products/05c66633-23b1-4539-9bef-abc6ddb815e4.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(75, 25, 'products/0114a641-19f7-4a8f-8b1b-d4802db8e999.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(76, 26, 'products/8f019c42-1b35-401c-84d5-180592b0286a.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(77, 26, 'products/d820e7a1-8c06-4415-a039-286e28a18a83.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(78, 26, 'products/8c809834-6632-4e01-8f8a-62e11d5521be.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(79, 27, 'products/2cce05c9-2eef-4df4-87de-b26395cc3fb0.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(80, 27, 'products/aecdb6a4-676f-43a4-ba98-197b62458146.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(81, 27, 'products/ff4ac6fc-7037-45b2-a244-245ee6354dfd.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(82, 28, 'products/7255dc5b-3748-426f-8a7a-ed43634b3f18.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(83, 28, 'products/35c1c4f6-5be5-4f5e-ba8c-4ec22cf0eeb4.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(84, 28, 'products/1026aa9c-3887-4b42-b630-12bda8fe8665.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(85, 29, 'products/193393e4-218b-4466-b6c9-d690eccbf4ff.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(86, 29, 'products/642f2622-a59f-41d7-97dd-20e515791d60.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(87, 29, 'products/e42a358c-27ca-42b4-8ad3-e8649d9242fe.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(88, 30, 'products/6144f10f-7ffb-4c54-b48a-51cb8e96e35b.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(89, 30, 'products/0bf13187-7b9e-402e-b366-0e27e5e08daf.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(90, 30, 'products/75fb10ac-d4b7-45aa-9b2b-13d7bb96564b.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(91, 31, 'products/2aa8b506-8d56-4887-aed1-fe17ae38c0ac.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(92, 31, 'products/79118240-d3c0-41f4-bbff-6eb586c5fe79.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(93, 31, 'products/bb51f3c6-bf96-48ba-b0f9-3024936e841f.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(94, 32, 'products/c68ecb4e-de72-4000-9ffd-b86c8089ef73.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(95, 32, 'products/c620aa54-4e32-47c1-bac8-8515bb7d8c7c.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(96, 32, 'products/5b4fc2a4-68fe-4cb3-8eab-90bedd88cf9e.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(97, 33, 'products/ddad3a35-d110-44fb-ad48-f66981bb130b.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(98, 33, 'products/8daa1919-1b77-4e34-9c79-6b9c3c9adccc.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(99, 33, 'products/6c719c41-2b58-46d0-8f65-468c4cf8ca95.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(100, 34, 'products/c855fb9f-f93b-4fd5-90f8-38f59b8ea2e5.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(101, 34, 'products/f832f0f4-eba8-44a9-9177-06b3dc84bcde.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(102, 34, 'products/267fde26-f575-4e3e-a901-e09d5deca154.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(103, 35, 'products/1231c94e-8367-4f4e-aae4-41db73e0c210.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(104, 35, 'products/9e4edf2d-125a-4d73-8076-8aaf09cd00d7.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(105, 35, 'products/5325789d-c574-4e3f-aa49-4708a0e781de.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(106, 36, 'products/4e4690de-f984-4169-b6aa-8b7167b39a3e.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(107, 36, 'products/ddf18f87-f717-4e40-9253-f0a2b13e013c.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(108, 36, 'products/009d35e8-6622-4f74-82c5-6380a1e7b12c.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(109, 37, 'products/624abaff-c10e-410d-aed4-5315a4fb5826.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(110, 37, 'products/d0f989b9-89e7-427b-9d4c-ba86eb5897fc.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(111, 37, 'products/4d83bc9e-0ff5-4339-a41b-e212de8f4ac5.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(112, 38, 'products/2916dec9-ce9f-4721-b29e-407879ba17d5.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(113, 38, 'products/aa89407c-bece-4868-b310-606844bb7fd1.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(114, 38, 'products/9a3b888a-e66c-4091-86dc-99ea71a64b13.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(115, 39, 'products/13d544e0-9739-4029-b6b6-4e2ad0cb608e.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(116, 39, 'products/83d68e5d-0a70-47da-804a-2ac3a588c59e.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(117, 39, 'products/93b87a2f-6ce8-42d9-a8a1-a00a498316e2.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(118, 40, 'products/16516d29-e014-4098-8808-15a490aa6819.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(119, 40, 'products/3178901d-d537-4a8c-8126-9b23bd421f19.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(120, 40, 'products/bafea027-3bd8-4387-bc21-ba68f4eac28a.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(121, 41, 'products/b3e864e9-06e2-4dc1-81f8-54ed6a466574.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(122, 41, 'products/e8daf20b-a811-4125-9212-296b9a5cd8c4.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(123, 41, 'products/abcda645-ab13-48b5-8087-9995690e99c7.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(124, 42, 'products/f5b885bc-ed3a-492d-aa20-fa8eeeaf1c60.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(125, 42, 'products/e29d8b82-aa14-4104-8752-bca0720d922e.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(126, 42, 'products/79cb63c6-d618-497c-a153-6d755d80f822.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(127, 43, 'products/150bd005-63c4-400f-95be-64260b27fe19.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(128, 43, 'products/8c2b6ee0-423a-4103-962c-c13608f72509.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(129, 43, 'products/48ac146a-fba0-4f06-95d9-0b4f8b715d03.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(130, 44, 'products/ca03db8d-6192-4574-91f4-571bbf88dcdb.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(131, 44, 'products/92387ea6-5860-4aec-b638-02b7a88b46f2.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(132, 44, 'products/1e4050e3-b750-4b4d-9c04-5192bd6f198f.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(133, 45, 'products/8fa206a8-8602-4f9d-9fbd-02631ddc6534.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(134, 45, 'products/75265c93-cb32-4a51-97ac-66067137d4a4.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(135, 45, 'products/bfe3fe2d-6df0-4309-8fa3-f2ffce80004a.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(136, 46, 'products/e93a117f-a9a5-4f6d-9aac-536f044484d4.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(137, 46, 'products/f8fc0714-3dc3-4d52-b39c-14713cd9f409.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(138, 46, 'products/80d32e44-0967-412b-86bf-2239710f728a.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(139, 47, 'products/bde6d192-48c7-46d3-8a7e-1126359c4116.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(140, 47, 'products/2f535b57-382a-459b-8185-de54afb2488c.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(141, 47, 'products/c1d023e0-2b51-4c46-98dd-e2b0daa9634f.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(142, 48, 'products/5444fe7d-fc2d-478f-abf9-1c9db31741d0.jpg', 1, 1, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(143, 48, 'products/44d26cca-27e5-40de-87ad-c6a0000d90a8.jpg', 1, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(144, 48, 'products/d8974766-cb23-4f09-9ac3-cfda3e70f0a3.jpg', 2, 0, '2025-11-07 13:50:49', '2025-11-07 13:50:49'),
(145, 49, 'products/76028f97-f8cb-4a23-9310-2748e7829a9e.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(146, 49, 'products/35be1725-9509-4781-97b2-a83f0d100e20.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(147, 49, 'products/b76046a5-745c-4aaf-8d08-ca073777ba3e.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(148, 50, 'products/c715c404-74a1-44f1-bc6c-f114aeef8b1b.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(149, 50, 'products/2d56bc2f-c084-4368-8f8f-5845891ac70b.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(150, 50, 'products/c8381308-9dfe-4136-a899-e2deb6f373e1.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(151, 51, 'products/689fa17e-fa30-442c-9f76-44281634af1b.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(152, 51, 'products/747a4845-2866-421e-b19d-cd40dcf01d01.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(153, 51, 'products/6b26a6bc-925f-4cd9-b273-1d2bc2a7ddcf.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(154, 52, 'products/5d16c063-1108-4e41-91d2-b69cdc66d2cc.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(155, 52, 'products/e175d86c-3c05-4c6e-95e4-5f0a1bfd41bc.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(156, 52, 'products/82e4f6f9-5523-4e4b-a794-0d244408b982.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(157, 53, 'products/311de6a4-f6eb-4606-869a-c626f4d4cd85.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(158, 53, 'products/c5d119ab-5020-40cb-9d90-41f70c3e6972.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(159, 53, 'products/2902a262-5236-423f-88fc-684f69981f36.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(160, 54, 'products/89632f37-fae2-4a8c-9897-0c03331e7244.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(161, 54, 'products/c8cabae9-19ae-48a7-b6c0-b66021ef2364.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(162, 54, 'products/26ad9ac3-1c7a-431f-8031-aa85c934dd1d.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(163, 55, 'products/9ab4aa26-93f4-4301-88fe-b78800811d18.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(164, 55, 'products/eb1c670a-b75a-46f4-ad80-9fcdc16e3357.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(165, 55, 'products/9097b8d3-871e-4eb3-8167-d3fdf0353425.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(166, 56, 'products/af42c5f4-6c09-47d5-8d4b-767e1b608df2.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(167, 56, 'products/45d38639-3c23-4a25-97b6-b4e59817d395.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(168, 56, 'products/8b2f9edd-7b91-4ed3-848b-56c6b9320b82.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(169, 57, 'products/91d1490c-b19f-4c86-871a-d524a91013e2.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(170, 57, 'products/c5a4eeca-bb93-4dce-91e3-f040c01d637d.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(171, 57, 'products/bddff4eb-664b-4ac3-95b7-3613ed9d6420.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(172, 58, 'products/75613bfa-79ed-4040-8434-de36569dad57.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(173, 58, 'products/0f585cb5-dec3-4520-933d-d961b496209d.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(174, 58, 'products/c725f451-1ab7-4851-a460-7bf070a1f4a3.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(175, 59, 'products/f920065f-9c66-46af-8861-f6c8e0a8176e.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(176, 59, 'products/5cc8f1e1-603e-4200-a363-71a7b661978e.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(177, 59, 'products/f31e38e6-f845-4409-8941-f5aa71d28364.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(178, 60, 'products/e861f872-6e09-4c93-bb9e-38fa9d9b8a67.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(179, 60, 'products/9489cd36-ffc9-4283-9a0b-0b2c2e4cbb9d.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(180, 60, 'products/9b9abb81-9ca6-495c-99a5-6153de87129b.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(181, 61, 'products/44b06e83-c42c-43fd-b2c4-75375e0785f6.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(182, 61, 'products/3a2c987f-c0fa-4cb2-8883-fab13023e5bf.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(183, 61, 'products/238bdd8c-56b3-47a3-9393-014f87a119ef.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(184, 62, 'products/0aa57687-357d-44d2-a984-7951d000d650.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(185, 62, 'products/e4ff45bb-dcc2-4693-9d03-483d94e6daa9.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(186, 62, 'products/32c0ad57-6b6f-40d4-8f8f-ee9f6f500093.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(187, 63, 'products/edce0c52-9bdd-443c-95ae-75ec8b6ae0db.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(188, 63, 'products/ca14db4c-3551-4031-b73b-95b1e3d5bbf9.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(189, 63, 'products/223700e0-6428-446c-974e-26f138aa116f.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(190, 64, 'products/acdde78f-8979-49b9-8649-4576eeb4209f.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(191, 64, 'products/76e6a48f-d724-4782-828e-53771ce7ea34.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(192, 64, 'products/529d1091-4b0e-411c-b50e-4d862cd14321.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(193, 65, 'products/4111428a-f8c3-491f-a9f6-3c23959bb978.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(194, 65, 'products/71e56a3a-6645-4e55-b1cf-8ae78bfc22d2.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(195, 65, 'products/c25c13d1-623a-4ff8-962c-76681cc8843f.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(196, 66, 'products/fdfaaf92-b420-45d5-9ced-2084829ae475.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(197, 66, 'products/fd352774-19eb-4513-a97e-0f4a0855e176.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(198, 66, 'products/b0b1ae15-041a-441b-9564-b84ff17d7303.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(199, 67, 'products/ed4acb8c-535a-4979-b694-6e5d94498184.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(200, 67, 'products/b7181067-bc09-4aea-9203-5a13d2022f51.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(201, 67, 'products/3586a67a-23f7-4add-9b0b-430f85e5390b.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(202, 68, 'products/d4b07101-5bfb-4a0a-bac7-831ec47ba281.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(203, 68, 'products/8d695fe7-5477-4337-9865-13a9c5a3c439.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(204, 68, 'products/5d6bb04f-111f-412b-b5e1-c953d2ecd226.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(205, 69, 'products/da8bf0cc-cf4c-4baf-9d39-8990fedab4a1.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(206, 69, 'products/b6a6dc19-7ad6-433b-a25e-670dbf9e884c.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(207, 69, 'products/e7fe509c-b138-4259-addb-4dff27af1720.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(208, 70, 'products/a9a9d5cb-4f77-4bce-ba10-fa46d0e81862.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(209, 70, 'products/a72001d8-10f2-4591-9b1a-d5ec5e8d803b.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(210, 70, 'products/5e61ab33-b238-4bb2-98e3-fc0170116015.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(211, 71, 'products/d6c2ab17-38ac-44c2-912a-2b8d16c7b47d.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(212, 71, 'products/b34e8dbd-d294-416c-9ffa-1a541035e025.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(213, 71, 'products/0072dab0-22bb-4699-ab50-d1d8f052f2ac.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(214, 72, 'products/625978ef-b641-497f-8b53-780623c112a7.jpg', 1, 1, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(215, 72, 'products/c1b717de-26c1-480f-ae8d-de478cf5ce16.jpg', 1, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50'),
(216, 72, 'products/0dd044f5-bec0-42ac-ac11-99906dea2a23.jpg', 2, 0, '2025-11-07 13:50:50', '2025-11-07 13:50:50');

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
(1, 55, 2, NULL, 4, 'test', 'testtesttesttesttest testtesttest', 1, 0, '2025-11-08 12:19:48', '2025-11-08 12:19:48'),
(2, 56, 2, NULL, 2, 'test', 'Dicta sint hic ut distinctio eveniet dolor. Quam in illum quibusdam ut. Assumenda tempore illo commodi et. Soluta aliquid maiores aut modi id sit maxime.', 1, 0, '2025-11-08 12:20:26', '2025-11-08 12:20:26'),
(3, 57, 2, NULL, 1, 'test', 'Saepe vero eos nostrum dolores et eum ut. Asperiores et qui esse ipsum tempora omnis. Accusantium voluptas ad voluptatum voluptate. Est repudiandae eum omnis repellat deleniti similique molestiae. Minima eum aut fuga quas harum corrupti amet. Non cum vitae debitis culpa ut.', 1, 0, '2025-11-08 12:22:45', '2025-11-08 12:22:45'),
(4, 57, 3, NULL, 1, 'needyamin@gmail.com', 'needyamin@gmail.comneedyamin@gmail.comneedyamin@gmail.comneedyamin@gmail.comneedyamin@gmail.comneedyamin@gmail.com', 1, 0, '2025-11-08 12:23:23', '2025-11-08 12:23:23'),
(9, 55, 3, NULL, 5, 'Write a Review', 'Write a Review\r\nWrite a Review\r\nWrite a Review\r\nWrite a Review', 1, 0, '2025-11-08 13:35:03', '2025-11-08 13:35:03');

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
(1, 'Super Admin', 'admin', '2025-11-07 13:50:48', '2025-11-07 13:50:48'),
(2, 'Admin', 'admin', '2025-11-08 14:30:27', '2025-11-08 14:30:27');

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
(105, 1),
(106, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(64, 2),
(65, 2),
(66, 2),
(67, 2),
(68, 2),
(71, 2),
(72, 2),
(73, 2),
(74, 2),
(75, 2),
(76, 2),
(77, 2),
(78, 2),
(79, 2),
(80, 2),
(81, 2),
(82, 2),
(83, 2),
(84, 2),
(87, 2),
(88, 2),
(89, 2),
(90, 2),
(91, 2),
(92, 2),
(95, 2),
(96, 2),
(97, 2),
(98, 2),
(99, 2),
(100, 2),
(101, 2),
(102, 2),
(103, 2),
(104, 2),
(105, 2),
(106, 2);

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
('1OY5WcqjRTa7VzYERJp6EK6LJVk6T7wwfrPDsdh2', NULL, '127.0.0.1', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXlRWnZ2eHlHNFFzOUdXM1FOcTJ5TUhHWXVzaGJIZzZwWDYzcWtFNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vZWNvbW1lcmNlLnRlc3QvcHJvZHVjdHMvYmxhbmRpdGlpcy1ldW0tbGFib3JlLW5IMkdjIjtzOjU6InJvdXRlIjtzOjEzOiJwcm9kdWN0cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762627006),
('4vLJeRoBYxTQVHGmip2GiRmqz8VxIGm7RPKRNx4e', NULL, '127.0.0.1', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidUpnVDl0cXJEWjFqdzU5cklHWFlwd1doNjhQRWtwWEZaT2xhWWZuNiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNDoiaHR0cHM6Ly9lY29tbWVyY2UudGVzdC9hZG1pbi91c2VycyI7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI4OiJodHRwczovL2Vjb21tZXJjZS50ZXN0L2xvZ2luIjtzOjU6InJvdXRlIjtzOjU6ImxvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762631406),
('5WTeRdr8vImrReVA5KO30Qp63vNTvPayKkIND0tK', NULL, '127.0.0.1', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTVqSkhFWDljNlZ4Y2hyUGlVaVNETUtOZmtPV3JaY2Uyb2EzVjh6NSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vZWNvbW1lcmNlLnRlc3QvcHJvZHVjdHMiO3M6NToicm91dGUiO3M6MTQ6InByb2R1Y3RzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762626480),
('FTWL50ukGZj9fbg2djsShEe4GRPTdOgfVhSlVoae', NULL, '127.0.0.1', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSWNHdzRiRGIySXI1TnU1ZE9EcEl2eFJmWFZaZjBlRnpnZjlDb1Q1YyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNDoiaHR0cHM6Ly9lY29tbWVyY2UudGVzdC9hZG1pbi9wYWdlcyI7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI4OiJodHRwczovL2Vjb21tZXJjZS50ZXN0L2xvZ2luIjtzOjU6InJvdXRlIjtzOjU6ImxvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762631407),
('koFrVgoMxaLbVmtSFgQOds8dGBScQ117RzElzfIX', NULL, '127.0.0.1', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoieFk2cWFZbUp2MFp1eGQybmZXSjhvdjNlUExNdHZIUzB0MG9aRzJiUSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozOToiaHR0cHM6Ly9lY29tbWVyY2UudGVzdC9hZG1pbi9jYXRlZ29yaWVzIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vZWNvbW1lcmNlLnRlc3QvYWRtaW4vY2F0ZWdvcmllcyI7czo1OiJyb3V0ZSI7czoyMjoiYWRtaW4uY2F0ZWdvcmllcy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762631407),
('kRwI4ZBHGMcizQi0ychmy99zyVMOE0PDMB4CxZjH', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiT1lrZ2h6c2VYdlVlMzdoYWJDMzZJaFBDbVRoVkpFek1KN3dpRzhTaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vZWNvbW1lcmNlLnRlc3QvYWRtaW4vbG9naW4iO3M6NToicm91dGUiO3M6MTE6ImFkbWluLmxvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MztzOjEzOiJyZWZlcnJhbF9jb2RlIjtzOjg6Ijg5MkQ3NkQ1IjtzOjEzOiJyZWZlcnJlcl9uYW1lIjtzOjE2OiJNZCBZYW1pbiBIb3NzYWluIjt9', 1762632338),
('lSRHpNBWAzPnhTZ0jfWm3epLerjAp80sYEdGEsv8', NULL, '127.0.0.1', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWlM1QzVubFJaQkI1d0MzYUwwSE9mVXJ1bEpOUlM1OFk2SXZJNkpYRCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNzoiaHR0cHM6Ly9lY29tbWVyY2UudGVzdC9hZG1pbi9wcm9kdWN0cyI7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjM3OiJodHRwczovL2Vjb21tZXJjZS50ZXN0L2FkbWluL3Byb2R1Y3RzIjtzOjU6InJvdXRlIjtzOjIwOiJhZG1pbi5wcm9kdWN0cy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762631407),
('Njup6OxqRRjwma43V1lvxbdDMBlcxvyFQP8FPDzt', NULL, '127.0.0.1', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQlg5YzBuVm9IWFJjTTdsT2djUkp4b1h0R09CeG92aGRKVzB2Y0JnYSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MDoiaHR0cHM6Ly9lY29tbWVyY2UudGVzdC9hZG1pbi9wZXJtaXNzaW9ucyI7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjQwOiJodHRwczovL2Vjb21tZXJjZS50ZXN0L2FkbWluL3Blcm1pc3Npb25zIjtzOjU6InJvdXRlIjtzOjIzOiJhZG1pbi5wZXJtaXNzaW9ucy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762631407),
('PWpUnFDheC6iU6vull30dUTJSi6acC8RexQpqw9J', NULL, '127.0.0.1', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicVM4c3hFdlB6SGZaYmxjTE9nNnZMRFRrajdyeHdZRWtRbldGMUlFTCI7czoxNToiY2FydF9zZXNzaW9uX2lkIjtzOjM2OiI2OTIxN2RmYy0xYjViLTQxOGQtOTIwNi03ZDdmODBmZmQ1MjYiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI3OiJodHRwczovL2Vjb21tZXJjZS50ZXN0L2NhcnQiO3M6NToicm91dGUiO3M6MTA6ImNhcnQuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762627006),
('qXWASrNcCK90Ua9bvWvqQS6TKNqd2y9uWmi7tePU', NULL, '127.0.0.1', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0dHdUM0cUhoS2ZRT2VrUWhiYU5nRXJ3UDNoWDVkWGhQWTJQejVSTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vZWNvbW1lcmNlLnRlc3QvY2F0ZWdvcnkvYmVhdGFlLWZ1Z2lhdC1xWDZ3aiI7czo1OiJyb3V0ZSI7czoxNToiY2F0ZWdvcmllcy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762626480),
('tvJP1iATGzCKtcRpB5Nwr1kclbNuRgbU6lfGQ8t7', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0) Gecko/20100101 Firefox/144.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibHNzZ0NWZmtuSWpyeHNaRnVMTDI3VTlpU0ZZWWhCTGVsRnlwSU9adyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vZWNvbW1lcmNlLnRlc3QvYWRtaW4vcm9sZXMiO3M6NToicm91dGUiO3M6MTc6ImFkbWluLnJvbGVzLmluZGV4Ijt9czoxOToid2lzaGxpc3Rfc2Vzc2lvbl9pZCI7czozNjoiOTc5N2IwYWItYmY3NC00NDQ5LTgwNzUtODU5ZTFjNjI0N2E2IjtzOjUyOiJsb2dpbl9hZG1pbl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1762633857),
('vqzbSRPSOTlJv5t8hv0ijsGBPNIXaubadVJOCsxr', NULL, '127.0.0.1', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlNOYW45aURXTEE4cExleW1kcTRXZnVjNUtqQWlzS2ZORW5OeXBReSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vZWNvbW1lcmNlLnRlc3QiO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762626480),
('X7xUmSgx2gwf3N5nxk8Qdxvq3mEwFa9Lk6wQ5Wzc', NULL, '127.0.0.1', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTUpUSUdDclZWMjJrMzJBQjFCTnNZN1B6M3I5UmRjNzNrOXFyT0JsWCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNToiaHR0cHM6Ly9lY29tbWVyY2UudGVzdC9hZG1pbi9vcmRlcnMiO31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyODoiaHR0cHM6Ly9lY29tbWVyY2UudGVzdC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762631407),
('YnWQS7A2LtajBPHCnoTd0A8fXbQ9cYycgTTjTn49', NULL, '127.0.0.1', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSkFrRmdhclNQcGJyS0RMVmdFVjhMT0VQNmdHN0JjeXZhSEdxYjlaUCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNDoiaHR0cHM6Ly9lY29tbWVyY2UudGVzdC9hZG1pbi9yb2xlcyI7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI4OiJodHRwczovL2Vjb21tZXJjZS50ZXN0L2xvZ2luIjtzOjU6InJvdXRlIjtzOjU6ImxvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762631406),
('ZOCbquzqeeOx9XHlaOm5nGmy2Wy1bNIMc0egS8h2', NULL, '127.0.0.1', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTGpmU3JEUjNaWHVjZUc0dUFuTzc4U2FVMlJNSWdSN1o3SW5VNWVQViI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0OToiaHR0cHM6Ly9lY29tbWVyY2UudGVzdC9hZG1pbi9hY3Rpdml0aWVzL3dpc2hsaXN0cyI7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI4OiJodHRwczovL2Vjb21tZXJjZS50ZXN0L2xvZ2luIjtzOjU6InJvdXRlIjtzOjU6ImxvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762631664);

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
(1, 1, 1, '0.00', NULL, 0, 'flat', '0.00', '2025-11-08 11:18:14', '2025-11-08 11:18:14');

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
  `product_display_columns_mobile` tinyint NOT NULL DEFAULT '2',
  `product_display_columns_desktop` tinyint NOT NULL DEFAULT '3',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `site_name`, `site_tagline`, `logo_url`, `favicon_url`, `meta_title`, `meta_description`, `meta_keywords`, `footer_text`, `privacy_url`, `terms_url`, `cookies_url`, `help_center_url`, `shipping_info_url`, `returns_url`, `contact_us_url`, `wishlist_enabled`, `reviews_enabled`, `reviews_require_purchase`, `reviews_require_approval`, `reviews_allow_anonymous`, `newsletter_enabled`, `newsletter_double_opt_in`, `newsletter_send_welcome_email`, `social_facebook`, `social_twitter`, `social_instagram`, `social_linkedin`, `product_display_columns_mobile`, `product_display_columns_desktop`, `created_at`, `updated_at`) VALUES
(1, 'eCommerce Store', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, 1, 1, NULL, NULL, NULL, NULL, 2, 4, '2025-11-07 13:50:50', '2025-11-08 13:08:38');

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
(1, 'Test User', 'test@example.com', NULL, NULL, '$2y$12$Dj8r92c3jn9AIqNwOsCBqOZiT9Hj0PKkUeSjskui87E.gwb/NeC1m', 0, NULL, NULL, '2025-11-07 13:50:48', '2025-11-07 13:50:48', NULL),
(2, 'admin@example.com', 'admin@example.com', '01878578504', NULL, '$2y$12$8H31.FIjS6SMwR/i1O4Fr.cvau4vpPtgpGX/VwWUbR/ntyw12fssy', 0, NULL, 'FF335D8C', '2025-11-08 12:19:33', '2025-11-08 12:19:33', NULL),
(3, 'Md Yamin Hossain', 'needyamin@gmail.com', '01907802744', NULL, '$2y$12$A9gdPY9xC.f3anFyto4ouOMdyFli6i6ylN/a3nZFogSCkioo5PzPy', 0, NULL, '892D76D5', '2025-11-08 12:23:09', '2025-11-08 12:50:17', NULL);

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
(1, 3, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 32, '{\"product_id\": 55}', '2025-11-08 12:34:13', '2025-11-08 12:34:13'),
(2, 3, 'remove_from_cart', -1, 'Removed from cart', 'App\\Models\\CartItem', 32, '{\"product_id\": 55}', '2025-11-08 12:34:15', '2025-11-08 12:34:15'),
(3, 3, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 33, '{\"product_id\": 56}', '2025-11-08 12:34:59', '2025-11-08 12:34:59'),
(4, 3, 'remove_from_cart', -1, 'Removed from cart', 'App\\Models\\CartItem', 33, '{\"product_id\": 56}', '2025-11-08 12:35:02', '2025-11-08 12:35:02'),
(5, 3, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 34, '{\"product_id\": 63}', '2025-11-08 12:36:36', '2025-11-08 12:36:36'),
(6, 3, 'remove_from_cart', -1, 'Removed from cart', 'App\\Models\\CartItem', 34, '{\"product_id\": 63}', '2025-11-08 12:36:51', '2025-11-08 12:36:51'),
(7, 3, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 35, '{\"product_id\": 64}', '2025-11-08 12:36:52', '2025-11-08 12:36:52'),
(8, 3, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 36, '{\"product_id\": 55}', '2025-11-08 12:36:54', '2025-11-08 12:36:54'),
(9, 3, 'remove_from_cart', -1, 'Removed from cart', 'App\\Models\\CartItem', 36, '{\"product_id\": 55}', '2025-11-08 12:37:01', '2025-11-08 12:37:01'),
(10, 3, 'remove_from_cart', -1, 'Removed from cart', 'App\\Models\\CartItem', 35, '{\"product_id\": 64}', '2025-11-08 12:37:02', '2025-11-08 12:37:02'),
(11, 3, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 37, '{\"product_id\": 63}', '2025-11-08 12:38:33', '2025-11-08 12:38:33'),
(12, 3, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 38, '{\"product_id\": 55}', '2025-11-08 12:38:35', '2025-11-08 12:38:35'),
(13, 3, 'remove_from_cart', -1, 'Removed from cart', 'App\\Models\\CartItem', 37, '{\"product_id\": 63}', '2025-11-08 12:38:37', '2025-11-08 12:38:37'),
(14, 3, 'remove_from_cart', -1, 'Removed from cart', 'App\\Models\\CartItem', 38, '{\"product_id\": 55}', '2025-11-08 12:38:39', '2025-11-08 12:38:39'),
(15, 3, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 39, '{\"product_id\": 55}', '2025-11-08 12:38:47', '2025-11-08 12:38:47'),
(16, 3, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 40, '{\"product_id\": 63}', '2025-11-08 12:42:38', '2025-11-08 12:42:38'),
(17, 3, 'add_to_cart', 1, 'Added to cart', 'App\\Models\\CartItem', 41, '{\"product_id\": 64}', '2025-11-08 12:42:44', '2025-11-08 12:42:44'),
(18, 3, 'remove_from_cart', -1, 'Removed from cart', 'App\\Models\\CartItem', 41, '{\"product_id\": 64}', '2025-11-08 12:50:01', '2025-11-08 12:50:01'),
(19, 3, 'remove_from_cart', -1, 'Removed from cart', 'App\\Models\\CartItem', 40, '{\"product_id\": 63}', '2025-11-08 12:50:04', '2025-11-08 12:50:04'),
(20, 3, 'remove_from_cart', -1, 'Removed from cart', 'App\\Models\\CartItem', 39, '{\"product_id\": 55}', '2025-11-08 12:50:17', '2025-11-08 12:50:17');

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `newsletter_settings`
--
ALTER TABLE `newsletter_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_points`
--
ALTER TABLE `user_points`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

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
