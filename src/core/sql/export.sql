-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 06, 2026 at 02:55 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rc_savora`
--

-- --------------------------------------------------------

--
-- Table structure for table `core_ai_page`
--

DROP TABLE IF EXISTS `core_ai_page`;
CREATE TABLE IF NOT EXISTS `core_ai_page` (
  `id_ai_page` int NOT NULL AUTO_INCREMENT,
  `id_page` int NOT NULL,
  `prompt` text NOT NULL,
  PRIMARY KEY (`id_ai_page`),
  KEY `id_page` (`id_page`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_ai_page`
--

INSERT INTO `core_ai_page` (`id_ai_page`, `id_page`, `prompt`) VALUES
(1, 7, 'Generate simple modern static contact page for recipe sharing website. Do not include contact form');

-- --------------------------------------------------------

--
-- Table structure for table `core_domain`
--

DROP TABLE IF EXISTS `core_domain`;
CREATE TABLE IF NOT EXISTS `core_domain` (
  `id_domain` int NOT NULL AUTO_INCREMENT,
  `protocol` varchar(8) NOT NULL DEFAULT 'http',
  `host` varchar(255) NOT NULL,
  `port` int NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `cost` int NOT NULL DEFAULT '1',
  `is_enabled` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_external_page`
--

DROP TABLE IF EXISTS `core_external_page`;
CREATE TABLE IF NOT EXISTS `core_external_page` (
  `id_external_page` int NOT NULL AUTO_INCREMENT,
  `id_page` int NOT NULL,
  `url` varchar(1024) NOT NULL,
  PRIMARY KEY (`id_external_page`),
  KEY `id_page` (`id_page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_fs_directory`
--

DROP TABLE IF EXISTS `core_fs_directory`;
CREATE TABLE IF NOT EXISTS `core_fs_directory` (
  `id_fs_directory` int NOT NULL AUTO_INCREMENT,
  `id_fs_parent` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_fs_directory`),
  KEY `id_fs_parent` (`id_fs_parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_fs_file`
--

DROP TABLE IF EXISTS `core_fs_file`;
CREATE TABLE IF NOT EXISTS `core_fs_file` (
  `id_fs_file` int NOT NULL AUTO_INCREMENT,
  `id_fs_parent` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `extension` varchar(16) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `type` varchar(128) NOT NULL,
  `size` mediumtext NOT NULL,
  PRIMARY KEY (`id_fs_file`),
  KEY `id_fs_parent` (`id_fs_parent`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_fs_file`
--

INSERT INTO `core_fs_file` (`id_fs_file`, `id_fs_parent`, `name`, `extension`, `hash`, `type`, `size`) VALUES
(2, NULL, 'cooking', 'jpg', '7c4f315b245cb555bd0b502d29ad1485c5edd02fb40d54d4a5e36f634b8dac88', 'image/jpeg', '2919218');

-- --------------------------------------------------------

--
-- Table structure for table `core_fs_image_variant`
--

DROP TABLE IF EXISTS `core_fs_image_variant`;
CREATE TABLE IF NOT EXISTS `core_fs_image_variant` (
  `id_fs_image_variant` int NOT NULL AUTO_INCREMENT,
  `transformer` varchar(255) NOT NULL,
  `version` int DEFAULT '1',
  `quality` float DEFAULT '1',
  `function` varchar(255) NOT NULL,
  `width` int DEFAULT '-1',
  `height` int DEFAULT '-1',
  PRIMARY KEY (`id_fs_image_variant`),
  UNIQUE KEY `transformer` (`transformer`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_fs_image_variant`
--

INSERT INTO `core_fs_image_variant` (`id_fs_image_variant`, `transformer`, `version`, `quality`, `function`, `width`, `height`) VALUES
(1, 'full-hd', 1, 1, 'fit', 1920, 1080),
(2, 'hd', 1, 1, 'fit', 1280, 720);

-- --------------------------------------------------------

--
-- Table structure for table `core_fs_shortcut`
--

DROP TABLE IF EXISTS `core_fs_shortcut`;
CREATE TABLE IF NOT EXISTS `core_fs_shortcut` (
  `id_fs_shortcut` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_fs_file` int NOT NULL,
  PRIMARY KEY (`id_fs_shortcut`),
  UNIQUE KEY `name` (`name`),
  KEY `id_fs_file` (`id_fs_file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_group`
--

DROP TABLE IF EXISTS `core_group`;
CREATE TABLE IF NOT EXISTS `core_group` (
  `id_group` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `is_editable` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_group`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_group`
--

INSERT INTO `core_group` (`id_group`, `name`, `is_editable`) VALUES
(1, 'Default', 0),
(2, 'Root', 0),
(3, 'Admin', 0),
(4, 'Editor', 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_groups_x_resources`
--

DROP TABLE IF EXISTS `core_groups_x_resources`;
CREATE TABLE IF NOT EXISTS `core_groups_x_resources` (
  `id_group` int NOT NULL,
  `id_resource` int NOT NULL,
  `id_privilege` int NOT NULL,
  UNIQUE KEY `id_group` (`id_group`,`id_resource`,`id_privilege`),
  KEY `id_resource` (`id_resource`),
  KEY `id_privilege` (`id_privilege`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_groups_x_resources`
--

INSERT INTO `core_groups_x_resources` (`id_group`, `id_resource`, `id_privilege`) VALUES
(4, 2, 1),
(4, 2, 2),
(4, 2, 3),
(4, 3, 1),
(4, 3, 2),
(4, 3, 3),
(4, 6, 1),
(4, 6, 2),
(4, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `core_language`
--

DROP TABLE IF EXISTS `core_language`;
CREATE TABLE IF NOT EXISTS `core_language` (
  `id_language` int NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_language`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_language`
--

INSERT INTO `core_language` (`id_language`, `code`, `is_default`) VALUES
(1, 'en-US', 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_lexicon`
--

DROP TABLE IF EXISTS `core_lexicon`;
CREATE TABLE IF NOT EXISTS `core_lexicon` (
  `id_phrase` int NOT NULL AUTO_INCREMENT,
  `id_lexicon_group` int NOT NULL,
  `default` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_phrase`),
  KEY `id_lexicon_group` (`id_lexicon_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_lexicon_group`
--

DROP TABLE IF EXISTS `core_lexicon_group`;
CREATE TABLE IF NOT EXISTS `core_lexicon_group` (
  `id_lexicon_group` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_lexicon_group`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_lexicon_rule`
--

DROP TABLE IF EXISTS `core_lexicon_rule`;
CREATE TABLE IF NOT EXISTS `core_lexicon_rule` (
  `id_rule` int NOT NULL AUTO_INCREMENT,
  `rule` varchar(255) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_rule`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_lexicon_rule`
--

INSERT INTO `core_lexicon_rule` (`id_rule`, `rule`, `label`) VALUES
(1, '/.*/', '*'),
(2, '/^1$/', '1'),
(3, '/^[2-4]$/', '2-4'),
(4, '/^0|[2-9]|\\d{2,}$/', '0, 2+'),
(5, '/^0|[5-9]|\\d{2,}$/', '0, 5+');

-- --------------------------------------------------------

--
-- Table structure for table `core_lexicon_translation`
--

DROP TABLE IF EXISTS `core_lexicon_translation`;
CREATE TABLE IF NOT EXISTS `core_lexicon_translation` (
  `id_translation` int NOT NULL AUTO_INCREMENT,
  `id_phrase` int NOT NULL,
  `id_language` int NOT NULL,
  `translation` text NOT NULL,
  `id_rule` int DEFAULT NULL,
  PRIMARY KEY (`id_translation`),
  KEY `id_phrase` (`id_phrase`),
  KEY `id_language` (`id_language`),
  KEY `id_rule` (`id_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_menu`
--

DROP TABLE IF EXISTS `core_menu`;
CREATE TABLE IF NOT EXISTS `core_menu` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id_menu`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_menu`
--

INSERT INTO `core_menu` (`id_menu`, `name`) VALUES
(1, 'Header'),
(2, 'Footer'),
(3, 'Legal');

-- --------------------------------------------------------

--
-- Table structure for table `core_menu_x_pages`
--

DROP TABLE IF EXISTS `core_menu_x_pages`;
CREATE TABLE IF NOT EXISTS `core_menu_x_pages` (
  `id_menu` int NOT NULL,
  `id_page` int NOT NULL,
  UNIQUE KEY `id_menu` (`id_menu`,`id_page`),
  KEY `id_page` (`id_page`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_menu_x_pages`
--

INSERT INTO `core_menu_x_pages` (`id_menu`, `id_page`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 7),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `core_module`
--

DROP TABLE IF EXISTS `core_module`;
CREATE TABLE IF NOT EXISTS `core_module` (
  `identifier` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_navigation`
--

DROP TABLE IF EXISTS `core_navigation`;
CREATE TABLE IF NOT EXISTS `core_navigation` (
  `id_slug` int NOT NULL AUTO_INCREMENT,
  `id_navigation_context` int NOT NULL,
  `id_parent` int DEFAULT NULL,
  `id_language` int NOT NULL,
  `slug` varchar(255) NOT NULL,
  `id_navigation_factory` int DEFAULT NULL,
  `data` varchar(255) DEFAULT '',
  PRIMARY KEY (`id_slug`),
  UNIQUE KEY `id_navigation_context` (`id_navigation_context`,`id_parent`,`id_language`,`slug`),
  KEY `id_parent` (`id_parent`),
  KEY `id_language` (`id_language`),
  KEY `id_navigation_factory` (`id_navigation_factory`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_navigation`
--

INSERT INTO `core_navigation` (`id_slug`, `id_navigation_context`, `id_parent`, `id_language`, `slug`, `id_navigation_factory`, `data`) VALUES
(1, 1, NULL, 1, 'recipe-categories', 1, '1'),
(2, 1, 1, 1, 'appetizers', 1, '2'),
(3, 1, 1, 1, 'main-courses', 1, '3'),
(4, 1, 1, 1, 'desserts', 1, '4'),
(5, 1, NULL, 1, 'cooking-tips', 1, '5'),
(7, 1, NULL, 1, 'contact-us', 1, '7'),
(8, 1, 2, 1, 'bruschetta', 1, '8'),
(9, 1, 2, 1, 'stuffed-mushrooms', 1, '9'),
(10, 1, 2, 1, 'spring-rolls', 1, '10'),
(11, 1, 3, 1, 'grilled-chicken', 1, '11'),
(12, 1, 3, 1, 'beef-stir-fry', 1, '12'),
(13, 1, 3, 1, 'pasta-alfredo', 1, '13'),
(14, 1, 4, 1, 'cheesecake', 1, '14'),
(15, 1, 4, 1, 'fruit-tart', 1, '15'),
(16, 1, NULL, 1, 'dummy', 1, '16');

-- --------------------------------------------------------

--
-- Table structure for table `core_navigation_context`
--

DROP TABLE IF EXISTS `core_navigation_context`;
CREATE TABLE IF NOT EXISTS `core_navigation_context` (
  `id_navigation_context` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_navigation_context`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_navigation_context`
--

INSERT INTO `core_navigation_context` (`id_navigation_context`, `name`) VALUES
(1, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `core_navigation_factory`
--

DROP TABLE IF EXISTS `core_navigation_factory`;
CREATE TABLE IF NOT EXISTS `core_navigation_factory` (
  `id_navigation_factory` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_navigation_factory`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_navigation_factory`
--

INSERT INTO `core_navigation_factory` (`id_navigation_factory`, `name`) VALUES
(1, 'page');

-- --------------------------------------------------------

--
-- Table structure for table `core_page`
--

DROP TABLE IF EXISTS `core_page`;
CREATE TABLE IF NOT EXISTS `core_page` (
  `id_page` int NOT NULL AUTO_INCREMENT,
  `id_page_parent` int DEFAULT NULL,
  `id_page_template` int NOT NULL,
  `id_page_status` int NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP,
  `publish` datetime DEFAULT NULL,
  `remove` datetime DEFAULT NULL,
  `priority` int DEFAULT '0',
  PRIMARY KEY (`id_page`),
  KEY `id_page_template` (`id_page_template`),
  KEY `id_page_status` (`id_page_status`),
  KEY `priority` (`priority`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_page`
--

INSERT INTO `core_page` (`id_page`, `id_page_parent`, `id_page_template`, `id_page_status`, `created`, `updated`, `publish`, `remove`, `priority`) VALUES
(1, NULL, 4, 2, '2026-04-26 16:15:23', '2026-04-27 09:05:21', NULL, NULL, 0),
(2, 1, 4, 2, '2026-04-26 16:15:23', '2026-04-27 09:06:08', NULL, NULL, 0),
(3, 1, 4, 2, '2026-04-26 16:15:23', '2026-04-27 09:06:23', NULL, NULL, 1),
(4, 1, 4, 2, '2026-04-26 16:15:23', '2026-04-27 09:06:31', NULL, NULL, 2),
(5, NULL, 1, 2, '2026-04-26 16:15:23', '2026-04-27 15:15:28', NULL, NULL, 1),
(7, NULL, 2, 2, '2026-04-26 16:15:23', '2026-04-26 14:21:31', NULL, NULL, 3),
(8, 2, 3, 2, '2026-04-27 09:09:24', '2026-04-27 09:12:18', NULL, NULL, 0),
(9, 2, 3, 2, '2026-04-27 09:13:02', '2026-04-27 09:13:02', NULL, NULL, 1),
(10, 2, 3, 2, '2026-04-27 09:15:24', '2026-04-27 09:15:24', NULL, NULL, 2),
(11, 3, 3, 2, '2026-04-27 09:50:59', '2026-04-27 09:51:34', NULL, NULL, 0),
(12, 3, 3, 2, '2026-04-27 09:54:54', '2026-04-27 09:54:54', NULL, NULL, 1),
(13, 3, 3, 2, '2026-04-27 10:00:07', '2026-04-27 10:00:07', NULL, NULL, 2),
(14, 4, 3, 2, '2026-04-27 10:02:13', '2026-04-27 10:02:13', NULL, NULL, 0),
(15, 4, 3, 2, '2026-04-27 10:04:38', '2026-04-27 10:04:38', NULL, NULL, 1),
(16, NULL, 3, 2, '2026-04-27 19:45:05', '2026-04-27 19:45:05', NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `core_page_localization`
--

DROP TABLE IF EXISTS `core_page_localization`;
CREATE TABLE IF NOT EXISTS `core_page_localization` (
  `id_localized_page` int NOT NULL AUTO_INCREMENT,
  `id_page` int NOT NULL,
  `id_language` int NOT NULL,
  `id_slug` int NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id_localized_page`),
  KEY `id_page` (`id_page`),
  KEY `id_language` (`id_language`),
  KEY `id_slug` (`id_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_page_localization`
--

INSERT INTO `core_page_localization` (`id_localized_page`, `id_page`, `id_language`, `id_slug`, `title`) VALUES
(1, 1, 1, 1, 'Recipe Categories'),
(2, 2, 1, 2, 'Appetizers'),
(3, 3, 1, 3, 'Main Courses'),
(4, 4, 1, 4, 'Desserts'),
(5, 5, 1, 5, 'Cooking Tips'),
(7, 7, 1, 7, 'Contact Us'),
(8, 8, 1, 8, 'Bruschetta'),
(9, 9, 1, 9, 'Stuffed Mushrooms'),
(10, 10, 1, 10, 'Spring Rolls'),
(11, 11, 1, 11, 'Grilled Chicken'),
(12, 12, 1, 12, 'Beef Stir Fry'),
(13, 13, 1, 13, 'Pasta Alfredo'),
(14, 14, 1, 14, 'Cheesecake'),
(15, 15, 1, 15, 'Fruit Tart'),
(16, 16, 1, 16, 'Dummy');

-- --------------------------------------------------------

--
-- Table structure for table `core_page_status`
--

DROP TABLE IF EXISTS `core_page_status`;
CREATE TABLE IF NOT EXISTS `core_page_status` (
  `id_page_status` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_editable` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_page_status`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_page_status`
--

INSERT INTO `core_page_status` (`id_page_status`, `name`, `is_editable`) VALUES
(1, 'Draft', 0),
(2, 'Public', 0),
(3, 'Archived', 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_page_template`
--

DROP TABLE IF EXISTS `core_page_template`;
CREATE TABLE IF NOT EXISTS `core_page_template` (
  `id_page_template` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_page_template`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_page_template`
--

INSERT INTO `core_page_template` (`id_page_template`, `name`) VALUES
(2, 'AI Generated'),
(3, 'Article'),
(5, 'External'),
(4, 'Page Listing'),
(1, 'Text');

-- --------------------------------------------------------

--
-- Table structure for table `core_privilege`
--

DROP TABLE IF EXISTS `core_privilege`;
CREATE TABLE IF NOT EXISTS `core_privilege` (
  `id_privilege` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `is_editable` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_privilege`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_privilege`
--

INSERT INTO `core_privilege` (`id_privilege`, `name`, `is_editable`) VALUES
(1, 'Read', 0),
(2, 'Create', 0),
(3, 'Update', 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_related_pages`
--

DROP TABLE IF EXISTS `core_related_pages`;
CREATE TABLE IF NOT EXISTS `core_related_pages` (
  `id_source` int NOT NULL,
  `id_target` int NOT NULL,
  UNIQUE KEY `id_source` (`id_source`,`id_target`),
  KEY `id_target` (`id_target`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_related_pages`
--

INSERT INTO `core_related_pages` (`id_source`, `id_target`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 8),
(12, 9),
(13, 10),
(14, 11),
(14, 13),
(15, 11),
(16, 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_resource`
--

DROP TABLE IF EXISTS `core_resource`;
CREATE TABLE IF NOT EXISTS `core_resource` (
  `id_resource` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`id_resource`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_resource`
--

INSERT INTO `core_resource` (`id_resource`, `name`, `type`) VALUES
(1, 'Docs', 1),
(2, 'Pages', 1),
(3, 'File System', 1),
(4, 'Docs (Administration)', 1),
(5, 'Domains', 1),
(6, 'Localization', 1),
(7, 'System', 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_setting`
--

DROP TABLE IF EXISTS `core_setting`;
CREATE TABLE IF NOT EXISTS `core_setting` (
  `id_setting` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_editable` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_setting`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_setting`
--

INSERT INTO `core_setting` (`id_setting`, `name`, `value`, `is_editable`) VALUES
(1, 'route-chasm-core:side-loader_hash-length', '4', 0),
(2, 'route-chasm-core:side-loader_max-retries', '128', 1),
(3, 'route-chasm-core:number_of_model_rows_in_grid', '20', 1),
(4, 'route-chasm-core:search_minimum_query_length', '3', 1),
(5, 'route-chasm-core:show_admin_login_in_footer', '1', 1),
(6, 'route-chasm-core:use_env_password_method', 'yes', 1),
(7, 'route-chasm-core:number_of_articles_per_listing_page', '21', 1),
(8, 'route-chasm-docs:search_dropdown_max_entries', '5', 1),
(9, 'savora:homepage-featured-pages-count', '3', 1),
(10, 'savora:homepage-categories-page-id', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_sideloader`
--

DROP TABLE IF EXISTS `core_sideloader`;
CREATE TABLE IF NOT EXISTS `core_sideloader` (
  `id_cache` int NOT NULL AUTO_INCREMENT,
  `hash` varchar(127) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id_cache`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_sideloader`
--

INSERT INTO `core_sideloader` (`id_cache`, `hash`, `path`) VALUES
(1, 'Oj08', 'C:\\programming\\php\\savora\\public\\js\\Binding.js'),
(2, 'u0ep', 'C:\\programming\\php\\savora\\public\\js\\Components.js'),
(3, 'tJj-', 'C:\\programming\\php\\savora\\public\\js\\Impulse.js'),
(4, 'gIb3', 'C:\\programming\\php\\savora\\public\\js\\NumberRange.js'),
(5, '8Y3H', 'C:\\programming\\php\\savora\\public\\js\\Resizeable.js'),
(6, 'nogr', 'C:\\programming\\php\\savora\\public\\js\\api.js'),
(7, '5NsB', 'C:\\programming\\php\\savora\\public\\js\\dropdown.js'),
(8, 'eh27', 'C:\\programming\\php\\savora\\public\\js\\main.js'),
(9, '0tpS', 'C:\\programming\\php\\savora\\public\\js\\shortcut.js'),
(10, 'Nl0n', 'C:\\programming\\php\\savora\\public\\js\\std.js'),
(11, 'Se8Y', 'C:\\programming\\php\\savora\\public\\js\\terminal.js'),
(12, 'XuE2', 'C:\\programming\\php\\savora\\public\\js\\window.js'),
(13, 'cBLd', 'C:\\programming\\php\\savora\\public\\css\\main.css'),
(14, 'V5Aq', 'C:\\programming\\php\\savora\\public\\css\\resizeable.css'),
(15, '9sgF', 'C:\\programming\\php\\savora\\public\\css\\window.css'),
(16, 'YMrJ', 'C:\\programming\\php\\savora\\src\\components\\core\\jsml\\jsml.js'),
(17, 'dSnx', 'C:\\programming\\php\\savora\\src\\components\\core\\Admin\\Nexus\\nexus.js'),
(18, 'PROi', 'C:\\programming\\php\\savora\\src\\core\\fs\\fs.js'),
(19, 'Gg2u', 'C:\\programming\\php\\savora\\src\\components\\core\\Admin\\User\\admin-user.js'),
(20, 'bNpU', 'C:\\programming\\php\\savora\\src\\components\\core\\Search\\search.js'),
(21, 'uN1h', 'C:\\programming\\php\\savora\\src\\core\\fs\\fs.css'),
(22, 'eE90', 'C:\\programming\\php\\savora\\src\\components\\Home\\home.css'),
(23, 'V6nC', 'C:\\programming\\php\\savora\\src\\components\\core\\PageMenu\\header.css'),
(24, 'OniT', 'C:\\programming\\php\\savora\\src\\components\\core\\Search\\header-search.css'),
(25, 'bRGy', 'C:\\programming\\php\\savora\\src\\components\\core\\PageMenu\\footer.css'),
(26, 'NkkD', 'C:\\programming\\php\\savora\\src\\components\\layout\\Spotlight\\spotlight.js'),
(27, 'OvUs', 'C:\\programming\\php\\savora\\src\\core\\forms\\form.js'),
(28, 'FLzD', 'C:\\programming\\php\\savora\\src\\components\\core\\Admin\\Login\\admin-login.css'),
(29, 'Z8Fk', 'C:\\programming\\php\\savora\\src\\components\\layout\\Spotlight\\spotlight.css'),
(30, '1pkW', 'C:\\programming\\php\\savora\\src\\core\\forms\\form.css'),
(31, 'xrmg', 'C:\\programming\\php\\savora\\src\\components\\core\\Admin\\Page\\page-editor.js'),
(32, 'oNof', 'C:\\programming\\php\\savora\\src\\components\\core\\RoutedMenu\\menu.js'),
(33, 'B9KG', 'C:\\programming\\php\\savora\\src\\components\\windows\\LanguageSelect\\language-select.js'),
(34, '-NeU', 'C:\\programming\\php\\savora\\src\\components\\core\\Admin\\Page\\page-editor.css'),
(35, 'nOn9', 'C:\\programming\\php\\savora\\src\\components\\core\\WebPage\\admin-page.css'),
(36, 'Gfrq', 'C:\\programming\\php\\savora\\src\\components\\core\\RoutedMenu\\menu.css'),
(37, 'YlpW', 'C:\\programming\\php\\savora\\src\\components\\layout\\Accordion\\accordion.js'),
(38, 'tvVb', 'C:\\programming\\php\\savora\\src\\components\\core\\Admin\\Nexus\\nexus.css'),
(39, '31RR', 'C:\\programming\\php\\savora\\src\\components\\core\\BreadCrumbs\\bread-crumbs.css'),
(40, 'mJOa', 'C:\\programming\\php\\savora\\src\\components\\layout\\Grid\\grid.css'),
(41, 'eQ7a', 'C:\\programming\\php\\savora\\src\\components\\core\\Pagination\\pagination-control.css'),
(42, 'pOB1', 'C:\\programming\\php\\savora\\src\\components\\layout\\Accordion\\accordion.css'),
(43, 'zxXR', 'C:\\programming\\php\\savora\\src\\core\\forms\\controls\\Select\\select.js'),
(44, 'Vpt2', 'C:\\programming\\php\\savora\\src\\core\\forms\\controls\\MultiSelect\\multiselect.js'),
(45, 'B6lo', 'C:\\programming\\php\\savora\\src\\components\\core\\fs\\file-control.js'),
(46, 'aOHx', 'C:\\programming\\php\\savora\\src\\components\\layout\\Tabs\\tabs.js'),
(47, 'mCqd', 'C:\\programming\\php\\savora\\src\\components\\core\\fs\\file-control.css'),
(48, 'TTkM', 'C:\\programming\\php\\savora\\src\\components\\layout\\Tabs\\tabs.css'),
(49, '0UYi', 'C:\\programming\\php\\savora\\src\\models\\extensions\\Priority\\priority.js'),
(50, '-EFR', 'C:\\programming\\php\\savora\\src\\models\\extensions\\Priority\\priority.css'),
(51, '0ryr', 'C:\\programming\\php\\savora\\src\\components\\pages\\AiGeneratedPage\\ai-page-generator.js'),
(52, 'eFk3', 'C:\\programming\\php\\savora\\src\\components\\pages\\AiGeneratedPage\\ai-generated-page.js'),
(53, 'QKGP', 'C:\\programming\\php\\savora\\src\\components\\pages\\AiGeneratedPage\\ai-generated-page.css'),
(54, '9vYX', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\lumora.js'),
(55, '4jjl', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\Editor\\editor.js'),
(56, 'taNn', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\Editor\\inspector.js'),
(57, 'aP1t', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\Editor\\widget-core.js'),
(58, 'i-6B', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Code\\code.js'),
(59, 'POZK', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\TextEditor\\text-editor.js'),
(60, 'jbIZ', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Decoration\\decoration.js'),
(61, 'f81C', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Link\\link.js'),
(62, 'T6Ig', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Command\\command.js'),
(63, 'NlW8', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\CommentSection\\comment-section.js'),
(64, 'FTPD', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Divider\\divider.js'),
(65, 'GNqL', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\FileDownload\\file-download.js'),
(66, 'cF8a', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Header\\header.js'),
(67, 'dhQM', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Heading\\heading.js'),
(68, '6brB', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Image\\image.js'),
(69, 'KyIL', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\List\\list.js'),
(70, 'Foqt', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\ListItem\\list-item.js'),
(71, '6Gp3', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Page\\page.js'),
(72, 'ESNY', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Quote\\quote.js'),
(73, 'n_GT', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Root\\root.js'),
(74, 'nXLk', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Text\\text.js'),
(75, '6c4Q', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Ai\\ai.js'),
(76, 'n7Ub', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Html\\html.js'),
(77, 'svld', 'C:\\programming\\php\\savora\\src\\components\\core\\ToolBar\\tool-bar.js'),
(78, 'Axb7', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\Editor\\editor.css'),
(79, 'Mkv4', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Code\\code.css'),
(80, 'MV0T', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\TextEditor\\text-editor.css'),
(81, 'JBtz', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Decoration\\decoration.css'),
(82, 'RQch', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Link\\link.css'),
(83, 'eA7S', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Command\\command.css'),
(84, 's3Y0', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\CommentSection\\comment-section.css'),
(85, 'dOac', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Divider\\divider.css'),
(86, 'Wih6', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\FileDownload\\file-download.css'),
(87, 'bWeF', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Header\\header.css'),
(88, 'U5DV', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Heading\\heading.css'),
(89, 'DjT7', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Image\\image.css'),
(90, 'Wj0L', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\List\\list.css'),
(91, 'AonP', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\ListItem\\list-item.css'),
(92, 't1Dh', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Page\\page.css'),
(93, 'aq77', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Quote\\quote.css'),
(94, 'U_U_', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Root\\root.css'),
(95, 'evKA', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Text\\text.css'),
(96, '8p1l', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Ai\\ai.css'),
(97, 'lac4', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\widgets\\Html\\html.css'),
(98, 'TQkm', 'C:\\programming\\php\\savora\\src\\components\\core\\ToolBar\\tool-bar.css'),
(99, 'g6Xg', 'C:\\programming\\php\\savora\\src\\components\\core\\Admin\\FileSystem\\fs-mkdir.js'),
(100, 'D2cf', 'C:\\programming\\php\\savora\\src\\components\\core\\FileSystem\\fs-drop-area.js'),
(101, '5e-X', 'C:\\programming\\php\\savora\\src\\components\\core\\FileSystem\\fs-drop-area.css'),
(102, 'Icbj', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\Display\\display.js'),
(103, '_5RW', 'C:\\programming\\php\\savora\\src\\components\\Lumora\\Display\\display.css'),
(104, 'r-WG', 'C:\\programming\\php\\savora\\src\\components\\pages\\Listing\\listing.css'),
(105, 'HMx_', 'C:\\programming\\php\\savora\\src\\components\\pages\\Listing\\listing-card.js'),
(106, 'I8I3', 'C:\\programming\\php\\savora\\src\\components\\pages\\Listing\\listing-card.css'),
(107, '8AV3', 'C:\\programming\\php\\savora\\src\\components\\pages\\Article\\article-editor.js'),
(108, 'B9nU', 'C:\\programming\\php\\savora\\src\\components\\core\\Markdown\\markdown.js'),
(109, 'FszG', 'C:\\programming\\php\\savora\\src\\components\\core\\Markdown\\md-tokenizer.js'),
(110, '5tzl', 'C:\\programming\\php\\savora\\src\\components\\core\\Markdown\\md-parser.js'),
(111, '2UCn', 'C:\\programming\\php\\savora\\src\\components\\core\\Markdown\\md-gallery.js'),
(112, 'eD9s', 'C:\\programming\\php\\savora\\src\\components\\core\\Markdown\\Editor\\md-editor.js'),
(113, 'J7u4', 'C:\\programming\\php\\savora\\src\\components\\core\\Markdown\\markdown.css'),
(114, '7Xyt', 'C:\\programming\\php\\savora\\src\\components\\core\\Markdown\\Editor\\md-editor.css'),
(115, 'QW50', 'C:\\programming\\php\\savora\\src\\components\\pages\\Article\\article.js'),
(116, 'DXZ5', 'C:\\programming\\php\\savora\\src\\components\\pages\\Article\\article.css'),
(117, 'An3e', 'C:\\programming\\php\\savora\\src\\components\\core\\Admin\\SptfTests\\sptf.js'),
(118, 'aMWI', 'C:\\programming\\php\\savora\\src\\components\\core\\Admin\\SptfTests\\sptf.css'),
(119, 'YJOt', 'C:\\programming\\php\\savora\\src\\components\\pages\\related-card.css'),
(120, 'b-cS', 'C:\\programming\\php\\savora\\src\\components\\core\\Admin\\PrivilegeResourceMap\\privilege-resource-map.css');

-- --------------------------------------------------------

--
-- Table structure for table `core_user`
--

DROP TABLE IF EXISTS `core_user`;
CREATE TABLE IF NOT EXISTS `core_user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `tag` (`tag`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_user`
--

INSERT INTO `core_user` (`id_user`, `username`, `password`, `tag`) VALUES
(1, 'Root', '', 'root'),
(2, 'Anonymous', '', 'anonymous'),
(4, 'Buzz', '$2y$10$qoS1xtUjC0ulL1GEGnmjx.KYLhMwXxBk0sRP4ewVXiF5WbwzoXZre', 'fizz');

-- --------------------------------------------------------

--
-- Table structure for table `core_users_x_groups`
--

DROP TABLE IF EXISTS `core_users_x_groups`;
CREATE TABLE IF NOT EXISTS `core_users_x_groups` (
  `id_user` int NOT NULL,
  `id_group` int NOT NULL,
  KEY `id_user` (`id_user`),
  KEY `id_group` (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_users_x_groups`
--

INSERT INTO `core_users_x_groups` (`id_user`, `id_group`) VALUES
(1, 2),
(1, 3),
(2, 1),
(4, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `docs_content`
--

DROP TABLE IF EXISTS `docs_content`;
CREATE TABLE IF NOT EXISTS `docs_content` (
  `id_content` int NOT NULL AUTO_INCREMENT,
  `file` varchar(255) NOT NULL,
  `file_size` int NOT NULL,
  `last_updated` int NOT NULL,
  `hash` varchar(255) NOT NULL,
  PRIMARY KEY (`id_content`),
  UNIQUE KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `docs_contents_x_fragments`
--

DROP TABLE IF EXISTS `docs_contents_x_fragments`;
CREATE TABLE IF NOT EXISTS `docs_contents_x_fragments` (
  `id_content` int NOT NULL,
  `id_fragment` int NOT NULL,
  UNIQUE KEY `id_content` (`id_content`,`id_fragment`),
  KEY `id_fragment` (`id_fragment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `docs_fragment`
--

DROP TABLE IF EXISTS `docs_fragment`;
CREATE TABLE IF NOT EXISTS `docs_fragment` (
  `id_fragment` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  PRIMARY KEY (`id_fragment`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ext_page_meta`
--

DROP TABLE IF EXISTS `ext_page_meta`;
CREATE TABLE IF NOT EXISTS `ext_page_meta` (
  `id_page_meta` int NOT NULL AUTO_INCREMENT,
  `id_localized_page` int NOT NULL,
  `description` text NOT NULL,
  `keywords` text NOT NULL,
  `og_title` text NOT NULL,
  `og_description` text NOT NULL,
  PRIMARY KEY (`id_page_meta`),
  KEY `id_localized_page` (`id_localized_page`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ext_page_meta`
--

INSERT INTO `ext_page_meta` (`id_page_meta`, `id_localized_page`, `description`, `keywords`, `og_title`, `og_description`) VALUES
(1, 1, '', '', '', ''),
(2, 2, '', '', '', ''),
(3, 3, '', '', '', ''),
(4, 4, '', '', '', ''),
(5, 5, 'Description', '', '', ''),
(7, 7, '', '', '', ''),
(8, 8, 'Toasted bread with tomatoes, garlic, and olive oil', '', '', ''),
(9, 9, 'Baked mushrooms filled with herbs, cheese, and breadcrumbs', '', '', ''),
(10, 10, 'Crisp rolls packed with vegetables and light fillings', '', '', ''),
(11, 11, 'Juicy chicken with simple herbs and light seasoning', '', '', ''),
(12, 12, 'Quick-cooked beef with vegetables in a savory sauce', '', '', ''),
(13, 13, 'Creamy pasta with butter, cheese, and smooth texture', '', '', ''),
(14, 14, 'Rich and smooth dessert with a crisp base', '', '', ''),
(15, 15, 'Light pastry filled with cream and fresh fruit', '', '', ''),
(16, 16, '', '', '', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `core_ai_page`
--
ALTER TABLE `core_ai_page`
  ADD CONSTRAINT `core_ai_page_ibfk_1` FOREIGN KEY (`id_page`) REFERENCES `core_page` (`id_page`);

--
-- Constraints for table `core_external_page`
--
ALTER TABLE `core_external_page`
  ADD CONSTRAINT `core_external_page_ibfk_1` FOREIGN KEY (`id_page`) REFERENCES `core_page` (`id_page`);

--
-- Constraints for table `core_fs_directory`
--
ALTER TABLE `core_fs_directory`
  ADD CONSTRAINT `core_fs_directory_ibfk_1` FOREIGN KEY (`id_fs_parent`) REFERENCES `core_fs_directory` (`id_fs_directory`);

--
-- Constraints for table `core_fs_file`
--
ALTER TABLE `core_fs_file`
  ADD CONSTRAINT `core_fs_file_ibfk_1` FOREIGN KEY (`id_fs_parent`) REFERENCES `core_fs_directory` (`id_fs_directory`);

--
-- Constraints for table `core_fs_shortcut`
--
ALTER TABLE `core_fs_shortcut`
  ADD CONSTRAINT `core_fs_shortcut_ibfk_1` FOREIGN KEY (`id_fs_file`) REFERENCES `core_fs_file` (`id_fs_file`);

--
-- Constraints for table `core_groups_x_resources`
--
ALTER TABLE `core_groups_x_resources`
  ADD CONSTRAINT `core_groups_x_resources_ibfk_1` FOREIGN KEY (`id_group`) REFERENCES `core_group` (`id_group`),
  ADD CONSTRAINT `core_groups_x_resources_ibfk_2` FOREIGN KEY (`id_resource`) REFERENCES `core_resource` (`id_resource`),
  ADD CONSTRAINT `core_groups_x_resources_ibfk_3` FOREIGN KEY (`id_privilege`) REFERENCES `core_privilege` (`id_privilege`);

--
-- Constraints for table `core_lexicon`
--
ALTER TABLE `core_lexicon`
  ADD CONSTRAINT `core_lexicon_ibfk_1` FOREIGN KEY (`id_lexicon_group`) REFERENCES `core_lexicon_group` (`id_lexicon_group`);

--
-- Constraints for table `core_lexicon_translation`
--
ALTER TABLE `core_lexicon_translation`
  ADD CONSTRAINT `core_lexicon_translation_ibfk_1` FOREIGN KEY (`id_phrase`) REFERENCES `core_lexicon` (`id_phrase`),
  ADD CONSTRAINT `core_lexicon_translation_ibfk_2` FOREIGN KEY (`id_language`) REFERENCES `core_language` (`id_language`),
  ADD CONSTRAINT `core_lexicon_translation_ibfk_3` FOREIGN KEY (`id_rule`) REFERENCES `core_lexicon_rule` (`id_rule`);

--
-- Constraints for table `core_navigation`
--
ALTER TABLE `core_navigation`
  ADD CONSTRAINT `core_navigation_ibfk_1` FOREIGN KEY (`id_navigation_context`) REFERENCES `core_navigation_context` (`id_navigation_context`),
  ADD CONSTRAINT `core_navigation_ibfk_2` FOREIGN KEY (`id_parent`) REFERENCES `core_navigation` (`id_slug`),
  ADD CONSTRAINT `core_navigation_ibfk_3` FOREIGN KEY (`id_language`) REFERENCES `core_language` (`id_language`),
  ADD CONSTRAINT `core_navigation_ibfk_4` FOREIGN KEY (`id_navigation_factory`) REFERENCES `core_navigation_factory` (`id_navigation_factory`);

--
-- Constraints for table `core_page`
--
ALTER TABLE `core_page`
  ADD CONSTRAINT `core_page_ibfk_1` FOREIGN KEY (`id_page_template`) REFERENCES `core_page_template` (`id_page_template`),
  ADD CONSTRAINT `core_page_ibfk_2` FOREIGN KEY (`id_page_status`) REFERENCES `core_page_status` (`id_page_status`);

--
-- Constraints for table `core_page_localization`
--
ALTER TABLE `core_page_localization`
  ADD CONSTRAINT `core_page_localization_ibfk_1` FOREIGN KEY (`id_page`) REFERENCES `core_page` (`id_page`),
  ADD CONSTRAINT `core_page_localization_ibfk_2` FOREIGN KEY (`id_language`) REFERENCES `core_language` (`id_language`),
  ADD CONSTRAINT `core_page_localization_ibfk_3` FOREIGN KEY (`id_slug`) REFERENCES `core_navigation` (`id_slug`);

--
-- Constraints for table `core_users_x_groups`
--
ALTER TABLE `core_users_x_groups`
  ADD CONSTRAINT `core_users_x_groups_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `core_user` (`id_user`),
  ADD CONSTRAINT `core_users_x_groups_ibfk_2` FOREIGN KEY (`id_group`) REFERENCES `core_group` (`id_group`);

--
-- Constraints for table `docs_contents_x_fragments`
--
ALTER TABLE `docs_contents_x_fragments`
  ADD CONSTRAINT `docs_contents_x_fragments_ibfk_1` FOREIGN KEY (`id_content`) REFERENCES `docs_content` (`id_content`),
  ADD CONSTRAINT `docs_contents_x_fragments_ibfk_2` FOREIGN KEY (`id_fragment`) REFERENCES `docs_fragment` (`id_fragment`);

--
-- Constraints for table `ext_page_meta`
--
ALTER TABLE `ext_page_meta`
  ADD CONSTRAINT `ext_page_meta_ibfk_1` FOREIGN KEY (`id_localized_page`) REFERENCES `core_page_localization` (`id_localized_page`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
