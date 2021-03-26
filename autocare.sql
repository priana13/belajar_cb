-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 25, 2021 at 04:29 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `autocare`
--

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `jenis_campaigns_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `judul`, `slug`, `desc`, `image`, `created_at`, `updated_at`, `jenis_campaigns_id`) VALUES
(1, 'Sedekah Santri Penghafal Quran', 'sedekah-santri', 'Donasi untuk santri penghafal Quran', 'uploads/1/2021-02/screenshot_from_2021_02_18_06_02_05.png', '2021-02-18 16:03:24', '2021-03-03 08:01:54', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_apicustom`
--

CREATE TABLE `cms_apicustom` (
  `id` int(10) UNSIGNED NOT NULL,
  `permalink` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tabel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aksi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kolom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderby` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_query_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sql_where` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `method_type` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `responses` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_apikey`
--

CREATE TABLE `cms_apikey` (
  `id` int(10) UNSIGNED NOT NULL,
  `screetkey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hit` int(11) DEFAULT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_dashboard`
--

CREATE TABLE `cms_dashboard` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_email_queues`
--

CREATE TABLE `cms_email_queues` (
  `id` int(10) UNSIGNED NOT NULL,
  `send_at` datetime DEFAULT NULL,
  `email_recipient` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_cc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_attachments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_sent` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_email_templates`
--

CREATE TABLE `cms_email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_email_templates`
--

INSERT INTO `cms_email_templates` (`id`, `name`, `slug`, `subject`, `content`, `description`, `from_name`, `from_email`, `cc_email`, `created_at`, `updated_at`) VALUES
(1, 'Email Template Forgot Password Backend', 'forgot_password_backend', NULL, '<p>Hi,</p><p>Someone requested forgot password, here is your new password : </p><p>[password]</p><p><br></p><p>--</p><p>Regards,</p><p>Admin</p>', '[password]', 'System', 'system@crudbooster.com', NULL, '2021-02-18 08:30:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_logs`
--

CREATE TABLE `cms_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_users` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_logs`
--

INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2021-02-18 08:37:27', NULL),
(2, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2021-02-18 15:49:12', NULL),
(3, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/rekening/add-save', 'Add New Data Yayasan Peduli at rekening', '', 1, '2021-02-18 15:51:07', NULL),
(4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/menu_management/add-save', 'Add New Data Setting at Menu Management', '', 1, '2021-02-18 15:58:17', NULL),
(5, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/menu_management/edit-save/7', 'Update data Konfigurasi Global at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Setting</td><td>Konfigurasi Global</td></tr><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>7</td><td></td></tr></tbody></table>', 1, '2021-02-18 15:58:53', NULL),
(6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/jenis_campaigns/add-save', 'Add New Data  at Jenis Campaigns', '', 1, '2021-02-18 16:00:57', NULL),
(7, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/jenis_campaigns/add-save', 'Add New Data  at Jenis Campaigns', '', 1, '2021-02-18 16:01:04', NULL),
(8, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/jenis_campaigns/add-save', 'Add New Data  at Jenis Campaigns', '', 1, '2021-02-18 16:01:06', NULL),
(9, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/campaigns/add-save', 'Add New Data Sedekah Santri at Campaigns', '', 1, '2021-02-18 16:03:24', NULL),
(10, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2021-02-19 15:57:06', NULL),
(11, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/leads/add-save', 'Add New Data Priana at Leads', '', 1, '2021-02-19 15:58:42', NULL),
(12, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/mutasi_bank/add-save', 'Add New Data  at Mutasi Bank', '', 1, '2021-02-19 15:59:26', NULL),
(13, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/menu_management/add-save', 'Add New Data Formulir Campaign at Menu Management', '', 1, '2021-02-19 16:01:17', NULL),
(14, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/menu_management/edit-save/3', 'Update data Campaigns at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr></tbody></table>', 1, '2021-02-19 16:03:39', NULL),
(15, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/menu_management/edit-save/9', 'Update data Formulir Campaign at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>3</td><td></td></tr></tbody></table>', 1, '2021-02-19 16:03:46', NULL),
(16, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/menu_management/edit-save/2', 'Update data Jenis Campaigns at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>3</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2021-02-19 16:03:53', NULL),
(17, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/menu_management/edit-save/6', 'Update data Donasi at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2021-02-19 16:04:00', NULL),
(18, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/menu_management/edit-save/4', 'Update data Leads at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2021-02-19 16:04:07', NULL),
(19, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/menu_management/edit-save/5', 'Update data Mutasi Bank at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', 1, '2021-02-19 16:04:14', NULL),
(20, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/menu_management/edit-save/8', 'Update data Setting at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>5</td><td></td></tr></tbody></table>', 1, '2021-02-19 16:04:22', NULL),
(21, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/menu_management/edit-save/7', 'Update data Konfigurasi Global at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>8</td><td></td></tr></tbody></table>', 1, '2021-02-19 16:04:29', NULL),
(22, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/menu_management/edit-save/1', 'Update data rekening at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>8</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2021-02-19 16:04:36', NULL),
(23, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/users/edit-save/1', 'Update data Super Admin at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2021-02/screenshot_from_2021_02_18_06_02_05.png</td></tr><tr><td>email</td><td>admin@crudbooster.com</td><td>super@autocare.id</td></tr><tr><td>password</td><td>$2y$10$4bc/exUE8CQw7A8HjFDJ8.ImgPDGwu/oEWGIfnKRL.R6XejUJBgoy</td><td>$2y$10$YsR8dccLr4J7IvohG22lguLhzi2tJ8awHB1Ue4D5uT2ceiXGzt//i</td></tr><tr><td>status</td><td>Active</td><td></td></tr></tbody></table>', 1, '2021-02-19 16:07:03', NULL),
(24, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/logout', 'super@autocare.id logout', '', 1, '2021-02-19 16:07:29', NULL),
(25, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/login', 'super@autocare.id login with IP Address 127.0.0.1', '', 1, '2021-02-19 16:15:12', NULL),
(26, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/users/edit-save/1', 'Update data Super Admin at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$4bc/exUE8CQw7A8HjFDJ8.ImgPDGwu/oEWGIfnKRL.R6XejUJBgoy</td><td>$2y$10$CFqbPR6TVu1DF0Ish9ExwuKH1/rOLphXTUSO/gmWvkO.96QV0tami</td></tr><tr><td>status</td><td>Active</td><td></td></tr></tbody></table>', 1, '2021-02-19 16:15:47', NULL),
(27, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/logout', 'super@autocare.id logout', '', 1, '2021-02-19 16:15:54', NULL),
(28, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/login', 'super@autocare.id login with IP Address 127.0.0.1', '', 1, '2021-02-19 16:15:58', NULL),
(29, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/users/edit-save/2', 'Update data Admin at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>priana</td><td>Admin</td></tr><tr><td>photo</td><td></td><td>uploads/1/2021-02/screenshot_from_2021_02_18_06_02_39.png</td></tr><tr><td>email</td><td>priana.yhc@gmail.com</td><td>admin@autocare.id</td></tr><tr><td>password</td><td>bismillah</td><td>$2y$10$Y2ePQtucCG/y2WxdCA4RNeQWhMK6jZzC6FHZmIBNeH900dgCb/jhe</td></tr><tr><td>id_cms_privileges</td><td>1</td><td>2</td></tr><tr><td>status</td><td></td><td></td></tr></tbody></table>', 1, '2021-02-19 16:17:05', NULL),
(30, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/logout', 'super@autocare.id logout', '', 1, '2021-02-19 16:17:12', NULL),
(31, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/login', 'admin@autocare.id login with IP Address 127.0.0.1', '', 2, '2021-02-19 16:17:16', NULL),
(32, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/logout', 'admin@autocare.id keluar', '', 2, '2021-02-19 16:31:13', NULL),
(33, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/login', 'super@autocare.id login dengan IP Address 127.0.0.1', '', 1, '2021-02-19 16:31:18', NULL),
(34, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/menu_management/edit-save/1', 'Memperbaharui data Rekening pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>rekening</td><td>Rekening</td></tr><tr><td>parent_id</td><td>8</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2021-02-19 16:31:36', NULL),
(35, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/logout', 'super@autocare.id keluar', '', 1, '2021-02-19 16:35:29', NULL),
(36, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/login', 'admin@autocare.id login dengan IP Address 127.0.0.1', '', 2, '2021-02-19 16:35:36', NULL),
(37, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/logout', 'admin@autocare.id keluar', '', 2, '2021-02-19 16:36:14', NULL),
(38, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/login', 'admin@autocare.id login dengan IP Address 127.0.0.1', '', 2, '2021-02-22 07:52:41', NULL),
(39, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/login', 'admin@autocare.id login dengan IP Address 127.0.0.1', '', 2, '2021-02-25 23:06:13', NULL),
(40, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/login', 'admin@autocare.id login dengan IP Address 127.0.0.1', '', 2, '2021-03-03 07:38:22', NULL),
(41, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/campaigns/edit-save/1', 'Memperbaharui data Sedekah Santri Penghafal Quran pada Campaigns', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>judul</td><td>Sedekah Santri</td><td>Sedekah Santri Penghafal Quran</td></tr></tbody></table>', 2, '2021-03-03 08:01:54', NULL),
(42, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/rekening/add-save', 'Tambah data baru Yaysan Peduli pada rekening', '', 2, '2021-03-03 08:09:08', NULL),
(43, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/leads/add-save', 'Tambah data baru Priana pada Leads', '', 2, '2021-03-03 08:44:57', NULL),
(44, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/donasi/delete/1', 'Menghapus data 1 pada Donasi', '', 2, '2021-03-03 08:49:46', NULL),
(45, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/leads/delete/3', 'Menghapus data Ahmad pada Leads', '', 2, '2021-03-03 08:53:44', NULL),
(46, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/logout', 'admin@autocare.id keluar', '', 2, '2021-03-03 08:58:08', NULL),
(47, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/login', 'super@autocare.id login dengan IP Address 127.0.0.1', '', 1, '2021-03-03 09:12:49', NULL),
(48, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/logout', 'super@autocare.id keluar', '', 1, '2021-03-03 09:13:21', NULL),
(49, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/login', 'super@autocare.id login dengan IP Address 127.0.0.1', '', 1, '2021-03-03 09:13:55', NULL),
(50, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/logout', 'super@autocare.id keluar', '', 1, '2021-03-03 09:14:27', NULL),
(51, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/login', 'super@autocare.id login dengan IP Address 127.0.0.1', '', 1, '2021-03-03 09:14:40', NULL),
(52, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/login', 'admin@autocare.id login dengan IP Address 127.0.0.1', '', 2, '2021-03-03 09:21:17', NULL),
(53, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/logout', 'admin@autocare.id keluar', '', 2, '2021-03-03 09:21:34', NULL),
(54, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/login', 'admin@autocare.id login dengan IP Address 127.0.0.1', '', 2, '2021-03-04 08:00:04', NULL),
(55, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/login', 'admin@autocare.id login dengan IP Address 127.0.0.1', '', 2, '2021-03-06 19:47:31', NULL),
(56, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/rekening/edit-save/1', 'Memperbaharui data Yayasan Peduli pada rekening', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>nomor_rekening</td><td>0855599955</td><td>08555999556</td></tr></tbody></table>', 2, '2021-03-06 19:48:16', NULL),
(57, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/rekening/edit-save/1', 'Memperbaharui data Yayasan Tuhfah Peduli pada rekening', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>nama_rekening</td><td>Yayasan Peduli</td><td>Yayasan Tuhfah Peduli</td></tr></tbody></table>', 2, '2021-03-06 19:48:36', NULL),
(58, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0', 'http://127.0.0.1:8000/admin/login', 'admin@autocare.id login dengan IP Address 127.0.0.1', '', 2, '2021-03-09 07:35:04', NULL),
(59, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@autocare.id login dengan IP Address 127.0.0.1', '', 2, '2021-03-09 08:17:06', NULL),
(60, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@autocare.id login dengan IP Address 127.0.0.1', '', 2, '2021-03-10 08:46:20', NULL),
(61, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@autocare.id login dengan IP Address 127.0.0.1', '', 2, '2021-03-12 15:53:38', NULL),
(62, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@autocare.id login dengan IP Address 127.0.0.1', '', 2, '2021-03-16 06:13:01', NULL),
(63, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 'http://127.0.0.1:8000/admin/donasi/edit-save/15', 'Memperbaharui data  pada Donasi', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>kode_transaksi</td><td>6047918809fac</td><td></td></tr><tr><td>mutasi_bank_id</td><td></td><td>1</td></tr><tr><td>status</td><td>pending</td><td>Completed</td></tr><tr><td>kode_unik</td><td>910</td><td></td></tr></tbody></table>', 2, '2021-03-16 06:32:06', NULL),
(64, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'super@autocare.id login dengan IP Address 127.0.0.1', '', 1, '2021-03-17 15:28:20', NULL),
(65, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/delete/5', 'Menghapus data Mutasi Bank pada Menu Management', '', 1, '2021-03-17 15:28:32', NULL),
(66, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'super@autocare.id keluar', '', 1, '2021-03-17 16:14:43', NULL),
(67, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@autocare.id login dengan IP Address 127.0.0.1', '', 2, '2021-03-17 16:14:47', NULL),
(68, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Mobile Safari/537.36', 'http://127.0.0.1:8000/admin/leads/delete/2', 'Menghapus data Priana pada Leads', '', 2, '2021-03-17 16:31:57', NULL),
(69, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 'http://127.0.0.1:8000/admin/donasi/delete/2', 'Menghapus data 2 pada Donasi', '', 2, '2021-03-17 16:32:38', NULL),
(70, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 'http://127.0.0.1:8000/admin/donasi/delete/3', 'Menghapus data 3 pada Donasi', '', 2, '2021-03-17 16:32:43', NULL),
(71, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 'http://127.0.0.1:8000/admin/leads/delete/2', 'Menghapus data Priana pada Leads', '', 2, '2021-03-17 16:37:46', NULL),
(72, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@autocare.id keluar', '', 2, '2021-03-17 16:37:56', NULL),
(73, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@autocare.id login dengan IP Address 127.0.0.1', '', 2, '2021-03-18 15:32:46', NULL),
(74, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@autocare.id login dengan IP Address 127.0.0.1', '', 2, '2021-03-20 02:08:17', NULL),
(75, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 'http://127.0.0.1:8000/admin/donasi/delete/11', 'Menghapus data 11 pada Donasi', '', 2, '2021-03-20 05:09:59', NULL),
(76, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@autocare.id login dengan IP Address 127.0.0.1', '', 2, '2021-03-20 15:26:19', NULL),
(77, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 'http://127.0.0.1:8000/admin/donasi/edit-save/5', 'Memperbaharui data  pada Donasi', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>kode_transaksi</td><td>0</td><td></td></tr><tr><td>mutasi_bank_id</td><td></td><td></td></tr><tr><td>status</td><td>pending</td><td>Completed</td></tr><tr><td>kode_unik</td><td>0</td><td></td></tr></tbody></table>', 2, '2021-03-20 15:34:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_menus`
--

CREATE TABLE `cms_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'url',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_dashboard` tinyint(1) NOT NULL DEFAULT 0,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_menus`
--

INSERT INTO `cms_menus` (`id`, `name`, `type`, `path`, `color`, `icon`, `parent_id`, `is_active`, `is_dashboard`, `id_cms_privileges`, `sorting`, `created_at`, `updated_at`) VALUES
(1, 'Rekening', 'Route', 'AdminRekeningControllerGetIndex', 'normal', 'fa fa-bank', 8, 1, 0, 1, 2, '2021-02-18 08:38:18', '2021-02-19 16:31:36'),
(2, 'Jenis Campaigns', 'Route', 'AdminJenisCampaignsControllerGetIndex', 'normal', 'fa fa-meanpath', 3, 1, 0, 1, 2, '2021-02-18 15:53:21', '2021-02-19 16:03:52'),
(3, 'Campaigns', 'Route', 'AdminCampaignsControllerGetIndex', 'normal', 'fa fa-th-list', 0, 1, 0, 1, 1, '2021-02-18 15:54:03', '2021-02-19 16:03:39'),
(4, 'Leads', 'Route', 'AdminLeadsControllerGetIndex', 'normal', 'fa fa-users', 0, 1, 0, 1, 3, '2021-02-18 15:54:40', '2021-02-19 16:04:07'),
(6, 'Donasi', 'Route', 'AdminDonasiControllerGetIndex', 'normal', 'fa fa-heart', 0, 1, 0, 1, 2, '2021-02-18 15:55:51', '2021-02-19 16:04:00'),
(7, 'Konfigurasi Global', 'Route', 'AdminSettingControllerGetIndex', 'normal', 'fa fa-gear', 8, 1, 0, 1, 1, '2021-02-18 15:57:11', '2021-02-19 16:04:29'),
(8, 'Setting', 'Module', 'setting', 'normal', 'fa fa-gear', 0, 1, 0, 1, 5, '2021-02-18 15:58:17', '2021-02-19 16:04:22'),
(9, 'Formulir Campaign', 'Module', 'campaigns', 'normal', 'fa fa-list', 3, 1, 0, 1, 1, '2021-02-19 16:01:17', '2021-02-19 16:03:46');

-- --------------------------------------------------------

--
-- Table structure for table `cms_menus_privileges`
--

CREATE TABLE `cms_menus_privileges` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cms_menus` int(11) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_menus_privileges`
--

INSERT INTO `cms_menus_privileges` (`id`, `id_cms_menus`, `id_cms_privileges`) VALUES
(11, 3, 2),
(12, 3, 1),
(13, 9, 2),
(14, 9, 1),
(15, 2, 2),
(16, 2, 1),
(17, 6, 2),
(18, 6, 1),
(19, 4, 2),
(20, 4, 1),
(21, 5, 2),
(22, 5, 1),
(23, 8, 2),
(24, 8, 1),
(25, 7, 2),
(26, 7, 1),
(29, 1, 2),
(30, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_moduls`
--

CREATE TABLE `cms_moduls` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_moduls`
--

INSERT INTO `cms_moduls` (`id`, `name`, `icon`, `path`, `table_name`, `controller`, `is_protected`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Notifications', 'fa fa-cog', 'notifications', 'cms_notifications', 'NotificationsController', 1, 1, '2021-02-18 08:30:15', NULL, NULL),
(2, 'Privileges', 'fa fa-cog', 'privileges', 'cms_privileges', 'PrivilegesController', 1, 1, '2021-02-18 08:30:15', NULL, NULL),
(3, 'Privileges Roles', 'fa fa-cog', 'privileges_roles', 'cms_privileges_roles', 'PrivilegesRolesController', 1, 1, '2021-02-18 08:30:15', NULL, NULL),
(4, 'Users Management', 'fa fa-users', 'users', 'cms_users', 'AdminCmsUsersController', 0, 1, '2021-02-18 08:30:15', NULL, NULL),
(5, 'Settings', 'fa fa-cog', 'settings', 'cms_settings', 'SettingsController', 1, 1, '2021-02-18 08:30:15', NULL, NULL),
(6, 'Module Generator', 'fa fa-database', 'module_generator', 'cms_moduls', 'ModulsController', 1, 1, '2021-02-18 08:30:15', NULL, NULL),
(7, 'Menu Management', 'fa fa-bars', 'menu_management', 'cms_menus', 'MenusController', 1, 1, '2021-02-18 08:30:15', NULL, NULL),
(8, 'Email Templates', 'fa fa-envelope-o', 'email_templates', 'cms_email_templates', 'EmailTemplatesController', 1, 1, '2021-02-18 08:30:15', NULL, NULL),
(9, 'Statistic Builder', 'fa fa-dashboard', 'statistic_builder', 'cms_statistics', 'StatisticBuilderController', 1, 1, '2021-02-18 08:30:15', NULL, NULL),
(10, 'API Generator', 'fa fa-cloud-download', 'api_generator', '', 'ApiCustomController', 1, 1, '2021-02-18 08:30:15', NULL, NULL),
(11, 'Log User Access', 'fa fa-flag-o', 'logs', 'cms_logs', 'LogsController', 1, 1, '2021-02-18 08:30:15', NULL, NULL),
(12, 'rekening', 'fa fa-bank', 'rekening', 'rekening', 'AdminRekeningController', 0, 0, '2021-02-18 08:38:18', NULL, NULL),
(13, 'Jenis Campaigns', 'fa fa-meanpath', 'jenis_campaigns', 'jenis_campaigns', 'AdminJenisCampaignsController', 0, 0, '2021-02-18 15:53:21', NULL, NULL),
(14, 'Campaigns', 'fa fa-th-list', 'campaigns', 'campaigns', 'AdminCampaignsController', 0, 0, '2021-02-18 15:54:03', NULL, NULL),
(15, 'Leads', 'fa fa-users', 'leads', 'leads', 'AdminLeadsController', 0, 0, '2021-02-18 15:54:40', NULL, NULL),
(16, 'Mutasi Bank', 'fa fa-bank', 'mutasi_bank', 'mutasi_bank', 'AdminMutasiBankController', 0, 0, '2021-02-18 15:55:18', NULL, NULL),
(17, 'Donasi', 'fa fa-heart', 'donasi', 'donasi', 'AdminDonasiController', 0, 0, '2021-02-18 15:55:51', NULL, NULL),
(18, 'Setting', 'fa fa-gear', 'setting', 'setting', 'AdminSettingController', 0, 0, '2021-02-18 15:57:11', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_notifications`
--

CREATE TABLE `cms_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cms_users` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_privileges`
--

CREATE TABLE `cms_privileges` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_superadmin` tinyint(1) DEFAULT NULL,
  `theme_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_privileges`
--

INSERT INTO `cms_privileges` (`id`, `name`, `is_superadmin`, `theme_color`, `created_at`, `updated_at`) VALUES
(1, 'Super Administrator', 1, 'skin-red', '2021-02-18 08:30:15', NULL),
(2, 'Admin', 0, 'skin-blue', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_privileges_roles`
--

CREATE TABLE `cms_privileges_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `is_visible` tinyint(1) DEFAULT NULL,
  `is_create` tinyint(1) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `is_edit` tinyint(1) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `id_cms_moduls` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_privileges_roles`
--

INSERT INTO `cms_privileges_roles` (`id`, `is_visible`, `is_create`, `is_read`, `is_edit`, `is_delete`, `id_cms_privileges`, `id_cms_moduls`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, 0, 0, 1, 1, '2021-02-18 08:30:15', NULL),
(2, 1, 1, 1, 1, 1, 1, 2, '2021-02-18 08:30:15', NULL),
(3, 0, 1, 1, 1, 1, 1, 3, '2021-02-18 08:30:15', NULL),
(4, 1, 1, 1, 1, 1, 1, 4, '2021-02-18 08:30:15', NULL),
(5, 1, 1, 1, 1, 1, 1, 5, '2021-02-18 08:30:15', NULL),
(6, 1, 1, 1, 1, 1, 1, 6, '2021-02-18 08:30:15', NULL),
(7, 1, 1, 1, 1, 1, 1, 7, '2021-02-18 08:30:15', NULL),
(8, 1, 1, 1, 1, 1, 1, 8, '2021-02-18 08:30:15', NULL),
(9, 1, 1, 1, 1, 1, 1, 9, '2021-02-18 08:30:15', NULL),
(10, 1, 1, 1, 1, 1, 1, 10, '2021-02-18 08:30:15', NULL),
(11, 1, 0, 1, 0, 1, 1, 11, '2021-02-18 08:30:15', NULL),
(12, 1, 1, 1, 1, 1, 1, 12, NULL, NULL),
(13, 1, 1, 1, 1, 1, 1, 13, NULL, NULL),
(14, 1, 1, 1, 1, 1, 1, 14, NULL, NULL),
(15, 1, 1, 1, 1, 1, 1, 15, NULL, NULL),
(16, 1, 1, 1, 1, 1, 1, 16, NULL, NULL),
(17, 1, 1, 1, 1, 1, 1, 17, NULL, NULL),
(18, 1, 1, 1, 1, 1, 1, 18, NULL, NULL),
(19, 1, 1, 1, 1, 1, 2, 14, NULL, NULL),
(20, 1, 1, 1, 1, 1, 2, 17, NULL, NULL),
(21, 1, 1, 1, 1, 1, 2, 13, NULL, NULL),
(22, 1, 1, 1, 1, 1, 2, 15, NULL, NULL),
(23, 1, 1, 1, 1, 1, 2, 16, NULL, NULL),
(24, 1, 1, 1, 1, 1, 2, 12, NULL, NULL),
(25, 1, 1, 1, 1, 1, 2, 18, NULL, NULL),
(26, 1, 1, 1, 1, 1, 2, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_settings`
--

CREATE TABLE `cms_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_input_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dataenum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `helper` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_setting` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_settings`
--

INSERT INTO `cms_settings` (`id`, `name`, `content`, `content_input_type`, `dataenum`, `helper`, `created_at`, `updated_at`, `group_setting`, `label`) VALUES
(1, 'login_background_color', NULL, 'text', NULL, 'Input hexacode', '2021-02-18 08:30:15', NULL, 'Login Register Style', 'Login Background Color'),
(2, 'login_font_color', NULL, 'text', NULL, 'Input hexacode', '2021-02-18 08:30:15', NULL, 'Login Register Style', 'Login Font Color'),
(3, 'login_background_image', 'uploads/2021-03/9b3825e504eeaa6cb255d284b172ed57.jpg', 'upload_image', NULL, NULL, '2021-02-18 08:30:15', NULL, 'Login Register Style', 'Login Background Image'),
(4, 'email_sender', 'support@crudbooster.com', 'text', NULL, NULL, '2021-02-18 08:30:15', NULL, 'Email Setting', 'Email Sender'),
(5, 'smtp_driver', 'mail', 'select', 'smtp,mail,sendmail', NULL, '2021-02-18 08:30:15', NULL, 'Email Setting', 'Mail Driver'),
(6, 'smtp_host', '', 'text', NULL, NULL, '2021-02-18 08:30:15', NULL, 'Email Setting', 'SMTP Host'),
(7, 'smtp_port', '25', 'text', NULL, 'default 25', '2021-02-18 08:30:15', NULL, 'Email Setting', 'SMTP Port'),
(8, 'smtp_username', '', 'text', NULL, NULL, '2021-02-18 08:30:15', NULL, 'Email Setting', 'SMTP Username'),
(9, 'smtp_password', '', 'text', NULL, NULL, '2021-02-18 08:30:15', NULL, 'Email Setting', 'SMTP Password'),
(10, 'appname', 'AutoCare (Beta)', 'text', NULL, NULL, '2021-02-18 08:30:15', NULL, 'Application Setting', 'Application Name'),
(11, 'default_paper_size', 'Legal', 'text', NULL, 'Paper size, ex : A4, Legal, etc', '2021-02-18 08:30:15', NULL, 'Application Setting', 'Default Paper Print Size'),
(12, 'logo', 'uploads/2021-03/1b9bc896134b27278f372132a6d367a2.png', 'upload_image', NULL, NULL, '2021-02-18 08:30:15', NULL, 'Application Setting', 'Logo'),
(13, 'favicon', NULL, 'upload_image', NULL, NULL, '2021-02-18 08:30:15', NULL, 'Application Setting', 'Favicon'),
(14, 'api_debug_mode', 'true', 'select', 'true,false', NULL, '2021-02-18 08:30:15', NULL, 'Application Setting', 'API Debug Mode'),
(15, 'google_api_key', NULL, 'text', NULL, NULL, '2021-02-18 08:30:15', NULL, 'Application Setting', 'Google API Key'),
(16, 'google_fcm_key', NULL, 'text', NULL, NULL, '2021-02-18 08:30:15', NULL, 'Application Setting', 'Google FCM Key');

-- --------------------------------------------------------

--
-- Table structure for table `cms_statistics`
--

CREATE TABLE `cms_statistics` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_statistic_components`
--

CREATE TABLE `cms_statistic_components` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cms_statistics` int(11) DEFAULT NULL,
  `componentID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `component_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_name` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_users`
--

CREATE TABLE `cms_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_users`
--

INSERT INTO `cms_users` (`id`, `name`, `photo`, `email`, `password`, `id_cms_privileges`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Super Admin', 'uploads/1/2021-02/screenshot_from_2021_02_18_06_02_05.png', 'super@autocare.id', '$2y$10$CFqbPR6TVu1DF0Ish9ExwuKH1/rOLphXTUSO/gmWvkO.96QV0tami', 1, '2021-02-18 08:30:14', '2021-02-19 16:15:47', 'Active'),
(2, 'Admin', 'uploads/1/2021-02/screenshot_from_2021_02_18_06_02_39.png', 'admin@autocare.id', '$2y$10$Y2ePQtucCG/y2WxdCA4RNeQWhMK6jZzC6FHZmIBNeH900dgCb/jhe', 2, NULL, '2021-02-19 16:17:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `donasi`
--

CREATE TABLE `donasi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_transaksi` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `campaigns_id` bigint(20) UNSIGNED NOT NULL,
  `leads_id` bigint(20) UNSIGNED NOT NULL,
  `rekening_id` int(11) NOT NULL,
  `mutasi_bank_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nominal` int(11) NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_unik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donasi`
--

INSERT INTO `donasi` (`id`, `kode_transaksi`, `created_at`, `updated_at`, `campaigns_id`, `leads_id`, `rekening_id`, `mutasi_bank_id`, `nominal`, `status`, `kode_unik`) VALUES
(4, '0', '2021-03-03 15:54:13', '2021-03-03 15:54:13', 1, 4, 2, NULL, 50000, 'pending', 0),
(5, '0', '2021-03-04 15:06:52', '2021-03-20 15:34:46', 1, 2, 1, NULL, 50000, 'Completed', 0),
(6, '0', '2021-03-04 15:10:06', '2021-03-04 15:10:06', 1, 2, 1, NULL, 50000, 'pending', 0),
(7, '0', '2021-03-04 15:11:10', '2021-03-04 15:11:10', 1, 2, 1, NULL, 50000, 'pending', 0),
(8, '0', '2021-03-04 15:11:56', '2021-03-04 15:11:56', 1, 2, 1, NULL, 50000, 'pending', 0),
(9, '0', '2021-03-07 02:46:36', '2021-03-07 02:46:36', 1, 5, 1, NULL, 50856, 'pending', 856),
(10, '60443fdb9c48c', '2021-03-07 02:52:11', '2021-03-07 02:52:11', 1, 5, 1, NULL, 40454, 'pending', 454),
(12, '604440e85b204', '2021-03-07 02:56:40', '2021-03-07 02:56:40', 1, 2, 1, NULL, 25843, 'pending', 843),
(13, '6044412accd13', '2021-03-07 02:57:46', '2021-03-07 02:57:46', 1, 2, 1, NULL, 25635, 'pending', 635),
(14, '60444162d38f3', '2021-03-07 02:58:42', '2021-03-07 02:58:42', 1, 2, 1, NULL, 25793, 'pending', 793),
(15, '6047918809fac', '2021-03-09 15:17:28', '2021-03-16 06:32:06', 1, 5, 1, 1, 50910, 'Completed', 910),
(16, '6050bbde5b633', '2021-03-16 14:08:30', '2021-03-16 14:08:30', 1, 5, 1, NULL, 50621, 'pending', 621);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_campaigns`
--

CREATE TABLE `jenis_campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jenis_campaign` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jenis_campaigns`
--

INSERT INTO `jenis_campaigns` (`id`, `jenis_campaign`, `created_at`, `updated_at`) VALUES
(1, 'Infak Sedekah', '2021-02-18 16:00:57', NULL),
(2, 'Zakat', '2021-02-18 16:01:04', NULL),
(3, 'Wakaf', '2021-02-18 16:01:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hp` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kota` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `nama`, `hp`, `email`, `kota`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Priana', '08950493211', 'tes@gmail.com', 'Bogor', 'Donatur', '2021-03-03 08:44:57', NULL),
(4, 'Ahmad', '0895049321166', NULL, NULL, 'prospek', NULL, NULL),
(5, 'Priana', '089504932111', NULL, NULL, 'prospek', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_08_07_145904_add_table_cms_apicustom', 1),
(4, '2016_08_07_150834_add_table_cms_dashboard', 1),
(5, '2016_08_07_151210_add_table_cms_logs', 1),
(6, '2016_08_07_151211_add_details_cms_logs', 1),
(7, '2016_08_07_152014_add_table_cms_privileges', 1),
(8, '2016_08_07_152214_add_table_cms_privileges_roles', 1),
(9, '2016_08_07_152320_add_table_cms_settings', 1),
(10, '2016_08_07_152421_add_table_cms_users', 1),
(11, '2016_08_07_154624_add_table_cms_menus_privileges', 1),
(12, '2016_08_07_154624_add_table_cms_moduls', 1),
(13, '2016_08_17_225409_add_status_cms_users', 1),
(14, '2016_08_20_125418_add_table_cms_notifications', 1),
(15, '2016_09_04_033706_add_table_cms_email_queues', 1),
(16, '2016_09_16_035347_add_group_setting', 1),
(17, '2016_09_16_045425_add_label_setting', 1),
(18, '2016_09_17_104728_create_nullable_cms_apicustom', 1),
(19, '2016_10_01_141740_add_method_type_apicustom', 1),
(20, '2016_10_01_141846_add_parameters_apicustom', 1),
(21, '2016_10_01_141934_add_responses_apicustom', 1),
(22, '2016_10_01_144826_add_table_apikey', 1),
(23, '2016_11_14_141657_create_cms_menus', 1),
(24, '2016_11_15_132350_create_cms_email_templates', 1),
(25, '2016_11_15_190410_create_cms_statistics', 1),
(26, '2016_11_17_102740_create_cms_statistic_components', 1),
(27, '2017_06_06_164501_add_deleted_at_cms_moduls', 1),
(28, '2019_08_19_000000_create_failed_jobs_table', 1),
(29, '2021_02_02_135142_create_campaigns_table', 1),
(30, '2021_02_02_140245_create_jenis_campaigns_table', 1),
(31, '2021_02_02_140608_add_jenis_campaigns_to_campaigns_table', 1),
(32, '2021_02_02_141222_create_rekening_table', 1),
(33, '2021_02_02_141436_create_mutasi_bank_table', 1),
(34, '2021_02_02_143116_create_leads_table', 1),
(35, '2021_02_02_143401_create_setting_table', 1),
(36, '2021_02_02_143529_create_donasi_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_bank`
--

CREATE TABLE `mutasi_bank` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rekening_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mutasi_bank`
--

INSERT INTO `mutasi_bank` (`id`, `tanggal`, `keterangan`, `nominal`, `type`, `status`, `created_at`, `updated_at`, `rekening_id`) VALUES
(1, '2021-02-20', 'Tes Mutasi Donasi', 10000, 'CR', 'Unconfirm', '2021-02-19 15:59:26', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rekening`
--

CREATE TABLE `rekening` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_rekening` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_rekening` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scrap_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rekening`
--

INSERT INTO `rekening` (`id`, `nama_rekening`, `nomor_rekening`, `bank`, `scrap_id`, `created_at`, `updated_at`) VALUES
(1, 'Yayasan Tuhfah Peduli', '08555999556', 'Mandiri', '55dagag44', '2021-02-18 15:51:07', '2021-03-06 19:48:36'),
(2, 'Yaysan Peduli', '05885555444', 'BCA', NULL, '2021-03-03 08:09:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'api_woo', '555d4d4d4d55559kkk555', NULL, NULL),
(2, 'api_moota', 'jaglfksjfg;sf99944kkkk888', NULL, NULL),
(3, 'pixel_id', 'afalkjdghalfkgjagdrrrriiii', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'tes', 'tes@gmail.com', NULL, '$2y$10$xAUN6pMFpmScGNYGiHYNjeesPpgGAPzGfZjjDP8PJTfG2h825AvqW', NULL, '2021-02-18 15:48:40', '2021-02-18 15:48:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaigns_jenis_campaigns_id_foreign` (`jenis_campaigns_id`);

--
-- Indexes for table `cms_apicustom`
--
ALTER TABLE `cms_apicustom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_apikey`
--
ALTER TABLE `cms_apikey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_dashboard`
--
ALTER TABLE `cms_dashboard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_email_queues`
--
ALTER TABLE `cms_email_queues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_email_templates`
--
ALTER TABLE `cms_email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_logs`
--
ALTER TABLE `cms_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_menus`
--
ALTER TABLE `cms_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_menus_privileges`
--
ALTER TABLE `cms_menus_privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_moduls`
--
ALTER TABLE `cms_moduls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_notifications`
--
ALTER TABLE `cms_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_privileges`
--
ALTER TABLE `cms_privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_privileges_roles`
--
ALTER TABLE `cms_privileges_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_settings`
--
ALTER TABLE `cms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_statistics`
--
ALTER TABLE `cms_statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_statistic_components`
--
ALTER TABLE `cms_statistic_components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_users`
--
ALTER TABLE `cms_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donasi`
--
ALTER TABLE `donasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `donasi_campaigns_id_foreign` (`campaigns_id`),
  ADD KEY `donasi_leads_id_foreign` (`leads_id`),
  ADD KEY `donasi_mutasi_bank_id_foreign` (`mutasi_bank_id`),
  ADD KEY `rekening_id` (`rekening_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_campaigns`
--
ALTER TABLE `jenis_campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mutasi_bank`
--
ALTER TABLE `mutasi_bank`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mutasi_bank_rekening_id_foreign` (`rekening_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms_apicustom`
--
ALTER TABLE `cms_apicustom`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_apikey`
--
ALTER TABLE `cms_apikey`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_dashboard`
--
ALTER TABLE `cms_dashboard`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_email_queues`
--
ALTER TABLE `cms_email_queues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_email_templates`
--
ALTER TABLE `cms_email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms_logs`
--
ALTER TABLE `cms_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `cms_menus`
--
ALTER TABLE `cms_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cms_menus_privileges`
--
ALTER TABLE `cms_menus_privileges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `cms_moduls`
--
ALTER TABLE `cms_moduls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `cms_notifications`
--
ALTER TABLE `cms_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_privileges`
--
ALTER TABLE `cms_privileges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cms_privileges_roles`
--
ALTER TABLE `cms_privileges_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `cms_settings`
--
ALTER TABLE `cms_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cms_statistics`
--
ALTER TABLE `cms_statistics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_statistic_components`
--
ALTER TABLE `cms_statistic_components`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_users`
--
ALTER TABLE `cms_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `donasi`
--
ALTER TABLE `donasi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jenis_campaigns`
--
ALTER TABLE `jenis_campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `mutasi_bank`
--
ALTER TABLE `mutasi_bank`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rekening`
--
ALTER TABLE `rekening`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD CONSTRAINT `campaigns_jenis_campaigns_id_foreign` FOREIGN KEY (`jenis_campaigns_id`) REFERENCES `jenis_campaigns` (`id`);

--
-- Constraints for table `donasi`
--
ALTER TABLE `donasi`
  ADD CONSTRAINT `donasi_campaigns_id_foreign` FOREIGN KEY (`campaigns_id`) REFERENCES `campaigns` (`id`),
  ADD CONSTRAINT `donasi_leads_id_foreign` FOREIGN KEY (`leads_id`) REFERENCES `leads` (`id`),
  ADD CONSTRAINT `donasi_mutasi_bank_id_foreign` FOREIGN KEY (`mutasi_bank_id`) REFERENCES `mutasi_bank` (`id`);

--
-- Constraints for table `mutasi_bank`
--
ALTER TABLE `mutasi_bank`
  ADD CONSTRAINT `mutasi_bank_rekening_id_foreign` FOREIGN KEY (`rekening_id`) REFERENCES `rekening` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
