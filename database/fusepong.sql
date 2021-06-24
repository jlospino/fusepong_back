-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.11-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para fusepong
CREATE DATABASE IF NOT EXISTS `fusepong` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `fusepong`;

-- Volcando estructura para tabla fusepong.companys
CREATE TABLE IF NOT EXISTS `companys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `nit` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla fusepong.companys: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `companys` DISABLE KEYS */;
INSERT INTO `companys` (`id`, `name`, `nit`, `phone`, `address`, `email`) VALUES
	(1, 'Fusepong Prueba Company', '12233455645-1', '3056987412', 'Calle 56 #89-96', 'admon@fusepong.com'),
	(2, 'Expertos en servicios', '78945612-2', '8957447', 'Carrera 22 #100-96', 'contacto@expertosservicios.com'),
	(3, 'The Company Soft', '12345678-9', '3026598747', 'Calle 57 #7-35', 'comercial@thecompanysoft.com');
/*!40000 ALTER TABLE `companys` ENABLE KEYS */;

-- Volcando estructura para tabla fusepong.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla fusepong.failed_jobs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Volcando estructura para tabla fusepong.historys
CREATE TABLE IF NOT EXISTS `historys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Project` (`project_id`),
  CONSTRAINT `FK_Project` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla fusepong.historys: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `historys` DISABLE KEYS */;
INSERT INTO `historys` (`id`, `name`, `project_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(20, 'Visualizar vacaciones', 1, 7, '2021-06-23 20:11:00', '2021-06-23 20:11:00'),
	(21, 'Solicitar vacaciones', 1, 7, '2021-06-23 20:11:55', '2021-06-23 20:11:55'),
	(22, 'Consultar vacaciones solicitadas', 1, 7, '2021-06-23 20:13:16', '2021-06-23 20:13:16'),
	(23, 'Buscar hoteles', 2, 7, '2021-06-23 20:23:04', '2021-06-23 20:23:04'),
	(24, 'Buscar vuelos', 2, 7, '2021-06-23 21:02:13', '2021-06-23 21:02:13'),
	(25, 'Ver detalle hoteles', 2, 7, '2021-06-23 21:03:54', '2021-06-23 21:03:54'),
	(26, 'Solicitar certificado laboral', 3, 20, '2021-06-23 21:53:42', '2021-06-23 21:53:42'),
	(27, 'Desprendible de nómina', 3, 20, '2021-06-23 21:54:48', '2021-06-23 21:54:48'),
	(28, 'Actualizar información de usuario', 3, 20, '2021-06-23 22:01:53', '2021-06-23 22:01:53');
/*!40000 ALTER TABLE `historys` ENABLE KEYS */;

-- Volcando estructura para tabla fusepong.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla fusepong.migrations: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
	(5, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
	(6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
	(7, '2016_06_01_000004_create_oauth_clients_table', 2),
	(8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla fusepong.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla fusepong.oauth_access_tokens: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('55f51e0c69fbd5ff9041f9d7af2496a2efbd4a0ecac2424ba5d004ff594e2c0c0123a63d88f12471', 7, 2, NULL, '[]', 1, '2021-06-24 02:37:56', '2021-06-24 02:37:56', '2022-06-24 02:37:56'),
	('596c7c26c187ff02c9831df2409c0f00e7a2b68471e01d6d61755f6f24f1c920ba6e98d00a83ceb0', 7, 2, NULL, '[]', 1, '2021-06-24 02:21:37', '2021-06-24 02:21:37', '2022-06-24 02:21:37');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- Volcando estructura para tabla fusepong.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla fusepong.oauth_auth_codes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- Volcando estructura para tabla fusepong.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla fusepong.oauth_clients: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Laravel Personal Access Client', 'lPiKF3yQ6OBEhMQNUA9uJD68yEEXX417BZkl3xKn', NULL, 'http://localhost', 1, 0, 0, '2021-06-20 16:15:42', '2021-06-20 16:15:42'),
	(2, NULL, 'Laravel Password Grant Client', 'OXkRbL3MgGNxzq2zubTDfbre0n46mNrnwBfYha3C', 'users', 'http://localhost', 0, 1, 0, '2021-06-20 16:15:42', '2021-06-20 16:15:42');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Volcando estructura para tabla fusepong.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla fusepong.oauth_personal_access_clients: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2021-06-20 16:15:42', '2021-06-20 16:15:42');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Volcando estructura para tabla fusepong.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla fusepong.oauth_refresh_tokens: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
	('4e691b6b3d3c84cbb242b2013b21b2b2273795722b12f01a9bc8ebee3e3de7a08dd33b4099e51abb', '55f51e0c69fbd5ff9041f9d7af2496a2efbd4a0ecac2424ba5d004ff594e2c0c0123a63d88f12471', 0, '2022-06-24 02:37:56'),
	('82c67db864e925ea95027f81bf0d5e41b9bf32f01b8e0d2eea6bd8d9b32a43dcf281e05fe0772e5c', '596c7c26c187ff02c9831df2409c0f00e7a2b68471e01d6d61755f6f24f1c920ba6e98d00a83ceb0', 0, '2022-06-24 02:21:37');
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

-- Volcando estructura para tabla fusepong.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla fusepong.password_resets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla fusepong.projects
CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(800) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Company` (`company_id`),
  CONSTRAINT `FK_Company` FOREIGN KEY (`company_id`) REFERENCES `companys` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla fusepong.projects: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` (`id`, `name`, `description`, `company_id`, `created_at`, `updated_at`) VALUES
	(1, 'Vacaciones Empleados', 'Este proyectó permitirá a los empleados realizar la solicitud de sus vacaciones, permisos y ausentismos', 3, '2021-06-23 14:02:21', NULL),
	(2, 'Sitio Web Turismo', 'EL sitio permitirá al usuario realizar cotizaciones y posteriormente reservas de vuelos, hoteles y paquetes turisticos', 3, '2021-06-23 14:04:21', NULL),
	(3, 'Certificados en Linea', 'Solicitud de certificados labora, desprendibles de pagos, comprobante de liquidación', 1, '2021-06-23 14:06:21', NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;

-- Volcando estructura para tabla fusepong.tickets
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `history_id` int(11) NOT NULL,
  `state` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_History_Ticket` (`history_id`),
  CONSTRAINT `FK_History_Ticket` FOREIGN KEY (`history_id`) REFERENCES `historys` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla fusepong.tickets: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` (`id`, `name`, `history_id`, `state`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(41, 'El sistema debe permitir al usuario visualizar los días de vacaciones generados', 20, 'finalizado', '2021-06-23 20:11:00', '2021-06-23 20:15:31', NULL),
	(42, 'El sistema notificará por medio de un correo electrónico al empleado y al empleador de las vacaciones solicitadas', 21, 'activo', '2021-06-23 20:11:55', '2021-06-23 20:19:34', NULL),
	(43, 'El empleado podrá consultar las vacaciones solicitadas', 22, 'activo', '2021-06-23 20:13:16', '2021-06-23 20:13:16', NULL),
	(44, 'El sistema deberá mostrar al usuario un campo de selección con el fin de poder filtrar el listado por estado', 20, 'activo', '2021-06-23 20:14:49', '2021-06-23 20:20:18', NULL),
	(45, 'El sistema permitirá la solicitud de vacaciones por medio de un formulario en el cual se debe anexar el motivo, la fecha de inicio y final de las vacaciones', 21, 'en proceso', '2021-06-23 20:16:48', '2021-06-23 20:16:48', NULL),
	(46, 'El sitio permitirá al usuario realizar la búsqueda de hoteles por medio de un formulario que contendrá: ciudad de destino, fecha inicio y fin, número de noches y cantidad de niños y adultos', 23, 'activo', '2021-06-23 20:23:04', '2021-06-23 20:23:04', NULL),
	(47, 'El sistema permitirá al usuario realizar la búsqueda de vuelos por medio de un formulario, este formulario tendrá el campo lugar origen, lugar destino, fecha de ida y vuelta y cantidad de pasajeros', 24, 'activo', '2021-06-23 21:02:13', '2021-06-23 21:02:13', NULL),
	(48, 'El sistema permitirá la visualización del detalle de un hotel seleccionado', 25, 'en proceso', '2021-06-23 21:03:54', '2021-06-23 21:03:54', NULL),
	(49, 'En el detalle del hotel se debe mostrar un formulario en el cual se diligenciará la información de los pasajeros, dicha información será nombre, email, teléfono y fecha de nacimiento', 25, 'finalizado', '2021-06-23 21:05:57', '2021-06-23 21:05:57', NULL),
	(50, 'En la vista de detalle deberá aparecer también el formulario de pago, aceptará diferentes medios de pago.', 25, 'activo', '2021-06-23 21:16:02', '2021-06-24 01:49:11', NULL),
	(51, 'El sistema permitirá al usuario realizar la solicitud del certificado por medio de un formulario', 26, 'finalizado', '2021-06-23 21:53:42', '2021-06-23 21:53:42', NULL),
	(52, 'El sistema de permitir al usuario administrador realizar el cargue de los desprendibles de pago quincenales de los usuarios existentes', 27, 'finalizado', '2021-06-23 21:54:48', '2021-06-23 21:54:48', NULL),
	(53, 'El sistema permitirá al usuario consultar los desprendibles de nómina previamente cargados por el administrador', 27, 'en proceso', '2021-06-23 21:55:17', '2021-06-23 21:55:17', NULL),
	(54, 'Al realizar la consulta de los desprendibles, el sistema debe permitir filtrar esta información por mes y año, este filtro se realiza por medio de dos campos de selección (mes y año)', 27, 'en proceso', '2021-06-23 21:56:32', '2021-06-23 21:56:32', NULL),
	(55, 'El aplicativo debe permitir al usuario editar la información básica a modo de perfil', 28, 'activo', '2021-06-23 22:01:53', '2021-06-23 22:01:53', NULL);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;

-- Volcando estructura para tabla fusepong.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `FK_CompanyUser` (`company_id`),
  CONSTRAINT `FK_CompanyUser` FOREIGN KEY (`company_id`) REFERENCES `companys` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla fusepong.users: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `company_id`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(7, 'Jose Ospino Cueva', 'ospinojose36@gmail.com', 3, NULL, '$2y$10$2aAx59yvhus4vbOwiTpYf.JDm97Q1N4qMOvcYqW7t7h8mQ371nsY6', NULL, '2021-06-23 18:57:23', '2021-06-23 18:57:23'),
	(20, 'Usuario Prueba', 'prueba@prueba.com', 1, NULL, '$2y$10$GR3/7HksG/ZSfhGw1AE9UObmKT5IFRRccEXwQqxWVbTKqoKpjt8WK', NULL, '2021-06-23 21:41:19', '2021-06-23 21:41:19');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
