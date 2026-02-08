-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2026 at 04:57 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skillbater`
--

-- --------------------------------------------------------

--
-- Table structure for table `skill_requests`
--

CREATE TABLE `skill_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_user` bigint(20) UNSIGNED NOT NULL,
  `to_user` bigint(20) UNSIGNED NOT NULL,
  `skill_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','accepted','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skill_requests`
--

INSERT INTO `skill_requests` (`id`, `from_user`, `to_user`, `skill_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 'pending', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `skill_requests`
--
ALTER TABLE `skill_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `skill_requests_from_user_foreign` (`from_user`),
  ADD KEY `skill_requests_to_user_foreign` (`to_user`),
  ADD KEY `skill_requests_skill_id_foreign` (`skill_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `skill_requests`
--
ALTER TABLE `skill_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `skill_requests`
--
ALTER TABLE `skill_requests`
  ADD CONSTRAINT `skill_requests_from_user_foreign` FOREIGN KEY (`from_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `skill_requests_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `skill_requests_to_user_foreign` FOREIGN KEY (`to_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
