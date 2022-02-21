-- phpMyAdmin SQL Dump
-- version 5.0.4deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 21, 2022 at 07:11 PM
-- Server version: 10.5.12-MariaDB-0+deb11u1
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mimj5729_matahari`
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
  `b_code` varchar(15) NOT NULL,
  `b_refno` varchar(25) NOT NULL,
  `b_date` date NOT NULL,
  `b_dateinput` date NOT NULL,
  `s_code` varchar(15) NOT NULL,
  `u_code` varchar(15) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wbuytail`
--

CREATE TABLE `wbuytail` (
  `b_code` varchar(15) NOT NULL,
  `g_code` varchar(10) NOT NULL,
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
(1, 'MTHR001', 'TB. MATAHARI', 'JL.KAPT. SUDIBYO NO 30', 'PEKAUMAN', 'TEGAL BARAT', '(0283) 356142', '');

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
('SMN00100001', 'SMN001', 'sup001', 'TRGD001', 'SEMEN TIGA RODA 50 KG', 500, 1, 'ZAK', '0', '0', 'TIGARODA', 'SEMEN TIGA RODA 50 KG', 57000, '0', 60000, 59000, 58500, 0, 0, 0, 0, 0, 0, 0, 'A', 'GDG001', 1),
('SMN00100002', 'SMN001', 'sup001', 'TRTB001', 'SEMEN TIGA RODA 50 KG', 500, 1, 'ZAK', '0', '0', 'TIGARODA', 'SEMEN TIGA RODA 50 KG', 57000, '0', 60000, 59000, 58500, 0, 0, 0, 0, 0, 0, 0, 'A', 'GDG002', 2),
('SMN00100003', 'SMN001', 'sup001', 'TRGS001', 'SEMEN TIGA RODA 50 KG', 500, 1, 'ZAK', '0', '0', 'TIGARODA', 'SEMEN TIGA RODA 50 KG', 57000, '0', 56500, 56700, 56750, 56850, 56900, 57000, 57100, 57250, 57550, 58050, 'A', 'GDG003', 3),
('SMN00100004', 'SMN001', 'sup001', 'TRGS002', 'SEMEN TIGA RODA 40 KG', 500, 1, 'ZAK', '0', '0', 'TIGARODA', 'SEMEN TIGA RODA 40 KG', 45600, '0', 48000, 45360, 45400, 45480, 45520, 45600, 45680, 45800, 46040, 46440, 'A', 'GDG003', 4),
('SMN00100005', 'SMN001', 'sup001', 'GRGD001', 'SEMEN GRESIK 50 KG', 500, 1, 'ZAK', '0', '0', 'GRESIK', 'SEMEN GRESIK 50 KG', 55250, '0', 58000, 57500, 57000, 56500, 0, 0, 0, 0, 0, 0, 'A', 'GDG001', 5),
('SMN00100006', 'SMN001', 'sup001', 'GRTB001', 'SEMEN GRESIK 50 KG', 500, 1, 'ZAK', '0', '0', 'GRESIK', 'SEMEN GRESIK 50 KG', 55250, '0', 58000, 57500, 57000, 56500, 0, 0, 0, 0, 0, 0, 'A', 'GDG002', 6),
('SMN00100007', 'SMN001', 'sup001', 'GRGS001', 'SEMEN GRESIK 50 KG', 500, 1, 'ZAK', '0', '0', 'GRESIK', 'SEMEN GRESIK 50 KG', 55250, '0', 55000, 56000, 56250, 56500, 57000, 58000, 0, 0, 0, 0, 'A', 'GDG003', 7),
('SMN00100008', 'SMN001', 'sup001', 'GRGS002', 'SEMEN GRESIK 40 KG', 500, 1, 'ZAK', '0', '0', 'GRESIK', 'SEMEN GRESIK 40 KG', 44200, '0', 44000, 44800, 45000, 45200, 45600, 46400, 0, 0, 0, 0, 'A', 'GDG003', 8),
('SMN00100009', 'SMN001', 'sup001', 'DNYGD001', 'SEMEN DYNAMIX 50 KG', 500, 1, 'ZAK', '0', '0', 'DYNAMIX', 'SEMEN DYNAMIX 50 KG', 54250, '0', 57000, 56500, 0, 0, 0, 0, 0, 0, 0, 0, 'A', 'GDG001', 9),
('SMN00100010', 'SMN001', 'sup001', 'DNYTB001', 'SEMEN DYNAMIX 50 KG', 500, 1, 'ZAK', '0', '0', 'DYNAMIX', 'SEMEN DYNAMIX 50 KG', 54250, '0', 57000, 56500, 0, 0, 0, 0, 0, 0, 0, 0, 'A', 'GDG002', 10),
('SMN00100011', 'SMN001', 'sup001', 'DNYGS001', 'SEMEN DYNAMIX 50 KG', 500, 1, 'ZAK', '0', '0', 'DYNAMIX', 'SEMEN DYNAMIX 50 KG', 54250, '0', 56500, 57000, 0, 0, 0, 0, 0, 0, 0, 0, 'A', 'GDG003', 11),
('SMN00100012', 'SMN001', 'sup001', 'DNYGS002', 'SEMEN DYNAMIX 40 KG', 500, 1, 'ZAK', '0', '0', 'DYNAMIX', 'SEMEN DYNAMIX 40 KG', 43400, '0', 56500, 57000, 0, 0, 0, 0, 0, 0, 0, 0, 'A', 'GDG003', 12),
('SMN00100013', 'SMN001', 'sup001', 'RJWGD001', 'SEMEN RAJAWALI 50 KG', 500, 1, 'ZAK', '0', '0', 'RAJAWALI', 'SEMEN RAJAWALI 50 KG', 43400, '0', 49000, 48500, 48000, 46000, 0, 0, 0, 0, 0, 0, 'A', 'GDG001', 13),
('SMN00100014', 'SMN001', 'sup001', 'RJWTB001', 'SEMEN RAJAWALI 50 KG', 500, 1, 'ZAK', '0', '0', 'RAJAWALI', 'SEMEN RAJAWALI 50 KG', 43400, '0', 49000, 48500, 48000, 46000, 0, 0, 0, 0, 0, 0, 'A', 'GDG002', 14),
('SMN00100015', 'SMN001', 'sup001', 'RJWGS001', 'SEMEN RAJAWALI 50 KG', 500, 1, 'ZAK', '0', '0', 'RAJAWALI', 'SEMEN RAJAWALI 50 KG', 43400, '0', 49000, 48500, 48000, 46000, 44000, 45000, 44000, 0, 0, 0, 'A', 'GDG003', 15),
('SMN00100016', 'SMN001', 'sup001', 'RJWGS002', 'SEMEN RAJAWALI 40 KG', 500, 1, 'ZAK', '0', '0', 'RAJAWALI', 'SEMEN RAJAWALI 40 KG', 34720, '0', 39200, 38800, 38400, 36800, 35200, 36000, 35200, 0, 0, 0, 'A', 'GDG003', 16),
('SMN00100017', 'SMN001', 'sup001', 'RJWGD001', 'SEMEN PADANG 50 KG', 500, 1, 'ZAK', '0', '0', 'PADANG', 'SEMEN PADANG 50 KG', 44000, '0', 47000, 46500, 46000, 0, 0, 0, 0, 0, 0, 0, 'A', 'GDG001', 17),
('SMN00100018', 'SMN001', 'sup001', 'RJWTB001', 'SEMEN PADANG 50 KG', 500, 1, 'ZAK', '0', '0', 'PADANG', 'SEMEN PADANG 50 KG', 44000, '0', 47000, 46500, 46000, 0, 0, 0, 0, 0, 0, 0, 'A', 'GDG002', 18),
('SMN00100019', 'SMN001', 'sup001', 'RJWGS001', 'SEMEN PADANG 50 KG', 500, 1, 'ZAK', '0', '0', 'PADANG', 'SEMEN PADANG 50 KG', 44000, '0', 47000, 46500, 46000, 45500, 45000, 44500, 0, 0, 0, 0, 'A', 'GDG003', 19),
('SMN00100020', 'SMN001', 'sup001', 'RJWGS002', 'SEMEN PADANG 40 KG', 500, 1, 'ZAK', '0', '0', 'PADANG', 'SEMEN PADANG 40 KG', 35200, '0', 37600, 37200, 36800, 36400, 36000, 35600, 0, 0, 0, 0, 'A', 'GDG003', 20),
('SMN00200001', 'SMN002', 'sup001', 'SPGD001', 'SEMEN PUTIH TR 40 KG', 200, 1, 'ZAK', '0', '0', 'TIGARODA', 'SEMEN PUTIH TR 40 KG', 89000, '0', 97500, 95000, 94000, 93000, 92000, 0, 0, 0, 0, 0, 'A', 'GDG001', 21),
('SMN00200002', 'SMN002', 'sup001', 'SPTB001', 'SEMEN PUTIH TR 40 KG', 200, 1, 'ZAK', '0', '0', 'TIGARODA', 'SEMEN PUTIH TR 40 KG', 89000, '0', 97500, 95000, 94000, 93000, 92000, 0, 0, 0, 0, 0, 'A', 'GDG002', 22),
('SMN00200003', 'SMN002', 'sup001', 'SPGS001', 'SEMEN PUTIH TR 40 KG', 200, 1, 'ZAK', '0', '0', 'TIGARODA', 'SEMEN PUTIH TR 40 KG', 89000, '0', 90000, 91000, 0, 0, 0, 0, 0, 0, 0, 0, 'A', 'GDG003', 23),
('SMN00200004', 'SMN002', 'sup001', 'MTRGD001', 'MORTAR ACIAN TR 40 KG', 200, 1, 'ZAK', '0', '0', 'TIGARODA', 'MORTAR ACIAN TR 40 KG', 86500, '0', 97500, 95000, 92000, 90000, 0, 0, 0, 0, 0, 0, 'A', 'GDG001', 24),
('SMN00200005', 'SMN002', 'sup001', 'MTRTB001', 'MORTAR ACIAN TR 40 KG', 200, 1, 'ZAK', '0', '0', 'TIGARODA', 'MORTAR ACIAN TR 40 KG', 86500, '0', 97500, 95000, 92000, 90000, 0, 0, 0, 0, 0, 0, 'A', 'GDG002', 25),
('SMN00200006', 'SMN002', 'sup001', 'MTRGS001', 'MORTAR ACIAN TR 40 KG', 200, 1, 'ZAK', '0', '0', 'TIGARODA', 'MORTAR ACIAN TR 40 KG', 86500, '0', 87500, 88000, 92000, 90000, 0, 0, 0, 0, 0, 0, 'A', 'GDG003', 26),
('SMN00300001', 'SMN003', 'sup001', 'TRTB002', 'SEMEN TR ABU KILOAN', 500, 1, 'KG', '0', '0', 'TIGARODA', 'SEMEN TR ABU KILOAN', 1140, '0', 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A', 'GDG002', 27),
('SMN00300002', 'SMN003', 'sup001', 'GRTB002', 'SEMEN GR ABU KILOAN', 500, 1, 'KG', '0', '0', 'GRESIK', 'SEMEN GR ABU KILOAN', 1105, '0', 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A', 'GDG002', 28),
('SMN00300003', 'SMN003', 'sup001', 'DNYTB002', 'SEMEN DNY ABU KILOAN', 500, 1, 'KG', '0', '0', 'DYNAMIX', 'SEMEN DNY ABU KILOAN', 1085, '0', 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A', 'GDG002', 29),
('SMN00300004', 'SMN003', 'sup001', 'RJWTB002', 'SEMEN RJW ABU KILOAN', 500, 1, 'KG', '0', '0', 'RAJAWALI', 'SEMEN RJW ABU KILOAN', 868, '0', 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A', 'GDG002', 30),
('SMN00300005', 'SMN003', 'sup001', 'PDGTB002', 'SEMEN PDG ABU KILOAN', 500, 1, 'KG', '0', '0', 'PADANG', 'SEMEN PDG ABU KILOAN', 880, '0', 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A', 'GDG002', 31),
('SMN00300006', 'SMN003', 'sup001', 'SPTB002', 'SEMEN PUTIH KILOAN', 500, 1, 'KG', '0', '0', 'TIGARODA', 'SEMEN PUTIH KILOAN', 2225, '0', 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A', 'GDG002', 32),
('SMN00300007', 'SMN003', 'sup001', 'MTRTB002', 'MORTAR ACIAN KILOAN', 500, 1, 'KG', '0', '0', 'TIGARODA', 'MORTAR ACIAN KILOAN', 2162.5, '0', 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A', 'GDG002', 33);

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
('MTHR2022021959579', '2022-02-19', '2022-02-19', 'Cash', 'ABU546', 'ary', 1100000, 2120);

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
('MTHR2022021379181', 'SMN00100013', 'SEMEN RAJAWALI 50 KG', 20, 49000, 0.204082, 0, 100, 13068);

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

--
-- Dumping data for table `wwarehouse`
--

INSERT INTO `wwarehouse` (`id`, `ware_id`, `ware_name`, `ware_loc`) VALUES
(9, 'GDG001', 'GUDANG', 'GUDANG'),
(10, 'GDG002', 'GUDANG TOKO', 'MATAHARI'),
(11, 'GDG003', 'GUDANG SUPPLIER', 'SUPPLIER');

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
('97220', 'adminmthr', '41e5653fc7aeb894026d6bb7b2db7f65902b454945fa8fd65a6327047b5277fb', 'admin admin', 'admin@mimoapps.xyz', '0890980', '0');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `wbuyhead`
--
ALTER TABLE `wbuyhead`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=449;

--
-- AUTO_INCREMENT for table `wbuytail`
--
ALTER TABLE `wbuytail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11208;

--
-- AUTO_INCREMENT for table `wcompany`
--
ALTER TABLE `wcompany`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `winventory`
--
ALTER TABLE `winventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13076;

--
-- AUTO_INCREMENT for table `wwarehouse`
--
ALTER TABLE `wwarehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
