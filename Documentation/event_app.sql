-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table event_app.events
CREATE TABLE IF NOT EXISTS `events` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `venue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `start_at` date NOT NULL,
  `end_at` date NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `events_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_app.events: ~8 rows (approximately)
INSERT INTO `events` (`id`, `name`, `slug`, `venue`, `description`, `start_at`, `end_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
	('3168cf41-db98-437f-99d2-30e81deeeba0', 'Enterprise-wide Transitional GraphicInterface', 'enterprise-wide-transitional-graphicinterface', '6022 Walsh Village', 'Non et at qui debitis. Et omnis accusamus consequuntur.', '2022-10-22', '2022-11-21', '2022-11-17 01:15:55', '2022-11-17 01:15:55', NULL),
	('33862c90-b161-42de-813c-dec3aaab9de5', 'Managed Systemic Paradigm', 'managed-systemic-paradigm', '9028 Ruecker Bypass Suite 248', 'Architecto qui eos itaque. Et impedit repudiandae voluptatibus nihil quis itaque. Quos consequatur laboriosam deleniti error ut.', '2022-12-04', '2023-01-06', '2022-11-17 01:15:55', '2022-11-17 01:15:55', NULL),
	('45627b48-e25d-4a0e-ace6-97a48bc3a654', 'Synergistic Context-sensitive Capability', 'synergistic-context-sensitive-capability', '966 Goyette Burg', 'Magni accusantium et repellendus veniam ratione sit sequi. Sunt animi praesentium eius dolore recusandae quam provident. Blanditiis ut facilis soluta eos.', '2022-12-13', '2023-01-09', '2022-11-17 01:15:55', '2022-11-17 01:15:55', NULL),
	('70a3c760-fb24-4fb4-a46f-d1a7c3f5a1dc', 'Profit-focused Real-time Methodology', 'profit-focused-real-time-methodology', '3350 Ryan Crossing', 'Nostrum sequi sit eveniet dolores cupiditate et et. Ipsa incidunt eligendi aliquam rerum.', '2022-12-25', '2023-01-04', '2022-11-17 01:15:55', '2022-11-17 01:15:55', NULL),
	('747a5beb-6ca4-458d-8f77-65f00faa20ee', 'Operative Homogeneous GraphicalUserInterface', 'operative-homogeneous-graphicaluserinterface', '244 Angel Locks', 'Neque qui debitis quaerat laboriosam consequatur rerum. Autem voluptate nulla maxime velit voluptatem cum nesciunt consequatur.', '2022-10-22', '2022-12-20', '2022-11-17 01:15:55', '2022-11-17 01:15:55', NULL),
	('76e915c7-2177-4b29-bae7-07b9fb11c809', 'Enhanced Contextually-based Emulation', 'enhanced-contextually-based-emulation', '53919 Bradly Plaza', 'Voluptatem nesciunt fuga eveniet harum. Distinctio ea veniam repudiandae est soluta dolor. Sit voluptate repellendus eius unde corrupti.', '2022-12-09', '2023-01-07', '2022-11-17 01:15:55', '2022-11-17 01:15:55', NULL),
	('ae268746-c858-47ba-b885-d245bfec512e', 'Re-contextualized Regional Standardization', 're-contextualized-regional-standardization', '821 Hane Spring', 'Sed quam incidunt reprehenderit ratione asperiores beatae ipsam illo. Repellat sint provident assumenda delectus distinctio. Esse earum qui blanditiis neque esse distinctio rerum voluptatem.', '2022-10-30', '2022-12-26', '2022-11-17 01:15:55', '2022-11-17 01:15:55', NULL),
	('e165f901-3215-4716-8607-418aff2fa43d', 'Synergized Executive Definition', 'synergized-executive-definition', '98191 Sigrid Streets', 'Tempore quia sint delectus esse quidem. Laborum numquam nostrum porro quia qui animi praesentium dolor.', '2022-10-14', '2022-10-27', '2022-11-17 01:15:55', '2022-11-17 01:15:55', NULL);

-- Dumping structure for table event_app.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_app.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table event_app.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_app.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
	(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
	(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
	(6, '2016_06_01_000004_create_oauth_clients_table', 1),
	(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
	(8, '2019_08_19_000000_create_failed_jobs_table', 1),
	(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(10, '2022_11_16_034716_create_events_table', 1);

-- Dumping structure for table event_app.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_app.oauth_access_tokens: ~0 rows (approximately)

-- Dumping structure for table event_app.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_app.oauth_auth_codes: ~0 rows (approximately)

-- Dumping structure for table event_app.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_app.oauth_clients: ~0 rows (approximately)

-- Dumping structure for table event_app.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_app.oauth_personal_access_clients: ~0 rows (approximately)

-- Dumping structure for table event_app.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_app.oauth_refresh_tokens: ~0 rows (approximately)

-- Dumping structure for table event_app.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_app.password_resets: ~0 rows (approximately)

-- Dumping structure for table event_app.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_app.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table event_app.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `place_of_birth` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` tinyint NOT NULL DEFAULT '0' COMMENT '0:User, 1:Admin',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_app.users: ~6 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `address`, `password`, `place_of_birth`, `date_of_birth`, `phone_number`, `role`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Admin McKenzie', 'admin@example.com', NULL, '8410 Calista Centers Suite 583', '$2y$10$LZHKcZ78pzRU2CoZPV4FkOtxF3tM3pP8YZVbfKTFFLh6.ZSElDkkO', 'East Lennaton', '2014-08-15', '+1.229.695.4104', 1, NULL, '2022-11-17 01:15:55', '2022-11-17 01:15:55', NULL),
	(2, 'User1 Marquis Bruen', 'user1@example.com', NULL, '640 Welch Parkway', '$2y$10$aOjQkRtY5LfQ2f20m4FoOeXmiRGdHBVfGx.nGHuElAu3RekUqZEuy', 'Nyahshire', '1988-05-27', '+13393398894', 0, NULL, '2022-11-17 01:15:55', '2022-11-17 01:15:55', NULL),
	(3, 'User2 Johnny Casper', 'user2@example.com', NULL, '99345 Rico Rest', '$2y$10$4NMZrGs638/cS7RodFuuMeLL0mg8PMxH8EtT/7zxknv9Bh380xUKa', 'Oberbrunnerland', '2020-07-10', '541.673.1438', 0, NULL, '2022-11-17 01:15:55', '2022-11-17 01:15:55', NULL),
	(4, 'User3 Georgianna Schaefer', 'user3@example.com', NULL, '54041 Goyette Courts', '$2y$10$xRm2RZQSV3/ryU.lMB8eBOwgAzCBi6G3My.PcNUvIszpPK5Je1mjy', 'Mollystad', '1962-09-14', '1-478-587-3973', 0, NULL, '2022-11-17 01:15:55', '2022-11-17 01:15:55', NULL),
	(5, 'User4 Lavern Grant', 'user4@example.com', NULL, '3862 Crona Brook', '$2y$10$dXcrFQGNqv1Bykyl.A8UNOSc6JC28Ezzeq8w0K.A0IGHD36wXF0V.', 'Hartmannchester', '1979-04-29', '+1-305-388-8600', 0, NULL, '2022-11-17 01:15:55', '2022-11-17 01:15:55', NULL),
	(6, 'User5 Viviane Howe', 'user5@example.com', NULL, '29317 Lera Lodge', '$2y$10$FNcraa1ZPzEeNogXquFrIO2n5NZmIM0ykZF9z8HKzZNr8dWdqvTvO', 'Port Johanntown', '2022-10-24', '860-952-3563', 0, NULL, '2022-11-17 01:15:55', '2022-11-17 01:15:55', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
