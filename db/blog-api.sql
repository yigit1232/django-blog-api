-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 14 Ağu 2022, 20:56:42
-- Sunucu sürümü: 10.4.21-MariaDB
-- PHP Sürümü: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `blog-api`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `auth_permission`
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
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add Users', 6, 'add_user'),
(22, 'Can change Users', 6, 'change_user'),
(23, 'Can delete Users', 6, 'delete_user'),
(24, 'Can view Users', 6, 'view_user'),
(25, 'Can add Category', 7, 'add_category'),
(26, 'Can change Category', 7, 'change_category'),
(27, 'Can delete Category', 7, 'delete_category'),
(28, 'Can view Category', 7, 'view_category'),
(29, 'Can add Tag', 8, 'add_tag'),
(30, 'Can change Tag', 8, 'change_tag'),
(31, 'Can delete Tag', 8, 'delete_tag'),
(32, 'Can view Tag', 8, 'view_tag'),
(33, 'Can add Recovery', 9, 'add_recovery'),
(34, 'Can change Recovery', 9, 'change_recovery'),
(35, 'Can delete Recovery', 9, 'delete_recovery'),
(36, 'Can view Recovery', 9, 'view_recovery'),
(37, 'Can add Post', 10, 'add_post'),
(38, 'Can change Post', 10, 'change_post'),
(39, 'Can delete Post', 10, 'delete_post'),
(40, 'Can view Post', 10, 'view_post'),
(41, 'Can add Comment', 11, 'add_comment'),
(42, 'Can change Comment', 11, 'change_comment'),
(43, 'Can delete Comment', 11, 'delete_comment'),
(44, 'Can view Comment', 11, 'view_comment'),
(45, 'Can add Profile', 12, 'add_profile'),
(46, 'Can change Profile', 12, 'change_profile'),
(47, 'Can delete Profile', 12, 'delete_profile'),
(48, 'Can view Profile', 12, 'view_profile');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categorys`
--

CREATE TABLE `categorys` (
  `id` bigint(20) NOT NULL,
  `category` varchar(255) NOT NULL,
  `category_slug` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `categorys`
--

INSERT INTO `categorys` (`id`, `category`, `category_slug`) VALUES
(1, 'Software', 'software'),
(2, 'Machine', 'machine');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `content` longtext NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `comments`
--

INSERT INTO `comments` (`id`, `created_date`, `content`, `author_id`, `post_id`) VALUES
(1, '2022-08-09 22:27:21.649772', 'Woww bro amazing', 1, 3),
(2, '2022-08-09 22:32:45.462788', 'berbat', 1, 4),
(3, '2022-08-09 22:32:59.358308', 'Nice !', 1, 4),
(12, '2022-08-13 16:42:05.395796', '31 çeken deniz', 2, 4),
(13, '2022-08-13 16:42:30.626684', '31 çeken deniz', 1, 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-08-09 21:27:40.099590', '1', 'Software', 1, '[{\"added\": {}}]', 7, 1),
(2, '2022-08-09 21:28:14.139949', '1', 'Python', 1, '[{\"added\": {}}]', 8, 1),
(3, '2022-08-09 21:28:17.515376', '2', 'Django', 1, '[{\"added\": {}}]', 8, 1),
(4, '2022-08-09 21:28:29.381734', '1', 'dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir', 1, '[{\"added\": {}}]', 10, 1),
(5, '2022-08-09 21:30:38.412654', '1', 'Softwaree', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 7, 1),
(6, '2022-08-09 21:30:40.822993', '1', 'Software', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 7, 1),
(7, '2022-08-09 21:33:41.152301', '2', 'Machine', 1, '[{\"added\": {}}]', 7, 1),
(8, '2022-08-09 21:33:53.441275', '1', 'dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir', 3, '', 10, 1),
(9, '2022-08-09 21:34:01.487257', '2', 'Django', 2, '[]', 8, 1),
(10, '2022-08-09 21:34:05.446537', '1', 'Python', 2, '[]', 8, 1),
(11, '2022-08-09 21:34:10.624434', '1', 'Software', 2, '[]', 7, 1),
(12, '2022-08-09 21:34:35.627194', '2', 'dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir', 1, '[{\"added\": {}}]', 10, 1),
(13, '2022-08-09 21:39:31.061738', '2', 'dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir', 3, '', 10, 1),
(14, '2022-08-09 21:39:58.950025', '3', 'dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir.', 1, '[{\"added\": {}}]', 10, 1),
(15, '2022-08-09 21:59:15.032802', '4', 'dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir.', 1, '[{\"added\": {}}]', 10, 1),
(16, '2022-08-09 22:26:52.110116', '4', 'dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir.', 2, '[{\"changed\": {\"fields\": [\"Tags\"]}}]', 10, 1),
(17, '2022-08-09 22:27:21.650815', '1', 'admin', 1, '[{\"added\": {}}]', 11, 1),
(18, '2022-08-09 22:27:32.601251', '4', 'hello word i am stick', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 10, 1),
(19, '2022-08-09 22:27:42.195219', '4', 'hello bro', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Slug\"]}}]', 10, 1),
(20, '2022-08-09 22:32:45.464783', '2', 'admin', 1, '[{\"added\": {}}]', 11, 1),
(21, '2022-08-09 22:32:59.359567', '3', 'admin', 1, '[{\"added\": {}}]', 11, 1),
(22, '2022-08-09 22:51:53.304625', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Email address\", \"Name\"]}}]', 6, 1),
(23, '2022-08-09 22:52:43.140042', '1', 'admin', 3, '', 9, 1),
(24, '2022-08-10 16:41:40.859180', '1', 'admin', 1, '[{\"added\": {}}]', 12, 1),
(25, '2022-08-10 16:45:58.203546', '2', 'yigit1232', 2, '[{\"changed\": {\"fields\": [\"Profile image\"]}}]', 12, 1),
(26, '2022-08-10 16:47:29.495966', '2', 'yigit1232', 2, '[{\"changed\": {\"fields\": [\"Bio\"]}}]', 12, 1),
(27, '2022-08-10 17:44:30.312084', '4', 'hello bro', 2, '[{\"changed\": {\"fields\": [\"Likes\"]}}]', 10, 1),
(28, '2022-08-10 17:45:29.710491', '4', 'hello bro', 2, '[{\"changed\": {\"fields\": [\"Likes\"]}}]', 10, 1),
(29, '2022-08-10 17:56:10.120359', '4', 'hello bro', 2, '[{\"changed\": {\"fields\": [\"Likes\"]}}]', 10, 1),
(30, '2022-08-13 16:40:53.943418', '4', 'yigit1232', 3, '', 11, 1),
(31, '2022-08-13 16:41:17.080757', '5', 'yigit1232', 3, '', 11, 1),
(32, '2022-08-13 16:41:20.248919', '7', 'yigit1232', 3, '', 11, 1),
(33, '2022-08-13 16:41:22.282083', '6', 'yigit1232', 3, '', 11, 1),
(34, '2022-08-13 16:41:37.269663', '9', 'yigit1232', 3, '', 11, 1),
(35, '2022-08-13 16:41:37.271627', '8', 'yigit1232', 3, '', 11, 1),
(36, '2022-08-13 16:41:52.994252', '11', 'yigit1232', 3, '', 11, 1),
(37, '2022-08-13 16:41:52.997343', '10', 'yigit1232', 3, '', 11, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'api', 'category'),
(11, 'api', 'comment'),
(10, 'api', 'post'),
(12, 'api', 'profile'),
(9, 'api', 'recovery'),
(8, 'api', 'tag'),
(6, 'api', 'user'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-08-08 22:05:09.753392'),
(2, 'contenttypes', '0002_remove_content_type_name', '2022-08-08 22:05:09.801961'),
(3, 'auth', '0001_initial', '2022-08-08 22:05:10.062620'),
(4, 'auth', '0002_alter_permission_name_max_length', '2022-08-08 22:05:10.113648'),
(5, 'auth', '0003_alter_user_email_max_length', '2022-08-08 22:05:10.119763'),
(6, 'auth', '0004_alter_user_username_opts', '2022-08-08 22:05:10.126607'),
(7, 'auth', '0005_alter_user_last_login_null', '2022-08-08 22:05:10.131656'),
(8, 'auth', '0006_require_contenttypes_0002', '2022-08-08 22:05:10.134649'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2022-08-08 22:05:10.141642'),
(10, 'auth', '0008_alter_user_username_max_length', '2022-08-08 22:05:10.147394'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2022-08-08 22:05:10.156401'),
(12, 'auth', '0010_alter_group_name_max_length', '2022-08-08 22:05:10.171485'),
(13, 'auth', '0011_update_proxy_permissions', '2022-08-08 22:05:10.177256'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2022-08-08 22:05:10.184237'),
(15, 'api', '0001_initial', '2022-08-08 22:05:10.418461'),
(16, 'admin', '0001_initial', '2022-08-08 22:05:10.523564'),
(17, 'admin', '0002_logentry_remove_auto_add', '2022-08-08 22:05:10.531576'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2022-08-08 22:05:10.539450'),
(19, 'sessions', '0001_initial', '2022-08-08 22:05:10.569208'),
(20, 'api', '0002_category_tag_alter_user_options_recovery_post_and_more', '2022-08-09 21:10:00.819320'),
(21, 'api', '0003_alter_post_tags', '2022-08-09 21:39:37.485213'),
(22, 'api', '0004_alter_post_tags', '2022-08-09 21:58:09.573925'),
(23, 'api', '0005_alter_post_likes_alter_post_tags', '2022-08-09 21:58:54.640345'),
(24, 'api', '0006_profile', '2022-08-10 16:40:29.387967');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ckut8dmhcc6fa1nrq2ae67u888vio5m8', '.eJxVjMEOwiAQRP-FsyGApWw9evcbyLLsStXQpLQn47_bJj3ocea9mbeKuC4lro3nOGZ1UVadfruE9OS6g_zAep80TXWZx6R3RR-06duU-XU93L-Dgq1sa-MMYRdCEm_PQh4ZYAuO3SCpF-jJgQchi4lA2BswaIbAaH2XPYn6fAH2eTia:1oLpCZ:U5SScgrT31f7Zj1UtzeNKC9lJvNnMpXV2t7tlBuxTVo', '2022-08-24 17:09:03.045637'),
('ic6ublp6mpre23mw4aiewetai0q6fhby', '.eJxVjMEOwiAQRP-FsyGApWw9evcbyLLsStXQpLQn47_bJj3ocea9mbeKuC4lro3nOGZ1UVadfruE9OS6g_zAep80TXWZx6R3RR-06duU-XU93L-Dgq1sa-MMYRdCEm_PQh4ZYAuO3SCpF-jJgQchi4lA2BswaIbAaH2XPYn6fAH2eTia:1oMsez:sz2AbF5hvero3CY0bLe9A_dVaLl9RuYiPydzSH_Xe-A', '2022-08-27 15:02:45.557841'),
('vdtnqh90tmllqf75ich00k67mylmbue9', '.eJxVjMEOwiAQRP-FsyGApWw9evcbyLLsStXQpLQn47_bJj3ocea9mbeKuC4lro3nOGZ1UVadfruE9OS6g_zAep80TXWZx6R3RR-06duU-XU93L-Dgq1sa-MMYRdCEm_PQh4ZYAuO3SCpF-jJgQchi4lA2BswaIbAaH2XPYn6fAH2eTia:1oLpD0:t3PQh7uT6jDQ6sOwEXNqI3UiG0jxWV8OsO3MiNwyQHk', '2022-08-24 17:09:30.026124');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `edit_date` datetime(6) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `post_image` varchar(100) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `categories_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `created_date`, `edit_date`, `slug`, `post_image`, `author_id`, `categories_id`) VALUES
(3, 'dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir.', 'dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500\'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960\'larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.', '2022-08-09 21:39:58.943056', '2022-08-09 21:39:58.944041', 'dizgi-ve-baski-endustrisinde-kullanilan-migir-metinlerdir', 'media/post_image/12442970_10154197900679578_786241898_n.jpg', 1, 2),
(4, 'hello bro', 'dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500\'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960\'larda Lorem', '2022-08-09 21:59:15.023845', '2022-08-09 22:27:42.192524', 'hello-bro', 'media/post_image/Photo-1.jpeg', 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `posts_likes`
--

CREATE TABLE `posts_likes` (
  `id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `posts_likes`
--

INSERT INTO `posts_likes` (`id`, `post_id`, `user_id`) VALUES
(3, 3, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `posts_tags`
--

CREATE TABLE `posts_tags` (
  `id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `posts_tags`
--

INSERT INTO `posts_tags` (`id`, `post_id`, `tag_id`) VALUES
(5, 3, 1),
(7, 4, 1),
(6, 4, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) NOT NULL,
  `profile_image` varchar(100) NOT NULL,
  `bio` longtext NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `profiles`
--

INSERT INTO `profiles` (`id`, `profile_image`, `bio`, `user_id`) VALUES
(1, 'media/profile_image/904159.jpg', 'Helllo', 1),
(2, 'media/profile_image/razer-ths-wreath-wallpaper_1920x1080.png', '31', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `recoveries`
--

CREATE TABLE `recoveries` (
  `id` bigint(20) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `tag_slug` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `tags`
--

INSERT INTO `tags` (`id`, `tag`, `tag_slug`) VALUES
(1, 'Python', 'python'),
(2, 'Django', 'django');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `password`, `last_login`, `is_superuser`, `username`, `email`, `is_staff`, `is_active`, `date_joined`, `name`) VALUES
(1, 'pbkdf2_sha256$390000$TqVgKUNRdnU2BLXbgRsX5m$IXjpvPtI2EbBP/0ec2Ji0nPAb1jpJtkXanEuBKMVLg8=', '2022-08-13 15:02:45.548491', 1, 'admin', 'yigitucun9@hotmail.com', 1, 1, '2022-08-08 22:05:26.000000', 'admin'),
(2, 'pbkdf2_sha256$390000$YaShf0nnmucKiMFYaC7YwA$XwHHSVbADb1RQ6o8BgAj6Hkuudlkd3ODDlR9S6cPvkQ=', '2022-08-10 16:48:51.675335', 0, 'yigit1232', 'yigit_ali_ucun@hotmail.com', 0, 1, '2022-08-10 16:44:38.284474', 'yiğit ali');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users_groups`
--

CREATE TABLE `users_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users_user_permissions`
--

CREATE TABLE `users_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Tablo için indeksler `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Tablo için indeksler `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Tablo için indeksler `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_slug` (`category_slug`);

--
-- Tablo için indeksler `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_author_id_7a23bb5d_fk_users_id` (`author_id`),
  ADD KEY `comments_post_id_67cfce36_fk_posts_id` (`post_id`);

--
-- Tablo için indeksler `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_users_id` (`user_id`);

--
-- Tablo için indeksler `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Tablo için indeksler `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Tablo için indeksler `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `posts_author_id_099b8aca_fk_users_id` (`author_id`),
  ADD KEY `posts_categories_id_fa221b13_fk_categorys_id` (`categories_id`);

--
-- Tablo için indeksler `posts_likes`
--
ALTER TABLE `posts_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_likes_post_id_user_id_777b2fe3_uniq` (`post_id`,`user_id`),
  ADD KEY `posts_likes_user_id_bf4dd039_fk_users_id` (`user_id`);

--
-- Tablo için indeksler `posts_tags`
--
ALTER TABLE `posts_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_tags_post_id_tag_id_46ebeb76_uniq` (`post_id`,`tag_id`),
  ADD KEY `posts_tags_tag_id_5b70f6dd_fk_tags_id` (`tag_id`);

--
-- Tablo için indeksler `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_user_id_36580373_fk_users_id` (`user_id`);

--
-- Tablo için indeksler `recoveries`
--
ALTER TABLE `recoveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recoveries_user_id_fbb1eed5_fk_users_id` (`user_id`);

--
-- Tablo için indeksler `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag_slug` (`tag_slug`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Tablo için indeksler `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_groups_user_id_group_id_fc7788e8_uniq` (`user_id`,`group_id`),
  ADD KEY `users_groups_group_id_2f3517aa_fk_auth_group_id` (`group_id`);

--
-- Tablo için indeksler `users_user_permissions`
--
ALTER TABLE `users_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_permissions_user_id_permission_id_3b86cbdf_uniq` (`user_id`,`permission_id`),
  ADD KEY `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` (`permission_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Tablo için AUTO_INCREMENT değeri `categorys`
--
ALTER TABLE `categorys`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Tablo için AUTO_INCREMENT değeri `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Tablo için AUTO_INCREMENT değeri `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Tablo için AUTO_INCREMENT değeri `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `posts_likes`
--
ALTER TABLE `posts_likes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `posts_tags`
--
ALTER TABLE `posts_tags`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `recoveries`
--
ALTER TABLE `recoveries`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `users_user_permissions`
--
ALTER TABLE `users_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Tablo kısıtlamaları `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Tablo kısıtlamaları `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_author_id_7a23bb5d_fk_users_id` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comments_post_id_67cfce36_fk_posts_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Tablo kısıtlamaları `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Tablo kısıtlamaları `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_author_id_099b8aca_fk_users_id` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `posts_categories_id_fa221b13_fk_categorys_id` FOREIGN KEY (`categories_id`) REFERENCES `categorys` (`id`);

--
-- Tablo kısıtlamaları `posts_likes`
--
ALTER TABLE `posts_likes`
  ADD CONSTRAINT `posts_likes_post_id_fdc16e31_fk_posts_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `posts_likes_user_id_bf4dd039_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Tablo kısıtlamaları `posts_tags`
--
ALTER TABLE `posts_tags`
  ADD CONSTRAINT `posts_tags_post_id_f1d664f2_fk_posts_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `posts_tags_tag_id_5b70f6dd_fk_tags_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Tablo kısıtlamaları `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_36580373_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Tablo kısıtlamaları `recoveries`
--
ALTER TABLE `recoveries`
  ADD CONSTRAINT `recoveries_user_id_fbb1eed5_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Tablo kısıtlamaları `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `users_groups_group_id_2f3517aa_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `users_groups_user_id_f500bee5_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Tablo kısıtlamaları `users_user_permissions`
--
ALTER TABLE `users_user_permissions`
  ADD CONSTRAINT `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `users_user_permissions_user_id_92473840_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
