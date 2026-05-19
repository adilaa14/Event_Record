-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 18, 2026 at 07:34 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `realtime_doc`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `event_note_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `event_note_id`, `user_id`, `action`, `description`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 'updated the content', NULL, '2026-05-14 21:16:09', '2026-05-14 21:16:09'),
(2, 1, 1, 'memperbarui isi dokumen', NULL, '2026-05-14 21:19:39', '2026-05-14 21:19:39'),
(3, 4, 1, 'memperbarui isi dokumen', NULL, '2026-05-14 21:21:12', '2026-05-14 21:21:12'),
(4, 5, 4, 'membuat dokumen ini', NULL, '2026-05-18 07:48:47', '2026-05-18 07:48:47'),
(5, 5, 4, 'menambahkan sayyid sebagai editor', NULL, '2026-05-18 07:49:13', '2026-05-18 07:49:13'),
(7, 5, 4, 'memperbarui isi dokumen', NULL, '2026-05-18 07:49:49', '2026-05-18 07:49:49'),
(8, 5, 4, 'memperbarui isi dokumen', NULL, '2026-05-18 07:49:53', '2026-05-18 07:49:53'),
(9, 5, 4, 'memperbarui isi dokumen', NULL, '2026-05-18 07:51:03', '2026-05-18 07:51:03'),
(11, 5, 4, 'memperbarui isi dokumen', NULL, '2026-05-18 07:51:58', '2026-05-18 07:51:58'),
(12, 5, 4, 'memperbarui isi dokumen', NULL, '2026-05-18 07:52:02', '2026-05-18 07:52:02'),
(13, 4, 2, 'menambahkan adila kania sebagai editor', NULL, '2026-05-18 12:11:29', '2026-05-18 12:11:29'),
(14, 4, 5, 'memperbarui isi dokumen', NULL, '2026-05-18 12:12:02', '2026-05-18 12:12:02'),
(15, 4, 5, 'memperbarui isi dokumen', NULL, '2026-05-18 12:12:22', '2026-05-18 12:12:22');

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
-- Table structure for table `collaborators`
--

CREATE TABLE `collaborators` (
  `id` bigint UNSIGNED NOT NULL,
  `event_note_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `role` enum('owner','editor','viewer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'viewer',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collaborators`
--

INSERT INTO `collaborators` (`id`, `event_note_id`, `user_id`, `role`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'owner', '2026-05-10 01:52:37', '2026-05-10 01:52:37'),
(2, 1, 2, 'editor', '2026-05-10 01:55:47', '2026-05-10 01:55:47'),
(3, 2, 2, 'owner', '2026-05-10 02:26:54', '2026-05-10 02:26:54'),
(4, 3, 2, 'owner', '2026-05-10 03:18:57', '2026-05-10 03:18:57'),
(5, 3, 1, 'editor', '2026-05-10 03:19:21', '2026-05-10 03:19:21'),
(6, 4, 2, 'owner', '2026-05-10 03:22:16', '2026-05-10 03:22:16'),
(7, 4, 1, 'editor', '2026-05-10 03:22:27', '2026-05-10 03:22:27'),
(8, 5, 4, 'owner', '2026-05-18 07:48:47', '2026-05-18 07:48:47'),
(10, 4, 5, 'editor', '2026-05-18 12:11:29', '2026-05-18 12:11:29');

-- --------------------------------------------------------

--
-- Table structure for table `cursor_positions`
--

CREATE TABLE `cursor_positions` (
  `id` bigint UNSIGNED NOT NULL,
  `event_note_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `index` int NOT NULL DEFAULT '0',
  `length` int NOT NULL DEFAULT '0',
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_notes`
--

CREATE TABLE `event_notes` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paper_size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'A4',
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `owner_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_notes`
--

INSERT INTO `event_notes` (`id`, `title`, `paper_size`, `content`, `owner_id`, `created_at`, `updated_at`) VALUES
(1, 'tes', 'A4', '{\"ops\":[{\"attributes\":{\"bold\":true},\"insert\":\"bsadkvbsakvbsadvlksavlksdnvlkbasdlkvdslkavklsdvlksavlkasdnvklsanvlkasnklvnsaklvnsakvnsa\"},{\"insert\":\"lkvnlkasvnlkasvnlkdsanvlkasndlvknsadklvndkslanvlksanvlksnavlkndsavlndsavnlkasnvksanvlknsavlnsalvnksanvlkasnvklnasvlknsakvnksanvlkasnvknasknvklsanvdknkvnsadvsavs\\n\\nbsadkvbsakvbsadvlksavlksdnvlkbasdlkvdslkavklsdvlksavlkasdnvklsanvlkasnklvnsaklvnsakvnsalkvnlkasvnlkasvnlkdsanvlkasndlvknsadklvndkslanvlksanvlksnavlkndsavlndsavnlkasnvksanvlknsavlnsalvnksanvlkasnvklnasvlknsakvnksanvlkasnvknasknvklsanvdknkvn\\nbsadkvbsakvbsadvlksavlksdnvlkbasdlkvdslkavklsdvlksavlkasdnvklsanvlkasnklvnsaklvnsakvnsalkvnlkasvnlkasvnlkdsanvlkasndlvknsadklvndkslanvlksanvlksnavlkndsavlndsavnlkasnvksanvlknsavlnsalvnksanvlkasnvklnasvlknsakvnksanvlkasnvknasknvklsanvdknkvnbsadkvbsakvbsadvlksavlksdnvlkbasdlkvdslkavklsdvlksavlkasdnvklsanvlkasnklvnsaklvnsakvnsalkvnlkasvnlkasvnlkdsanvlkasndlvknsadklvndkslanvlksanvlksnavlkndsavlndsavnlkasnvksanvlknsavlnsalvnksanvlkasnvklnasvlknsakvnksanvlkasnvknasknvklsanvdknkvn\\nbsadkvbsakvbsadvlksavlksdnvlkbasdlkvdslkavklsdvlksavlkasdnvklsanvlkasnklvnsaklvnsakvnsalkvnlkasvnlkasvnlkdsanvlkasndlvknsadklvndkslanvlksanvlksnavlkndsavlndsavnlkasnvksanvlknsavlnsalvnksanvlkasnvklnasvlknsakvnksanvlkasnvknasknvklsanvdknkvnbsadkvbsakvbsadvlksavlksdnvlkbasdlkvdslkavklsdvlksavlkasdnvklsanvlkasnklvnsaklvnsakvnsalkvnlkasvnlkasvnlkdsanvlkasndlvknsadklvndkslanvlksanvlksnavlkndsavlndsavnlkasnvksanvlknsavlnsalvnksanvlkasnvklnasvlknsakvnksanvlkasnvknasknvklsanvdknkvn\\n\\nbsadkvbsakvbsadvlksavlksdnvlkbasdlkvdslkavklsdvlksavlkasdnvklsanvlkasnklvnsaklvnsakvnsalkvnlkasvnlkasvnlkdsanvlkasndlvknsadklvndkslanvlksanvlksnavlkndsavlndsavnlkasnvksanvlknsavlnsalvnksanvlkasnvklnasvlknsakvnksanvlkasnvknasknvklsanvdknkvn jhjhfjh\\n\"}]}', 1, '2026-05-10 01:52:37', '2026-05-14 21:19:39'),
(2, 'Rapat', 'A4', '{\"ops\":[{\"insert\":\"dsvasdvasdvasdvsaddsvasdvasdvsadv\\n\"}]}', 2, '2026-05-10 02:26:54', '2026-05-10 02:29:22'),
(3, 'Seminar', 'A4', '{\"ops\":[{\"insert\":\"czCczx   xz jadi gini\\n\\n\"}]}', 2, '2026-05-10 03:18:57', '2026-05-14 20:39:34'),
(4, 'catatan', 'A4', '{\"ops\":[{\"insert\":\"sadd assadsavsasavsadvsavasvsvdsvsavsavsvdasvdsavsdav\\ndsshdvihsavdsvdsavsvsvdsvs vdfssdbdsbsddsavsavvavd sdavsaas\\n\\nsdsadvs hdggfgfsgfserwr hjjhfkfhghgfhjhjchg\\n\"}]}', 2, '2026-05-10 03:22:16', '2026-05-18 12:12:38'),
(5, 'rapat', 'A4', '{\"ops\":[{\"insert\":\"sayyid dgfghfghffhjjh\\n\"}]}', 4, '2026-05-18 07:48:47', '2026-05-18 07:52:02');

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
(1, 'default', '{\"uuid\":\"45b02e6c-9ac0-411d-97a1-8e70e21b05eb\",\"displayName\":\"App\\\\Events\\\\CursorMoved\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\CursorMoved\\\":4:{s:6:\\\"noteId\\\";i:1;s:6:\\\"userId\\\";i:1;s:8:\\\"position\\\";a:2:{i:0;i:0;i:1;i:0;}s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403217,\"delay\":null}', 0, NULL, 1778403217, 1778403217),
(2, 'default', '{\"uuid\":\"aee18904-4c2d-41c1-893e-13a616c7492e\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:26:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"s\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403218,\"delay\":null}', 0, NULL, 1778403218, 1778403218),
(3, 'default', '{\"uuid\":\"8072af45-1948-4dcc-abd2-22b5d8266290\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:27:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sd\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403218,\"delay\":null}', 0, NULL, 1778403218, 1778403218),
(4, 'default', '{\"uuid\":\"b8a3485b-9632-4c5a-91a2-1a5abf29a21d\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:33:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvs\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403219,\"delay\":null}', 0, NULL, 1778403219, 1778403219),
(5, 'default', '{\"uuid\":\"82c90988-33b5-4ee9-822a-9fc8b781813d\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:34:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsv\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403219,\"delay\":null}', 0, NULL, 1778403219, 1778403219),
(6, 'default', '{\"uuid\":\"b7ff2662-e678-445e-b8c5-59ccd5e34b6b\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:35:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvd\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403220,\"delay\":null}', 0, NULL, 1778403220, 1778403220),
(7, 'default', '{\"uuid\":\"e2e313c3-d684-47ce-ac6f-1b8fa0de31f5\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:36:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvds\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403221,\"delay\":null}', 0, NULL, 1778403221, 1778403221),
(8, 'default', '{\"uuid\":\"e2c56fd5-1efe-4a27-9b25-c3c5a7d15856\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:28:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sda\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403221,\"delay\":null}', 0, NULL, 1778403221, 1778403221),
(9, 'default', '{\"uuid\":\"5712685c-c57d-4f6d-94a7-965dc9a4097b\",\"displayName\":\"App\\\\Events\\\\CursorMoved\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\CursorMoved\\\":4:{s:6:\\\"noteId\\\";i:1;s:6:\\\"userId\\\";i:1;s:8:\\\"position\\\";a:2:{i:0;i:0;i:1;i:11;}s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403222,\"delay\":null}', 0, NULL, 1778403222, 1778403222),
(10, 'default', '{\"uuid\":\"066c20cd-34e1-4704-ab3e-091168d72d30\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:29:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdal\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403222,\"delay\":null}', 0, NULL, 1778403222, 1778403222),
(11, 'default', '{\"uuid\":\"80f20c3c-5bd3-4173-a494-5a65dfe5aa77\",\"displayName\":\"App\\\\Events\\\\CursorMoved\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\CursorMoved\\\":4:{s:6:\\\"noteId\\\";i:1;s:6:\\\"userId\\\";i:1;s:8:\\\"position\\\";a:2:{i:0;i:0;i:1;i:11;}s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403223,\"delay\":null}', 0, NULL, 1778403223, 1778403223),
(12, 'default', '{\"uuid\":\"97d08a6b-7371-49ef-95e0-a226a474aad7\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:76:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvds\\\"},{\\\"attributes\\\":{\\\"header\\\":1},\\\"insert\\\":\\\"\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403223,\"delay\":null}', 0, NULL, 1778403223, 1778403223),
(13, 'default', '{\"uuid\":\"e5a0db38-110c-4b85-a38e-78c0be6eae56\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:30:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdala\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403224,\"delay\":null}', 0, NULL, 1778403224, 1778403224),
(14, 'default', '{\"uuid\":\"f25acc0a-5354-44c7-849d-cc2f475a98db\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:31:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalas\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403224,\"delay\":null}', 0, NULL, 1778403224, 1778403224),
(15, 'default', '{\"uuid\":\"704dea9f-85e5-43c2-8996-da12a6f3c818\",\"displayName\":\"App\\\\Events\\\\CursorMoved\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\CursorMoved\\\":4:{s:6:\\\"noteId\\\";i:1;s:6:\\\"userId\\\";i:1;s:8:\\\"position\\\";a:2:{i:0;i:0;i:1;i:11;}s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403225,\"delay\":null}', 0, NULL, 1778403225, 1778403225),
(16, 'default', '{\"uuid\":\"02618ce7-a2b1-4d3c-8f85-4a24591d8e4b\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:36:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvds\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403225,\"delay\":null}', 0, NULL, 1778403225, 1778403225),
(17, 'default', '{\"uuid\":\"1e93aaf9-ba79-4fc1-b370-6a0a859ad19d\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:32:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasv\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403226,\"delay\":null}', 0, NULL, 1778403226, 1778403226),
(18, 'default', '{\"uuid\":\"9881ac90-c2c4-4acb-ae90-d7aed1cd31da\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:77:\\\"{\\\"ops\\\":[{\\\"attributes\\\":{\\\"bold\\\":true},\\\"insert\\\":\\\"sdalasvsvds\\\"},{\\\"insert\\\":\\\"\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403226,\"delay\":null}', 0, NULL, 1778403226, 1778403226),
(19, 'default', '{\"uuid\":\"8df1446b-4a36-46b3-b030-3227aebd2f20\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:91:\\\"{\\\"ops\\\":[{\\\"attributes\\\":{\\\"italic\\\":true,\\\"bold\\\":true},\\\"insert\\\":\\\"sdalasvsvds\\\"},{\\\"insert\\\":\\\"\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403227,\"delay\":null}', 0, NULL, 1778403227, 1778403227),
(20, 'default', '{\"uuid\":\"0f662082-a7cb-443a-a154-418c0c81d0c3\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:77:\\\"{\\\"ops\\\":[{\\\"attributes\\\":{\\\"bold\\\":true},\\\"insert\\\":\\\"sdalasvsvds\\\"},{\\\"insert\\\":\\\"\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403227,\"delay\":null}', 0, NULL, 1778403227, 1778403227),
(21, 'default', '{\"uuid\":\"66a83576-a2d1-44b3-ab17-26e5c0b45561\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:36:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvds\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403228,\"delay\":null}', 0, NULL, 1778403228, 1778403228),
(22, 'default', '{\"uuid\":\"267c6d65-b91f-495d-bd35-0167002ed33c\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:82:\\\"{\\\"ops\\\":[{\\\"attributes\\\":{\\\"underline\\\":true},\\\"insert\\\":\\\"sdalasvsvds\\\"},{\\\"insert\\\":\\\"\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403228,\"delay\":null}', 0, NULL, 1778403228, 1778403228),
(23, 'default', '{\"uuid\":\"bb1ac19f-21c6-45f4-baf1-3cb50c30895f\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:36:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvds\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403229,\"delay\":null}', 0, NULL, 1778403229, 1778403229),
(24, 'default', '{\"uuid\":\"d5e29d1e-5b6d-43de-9e6d-2c394a621cbc\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:79:\\\"{\\\"ops\\\":[{\\\"attributes\\\":{\\\"strike\\\":true},\\\"insert\\\":\\\"sdalasvsvds\\\"},{\\\"insert\\\":\\\"\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403229,\"delay\":null}', 0, NULL, 1778403229, 1778403229),
(25, 'default', '{\"uuid\":\"d1fe8c95-d3c5-49a5-9f89-baee91199b34\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:36:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvds\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403230,\"delay\":null}', 0, NULL, 1778403230, 1778403230),
(26, 'default', '{\"uuid\":\"3ebd8aa8-05b6-4b0f-bffb-f79d02ffbd22\",\"displayName\":\"App\\\\Events\\\\CursorMoved\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\CursorMoved\\\":4:{s:6:\\\"noteId\\\";i:1;s:6:\\\"userId\\\";i:1;s:8:\\\"position\\\";a:2:{i:0;i:11;i:1;i:0;}s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403231,\"delay\":null}', 0, NULL, 1778403231, 1778403231),
(27, 'default', '{\"uuid\":\"83d2e30f-4210-40d0-a944-182eff879eec\",\"displayName\":\"App\\\\Events\\\\CursorMoved\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\CursorMoved\\\":4:{s:6:\\\"noteId\\\";i:1;s:6:\\\"userId\\\";i:1;s:8:\\\"position\\\";a:2:{i:0;i:11;i:1;i:0;}s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403234,\"delay\":null}', 0, NULL, 1778403234, 1778403234),
(28, 'default', '{\"uuid\":\"23acc38e-9d0f-41d8-867a-822313de44ca\",\"displayName\":\"App\\\\Events\\\\CursorMoved\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\CursorMoved\\\":4:{s:6:\\\"noteId\\\";i:1;s:6:\\\"userId\\\";i:2;s:8:\\\"position\\\";a:2:{i:0;i:11;i:1;i:0;}s:6:\\\"socket\\\";s:19:\\\"361279445.139582238\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403360,\"delay\":null}', 0, NULL, 1778403360, 1778403360),
(29, 'default', '{\"uuid\":\"712dca8b-6fe8-4e98-9497-effb055a0b87\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:37:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvdsk\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:2;s:6:\\\"socket\\\";s:19:\\\"361279445.139582238\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403361,\"delay\":null}', 0, NULL, 1778403361, 1778403361),
(30, 'default', '{\"uuid\":\"6f28a39d-8ccb-46fb-9b27-53f00642c7cd\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:38:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvdsks\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:2;s:6:\\\"socket\\\";s:19:\\\"361279445.139582238\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403362,\"delay\":null}', 0, NULL, 1778403362, 1778403362),
(31, 'default', '{\"uuid\":\"9c695e9d-4ebb-4ec6-bef9-23955d4d7651\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:39:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvdsksa\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:2;s:6:\\\"socket\\\";s:19:\\\"361279445.139582238\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403362,\"delay\":null}', 0, NULL, 1778403362, 1778403362),
(32, 'default', '{\"uuid\":\"e7ec2159-6d04-450f-9a15-ca2dab132efc\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:40:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvdsksaj\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:2;s:6:\\\"socket\\\";s:19:\\\"361279445.139582238\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403363,\"delay\":null}', 0, NULL, 1778403363, 1778403363),
(33, 'default', '{\"uuid\":\"097c93a3-7845-4b08-9d8e-8d76d4685255\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:41:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvdsksajb\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:2;s:6:\\\"socket\\\";s:19:\\\"361279445.139582238\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403363,\"delay\":null}', 0, NULL, 1778403363, 1778403363),
(34, 'default', '{\"uuid\":\"4144b465-623d-4664-b04f-330af74cd70d\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:42:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvdsksajbj\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:2;s:6:\\\"socket\\\";s:19:\\\"361279445.139582238\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403364,\"delay\":null}', 0, NULL, 1778403364, 1778403364),
(35, 'default', '{\"uuid\":\"cf798106-d88d-4a44-866b-649aab1602fc\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:43:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvdsksajbja\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:2;s:6:\\\"socket\\\";s:19:\\\"361279445.139582238\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403364,\"delay\":null}', 0, NULL, 1778403364, 1778403364),
(36, 'default', '{\"uuid\":\"49204f18-5f78-4cea-b516-8fd0d259354c\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:44:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvdsksajbjas\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:2;s:6:\\\"socket\\\";s:19:\\\"361279445.139582238\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403365,\"delay\":null}', 0, NULL, 1778403365, 1778403365),
(37, 'default', '{\"uuid\":\"c2f8771f-1d82-4c92-a025-eb08101fabca\",\"displayName\":\"App\\\\Events\\\\CursorMoved\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\CursorMoved\\\":4:{s:6:\\\"noteId\\\";i:1;s:6:\\\"userId\\\";i:1;s:8:\\\"position\\\";a:2:{i:0;i:11;i:1;i:0;}s:6:\\\"socket\\\";s:19:\\\"492003706.380207344\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403366,\"delay\":null}', 0, NULL, 1778403366, 1778403366),
(38, 'default', '{\"uuid\":\"05e4d64b-c4c9-45e2-9842-0cd1484200e7\",\"displayName\":\"App\\\\Events\\\\CursorMoved\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\CursorMoved\\\":4:{s:6:\\\"noteId\\\";i:1;s:6:\\\"userId\\\";i:1;s:8:\\\"position\\\";a:2:{i:0;i:19;i:1;i:0;}s:6:\\\"socket\\\";s:19:\\\"581065476.615111619\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403374,\"delay\":null}', 0, NULL, 1778403374, 1778403374),
(39, 'default', '{\"uuid\":\"66bd7ec4-4b36-4675-bc72-70cbc6fad3a0\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:45:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvdsksajbjasi\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"581065476.615111619\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403380,\"delay\":null}', 0, NULL, 1778403380, 1778403380),
(40, 'default', '{\"uuid\":\"c8a1b7dc-ffe8-4c1f-883f-a2ec9705faaf\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:46:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvdsksajbjasij\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"581065476.615111619\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403381,\"delay\":null}', 0, NULL, 1778403381, 1778403381);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(41, 'default', '{\"uuid\":\"5dec1776-92df-4342-a970-a1601bb34753\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:47:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvdsksajbjasijo\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"581065476.615111619\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403381,\"delay\":null}', 0, NULL, 1778403381, 1778403381),
(42, 'default', '{\"uuid\":\"df0e7792-7fe0-4e9d-8bca-43b687007a92\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:48:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvdsksajbjasijoh\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"581065476.615111619\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403381,\"delay\":null}', 0, NULL, 1778403381, 1778403381),
(43, 'default', '{\"uuid\":\"db4a57e1-fd0e-47b6-99bb-89a2063b0d5d\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:49:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvdsksajbjasijoha\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"581065476.615111619\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403382,\"delay\":null}', 0, NULL, 1778403382, 1778403382),
(44, 'default', '{\"uuid\":\"f71d666e-72fa-4827-9257-bbacb19f637c\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:50:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvdsksajbjasijohai\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"581065476.615111619\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403382,\"delay\":null}', 0, NULL, 1778403382, 1778403382),
(45, 'default', '{\"uuid\":\"197a21a3-5257-4624-b6e5-fc30293544f9\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:51:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvdsksajbjasijohais\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"581065476.615111619\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403383,\"delay\":null}', 0, NULL, 1778403383, 1778403383),
(46, 'default', '{\"uuid\":\"a22ce47e-cb31-44fb-819b-8b0687a68469\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:52:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvdsksajbjasijohaiso\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"581065476.615111619\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403383,\"delay\":null}', 0, NULL, 1778403383, 1778403383),
(47, 'default', '{\"uuid\":\"fa77b7f2-e34a-43c1-a28b-8ab26614fa7a\",\"displayName\":\"App\\\\Events\\\\DocumentUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\DocumentUpdated\\\":4:{s:6:\\\"noteId\\\";i:1;s:7:\\\"content\\\";s:53:\\\"{\\\"ops\\\":[{\\\"insert\\\":\\\"sdalasvsvdsksajbjasijohaisoa\\\\n\\\"}]}\\\";s:6:\\\"userId\\\";i:1;s:6:\\\"socket\\\";s:19:\\\"581065476.615111619\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1778403384,\"delay\":null}', 0, NULL, 1778403384, 1778403384);

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
(4, '2026_05_10_083412_create_event_notes_table', 1),
(5, '2026_05_10_083413_create_collaborators_table', 1),
(6, '2026_05_10_083414_create_cursor_positions_table', 1),
(7, '2026_05_10_083414_create_revisions_table', 1),
(8, '2026_05_10_083415_create_activity_logs_table', 1),
(9, '2026_05_10_092353_add_paper_size_to_event_notes_table', 2);

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
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` bigint UNSIGNED NOT NULL,
  `event_note_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `content_before` longtext COLLATE utf8mb4_unicode_ci,
  `content_after` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `revisions`
--

INSERT INTO `revisions` (`id`, `event_note_id`, `user_id`, `content_before`, `content_after`, `created_at`, `updated_at`) VALUES
(1, 4, 1, '{\"ops\":[{\"insert\":\"sadd assadsavsasavsadvsavasvsvdsvsavsavsvdasvdsavsdav\\ndsshdvihsavdsvdsavsvsvdsvs vdfssdbdsbsddsavsavvavd sdavsaas\\n\\nsdsadvs hdggfgfsgfserwr\\n\"}]}', '{\"ops\":[{\"insert\":\"sadd assadsavsasavsadvsavasvsvdsvsavsavsvdasvdsavsdav\\ndsshdvihsavdsvdsavsvsvdsvs vdfssdbdsbsddsavsavvavd sdavsaas\\n\\nsdsadvs hdggfgfsgfserwr\\n\"}]}', '2026-05-14 21:16:10', '2026-05-14 21:16:10'),
(2, 1, 1, '{\"ops\":[{\"attributes\":{\"bold\":true},\"insert\":\"bsadkvbsakvbsadvlksavlksdnvlkbasdlkvdslkavklsdvlksavlkasdnvklsanvlkasnklvnsaklvnsakvnsa\"},{\"insert\":\"lkvnlkasvnlkasvnlkdsanvlkasndlvknsadklvndkslanvlksanvlksnavlkndsavlndsavnlkasnvksanvlknsavlnsalvnksanvlkasnvklnasvlknsakvnksanvlkasnvknasknvklsanvdknkvnsadvsavs\\n\\nbsadkvbsakvbsadvlksavlksdnvlkbasdlkvdslkavklsdvlksavlkasdnvklsanvlkasnklvnsaklvnsakvnsalkvnlkasvnlkasvnlkdsanvlkasndlvknsadklvndkslanvlksanvlksnavlkndsavlndsavnlkasnvksanvlknsavlnsalvnksanvlkasnvklnasvlknsakvnksanvlkasnvknasknvklsanvdknkvn\\nbsadkvbsakvbsadvlksavlksdnvlkbasdlkvdslkavklsdvlksavlkasdnvklsanvlkasnklvnsaklvnsakvnsalkvnlkasvnlkasvnlkdsanvlkasndlvknsadklvndkslanvlksanvlksnavlkndsavlndsavnlkasnvksanvlknsavlnsalvnksanvlkasnvklnasvlknsakvnksanvlkasnvknasknvklsanvdknkvnbsadkvbsakvbsadvlksavlksdnvlkbasdlkvdslkavklsdvlksavlkasdnvklsanvlkasnklvnsaklvnsakvnsalkvnlkasvnlkasvnlkdsanvlkasndlvknsadklvndkslanvlksanvlksnavlkndsavlndsavnlkasnvksanvlknsavlnsalvnksanvlkasnvklnasvlknsakvnksanvlkasnvknasknvklsanvdknkvn\\nbsadkvbsakvbsadvlksavlksdnvlkbasdlkvdslkavklsdvlksavlkasdnvklsanvlkasnklvnsaklvnsakvnsalkvnlkasvnlkasvnlkdsanvlkasndlvknsadklvndkslanvlksanvlksnavlkndsavlndsavnlkasnvksanvlknsavlnsalvnksanvlkasnvklnasvlknsakvnksanvlkasnvknasknvklsanvdknkvnbsadkvbsakvbsadvlksavlksdnvlkbasdlkvdslkavklsdvlksavlkasdnvklsanvlkasnklvnsaklvnsakvnsalkvnlkasvnlkasvnlkdsanvlkasndlvknsadklvndkslanvlksanvlksnavlkndsavlndsavnlkasnvksanvlknsavlnsalvnksanvlkasnvklnasvlknsakvnksanvlkasnvknasknvklsanvdknkvn\\n\\nbsadkvbsakvbsadvlksavlksdnvlkbasdlkvdslkavklsdvlksavlkasdnvklsanvlkasnklvnsaklvnsakvnsalkvnlkasvnlkasvnlkdsanvlkasndlvknsadklvndkslanvlksanvlksnavlkndsavlndsavnlkasnvksanvlknsavlnsalvnksanvlkasnvklnasvlknsakvnksanvlkasnvknasknvklsanvdknkvn jhjhfjh\\n\"}]}', '{\"ops\":[{\"attributes\":{\"bold\":true},\"insert\":\"bsadkvbsakvbsadvlksavlksdnvlkbasdlkvdslkavklsdvlksavlkasdnvklsanvlkasnklvnsaklvnsakvnsa\"},{\"insert\":\"lkvnlkasvnlkasvnlkdsanvlkasndlvknsadklvndkslanvlksanvlksnavlkndsavlndsavnlkasnvksanvlknsavlnsalvnksanvlkasnvklnasvlknsakvnksanvlkasnvknasknvklsanvdknkvnsadvsavs\\n\\nbsadkvbsakvbsadvlksavlksdnvlkbasdlkvdslkavklsdvlksavlkasdnvklsanvlkasnklvnsaklvnsakvnsalkvnlkasvnlkasvnlkdsanvlkasndlvknsadklvndkslanvlksanvlksnavlkndsavlndsavnlkasnvksanvlknsavlnsalvnksanvlkasnvklnasvlknsakvnksanvlkasnvknasknvklsanvdknkvn\\nbsadkvbsakvbsadvlksavlksdnvlkbasdlkvdslkavklsdvlksavlkasdnvklsanvlkasnklvnsaklvnsakvnsalkvnlkasvnlkasvnlkdsanvlkasndlvknsadklvndkslanvlksanvlksnavlkndsavlndsavnlkasnvksanvlknsavlnsalvnksanvlkasnvklnasvlknsakvnksanvlkasnvknasknvklsanvdknkvnbsadkvbsakvbsadvlksavlksdnvlkbasdlkvdslkavklsdvlksavlkasdnvklsanvlkasnklvnsaklvnsakvnsalkvnlkasvnlkasvnlkdsanvlkasndlvknsadklvndkslanvlksanvlksnavlkndsavlndsavnlkasnvksanvlknsavlnsalvnksanvlkasnvklnasvlknsakvnksanvlkasnvknasknvklsanvdknkvn\\nbsadkvbsakvbsadvlksavlksdnvlkbasdlkvdslkavklsdvlksavlkasdnvklsanvlkasnklvnsaklvnsakvnsalkvnlkasvnlkasvnlkdsanvlkasndlvknsadklvndkslanvlksanvlksnavlkndsavlndsavnlkasnvksanvlknsavlnsalvnksanvlkasnvklnasvlknsakvnksanvlkasnvknasknvklsanvdknkvnbsadkvbsakvbsadvlksavlksdnvlkbasdlkvdslkavklsdvlksavlkasdnvklsanvlkasnklvnsaklvnsakvnsalkvnlkasvnlkasvnlkdsanvlkasndlvknsadklvndkslanvlksanvlksnavlkndsavlndsavnlkasnvksanvlknsavlnsalvnksanvlkasnvklnasvlknsakvnksanvlkasnvknasknvklsanvdknkvn\\n\\nbsadkvbsakvbsadvlksavlksdnvlkbasdlkvdslkavklsdvlksavlkasdnvklsanvlkasnklvnsaklvnsakvnsalkvnlkasvnlkasvnlkdsanvlkasndlvknsadklvndkslanvlksanvlksnavlkndsavlndsavnlkasnvksanvlknsavlnsalvnksanvlkasnvklnasvlknsakvnksanvlkasnvknasknvklsanvdknkvn jhjhfjh\\n\"}]}', '2026-05-14 21:19:40', '2026-05-14 21:19:40'),
(3, 4, 1, '{\"ops\":[{\"insert\":\"sadd assadsavsasavsadvsavasvsvdsvsavsavsvdasvdsavsdav\\ndsshdvihsavdsvdsavsvsvdsvs vdfssdbdsbsddsavsavvavd sdavsaas\\n\\nsdsadvs hdggfgfsgfserwr hjjhfkfhghgfhjhjchg\\n\"}]}', '{\"ops\":[{\"insert\":\"sadd assadsavsasavsadvsavasvsvdsvsavsavsvdasvdsavsdav\\ndsshdvihsavdsvdsavsvsvdsvs vdfssdbdsbsddsavsavvavd sdavsaas\\n\\nsdsadvs hdggfgfsgfserwr hjjhfkfhghgfhjhjchg\\n\"}]}', '2026-05-14 21:21:13', '2026-05-14 21:21:13'),
(5, 4, 5, '{\"ops\":[{\"insert\":\"sadd assadsavsasavsadvsavasvsvdsvsavsavsvdasvdsavsdav\\ndsshdvihsavdsvdsavsvsvdsvs vdfssdbdsbsddsavsavvavd sdavsaas\\n\\nsdsadvs hdggfgfsgfserwr hjjhfkfhghgfhjhjchg jadi gini\\n\"}]}', '{\"ops\":[{\"insert\":\"sadd assadsavsasavsadvsavasvsvdsvsavsavsvdasvdsavsdav\\ndsshdvihsavdsvdsavsvsvdsvs vdfssdbdsbsddsavsavvavd sdavsaas\\n\\nsdsadvs hdggfgfsgfserwr hjjhfkfhghgfhjhjchg jadi gini\\n\"}]}', '2026-05-18 12:12:03', '2026-05-18 12:12:03');

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
('0iGXIxhPxERbdeKCr6jI4LqLjl34ow07vF4qSuSv', NULL, '127.0.0.1', 'WhatsApp/2.2616.100 W', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWTBDZDA1eFl0c1RySGtFNGVhdXk3T25sdm9GMGhNemZzeVlsR0RCUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9zcG91c2FsLWNhdXRlcml6ZS10cmFjay5uZ3Jvay1mcmVlLmRldi9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1779131383),
('DbzuoJqsBDgDu23o6PgfMfHtdD7iphKYFTtHG9wi', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQW1zMW9BN0RJbDFtaU5FNzRkeUdxMkZDZlF1TnFPdktjYWNYSHozcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1779128737),
('M9f3hzQl3aJ62GKRe3B4MhX2sYjhcefOu13ICvyR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidmlhM3hkNzROYnJKMHd6TjAyNG1JTkdXWHVwS3Y1VXo5eGJEcWVuUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9zcG91c2FsLWNhdXRlcml6ZS10cmFjay5uZ3Jvay1mcmVlLmRldi9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6NTU6Imh0dHA6Ly9zcG91c2FsLWNhdXRlcml6ZS10cmFjay5uZ3Jvay1mcmVlLmRldi9kYXNoYm9hcmQiO319', 1779131356),
('uZ57YmQZ5623UnzxMJ0BoHnS7x5lX3OHBNRPLAu2', 5, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/136.0.7103.91 Mobile/15E148 Safari/604.1', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiclk3RU5VeGRKU3ZSRTQ0N2c1bUFPMkhyaFZRVHFwSWRTYmQ2OUZuRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9zcG91c2FsLWNhdXRlcml6ZS10cmFjay5uZ3Jvay1mcmVlLmRldi9ub3Rlcy80IjtzOjU6InJvdXRlIjtzOjEwOiJub3Rlcy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NTt9', 1779131561),
('VclowCtBSDchrtoL2CSwrICGuBYEHcdEq8HYDc6G', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZER2UHF2UGZRbmdweVhNWU45Y0NocTNiZU1SV09Bc2hZYkRsZG9UdCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1779128740),
('znaaKkBWGp2ot0rEDPHeHsPF4934f5msGrWUIKO1', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUHZkdjBSMWlJbE4za0JwQXM5eldSVWhSaUF6UWxrWWw4ZzJUSE9YZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9zcG91c2FsLWNhdXRlcml6ZS10cmFjay5uZ3Jvay1mcmVlLmRldi9ub3Rlcy80IjtzOjU6InJvdXRlIjtzOjEwOiJub3Rlcy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1779131937);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'kania', 'kania@gmail.com', NULL, '$2y$12$vtk2IUI6TFC1cQSBpmFvHOpcp.so0aYdQN2FvxDFNDMYLv/jLRZXy', NULL, '2026-05-10 01:52:24', '2026-05-10 01:52:24'),
(2, 'mia', 'mia@gmail.com', NULL, '$2y$12$I9FwHEJDV/eHYf2gsF9L.e4ccrK4AB46tGYMMexZ6bL8Nur/0BSNK', NULL, '2026-05-10 01:54:32', '2026-05-10 01:54:32'),
(4, 'kania', 'kania12@gmail.com', NULL, '$2y$12$qBsKGOQCmKPoDqq/adPLS.iNI6lLHRSbGGlygMlOpO0C5oW0cUTGS', NULL, '2026-05-18 07:48:16', '2026-05-18 07:48:16'),
(5, 'adila kania', 'kania6@gmail.com', NULL, '$2y$12$Nr19G3UE7SHAfGoY.Ob4J.xagU83tn5iL3w3/mVueZCQW0yfEaqHW', NULL, '2026-05-18 12:10:30', '2026-05-18 12:10:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_event_note_id_foreign` (`event_note_id`),
  ADD KEY `activity_logs_user_id_foreign` (`user_id`);

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
-- Indexes for table `collaborators`
--
ALTER TABLE `collaborators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collaborators_event_note_id_foreign` (`event_note_id`),
  ADD KEY `collaborators_user_id_foreign` (`user_id`);

--
-- Indexes for table `cursor_positions`
--
ALTER TABLE `cursor_positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cursor_positions_event_note_id_foreign` (`event_note_id`),
  ADD KEY `cursor_positions_user_id_foreign` (`user_id`);

--
-- Indexes for table `event_notes`
--
ALTER TABLE `event_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_notes_owner_id_foreign` (`owner_id`);

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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_event_note_id_foreign` (`event_note_id`),
  ADD KEY `revisions_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `collaborators`
--
ALTER TABLE `collaborators`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cursor_positions`
--
ALTER TABLE `cursor_positions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_notes`
--
ALTER TABLE `event_notes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_event_note_id_foreign` FOREIGN KEY (`event_note_id`) REFERENCES `event_notes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `collaborators`
--
ALTER TABLE `collaborators`
  ADD CONSTRAINT `collaborators_event_note_id_foreign` FOREIGN KEY (`event_note_id`) REFERENCES `event_notes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `collaborators_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cursor_positions`
--
ALTER TABLE `cursor_positions`
  ADD CONSTRAINT `cursor_positions_event_note_id_foreign` FOREIGN KEY (`event_note_id`) REFERENCES `event_notes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cursor_positions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event_notes`
--
ALTER TABLE `event_notes`
  ADD CONSTRAINT `event_notes_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `revisions_event_note_id_foreign` FOREIGN KEY (`event_note_id`) REFERENCES `event_notes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `revisions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
