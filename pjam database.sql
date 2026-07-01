-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2026 at 04:30 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pjam`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_pesanan`
--

CREATE TABLE `detail_pesanan` (
  `id_detail` int(11) NOT NULL,
  `id_pesanan` int(11) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_pesanan`
--

INSERT INTO `detail_pesanan` (`id_detail`, `id_pesanan`, `id_produk`, `jumlah`, `harga`) VALUES
(19, 17, 22, 1, 150000.00),
(20, 18, 20, 1, 450000.00),
(21, 18, 21, 1, 250000.00),
(22, 18, 17, 1, 700000.00),
(23, 19, 14, 1, 300000.00),
(24, 19, 15, 1, 1300000.00),
(25, 19, 16, 1, 750000.00),
(26, 19, 12, 1, 300000.00),
(27, 19, 22, 1, 150000.00);

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `id_pengguna` int(11) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT 1,
  `tanggal_ditambahkan` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keranjang`
--

INSERT INTO `keranjang` (`id_keranjang`, `id_pengguna`, `id_produk`, `jumlah`, `tanggal_ditambahkan`) VALUES
(42, 11, 12, 1, '2026-01-26 06:01:48');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pesanan` int(11) DEFAULT NULL,
  `metode_pembayaran` varchar(50) DEFAULT NULL,
  `tanggal_pembayaran` datetime DEFAULT NULL,
  `jumlah` decimal(10,2) DEFAULT NULL,
  `status` enum('menunggu','selesai','gagal') DEFAULT 'menunggu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pesanan`, `metode_pembayaran`, `tanggal_pembayaran`, `jumlah`, `status`) VALUES
(14, 18, 'E-Wallet', '2025-07-16 08:22:49', 1400000.00, 'selesai'),
(15, 17, 'E-Wallet', '2025-07-16 08:22:54', 150000.00, 'selesai');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nama_pengguna` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `kata_sandi` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `tanggal_dibuat` datetime DEFAULT current_timestamp(),
  `role` enum('user','admin') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `nama_pengguna`, `email`, `kata_sandi`, `nama_lengkap`, `telepon`, `alamat`, `tanggal_dibuat`, `role`) VALUES
(1, 'dandy', 'genshin052004@gmail.com', '$2y$10$BHmFIBDhR6IkBdAElICxK.S8OyzC19EhKuK4k9iwFNKo/SGOvEMPu', NULL, NULL, NULL, '2025-07-07 14:36:57', 'user'),
(3, 'yolah', 'dandy10b@gmail.com', '$2y$10$fjFNb3MUoVFHxgeKe5SWXuNydDbtqsxclXmUyFF7ULHL8FkvLsIDq', NULL, NULL, NULL, '2025-07-07 14:40:50', 'user'),
(4, 'guna', 'guna@gmail.com', '$2y$10$KmNOf8kV6NlEHPsBZejQ0efQ1af3o5cdcopYwGWCPQ/mGTGIfFvU2', NULL, NULL, NULL, '2025-07-07 15:20:54', 'user'),
(5, 'byan', 'byan@gmail.com', '$2y$10$xQC3hfTFYcm4Eo9PkLTwgumUtS2h2tiudctESxMEuRA/KOrb2zCEK', NULL, NULL, NULL, '2025-07-07 15:44:51', 'user'),
(6, 'guna ibmawan', 'ibmawan@gmail.com', '$2y$10$5Q2pYNn1NHk6XyB3MnR2ru32lpt/6j.ddF1aP05ERq86g3W50ywhS', NULL, NULL, NULL, '2025-07-07 16:12:25', 'user'),
(7, 'muhamad abyan', 'abyan11@gmail.com', '$2y$10$7evW2VurUX0djXJ9fGdxN.6pY62o4YZMpeCqwf.s0.AedoDrleebO', NULL, NULL, NULL, '2025-07-07 20:28:10', 'user'),
(8, 'zizil', 'zizil@gmail.com', '$2y$10$LsPtFXEtxKf0AHxAe8il7.CLInjq4BjQVei.nUcQTi92mvt4mO882', 'm azizil', '0812345643', 'purwodadi', '2025-07-08 16:12:49', 'user'),
(9, 'admin', 'admin@gmail.com', '$2y$10$RG.zazYuDaHPOfDm85kpue3mB2FWzhHmcSn/R9qf5lu7RWU22kNO.', 'admin', '-', '-', '2025-07-08 16:36:18', 'admin'),
(10, 'aulia', 'aulia@gmail.com', '$2y$10$xnkxj28lKpHVT50/Q2lGgu/b2tnwJHJ3iSJKGxSomi85fe7ih/gLq', 'aulia', '69', 'purwodadi', '2025-07-08 17:26:46', 'user'),
(11, 'refin', 'refin@gmail.com', '$2y$10$j7JTggckdefdrBLZqg.xw.4liWkD42DIZCkvUNmwQK/dVcPNiQ20m', 'REFIN JIO', '081276331634', 'ytta', '2026-01-26 12:11:26', 'user'),
(12, 'Zacky', 'zacky@gmail.com', '$2y$10$eKBquzYZjWf7ydVIGQEacOMe1ThB5xhrV7dl1IkmudRZPI2LoYEtW', 'ZackyHaqq', '819839173', 'ytta', '2026-01-27 04:02:28', 'user'),
(13, 'Bud', 'bud@gmail.com', '$2y$10$uZDIJqe7ViwmyWkPDsIOOOjt.h/8EJF4gU1b7nm9JgBuapwV2aZU6', 'Bud', 'Jeje', 'Jeke', '2026-03-19 12:41:45', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `id_pengguna` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `tanggal_pesanan` datetime DEFAULT current_timestamp(),
  `status` enum('menunggu','dibayar','dikirim','selesai','dibatalkan') DEFAULT 'menunggu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `id_pengguna`, `total`, `tanggal_pesanan`, `status`) VALUES
(17, 8, 150000.00, '2025-07-16 08:08:35', 'dibayar'),
(18, 8, 1400000.00, '2025-07-16 08:10:43', 'dibayar'),
(19, 8, 2800000.00, '2025-07-16 08:31:15', 'menunggu');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `judul_game` varchar(50) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `stok` int(11) DEFAULT 1,
  `id_penjual` int(11) DEFAULT NULL,
  `tanggal_dibuat` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `judul_game`, `deskripsi`, `harga`, `gambar`, `stok`, `id_penjual`, `tanggal_dibuat`) VALUES
(12, 'ZZZ Rerol', 'Zenless Zone Zero', 'Akun Bagus Untuk Gacha Dengan LV YAng Lumayan Tinggi', 300000.00, '1752048797_zzz2.jpg', 1, 9, '2025-07-09 15:13:17'),
(13, 'ZZZ V1', 'Zenless Zone Zero', 'Dengan Karakter Bintang 5 Ada Beberapa', 80000.00, '1752048890_zzz1.jpg', 1, 9, '2025-07-09 15:14:50'),
(14, 'ZZZ X1', 'Zenless Zone Zero', 'Akun ZZZ Yang LV Tinggi Dan Karakter Yang Cukup TerBuild', 300000.00, '1752048955_zzz3.jpg', 1, 9, '2025-07-09 15:15:55'),
(15, 'HSR V1', 'Honkai Star Rail', 'Cek Gambar', 1300000.00, '1752049002_hsr4.jpg', 1, 9, '2025-07-09 15:16:42'),
(16, 'HSR X1', 'Honkai Star Rail', 'Akun End Game Tinggal Main', 750000.00, '1752049058_hsr2.jpg', 1, 9, '2025-07-09 15:17:38'),
(17, 'HSR VV1', 'Honkai Star Rail', 'Akun Yang Cukup Menarik', 700000.00, '1752049114_hsr5.jpg', 0, 9, '2025-07-09 15:18:34'),
(18, 'GI V1', 'Genshin Impact', 'End Game TerUrus', 600000.00, '1752049162_akun6.jpg', 1, 9, '2025-07-09 15:19:22'),
(19, 'Gi X1', 'Genshin Impact', 'Build UP!', 550000.00, '1752049199_akun20.jpg', 1, 9, '2025-07-09 15:19:59'),
(20, 'GI V3', 'Genshin Impact', 'Mid Quest', 450000.00, '1752049232_akun12.jpg', 0, 9, '2025-07-09 15:20:32'),
(21, 'GI X3', 'Genshin Impact', 'Mid Game ', 250000.00, '1752049315_akun4.jpg', 0, 9, '2025-07-09 15:21:55'),
(22, 'Genshin', 'Genshin Impact', 'Zzzz', 150000.00, '1752049350_akunxx.jpg', 0, 9, '2025-07-09 15:22:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_pesanan` (`id_pesanan`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`),
  ADD KEY `id_pengguna` (`id_pengguna`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_pesanan` (`id_pesanan`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD UNIQUE KEY `nama_pengguna` (`nama_pengguna`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_penjual` (`id_penjual`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD CONSTRAINT `fk_detail_pesanan` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`),
  ADD CONSTRAINT `fk_detail_produk` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `fk_keranjang_pengguna` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`),
  ADD CONSTRAINT `fk_keranjang_produk` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `fk_pembayaran_pesanan` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`);

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `fk_pesanan_pengguna` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `fk_produk_penjual` FOREIGN KEY (`id_penjual`) REFERENCES `pengguna` (`id_pengguna`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
