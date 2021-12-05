-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017 m. Kov 21 d. 15:59
-- Server version: 10.1.9-MariaDB
-- PHP Version: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gameshop`
--

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `parduotuves`
--

CREATE TABLE `parduotuves` (
  `id` int(11) NOT NULL,
  `pavadinimas` varchar(40) NOT NULL,
  `adresas` text NOT NULL,
  `fk_miestas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `parduotuves`
--

INSERT INTO `parduotuves` (`id`, `pavadinimas`, `adresas`, `fk_miestas`) VALUES
(1, 'SkyBox Kaunas', '', 1),
(2, 'HyperGames Vilnius', '', 2),
(3, 'FingerPrint Max', '', 1),
(4, 'Kilobaitas', '', 2),
(5, 'HungerGames Zero', '', 3);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `zaidimai`
--

CREATE TABLE `zaidimai` (
  `id` int(11) NOT NULL,
  `isleidimo_data` date NOT NULL,
  `multiplayer` tinyint(1) NOT NULL,
  `coop` tinyint(1) NOT NULL,
  `zaideju_skaicius` smallint(6) NOT NULL,
  `verte` decimal(8,2) NOT NULL,
  `zanras` int(11) NOT NULL,
  `kontroleris` int(11) NOT NULL,
  `os` int(11) NOT NULL,
  `amzius` int(11) NOT NULL,
  `stadija` int(11) DEFAULT NULL,
  `fk_projektas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `zaidimai`
--

INSERT INTO `zaidimai` (`id`, `isleidimo_data`, `multiplayer`, `coop`, `zaideju_skaicius`, `verte`, `zanras`, `kontroleris`, `os`, `amzius`, `stadija`, `fk_projektas`) VALUES
(1, '2016-01-29', 1, 1, 12, '59.99', 1, 1, 1, 2, 1, 1),
(2, '2017-02-21', 0, 1, 4, '29.99', 2, 2, 2, 2, 2, 2),
(3, '2015-05-19', 1, 1, 16, '59.99', 3, 1, 1, 3, 1, 3),
(4, '2014-09-05', 0, 0, 1, '29.99', 4, 2, 2, 1, 2, 4),
(5, '2016-02-18', 1, 1, 64, '59.99', 1, 1, 1, 2, 1, 5),
(6, '2015-03-19', 0, 1, 2, '29.99', 2, 2, 2, 3, 2, 6),
(7, '2016-02-13', 1, 1, 36, '59.99', 3, 1, 1, 1, 1, 7),
(8, '2015-11-24', 0, 0, 1, '29.99', 4, 2, 2, 2, 1, 8),
(9, '2017-05-28', 1, 1, 24, '59.99', 1, 1, 1, 3, 2, 9),
(10, '2017-11-06', 0, 1, 3, '29.99', 2, 2, 2, 1, 2, 10),
(11, '2016-12-01', 1, 1, 28, '59.99', 3, 1, 1, 2, 1, 11),
(12, '2014-09-17', 0, 1, 4, '29.99', 4, 2, 2, 3, 2, 12);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `zaidimu_stadijos`
--

CREATE TABLE `zaidimu_stadijos` (
  `ID` int(11) NOT NULL,
  `name` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `zaidimu_stadijos`
--

INSERT INTO `zaidimu_stadijos` (`ID`, `name`) VALUES
(1, 'early access'),
(2, 'released');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `darbuotojai`
--

CREATE TABLE `darbuotojai` (
  `id` char(6) NOT NULL,
  `vardas` varchar(20) NOT NULL,
  `pavarde` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `darbuotojai`
--

INSERT INTO `darbuotojai` (`id`, `vardas`, `pavarde`) VALUES
('1', 'Gerbaldas', 'Krinauskas'),
('2', 'Tomas', 'Jupiteris'),
('3', 'Marta', 'Betmene'),
('4', 'Kimas', 'Raikoninenas'),
('5', 'Nimas', 'Nazinga'),
('6', 'Aurimas', 'Speckauskas'),
('7', 'Fredas', 'Kisieliauskas'),
('8', 'Virga', 'Laimoniene');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `kontroleriai`
--

CREATE TABLE `kontroleriai` (
  `id` int(11) NOT NULL,
  `name` char(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `kontroleriai`
--

INSERT INTO `kontroleriai` (`id`, `name`) VALUES
(1, 'keyboard/mouse'),
(2, 'ps/xbox stick');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `os`
--

CREATE TABLE `os` (
  `id` int(11) NOT NULL,
  `name` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `os`
--

INSERT INTO `os` (`id`, `name`) VALUES
(1, 'Windows'),
(2, 'Mac OS');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `klientai`
--

CREATE TABLE `klientai` (
  `asmens_kodas` char(11) NOT NULL,
  `vardas` varchar(20) NOT NULL,
  `pavarde` varchar(20) NOT NULL,
  `gimimo_data` date NOT NULL,
  `telefonas` varchar(20) NOT NULL,
  `epastas` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `klientai`
--

INSERT INTO `klientai` (`asmens_kodas`, `vardas`, `pavarde`, `gimimo_data`, `telefonas`, `epastas`) VALUES
('2457943164', 'Asta', 'Gubaite', '1989-06-04', '8695959599', ''),
('4567867863', 'Kimas', 'Filmanas', '1979-11-09', '8695959599', ''),
('6786746747', 'Giedrius', 'Filmanas', '1999-08-05', '8695959599', ''),
('7867867668', 'Galas', 'Filmanas', '1980-01-05', '8695959599', ''),
('3127868766', 'Jala', 'Pulaite', '1980-05-05', '8695959599', ''),
('3815656449', 'Sidas', 'Fulakas', '1982-02-02', '8695959599', ''),
('5634534534', 'Ugnius', 'Minukas', '1981-01-01', '8695959599', ''),
('6785678527', 'Markas', 'Paulauskas', '1991-01-01', '8695959599', ''),
('5445455676', 'Finas', 'Edvanas', '2015-01-01', '8695959599', ''),
('8678967867', 'Sharpas', 'Kisimas', '1995-01-01', '8695959599', ''),
('6435345965', 'Salas', 'Lanas', '1995-02-05', '8695959599', ''),
('4564564534', 'Ferdinandas', 'De Vanas', '1998-01-01', '8695959599', ''),
('4534534534', 'Aušra', 'Kiseliene', '1965-04-04', '8695959599', ''),
('4423453453', 'Evelina', 'Pulautaite', '1970-06-06', '8695959599', ''),
('4534534534', 'Tresas', 'Masaitienė', '1972-07-07', '8695959599', ''),
('1237837832', 'Triss', 'Laucienė', '1976-05-06', '8695959599', ''),
('1231357757', 'Zed', 'Kasauskienė', '1978-02-02', '8695959599', ''),
('0112345342', 'Fylma', 'Narvydienė', '1980-02-02', '8695959599', ''),
('3123123753', 'Gaivila', 'Zinevičienė', '1985-02-02', '8695959599', ''),
('4345343123', 'Klimanta', 'Zinkutė', '1988-05-05', '8695959599', '');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `rekomenduojami_amziai`
--

CREATE TABLE `rekomenduojami_amziai` (
  `id` int(11) NOT NULL,
  `name` char(29) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `rekomenduojami_amziai`
--

INSERT INTO `rekomenduojami_amziai` (`id`, `name`) VALUES
(1, 'PEGI 18'),
(2, 'PEGI 8'),
(3, 'PEGI 13');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `kurejai`
--

CREATE TABLE `kurejai` (
  `pavadinimas` varchar(20) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `kurejai`
--

INSERT INTO `kurejai` (`pavadinimas`, `id`) VALUES
('Renegade games', 1),
('SkynNet games', 2),
('Opium project', 3),
('Syndicate', 4),
('Garfields Box', 5),
('Original content', 6),
('SkyFox entertainment', 7);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `miestai`
--

CREATE TABLE `miestai` (
  `id` int(11) NOT NULL,
  `pavadinimas` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `miestai`
--

INSERT INTO `miestai` (`id`, `pavadinimas`) VALUES
(1, 'Kaunas'),
(2, 'Vilnius'),
(3, 'Klaipeda'),
(4, 'Maskva'),
(5, 'Londonas'),
(6, 'Pakruojis'),
(7, 'Milanas');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `projektai`
--

CREATE TABLE `projektai` (
  `pavadinimas` varchar(20) NOT NULL,
  `id` int(11) NOT NULL,
  `fk_kurejas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `projektai`
--

INSERT INTO `projektai` (`pavadinimas`, `id`, `fk_kurejas`) VALUES
('New Internet', 1, 1),
('Space Invaders2', 2, 2),
('Far Cry 4', 3, 3),
('Cyrex', 4, 4),
('Tizzer', 5, 5),
('Getblind', 6, 6),
('TazerLazer', 7, 7),
('Symbiotes Rejoice', 8, 1),
('Nimble Jim', 9, 2),
('OSRS', 10, 3),
('Runescape', 11, 4),
('MinderScape', 12, 5),
('SpaceCraft', 13, 6),
('Civilization V', 14, 7),
('MakeBelieve', 15, 1),
('Jenson', 16, 2),
('Silicon Valley', 17, 3),
('Broomsticks', 18, 4),
('Lingo Bingo', 19, 5),
('Cake the Bake', 20, 6),
('Jim the Bin', 21, 7),
('Allister Mallister', 23, 1);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `paslaugos`
--

CREATE TABLE `paslaugos` (
  `id` int(11) NOT NULL,
  `pavadinimas` varchar(40) NOT NULL,
  `aprasymas` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `paslaugos`
--

INSERT INTO `paslaugos` (`id`, `pavadinimas`, `aprasymas`) VALUES
(1, 'Atsitiktinio Zaidimo loterija', ''),
(2, 'Zaidimo nuoma', ''),
(3, 'VR zaidimas 1 valanda', ''),
(4, 'VR irangos nuoma', ''),
(5, 'Kompiuterio nuoma', ''),
(6, 'Zaidimo pirkimas', '');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `paslaugu_kainos`
--

CREATE TABLE `paslaugu_kainos` (
  `fk_paslauga` int(11) NOT NULL,
  `galioja_nuo` date NOT NULL,
  `galioja_iki` date DEFAULT NULL,
  `kaina` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `paslaugu_kainos`
--

INSERT INTO `paslaugu_kainos` (`fk_paslauga`, `galioja_nuo`, `galioja_iki`, `kaina`) VALUES
(1, '2015-08-01', NULL, '5.00'),
(2, '2015-10-01', NULL, '10.00'),
(3, '2015-10-01', NULL, '10.00'),
(4, '2015-10-15', NULL, '10.00'),
(5, '2015-11-11', NULL, '10.00'),
(6, '2016-01-01', NULL, '5.00'),
(1, '2016-01-01', NULL, '10.00'),
(2, '2016-02-01', NULL, '5.00'),
(3, '2016-02-01', NULL, '10.00'),
(4, '2016-02-01', NULL, '5.00'),
(5, '2016-02-01', NULL, '10.00'),
(6, '2016-02-01', NULL, '5.00'),
(1, '2016-02-01', NULL, '5.00'),
(2, '2016-03-01', NULL, '10.00'),
(3, '2016-03-01', NULL, '10.00'),
(4, '2016-04-01', NULL, '10.00');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `zanrai`
--

CREATE TABLE `zanrai` (
  `id` int(11) NOT NULL,
  `name` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `zanrai`
--

INSERT INTO `zanrai` (`id`, `name`) VALUES
(1, 'Platformer'),
(2, 'Adventure'),
(3, 'FPS'),
(4, 'Survival');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `uzsakymo_busenos`
--

CREATE TABLE `uzsakymo_busenos` (
  `id` int(11) NOT NULL,
  `name` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `uzsakymo_busenos`
--

INSERT INTO `uzsakymo_busenos` (`id`, `name`) VALUES
(1, 'priimtas'),
(2, 'patvirtintas'),
(3, 'nutrauktas'),
(4, 'ivykdytas');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `uzsakymai`
--

CREATE TABLE `uzsakymai` (
  `nr` int(11) NOT NULL,
  `uzsakymo_data` date NOT NULL,
  `kaina` decimal(8,2) NOT NULL,
  `busena` int(11) NOT NULL,
  `fk_klientas` char(11) NOT NULL,
  `fk_darbuotojas` char(11) NOT NULL,
  `fk_zaidimas` int(11) NOT NULL,
  `fk_pirkimo_vieta` int(11) NOT NULL,
  `fk_apmokejimo_vieta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `uzsakymai`
--

INSERT INTO `uzsakymai` (`nr`, `uzsakymo_data`, `kaina`, `busena`, `fk_klientas`, `fk_darbuotojas`, `fk_zaidimas`, `fk_pirkimo_vieta`, `fk_apmokejimo_vieta`) VALUES
(1, '2017-07-07', '59.99', 1, '2457943164', '1', 1, 1, 1),
(2, '2017-07-07', '47.00', 2, '2457943164', '2', 2, 2, 2),
(3, '2017-07-07', '62.00', 3, '2457943164', '3', 3, 3, 3),
(4, '2017-07-07', '55.00', 4, '2457943164', '4', 4, 4, 4),
(5, '2017-07-07', '120.00', 1, '2457943164', '5', 5, 4, 4),
(6, '2017-07-08', '59.99', 2, '2457943164', '6', 6, 3, 3),
(7, '2017-07-08', '66.00', 3, '2457943164', '7', 7, 2, 2),
(8, '2017-07-08', '480.00', 4, '2457943164', '8', 8, 2, 2),
(9, '2017-07-08', '20.00', 1, '2457943164', '1', 9, 1, 1),
(10, '2017-07-08', '55.00', 2, '2457943164', '2', 10, 1, 1),
(11, '2017-07-09', '960.00', 3, '2457943164', '3', 11, 3, 3),
(12, '2017-07-09', '410.00', 4, '2457943164', '4', 12, 3, 3),
(13, '2017-07-09', '420.00', 1, '2457943164', '5', 1, 4, 4),
(14, '2017-07-09', '254.00', 2, '2457943164', '6', 2, 4, 4),
(15, '2017-07-09', '74.00', 3, '2457943164', '7', 3, 2, 2),
(16, '2017-07-09', '140.00', 4, '2457943164', '8', 4, 2, 2),
(17, '2017-07-09', '130.00', 1, '2457943164', '1', 5, 3, 3);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `uzsakytos_paslaugos`
--

CREATE TABLE `uzsakytos_paslaugos` (
  `fk_uzsakymas` int(11) NOT NULL,
  `fk_kaina_galioja_nuo` date NOT NULL,
  `fk_paslauga` int(11) NOT NULL,
  `kiekis` smallint(6) NOT NULL,
  `kaina` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Sukurta duomenų kopija lentelei `uzsakytos_paslaugos`
--

INSERT INTO `uzsakytos_paslaugos` (`fk_uzsakymas`, `fk_kaina_galioja_nuo`, `fk_paslauga`, `kiekis`, `kaina`) VALUES
(1, '2017-07-07', 1, 1, '45.00'),
(2, '2017-07-07', 2, 1, '25.00'),
(3, '2017-07-07', 1, 1, '45.00'),
(4, '2017-07-07', 4, 2, '32.00'),
(5, '2017-07-07', 1, 1, '15.00'),
(6, '2017-07-08', 1, 1, '15.00'),
(7, '2017-07-08', 2, 1, '24.00'),
(8, '2017-07-08', 5, 1, '27.00'),
(9, '2017-07-08', 1, 5, '15.00'),
(10, '2017-07-08', 4, 2, '32.00'),
(11, '2017-07-09', 1, 1, '45.00'),
(12, '2017-07-09', 7, 1, '25.00'),
(13, '2017-07-09', 2, 1, '25.00'),
(14, '2017-07-09', 5, 1, '27.00'),
(15, '2017-07-09', 1, 1, '15.00'),
(16, '2017-07-09', 2, 1, '24.00'),
(17, '2017-07-09', 3, 1, '45.00'),
(1, '2017-07-07', 4, 2, '32.00'),
(2, '2017-07-07', 5, 2, '27.00'),
(3, '2017-07-07', 7, 1, '25.00'),
(4, '2017-07-07', 4, 1, '32.00'),
(5, '2017-07-07', 3, 1, '45.00'),
(6, '2017-07-08', 5, 1, '27.00'),
(7, '2017-07-08', 1, 1, '18.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `parduotuves`
--
ALTER TABLE `parduotuves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkc_miestas` (`fk_miestas`);

--
-- Indexes for table `zaidimai`
--
ALTER TABLE `zaidimai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zanras` (`zanras`),
  ADD KEY `kontroleris` (`kontroleris`),
  ADD KEY `os` (`os`),
  ADD KEY `rekomenduojamas_amzius` (`rekomenduojamas_amzius`),
  ADD KEY `stadija` (`stadija`),
  ADD KEY `fkc_projektas` (`fk_projektas`);

--
-- Indexes for table `zaidimu_stadijos`
--
ALTER TABLE `zaidimu_stadijos`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `darbuotojai`
--
ALTER TABLE `darbuotojai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kontroleriai`
--
ALTER TABLE `kontroleriai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `os`
--
ALTER TABLE `os`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `klientai`
--
ALTER TABLE `klientai`
  ADD PRIMARY KEY (`asmens_kodas`);

--
-- Indexes for table `rekomenduojami_amziai`
--
ALTER TABLE `rekomenduojami_amziai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kurejai`
--
ALTER TABLE `kurejai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `miestai`
--
ALTER TABLE `miestai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projektai`
--
ALTER TABLE `projektai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkc_kurejas` (`fk_kurejas`);

--
-- Indexes for table `paslaugos`
--
ALTER TABLE `paslaugos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paslaugu_kainos`
--
ALTER TABLE `paslaugu_kainos`
  ADD PRIMARY KEY (`galioja_nuo`,`fk_paslauga`),
  ADD KEY `fkc_paslauga` (`fk_paslauga`);

--
-- Indexes for table `zanrai`
--
ALTER TABLE `zanrai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uzsakymo_busenos`
--
ALTER TABLE `uzsakymo_busenos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uzsakymai`
--
ALTER TABLE `uzsakymai`
  ADD PRIMARY KEY (`nr`),
  ADD KEY `busena` (`busena`),
  ADD KEY `fkc_klientas` (`fk_klientas`),
  ADD KEY `fkc_tvirtinantis_darbuotojas` (`fk_darbuotojas`),
  ADD KEY `fkc_zaidimas` (`fk_zaidimas`),
  ADD KEY `fkc_pirkimo_vieta` (`fk_pirkimo_vieta`),
  ADD KEY `fkc_apmokejimo_vieta` (`fk_apmokejimo_vieta`);

--
-- Indexes for table `uzsakytos_paslaugos`
--
ALTER TABLE `uzsakytos_paslaugos`
  ADD PRIMARY KEY (`fk_uzsakymas`,`fk_paslauga`,`fk_kaina_galioja_nuo`),
  ADD KEY `fkc_paslaugos_kaina` (`fk_kaina_galioja_nuo`,`fk_paslauga`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `parduotuves`
--
ALTER TABLE `parduotuves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `zaidimai`
--
ALTER TABLE `zaidimai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `zaidimu_stadijos`
--
ALTER TABLE `zaidimu_stadijos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `kurejai`
--
ALTER TABLE `kurejai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `projektai`
--
ALTER TABLE `projektai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `paslaugos`
--
ALTER TABLE `paslaugos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `uzsakymai`
--
ALTER TABLE `uzsakymai`
  MODIFY `nr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- Apribojimai eksportuotom lentelėm
--

--
-- Apribojimai lentelei `parduotuves`
--
ALTER TABLE `parduotuves`
  ADD CONSTRAINT `fkc_miestas` FOREIGN KEY (`fk_miestas`) REFERENCES `miestai` (`id`);

--
-- Apribojimai lentelei `zaidimai`
--
ALTER TABLE `zaidimai`
  ADD CONSTRAINT `fkc_projektas` FOREIGN KEY (`fk_projektas`) REFERENCES `projektai` (`id`),
  ADD CONSTRAINT `zanras` FOREIGN KEY (`zanras`) REFERENCES `zanrai` (`id`),
  ADD CONSTRAINT `kontroleris` FOREIGN KEY (`kontroleris`) REFERENCES `kontroleriai` (`id`),
  ADD CONSTRAINT `os` FOREIGN KEY (`os`) REFERENCES `os` (`id`),
  ADD CONSTRAINT `rekomenduojamas_amzius` FOREIGN KEY (`rekomenduojamas_amzius`) REFERENCES `rekomenduojami_amziai` (`id`),
  ADD CONSTRAINT `stadija` FOREIGN KEY (`stadija`) REFERENCES `zaidimu_stadijos` (`id`);

--
-- Apribojimai lentelei `projektai`
--
ALTER TABLE `projektai`
  ADD CONSTRAINT `fkc_kurejas` FOREIGN KEY (`fk_kurejas`) REFERENCES `kurejai` (`id`);

--
-- Apribojimai lentelei `paslaugu_kainos`
--
ALTER TABLE `paslaugu_kainos`
  ADD CONSTRAINT `fkc_paslauga` FOREIGN KEY (`fk_paslauga`) REFERENCES `paslaugos` (`id`);

--
-- Apribojimai lentelei `uzsakymai`
--
ALTER TABLE `uzsakymai`
  ADD CONSTRAINT `fkc_zaidimas` FOREIGN KEY (`fk_zaidimas`) REFERENCES `zaidimai` (`id`),
  ADD CONSTRAINT `fkc_pirkimo_vieta` FOREIGN KEY (`fk_pirkimo_vieta`) REFERENCES `parduotuves` (`id`),
  ADD CONSTRAINT `fkc_klientas` FOREIGN KEY (`fk_klientas`) REFERENCES `klientai` (`asmens_kodas`),
  ADD CONSTRAINT `fkc_apmokejimo_vieta` FOREIGN KEY (`fk_apmokejimo_vieta`) REFERENCES `parduotuves` (`id`),
  ADD CONSTRAINT `fkc_tvirtinantis_darbuotojas` FOREIGN KEY (`fk_darbuotojas`) REFERENCES `darbuotojai` (`id`),
  ADD CONSTRAINT `busena` FOREIGN KEY (`busena`) REFERENCES `uzsakymo_busenos` (`id`);

--
-- Apribojimai lentelei `uzsakytos_paslaugos`
--
ALTER TABLE `uzsakytos_paslaugos`
  ADD CONSTRAINT `fkc_paslaugos_kaina` FOREIGN KEY (`fk_kaina_galioja_nuo`,`fk_paslauga`) REFERENCES `paslaugu_kainos` (`galioja_nuo`, `fk_paslauga`),
  ADD CONSTRAINT `fkc_uzsakymas` FOREIGN KEY (`fk_uzsakymas`) REFERENCES `uzsakymai` (`nr`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;