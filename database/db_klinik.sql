-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2020 at 06:36 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_klinik`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_dokter`
--

CREATE TABLE `data_dokter` (
  `id` int(11) NOT NULL,
  `kode_dokter` varchar(6) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `poli` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_dokter`
--

INSERT INTO `data_dokter` (`id`, `kode_dokter`, `nama`, `jk`, `poli`) VALUES
(2, 'dr0002', 'Cucu Sumarna', 'L', 'umum');

-- --------------------------------------------------------

--
-- Table structure for table `data_report`
--

CREATE TABLE `data_report` (
  `id` int(11) NOT NULL,
  `id_rekam_medis` int(5) NOT NULL,
  `catatan` text NOT NULL,
  `catatan_1` text DEFAULT NULL,
  `status` enum('read','unread') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_report`
--

INSERT INTO `data_report` (`id`, `id_rekam_medis`, `catatan`, `catatan_1`, `status`) VALUES
(2, 18, 'obat habis, diganti jadi apa?', 'ssss', 'read');

-- --------------------------------------------------------

--
-- Table structure for table `data_rujukan`
--

CREATE TABLE `data_rujukan` (
  `id` int(11) NOT NULL,
  `id_rekam_medis` varchar(9) NOT NULL,
  `tanggal` date NOT NULL,
  `nama_poli` varchar(50) NOT NULL,
  `nama_rumah_sakit` varchar(100) NOT NULL,
  `dokter` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_rujukan`
--

INSERT INTO `data_rujukan` (`id`, `id_rekam_medis`, `tanggal`, `nama_poli`, `nama_rumah_sakit`, `dokter`) VALUES
(1, '20', '2020-06-01', 'THT', 'RSUD Bogor', 'Ghoniyyatul Nabilah');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_obat`
--

CREATE TABLE `kategori_obat` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_obat`
--

INSERT INTO `kategori_obat` (`id`, `nama_kategori`) VALUES
(2, 'Tablet'),
(11, 'Kapsul'),
(15, 'Syrup');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `kode_obat` varchar(6) NOT NULL,
  `nama_obat` varchar(128) NOT NULL,
  `kategori` varchar(128) NOT NULL,
  `stok` int(11) NOT NULL,
  `satuan` varchar(128) NOT NULL,
  `deskripsi` varchar(128) DEFAULT NULL,
  `tanggal_masuk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `kode_obat`, `nama_obat`, `kategori`, `stok`, `satuan`, `deskripsi`, `tanggal_masuk`) VALUES
(16, 'Kd0001', 'Metronidazole', '2', 1000, 'Butir', '', '2020-12-23');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `no_medis` varchar(9) NOT NULL,
  `nama_pasien` varchar(30) NOT NULL,
  `umur` int(2) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `kelurahan` varchar(128) NOT NULL,
  `kecamatan` varchar(128) NOT NULL,
  `provinsi` varchar(128) NOT NULL,
  `kode_pos` varchar(5) NOT NULL,
  `tanggal_daftar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `no_medis`, `nama_pasien`, `umur`, `alamat`, `kelurahan`, `kecamatan`, `provinsi`, `kode_pos`, `tanggal_daftar`) VALUES
(18, '202012001', 'YOYOH', 50, 'Bojong Kidul', '', '', '', '', '2020-12-20'),
(19, '202012002', 'Ny. FARIDAH', 60, 'Ciletuh', '', '', '', '', '2020-12-21'),
(20, '202012003', 'LENI', 20, 'Ciawi. Girang', '', '', '', '', '2020-12-21'),
(21, '202012004', 'RANAH', 50, 'Bitung  Sari Rt 04/01', '', '', '', '', '2020-12-21'),
(22, '202012005', 'HERAWATI', 18, 'Tenggek', '', '', '', '', '2020-12-21'),
(23, '202012006', 'SUPARDI', 28, 'Bitung Sari', '', '', '', '', '2020-12-21'),
(24, '202012007', 'DENI', 31, 'Cimande', '', '', '', '', '2020-12-21'),
(25, '202012008', 'SAAD', 81, 'Cibolang', '', '', '', '', '2020-12-21'),
(26, '202012009', 'UJANG', 54, 'Kp. Anyar Cisarua', '', '', '', '', '2020-12-21'),
(27, '202012010', 'FATIMAH', 36, 'Pasir Kuda', '', '', '', '', '2020-12-21'),
(28, '202012011', 'EEM', 60, 'Nangoh', '', '', '', '', '2020-12-21'),
(29, '202012012', 'OMA', 50, 'Pasir Muncang', '', '', '', '', '2020-12-21'),
(30, '202012013', 'H. JUNED', 80, 'Cukangaleuh', '', '', '', '', '2020-12-21'),
(31, '202012014', 'IYAN', 50, 'Ciderum', '', '', '', '', '2020-12-21'),
(32, '202012015', 'IMAS', 38, 'Cibodas', '', '', '', '', '2020-12-21'),
(33, '202012016', 'H.Ridwan', 69, 'Gadog', '', '', '', '', '2020-12-21'),
(34, '202012017', 'M. GIBRAN', 16, 'Bojong Kerta', '', '', '', '', '2020-12-21'),
(35, '202012018', 'HJ. Komariah', 53, 'Cisarua', '', '', '', '', '2020-12-21'),
(36, '202012019', 'ARA', 19, 'Bitung Sari', '', '', '', '', '2020-12-21'),
(37, '202012020', 'ARAH', 75, 'Rancanmaya', '', '', '', '', '2020-12-21'),
(38, '202012021', 'MAJA', 52, 'Rulita Rt 03/ 03', '', '', '', '', '2020-12-21'),
(39, '202012022', 'TN. UDIN', 60, 'CIBURAYUT', '', '', '', '', '2020-12-21'),
(40, '202012023', 'NY.LILIH', 62, 'Ciherang Pondok', '', '', '', '', '2020-12-21'),
(41, '202012024', 'TN.H. OMON', 70, 'Cimande', '', '', '', '', '2020-12-21'),
(42, '202012025', 'NY.HANA', 60, 'Rancanmaya', '', '', '', '', '2020-12-21'),
(43, '202012026', 'TN.NANANG', 50, 'Ciawi', '', '', '', '', '2020-12-21'),
(44, '202012027', 'NY.CICIH', 54, 'Rancanmaya', '', '', '', '', '2020-12-21'),
(45, '202012028', 'TN.ISUM', 42, 'BATU KEMBAR', '', '', '', '', '2020-12-21'),
(46, '202012029', 'TN.ENAB', 65, 'BATU KEMBAR', '', '', '', '', '2020-12-21'),
(47, '202012030', 'TN. ANG', 70, 'KAMPUNG ANYAR', '', '', '', '', '2020-12-21'),
(48, '202012031', 'TN.WAHYU', 37, 'KP.PANJANG', '', '', '', '', '2020-12-21'),
(49, '202012032', 'NY.RIDA SURIA', 50, 'BABAKAN', '', '', '', '', '2020-12-21'),
(50, '202012033', 'NY.TIN RUSTINI', 70, 'CIGOMBONG', '', '', '', '', '2020-12-21'),
(51, '202012034', 'NY.NURELASARI', 30, 'CIGOMBONG', '', '', '', '', '2020-12-21'),
(52, '202012035', 'TN.ABDUL HANAN', 21, 'CIKERETEG', '', '', '', '', '2020-12-21'),
(53, '202012036', 'TN.ERWIN', 29, 'TANGKIL', '', '', '', '', '2020-12-21'),
(54, '202012037', 'NY.ONI', 70, 'BITUNGSARI', '', '', '', '', '2020-12-21'),
(55, '202012038', 'TN.IKI', 22, 'PANCAWATI', '', '', '', '', '2020-12-21'),
(56, '202012039', 'NY.ROSMIATI', 21, 'CIHERANG PONDOK', '', '', '', '', '2020-12-21'),
(57, '202012040', 'NY.ELIM', 52, 'BITUNGSARI', '', '', '', '', '2020-12-21'),
(58, '202012041', 'TN.NANANG', 50, 'CIAWI', '', '', '', '', '2020-12-21'),
(59, '202012042', 'NN.NURANISA', 15, 'Ciawi', '', '', '', '', '2020-12-21'),
(60, '202012043', 'H.USMAN', 70, 'Rancanmaya', '', '', '', '', '2020-12-21'),
(61, '202012044', 'TN. MANG UYA', 45, 'CIKERETEG', '', '', '', '', '2020-12-21'),
(62, '202012045', 'TN.UBAD', 5017, 'BITUNG PASANTREN', '', '', '', '', '2020-12-21'),
(63, '202012046', 'NN. WAHYUNI', 17, 'SITUBEREUM', '', '', '', '', '2020-12-21'),
(64, '202012047', 'TN.KOSASIH', 56, 'CIBOLANG', '', '', '', '', '2020-12-21'),
(65, '202012048', 'NY.SITI SARAH', 21, 'Bitung Sari', '', '', '', '', '2020-12-21');

-- --------------------------------------------------------

--
-- Table structure for table `rekam_medis`
--

CREATE TABLE `rekam_medis` (
  `id` int(11) NOT NULL,
  `no_medis` varchar(9) NOT NULL,
  `tensi` varchar(10) DEFAULT NULL,
  `diagnosa` text DEFAULT NULL,
  `terapi` text DEFAULT NULL,
  `dokter` varchar(50) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `status` enum('antrian','selesai','ambil obat') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rekam_medis`
--

INSERT INTO `rekam_medis` (`id`, `no_medis`, `tensi`, `diagnosa`, `terapi`, `dokter`, `tanggal`, `status`) VALUES
(1, '202012046', '130/90', 'pusing', 'pusing', 'Cucu Sumarna', '2020-12-23', 'selesai');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(31, 'ryan', 'ryaneriawan@gmail.com', 'default.jpg', '$2y$10$CN0CDklYUAvgSNvU4cTgzebF7B0Rj.yGvRfZksauowu2ccbq2siea', 1, 1, 1608447590),
(33, 'Cucu Sumarna', 'cucusumarna@gmail.com', 'default.jpg', '$2y$10$y.AI5mcXLctYChLXDl6Fu.vVW24I/z2vUzy0D8tdclHbG59/Ipal2', 2, 1, 1608509544),
(34, 'admin', 'admin@gmail.com', 'default.jpg', '$2y$10$YDRJGzU37s56ZGB56cLSz.cnZ.EC5PjQTW6aqCoU69O1DNWoPKsf2', 1, 1, 1608614246);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_dokter`
--
ALTER TABLE `data_dokter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_report`
--
ALTER TABLE `data_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rujukan`
--
ALTER TABLE `data_rujukan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_obat`
--
ALTER TABLE `kategori_obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rekam_medis`
--
ALTER TABLE `rekam_medis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_dokter`
--
ALTER TABLE `data_dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_report`
--
ALTER TABLE `data_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rujukan`
--
ALTER TABLE `data_rujukan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kategori_obat`
--
ALTER TABLE `kategori_obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `rekam_medis`
--
ALTER TABLE `rekam_medis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
