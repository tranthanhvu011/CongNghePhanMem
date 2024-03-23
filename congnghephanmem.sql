-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 22, 2024 lúc 04:57 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nhomthucung`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lophoc`
--

CREATE TABLE `lophoc` (
  `id` int(11) NOT NULL,
  `giaoVienChuNhiem` varchar(255) NOT NULL,
  `tenLopHoc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `lophoc`
--

INSERT INTO `lophoc` (`id`, `giaoVienChuNhiem`, `tenLopHoc`) VALUES
(1, 'Nguyen Thanh Vu', 'DH21DTD'),
(32, '412421', 'fasfasf'),
(33, '412421', 'fasfasf'),
(34, '412421', '412412');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sinhvien`
--

CREATE TABLE `sinhvien` (
  `id` int(11) NOT NULL,
  `MSSV` varchar(255) NOT NULL,
  `hoVaTen` varchar(255) NOT NULL,
  `soDienThoai` char(20) DEFAULT NULL,
  `birthday` date NOT NULL,
  `gioiTinh` varchar(255) NOT NULL,
  `diaChi` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `idLopHoc` int(11) NOT NULL,
  `hinhAnh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sinhvien`
--

INSERT INTO `sinhvien` (`id`, `MSSV`, `hoVaTen`, `soDienThoai`, `birthday`, `gioiTinh`, `diaChi`, `email`, `idLopHoc`, `hinhAnh`) VALUES
(1, '21130616', 'Tran Thanh Vu', '0379886918', '2003-04-10', 'Nam', 'Chung Cu Ht Pearl', 'lethicuba1004@gmail.com', 1, 'qc.png'),
(37, '1234125', '123', '114', '2003-04-10', 'nam', '412412412412', 'cccccccccccccccccccc@gmail.com', 1, 'c01412ded1994b8ea213e5a56a014532.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `fullName` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `securityCode` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `userName`, `fullName`, `email`, `phoneNumber`, `address`, `image`, `password`, `isAdmin`, `status`, `securityCode`) VALUES
(2, 'admin1', 'ldv', 'vanngu123@gmail.com', 'phone1', 'address1', 'image1', '$2a$10$zbiGG9zBjF4jfZ8jY5VtFOxLHR8psu.mukpauqnL1aaqGoExWNNqi', 1, 1, '012345'),
(14, 'trithanh', 'Trần Thanh Trí', 'tranthanhtri0147@gmail.com', '0123456789', 'Chung cư An Bình', 'f55c83a47b6b44128b68b545e81e76f7.jpg', '$2a$10$8Mhn/kftW4tudhaWeEtQT.LzouoiPDqQ3Vj.2DG4cZ5tyRZkfa0G.', 0, 1, '457628'),
(24, 'nguoidung1', 'Lê Chí Trường', 'lephuc11232@gmail.com', '0835169543', 'Chung cư An Bình', 'f02e7d9a8cab44aa8500091cef4e2dff.jpg', '$2a$10$BQa0ykxvGkUYSGXtFoub8.ooVtj.mjY68qtwHjb5pkQeG7cVYj5Xq', 0, 1, '920176'),
(25, 'thanhvu', NULL, '123421421@gmail.com', NULL, NULL, NULL, '$2a$10$zbiGG9zBjF4jfZ8jY5VtFOxLHR8psu.mukpauqnL1aaqGoExWNNqi', 0, 0, '529293');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `lophoc`
--
ALTER TABLE `lophoc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`tenLopHoc`);

--
-- Chỉ mục cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idLopHoc` (`idLopHoc`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `lophoc`
--
ALTER TABLE `lophoc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD CONSTRAINT `sinhvien_ibfk_1` FOREIGN KEY (`idLopHoc`) REFERENCES `lophoc` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
