-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2024 at 02:46 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `angkatan3_belajar`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id` int(11) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `telepon` varchar(16) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id`, `nama_anggota`, `telepon`, `email`, `alamat`) VALUES
(1, 'Yudi Afrizal', '213213421', 'yudi@gmail.com', 'asdas'),
(3, 'didi', '123', 'mahadewirahmalya@gmail.com', '123'),
(5, 'edwar', '87656789', 'edy@gmail.com', 'cipinang');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_buku` varchar(50) NOT NULL,
  `penerbit` varchar(50) NOT NULL,
  `tahun_terbit` varchar(10) NOT NULL,
  `pengarang` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `id_kategori`, `nama_buku`, `penerbit`, `tahun_terbit`, `pengarang`, `created_at`, `updated_at`) VALUES
(7, 4, 'Sherlock Holmes', 'dce pustakaa', '1895', 'Sir Arthur Conan Doyle', '2024-10-15 12:26:45', '2024-10-15 13:08:54'),
(9, 4, 'Detective Conan', 'abc pustaka', '2000', 'Aoyama Gosho', '2024-10-17 07:55:58', '2024-10-17 07:55:58');

-- --------------------------------------------------------

--
-- Table structure for table `detail_peminjaman`
--

CREATE TABLE `detail_peminjaman` (
  `id` int(11) NOT NULL,
  `id_peminjaman` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_peminjaman`
--

INSERT INTO `detail_peminjaman` (`id`, `id_peminjaman`, `id_buku`) VALUES
(1, 0, 9),
(2, 4, 9),
(3, 5, 9),
(4, 6, 7),
(5, 7, 7),
(6, 8, 9),
(7, 8, 7),
(8, 9, 9),
(9, 10, 7),
(10, 11, 7),
(11, 11, 9),
(12, 12, 7),
(13, 12, 9),
(14, 13, 7),
(15, 13, 9),
(16, 14, 7),
(17, 14, 9),
(18, 15, 7),
(19, 15, 9);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`, `created_at`, `updated_at`) VALUES
(4, 'misteri', '2024-10-15 07:19:44', '2024-10-15 07:19:44'),
(5, 'logic2', '2024-10-15 07:19:57', '2024-10-15 07:27:32');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `nama_level` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `nama_level`, `created_at`, `update_at`) VALUES
(1, 'Admin', '2024-10-15 09:20:09', '2024-10-15 09:21:40'),
(3, 'Administrator', '2024-10-15 09:21:21', '2024-10-15 09:21:21'),
(4, 'Instruktur', '2024-10-15 09:21:25', '2024-10-15 09:21:25'),
(5, 'Anggota', '2024-10-15 09:21:31', '2024-10-15 09:21:31');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `no_peminjaman` varchar(50) NOT NULL,
  `tgl_peminjaman` date NOT NULL,
  `tgl_pengembalian` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `id_anggota`, `no_peminjaman`, `tgl_peminjaman`, `tgl_pengembalian`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(9, 1, 'PJM/171024/009', '2024-10-03', '2024-10-12', '', '2024-10-17 08:37:05', '2024-10-21 11:43:21', 1),
(10, 3, 'PJM/171024/010', '2024-10-09', '2024-10-18', '', '2024-10-17 09:15:30', '2024-10-18 06:59:47', 1),
(11, 5, 'PJM/181024/011', '2024-10-18', '2024-10-22', '', '2024-10-18 06:19:55', '2024-10-18 06:57:57', 1),
(12, 5, 'PJM/181024/012', '2024-10-18', '2024-10-31', 'Di Kembalikan', '2024-10-18 06:27:38', '2024-10-21 12:39:39', 0),
(13, 1, 'PJM/181024/013', '2024-10-18', '2024-10-31', 'Di Pinjam', '2024-10-18 06:28:15', '2024-10-18 06:28:15', 0),
(14, 5, 'PJM/211024/014', '2024-10-02', '2024-10-15', 'Di Kembalikan', '2024-10-21 09:06:08', '2024-10-21 12:39:51', 0),
(15, 5, 'PJM/211024/015', '2024-10-22', '2024-10-24', 'Di Pinjam', '2024-10-21 12:08:19', '2024-10-21 12:08:19', 0),
(16, 0, '', '0000-00-00', '0000-00-00', '', '2024-10-21 12:13:26', '2024-10-21 12:13:48', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id` int(11) NOT NULL,
  `id_peminjaman` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `denda` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`id`, `id_peminjaman`, `status`, `denda`, `created_at`, `updated_at`) VALUES
(3, 12, 0, 0, '2024-10-21 12:39:39', '2024-10-21 12:39:39'),
(4, 14, 1, 600000, '2024-10-21 12:39:51', '2024-10-21 12:39:51');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `telepon` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `email`, `password`, `jenis_kelamin`, `telepon`) VALUES
(1, 'Admin', 'admin@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', 'Laki-laki', '0987654321'),
(9, 'Edwar45', 'edwar@yahoo.com', '', 'Laki-laki', '12345567778'),
(14, 'Lia123', 'lea@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', 'Perempuan', '79846514131'),
(15, 'Maesarohzzz', 'maesaroh@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', 'Perempuan', '21335567');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
