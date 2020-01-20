-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2019 at 04:23 AM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `accessiv_db`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `GetDistance` (`startLat` DOUBLE, `startLong` DOUBLE, `endLat` DOUBLE, `endLong` DOUBLE) RETURNS DOUBLE BEGIN
    DECLARE dLat double;
    DECLARE dLong double;
    DECLARE a double;
    DECLARE c double;
 	
    SET dLat = RADIANS(endLat - startLat);
    SET dLong = RADIANS(endLong - startLong);

    SET startLat = RADIANS(startLat);
    SET endLat = RADIANS(endLat);

    SET a= POW(SIN(dLat/2),2) + COS(startLat) * COS(endLat) * POW(SIN(dLong/2),2);
    SET c= 6371*(2 * ATAN2(SQRT(a), SQRT(1-a)));
 
 RETURN (c);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` varchar(36) NOT NULL,
  `category_name` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `created`) VALUES
('3aead3da-1c26-4f12-be8d-b234d38146e3', 'Perkantoran', '2019-09-16 04:57:35'),
('56fc00da-a3eb-48bd-acaf-1c147541ad13', 'Restoran', '2019-09-15 06:53:36'),
('580308ae-4fc3-4008-b8ac-48c99f64dd7c', 'Kantor Pemerintahan', '2019-09-16 04:56:39'),
('650b610d-5e4f-4514-ae21-c6db73560450', 'Pusat Perbelanjaan', '2019-09-15 06:53:36'),
('7dd30202-98fb-47b7-b1a6-7dd00ef308e6', 'Museum', '2019-06-28 12:07:38'),
('9047fe47-788d-4a3d-a4f2-b956807537ef', 'Perpustakaan', '2019-09-23 03:01:29'),
('9f423ae3-26d4-467a-81dc-b51c42eee585', 'Cafe', '2019-09-13 14:26:45'),
('bb275d71-7e8c-4b89-9b1c-1cf724350986', 'Bandara', '2019-09-15 06:06:09'),
('cde95062-2464-4d47-a690-2fe5812d458a', 'Stasiun', '2019-09-13 14:26:45'),
('d1613721-d30c-4d1e-a2f5-3633bf8488f6', 'Hotel', '2019-06-28 12:07:38'),
('d361128f-336d-4702-9338-94147aba5de0', 'Auditorium', '2019-09-23 02:39:28'),
('ddb59eb3-d7a8-442c-b271-0acac48ada48', 'Bioskop', '2019-09-16 04:56:39'),
('e200fe38-18cd-41b3-892a-9730876f775b', 'Toko', '2019-09-16 04:57:35'),
('e85ce4a2-d7d9-44b8-8218-dbd0921b569f', 'Universitas', '2019-06-28 12:07:38'),
('ead19f66-5448-4d47-adf7-36197cea9900', 'Rumah Sakit', '2019-09-15 06:06:09');

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `facility_id` varchar(36) NOT NULL,
  `facility_name` text NOT NULL,
  `facility_info` text NOT NULL,
  `facility_icon` text NOT NULL,
  `facility_unavailable_icon` text NOT NULL,
  `facility_unknown_icon` text NOT NULL,
  `facility_order` int(2) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`facility_id`, `facility_name`, `facility_info`, `facility_icon`, `facility_unavailable_icon`, `facility_unknown_icon`, `facility_order`, `created`, `modified`) VALUES
('756832c6-a724-4bab-902c-e84aea4031de', 'Elevator', 'Untuk menuju lantai diatasnya atau dibawahnya', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FElevator%20Icon.png?alt=media&token=411b05ed-423c-459d-bbff-2f3bdb6936c1', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FElevator-Icon-Not-Available.png?alt=media&token=30158300-d7aa-4456-a2f0-d5db5c067486', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FElevator-Icon-Uknown.png?alt=media&token=0bacb687-0ada-461c-94e6-e1f27ddc5ab6', 3, '2019-07-01 10:12:06', '2019-07-01 10:12:06'),
('7dd30202-98fb-47b7-b1a6-7dd00ef308e6', 'Ramp', 'Jalan landai untuk menaiki tangga', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FRamp%20Icon.png?alt=media&token=aa6eb686-63fd-420d-bf25-4e0569d5d40a', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FRamp-Icon-Not-Available.png?alt=media&token=c769faf5-fc64-4c0d-a28d-29a0c5e2b90e', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FRamp-Icon-Uknown.png?alt=media&token=d0d4e067-15bf-4c82-b178-05bb7177aa83', 2, '2019-07-01 10:12:06', '2019-07-01 10:12:06'),
('ac5d89b8-fcd6-4b00-841a-beecc0eaf66a', 'Parkir Prioritas', 'Tempat parkir yang khusu disediakan untuk disabilitas atau tempat parkir luas', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FParking%20Icon.png?alt=media&token=fc79c5c6-e03d-44f4-8afe-07b5c8c0d6d5', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FParking-Icon-Not-Available.png?alt=media&token=d6a3fd83-a195-4a70-9423-9b9a6f4ff9b0', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FParking-Icon-Uknown.png?alt=media&token=3aa5877b-e57f-467a-ad12-b1be90ec875b', 1, '2019-07-01 10:12:06', '2019-07-01 10:12:06'),
('baf44ff2-8858-4b35-94e3-1bb8a75521cf', 'Toilet', 'Toilet khusu untuk disabilitas', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FToilet%20Icon.png?alt=media&token=2eb4f584-7d2b-4e56-b393-d4937ebda7d7', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FToilet-Icon-Not-Available.png?alt=media&token=ccd5e841-6106-4d9f-873e-9cd50c022ea1', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FToilet-Icon-Unknown.png?alt=media&token=263de7ae-738d-4bfa-99bb-0660de93d57e', 4, '2019-07-01 10:12:06', '2019-07-01 10:12:06'),
('cd2fb815-6c41-468b-9bbe-d0e67def7ee0', 'Kursi Prioritas', 'Kursi yang disediakan khusu untuk disabilitas', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FSeat-Icon.png?alt=media&token=c39565fb-d8f5-4036-9cdb-de02a40f084e', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FSeat-Icon-Not-Available.png?alt=media&token=2423381a-7dec-48fa-8184-dd3ac8064e83', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FSeat-Icon-Uknown.png?alt=media&token=0cb9bb15-10ec-4956-b77e-e8b5bd4acbfc', 5, '2019-07-01 10:12:06', '2019-07-01 10:12:06');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `place_id` varchar(36) NOT NULL,
  `parent_place_id` varchar(36) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `website` text DEFAULT NULL,
  `category_id` varchar(36) DEFAULT NULL,
  `average_rating` double DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`place_id`, `parent_place_id`, `title`, `latitude`, `longitude`, `address`, `phone_number`, `website`, `category_id`, `average_rating`, `is_verified`, `is_deleted`, `created`, `modified`) VALUES
('05a942fc-6fd4-4feb-a2c6-642505fbf206', NULL, 'de mata eye museum', -7.8154509555528, 110.3879763186, 'Jalan Veteran 184 B, Pandeyan, Kecamatan Umbulharjo, Daerah Istimewa Yogyakarta', NULL, NULL, '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', NULL, 1, 0, '2019-09-25 12:07:25', '2019-09-25 12:07:25'),
('09853659-da52-4d49-8324-e7f47ea5c4a3', NULL, 'Upnormal Coffee Roasters Kaliurang', -7.757118, 110.383069, 'Baturetno, Kecamatan Banguntapan, Daerah Istimewa YogyakartaJl. Kaliurang No.KM 5.6, Manggung, Caturtunggal, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281', '(0274) 5016382', 'warunkupnormal.com', '9f423ae3-26d4-467a-81dc-b51c42eee585', 3, 1, 0, '2019-09-08 14:27:56', '2019-09-08 14:27:56'),
('0e80ec86-fd7c-40fb-a797-0a2767f402c4', NULL, 'Alun alun', -7.8083057615959, 110.36268677562, 'Jalan Magangan Kulon 1, Panembahan, Kecamatan Kraton, Daerah Istimewa Yogyakarta', NULL, NULL, '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', 4, 1, 0, '2019-09-25 10:04:40', '2019-09-25 10:04:40'),
('194a1741-cd2f-4add-8c67-276d685d5d32', NULL, 'Fakultas MIPA UGM', -7.76724285, 110.37661363, 'Sekip Utara Bulaksumur, Kotak Pos 21, Senolowo, Sinduadi, Kec. Mlati, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281', '(0274) 513339\r\n', 'mipa.ugm.ac.id', 'e85ce4a2-d7d9-44b8-8218-dbd0921b569f', 4.666666666, 1, 1, '2019-07-25 03:03:32', '2019-09-14 08:01:55'),
('1cc5e1e9-21d2-4504-8223-f6a9b72772e5', NULL, 'Fakultas Fisipol UGM', -7.769437, 110.379732, 'Bulaksumur, Yogyakarta', '(0274) 563362', 'fisipol.ugm.ac.id', 'e85ce4a2-d7d9-44b8-8218-dbd0921b569f', 3.676470588, 1, 0, '2019-07-23 05:03:37', '2019-08-07 04:57:08'),
('23ceae15-6f80-45cf-a418-e29171a600cb', NULL, 'Stasiun Tugu Jogja', -7.789625, 110.363322, 'Jalan Pringgokusuman Stasiun Yogyakarta, Pringgokusuman, Gedong Tengen, Daerah Istimewa Yogyakarta', NULL, NULL, 'cde95062-2464-4d47-a690-2fe5812d458a', 4, 1, 0, '2019-09-13 07:08:44', '2019-09-13 07:08:44'),
('259476b7-d360-4cfb-907d-a9187a3c2c90', NULL, 'Jogja Bay', -7.7468612299987, 110.41913419962, 'Jalan Raya Candi Indah Jalan Raya Candi Indah, Wedomartani, Kecamatan Ngemplak, Daerah Istimewa Yogyakarta', '98656', NULL, '650b610d-5e4f-4514-ae21-c6db73560450', 3, 1, 0, '2019-09-25 11:45:08', '2019-09-25 11:45:08'),
('2e99cfb8-ddac-458f-8f95-126d6f589a67', NULL, 'Monumen Jogja Kembali', -7.749739, 110.369542, 'Jl. Ringroad Utara, Jongkang, Sariharjo, Kec. Ngaglik, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55581', '(0274) 868225', NULL, '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', 3, 1, 0, '2019-09-08 15:17:57', '2019-09-08 15:17:57'),
('34368e50-bfe3-45cf-b23b-e692b65c9679', NULL, 'Rumah Sakit UGM', -7.743112, 110.350305, 'Jalan Mandala I Jalan Mandala I, Sardonoharjo, Kecamatan Ngaglik, Daerah Istimewa Yogyakarta', '15555215554', NULL, 'ead19f66-5448-4d47-adf7-36197cea9900', 5, 1, 1, '2019-09-04 03:52:11', '2019-09-15 02:26:06'),
('46af3f83-f078-4349-b12a-c27c490cde67', NULL, 'Perpustakaan UGM', -7.769325, 110.378094, 'L1, Caturtunggal, Kecamatan Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55282Universitas Gadjah Mada, Jl. Bulak Sumur, Karang Malang, Caturtunggal, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281', '(0274) 513163', 'lib.ugm.ac.id', '9047fe47-788d-4a3d-a4f2-b956807537ef', 4, 1, 0, '2019-07-17 01:10:01', '2019-08-01 15:26:43'),
('5100873c-8394-489d-a2fd-6ff8b68719e1', '34368e50-bfe3-45cf-b23b-e692b65c9679', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2019-09-15 02:22:32', '2019-09-15 02:26:06'),
('6b20e27f-6515-4be8-9244-7dd5dd1bad32', NULL, 'GSP', -7.770298, 110.377851, 'di UGM', NULL, NULL, 'd361128f-336d-4702-9338-94147aba5de0', 4, 1, 0, '2019-07-31 17:58:52', '2019-09-27 02:22:51'),
('81de5416-65be-42e5-b240-93c56d1ce515', NULL, 'Taman Pintar', -7.800808, 110.367381, 'Jl. Panembahan Senopati No.1-3, Ngupasan, Kec. Gondomanan, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55122', '(0274) 583631', '\r\ntamanpintar.co.id', '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', 4, 1, 0, '2019-09-04 03:39:37', '2019-09-08 13:58:22'),
('90453ecc-8814-4545-8e04-ee9e4b767416', NULL, 'Merapi Museum', -7.61601, 110.424385, 'Jl. Kaliurang No.Km, Banteng, Hargobinangun, Kec. Pakem, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55582', '(0274) 896498', '', '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', 3, 1, 0, '2019-07-23 09:54:28', '2019-09-23 14:06:06'),
('93c122a3-5889-415b-8580-71f6ce95c99f', '90453ecc-8814-4545-8e04-ee9e4b767416', 'Indoneziya', NULL, NULL, 'Sovytsky Soyuz', NULL, NULL, NULL, NULL, 0, 1, '2019-08-05 00:43:15', '2019-09-13 01:44:46'),
('9d9621f1-4189-462f-adc6-fe471fed313a', NULL, 'KFC UGM', -7.77594, 110.374612, 'Jl. C. Simanjuntak No.72A, Terban, Kec. Gondokusuman, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55221', '(0274) 563920', 'kfcku.com', '56fc00da-a3eb-48bd-acaf-1c147541ad13', 4.4, 1, 0, '2019-06-24 20:59:45', '2019-08-01 12:22:16'),
('a84a220c-a34f-4973-be37-167250b1e567', NULL, 'Alun Alun Kota jogja', -7.8083057615959, 110.36268677562, 'Jalan Magangan Kulon 1, Panembahan, Kecamatan Kraton, Daerah Istimewa Yogyakarta', NULL, NULL, '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', 4, 1, 0, '2019-09-25 10:03:12', '2019-09-25 10:03:12'),
('b7e5c50b-6b7c-4435-bd35-0f8628d5d363', NULL, 'Sleman City Hall', -7.720131, 110.361931, 'Jl. Magelang KM 9.6 No.18, Penggung, Tridadi, Kec. Sleman, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55511', '(0274) 8609378', 'slemancityhall.com', '650b610d-5e4f-4514-ae21-c6db73560450', 3, 1, 0, '2019-06-28 06:22:25', '2019-08-01 12:37:26'),
('c0337782-4741-42f6-be6b-e865ba38e802', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'UGMMM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2019-08-01 17:31:20', '2019-08-01 17:31:20'),
('d2bbc816-33cc-4060-bf45-eb14ffd8bf2e', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'Gadjah Mada University', NULL, NULL, NULL, '293291', NULL, NULL, NULL, 0, 0, '2019-07-28 02:34:23', '2019-07-29 12:32:00'),
('dcbf6e3f-3fbd-42b5-819e-672807db8e5e', '6b20e27f-6515-4be8-9244-7dd5dd1bad32', 'GSP', NULL, NULL, 'di UGM', NULL, '', NULL, NULL, 0, 1, '2019-09-27 02:13:29', '2019-09-27 02:22:51'),
('df89782b-2a17-43fe-9ca9-90d48226cb51', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'Impression', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2019-08-04 10:40:52', '2019-08-04 10:40:52'),
('f1828692-9521-41ee-9bfe-7e5803f3d38f', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2019-08-04 09:13:37', '2019-08-04 09:13:37');

-- --------------------------------------------------------

--
-- Table structure for table `place_facilities`
--

CREATE TABLE `place_facilities` (
  `place_facility_id` varchar(36) NOT NULL,
  `parent_place_facility_id` varchar(36) DEFAULT NULL,
  `facility_id` varchar(36) DEFAULT NULL,
  `place_id` varchar(36) DEFAULT NULL,
  `is_facility_available` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `place_facilities`
--

INSERT INTO `place_facilities` (`place_facility_id`, `parent_place_facility_id`, `facility_id`, `place_id`, `is_facility_available`, `is_deleted`, `created`, `modified`) VALUES
('025c7199-dcb5-4fac-b6d1-01e9151afad1', NULL, 'cd2fb815-6c41-468b-9bbe-d0e67def7ee0', '23ceae15-6f80-45cf-a418-e29171a600cb', 1, 0, '2019-09-13 07:08:44', '2019-09-13 07:08:44'),
('048c49c0-f779-4a24-924e-34cb06339941', NULL, '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', '0e80ec86-fd7c-40fb-a797-0a2767f402c4', 1, 0, '2019-09-25 10:04:40', '2019-09-25 10:04:40'),
('05fda53e-c5ac-46d3-b298-d1da5a159eae', NULL, 'cd2fb815-6c41-468b-9bbe-d0e67def7ee0', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 1, 0, '2019-08-04 10:40:52', '2019-09-15 07:34:46'),
('09e8c236-e251-4612-a5d0-c062808b8faf', '1ac6f7e9-e87a-49af-8736-a129a326bf0d', NULL, 'dcbf6e3f-3fbd-42b5-819e-672807db8e5e', 1, 1, '2019-09-27 02:13:29', '2019-09-27 02:22:51'),
('0b892d6d-973e-4e71-a556-4c4e77b3b8b5', NULL, '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', '194a1741-cd2f-4add-8c67-276d685d5d32', 1, 0, '2019-09-14 02:19:15', '2019-09-14 02:19:15'),
('0bcef9e6-e235-4c14-91c1-0f199769bede', NULL, 'cd2fb815-6c41-468b-9bbe-d0e67def7ee0', '0e80ec86-fd7c-40fb-a797-0a2767f402c4', 1, 0, '2019-09-25 10:04:41', '2019-09-25 10:04:41'),
('11919f8d-e300-4212-b1d5-e73dbef010ec', NULL, 'baf44ff2-8858-4b35-94e3-1bb8a75521cf', '2e99cfb8-ddac-458f-8f95-126d6f589a67', 0, 0, '2019-09-15 08:12:10', '2019-09-15 08:12:10'),
('13534256-117c-45d1-b1f8-961743f0a104', NULL, '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', '2e99cfb8-ddac-458f-8f95-a76d6f589a67', 1, 0, '2019-09-08 15:04:58', '2019-09-08 15:04:58'),
('1970e45a-9e64-423d-91eb-806e7543f08d', NULL, '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', '2e99cfb8-ddac-458f-8f95-126d6f589a67', 0, 0, '2019-09-15 08:12:10', '2019-09-15 08:12:10'),
('1ac6f7e9-e87a-49af-8736-a129a326bf0d', NULL, 'baf44ff2-8858-4b35-94e3-1bb8a75521cf', '6b20e27f-6515-4be8-9244-7dd5dd1bad32', 1, 0, '2019-09-15 08:14:49', '2019-09-27 02:22:51'),
('1ca66a22-ff34-4056-9cd9-5114f34852c5', NULL, 'ac5d89b8-fcd6-4b00-841a-beecc0eaf66a', '194a1741-cd2f-4add-8c67-276d685d5d32', 0, 1, '2019-07-25 03:03:32', '2019-08-12 01:07:53'),
('20ab94cb-6e02-4dd8-a80d-f20db68ff727', NULL, '756832c6-a724-4bab-902c-e84aea4031de', '34368e50-bfe3-45cf-b23b-e692b65c9679', 1, 0, '2019-09-15 02:22:32', '2019-09-15 02:26:06'),
('24772a16-9b55-44c2-a999-0b2b126c31a0', NULL, 'cd2fb815-6c41-468b-9bbe-d0e67def7ee0', '2e99cfb8-ddac-458f-8f95-126d6f589a67', 0, 0, '2019-09-17 03:46:34', '2019-09-17 03:46:34'),
('26dbc041-d1ce-463f-a566-6e5dd1b6befd', NULL, 'ac5d89b8-fcd6-4b00-841a-beecc0eaf66a', '23ceae15-6f80-45cf-a418-e29171a600cb', 1, 0, '2019-09-17 03:47:42', '2019-09-17 03:47:42'),
('2bceab7f-f5f3-4709-8e90-baa380889a80', NULL, 'baf44ff2-8858-4b35-94e3-1bb8a75521cf', '46af3f83-f078-4349-b12a-c27c490cde67', 1, 0, '2019-09-17 03:44:25', '2019-09-17 03:44:25'),
('2efc494f-353b-41c6-b395-a03df4233f78', NULL, 'ac5d89b8-fcd6-4b00-841a-beecc0eaf66a', '259476b7-d360-4cfb-907d-a9187a3c2c90', 1, 0, '2019-09-25 11:45:09', '2019-09-25 11:45:09'),
('3369b3d1-efe0-48d5-9385-a06d789f2593', NULL, 'ac5d89b8-fcd6-4b00-841a-beecc0eaf66a', '34368e50-bfe3-45cf-b23b-e692b65c9679', 1, 0, '2019-09-15 08:12:38', '2019-09-15 08:12:38'),
('360ead64-bcb5-42e3-921a-44a8c7975415', NULL, '756832c6-a724-4bab-902c-e84aea4031de', '194a1741-cd2f-4add-8c67-276d685d5d32', 1, 0, '2019-07-25 03:03:32', '2019-09-14 02:19:15'),
('37cad1b7-1361-4ab6-9d0b-93cbb499c434', NULL, 'baf44ff2-8858-4b35-94e3-1bb8a75521cf', 'b7e5c50b-6b7c-4435-bd35-0f8628d5d363', 1, 0, '2019-09-15 12:05:38', '2019-09-15 12:05:38'),
('4250ed78-6f7f-4163-a114-e2f9ba95d98e', NULL, '756832c6-a724-4bab-902c-e84aea4031de', '6b20e27f-6515-4be8-9244-7dd5dd1bad32', 1, 0, '2019-07-31 17:58:52', '2019-09-27 02:22:51'),
('430d5dd6-e454-4159-854b-8bc4d39709b1', NULL, 'cd2fb815-6c41-468b-9bbe-d0e67def7ee0', '9d9621f1-4189-462f-adc6-fe471fed313a', 0, 0, '2019-09-15 08:13:45', '2019-09-15 08:13:45'),
('43278fc5-aea7-4be6-bf2f-bd536d1c0336', NULL, '756832c6-a724-4bab-902c-e84aea4031de', '89ee404f-5197-4603-94ad-0981952ae6cf', 1, 0, '2019-09-18 10:38:38', '2019-09-18 10:38:38'),
('457218e5-085b-4a66-8eef-c063ed063d1b', NULL, 'baf44ff2-8858-4b35-94e3-1bb8a75521cf', '194a1741-cd2f-4add-8c67-276d685d5d32', 1, 0, '2019-07-25 03:03:32', '2019-07-25 03:03:32'),
('508b947b-72ed-4734-aa61-e3484196915d', NULL, 'ac5d89b8-fcd6-4b00-841a-beecc0eaf66a', '0e80ec86-fd7c-40fb-a797-0a2767f402c4', 1, 0, '2019-09-25 10:04:40', '2019-09-25 10:04:40'),
('5b7380de-dd5a-40ca-a1de-68e1085d67bb', NULL, 'baf44ff2-8858-4b35-94e3-1bb8a75521cf', '9d9621f1-4189-462f-adc6-fe471fed313a', 1, 0, '2019-09-15 08:13:45', '2019-09-15 08:13:45'),
('5ba8ddc0-5b20-4e98-a506-0fde3014ecff', NULL, 'ac5d89b8-fcd6-4b00-841a-beecc0eaf66a', 'a84a220c-a34f-4973-be37-167250b1e567', 1, 0, '2019-09-25 10:03:13', '2019-09-25 10:03:13'),
('5e2b4612-6f47-4141-a354-2542799b5829', '360ead64-bcb5-42e3-921a-44a8c7975415', NULL, '139852b8-8ff4-4df9-a80e-db7b4eb892a6', 0, 0, '2019-08-03 05:22:26', '2019-08-03 05:22:26'),
('5f92b335-a33d-4955-9227-29830c81c868', NULL, 'cd2fb815-6c41-468b-9bbe-d0e67def7ee0', 'e36acc3c-5c2e-4997-88e8-ae30a6c21cca', 0, 0, '2019-07-31 17:46:50', '2019-07-31 17:46:50'),
('61786bed-0dce-466f-92f4-b86d719d4554', NULL, 'cd2fb815-6c41-468b-9bbe-d0e67def7ee0', 'f1828692-9521-41ee-9bfe-7e5803f3d38f', 1, 0, '2019-08-04 09:13:37', '2019-08-04 09:13:37'),
('6239bf92-73ef-4515-9a92-e729da282de6', 'f190fdf5-b36d-4821-ad99-c64ea042ada9', NULL, '93c122a3-5889-415b-8580-71f6ce95c99f', 0, 0, '2019-08-05 00:43:15', '2019-08-05 00:43:15'),
('67b13119-c630-4712-8d3e-ae7bebcef001', NULL, 'cd2fb815-6c41-468b-9bbe-d0e67def7ee0', '46af3f83-f078-4349-b12a-c27c490cde67', 1, 0, '2019-09-17 03:44:25', '2019-09-17 03:44:25'),
('6a59455c-0348-4cb8-82e6-e66df61671b9', NULL, '756832c6-a724-4bab-902c-e84aea4031de', '0e80ec86-fd7c-40fb-a797-0a2767f402c4', 0, 0, '2019-09-25 10:04:40', '2019-09-25 10:04:40'),
('6dc4a332-cf37-4115-9724-e1ec0a34ecc6', NULL, 'baf44ff2-8858-4b35-94e3-1bb8a75521cf', 'a84a220c-a34f-4973-be37-167250b1e567', 0, 0, '2019-09-25 10:03:13', '2019-09-25 10:03:13'),
('6de89695-da4c-4f51-ac23-f20b61bf41b6', NULL, 'cd2fb815-6c41-468b-9bbe-d0e67def7ee0', 'b7e5c50b-6b7c-4435-bd35-0f8628d5d363', 0, 0, '2019-09-15 12:05:38', '2019-09-15 12:05:38'),
('6ef9d008-f911-4e86-8f14-fdb289aa04f9', 'fc1d5d23-1b9d-43ff-b50e-4fa0eb0201af', NULL, '139852b8-8ff4-4df9-a80e-db7b4eb892a6', 0, 0, '2019-08-03 05:22:26', '2019-08-03 05:22:26'),
('746b7d62-57d2-4d9c-84ad-5011f9c73244', NULL, 'cd2fb815-6c41-468b-9bbe-d0e67def7ee0', '90453ecc-8814-4545-8e04-ee9e4b767416', 0, 0, '2019-09-15 12:03:06', '2019-09-15 12:03:06'),
('748c8cff-4982-4510-b837-909fbca77b14', NULL, '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', '09853659-da52-4d49-8324-e7f47ea5c4a3', 1, 0, '2019-09-08 14:27:56', '2019-09-08 14:27:56'),
('79047213-e8b8-4c3b-b2f8-5f569bc2fd18', NULL, 'baf44ff2-8858-4b35-94e3-1bb8a75521cf', '81de5416-65be-42e5-b240-93c56d1ce515', 1, 0, '2019-09-17 03:48:04', '2019-09-17 03:48:04'),
('7a84ecfd-d57e-4a60-bccd-b80b14db5c5d', NULL, 'baf44ff2-8858-4b35-94e3-1bb8a75521cf', '23ceae15-6f80-45cf-a418-e29171a600cb', 1, 0, '2019-09-13 07:08:44', '2019-09-13 07:08:44'),
('7fd83ed1-97a7-498d-b233-083cd2e2a4ca', NULL, 'ac5d89b8-fcd6-4b00-841a-beecc0eaf66a', 'b7e5c50b-6b7c-4435-bd35-0f8628d5d363', 1, 0, '2019-09-15 12:05:38', '2019-09-15 12:05:38'),
('83f814de-f3dd-40b3-85b9-3da63531961c', NULL, 'ac5d89b8-fcd6-4b00-841a-beecc0eaf66a', '46af3f83-f078-4349-b12a-c27c490cde67', 1, 0, '2019-09-17 03:44:25', '2019-09-17 03:44:25'),
('8ad8b779-ebfd-4c70-b8b4-02ade1f7810f', NULL, 'ac5d89b8-fcd6-4b00-841a-beecc0eaf66a', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 1, 0, '2019-07-25 01:51:59', '2019-09-15 07:52:08'),
('8c3e8bd0-a2c4-4b08-af1a-f148a3d08fff', NULL, 'baf44ff2-8858-4b35-94e3-1bb8a75521cf', '90453ecc-8814-4545-8e04-ee9e4b767416', 0, 0, '2019-08-05 00:43:15', '2019-09-23 14:06:06'),
('906aa53d-b3ed-4e39-8bee-29f22ff40ad4', NULL, 'baf44ff2-8858-4b35-94e3-1bb8a75521cf', '34368e50-bfe3-45cf-b23b-e692b65c9679', 1, 0, '2019-09-15 02:22:32', '2019-09-15 02:26:06'),
('9322c3ee-b970-4162-a9b5-3317e5cdd319', NULL, 'cd2fb815-6c41-468b-9bbe-d0e67def7ee0', '34368e50-bfe3-45cf-b23b-e692b65c9679', 1, 0, '2019-09-15 08:12:38', '2019-09-15 08:12:38'),
('9545f2e2-1ba7-4baf-a77c-397655ab0fbe', '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', NULL, '34368e50-bfe3-45cf-b23b-e692b65c9679', 0, 0, '2019-09-04 03:52:11', '2019-09-04 03:52:11'),
('962c1261-c807-4124-a330-5f888c8964b4', NULL, '756832c6-a724-4bab-902c-e84aea4031de', '05a942fc-6fd4-4feb-a2c6-642505fbf206', 1, 0, '2019-09-25 12:07:25', '2019-09-25 12:07:25'),
('97dd74c3-2180-452e-b8e8-07ac397f727d', NULL, 'baf44ff2-8858-4b35-94e3-1bb8a75521cf', '09853659-da52-4d49-8324-e7f47ea5c4a3', 0, 0, '2019-09-08 14:27:56', '2019-09-17 03:47:02'),
('9f611402-97fc-4811-99e5-b499155db726', NULL, '756832c6-a724-4bab-902c-e84aea4031de', 'b7e5c50b-6b7c-4435-bd35-0f8628d5d363', 1, 0, '2019-09-15 12:05:38', '2019-09-15 12:05:38'),
('a09d8776-38e8-4a20-a727-ca3598147ac8', NULL, '756832c6-a724-4bab-902c-e84aea4031de', '46af3f83-f078-4349-b12a-c27c490cde67', 1, 0, '2019-07-16 04:04:41', '2019-07-16 04:04:41'),
('a262d2f8-dbfb-4ba4-9fbd-e972f86dbb63', NULL, 'baf44ff2-8858-4b35-94e3-1bb8a75521cf', '0e80ec86-fd7c-40fb-a797-0a2767f402c4', 0, 0, '2019-09-25 10:04:41', '2019-09-25 10:04:41'),
('a57fe752-8c91-4e3f-b44d-d6f3b9a0f742', NULL, 'cd2fb815-6c41-468b-9bbe-d0e67def7ee0', 'a84a220c-a34f-4973-be37-167250b1e567', 0, 0, '2019-09-25 10:03:13', '2019-09-25 10:03:13'),
('a593ad46-b1f1-4d21-afa6-0c860db5e7ef', NULL, '756832c6-a724-4bab-902c-e84aea4031de', '2e99cfb8-ddac-458f-8f95-126d6f589a67', 0, 0, '2019-09-15 08:12:10', '2019-09-15 08:12:10'),
('a81a63e0-c91b-4660-96ce-580982ff1764', NULL, 'ac5d89b8-fcd6-4b00-841a-beecc0eaf66a', '9d9621f1-4189-462f-adc6-fe471fed313a', 1, 0, '2019-09-15 08:13:45', '2019-09-15 08:13:45'),
('ab40377c-cb89-4e8b-809f-f9f1ff412025', NULL, '756832c6-a724-4bab-902c-e84aea4031de', 'a84a220c-a34f-4973-be37-167250b1e567', 0, 0, '2019-09-25 10:03:13', '2019-09-25 10:03:13'),
('ab6c16ea-52c9-4034-9523-ddd866386720', NULL, '756832c6-a724-4bab-902c-e84aea4031de', 'e36acc3c-5c2e-4997-88e8-ae30a6c21cca', 0, 0, '2019-07-31 17:46:50', '2019-07-31 17:46:50'),
('b5a6a421-f9e6-4433-a89d-a317eaabec8c', NULL, 'baf44ff2-8858-4b35-94e3-1bb8a75521cf', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 1, 0, '2019-07-25 01:51:59', '2019-09-15 07:52:08'),
('b699fca1-a069-441c-94a1-46de8bc3a541', NULL, '756832c6-a724-4bab-902c-e84aea4031de', '23ceae15-6f80-45cf-a418-e29171a600cb', 0, 0, '2019-09-17 03:47:42', '2019-09-17 03:47:42'),
('ba8560cb-50d6-4478-9fdd-43874632b94d', NULL, 'ac5d89b8-fcd6-4b00-841a-beecc0eaf66a', '09853659-da52-4d49-8324-e7f47ea5c4a3', 1, 0, '2019-09-08 14:27:56', '2019-09-15 08:11:24'),
('bb5d6362-a161-4a5b-8e87-c4a5201683f0', NULL, '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', '34368e50-bfe3-45cf-b23b-e692b65c9679', 1, 0, '2019-09-15 08:12:38', '2019-09-15 08:12:38'),
('bf5224c5-788e-4cd2-acc3-9f5a380e1321', '4250ed78-6f7f-4163-a114-e2f9ba95d98e', NULL, 'dcbf6e3f-3fbd-42b5-819e-672807db8e5e', 1, 1, '2019-09-27 02:13:29', '2019-09-27 02:22:51'),
('bfc286cb-8fb0-48df-9c61-0f3254913d08', NULL, 'cd2fb815-6c41-468b-9bbe-d0e67def7ee0', '09853659-da52-4d49-8324-e7f47ea5c4a3', 0, 0, '2019-09-17 03:47:02', '2019-09-17 03:47:02'),
('c1b9c9e8-f157-4da8-ae64-1eb1f628bd49', NULL, '756832c6-a724-4bab-902c-e84aea4031de', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 1, 0, '2019-07-02 14:25:27', '2019-09-15 07:34:46'),
('c4109c51-6ca7-4aec-acd3-8dc252ab863c', '756832c6-a724-4bab-902c-e84aea4031de', NULL, '34368e50-bfe3-45cf-b23b-e692b65c9679', 1, 0, '2019-09-04 03:52:11', '2019-09-04 03:52:11'),
('c80f1890-7cf8-42a6-bb9c-d64ddd032853', NULL, '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', 'e36acc3c-5c2e-4997-88e8-ae30a6c21cca', 0, 0, '2019-07-31 17:46:50', '2019-07-31 17:46:50'),
('c82bc005-037f-4eb5-9dfd-8318b443c2c4', NULL, '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', '90453ecc-8814-4545-8e04-ee9e4b767416', 0, 0, '2019-09-15 12:03:06', '2019-09-23 14:06:06'),
('cb6c482f-aa0b-4ede-9371-7cb6e7c9e383', NULL, 'ac5d89b8-fcd6-4b00-841a-beecc0eaf66a', 'e36acc3c-5c2e-4997-88e8-ae30a6c21cca', 0, 0, '2019-07-31 17:46:50', '2019-07-31 17:46:50'),
('d089a4e9-d7df-4307-b56e-0d89ac7d4f62', NULL, 'cd2fb815-6c41-468b-9bbe-d0e67def7ee0', '194a1741-cd2f-4add-8c67-276d685d5d32', 1, 0, '2019-07-25 03:03:32', '2019-09-14 02:19:15'),
('d08e09ec-fb52-4684-98cd-4a25d147a297', NULL, 'cd2fb815-6c41-468b-9bbe-d0e67def7ee0', '6b20e27f-6515-4be8-9244-7dd5dd1bad32', 0, 0, '2019-07-31 17:58:52', '2019-09-17 03:48:36'),
('d228801b-24c8-4e69-91e4-5fee37c68d25', 'fce31729-3823-4335-8100-cd0c72e9908d', NULL, 'df89782b-2a17-43fe-9ca9-90d48226cb51', 1, 0, '2019-08-04 10:40:52', '2019-08-04 10:40:52'),
('d576c299-b5eb-4dec-b29c-f0f3bba62cc1', NULL, '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', '46af3f83-f078-4349-b12a-c27c490cde67', 1, 0, '2019-07-08 03:42:20', '2019-07-08 03:42:20'),
('d59c7fff-2077-43b3-9777-81436da7d607', NULL, '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', 'a84a220c-a34f-4973-be37-167250b1e567', 1, 0, '2019-09-25 10:03:13', '2019-09-25 10:03:13'),
('d70b4528-03b9-4872-9a77-bf077c285b30', NULL, '756832c6-a724-4bab-902c-e84aea4031de', '2e99cfb8-ddac-458f-8f95-a76d6f589a67', 1, 0, '2019-09-08 15:04:58', '2019-09-08 15:04:58'),
('d8cb5a0f-01aa-49e5-bf69-725e11fe37a6', NULL, '756832c6-a724-4bab-902c-e84aea4031de', '90453ecc-8814-4545-8e04-ee9e4b767416', 1, 0, '2019-09-17 03:46:09', '2019-09-17 03:46:09'),
('db03a0f7-2143-4f23-b0df-07ddce19ad6c', NULL, '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', 'b7e5c50b-6b7c-4435-bd35-0f8628d5d363', 0, 0, '2019-07-17 06:10:01', '2019-09-15 12:05:38'),
('db0d0c96-eab9-4325-95b6-77837806c57d', 'fce31729-3823-4335-8100-cd0c72e9908d', NULL, 'c0337782-4741-42f6-be6b-e865ba38e802', 0, 0, '2019-08-03 02:10:09', '2019-08-03 04:28:04'),
('df65e305-3715-475f-aa0b-928fd81ec80f', NULL, '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', '89ee404f-5197-4603-94ad-0981952ae6cf', 1, 0, '2019-09-18 10:38:38', '2019-09-18 10:38:38'),
('e746966a-f324-4a2d-99d4-6bb1e21099e6', NULL, 'ac5d89b8-fcd6-4b00-841a-beecc0eaf66a', '194a1741-cd2f-4add-8c67-276d685d5d32', 1, 0, '2019-08-12 01:14:21', '2019-08-12 01:14:21'),
('e9750b15-9674-4220-985b-c8546226da04', NULL, '756832c6-a724-4bab-902c-e84aea4031de', '09853659-da52-4d49-8324-e7f47ea5c4a3', 0, 0, '2019-09-08 14:27:56', '2019-09-17 03:47:02'),
('eb274c6c-7e3f-40f5-b938-0b84a61bb642', NULL, 'ac5d89b8-fcd6-4b00-841a-beecc0eaf66a', '6b20e27f-6515-4be8-9244-7dd5dd1bad32', 1, 0, '2019-09-15 08:14:49', '2019-09-15 08:14:49'),
('eb5e6fa0-87cc-4817-93d3-e39e359d059e', NULL, '756832c6-a724-4bab-902c-e84aea4031de', '90453ecc-8814-4545-8e04-ee9e4b767416', 1, 1, '2019-07-23 09:54:28', '2019-09-15 12:03:06'),
('eca88585-a2cf-4946-af3e-d7d5966eac64', NULL, '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', '23ceae15-6f80-45cf-a418-e29171a600cb', 1, 0, '2019-09-13 07:08:44', '2019-09-13 07:08:44'),
('edbaec72-19c9-4b8c-bc17-8bf6af49c4fa', NULL, '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', '9d9621f1-4189-462f-adc6-fe471fed313a', 0, 0, '2019-07-08 04:08:38', '2019-09-15 08:13:45'),
('ee15595b-82e6-489a-9f3a-664d818927cb', NULL, '756832c6-a724-4bab-902c-e84aea4031de', '9d9621f1-4189-462f-adc6-fe471fed313a', 1, 0, '2019-07-08 04:08:38', '2019-07-08 04:08:38'),
('ef803fd3-f92d-4ee8-ac52-873bc74cc423', NULL, 'ac5d89b8-fcd6-4b00-841a-beecc0eaf66a', '89ee404f-5197-4603-94ad-0981952ae6cf', 0, 0, '2019-09-18 10:38:38', '2019-09-18 10:38:38'),
('f0b1479e-80b1-439e-a531-f1e03e74dd28', '360ead64-bcb5-42e3-921a-44a8c7975415', NULL, 'b88c2f18-e1c9-4b03-8c7a-414a17abfd35', 0, 1, '2019-08-03 05:21:42', '2019-08-04 08:40:44'),
('f0b7c107-b3ba-4e7b-95b1-92213d080df1', NULL, '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', '6b20e27f-6515-4be8-9244-7dd5dd1bad32', 1, 0, '2019-09-15 08:14:49', '2019-09-17 03:48:36'),
('f190fdf5-b36d-4821-ad99-c64ea042ada9', NULL, 'ac5d89b8-fcd6-4b00-841a-beecc0eaf66a', '90453ecc-8814-4545-8e04-ee9e4b767416', 1, 0, '2019-07-23 09:54:28', '2019-07-23 09:54:28'),
('f3078121-5aae-448a-b37c-f122aaad725d', NULL, '756832c6-a724-4bab-902c-e84aea4031de', '81de5416-65be-42e5-b240-93c56d1ce515', 1, 0, '2019-09-17 03:48:04', '2019-09-17 03:48:04'),
('f4897167-f82a-4925-8b7d-7aa5bf65ac73', NULL, 'cd2fb815-6c41-468b-9bbe-d0e67def7ee0', '81de5416-65be-42e5-b240-93c56d1ce515', 0, 0, '2019-09-04 03:39:37', '2019-09-17 03:48:04'),
('f57ae362-f13b-48e8-a967-02f01c57e387', NULL, 'ac5d89b8-fcd6-4b00-841a-beecc0eaf66a', '81de5416-65be-42e5-b240-93c56d1ce515', 1, 0, '2019-09-08 13:55:31', '2019-09-08 13:55:31'),
('f8752542-d1e2-4bc8-8e4e-4a4253c046d3', NULL, 'ac5d89b8-fcd6-4b00-841a-beecc0eaf66a', '2e99cfb8-ddac-458f-8f95-126d6f589a67', 1, 0, '2019-09-15 08:12:10', '2019-09-15 08:12:10'),
('fbbc42d5-4fac-4cf1-88b8-27246b93ac20', NULL, '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', '81de5416-65be-42e5-b240-93c56d1ce515', 1, 0, '2019-09-04 03:39:37', '2019-09-04 03:39:37'),
('fc1d5d23-1b9d-43ff-b50e-4fa0eb0201af', NULL, '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', '194a1741-cd2f-4add-8c67-276d685d5d32', 0, 1, '2019-07-25 03:03:32', '2019-08-12 01:08:41'),
('fce31729-3823-4335-8100-cd0c72e9908d', NULL, '7dd30202-98fb-47b7-b1a6-7dd00ef308e6', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 1, 0, '2019-07-02 14:25:51', '2019-09-15 07:52:08');

-- --------------------------------------------------------

--
-- Table structure for table `place_photos`
--

CREATE TABLE `place_photos` (
  `place_photo_id` varchar(36) NOT NULL,
  `place_id` varchar(36) NOT NULL,
  `place_photo_url` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `place_photos`
--

INSERT INTO `place_photos` (`place_photo_id`, `place_id`, `place_photo_url`, `created`) VALUES
('0d3c4fed-cc47-458a-9bfb-37a5365ba7fe', 'samplePlaceId', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F2aec0635-cd3f-4c1b-b19d-317fbc49827e?alt=media&amp;token=4f4ac076-e8ad-4ee1-9e54-4540a115aaa2', '2019-07-16 03:52:09'),
('14586e8c-4c8b-4a6f-bd0f-d3ff1bbbcac6', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Fd1ea0bb3-df08-4029-ac46-658021ed226c?alt=media&token=e70820a1-6f8b-4199-9a77-7c2c6cbf67ef', '2019-09-23 02:03:16'),
('14f241a6-4c3b-491c-a372-627b65493273', '90453ecc-8814-4545-8e04-ee9e4b767416', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F882be9e6-0d5f-46af-94e6-36a1548575a1?alt=media&token=5dbede0a-f16c-4598-8152-0ba842cbeb54', '2019-09-15 12:15:14'),
('199e26cf-698d-4394-8eb4-6cc6d81eacf1', '81de5416-65be-42e5-b240-93c56d1ce515', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F8721fa13-2140-421a-8b30-cf5a8b47fe9b?alt=media&token=0523f17c-1680-4f48-beba-1156b2aee5a3', '2019-09-18 10:30:35'),
('1dcbc34b-43f6-4130-b8a8-93fa985e8594', '90453ecc-8814-4545-8e04-ee9e4b767416', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Fb14e4db6-c9fe-4d4b-82ac-eb854377d647?alt=media&token=51114394-5850-40bb-88ac-9ff9b7680335', '2019-09-15 12:15:17'),
('28fc1808-e409-4ce0-8413-7b109e47ea11', '194a1741-cd2f-4add-8c67-276d685d5d32', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F609881e8-9181-4a5e-bbd4-a2fe35d40df8?alt=media&token=a5c18d8e-304c-4927-9ebf-c68d4aae7cb5', '2019-09-23 02:28:26'),
('2f0fa464-a3af-4de2-8f5b-55ce7c3e98e7', '194a1741-cd2f-4add-8c67-276d685d5d32', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F55332a2d-de12-4f87-912f-f8a5f1fff232?alt=media&token=280b3de3-49f0-40dd-bdf0-6a3f4f031e9a', '2019-09-23 08:46:17'),
('32a22a29-9b5a-4d07-a491-c5c21a6e0f9b', '0e80ec86-fd7c-40fb-a797-0a2767f402c4', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F065c83ff-edea-42b9-9acc-6413cad7c5a0?alt=media&token=b190fc8f-aedc-4f98-8db3-7b37d621e0f6', '2019-09-25 10:04:54'),
('3344926c-15ed-4f4a-9529-16835f90252d', '05a942fc-6fd4-4feb-a2c6-642505fbf206', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Fd601ca5c-9012-4d73-912b-dbb2a3dae308?alt=media&token=35a26bd6-3f53-47a1-8dd9-2d969eac3a3d', '2019-09-25 12:07:59'),
('34354b3a-1211-4b99-bafd-89d330410e73', '6b20e27f-6515-4be8-9244-7dd5dd1bad32', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F61941e58-e836-44d3-ae08-1cf2bddaf64e?alt=media&token=325c9a16-d27a-4e79-be85-db622c75ef6e', '2019-09-23 02:57:51'),
('34d9eb31-609a-4f9f-b5d6-d53933ed594f', '90453ecc-8814-4545-8e04-ee9e4b767416', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Fa5fde388-61c4-4461-956f-e613a97fda68?alt=media&token=a46c929e-5211-47dd-9186-16ff00cb0f42', '2019-09-15 12:15:11'),
('35406af5-9952-4f10-b918-c04aedf0eaf6', 'a3055ae6-9813-43d7-a1b0-e5873b9a6bdb', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F9dc2513d-f304-42ae-b99b-fa65d713e12f?alt=media&amp;token=c48b366f-e2cb-4d88-8228-0ce212ea7543', '2019-07-16 04:13:02'),
('3aa1bd45-a2df-47b4-9337-43452957719b', '34368e50-bfe3-45cf-b23b-e692b65c9679', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F3fa3f59e-eb19-4328-b7a9-3e0ebfe42e36?alt=media&token=56747d83-2e2f-45f0-97f7-f957686da73e', '2019-09-18 10:11:03'),
('3f3239f1-b22a-44c3-8678-b4bf98b71298', '652026c8-6f4a-4fd2-949b-b7c429dc915c', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F0fd6c4e9-caa2-49c0-8dd8-ad4125a03747?alt=media&token=1f2eea87-ebec-4b7d-b042-d9915ad9a4a6', '2019-07-23 03:33:33'),
('406fd90e-e477-4b55-8dbf-58d052387d42', '81de5416-65be-42e5-b240-93c56d1ce515', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F0137b949-50cc-4a84-8d99-0610a72a9cb9?alt=media&token=a364c418-8309-4805-b20b-066b725eeedf', '2019-09-18 10:30:28'),
('457d62d5-d6e9-437f-aa48-a3a433bbbd1c', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F2c9c2031-6f49-47dd-a23e-24abda07c8a8?alt=media&token=22f5373e-3ae4-47a5-9fdb-139f21b2cec8', '2019-09-23 02:03:11'),
('529b50b8-0bc7-41b8-bed6-66a218a5f70c', '81de5416-65be-42e5-b240-93c56d1ce515', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Fda5c2eb2-8082-45f5-a281-489f4f7dccb7?alt=media&token=f8c897ba-caf0-49f5-b2d2-2ad30da0ca6e', '2019-09-18 10:30:31'),
('597bd086-0605-4246-8943-f08fc5a51352', '90453ecc-8814-4545-8e04-ee9e4b767416', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Faa0c499d-b480-4d5f-bcf6-2f6b87199347?alt=media&token=c2d05062-e56f-4a19-ad41-943b416ac43d', '2019-09-15 12:15:01'),
('5e8cc515-ea78-4819-8de4-89a7c2533e22', '90453ecc-8814-4545-8e04-ee9e4b767416', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F71eec429-8f74-4a2a-ac38-778e7c787909?alt=media&token=5d8d6615-33ba-4829-a546-317acee847b5', '2019-09-15 12:14:59'),
('61175253-c62f-4ea5-a19f-21f5a13e1102', '81de5416-65be-42e5-b240-93c56d1ce515', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F91248142-6cff-4011-b8b3-c34890408bc1?alt=media&token=7eea0038-149a-4575-9ddf-653aa0762d45', '2019-09-18 10:30:33'),
('65656eed-0534-4bc4-b07e-2352836bd365', '46af3f83-f078-4349-b12a-c27c490cde67', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F30e55306-ca91-4727-8856-f51e8cabb9be?alt=media&token=feb868a9-6946-42fe-973d-fe7087d96fd4', '2019-09-23 03:13:38'),
('6ade10fe-8be0-4383-8dde-4076c5d9b0c6', 'samplePlaceId', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F6feadb42-ad9e-40ea-abcc-73a8b4ecc8db?alt=media&amp;token=a95af552-674f-4705-8acb-374b671f549b', '2019-07-16 03:52:13'),
('6f3de2b7-a14d-4dd9-a689-7afaa478f2cd', '6b20e27f-6515-4be8-9244-7dd5dd1bad32', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Faa203831-5bf0-4fd2-88d7-86c51deaf016?alt=media&token=997ff6e9-a30d-4faa-a8ff-8bc3f57a13e4', '2019-09-23 02:57:54'),
('72a7eb5d-faa6-44d5-9d27-b4225738f549', '194a1741-cd2f-4add-8c67-276d685d5d32', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Fdeae5a8b-f06f-445a-b82d-6c49fa029f42?alt=media&token=8568c17b-288c-410c-8828-6de0aa7cf36e', '2019-09-23 02:28:36'),
('73b9d255-7763-4332-a4be-d4fc4b14b9df', '81de5416-65be-42e5-b240-93c56d1ce515', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F13f70239-bf51-4e5f-b3cb-e22a044c8d3e?alt=media&token=9f6b792d-4cc5-40da-b1da-6f9046cd301d', '2019-09-18 10:30:38'),
('745cf887-e8f2-4647-8f0f-5698be044913', 'samplePlaceId', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Ffd284d95-6686-4c2c-8496-5ed4d2aac910?alt=media&amp;token=9d8f1f6c-b4f0-46bd-91df-52850fc5d41c', '2019-07-16 03:50:38'),
('7fc782ad-1fba-4fe1-a571-0d356bb9c2ae', '194a1741-cd2f-4add-8c67-276d685d5d32', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Fe3b1a3b5-a20b-4470-a740-aaf092ad5e4e?alt=media&token=91dc878c-6c33-4927-9945-a43727f105ae', '2019-09-23 02:28:43'),
('80338db9-4c32-4d58-b0f8-7f239f136b0b', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Fdd1bfa9d-d32e-4add-bc6d-b610d9bfa703?alt=media&token=c940e0cf-a28d-4f98-b7fc-72e8866d9a90', '2019-09-23 02:03:33'),
('80a4880f-a7a0-46e8-86c8-6e582dc6c9c3', '194a1741-cd2f-4add-8c67-276d685d5d32', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Fc3878826-b290-40ad-854d-1a14c660b271?alt=media&token=1629aeb9-aab1-4a97-9594-ef120babb3aa', '2019-09-23 02:28:35'),
('87b7630c-8599-4718-845d-5a963234462e', '90453ecc-8814-4545-8e04-ee9e4b767416', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F2b99d698-ba76-4884-a91b-e394036c6307?alt=media&token=8d110c38-e4ad-4079-a2ad-ba145dff0a2c', '2019-09-15 12:15:05'),
('87f2dda3-2626-4f87-9f1a-411d8c79fa86', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Ffae388cd-9775-4c9f-8ee2-6ee26a8bd24d?alt=media&token=e123a4c2-8480-4258-b106-5f28dac3e413', '2019-09-23 02:03:28'),
('8868910e-0a46-4ba5-8b96-e32462b0cec9', '6b20e27f-6515-4be8-9244-7dd5dd1bad32', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Ffe5abbb8-4cd8-4e2b-9a70-f670f136c39b?alt=media&token=cdd017cb-1411-43fb-b863-64c50e98532f', '2019-09-23 02:57:55'),
('88c4d248-1079-45a4-a975-0dca39159acf', '34368e50-bfe3-45cf-b23b-e692b65c9679', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F87070779-e147-4db3-ac2d-f48f3857b335?alt=media&token=0ed6da50-707e-4d9c-a130-dcf7dec8937b', '2019-09-18 10:11:00'),
('903a0b9d-1be4-4566-8d2a-cf8140138a66', '6b20e27f-6515-4be8-9244-7dd5dd1bad32', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F15601cc6-638f-470c-abe3-0bd29f11e36e?alt=media&token=cdf8ddfd-e731-4f09-ba29-1c6c5bcd80d5', '2019-09-23 02:57:40'),
('913daec1-f59a-46a9-8d2d-48b300537f8e', '194a1741-cd2f-4add-8c67-276d685d5d32', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Fed4bd6cb-c234-42e4-ba5f-f71b99f17c36?alt=media&token=23f62053-f575-4103-94f5-3ff6d0f0e358', '2019-09-23 08:47:25'),
('9414fd2e-3032-4942-a558-0fb58f928bf4', '34368e50-bfe3-45cf-b23b-e692b65c9679', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F2017-11-30.jpg?alt=media&token=8bd38738-8ae2-493d-a28f-cc65f8f15215', '2019-09-11 02:36:51'),
('954e8b3b-22a6-4481-99ab-3e4a98c146dc', '34368e50-bfe3-45cf-b23b-e692b65c9679', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Fceb9016b-61a7-4003-a10d-afed788de30d?alt=media&token=bbffd2ee-3b8d-4c42-acd1-0af3ec1f6723', '2019-09-18 10:11:03'),
('99996b0f-81b8-45ac-b0a5-6ef7eac22948', '194a1741-cd2f-4add-8c67-276d685d5d32', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F4375217f-19da-4090-a068-9a591f36833f?alt=media&token=4b524c69-4764-49da-9ac0-99d24027e053', '2019-09-23 08:46:13'),
('9facc444-854a-4c3f-b3ad-3795cf272435', 'samplePlaceId', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F83b3e626-9a6f-4765-8760-7699bddc7619?alt=media&amp;token=a9c66609-bd6a-4d68-b148-bc1b9938dd9d', '2019-07-16 03:52:09'),
('a0c5fde8-69b3-4a6d-b1ce-eb6b402373b2', '6b20e27f-6515-4be8-9244-7dd5dd1bad32', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F76fc2d4c-ccaf-4fdd-997a-248ea60752b5?alt=media&token=2b3dd26c-f850-4d59-8a1d-44063c1584d5', '2019-09-23 02:57:43'),
('a0fb7816-ba3a-4ae9-aa6b-dce51d244408', '81de5416-65be-42e5-b240-93c56d1ce515', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F79c257e0-2f0f-4c0d-b5e9-c527995edfa3?alt=media&token=a88e5aa1-871d-4f63-8612-0e228796ea64', '2019-09-18 10:30:33'),
('a30c63a8-36cd-44a8-89e8-6225fa6d9ef5', '6b20e27f-6515-4be8-9244-7dd5dd1bad32', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F8d76dd21-7953-4356-a9e3-1629b2120f7e?alt=media&token=fe14b37d-6a21-4386-a79d-48537d191870', '2019-09-23 02:57:38'),
('asdeorkfnsm', 'ksomfngerjwkmdfko', 'https://placephotourl/image/placephoto', '2019-07-16 02:42:29'),
('b3e767b0-9565-42c0-99c2-b00e43006d35', '194a1741-cd2f-4add-8c67-276d685d5d32', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Feb1757b0-fc1a-4ac1-a561-8329232d8c85?alt=media&token=a3c30782-15db-4121-9ad2-64b373e7d96b', '2019-09-23 08:46:18'),
('b8079f1f-fa3f-46b2-9592-9c6b90b2f5b7', '81de5416-65be-42e5-b240-93c56d1ce515', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F5acda974-3c34-44d3-8180-6fcaab1dae0b?alt=media&token=0a98ef64-2312-4aeb-babf-cd5eb38f4b8e', '2019-09-18 10:30:35'),
('b9588a70-38b9-4432-8acd-8ac5a1727557', '7ff18a8b-4ea0-4721-974e-01b5e1b45004', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F564cc217-3668-4d37-8a95-f384c74f5f83?alt=media&token=a3488e67-ff35-4c26-a822-cee3b508e232', '2019-09-25 10:32:31'),
('bbe4b006-b0aa-42b7-bdb1-543aeed4a42c', '46af3f83-f078-4349-b12a-c27c490cde67', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F7467a806-e231-4460-8c4c-80217c4eb440?alt=media&token=ba52e769-11cb-4f16-aa75-945caa8b310f', '2019-09-23 03:13:24'),
('c4df39b6-f7ff-4324-829e-1ca8aedd3e51', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F1c944816-1292-4edb-ae17-b752447a7830?alt=media&token=470d1280-0972-4519-b263-3bad62f68e3f', '2019-09-23 02:03:35'),
('c8403bf5-1bc1-4cdb-b0cd-e4f5e1f73b4a', '7be24bf4-823f-41e2-bd77-1c7813d14b67', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F361cf962-5781-40d7-9608-8dc31c210f22?alt=media&token=1e42d8b0-5f1b-42bd-9a6c-32eb0c5a8e21', '2019-09-27 00:24:24'),
('cc0f77c9-019c-4df8-abcc-10f59770f0c4', '7be24bf4-823f-41e2-bd77-1c7813d14b67', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F5b3bf2c8-b96a-49a1-88b1-ea491d4cf56d?alt=media&token=4432046e-9219-469c-8e2c-8ead3639bb39', '2019-09-27 00:24:17'),
('d12b2db2-e3af-4c62-9bb1-6af903db7e76', '34368e50-bfe3-45cf-b23b-e692b65c9679', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F07c3a70d-eb14-49d6-94d3-cb409faae99f?alt=media&token=991c66ca-22c7-4b8e-a44b-e488d3198daa', '2019-09-18 10:11:01'),
('d435b690-ecdb-467a-a29d-9abd433ed1da', '46af3f83-f078-4349-b12a-c27c490cde67', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Fc15997f3-3f07-42b0-a155-ed21c33c07dc?alt=media&token=a058b168-1a52-41df-892a-c4b1a2d9b1d4', '2019-09-23 03:13:24'),
('d7bf4dd9-bc04-44fa-a111-4f90ec6209c6', '81de5416-65be-42e5-b240-93c56d1ce515', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Fc53c0b5e-2994-44ab-bf90-faeb4cfddb2b?alt=media&token=6323db84-6d2f-4695-9583-767dfe51d0e4', '2019-09-18 10:30:30'),
('d9f84304-4797-4122-bf51-25eba01b7435', '7be24bf4-823f-41e2-bd77-1c7813d14b67', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Ffefae6a2-3db8-4b74-a403-14337919239f?alt=media&token=777aee16-adff-49c8-b135-efbeead85182', '2019-09-27 00:24:25'),
('e0d03db7-27ee-4337-9898-0218426ee8d3', '46af3f83-f078-4349-b12a-c27c490cde67', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F886ea7de-6383-4994-a772-bf134c7def39?alt=media&token=08638cf6-c765-4f06-a461-9b254929e82a', '2019-09-23 03:13:40'),
('e243daa3-6fca-4281-a196-a3e196526122', '194a1741-cd2f-4add-8c67-276d685d5d32', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F3a824858-cb56-4a01-a99f-843d86328f57?alt=media&token=cfd43f50-fad3-44f1-8de2-f66fe9b3e302', '2019-09-23 08:47:13'),
('e25c951c-c6bd-4d93-aef3-eac048541304', '6b20e27f-6515-4be8-9244-7dd5dd1bad32', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F357445c6-7b0b-4e18-b7fa-96f23205f948?alt=media&token=7500565e-dbbd-4b2a-ade3-4db64d94ac07', '2019-09-23 02:57:47'),
('e640aec6-ccf1-4d58-8f04-e709fa166caa', '7be24bf4-823f-41e2-bd77-1c7813d14b67', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Fb863b9bc-49ed-4ec0-804b-e40d3b52a519?alt=media&token=1a5dda41-c9bb-408e-997c-2b7d0b23399d', '2019-09-27 00:24:21'),
('e9289fd0-fca9-40fc-bf04-c6455d878d9b', '194a1741-cd2f-4add-8c67-276d685d5d32', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F773038aa-add0-4376-964b-63134637d33a?alt=media&token=6dc719e1-aca9-4f06-b78d-996699c68561', '2019-09-23 08:47:23'),
('ecda3184-bce5-45b7-8414-4bd4f6907e42', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F2be89c42-b24e-42c4-9113-a1a2468d8961?alt=media&token=256e46f5-c996-4ae8-9f2e-fe2582631f30', '2019-09-23 02:03:26'),
('ed8b32ff-27b3-454d-bc14-9ef5d15ddee3', '194a1741-cd2f-4add-8c67-276d685d5d32', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F97d4e82d-9665-4c5f-bb13-46ffb862e36d?alt=media&token=be8d542b-219d-4808-a01a-422be184409c', '2019-09-23 02:28:13'),
('eddf652e-4120-4ecf-9cfc-619fdccd901f', '90453ecc-8814-4545-8e04-ee9e4b767416', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Fd2dd907a-fb58-4aae-aa0e-bf92a0f93f1b?alt=media&token=c7db1c3c-da14-4f43-9e00-117230db1637', '2019-09-15 12:15:15'),
('f7bcb047-9284-403a-a9b1-47ed1b81db93', '90453ecc-8814-4545-8e04-ee9e4b767416', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F2529890e-185d-4e03-9a9d-b615365b9df5?alt=media&token=c391fd9a-7342-41de-afda-47ccce123fec', '2019-09-15 12:15:09'),
('f8e20b39-936d-4b42-9d54-bcbf7cb30899', '194a1741-cd2f-4add-8c67-276d685d5d32', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2Faba5a2a3-3006-45a0-82c9-f46d27724e7a?alt=media&token=546dab18-ab6a-4423-b9f8-98c435ac5cbb', '2019-09-23 02:28:25'),
('fa408cfa-8077-445e-98a8-b592f3774b86', '81de5416-65be-42e5-b240-93c56d1ce515', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F17572104-4d6a-4d37-b921-07641276b9d1?alt=media&token=2eacc75c-e384-4897-a806-fc93b3a3f93d', '2019-09-18 10:30:28'),
('fbc24443-53f6-4bb6-99b9-b835e2e67295', '194a1741-cd2f-4add-8c67-276d685d5d32', 'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Place%20Photos%2F458fa6fc-c09e-47e3-8cab-7beca2d7e85c?alt=media&token=31559393-178f-4ea2-b607-e5f05484040a', '2019-09-23 08:47:18');

-- --------------------------------------------------------

--
-- Table structure for table `place_reviews`
--

CREATE TABLE `place_reviews` (
  `place_review_id` varchar(36) NOT NULL,
  `place_id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `review_description` text NOT NULL,
  `review_rating` int(3) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `place_reviews`
--

INSERT INTO `place_reviews` (`place_review_id`, `place_id`, `user_id`, `review_description`, `review_rating`, `created`, `modified`) VALUES
('024f78c4-19da-41eb-85d4-c7682a1a0a60', '90453ecc-8814-4545-8e04-ee9e4b767416', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Tempatnya kurang bagus', 3, '2019-07-23 09:54:28', '2019-07-23 09:54:28'),
('0ca5eb62-0961-479a-a987-c985d92634ce', '194a1741-cd2f-4add-8c67-276d685d5d32', 'yHyjg90skdhPnLuAhfnO8UdtnvA2', 'Seluruhnya mendukung', 5, '2019-09-25 10:34:22', '2019-09-25 10:34:22'),
('11830417-390a-474b-94e8-8e677b39d9bd', '46af3f83-f078-4349-b12a-c27c490cde67', 'T5OgltU3WVMrwrjOMshEGKEPrKG2', 'Perpus yang aksessibel', 4, '2019-09-17 03:45:04', '2019-09-17 03:45:04'),
('1465b1e3-5159-4f61-8642-c901bea074fa', '2e99cfb8-ddac-458f-8f95-126d6f589a67', 'T5OgltU3WVMrwrjOMshEGKEPrKG2', 'Tidak terlalu nyaman untuk disabilitas', 3, '2019-09-17 03:43:25', '2019-09-17 03:43:25'),
('31f59194-a5df-4427-8945-6b21944a703c', '9d9621f1-4189-462f-adc6-fe471fed313a', '4wG546Cm6LgNxIndzBBFqUkbqhD2', 'baik', 4, '2019-09-25 10:20:03', '2019-09-25 10:20:03'),
('3953981e-13f2-4b06-b2d3-7d425e3772a1', 'a84a220c-a34f-4973-be37-167250b1e567', 'uj5hmbOUcZgqDPDWtKusLrRXq6H3', 'tempat untuk menghibur diri ', 4, '2019-09-25 10:03:12', '2019-09-25 10:03:12'),
('42e88397-78fa-4db2-bce7-880551c0b0e6', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'ZAgd3mlXQZbsmDBiAOyaN0bSjtw1', 'Bagus sekali tempatnya...', 4, '2019-09-23 09:22:13', '2019-09-23 09:22:13'),
('4ff74515-80e3-4e4e-bd52-6dc3992e13d7', '81de5416-65be-42e5-b240-93c56d1ce515', 'uj5hmbOUcZgqDPDWtKusLrRXq6H3', 'waw, sangat membantu dari segi fasilitas dll', 5, '2019-09-25 09:54:44', '2019-09-25 09:54:44'),
('51d3de73-1be5-4482-8add-ab58116397ca', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Bagus tempatnya', 4, '2019-07-23 09:35:04', '2019-07-23 09:35:04'),
('56ac0b35-bd58-4584-8473-bd8a50ef9d8b', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Fasilitas cukup', 4, '2019-07-23 09:36:18', '2019-07-23 09:36:18'),
('56f24057-25ac-40cc-bdcc-02245ee349fe', '9d9621f1-4189-462f-adc6-fe471fed313a', '4wG546Cm6LgNxIndzBBFqUkbqhD2', 'bagus', 4, '2019-09-25 10:19:25', '2019-09-25 10:19:25'),
('5958b14a-8faa-4d4f-abbf-adb647236a55', '194a1741-cd2f-4add-8c67-276d685d5d32', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Nyaman untuk kuliah', 5, '2019-07-25 03:03:32', '2019-07-25 03:03:32'),
('5bbf113f-6c84-4bcd-a8e9-037a59274b8f', '34368e50-bfe3-45cf-b23b-e692b65c9679', 'Ld8Zh9s8GhXBajldUu8vlWWfPJJ2', 'Rumah sakit terbaik UGM..', 5, '2019-09-23 02:31:26', '2019-09-23 02:31:26'),
('65036d49-f17a-4f35-81ac-ac9df6f06a6f', 'e36acc3c-5c2e-4997-88e8-ae30a6c21cca', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Mantab djiwa', 3, '2019-07-31 17:46:50', '2019-07-31 17:46:50'),
('68a423eb-e2cc-4547-a6c2-271208bfa8db', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 3, '2019-07-23 09:35:08', '2019-07-23 09:35:08'),
('6e9a3e25-c65b-4c68-ac9c-3164498e44a1', '9d9621f1-4189-462f-adc6-fe471fed313a', '4wG546Cm6LgNxIndzBBFqUkbqhD2', 'bagus', 4, '2019-09-25 10:21:00', '2019-09-25 10:21:00'),
('7181cebe-a63c-4cec-96d3-eb160b2d2c50', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Woalah apik iki', 5, '2019-07-04 16:28:07', '2019-07-04 16:28:07'),
('78392060-6c29-4c53-82ab-e70bee108ad6', '0e80ec86-fd7c-40fb-a797-0a2767f402c4', 'uj5hmbOUcZgqDPDWtKusLrRXq6H3', 'tempat untuk menghibur diri', 4, '2019-09-25 10:04:40', '2019-09-25 10:04:40'),
('7958650f-49c9-430e-b0b5-b5e15159f40e', '194a1741-cd2f-4add-8c67-276d685d5d32', 'ZAgd3mlXQZbsmDBiAOyaN0bSjtw1', 'Fasilitas Memadahi', 4, '2019-09-23 13:41:39', '2019-09-23 13:41:39'),
('7aa97b22-d39b-4817-8fa7-071e18a01ed2', '2e99cfb8-ddac-458f-8f95-a76d6f589a67', 'XVDLXcUNwUMbOodvnsWSnPXSA3A3', 'jjj', 3, '2019-09-08 15:04:58', '2019-09-08 15:04:58'),
('7eb6cad6-bd58-41ed-a1ca-d0ae158b7671', '89ee404f-5197-4603-94ad-0981952ae6cf', 'T5OgltU3WVMrwrjOMshEGKEPrKG2', 'Bagus sekali', 4, '2019-09-18 10:38:37', '2019-09-18 10:38:37'),
('81210f0b-2ded-468e-a0d3-545eeb566bd3', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 3, '2019-07-23 09:35:05', '2019-07-23 09:35:05'),
('8a042c26-19b0-4a80-8188-b752a1b80828', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Oplot!!', 4, '2019-07-16 06:19:11', '2019-07-16 06:19:11'),
('8aa8d3b3-f181-4f0b-9fa7-3b68f9e1b4df', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Wunderbar!', 5, '2019-07-16 06:17:18', '2019-07-16 06:17:18'),
('9630ac10-7342-4b80-990d-4b65870e7f82', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 5, '2019-07-23 09:34:55', '2019-07-23 09:34:55'),
('9c75bd9b-61eb-4ea8-9a11-4a7fc332b22c', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 5, '2019-07-23 09:37:42', '2019-07-23 09:37:42'),
('9d4a015f-f005-4bfa-88d6-ed27211a105d', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 5, '2019-07-23 09:35:07', '2019-07-23 09:35:07'),
('9eb284f4-39e1-40a3-b5f9-b53675a063cd', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'menarik', 4, '2019-07-27 12:09:06', '2019-07-27 12:09:06'),
('a01d7c15-546c-49fa-a56a-0a26f87debfc', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Guht!', 4, '2019-07-04 06:35:01', '2019-07-04 06:35:01'),
('a1adbd66-6ee9-4302-bb8b-eacf7a348ade', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 3, '2019-07-23 09:34:55', '2019-07-23 09:34:55'),
('a273beac-92ab-45ee-ad84-9d353922be91', '9d9621f1-4189-462f-adc6-fe471fed313a', '4wG546Cm6LgNxIndzBBFqUkbqhD2', 'Fasilitas terawat dengan baik', 5, '2019-09-25 10:18:34', '2019-09-25 10:18:34'),
('aa290c86-2162-4c4f-8f38-caa02a06cbac', '259476b7-d360-4cfb-907d-a9187a3c2c90', 't5e20heWdsQMZeX2pqQih4lD6Nv2', 'Bisa parkir', 3, '2019-09-25 11:45:08', '2019-09-25 11:45:08'),
('ae954b4a-0d3a-450e-84e2-0501f8e0028f', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 3, '2019-07-23 09:34:56', '2019-07-23 09:34:56'),
('b179516d-617f-485c-a77d-6716ebda8e13', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 3, '2019-07-23 09:35:08', '2019-07-23 09:35:08'),
('b37a3353-7f9d-465e-9207-d26759c2f912', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 3, '2019-07-23 09:35:12', '2019-07-23 09:35:12'),
('bac9c5b1-3049-4e90-94d1-c0acfa0338f9', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 3, '2019-07-23 09:35:09', '2019-07-23 09:35:09'),
('bae1d606-da75-4291-af78-680957413c25', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 't5e20heWdsQMZeX2pqQih4lD6Nv2', 'Keliatan keren', 5, '2019-09-25 11:42:19', '2019-09-25 11:42:19'),
('bd88a17c-11df-494b-85a3-3018c25fffde', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 3, '2019-07-23 09:35:36', '2019-07-23 09:35:36'),
('beee851e-ac73-421e-9146-644df21c5c1c', '9d9621f1-4189-462f-adc6-fe471fed313a', 'mn28SCxtJ7SZ2NR8IkYEplTQEJA3', 'mantap', 5, '2019-09-25 12:02:02', '2019-09-25 12:02:02'),
('c223df36-2aac-421d-9883-b8882f142665', '194a1741-cd2f-4add-8c67-276d685d5d32', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Salah satu kampus aksessibel untuk disabilitas', 4, '2019-07-25 05:27:46', '2019-07-25 05:27:46'),
('c309940e-a2fd-461f-9a6c-c75076632029', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 3, '2019-07-23 09:35:05', '2019-07-23 09:35:05'),
('c57fedea-4c46-4bb3-a7c2-9766e0e377f0', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 5, '2019-07-23 09:34:48', '2019-07-23 09:34:48'),
('d3af7541-91d8-46bd-9c0d-fdc40dabc620', '81de5416-65be-42e5-b240-93c56d1ce515', 'XVDLXcUNwUMbOodvnsWSnPXSA3A3', 'but I ijo', 3, '2019-09-04 03:39:37', '2019-09-04 03:39:37'),
('d52fb205-4391-4e1a-969c-d4744b091445', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 3, '2019-07-23 09:35:10', '2019-07-23 09:35:10'),
('d67387d3-1d13-4c71-8b8e-130e02a8262b', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 5, '2019-07-23 09:35:07', '2019-07-23 09:35:07'),
('d82fa3f9-4dde-4b02-8a5c-790acd5737b6', '6b20e27f-6515-4be8-9244-7dd5dd1bad32', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Auditorium Aksesibel', 4, '2019-07-31 17:58:52', '2019-07-31 17:58:52'),
('dc9789f7-81c6-4905-be24-b820511f3af7', '194a1741-cd2f-4add-8c67-276d685d5d32', 'yHyjg90skdhPnLuAhfnO8UdtnvA2', 'sangat nyaman', 5, '2019-09-25 10:34:59', '2019-09-25 10:34:59'),
('e4500672-f7fa-493c-a25f-ac2544c7c483', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 3, '2019-07-23 09:34:58', '2019-07-23 09:34:58'),
('e768ece7-b9b5-4eba-837c-9e3c11882ddd', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 3, '2019-07-23 09:34:55', '2019-07-23 09:34:55'),
('e89a8a17-83c8-4237-bb8c-656646d3f64a', 'b7e5c50b-6b7c-4435-bd35-0f8628d5d363', 'T5OgltU3WVMrwrjOMshEGKEPrKG2', 'Bisa diakses mudah disabilitas, tapi beberapa fasilitas kurang', 3, '2019-09-15 12:04:59', '2019-09-15 12:04:59'),
('eabd9f2b-37f3-4f45-9314-814865e64572', '194a1741-cd2f-4add-8c67-276d685d5d32', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Fasilitas disabilitas lengkap', 5, '2019-07-25 05:30:17', '2019-07-25 05:30:17'),
('ec9297c5-1c82-4b1a-a841-dbf336780199', '23ceae15-6f80-45cf-a418-e29171a600cb', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'ok', 4, '2019-09-13 07:08:44', '2019-09-13 07:08:44'),
('eca518fa-4536-4823-b2fe-4127ecd9f1db', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 3, '2019-07-23 09:35:05', '2019-07-23 09:35:05'),
('edf616d3-9c05-454f-aa87-26d3cbb99172', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 3, '2019-07-23 09:36:19', '2019-07-23 09:36:19'),
('f0aadd12-f653-4bd6-ac8d-08b7c860f0c2', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 3, '2019-07-23 09:36:20', '2019-07-23 09:36:20'),
('f0d01309-b680-48cb-86f8-334d3309eb5b', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 3, '2019-07-23 09:37:40', '2019-07-23 09:37:40'),
('f12731f7-c593-4e8b-ae50-2ad0594434cf', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 3, '2019-07-23 09:35:10', '2019-07-23 09:35:10'),
('f729697b-ec55-44ef-8475-6ff574f69220', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 3, '2019-07-23 09:37:42', '2019-07-23 09:37:42'),
('fb0f48c9-ba5a-4757-bf54-83bc9630cd0d', '09853659-da52-4d49-8324-e7f47ea5c4a3', 'XVDLXcUNwUMbOodvnsWSnPXSA3A3', 'January', 3, '2019-09-08 14:27:56', '2019-09-08 14:27:56'),
('fb5cbea9-c54b-4fbd-8aba-17c397eaec40', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'Ld8Zh9s8GhXBajldUu8vlWWfPJJ2', 'Tempatnya asik...', 4, '2019-09-23 01:40:51', '2019-09-23 01:40:51'),
('fc83d800-4ebb-42fb-977c-6221a01e11de', '1cc5e1e9-21d2-4504-8223-f6a9b72772e5', 'RxX2dGxGthcaJNGPABHIhkcCJeG2', 'Kirim', 3, '2019-07-23 09:35:12', '2019-07-23 09:35:12');

--
-- Triggers `place_reviews`
--
DELIMITER $$
CREATE TRIGGER `update_average_rating_on_create` AFTER INSERT ON `place_reviews` FOR EACH ROW BEGIN
UPDATE places p
SET p.average_rating = 
(select SUM(review_rating) from place_reviews where p.place_id = place_id)/(select COUNT(review_rating) from place_reviews where p.place_id = place_id);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_average_rating_on_delete` AFTER DELETE ON `place_reviews` FOR EACH ROW BEGIN
UPDATE places p
SET p.average_rating = 
(select SUM(review_rating) from place_reviews where p.place_id = place_id)/(select COUNT(review_rating) from place_reviews where p.place_id = place_id);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_average_rating_on_update` AFTER UPDATE ON `place_reviews` FOR EACH ROW BEGIN
UPDATE places p
SET p.average_rating = 
(select SUM(review_rating) from place_reviews where p.place_id = place_id)/(select COUNT(review_rating) from place_reviews where p.place_id = place_id);
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`facility_id`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`place_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `place_facilities`
--
ALTER TABLE `place_facilities`
  ADD PRIMARY KEY (`place_facility_id`);

--
-- Indexes for table `place_photos`
--
ALTER TABLE `place_photos`
  ADD PRIMARY KEY (`place_photo_id`);

--
-- Indexes for table `place_reviews`
--
ALTER TABLE `place_reviews`
  ADD PRIMARY KEY (`place_review_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
