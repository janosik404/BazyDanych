-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Wrz 22, 2026 at 11:48 AM
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
-- Database: `dziennik_lekcyjny`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nauczyciele`
--

CREATE TABLE IF NOT EXISTS `nauczyciele` (
  `id_nauczyciela` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_nauczyciela`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nauczyciele`
--

INSERT INTO `nauczyciele` (`id_nauczyciela`, `imie`, `nazwisko`) VALUES
(1, 'Adam', 'Lewandowski'),
(2, 'Ewa', 'Kaczmarek'),
(3, 'Tomasz', 'Wójcik'),
(4, 'mr', 'gg'),
(5, 'pani', 'kania'),
(6, 'procesor', 'no'),
(7, 'eee', 'nwm');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oceny`
--

CREATE TABLE IF NOT EXISTS `oceny` (
  `id_oceny` int(11) NOT NULL AUTO_INCREMENT,
  `id_ucznia` int(11) DEFAULT NULL,
  `id_przedmiotu` int(11) DEFAULT NULL,
  `id_nauczyciela` int(11) DEFAULT NULL,
  `ocena` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`id_oceny`),
  KEY `id_ucznia` (`id_ucznia`),
  KEY `id_przedmiotu` (`id_przedmiotu`),
  KEY `id_nauczyciela` (`id_nauczyciela`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `oceny`
--

INSERT INTO `oceny` (`id_oceny`, `id_ucznia`, `id_przedmiotu`, `id_nauczyciela`, `ocena`, `data`) VALUES
(1, 1, 1, 1, 5, '2025-01-10'),
(2, 1, 2, 2, 4, '2025-01-11'),
(3, 2, 1, 1, 3, '2025-01-12'),
(4, 2, 3, 3, 5, '2025-01-13'),
(5, 3, 1, 1, 2, '2025-01-14'),
(6, 3, 4, 3, 4, '2025-01-15'),
(7, 4, 2, 2, 5, '2025-01-16'),
(8, 4, 3, 3, 3, '2025-01-17'),
(9, 5, 1, 1, 6, '2025-01-18'),
(10, 5, 4, 3, 5, '2025-01-19'),
(11, 8, 3, 4, 1, '0000-00-00'),
(12, 8, 3, 4, 1, '2026-09-22');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedmioty`
--

CREATE TABLE IF NOT EXISTS `przedmioty` (
  `id_przedmiotu` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_przedmiotu`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `przedmioty`
--

INSERT INTO `przedmioty` (`id_przedmiotu`, `nazwa`) VALUES
(1, 'Matematyka'),
(2, 'Polski'),
(3, 'Angielski'),
(4, 'Fizyka'),
(5, 'daz dan');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczniowie`
--

CREATE TABLE IF NOT EXISTS `uczniowie` (
  `id_ucznia` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `klasa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_ucznia`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uczniowie`
--

INSERT INTO `uczniowie` (`id_ucznia`, `imie`, `nazwisko`, `klasa`) VALUES
(1, 'Jan', 'Kowalski', '3A'),
(2, 'Anna', 'Nowak', '3A'),
(3, 'Piotr', 'Zieliński', '3B'),
(4, 'Maria', 'Wiśniewska', '3B'),
(5, 'Kacper', 'Mazur', '3A'),
(6, 'Emyl', 'Janosik', '2P'),
(7, 'aku', 'gwalciceildomowipodpalaczmatek', '2P'),
(8, 'kapcder', 'zaba', '2P'),
(9, 'isac', 'bebnaz', '2P'),
(10, 'bartus', 'szon', '8nwm'),
(11, 'hamia', 'aaaaaaaaaaa', '2P'),
(12, 'julika', 'kulka', '2P');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `oceny`
--
ALTER TABLE `oceny`
  ADD CONSTRAINT `oceny_ibfk_1` FOREIGN KEY (`id_ucznia`) REFERENCES `uczniowie` (`id_ucznia`),
  ADD CONSTRAINT `oceny_ibfk_2` FOREIGN KEY (`id_przedmiotu`) REFERENCES `przedmioty` (`id_przedmiotu`),
  ADD CONSTRAINT `oceny_ibfk_3` FOREIGN KEY (`id_nauczyciela`) REFERENCES `nauczyciele` (`id_nauczyciela`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
