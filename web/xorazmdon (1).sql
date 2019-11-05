-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2019 at 03:35 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xorazmdon`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `code`, `icon`, `parent_id`, `sort`, `lang_id`, `page_id`, `status`, `active`) VALUES
(1, 'Alohida bo\'lim', 'alohida', '', 1, 0, 0, 0, 1, 1),
(2, 'Мактаб ҳақида', 'maktab-haqida', '', 1, 0, 1, -1, 1, 1),
(3, 'Мактаб ҳақида', 'haqida', '', 2, 0, 1, 4, 1, 1),
(4, 'Рахбарият', 'rahbariyat', '', 2, 0, 1, 5, 1, 1),
(5, 'Мураббийлар', 'murabbiylar', '', 2, 0, 1, 9, 1, 1),
(6, 'Мактаб тузилмаси', 'maktab-tuzilmasi', '', 2, 0, 1, 6, 1, 1),
(7, 'Пресс-марказ', 'press-markaz', '', 1, 0, 1, -1, 1, 1),
(8, 'Янгиликлар', 'yangiliklar', '', 7, 0, 1, -1, 1, 1),
(9, 'Тадбирлар', 'tadbirlar', '', 7, 0, 1, -1, 1, 1),
(10, 'Статистика ва Таҳлил', 'statistika-va-tahlil', '', 7, 0, 1, -1, 1, 1),
(11, 'Ятиқлар', 'yutuqlar', '', 14, 0, 1, -1, 1, 1),
(12, 'Спорт', 'sport', '', 14, 0, 1, -1, 1, 1),
(13, 'Анонс ва эълонлар', 'anons-va-elonlar', '', 7, 0, 1, -1, 1, 1),
(14, 'Спорт', 'sport-haqida', '', 1, 0, 1, -1, 1, 1),
(15, 'Фотогалерея', 'photo-gallery', '', 7, 0, 1, -1, 1, 1),
(16, 'Видео галерея', 'video-gallery', '', 7, 0, 1, -1, 1, 1),
(17, 'Ҳужжатлар', 'hujjatlar', '', 1, 0, 1, -1, 1, 1),
(18, 'Жисмоний тарбия ва спортга оид ҳужжатлар', 'sport-docs', '', 17, 0, 1, -1, 1, 1),
(19, 'ЎзР Президентининг спортга оид қарор, Фармон ва Фармоишлари', 'uzr-prezidenti-qaror-farmonlari', '', 17, 0, 1, -1, 1, 1),
(20, 'Вазирлар маҳкамасининг спортга оид қарорлари', 'Vazirlar Mahkamasining sport to\'g\'risidagi Qarorlari', '', 17, 0, 1, -1, 1, 1),
(21, 'Ҳужжатлар', 'sport-hujjatlar', '', 17, 0, 1, -1, 1, 1),
(22, 'Ҳукумат қарор ва фармоишлари', 'hukumat-qaror-va-farmoishlari', '', 17, 0, 1, -1, 1, 1),
(23, 'Туризм', 'turizm', '', 1, 0, 1, -1, 1, 1),
(24, 'Интерактив хизматлар', 'interaktik-xizmatlar', '', 1, 0, 1, -1, 1, 1),
(25, 'Бўш иш ўринлари', 'free-jobs', '', 2, 0, 1, 7, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `lang_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1',
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `preview` varchar(255) NOT NULL,
  `detail` varchar(5000) NOT NULL,
  `file` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `language`, `code`, `icon`, `type`, `status`, `active`) VALUES
(1, 'O\'zbek', 'uz', 'uz.png', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `loginform_cache`
--

CREATE TABLE `loginform_cache` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `configuration` text NOT NULL,
  `times` int(11) NOT NULL DEFAULT '0',
  `blocked` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `active` int(11) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(500) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'default.png',
  `cat_id` int(11) NOT NULL,
  `preview` text NOT NULL,
  `detail` longtext NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `show_counter` int(11) NOT NULL DEFAULT '0',
  `slider` int(11) NOT NULL DEFAULT '0',
  `vote` int(11) NOT NULL DEFAULT '0',
  `tags` varchar(500) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL,
  `modify_by` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1',
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `preivew` varchar(500) NOT NULL,
  `detail` longtext NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `show_counter` int(11) NOT NULL DEFAULT '0',
  `slider` int(11) NOT NULL DEFAULT '0',
  `vote` int(11) NOT NULL DEFAULT '0',
  `tags` varchar(500) NOT NULL,
  `author_id` int(11) NOT NULL,
  `modify_by` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1',
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `name`, `code`, `image`, `preivew`, `detail`, `sort`, `show_counter`, `slider`, `vote`, `tags`, `author_id`, `modify_by`, `lang_id`, `created`, `updated`, `status`, `active`) VALUES
(4, 'Мактаб-интернати ҳақида', 'Maktab-internati-kh-ak-ida-2019-06-21', 'default.jpg', 'Мактаб-интернати ҳақида', '<p>Мактаб-интернати 1992 йил 1-сон болалар ва ўсмирлар спорт мактаби сифатида ташкил этилган бўлиб, 2000 йилдан вилоят спорт мактаб-интеранти, 2010 йилдан 12-сон футбол бўйича давлат ихтисослаштирилган мактаб-интернати, 2018 йилдан Хива шаҳар олимпия ва миллий спорт турлари бўйича давлат ихтисослаштирилган мактаб-интернати этиб қайта ташкил этилди. Ҳозирда спортнинг бокс, кураш, эркин кураш, оғир атлетика, футбол ва каратэ турлари бўйича моҳир спортчилар тайёрланмоқда.</p>', 0, 1, 0, 0, '', 2, 2, 1, '2019-06-21 09:23:00', '2019-06-21 12:50:53', 1, 1),
(5, 'Раҳбарият', 'Rakh-bariyat-2019-06-21', 'default.jpg', 'Раҳбарият', '<p>Директор &ndash;Ибадуллаев Ибадулла Хасанович. 2018 йил октябрда директор лавозимига тайинланган. Мутахассислиги жисмоний тарбия ўқитувчиси.</p>\r\n<p>Ўқув ишлари бўйича директор ўринбосари &ndash; Абдуллаев Ибадулла Абдуллаевич . 2016 йил мартда директор ўринбосари лавозимига тайнланган. Мутахассислиги ҳуқуқ фани ўқитувчиси. &nbsp;</p>\r\n<p>Спорт ишлари бўйича директор ўринбосари- Абдалниязов Нураддин Фарҳадович. 2018 йил ноябрда&nbsp; директор ўринбосари лавозимига тайнланган. Мутахассислиги &ndash; оғир &nbsp;атлетика мураббийси.</p>\r\n<p>Маънавий &ndash;маърифий ишлар бўйича директор ўринбосари &ndash; Бекчанов&nbsp; Норбек Пўлатович. 2018 йил ноябрда директор ўринбосари лавозимига тайинланган. Мутахассислиги &ndash; кураш&nbsp; мураббийси.&nbsp;</p>', 0, 2, 0, 0, '', 2, 2, 1, '2019-06-21 09:24:00', '2019-06-21 12:50:56', 1, 1),
(6, 'Мактаб – интернат тузилмаси', 'Maktab---internat-tuzilmasi-2019-06-21', 'default.jpg', 'Мактаб – интернат тузилмаси', '<p><img style=\"width: 100%;\" src=\"/../../../uploads/tuzilma.png\" alt=\"\" /></p>', 0, 1, 0, 0, '', 2, 2, 1, '2019-06-21 09:24:00', '2019-06-21 12:51:02', 1, 1),
(7, 'Бўш иш ўринлари', 'Bush-ish-urinlari-2019-06-21', 'default.jpg', 'Бўш иш ўринлари', '<p>&nbsp;</p>\r\n<p>Физика&nbsp; фани ўқитувчиси (8соат)</p>\r\n<p>География фани ўқитувчиси (10 соат)</p>\r\n<p>Оғир атлетика мураббийси (0,5 ставка)</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Ишга қабул қилиш вақтида талаб қилинадиган&nbsp; хужжатлар:</strong></p>\r\n<p>1.Паспорт;</p>\r\n<p>2.Мехнат дафтарчаси;</p>\r\n<p>3.Харбий билет ёки харбий хисобда турганлик ҳақидаги&nbsp; гувохнома;</p>\r\n<p>4.Олий ёки ўрта махсус ўқув юртини&nbsp; тамомлаганлиги тўғрисидаги диплом ёки мазкур&nbsp; ишни бажариш ҳуқуқни берадиган гувохнома ёки&nbsp; бошқа тегишли&nbsp; хужжат;</p>\r\n<p>5.Меҳнат биржасидан йўлланма;</p>\r\n<p>6.Тиббий маълумотнома;</p>\r\n<p>7.Стир&nbsp; раками;</p>\r\n<p>8.Яшаш жойидан маълумотнома;</p>\r\n<p>9.Фотосурат&nbsp; 3х4&nbsp;&nbsp; 2 дона;</p>\r\n<p>10.ШЖБПХ&nbsp; дафтарчаси</p>', 0, 2, 0, 0, '', 2, 2, 1, '2019-06-21 09:26:00', '2019-06-21 12:51:05', 1, 1),
(8, 'Хива шаҳар олимпия ва миллий спорт турлари бўйича давлат ихтисослаштирилган мактаб интернатининг  юқори натижаларга эришган спортчилар ', 'Hiva-shakh-ar-olimpiya-va-milliy-sport-turlari-buyicha-davlat-ihtisoslashtirilgan-maktab-internatining--yuk-ori-natizhalarga-erishgan-sportchilar--2019-06-21', 'default.jpg', 'Хива шаҳар олимпия ва миллий спорт турлари бўйича давлат ихтисослаштирилган мактаб интернатининг  юқори натижаларга эришган спортчилар ', '<table class=\"table table-responsive table-hover table-bordered\">\r\n<tbody>\r\n<tr style=\"height: 50px;\">\r\n<td style=\"text-align: center; height: 50px;\" colspan=\"6\"><strong>Хива шаҳар олимпия ва миллий спорт турлари бўйича давлат ихтисослаштирилган мактаб интернатининг&nbsp; юқори натижаларга эришган спортчилар&nbsp;</strong></td>\r\n</tr>\r\n<tr style=\"height: 50px;\">\r\n<td style=\"text-align: center; height: 50px;\" colspan=\"6\"><strong>РЎЙҲАТИ</strong></td>\r\n</tr>\r\n<tr style=\"height: 68px;\">\r\n<td style=\"height: 68px; width: 43px; text-align: center;\">№</td>\r\n<td style=\"height: 68px; width: 197px; text-align: center;\">Спортчининг Ф.И.Ш</td>\r\n<td style=\"height: 68px; width: 127px; text-align: center;\">Туғилган йили ва санаси</td>\r\n<td style=\"height: 68px; width: 299px; text-align: center;\">Яшаш манзили&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Туман,МФЙ номи)</td>\r\n<td style=\"height: 68px; width: 152px; text-align: center;\">Спорт тури</td>\r\n<td style=\"height: 68px; width: 406px; text-align: center;\">Эришгавн натижаси</td>\r\n</tr>\r\n<tr style=\"height: 50px;\">\r\n<td style=\"height: 50px; width: 43px; text-align: center;\">1</td>\r\n<td style=\"height: 50px; width: 197px; text-align: center;\">Назирбоев Отабек</td>\r\n<td style=\"height: 50px; width: 127px; text-align: center;\">16.02.2004</td>\r\n<td style=\"height: 50px; width: 299px; text-align: center;\">Хива шаҳар Пахлавон махмуд кўчаси</td>\r\n<td style=\"height: 50px; width: 152px; text-align: center;\">Эркин кураш</td>\r\n<td style=\"height: 50px; width: 406px; text-align: center;\">09-13.03.2019 йил Ўзбекистон кубоги 1-ўрин</td>\r\n</tr>\r\n<tr style=\"height: 50px;\">\r\n<td style=\"height: 50px; width: 43px; text-align: center;\">2</td>\r\n<td style=\"height: 50px; width: 197px; text-align: center;\">Комилов Азизбек</td>\r\n<td style=\"height: 50px; width: 127px; text-align: center;\">03.02.2008</td>\r\n<td style=\"height: 50px; width: 299px; text-align: center;\">Хива шаҳар Оҳунбобоев кўчаси 14 уй</td>\r\n<td style=\"height: 50px; width: 152px; text-align: center;\">Каратэ вкф</td>\r\n<td style=\"height: 50px; width: 406px; text-align: center;\">25-27.03.2019 йил Ўзбекистон чемпионати 3-ўрин</td>\r\n</tr>\r\n<tr style=\"height: 50px;\">\r\n<td style=\"height: 50px; width: 43px; text-align: center;\">3</td>\r\n<td style=\"height: 50px; width: 197px; text-align: center;\">Қурбонов Сирожбек</td>\r\n<td style=\"height: 50px; width: 127px; text-align: center;\">21.09.2005</td>\r\n<td style=\"height: 50px; width: 299px; text-align: center;\">Хива туман Дошёқ қишлоғи</td>\r\n<td style=\"height: 50px; width: 152px; text-align: center;\">Каратэ вкф</td>\r\n<td style=\"height: 50px; width: 406px; text-align: center;\">25-27.03.2019 йил Ўзбекистон чемпионати 3-ўрин</td>\r\n</tr>\r\n<tr style=\"height: 50px;\">\r\n<td style=\"height: 50px; width: 43px; text-align: center;\">4</td>\r\n<td style=\"height: 50px; width: 197px; text-align: center;\">Аминбоев Абдулазиз</td>\r\n<td style=\"height: 50px; width: 127px; text-align: center;\">17.02.2007</td>\r\n<td style=\"height: 50px; width: 299px; text-align: center;\">Хива туман Гандимён қишлоғи</td>\r\n<td style=\"height: 50px; width: 152px; text-align: center;\">Каратэ вкф</td>\r\n<td style=\"height: 50px; width: 406px; text-align: center;\">25-27.03.2019 йил Ўзбекистон чемпионати 3-ўрин</td>\r\n</tr>\r\n<tr style=\"height: 50px;\">\r\n<td style=\"height: 50px; width: 43px; text-align: center;\">5</td>\r\n<td style=\"height: 50px; width: 197px; text-align: center;\">Ахмедов Исфандиёр</td>\r\n<td style=\"height: 50px; width: 127px; text-align: center;\">30.03.2005</td>\r\n<td style=\"height: 50px; width: 299px; text-align: center;\">Хива туман Шомохулум қишлоғи</td>\r\n<td style=\"height: 50px; width: 152px; text-align: center;\">Каратэ вкф</td>\r\n<td style=\"height: 50px; width: 406px; text-align: center;\">25-27.03.2019 йил Ўзбекистон чемпионати 3-ўрин</td>\r\n</tr>\r\n<tr style=\"height: 50px;\">\r\n<td style=\"height: 50px; width: 43px; text-align: center;\">6</td>\r\n<td style=\"height: 50px; width: 197px; text-align: center;\">Қабулбоев Рахматжон</td>\r\n<td style=\"height: 50px; width: 127px; text-align: center;\">13.12.2005</td>\r\n<td style=\"height: 50px; width: 299px; text-align: center;\">Хива туман Дошёқ қишлғи</td>\r\n<td style=\"height: 50px; width: 152px; text-align: center;\">Бокс</td>\r\n<td style=\"height: 50px; width: 406px; text-align: center;\">21-27.04.2019 йил Ўзбекистон чемпионати 3-ўрин</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"text-align: right;\">мактаб-интернат СИБДЎ&nbsp; &nbsp;&nbsp; Н.Абдалниязов</p>', 5, 0, 0, 0, '', 2, 2, 1, '2019-06-21 09:27:00', '2019-06-21 12:37:49', 1, 1),
(9, 'М А Ъ Л У М О Т', 'Hiva-shahar-olimpiya-va-milliy-sport-turlari-buyicha-davlat-ihtisoslashtirilgan-maktab-internati-trener-uk-ituvchilari-hak-ida-2019-06-21', 'default.jpg', 'Хива шахар олимпия ва миллий спорт турлари бўйича давлат ихтисослаштирилган мактаб-интернати тренер-ўқитувчилари хақида \r\nМ А Ъ Л У М О Т\r\n', '<p style=\"text-align: center;\"><strong>Хива шахар олимпия ва миллий спорт турлари бўйича давлат ихтисослаштирилган мактаб-интернати тренер-ўқитувчил</strong><strong>а</strong><strong>ри хақида </strong></p>\r\n<p style=\"text-align: center;\"><strong>М А Ъ Л У М О Т</strong></p>\r\n<table class=\"table table-hover table-responsive table-bordered\" style=\"height: 2055px;\" width=\"709\">\r\n<tbody>\r\n<tr style=\"height: 143px; text-align: center;\">\r\n<td style=\"height: 143px; width: 56px;\">\r\n<p><strong>№</strong></p>\r\n</td>\r\n<td style=\"height: 143px; width: 242px;\">\r\n<p><strong>Ф.И.Ш</strong></p>\r\n</td>\r\n<td style=\"height: 143px; width: 148px;\">\r\n<p><strong>Туғилган йили</strong></p>\r\n</td>\r\n<td style=\"height: 143px; width: 116px;\">\r\n<p><strong>Спорт тури</strong></p>\r\n</td>\r\n<td style=\"height: 143px; width: 307px;\">\r\n<p><strong>Маълумоти</strong></p>\r\n<p><strong>мутахасислиги</strong></p>\r\n</td>\r\n<td style=\"height: 143px; width: 112px;\">\r\n<p><strong>Мехнат стажи</strong></p>\r\n</td>\r\n<td style=\"height: 143px; width: 243px;\">\r\n<p><strong>Манзили</strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 110px; text-align: center;\">\r\n<td style=\"height: 110px; width: 56px;\">\r\n<p><strong>1</strong></p>\r\n</td>\r\n<td style=\"height: 110px; width: 242px;\">\r\n<p>Алиакберов Наиль Борисович</p>\r\n</td>\r\n<td style=\"height: 110px; width: 148px;\">\r\n<p>22.03.1954 й</p>\r\n</td>\r\n<td style=\"height: 110px; width: 116px;\">\r\n<p>Бокс</p>\r\n</td>\r\n<td style=\"height: 110px; width: 307px;\">\r\n<p>Ўзбекистон Давлат жисмоний тарбия институти,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1977 й.</p>\r\n</td>\r\n<td style=\"height: 110px; width: 112px;\">\r\n<p>34 йил</p>\r\n</td>\r\n<td style=\"height: 110px; width: 243px;\">\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Хива шахар</p>\r\n<p>Дўстлик&nbsp;&nbsp; махалла 2//3 уй</p>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 100px; text-align: center;\">\r\n<td style=\"height: 100px; width: 56px;\">\r\n<p><strong>2</strong><strong>&nbsp; </strong></p>\r\n</td>\r\n<td style=\"height: 100px; width: 242px;\">\r\n<p>Саъдуллаев Илхамбек Матяқуб ўғли</p>\r\n</td>\r\n<td style=\"height: 100px; width: 148px;\">\r\n<p>10.04.1979 й</p>\r\n</td>\r\n<td style=\"height: 100px; width: 116px;\">\r\n<p>Бокс</p>\r\n</td>\r\n<td style=\"height: 100px; width: 307px;\">\r\n<p>Урганч Давлат университети. 2010 й.</p>\r\n</td>\r\n<td style=\"height: 100px; width: 112px;\">\r\n<p>12 йил</p>\r\n</td>\r\n<td style=\"height: 100px; width: 243px;\">\r\n<p>Хива шахар&nbsp; Дўстлик&nbsp;&nbsp; махалла 18/12</p>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 118px; text-align: center;\">\r\n<td style=\"height: 118px; width: 56px;\">\r\n<p><strong>3</strong></p>\r\n</td>\r\n<td style=\"height: 118px; width: 242px;\">\r\n<p>Ибадуллаев Руслан Хурматович</p>\r\n</td>\r\n<td style=\"height: 118px; width: 148px;\">\r\n<p>31.07.1987 й</p>\r\n</td>\r\n<td style=\"height: 118px; width: 116px;\">\r\n<p>Бокс</p>\r\n</td>\r\n<td style=\"height: 118px; width: 307px;\">\r\n<p>Урганч Давлат университети. 1 босқич талабаси .(кечки)</p>\r\n</td>\r\n<td style=\"height: 118px; width: 112px;\">\r\n<p>13</p>\r\n</td>\r\n<td style=\"height: 118px; width: 243px;\">\r\n<p>Хива шаҳри</p>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 118px; text-align: center;\">\r\n<td style=\"height: 118px; width: 56px;\">\r\n<p><strong>4</strong></p>\r\n</td>\r\n<td style=\"height: 118px; width: 242px;\">\r\n<p>Аллаберганов Жайхунбек Юсуфбоевич</p>\r\n</td>\r\n<td style=\"height: 118px; width: 148px;\">\r\n<p>1.10.1988</p>\r\n</td>\r\n<td style=\"height: 118px; width: 116px;\">\r\n<p>Оғир атлетика</p>\r\n</td>\r\n<td style=\"height: 118px; width: 307px;\">\r\n<p>Ўзбекистон Давлат жисмоний тарбия институти,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2014 й</p>\r\n</td>\r\n<td style=\"height: 118px; width: 112px;\">\r\n<p>3</p>\r\n</td>\r\n<td style=\"height: 118px; width: 243px;\">\r\n<p>Хива шаҳри Тошкент кўчаси 33-уй</p>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 143px; text-align: center;\">\r\n<td style=\"height: 143px; width: 56px;\">\r\n<p><strong>5</strong></p>\r\n</td>\r\n<td style=\"height: 143px; width: 242px;\">\r\n<p>Мадримов Ойбек Қадамбаевич</p>\r\n</td>\r\n<td style=\"height: 143px; width: 148px;\">\r\n<p>14.07.1985</p>\r\n</td>\r\n<td style=\"height: 143px; width: 116px;\">\r\n<p>Оғир атлетика</p>\r\n</td>\r\n<td style=\"height: 143px; width: 307px;\">\r\n<p>Республика олимпия заҳиралари коллежи 2004 й</p>\r\n</td>\r\n<td style=\"height: 143px; width: 112px;\">\r\n<p>15 йил</p>\r\n</td>\r\n<td style=\"height: 143px; width: 243px;\">\r\n<p>Хива шахар</p>\r\n<p>&nbsp;Бинокор 2/27 уй</p>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 118px; text-align: center;\">\r\n<td style=\"height: 118px; width: 56px;\">\r\n<p><strong>6</strong></p>\r\n</td>\r\n<td style=\"height: 118px; width: 242px;\">\r\n<p>Икромов Жасурбек Шухр ўғли</p>\r\n</td>\r\n<td style=\"height: 118px; width: 148px;\">\r\n<p>24.07.1991</p>\r\n</td>\r\n<td style=\"height: 118px; width: 116px;\">\r\n<p>Эркин кураш</p>\r\n</td>\r\n<td style=\"height: 118px; width: 307px;\">\r\n<p>Ўзбекистон Давлат жисмоний тарбия институти,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2014 й</p>\r\n</td>\r\n<td style=\"height: 118px; width: 112px;\">\r\n<p>4</p>\r\n</td>\r\n<td style=\"height: 118px; width: 243px;\">\r\n<p>Хива шахри Р.Назарий 13 уй</p>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 100px; text-align: center;\">\r\n<td style=\"height: 100px; width: 56px;\">\r\n<p><strong>7</strong></p>\r\n</td>\r\n<td style=\"height: 100px; width: 242px;\">\r\n<p>Иброхимов Иззатбек Икрам ўғли</p>\r\n</td>\r\n<td style=\"height: 100px; width: 148px;\">\r\n<p>17.06.1993</p>\r\n</td>\r\n<td style=\"height: 100px; width: 116px;\">\r\n<p>Эркин кураш</p>\r\n</td>\r\n<td style=\"height: 100px; width: 307px;\">\r\n<p>Урганч олимпия захиралари коллежи 2012 й</p>\r\n</td>\r\n<td style=\"height: 100px; width: 112px;\">\r\n<p>3 йил</p>\r\n</td>\r\n<td style=\"height: 100px; width: 243px;\">\r\n<p>Хива шахар Қ.Яқубов кўчаси 29 уй</p>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 118px; text-align: center;\">\r\n<td style=\"height: 118px; width: 56px;\">\r\n<p><strong>8</strong></p>\r\n</td>\r\n<td style=\"height: 118px; width: 242px;\">\r\n<p>Иброгимов Рустамбек Отаназарович</p>\r\n</td>\r\n<td style=\"height: 118px; width: 148px;\">\r\n<p>02.10.1959</p>\r\n</td>\r\n<td style=\"height: 118px; width: 116px;\">\r\n<p>Эркин кураш</p>\r\n</td>\r\n<td style=\"height: 118px; width: 307px;\">\r\n<p>Ўзбекистон Давлат жисмоний тарбия институти,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2015 й</p>\r\n</td>\r\n<td style=\"height: 118px; width: 112px;\">\r\n<p>34 йил</p>\r\n</td>\r\n<td style=\"height: 118px; width: 243px;\">\r\n<p>Хива шахар Қ.Болтаев&nbsp; кўчаси&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10 уй</p>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 186px; text-align: center;\">\r\n<td style=\"height: 186px; width: 56px;\">\r\n<p><strong>9</strong></p>\r\n</td>\r\n<td style=\"height: 186px; width: 242px;\">\r\n<p>Каримов Хушнуд Рустамович</p>\r\n</td>\r\n<td style=\"height: 186px; width: 148px;\">\r\n<p>05.08.1967</p>\r\n</td>\r\n<td style=\"height: 186px; width: 116px;\">\r\n<p>Футбол</p>\r\n</td>\r\n<td style=\"height: 186px; width: 307px;\">\r\n<p>Хива педагогика</p>\r\n<p>касб &ndash; ҳунар коллежи.</p>\r\n<p>2015 й</p>\r\n</td>\r\n<td style=\"height: 186px; width: 112px;\">\r\n<p>23 йил</p>\r\n</td>\r\n<td style=\"height: 186px; width: 243px;\">\r\n<p>Хива шахар</p>\r\n<p>Боғи шамол&nbsp; кўчаси 80 уй</p>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 143px; text-align: center;\">\r\n<td style=\"height: 143px; width: 56px;\">\r\n<p><strong>10</strong></p>\r\n</td>\r\n<td style=\"height: 143px; width: 242px;\">\r\n<p>Бабажанов Ботир Қурбонович</p>\r\n</td>\r\n<td style=\"height: 143px; width: 148px;\">\r\n<p>18.03.1963</p>\r\n</td>\r\n<td style=\"height: 143px; width: 116px;\">\r\n<p>Футбол</p>\r\n</td>\r\n<td style=\"height: 143px; width: 307px;\">\r\n<p>Ўзбекистон Давлат жисмоний тарбия институти,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1989&nbsp; й</p>\r\n</td>\r\n<td style=\"height: 143px; width: 112px;\">\r\n<p>36 йил</p>\r\n</td>\r\n<td style=\"height: 143px; width: 243px;\">\r\n<p>Хива шахар</p>\r\n<p>Дўстлик&nbsp;&nbsp; кўчаси 2 уй</p>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 186px; text-align: center;\">\r\n<td style=\"height: 186px; width: 56px;\">\r\n<p><strong>1</strong><strong>1</strong></p>\r\n</td>\r\n<td style=\"height: 186px; width: 242px;\">\r\n<p>Исмаилов Равшанбек Рустамович</p>\r\n</td>\r\n<td style=\"height: 186px; width: 148px;\">\r\n<p>08.06.1975</p>\r\n</td>\r\n<td style=\"height: 186px; width: 116px;\">\r\n<p>Футбол</p>\r\n</td>\r\n<td style=\"height: 186px; width: 307px;\">\r\n<p>Урганч Давлат университети. 2009 й.</p>\r\n</td>\r\n<td style=\"height: 186px; width: 112px;\">\r\n<p>22 йил</p>\r\n</td>\r\n<td style=\"height: 186px; width: 243px;\">\r\n<p>Хива шахар</p>\r\n<p>Дўстлик&nbsp;&nbsp; махалла</p>\r\n<p>7 уй</p>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 186px; text-align: center;\">\r\n<td style=\"height: 186px; width: 56px;\">\r\n<p><strong>1</strong><strong>2</strong></p>\r\n</td>\r\n<td style=\"height: 186px; width: 242px;\">\r\n<p>Ибрагимов Фаррух Рустамбек ўғли</p>\r\n</td>\r\n<td style=\"height: 186px; width: 148px;\">\r\n<p>03.09.1992</p>\r\n</td>\r\n<td style=\"height: 186px; width: 116px;\">\r\n<p>Футбол</p>\r\n</td>\r\n<td style=\"height: 186px; width: 307px;\">\r\n<p>Ўзбекистон Давлат жисмоний тарбия институти,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2015 й</p>\r\n</td>\r\n<td style=\"height: 186px; width: 112px;\">\r\n<p>2 йил</p>\r\n</td>\r\n<td style=\"height: 186px; width: 243px;\">\r\n<p>Хива шахар</p>\r\n<p>Истиқбол кўчаси</p>\r\n<p>6 уй</p>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 186px; text-align: center;\">\r\n<td style=\"height: 186px; width: 56px;\">\r\n<p><strong>1</strong><strong>3</strong></p>\r\n</td>\r\n<td style=\"height: 186px; width: 242px;\">\r\n<p>Давлетов Фурқат Рўзматбой ўғли</p>\r\n</td>\r\n<td style=\"height: 186px; width: 148px;\">\r\n<p>17.08.1994</p>\r\n</td>\r\n<td style=\"height: 186px; width: 116px;\">\r\n<p>Футбол</p>\r\n</td>\r\n<td style=\"height: 186px; width: 307px;\">\r\n<p>Ўзбекистон Давлат жисмоний тарбия институти,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2016 й</p>\r\n</td>\r\n<td style=\"height: 186px; width: 112px;\">\r\n<p>2 йил</p>\r\n</td>\r\n<td style=\"height: 186px; width: 243px;\">\r\n<p>Хива шахар С.Муғоний</p>\r\n<p>кўчаси 15 уй</p>\r\n<p>&nbsp;</p>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 100px;\">\r\n<td style=\"height: 100px; width: 56px; text-align: center;\">\r\n<p><strong>14</strong></p>\r\n</td>\r\n<td style=\"height: 100px; width: 242px; text-align: center;\">\r\n<p>Сабиров Бекпўлот Исмаил ўғли</p>\r\n</td>\r\n<td style=\"height: 100px; width: 148px; text-align: center;\">\r\n<p>04.06.1993</p>\r\n</td>\r\n<td style=\"height: 100px; width: 116px; text-align: center;\">\r\n<p>Каратэ вкф</p>\r\n</td>\r\n<td style=\"height: 100px; width: 307px; text-align: center;\">\r\n<p>Урганч Давлат университети. 2014 й</p>\r\n</td>\r\n<td style=\"height: 100px; width: 112px; text-align: center;\">\r\n<p>4</p>\r\n</td>\r\n<td style=\"height: 100px; width: 243px;\">\r\n<p style=\"text-align: center;\">Хива туман &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Эски қиёт 21 уй</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong>Хива шахар олимпия ва миллий спорт турлари</strong></p>\r\n<p>&nbsp; <strong>бўйича давлат ихтисослаштирилган</strong></p>\r\n<p>&nbsp; <strong>мактаб-интернати директори:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; И.Ибадуллаев</strong></p>', 3, 2, 0, 0, '', 2, 2, 1, '2019-06-21 09:30:00', '2019-06-21 12:50:58', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Muharrir'),
(3, 'Mehmon');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `page_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `lang_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `author_id` int(11) NOT NULL,
  `modify_by` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `static_text`
--

CREATE TABLE `static_text` (
  `id` int(11) NOT NULL,
  `code` varchar(500) NOT NULL,
  `text` text NOT NULL,
  `lang_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

CREATE TABLE `subscribe` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1',
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'default.png',
  `username` varchar(255) NOT NULL,
  `password` varchar(500) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1',
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `role_id`, `name`, `image`, `username`, `password`, `email`, `phone`, `country`, `region`, `district`, `address`, `created`, `updated`, `status`, `active`) VALUES
(2, 1, 'Allabergenov Dilmurod', '1545719705.4471.png', 'admin', '$2y$13$cZCsIPqtS1pkEteA7sJxAuhzwo9JEQirDWLTzZNPNChiwMgGENxPu', 'mr.j0k3r.d1ma@gmail.com', '', '', '', '', '', '2018-12-24 10:37:43', '2018-12-25 11:35:05', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vote`
--

CREATE TABLE `vote` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `result` varchar(300) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL DEFAULT '0',
  `news_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `active` int(11) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vote`
--

INSERT INTO `vote` (`id`, `question`, `answer`, `result`, `lang_id`, `author_id`, `page_id`, `news_id`, `status`, `active`, `created`, `updated`) VALUES
(1, 'Сайт дизайнига бахо беринг', 'Аъло;\r\nЯхши;\r\nЎртача;\r\nЁмон;', '{\"1\":58,\"2\":4,\"3\":4,\"4\":1}', 1, 2, 0, 0, 1, 1, '2019-01-26 00:07:45', '2019-02-11 14:02:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `static_text`
--
ALTER TABLE `static_text`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `vote`
--
ALTER TABLE `vote`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `static_text`
--
ALTER TABLE `static_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `vote`
--
ALTER TABLE `vote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
