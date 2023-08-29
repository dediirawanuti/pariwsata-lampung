-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 25, 2023 at 09:55 PM
-- Server version: 10.2.3-MariaDB-log
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `n1583121_pesawaran`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `nama`, `keterangan`) VALUES
(1, 'Wisata Alam', 'Ini adalah keterangan alam, yang akan dibatasi stringnya'),
(3, 'Wisata Buatan', 'keterangan buatan'),
(7, 'Wisata Pantai', 'Vivamus suscipit tortor eget felis porttitor volutpat. Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Curabitur aliquet quam id dui posuere blandit. Cras ultricies ligula sed magna dictum porta. Vivamus suscipit tortor eget felis porttitor volutpat. Donec rutrum congue leo eget malesuada. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Nulla quis lorem ut libero malesuada feugiat. Nulla porttitor accumsan tincidunt. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Cras ultricies ligula sed magna dictum porta. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus.\r\n123\r\nCurabitur non nulla sit amet nisl tempus convallis quis ac lectus. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec sollicitudin molestie malesuada. Donec rutrum congue leo eget malesuada. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Curabitur aliquet quam id dui posuere blandit. Cras ultricies ligula sed magna dictum porta. Proin eget tortor risus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.'),
(8, 'Virtual Tour 360°', 'Ini adalah menu kategori virtual tour dengan implementasi 360° panoramic photo yang di ambil dengan kamera camera360');

-- --------------------------------------------------------

--
-- Table structure for table `galery`
--

CREATE TABLE `galery` (
  `id` int(11) NOT NULL,
  `maps_id` int(11) DEFAULT NULL,
  `filename` varchar(250) DEFAULT NULL,
  `tipe` enum('brand','galery') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `galery`
--

INSERT INTO `galery` (`id`, `maps_id`, `filename`, `tipe`, `created_at`) VALUES
(10, 59, '1661789288_e53fb7d30588eb20bba3.jpg', 'galery', '2022-08-29 23:08:08'),
(11, 59, '1661789325_6210dc0be666cc7e6a49.jpg', 'galery', '2022-08-29 23:08:45'),
(12, 59, '1661789643_27367618a4c7b38221e8.jpg', 'galery', '2022-08-29 23:14:03'),
(13, 60, '1661791523_949a8b99c3f0284c3d4a.jpg', 'galery', '2022-08-29 23:45:23'),
(14, 60, '1661791534_f59757618afdf5664770.jpg', 'galery', '2022-08-29 23:45:34'),
(15, 60, '1661791539_5763407d8115ea894202.jpg', 'galery', '2022-08-29 23:45:39'),
(16, 61, '1661792247_578b76b102fc58911112.jpg', 'galery', '2022-08-29 23:57:27'),
(17, 61, '1661792249_c88dce73d6e6caa4051f.jpg', 'galery', '2022-08-29 23:57:29'),
(18, 61, '1661792281_bfc70264d2964c4ad8c4.jpg', 'galery', '2022-08-29 23:58:01'),
(19, 62, '1661846202_9dd86b1efb54ff25428b.jpg', 'galery', '2022-08-30 14:56:42'),
(20, 62, '1661846202_82ab648c7ca1227f098e.jpg', 'galery', '2022-08-30 14:56:42'),
(21, 62, '1661846203_0f3154ee0c84d2a93e66.jpg', 'galery', '2022-08-30 14:56:43'),
(23, 63, '1661847374_e473b96b9520dafa6374.jpg', 'galery', '2022-08-30 15:16:14'),
(24, 63, '1661847374_2f8ffa0164d9d7dea28d.jpg', 'galery', '2022-08-30 15:16:14'),
(25, 63, '1661847374_27a98391b4be547b58b0.jpg', 'galery', '2022-08-30 15:16:14'),
(26, 64, '1661849119_c2c3b4258ec69aa5ca7a.jpeg', 'galery', '2022-08-30 15:45:19'),
(27, 64, '1661849119_849b7bbca2dab55eb306.jpg', 'galery', '2022-08-30 15:45:19'),
(28, 64, '1661849120_6430e5a79258fbe1be23.jpg', 'galery', '2022-08-30 15:45:20'),
(30, 65, '1661868865_c8c4061c4ea4f3971153.jpg', 'galery', '2022-08-30 21:14:25'),
(31, 65, '1661868865_829afcf20dcb00cd5b82.jpg', 'galery', '2022-08-30 21:14:25'),
(32, 65, '1661868866_857dbd925ef93c2bcd6b.jpg', 'galery', '2022-08-30 21:14:26'),
(33, 66, '1661870856_11319a51a7c040f2c4d9.jpg', 'galery', '2022-08-30 21:47:36'),
(34, 66, '1661870856_a1f9cd539bdc94593935.jpg', 'galery', '2022-08-30 21:47:36'),
(35, 66, '1661870867_2b209f5bfa49979e310d.jpg', 'galery', '2022-08-30 21:47:47'),
(36, 67, '1661871821_836c06c901cf93051d61.jpg', 'galery', '2022-08-30 22:03:41'),
(37, 67, '1661871821_e5404115506cb18459b8.jpg', 'galery', '2022-08-30 22:03:41'),
(38, 67, '1661871821_e4369cbef573a8e9338a.jpg', 'galery', '2022-08-30 22:03:41'),
(40, 68, '1661873629_d868706b403df152a007.jpg', 'galery', '2022-08-30 22:33:49'),
(41, 68, '1661873629_c956b191bb0e45626604.jpg', 'galery', '2022-08-30 22:33:49'),
(42, 68, '1661873629_a2298e6d9916beacb343.jpg', 'galery', '2022-08-30 22:33:49'),
(43, 69, '1661875720_1ab05248f2d6ce7cd470.jpg', 'galery', '2022-08-30 23:08:40'),
(44, 69, '1661875720_3e6c2eb1715444f0863a.jpg', 'galery', '2022-08-30 23:08:40'),
(45, 69, '1661875720_9e8151b47ef7b7d32dfe.jpg', 'galery', '2022-08-30 23:08:40'),
(46, 70, '1662018043_8f63556cb90aec2b319f.jpg', 'galery', '2022-09-01 14:40:43'),
(47, 70, '1662018043_a7a8e185c7ff2297a9cd.jpg', 'galery', '2022-09-01 14:40:43'),
(48, 70, '1662018043_7681e9ef5afa968e52b3.jpg', 'galery', '2022-09-01 14:40:43'),
(50, 71, '1662018451_128440d02eb0eb972096.jpg', 'galery', '2022-09-01 14:47:31'),
(51, 71, '1662018451_999c851a6a8a3f4cf962.jpg', 'galery', '2022-09-01 14:47:31'),
(52, 71, '1662018451_d698faa6f22223d9cae2.jpg', 'galery', '2022-09-01 14:47:31'),
(54, 72, '1662038765_368d3c263f6e3c8ea955.jpg', 'galery', '2022-09-01 20:26:05'),
(55, 72, '1662038768_7ede20810f92dadceeaa.jpg', 'galery', '2022-09-01 20:26:08'),
(56, 72, '1662038769_28c8b6cc5c95d3c45f82.jpg', 'galery', '2022-09-01 20:26:09'),
(58, 73, '1662040884_e3bd237758e527a81656.jpg', 'galery', '2022-09-01 21:01:24'),
(59, 73, '1662040893_a3c778e76a582fab1695.jpeg', 'galery', '2022-09-01 21:01:33'),
(61, 73, '1662040931_b2afa2380e4213088843.jpg', 'galery', '2022-09-01 21:02:11'),
(62, 0, '1662041680_58ab6a600594ec40dd2d.png', 'brand', '2022-09-01 21:14:40'),
(63, 0, '1662041691_2575ebbba10917d47e61.png', 'brand', '2022-09-01 21:14:51'),
(64, 0, '1662041776_bd598868117a222d6c5e.png', 'brand', '2022-09-01 21:16:16'),
(65, 74, '1662042943_81c8d73cb0f3b931b939.jpg', 'galery', '2022-09-01 21:35:43'),
(66, 74, '1662042950_8cd5d0ef12e6a40451cb.jpg', 'galery', '2022-09-01 21:35:50'),
(67, 74, '1662042956_0ebe4b8f14a17ec9f279.jpg', 'galery', '2022-09-01 21:35:56'),
(68, 75, '1662045076_49d1197cc6b1b0c43620.jpg', 'galery', '2022-09-01 22:11:16'),
(69, 75, '1662045084_fd134473c49a04fde6df.jpg', 'galery', '2022-09-01 22:11:24'),
(70, 75, '1662045089_7c38610ff3f8825c024b.jpg', 'galery', '2022-09-01 22:11:29'),
(71, 76, '1662045853_1d7879b4e0e035c2923c.jpg', 'galery', '2022-09-01 22:24:13'),
(72, 76, '1662045859_94991b8db763e5391745.jpg', 'galery', '2022-09-01 22:24:19'),
(73, 76, '1662045869_4b46a7a087aa4637be6a.jpg', 'galery', '2022-09-01 22:24:29'),
(74, 77, '1662047759_4f865b2b70dfcedfaa2c.jpg', 'galery', '2022-09-01 22:55:59'),
(75, 77, '1662047765_64c9ff443356a83b47fa.jpg', 'galery', '2022-09-01 22:56:05'),
(76, 77, '1662047770_a5771c2571c338d5e6ec.jpg', 'galery', '2022-09-01 22:56:10'),
(77, 78, '1662122722_2e41b3b857108ed1d715.jpg', 'galery', '2022-09-02 19:45:22'),
(78, 78, '1662122730_c9262389e643a12eaafc.jpg', 'galery', '2022-09-02 19:45:30'),
(79, 78, '1662122737_f169032226f53f8f1c3a.jpg', 'galery', '2022-09-02 19:45:37'),
(80, 79, '1662123052_2c532a7253c8ca095bd7.jpg', 'galery', '2022-09-02 19:50:52'),
(81, 79, '1662123052_f78e05e0292271d0e8fc.jpg', 'galery', '2022-09-02 19:50:52'),
(82, 79, '1662123053_df1d4bacc551b63f28fd.jpg', 'galery', '2022-09-02 19:50:53'),
(84, 83, '1663042669_3c361bc3bdf0eb38c4cf.jpg', 'galery', '2022-09-13 11:17:49'),
(85, 83, '1663042669_e8a8ad414db8a88badc7.jpg', 'galery', '2022-09-13 11:17:49'),
(86, 83, '1663042670_a549047b82cff41728c1.jpg', 'galery', '2022-09-13 11:17:50'),
(87, 82, '1663043611_976915b51e15f95ac861.jpg', 'galery', '2022-09-13 11:33:31'),
(88, 82, '1663043611_da314e3f186c8c223c9c.jpg', 'galery', '2022-09-13 11:33:31'),
(89, 82, '1663043611_fc5ff6b3a8655f379f86.jpg', 'galery', '2022-09-13 11:33:31'),
(90, 81, '1663044272_f8af8c6164bfc3c107da.jpg', 'galery', '2022-09-13 11:44:32'),
(91, 81, '1663044272_501b21624d91a22b5a44.jpg', 'galery', '2022-09-13 11:44:32'),
(92, 81, '1663044272_b88941977f59fa9e6fee.jpg', 'galery', '2022-09-13 11:44:32'),
(93, 80, '1663170876_d64c511df94abe2ab9b2.jpg', 'galery', '2022-09-14 22:54:36'),
(94, 80, '1663170876_183123f6258cb2d4ad1d.jpg', 'galery', '2022-09-14 22:54:36'),
(95, 80, '1663170877_ed5d008fb1c5c954a47b.jpg', 'galery', '2022-09-14 22:54:37');

-- --------------------------------------------------------

--
-- Table structure for table `graphs`
--

CREATE TABLE `graphs` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `scope` varchar(255) NOT NULL,
  `lat` varchar(255) NOT NULL,
  `lng` varchar(255) NOT NULL,
  `maps_id` int(11) NOT NULL,
  `tujuan` varchar(255) NOT NULL,
  `no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `graphs`
--

INSERT INTO `graphs` (`id`, `nama`, `scope`, `lat`, `lng`, `maps_id`, `tujuan`, `no`) VALUES
(386, 'Batalion 9B', 'Pantai Klara', '-5.579688074457351', '105.21385606774942', 59, '386', 1),
(387, 'Panatai Ketapang', 'Pantai Klara', '-5.587034841352164', '105.22540734601483', 59, '386', 2),
(388, 'Pantai Mutun', 'Pantai Klara', '-5.575940265227317', '105.2288980034051', 59, '387', 3),
(389, 'Lapangan Hanura', 'Pantai Klara', '-5.536280256006819', '105.23915392877836', 59, '388', 4),
(390, 'Pantai Bensam', 'Pantai Klara', '-5.577242127423759', '105.20133456407217', 59, '386', 5),
(391, 'Desa Dantar', 'Pantai Klara', '-5.573400045571418', '105.19317974018696', 59, '390', 6),
(392, 'Container Cafe (MS Town Beach)', 'Pantai Mutun', '-5.514842266079384', '105.2625957292691', 79, '392', 1),
(393, 'Warung Arfan Maulana', 'Pantai Mutun', '-5.515082069366599', '105.25883705490185', 79, '392', 2),
(394, 'Warmindo Bude Eko', 'Pantai Mutun', '-5.513938398108408', '105.25221029618581', 79, '393', 3),
(395, 'Warung Mang Boy', 'Pantai Mutun', '-5.511761407723824', '105.2496276943861', 79, '394', 4),
(396, 'TPI Lempasing', 'Pantai Mutun', '-5.488804027387204', '105.2512999727345', 79, '395', 5),
(397, 'Bakso dan Mie Ayam HRV', 'Pantai Mutun', '-5.51518913712664', '105.24249603747671', 79, '395', 6),
(398, 'Rumah Makan Pindang Ika', 'Pantai Mutun', '-5.521991952841091', '105.23679508792566', 79, '397', 7),
(399, 'Alfamart Hanura', 'Pantai Mutun', '-5.527513246976426', '105.23823936740757', 79, '398', 8),
(400, 'Brigif 9 Marinir', 'Marines Eco Park', '-5.609785989812394', '105.17054941796641', 78, '400', 1),
(401, 'Balai Pengobatan TNI AL Piabung', 'Marines Eco Park', '-5.608232074719496', '105.16711994378579', 78, '400', 2),
(402, 'SD Hang Tuah', 'Marines Eco Park', '-5.60468046062789', '105.16562459185576', 78, '401', 3),
(403, 'Ardi Cell', 'Marines Eco Park', '-5.600770573091239', '105.1603155484089', 78, '402', 4),
(404, 'Pertigaan Padang Cermin', 'Marines Eco Park', '-5.599669818318773', '105.14241993014826', 78, '403', 5),
(405, 'Puskesmas Padang Cermin', 'Marines Eco Park', '-5.603740339339851', '105.13413117721285', 78, '404', 6),
(406, 'SMK N 1 Padang Cermin', 'Marines Eco Park', '-5.604136689001606', '105.11434591499386', 78, '405', 7),
(407, 'Indomaret Padang Cermin', 'Marines Eco Park', '-5.585865546663044', '105.14264676518349', 78, '404', 8),
(408, 'Polsek Padang Cermin', 'Marines Eco Park', '-5.580474672177019', '105.14321402353784', 78, '407', 9),
(412, 'Dermaga Batu Menyan', 'Pantai Pahawang', '-5.587006366464493', '105.22689223198051', 75, '412', 1),
(413, 'RR Tour & Travel', 'Pantai Pahawang', '-5.587046457326949', '105.22533511266852', 75, '412', 2),
(414, 'SMK N 1 Padang Cermin', 'Pantai Klara', '-5.567944978773326', '105.1802471574768', 59, '391', 7),
(415, 'JL Raya Way Ratai', 'Pantai Pahawang', '-5.585633313517718', '105.22722466537112', 75, '413', 3),
(416, 'Arifuliful', 'Pantai Pahawang', '-5.58168560083169', '105.22757557888133', 75, '415', 4),
(417, 'Penjahit Baju Aji', 'Pantai Pahawang', '-5.570913281805858', '105.23055124549398', 75, '416', 5),
(418, 'SPBU AKR', 'Pantai Pahawang', '-5.565517208346407', '105.23308852854223', 75, '417', 6),
(419, 'Lapangan Futsal Brigif Marinir', 'Pantai Pahawang', '-5.585089242619972', '105.22132429228128', 75, '413', 7),
(420, 'Pantai Klara 2', 'Pantai Pahawang', '-5.581888864411525', '105.21740041856975', 75, '419', 8),
(421, 'Pantai Klara 1', 'Pantai Pahawang', '-5.580586234199245', '105.21582019869066', 75, '420', 9),
(422, 'Pantai Bensam', 'Pantai Pahawang', '-5.579407715841768', '105.2099997297534', 75, '421', 10),
(423, 'Unroad 1', 'Pantai Tanjung Putus', '-5.72737197512356', '105.21044875565212', 74, '423', 1),
(424, 'Unroad 2', 'Pantai Tanjung Putus', '-5.725500054448361', '105.2110274832607', 74, '423', 2),
(425, 'Pertigaan Punduh', 'Pantai Tanjung Putus', '-5.720320449987881', '105.21178264100377', 74, '424', 3),
(426, 'Unroad 3', 'Pantai Tanjung Putus', '-5.719286304723923', '105.21338215205964', 74, '425', 4),
(427, 'Unroad 4', 'Pantai Tanjung Putus', '-5.715554532723758', '105.21656058959059', 74, '426', 5),
(428, 'Sukarame Punduh Pidada', 'Pantai Tanjung Putus', '-5.714200959087421', '105.20105193897564', 74, '425', 6),
(429, 'Primkopal AL ', 'Pantai Pahawang', '-5.577185707874904', '105.20379482573941', 75, '422', 11),
(430, 'Unroad 5', 'Pantai Tanjung Putus', '-5.719837065183725', '105.19280001992797', 74, '428', 7),
(431, 'Unroad 6', 'Pantai Tanjung Putus', '-5.718651095164631', '105.18480904745132', 74, '430', 8),
(432, 'Pertigaan Kota Jawa Punduh Pidada', 'Pantai Tanjung Putus', '-5.72003974606217', '105.17918682695137', 74, '431', 9),
(433, 'Kota Jawa', 'Pantai Tanjung Putus', '-5.71175667554634', '105.1775309276523', 74, '432', 10),
(434, 'Pertigaan Desa Tegal Harum', 'Pantai Tanjung Putus', '-5.695918439906407', '105.1727876055096', 74, '433', 11),
(435, 'Kampung Baru', 'Pantai Tanjung Putus', '-5.683098984014649', '105.15530748199643', 74, '434', 12),
(436, 'JL Pematang Awi', 'Pantai Tanjung Putus', '-5.649719676290701', '105.1741982127175', 74, '435', 13),
(437, 'Desa Piabung', 'Pantai Tanjung Putus', '-5.641852241762166', '105.18463095085531', 74, '436', 14),
(438, 'Marines EcoPark', 'Pantai Tanjung Putus', '-5.6323238631277945', '105.18817407331403', 74, '437', 15),
(439, 'Desa Pal 1', 'Pantai Tanjung Putus', '-5.625477078200447', '105.18352652536208', 74, '438', 16),
(440, 'SDN 17 Gedong Tataan', 'Kampung Tapis', '-5.380786727129987', '105.09805740378386', 73, '440', 1),
(441, 'Uduk Teh nung', 'Kampung Tapis', '-5.379893108697544', '105.09801708316803', 73, '440', 2),
(442, 'Resto 6 Sodara', 'Kampung Tapis', '-5.380050265250958', '105.10538719899745', 73, '441', 3),
(443, 'RM Baringin Jaya', 'Kampung Tapis', '-5.379811483552544', '105.120196111896', 73, '442', 4),
(444, 'Tugu Pengantin', 'Kampung Tapis', '-5.3798356996162795', '105.09514091378986', 73, '441', 5),
(445, 'Gading Rejo', 'Kampung Tapis', '-5.371422709491398', '105.07377496435913', 73, '444', 6),
(446, 'JL Ahmad Yani', 'Museum Nasional Ketransmigrasian', '-5.380192961764209', '105.11847866326951', 72, '446', 1),
(447, 'Rumah Makan Beringin Jaya', 'Museum Nasional Ketransmigrasian', '-5.37986382942951', '105.12002431262175', 72, '446', 2),
(448, 'Desa Wiyono', 'Museum Nasional Ketransmigrasian', '-5.373187638168275', '105.12978436994968', 72, '446', 3),
(449, 'Selero Minang', 'Museum Nasional Ketransmigrasian', '-5.365933259577147', '105.14620669960408', 72, '448', 4),
(450, 'RM Indah Pesawaran', 'Museum Nasional Ketransmigrasian', '-5.380169039203167', '105.10605263486372', 72, '446', 5),
(451, 'Pecel Lele Robi', 'Museum Nasional Ketransmigrasian', '-5.3798161342784', '105.09493133159253', 72, '450', 6),
(453, 'Cottage Syariah Villa Gardenia', 'Villa Gardenia', '-5.48588686771447', '105.24974118101608', 71, '453', 1),
(454, 'Penginapan Syariah Villa Gardenia', 'Villa Gardenia', '-5.485722468639523', '105.2505498994887', 71, '453', 2),
(455, 'Pantai Pulau Permata', 'Villa Gardenia', '-5.487006115310109', '105.25091755064551', 71, '454', 3),
(456, 'Kota Karang', 'Villa Gardenia', '-5.478749744012433', '105.24896985843134', 71, '454', 4),
(457, 'Apotek Azizi', 'Villa Gardenia', '-5.472948319032', '105.24575402755664', 71, '456', 5),
(458, 'Krematorium Lempasing', 'Muncak Teropong Laut', '-5.487626426469461', '105.25054758254396', 70, '458', 1),
(459, 'Jl Way Ratai', 'Muncak Teropong Laut', '-5.48742674301694', '105.25093385402863', 70, '458', 2),
(460, 'TPI Lempasing', 'Muncak Teropong Laut', '-5.4894422178326465', '105.25132331562611', 70, '459', 3),
(461, 'Perumahan Sukajaya Darat Lempasing', 'Muncak Teropong Laut', '-5.498216253629508', '105.24969540314163', 70, '460', 4),
(462, 'Wisata Villa Wira Garden', 'Muncak Teropong Laut', '-5.485580100365979', '105.25064156654997', 70, '459', 5),
(463, 'Kota Karang', 'Muncak Teropong Laut', '-5.478529319046828', '105.2490088400072', 70, '462', 6),
(464, 'Lapangan Wonorejo', 'Bukit Kendeng', '-5.564244728250657', '105.06241471102982', 69, '464', 1),
(465, 'Bakso Bima', 'Bukit Kendeng', '-5.578422261010857', '105.06431340392226', 69, '464', 2),
(466, 'Nedi Barbershop', 'Bukit Kendeng', '-5.584445764823414', '105.0646165304741', 69, '465', 3),
(467, 'Masjid Attaqwa', 'Bukit Kendeng', '-5.589053123554891', '105.07129532027147', 69, '466', 4),
(468, 'Indomaret Umbul Kluih', 'Bukit Kendeng', '-5.59556837368207', '105.0729230245276', 69, '467', 5),
(469, 'Puskesmas Umbul Kluih', 'Bukit Kendeng', '-5.6003947301460215', '105.07448150717295', 69, '468', 6),
(470, 'Desa Bunut', 'Bukit Kendeng', '-5.605462817688931', '105.07923095549057', 69, '469', 7),
(471, 'Jl Sidohardjo', 'Bukit Punggung Naga', '-5.5769491806673415', '105.06341319201687', 68, '471', 1),
(472, 'Sembako Atri Rejeki', 'Bukit Punggung Naga', '-5.5779229372167265', '105.0641190491313', 68, '471', 2),
(473, 'Sembako Fadil', 'Bukit Punggung Naga', '-5.586462231264775', '105.06494627172157', 68, '472', 3),
(474, 'Rumah Reza', 'Bukit Punggung Naga', '-5.588118256029773', '105.0667775887232', 68, '473', 4),
(475, 'Desa Bunut Sebrang', 'Bukit Punggung Naga', '-5.588815793516645', '105.07117716638487', 68, '474', 5),
(477, 'Jl Dewi Mandapa', 'Hutan Mangrove Petengoran', '-5.570332615194545', '105.24005970254609', 60, '477', 1),
(478, 'Warung Mas Eko', 'Hutan Mangrove Petengoran', '-5.569742977480146', '105.23795683595534', 60, '477', 2),
(479, 'Depot Yuni', 'Hutan Mangrove Petengoran', '-5.569786343751019', '105.23450243637069', 60, '478', 3),
(480, 'Jl Way Ratai', 'Hutan Mangrove Petengoran', '-5.568392479677371', '105.23308537488197', 60, '479', 4),
(481, 'SPBU Akbar', 'Hutan Mangrove Petengoran', '-5.565584962699532', '105.23310742789363', 60, '480', 5),
(482, 'Masjid Jami Al-Iklas', 'Hutan Mangrove Petengoran', '-5.562126877336098', '105.2275147098693', 60, '481', 6),
(483, 'ST 1 Tebing Metamorf', 'Hutan Mangrove Petengoran', '-5.568965379375044', '105.2314425586311', 60, '480', 7),
(484, 'Zen Alat Pancing', 'Hutan Mangrove Petengoran', '-5.571100012449477', '105.23296134525225', 60, '483', 8),
(489, 'Mess ABK Pantai Bensam', 'Pantai Bensam', '-5.579111223739702', '105.21002440814141', 61, '489', 1),
(490, 'Pantai Bensam 2', 'Pantai Bensam', '-5.579573022676271', '105.21218492344849', 61, '489', 2),
(491, 'Brigif 7 Marinir', 'Pantai Bensam', '-5.579867269307499', '105.21455667899875', 61, '490', 3),
(492, 'Pantai Klara', 'Pantai Bensam', '-5.5805668932662655', '105.21571468972382', 61, '491', 4),
(493, 'Pantai Klara 2', 'Pantai Bensam', '-5.582808662374092', '105.21828105314432', 61, '492', 5),
(494, 'Lapangan Futsa Angkasara', 'Pantai Bensam', '-5.584852385680904', '105.22048428482037', 61, '493', 6),
(495, 'Jl Way Ratai', 'Pantai Bensam', '-5.57760372676519', '105.20596080705496', 61, '489', 7),
(496, 'Mako Lanal Lampung', 'Pantai Bensam', '-5.577247555954671', '105.20396207644512', 61, '495', 8),
(499, 'Jl Dewi Mandapa', 'Pantai Dewi Mandapa', '-5.572558003863179', '105.24475654965414', 63, '499', 1),
(500, 'Hutan Mangrove Petengoran', 'Pantai Dewi Mandapa', '-5.570653899862151', '105.24077391378819', 63, '499', 2),
(501, 'Warung Mas Eko', 'Pantai Dewi Mandapa', '-5.569417262448923', '105.23891818843794', 63, '500', 3),
(502, 'Depot Yuni', 'Pantai Dewi Mandapa', '-5.569630751406891', '105.2347031604341', 63, '501', 4),
(503, 'Jl Way Ratai', 'Pantai Dewi Mandapa', '-5.568417935068041', '105.23310861029557', 63, '502', 5),
(504, 'SPBU Akbar', 'Pantai Dewi Mandapa', '-5.5655977945139625', '105.2330272751729', 63, '503', 6),
(505, 'Majid Jami AL-IKLAS', 'Pantai Dewi Mandapa', '-5.562117420416385', '105.22748668164081', 63, '504', 7),
(506, 'ST 1 Tebing Metamorf', 'Pantai Dewi Mandapa', '-5.5690529735285', '105.23153353791542', 63, '503', 8),
(507, 'Zen Alat Pancing', 'Pantai Dewi Mandapa', '-5.571038749068933', '105.2328949500008', 63, '506', 9),
(525, 'Dapoer MR BOEK', 'Kolam Renang Pesawaran City', '-5.3911619831027195', '105.08398498955512', 65, '525', 1),
(526, 'RSUD Pesawaran', 'Kolam Renang Pesawaran City', '-5.390568286050154', '105.08499773014279', 65, '525', 2),
(527, 'Bakso Fathan', 'Kolam Renang Pesawaran City', '-5.389487986795032', '105.0869707972297', 65, '526', 3),
(528, 'RM Bu Sally', 'Kolam Renang Pesawaran City', '-5.387296563110084', '105.08961714919059', 65, '527', 4),
(529, 'Pecel Lele Robi', 'Kolam Renang Pesawaran City', '-5.381881136699619', '105.09359996810372', 65, '528', 5),
(530, 'Tugu Pengantin', 'Kolam Renang Pesawaran City', '-5.380259476954691', '105.09476084693705', 65, '529', 6),
(531, 'Pertigaan Tugu Pengantin', 'Kolam Renang Pesawaran City', '-5.3798571416895555', '105.09531727128348', 65, '530', 7),
(532, 'Point Coffe', 'Kolam Renang Pesawaran City', '-5.379974950467727', '105.09975209765292', 65, '531', 8),
(533, 'SPBU Tugu', 'Kolam Renang Pesawaran City', '-5.379760500949885', '105.09490304222817', 65, '530', 9),
(535, 'Panglong Kayu Joko', 'Youth Camp Tahura Wan Abdurrahman', '-5.517211108442382', '105.22754091864329', 66, '535', 1),
(536, 'Warung Mikha', 'Youth Camp Tahura Wan Abdurrahman', '-5.518004205362772', '105.22903116056', 66, '535', 2),
(537, 'Waring Shinta', 'Youth Camp Tahura Wan Abdurrahman', '-5.51820247142183', '105.22951271818175', 66, '536', 3),
(538, 'Toko Desto', 'Youth Camp Tahura Wan Abdurrahman', '-5.518778991865702', '105.23049566075201', 66, '537', 4),
(539, 'UPR Shilla Farm', 'Youth Camp Tahura Wan Abdurrahman', '-5.520560548948339', '105.23428659493442', 66, '538', 5),
(540, 'Jl Way Ratai', 'Youth Camp Tahura Wan Abdurrahman', '-5.52227894391153', '105.23697609542006', 66, '539', 6),
(541, 'RM Makan Ika', 'Youth Camp Tahura Wan Abdurrahman', '-5.5216178245081124', '105.23687037473718', 66, '540', 7),
(542, 'Ujang Car Wash', 'Youth Camp Tahura Wan Abdurrahman', '-5.520122598890424', '105.237329078465', 66, '541', 8),
(543, 'Puskesmas Hanura', 'Youth Camp Tahura Wan Abdurrahman', '-5.5257337771966775', '105.2386410968162', 66, '540', 9),
(544, 'Warung Susi', 'Bukit Lantana', '-5.5836648117344225', '105.07231165384218', 67, '544', 1),
(545, 'SD Negeri 17 Way Ratai', 'Bukit Lantana', '-5.58435732645539', '105.07247016550593', 67, '544', 2),
(546, 'JL Way Ratai', 'Bukit Lantana', '-5.586459127889', '105.07215729465457', 67, '545', 3),
(547, 'Pertigaan Desa Bunut', 'Bukit Lantana', '-5.58899328903145', '105.07127572864493', 67, '546', 4),
(548, 'Banan Expedision', 'Bukit Lantana', '-5.5901775710711235', '105.07210367720484', 67, '547', 5),
(549, 'Toko Barokah', 'Bukit Lantana', '-5.594017430849064', '105.072761788744', 67, '548', 6),
(550, 'Masjid Nurul Falah', 'Bukit Lantana', '-5.595967369071815', '105.0729120024821', 67, '549', 7),
(551, 'Indomaret Bunut', 'Bukit Lantana', '-5.599916820879656', '105.07371015112454', 67, '550', 8),
(552, 'Pasar Bunut', 'Bukit Lantana', '-5.600524541810614', '105.07475027327172', 67, '551', 9),
(553, 'Jl Way Ratai', 'Bukit Cendana', '-5.582044141413547', '105.07127814944636', 64, '553', 1),
(554, 'Masjid Ataqwa', 'Bukit Cendana', '-5.58226808172202', '105.07174039783638', 64, '553', 2),
(555, 'Bukit Lantana', 'Bukit Cendana', '-5.583308515855734', '105.07204390220232', 64, '554', 3),
(556, 'SDN 17 Way Ratai', 'Bukit Cendana', '-5.583520587218786', '105.07222095120505', 64, '555', 4),
(557, 'JL Wayy Ratai', 'Bukit Cendana', '-5.584341149982038', '105.07247844427224', 64, '556', 5),
(558, 'Warung Edo', 'Bukit Cendana', '-5.58669408481893', '105.07202378635407', 64, '557', 6),
(559, 'Pertigaan Desa Bunut', 'Bukit Cendana', '-5.5889685320983915', '105.07121411614844', 64, '558', 7),
(560, 'Banana Expedision', 'Bukit Cendana', '-5.590169119379141', '105.0721151091559', 64, '559', 8),
(561, 'Toko Barokah', 'Bukit Cendana', '-5.594042477133371', '105.07280358793207', 64, '560', 9),
(562, 'Desa Harapan Jaya', 'Air Terjun Sinar tiga', '-5.581913871190096', '105.06973917494395', 80, '562', 1),
(563, 'Bukit Cendana', 'Air Terjun Sinar tiga', '-5.581894532062961', '105.07080592476564', 80, '562', 2),
(564, 'Jl Way Ratai', 'Air Terjun Sinar tiga', '-5.582005973799767', '105.07116806949728', 80, '563', 3),
(565, 'Masjid Ataqwa', 'Air Terjun Sinar tiga', '-5.582242146317526', '105.07167656069339', 80, '564', 4),
(566, 'Bukit Lantana', 'Air Terjun Sinar tiga', '-5.583295103297104', '105.07197245781242', 80, '565', 5),
(567, 'SDN 17 Way Rata', 'Air Terjun Sinar tiga', '-5.583511896745364', '105.07222059571637', 80, '566', 6),
(568, 'Way Ratai', 'Air Terjun Sinar tiga', '-5.584358570692729', '105.07246454491377', 80, '567', 7),
(569, 'Warung Edo', 'Air Terjun Sinar tiga', '-5.5866448754565425', '105.0720376992495', 80, '568', 8),
(570, 'Pertigaan Desa Bunut', 'Air Terjun Sinar tiga', '-5.588952648494214', '105.07124581312797', 80, '569', 9),
(571, 'Banana Expedision', 'Air Terjun Sinar tiga', '-5.590205584029633', '105.07208168051432', 80, '570', 10),
(572, 'Toko Barokah', 'Air Terjun Sinar tiga', '-5.59402082486973', '105.07282440744802', 80, '571', 11),
(573, 'Desa Gunung Rejo', 'Air Terjun Tundo Telu', '-5.599788999306952', '105.06828832682385', 81, '573', 1),
(574, 'Unroad 1', 'Air Terjun Tundo Telu', '-5.599839750891007', '105.0700624015152', 81, '573', 2),
(575, 'Sekolahan', 'Air Terjun Tundo Telu', '-5.599855176143166', '105.07171620984258', 81, '574', 3),
(576, 'Pertigaan Gunung Rejo', 'Air Terjun Tundo Telu', '-5.600273117321677', '105.07377487539964', 81, '575', 4),
(577, 'Bos Kopi Dori Gunung Rejo', 'Air Terjun Tundo Telu', '-5.600555939402241', '105.07471237338399', 81, '576', 5),
(578, 'Masjid Merant', 'Air Terjun Tundo Telu', '-5.602908294201285', '105.07474006534324', 81, '577', 6),
(579, 'Umbul Kluih', 'Air Terjun Tundo Telu', '-5.605353389142522', '105.07652863153885', 81, '578', 7),
(580, 'Unroadd', 'Air Terjun Ciupang', '-5.597778310651364', '105.06372886796214', 83, '580', 1),
(581, 'Kebun Warga', 'Air Terjun Ciupang', '-5.598163332379343', '105.06512950570118', 83, '580', 2),
(582, 'Desa Sumber Jaya', 'Air Terjun Ciupang', '-5.598882460084354', '105.06608632851805', 83, '581', 3),
(583, 'Masjid Purwa Jaya', 'Air Terjun Ciupang', '-5.599333334880669', '105.06698974659957', 83, '582', 4),
(584, 'Air Terjun Tundo Telu', 'Air Terjun Ciupang', '-5.599579697895194', '105.06779772366457', 83, '583', 5),
(585, 'Desa Gunung Rejo', 'Air Terjun Ciupang', '-5.5998155261418106', '105.06916560078554', 83, '584', 6),
(586, 'Sekolahan', 'Air Terjun Ciupang', '-5.599855421635652', '105.07028462319073', 83, '585', 7),
(587, 'Pertigaan Gunung Rejo', 'Air Terjun Ciupang', '-5.60027846112078', '105.0737465142767', 83, '586', 8),
(588, 'Bos Kopi Dori Gunung Rejo', 'Air Terjun Ciupang', '-5.600530022558871', '105.07477842063224', 83, '587', 9),
(589, '  Search Masjid Merant', 'Air Terjun Ciupang', '-5.602860760307436', '105.07474106459114', 83, '588', 10),
(590, 'Umbul Kluih', 'Air Terjun Ciupang', '-5.605444543451213', '105.07649690349308', 83, '589', 11),
(591, 'Sekolah', 'Air Terjun Kembar Rindu alam', '-5.599861677722004', '105.07029248954558', 82, '591', 1),
(592, 'Pertigaan Gunung Rejo', 'Air Terjun Kembar Rindu alam', '-5.600265254765816', '105.0737817050258', 82, '591', 2),
(593, 'Bos Kopi Dori Gunung Rejo', 'Air Terjun Kembar Rindu alam', '-5.6005436445447', '105.07476925103737', 82, '592', 3),
(594, '  Search Masjid Merant', 'Air Terjun Kembar Rindu alam', '-5.602879853571508', '105.07473853215777', 82, '593', 4),
(595, 'Umbul Kluih', 'Air Terjun Kembar Rindu alam', '-5.605304239631309', '105.07638672060381', 82, '594', 5);

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `maps_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `status` enum('pending','approve','reject') DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id`, `user_id`, `maps_id`, `body`, `status`, `created_at`) VALUES
(1, 8, 58, 'Good', 'approve', '2022-08-29 18:11:09'),
(2, 11, 59, 'Rekomendasi buat liburan ', 'approve', '2022-09-01 19:44:27');

-- --------------------------------------------------------

--
-- Table structure for table `manajemen_sistem`
--

CREATE TABLE `manajemen_sistem` (
  `id` int(11) NOT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `owner` varchar(200) DEFAULT NULL,
  `telpon` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `favicon` varchar(200) DEFAULT NULL,
  `running_text` text DEFAULT NULL,
  `tentang` text DEFAULT NULL,
  `api_key` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manajemen_sistem`
--

INSERT INTO `manajemen_sistem` (`id`, `nama`, `alamat`, `owner`, `telpon`, `email`, `logo`, `favicon`, `running_text`, `tentang`, `api_key`, `created_at`, `updated_at`) VALUES
(1, 'Pesawaran Info', NULL, 'dhdbha', '+628988290181', 'noreply@pesawaran.info', '1661700574_a7ead919938095245bb4.png', '1686839220_84baadf3736b4a8dfd54.png', NULL, 'Kabupaten Pesawaran (Aksara Lampung: Pesawaran-aksara.png) adalah salah satu kabupaten yang berada di provinsi Lampung, Indonesia. Kabupaten ini diresmikan pada tanggal 2 November 2007 berdasarkan Undang-Undang Nomor 33 Tahun 2007 tentang Pembentukan Kabupaten Pesawaran. Semula kabupaten ini merupakan bagian dari Kabupaten Lampung Selatan. Daerah ini kaya akan sumberdaya alam pertanian, perkebunan dan kehutanan. Jumlah penduduk kabupaten Pesawaran pada tahun 2020 sebanyak 477.165 jiwa.[2]\r\n\r\nSecara umum memiliki iklim hujan tropis sebagaimana iklim Provinsi Lampung pada umumnya, curah hujan per tahun berkisar antara 2.264 mm sampai dengan 2.868 mm dan hari hujan antara 90 sampai dengan 176 hari/tahun. Arus angin di Kabupaten Pesawaran bertiup dari Samudra Indonesia dengan kecepatan rata-rata 70 km/hari atau 5,83 km/jam. Sedangkan temperatur udara berkisar antara 26 °C sampai dengan 29 °C dan suhu rata-ratanya adalah 288 °C', '', '2022-07-21 18:43:39', '2023-06-11 10:54:03');

-- --------------------------------------------------------

--
-- Table structure for table `maps`
--

CREATE TABLE `maps` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `lat` varchar(255) NOT NULL,
  `lng` varchar(255) NOT NULL,
  `desc` text NOT NULL,
  `gmaps` varchar(525) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `cover` varchar(255) NOT NULL,
  `status` enum('publish','draft') NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `maps`
--

INSERT INTO `maps` (`id`, `title`, `category_id`, `lat`, `lng`, `desc`, `gmaps`, `alamat`, `cover`, `status`, `created_at`) VALUES
(59, 'Pantai Klara', 8, '-5.580029736862542', '105.21359486971949', '<p><span style=\"font-size:12.0pt;line-height:107%;\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\">Pantai Klara sendiri merupakan nama dari\nkepanjangan kelapa rapet karena dulunya Klara merupakan kebun blukar lahan\nmilik Tni al yang menghasilkan hasil bumi Klara merupakan asset dinas dan juga\nmilik negara yang sifatnya di jadikan tempat istirahat namu seiring berjalannya\nwaktu menjadi tempat yang terarah dan dan terurus dan memberikan imbas positif\nke lingkungan sekitar juga membuka peluang mensejahterakan masyarakat sekitar </span></p><p><span style=\"font-size: 16px;\">Pantai ini merupakan destinasi wisata favorit warga Lampung, karena Pantai Klara memiliki keindahan alam yang indah serta ombak yang tenang.</span><span style=\"font-size: 16px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Sehingga kamu dapat melakukan banyak keseruan di lautnya, entah itu berenang atau hanya sekedar bemain air. Hamparan pasir Pantai Klara didominasi pasir putih nan lembut.</span><span style=\"font-size: 16px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Lokasi Pantai Klara berada tak jauh dari sebuah pangkalan latihan TNI AL, pangkalan tersebut biasa digunakan prajurit untuk melakukan latihan.</span></p><p><span style=\"font-size: 16px;\">Rute menuju Pantai Klara jika bergerak dari pusat kota akan memakan waktu sekitar 40 hingga 60 menit, dengan kondisi jalan yang sudah bagus dan beraspal.</span><span style=\"font-size: 16px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Dengan mengarahkan kendaraan menuju Padang Cermin melalui Teluk Betung. Sebelum tiba di Pantai Klara kamu akan melewati beberapa pantai yang lain.</span><span style=\"font-size: 16px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Kemudian kamu akan melewati gerbang pangkalan TNI AL, dan dermaga di sekitar Padang Cermin. Hingga akhirnya tibalah kamu di Pantai Klara.</span></p><ul><li><span style=\"font-size: 16px;\">Jam operasional Pantai Klara dibuka setiap hari Senin hingga Minggu.</span></li><li><span style=\"font-size: 16px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Mulai beroperasi pada pukul 07.00 hingga pukul 19.00 waktu setempat.</span></li></ul><p><span style=\"font-size: 16px;\">Daya Tarik Pantai Klara </span><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); font-size: 16px;\">ialah adanya baligo besar yang bertuliskan Selamat Datang di Bumi Perkemahan dan Latihan TNI AL Pantai Klara Lanal Lampung.</span><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); font-size: 16px;\">Pantai ini bisa dibilang ngga begitu ramai, namun fasilitas yang ada disini sudah lengkap. Terdapat banyak saung-saung sederhana yang menghadap ke arah pantai. </span><span style=\"font-size: 16px; text-align: var(--bs-body-text-align); font-weight: var(--bs-body-font-weight);\">Dimana kamu dapat bersantai sambil menikmati indahnya Pantai Klara, sambil menikmati kelapa muda dan makanan lainnya.</span></p><p><span style=\"font-size: 16px;\">Di Pantai Klara 1 terdapat sebuah dermaga yang diberi nama Dermaga Pelangi, mungkin karena dermaga tersebut dicat berwarna warni. </span><span style=\"font-size: 16px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Tersedia beberapa tempat duduk di Dermaga Pelangi, serta banyak pengunjung yang menjadikannya sebagai lokasi untuk berfoto.</span></p><p><span style=\"font-size:12.0pt;line-height:107%;\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\">Narasumber : Bapak Sugiarto</span></p><p><span style=\"font-size:12.0pt;line-height:107%;\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">Fasilitas : </span></span></p><ul><li><span style=\"font-size:12.0pt;line-height:107%;\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\"><span style=\"font-size: 12pt; line-height: 107%;\">4 villa</span></span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\"><span style=\"font-size: 12pt; line-height: 107%;\"><span style=\"font-size: 12pt; line-height: 107%;\">1 aula</span></span></span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\"><span style=\"font-size: 12pt; line-height: 107%;\"><span style=\"font-size: 12pt; line-height: 107%;\">kantin 4</span></span></span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\"><span style=\"font-size: 12pt; line-height: 107%;\"><span style=\"font-size: 12pt; line-height: 107%;\">mushola </span></span></span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\"><span style=\"font-size: 12pt; line-height: 107%;\"><span style=\"font-size: 12pt; line-height: 107%;\">serta pondok 40</span></span></span></span></li><li><span style=\"font-size: 12pt; font-family: \" times=\"\" new=\"\" roman\",=\"\" \"serif\";=\"\" font-weight:=\"\" var(--bs-body-font-weight);=\"\" text-align:=\"\" var(--bs-body-text-align);\"=\"\">warung,banan boat,Tempat berfoto</span></li></ul><p><span style=\"font-size: 12pt; font-family: \" times=\"\" new=\"\" roman\",=\"\" \"serif\";=\"\" font-weight:=\"\" var(--bs-body-font-weight);=\"\" text-align:=\"\" var(--bs-body-text-align);\"=\"\">Harga Tiket masuk :</span></p><ul><li><span style=\"font-size:12.0pt;line-height:107%;\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\">Tiket masuk roda 2 : Rp. 20.000 Ribu</span></li><li><span style=\"font-size:12.0pt;line-height:107%;\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Tiket masuk roda 4</span> : </span><span style=\"font-family: \" times=\"\" new=\"\" roman\",=\"\" \"serif\";=\"\" font-size:=\"\" 16px;=\"\" font-weight:=\"\" var(--bs-body-font-weight);=\"\" text-align:=\"\" var(--bs-body-text-align);\"=\"\">Rp. 50.000 Ribu</span></li><li><span style=\"font-size:12.0pt;line-height:107%;\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Tiket masuk roda 6</span> : Rp. 150.000 Ribu - </span><span style=\"font-family: \" times=\"\" new=\"\" roman\",=\"\" \"serif\";=\"\" font-size:=\"\" 16px;=\"\" font-weight:=\"\" var(--bs-body-font-weight);=\"\" text-align:=\"\" var(--bs-body-text-align);\"=\"\">Rp. 250.000 Ribu</span><span style=\"font-size: 12pt; font-family: \" times=\"\" new=\"\" roman\",=\"\" \"serif\";=\"\" font-weight:=\"\" var(--bs-body-font-weight);=\"\" text-align:=\"\" var(--bs-body-text-align);\"=\"\"><br></span></li></ul><p><span style=\"font-size:12.0pt;line-height:107%;\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\"><br></span><br></span><br></p>', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3970.9128717345006!2d105.21056697394312!3d-5.579897255390356!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e412884e2b18a41%3A0xbdbde9a49735eb99!2sKlara%20Beach%20Pesawaran%20Lampung!5e0!3m2!1sen!2sid!4v1686474197514!5m2!1sen!2sid\" width=\"100%\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'Gebang, Kec. Padang Cermin, Kabupaten Pesawaran, Lampung', '1687681086_84aa923797e9005acb25.jpg', 'publish', '2022-08-22 15:53:06'),
(60, 'Hutan Mangrove Petengoran', 7, '-5.570652031247533', '105.24101742868874', '<p><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\">Kawasan Mangrove Petengoran  di ambil dari\r\nnama hutan mangrove yang di dirikan agar mengedukasi wisatawan tentang mangrove\r\nserta agar masyarakat lebih paham tentang pentingnya mangrove bagi ekosistem\r\nlaut dan juga lingkungan maka dari itu di buatlah tempat wisata hutan mangrove\r\npetengoran serta agar membuat prekonomian masyarakat lebih baik.</span></p><p><span style=\"line-height: 107%;\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; color: rgb(33, 37, 41); font-family: Helvetica;\">disini kalian akan disuguhkan oleh rindangnya hutan bakau dan indahnya hamparan laut biru. Yang tentunya tidak lupa untuk mengabadikan momen, karena di sini banyak spot foto yang instagramable. </span><span style=\"text-align: var(--bs-body-text-align); font-size: 16px;\"><font color=\"#212529\" face=\"Helvetica\">Pintu masuk yang terbuat dari bambu bermahkota siger yang menandai kalian berada di Provinsi Lampung pun menyambut. Dengan dua orang petugas karcis yang tersenyum ramah</font></span></span></p><p><span style=\"line-height: 107%;\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"text-align: var(--bs-body-text-align);\"><font color=\"#212529\" face=\"Helvetica\" style=\"\"><span style=\"font-size: 16px;\">Memasuki kawasan wisata, dengan papan yang disusun berjejer rapi menjadi jalan setapak. Yang satu, ke arah kanan mendampingi pepohonan mangrove sepanjang 320 meter. Jalur lain ke arah kiri meliuk mengikuti barisan depan mangrove yang juga dikenal dengan pohon bakau. Sejauh 420 meter. Setidaknya begitu yang tertulis di papan panduan yang terletak di depan gerbang pintu masuk tadi.</span></font></span></span></p><p><font color=\"#212529\" face=\"Helvetica\"><span style=\"font-size: 16px;\">Sebagai gambaran umum, tempat ini menyediakan 3 pondokan besar dan sekitar 7 pondokan kecil yang ukurannya pas ditempati bagi sepasang kekasih. Dua kafe mengambang yang seakan berada di tengah laut. Serta jalan setapak ditengah batang-batang mangrove yang kokoh berdiri di atas air laut. </span></font><span style=\"font-size: 16px; color: rgb(33, 37, 41); font-family: Helvetica; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Ketika kalian ingin mengeksplor ke samping kiri terlebih dahulu, sekitar 5 meter setelah kalian melangkahkan kaki, satu gardu tempat pengunjung beristirahat terlewati.</span></p><p><font color=\"#212529\" face=\"Helvetica\">25 meter kemudian, terdapat Mushalla di sebelah kiri. Bangunan itu sederhana terbuat dari kayu dan bambu. Beberapa sajadah tersusun rapi. Musholla Hadiqotul Mangrove namanya. Tulisan itu tertera pada dinding bagian depan musholla. Dibuat dati stereo form yang dicat warna biru. </font><span style=\"color: rgb(33, 37, 41); font-family: Helvetica; font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Bagi pengunjung beragama Islam, keberadaan Musholla tersebut sungguh sangat memfasilitasi. Sebab mereka bisa langsung menunaikan ibadah salat saat waktunya tiba. Tanpa harus pergi jauh meninggalkan kenikmatan berwisata. </span><span style=\"color: rgb(33, 37, 41); font-family: Helvetica; font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">10 meter kemudian. Terdapat satu gardu lagi. Bangunan beratapkan seng tanpa dinding. Disangga oleh empat tiang kayu. Dengan luas sekitar 3x3 meter.</span></p><p><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\">Narasumber : Bang Toni</span><br></span></p><p><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\">Fasilitas :</span></p><ul><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">Tempat Parkir</span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">Mushola</span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">Kamar Mandi</span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">Warung</span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">Pondokan</span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">Spot Foto dan </span></span><span style=\"font-size: 12pt; font-family: \" times=\"\" new=\"\" roman\",=\"\" \"serif\";=\"\" font-weight:=\"\" var(--bs-body-font-weight);=\"\" text-align:=\"\" var(--bs-body-text-align);\"=\"\">Hutan Mangrove 10 hektar</span></li></ul><p><span style=\"font-size: 12pt; font-family: \" times=\"\" new=\"\" roman\",=\"\" \"serif\";=\"\" font-weight:=\"\" var(--bs-body-font-weight);=\"\" text-align:=\"\" var(--bs-body-text-align);\"=\"\">Tiket Masuk :</span></p><p><span style=\"font-size: 12pt; font-family: \" times=\"\" new=\"\" roman\",=\"\" \"serif\";=\"\" font-weight:=\"\" var(--bs-body-font-weight);=\"\" text-align:=\"\" var(--bs-body-text-align);\"=\"\"></span></p><ul><li><span times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\" style=\"font-size: 12pt; line-height: 17.12px;\">Tiket masuk roda 2 : Rp. 3.000 Ribu</span></li><li><span times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\" style=\"font-size: 12pt; line-height: 17.12px;\"><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Tiket masuk roda 4</span> : </span><span times=\"\" new=\"\" roman\",=\"\" \"serif\";=\"\" font-size:=\"\" 16px;=\"\" font-weight:=\"\" var(--bs-body-font-weight);=\"\" text-align:=\"\" var(--bs-body-text-align);\"=\"\">Rp. 15.000 Ribu</span></li><li><span times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\" style=\"font-size: 12pt; line-height: 17.12px;\"><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Tiket masuk roda 6</span> : Rp. 100.000 Ribu</span></li></ul>', '', 'Desa Gebang, Kecamatan Padang Cermin, Kabupaten Pesawaran.', '1661791551_4bc9675878b73fcc78f7.jpg', 'publish', '2022-08-30 00:37:55'),
(61, 'Pantai Bensam', 7, '-5.579418691883959', '105.2098785540116', '<p><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\">Dinamakan bensam sendiri di berikan nama oleh komandan\r\nlanal karena letak dari pantai Bensam sendiri terletak berdekatan dengan\r\ndermaga Angkatan laut.</span><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); font-size: 16px;\">Bensam atau Benteng Samudera merupakan destinasi wisata bahari yang berada di Jalan Way Ratai, Batu Menyan, Teluk Pandan, Kabupaten Pesawaran.</span><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); font-size: 16px;\">Pantai tersebut bertetangga dengan Pantai Klara 1 dan 2.</span></p><p><span style=\"font-size: 16px;\">Fasilitas yang nampak secara kasat mata pada satu area Pantai Bensam antara lain Halaman Parkir, Waroeng Bensam, Aula, Mushala, Gazebo, Ayunan, Toilet, Tenan Oleh-oleh, Pos Jaga, dan Villa.</span><span style=\"font-size: 16px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Gazebo, Villa, dan Waroeng Bensam terlihat dibangun dengan gaya konstruksi vernakular kontemporer menggunakan kayu yang dicat mengkilap kecokelatan.</span></p><p><span style=\"font-size: 16px;\">Sementara fasilitas hiburan di Pantai Bensam yang disewakan adalah Ban, Banana Boat, Donat Boat, Kano, Stand Up Paddle, sampai transportasi air semacam Perahu Jukung dan Speed Boat.</span></p><p><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); font-size: 16px;\">Gunawan adalah satu di antara Penjaga Kapal Banana dan Donat Boat yang juga merupakan  warga setempat.</span><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); font-size: 16px;\">Pihaknya menyewakan kapal dengan tarif perorang Rp 35 ribu.</span></p><p><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\">Fasilitas : </span></p><ul><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">4 Buah Villa</span></span></li><li><span style=\"font-size: 12pt; font-family: \" times=\"\" new=\"\" roman\",=\"\" \"serif\";=\"\" font-weight:=\"\" var(--bs-body-font-weight);=\"\" text-align:=\"\" var(--bs-body-text-align);\"=\"\">1 aula</span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">4 Buah Kantin </span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">Mushola </span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\"><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">40</span><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\"> P</span>ondok dan warung</span><br></span></li></ul><p><span times=\"\" new=\"\" roman\",=\"\" \"serif\";=\"\" font-weight:=\"\" var(--bs-body-font-weight);=\"\" text-align:=\"\" var(--bs-body-text-align);\"=\"\" style=\"font-size: 12pt;\">Harga Tiket masuk :</span></p><ul><li><span times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\" style=\"font-size: 12pt; line-height: 17.12px;\">Tiket masuk roda 2 : Rp. 20.000 Ribu</span></li><li><span times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\" style=\"font-size: 12pt; line-height: 17.12px;\"><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Tiket masuk roda 4</span> : </span><span times=\"\" new=\"\" roman\",=\"\" \"serif\";=\"\" font-size:=\"\" 16px;=\"\" font-weight:=\"\" var(--bs-body-font-weight);=\"\" text-align:=\"\" var(--bs-body-text-align);\"=\"\">Rp. 50.000 Ribu</span></li><li><span times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\" style=\"font-size: 12pt; line-height: 17.12px;\"><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Tiket masuk roda 6</span> : Rp. 150.000 Ribu - </span><span times=\"\" new=\"\" roman\",=\"\" \"serif\";=\"\" font-size:=\"\" 16px;=\"\" font-weight:=\"\" var(--bs-body-font-weight);=\"\" text-align:=\"\" var(--bs-body-text-align);\"=\"\">Rp. 250.000 Ribu</span></li></ul>', '', 'Batumenyan, Kecamatan Teluk Pandan, Kabupaten Pesawaran, Lampung 35351', '1661792219_72d5e21f7c096e5477ea.jpg', 'publish', '2022-08-30 00:56:59'),
(62, 'Kolam Renang W&W', 3, '-5.597633678208808', '105.0616178046111', '<p><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\"Times New Roman\",\"serif\";mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:EN-US;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA\">Di berikan Nama W&W sendiri bisa berdasarkan\r\nnama desanya yaitu Wates way ratai bisa juga nama pemiliknya wawan dan wiwin.</span></p><p><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\"Times New Roman\",\"serif\";mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:EN-US;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA\">Fasilitas :</span></p><ul><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\"Times New Roman\",\"serif\";mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:EN-US;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA\"><span style=\"font-size: 12pt; line-height: 107%;\">Kolam Renang Anak anak </span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\"Times New Roman\",\"serif\";mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:EN-US;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA\"><span style=\"font-size: 12pt; line-height: 107%;\">Kolam Renang Dewasa</span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\"Times New Roman\",\"serif\";mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:EN-US;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA\"><span style=\"font-size: 12pt; line-height: 107%;\">Musola</span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\"Times New Roman\",\"serif\";mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:EN-US;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA\"><span style=\"font-size: 12pt; line-height: 107%;\">Kamar\r\nMandi</span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\"Times New Roman\",\"serif\";mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:EN-US;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA\"><span style=\"font-size: 12pt; line-height: 107%;\">Wahana Bermain Air</span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\"Times New Roman\",\"serif\";mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:EN-US;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA\"><span style=\"font-size: 12pt; line-height: 107%;\">Parkir Kendaraan</span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\"Times New Roman\",\"serif\";mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:EN-US;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA\"><span style=\"font-size: 12pt; line-height: 107%;\">Kantin</span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\"Times New Roman\",\"serif\";mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:EN-US;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA\"><span style=\"font-size: 12pt; line-height: 107%;\">Tempat Penjualan Souvenir/cindera mata,dan juga pondokan</span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\"Times New Roman\",\"serif\";mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:EN-US;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA\"><span style=\"font-size: 12pt; line-height: 107%;\">Tiket Masuk :</span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\"Times New Roman\",\"serif\";mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:EN-US;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA\"><span style=\"font-size: 12pt; line-height: 107%;\"><span style=\"font-size: 12pt; line-height: 107%;\">Anak Anak : Rp 15.000 dari umur 3-10 Tahun  </span></span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\"Times New Roman\",\"serif\";mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:EN-US;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA\"><span style=\"font-size: 12pt; line-height: 107%;\"><span style=\"font-size: 12pt; line-height: 107%;\">Orang dewasa: Rp\r\n20.000 dari umur 12-20 Tahun</span></span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\"Times New Roman\",\"serif\";mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:EN-US;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA\"><span style=\"font-size: 12pt; line-height: 107%;\"><span style=\"font-size: 12pt; line-height: 107%;\">Motor : Rp 5.000</span></span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\"Times New Roman\",\"serif\";mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin;mso-ansi-language:EN-US;mso-fareast-language:\r\nEN-US;mso-bidi-language:AR-SA\"><span style=\"font-size: 12pt; line-height: 107%;\"><span style=\"font-size: 12pt; line-height: 107%;\">Mobil : Rp 10.000 <br></span><br></span></span><br></li></ul>', '', 'Wates Way Ratai, Kec. Padang Cermin, Kabupaten Pesawaran, Lampung 35451', '1661846124_9dc6f313f7d9dcd2400a.jpg', 'publish', '2022-08-30 15:55:24'),
(63, 'Pantai Dewi Mandapa', 7, '-5.572391745392551', '105.24478114707517', '<p><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\">Pantai Dewi Mandapa merupakan salah satu pantai yang ada di Lampung tepatnya di Kabupaten Pesawaran, yang memiliki keindahan dan keunikannya tersendiri.</span><span style=\"font-size: 16px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Lokasi Pantai Dewi Mandapa masih sangat tersembunyi, hal tersebut ditandai dengan masih rindangnya pepohonan di jalur menuju Pantai Dewi Mandapa.</span></p><p><span style=\"font-size: 16px;\">Meski begitu, pantai ini menyimpan keindahan yang sangat mengagumkan. Banyak pengunjung yang takjub akan keindahan yang dimilikinya.</span><span style=\"font-size: 16px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Kamu dapat menenangkan diri sambil menikmati panorama indah yang tersaji di depan mata. Beberapa pohon mangrove ikut menghiasi Pantai Dewi Mandapa.</span><span style=\"font-size: 16px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Pantai ini merupakan rumah bagi pohon mangrove atau pohon bakau, sehingga tercipta hutan bakau atau hutan mangrove yang sangat asri.</span></p><p>Rute menuju Pantai Dewi Mandapa jika berangkat dari Kota Bandar Lampung memerlukan waktu sekitar 1 jam perjalanan.<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Dengan mengarahkan kendaraanmu menuju Jalan Pramuka ke arah Teuku Cik Ditiro. Lalu kamu akan melewati Jalan Raden Imba Kusuma Ratu hingga tiba di Padang Cermin.</span></p><p><span style=\"text-align: var(--bs-body-text-align);\">Jam operasional Pantai Dewi Mandapa dibuka setiap hari Senin hingga Minggu, mulai pukul 08.00 hingga pukul 17.00 waktu setempat.<br></span></p><p><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\">Fasilitas :</span></p><ul><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">Pondok Wisata</span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">Kamar Mandi</span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">Warung </span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">Penyewaan Ban</span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">Spot Foto</span></span></li></ul><p><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">Harga Tiket Masuk :</span></span></p><ul><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\"><span style=\"font-size: 12pt; line-height: 107%;\">Motor : Rp 15.000 ribu<br></span></span></span></li><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\"><span style=\"font-size: 12pt; line-height: 107%;\">Mobil : Rp 50.000 ribu </span><br></span><br></span><br></li></ul>', '', 'Gebang, Kec. Padang Cermin, Kabupaten Pesawaran, Lampung 35451', '1661847356_af160d3115f7145e2982.jpg', 'publish', '2022-08-30 16:15:56'),
(64, 'Bukit Cendana', 8, '-5.581960484509153', '105.07122874221034', '<p><span style=\"font-size: 16px; font-family: \" times=\"\" new=\"\" roman\",=\"\" serif;=\"\" font-weight:=\"\" var(--bs-body-font-weight);=\"\" text-align:=\"\" var(--bs-body-text-align);\"=\"\">Bukit Cendana atau biasa disebut juga Bumi Perkemahan (Bumper) Harapan Jaya, tempat camp di pegunungan Pesawaran yang asri, view laut dan nuansa di atas awan.&nbsp;</span></p><p><span style=\"text-align: var(--bs-body-text-align);\"><font face=\"Times New Roman, serif\"><span style=\"font-size: 16px;\">Bukit Cendana berlokasi di Desa Harapan Jaya, Kecamatan Way Ratai, Kabupaten Pesawaran, Lampung. Dari Bandar Lampung sekitar 2 jam perjalanan, dan untuk petunjuk arah dapat ditelusuri pada Google Maps dengan kata kunci \"Bukit Cendana Harapan Jaya\".</span></font></span></p><p><span style=\"text-align: var(--bs-body-text-align);\"><font face=\"Times New Roman, serif\"><span style=\"font-size: 16px;\">Bukit Cendana saat ini dikelola oleh Kelompok Sadar Wisata (Pokdarwis) Bumper Harapan Jaya sejak delapan bulan yang lalu. Anshori, salah satu anggota Pokdarwis Bumper Harapan Jaya mengatakan, sebelumnya tempat ini belum dikelola sebagai destinasi wisata.</span></font></span></p><p><span style=\"text-align: var(--bs-body-text-align);\">\"Lalu dibentuk Pokdarwis untuk mengelola tempati ini. Karena sebelumnya hanya tempat camp yang belum terkelola. Semenjak dikelola oleh Pokdarwis, mulailah ditambah fasilitas seperti toilet, musola, hingga penerangan yang diambil dari gardu terdekat,\" kata Anshori.</span></p><p><span style=\"text-align: var(--bs-body-text-align);\">Dengan adanya listrik di area perkemahan, pengunjung bisa menyambung instalasi untuk tambahan penerangan, mengisi baterai HP, hingga sumber pengeras suara. Pokdarwis tidak mematok tarif khusus untuk listrik, pengunjung hanya perlu membayar seikhlasnya saja.</span></p><p><span style=\"text-align: var(--bs-body-text-align);\">Kemudian, Bukit Cendana juga menggandeng UMKM masyarakat setempat untuk mengisi warung-warung yang menyediakan banyak jajanan, ada juga pedagang asongan seperti bakso dan camilan lainnya. Jadi meski berada di atas perbukitan, tak perlu khawatir kehabisan logistik, karena mendapatkan bahan makanan di warung terdekat.</span></p><p><span style=\"text-align: var(--bs-body-text-align);\">Lahan perkemahan di Bukit Cendana cukup luas, bisa menampung hingga 150 tenda. Jadi cocok untuk acara pribadi, keluarga, atau bersama rombongan lainnya. Anshori mengatakan, biasanya pengunjung mulai ramai pada akhir pekan, terutama malam Minggu.</span></p><p><span style=\"text-align: var(--bs-body-text-align);\">Bukit Cendana, bisa menjadi salah satu alternatif wisata alam bersama keluarga. Pengunjung bisa menikmati segarnya udara pegunungan, pemandangan alam yang hijau nan asri, berfoto pada banyak spot, serta menikmati view laut Pesawaran dari ketinggian.<br></span></p><p><br></p><ul><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">Toilet</span></span></li></ul><ul><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">Bumi Perkemahan</span></span></li></ul><ul><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">Kayu Bakar</span></span></li></ul><ul><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">Penyewaan Tenda</span></span></li></ul><ul><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">Spot Foto</span></span></li></ul><ul><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">Gazebo dan Mushola</span></span></li></ul><ul><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\"><span style=\"font-size: 12pt; line-height: 107%;\">Mobil : Rp 25.000 ribu</span></span></span></li></ul><ul><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\"><span style=\"font-size: 12pt; line-height: 107%;\">motor : Rp 10.000 ribu</span></span></span></li></ul><ul><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\"><span style=\"font-size: 12pt; line-height: 107%;\">biaya\r\nkebersihan: Rp 20.000 ribu</span></span></span></li></ul><ul><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\"><span style=\"font-size: 12pt; line-height: 107%;\">penyewaan Tenda: Rp 60.000 ribu</span></span></span></li></ul><p></p><p></p><p><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\">Fasilitas :</span></p><ul><li><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:\" times=\"\" new=\"\" roman\",\"serif\";mso-fareast-font-family:calibri;=\"\" mso-fareast-theme-font:minor-latin;mso-ansi-language:en-us;mso-fareast-language:=\"\" en-us;mso-bidi-language:ar-sa\"=\"\"><span style=\"font-size: 12pt; line-height: 107%;\">Warung</span></span></li></ul>', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3971.16606050981!2d105.11023487814501!3d-5.542377926149098!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e412b5abffc8843%3A0xafd1380f3af1734c!2sBukit%20Cendana%20Harapan%20Jaya!5e0!3m2!1sid!2sid!4v1687675148785!5m2!1sid!2sid\" width=\"100%\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'Desa Harapan Jaya, Kecamatan Way Ratai , Kabupaten Pesawaran, Lampung', '1687678249_53d5ce7356e82c855981.jpg', 'publish', '2022-08-30 16:45:03');
INSERT INTO `maps` (`id`, `title`, `category_id`, `lat`, `lng`, `desc`, `gmaps`, `alamat`, `cover`, `status`, `created_at`) VALUES
(65, 'Kolam Renang Pesawaran City', 3, '-5.3913238588868495', '105.08409710141416', '<p>Water boom Pesawaran City di bagun pada tahun 2019 dan berlokasi tidak jauh dari perkantoran dinas kabupaten pesawaran. </p><p><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Kolam Renang dan Water Boom Pesawaran City ini merupakan sebuah tempat wisata dan wahana bermain untuk mengisi liburan, bersama keluarga dan anak-anak </span><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Bermain di Wahana Air Water Boom Pesawaran City anak-anak tentunya akan senang bermain basah-basahan, berenang, naik perosotan serta berenang di tempat air yang bersih. Sedangkan para orang tua pun bisa sambil bersantai menyaksikan anak-anak berenang atau bisa juga ikut nyebur ke kolam.</span></p><p>Mursalin Ms selaku pemilik Water Boom Pesawaran City menjelaskan, <span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Taman wisata air Kolam Renang dan Water Boom Pesawaran City hadir dengan berbagai fasilitas hiburan untuk anak -anak dan dewasa, selain menjadi fasilitas objek wisata masarakat Lampung khususnya masarakat Pesarawaran, juga sebagai objek pendukung untuk dunia pendidikan dalam pengembagan cabang olah raga renang.</span></p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(79, 81, 85); font-family: \"Hind Madurai\", sans-serif; font-size: 17px;\">\" Kolam renang dan water boom ini sudah kita lengkapi dengan Siup dan Situ Perizinan dari pemerintah Kabupaten Pesawaran, \" jelas mursalin .</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(79, 81, 85); font-family: \"Hind Madurai\", sans-serif; font-size: 17px;\">\" Kolam renang ini buka tiap hari dari pagi sampai sore hari, Khusus hari Sabtu dan Minggu wahana water boom di tambah dengan hiburan berupa orgen tungal pesawaran city \" lanjutnya.</p><div class=\"google-auto-placed ap_container\" style=\"color: rgb(79, 81, 85); font-family: \"Hind Madurai\", sans-serif; font-size: 17px; width: 649.328px; height: auto; clear: both; text-align: center;\"><ins data-ad-format=\"auto\" class=\"adsbygoogle adsbygoogle-noablate\" data-ad-client=\"ca-pub-1421133569304468\" data-adsbygoogle-status=\"done\" data-ad-status=\"unfilled\" style=\"display: block; margin: auto; background-color: transparent; height: 0px;\"><div id=\"aswift_4_host\" tabindex=\"0\" title=\"Advertisement\" aria-label=\"Advertisement\" style=\"border: none; height: 0px; width: 649px; margin: 0px; padding: 0px; position: relative; visibility: visible; background-color: transparent; display: inline-block; overflow: hidden; opacity: 0;\"><iframe id=\"aswift_4\" name=\"aswift_4\" sandbox=\"allow-forms allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation\" width=\"649\" height=\"0\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" vspace=\"0\" hspace=\"0\" allowtransparency=\"true\" scrolling=\"no\" src=\"https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-1421133569304468&output=html&h=280&adk=945092283&adf=92576525&pi=t.aa~a.358613864~i.16~rp.4&w=649&fwrn=4&fwrnh=100&lmt=1661868871&num_ads=1&rafmt=1&armr=3&sem=mc&pwprc=5996477503&psa=1&ad_type=text_image&format=649x280&url=https%3A%2F%2Flampung.kejarfakta.co%2Fwisata%2F6503%2Fresmi-di-buka-water-boom-pesawaran-city-hadirkan-tarif-murah-serta-pelayanan-ramah-dan-sopan&fwr=0&pra=3&rh=163&rw=649&rpe=1&resp_fmts=3&wgl=1&fa=27&adsid=ChEI8Oq2mAYQpPb39ZG7oZ-_ARI9AMP-b65I6WimbgZQb1prN3yPm3nRvwvVSxxW1ALxzXJre5lvYvyrJLBGAMSgDhisFw0MFKlPlcXmbxZdyw&uach=WyJXaW5kb3dzIiwiMTAuMC4wIiwieDg2IiwiIiwiMTA0LjAuNTExMi4xMDIiLFtdLGZhbHNlLG51bGwsIjY0IixbWyJDaHJvbWl1bSIsIjEwNC4wLjUxMTIuMTAyIl0sWyIgTm90IEE7QnJhbmQiLCI5OS4wLjAuMCJdLFsiR29vZ2xlIENocm9tZSIsIjEwNC4wLjUxMTIuMTAyIl1dLGZhbHNlXQ..&dt=1661868666263&bpp=1&bdt=1565&idt=2&shv=r20220825&mjsv=m202208250101&ptt=9&saldr=aa&abxe=1&prev_fmts=0x0%2C1349x657%2C649x280%2C649x280%2C649x280&nras=6&correlator=4738288146949&frm=20&pv=1&ga_vid=166361270.1661868665&ga_sid=1661868665&ga_hid=733906904&ga_fc=0&u_tz=420&u_his=1&u_h=768&u_w=1366&u_ah=728&u_aw=1366&u_cd=24&u_sd=1&dmc=4&adx=183&ady=2502&biw=1349&bih=657&scr_x=0&scr_y=0&eid=44759875%2C44759926%2C44759842&oid=2&pvsid=4330772643051370&tmod=390090091&uas=1&nvt=1&ref=https%3A%2F%2Fwww.google.com%2F&eae=0&fc=1408&brdim=0%2C0%2C0%2C0%2C1366%2C0%2C0%2C0%2C1366%2C657&vis=1&rsz=%7C%7Cs%7C&abl=NS&fu=128&bc=31&jar=2022-08-30-14&ifi=5&uci=a!5&btvi=4&fsb=1&xpc=TSOcQbXv5l&p=https%3A//lampung.kejarfakta.co&dtd=M\" data-google-container-id=\"a!5\" data-google-query-id=\"CNuYg__f7vkCFeLDZAodmn8MTw\" data-load-complete=\"true\" style=\"left: 0px; position: absolute; top: 0px; width: 649px; height: 0px;\"></iframe></div></ins></div><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(79, 81, 85); font-family: \"Hind Madurai\", sans-serif; font-size: 17px;\">Ditambahkan Mursalin Ms \" untuk anak-anak sekolah di kenakan tarip Rp.7000,- dan untuk orang dewasa dikenakan tarip Rp.15.000,- \" tutup Mursalin.</p><div class=\"google-auto-placed ap_container\" style=\"color: rgb(79, 81, 85); font-family: \"Hind Madurai\", sans-serif; font-size: 17px; width: 649.328px; height: auto; clear: both; text-align: center;\"><ins data-ad-format=\"auto\" class=\"adsbygoogle adsbygoogle-noablate\" data-ad-client=\"ca-pub-1421133569304468\" data-adsbygoogle-status=\"done\" data-ad-status=\"unfilled\" style=\"display: block; margin: auto; background-color: transparent; height: 0px;\"><div id=\"aswift_5_host\" tabindex=\"0\" title=\"Advertisement\" aria-label=\"Advertisement\" style=\"border: none; height: 0px; width: 649px; margin: 0px; padding: 0px; position: relative; visibility: visible; background-color: transparent; display: inline-block; overflow: hidden; opacity: 0;\"><iframe id=\"aswift_5\" name=\"aswift_5\" sandbox=\"allow-forms allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation\" width=\"649\" height=\"0\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" vspace=\"0\" hspace=\"0\" allowtransparency=\"true\" scrolling=\"no\" src=\"https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-1421133569304468&output=html&h=200&adk=185891189&adf=1530101983&pi=t.aa~a.358613864~i.18~rp.4&w=649&fwrn=4&fwrnh=100&lmt=1661868872&num_ads=1&rafmt=1&armr=3&sem=mc&pwprc=5996477503&psa=1&ad_type=text_image&format=649x200&url=https%3A%2F%2Flampung.kejarfakta.co%2Fwisata%2F6503%2Fresmi-di-buka-water-boom-pesawaran-city-hadirkan-tarif-murah-serta-pelayanan-ramah-dan-sopan&fwr=0&pra=3&rh=163&rw=649&rpe=1&resp_fmts=3&wgl=1&fa=27&adsid=ChEI8Oq2mAYQpPb39ZG7oZ-_ARI9AMP-b65I6WimbgZQb1prN3yPm3nRvwvVSxxW1ALxzXJre5lvYvyrJLBGAMSgDhisFw0MFKlPlcXmbxZdyw&uach=WyJXaW5kb3dzIiwiMTAuMC4wIiwieDg2IiwiIiwiMTA0LjAuNTExMi4xMDIiLFtdLGZhbHNlLG51bGwsIjY0IixbWyJDaHJvbWl1bSIsIjEwNC4wLjUxMTIuMTAyIl0sWyIgTm90IEE7QnJhbmQiLCI5OS4wLjAuMCJdLFsiR29vZ2xlIENocm9tZSIsIjEwNC4wLjUxMTIuMTAyIl1dLGZhbHNlXQ..&dt=1661868666269&bpp=1&bdt=1570&idt=1&shv=r20220825&mjsv=m202208250101&ptt=9&saldr=aa&abxe=1&prev_fmts=0x0%2C1349x657%2C649x280%2C649x280%2C649x280%2C649x280%2C1005x124&nras=8&correlator=4738288146949&frm=20&pv=1&ga_vid=166361270.1661868665&ga_sid=1661868665&ga_hid=733906904&ga_fc=0&u_tz=420&u_his=1&u_h=768&u_w=1366&u_ah=728&u_aw=1366&u_cd=24&u_sd=1&dmc=4&adx=183&ady=2561&biw=1349&bih=657&scr_x=0&scr_y=0&eid=44759875%2C44759926%2C44759842&oid=2&psts=AEC3cPJqx_yFlVclowY68l8U8_v1WLZcY29weyfisULMr1Ke_42DZ_XXortAUAg7XE-_ghm9R-Dk9wz1ZwFySE0inYF_ySLHevuIM0kpIZ4c&pvsid=4330772643051370&tmod=390090091&uas=1&nvt=1&ref=https%3A%2F%2Fwww.google.com%2F&eae=0&fc=1408&brdim=0%2C0%2C0%2C0%2C1366%2C0%2C1366%2C728%2C1366%2C657&vis=1&rsz=%7C%7Cs%7C&abl=NS&fu=128&bc=31&jar=2022-08-30-14&ifi=6&uci=a!6&btvi=6&fsb=1&xpc=STKVP8u40x&p=https%3A//lampung.kejarfakta.co&dtd=M\" data-google-container-id=\"a!6\" data-google-query-id=\"CMD_s__f7vkCFfkZ-QAdfwUNfQ\" data-load-complete=\"true\" style=\"left: 0px; position: absolute; top: 0px; width: 649px; height: 0px;\"></iframe></div></ins></div><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(79, 81, 85); font-family: \"Hind Madurai\", sans-serif; font-size: 17px;\">Salah seorang pengunjung Yoyon, ketika di wawancarai  mengatakan, sangat mendukung dengan hadirnya tempat wisata ini.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(79, 81, 85); font-family: \"Hind Madurai\", sans-serif; font-size: 17px;\">“ Kebersihanya terjamin, soalnya kolam setiap hari selalu di bersihkan dan difilter atau disaring agar selalu bersih dan sejuk, terlebih lagi pelayanan di Water Boom Pesawaran City cukup memuaskan karena petugasnya yang ramah serta sopan</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(79, 81, 85); font-family: \"Hind Madurai\", sans-serif; font-size: 17px;\">Fasilitas :</p><ul><li style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(79, 81, 85); font-family: \"Hind Madurai\", sans-serif; font-size: 17px;\">Kolam Renang</li><li style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(79, 81, 85); font-family: \"Hind Madurai\", sans-serif; font-size: 17px;\">Kantin</li><li style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(79, 81, 85); font-family: \"Hind Madurai\", sans-serif; font-size: 17px;\">Karoke</li></ul><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(79, 81, 85); font-family: \"Hind Madurai\", sans-serif; font-size: 17px;\">Harga Tiket Masuk :</p><ul><li style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(79, 81, 85); font-family: \"Hind Madurai\", sans-serif; font-size: 17px;\">Anak Anak : Rp 7.000 Ribu</li><li style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(79, 81, 85); font-family: \"Hind Madurai\", sans-serif; font-size: 17px;\">Dewasa : Rp 15.000 Ribu</li></ul>', '', 'Jl. Kedondong - Gedung Tataan, Gedung Tataan, Kec. Gedong Tataan, Kabupaten Pesawaran', '1661868846_c50e9f20213bc27eda38.jpg', 'publish', '2022-08-30 22:14:06'),
(66, 'Youth Camp Tahura Wan Abdurrahman', 3, '-5.517110056132395', '105.22760496231058', '<p>KAWASAN Youthcamp Tahura Wan Abdul Rachman (WAR) merupakan salah satu destinasi pegunungan yang strategis di Lampung. Lokasinya terletak di Desa Hurun, Kecamatan Telukpandan, Pesawaran, di jalur jalan menuju wisata Pulau Pahawang, Pantai Sari Ringgung, dan Teluk Kiluan, atau lebih tepatnya di depan Rumah Makan Pindang Ika. </p><p>Gerbang bertuliskan Tahura Wan Abdul Rachman merupakan penanda pintu masuk menuju bumi perkemahan remaja (Youthcamp) yang kira-kira berjarak 1 km. Hal ini bisa ditempuh dengan semua jenis kendaraan baik bus, minibus, hingga kendaraan roda dua.</p><p>Dibangun sejak lama, Youthcamp Tahura WAR mengalami pasang-surut kunjungan. Dahulu, lokasi ini digunakan untuk camping dan mancakrida (outbound). Tempat ini juga pernah mengalami kejayaan pada era 1990-an hingga menjelang 2000. Setelah itu, tren kunjungan ke Youthcamp makin menurun akibat kurang terpeliharanya sarana dan prasarana yang ada. Belum lagi kondisi kurang aman khususnya keamanan barang-barang yang dibawa oleh mereka yang berkemah. </p><p>Banyaknya bangunan kusam, berlumut, dan roboh menambah kesan seram di Youthcamp Tahura WAR. Namun, sejak tiga tahun terakhir perubahan signifikan terjadi di Youthcamp. Dimulai dari pembuatan pintu gerbang utama yang terkesan modern, penambahan luas parkir, fasilitas MCK yang nyaman, musala, gedung serbaguna, air mancur, pergola, dan camping ground. </p><p>Kemudian, perbaikan jalan menuju air terjun, penataan taman, penyediaan sarana prasarana penerangan pada setiap sudut lokasi camping dan ditambah lagi dengan Pasar Tahura yang diadakan setiap Minggu. Semua itu menjadikan Youthcamp sebagai tempat yang asyik dan aman untuk dikunjungi baik yang sekadar berkunjung singkat maupun sebagai tempat berkemah. </p><p>Tiga bulan terakhir, Pasar Tahura menjadi atraksi wisata paling populer di Youthcamp. Diinisiasi oleh Generasi Pesona Indonesia (Genpi) Lampung pada Desember 2017, dengan brand Bukan Pasar Biasa, Pasar Jaman Now sebagai destinasi digital yang menampilkan aneka kuliner khas Lampung, spot foto yang unik, hingga pertunjukan wisata yang berbeda setiap minggunya. </p><p>Selain itu, pengunjung Youthcamp juga dapat menikmati suguhan Air Mancur Pelangi dengan ketinggian lebih dari 10 meter, yang merupakan spot foto paling diminati di sini. Air mancur ini merupakan pesona buatan yang memanfaatkan gaya gravitasi tanpa memanfaatkan sumber energi listrik. </p><p>Spot wisata lainnya yang juga dapat dinikmati di Youthcamp adalah Air Terjun Hurun, air terjun setinggi 10 meter ini juga menjadi tempat yang indah untuk berfoto. Di bagian lain, ada pula air terjun dengan batuan dan kolam yang cukup besar digunakan pengunjung untuk mandi atau sekadar berswafoto.</p><p>Pengelola wisata di tempat ini melalui rilisnya juga menjelaskan Youthcamp merupakan bagian dari ruang pemanfaatan kawasan konservasi. Di area seluas kira-kira 5 hektare ini Anda masih dapat menjumpai aneka ragam tanaman hutan. Posisinya yang berada di lembah diapit perbukitan dan beberapa aliran sungai serta gemericik air terjun yang seakan membawa suasana damai dan pesan alam agar manusia terus menjaganya</p><p>Fasilitas</p><ul><li>Bumi Perkemahan</li><li>Taman Bermain</li><li>Air Terjun</li><li>Pendopo</li><li>Toilet Umum</li></ul><p>Tiket Masuk</p><ul><li>Anak Anak : Rp. 5.000 Ribu</li><li>Dewasa : Rp. 10.000 Ribu</li><li>Motor : Rp. 20.000 Ribu</li><li>Mobil : Rp. 50.000</li></ul>', '', 'H574+6RH Hutan, Kec. Hutan, Kabupaten Pesawaran', '1661870837_d7214760ab8a7eec2652.jpg', 'publish', '2022-08-30 22:47:17'),
(67, 'Bukit Lantana', 1, '-5.5836150846301535', '105.07223010111568', '<p>Lahirnya Bukit Lantana, tentu semakin menambah kekayaan potensi wisata di Desa Harapan Jaya untuk menjadi destinasi pilihan,” kata Kepala Desa Harapan Jaya Susalit Cokro Aminoto saat berbincang.</p><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><font color=\"#323233\" face=\"Helvetica, Arial\"><span style=\"font-size: 16px;\">Susalit Cokro Aminoto berharap, Bukit Lantana bisa menjadi magnet baru bagi wisatawan untuk berkunjung ke Desa wisata Harapan Jaya.</span></font></p><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><font color=\"#323233\" face=\"Helvetica, Arial\"><span style=\"font-size: 16px;\">“Semoga makin banyak wisatawan berkunjung ke desa kami, ibarat pepatah ‘Sekali Merengkuh Dayung Dua Tiga Pulau Terlampaui’, begitulah kalau berkunjung ke Desa Harapan Jaya, dapat berkunjung ke beberapa tempat wisata hits di sini,” kata Kades.</span></font></p><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><font color=\"#323233\" face=\"Helvetica, Arial\"><span style=\"font-size: 16px;\">Seperti diketahui, Desa wisata Harapan Jaya memiliki banyak destinasi wisata seperti ; Bukit Cendana, Cendana Mountain Bike Park, Air Terjun Sinar Tiga, Air Terjun Tirta, Kolam Renang Tirto Langgeng dan titik start jalur pendakian Gunung Pesawaran atau Sukmo Ilang.</span></font></p><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><font color=\"#323233\" face=\"Helvetica, Arial\"><span style=\"font-size: 16px;\">Kades berharap peluncuran Bukit Lantana dapat lebih berdampak pada peningkatan ekonomi masyarakat, khususnya di Desa Harapan Jaya dan sekitarnya.</span></font></p><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><font color=\"#323233\" face=\"Helvetica, Arial\"><span style=\"font-size: 16px;\">“Para pedagang, Warga Sadar Wisata (Kelompok Wasata), pusat belanja oleh-oleh, akan mengungkit kemajuan wisata yang akan menopang pendapatan ekonomi masyarakat sekitar dan pendapatan asli desa,” kata Kades.</span></font></p><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><font color=\"#323233\" face=\"Helvetica, Arial\"><span style=\"font-size: 16px;\">Kades pun meminta warganya khususnya Kelompok Wasata, untuk meningkatkan kualitas pelayanan sesuai tata krama dan tradisi yang dimiliki.</span></font></p><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"></p><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><font color=\"#323233\" face=\"Helvetica, Arial\"><span style=\"font-size: 16px;\">Menurut Susalit Cokro Aminoto, Desa Wisata Harapan Jaya dapat menciptakan kesan dan kenangan yang menarik bagi wisatawan. Sehingga mereka bisa mengajak wisatawan lain untuk datang berkunjung.</span></font></p><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><font color=\"#323233\" face=\"Helvetica, Arial\"><span style=\"font-size: 16px;\">Nama Lantana diambil dari banyaknya pohon jenis Lantana yang tumbuh di bukit dengan ketinggian 900 mdpl ini.</span></font></p><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><span style=\"font-size: 16px; color: rgb(50, 50, 51); font-family: Helvetica, Arial; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">“Lantana itu adalah ikon Desa Harapan Jaya. Di di situ (Bukit Lantana) banyak tumbuh Pohon Lantana. Pohon ini sangat bagus bila dipelihara dan dirawat,” jelas Kades.</span></p><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><font color=\"#323233\" face=\"Helvetica, Arial\"><span style=\"font-size: 16px;\">Nama Lantana sendiri diberikan oleh Muksoni yang merupakan warga Dusun Sinar Dua, penggagas objek wisata ini.</span></font></p><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><font color=\"#323233\" face=\"Helvetica, Arial\"><span style=\"font-size: 16px;\"><br></span></font></p><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><font color=\"#323233\" face=\"Helvetica, Arial\"><span style=\"text-align: var(--bs-body-text-align); font-size: 16px;\"></span></font></p><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><font color=\"#323233\" face=\"Helvetica, Arial\"><span style=\"font-size: 16px;\">“Muksoni, Ketua Kelompok Wasata Desa Harapan Jaya menjadi penggagas dibukanya Bukit Lantana,” ungkap Kades.</span></font><span style=\"text-align: var(--bs-body-text-align); font-size: 16px;\"><font color=\"#323233\" face=\"Helvetica, Arial\">Nama Lantana sendiri diberikan oleh Muksoni yang merupakan warga Dusun Sinar Dua, penggagas objek wisata ini.</font></span></p><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><font color=\"#323233\" face=\"Helvetica, Arial\"><span style=\"font-size: 16px;\">“Muksoni, Ketua Kelompok Wasata Desa Harapan Jaya menjadi penggagas dibukanya Bukit Lantana,” ungkap Kades.</span></font></p><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><font color=\"#323233\" face=\"Helvetica, Arial\"><span style=\"font-size: 16px;\">Fasilitas</span></font></p><ul><li style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><font color=\"#323233\" face=\"Helvetica, Arial\"><span style=\"font-size: 16px;\">Bumi Perkemahan</span></font></li><li style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><font color=\"#323233\" face=\"Helvetica, Arial\"><span style=\"font-size: 16px;\">Spot Foto</span></font></li><li style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><font color=\"#323233\" face=\"Helvetica, Arial\"><span style=\"font-size: 16px;\">Warung</span></font></li><li style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><span style=\"color: rgb(50, 50, 51); font-family: Helvetica, Arial; font-size: 16px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Toilet Umum</span></li><li style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><span style=\"color: rgb(50, 50, 51); font-family: Helvetica, Arial; font-size: 16px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Sewa Tenda</span></li></ul><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><span style=\"color: rgb(50, 50, 51); font-family: Helvetica, Arial; font-size: 16px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Tiket Masuk </span></p><ul><li style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><span style=\"color: rgb(50, 50, 51); font-family: Helvetica, Arial; font-size: 16px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Motor : Rp. 5.000 ribu</span></li><li style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><font color=\"#323233\" face=\"Helvetica, Arial\"><span style=\"font-size: 16px;\">Ngecamp : Rp. 20.000 Ribu</span></font></li><li style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"><font color=\"#323233\" face=\"Helvetica, Arial\"><span style=\"font-size: 16px;\">Sewa Tenda : Rp. 60.000 Ribu</span></font></li></ul>', '', 'Hutan, Kec. Hutan, Kabupaten Pesawaran', '1661871782_e73a7b829b833118ce6f.jpg', 'publish', '2022-08-30 23:03:02'),
(68, 'Bukit Punggung Naga', 1, '-5.577033602307154', '105.06313704710988', '<p>Wisata Punggung Naga Pesawaran Indah adalah sebuah spot di lereng Gunung Pesawaran. Memiliki pemandangan indah membentang dengan udara sejuk dan segar. <span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Berada di ketinggian 1000an meter di atas permukaan laut, lokasinya menawarkan nuansa keindahan berbeda. Mendaki sedikit ke atas, sudah memasuki kawasan Taman Hutan Raya (Tahura) Wan Abdul Rachman.</span></p><p>Secara administratif, masuk wilayah Kelurahan Pesawaran Indah, Kecamatan Way Ratai, Kabupaten Pesawaran, Provinsi Lampung.<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Berjarak sekitar 55 kilometer dari Kota Bandar Lampung, via Gedongtaan dam Kedondong. Atau sekitar 69 kilometer dari Bandar Lampung via Lempasing, Ketapang, dan Kelapa Rapat. </span><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Waktu tempuh kedua rute di atas kurang lebih sama. Antara 1,5- 2 jam. Namun akhir-akhir ini banyak yang memilih rute via Gedongtataan dan Kedondong. Karena jalan provinsi di jalur ini sudah bagus. </span><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Via Kedondong, masuk ke atasnya di Pasar Umbul Kluuh. Kalau lewat Pantai Klara, bisa belok di Pasar Bunut.</span></p><p>Akses ke atas bisa dari Desa Pesawaran Indah atau Desa Harapan Jaya. Dengan ojek memerlukan waktu sekitar 15 menit. Sedangkan dengan trekking memerlukan waktu sekitar 1 jam.</p><p>Jam operasional loket atau tempat ini pada dasarnya 24 jam. Karena lokasinya yang berada di tempat terbuka di lereng gunung. Namun pada umumnya wisatawan datang waktu pagi hingga sore hari. Kalau mau datang sore atau malam, sebaiknya menghubungi pengelola terlebih dahulu.</p><p>Menjelang tiba di Desa Pesawaran Indah atau Harapan Jaya, kamu sudah disuguhi oleh indahnya pemandangan di kiri kanan jalan. Mulai dari persawahan bertingkat sampati rumah-rumah penduduk dengan berbagai tanaman hias warna-warni. <span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Di jalur trekking ke atas, kita akan melewati perkebunan warga. Ada cokelat, kopi, pinang, durian, dan lainnya. Di pertengahan jalan ada rerumputan yang bagus juga untuk lokasi foto.</span></p><p>Dari sini, ketinggiannya sudah lumayan. Sudah bisa melihat area yang lebih rendah. Sekaligus view lereng-lereng dan punggungan Gunung Pesawaran.<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Kalau sudah melihat gerbang kayu yang dibangun warga, berarti kamu sudah sampai di lokasi. Kamu bisa menaiki gerbang kayu ini dan foto-foto di sini. Tidak jauh dari gerbang ada portal dan loket masuk.</span><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Tiba di lokasi, kamu akan disambut dengan view yang menawan. Bisa melihat lereng dan punggungan gunung di kiri dan kanan lokasi.</span></p><p>Bisa duduk-duduk di kursi dan meja dari potongan pohon. Atau berkeliling sebentar di sekitar area Punggung Naga. <span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Ada platform kayu yang bisa untuk duduk-duduk lesehan dan foto-foto. Naik sedikit ke atas, bisa duduk-duduk di bawah pepohonan tinggi yang rindang.</span><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Bisa memesan makanan ringan di warung kecil. Ada mie instan rebus atau goreng. Serta minuman hangat, baik kopi maupun teh.</span></p><p>Kami suka sekali menikmati suasana indah, dengan udara sejuk dan segar di sini. Sambil ngobrol-ngobrol santai bersama kawan. Juga memesan makanan dan minuman yang ada. <span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Bagi yang ingin nge-camp, bisa datang siang atau sore. Tiba di lokasi masih terang, bisa mendirikan tenda dan menunggu momen matahari terbenam. Suasana sunset di sini juga tidak kalah indahnya.</span><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Pastikan membawa pakaian yang cukup kalau camping di sini. Berada di udara terbuka di ketinggian sekitar 1000 mdpl tentu akan terasa lebih sejuk dibanding daratan yang lebih rendah di kota.</span></p><p>Fasilitas</p><ul><li>Bumi Perkemahan</li><li>Tenda</li><li>Kayu Bakar</li></ul><p>Harga Tiket</p><ul><li>Tiket masuk: Rp. 10.000</li><li>Tenda: Rp. 25.000</li><li>Kayu bakar: Rp. 20.000</li></ul>', '', 'F35W+62V, Unnamed Road, Pesawaran Indah, Kec. Padang Cermin, Kabupaten Pesawaran, Lampung 35451', '1661872885_52c4ba63b2c3f9eb978f.jpg', 'publish', '2022-08-30 23:21:25'),
(69, 'Bukit Kendeng', 1, '-5.564201552212282', '105.0626585347548', '', '', 'Jl.brawijaya Desa Sumber Jaya Kec.Way ratai, Hutan, Kec. Hutan, Kabupaten Pesawaran, Lampung 35451', '1661874551_fa60696d3abd85416172.jpg', 'publish', '2022-08-30 23:49:11'),
(70, 'Muncak Teropong Laut', 3, '-5.487752428559162', '105.25018444188368', '<p>Memiliki nama asli Muncak Teropong Laut namun banyak juga yang menyebut Muncak Tirtayasa. Sebuah tempat wisata yang banyak menyedot perhatian warga Lampung dan luar kota karena menawarkan pemandangan laut dari perbukitan yang indah dan Instagramable. Apa saja yang ada disana? Bagaimana akses menuju lokasinya? Yuk ikuti tulisan ini hingga selesai.</p><p>Untuk menuju ke Wisata Muncak Teropong Laut, kamu harus menggunakan kendaraan motor ataupun mobil. Tempat ini berlokasi di Desa Muncak, Kecamatan Teluk Pandan, Kabupaten Pesawaran, Lampung. Daerahnya tidak begitu jauh dari Kota Bandar Lampung. <span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Hanya berjarak antara 12 kilo dari Kota Bandar Lampung, atau sekitar 30 menit untuk jika menggunakan kendaraan motor atau mobil. Sehingga untuk kamu yang dari arah Bandar Lampung tidak begitu jauh.</span></p><p>Adapun rute dari Bandar Lampung bisa dimulai dari Tugu Adipura kemudian ke Jalan Diponegoro, dilanjutkan ke Jalan Hasanudin, Jalan Laks. Malahayai, lalu ke Jalan Ikan Sebelah, sampai dengan Jalan Laks. RE.Martadinata.<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Setelah sampai Jalan RE Martadinata, sesudah pintu masuk Pantai Duta Wisata, silakan lihat di sebelah kanan jalan. Sebelum Panti Asuhan Sholawatul Falah terdapat jalan kecil. Disitulah letak jalan menuju Muncak Teropong Laut.</span></p><p><span style=\"text-align: var(--bs-body-text-align);\">Kamu bisa mengikuti jalan tersbut sejauh 2 kilometer. Akan ada papan penunjuk jalan yang mengarahkan kamu untuk belok kiri dengan jalan tanah. Tidak jauh dari belokan tersebut kamu sudah sampai di Muncak Teropong Laut.<br></span></p><p><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Fasilitas </span></p><p><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Warung</span></p><ul><li>Toilet</li><li>Spot Foto</li><li>Cafee</li></ul><p>Tiket </p><p>Tiket masuk pengunjung : Rp 5 rbu</p><p>Motor : Rp. 5.000 ribu</p><p>Mobil : Rp.  10 rbu</p><p><br></p>', '', 'G66V+PJR, Gunung Muncak, Sukajaya Lempasing, Padang Cermin, Sukajaya Lempasing, Kec. Padang Cermin, Kabupaten Pesawaran, Lampung 35236', '1662014564_e701b84cb45cc84edca6.jpg', 'publish', '2022-09-01 14:42:44'),
(71, 'Villa Gardenia', 3, '-5.485796133754661', '105.24980362228445', '<p>Hampir setiap daerah kini memiliki tempat wisata baru yang sengaja dibangun bernuansa kekinian agar bisa dijadikan tempat foto instagramable oleh para generasi muda ataupun para wisatawan yang kebetulan sedang berkunjung. Tak hanya Bandung atau Yogyakarta saja yang memiliki kebun bunga memukau, jika Anda kebetulan sedang berada di Lampung, cobalah untuk merapat ke sebuah tempat wisata nge-hits bernama Villa Gardenia Lampung.</p><p>Tempat wisata satu ini belakangan cukup populer sejak banyak pengunjung yang beramai-ramai datang ke sana untuk berfoto-foto selfie, kemudian mengunggah hasil foto mereka ke media sosial. Villa Gardenia Lampung adalah objek wisata sekaligus penginapan yang berlokasi di Jalan R.E. Martadinata, Sukajaya Lempasing, Teluk Pandan, Padang Cermin, Kabupaten Pesawaran, Lampung. Letak Villa Gardenia berseberangan dengan TPI Lempasing dan dekat dengan Kuburan Cina di Lempasing.</p><p>Untuk menuju Villa Gardenia tidak terlalu sulit, sebab bisa Anda akses dari Kota Bandar Lampung dengan lama perjalanan sekitar setengah jam saja. Anda bisa menempuh rute dengan berangkat dari Kota Bandar Lampung, kemudian menuju arah Teluk Bintang. Jika sudah sampai di perempatan sebelum kantor gubernur, Anda dapat mengambil arah ke kanan dan ikuti saja jalur tersebut sampai tiba di Kabupaten Pesawaran. Letak Villa Gardenia sendiri ada di samping Jalan Laksamana RR Martadinata.</p><p>Nah, bagi Anda yang tak memiliki kendaraan pribadi, Anda bisa naik angkutan umum dari Stasiun Tanjung Karang, tepatnya di Pasar Bawah. Dari sana Anda bisa naik angkot yang bersiap mengantarkan Anda ke Gudang Garam Teluk, selanjutnya turun di Gudang Garam. Kemudian lanjutkan perjalanan dengan naik angkot atau mobil L300 dengan bak tertutup menuju Teluk Piabung dan turunlah di depan gerbang Villa Gardenia Lampung. Tempat wisata ini buka setiap hari mulai pukul 8 pagi hingga jam 9 malam.</p><p>Fasilitas</p><ul><li>Taman Bunga</li><li>Ayunan</li><li>Hammock</li><li>Toilet Umum</li><li>Taman Bermain</li><li>Cafee</li><li>Karoke</li><li>Jembatan Goyang</li><li>Lorong Cinta</li></ul><p>Tiket </p><ul><li>Per Orang<span style=\"white-space:pre\">		</span>Rp. 10.000</li><li>Parkir Motor<span style=\"white-space:pre\">		</span>Rp. 2.000 – Rp. 3.000</li><li>Parkir Mobil<span style=\"white-space:pre\">		</span>Rp. 5.000 – Rp. 10.000</li><li>Wahana Kolam Renang <span style=\"white-space:pre\">	</span>Rp. 5.000</li><li>Wahana Hammock<span style=\"white-space:pre\">	</span> <span style=\"white-space:pre\">	</span>Rp. 5.000</li><li>Wahana Spot Foto <span style=\"white-space:pre\">	</span>Rp. 5.000</li></ul>', '', 'G67X+MX6, Jl. R.E. Martadinata, Sukajaya Lempasing, Teluk Pandan, Sukajaya Lempasing, Kec. Padang Cermin, Kabupaten Pesawaran, Lampung 33411', '1662018430_0479b4991fbc90973ad0.jpg', 'publish', '2022-09-01 15:47:10'),
(72, 'Museum Nasional Ketransmigrasian', 3, '-5.379981293281446', '105.11845133829729', '<p>Lampung merupakan salah satu provinsi di Indonesia yang dianugerahi wilayah luas dan kekayaan budaya. Tak hanya itu, Lampung juga memiliki alam yang memesona</p><p>Sejarahnya, provinsi paling selatan di Pulau Sumatera ini pernah menjadi daerah penempatan transmigrasi pertama di Indonesia. Kala itu, tahun 1905, pemerintah Hindia Belanda melakukan perpindahan warga dari Desa Bagelen, Karesidenan Kedu, Jawa Tengah, ke Gedong Tataan, Lampung.</p><p>Museum Nasional Ketransmigrasian yang berada di Jalan Ahmad Yani, Desa Bagelen, Gedong Tataan, Pesawaran, merupakan salah satu tempat untuk mengabadikan sejarah transmigrasi di Indonesia. Desa Bagelen dipilih karena alasan historis. Sebab, di sinilah terdapat 23 kepala keluarga (KK) yang hijrah ke Lampung kali pertama.</p><p><span style=\"color: rgb(51, 51, 51); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Saat tiba di pintu gerbang museum, pengunjung dihadapkan dengan bangunan megah berlantai dua dengan simbol Siger mengkilap di bagian atas beranda. Bagian luar gedung bercat putih kekuningan ini dihiasi ornamen gajah Lampung yang dipadu ukiran khas Jawa di bagian pintu masuknya.</span></p><p><font color=\"#333333\" face=\"Open Sans, sans-serif\"><span style=\"font-size: 16px;\">Suasana klasik terasa saat kita melangkahkan kaki ke dalam museum. Tepat di tengah ruangan, ada patung dua lembu menarik \\\'luku\\\' (alat pembajak sawah tradisional) dan gerobak kayu di sampingnya. Ini merupakan simbol profesi transmigran yang mayoritas adalah petani.</span></font></p><p><font color=\"#333333\" face=\"Open Sans, sans-serif\"><span style=\"font-size: 16px;\">Di lantai satu terdapat beberapa ruangan koleksi yang berisi seperangkat gamelan dan wayang golek. Bersebelahan dengan ruang gamelan, tersedia perpustakaan yang dilengkapi beberapa komputer dan buku sejarah. Ada pula ruangan yang memamerkan furnitur tempo dulu berupa meja tamu, lemari, dan juga tempat tidur terbuat dari besi.</span></font></p><p>Satu ruangan yang tak boleh dilewatkan di lantai satu adalah ruang auditorium yang ditata laiknya bioskop untuk menikmati film dokumenter sejarah transmigrasi di Indonesia. Ruangan ini dilengkapi tempat duduk nyaman dengan kapasitas 80 orang. <span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Lalu berpindah ke lantai dua, terdapat deretan benda antik seperti sepeda ontel, peralatan dapur, perabot rumah tangga, alat penerangan, dan mata uang tempo dulu.</span></p><p><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Fasilitas</span></p><ul><li>Ornamen Kebudayaan</li><li>Lukisan</li><li>Penjelasan Sejarah</li></ul><p>Tiket</p><p>Motor : Rp. 5.000 rupiah</p><p>Mobil : Rp 10.000 rupiah</p><p>Anak anak : Rp. 10.000 rupiah</p><p>Dewasa : Rp. 15.000 rupiah</p>', '', 'J4C4+4WW, Jl.Ahmad yani masuk 50meter dari gapura musium transmigrasi pesawaran Sukaraja 6, Sukaraja, Kec. Gedong Tataan, Kabupaten Pesawaran, Lampung 35371', '1662020847_bc2c724d8595760f880f.jpg', 'publish', '2022-09-01 16:27:27'),
(73, 'Kampung Tapis', 3, '-5.380896396576844', '105.09769898504464', '<p>Tapis merupakan sebuah kerajinan asli Provinsi Lampung berbahan dasar kain yang biasa digunakan untuk acara adat dan acara resmi. <span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Namun di tangan para pengerajin yang berada di Desa Negeri Katon, Kecamatan Negeri Katon, Kabupaten Pesawaran, Lampung, kais tapis ini bisa dikreasikan dengan berbagai turunan produk yang berkualitas dan berkelas. </span></p><p><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Koordinator Tapis Jejama Desa Negeri Katon, Redawati, bahwa home industri tapis di desa tersebut sudah berlangsung sejak tahun 1980 dan turun temurun hingga saat ini.</span></p><p>Tahun 80 memang sudah ada pengerajin tapis di Negeri Katon, tahun 2014 baru saya koordinir sampai sekarang. Itu awalnya secara iseng ternyata sampai sekarang malah menghasilkan,.</p><p><span style=\"text-align: var(--bs-body-text-align);\"></span></p><p>Pada zaman dahulu, tak banyak pengrajin tapis di Desa Negeri Katon mengingat harga penjualan tapis cenderung murah. Namun saat ini sudah mulai berkembang hingga akhirnya hampir seluruh penduduk di desa tersebut menjadi pengrajin tapis. <span style=\"text-align: var(--bs-body-text-align); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight);\">Saat ini, para pengrajin tapis di Desa Negeri Katon ini didominasi oleh para ibu-ibu rumah tangga sebagai penghasilan tambahan untuk ekonomi keluarga.</span></p><p>\"Waktu dulu masih murah sih tapisnya, upahnya saja hanya Rp5 ribu seminggu. Sekarang ibu-ibu di sini yang mengerjakan untuk sambilan (sampingan), jadi selesai masak dan beres-beres rumah baru buat tapis,\" kata Redawati.</p><p>Kain tapis di Desa Negeri Katon ini merupakan khas Pepadun, dan di Lampung sendiri ada dua kabupaten yang memproduksi tapis yaitu Kabupaten Pesawaran dan Kabupaten Pesisir Barat.</p><p>\"Ini tapis Pepadun, bedanya dengan tapis Pesisir pembuatannya juga sudah beda. Kalau Pepadun itu pakai papan tekang (alat pembuat tapis), kalau Pesisir itu pakai meja. Motifnya pun beda, kalau kami banyak tapis Abung,\" terang dia.</p><p>Tapis yang dahulunya hanya menjadi produk berupa selendang dan sarung saat ini sudah mulai divariasikan menjadi berbagai turunan produk.Jadi sekarang gak hanya sekedar sarung dan selendang saja. Ada juga produk turunan seperti bros tapis, jilbab tapis, peci tapis, dompet tapis, sendal tapis, pernik-pernik tapis, jadi segala macam kita buat.<br></p>', '', 'Negeri Katon ,Gedong tataan, Kabupaten Pesawaran', '1662040867_5825066ba6f4ce30fe15.jpg', 'publish', '2022-09-01 22:01:07'),
(74, 'Pantai Tanjung Putus', 7, '-5.72774457483348', '105.21169209205829', '<p>Wisata Pantai Tanjung&nbsp; PutusTerletak di Kabupaten Pesawaran Pulau Tanjung Putus adalah salah satu destinasi wisata yang ramai dikunjungi wisatawan.&nbsp;<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Pulau cantik nan eksotis ini menarik untuk dikunjungi ketika liburan tiba bersama keluarga. Sebagai salah satu Tempat Wisata di Pesawaran inilah informasi dari Pulau Tanjung Putus yang sebaiknya anda simak sebelum pergi kesana.&nbsp;</span><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Pulau Tanjung Putus terletak di Kabupaten Pesawaran dan tidak jauh dari Pulau Pahawang Lampung. Adapun jarak Bandar Lampung ketanjung putus adalah berjarak sekitar 85 kilometer dan bisa ditempuh dengan motor atau mobil pribadi.</span></p><p>Jika ingin pergi kesana anda harus menuju ke Kampung Ketapang. Di kampung tersebut terdapat dermaga untuk penyeberangan menuju Pulau Tanjung Putus. Untuk pergi ke Pulaunya anda dapat menggunakan dua alternatif.&nbsp;<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Pertama, ketika anda sudah di Kampung Ketapang maka parkirkan kendaraan anda dan menuju ke Dermaga Kampung Ketapang. Anda dapat menyewa perahu dan menempuh perjalanan sekitar 1 jam.&nbsp;</span><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Untuk alternatif kedua yaitu melakukan perjalanan dari Bandar Lampung dengan mengikuti Jalan Raya Way Ratay, kemudian akan melewati TPI Lempasing, Hanura, Pantai Klara (Klapa Rapat). Kemudian masuk ke Jalan Pematang Awi lalu melewati Brigif 3 Marinir, dan masuk daerah yang banyak terdapat tambak.</span></p><p>Dari daerah tambak-tambak tersebut anda dapat meminta untuk diantarkan perahu untuk menyeberang ke Pulau Tanjung Putus. Namun harus menempuh perjalanan darat yang lumayan melelahkan.&nbsp;<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Ketika anda menggunakan jasa penyeberangan dari Dermaga Kampung Ketapang anda harus membayar biaya sewa perahu sebesar Rp. 400.000 – Rp. 500.000 untuk dua kali perjalanan berangkat dan pulang. Perahu tersebut dapat diisi dengan 8-10 orang sehingga anda dapat melakukan patungan agar lebih ringan.</span><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Dan perlu diketahui bahwa operasional masuk ke Tanjung Putus yaitu 24 Jam. Sehingga pantai ini selalu ramai dikunjungi para wisatawan yang ingin kesana.</span></p><p>Fasilitas Tanjung Putus Lampung</p><ul><li>menikmati pemandangan pantainya yang mempesona. Pantai yang tenang jauh dari keramaian suara-suara bising kendaraan.</li><li>snorkeling </li><li>diving.</li><li>Penginapan&nbsp;</li><li>Di pulau Tanjung Putus terdapat rumah warga yang dijadikan tempat menginap atau homestay. Untuk harganya memang mahal jika hanya digunakan sendiri. Namun jika anda datang bersama keluarga akan terasa murah karena ditanggung bersama.</li><li>Satu Homestay bisa ditempat oleh 10 hingga 15 orang. Sedangkan untuk fasilitas yang lebih lengkap dan lebih nyaman anda dapat menyewa cottage yang terdapat dermaga apung dan ada spot snorkeling serta divingnya. Selain homestay dan cottage disana juga ada resort yang bisa disewa.</li></ul><p>Sebaiknya ketika akan berkunjung ke Pulau Tanjung Putus harus mempersiapkan segala kebutuhan untuk berlibur. Siapkan makanan, kebutuhan pribadi dan akomodasi biaya yang lumayan selama berlibur. Selamat berlibur.</p>', '', 'Sukarame, Kec. Punduh Pidada, Kabupaten Pesawaran, Lampung', '1662042446_e1389d25333ce493eaf6.jpg', 'publish', '2022-09-01 22:27:26'),
(75, 'Pantai Pahawang', 7, '-5.5877140435502355', '105.22689340484527', '<p>Pulau Pahawang terkenal dengan keindahan pantai dan bawah lautnya. Sudah banyak yang mengakui pesonanya, baik wisatawan nusantara maupun wisatawan lokal Lampung.&nbsp;<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Dalam situasi normal pulau ini selalu ramai setiap akhir pekan dan hari libur nasional.&nbsp;&nbsp;</span><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Pulau Pahawang masuk wilayah Kecamatan Punduh Pidada, Kabupaten Pesawaran, Provinsi Lampung. Tepatnya berada di Teluk Lampung.&nbsp;</span><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Untuk bisa sampai di pulau, tidak memerlukan waktu berhari-hari. Sebab jaraknya tidak terlalu jauh dari Kota Bandar Lampung. Kalau lancar, hanya membutuhkan waktu sekitar 2 jam untuk tiba di pulau.</span></p><p>Ada banyak tempat wisata di Lampung, Pahawang bisa dibilang menjadi salah satu idola. Tidak mengherankan kalau ditanya mau ke mana, wisatawan akan menjawab ‘ke Pahawang’.&nbsp;<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Kabupaten Pesawaran bisa berbangga hati, destinasi wisatanya begitu populer di mata wisatawan. </span><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Padahal di tahun 2010an masih sedikit wisatawan yang datang. Saat ini di situasi normal sebelum pandemi, bisa ribuan wisatawan yang datang&nbsp; dalam satu hari.&nbsp;</span><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Kamu tentu serinng melihat keindahan wisata Maldives yang begitu memesona. Liburan di pantai yang indah, dengan hiasan pepohonan nyiur, dan menginap di cottage yang berada di atas laut.&nbsp;</span><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Pengalaman liburan seperti itu bisa kamu dapatkan saat liburan ke Pahawang di Pesawaran.&nbsp;</span><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Selain itu, juga banyak penginapan di tepi pantai dengan suasana yang tidak kalah indahnya. Bisa kamu temukan di berbagai penjuru pulau.</span></p><p>Akses masuk Pulau Pahawang sangat mudah. Kamu bisa menyeberang dari Dermaga Ketapang. Banyak perahu yang bisa kamu sewa seharian penuh.&nbsp;<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Untuk tiket masuk pulau pada dasarnya tidak dikenakan biaya. Karena pulau ini sangat luas. Kecuali kamu masuk ke area pantai yang sudah dikelola warga atau pihak cottage.</span></p><p>Fasilitas&nbsp;</p><ul><li>Snorkling</li><li>Diving</li><li>Taman Nemo</li><li>Toilet</li><li>Gubuk-gubukan</li><li>Warung</li><li>Banana Boats</li><li>Spot Foto menarik</li></ul><p>Harga Tiket</p><ul><li>Rp. 600.000 Sewa Kapal</li><li>Rp 15.000 Per Orang</li><li>Rp. 20.000 Banana Boats</li></ul>', '', 'Jl. Mahitam, Ketapang, Batumenyan, Hanura, Kabupaten Pesawaran, Lampung 35450', '1662045127_16e4d656958d5e1ade60.jpg', 'publish', '2022-09-01 22:41:57');
INSERT INTO `maps` (`id`, `title`, `category_id`, `lat`, `lng`, `desc`, `gmaps`, `alamat`, `cover`, `status`, `created_at`) VALUES
(78, 'Marines Eco Park', 7, '-5.609979853438887', '105.17157511991354', '<p>Salah satu wisata di Pesawaran yang saat ini sedang hits adalah Marines Ecopark (MEP). Yaitu sebuah pantai di daerah Pesawaran yang digagas oleh Komandan Brigade Infanteri-3 Marinir Kolonel Marinir Werijon.&nbsp;<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Marines Ecopark merupakan gabungan antara wisata pantai dan edukasi dengan basis di ke Mariniran. Sehingga ketika pengunjung kesana selain dapat menikmati pemandangan alami dan pantai, juga akan mendapatkan ilmu tentang Marinir. Lebih lengkapnya silakan simak informasi berikut ini.</span></p><p>Pantai Marines Ecopark terletak di Jalan Pematang Awi, Sanggi, Padang Cermin, Kabupaten Pesawaran. Bersebelahan dengan Markas Marinir membuatnya lebih mudah untuk didatangi.&nbsp;<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Pantai yang diresmikan pada tahun 2015 hingga saat ini merupakan tempat wisata yang lumayan ramai, bahkan dikala musim libur ataupun weekend banyak pengunjung yang datang kesana.</span></p><p>Jika ingin datang ke lokasi wisata ini membutuhkan waktu sekitar 1 jam dari pusat Kota Bandar Lampung. Aksesnya dapat melalui jalan ke arah Pantai Klara (Kelapa Rapat), terus saja sekitar 30 menit sampai bertemu dengan Markas Marinir.&nbsp;<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Apabila dari Bandara Raden Intan, pengunjung dapat menuju Terminal Rajabasa untuk lebih tepatnya dari Teluk Betung. Kemudian dari Teluk Betung dapat mencari angkutan Bis atau kendaraan berbasis online menuju Pantai Marines Eco Park.</span></p><p>Untuk masuk tempat wisata ini maka pengunjung harus membayar tiket masuk sebesar Rp. 5.000 per orang. Dengan biaya yang sangat terjangkau tersebut sudah dapat menikmati pemandangan wisata yang ada di Marines Ecopark.&nbsp;<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Lokasi yang berada di dekat dengan Markas Marinir, membuat tempat ini memiliki nuansa militer. Sebab di samping dan depan gerbang masuk Marines Ecopark merupakan Markas Marinir.</span></p><p>Fasilitas Marines Ecopark</p><ul><li>Wahana permainan</li><li>camping area</li><li>snorkeling</li><li>berlayar dengan perahu nelayan</li><li>memancing di laut,</li><li>permainan air untuk anak-anak serta permainan lain.</li><li>pondok-pondokan</li><li>karaoke</li><li>perahu cano</li><li>kolam renang laut</li><li>banana boat</li><li>ban</li><li>waterboom</li><li>wisata edukasi dan pelatihan yang berbasis Marinir</li></ul><p>Untuk fasilitas pendukung lain seperti MCK, Mushola dan kantin juga sudah tersedia di lokasi wisata ini. Sehingga ketika pengunjung ingin mandi atau beribadah tidak kesulitan.</p><p>Tiket Masuk</p><p>Motor : Rp. 5.000</p><p>Mobil : Rp. 20.000&nbsp;</p>', '', 'Desa Sanggi Kecamatan Padang Cermin', '1662122772_395d5cd4e19c7523f78c.jpg', 'publish', '2022-09-02 19:51:24'),
(79, 'Pantai Mutun', 7, '-5.514505976340573', '105.26325555952803', '<p>Pantai Mutun merupakan salah satu pantai indah yang ada di Lampung, pantai ini menjadi destinasi wisata favorit bagi keluarga khususnya di akhir pekan.</p><p>Pantai Mutun terdiri dari dua lokasi yakni:</p><ul><li>Pantai Mutun 1</li><li>Pantai Mutun 2</li></ul><p>Pantai Mutun 2 memiliki fasilitas waterboom, banana boat, serta tempat untuk memancing. Lokasinya berada tepat di samping Pantai Mutun 1.</p><p>Pantai Mutun 1 dikenal juga dengan nama MS Town yang dikelola oleh pihak swasta yakni MS Corporation. Suasana yang sejuk disertai hamparan pasirnya yang putih dan bersih membuat pengunjung nyaman berkunjung di Pantai Mutun, terlebih lagi dengan fasilitasnya yang lengkap.</p><p>Karena lokasinya berada tak jauh dari pusat kota, maka rute menuju Pantai Mutun pun sangat mudah. Dan bisa dilalui dengan menggunakan kendaraan pribadi maupun angkutan umum.&nbsp;<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Jika hendak menggunakan angkutan umum dari arah Stasiun Tanjung Karang atau Ramayana dengan menggunakan angkot warna ungu, dan turun di “Gudang Garam” Teluk Betung.&nbsp;</span><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Kemudian dilanjutkan dengan berjalan kaki ke arah kiri lalu naik angkot dengan jurusan Lempasing, dan turun di depan jalan masuk menuju Pantai Mutun.</span></p><p><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Tiket Pantai Mutun:</span></p><ul><li>Rp. 30.000,- jika menggunakan motor</li><li>Rp. 10.000,- untuk kamu yang tidak membawa kendaraan</li></ul><p>Fasilitas yang ada di Pantai Mutun :</p><ul><li>Area parkir</li><li>Gazebo</li><li>Tempat bilas</li><li>Toilet</li><li>Penyewaan alat-alat camping</li><li>Area camping</li><li>Warung-warung makanan dan minuman</li></ul>', '', 'Desa Sukajaya Lempasing Kec Teluk Pandan', '1662123116_400f2c224ec0d109050b.jpg', 'publish', '2022-09-02 20:48:59'),
(81, 'Air Terjun Tundo Telu', 1, '-5.599722771893909', '105.0682544938411', '<p>Air Terjun Tundo Telu yang terletak di Desa Poncorejo, Way Ratai.Untuk bisa sampai ke sini dari pusat Kota Bandar Lampung dibutuhkan waktu tempuh kurang lebih sekitar 2 jam perjalanan. Kita arahkan kendaraan menuju Pasar Umbul Kluih, </p><p>Way Ratai ikuti jalan aspal lurus menuju ke arah Kedondong. Setelah sampai di daerah Gunung Rejo lurus saja setelah itu belok kiri ikuti jalan aspal yang tak begitu lebar hingga bertemu gapura bertuliskan “Selamat Datang di Kawasan Wisata Alam Tundo Telu”. Seterusnya bertemu jalan berbatu yang kanan kiri terlihat kebun milik warga sampai bertemu sebuah pondok untuk tempat parkir kendaraan.Setelah parkir kendaraan kita lanjut tracking santai kurang lebih 10 menit dengan jalur menurun, jalur tracking sudah disemen jadi aman untuk kita lalui Berbeda dari air terjun lainnya, Air Terjun Tundo Telu memiliki 2 tingkatan dimana masing-masing tingkatannya terdapat kolam alami yang bisa kita gunakan untuk sekedar bermain air maupun untuk mandi.Air terjun Tundo Telu ini bisa menjadi referensi liburan anda bersama teman maupun keluarga. </p><p>Pemandangan alam yang masih alami serta suasana pegunungan yang asri serta kesejukan air terjunnya tentu dapat merefresh kita dari penatnya rutinitas kita sehari hari.</p><div>Fasilitas</div><div><br></div><div>- Spot Bermain Air</div><div>- Spot Foto</div><div>- Warung</div><div>- Toilet</div><div><br></div><div>Harga Tiket </div><div><br></div><div><div>Tiket masuk                   : Rp. 5.000 per orangnya</div><div>Tiket parkir motor            : Rp. 2.000 per unitnya</div><div>Tiket parkir mobil            : Rp. 10.000 per unitnya</div></div>', '', 'Desa Ponco Rejo Kecamatan Way ratai', '1663044247_9b7e1412a135fb8efef5.jpg', 'publish', '2022-09-11 00:23:06'),
(82, 'Air Terjun Kembar Rindu alam', 1, '-5.599739332839931', '105.0700642893886', '<p>Air Terjun Kembar adalah salah satu portofolio wisata alam yang masih terpendam di provinsi berjuluk Sang Bumi Ruwa Jurai ini. </p><p>Wisata alam tersebut berlokasi di Dusun Sidomukti Atas, Desa Ceringin Asri, Kecamatan Way Ratai, Kabupaten Pesawaran, Lampung. <span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Dari Kota Bandar Lampung ke lokasi itu diperkirakan memakan waktu kurang lebih selama 1 jam.</span><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Saat menuju lokasi, melewati beberapa pantai yang cukup terkenal di masyarakat lokal yaitu Pantai Mutun, Pantai Sari Ringgung, dan Pantai Klara.</span><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Pengalaman yang cukup berarti jika menggunakan kendaraan jenis sepeda motor, karena akan merasakan langsung pemandangan di sepanjang perjalanan dan kearifan lokal penduduk desa.</span></p><p>Pengunjung tak perlu khawatir, karena lokasi ini sudah ada di Google Maps, namun ada beberapa kartu provider mungkin kesulitan sinyal ketika memasuki wilayah itu.<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Setelah tiba di wilayah Kecamatan Way Ratai, Pesawaran, ada sebuah gapura yang bertuliskan Wisata Alam Air Terjun Kembar di tepi kiri jalan.</span><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Pengunjung bisa langsung masuk ke jalan tersebut, sekitar 100 meter ada petunjuk jika kembali untuk berbelok ke gang di sebelah kanan. Seperti pada umumnya pedesaan, jika tak melewati jalan jelek tak lengkap rasanya. </span><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">menuruni jalan berbatu dan kembali menanjak dengan jalan yang sama, tapi itu tidak jauh hanya sekitar 100 meter saja. Sesampainya di pintu masuk Air Terjun Kembar, pengunjung dapat langsung memarkirkan kendaraannya di lokasi yang sudah disediakan.</span></p><p>Di lokasi ini, disambut oleh pemandangan hutan yang asri dan suara gemericik air terjun. Itulah yang membuat tim semakin bersemangat untuk mengenalkan potensi wisata yang cukup terpendam ini.<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Tak lama-lama, tim langsung menuruni tebing yang cukup curam dengan berjalan kaki karena kendaraan tak bisa melalui jalur setapak tersebut. Tapi jangan khawatir untuk menuruni bukit, penduduk setempat sudah memberikan akses berupa jalan berlantai semen sehingga pengunjung tak perlu takut untuk terpeleset.</span></p><div>Fasilitas</div><div><br></div><div>- Spot Bermain Air</div><div>- Spot Foto</div><div>- Warung</div><div>- Toilet</div><div><br></div><div>Harga Tiket </div><div><br></div><div><div>Tiket masuk                   : Rp. 5.000 per orangnya</div><div>Tiket parkir motor            : Rp. 2.000 per unitnya</div><div>Tiket parkir mobil            : Rp. 10.000 per unitnya</div></div>', '', 'Desa Ceringin Asri Kecamatan Way Ratai', '1663043517_f1f09497a7f556481df3.jpg', 'publish', '2022-09-11 00:26:39'),
(83, 'Air Terjun Ciupang', 1, '-5.5976700272507', '105.06354329247063', '<p>Air Terjun Ciupang berada di lokasi yang tak jauh dari pemukiman warga, serta masih memiliki panorama alam yang sangat asri dan alami. Aliran air terjunnya berbeda dengan aliran air terjun pada umumnya.<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Untuk kamu yang sedang berada di Lampung, atau akan ke Lampung sebaiknya kamu mengunjungi Air Terjun Ciupang ini. Keindahan alam akan kamu dapatkan saat berada disana.</span></p><h1>Jalur Menuju Air Terjun Ciupang</h1><p>Untuk menuju Air Terjun Ciupang kamu harus menggunakan kendaraan roda dua, karena semakin mendekati perkampungan dimana Air Terjun Ciupang berada akan semakin kecil.</p><p>Masih bisa dilalui kendaraan roda empat namun akan susah jika bertemu dengan mobil lain dari arah yang berlawanan. Jalannya pun sudah bagus dan beraspal hanya beberapa bagian saja yang masih berupa tanah.<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Air Terjun Ciupang sendiri terletak di tengah perkampungan warga, untuk sampai lokasi kamu harus menyusuri jalanan di tengah rumah-rumah warga. Akan ada petunjuk jalan untuk menuju lokasi.</span></p><p>Jalur yang dilalui tidak terlalu susah, hanya beberapa menit berjalan kamu sudah berada di area Air Terjun Ciupang. Namun untuk sampai menuju Air Terjun Ciupangnya langsung, kamu masih harus menaiki beberapa anak tangga yang terbuat dari batu yang berjajar tak beraturan.</p><p>Tangga tersebut cukup curam , dan agak licin. Jadi, kamu harus sangat berhati-hati menaikinya. Setelah itu kamu akan menyusuri jalan setapak ditengah rindangnya pepohonan.<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Tak berapa lama kemudian sampailah kamu didepan aliran Air Terjun Ciupang. Perjalanan yang kamu lalui tidak terlalu berat dan melelahkan. Ya, cukuplah untuk membakar beberapa kalori saja.</span></p><h1>Pesona Keindahan Air Terjun Ciupang</h1><p>Air Terjun Ciupang memiliki aliran air yang berbeda dengan curug pada umumnya. Jika biasanya sebuah air terjun langsung terjun ke bawah  seperti sebuah pancuran, lain halnya dengan Air Terjun Ciupang ini.</p><p>Airnya mengalir melewati bebatuan tebing terlebih dahulu, sehingga terlihat seperti berundak-undak dan menghasilkan bunyi air yang berbeda. Debit airnya pun tidak terlalu deras.<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Air Terjun Ciupang memiliki tinggi sekitar 15 meter, dan mengalir diantara tebing-tebing yang sangat tinggi. Selanjutnya aliran airnya terus mengalir kebawah sehingga memunculkan air terjun yang kecil dengan ketinggian sekitar 5 meter saja.</span></p><p>Dikelilingi oleh pepohonan yang masih sangat asri dan udaranya yang sejuk. Di bawah Air Terjun Ciupang terdapat sebuah kolam yang tidak terlalu dalam yang dapat kamu gunakan untuk bermain-main air. <span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Karena kolamnya tidak terlalu dalam, hanya sekitar paha orang dewasa. Di sekitarnya juga terdapat beberapa bebatuan yang bisa kamu gunakan untuk berfoto, atau hanya sekedar duduk-duduk manja. Namun kamu harus hati-hati karena ada bebatuan yang berlumut sehingga dipastikan akan licin.</span></p><div>Fasilitas</div><div><br></div><div>- Spot Bermain Air</div><div>- Spot Foto</div><div>- Warung</div><div>- Toilet</div><div><br></div><div>Harga Tiket </div><div><br></div><div><div>Tiket masuk                   : Rp. 5.000 per orangnya</div><div>Tiket parkir motor            : Rp. 2.000 per unitnya</div><div>Tiket parkir mobil            : Rp. 10.000 per unitnya</div></div>', '', 'Desa Sumber Jaya Kecamatan Way ratai', '1663042701_d7f706920daeedf96667.jpg', 'publish', '2022-09-11 00:31:53'),
(84, 'Air Terjun Sinar Tiga', 8, '', '', '<p>Air Terjun Sinar Tiga bertempat di Dusun Sinar Tiga. Kamu akan merasakan perbedaan suasana saat memasuki hutan yang masih rapat dan rindang. Sebelum area hutan, kamu akan melewati kebun kopi milik warga. Saat memasuki hutan, kamu akan berjalan di antara pepohonan tinggi. </p><p>Air terjun sinar tiga memiliki jalur trakking yang dekat, karena rute jalan kaki dari dusun sinar tiga termasuk pendek, walaupun lokasinya menanjak tetapi, jalurnya termasuk ringan.<br></p><p>Ketinggian air terjun sekitar 30an meter membuatnya menjadi sebuah atraksi wisata yang indah dan suasana yang sejuk dan tenang menjadi hiburan tersendiri dan menjadi kegiatan \'healing forest\' yang menyenangkan.&nbsp;</p><p>Kamu akan di kenakan biaya tiket masuk yang harganya terjangkau, tiket di bandrol Rp 10.000/Orang. Ada loket di ujung dusun sinar tiga dan area parkir kendaraan.</p>', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3971.2470037127473!2d105.10090847394244!3d-5.530329654990242!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e40d5922a755e21%3A0x391b990da2edcd19!2sSinar%20Tiga%20Waterfall!5e0!3m2!1sen!2sid!4v1687500999587!5m2!1sen!2sid\" width=\"100%\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'Jl. Sinar Tiga, Harapan Jaya, Kec. Padang Cermin, Kabupaten Pesawaran, Lampung 35451', '1687500469_2fdecac8773960f7b302.jpg', 'publish', '2023-06-23 13:07:50'),
(85, 'Taman Nemo Pahawang', 8, '', '', '<p>Dari hotel di Bandar Lampung, hanya membutuhkan waktu sekitar 60 menit menuju dermaga Ketapang. Dari dermaga, wisatwan menggunakan perahu mesin menuju Pulau Pahawang.</p><p>Tiba di Pulau Pahawang, wisatawan bisa langsung mengekplorasi pantai berpasir putih bersih dan air laut yang tampak tenang. Foto-foto di berbagai sudut pantai atau langsung menceburkan diri ke laut.</p><p>Jika lapar, wisatawan bisa menikmati hidangan ikan bakar, sambal terasi dan sayur asem. Untuk mengisi perut seeblum kembali melakukan aktivitas snorkeling di sekitar.</p><p>Salah satu yang bisa dituju adalah Taman Nemo Jelarangan.</p><p>Di lokasi snorkeling, wisatawan bisa foto-foto dengan latar depan ikan badut (clownfish) yang berkeliaran di sekitar anemon.</p><p>Mau seru-seruan, bisa menjajal menunggangi Banana Boat dan Donat Boat.</p><p>Pahawang adalah salah satu obyek wisata andalan Kabupaten Pesawaran. Bahkan menjadi andalan wisata Provinsi Lampung juga.</p><p>Pulau ini relatif tidak jauh dari Kota Bandar Lampung. Banyak wisatawan yang datang berkunjung mengikuti trip satu hari. Berangkat pagi dari Bandar Lampung dan kembali di sore atau malam hari.</p><p>Dan banyak juga yang memilih menginap di pulau. Agar bisa lebih menikmati suasana pulau dan keindahan di sekitarnya tanpa harus terburu-buru.</p><p>Menenangkan diri sejenak, libur dari rutinitas harian yang menguras pikiran.</p><p>Banyak yang berkunjung, karena ingin menikmati keindahan bawah laut terumbu karang. Serta melihat berbagai hewan-hewan lucu dan menarik yang hidup di sekitar karang.</p>', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3970.3428088545475!2d105.20026187414078!3d-5.663466356074481!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e41256f8166bd5f%3A0x7a87120949ae99fe!2sTaman%20Nemo!5e0!3m2!1sid!2sid!4v1687685511900!5m2!1sid!2sid\" width=\"100%\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'Pulau Pahawang, Kec. Punduh Pidada, Kabupaten Pesawaran, Lampung 35453', '1687684884_56297ba94d8881909b05.jpg', 'publish', '2023-06-25 16:21:25'),
(86, 'Pantai Teluk Hantu', 8, '', '', '<p><span style=\"color: rgb(34, 34, 34); font-family: Merriweather, serif; font-size: 18.4px;\">Pantai ini dibuka untuk umum dan bisa dikunjungi setiap harinya selama 24 jam, pantai ini berlokasi di Pagar Jaya, Kec. Punduh Pidada, Kabupaten Pesawaran, Lampung. Waktu yang menuju ke pantai ini dari  bandar lampung berjarak tempuh 91 kilometer dan waktu perjalanan selama 3 jam 50 menit. Kamu cukup mengarahkan kendaraan mengikuti arah jalan yaitu lurus terus kemudian belok ke arah kanan sampai menemukan pintu masuk Pantai Teluk Hantu.</span><span style=\"color: rgb(34, 34, 34); font-family: Merriweather, serif; font-size: 18.4px;\"><br></span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Merriweather, serif; font-size: 18.4px;\">Ombak di Pantai Teluk Hantu tidak terlalu besar, jadi kamu bisa berenang dan bermain-main di sekitar pantai dengan tenang. Pantai ini menyuguhkan view yang sangat memanjakan mata, butiran pasir putih yang mengkilap menyatu dengan air laut berwarna biru kehijauan membuat siapa saja terpukau akan pesonanya. Di sini, Kawan Jalan dapat melihat pemandangan tebing yang menjulang amat tinggi dan dikelilingi dengan pepohonan hijau rimbun serta semak belukar. Kamu juga bisa diving dan snorkeling di pantai ini, airnya yang jernih sangat memungkinkan bagimu melihat ikan-ikan dan terumbu karang yang cantik di dasar laut. Selain bermain air, kamu juga bisa melihat langsung view sunrise maupun sunset. Kedua pemandangan tersebut membuat siapa saja jatuh cinta, Kawan Jalan juga bisa berpose cantik dengan background landscape alam yang ciamik.</span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Merriweather, serif; font-size: 18.4px;\">Karena keberadaannya yang masih alami, di pantai ini belum tersedia fasilitas penunjang yang lengkap. Jadi, Kawan Jalan harus membawa keperluan amunisi, obat-obatan jika diperlukan, dan membawa tenda guna bermalam di sekitaran pantai. Di sekitar pantai terdapat dua toilet umum yang bisa kamu gunakan untuk bilas dan mandi. Untuk berkunjung ke pantai ini, kamu diharuskan mengajak tiga sampai lima orang untuk meminimalisir kejadian yang tak diinginkan.</span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Merriweather, serif; font-size: 18.4px;\">Berkunjung ke Pantai Teluk Hantu dengan sejuta keindahan ini, kamu gak perlu takut menguras kantong. Pasalnya destinasi wisata bahari yang satu ini hanya mengenakan tarif tike masuk sebesar Rp10.000 per orangnya dan terdapat biaya retribusi parkir kendaraan sebesar Rp10.000 untuk motor dan Rp20.000 untuk mobil.</span></p><p><span style=\"color: rgb(34, 34, 34); font-family: Merriweather, serif; font-size: 18.4px;\"><br></span><span style=\"color: rgb(34, 34, 34); font-family: Merriweather, serif; font-size: 18.4px;\"><br></span><br></p>', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3969.5715451116225!2d105.21139067414228!3d-5.774612257001461!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e4131a4bdd87497%3A0xf0cdfee4f0ac5ffa!2sTeluk%20Hantu!5e0!3m2!1sid!2sid!4v1687690193574!5m2!1sid!2sid\" width=\"100%\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'Teluk Hantu, Pagar Jaya, Kabupaten Pesawaran, Lampung', '1687690781_eb1ea8f616735433beb9.jpg', 'publish', '2023-06-25 17:59:42');

-- --------------------------------------------------------

--
-- Table structure for table `pengunjung`
--

CREATE TABLE `pengunjung` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `device` varchar(50) DEFAULT NULL,
  `maps_id` int(11) DEFAULT NULL,
  `session_id` varchar(250) DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengunjung`
--

INSERT INTO `pengunjung` (`id`, `ip_address`, `device`, `maps_id`, `session_id`, `created_at`) VALUES
(1, '::1', 'Windows 10', 59, 'q3mv7tj8rmcsb23rt02ket1a7qbg2pgd', '2022-08-22'),
(2, '::1', 'Windows 10', 59, 'haesmrh60ab67s7u3fj43h9vpqt4d6c6', '2022-08-22'),
(3, '::1', 'Windows 10', 59, 'bb6d7c84fr0h3on9g166c86l81nha3vn', '2022-08-22'),
(4, '140.213.231.75', 'Android', 58, '1h74pau6otvc9v124b7ggcs6pjb4f6tg', '2022-08-28'),
(5, '114.4.4.201', 'Android', 58, '81sj5h106v5k7m7carl5u79ogeq5m807', '2022-08-28'),
(6, '114.4.4.133', 'Android', 58, 'c8g38l3d45mjqj8vt907urmmi2476eaa', '2022-08-28'),
(7, '103.169.238.66', 'iOS', 58, 'c07da8labdn6hd7ql5hsj12ug23qh3km', '2022-08-29'),
(8, '103.169.238.66', 'iOS', 58, 'rahbv6m7q07r45pvb8184si081p2nj5b', '2022-08-29'),
(9, '140.213.64.90', 'Android', 58, 'n6srcg18via9i41c99785ddq9a7cmfeg', '2022-08-29'),
(10, '114.4.4.198', 'Android', 58, 'r331kbla4jn33r2pv898eebgacfkfbbb', '2022-08-29'),
(11, '114.125.247.88', 'Android', 58, '3rl6i7dp8m0bgnhd0s2og31s04ikako1', '2022-08-29'),
(12, '103.140.189.172', 'Android', 58, 'u50rb19g0boffml786em2c2ltia4scbe', '2022-08-29'),
(13, '140.213.232.95', 'Windows 10', 58, 'h6hev1tjlbgrmfp10g9so2hqdgsbhta9', '2022-08-29'),
(14, '140.213.232.95', 'Windows 10', 59, 'h6hev1tjlbgrmfp10g9so2hqdgsbhta9', '2022-08-29'),
(15, '110.50.81.196', 'Windows 10', 59, 'bm99dkvbinfkc322fnqkie3l8gqgcj0i', '2022-08-29'),
(16, '140.213.232.95', 'Windows 10', 59, 'sm0kdorcmnis5t5ovuhoh723j2c5hejc', '2022-08-29'),
(17, '140.213.232.95', 'Windows 10', 59, '02adkmftamtrbptvuejdd9fiasud5jr1', '2022-08-29'),
(18, '140.213.232.95', 'Windows 10', 59, 'kkbmnadq9r78fsibcvumqsmj6prrjrhn', '2022-08-29'),
(19, '140.213.232.95', 'Windows 10', 59, 'vkseh1sad2lqb0n2c3cgcnc71fni0plg', '2022-08-29'),
(20, '110.137.38.187', 'iOS', 60, 'msbk103dd8obetsdhc6d4f6pfno47kbf', '2022-08-30'),
(21, '110.137.38.187', 'iOS', 60, 'gmfdokm6mq3hh88jrrtt8sve4foti2fo', '2022-08-30'),
(22, '110.137.37.254', 'Windows 10', 64, 'lnh2ov9m8qqj4uu41ghg4ottahj64daj', '2022-08-30'),
(23, '103.169.238.66', 'iOS', 60, '6jc2aq9vk721ngrign2gseonc97g1sni', '2022-08-30'),
(24, '140.213.70.124', 'Windows 10', 64, '4h9i9872f9c0v4puda3ji8rd9sgotepd', '2022-08-30'),
(25, '110.137.37.128', 'iOS', 59, 'tfhsttu0836kpsfpk7e6rq06553etk70', '2022-08-30'),
(26, '140.213.70.124', 'Windows 10', 64, 'oohrti6qs20i4ij8v6ev08v54vf2nbtl', '2022-08-30'),
(27, '110.137.37.128', 'iOS', 61, 'du611sirq2iet3ij856h3accsvdutj2t', '2022-08-30'),
(28, '140.213.70.124', 'Android', 59, '4f54et1d0jk0uhnm62ke60leuu4ojuau', '2022-08-31'),
(29, '140.213.70.124', 'Android', 59, '9f5rhgo9tec8k38np8hlaiel282ehvdp', '2022-08-31'),
(30, '116.206.39.88', 'Android', 59, 'chbouv1jrmj11tl4pv0ve6eba6sop6mp', '2022-08-31'),
(31, '140.213.70.124', 'Linux', 59, 'j3aeni7hln1hog5d9tm4u7odn1mb6j9c', '2022-08-31'),
(32, '116.206.39.88', 'Android', 60, 'chbouv1jrmj11tl4pv0ve6eba6sop6mp', '2022-08-31'),
(33, '116.206.39.88', 'Android', 60, '0f68b3rbjqdlubqd5b8p6bb94f8oq33p', '2022-08-31'),
(34, '116.206.39.88', 'Android', 59, 'ivoijm0o3i3evn6f4u7drd54tbh562id', '2022-08-31'),
(35, '116.206.43.105', 'Android', 61, '9ljujcug91rrka35k1ccru3ua2q4aotv', '2022-08-31'),
(36, '116.206.43.105', 'Android', 63, '9ljujcug91rrka35k1ccru3ua2q4aotv', '2022-08-31'),
(37, '116.206.39.71', 'Android', 63, 'ioble134h9voark4t1mg83v0rn05soj4', '2022-08-31'),
(38, '103.169.238.66', 'iOS', 60, '5hjccb1mirm6381ksoci3du4fvaf0788', '2022-09-01'),
(39, '110.137.37.39', 'Android', 59, 'rpfar87vaoo3303laslsqkg9hh4rqpq3', '2022-09-01'),
(40, '114.4.4.133', 'Android', 59, 'fjar5to4hssugk376b92612basa7hph7', '2022-09-01'),
(41, '110.137.37.39', 'Android', 59, '9jvs95cohjbt9o10cg161q2ac41effje', '2022-09-01'),
(42, '175.45.186.196', 'Android', 59, 'fh1bugja1ituia68tib9ljntd5ibcorn', '2022-09-01'),
(43, '103.169.238.66', 'iOS', 63, 'f0e25mmnq9hcca3mj5lfgr0ofpof4kg0', '2022-09-01'),
(44, '182.253.63.7', 'iOS', 67, 'f88okp4rpuk7knaknhe396asbj66isjn', '2022-09-01'),
(45, '110.137.37.30', 'Windows 10', 63, 'ncv7p80cf1lu4m7mkdprlig77l98jnd4', '2022-09-01'),
(46, '116.206.39.85', 'Android', 60, 'cfrqbvvgh1t7b6qfcbnbcvhllemtgqa0', '2022-09-01'),
(47, '103.169.238.66', 'iOS', 63, 'ngaagfl282cn96ohru0s48gkoindpqm4', '2022-09-01'),
(48, '103.111.101.12', 'Android', 61, 'ddkjc69otambkc6ln7el16s7lcd0th00', '2022-09-01'),
(49, '114.125.237.83', 'Android', 62, 'psg86a6jmvc48kqm4p0d43br02871qpa', '2022-09-01'),
(50, '116.206.39.118', 'Android', 60, 'tqg7dqjpiuh7sfk7qe995esvr8kmrecj', '2022-09-01'),
(51, '116.206.39.118', 'Android', 60, '7e5p9rp885jtu6elf9uvlo5aajtvgt0l', '2022-09-01'),
(52, '182.1.231.188', 'Android', 59, 'hn213geef7i4jj9r64uo5umm9qf4dr55', '2022-09-01'),
(53, '140.213.71.72', 'Android', 62, 'ifja7rl2c9pqcgm2b1n022qmrt2ah410', '2022-09-01'),
(54, '125.160.233.247', 'Android', 66, 'rt4968jiqp1tn9fsvcc0tgfak79on2s3', '2022-09-01'),
(55, '140.213.64.199', 'iOS', 59, '94f0df4ngl603im89vlm5h9s701atrvr', '2022-09-01'),
(56, '110.137.36.4', 'iOS', 59, 'auibnpfk414h8sfssjtqei9ci54cpm1f', '2022-09-01'),
(57, '115.178.211.24', 'iOS', 64, '7ps70emla9369uahp0ivf2latuf0jhap', '2022-09-01'),
(58, '114.125.237.208', 'iOS', 59, 's85djjsg53e2cumutpqrbhdj3khauorp', '2022-09-01'),
(59, '114.125.237.208', 'iOS', 61, 's85djjsg53e2cumutpqrbhdj3khauorp', '2022-09-01'),
(60, '140.213.64.218', 'Android', 67, 'jl1hgfbig3ppr9ghhs3415qcnd6k24si', '2022-09-01'),
(61, '182.3.105.186', 'iOS', 59, 'v68jaqig4t3hjaijk0dc76qgs3ie1ahc', '2022-09-01'),
(62, '182.3.105.186', 'iOS', 65, 'v68jaqig4t3hjaijk0dc76qgs3ie1ahc', '2022-09-01'),
(63, '182.1.235.221', 'Android', 63, 'rjdvcrqseq5sclqtoq444p58savjdhda', '2022-09-01'),
(64, '110.137.36.4', 'Android', 60, 'p3qn8a9eebtcklq5fqvslepdll4s6rfd', '2022-09-01'),
(65, '140.213.33.49', 'iOS', 59, 'uqlt2842b1r5it2mad7vvmcrqf4r52bj', '2022-09-01'),
(66, '140.213.33.49', 'iOS', 61, '4jr9b0mold17j75ubn19sg2qqd873fnk', '2022-09-01'),
(67, '140.213.33.49', 'iOS', 62, '4jr9b0mold17j75ubn19sg2qqd873fnk', '2022-09-01'),
(68, '116.206.42.67', 'Android', 59, 'm8s4ih0jk4n5ic7ht7mke7l6ienqrrgq', '2022-09-01'),
(69, '116.206.42.67', 'Android', 59, 'ikdgvnvjr29uju155lg3rufje2uu5jua', '2022-09-01'),
(70, '103.124.138.80', 'Android', 59, 'mesdjocgl79qetequh69ur7udv24uie1', '2022-09-01'),
(71, '103.124.138.80', 'Android', 60, 'mesdjocgl79qetequh69ur7udv24uie1', '2022-09-01'),
(72, '103.124.138.80', 'Android', 63, 'mesdjocgl79qetequh69ur7udv24uie1', '2022-09-01'),
(73, '103.124.138.80', 'Android', 61, 'mesdjocgl79qetequh69ur7udv24uie1', '2022-09-01'),
(74, '103.124.138.80', 'Android', 64, 'mesdjocgl79qetequh69ur7udv24uie1', '2022-09-01'),
(75, '103.124.138.80', 'Android', 62, 'mesdjocgl79qetequh69ur7udv24uie1', '2022-09-01'),
(76, '103.124.138.80', 'Android', 67, 'mesdjocgl79qetequh69ur7udv24uie1', '2022-09-01'),
(77, '103.144.54.17', 'iOS', 59, 'bdg94t8r6igcvv5pvq53crofppkjuki2', '2022-09-01'),
(78, '110.137.37.194', 'Android', 65, '0mhf8492jn3grsbduan1rov3dqkvf99q', '2022-09-01'),
(79, '110.137.36.4', 'Android', 60, 'saa9nfqoh1kq2a2c1lkpbv1du3u5fcal', '2022-09-02'),
(80, '182.3.103.69', 'Android', 63, 'riic0vlqk2b91tvkfs6jdine1up0inel', '2022-09-02'),
(81, '45.121.219.5', 'Android', 63, 'h0hjuffmm62fujf8kffiaeb5gbjcei9a', '2022-09-02'),
(82, '182.3.103.69', 'Android', 63, '95dsbeqa0r41mmd192n9j2o06mh16a37', '2022-09-02'),
(83, '180.254.171.166', 'Android', 59, 'bv7ac01u64lr9qth4p36ft0gturlo4im', '2022-09-02'),
(84, '103.169.238.66', 'iOS', 59, 'b8cui3nshc0fkc6li0psleq7fm3g8v74', '2022-09-02'),
(85, '180.254.171.166', 'Android', 62, 'bv7ac01u64lr9qth4p36ft0gturlo4im', '2022-09-02'),
(86, '180.254.171.166', 'Android', 59, 'bbpate4kk22p1tq4upj88hfmrk1f9el6', '2022-09-02'),
(87, '140.213.71.183', 'Windows 10', 78, 'mtsutfj3uokokmim57ahjuk6ljrqc2bf', '2022-09-02'),
(88, '110.137.36.4', 'iOS', 60, 'hgrb4mrtkecd4e7abqvsm8rmoajru4k8', '2022-09-03'),
(89, '110.137.36.4', 'iOS', 60, 'iglkj9oqva37pvoefqtaeniv977176vt', '2022-09-03'),
(90, '182.3.103.228', 'iOS', 67, 'j8vgik81odmn3l9dv7nt9i5fjf434via', '2022-09-04'),
(91, '182.3.103.228', 'iOS', 59, 'vcovjn1c3hdiuh7jsgbe8ae9m18542hf', '2022-09-04'),
(92, '103.140.189.172', 'Windows 10', 59, 'njlhldsc7uj8vld4l3shrk3nfje88j2h', '2022-09-05'),
(93, '103.140.189.172', 'Windows 10', 63, 'lhk3dgkadv8qq3jalu2okrvjtqklfe27', '2022-09-05'),
(94, '103.169.238.66', 'Windows 10', 62, 'kqnomqi815mhdmej8lk7f6q79u0mcvbs', '2022-09-05'),
(95, '140.213.231.32', 'Android', 67, '8m95htdpu7iegsnjhb1iurhf79ghpd4a', '2022-09-05'),
(96, '140.213.230.76', 'Android', 67, 'gnrfmn8cim6000ejkfvvttqporhut8k5', '2022-09-05'),
(97, '140.213.230.76', 'Android', 67, 'r8j5kvfmv6gmu68e8autn273bm5rd19e', '2022-09-05'),
(98, '190.2.130.168', 'iOS', 60, '3cb1i29uru65mdhq8urf7lqi39kf3lc3', '2022-09-05'),
(99, '103.169.238.66', 'iOS', 60, '896v1p4vbidc0o0m0fl871po5evngmhb', '2022-09-06'),
(100, '103.169.238.66', 'Windows 10', 62, '3p8vi35e4oibabnrtptij5ngb7vaenoe', '2022-09-06'),
(101, '103.169.238.66', 'Windows 10', 62, '0qdl3s5mniioe1ufedr4v1jfcrt5aa0h', '2022-09-06'),
(102, '103.169.238.66', 'Windows 10', 62, 'f3ctg3etkjo4c72tt8l3jr49fr96siv8', '2022-09-06'),
(103, '103.169.238.66', 'Windows 10', 62, 'sa05eggsdh56g35bgjejsvj1hkemkvc4', '2022-09-06'),
(104, '114.125.249.150', 'Android', 60, '3scrto269a5mkh4qooig3pesdhj8k263', '2022-09-08'),
(105, '114.125.247.50', 'Android', 64, 'v0952v4fenhnq782fgo1ulgk5nkfs7d0', '2022-09-09'),
(106, '114.125.247.50', 'Android', 64, 'j8o1r70qp36lbil4b8v236de1db7261h', '2022-09-09'),
(107, '114.125.247.50', 'Android', 59, 'j8o1r70qp36lbil4b8v236de1db7261h', '2022-09-09'),
(108, '203.78.116.82', 'Windows 10', 67, 'q5s0v4jlvq7ja1d6g4qone8rghib8p8s', '2022-09-13'),
(109, '203.78.116.82', 'Windows 10', 67, '8v8sn2v2b3r5p8dmtblkc091nn027n7n', '2022-09-13'),
(110, '::1', 'Windows 10', 59, 'mtrhm725chitm8d1klsk9kap2cttio2b', '2023-06-11'),
(111, '::1', 'Windows 10', 59, 'o5uuii355vke1hsp20akar4kmq4lplrb', '2023-06-11'),
(112, '::1', 'Windows 10', 59, 'd1vkoc6156po0027v194vfpr93vo70qv', '2023-06-11'),
(113, '::1', 'Windows 10', 59, '3huf7tirp3u9smdk1or315jqrrre16f1', '2023-06-11'),
(114, '::1', 'Windows 10', 59, 'l8uecm122abmvabec5qdp7mj8lsoc0aj', '2023-06-11'),
(115, '::1', 'Windows 10', 59, 'qele1ud7j042gfe8cner99shblonbeei', '2023-06-11'),
(116, '::1', 'Windows 10', 59, 'tn59ksroegqc4j4fsk9rgcaoq6rfej2f', '2023-06-11'),
(117, '::1', 'Windows 10', 59, 'a7db7ac89uti5cmsqccnncmqo38tiqam', '2023-06-11'),
(118, '::1', 'Windows 10', 59, '0n8evfmeprjvdsksm4936dp7v3gl8e2c', '2023-06-15'),
(119, '::1', 'Windows 10', 59, 'qvinkfs4bgrl5h45ikmkjfdg90jmf85f', '2023-06-15'),
(120, '::1', 'Windows 10', 59, 'fhhsloihi56hc3e33srvlplmg9soqheu', '2023-06-15'),
(121, '::1', 'Windows 10', 59, '8rahci7v8jo9cvo61563i45miak5anos', '2023-06-20'),
(122, '::1', 'Windows 10', 59, '5dh177fvcde960vvqmi81bqritkpcjca', '2023-06-20'),
(123, '::1', 'Windows 10', 60, 'ppftoik8nc0ohj7t418sl4mbkuuqkhbi', '2023-06-20'),
(124, '::1', 'Windows 10', 66, '12g746n2if9j1jg26tblih173ce2j37p', '2023-06-22'),
(125, '::1', 'Windows 10', 66, 'qvpsdqajmslhm86g5ik9g34222eemgvd', '2023-06-22'),
(126, '::1', 'Windows 10', 64, '32b9ap1b66f3lsf7boq6prp43juqhlur', '2023-06-22'),
(127, '::1', 'Windows 10', 84, '6497cmnmiafglkot23g480u0ihrurlr8', '2023-06-23'),
(128, '::1', 'Windows 10', 84, '5cuugmcmaue86q83vts7m96071o3pr3a', '2023-06-23'),
(129, '::1', 'Windows 10', 84, 'as81ea8k1clf9f58u3rs74pb1ih596io', '2023-06-24'),
(130, '::1', 'Android', 84, 'be5om2s2uipvsjpeo1pr5mitk6qkhheh', '2023-06-24'),
(131, '::1', 'Android', 84, '9vnq7akq61478gcrcsudqnqlgcv7vqoc', '2023-06-24'),
(132, '::1', 'Windows 10', 80, 'p6ekqnvj3818fojhm3riemn6gnjp4m2l', '2023-06-24'),
(133, '::1', 'Windows 10', 80, 'g4svsl7od8n3bfpg1011ka333unbo48k', '2023-06-24'),
(134, '::1', 'Windows 10', 80, 'p9tn9p91ot8obbau5t9dvb8ubsvunkch', '2023-06-24'),
(135, '::1', 'Windows 10', 84, 'p9tn9p91ot8obbau5t9dvb8ubsvunkch', '2023-06-24'),
(136, '::1', 'Windows 10', 61, 'ckoa7dnol5lsur9sn68augpfmhahpt69', '2023-06-24'),
(137, '::1', 'Windows 10', 61, '38hp9a98bie414q6vs4tdi1r4cm9c2pk', '2023-06-24'),
(138, '::1', 'Windows 10', 61, 'i6o0jsskalagv72gkjro8nq891mchogu', '2023-06-24'),
(139, '::1', 'Windows 10', 84, 'i6o0jsskalagv72gkjro8nq891mchogu', '2023-06-24'),
(140, '::1', 'Windows 10', 84, '67r510hcc6h9km73lpr03mpl7tedmlli', '2023-06-24'),
(141, '::1', 'Windows 10', 84, '1sn0kqno7hppcmkavjq7jj8rju9od464', '2023-06-24'),
(142, '::1', 'Windows 10', 84, 'bjch5dh40pr1eor9f3ah03s9jb0vcidf', '2023-06-24'),
(143, '::1', 'Android', 84, '540m1mabnn7esjsftqhqsm06clflno7u', '2023-06-24'),
(144, '::1', 'Android', 59, '540m1mabnn7esjsftqhqsm06clflno7u', '2023-06-24'),
(145, '::1', 'Windows 10', 59, 'j1ut0tb24m44npdhc46ejggque7udsih', '2023-06-24'),
(146, '::1', 'Windows 10', 84, 'p0jpdlbhflucci88m20m4s65dt3res0b', '2023-06-25'),
(147, '::1', 'Windows 10', 59, 'kk8o5a6migg31oeog5cm2dm0di29n15t', '2023-06-25'),
(148, '::1', 'Windows 10', 59, 'eqbacg8a5nunkgsbe9bhfa0g7lcekmee', '2023-06-25'),
(149, '::1', 'Windows 10', 59, 'vq2bs6b7kjchio67vn2sndo8ssmta8b9', '2023-06-25'),
(150, '::1', 'Windows 10', 64, 'vq2bs6b7kjchio67vn2sndo8ssmta8b9', '2023-06-25'),
(151, '::1', 'Windows 10', 59, 'it89okl73e76tq41rg7e6s01vc26ob8d', '2023-06-25'),
(152, '::1', 'Windows 10', 85, 'ep6jih6vgcpr901eje3ih0osl4dl6kt8', '2023-06-25'),
(153, '::1', 'Windows 10', 85, '4crvktqvdqd1v6assqu3ivreni90l4bg', '2023-06-25'),
(154, '::1', 'Windows 10', 85, 'mrn046g6hk4nmqikjq2oqj8s7bvmb8ae', '2023-06-25'),
(155, '::1', 'Windows 10', 64, '7a0at2sdt5ugd4h8qttqmn64qi40ms8j', '2023-06-25'),
(156, '::1', 'Windows 10', 64, 'qan99ecigphpmtpk5uflnph3og9f5qph', '2023-06-25'),
(157, '::1', 'Windows 10', 64, 'igmncjg1kf6fe7tk7vgrg50gcavk4lit', '2023-06-25'),
(158, '::1', 'Windows 10', 84, '8bplogsgfvbpjqp3b81hgof2g11gob3d', '2023-06-25'),
(159, '::1', 'Windows 10', 84, 'd7oevoi9kj2q7buf1a7420mn0kp1k67b', '2023-06-25'),
(160, '::1', 'Windows 10', 84, 'f9v0j73ienbm00k1od3b8ee6pc50epmh', '2023-06-25'),
(161, '::1', 'Windows 10', 84, 'ed7h7m5frnfg4jr2dhmes4uta6k2othi', '2023-06-25'),
(162, '::1', 'Windows 10', 84, '9pgmno4lfavap7i5i6be6fcqeqmo4khm', '2023-06-25'),
(163, '::1', 'Windows 10', 84, '6ctec9e712nunaemfg5hb45c6j977n5k', '2023-06-25'),
(164, '::1', 'Windows 10', 84, 'sufho3978fcbvpk7knooku81790se8ga', '2023-06-25'),
(165, '::1', 'Windows 10', 84, 'pdq1r0fjkkkr2k1eqj9ptj9utseh9r7h', '2023-06-25'),
(166, '::1', 'Windows 10', 84, '1ka4cegguqu215lj7o4ns7g20l127s65', '2023-06-25'),
(167, '::1', 'Windows 10', 84, 'oatpehepnaomrk6qs4o8m75d57bgaduh', '2023-06-25'),
(168, '::1', 'Windows 10', 64, 'h32t7guokgfpj5lh3h25epsh88fka8oc', '2023-06-25'),
(169, '::1', 'Windows 10', 64, '8kvsbnvflpejs31gvrq1v359v3th049i', '2023-06-25'),
(170, '::1', 'Windows 10', 64, 'e4uic24gceb9p7pdjaljaim6pks6pl3m', '2023-06-25'),
(171, '::1', 'Windows 10', 64, 'ghbr06b63lq2r4dt59ohi2mg757v4m0g', '2023-06-25'),
(172, '::1', 'Windows 10', 64, 'lj095pk9c1oopp849p7s1hae83en4e2f', '2023-06-25'),
(173, '::1', 'Windows 10', 64, '4iq430ebtrs308atofnra2f7hjomdsff', '2023-06-25'),
(174, '::1', 'Windows 10', 64, '6v3njnf62p9elpl7bi5mpcddsieh3clf', '2023-06-25'),
(175, '::1', 'Windows 10', 64, 'f4j3thto9k0bhvcdnr4evaouu7ejb61a', '2023-06-25'),
(176, '::1', 'Windows 10', 64, '5m874nfi8q2o4dbq680hrnhcijnt0jhn', '2023-06-25'),
(177, '::1', 'Windows 10', 64, '71lg6hdbod82n1cvrm33uak5ruvor46i', '2023-06-25'),
(178, '::1', 'Windows 10', 64, '5v3qg7nbpghpigopu1hp6dck5gf9v2mh', '2023-06-25'),
(179, '::1', 'Windows 10', 64, '5jrlh9g528qov8scshet3abdaicrhtl3', '2023-06-25'),
(180, '::1', 'Windows 10', 59, '5jrlh9g528qov8scshet3abdaicrhtl3', '2023-06-25'),
(181, '::1', 'Windows 10', 59, 'kgo1flj9f5jko3fp9aum2gog7bvj4mdu', '2023-06-25'),
(182, '::1', 'Windows 10', 59, '97ceh8jmdohjqhimv4qj0fu82t9of6jl', '2023-06-25'),
(183, '::1', 'Windows 10', 59, 'dktn5eq250h1a4q220audnc40a2qf5m2', '2023-06-25'),
(184, '::1', 'Windows 10', 59, 'pd0k8vjumnvkugtho63j4gkoj2qjbln4', '2023-06-25'),
(185, '::1', 'Windows 10', 59, 'f8mlddnantla0bcil9ma3lo8g7m7h39r', '2023-06-25'),
(186, '::1', 'Windows 10', 59, 'k9guiv1gpgv21u608gtr1hdasvgs8gqd', '2023-06-25'),
(187, '::1', 'Windows 10', 59, 'ts9el33qb4b854llqop9dmjlbtir45ic', '2023-06-25'),
(188, '::1', 'Windows 10', 59, 'rhipvukk8qesuaea3e3kub3r8vou9hh6', '2023-06-25'),
(189, '::1', 'Windows 10', 59, 'njd0t8md4837et594j83tkqb10ml6sm5', '2023-06-25'),
(190, '::1', 'Windows 10', 59, 'ca3dkcglrk43miema3vd42mid4tnp3ga', '2023-06-25'),
(191, '::1', 'Windows 10', 59, 'b1bthd8udsl8ufmo0mf9fb4ip4a8shtk', '2023-06-25'),
(192, '::1', 'Windows 10', 59, '6dtajpn1ltb3qj33t0d7brjulhf8oibi', '2023-06-25'),
(193, '::1', 'Windows 10', 59, 't6tmkueaidf14njc4oppq9b2ib43vabb', '2023-06-25'),
(194, '::1', 'Windows 10', 59, '53co0gp87ds5vuoedha3dm7e45d7jjh5', '2023-06-25'),
(195, '::1', 'Windows 10', 64, '53co0gp87ds5vuoedha3dm7e45d7jjh5', '2023-06-25'),
(196, '::1', 'Windows 10', 64, '638e76p8iminiamhfmsu6m1p5qr2haej', '2023-06-25'),
(197, '::1', 'Windows 10', 59, '8p53jnfd7smqd9nqqgna180kkcss7v32', '2023-06-25'),
(198, '::1', 'Windows 10', 64, '803ojn69085it827g4379rank65cnlf9', '2023-06-25');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `maps_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `maps_id`, `users_id`, `rating`, `created_at`, `updated_at`) VALUES
(1, 58, 8, 4.3, '2022-08-29 18:10:47', '2022-08-29 18:10:59'),
(2, 59, 10, 4.4, '2022-08-31 00:56:17', '2022-08-31 00:56:17'),
(3, 61, 10, 4.6, '2022-08-31 00:57:01', '2022-08-31 00:57:01'),
(4, 60, 10, 4.8, '2022-09-01 19:41:21', '2022-09-01 19:41:21'),
(5, 59, 11, 4.5, '2022-09-01 19:44:00', '2022-09-01 19:44:00'),
(6, 61, 23, 4.6, '2022-09-01 22:15:21', '2022-09-01 22:15:31'),
(7, 62, 23, 4.7, '2022-09-01 22:16:44', '2022-09-01 22:16:44'),
(8, 59, 24, 4.7, '2022-09-01 22:48:20', '2022-09-01 22:48:27'),
(9, 60, 24, 4.6, '2022-09-01 22:48:55', '2022-09-01 22:48:55'),
(10, 63, 24, 4.5, '2022-09-01 22:49:14', '2022-09-01 22:49:14'),
(11, 61, 24, 3.2, '2022-09-01 22:49:29', '2022-09-01 22:49:45'),
(12, 64, 24, 4.4, '2022-09-01 22:49:57', '2022-09-01 22:49:57'),
(13, 62, 24, 4.5, '2022-09-01 22:50:11', '2022-09-01 22:50:11'),
(14, 67, 24, 4.6, '2022-09-01 22:50:24', '2022-09-01 22:50:24'),
(15, 67, 9, 2.3, '2022-09-05 17:05:18', '2022-09-05 17:06:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `hak_akses` enum('admin','user') DEFAULT NULL,
  `foto` varchar(150) DEFAULT 'default.png',
  `lasted_login` datetime DEFAULT NULL,
  `status` enum('aktif','tidak_aktif') DEFAULT NULL,
  `reset_token` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `username`, `email`, `password`, `hak_akses`, `foto`, `lasted_login`, `status`, `reset_token`, `created_at`, `updated_at`) VALUES
(1, 'Ade Rahman', 'ade', 'ade@gmail.com', '$2y$10$G.gYDIY.8JzvlctHGkdPPOx2ScNveDr.2omDQJQhfMLkFci6ZNt/C', 'admin', '1661159971_7c3908860d247b50112f.png', '2022-07-24 02:31:46', 'aktif', NULL, '2022-07-24 02:31:53', '2022-08-01 22:40:31'),
(6, 'Fitriyani', 'jabrik3111@gmail.com', 'jabrik3111@gmail.com', '$2y$10$qZRmzqhzCWGr/0OT2GI3F.ug/wL4bZzjD9KrE4TB0IbBINlCTm9Di', 'user', 'default.png', '2022-08-01 00:06:06', 'aktif', '33974388087acd0fb77e6c63af69e8086a63ae4de067f4e8d757c4c8e647cd874280a0c89eadfc500a0da9c28a99a014e05b751fc54981656cfc7005c2eb324523001cc76d5939e7bad4dca3f4db71403a353b3ea12ef1befb6639896caea8c776afd8d1', '2022-07-25 01:36:45', '2022-08-28 22:27:25'),
(7, 'Shawn C. Graham', '123', 'rivaldoadistama666@gmail.com', '$2y$10$G43WW7aUqKNjEMrP7ag9auDdpx6jE2Rf5SB7TU99n/yN2ZN6g6rmK', 'user', 'no-image.jpg', NULL, 'aktif', 'e32debc1659349c52f2c614ea86abf9eef9593436520917f9bb328901f4aa5543d3ce0f265ffa65a550a4b5a4130cb9cb693564dde86a62c43a56030870f036478e206fc0272369e427287638c325d247c08e91d11208564cc4f4b83e10b8b7065d4445723a19e267ed67f4d', '2022-08-22 15:38:34', '2022-08-22 15:43:00'),
(8, 'Ade Dwi Putra, M.Kom.', 'adedwiputra', 'adedwiputra@teknokrat.ac.id', '$2y$10$VQUFC0w/uBga1HtBmkQ7VOMoJ1R7QNMfh09gAcVtec7GwRM/BJwOm', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-08-29 18:08:39', NULL),
(9, 'Rivaldo adistama', 'Rivaldo', 'rivaldo_adistama@teknokrat.ac.id', '$2y$10$nVGSXT3lNf8OiNxxbEItjewsMgyxgdHkIBQ57qU5Mr6FGdbT4KiH.', 'admin', '1661876076_08e5849499cd42da6bac.jpg', NULL, 'aktif', NULL, '2022-08-30 23:14:36', '2022-09-13 21:32:30'),
(10, 'Dwi Oktaviani', 'Dwi', 'dwioktaa99@gmail.com', '$2y$10$Qv2X1JZxX9at7.P3CcMHYubyyclhFrg11lrwZj4LK7ny8AbRx5Oge', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-08-31 00:55:48', NULL),
(11, 'M Ridho Diontoro Susanto', 'Readdo', 'ridhodiontoro11@gmail.com', '$2y$10$vs88ToNYZM.v23ZF8wScQuDuJ2YE/NMFzCe4Ioc4AkrI7zRRwiBV2', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-09-01 19:43:25', '2022-09-09 12:48:35'),
(12, 'Mariza anggun Pertiwi', 'Mariza Anggun', 'marizaanggunpertiwi24@gmail.com', '$2y$10$KG2QRJH/GiNwIITpJ9YAuOUePh.5pP4ihlE6whLHNSTw3SZZ2FckC', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-09-01 19:46:59', NULL),
(13, 'elipurwanti', 'eli', 'elipurwanti2019@gmail.com', '$2y$10$mOn4x3agwVi6siu6hT5xouExKc0vlwcQJDw6kWq8BpPKjoFVH1NVG', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-09-01 19:48:19', NULL),
(14, 'Zainun Nizam', 'Nizam', 'Zainunnizam2811@gmail.com', '$2y$10$bonoTJyuMcFlARKB.sUrb.0cUZ5tk/Nd2dMHNh3AUqxQTNVBWTuKW', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-09-01 19:53:58', NULL),
(15, 'M Raffy Aditias Susanto', 'Toplek', 'raffyaditias182@gmail.com', '$2y$10$hFW10MEPgem9ehm7xl5GbedVSACcHYxYdFCVeKpYptszORvoCoEvW', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-09-01 20:02:44', NULL),
(16, 'Adelia Caroline Kusdiamurti ', 'Adelia Caroline ', 'adeliacaroline99@gmail.com', '$2y$10$Rxmwiq2Vz9yjM7jsukP8ceMWzfaQgYL.dCGaYlQd/fbPArPu2ZjiK', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-09-01 20:03:27', NULL),
(17, 'Dwi Ayu Suryani ', 'ayuuadz', 'dwiayusuryani19@gmail.com', '$2y$10$Yc4IJo1C13dKLnmhn0OK2eIIFmOT5hwUKVhxZtEZm3ErRwg9qfqiK', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-09-01 20:04:09', NULL),
(18, 'Rexy', 'rexyf', 'rexy_fahrezi@teknokrat.ac.id', '$2y$10$OCI8t8tcnmhZgaGKgKPShOHp2MRCOx.pvO2xeNBLXWTBAyYfmLwD6', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-09-01 20:11:13', NULL),
(19, 'Mutiara', 'Mutiararx', 'Mutiararx22@gmail.com', '$2y$10$yn78yDpaFDyTc24BBcEy2.jXX6XzmrdtkW30IAqEfgTgg/G/r8wI.', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-09-01 20:18:42', NULL),
(20, 'Naya vania', 'Cutieenaayy', 'nayavania28@gmail.com', '$2y$10$N7xFy5WBA978D6Bt2C0Tv.E93jHoeoiJHhEJvCpUorDt182g7S9eG', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-09-01 20:28:09', NULL),
(21, 'Miftachul huda ', 'Huda ', 'miftachulhuda559@gmail.com', '$2y$10$yUzGaHuYzRJ35fur4rIPHusYfl.f/esT9U.UZ.ItFF.8oqMv1diFO', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-09-01 21:55:58', NULL),
(22, 'Adinzie', 'dinzie', 'dndptr2@gmail.com', '$2y$10$iaGSsD.8ddlE8DOOOENDnOUAMvIi/2PumR2pbIdLiDjexShZxOX5y', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-09-01 22:02:06', NULL),
(23, 'Fannia Nurul Isnina', 'fanniaisnn', 'fannia.nurul07@gmail.com', '$2y$10$Be2FGpwnrqOy4/08C7wozuoIxgXpfEEpWl0LNlC5ape2yKqKWRkrO', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-09-01 22:11:20', NULL),
(24, 'Yunita Ambarwati', 'Yunitaaw15', 'Wayunita15@gmail.com', '$2y$10$yA6SCPb0QXThiRDPRUzLU.6f3GVzv2etWxe7DUNHxLMgrM27oT9YG', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-09-01 22:47:55', NULL),
(25, 'Kencah Yanti', 'Ken', 'kencahyanti8@gmail.com', '$2y$10$PIiy6Omw0u8MEaVsGcizIuX24pn.nY8QGFWtSDusdeSx.ZYXHsDGq', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-09-01 23:14:23', NULL),
(26, 'Fajar Kurniawan', 'Jar', 'fajarrr.k25@gmail.com', '$2y$10$kaMUKNAVAatfH7JcX47bHeEMITw7nsUowsYqZ9C0C3q71CxcQ5RZm', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-09-01 23:24:14', NULL),
(27, 'M Rizal', 'Stevano', 'aaidygemilang@gmail.com', '$2y$10$B39PWDL8WfX0K4ppAGyUa.Id0KlvV2myygw4Oz4SnZR8WPTL0hyQK', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-09-02 08:27:18', NULL),
(28, 'Virgia Wulandari', 'Virgia', 'virgia34@gmail.com', '$2y$10$gFdcVSUzTHgQFgtIl6hAR.KUviNZHqAuap0pY.E.da8JeydrTqpIm', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-09-02 10:23:27', NULL),
(29, 'Rieschaoe', 'Rieschaoe', 'Rieschautami12@gmail.com', '$2y$10$UNnQve/ITe2Y7wsVRTQ2ZOH2KLWObIjBkA36zE4ORHwXgb7W5h8iS', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-09-02 10:35:04', NULL),
(30, 'Dinda Ayu Paraswati', 'Dindaayu', 'Ayuparaswatidinda@gmail.com', '$2y$10$1GlsyWrDhvHx8cv.hEUKaO5QyM2ZxAWEDY7.Qsqj3Xb5Lh3ab0enS', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-09-02 11:26:08', NULL),
(31, 'Vivi Arum Rumaisih', 'Viviarum', 'Vivi_arum_rumaisih@teknokrat.ac.id', '$2y$10$wXAbdI24rgOYNSgA76s/ROeZf8VJ86L2ghq8BUfUq/pXg3CfkHD6C', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-09-04 10:20:41', NULL),
(32, 'Ardy Fernando ', 'Ardy', 'ardyfernandoajja00@gmail.com', '$2y$10$P8GxHO2jBW0FiKg1FLThT.DJKA4s8dNE6yg.Tgj3wKEGPpgPM6DM6', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2022-09-05 18:54:42', NULL),
(33, 'dedi irawan', 'dediaye', 'dediaye@gmail.com', '$2y$10$1g4vplQz32Qcco4DTotZUeHe8wL8rtZBq9CWFVgzqYY/56iQRvEl.', 'admin', 'no-image.jpg', NULL, 'aktif', NULL, '2023-06-10 06:37:21', '2023-06-22 07:05:57'),
(34, 'Tia Pratiwi', 'nana123', 'nana12@gmail.com', '$2y$10$WTd1gp7gXz3umXlZRcZM7.CVeCCXcWrIE1zsnEo5KOKqs9ShxLdb2', 'user', '1687354091_33ec84faccc77c40dcaa.png', NULL, 'aktif', NULL, '2023-06-11 11:14:32', '2023-06-21 14:46:43'),
(35, 'aji', 'aji123', 'aji123@gmial.com', '$2y$10$SfGDYcrwJeHW15ivi6KCPuY0KAVsda4F1weVVyhF..UoGq62lEW8.', 'user', 'no-image.jpg', NULL, 'aktif', NULL, '2023-06-15 03:36:53', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galery`
--
ALTER TABLE `galery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `graphs`
--
ALTER TABLE `graphs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manajemen_sistem`
--
ALTER TABLE `manajemen_sistem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maps`
--
ALTER TABLE `maps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengunjung`
--
ALTER TABLE `pengunjung`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `galery`
--
ALTER TABLE `galery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `graphs`
--
ALTER TABLE `graphs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=596;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `manajemen_sistem`
--
ALTER TABLE `manajemen_sistem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `maps`
--
ALTER TABLE `maps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `pengunjung`
--
ALTER TABLE `pengunjung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
