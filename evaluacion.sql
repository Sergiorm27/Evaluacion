/*
SQLyog Ultimate v9.50 
MySQL - 5.5.24-log : Database - evaluacion
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`evaluacion` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `evaluacion`;

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `peliculas` */

DROP TABLE IF EXISTS `peliculas`;

CREATE TABLE `peliculas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_publicacion` date DEFAULT NULL,
  `imagen` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `peliculas` */

insert  into `peliculas`(`id`,`nombres`,`fecha_publicacion`,`imagen`,`estado`,`created_at`,`updated_at`) values (1,'Dr. Oran Cole','1970-12-24','peliculas/eAPAXdD0wS9G8noVxtaKvwHEWgOM3fo0arUAaHZr.jpeg','true','2020-11-17 22:05:25','2020-11-28 08:04:25'),(2,'Micheal Gleason MD','2004-12-20','peliculas/eAPAXdD0wS9G8noVxtaKvwHEWgOM3fo0arUAaHZr.jpeg','true','2020-11-17 22:05:25','2020-11-17 22:05:25'),(3,'Wilton Kemmer Sr.','2011-08-18','peliculas/eAPAXdD0wS9G8noVxtaKvwHEWgOM3fo0arUAaHZr.jpeg','false','2020-11-17 22:05:25','2020-11-17 22:05:25'),(4,'Allene DuBuque','1993-09-12','peliculas/eAPAXdD0wS9G8noVxtaKvwHEWgOM3fo0arUAaHZr.jpeg','true','2020-11-17 22:05:25','2020-11-17 22:05:25');

/*Table structure for table `turnos` */

DROP TABLE IF EXISTS `turnos`;

CREATE TABLE `turnos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `peliculas_id` int(11) NOT NULL,
  `turno` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `turnos` */

insert  into `turnos`(`id`,`peliculas_id`,`turno`,`estado`,`created_at`,`updated_at`) values (1,2,'01:02','false',NULL,'2020-11-28 07:54:00'),(2,2,'03:04','true',NULL,NULL),(3,1,'03:01','true',NULL,'2020-11-28 08:07:26'),(4,1,'03:12','true',NULL,NULL),(5,1,'04:12','true',NULL,NULL),(6,2,'02:02','true',NULL,NULL),(7,2,'03:07','true',NULL,'2020-11-26 07:01:20'),(8,2,'01:01','true','2020-11-28 07:02:56','2020-11-28 07:02:56'),(9,2,'01:00','true','2020-11-28 07:04:49','2020-11-28 07:04:49'),(10,1,'01:00','true','2020-11-28 07:05:33','2020-11-28 07:05:33'),(11,1,'01:02','true','2020-11-28 07:07:24','2020-11-28 07:07:24'),(12,1,'03:01','true','2020-11-28 07:08:39','2020-11-28 07:08:39'),(13,1,'03:01','true','2020-11-28 07:09:43','2020-11-28 07:09:43'),(14,2,'02:01','true','2020-11-28 07:10:48','2020-11-28 07:10:48'),(15,1,'04:00','true','2020-11-28 07:39:22','2020-11-28 07:39:22'),(17,38,'01:02','true','2020-11-28 08:12:24','2020-11-28 08:12:24');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (1,'Sergio Reyes Mendoza','sergiorm706@gmail.com',NULL,'$2y$10$91IA.mFT/5pHYMkiQvgGuuS/9NkfNjjBwz4ZD3MoWqp84upSHG1Fm',NULL,'2020-11-27 18:28:20','2020-11-27 18:28:20');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
