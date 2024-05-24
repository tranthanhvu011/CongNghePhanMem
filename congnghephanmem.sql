-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 24, 2024 lúc 06:29 PM
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
-- Cấu trúc bảng cho bảng `diem`
--

CREATE TABLE `diem` (
  `id` int(11) NOT NULL,
  `diem15Phut` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`diem15Phut`)),
  `diem45phut` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`diem45phut`)),
  `diemGk` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`diemGk`)),
  `diemCk` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`diemCk`)),
  `tongKet` double DEFAULT NULL,
  `idSinhVien` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giaovien`
--

CREATE TABLE `giaovien` (
  `id` int(11) NOT NULL,
  `nameGiaoVien` varchar(255) NOT NULL,
  `ngaySinh` varchar(255) NOT NULL,
  `gioiTinh` varchar(255) DEFAULT NULL,
  `diaChi` varchar(255) NOT NULL,
  `soDienThoai` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `anhDaiDien` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `giaovien`
--

INSERT INTO `giaovien` (`id`, `nameGiaoVien`, `ngaySinh`, `gioiTinh`, `diaChi`, `soDienThoai`, `email`, `anhDaiDien`) VALUES
(6, 'Trần Thanh Vũ', '2003-04-10', 'Nam', 'Dĩ An', '0379886918', 'lethicuba@gmail.com', '51e2b6facb124afea37f69a4da45425d.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lophoc`
--

CREATE TABLE `lophoc` (
  `id` int(11) NOT NULL,
  `giaoVienChuNhiem` int(11) NOT NULL,
  `tenLopHoc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `lophoc`
--

INSERT INTO `lophoc` (`id`, `giaoVienChuNhiem`, `tenLopHoc`) VALUES
(38, 3, '12A'),
(40, 4, '13A'),
(41, 6, '12A'),
(42, 6, '12B');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sinhvien`
--

CREATE TABLE `sinhvien` (
  `id` int(11) NOT NULL,
  `MSSV` varchar(255) NOT NULL,
  `hoVaTen` varchar(255) NOT NULL,
  `soDienThoai` char(20) DEFAULT NULL,
  `soDienThoaiPhuHuynh` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gioiTinh` varchar(255) NOT NULL,
  `diaChi` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `idLopHoc` int(11) NOT NULL,
  `hinhAnh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thoikhoabieu`
--

CREATE TABLE `thoikhoabieu` (
  `id` int(11) NOT NULL,
  `thu2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`thu2`)),
  `thu3` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`thu3`)),
  `thu4` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`thu4`)),
  `thu5` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`thu5`)),
  `thu6` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`thu6`)),
  `idLopHoc` int(11) DEFAULT NULL,
  `buoi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `thoikhoabieu`
--

INSERT INTO `thoikhoabieu` (`id`, `thu2`, `thu3`, `thu4`, `thu5`, `thu6`, `idLopHoc`, `buoi`) VALUES
(26, '{\"MonHoc\":[{\"Tiet\":\"1\",\"TenMon1\":\"Toán\",\"GiaoVien1\":\"6\",\"ThoiGian1\":\"45 Phút\"},{\"Tiet\":\"2\",\"TenMon2\":\"Toán\",\"ThoiGian2\":\"45 Phút\",\"GiaoVien2\":\"6\"},{\"TenMon3\":\"\",\"Tiet\":\"3\",\"GiaoVien3\":\"6\",\"ThoiGian3\":\"45 Phút\"},{\"GiaoVien4\":\"6\",\"TenMon4\":\"\",\"Tiet\":\"4\",\"ThoiGian4\":\"45 Phút\"},{\"GiaoVien5\":\"6\",\"ThoiGian5\":\"45 Phút\",\"TenMon5\":\"\",\"Tiet\":\"5\"}]}', '{\"MonHoc1\":[{\"Tiet\":\"1\",\"TenMon1\":\"\",\"GiaoVien1\":\"6\",\"ThoiGian1\":\"45 Phút\"},{\"Tiet\":\"2\",\"TenMon2\":\"\",\"ThoiGian2\":\"45 Phút\",\"GiaoVien2\":\"6\"},{\"TenMon3\":\"\",\"Tiet\":\"3\",\"GiaoVien3\":\"6\",\"ThoiGian3\":\"45 Phút\"},{\"GiaoVien4\":\"6\",\"TenMon4\":\"\",\"Tiet\":\"4\",\"ThoiGian4\":\"45 Phút\"},{\"GiaoVien5\":\"6\",\"ThoiGian5\":\"45 Phút\",\"TenMon5\":\"\",\"Tiet\":\"5\"}]}', '{\"MonHoc2\":[{\"Tiet\":\"1\",\"TenMon1\":\"\",\"GiaoVien1\":\"6\",\"ThoiGian1\":\"45 Phút\"},{\"Tiet\":\"2\",\"TenMon2\":\"\",\"ThoiGian2\":\"45 Phút\",\"GiaoVien2\":\"6\"},{\"TenMon3\":\"\",\"Tiet\":\"3\",\"GiaoVien3\":\"6\",\"ThoiGian3\":\"45 Phút\"},{\"GiaoVien4\":\"6\",\"TenMon4\":\"\",\"Tiet\":\"4\",\"ThoiGian4\":\"45 Phút\"},{\"GiaoVien5\":\"6\",\"ThoiGian5\":\"45 Phút\",\"TenMon5\":\"\",\"Tiet\":\"5\"}]}', '{\"MonHoc3\":[{\"Tiet\":\"1\",\"TenMon1\":\"\",\"GiaoVien1\":\"6\",\"ThoiGian1\":\"45 Phút\"},{\"Tiet\":\"2\",\"TenMon2\":\"\",\"ThoiGian2\":\"45 Phút\",\"GiaoVien2\":\"6\"},{\"TenMon3\":\"\",\"Tiet\":\"3\",\"GiaoVien3\":\"6\",\"ThoiGian3\":\"45 Phút\"},{\"GiaoVien4\":\"6\",\"TenMon4\":\"\",\"Tiet\":\"4\",\"ThoiGian4\":\"45 Phút\"},{\"GiaoVien5\":\"6\",\"ThoiGian5\":\"45 Phút\",\"TenMon5\":\"\",\"Tiet\":\"5\"}]}', '{\"MonHoc4\":[{\"Tiet\":\"1\",\"TenMon1\":\"\",\"GiaoVien1\":\"6\",\"ThoiGian1\":\"45 Phút\"},{\"Tiet\":\"2\",\"TenMon2\":\"\",\"ThoiGian2\":\"45 Phút\",\"GiaoVien2\":\"6\"},{\"TenMon3\":\"\",\"Tiet\":\"3\",\"GiaoVien3\":\"6\",\"ThoiGian3\":\"45 Phút\"},{\"GiaoVien4\":\"6\",\"TenMon4\":\"\",\"Tiet\":\"4\",\"ThoiGian4\":\"45 Phút\"},{\"GiaoVien5\":\"6\",\"ThoiGian5\":\"45 Phút\",\"TenMon5\":\"\",\"Tiet\":\"5\"}]}', 41, 0);

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
-- Chỉ mục cho bảng `diem`
--
ALTER TABLE `diem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_diem` (`idSinhVien`);

--
-- Chỉ mục cho bảng `giaovien`
--
ALTER TABLE `giaovien`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lophoc`
--
ALTER TABLE `lophoc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`tenLopHoc`),
  ADD KEY `lophoc_ibfk_1` (`giaoVienChuNhiem`);

--
-- Chỉ mục cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idLopHoc` (`idLopHoc`);

--
-- Chỉ mục cho bảng `thoikhoabieu`
--
ALTER TABLE `thoikhoabieu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_lophoc` (`idLopHoc`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `diem`
--
ALTER TABLE `diem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `giaovien`
--
ALTER TABLE `giaovien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `lophoc`
--
ALTER TABLE `lophoc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `thoikhoabieu`
--
ALTER TABLE `thoikhoabieu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `diem`
--
ALTER TABLE `diem`
  ADD CONSTRAINT `fk_diem` FOREIGN KEY (`idSinhVien`) REFERENCES `sinhvien` (`id`);

--
-- Các ràng buộc cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD CONSTRAINT `sinhvien_ibfk_1` FOREIGN KEY (`idLopHoc`) REFERENCES `lophoc` (`id`);

--
-- Các ràng buộc cho bảng `thoikhoabieu`
--
ALTER TABLE `thoikhoabieu`
  ADD CONSTRAINT `fk_lophoc` FOREIGN KEY (`idLopHoc`) REFERENCES `lophoc` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
