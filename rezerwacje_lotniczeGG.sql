-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 20 Paź 2016, 17:08
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

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
  `numer_lokalu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Zrzut danych tabeli `adres`
--

INSERT INTO `adres` (`id`, `wojewodztwo`, `powiat`, `miejscowosc`, `ulica`, `numer_domu`, `numer_lokalu`) VALUES
(1, 'pomorskie', 'lęborski', 'Lębork', 'Marcinkowskiego', '1', NULL),
(2, 'pomorskie', 'lęborski', 'Lębork', 'Warszawska', '112', NULL),
(3, 'pomorskie', 'lęborski', 'Lębork', 'Pionierów', '997', '999');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lot`
--

CREATE TABLE IF NOT EXISTS `lot` (
  `numer_lotu` int(11) NOT NULL AUTO_INCREMENT,
  `data_wylotu` datetime NOT NULL,
  `samolot_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`numer_lotu`),
  KEY `samolot_id` (`samolot_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Zrzut danych tabeli `lot`
--

INSERT INTO `lot` (`numer_lotu`, `data_wylotu`, `samolot_id`) VALUES
(1, '2027-12-27 20:20:20', 3),
(2, '2016-10-04 00:00:00', 3),
(3, '2012-12-12 11:11:00', 4),
(4, '2019-05-24 23:03:00', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pasazer`
--

CREATE TABLE IF NOT EXISTS `pasazer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `pesel` varchar(45) NOT NULL,
  `telefon` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `adres_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adres_id` (`adres_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Zrzut danych tabeli `pasazer`
--

INSERT INTO `pasazer` (`id`, `imie`, `nazwisko`, `pesel`, `telefon`, `mail`, `adres_id`) VALUES
(1, 'Jan', 'Kowalski', '66110012121', '66677712345', 'jank@ilovetechnikinformatyk.pl', 1),
(2, 'Jan', 'Nowak', '86110045455', '12312312312', 'jann@ilovetechnikinformatyk.pl', 2),
(3, 'Tadeusz', 'Nowak', '46120023232', '45678901332', 'tadzio@ilovetechnikinformatyk.pl', 3),
(4, 'Zdzisław', 'Konopka', '7602334213', '3424325434', 'zdzichu@ilovethissite.pl', 1),
(5, 'Wiesława', 'Zzagrobna', '201005123456', '123456123', 'podziemie@thissiteisamazing.pl', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezerwacja`
--

CREATE TABLE IF NOT EXISTS `rezerwacja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numer_siedzenia` int(11) NOT NULL,
  `bagaz` varchar(45) NOT NULL,
  `pasazer_id` int(11) DEFAULT NULL,
  `lot_numer_lotu` int(11) DEFAULT NULL,
  `status_rezerwacji_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pasazer_id` (`pasazer_id`),
  KEY `lot_numer_lotu` (`lot_numer_lotu`),
  KEY `status_rezerwacji_id` (`status_rezerwacji_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Zrzut danych tabeli `rezerwacja`
--

INSERT INTO `rezerwacja` (`id`, `numer_siedzenia`, `bagaz`, `pasazer_id`, `lot_numer_lotu`, `status_rezerwacji_id`) VALUES
(1, 13, 'Owca', 5, 1, 4),
(2, 123, 'Cztery ogórki', 3, 2, 2),
(3, 911, 'Materiały wybuchowe + granat', 2, 1, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samolot`
--

CREATE TABLE IF NOT EXISTS `samolot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producent` varchar(45) NOT NULL,
  `typ` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Zrzut danych tabeli `samolot`
--

INSERT INTO `samolot` (`id`, `producent`, `typ`) VALUES
(1, 'Ąty', 'Ęście'),
(2, 'Boink', 'Drimlajner'),
(3, 'Garaż Konrada', 'Awionurek'),
(4, 'MakroHard', 'Doors');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `status_rezerwacji`
--

CREATE TABLE IF NOT EXISTS `status_rezerwacji` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Zrzut danych tabeli `status_rezerwacji`
--

INSERT INTO `status_rezerwacji` (`id`, `status`) VALUES
(1, 'wstepna'),
(2, 'nieoplacona'),
(3, 'zarezerwowano'),
(4, 'archiwalna');

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `lot`
--
ALTER TABLE `lot`
  ADD CONSTRAINT `lot_ibfk_1` FOREIGN KEY (`samolot_id`) REFERENCES `samolot` (`id`);

--
-- Ograniczenia dla tabeli `pasazer`
--
ALTER TABLE `pasazer`
  ADD CONSTRAINT `pasazer_ibfk_1` FOREIGN KEY (`adres_id`) REFERENCES `adres` (`id`);

--
-- Ograniczenia dla tabeli `rezerwacja`
--
ALTER TABLE `rezerwacja`
  ADD CONSTRAINT `rezerwacja_ibfk_1` FOREIGN KEY (`pasazer_id`) REFERENCES `pasazer` (`id`),
  ADD CONSTRAINT `rezerwacja_ibfk_2` FOREIGN KEY (`lot_numer_lotu`) REFERENCES `lot` (`numer_lotu`),
  ADD CONSTRAINT `rezerwacja_ibfk_3` FOREIGN KEY (`status_rezerwacji_id`) REFERENCES `status_rezerwacji` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
