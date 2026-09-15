-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Wrz 15, 2026 at 12:20 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `szkola`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plec` enum('M','K') NOT NULL COMMENT 'Dopuszczalne M - mezczyzna, K - kobieta',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `plec`) VALUES
(1, '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczniowie`
--

CREATE TABLE IF NOT EXISTS `uczniowie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `dat_urodzenia` date DEFAULT NULL,
  `pesel` int(11) NOT NULL,
  `adres_email` varchar(50) DEFAULT NULL,
  `adres` varchar(50) NOT NULL,
  `miasto` varchar(50) NOT NULL,
  `plec` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
