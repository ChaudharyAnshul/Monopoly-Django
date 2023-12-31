-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2021 at 04:05 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `monopoly`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user count', 7, 'add_usercount'),
(26, 'Can change user count', 7, 'change_usercount'),
(27, 'Can delete user count', 7, 'delete_usercount'),
(28, 'Can view user count', 7, 'view_usercount'),
(29, 'Can add player coins', 8, 'add_playercoins'),
(30, 'Can change player coins', 8, 'change_playercoins'),
(31, 'Can delete player coins', 8, 'delete_playercoins'),
(32, 'Can view player coins', 8, 'view_playercoins'),
(33, 'Can add property card', 9, 'add_propertycard'),
(34, 'Can change property card', 9, 'change_propertycard'),
(35, 'Can delete property card', 9, 'delete_propertycard'),
(36, 'Can view property card', 9, 'view_propertycard'),
(37, 'Can add transactions', 10, 'add_transactions'),
(38, 'Can change transactions', 10, 'change_transactions'),
(39, 'Can delete transactions', 10, 'delete_transactions'),
(40, 'Can view transactions', 10, 'view_transactions'),
(41, 'Can add property user map', 11, 'add_propertyusermap'),
(42, 'Can change property user map', 11, 'change_propertyusermap'),
(43, 'Can delete property user map', 11, 'delete_propertyusermap'),
(44, 'Can view property user map', 11, 'view_propertyusermap'),
(45, 'Can add moves', 12, 'add_moves'),
(46, 'Can change moves', 12, 'change_moves'),
(47, 'Can delete moves', 12, 'delete_moves'),
(48, 'Can view moves', 12, 'view_moves');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(150) COLLATE utf8_bin NOT NULL,
  `email` varchar(254) COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$swwseyNeePxSt5WyCUuNfC$ePd8LSSSNzo+CzfCEJl6d/QPnfnUaZMjyjalvveV7L4=', '2021-04-14 15:36:24.000000', 1, 'Admin-1', '', '', 'admin-1@gmail.com', 1, 1, '2021-04-10 06:35:02.000000'),
(2, 'pbkdf2_sha256$260000$jR6hjOxwYcwiUfCKNT0f9B$wCQ+SV1+P3iFC65kz7OIKVeUGZY1y0ofEPOsKiERmKA=', '2021-04-15 13:29:40.000000', 0, 'Team_1', '', '', '', 0, 1, '2021-04-10 07:04:34.000000'),
(3, 'pbkdf2_sha256$260000$RZbKJrMIJSpHuUvNwWpscg$tEbyufxeJZP+edGlAJP+wxxHIumDUy3+C2hbIW6/8HQ=', '2021-04-15 09:32:37.000000', 0, 'Team_2', '', '', '', 0, 1, '2021-04-10 11:13:03.000000'),
(4, 'pbkdf2_sha256$260000$WfaH5NxuYLONYY24l7sfi0$GouNpr0SdZURXYDqTCTSVus++0OiZhQdXAZm9kZVtH0=', '2021-04-14 05:02:19.000000', 0, 'Team_3', '', '', '', 0, 1, '2021-04-10 11:13:30.000000'),
(5, 'pbkdf2_sha256$260000$vjcfXSIciZFJqhbUzdj9E6$BJZZN93o/Zi79l40YRM2va6j0gQvGjsCJDZAiXwgC5Y=', NULL, 0, 'Team_4', '', '', '', 0, 1, '2021-04-10 11:13:56.000000'),
(6, 'pbkdf2_sha256$260000$feunnqAXM9K3AfKE3LNrRw$m5Nx3pIn4Wp+aPX2wFZSjUJy0nsM/ZaLdwzILGus5ek=', NULL, 0, 'Team_5', '', '', '', 0, 1, '2021-04-10 11:13:56.000000'),
(7, 'pbkdf2_sha256$260000$VZqJTTTSjpAjEYD6kA3BH4$GXUAENolLx2OZisemc1cGC9+NC54+b4QWBzf+DgtBSg=', '2021-04-15 06:00:34.000000', 0, 'Team_6', '', '', '', 0, 1, '2021-04-15 05:57:30.000000'),
(8, 'pbkdf2_sha256$260000$nMxWU1UMj9DCiO9FtKmNMW$wsuh8bpPu5OzQFUws+JwG6vmMfyYccnyi1AdavrGkWE=', NULL, 1, 'Admin-2', '', '', 'admin-2@gmail.com', 1, 1, '2021-04-15 13:52:54.000000'),
(9, 'pbkdf2_sha256$260000$JOWjoG4Itx5p8zhtbPFaaa$onIHK9WmujuNzblRWl3VGV7ghFWRp8DowT1ZnjFm5e4=', NULL, 1, 'Admin-3', '', '', 'admin-3@gmail.com', 1, 1, '2021-04-15 13:54:38.000000'),
(10, 'pbkdf2_sha256$260000$xp157pdQ7iW8cwY6T4GuiB$YXwa9gXYRNP2uXnUItYpWDbWjPsiHXbXXeYc3Jlve/Y=', NULL, 1, 'Admin-4', '', '', 'admin-4@gmail.com', 1, 1, '2021-04-15 13:55:30.000000'),
(11, 'pbkdf2_sha256$260000$zAMWds2OZ25s6MVbFCTq9j$iJFGJIjrj/21klZ6gs9vc58Ntk/KLvqxO2H4MrShFZQ=', NULL, 1, 'Admin-5', '', '', 'admin-5@gmail.com', 1, 1, '2021-04-15 13:56:38.000000'),
(12, 'pbkdf2_sha256$260000$y437PEC7kwUh1WTQw4DLiB$CVSjiotvP4L79lSkEe1ZwvcSlYoCHmCpAnnu44kecZU=', NULL, 1, 'Admin-6', '', '', 'admin-6@gmail.com', 1, 1, '2021-04-15 13:57:25.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_bin DEFAULT NULL,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-04-10 07:04:34.751776', '2', 'Team_1', 1, '[{\"added\": {}}]', 4, 1),
(2, '2021-04-10 07:06:49.291083', '1', 'UserCount object (1)', 1, '[{\"added\": {}}]', 7, 1),
(3, '2021-04-10 11:13:03.566100', '3', 'Team_2', 1, '[{\"added\": {}}]', 4, 1),
(4, '2021-04-10 11:13:30.779363', '4', 'Team_3', 1, '[{\"added\": {}}]', 4, 1),
(5, '2021-04-10 11:13:56.167405', '5', 'Team_4', 1, '[{\"added\": {}}]', 4, 1),
(6, '2021-04-15 05:57:04.998921', '7', 'Team_7\r\n', 3, '', 4, 1),
(7, '2021-04-15 05:57:30.178291', '8', 'Team_6', 1, '[{\"added\": {}}]', 4, 1),
(8, '2021-04-15 05:57:37.560320', '8', 'Team_6', 2, '[]', 4, 1),
(9, '2021-04-15 05:57:48.755525', '7', 'PlayerCoins object (7)', 1, '[{\"added\": {}}]', 8, 1),
(10, '2021-04-15 05:58:08.727735', '8', 'UserCount object (8)', 1, '[{\"added\": {}}]', 7, 1),
(11, '2021-04-15 06:00:09.317266', '6', 'PlayerCoins object (6)', 1, '[{\"added\": {}}]', 8, 1),
(12, '2021-04-15 06:00:23.371934', '7', 'UserCount object (7)', 1, '[{\"added\": {}}]', 7, 1),
(13, '2021-04-15 08:47:33.751617', '1', 'Reception', 1, '[{\"added\": {}}]', 9, 1),
(14, '2021-04-15 08:49:05.406184', '2', 'Canteen-1', 1, '[{\"added\": {}}]', 9, 1),
(15, '2021-04-15 08:50:06.585835', '2', 'CCD-1', 1, '[{\"added\": {}}]', 9, 1),
(16, '2021-04-15 08:50:41.608603', '3', 'Dheeraj Xerox', 1, '[{\"added\": {}}]', 9, 1),
(17, '2021-04-15 08:51:21.852263', '4', 'Terrace', 1, '[{\"added\": {}}]', 9, 1),
(18, '2021-04-15 08:52:41.766698', '5', 'Fee-1', 1, '[{\"added\": {}}]', 9, 1),
(19, '2021-04-15 08:53:08.972269', '6', 'Library-1', 1, '[{\"added\": {}}]', 9, 1),
(20, '2021-04-15 08:54:01.145114', '7', 'Amphitheatre', 1, '[{\"added\": {}}]', 9, 1),
(21, '2021-04-15 08:54:50.015947', '8', 'Labs', 1, '[{\"added\": {}}]', 9, 1),
(22, '2021-04-15 08:55:40.159551', '9', 'Auto Stand-1', 1, '[{\"added\": {}}]', 9, 1),
(23, '2021-04-15 08:56:19.545083', '10', 'Poly Ground-1', 1, '[{\"added\": {}}]', 9, 1),
(24, '2021-04-15 08:56:54.520728', '11', 'Reception', 1, '[{\"added\": {}}]', 9, 1),
(25, '2021-04-15 08:58:23.328200', '12', 'Auditorium-1', 1, '[{\"added\": {}}]', 9, 1),
(26, '2021-04-15 08:58:45.754519', '13', 'Garden-1', 1, '[{\"added\": {}}]', 9, 1),
(27, '2021-04-15 08:59:06.385439', '14', 'BCR-1', 1, '[{\"added\": {}}]', 9, 1),
(28, '2021-04-15 08:59:52.441142', '15', 'Canteen-2', 1, '[{\"added\": {}}]', 9, 1),
(29, '2021-04-15 09:00:14.561294', '16', 'Workshop-1', 1, '[{\"added\": {}}]', 9, 1),
(30, '2021-04-15 09:00:39.495077', '17', 'Parking-1', 1, '[{\"added\": {}}]', 9, 1),
(31, '2021-04-15 09:01:08.525627', '18', 'Amphitheatre-2', 1, '[{\"added\": {}}]', 9, 1),
(32, '2021-04-15 09:01:26.817873', '19', 'Hostel-1', 1, '[{\"added\": {}}]', 9, 1),
(33, '2021-04-15 09:01:52.826123', '20', 'Lobby-1', 1, '[{\"added\": {}}]', 9, 1),
(34, '2021-04-15 09:02:19.418553', '21', 'Auditorium-2', 1, '[{\"added\": {}}]', 9, 1),
(35, '2021-04-15 09:02:53.008093', '22', 'Canteen-3', 1, '[{\"added\": {}}]', 9, 1),
(36, '2021-04-15 09:03:33.460439', '23', 'Dheeraj Xerox-2', 1, '[{\"added\": {}}]', 9, 1),
(37, '2021-04-15 09:03:51.584353', '24', 'BCR-2', 1, '[{\"added\": {}}]', 9, 1),
(38, '2021-04-15 09:04:21.608827', '25', 'Amphitheatre-3', 1, '[{\"added\": {}}]', 9, 1),
(39, '2021-04-15 09:04:59.766821', '26', 'Poly Ground-2', 1, '[{\"added\": {}}]', 9, 1),
(40, '2021-04-15 09:05:50.987126', '26', 'Poly Ground-2', 2, '[]', 9, 1),
(41, '2021-04-15 09:06:39.776354', '27', 'Library-2', 1, '[{\"added\": {}}]', 9, 1),
(42, '2021-04-15 09:06:57.623590', '28', 'Hostel-2', 1, '[{\"added\": {}}]', 9, 1),
(43, '2021-04-15 09:07:23.910502', '29', 'Auto Stand-2', 1, '[{\"added\": {}}]', 9, 1),
(44, '2021-04-15 09:07:43.668547', '30', 'CCD-2', 1, '[{\"added\": {}}]', 9, 1),
(45, '2021-04-15 09:09:08.240140', '31', 'Reception-2', 1, '[{\"added\": {}}]', 9, 1),
(46, '2021-04-15 09:10:42.689778', '1', 'PropertyUserMap object (1)', 1, '[{\"added\": {}}]', 11, 1),
(47, '2021-04-15 09:11:10.725451', '1', 'PropertyUserMap object (1)', 3, '', 11, 1),
(48, '2021-04-15 09:19:53.264597', '2', 'PropertyUserMap object (2)', 1, '[{\"added\": {}}]', 11, 1),
(49, '2021-04-15 09:20:00.538598', '3', 'PropertyUserMap object (3)', 1, '[{\"added\": {}}]', 11, 1),
(50, '2021-04-15 09:20:06.794533', '4', 'PropertyUserMap object (4)', 1, '[{\"added\": {}}]', 11, 1),
(51, '2021-04-15 09:20:20.734831', '5', 'PropertyUserMap object (5)', 1, '[{\"added\": {}}]', 11, 1),
(52, '2021-04-15 09:20:28.428161', '6', 'PropertyUserMap object (6)', 1, '[{\"added\": {}}]', 11, 1),
(53, '2021-04-15 09:20:35.821835', '7', 'PropertyUserMap object (7)', 1, '[{\"added\": {}}]', 11, 1),
(54, '2021-04-15 09:29:51.508188', '1', 'Canteen-1', 2, '[{\"changed\": {\"fields\": [\"Mortgaged\"]}}]', 9, 1),
(55, '2021-04-15 11:29:01.456837', '1', 'Canteen-1', 2, '[{\"changed\": {\"fields\": [\"Mortgaged\"]}}]', 9, 1),
(56, '2021-04-15 11:38:36.530141', '1', 'Moves object (1)', 2, '[{\"changed\": {\"fields\": [\"Team 4\"]}}]', 12, 1),
(57, '2021-04-15 13:33:25.878449', '1', 'Moves object (1)', 2, '[{\"changed\": {\"fields\": [\"Current turn\", \"Team 2\", \"Team 3\", \"Team 4\", \"Team 5\", \"Team 6\"]}}]', 12, 1),
(58, '2021-04-15 13:37:34.555927', '1', 'Moves object (1)', 2, '[{\"changed\": {\"fields\": [\"Team 1\", \"Team 2\", \"Team 3\", \"Team 4\", \"Team 5\", \"Team 6\"]}}]', 12, 1),
(59, '2021-04-15 13:38:30.444397', '1', 'PlayerCoins object (1)', 2, '[{\"changed\": {\"fields\": [\"Balance\"]}}]', 8, 1),
(60, '2021-04-15 13:38:32.366845', '1', 'PlayerCoins object (1)', 2, '[]', 8, 1),
(61, '2021-04-15 13:38:37.661765', '2', 'PlayerCoins object (2)', 2, '[{\"changed\": {\"fields\": [\"Balance\"]}}]', 8, 1),
(62, '2021-04-15 13:38:43.111290', '3', 'PlayerCoins object (3)', 2, '[{\"changed\": {\"fields\": [\"Balance\"]}}]', 8, 1),
(63, '2021-04-15 13:38:49.109379', '4', 'PlayerCoins object (4)', 2, '[{\"changed\": {\"fields\": [\"Balance\"]}}]', 8, 1),
(64, '2021-04-15 13:38:53.133913', '5', 'PlayerCoins object (5)', 2, '[{\"changed\": {\"fields\": [\"Balance\"]}}]', 8, 1),
(65, '2021-04-15 13:38:57.621976', '6', 'PlayerCoins object (6)', 2, '[{\"changed\": {\"fields\": [\"Balance\"]}}]', 8, 1),
(66, '2021-04-15 13:51:40.173041', '1', 'Admin', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(67, '2021-04-15 13:51:57.760765', '1', 'Admin-1', 2, '[{\"changed\": {\"fields\": [\"Username\"]}}]', 4, 1),
(68, '2021-04-15 13:52:54.797344', '8', 'Admin-2', 1, '[{\"added\": {}}]', 4, 1),
(69, '2021-04-15 13:53:01.669345', '8', 'Admin-2', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]', 4, 1),
(70, '2021-04-15 13:53:18.307523', '8', 'Admin-2', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 1),
(71, '2021-04-15 13:53:23.075365', '1', 'Admin-1', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 1),
(72, '2021-04-15 13:54:38.735098', '9', 'Admin-3', 1, '[{\"added\": {}}]', 4, 1),
(73, '2021-04-15 13:54:47.983131', '9', 'Admin-3', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]', 4, 1),
(74, '2021-04-15 13:55:00.281963', '9', 'Admin-3', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 1),
(75, '2021-04-15 13:55:30.299052', '10', 'Admin-4', 1, '[{\"added\": {}}]', 4, 1),
(76, '2021-04-15 13:55:44.104125', '10', 'Admin-4', 2, '[{\"changed\": {\"fields\": [\"Email address\", \"Staff status\", \"Superuser status\"]}}]', 4, 1),
(77, '2021-04-15 13:56:38.881418', '11', 'Admin-5', 1, '[{\"added\": {}}]', 4, 1),
(78, '2021-04-15 13:56:50.269154', '11', 'Admin-5', 2, '[{\"changed\": {\"fields\": [\"Email address\", \"Staff status\", \"Superuser status\"]}}]', 4, 1),
(79, '2021-04-15 13:57:25.317391', '12', 'Admin-6', 1, '[{\"added\": {}}]', 4, 1),
(80, '2021-04-15 13:57:35.789556', '12', 'Admin-6', 2, '[{\"changed\": {\"fields\": [\"Email address\", \"Staff status\", \"Superuser status\"]}}]', 4, 1),
(81, '2021-04-15 13:59:02.901720', '2', 'Team_1', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(82, '2021-04-15 13:59:12.426894', '2', 'Team_1', 2, '[]', 4, 1),
(83, '2021-04-15 13:59:53.999344', '3', 'Team_2', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(84, '2021-04-15 13:59:57.107585', '3', 'Team_2', 2, '[]', 4, 1),
(85, '2021-04-15 14:00:44.729609', '4', 'Team_3', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(86, '2021-04-15 14:00:46.701647', '4', 'Team_3', 2, '[]', 4, 1),
(87, '2021-04-15 14:01:19.395295', '5', 'Team_4', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(88, '2021-04-15 14:01:23.079761', '5', 'Team_4', 2, '[]', 4, 1),
(89, '2021-04-15 14:01:51.012097', '6', 'Team_5', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(90, '2021-04-15 14:01:53.241985', '6', 'Team_5', 2, '[]', 4, 1),
(91, '2021-04-15 14:02:13.681045', '7', 'Team_6', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(92, '2021-04-15 14:02:17.007489', '7', 'Team_6', 2, '[]', 4, 1),
(93, '2021-04-15 14:03:16.325206', '2', 'PropertyUserMap object (2)', 3, '', 11, 1),
(94, '2021-04-15 14:03:16.362634', '3', 'PropertyUserMap object (3)', 3, '', 11, 1),
(95, '2021-04-15 14:03:16.442118', '4', 'PropertyUserMap object (4)', 3, '', 11, 1),
(96, '2021-04-15 14:03:16.463300', '5', 'PropertyUserMap object (5)', 3, '', 11, 1),
(97, '2021-04-15 14:03:16.475597', '6', 'PropertyUserMap object (6)', 3, '', 11, 1),
(98, '2021-04-15 14:03:16.496686', '7', 'PropertyUserMap object (7)', 3, '', 11, 1),
(99, '2021-04-15 14:03:24.596020', '1', 'Transactions object (1)', 3, '', 10, 1),
(100, '2021-04-15 14:03:24.630734', '3', 'Transactions object (3)', 3, '', 10, 1),
(101, '2021-04-15 14:03:24.672368', '4', 'Transactions object (4)', 3, '', 10, 1),
(102, '2021-04-15 14:03:24.697847', '5', 'Transactions object (5)', 3, '', 10, 1),
(103, '2021-04-15 14:03:24.717990', '6', 'Transactions object (6)', 3, '', 10, 1),
(104, '2021-04-15 14:03:24.738969', '7', 'Transactions object (7)', 3, '', 10, 1),
(105, '2021-04-15 14:03:24.758943', '8', 'Transactions object (8)', 3, '', 10, 1),
(106, '2021-04-15 14:03:24.781128', '9', 'Transactions object (9)', 3, '', 10, 1),
(107, '2021-04-15 14:03:24.809946', '10', 'Transactions object (10)', 3, '', 10, 1),
(108, '2021-04-15 14:03:24.831149', '11', 'Transactions object (11)', 3, '', 10, 1),
(109, '2021-04-15 14:03:24.859866', '12', 'Transactions object (12)', 3, '', 10, 1),
(110, '2021-04-15 14:03:24.881004', '13', 'Transactions object (13)', 3, '', 10, 1),
(111, '2021-04-15 14:03:41.729270', '2', 'UserCount object (2)', 2, '[{\"changed\": {\"fields\": [\"Login count\"]}}]', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(12, 'Event', 'moves'),
(8, 'Event', 'playercoins'),
(9, 'Event', 'propertycard'),
(11, 'Event', 'propertyusermap'),
(10, 'Event', 'transactions'),
(7, 'Event', 'usercount'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-04-10 06:22:06.470152'),
(2, 'auth', '0001_initial', '2021-04-10 06:22:12.101244'),
(3, 'admin', '0001_initial', '2021-04-10 06:22:13.971139'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-04-10 06:22:14.007378'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-04-10 06:22:14.120022'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-04-10 06:22:15.012609'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-04-10 06:22:15.531326'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-04-10 06:22:16.056150'),
(9, 'auth', '0004_alter_user_username_opts', '2021-04-10 06:22:16.080816'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-04-10 06:22:16.474122'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-04-10 06:22:16.493132'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-04-10 06:22:16.519227'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-04-10 06:22:16.598304'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-04-10 06:22:16.694173'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-04-10 06:22:17.223337'),
(16, 'auth', '0011_update_proxy_permissions', '2021-04-10 06:22:17.255901'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-04-10 06:22:17.335439'),
(18, 'sessions', '0001_initial', '2021-04-10 06:22:17.899465'),
(19, 'Event', '0001_initial', '2021-04-10 06:56:36.810187'),
(20, 'Event', '0002_initial', '2021-04-12 12:20:56.028086'),
(21, 'Event', '0003_moves', '2021-04-12 12:49:09.665479'),
(22, 'Event', '0004_auto_20210412_1848', '2021-04-12 13:18:13.780866'),
(23, 'Event', '0005_moves_previous_roll', '2021-04-13 05:49:34.921263'),
(24, 'Event', '0006_auto_20210414_1205', '2021-04-14 06:35:15.415630'),
(25, 'Event', '0007_transactions_data_time', '2021-04-15 05:11:16.021084'),
(26, 'Event', '0008_propertycard_desc', '2021-04-15 08:43:58.637647'),
(27, 'Event', '0009_transactions_newbalance', '2021-04-15 11:13:54.004993');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `event_moves`
--

CREATE TABLE `event_moves` (
  `id` bigint(20) NOT NULL,
  `current_turn_id` bigint(20) NOT NULL,
  `team_1` int(11) NOT NULL,
  `team_2` int(11) NOT NULL,
  `team_3` int(11) NOT NULL,
  `team_4` int(11) NOT NULL,
  `team_5` int(11) NOT NULL,
  `team_6` int(11) NOT NULL,
  `previous_roll` int(11) NOT NULL,
  `game_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `event_moves`
--

INSERT INTO `event_moves` (`id`, `current_turn_id`, `team_1`, `team_2`, `team_3`, `team_4`, `team_5`, `team_6`, `previous_roll`, `game_status`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `event_playercoins`
--

CREATE TABLE `event_playercoins` (
  `id` bigint(20) NOT NULL,
  `balance` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `event_playercoins`
--

INSERT INTO `event_playercoins` (`id`, `balance`, `user_id`) VALUES
(1, 1000000, 2),
(2, 1000000, 3),
(3, 1000000, 4),
(4, 1000000, 5),
(5, 1000000, 6),
(6, 1000000, 7);

-- --------------------------------------------------------

--
-- Table structure for table `event_propertycard`
--

CREATE TABLE `event_propertycard` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `cost` int(11) NOT NULL,
  `rent` int(11) NOT NULL,
  `mortgage` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `mortgaged` tinyint(1) NOT NULL,
  `desc` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `event_propertycard`
--

INSERT INTO `event_propertycard` (`id`, `name`, `cost`, `rent`, `mortgage`, `status`, `mortgaged`, `desc`) VALUES
(1, 'Canteen-1', 0, 7000, 0, 1, 0, 'Mara Mari treat to class!'),
(2, 'CCD-1', 0, 4000, 0, 1, 0, 'team meet coffee'),
(3, 'Dheeraj Xerox-1', 0, 4000, 0, 1, 0, 'assignments printout'),
(4, 'Terrace-1', 0, 1000, 0, 1, 0, 'you are not allowed here!'),
(5, 'Fee-1', 0, 30000, 0, 1, 0, 'Pay for your MU exam form'),
(6, 'Library-1', 0, 3000, 0, 1, 0, 'book not returned'),
(7, 'Amphitheatre-1', 0, 5000, 0, 1, 0, 'Prarambh'),
(8, 'Labs-1', 0, 3000, 0, 1, 0, 'you have broken the apparatus'),
(9, 'Auto Stand-1', 0, 2000, 0, 1, 0, 'fare from college to kurla'),
(10, 'Poly Ground-1', 0, 5000, 0, 1, 0, 'sphurti!'),
(11, 'Reception-1', 0, 5000, 0, 1, 0, 'you have KT in the sem!'),
(12, 'Auditorium-1', 0, 6000, 0, 1, 0, 'VESLARC SEMINAR'),
(13, 'Garden-1', 0, 2000, 0, 1, 0, 'Suit day! click pictures'),
(14, 'BCR-1', 0, 3500, 0, 1, 0, 'Table Tennis Tournament'),
(15, 'Canteen-2', 0, 7000, 0, 1, 0, 'it\'s your birthday treat! chinese samosa , fried rice and oreo shake'),
(16, 'Workshop-1', 0, 2000, 0, 1, 0, 'carpentry for stage setup in drama event'),
(17, 'Parking-1', 0, 1000, 0, 1, 0, 'park your vehicle'),
(18, 'Amphitheatre-2', 0, 5000, 0, 1, 0, 'Flash Mob!'),
(19, 'Hostel-1', 0, 4000, 0, 1, 0, 'Hostel ganpati donation'),
(20, 'Lobby-1', 0, 2000, 0, 1, 0, 'caught while rehearsing'),
(21, 'Auditorium-2', 0, 3000, 0, 1, 0, 'octaves!'),
(22, 'Canteen-3', 0, 5000, 0, 1, 0, 'you lost a bet with your friend! grilled sandwich and coke'),
(23, 'Dheeraj Xerox-2', 0, 3000, 0, 1, 0, 'you are the CR ! bring xerox for experiment first page for entire class'),
(24, 'BCR-2', 0, 2000, 0, 1, 0, 'Chess Tournament'),
(25, 'Amphitheatre-3', 0, 3000, 0, 1, 0, 'Illusion!'),
(26, 'Poly Ground-2', 0, 2500, 0, 1, 0, 'fine as you played without permission'),
(27, 'Library-2', 0, 2000, 0, 1, 0, 'you were caught talking'),
(28, 'Hostel-2', 0, 5000, 0, 1, 0, 'accommodation'),
(29, 'Auto Stand-2', 0, 1500, 0, 1, 0, 'from college to kstar mall'),
(30, 'CCD-2', 0, 2000, 0, 1, 0, 'cuppa noodles after illusions treat'),
(31, 'Reception-2', 0, 4000, 0, 1, 0, 'you forgot ID card');

-- --------------------------------------------------------

--
-- Table structure for table `event_propertyusermap`
--

CREATE TABLE `event_propertyusermap` (
  `id` bigint(20) NOT NULL,
  `player_id` bigint(20) NOT NULL,
  `properties_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `event_transactions`
--

CREATE TABLE `event_transactions` (
  `id` bigint(20) NOT NULL,
  `action` varchar(100) COLLATE utf8_bin NOT NULL,
  `amount` int(11) NOT NULL,
  `balanceAtTransaction` int(11) NOT NULL,
  `payOrReveive` tinyint(1) NOT NULL,
  `transaction_to` varchar(50) COLLATE utf8_bin NOT NULL,
  `player_id` bigint(20) NOT NULL,
  `data_time` datetime(6) NOT NULL,
  `newBalance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `event_usercount`
--

CREATE TABLE `event_usercount` (
  `id` bigint(20) NOT NULL,
  `login_count` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `event_usercount`
--

INSERT INTO `event_usercount` (`id`, `login_count`, `user_id`) VALUES
(1, 0, 1),
(2, 0, 2),
(3, 0, 3),
(4, 0, 4),
(5, 0, 5),
(6, 0, 6),
(7, 0, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `event_moves`
--
ALTER TABLE `event_moves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Event_moves_current_turn_id_c03abb75_fk_Event_playercoins_id` (`current_turn_id`);

--
-- Indexes for table `event_playercoins`
--
ALTER TABLE `event_playercoins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Event_playercoins_user_id_e8161f6f_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `event_propertycard`
--
ALTER TABLE `event_propertycard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_propertyusermap`
--
ALTER TABLE `event_propertyusermap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Event_propertyusermap_player_id_08615dba_fk_Event_playercoins_id` (`player_id`),
  ADD KEY `Event_propertyuserma_properties_id_6f6d8f88_fk_Event_pro` (`properties_id`);

--
-- Indexes for table `event_transactions`
--
ALTER TABLE `event_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Event_transactions_player_id_9e197e0f_fk_Event_playercoins_id` (`player_id`);

--
-- Indexes for table `event_usercount`
--
ALTER TABLE `event_usercount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Event_usercount_user_id_225846eb_fk_auth_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `event_moves`
--
ALTER TABLE `event_moves`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `event_playercoins`
--
ALTER TABLE `event_playercoins`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `event_propertycard`
--
ALTER TABLE `event_propertycard`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `event_propertyusermap`
--
ALTER TABLE `event_propertyusermap`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `event_transactions`
--
ALTER TABLE `event_transactions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `event_usercount`
--
ALTER TABLE `event_usercount`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `event_moves`
--
ALTER TABLE `event_moves`
  ADD CONSTRAINT `Event_moves_current_turn_id_c03abb75_fk_Event_playercoins_id` FOREIGN KEY (`current_turn_id`) REFERENCES `event_playercoins` (`id`);

--
-- Constraints for table `event_playercoins`
--
ALTER TABLE `event_playercoins`
  ADD CONSTRAINT `Event_playercoins_user_id_e8161f6f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `event_propertyusermap`
--
ALTER TABLE `event_propertyusermap`
  ADD CONSTRAINT `Event_propertyuserma_properties_id_6f6d8f88_fk_Event_pro` FOREIGN KEY (`properties_id`) REFERENCES `event_propertycard` (`id`),
  ADD CONSTRAINT `Event_propertyusermap_player_id_08615dba_fk_Event_playercoins_id` FOREIGN KEY (`player_id`) REFERENCES `event_playercoins` (`id`);

--
-- Constraints for table `event_transactions`
--
ALTER TABLE `event_transactions`
  ADD CONSTRAINT `Event_transactions_player_id_9e197e0f_fk_Event_playercoins_id` FOREIGN KEY (`player_id`) REFERENCES `event_playercoins` (`id`);

--
-- Constraints for table `event_usercount`
--
ALTER TABLE `event_usercount`
  ADD CONSTRAINT `Event_usercount_user_id_225846eb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
