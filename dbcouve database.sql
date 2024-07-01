-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2024 at 10:22 AM
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
-- Database: `dbcouve`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `Code` varchar(5) NOT NULL,
  `ProductName` varchar(30) NOT NULL,
  `Catalogue` set('Summertime','Vistosa','Springfield','Monochrome') NOT NULL,
  `Quantity` int(10) NOT NULL,
  `Size` enum('S','M','L') NOT NULL,
  `Price` decimal(10,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `Code`, `ProductName`, `Catalogue`, `Quantity`, `Size`, `Price`) VALUES
(1234009001, 'P001', 'Orange Long Dress', 'Summertime', 78, 'S', 129.000),
(1234009002, 'P002', 'Orange Long Dress', 'Summertime', 80, 'M', 229.000),
(1234009003, 'P003', 'Orange Long Dress', 'Summertime', 90, 'L', 329.000),
(1234009004, 'P004', 'Wrap Flower Dress', 'Summertime', 100, 'S', 129.000),
(1234009005, 'P005', 'Wrap Flower Dress', 'Summertime', 100, 'M', 229.000),
(1234009006, 'P006', 'Wrap Flower Dress', 'Summertime', 100, 'L', 329.000),
(1234009007, 'P007', 'Short Tropical Dress', 'Summertime', 50, 'S', 129.000),
(1234009008, 'P008', 'Short Tropical Dress', 'Summertime', 70, 'M', 229.000),
(1234009009, 'P009', 'Short Tropical Dress', 'Summertime', 50, 'L', 329.000),
(1234009010, 'P010', 'Sleeveless Rainbow Dress', 'Vistosa', 100, 'S', 139.000),
(1234009011, 'P011', 'Sleveless Rainbow Dress', 'Vistosa', 80, 'M', 239.000),
(1234009012, 'P012', 'Slaveless Rainbow Dress', 'Vistosa', 90, 'L', 339.000),
(1234009013, 'P013', 'Coocdinates Dress', 'Vistosa', 50, 'S', 139.000),
(1234009014, 'P014', 'Coocdinates Dress', 'Vistosa', 70, 'M', 239.000),
(1234009015, 'P015', 'Coocdinates Dress', 'Vistosa', 50, 'L', 339.000),
(1234009016, 'P016', 'A-Line Rainbow Dress', 'Vistosa', 70, 'S', 139.000),
(1234009017, 'P017', 'A-Line Rainbow Dress', 'Vistosa', 70, 'M', 239.000),
(1234009018, 'P018', 'A-Line Rainbow Dress', 'Vistosa', 100, 'L', 339.000),
(1234009019, 'P019', 'Peach Midi Dress', 'Springfield', 50, 'S', 149.000),
(1234009020, 'P020', 'Peach Midi Dress', 'Springfield', 70, 'M', 249.000),
(1234009021, 'P021', 'Peach Midi Dress', 'Springfield', 90, 'L', 349.000),
(1234009022, 'P022', 'Spring Waist Dress', 'Springfield', 80, 'S', 149.000),
(1234009023, 'P023', 'Spring Waist Dress', 'Springfield', 50, 'M', 249.000),
(1234009024, 'P024', 'Spring Waist Dress', 'Springfield', 90, 'L', 349.000),
(1234009025, 'P025', 'Flower Trapeeze Dress', 'Springfield', 50, 'S', 149.000),
(1234009026, 'P026', 'Flower Trapeeze Dress', 'Springfield', 70, 'M', 249.000),
(1234009027, 'P027', 'Flower Trapeeze Dress', 'Springfield', 50, 'L', 349.000),
(1234009028, 'P028', 'Midnight Black Cheongsam', 'Monochrome', 50, 'S', 159.000),
(1234009029, 'P029', 'Midnight Black Cheongsam', 'Monochrome', 80, 'M', 259.000),
(1234009030, 'P030', 'Midnight Black Cheongsam', 'Monochrome', 90, 'L', 359.000),
(1234009031, 'P031', 'Cyberpunk Set', 'Monochrome', 40, 'S', 159.000),
(1234009032, 'P032', 'Cyberpunk Set', 'Monochrome', 50, 'M', 259.000),
(1234009033, 'P033', 'Cyberpunk Set', 'Monochrome', 40, 'L', 359.000),
(1234009034, 'P034', 'Mamba Casual Set', 'Monochrome', 80, 'S', 159.000),
(1234009035, 'P035', 'Mamba Casual Set', 'Monochrome', 60, 'M', 259.000),
(1234009036, 'P036', 'Mamba Casual Set', 'Monochrome', 50, 'L', 359.000);

--
-- Triggers `product`
--
DELIMITER $$
CREATE TRIGGER `Code2` BEFORE INSERT ON `product` FOR EACH ROW BEGIN
    DECLARE new_code VARCHAR(5);
    -- Mengambil nilai maksimal dari kolom Code, mengkonversi substring ke angka, dan menambahkannya 1
    SELECT LPAD(COALESCE(MAX(CAST(SUBSTRING(Code, 2, 3) AS UNSIGNED)), 0) + 1, 3, '0') INTO new_code FROM product;
    -- Menggabungkan huruf 'U' dengan nilai yang telah diproses
    SET NEW.Code = CONCAT('P', new_code);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ProductID` BEFORE INSERT ON `product` FOR EACH ROW BEGIN
    DECLARE new_id INT;
    -- Mengambil nilai maksimal dari kolom ProductID atau menggunakan default 1232009000, kemudian menambahkannya 1
    SELECT COALESCE(MAX(CAST(ProductID AS UNSIGNED)), 1234009000) + 1 INTO new_id FROM product;
    -- Mengatur nilai baru ke kolom ProductID
    SET NEW.ProductID = new_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `SaleID` int(11) NOT NULL,
  `Code` varchar(6) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Size` enum('S','M','L','') NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  `SaleDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`SaleID`, `Code`, `UserID`, `ProductID`, `Quantity`, `Size`, `Price`, `SaleDate`) VALUES
(1235009001, 'S001', 1232009001, 1234009001, 3, 'S', 477000, '2024-07-01'),
(1235009002, 'S002', 1232009002, 1234009001, 3, 'S', 477000, '2024-07-01'),
(1235009003, 'S003', 1232009003, 1234009001, 5, 'S', 795000, '2024-07-01');

--
-- Triggers `sales`
--
DELIMITER $$
CREATE TRIGGER `Code3` BEFORE INSERT ON `sales` FOR EACH ROW BEGIN
    DECLARE new_code VARCHAR(5);
    SELECT LPAD(COALESCE(MAX(CAST(SUBSTRING(Code, 2, 3) AS UNSIGNED)), 0) + 1, 3, '0') INTO new_code FROM sales;
    SET NEW.Code = CONCAT('S', new_code);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `SaleID` BEFORE INSERT ON `sales` FOR EACH ROW BEGIN
    DECLARE new_id INT;
    SELECT COALESCE(MAX(CAST(SaleID AS UNSIGNED)), 1235009000) + 1 INTO new_id FROM sales;
    SET NEW.SaleID = new_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_product_quantity` AFTER INSERT ON `sales` FOR EACH ROW BEGIN
    -- Mengurangi quantity produk di tabel product berdasarkan ProductID yang dimasukkan ke tabel sales
    UPDATE product
    SET quantity = quantity - NEW.quantity
    WHERE ProductID = NEW.ProductID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Code` varchar(5) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Gender` set('Female','Male','','') NOT NULL,
  `Address` text NOT NULL,
  `Password` text NOT NULL,
  `Email` varchar(255) NOT NULL,
  `user_role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Code`, `Username`, `Gender`, `Address`, `Password`, `Email`, `user_role`) VALUES
(1232009001, 'U001', 'Vallen', 'Female', 'Jl. Menteng Atas ', '26d5b3858e4317c2d4474e491be7f0e7502ddee876ee0efe43777e910772e521', 'jovatama.abadi@gmail.com', 'admin'),
(1232009002, 'U002', 'yohana', 'Female', 'Jl. Menteng Atas', '5212d39eee824f6701aac206573060a4e777a6fad183cf038d6e4f64f1c9c3c9', 'yohana28@gmail.com', 'user'),
(1232009003, 'U003', 'Baptista', 'Female', 'Jl. Menteng Atas', 'afe7248e53f02163029bfc957e5b442c8cc1542d4f6b7041288287e4e2880bf9', 'baptista28@gmail.com', 'user');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `Code` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
    DECLARE new_code VARCHAR(5);
    SELECT LPAD(COALESCE(MAX(CAST(SUBSTRING(Code, 2, 3) AS UNSIGNED)), 0) + 1, 3, '0') INTO new_code FROM users;
    SET NEW.Code = CONCAT('U', new_code);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UserID` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
    DECLARE new_id INT;
    SELECT COALESCE(MAX(CAST(UserID AS UNSIGNED)), 1232009000) + 1 INTO new_id FROM users;
    SET NEW.UserID = new_id;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`SaleID`),
  ADD UNIQUE KEY `UserID` (`UserID`,`ProductID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1234009037;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `SaleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1235009004;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1232009004;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
