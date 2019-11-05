-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2019 at 11:06 AM
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
(2, 'Жамият ҳақида', 'jamiyat-haqqida', '', 1, 0, 1, -1, 1, 1),
(3, 'Ривожланиш стратегияси', 'rivojlanish-strategiyasi', '', 2, 0, 1, -1, 1, 1),
(4, 'Фаолиятининг мақсад ва вазифалари', 'faoliyatining-maqsad-va-vazifalari', '', 2, 0, 1, -1, 1, 1),
(5, 'Ташкилий тузилма', 'tashkiliy-tuzilma', '', 2, 0, 1, -1, 1, 1),
(6, 'Раҳбарият', 'rahbariyat', '', 2, 0, 1, -1, 1, 1),
(7, 'Маслаҳат органлари', 'maslahat-organlari', '', 2, 0, 1, -1, 1, 1),
(8, 'Маҳсулот ва хизматлар турлари', 'mahsulot-vahizmatlar', '', 2, 0, 1, -1, 1, 1),
(9, 'Асосий кўрсаткичлар', 'asosiy-korsatkichlar', '', 2, 0, 1, -1, 1, 1),
(10, 'Янгиликлар', 'yangiliklar', '', 1, 0, 1, 0, 1, 1),
(11, 'Акциядорлар учун', 'aksiyadorlar-uchun', '', 1, 0, 1, -1, 1, 1),
(12, 'Аффилланган шахслар рўйхати', 'affillangan-shaxslar-royhati', '', 11, 0, 1, -1, 1, 1),
(13, 'Корпоратив бошқарув', 'korparativ-boshqaruv', '', 11, 0, 1, -1, 1, 1),
(14, 'Мухим фактлар', 'muhim-faqtlar', '', 11, 0, 1, -1, 1, 1),
(15, 'Йиғилишлар', 'yigilishlar', '', 11, 0, 1, -1, 1, 1),
(16, 'Эмиссия рисоласи', 'emissiya-risolalari', '', 11, 0, 1, -1, 1, 1),
(17, 'Йиллик ҳисоботлар', 'yillik-hisobotlar', '', 11, 0, 1, -1, 1, 1),
(18, 'Чораклик ҳисоботлар', 'choraklik-hisobotlar', '', 11, 0, 1, -1, 1, 1),
(19, 'Дивидендлар', 'dividentlar', '', 11, 0, 1, -1, 1, 1),
(20, 'Аудит', 'audit', '', 11, 0, 1, -1, 1, 1),
(21, 'Кузатув кенгаши', 'kuzatuv-kengashi', '', 11, 0, 1, -1, 1, 1),
(22, 'Расмий', 'rasmiy', '', 1, 0, 1, -1, 1, 1),
(23, 'Устав', 'ustav', '', 22, 0, 1, -1, 1, 1),
(24, 'Бизнес режа', 'biznes-reja', '', 22, 0, 1, -1, 1, 1),
(25, 'Сертификатлар ва лицензиялар', 'sertifiqatlar-va-litsenziyalar', '', 22, 0, 1, -1, 1, 1),
(26, 'Иш ўринлари', 'ish-orinlari', '', 22, 0, 1, -1, 1, 1),
(27, 'Тендерлар', 'tenderlar', '', 22, 0, 1, -1, 1, 1),
(28, 'Оммавий тадбирлар', 'ommoviy-tadbirlar', '', 22, 0, 1, -1, 1, 1),
(29, 'Норматив хужжатлар', 'normativ-hujjatlar', '', 22, 0, 1, 3, 1, 1),
(30, 'Инвестиция портфели', 'investitsiya-portfeli', '', 22, 0, 1, -1, 1, 1),
(31, 'Банк реквизитлари', 'bank-rekvizitlari', '', 22, 0, 1, -1, 1, 1),
(32, 'Мажбурий ҳаволалар', 'majburiy-havolalar', '', 22, 0, 1, -1, 1, 1),
(33, 'Интерактив хизматлар', 'interaktik-xizmatlar', '', 1, 0, 1, -1, 1, 1),
(34, 'Савол-жавоб', 'savol-javob', '', 33, 0, 1, -1, 1, 1),
(35, 'Фуқаролар мурожати', 'fuqorolar-murojaatlari', '', 33, 0, 1, -1, 1, 1),
(36, 'Раҳбарият қабул кунлари', 'rahbariyat-qabul-kunlari', '', 33, 0, 1, -1, 1, 1),
(37, 'Алоқалар', 'aloqalar', '', 1, 0, 1, -1, 1, 1),
(38, 'Манзилимиз', 'manzilimiz', '', 37, 0, 1, -1, 1, 1),
(39, 'Хабар қолдириш', '-site/contact', '', 37, 0, 1, -1, 1, 1);

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

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `code`, `name`, `image`, `cat_id`, `preview`, `detail`, `sort`, `show_counter`, `slider`, `vote`, `tags`, `author_id`, `modify_by`, `lang_id`, `updated`, `created`, `status`, `active`) VALUES
(11, '-O-zdonmahsulot--AK-2018-yilda-715-million-so-m-mablag-ni-iqtisod-qildi-2019-05-27', '“Oʻzdonmahsulot” AK 2018 yilda 715 million soʻm mablagʻni iqtisod qildi', 'default.jpg', 10, 'Milliy matbuot markazida “Oʻzdonmahsulot” aksiyadorlik kompaniyasi tarkibidagi korxonalarda investitsion loyihalarni amalga oshirish, mahsulot turlarini koʻpaytirish, sifatni yaxshilash, yangi ish oʻrinlarini yaratish boʻyicha bajarilayotgan ishlar va 2019 yil uchun belgilangan vazifalarga bagʻishlangan matbuot anjumani oʻtkazildi. ', '<p>Milliy matbuot markazida &ldquo;Oʻzdonmahsulot&rdquo; aksiyadorlik kompaniyasi tarkibidagi korxonalarda investitsion loyihalarni amalga oshirish, mahsulot turlarini koʻpaytirish, sifatni yaxshilash, yangi ish oʻrinlarini yaratish boʻyicha bajarilayotgan ishlar va 2019 yil uchun belgilangan vazifalarga bagʻishlangan matbuot anjumani oʻtkazildi.</p>\r\n<p>Soʻnggi yillarda mamlakatimiz aholisining un, qolipli non, makaron mahsulotlariga boʻlgan ehtiyojini taʼminlash, chorvachilikka sifatli yem yetkazib berish, davlat ehtiyojlari uchun don va urugʻlik xarid qilish, ularni saqlash borasida amalga oshirilayotgan ishlar yuqori samara berayotgani taʼkidlandi.</p>\r\n<p>Bugungi kunda &ldquo;Oʻzdonmahsulot&rdquo; AK tizimida 44 korxona faoliyat yuritadi. Hududlarda ularga qarashli 25 filial, un ishlab chiqaruvchi tegirmon, non sexi, makaron, omixta yem, yorma va urugʻlik donni qayta ishlovchi sexlar mavjud. Ular tomonidan 2018 yilda taqqoslama narxlarda 2,5 milliard soʻmlik sanoat mahsulotlari ishlab chiqarilgan boʻlib, bu 2017 yilning mos davriga nisbatan 108,8 foizga koʻpdir. Jumladan, oʻtgan yili 1 million 472 ming tonna un, 923 ming tonna omixta yem, 67 ming 500 tonna non va non mahsuloti, 28 ming 800 tonna makaron mahsuloti hamda 13 ming tonna yorma ishlab chiqarildi.</p>\r\n<p>Tadbirda soha mutaxassislari 2018 yilda sohada amalga oshirilgan ishlar, joriy yildagi rejalar xususida atroflicha maʼlumot berdi.</p>\r\n<p>&ndash; Yakunlangan yilda quvvati 105 ming tonnaga teng boʻlgan 3 omixta yem sexi, quvvati 96 ming tonna boʻlgan 2 tegirmon sexi zamonaviy texnologiyalar asosida modernizatsiya qilinib, ishga tushirildi, &ndash; deydi &ldquo;Oʻzdonmahsulot&rdquo; AK investitsiya va yangi texnologiyalarni joriy etish boshqarmasi boshligʻi Shuhrat Uzoqov. &ndash; Shuningdek, ishlab chiqarish quvvati 22,5 ming tonnani tashkil etuvchi &ldquo;Koson don&rdquo;, &ldquo;Uchqoʻrgʻondonmahsulotlari&rdquo;, &ldquo;Oxangaron don&rdquo; va &ldquo;Dunyo-M&rdquo; kabi jami 5 omixta yem ishlab chiqarish sexi tashkil etildi. Shu bilan bir qatorda quvvati 44 ming tonna boʻlgan &ldquo;Qoraqalpoqdonmahsulotlari&rdquo;, &ldquo;Taxiatosh don mahsulotlari&rdquo;, &ldquo;Chimboy don&rdquo; va &ldquo;Toʻrtkoʻl don mahsulotlari&rdquo; kabi sholi sexi ham aholiga xizmat qilmoqda.</p>\r\n<p>Mazkur loyihalarning amalga oshirilgani hisobiga 2018 yilda 715 million soʻm mablagʻ iqtisod qilindi. Yillik ishlab chiqarish hajmi 16 ming tonnaga oshdi. Tizimdagi maʼnan va eskirgan uskunalarning 423 tasi yangilariga almashtirilib, qoʻshimcha 95 ish oʻrni yaratildi.</p>\r\n<p>&ldquo;Oʻzdonmahsulot&rdquo; aksiyadorlik kompaniyasi 2019 yilda qiymati 16,4 million dollar boʻlgan 12 investitsion loyihani amalga oshirishni rejalashtirgan. Jumladan, Qoraqalpogʻiston Respublikasi, Namangan, Qashqadaryo, Samarqand, Surxondaryo va boshqa viloyatlarda 10 ta tegirmon sexi hamda 2 ta yangicha tayyorlanadigan omixta yem sexi ilgʻor texnologiyalar asosida modernizatsiya qilinadi. Ushbu loyihalarning ishga tushirilishi hisobiga yillik ishlab chiqarish hajmi 58 ming tonnaga koʻpayadi. Tizimdagi eskirgan 925 uskuna yangilariga almashtiriladi.</p>', 0, 0, 0, 0, '', 2, 2, 1, '2019-05-27 11:59:53', '2019-05-27 08:54:00', 1, 1),
(12, 'O-zbekistonda-fermer-xo-jaliklari-yer-maydonlari-maqbullashtiriladi--2019-05-27', 'O‘zbekistonda fermer xo‘jaliklari yer maydonlari maqbullashtiriladi.', '1558940453.png', 10, 'Qarorga asosan, fermer xo‘jaliklari va boshqa qishloq xo‘jaligi korxonalariga faoliyat yuritish uchun berilgan yer uchastkalari maydonlari maqbullashtiriladi.', '<p>Qarorga asosan, fermer xo&lsquo;jaliklari va boshqa qishloq xo&lsquo;jaligi korxonalariga faoliyat yuritish uchun berilgan yer uchastkalari maydonlari maqbullashtiriladi.</p>\r\n<p>Shuningdek, qaror bilan yer uchastkalari maydonlarini maqbullashtirish bo&lsquo;yicha respublika, viloyat hamda tuman ishchi guruhlari tarkibi tasdiqlandi.</p>\r\n<p>Eksperiment tariqasida fermer xo&lsquo;jaliklari uchun yer uchastkalari ochiq tanlov yakuniga ko&lsquo;ra yer uchastkalarini berish masalalarini ko&lsquo;rib chiquvchi tuman komissiyasi hamda tuman fermer, dehqon xo&lsquo;jaliklari va tomorqa yer egalari kengashining xulosasiga binoan xalq deputatlari tuman Kengashining qarori asosida qabul qilingan tuman hokimining qarori bo&lsquo;yicha beriladi.</p>\r\n<p>Bir gektar yer maydoni uchun paxta-g&lsquo;allachilik loyihasiga 2 ming AQSh dollari ekvivalenti miqdorida hamda sabzavot-g&lsquo;allachilik, bog&lsquo;dorchilik-uzumchilik, sabzavot-polizchilik loyihalariga 5 ming AQSh dollari ekvivalenti miqdorida to&lsquo;g&lsquo;ridan-to&lsquo;g&lsquo;ri investitsiya kiritadigan talabgorlarga va klaster korxonalariga tuman sektor rahbarining tavsiyasiga ko&lsquo;ra tanlov o&lsquo;tkazmasdan tuman hokimining qaroriga asosan yer uchastkalari ajratiladi.</p>\r\n<p>Qishloq xo&lsquo;jaligi korxonalari yer uchastkalarining hajmlari ularning faoliyat yo&lsquo;nalishlaridan kelib chiqqan holda quyidagicha belgilanadi:</p>\r\n<p>paxtachilik va g&lsquo;allachilik yo&lsquo;nalishidagi qishloq xo&lsquo;jaligi korxonalari yer uchastkalari maydonlarining eng kam o&lsquo;lchami 100 gektar;</p>\r\n<p>g&lsquo;allachilik va sabzavotchilik yo&lsquo;nalishidagi qishloq xo&lsquo;jaligi korxonalari yer uchastkalari maydonlarining eng kam o&lsquo;lchami 20 gektar;</p>\r\n<p>bog&lsquo;dorchilik va uzumchilik yo&lsquo;nalishidagi qishloq xo&lsquo;jaligi korxonalari yer uchastkalari maydonlarining eng kam o&lsquo;lchami 10 gektar;</p>\r\n<p>sabzavotchilik va polizchilik yo&lsquo;nalishidagi qishloq xo&lsquo;jaligi korxonalari yer uchastkalari maydonlarining eng kam o&lsquo;lchami 5 gektar;</p>\r\n<p>chorvachilik yo&lsquo;nalishidagi qishloq xo&lsquo;jaligi korxonalari yer uchastkalarining hajmlari qonunchilikda belgilangan tartibda mavjud shartli mol bosh sonidan kelib chiqqan holda belgilanadi.</p>\r\n<p>Qishloq xo&lsquo;jaligi korxonalari yer uchastkalarining o&lsquo;lchami yuqorida nazarda tutilgan miqdorlardan kam bo&lsquo;lgan taqdirda, ularni maqbullashtarishga asos bo&lsquo;ladi.</p>\r\n<p>Maqbullashtirish jarayonida tuman hokimliklari zaxirasiga qaytarilgan yer uchastkalari, birinchi navbatda to&lsquo;g&lsquo;ridan-to&lsquo;g&lsquo;ri investitsiya kiritadigan, moliyaviy holati yaxshi va qishloq xo&lsquo;jaligi texnikalariga ega ko&lsquo;p tarmoqli fermer xo&lsquo;jaliklari, paxta-to&lsquo;qimachilik klasterlari, eksport qiluvchi va qayta ishlovchi korxonalarga beriladi.</p>', 0, 0, 0, 0, '', 2, 2, 1, '2019-05-27 12:00:53', '2019-05-27 08:59:00', 1, 1),
(13, 'Berlindagi--Yashil-haftalik-2019--ko-rgazmasida--O-zdonmahsulot--kompaniyasi-o-z-mahsulotlari-bilan-ishtirok-etmoqda-2019-05-27', 'Berlindagi “Yashil haftalik 2019” ko‘rgazmasida “O‘zdonmahsulot” kompaniyasi o‘z mahsulotlari bilan ishtirok etmoqda', '1558940545.jpeg', 10, 'Germaniya poytaxti Berlin shahrida bo‘lib o‘tayotgan 84- xalqaro «Yashil haftalik 2019» ko‘rgazmasida «O‘zdonmahsulot» aksiyadorlik kompaniyasi vakillari ishtirok etmoqda. \r\nQayd etish joizki, mazkur ko‘rgazmada dunyoning 70 ta mamlakatidan 1600 dan ortiq ishtirokchi qatnashmoqda. ', '<p><img style=\"float: left; padding: 10px;\" src=\"/uploads/image/1558940490.jpg\" alt=\"\" width=\"227\" height=\"159\" />Germaniya poytaxti Berlin shahrida bo&lsquo;lib o&lsquo;tayotgan 84- xalqaro &laquo;Yashil haftalik 2019&raquo; ko&lsquo;rgazmasida &laquo;O&lsquo;zdonmahsulot&raquo; aksiyadorlik kompaniyasi vakillari ishtirok etmoqda.&nbsp;<br />Qayd etish joizki, mazkur ko&lsquo;rgazmada dunyoning 70 ta mamlakatidan 1600 dan ortiq ishtirokchi qatnashmoqda.&nbsp;<br />O&lsquo;zbekiston Respublikasi Tashqi savdo vazirligi hamda &laquo;O&lsquo;zekspomarkaz&raquo; Milliy ko&lsquo;rgazmalar kompaniyasi bilan hamkorlikda tashkil etilgan O&lsquo;zbekiston stendida &laquo;O&lsquo;zdonmahsulot&raquo; aksiyadorlik kompaniyasi tarkibidagi korxonalar tomonidan ishlab chiqarilgan mahsulotlar ham joy oldi.&nbsp;<br />Mazkur ko&lsquo;rgazmani har yili Berlinda o&lsquo;tkazish an&rsquo;anasi 1926 yildan buyon davom etib kelmoqda hamda ushbu tadbir doirasida oziq-ovqat va qishloq xo&lsquo;jaligi masalalari bo&lsquo;yicha global forum o&lsquo;tkazish ham ko&lsquo;zda tutilgan.<br />Ko&lsquo;rgazmada ishtirok etayotgan 70ta mamlakatning tegishli vazirliklari vakilllari hamda yirik oziq-ovqat mahsulotlari ishlab chiqaruvchi kompaniyalar o&lsquo;rtasida oliy darajadagi uchrashuvlar bo&lsquo;lib o&lsquo;tadi. Shuningdek, o&lsquo;zaro manfaatli hamkorlik takliflari hamda shartnomalari imzolanishi ko&lsquo;zda tutilgan. Ma&rsquo;lumot o&lsquo;rnida aytish lozimki, ko&lsquo;rgazmada 1700 ta eksponent ya&rsquo;ni, 100 mingdan ziyod oziq-ovqat mahsulotlari namunalari, ko&lsquo;plab uy hayvonlari va eng zamonaviy qishloq xo&lsquo;jaligi texnikalari taqdim etilmoqda.&nbsp;<br />Ta&rsquo;kidlash lozimki, &laquo;O&lsquo;zdonmahsulot&raquo; aksiyadorlik kompaniyasi ko&lsquo;rgazmada ishtirok etayotgan yirik kompaniyalar bilan hamkorlik kelishuvlarini imzolash hamda soha taraqqiyoti uchun manfaatli takliflarga erishishni o&lsquo;z oldiga maqsad qilgan. Ko&lsquo;rgazma 27 yanvar sanasiga qadar davom etadi.&nbsp;</p>\r\n<div><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://uzdon.uz/img/news/941/yrk_1551.jpg\" alt=\"\" width=\"800\" border=\"0px\" /></div>\r\n<div>&nbsp;</div>\r\n<div><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://uzdon.uz/img/news/941/yrk_1532.jpg\" alt=\"\" width=\"800\" border=\"0px\" /></div>\r\n<div>&nbsp;</div>\r\n<div><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://uzdon.uz/img/news/941/yrk_1520.jpg\" alt=\"\" width=\"800\" border=\"0px\" /></div>', 0, 0, 0, 0, '', 2, 2, 1, '2019-05-27 12:02:25', '2019-05-27 09:01:00', 1, 1),
(14, 'Korporativ-boshqaruvi-tizimini-baholash-uchun-mustaqil-tashkilotini-tanlovini-o-tkazish-bo-yicha-E-lon-2019-05-27', 'Korporativ boshqaruvi tizimini baholash uchun mustaqil tashkilotini tanlovini o‘tkazish bo‘yicha E’lon', 'default.jpg', 10, '«O’zdonmahsulot» aksiyadorlik kompaniyasi\r\nKorporativ boshqaruv tizimini baholash uchun mustaqil tashkilotlar tanlovini o‘tkazish bo‘yicha \r\nE’loni', '<div>&laquo;O&rsquo;zdonmahsulot&raquo; aksiyadorlik kompaniyasi</div>\r\n<div>Korporativ boshqaruv tizimini baholash uchun mustaqil tashkilotlar tanlovini o&lsquo;tkazish bo&lsquo;yicha&nbsp;</div>\r\n<div>E&rsquo;loni</div>\r\n<div>26.02.2019</div>\r\n<blockquote>&laquo;O&rsquo;zdonmahsulot&raquo; AK korporativ boshqaruv tizimini baholash uchun mustaqil tashkilotlarni tanlash bo&lsquo;yicha tanlov e&rsquo;lon qiladi.</blockquote>\r\n<blockquote>Korporativ Boshqaruv Kodeksida belgilangan tashkilotlar tanlovda ishtirok etish huquqiga ega.</blockquote>\r\n<blockquote>Tanlovdagi takliflar quyidagi hujjatlarni o&lsquo;z ichiga oladi:</blockquote>\r\n<p>- korporativ boshqaruv tizimida o&lsquo;tkazilgan baholashning dastlabki qiymati bilan tanlovda ishtirok etish uchun tanlov ishtirokchisining tijorat taklifi;<br />- davlat ro&lsquo;yxatidan o&lsquo;tkazilganligi to&lsquo;g&lsquo;risidagi guvohnomasining, auditorlik tashkilotlari uchun berilgan auditorlik faoliyati bilan shug&lsquo;ullanish huquqi litsenziyasi va qimmatli qog&lsquo;ozlar bozorining professional ishtirokchilari uchun berilgan qimmatli qog&lsquo;ozlar bozorining professionallik faoliyati bilan shug&lsquo;ullanish huquqi litsenziyalarining nusxalari;<br />- auditorning malaka sertifikati, qimmatli qog&lsquo;ozlar bozori mutaxassisining malaka setifikati yoki korporativ boshqaruvning malaka sertifikati nusxalari.</p>\r\n<blockquote>Korporativ boshqaruv tizimi baholanilishining o&lsquo;tkazilish davri: 2018 yil.</blockquote>\r\n<blockquote>Tanlovda ishtirok etish uchun takliflarni berish muddati: 2019 yil 10 martgacha.</blockquote>\r\n<blockquote>Tanlovda ishtirok etish uchun takliflarni quyidagi manzilga taqdim etish mumkin:</blockquote>\r\n<p>Toshkent shahri, Mirobod tumani, Shaxrisabz ko&lsquo;chasi, 36-uyda qabul qilinadi.<br />Telefon: (90) 374-19-07</p>', 0, 0, 0, 0, '', 2, 2, 1, '2019-05-27 12:02:51', '2019-05-27 09:02:00', 1, 1),
(15, 'Hosildorlikni-oshirish-bugungi-harakatga-bog-liq-2019-05-27', 'Hosildorlikni oshirish bugungi harakatga bogʻliq', '1558940603.jpg', 10, 'Fargʻona viloyati dehqonlari joriy yilda 107 ming gektardan ortiq maydonda boshoqli don ekinlari parvarishlamoqda.', '<p>Fargʻona viloyati dehqonlari joriy yilda 107 ming gektardan ortiq maydonda boshoqli don ekinlari parvarishlamoqda.<br /><br />Sohibkorlar bugʻdoyning har gektaridan oʻrtacha 52,1 sentnerdan hosil koʻtarib, 561 ming 120 tonna boshoqli don tayyorlab, shartnoma asosida 307 ming 850 tonna don sotishni rejalashtirgan.<br /><br />Gʻalladan moʻl hosil olish, hosildorlikni oshirish bugungi harakatga bogʻliq. Ayni kunlarda gʻallani azotli oʻgʻitlar bilan oziqlantirish, sugʻorish kabi tadbirlarga alohida eʼtibor qaratilmoqda. Viloyatda 4 ta sektor rahbarlari bilan birga gʻalla hosildorligini kamida 30 foizga oshirish boʻyicha &laquo;Yoʻl xaritasi&raquo; ishlab chiqilgan.<br /><br />Boshoqli donlarning &laquo;Grom&raquo;, &laquo;Asr&raquo;, &laquo;Davr&raquo;, &laquo;Zamin&raquo;, &laquo;Chillaki&raquo; kabi navlari yetishtirilmoqda. Yuqori hosildorlikka erishish uchun bonitet bali past va kech ekilgan maydonlarga qoʻshimcha ishlov berish tashkil etildi. Bunda har gektar maydonga 5 tonnadan 10 tonnagacha chirigan mahalliy oʻgʻit chiqarildi. Har gektar maydonga 50 kilogrammgacha azotli va fosforli oʻgʻit aralashmasi sepib chiqilishi taʼminlandi. Gʻalla maydonlarida begona oʻtlar, kasallik va zararkunandalarga qarshi kurashish borasida ham ishlar davom etmoqda.<br /><br />Yozyovon tumanida 138 fermer xoʻjaligi tomonidan 6 ming 840 gektar maydondagi gʻalla maysalarining baravj rivojini taʼminlash ishlari izchil olib borilmoqda. Ishchi guruh tomonidan ayrim hududlarda maysa rivoji sust ekani aniqlanib, mineral oʻgʻitlar bilan taʼminlandi. Agrotexnik tadbirlarni sifatli bajarishga eʼtibor kuchaytirildi.&nbsp;<br /><br />Tumandagi &laquo;Bahrombek&raquo; fermer xoʻjaligi gʻalla va paxta yetishtirishda katta tajriba toʻplagan. Ayni kunlarda 84 gektar maydonda gʻalla parvarishlanmoqda. Bu yerdagi baravj bugʻdoy maysalarini koʻrgan kishi, albatta, dehqon mehnatiga tasanno aytadi.<br /><br />&ndash; Kunlar isib, bahor kelishi bilan dala yumushlari ham boshlanib ketdi, &ndash; deydi fermer xoʻjaligi boshligʻi Olimjon Mamadaliyev. &ndash; Ayniqsa, gʻalla parvarishi barcha agrotexnik tadbirlar asosida olib borilmoqda. Azotli, fosforli va kaliyli oʻgʻitlar oʻz vaqtida yetkazib berilmoqda. Ikkinchi oziqlantirish ishlarini yakunladik. Hosildorlikni 70 sentnerdan oshirishni rejalashtirganmiz.<br /><br />Mavsumda masʼuliyatsizlikka aslo yoʻl qoʻyib boʻlmaydi. Shuning uchun ham tuman hokimi, prokurori, ichki ishlar boʻlimi va soliq inspeksiyasi boshliqlari oʻzlariga biriktirilgan hududlarda bahorgi dala ishlariga yanada masʼuliyat bilan yondashmoqda.</p>\r\n<div>&nbsp;</div>\r\n<div>\r\n<div><img src=\"http://uzdon.uz/img/news/951/1-03-2019-21.jpg\" alt=\"\" width=\"600\" border=\"0px\" /></div>\r\n<div>&nbsp;</div>\r\n<div><img src=\"http://uzdon.uz/img/news/951/1-03-2019-23.jpg\" alt=\"\" width=\"600\" border=\"0px\" /></div>\r\n</div>', 0, 0, 0, 0, '', 2, 2, 1, '2019-05-27 12:03:22', '2019-05-27 09:02:00', 1, 1),
(16, '-El-yurt-umidi--jamg-armasida-stipendiyalar-saralash-tanlovi-o-tkazilmoqda--2019-05-27', '“El-yurt umidi” jamg‘armasida stipendiyalar saralash tanlovi o‘tkazilmoqda.', 'default.jpg', 10, 'O‘zbekiston Respublikasi Vazirlar Mahkamasi huzuridagi “El-yurt umidi” jamg‘armasida navbatdagi stipendiyalar saralash tanlovi boshlandi.', '<p>O&lsquo;zbekiston Respublikasi Vazirlar Mahkamasi huzuridagi &ldquo;El-yurt umidi&rdquo; jamg&lsquo;armasida navbatdagi stipendiyalar saralash tanlovi boshlandi.<br /><br />&ldquo;Fan va ilmiy-tadqiqotlar&rdquo;, &ldquo;Sog&lsquo;liqni saqlash&rdquo;, &ldquo;Davlat boshqaruvi&rdquo; va &ldquo;Iqtisodiyotning istiqbolli tarmoqlari&rdquo; yo&lsquo;nalishlari bo&lsquo;yicha tanlov o&lsquo;tkazilmoqda.<br /><br />Jamg&lsquo;arma Vasiylik kengashi qaroriga muvofiq, respublikamizning barcha hududlardagi nomzodlar uchun bir xil va qulay shart-sharoitlar yaratish maqsadida, stipendiya tanloviga nomzodlardan hujjatlar jamg&lsquo;armaning www.eyuf.uz internet manzili orqali on-line tarzda elektron shaklda qabul qilinmoqda.<br /><br />Hujjatlar qabul qilish joriy yil 20 fevraldan 20 martga qadar amalga oshiriladi.<br /><br />&ldquo;El-yurt umidi&rdquo; jamg&lsquo;armasi stipendiya tanlovlari tartibi, qoidalari va saralash tanlovi o&lsquo;tkazish jarayonlari to&lsquo;g&lsquo;risida ma&rsquo;lumotlar muntazam ravishda jamg&lsquo;armaning www.eyuf.uz sayti orqali berib borilmoqda. Stipendiya nomzodlari mazkur saytga muntazam kirib turishlari so&lsquo;raladi.<br /><br />Qadrli yoshlar &ldquo;El-yurt umidi&rdquo; jamg&lsquo;armasi stipendiyalar saralash tanlovida faol qatnashing.</p>', 0, 1, 0, 0, '', 2, 2, 1, '2019-05-28 13:08:58', '2019-05-27 09:03:00', 1, 1),
(17, '--Navro-z--umumxalq-bayrami-savdo-yarmarkalari-2019-05-27', '-“Navro‘z” umumxalq bayrami savdo yarmarkalari', 'default.jpg', 10, '«Navro‘z» umumxalq bayrami munosabati bilan Toshkent shahri va hududlarida tashkil etilgan barcha yarmarka savdolariga «O‘zdonmahsulot» aksiyadorlik kompaniyasi tizimidagi korxonalar tomonidan keng assortimentdagi un, guruch, non va non mahsulotlari, qandolat, makaron mahsulotlarining savdolari tashkil etildi.', '<header>\r\n<p><a style=\"font-family: Lato; font-size: 14px;\" href=\"http://uzdon.uz/img/news/photo/000000000959.jpg\" target=\"_blank\" rel=\"noopener\"><img class=\"flexyImg\" style=\"float: left;\" src=\"http://uzdon.uz/img/news/photo/200x140/000000000959.jpeg\" border=\"0\" /></a>&laquo;Navro&lsquo;z&raquo; umumxalq bayrami munosabati bilan Toshkent shahri va hududlarida tashkil etilgan barcha yarmarka savdolariga &laquo;O&lsquo;zdonmahsulot&raquo; aksiyadorlik kompaniyasi tizimidagi korxonalar tomonidan keng assortimentdagi un, guruch, non va non mahsulotlari, qandolat, makaron mahsulotlarining savdolari tashkil etildi.<br />\"O&lsquo;zdonmahsulot\" AK tarkibidagi korxonalar tomonidan Toshkent shahrining \"Aviasozlar dehqon bozori\", \"Askiya dehqon bozori\", \"Navro&lsquo;z dehqon bozori\", \"Chilonzor dehqon bozori\", \"Oloy dehqon bozori\", \"Farhod dehqon bozori\", \"Mirobod dehqon bozori\", \"Eski-Juva dehqon bozori\", \"Sirg&lsquo;ali dehqon bozori\", \"Qo&lsquo;yliq dehqon bozori\", \"Yunusobod dehqon bozori\" va \"Qora-qamish dehqon bozori\" da savdo yarmarkalari tashkil etildi.</p>\r\n</header>\r\n<div class=\"text\">\r\n<div class=\"news-controller news-info\">\r\n<div class=\"news\">\r\n<div class=\"text\">\r\n<div>&nbsp;</div>\r\n<div>&nbsp;</div>\r\n<div>\r\n<div><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://uzdon.uz/img/news/959/20.jpg\" alt=\"\" width=\"800\" border=\"0px\" /></div>\r\n<div>&nbsp;</div>\r\n<div><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://uzdon.uz/img/news/959/21.jpg\" alt=\"\" border=\"0px\" /></div>\r\n<div>&nbsp;</div>\r\n<div><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://uzdon.uz/img/news/959/22.jpg\" alt=\"\" border=\"0px\" /></div>\r\n&nbsp;\r\n<div>\r\n<div><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://uzdon.uz/img/news/959/19-03-2019.jpg\" alt=\"\" width=\"800\" border=\"0px\" /></div>\r\n<div>&nbsp;</div>\r\n<div><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://uzdon.uz/img/news/959/6.jpg\" alt=\"\" width=\"800\" border=\"0\" /></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 0, 0, 0, 0, '', 2, 2, 1, '2019-05-27 12:05:11', '2019-05-27 09:03:00', 1, 1),
(18, 'Bayram-yarmarkalari-davom-etmoqda-2019-05-27', 'Bayram yarmarkalari davom etmoqda', '1558940762.jpg', 10, 'Bayramingiz muborak bo\'lsin!\r\n', '<p>Bayramingiz muborak bo\'lsin!</p>\r\n<div>&nbsp;</div>\r\n<div><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://uzdon.uz/img/news/961/20-03-11.jpg\" alt=\"\" width=\"800\" border=\"0px\" /></div>\r\n<div>&nbsp;</div>\r\n<div><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://uzdon.uz/img/news/961/20-03-8.jpg\" alt=\"\" width=\"800\" border=\"0px\" /></div>\r\n<div>&nbsp;</div>\r\n<div><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://uzdon.uz/img/news/961/20-03-9.jpg\" alt=\"\" width=\"800\" border=\"0px\" /></div>\r\n<div>&nbsp;</div>\r\n<div><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://uzdon.uz/img/news/961/20-03-12.jpg\" alt=\"\" width=\"800\" border=\"0px\" /></div>\r\n<div>&nbsp;</div>\r\n<div><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://uzdon.uz/img/news/961/20-03-13.jpg\" alt=\"\" width=\"800\" border=\"0px\" /></div>\r\n<div>&nbsp;</div>\r\n<div><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://uzdon.uz/img/news/961/20-03-3.jpg\" alt=\"\" width=\"800\" border=\"0px\" /></div>\r\n<div>&nbsp;</div>\r\n<div><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://uzdon.uz/img/news/961/20-03-16.jpg\" alt=\"\" width=\"800\" border=\"0px\" /></div>\r\n<div>&nbsp;</div>\r\n<div><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://uzdon.uz/img/news/961/20-03-22.jpg\" alt=\"\" width=\"800\" border=\"0px\" /></div>', 0, 0, 0, 0, '', 2, 2, 1, '2019-05-27 12:06:01', '2019-05-27 09:05:00', 1, 1),
(19, 'Respublikamizda-2019-yilda-1-million-490-ming-660-tonna-kartoshka-yetishtiriladi-2019-05-27', 'Respublikamizda 2019 yilda 1 million 490 ming 660 tonna kartoshka yetishtiriladi', '1558940804.jpg', 10, '2019 yil uchun respublikada jami 135 ming 641 gektar yerga sabzavot, 60 ming 156 gektar yerga poliz ekinlari joylashtiriladi hamda 2 mln 875 ming 640 tonna sabzavot, 1 mln 59 ming 240 tonna poliz ekinlari yetishtiriladi. ”2019 yil hosili uchun qishloq xoʻjaligi ekinlarini oqilona joylashtirish va mahsulot yetishtirishning prognoz hajmlari toʻgʻrisida”gi Hukumat qarorida bu koʻrsatib oʻtilgan. Bu haqida Adliya vazirligining “Huquqiy axborot” kanalida maʼlum qilindi.', '<figure><a href=\"http://uzdon.uz/img/news/photo/000000000966.jpg\" target=\"_blank\" rel=\"noopener\"><img class=\"flexyImg\" style=\"float: left;\" src=\"http://uzdon.uz/img/news/photo/200x140/000000000966.jpeg\" border=\"0\" /></a></figure>\r\n<div class=\"text\">2019 yil uchun respublikada jami 135 ming 641 gektar yerga sabzavot, 60 ming 156 gektar yerga poliz ekinlari joylashtiriladi hamda 2 mln 875 ming 640 tonna sabzavot, 1 mln 59 ming 240 tonna poliz ekinlari yetishtiriladi. &rdquo;2019 yil hosili uchun qishloq xoʻjaligi ekinlarini oqilona joylashtirish va mahsulot yetishtirishning prognoz hajmlari toʻgʻrisida&rdquo;gi Hukumat qarorida bu koʻrsatib oʻtilgan. Bu haqida Adliya vazirligining &ldquo;Huquqiy axborot&rdquo; kanalida maʼlum qilindi.<br /><br />Qarorda jami 57 ming 292 gektar bogʻ-tok qatorlari orasida 853 ming 905 tonna sabzavot, dukkakli va poliz ekinlari, 824 ming 350 gektar gʻalladan boʻshaydigan maydonga takroriy ekin ekilishi va jami 10 mln 448 ming 780 tonna mahsulot, jumladan 789 ming 189 tonna kartoshka yetishtirilishi belgilangan. Gʻalladan boʻshaydigan yer uchun jami 4 mlrd 292 mln 707 ming soʻm mablagʻ ajratiladi.<br /><br />Yuqoridagilarni jamlagan holda 2019 yilda respublikada jami 13 mln 396 ming 437 tonna mahsulot yetishtiriladi va mahsulotlarning 1 mln 858 ming 789 tonnasi eksport qilinadi, 7 mln 784 ming 537 tonnasi ichki isteʼmol uchun moʻljallangan.<br /><br />Jami mahsulotlarning 1 mln 490 ming 660 tonnasi kartoshka boʻlib uning 1 mln 56 ming 903 tonnasi ichki isteʼmol uchun ajratiladi.</div>', 0, 4, 0, 0, '', 2, 2, 1, '2019-05-28 13:13:05', '2019-05-27 09:06:00', 1, 1);

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
(3, 'Норматив ҳужжатлар', 'Normativ-kh-uzhzhatlar-2019-05-27', 'default.jpg', 'Норматив ҳужжатлар', '<p><strong>O`zbekiston Respublikasi Qonunlari:</strong><br /><br /><a href=\"http://lex.uz/docs/2382409\">&laquo;Aksiyadorlik jamiyatlari va aksiyadorlarning huquqlarini himoya qilish to&lsquo;g&lsquo;risida&raquo;gi O&lsquo;zbekiston Respublikasi Qonuniga o&lsquo;zgartish va qo&lsquo;shimchalar kiritish haqida&nbsp;</a><br /><br /><a href=\"http://lex.uz/docs/22525\">&laquo;Mas\'uliyati cheklangan hamda qo&lsquo;shimcha mas\'uliyatli jamiyatlar to&lsquo;g&lsquo;risida&raquo;&nbsp;</a><br /><br /><a href=\"http://lex.uz/docs/1638732\">&laquo;Aholi o&lsquo;rtasida mikronutriyent yetishmasligi profilaktikasi to&lsquo;g&lsquo;risida&raquo;&nbsp;</a><br /><br /><a href=\"http://lex.uz/docs/3031427\">&laquo;Mehnatni muhofaza qilish to&lsquo;g&lsquo;risida&raquo;gi O&lsquo;zbekiston Respublikasi Qonuniga o&lsquo;zgartish va qo&lsquo;shimchalar kiritish haqida&raquo;&nbsp;</a><br /><br /><strong>O`zbekiston Respublikasi Prezidentining farmonlari</strong><br /><br /><a href=\"http://lex.uz/pages/getpage.aspx?lact_id=2635197\">\"Aksiyadorlik jamiyatlarida zamonaviy korporativ boshqaruv uslublarini joriy etish chora-tadbirlari to&lsquo;g&lsquo;risida\"gi 2015 yil 24 apreldagi PF-4720-son farmoni&nbsp;</a><br /><br /><a href=\"http://lex.uz/docs/3039311\">\"Tadbirkorlik faoliyatining jadal rivojlanishini ta&rsquo;minlashga, xususiy mulkni har tomonlama himoya qilishga va ishbilarmonlik muhitini sifat jihatidan yaxshilashga doir qo&lsquo;shimcha chora-tadbirlar to&lsquo;g&lsquo;risida\"gi 2016 yil 5 oktyabrdagi PF-4848-son farmoni&nbsp;</a><br /><br /><strong>O`zbekiston Respublikasi Prezidentining qarorlari</strong>&nbsp;<br /><br /><a href=\"http://lex.uz/pdfs/4242801\">&laquo;O&lsquo;zbekiston Respublikasi Vazirlar Mahkamasi huzuridagi Agrosanoat majmui ustidan nazorat qilish inspeksiyasi faoliyatini tashkil etish chora-tadbirlari to&lsquo;g&lsquo;risida&raquo;gi 2019 yil 15 martdagi PQ-4241-son qarori&nbsp;</a></p>\r\n<div>&nbsp;</div>\r\n<div><a href=\"http://lex.uz/docs/1708067\">&laquo;2011 yil hosili uchun kuzgi boshoqli don ekinlarini ekish, navlarni joylashtirish va xarid qilishning tashkiliy chora-tadbirlari to&lsquo;g&lsquo;risida&raquo;gi 2010 yil 15 sentyabrdagi PQ-1404-son qarori&nbsp;</a><br /><br /><strong>O`zbekiston Respublikasi Vazirlar Mahkamasining qarorlari</strong><br /><br /><a href=\"http://lex.uz/docs/4312436\">&laquo;Qishloq xo&lsquo;jaligi korxonalari tomonidan yetishtirilgan boshoqli don ekinlari hosildorligi va yalpi hosilini aniqlash tartibi to&lsquo;g&lsquo;risidagi nizomni tasdiqlash haqida&raquo; 2019 yil 26 apreldagi 357-son qarori&nbsp;</a><br /><br /><a href=\"http://lex.uz/docs/4082248\">&laquo;Boshoqli don yetishtirishni yanada ragʻbatlantirish boʻyicha qoʻshimcha chora-tadbirlar toʻgʻrisida&raquo; 2018 yil 27 noyabrdagi 959-son qarori&nbsp;</a><br /><br /><a href=\"http://lex.uz/docs/3905235\">&laquo;Mamlakatimiz aholisini va iqtisodiyot tarmoqlarini raqobat va bozor mexanizmlarini joriy etish asosida don, un va non bilan ishonchli ta&rsquo;minlash chora-tadbirlari to&lsquo;g&lsquo;risida&raquo; 2018 yil 13 sentyabrdagi 731-son qarori&nbsp;</a><br /><br /><a href=\"http://www.lex.uz/docs/3879684\">&laquo;Donni qayta ishlovchi korxonalarni qo&lsquo;shimcha ravishda qo&lsquo;llab-quvvatlash va ularning eksport salohiyatini oshirish chora-tadbirlari to&lsquo;g&lsquo;risida&raquo; 2018 yil 24 avgustdagi 684-son qarori&nbsp;</a><br /><br /><a href=\"http://www.lex.uz/docs/3823434\">&laquo;O&lsquo;zbekiston Respublikasi moliya vazirligi huzuridagi qishloq xo&lsquo;jaligini davlat tomonidan qo&lsquo;llab-quvvatlash jamg&lsquo;armasi to&lsquo;g&lsquo;risida nizomini tasdiqlash haqida&raquo; 2018 yil 12 iyuldagi 533-son qarori&nbsp;</a><br /><br /><a href=\"http://lex.uz/docs/2923480\">&laquo;Don xavfsizligi to&lsquo;g&lsquo;risidagi umumiy texnik reglamentni tasdiqlash haqida&raquo; 2016 yil 31 martdagi 99-son qarori&nbsp;</a><br /><br /><a href=\"http://lex.uz/docs/353692\">&laquo;Don tayyorlash va non mahsulotlari ishlab chiqarish tizimida xarajatlarni qisqartirish chora-tadbirlari to&lsquo;g&lsquo;risida&raquo; 2002 yil 4 dekabrdagi 424-son qarori&nbsp;</a><br /><br /><a href=\"http://lex.uz/docs/246039\">&laquo;Qishloq xo&lsquo;jaligi ishlab chiqarishida shartnomaviy munosabatlarni takomillashtirish va majburiyatlar bajarilishi uchun tomonlarning javobgarligini oshirish chora-tadbirlari to&lsquo;g&lsquo;risida&raquo; 2003 yil 4 sentyabrdagi 383-son qarori&nbsp;</a><br /><br /><a href=\"http://lex.uz/docs/345376\">&laquo;O&lsquo;zdonmahsulot&raquo; davlat-aksiyadorlik korporatsiyasini &laquo;O&lsquo;zdonmahsulot&raquo; aksiyadorlik kompaniyasiga aylantirish to&lsquo;g&lsquo;risida&raquo; 2004 yil 6 avgustdagi 376-son qarori&nbsp;</a><br /><br /><a href=\"http://lex.uz/docs/1004810\">&laquo;Don va donni qayta ishlash mahsulotlari hisobini yuritish tizimini takomillashtirishga, ularning saqlanishi ustidan nazoratni kuchaytirishga doir qo&lsquo;shimcha chora-tadbirlar to&lsquo;g&lsquo;risida&raquo; 2006 yil 25 maydagi 95-son qarori&nbsp;</a><br /><br /></div>\r\n<div class=\"clearfix\">&nbsp;</div>\r\n<div class=\"documents\">\r\n<div class=\"title\">Biriktirilgan xujjatlar:</div>\r\n<div class=\"list list-documents\">\r\n<figure><img style=\"float: left;\" src=\"http://ajax.uz/file_ext/doc.png\" width=\"83\" height=\"83\" /></figure>\r\n<article><header>\r\n<p><a href=\"http://uzdon.uz/img/struct/28/_67/lexuz_6567.doc\"><strong>ЎЗБЕКИСТОН РЕСПУБЛИКАСИНИНГ &laquo;АКЦИЯДОРЛИК ЖАМИЯТЛАРИ ВА АКЦИЯДОРЛАРНИНГ ҲУҚУҚЛАРИНИ ҲИМОЯ ҚИЛИШ ТЎҒРИСИДА&raquo;ГИ ҚОНУНИ</strong></a></p>\r\n</header>\r\n<div class=\"text\">(<span class=\"file_ext\">DOC</span>,&nbsp;<span class=\"file_size\">468.86&nbsp;KB</span>)</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n</article>\r\n<figure><img style=\"float: left;\" src=\"http://ajax.uz/file_ext/doc.png\" width=\"83\" height=\"83\" /></figure>\r\n<article><header>\r\n<p><a href=\"http://uzdon.uz/img/struct/28/_67/lexuz_22525.doc\"><strong>ЎЗБЕКИСТОН РЕСПУБЛИКАСИНИНГ &laquo;МАСЪУЛИЯТИ ЧЕКЛАНГАН ҲАМДА ҚЎШИМЧА МАСЪУЛИЯТЛИ ЖАМИЯТЛАР ТЎҒРИСИДА&raquo;ГИ ҚОНУНИ</strong></a></p>\r\n</header>\r\n<p class=\"text\"><strong>(<span class=\"file_ext\">DOC</span>,&nbsp;<span class=\"file_size\">241.73&nbsp;KB</span>)</strong></p>\r\n<p class=\"text\">&nbsp;</p>\r\n</article>\r\n<figure><strong><img style=\"float: left;\" src=\"http://ajax.uz/file_ext/pdf.png\" width=\"75\" height=\"75\" /></strong></figure>\r\n<header>\r\n<p><a href=\"http://uzdon.uz/img/struct/28/_67/2168412.pdf\"><strong>ЎЗБЕКИСТОН РЕСПУБЛИКАСИНИНГ &laquo;АҲОЛИ ЎРТАСИДА МИКРОНУТРИЕНТ ЕТИШМАСЛИГИ ПРОФИЛАКТИКАСИ ТЎҒРИСИДА&raquo;ГИ ҚОНУНИ</strong></a></p>\r\n</header>\r\n<div class=\"text\"><strong>(<span class=\"file_ext\">PDF</span>,&nbsp;<span class=\"file_size\">267.62&nbsp;KB</span>)</strong></div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<figure><strong><img style=\"float: left;\" src=\"http://ajax.uz/file_ext/doc.png\" width=\"83\" /></strong></figure>\r\n<header>\r\n<p><a href=\"http://uzdon.uz/img/struct/28/_67/lexuz_1394158.doc\"><strong>ЎЗБЕКИСТОН РЕСПУБЛИКАСИ ПРЕЗИДЕНТИНИНГ &laquo;БОШОҚЛИ ДОН ЭКИНЛАРИНИ ХАРИД ҚИЛИШ НАРХЛАРИ ТЎҒРИСИДА&raquo; 2008 ЙИЛ 15 МАЙДАГИ ПҚ-867-СОН ҚАРОРИ </strong></a></p>\r\n<p><strong>(<span class=\"file_ext\">DOC</span>,&nbsp;<span class=\"file_size\">20.85&nbsp;KB</span>)</strong></p>\r\n</header>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<figure><strong><img style=\"float: left;\" src=\"http://ajax.uz/file_ext/doc.png\" width=\"83\" /></strong></figure>\r\n<header>\r\n<p><a href=\"http://uzdon.uz/img/struct/28/_67/lexuz_962736.doc\"><strong>ЎЗБЕКИСТОН РЕСПУБЛИКАСИ ВАЗИРЛАР МАҲКАМАСИНИНГ &laquo;ДОН ТАЙЁРЛАШ ВА НОН МАҲСУЛОТЛАРИ ИШЛАБ ЧИҚАРИШ ТИЗИМИДА ХАРАЖАТЛАРНИ ҚИСҚАРТИРИШ ЧОРА-ТАДБИРЛАРИ ТЎҒРИСИДА&raquo; 2002 ЙИЛ 4 ДЕКАБРДАГИ 424-СОН ҚАРОРИ</strong></a></p>\r\n</header>\r\n<div class=\"text\"><strong>(<span class=\"file_ext\">DOC</span>,&nbsp;<span class=\"file_size\">36.12&nbsp;KB</span>)</strong></div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<figure><strong><img style=\"float: left;\" src=\"http://ajax.uz/file_ext/doc.png\" width=\"83\" /></strong></figure>\r\n<header>\r\n<p><a href=\"http://uzdon.uz/img/struct/28/_67/lexuz_246039.doc\"><strong>ЎЗБЕКИСТОН РЕСПУБЛИКАСИ ВАЗИРЛАР МАҲКАМАСИНИНГ &laquo;ҚИШЛОҚ ХЎЖАЛИГИ ИШЛАБ ЧИҚАРИШИДА ШАРТНОМАВИЙ МУНОСАБАТЛАРНИ ТАКОМИЛЛАШТИРИШ ВА МАЖБУРИЯТЛАР БАЖАРИЛИШИ УЧУН ТОМОНЛАРНИНГ ЖАВОБГАРЛИГИНИ ОШИРИШ ЧОРА-ТАДБИРЛАРИ ТЎҒРИСИДА&raquo; 2003 ЙИЛ 4 СЕНТЯБРДАГИ 383-СОН ҚАРОРИ</strong></a></p>\r\n</header>\r\n<div class=\"text\"><strong>(<span class=\"file_ext\">DOC</span>,&nbsp;<span class=\"file_size\">176.97&nbsp;KB</span>)</strong></div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<figure><strong><img style=\"float: left;\" src=\"http://ajax.uz/file_ext/doc.png\" width=\"83\" /></strong></figure>\r\n<header>\r\n<p><a href=\"http://uzdon.uz/img/struct/28/_67/lexuz_212507.doc\"><strong>ЎЗБЕКИСТОН РЕСПУБЛИКАСИ ВАЗИРЛАР МАҲКАМАСИНИНГ &laquo;МАҲСУЛОТЛАР, ХОМ АШЁ ВА МАТЕРИАЛЛАРНИНГ ЮҚОРИ ЛИКВИДЛИ ТУРЛАРИНИ СОТИШНИНГ БОЗОР МЕХАНИЗМЛАРИНИ ЖОРИЙ ЭТИШНИ ДАВОМ ЭТТИРИШ ТЎҒРИСИДА&raquo; 2004 ЙИЛ 5 ФЕВРАЛДАГИ 57-СОН ҚАРОРИ</strong></a></p>\r\n</header>\r\n<div class=\"text\"><strong>(<span class=\"file_ext\">DOC</span>,&nbsp;<span class=\"file_size\">124.07&nbsp;KB</span>)</strong></div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<figure><strong><img style=\"float: left;\" src=\"http://ajax.uz/file_ext/doc.png\" width=\"83\" /></strong></figure>\r\n<header>\r\n<p><a href=\"http://uzdon.uz/img/struct/28/_67/lexuz_345376.doc\"><strong>ЎЗБЕКИСТОН РЕСПУБЛИКАСИ ВАЗИРЛАР МАҲКАМАСИНИНГ &laquo;ЎЗДОНМАҲСУЛОТ&raquo; ДАВЛАТ-АКЦИЯДОРЛИК КОРПОРАЦИЯСИНИ &laquo;ЎЗДОНМАҲСУЛОТ&raquo; АКЦИЯДОРЛИК КОМПАНИЯСИГА АЙЛАНТИРИШ ТЎҒРИСИДА&raquo; 2004 ЙИЛ 6 АВГУСТДАГИ 376-СОН ҚАРОРИ</strong></a></p>\r\n</header>\r\n<div class=\"text\"><strong>(<span class=\"file_ext\">DOC</span>,&nbsp;<span class=\"file_size\">62.05&nbsp;KB</span>)</strong></div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<figure><strong><img style=\"float: left;\" src=\"http://ajax.uz/file_ext/doc.png\" width=\"83\" /></strong></figure>\r\n<header>\r\n<p><a href=\"http://uzdon.uz/img/struct/28/_67/lexuz_1004810.doc\"><strong>ЎЗБЕКИСТОН РЕСПУБЛИКАСИ ВАЗИРЛАР МАҲКАМАСИНИНГ &laquo;ДОН ВА ДОННИ ҚАЙТА ИШЛАШ МАҲСУЛОТЛАРИ ҲИСОБИНИ ЮРИТИШ ТИЗИМИНИ ТАКОМИЛЛАШТИРИШГА, УЛАРНИНГ САҚЛАНИШИ УСТИДАН НАЗОРАТНИ КУЧАЙТИРИШГА ДОИР ҚЎШИМЧА ЧОРА-ТАДБИРЛАР ТЎҒРИСИДА&raquo; 2006 ЙИЛ 25 МАЙДАГИ 95-СОН ҚАРОРИ</strong></a></p>\r\n</header>\r\n<div class=\"text\"><strong>(<span class=\"file_ext\">DOC</span>,&nbsp;<span class=\"file_size\">459.09&nbsp;KB</span>)</strong></div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<figure><strong><img style=\"float: left;\" src=\"http://ajax.uz/file_ext/doc.png\" width=\"83\" /></strong></figure>\r\n<header>\r\n<p><a href=\"http://uzdon.uz/img/struct/28/_67/vmq_164-_kasblarning_yangilangan_klassifikatori.doc\"><strong>VMQ_164-_KASBLARNING_YANGILANGAN_KLASSIFIKATORI</strong></a></p>\r\n</header>\r\n<div class=\"text\"><strong>(<span class=\"file_ext\">DOC</span>,&nbsp;<span class=\"file_size\">79.97&nbsp;KB</span>)</strong></div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<figure><strong><img style=\"float: left;\" src=\"http://ajax.uz/file_ext/pdf.png\" width=\"83\" /></strong></figure>\r\n<header>\r\n<p><a href=\"http://uzdon.uz/img/struct/28/_67/pkm_99.pdf\"><strong>PKM_99</strong></a></p>\r\n</header>\r\n<div class=\"text\"><strong>(<span class=\"file_ext\">PDF</span>,&nbsp;<span class=\"file_size\">647.58&nbsp;KB</span>)</strong></div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<p><strong><img style=\"float: left;\" src=\"http://ajax.uz/file_ext/docx.png\" width=\"83\" /></strong></p>\r\n<header>\r\n<p><a href=\"http://uzdon.uz/img/struct/28/_67/05-10-2016_pf.docx\"><strong>05-10-2016_PF</strong></a></p>\r\n</header>\r\n<div class=\"text\"><strong>(<span class=\"file_ext\">DOCX</span>,&nbsp;<span class=\"file_size\">21.29&nbsp;KB</span>)</strong></div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<div class=\"text\">&nbsp;</div>\r\n<article>\r\n<p><strong><img style=\"float: left;\" src=\"http://ajax.uz/file_ext/pdf.png\" width=\"83\" /></strong></p>\r\n<p><a href=\"http://uzdon.uz/img/struct/28/_67/pkm_-_312.pdf\"><strong>PKM_-_312</strong></a></p>\r\n<p class=\"text\"><strong>(<span class=\"file_ext\">PDF</span>,&nbsp;<span class=\"file_size\">1013.84&nbsp;KB</span>)</strong></p>\r\n</article>\r\n</div>\r\n</div>', 2, 34, 0, 0, '', 2, 2, 1, '2019-05-27 10:11:00', '2019-05-28 13:56:15', 1, 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
