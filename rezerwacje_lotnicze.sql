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
-- Database: `rezerwacje_lotnicze`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `adres`
--

CREATE TABLE IF NOT EXISTS `adres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wojewodztwo` varchar(45) NOT NULL,
  `powiat` varchar(45) NOT NULL,
  `miejscowosc` varchar(45) NOT NULL,
  `ulica` varchar(45) NOT NULL,
  `numer_domu` varchar(45) NOT NULL,
  `numer_lokalu` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lot`
--

CREATE TABLE IF NOT EXISTS `lot` (
  `numer_lotu` int(11) NOT NULL,
  `data_wylotu` datetime DEFAULT NULL,
  PRIMARY KEY (`numer_lotu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pasazer`
--

CREATE TABLE IF NOT EXISTS `pasazer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `pesel` int(11) NOT NULL,
  `telefon` varchar(15) NOT NULL,
  `mail` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezerwacja`
--

CREATE TABLE IF NOT EXISTS `rezerwacja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numer_siedzenia` int(5) NOT NULL,
  `bagaz` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samolot`
--

CREATE TABLE IF NOT EXISTS `samolot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producent` varchar(45) NOT NULL,
  `typ` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
