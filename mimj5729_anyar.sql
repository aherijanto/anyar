-- phpMyAdmin SQL Dump
-- version 5.1.3-1.fc35
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 23, 2022 at 01:43 PM
-- Server version: 10.5.13-MariaDB
-- PHP Version: 8.0.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mimj5729_anyar`
--

-- --------------------------------------------------------

--
-- Table structure for table `usrlogin`
--

CREATE TABLE `usrlogin` (
  `name` varchar(35) NOT NULL,
  `username` varchar(10) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `status` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `waccountr`
--

CREATE TABLE `waccountr` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `s_code` varchar(30) DEFAULT NULL COMMENT 'code',
  `r_date` date DEFAULT NULL COMMENT 'paydate',
  `r_type` varchar(30) DEFAULT NULL COMMENT 'payment',
  `r_nocheque` varchar(40) DEFAULT NULL COMMENT 'nocheque',
  `r_amount` double DEFAULT NULL COMMENT 'nominal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `waccountr`
--

INSERT INTO `waccountr` (`id`, `s_code`, `r_date`, `r_type`, `r_nocheque`, `r_amount`) VALUES
(18, 'MTHR2022022126666', '2022-02-06', 'bilyet', 'BG002', 160000),
(19, 'MTHR2022022126666', '2022-02-28', 'cheque', 'CQ098', 400000),
(20, 'MTHR2022022126666', '2022-03-16', 'cash', 'CQ999876', 50000),
(21, 'MTHR2022022138316', '2022-03-04', 'cash', 'CASH', 50000),
(22, 'MTHR2022022138316', '2022-02-01', 'cheque', 'test', 20000),
(23, 'MTHR2022022138316', '2022-02-26', 'cheque', 'testclear', 500000),
(24, 'MTHR2022021866026', '2022-02-24', 'bilyet', 'BGTest', 49002),
(25, 'MTHR2022021866026', '2022-02-24', 'cash', 'dgdfg', 10000),
(26, 'MTHR2022021866026', '2022-02-23', 'cheque', 'testcheck', 1);

-- --------------------------------------------------------

--
-- Table structure for table `waddpoint`
--

CREATE TABLE `waddpoint` (
  `p_addno` varchar(20) NOT NULL,
  `c_code` varchar(30) NOT NULL,
  `p_code` varchar(20) NOT NULL,
  `p_qty` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wbuyhead`
--

CREATE TABLE `wbuyhead` (
  `b_code` varchar(30) NOT NULL,
  `b_refno` varchar(25) NOT NULL,
  `b_date` date NOT NULL,
  `b_dateinput` date NOT NULL,
  `s_code` varchar(15) NOT NULL,
  `u_code` varchar(15) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wbuyhead`
--

INSERT INTO `wbuyhead` (`b_code`, `b_refno`, `b_date`, `b_dateinput`, `s_code`, `u_code`, `id`) VALUES
('PCS2022032039137', 'Ary test', '2022-03-20', '2022-03-20', 'SUP001', 'adminmthr', 451);

-- --------------------------------------------------------

--
-- Table structure for table `wbuytail`
--

CREATE TABLE `wbuytail` (
  `b_code` varchar(30) NOT NULL,
  `g_code` varchar(30) NOT NULL,
  `i_code` varchar(15) NOT NULL,
  `i_name` varchar(30) NOT NULL,
  `i_qty` float NOT NULL,
  `i_cogs` float NOT NULL,
  `i_disc1` float NOT NULL DEFAULT 0,
  `i_disc2` float NOT NULL DEFAULT 0,
  `i_disc3` float NOT NULL DEFAULT 0,
  `tglexp` date NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wbuytail`
--

INSERT INTO `wbuytail` (`b_code`, `g_code`, `i_code`, `i_name`, `i_qty`, `i_cogs`, `i_disc1`, `i_disc2`, `i_disc3`, `tglexp`, `id`) VALUES
('PCS2022032039137', 'SMN00100002', 'TRTB001', 'SEMEN TIGA RODA 50 KG', 2, 59000, 0, 0, 0, '2022-03-20', 11209);

-- --------------------------------------------------------

--
-- Table structure for table `wcompany`
--

CREATE TABLE `wcompany` (
  `id` int(11) NOT NULL,
  `code` varchar(15) NOT NULL,
  `name` varchar(40) NOT NULL,
  `address1` varchar(60) NOT NULL,
  `address2` varchar(60) NOT NULL,
  `city` varchar(40) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wcompany`
--

INSERT INTO `wcompany` (`id`, `code`, `name`, `address1`, `address2`, `city`, `phone`, `email`) VALUES
(2, 'ANR', 'TK.ANYAR', 'MARGASARI', '', 'KAB.TEGAL', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wcustomers`
--

CREATE TABLE `wcustomers` (
  `c_code` varchar(15) NOT NULL,
  `c_id` varchar(20) NOT NULL,
  `c_name` text NOT NULL,
  `c_pob` text NOT NULL,
  `c_dob` date NOT NULL,
  `c_addr` text NOT NULL,
  `c_rt` text NOT NULL,
  `c_kel` text NOT NULL,
  `c_kec` text NOT NULL,
  `c_gender` varchar(1) NOT NULL,
  `c_phone` varchar(20) NOT NULL,
  `c_join` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wcustomers`
--

INSERT INTO `wcustomers` (`c_code`, `c_id`, `c_name`, `c_pob`, `c_dob`, `c_addr`, `c_rt`, `c_kel`, `c_kec`, `c_gender`, `c_phone`, `c_join`) VALUES
('AAJ423', '0', 'AA Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('ABU546', '0', 'Abu Bakar', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('AGU183', '0', 'Agus Jaya Ibu', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('AHM763', '0', 'Ahmad Farigi', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('AKB681', '0', 'Akbar Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('ALE777', '0', 'Alexander', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('ALI531', '0', 'Ali Sodikin Limbangan', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('AMA633', '0', 'Aman', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('AMA603', '0', 'Amanah Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('AMB770', '0', 'Ambo', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('AND376', '0', 'Andini', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('AND338', '0', 'Andri Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('ANU944', '0', 'Anugrah Logam', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('ARK352', '0', 'AR Kaca', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('ARI855', '0', 'Arif Hutan Kayu', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('ARI592', '0', 'Arifin Bas', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('ARM558', '0', 'Armada', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BAD291', '0', 'Badruz Zaman', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BAL672', '0', 'Balong Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BAN249', '0', 'Bangkit Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BAN198', '0', 'Bangun Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BAR940', '0', 'Barokah Jaya Aliyah', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BAR596', '0', 'Barokah Jaya Sumurpanggang', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BAR841', '0', 'Barokah Logam', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BAR462', '0', 'Baru Margasari', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BAW755', '0', 'Bawang Merah', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BER152', '0', 'Berkah Abadi Lebaksiu', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BER646', '0', 'Berkah Debong ', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BER315', '0', 'Berkah Jaya Padasugih', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BER519', '0', 'Berkah Jaya Poso', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BER512', '0', 'Berkah Jaya Slarang Lor', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BER430', '0', 'Berkah Jaya Slatri', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BER693', '0', 'Berkat Poso', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BHA888', '0', 'Bhakti Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BHI324', '0', 'Bhina SP', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BIN125', '0', 'Bina Logam', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BIN352', '0', 'Bintang Mandiri', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BIN595', '0', 'Bintang Sembilan', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BIN376', '0', 'Bintang Terang', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BUS548', '0', 'Bu Siti', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BUD632', '0', 'Budhi Mulya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BUD241', '0', 'Budi Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('BUD826', '0', 'Budi Pekalongan', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('CAH540', '0', 'Cahaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('CAH262', '0', 'Cahaya Baru', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('CAM462', '0', 'Campur Sari', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('CAN694', '0', 'Candra Logam', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('CEM422', '0', 'Cemara Besi', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('CEN278', '0', 'Central Logam', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('CIT329', '0', 'Citra Lestari', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('CVP220', '0', 'CV Putra Adiwerna Satu', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('DAM345', '0', 'Damar Logam', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('DAM288', '0', 'Damir Kluwut', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('DAN915', '0', 'Dandi', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('DAR390', '0', 'Daryuni', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('DAV768', '0', 'David', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('DED819', '0', 'Dedi Jaya Cimohong', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('DEW470', '0', 'Dewi Sri', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('DID142', '0', 'Didi Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('DOA894', '0', 'Doa Ibu', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('DUA138', '0', 'Dua Putra Dampyak', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('DUA446', '0', 'Dua Putra Danawari', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('EMA405', '0', 'Ema Proyek', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('ENC842', '0', 'Encoy (Kalimantan Utama)', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('ENI133', '0', 'Eni Debong', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('EXC142', '0', 'Excite', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('FAH131', '0', 'Fahmi Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('FAI501', '0', 'Faisal Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('FAR293', '0', 'Farizi Halmahera', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('FOR306', '0', 'Fortune', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('GAR173', '0', 'Garuda Logam', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('GEN757', '0', 'Gentong Mas', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('GUN863', '0', 'Gunadi', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('GUN680', '0', 'Guntur', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('HAM520', '0', 'H Amsor', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('H.A283', '0', 'H. Amsor', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('H.A563', '0', 'H. Asikin', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('H.B760', '0', 'H. Bowo', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('H.I993', '0', 'H. Ichong', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('HAK132', '0', 'Hakim Basir', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('HER799', '0', 'Herman', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('HID591', '0', 'Hidayah Brebes', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('HID581', '0', 'Hidayah Kaladawa', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('HIK497', '0', 'Hikmah Karanganyar', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('IBT926', '0', 'IBT', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('INC506', '0', 'Inchi Tani', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('IND691', '0', 'Indo Logam', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('INS656', '0', 'Insani', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('INT919', '0', 'Intan Pedana', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('ISM481', '0', 'Isma Logam', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('J21598', '0', 'J 21', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('JAY105', '0', 'Jaya Berkah', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('JAY802', '0', 'Jaya Binangun', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('JAY396', '0', 'Jaya Lestari', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('JAY988', '0', 'Jaya Makmur', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('JAY914', '0', 'Jaya Tani', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('KAL136', '0', 'Kaligung', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('KAR268', '0', 'Karya Alam', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('KAY106', '0', 'Kayala', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('KIO149', '0', 'Kios Nur', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('KIT490', '0', 'Kita Baru', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('KIT455', '0', 'Kita Jaya (Zeni)', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('KIT972', '0', 'Kita Krandon', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('KON693', '0', 'Koniah', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('LAN395', '0', 'Langgan Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('LAN304', '0', 'Langgan Peleman', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('LAN982', '0', 'Langgeng (Tegal)', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('LAN985', '0', 'Langgeng Jaya Banjaran', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('LAN827', '0', 'Langgeng Jaya Slawi', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('LIM785', '0', 'Lima Saudara', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('LOG371', '0', 'Logam Agung', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('LOG978', '0', 'Logam Gemilang', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('LOG698', '0', 'Logam Kita', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('LOG141', '0', 'Logam Sejahtera', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('LOH446', '0', 'Loh Jinawi', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MAJ469', '0', 'Maju Pagongan', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MAK596', '0', 'Makmur Abadi Banjaratma', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MAK882', '0', 'Makmur Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MAK902', '0', 'Makmur Jaya Listrik ', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MAL452', '0', 'Malun', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MAS323', '0', 'Masroh Songgom', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MBA891', '0', 'Mba Titi Brebes', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MEK143', '0', 'Mekar Jaya Kalisapu', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MEK197', '0', 'Mekar Jaya Lebaksiu', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MIR962', '0', 'Mirafiq', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MOH238', '0', 'Moh. Juanda', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MOI371', '0', 'Moi', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MUL412', '0', 'Mulia Abadi Pagongan', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MUL988', '0', 'Mulia Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MUL268', '0', 'Mulia Jaya Brebes', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MUL630', '0', 'Mulia Jaya Pangkah', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MUL787', '0', 'Mulia Logam', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MUL495', '0', 'Mulyani', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MUN469', '0', 'Muncul Jaya ', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MUR479', '0', 'Murni', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MUS222', '0', 'Mustika', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MUT744', '0', 'Mutiara Logam Karanganyar', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('MUT552', '0', 'Mutiara Slawi', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('NEL404', '0', 'Nelayan Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('NIT861', '0', 'Nita Semarang', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('NUR424', '0', 'Nur Fitri', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('NUR175', '0', 'Nurbeti', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('NUS186', '0', 'Nusa Jaya Tarub', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('NUS152', '0', 'Nusantara Brebes', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('OYI121', '0', 'Oying', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('PAN989', '0', 'Pandan Ayu', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('PAU614', '0', 'Paulus Cirebon', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('PEN822', '0', 'Pendil Wesi', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('PER137', '0', 'Perdana ', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('PER890', '0', 'Perdana Putra Berkah', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('PTA691', '0', 'PT Aset Teknik Artha Sentosa', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('PUT930', '0', 'Putra Fadil', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('PUT451', '0', 'Putra Fadil', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('PUT895', '0', 'Putra Jaya Bengle', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('PUT501', '0', 'Putra Mitra Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('PUT485', '0', 'Putra Sari', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('PUT591', '0', 'Putra Tunggal Mona', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('PUT136', '0', 'Putri Logam', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('PUT712', '0', 'Putri Tunggal Jagalempeni', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('RAH561', '0', 'Rahayu', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('REK709', '0', 'Reka Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('REK481', '0', 'Rekso Logam', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('REK711', '0', 'Rekso Mandiri', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('RIS438', '0', 'Risma Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('ROB254', '0', 'Robi Putra', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('RUK300', '0', 'Rukun Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('RYA823', '0', 'Ryan Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SAP992', '0', 'SA Produk', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SAB700', '0', 'Sabila Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SAK421', '0', 'Saka Baja', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SAK580', '0', 'Sakana', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SAM320', '0', 'Samiaji Klampok', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SAM235', '0', 'Samiaji Lemahduwur', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SAM897', '0', 'Samiaji Talang', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SAM625', '0', 'Samiun', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SAM331', '0', 'Samudra Mejasem', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SAN668', '0', 'Sanggar Mebel', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SAT624', '0', 'Satria Utama', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SEK944', '0', 'Sekar', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SEM278', '0', 'Semi Teknik', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SEM296', '0', 'Sempurna Kemantran', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SEM498', '0', 'Sempurna Limbangan', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SEM294', '0', 'Sempurna Tegal', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SEN207', '0', 'Sentosa Danawari', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SEN609', '0', 'Sentosa Jaya Tegal', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SEN901', '0', 'Sentral Logam Slawi', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SER543', '0', 'Serbaguna ', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SET294', '0', 'Setia', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SET874', '0', 'Setiakawan', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SIM917', '0', 'Simpang Tiga', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SIN640', '0', 'Sinar Abadi Tuwel', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SIN625', '0', 'Sinar Asih', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SIN461', '0', 'Sinar Jaya Kemantran', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SIN810', '0', 'Sinar Jaya Setiabudi', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SIN255', '0', 'Sinar Karanganyar', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SIN980', '0', 'Sinar Logam Balapulang', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SIN198', '0', 'Sinar Logam Jatilaba', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SIN171', '0', 'Sinar Logam Margasari', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SIN127', '0', 'Sinar Rejeki', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SIN213', '0', 'Sinar Sakti', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SOB787', '0', 'Sobat Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SON481', '0', 'Sona Logam', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SUB286', '0', 'Subur Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SUL541', '0', 'Sulawesi', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SUM780', '0', 'Sumber Jaya Tegal', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SUM379', '0', 'Sumber Rejeki Kluwut', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SUR403', '0', 'Surya Abadi', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SUR120', '0', 'Surya Agung', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SUR292', '0', 'Surya Logam', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SUT601', '0', 'Sutikwo', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('TAM407', '0', 'Tambah Barokah', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('TAN750', '0', 'Tani Makmur', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('TAU172', '0', 'Taufik Hidayat', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('TIG482', '0', 'Tiga Saudara', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('TIG683', '0', 'Tiga Sekawan', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('TIG523', '0', 'Tiga Utama Mejasem', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('TIG896', '0', 'Tiga Utama Putri', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('TRE611', '0', 'Tresna Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('TUJ428', '0', 'Tujuh Putera', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('TUN756', '0', 'Tunas Jaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('UMI436', '0', 'Umi Bulakamba (Barokah Jaya)', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('UMI766', '0', 'Umi Lestari', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('USA385', '0', 'Usaha Mandiri', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('USA889', '0', 'Usaha Putra', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('UTA444', '0', 'Utama Selatri', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('WAS125', '0', 'Wasro\'i', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('WIJ331', '0', 'Wijaya', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('WIL432', '0', 'Wildan Logam', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('WMJ367', '0', 'WMJ', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('YAN402', '0', 'Yanto Piere Tendean', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('YOH861', '0', 'Yohan Batanghari', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('YUN183', '0', 'Yuno/Lidia', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('SAM187', '0', 'Samsul Ketanggungan', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('LUT641', '0', 'Lutfi Ketanggungan', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21'),
('DAV888', '0', 'David Bulakamba', 'TEGAL', '2022-01-21', '0', '0', '0', '0', '0', '0', '2022-01-21');

-- --------------------------------------------------------

--
-- Table structure for table `wgroups`
--

CREATE TABLE `wgroups` (
  `g_code` varchar(15) NOT NULL,
  `g_name` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wgroups`
--

INSERT INTO `wgroups` (`g_code`, `g_name`) VALUES
('SMN001', 'SEMEN'),
('SMN002', 'SEMEN PUTIH'),
('SMN003', 'SEMEN KILOAN');

-- --------------------------------------------------------

--
-- Table structure for table `winvent`
--

CREATE TABLE `winvent` (
  `c_code` varchar(15) NOT NULL,
  `c_group` varchar(10) NOT NULL,
  `c_name` varchar(50) NOT NULL,
  `c_cogs` float NOT NULL,
  `c_sales` float NOT NULL,
  `c_status` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `winventory`
--

CREATE TABLE `winventory` (
  `i_code` varchar(15) NOT NULL,
  `g_code` varchar(15) NOT NULL,
  `i_supp` varchar(10) NOT NULL,
  `i_barcode` varchar(20) NOT NULL,
  `i_name` varchar(60) NOT NULL,
  `i_qty` float NOT NULL,
  `i_qtymin` float NOT NULL,
  `i_unit` varchar(10) NOT NULL,
  `i_size` varchar(20) NOT NULL,
  `i_color` varchar(20) NOT NULL,
  `i_brands` varchar(20) NOT NULL,
  `i_article` text NOT NULL,
  `i_cogs` float NOT NULL,
  `i_kdsell` varchar(10) NOT NULL,
  `i_sell` float NOT NULL,
  `i_sell2` float NOT NULL,
  `i_sell3` float NOT NULL,
  `i_sell4` float NOT NULL,
  `i_sell5` float NOT NULL,
  `i_sell6` float NOT NULL,
  `i_sell7` float NOT NULL,
  `i_sell8` float NOT NULL,
  `i_sell9` float NOT NULL,
  `i_sell10` float NOT NULL,
  `i_status` varchar(1) NOT NULL,
  `ware_id` varchar(10) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `winventory`
--

INSERT INTO `winventory` (`i_code`, `g_code`, `i_supp`, `i_barcode`, `i_name`, `i_qty`, `i_qtymin`, `i_unit`, `i_size`, `i_color`, `i_brands`, `i_article`, `i_cogs`, `i_kdsell`, `i_sell`, `i_sell2`, `i_sell3`, `i_sell4`, `i_sell5`, `i_sell6`, `i_sell7`, `i_sell8`, `i_sell9`, `i_sell10`, `i_status`, `ware_id`, `id`) VALUES
('1', 'GOL031', 'none', '8996001301142', 'ROMA KELAPA 300GR', 1080, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 6811, 7500, 7250, 0, 7250, 0, 0, 0, 0, 0, 'A', 'none', 1),
('2', 'GOL029', 'none', '8991002103733', 'KOPI GOOD DAY FREEZE 30 G MOCAFRIO', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 16175.6, 17000, 0, 0, 17000, 0, 0, 0, 0, 0, 'A', 'none', 2),
('3', '', 'none', '3', 'AMPLOP *?', -1, 0, 'DUS', 'none', 'none', 'none', 'none', 0, 'none', 5000, 6000, 0, 0, 6000, 0, 0, 0, 0, 0, 'A', 'none', 3),
('4', 'GOL015', 'none', '8998989110129', 'ROKOK SURYA 12 MERAH', 7, 0, 'BKS', 'none', 'none', 'none', 'none', 0, 'none', 18500, 19000, 18750, 0, 18750, 0, 0, 0, 0, 0, 'A', 'none', 4),
('5', '', 'none', '5', 'SARILADA 500 GR', 63, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3000, 3500, 0, 0, 3500, 0, 0, 0, 0, 0, 'A', 'none', 5),
('6', 'GOL016', 'none', '7118443300090', 'SARDEN ABC KECIL TOMAT', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 5878, 7500, 0, 0, 7500, 0, 0, 0, 0, 0, 'A', 'none', 6),
('7', 'GOL016', 'none', '711844330146', 'SARDEN ABC EXTRA PEDAS 155G', 1, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 8500, 9500, 0, 0, 9500, 0, 0, 0, 0, 0, 'A', 'none', 7),
('8', 'GOL001', 'none', '8', 'TEH ZEGAR', 0, 0, 'DUS', 'none', 'none', 'none', 'none', 0, 'none', 19000, 19500, 0, 0, 19500, 0, 0, 0, 0, 0, 'A', 'none', 8),
('9', '', 'none', '9', 'TEH GELAS', 0, 0, 'DUS', 'none', 'none', 'none', 'none', 0, 'none', 19000, 18500, 0, 0, 18500, 0, 0, 0, 0, 0, 'A', 'none', 9),
('1154', 'GOL018', 'none', '89988661064980', 'HBL LOVELY NATURALS 100 ML GREEN TEA', 6, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2900, 4000, 3750, 3500, 3500, 0, 0, 0, 0, 0, 'A', 'none', 10),
('11', 'GOL005', 'none', '11', 'JAGUNG MARNING1/4KG -', -6, 0, 'BKS', 'none', 'none', 'none', 'none', 0, 'none', 4000, 5000, 0, 0, 5000, 0, 0, 0, 0, 0, 'A', 'none', 11),
('12', 'GOL053', 'none', '12', 'SOUN ARJUNA', 2, 0, 'BKS', 'none', 'none', 'none', 'none', 0, 'none', 9500, 11000, 0, 0, 11000, 0, 0, 0, 0, 0, 'A', 'none', 12),
('13', 'GOL039', 'none', '13', 'KRUPUK MERAH ACI 3KG', 17, 0, 'BAL', 'none', 'none', 'none', 'none', 0, 'none', 36000, 42000, 0, 0, 42000, 0, 0, 0, 0, 0, 'A', 'none', 13),
('14', '', 'none', '14', 'HUNGKWEH ANGGARISI 50', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 860, 1000, 950, 0, 950, 0, 0, 0, 0, 0, 'A', 'none', 14),
('15', 'GOL049', 'none', '15', 'PRIMA 15 IKET', 0, 0, 'IKET', 'none', 'none', 'none', 'none', 0, 'none', 3650, 4000, 3900, 0, 4000, 3900, 0, 0, 0, 0, 'A', 'none', 15),
('16', 'GOL059', 'none', '16', 'KARET KUPU 1/2KG', 0, 0, 'BKS', 'none', 'none', 'none', 'none', 0, 'none', 11000, 13000, 0, 0, 13000, 0, 0, 0, 0, 0, 'A', 'none', 16),
('17', 'GOL004', 'none', '17', 'TRASI KECIL', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 1770, 2000, 0, 0, 2000, 0, 0, 0, 0, 0, 'A', 'none', 17),
('18', 'GOL004', 'none', '18', 'TRASI BESAR', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 6500, 7500, 0, 0, 7500, 0, 0, 0, 0, 0, 'A', 'none', 18),
('19', 'GOL003', 'none', '19', 'TEPUNG TIGA RODA', 1, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2175, 2500, 0, 0, 2500, 0, 0, 0, 0, 0, 'A', 'none', 19),
('20', '', 'none', '20', 'PLASTIK ES 8X20', 0, 0, 'PAK', 'none', 'none', 'none', 'none', 0, 'none', 7125, 8000, 0, 0, 8000, 0, 0, 0, 0, 0, 'A', 'none', 20),
('21', '', 'none', '21', 'PLASTIK ES 10X17 **', 1, 0, 'PAK', 'none', 'none', 'none', 'none', 0, 'none', 8000, 9000, 0, 0, 9000, 0, 0, 0, 0, 0, 'A', 'none', 21),
('22', '', 'none', '22', 'PLASTIK ES 12X20 **', 0, 0, 'PAK', 'none', 'none', 'none', 'none', 0, 'none', 7125, 8000, 0, 0, 8000, 0, 0, 0, 0, 0, 'A', 'none', 22),
('23', '', 'none', '23', 'PLASTIK ES 15X25 **', 9, 0, 'PAK', 'none', 'none', 'none', 'none', 0, 'none', 8000, 9000, 0, 0, 9000, 0, 0, 0, 0, 0, 'A', 'none', 23),
('1020', 'GOL017', 'none', '8992796033244', 'BEDAK VIVA NO 4 SACHET', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 0, 1000, 0, 0, 1000, 0, 0, 0, 0, 0, 'A', 'none', 24),
('24', 'GOL004', 'none', '24', 'RAGI TAPE **', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 8000, 1500, 0, 0, 1500, 0, 0, 0, 0, 0, 'A', 'none', 25),
('25', 'GOL049', 'none', '25', 'PLASTIK PUTIH 6X10', 2, 0, 'PAK', 'none', 'none', 'none', 'none', 0, 'none', 8000, 9000, 0, 0, 9000, 0, 0, 0, 0, 0, 'A', 'none', 26),
('26', 'GOL049', 'none', '26', 'PLASTIK PUTIH 8X12', 2, 0, 'PAK', 'none', 'none', 'none', 'none', 0, 'none', 8000, 9000, 0, 0, 9000, 0, 0, 0, 0, 0, 'A', 'none', 27),
('27', 'GOL049', 'none', '27', 'PLASTIK PUTIH 9X15', 0, 0, 'PAK', 'none', 'none', 'none', 'none', 0, 'none', 8000, 9000, 0, 0, 9000, 0, 0, 0, 0, 0, 'A', 'none', 28),
('28', 'GOL049', 'none', '28', 'PLASTIK PUTIH 10X17', 2, 0, 'PAK', 'none', 'none', 'none', 'none', 0, 'none', 8000, 9000, 0, 0, 9000, 0, 0, 0, 0, 0, 'A', 'none', 29),
('29', 'GOL049', 'none', '29', 'PLASTIK PUTIH 12X20', 4, 0, 'PAK', 'none', 'none', 'none', 'none', 0, 'none', 8000, 9000, 0, 0, 9000, 0, 0, 0, 0, 0, 'A', 'none', 30),
('30', 'GOL049', 'none', '30', 'PLASTIK PUTIH 15X25', 9, 0, 'PAK', 'none', 'none', 'none', 'none', 0, 'none', 8000, 9000, 0, 0, 9000, 0, 0, 0, 0, 0, 'A', 'none', 31),
('31', 'GOL049', 'none', '31', 'PLASTIK PUTIH 15X30', 6, 0, 'PAK', 'none', 'none', 'none', 'none', 0, 'none', 8000, 9000, 0, 0, 9000, 0, 0, 0, 0, 0, 'A', 'none', 32),
('34', '', 'none', '34', 'PLASTIK PUTIH 23X40', 5, 0, 'PAK', 'none', 'none', 'none', 'none', 0, 'none', 8000, 9000, 0, 0, 9000, 0, 0, 0, 0, 0, 'A', 'none', 33),
('33', 'GOL049', 'none', '33', 'PLASTIK PUTIH 20X30', 12, 0, 'PAK', 'none', 'none', 'none', 'none', 0, 'none', 8000, 9000, 0, 0, 9000, 0, 0, 0, 0, 0, 'A', 'none', 34),
('35', 'GOL049', 'none', '35', 'PLASTIK PUTIH 26X50', 3, 0, 'PAK', 'none', 'none', 'none', 'none', 0, 'none', 8000, 9000, 0, 0, 9000, 0, 0, 0, 0, 0, 'A', 'none', 35),
('36', 'GOL049', 'none', '36', 'PLASTIK UNYIL WARNA', 159, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 1350, 2000, 1500, 0, 1500, 0, 0, 0, 0, 0, 'A', 'none', 36),
('37', 'GOL049', 'none', '37', 'PLASTIK UNYIL GM HITAM', 76, 0, 'BKS', 'none', 'none', 'none', 'none', 0, 'none', 1650, 2500, 0, 0, 2500, 0, 0, 0, 0, 0, 'A', 'none', 37),
('38', 'GOL049', 'none', '38', 'PLASTIK 28 GM', 72, 0, 'BKS', 'none', 'none', 'none', 'none', 0, 'none', 5125, 5500, 0, 0, 5500, 0, 0, 0, 0, 0, 'A', 'none', 38),
('39', 'GOL050', 'none', '39', 'TALI RAFIA 250 GRAM', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 4000, 5000, 0, 0, 5000, 0, 0, 0, 0, 0, 'A', 'none', 39),
('40', '', 'none', '40', 'TALI RAFIA 500 GRAM', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 8000, 9000, 0, 0, 9000, 0, 0, 0, 0, 0, 'A', 'none', 40),
('41', 'GOL050', 'none', '41', 'TALI RAFIA 1KG', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 16000, 18000, 0, 0, 18000, 0, 0, 0, 0, 0, 'A', 'none', 41),
('42', '', 'none', '42', 'REMI', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 42000, 45000, 0, 0, 45000, 0, 0, 0, 0, 0, 'A', 'none', 42),
('43', 'GOL014', 'none', '43', 'GULA BATU KECIL', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 0, 1500, 1400, 1250, 1500, 1250, 0, 0, 0, 0, 'A', 'none', 43),
('44', 'GOL054', 'none', '44', 'GULA BATU 1/4 KG', 28, 0, 'BKS', 'none', 'none', 'none', 'none', 0, 'none', 5150, 6000, 0, 0, 6000, 0, 0, 0, 0, 0, 'A', 'none', 44),
('45', 'GOL014', 'none', '45', 'GULA BATU 1/2KG', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 10500, 12000, 0, 0, 12000, 0, 0, 0, 0, 0, 'A', 'none', 45),
('46', 'GOL062', 'none', '46', 'DOMINO', 0, 0, 'PAK', 'none', 'none', 'none', 'none', 0, 'none', 20500, 22000, 0, 0, 22000, 0, 0, 0, 0, 0, 'A', 'none', 46),
('47', '', 'none', '47', 'SLINDUR 12 PCS', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 1125, 1500, 0, 0, 1500, 0, 0, 0, 0, 0, 'A', 'none', 47),
('48', '', 'none', '48', 'VANELI KUDA 10 GT', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 850, 1500, 0, 0, 1500, 0, 0, 0, 0, 0, 'A', 'none', 48),
('49', 'GOL086', 'none', '49', 'SODIUM MIKI BIRU', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3000, 3500, 0, 0, 3500, 0, 0, 0, 0, 0, 'A', 'none', 49),
('50', '', 'none', '50', 'SODIUM MERAH RENTENG', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 6500, 7500, 0, 0, 7500, 0, 0, 0, 0, 0, 'A', 'none', 50),
('51', '', 'none', '8992931025073', 'TISSU MULTI', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 4000, 5000, 0, 0, 5000, 0, 0, 0, 0, 0, 'A', 'none', 51),
('52', '', 'none', '8992931005181', 'TISSU TESSA', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2000, 3000, 0, 0, 3000, 0, 0, 0, 0, 0, 'A', 'none', 52),
('53', 'GOL017', 'none', '8999999053031', 'PONDS FACIAL FOAM 100 GR MERAH -', 9, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 26347, 27500, 0, 0, 27500, 0, 0, 0, 0, 0, 'A', 'none', 53),
('54', 'GOL017', 'none', '8999999717018', 'PONDS FACIAL FOAM 50 G HIJAU -', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 14450, 16000, 0, 0, 16000, 0, 0, 0, 0, 0, 'A', 'none', 54),
('55', 'GOL017', 'none', '8999999052973', 'PONDS FACIAL FOAM 50 G HITAM -', 6, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 18700, 20000, 0, 0, 20000, 0, 0, 0, 0, 0, 'A', 'none', 55),
('56', 'GOL017', 'none', '8999999053048', 'PONDS FACIAL FOAM 100G CHARCOAL -', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 25520, 27000, 0, 0, 27000, 0, 0, 0, 0, 0, 'A', 'none', 56),
('57', 'GOL017', 'none', '8999999053062', 'PONDS FACIAL SECRUB 100G HIJAU -', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 22250, 25000, 0, 0, 25000, 0, 0, 0, 0, 0, 'A', 'none', 57),
('58', 'GOL017', 'none', '8999999052959', 'PONDS FACIAL FOAM 50G MERAH', 20, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 17490, 18500, 0, 0, 18500, 0, 0, 0, 0, 0, 'A', 'none', 58),
('59', 'GOL069', 'none', '8999999049508', 'REXONA ROLL ON SHOWER CLEAN', 1, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 13750, 17000, 0, 0, 17000, 0, 0, 0, 0, 0, 'A', 'none', 59),
('60', '', 'none', '8999999720766', 'REXONA ROLL ON MEN 40 -', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 16125, 17000, 0, 0, 17000, 0, 0, 0, 0, 0, 'A', 'none', 60),
('61', '', 'none', '8999999049454', 'REXONA ROLL ON FREE SPIRIT 40 -', -1, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 16178, 17000, 0, 0, 17000, 0, 0, 0, 0, 0, 'A', 'none', 61),
('62', 'GOL069', 'none', '8999999049409', 'REXONA ROLL ON MEN ICE COOL', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 12900, 17000, 0, 0, 17000, 0, 0, 0, 0, 0, 'A', 'none', 62),
('63', 'GOL017', 'none', '8999999007782', 'FAIR&LOVELY CREAM 25G', 53, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 15500, 18500, 0, 0, 18500, 0, 0, 0, 0, 0, 'A', 'none', 63),
('1514', 'GOL001', 'none', '89970250601830', 'BIG COLA LEMON', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3000, 3500, 3350, 0, 3300, 0, 0, 0, 0, 0, 'A', 'none', 64),
('65', 'GOL017', 'none', '8999999056841', 'PONDS BRIGHT BEAUTY CREAM 20 G', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 18600, 21000, 0, 0, 21000, 0, 0, 0, 0, 0, 'A', 'none', 65),
('66', 'GOL013', 'none', '8999999033163', 'SAMPO LIFEBUOY BTL STRONG 70 ML -', 5, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 9900, 11000, 0, 0, 11000, 0, 0, 0, 0, 0, 'A', 'none', 66),
('67', 'GOL013', 'none', '8999999033170', 'SAMPO LIFEBUOY BTL STRONG 170 ML', 5, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 14915, 18000, 0, 0, 18000, 0, 0, 0, 0, 0, 'A', 'none', 67),
('68', 'GOL013', 'none', '8999999029616', 'SAMPO CLEAR BTL ICE MENTHOL 170 ML -', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 20100, 22000, 0, 0, 22000, 0, 0, 0, 0, 0, 'A', 'none', 68),
('69', 'GOL013', 'none', '8999999043797', 'SAMPO CLEAR BTL ICE MENTOL 70 ML -', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 9100, 10500, 0, 0, 10500, 0, 0, 0, 0, 0, 'A', 'none', 69),
('70', 'GOL013', 'none', '8999999048181', 'SAMPO SUNSILK BLACK BTL 170ML', 7, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 17500, 23000, 0, 0, 23000, 0, 0, 0, 0, 0, 'A', 'none', 70),
('71', 'GOL013', 'none', '8999999048174', 'SAMPO BTL SUNSILK 70ML HITAM', 7, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 10670, 11500, 0, 0, 11500, 0, 0, 0, 0, 0, 'A', 'none', 71),
('72', 'GOL013', 'none', '8999999048259', 'SAMPO SUNSILK BTL 70ML KUNING', 6, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 10670, 11500, 0, 0, 11500, 0, 0, 0, 0, 0, 'A', 'none', 72),
('73', 'GOL013', 'none', '8999999048488', 'SUNSILK HIJAB 70ML', 3, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 10670, 11500, 0, 0, 11500, 0, 0, 0, 0, 0, 'A', 'none', 73),
('74', 'GOL010', 'none', '8999999401238', 'RINSO 800 GR -', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 15584, 23000, 0, 0, 23000, 0, 0, 0, 0, 0, 'A', 'none', 74),
('75', 'GOL010', 'none', '8999999401221', 'RINSO 430 GR -', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 8900, 10000, 0, 0, 10000, 0, 0, 0, 0, 0, 'A', 'none', 75),
('76', 'GOL010', 'none', '8999999047221', 'RINSO AN 46 GR -', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 4704, 5500, 0, 0, 5500, 0, 0, 0, 0, 0, 'A', 'none', 76),
('77', 'GOL010', 'none', '8999999047245', 'RINSO MOLTO 46 GR -', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 4830, 5500, 0, 0, 5500, 0, 0, 0, 0, 0, 'A', 'none', 77),
('78', 'GOL010', 'none', '8999999047924', 'RINSO AN 23 GR -', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 2520, 3000, 0, 0, 2800, 0, 0, 0, 0, 0, 'A', 'none', 78),
('79', 'GOL010', 'none', '8999999047252', 'RINSO ANTI NODA CAIR 42 ML -', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 4830, 5500, 0, 0, 5500, 0, 0, 0, 0, 0, 'A', 'none', 79),
('80', 'GOL010', 'none', '8999999047238', 'RINSO CAIR MOLTO 42 ML -', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 4830, 5500, 0, 0, 5250, 0, 0, 0, 0, 0, 'A', 'none', 80),
('81', 'GOL035', 'none', '8999999407896', 'WIPOL BOTOL 450 ML -', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 14190, 15500, 0, 0, 15500, 0, 0, 0, 0, 0, 'A', 'none', 81),
('82', 'GOL035', 'none', '8992747180126', 'VIXAL 500 ML BIRU', 2, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 17083, 18500, 18000, 0, 18000, 0, 0, 0, 0, 0, 'A', 'none', 82),
('83', 'GOL035', 'none', '8999999500672', 'VIXAL 190 ML', 18, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 4375, 5000, 0, 0, 5000, 0, 0, 0, 0, 0, 'A', 'none', 83),
('85', 'GOL035', 'none', '8999999407872', 'WIPOL 450ML REFILL -', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 8900, 10000, 0, 0, 10000, 0, 0, 0, 0, 0, 'A', 'none', 84),
('86', 'GOL047', 'none', '8999999706111', 'PEPSODENT 25G -', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 1450, 1700, 0, 0, 1700, 0, 0, 0, 0, 0, 'A', 'none', 85),
('87', 'GOL047', 'none', '8999999706180', 'PEPSODENT 190GR -', 20, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 10417, 12000, 0, 0, 12000, 0, 0, 0, 0, 0, 'A', 'none', 86),
('88', 'GOL047', 'none', '8999999706081', 'PEPSODENT 75G', 56, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3993, 4500, 4250, 0, 4250, 0, 0, 0, 0, 0, 'A', 'none', 87),
('1299', 'GOL035', 'none', '89999994069360', 'SUPERPELL REFILL 400ML LEMON GINGER -', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 5550, 6500, 0, 0, 6500, 0, 0, 0, 0, 0, 'A', 'none', 88),
('90', 'GOL047', 'none', '8999999710880', 'PEPSODENT HERBAL 75G', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 6985, 8000, 7750, 7500, 7500, 0, 0, 0, 0, 0, 'A', 'none', 89),
('91', 'GOL047', 'none', '8999999707859', 'CLOSEUP DEEP ACTION 160G', 10, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 15950, 17000, 0, 0, 17000, 0, 0, 0, 0, 0, 'A', 'none', 90),
('92', 'GOL011', 'none', '8999999707835', 'CLOSE UP DEEP ACTION 65G -', 16, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 6215, 7000, 0, 0, 6500, 0, 0, 0, 0, 0, 'A', 'none', 91),
('93', 'GOL047', 'none', '8999999707781', 'PEPSODENT WHITENING 190G', 21, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 17875, 19000, 0, 0, 19000, 0, 0, 0, 0, 0, 'A', 'none', 92),
('94', 'GOL013', 'none', '8999999039141', 'DOVE TOTAL DAMAGE TREATMENT 10 ML -', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 9600, 10500, 0, 0, 10500, 0, 0, 0, 0, 0, 'A', 'none', 93),
('95', 'GOL013', 'none', '8999999039103', 'DOVE TOTAL HAIR FALL TREATMENT 70ML -', 1, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 11150, 12000, 0, 0, 12000, 0, 0, 0, 0, 0, 'A', 'none', 94),
('96', 'GOL013', 'none', '8999999027032', 'SHAMPO LIFEBUOY HIJAU 1X10ML -', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 4250, 5000, 0, 0, 5000, 0, 0, 0, 0, 0, 'A', 'none', 95),
('97', 'GOL013', 'none', '8999999041151', 'DOVE DAILY SHINE 10ML -', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 9600, 10500, 0, 0, 10500, 0, 0, 0, 0, 0, 'A', 'none', 96),
('98', 'GOL013', 'none', '8999999045760', 'SAMPO TRESEMME KERATIN SMOOTH 10ML -', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 9300, 10000, 0, 0, 10000, 0, 0, 0, 0, 0, 'A', 'none', 97),
('99', 'GOL013', 'none', '8999999045784', 'SAMPO TRESEMME SCALP CARE 10ML -', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 9300, 10000, 0, 0, 10000, 0, 0, 0, 0, 0, 'A', 'none', 98),
('100', 'GOL013', 'none', '8999999041205', 'DOVE DANDRUFF CARE 10 ML -', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 9600, 10500, 0, 0, 10500, 0, 0, 0, 0, 0, 'A', 'none', 99),
('101', 'GOL013', 'none', '8999999039097', 'DOVE TOTAL HAIR FALL TREATMENT 10ML -', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 9600, 10500, 0, 0, 10500, 0, 0, 0, 0, 0, 'A', 'none', 100),
('102', 'GOL011', 'none', '8999999059309', 'SABUN LIFEBUOY TOTAL 10 80G -', 182, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2882, 3500, 3400, 0, 3400, 0, 0, 0, 0, 0, 'A', 'none', 101),
('103', 'GOL011', 'none', '8999999059323', 'SABUN LIFEBUOY LEMON FRESH 80G -', 69, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2916.66, 3500, 3400, 0, 3400, 0, 0, 0, 0, 0, 'A', 'none', 102),
('104', 'GOL011', 'none', '8999999059316', 'SABUN LIFEBUOY MILD CARE 80G -', 165, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2882, 3500, 3400, 0, 3400, 0, 0, 0, 0, 0, 'A', 'none', 103),
('105', 'GOL011', 'none', '8999999036607', 'SABUN LUX SOFT ROSE -', 11, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3635, 4000, 0, 0, 3850, 0, 0, 0, 0, 0, 'A', 'none', 104),
('106', 'GOL011', 'none', '8999999036690', 'SABUN LUX MAGICAL SPELL -', 12, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3635, 4000, 0, 0, 3850, 0, 0, 0, 0, 0, 'A', 'none', 105),
('107', 'GOL011', 'none', '8999999036638', 'SABUN LUX VELVET TOUCH -', 14, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3635, 4000, 0, 0, 3850, 0, 0, 0, 0, 0, 'A', 'none', 106),
('108', 'GOL017', 'none', '8934868015024', 'REXONA DEO-LOTION FREE SPIRIT 11.25GR SACHET', 115, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 1840, 2500, 2250, 0, 2250, 0, 0, 0, 0, 0, 'A', 'none', 107),
('109', 'GOL017', 'none', '8934868015031', 'REXONA MEN 9 GR SACHET -', 93, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 1771, 2500, 2250, 0, 2250, 0, 0, 0, 0, 0, 'A', 'none', 108),
('110', 'GOL013', 'none', '8999999048242', 'SAMPO SUNSILK SOFT AND SMOOTH 10ML -', 8, 0, 'PAK', 'none', 'none', 'none', 'none', 0, 'none', 9660, 10000, 0, 0, 10000, 0, 0, 0, 0, 0, 'A', 'none', 109),
('111', 'GOL013', 'none', '8999999048167', 'SAMPO SUNSILK BLACK SHINE 10ML -', -11, 0, 'PAK', 'none', 'none', 'none', 'none', 0, 'none', 9660, 10000, 0, 0, 10000, 0, 0, 0, 0, 0, 'A', 'none', 110),
('112', 'GOL013', 'none', '8999999027599', 'SHAMPO CLEAR ICE COOL MENTHOL 10ML -', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 8250, 9000, 0, 0, 9000, 0, 0, 0, 0, 0, 'A', 'none', 111),
('113', 'GOL013', 'none', '8998866100885', 'SHAMPO EMERON SOFT & SMOOTH 6ML', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 2160, 2500, 0, 0, 2500, 0, 0, 0, 0, 0, 'A', 'none', 112),
('114', 'GOL013', 'none', '8998866102001', 'ZINC HAIR FALL TREATMENT 6ML', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 2160, 2500, 0, 0, 2500, 0, 0, 0, 0, 0, 'A', 'none', 113),
('115', 'GOL013', 'none', '8999999027056', 'SHAMPO LIFEBUOY ANTI KETOMBE 10ML -', 12, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 4250, 5000, 0, 0, 5000, 0, 0, 0, 0, 0, 'A', 'none', 114),
('116', 'GOL013', 'none', '8998866100854', 'SHAMPO EMERON HAIR FALL CPNTROL 6ML', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 2160, 2500, 0, 0, 2500, 0, 0, 0, 0, 0, 'A', 'none', 115),
('117', 'GOL013', 'none', '4902430720298', 'SAMPO REJOICE SMOOTHNESS EXPERT SACHET', 0, 0, 'LUSIN', 'none', 'none', 'none', 'none', 0, 'none', 4125, 5000, 4750, 0, 4750, 0, 0, 0, 0, 0, 'A', 'none', 116),
('118', 'GOL013', 'none', '4902430566896', 'SAMPO HEADS & SHOULDERS COOL MENTHOL SACHET', 46, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 9428.1, 9500, 0, 0, 9500, 0, 0, 0, 0, 0, 'A', 'none', 117),
('119', 'GOL013', 'none', '4902430563871', 'SAMPO PANTENE RAMBUT RONTOK SACHET', 13, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 8875, 9500, 0, 0, 9500, 0, 0, 0, 0, 0, 'A', 'none', 118),
('120', 'GOL013', 'none', '4902430563888', 'SAMPO PANTENE HITAM & PANJANG SACHET', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 8452, 9500, 0, 0, 9500, 0, 0, 0, 0, 0, 'A', 'none', 119),
('121', 'GOL013', 'none', '4902430563864', 'SAMPO PANTENE ANTI KETOMBE SACHET', 13, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 8452, 9500, 0, 0, 9500, 0, 0, 0, 0, 0, 'A', 'none', 120),
('122', 'GOL018', 'none', '8999999003807', 'HBL CITRA BENGKOANG SACET', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 4200, 5000, 0, 0, 5000, 0, 0, 0, 0, 0, 'A', 'none', 121),
('123', 'GOL017', 'none', '8999999007768', 'FAIR&LOVELY CREAM 9G SACHET', 97, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3055.55, 4000, 3750, 0, 3750, 0, 0, 0, 0, 0, 'A', 'none', 122),
('124', 'GOL011', 'none', '8998866608312', 'GIV WHITE PEPAYA', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2050, 2200, 2150, 0, 2150, 0, 0, 0, 0, 0, 'A', 'none', 123),
('125', 'GOL011', 'none', '8992946521836', 'SHINZUI KENSO', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3230, 4000, 3750, 0, 4000, 3750, 0, 0, 0, 0, 'A', 'none', 124),
('126', 'GOL011', 'none', '8992946511790', 'SHINZUI MATSU', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3230, 4000, 3750, 0, 4000, 3750, 0, 0, 0, 0, 'A', 'none', 125),
('127', 'GOL011', 'none', '8992803661644', 'SABUN PAPAYA BDL 128G', 3, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 9167, 13000, 0, 0, 13000, 0, 0, 0, 0, 0, 'A', 'none', 126),
('128', 'GOL011', 'none', '8992803662771', 'SABUN PEPAYA BDL KECIL', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 4500, 5500, 0, 0, 5500, 0, 0, 0, 0, 0, 'A', 'none', 127),
('129', 'GOL011', 'none', '8999225905332', 'PURBASARI SABUN ZAITUN', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 3900, 4500, 0, 0, 4500, 0, 0, 0, 0, 0, 'A', 'none', 128),
('130', 'GOL011', 'none', '8999225902607', 'PURBASARI SABUN BENGKOANG', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3900, 4500, 0, 0, 4500, 0, 0, 0, 0, 0, 'A', 'none', 129),
('131', 'GOL011', 'none', '8993560025090', 'DETTOL SKIN CARE K', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3048.75, 3200, 0, 0, 3200, 0, 0, 0, 0, 0, 'A', 'none', 130),
('132', 'GOL011', 'none', '8993560025243', 'DETTOL LASTIN FRESH K', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3048.75, 3200, 0, 0, 3200, 0, 0, 0, 0, 0, 'A', 'none', 131),
('133', 'GOL011', 'none', '8993560025038', 'DETTOL FRESH K', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3048.75, 3500, 0, 0, 3500, 0, 0, 0, 0, 0, 'A', 'none', 132),
('134', 'GOL011', 'none', '8993560025014', 'DETTOL COOL 65G K', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3048.75, 3200, 0, 0, 3200, 0, 0, 0, 0, 0, 'A', 'none', 133),
('135', 'GOL011', 'none', '8993560025083', 'DETTOL SKINCARE 105G', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 4841, 5000, 0, 0, 5000, 0, 0, 0, 0, 0, 'A', 'none', 134),
('136', 'GOL011', 'none', '8993560025106', 'DETTOL RE-ENERGIZE 105G', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 5000, 5500, 0, 0, 5500, 0, 0, 0, 0, 0, 'A', 'none', 135),
('137', 'GOL011', 'none', '8993560025069', 'DETTOL SENSITIVE 105G', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 4841, 5000, 0, 0, 5000, 0, 0, 0, 0, 0, 'A', 'none', 136),
('138', 'GOL011', 'none', '8993560025021', 'DETTOL FRESH 100G', 25, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 4853.5, 5500, 5300, 0, 5300, 0, 0, 0, 0, 0, 'A', 'none', 137),
('139', 'GOL011', 'none', '8993560024987', 'DETTOL ORIGINAL 100G', 26, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 4853.5, 5500, 5300, 0, 5300, 0, 0, 0, 0, 0, 'A', 'none', 138),
('140', 'GOL011', 'none', '8888103200013', 'CUSSONS BABY SOAP 75G MILD &GENTLE -', 19, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3162, 3500, 3400, 0, 3400, 0, 0, 0, 0, 0, 'A', 'none', 139),
('141', 'GOL011', 'none', '8998103000534', 'CUSSONS BABY SOAP SOFT&SMOOTH -', 18, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3162, 3500, 3400, 0, 3400, 0, 0, 0, 0, 0, 'A', 'none', 140),
('142', 'GOL011', 'none', '8998103008233', 'CUSSONS BABY ANTIBACTERIAL SOAP -', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2945, 3500, 0, 0, 3300, 0, 0, 0, 0, 0, 'A', 'none', 141),
('143', 'GOL011', 'none', '8998103012650', 'CUSSONS BABY SOAP FRESH&NOURISH -', 17, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3162, 3500, 3400, 0, 3400, 0, 0, 0, 0, 0, 'A', 'none', 142),
('144', 'GOL011', 'none', '8999908043009', 'SABUN MY BABY VITAMIN E& OAT', 4, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2475, 3000, 2750, 0, 2750, 0, 0, 0, 0, 0, 'A', 'none', 143),
('145', 'GOL011', 'none', '8999908054203', 'SABUN MY BABY MILK & OAT', 1, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2475, 3000, 2750, 0, 2750, 0, 0, 0, 0, 0, 'A', 'none', 144),
('146', 'GOL011', 'none', '8993379200886', 'HARMONY ORANGE SATSUMA', 19, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 1846, 2000, 0, 0, 2000, 0, 0, 0, 0, 0, 'A', 'none', 145),
('147', 'GOL011', 'none', '8993379200862', 'HARMONY GRAPE -', 24, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 1846, 2000, 0, 0, 2000, 0, 0, 0, 0, 0, 'A', 'none', 146),
('148', 'GOL011', 'none', '8993379200855', 'HARMONY ALPINE STRAWBERRY', 20, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 1846, 2000, 0, 0, 2000, 0, 0, 0, 0, 0, 'A', 'none', 147),
('149', 'GOL011', 'none', '8999999023980', 'SABUN CITRA SPORTLESS WHITE -', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 1900, 2200, 2100, 0, 2100, 0, 0, 0, 0, 0, 'A', 'none', 148),
('150', 'GOL011', 'none', '8999999002299', 'SABUN CITRA LASTING WHITE -', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 1900, 2200, 2100, 0, 2100, 0, 0, 0, 0, 0, 'A', 'none', 149),
('151', 'GOL011', 'none', '8999999002312', 'SABUN CITRA PEARLY WHITE -', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 1900, 2200, 2100, 0, 2100, 0, 0, 0, 0, 0, 'A', 'none', 150),
('152', 'GOL011', 'none', '8998866602556', 'NUVO FAMILY CALSSIC', 10, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2050, 2200, 2150, 0, 2150, 0, 0, 0, 0, 0, 'A', 'none', 151),
('153', 'GOL011', 'none', '8998866606158', 'NUVO FAMILY COOL', 53, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2790, 3500, 3300, 0, 3300, 0, 0, 0, 0, 0, 'A', 'none', 152),
('154', 'GOL011', 'none', '7640129890040', 'ASEPSO', 9, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 6500, 7500, 0, 0, 7500, 0, 0, 0, 0, 0, 'A', 'none', 153),
('155', 'GOL019', 'none', '8994144100097', 'TEH GOPEK MERAH -', 500, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 5000, 5500, 5200, 0, 5300, 5200, 0, 0, 0, 0, 'A', 'none', 154),
('156', 'GOL019', 'none', '8994144100288', 'TEH GOPEK KUNING -', 135, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 5900, 6500, 6200, 0, 6200, 0, 0, 0, 0, 0, 'A', 'none', 155),
('157', 'GOL019', 'none', '8886007000319', 'TEH POCI EMAS', 90, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 5400, 6000, 5700, 0, 6000, 5700, 0, 0, 0, 0, 'A', 'none', 156),
('158', 'GOL019', 'none', '8886007811076', 'TEH CELUP SOSRO BLACK TEA(30) -', 77, 0, 'PAK', 'none', 'none', 'none', 'none', 0, 'none', 4650, 5500, 0, 0, 5500, 0, 0, 0, 0, 0, 'A', 'none', 157),
('159', 'GOL019', 'none', '8886007811045', 'TEH JASMNE CELUP', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 6500, 7000, 0, 0, 7000, 0, 0, 0, 0, 0, 'A', 'none', 158),
('160', 'GOL019', 'none', '8992780010084', 'TEH 2TANG PREMIUM -', 130, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 7200, 7500, 7400, 0, 7500, 7400, 0, 0, 0, 0, 'A', 'none', 159),
('161', 'GOL019', 'none', '8992936120902', 'TEH TONG TJI PREMIUM', 64, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 7200, 7500, 7300, 0, 7300, 7300, 0, 0, 0, 0, 'A', 'none', 160),
('162', 'GOL019', 'none', '8992936115021', 'TEH TONG JI CELUP', 50, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 8100, 9000, 0, 0, 9000, 0, 0, 0, 0, 0, 'A', 'none', 161),
('1400', 'GOL013', 'none', '89988661032750', 'SAMPO EMERON DAMAGE CARE 70ML', 1, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 7600, 8500, 0, 0, 8500, 0, 0, 0, 0, 0, 'A', 'none', 162),
('164', 'GOL019', 'none', '8992780030020', 'TEH CELUP 2TANG', 26, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 5600, 6500, 0, 0, 6500, 0, 0, 0, 0, 0, 'A', 'none', 163),
('1209', 'GOL005', 'none', '1209', 'PILUS 1/2 KG', -1, 0, 'BKS', 'none', 'none', 'none', 'none', 0, 'none', 9000, 12000, 0, 0, 12000, 0, 0, 0, 0, 0, 'A', 'none', 164),
('166', 'GOL021', 'none', '896860600270', 'POP MIE RASA AYAM 75G -', 7, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3797, 4000, 3900, 0, 4000, 3900, 0, 0, 0, 0, 'A', 'none', 165),
('1321', 'GOL021', 'none', '8968606012600', 'POP MIE 75G RASA BASO -', 49, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3797, 4000, 3900, 0, 4000, 3900, 0, 0, 0, 0, 'A', 'none', 166),
('168', 'GOL022', 'none', '8993189270284', 'CHARM (8) - 23CM', 53, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3332, 4000, 3750, 0, 4000, 3750, 0, 0, 0, 0, 'A', 'none', 167),
('169', 'GOL022', 'none', '8993189270307', 'CHARM EXTRAMAXI 20PADS TDK DIPAKE LG', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 7493, 8000, 0, 0, 8000, 0, 0, 0, 0, 0, 'A', 'none', 168),
('170', 'GOL021', 'none', '896860440340', 'MIE SUPERMI OPOR AYAM', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2250, 2400, 2350, 0, 2350, 0, 0, 0, 0, 0, 'A', 'none', 169),
('171', 'GOL021', 'none', '896860440720', 'MIE SUPERMI RASA SOP BUNTUT', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2250, 2400, 2350, 0, 2350, 0, 0, 0, 0, 0, 'A', 'none', 170),
('172', 'GOL021', 'none', '896860142800', 'MIE SUPERMI RASA AYAM BAWANG', 9, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2318, 2500, 2400, 2350, 2400, 2350, 0, 0, 0, 0, 'A', 'none', 171),
('173', 'GOL021', 'none', '896860100150', 'INDOMIE RASA AYAM BAWANG', 201, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2361, 2500, 2450, 0, 2450, 0, 0, 0, 0, 0, 'A', 'none', 172),
('174', 'GOL021', 'none', '896860100460', 'INDOMIE RASA AYAM SPESIAL', 537, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2361, 2500, 2450, 0, 2450, 0, 0, 0, 0, 0, 'A', 'none', 173),
('175', 'GOL021', 'none', '896860432730', 'INDOMIE GORENG RASA SAMBAL RICA-RICA', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2415, 2600, 2500, 0, 2500, 0, 0, 0, 0, 0, 'A', 'none', 174),
('176', 'GOL021', 'none', '896860435630', 'INDOMIE RASA TENGKLENG', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2282, 2500, 2400, 0, 2400, 0, 0, 0, 0, 0, 'A', 'none', 175),
('177', 'GOL021', 'none', '896860103430', 'INDOMIE RASA SOTO MIE', 156, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2361, 2500, 2450, 0, 2450, 0, 0, 0, 0, 0, 'A', 'none', 176),
('178', 'GOL021', 'none', '896860432970', 'INDOMIE GORENG RASA SAMBAL MATAH', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2418, 2600, 2500, 0, 2500, 0, 0, 0, 0, 0, 'A', 'none', 177),
('179', 'GOL021', 'none', '896860109470', 'INDOMIE GORENG', 425, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2504, 2700, 2600, 2550, 2600, 2550, 0, 0, 0, 0, 'A', 'none', 178),
('180', 'GOL021', 'none', '896860170760', 'MIE SARIMI RASA AYAM BAWANG', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2044.37, 2200, 2150, 0, 2150, 0, 0, 0, 0, 0, 'A', 'none', 179),
('181', 'GOL021', 'none', '896860487040', 'MIE SARIMI ISI 2 GORENG AYAM KECAP', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3101, 3300, 3200, 0, 3200, 0, 0, 0, 0, 0, 'A', 'none', 180),
('182', 'GOL021', 'none', '896860177170', 'MIE SARIMI ISI 2 RASA SOTO', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2655.2, 3000, 0, 0, 2900, 0, 0, 0, 0, 0, 'A', 'none', 181),
('183', 'GOL021', 'none', '896860480010', 'MIE SARIMI ISI 2 RASA GULAI AYAM', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2655.2, 3000, 0, 0, 2900, 0, 0, 0, 0, 0, 'A', 'none', 182),
('184', 'GOL022', 'none', '8993189320279', 'CHARM WING 35 CM *', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 0, 7500, 0, 0, 7500, 0, 0, 0, 0, 0, 'A', 'none', 183),
('185', 'GOL022', 'none', '8993189230059', 'CHARM NIGHT WING 29CM(5)', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3920, 5000, 4500, 0, 4500, 0, 0, 0, 0, 0, 'A', 'none', 184),
('186', 'GOL022', 'none', '8993189270277', 'CHARM RENCENG (10)', 49, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 3920, 4500, 0, 0, 4500, 0, 0, 0, 0, 0, 'A', 'none', 185),
('187', 'GOL004', 'none', '896863861100', 'BUMBU RACIK INDOFOOD SAYUR ASEM', 58, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 1450, 2000, 1700, 0, 2000, 1700, 0, 0, 0, 0, 'A', 'none', 186),
('188', 'GOL023', 'none', '896865300010', 'PROMINA MILKY BERAS MERAH 20G (8)', 7, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 12355, 13000, 0, 0, 13000, 0, 0, 0, 0, 0, 'A', 'none', 187),
('189', 'GOL023', 'none', '896865301000', 'PROMINA SMOOTH KACANG HIJAU(8)', 5, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 12355, 13000, 0, 0, 13000, 0, 0, 0, 0, 0, 'A', 'none', 188),
('2454', 'GOL085', 'none', '2454', 'HOK GELAS PLASTIK 12 OZ', 0, 0, 'PAK', 'none', 'none', 'none', 'none', 0, 'none', 9000, 9500, 0, 0, 9500, 0, 0, 0, 0, 0, 'A', 'none', 189),
('191', 'GOL023', 'none', '896865302090', 'PROMINA PISANG SUSU', 4, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 12355, 13000, 0, 0, 13000, 0, 0, 0, 0, 0, 'A', 'none', 190),
('192', 'GOL004', 'none', '896863864620', 'RACIK IKAN GORENG', 36, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 1450, 2000, 1700, 0, 2000, 1700, 0, 0, 0, 0, 'A', 'none', 191),
('193', 'GOL004', 'none', '896863863180', 'BUMBU RACIK SAYUR SOP', 95, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 1450, 2000, 1700, 0, 2000, 1700, 0, 0, 0, 0, 'A', 'none', 192),
('194', 'GOL004', 'none', '896863864170', 'BUMBU RACIK BUMBU TEMPE 20G', 226, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 1450, 2000, 1800, 0, 1700, 0, 0, 0, 0, 0, 'A', 'none', 193),
('195', 'GOL004', 'none', '896863866150', 'BUMBU RACIK INDOFOOD NASI GORENG AYAM', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 12648, 1500, 0, 0, 1500, 0, 0, 0, 0, 0, 'A', 'none', 194),
('196', 'GOL024', 'none', '8992705022123', 'AGER - AGER SATELIT SO WELL MERAH', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2187.45, 2500, 0, 0, 2500, 2400, 0, 0, 0, 0, 'A', 'none', 195),
('197', 'GOL024', 'none', '8992705042121', 'AGER - AGER SATELIT SO WELL HIJAU', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2250, 2500, 0, 0, 2500, 2400, 0, 0, 0, 0, 'A', 'none', 196),
('198', 'GOL025', 'none', '8992702000018', 'INDOMILK PUTIH KLG', 1, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 9687.5, 10500, 10250, 0, 10250, 0, 0, 0, 0, 0, 'A', 'none', 197),
('199', 'GOL025', 'none', '8992702000063', 'INDOMILK COKLAT KLG', 4, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 9687.5, 10500, 10250, 0, 10250, 0, 0, 0, 0, 0, 'A', 'none', 198),
('200', 'GOL025', 'none', '8992702000025', 'SUSU ENAK KLG PUTIH', 55, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 8854, 9500, 0, 0, 9500, 0, 0, 0, 0, 0, 'A', 'none', 199),
('201', 'GOL025', 'none', '8993007001465', 'SUSU ENAK KLG COKLAT', 2, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 9062.5, 9500, 0, 0, 9500, 0, 0, 0, 0, 0, 'A', 'none', 200),
('202', 'GOL025', 'none', '8992702005945', 'INDOMILK COKLAT BTL 190ML', 39, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3350, 3750, 3500, 0, 3750, 3500, 0, 0, 0, 0, 'A', 'none', 201),
('203', 'GOL025', 'none', '8992702005976', 'INDOMILK STRAWBERRY BTL 190ML', 4, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3350, 3750, 3500, 0, 3750, 3500, 0, 0, 0, 0, 'A', 'none', 202),
('204', 'GOL025', 'none', '8993007000253', 'INDOMILK UHT KIDS STRAWBERRY', 193, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2290, 2500, 2450, 0, 2500, 2450, 0, 0, 0, 0, 'A', 'none', 203),
('205', 'GOL025', 'none', '8993007000239', 'INDOMILK UHT KIDS COKLAT', 330, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2290, 2500, 2450, 0, 2500, 2450, 0, 0, 0, 0, 'A', 'none', 204),
('206', 'GOL001', 'none', '896868050170', 'STING BERRY BLAST FLAVOUR', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3700, 4000, 0, 0, 4000, 0, 0, 0, 0, 0, 'A', 'none', 205),
('207', 'GOL001', 'none', '896868050240', 'STING PERISA GOLD RUSH', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 3700, 4000, 0, 0, 4000, 0, 0, 0, 0, 0, 'A', 'none', 206),
('208', 'GOL001', 'none', '896868500480', 'COFELA EXPRESSO', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2400, 2500, 0, 0, 2500, 0, 0, 0, 0, 0, 'A', 'none', 207),
('209', 'GOL002', 'none', '8992628022156', 'MINYAK BIMOLI 1LT REFF', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 18200, 20000, 0, 0, 20000, 0, 0, 0, 0, 0, 'A', 'none', 208),
('210', 'GOL037', 'none', '8992628510158', 'PALMIA MENTEGA 200G', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 5073, 5500, 0, 0, 5500, 0, 0, 0, 0, 0, 'A', 'none', 209),
('211', 'GOL048', 'none', '896864004270', 'SAMBAL MEJA PEDAS INDOFOOD 140ML', 4, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 4950, 6000, 0, 0, 6000, 0, 0, 0, 0, 0, 'A', 'none', 210),
('212', 'GOL025', 'none', '8993007001694', 'INDOMILK PUTIH SACHET(6)', 10, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 6700, 7000, 0, 0, 7000, 0, 0, 0, 0, 0, 'A', 'none', 211),
('213', 'GOL004', 'none', '8993226112508', 'GARAM MEJA REFINA', 39, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 2467.5, 3000, 0, 0, 3000, 0, 0, 0, 0, 0, 'A', 'none', 212),
('214', 'GOL025', 'none', '8992753101207', 'SUSU FRISIAN FLAG KENTAL MANIS PUTIH KLG 370G', 70, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 10417, 11000, 0, 0, 11000, 0, 0, 0, 0, 0, 'A', 'none', 213),
('215', 'GOL025', 'none', '8992753031900', 'SUSU FRISIAN FLAG SACHET PUTIH (6) -', 9, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 7050, 7250, 7000, 0, 7250, 7000, 0, 0, 0, 0, 'A', 'none', 214),
('216', 'GOL025', 'none', '8992753102303', 'SUSU FRISIAN FLAG SACHET COKLAT (6) -', 34, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 7050, 7250, 7000, 0, 7250, 7000, 0, 0, 0, 0, 'A', 'none', 215),
('217', 'GOL025', 'none', '8992753102204', 'SUSU FRISIAN FLAG KENTAL MANIS COKLAT', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 9500, 10000, 0, 0, 10000, 0, 0, 0, 0, 0, 'A', 'none', 216),
('218', 'GOL020', 'none', '8993176110067', 'MKP CAP LANG 120 ML', 6, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 35958, 40000, 0, 0, 40000, 0, 0, 0, 0, 0, 'A', 'none', 217),
('219', 'GOL020', 'none', '8993176110074', 'MKP CAP LANG 60ML', 33, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 18667, 21000, 0, 0, 21000, 0, 0, 0, 0, 0, 'A', 'none', 218),
('220', 'GOL020', 'none', '8993176803105', 'TELON LANG 100 ML', 0, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 0, 21000, 0, 0, 21000, 0, 0, 0, 0, 0, 'A', 'none', 219),
('221', 'GOL020', 'none', '8993176803099', 'TELON LANG 60ML', 10, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 15458, 17000, 0, 0, 17000, 0, 0, 0, 0, 0, 'A', 'none', 220),
('222', 'GOL020', 'none', '8993176110135', 'TELON LANG 30 ML', 14, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 8792, 10000, 0, 0, 10000, 0, 0, 0, 0, 0, 'A', 'none', 221),
('223', 'GOL020', 'none', '8999908284907', 'MY BABY MINYAK TELON 90 ML', 34, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 19000, 21000, 0, 0, 21000, 0, 0, 0, 0, 0, 'A', 'none', 222),
('224', 'GOL020', 'none', '8999908204202', 'MY BABY MINYAK TELON 60ML', 9, 0, 'PCS', 'none', 'none', 'none', 'none', 0, 'none', 14167, 16500, 0, 0, 16500, 0, 0, 0, 0, 0, 'A', 'none', 223),
('225', 'GOL020', 'none', '8992772031011', 'SOFFEL WANGI APEL SACHET', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 4814, 5500, 0, 0, 5500, 0, 0, 0, 0, 0, 'A', 'none', 224),
('226', 'GOL020', 'none', '8992772311014', 'SOFFEL KULIT JERUK SACHET -', 27, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 4687.5, 5500, 5000, 0, 5500, 5000, 0, 0, 0, 0, 'A', 'none', 225),
('227', 'GOL020', 'none', '8992772011013', 'SOFFEL BUNGA GERANIUM SACHET -', 1, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 4800, 5500, 5000, 0, 5500, 5000, 0, 0, 0, 0, 'A', 'none', 226),
('228', 'GOL020', 'none', '8998899004105', 'AUTAN SOFT&SCENTED 15LT', 0, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 4900, 5500, 0, 0, 5500, 0, 0, 0, 0, 0, 'A', 'none', 227),
('229', 'GOL020', 'none', '8998899004242', 'AUTAN LOSION ANTI ANAK 12.5LT', 35, 0, 'RENCENG', 'none', 'none', 'none', 'none', 0, 'none', 4583.33, 5500, 0, 0, 5500, 0, 0, 0, 0, 0, 'A', 'none', 228),
('1262', 'GOL059', 'none', '1262', 'KARET KUPU 1/4 KG', 0, 0, 'BKS', 'none', 'none', 'none', 'none', 0, 'none', 5500, 7000, 0, 0, 7000, 0, 0, 0, 0, 0, 'A', 'none', 229),
('1261', '', 'none', '1261', 'KARET KUPU 1 0NS', 46, 0, 'BKS', 'none', 'none', 'none', 'none', 0, 'none', 2600, 3000, 0, 0, 3000, 0, 0, 0, 0, 0, 'A', 'none', 230),
('232', 'GOL020', 'none', '8993058105013', 'EXTRAJOSS ACTIVE SACHET -', 9, 0, 'DUS', 'none', 'none', 'none', 'none', 0, 'none', 11250, 12500, 0, 0, 12500, 0, 0, 0, 0, 0, 'A', 'none', 231);

-- --------------------------------------------------------

--
-- Table structure for table `wpoint`
--

CREATE TABLE `wpoint` (
  `p_code` varchar(25) NOT NULL,
  `p_name` varchar(60) NOT NULL,
  `p_qty` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wpromoitemhead`
--

CREATE TABLE `wpromoitemhead` (
  `s_code` varchar(25) NOT NULL,
  `s_date` date NOT NULL,
  `s_dateinput` date NOT NULL,
  `c_code` varchar(25) NOT NULL,
  `u_code` varchar(25) NOT NULL,
  `s_premi` float NOT NULL,
  `s_deduct` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wpromoitemtail`
--

CREATE TABLE `wpromoitemtail` (
  `s_code` varchar(30) NOT NULL,
  `i_code` varchar(50) NOT NULL,
  `i_name` varchar(50) NOT NULL,
  `i_article` text NOT NULL,
  `i_color` text NOT NULL,
  `i_disc` float NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wredpoint`
--

CREATE TABLE `wredpoint` (
  `pred_no` varchar(20) NOT NULL,
  `c_code` varchar(20) NOT NULL,
  `pred_qty` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wretpcsdetail`
--

CREATE TABLE `wretpcsdetail` (
  `rs_code` varchar(20) NOT NULL,
  `rs_date` date NOT NULL,
  `s_code` varchar(20) NOT NULL,
  `i_barcode` int(20) NOT NULL,
  `i_name` text NOT NULL,
  `i_qty` float NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wretsalesdetail`
--

CREATE TABLE `wretsalesdetail` (
  `rs_code` varchar(20) NOT NULL,
  `rs_date` date NOT NULL,
  `s_code` varchar(20) NOT NULL,
  `i_barcode` varchar(20) NOT NULL,
  `i_name` text NOT NULL,
  `i_qty` float NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wsellhead`
--

CREATE TABLE `wsellhead` (
  `s_code` varchar(25) NOT NULL,
  `s_date` date NOT NULL,
  `s_dateinput` date NOT NULL,
  `type` varchar(15) NOT NULL,
  `c_code` varchar(25) NOT NULL,
  `u_code` varchar(25) NOT NULL,
  `s_premi` float NOT NULL,
  `s_deduct` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wsellhead`
--

INSERT INTO `wsellhead` (`s_code`, `s_date`, `s_dateinput`, `type`, `c_code`, `u_code`, `s_premi`, `s_deduct`) VALUES
('MTHR2022021369245', '2022-02-13', '2022-02-13', 'Cash', 'GAR173', 'ary', 1000000, 15700),
('MTHR2022021395970', '2022-02-13', '2022-02-27', 'A/R', 'DAM345', 'ary', 0, 0),
('MTHR2022021372820', '2022-02-13', '2022-02-13', 'A/R', 'HAM520', 'ary', 0, 0),
('MTHR2022021379181', '2022-02-13', '2022-02-15', 'A/R', 'HID581', 'ary', 0, 0),
('MTHR2022021866026', '2022-02-18', '2022-02-18', 'Cash', 'ABU546', 'ary', 30000, -19000),
('MTHR2022021959579', '2022-02-19', '2022-02-19', 'Cash', 'ABU546', 'ary', 1100000, 2120),
('MTHR2022022170824', '2022-02-21', '2022-02-21', 'Cash', 'ABU546', 'ary', 2600000, 52000),
('MTHR2022022197666', '2022-02-21', '2022-02-21', 'Cash', 'ABU546', 'ary', 50000, 1000),
('MTHR2022022116686', '2022-02-21', '2022-02-28', 'A/R', 'ABU546', 'ary', 0, 0),
('MTHR2022022144578', '2022-02-21', '2022-02-21', 'Cash', 'ABU546', 'ary', 100000, 51000),
('MTHR2022022138316', '2022-02-21', '2022-02-21', 'Cash', 'AHM763', 'ary', 50000, 6000),
('MTHR2022022158649', '2022-02-21', '2022-02-27', 'A/R', 'AMA603', 'ary', 0, 0),
('MTHR2022022111166', '2022-02-21', '2022-03-01', 'A/R', 'AAJ423', 'ary', 0, 0),
('MTHR2022022126666', '2022-02-21', '2022-02-21', 'Cash', 'BER646', 'ary', 650000, 41000);

-- --------------------------------------------------------

--
-- Table structure for table `wselltail`
--

CREATE TABLE `wselltail` (
  `s_code` varchar(30) NOT NULL,
  `i_code` varchar(50) NOT NULL,
  `i_name` varchar(50) NOT NULL,
  `i_qty` float NOT NULL,
  `i_sell` float NOT NULL,
  `i_disc1` float NOT NULL DEFAULT 0,
  `i_disc2` float NOT NULL DEFAULT 0,
  `i_disc3` float NOT NULL DEFAULT 0,
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wselltail`
--

INSERT INTO `wselltail` (`s_code`, `i_code`, `i_name`, `i_qty`, `i_sell`, `i_disc1`, `i_disc2`, `i_disc3`, `id`) VALUES
('MTHR2022021959579', 'SMN00100007', 'SEMEN GRESIK 50 KG', 12, 55000, 0.2, 0, 110, 13075),
('MTHR2022021959579', 'SMN00100014', 'SEMEN RAJAWALI 50 KG', 9, 49000, 0.408163, 0, 200, 13074),
('MTHR2022021866026', 'SMN00100014', 'SEMEN RAJAWALI 50 KG', 1, 49000, 0, 0, 0, 13073),
('MTHR2022021395970', 'SMN00100014', 'SEMEN RAJAWALI 50 KG', 19, 49000, 0, 0, 0, 13072),
('MTHR2022021369245', 'SMN00100006', 'SEMEN GRESIK 50 KG', 17, 58000, 0.172414, 0, 100, 13071),
('MTHR2022021372820', 'SMN00200006', 'MORTAR ACIAN TR 40 KG', 40, 87500, 0, 0, 0, 13070),
('MTHR2022021379181', 'SMN00100007', 'SEMEN GRESIK 50 KG', 10, 55000, 0.2, 0, 110, 13069),
('MTHR2022021379181', 'SMN00100013', 'SEMEN RAJAWALI 50 KG', 20, 49000, 0.204082, 0, 100, 13068),
('MTHR2022022170824', 'SMN00100014', 'SEMEN RAJAWALI 50 KG', 52, 49000, 0, 0, 0, 13076),
('MTHR2022022197666', 'SMN00100013', 'SEMEN RAJAWALI 50 KG', 1, 49000, 0, 0, 0, 13077),
('MTHR2022022116686', 'SMN00100007', 'SEMEN GRESIK 50 KG', 1, 55000, 0, 0, 0, 13078),
('MTHR2022022144578', 'SMN00100015', 'SEMEN RAJAWALI 50 KG', 1, 49000, 0, 0, 0, 13079),
('MTHR2022022138316', 'SMN00100008', 'SEMEN GRESIK 40 KG', 1, 44000, 0, 0, 0, 13080),
('MTHR2022022158649', 'SMN00100014', 'SEMEN RAJAWALI 50 KG', 1, 49000, 0, 0, 0, 13081),
('MTHR2022022111166', 'SMN00100002', 'SEMEN TIGA RODA 50 KG', 1, 60000, 0, 0, 0, 13082),
('MTHR2022022126666', 'SMN00100002', 'SEMEN TIGA RODA 50 KG', 1, 60000, 0, 0, 0, 13083),
('MTHR2022022126666', 'SMN00100007', 'SEMEN GRESIK 50 KG', 10, 55000, 0.181818, 0, 100, 13084);

-- --------------------------------------------------------

--
-- Table structure for table `wsuppliers`
--

CREATE TABLE `wsuppliers` (
  `s_code` varchar(15) NOT NULL,
  `s_name` varchar(30) NOT NULL,
  `s_contact` varchar(30) NOT NULL,
  `s_addr` varchar(60) NOT NULL,
  `s_phone` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wsuppliers`
--

INSERT INTO `wsuppliers` (`s_code`, `s_name`, `s_contact`, `s_addr`, `s_phone`) VALUES
('SUP001', 'MATAHARI', 'PERSON', '', ''),
('SUP002', 'Ary', 'Ary', '', '0909809'),
('SUP003', 'TOKO', 'jkhka', '', '09090'),
('SUPP004', 'testing', 'person', '', '08912'),
('SUP005', 'testing05', 'person5', '', '098098'),
('sup006', 'name006', 'person006', 'adr06', '060606');

-- --------------------------------------------------------

--
-- Table structure for table `wwarehouse`
--

CREATE TABLE `wwarehouse` (
  `id` int(11) NOT NULL,
  `ware_id` varchar(10) NOT NULL,
  `ware_name` varchar(30) NOT NULL,
  `ware_loc` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xloginuser`
--

CREATE TABLE `xloginuser` (
  `cdtusercode` text NOT NULL,
  `cdtusername` text NOT NULL,
  `cdtuserpwd` text NOT NULL,
  `cdtfullname` text NOT NULL,
  `cdtemail` text NOT NULL,
  `cdtmphone` text NOT NULL,
  `cdtpic` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xloginuser`
--

INSERT INTO `xloginuser` (`cdtusercode`, `cdtusername`, `cdtuserpwd`, `cdtfullname`, `cdtemail`, `cdtmphone`, `cdtpic`) VALUES
('19238', 'endahadmin', '0c0f8304e30424e33e2eed25dbd41557209e9eb64676a156ccd51bc095461d69', 'endah endah', 'endah@gmail.com', '098098', '0'),
('52081', 'topasbrebes', '0ee8fd89d2040ccf5a8066f8df60dce9a56116b7417494cca2777f98a05f3e44', 'Topas topas', 'topas@gmail.com', '08908', '0'),
('97220', 'adminmthr', '41e5653fc7aeb894026d6bb7b2db7f65902b454945fa8fd65a6327047b5277fb', 'admin admin', 'admin@mimoapps.xyz', '0890980', '0'),
('65332', 'anyaradmin', '95dc8264b34473d4ceacb5fe1ca5cc86bcb288c80f30e8840a7e3ff5a752b275', 'Anton Komala', 'anyar@gmail.com', '0980809', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `waccountr`
--
ALTER TABLE `waccountr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wbuyhead`
--
ALTER TABLE `wbuyhead`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wbuytail`
--
ALTER TABLE `wbuytail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wcompany`
--
ALTER TABLE `wcompany`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wcustomers`
--
ALTER TABLE `wcustomers`
  ADD UNIQUE KEY `c_code` (`c_code`);

--
-- Indexes for table `wgroups`
--
ALTER TABLE `wgroups`
  ADD UNIQUE KEY `g_code` (`g_code`);

--
-- Indexes for table `winventory`
--
ALTER TABLE `winventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `i_code` (`i_code`);

--
-- Indexes for table `wpromoitemhead`
--
ALTER TABLE `wpromoitemhead`
  ADD UNIQUE KEY `s_code` (`s_code`);

--
-- Indexes for table `wpromoitemtail`
--
ALTER TABLE `wpromoitemtail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wretpcsdetail`
--
ALTER TABLE `wretpcsdetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wretsalesdetail`
--
ALTER TABLE `wretsalesdetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wsellhead`
--
ALTER TABLE `wsellhead`
  ADD UNIQUE KEY `s_code` (`s_code`);

--
-- Indexes for table `wselltail`
--
ALTER TABLE `wselltail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wwarehouse`
--
ALTER TABLE `wwarehouse`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wareid` (`ware_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `waccountr`
--
ALTER TABLE `waccountr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `wbuyhead`
--
ALTER TABLE `wbuyhead`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=452;

--
-- AUTO_INCREMENT for table `wbuytail`
--
ALTER TABLE `wbuytail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11210;

--
-- AUTO_INCREMENT for table `wcompany`
--
ALTER TABLE `wcompany`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `winventory`
--
ALTER TABLE `winventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT for table `wpromoitemtail`
--
ALTER TABLE `wpromoitemtail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `wretpcsdetail`
--
ALTER TABLE `wretpcsdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2521;

--
-- AUTO_INCREMENT for table `wretsalesdetail`
--
ALTER TABLE `wretsalesdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=338;

--
-- AUTO_INCREMENT for table `wselltail`
--
ALTER TABLE `wselltail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13085;

--
-- AUTO_INCREMENT for table `wwarehouse`
--
ALTER TABLE `wwarehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
