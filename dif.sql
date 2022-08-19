-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Aug 19, 2022 at 10:15 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dif`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `usuario` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `contraseña` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `creado` date NOT NULL DEFAULT current_timestamp(),
  `modificado` date DEFAULT NULL,
  `eliminado` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `nombre`, `usuario`, `contraseña`, `activo`, `creado`, `modificado`, `eliminado`) VALUES
(1, 'Benjamin Ivan Hernandez', 'ivan1516hc', '15087026', 1, '2022-08-17', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `servicios`
--

CREATE TABLE `servicios` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `creado` date NOT NULL DEFAULT current_timestamp(),
  `modificado` date DEFAULT NULL,
  `eliminado` date DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `ubicacion` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `servicios`
--

INSERT INTO `servicios` (`id`, `nombre`, `descripcion`, `creado`, `modificado`, `eliminado`, `activo`, `ubicacion`) VALUES
(1, '2 x 1', 'Hola desde phpMyAdmin.', '2022-08-15', NULL, NULL, 0, NULL),
(2, 'Hola de nuevo', 'No me sale Martha..', '2022-08-16', NULL, NULL, 1, NULL),
(3, 'Prueba de ADD', 'Primer prueba.', '2022-08-16', NULL, NULL, 1, NULL),
(4, 'Prueba reset form', 'Esto se debe de borrar.', '2022-08-16', NULL, NULL, 1, NULL),
(5, 'Prueba reset form', 'Esto se debe de borrar...', '2022-08-16', NULL, NULL, 0, NULL),
(6, 'Prueba de nuevo campo', 'ubicación', '2022-08-19', NULL, NULL, 1, ''),
(7, 'Prueba 2', 'kehfkejf', '2022-08-19', NULL, NULL, 1, ''),
(8, 'Ubicacion', 'new', '2022-08-19', NULL, NULL, 1, ''),
(9, 'Prueba de ADDwsdefr', 'fsrgtdf', '2022-08-19', NULL, NULL, 1, ''),
(10, 'Prueba de ADD', 'wdesfrgthng', '2022-08-19', NULL, NULL, 1, ''),
(11, 'Benjamin Ivane', 'wertethr', '2022-08-19', NULL, NULL, 1, ''),
(12, 'drftgrtyh', 'sefrsgthyt', '2022-08-19', NULL, NULL, 1, ''),
(13, '2 x 1', 'wsde', '2022-08-19', NULL, NULL, 1, ''),
(14, 'prueba ', 'no llega ubicacion', '2022-08-19', NULL, NULL, 1, 'GDL');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
