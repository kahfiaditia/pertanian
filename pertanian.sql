-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Jun 2021 pada 06.42
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pertanian`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelompok_tani`
--

CREATE TABLE `kelompok_tani` (
  `kelompok_id` int(11) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `jenis` varchar(40) NOT NULL,
  `petani_id` int(11) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kelompok_tani`
--

INSERT INTO `kelompok_tani` (`kelompok_id`, `nama`, `jenis`, `petani_id`, `alamat`) VALUES
(345565, 'TANI INDAH PADI', 'PADI HYBRIDA', 0, '08676666666'),
(345566, 'Tani Indah', 'Padi Aceh', 35671, 'Jalan Pangkal Pinang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penanaman`
--

CREATE TABLE `penanaman` (
  `penanaman_id` int(11) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `deskripsi` varchar(40) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penanaman`
--

INSERT INTO `penanaman` (`penanaman_id`, `jenis`, `deskripsi`, `created`, `updated`, `user_id`) VALUES
(4001, 'Tanaman Pangan', 'Padi, jagung, ketela pohon (ubi kayu), s', '2021-06-26 23:42:58', '0000-00-00 00:00:00', 40029),
(4002, 'Kebun', 'Buah-buahan, sayuran, dan bunga-bungaan', '2021-06-26 23:42:58', '0000-00-00 00:00:00', 40029),
(4006, 'Padi Aceh 4', 'Padi 12', '2021-06-27 22:01:34', NULL, 40029);

-- --------------------------------------------------------

--
-- Struktur dari tabel `petani`
--

CREATE TABLE `petani` (
  `petani_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `status` int(1) NOT NULL COMMENT '1:aktive,2:tidak',
  `no_hp` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `petani`
--

INSERT INTO `petani` (`petani_id`, `user_id`, `nik`, `nama`, `alamat`, `status`, `no_hp`) VALUES
(35671, 40031, '3123125608930088', 'Komeng', 'Jalan Dipati Unus Kelurahan Padi No 76', 1, '08655666777');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `nip` varchar(15) NOT NULL,
  `jenis_kelamin` int(1) NOT NULL COMMENT '1:L,2:P',
  `nomor_hp` varchar(20) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `kelompok_tani` varchar(50) NOT NULL,
  `jenis` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `level` int(1) NOT NULL COMMENT '1:Dinas,2:KL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `nama`, `jabatan`, `nip`, `jenis_kelamin`, `nomor_hp`, `nik`, `kelompok_tani`, `jenis`, `username`, `email`, `password`, `level`) VALUES
(40029, 'aditia', 'Kepala Dinas', '788PU-881', 1, '085676667777', '3173066608930002', 'PETANI BUNGA TERATAI', 'TERATAI', 'aditia', 'aditia@gmail.com', '55c828b40067e55ef2e146dfb95eb7ce', 1),
(40030, 'sandi', 'Kepala Dinas', '788PU-865', 1, '0856766678', '3123026608930007', 'PETANI BUNGA PADI', 'TERATAI', 'sandi', 'sandi@gmail.com', '4b1e2554cf51dcfb19cae120c', 2),
(40031, 'Komeng', '', '', 1, '08567677231', '3124026608930007', 'Petani Kangkung Mahal', 'Alami', 'komeng', 'komeng@gmail.com', '5e876a16c63f3b8519fa7dcc8ccf2ac5', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kelompok_tani`
--
ALTER TABLE `kelompok_tani`
  ADD PRIMARY KEY (`kelompok_id`);

--
-- Indeks untuk tabel `penanaman`
--
ALTER TABLE `penanaman`
  ADD PRIMARY KEY (`penanaman_id`);

--
-- Indeks untuk tabel `petani`
--
ALTER TABLE `petani`
  ADD PRIMARY KEY (`petani_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kelompok_tani`
--
ALTER TABLE `kelompok_tani`
  MODIFY `kelompok_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=345567;

--
-- AUTO_INCREMENT untuk tabel `penanaman`
--
ALTER TABLE `penanaman`
  MODIFY `penanaman_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4007;

--
-- AUTO_INCREMENT untuk tabel `petani`
--
ALTER TABLE `petani`
  MODIFY `petani_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35673;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40032;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `petani`
--
ALTER TABLE `petani`
  ADD CONSTRAINT `petani_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
