-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2018 at 12:10 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `it`
--

-- --------------------------------------------------------

--
-- Table structure for table `krepselio_preke`
--

CREATE TABLE `krepselio_preke` (
  `prekes_id` int(5) NOT NULL,
  `vartotojo_id` int(5) NOT NULL,
  `kiekis` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `preke`
--

CREATE TABLE `preke` (
  `id` int(5) NOT NULL,
  `pavadinimas` varchar(22) NOT NULL,
  `fasuote` varchar(22) NOT NULL,
  `kaina` int(20) NOT NULL,
  `svoris` int(20) NOT NULL,
  `nuotrauka` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `preke`
--

INSERT INTO `preke` (`id`, `pavadinimas`, `fasuote`, `kaina`, `svoris`, `nuotrauka`) VALUES
(1, 'Agurkas', 'Plastikinis maiselis', 2, 440, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Komkommer_Cucumis_sativus_%27Melita%27.jpg/220px-Komkommer_Cucumis_sativus_%27Melita%27.jpg'),
(2, 'Bulve', 'Maiselis', 10, 100, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Patates.jpg/220px-Patates.jpg'),
(4, 'Pica', 'Dezute', 15, 990, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Eq_it-na_pizza-margherita_sep2005_sml.jpg/220px-Eq_it-na_pizza-margherita_sep2005_sml.jpg'),
(5, 'Aliejus', 'Butelys', 5, 1500, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Oliven_V1.jpg/250px-Oliven_V1.jpg'),
(7, 'Makaronai', 'Maiselis', 3, 500, 'https://www.lamaistas.lt/uploads/modules/recipes/without-watermark/14524.jpg'),
(9, 'Mandoris', 'Maisiukas', 10, 1000, 'https://cdn.shopify.com/s/files/1/1784/0681/products/Mandarin_large.jpg?v=1489560502'),
(11, 'Citrinos', 'Maisas', 4, 660, 'https://img.freepik.com/free-photo/lemon_1205-1668.jpg?size=338&ext=jpg');

-- --------------------------------------------------------

--
-- Table structure for table `transportas`
--

CREATE TABLE `transportas` (
  `id` int(5) NOT NULL,
  `pavadinimas` varchar(22) NOT NULL,
  `talpa` int(5) NOT NULL,
  `vairuotojo_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transportas`
--

INSERT INTO `transportas` (`id`, `pavadinimas`, `talpa`, `vairuotojo_id`) VALUES
(1, 'Ford Transit', 800, 7),
(3, 'Opel Zafira', 1200, 9);

-- --------------------------------------------------------

--
-- Table structure for table `transportuojama_preke`
--

CREATE TABLE `transportuojama_preke` (
  `prekes_id` int(5) NOT NULL,
  `kiekis` int(5) NOT NULL,
  `uzsakymo_id` int(5) NOT NULL,
  `transporto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uzsakymas`
--

CREATE TABLE `uzsakymas` (
  `id` int(5) NOT NULL,
  `vartotojo_id` int(5) NOT NULL,
  `data` date NOT NULL,
  `miestas` varchar(22) NOT NULL,
  `adresas` varchar(22) NOT NULL,
  `busena` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uzsakymas`
--

INSERT INTO `uzsakymas` (`id`, `vartotojo_id`, `data`, `miestas`, `adresas`, `busena`) VALUES
(1, 1, '2018-12-19', 'Kaunas', 'Rasos G., 15', 'Laukiama'),
(2, 8, '2018-12-19', 'Kaunas', 'Rasos G., 15asdasda', 'Laukiama'),
(3, 1, '2018-12-19', 'Kaunas', 'Rasos G., 15', 'Laukiama');

-- --------------------------------------------------------

--
-- Table structure for table `uzsakyta_preke`
--

CREATE TABLE `uzsakyta_preke` (
  `uzsakymo_id` int(5) NOT NULL,
  `vartotojo_id` int(5) NOT NULL,
  `prekes_id` int(5) NOT NULL,
  `kiekis` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uzsakyta_preke`
--

INSERT INTO `uzsakyta_preke` (`uzsakymo_id`, `vartotojo_id`, `prekes_id`, `kiekis`) VALUES
(1, 1, 1, 2),
(1, 1, 4, 1),
(1, 1, 5, 1),
(1, 1, 9, 1),
(2, 8, 4, 3),
(2, 8, 5, 1),
(2, 8, 7, 1),
(2, 8, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vartotojas`
--

CREATE TABLE `vartotojas` (
  `id` int(5) NOT NULL,
  `vardas` varchar(22) NOT NULL,
  `pavarde` varchar(22) NOT NULL,
  `prisijungimo_vardas` varchar(22) NOT NULL,
  `slaptazodis` varchar(22) NOT NULL,
  `vartotojo_lygis` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vartotojas`
--

INSERT INTO `vartotojas` (`id`, `vardas`, `pavarde`, `prisijungimo_vardas`, `slaptazodis`, `vartotojo_lygis`) VALUES
(1, 'Tadas', 'Laurinaitis', 't', 't', 'vartotojas'),
(4, 'admin', 'admin', 'admin13', 'admin13', 'administratorius'),
(6, 'Jonas', 'Kaminas', 'j', 'j', 'vartotojas'),
(7, 'Antanas', 'Zaibas', 'isve', 'isve', 'isveziotojas'),
(8, 'simas', 'simaitis', 's', 's', 'vartotojas'),
(9, 'Martynas', 'Popovicius', 'isve2', 'isve2', 'isveziotojas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `krepselio_preke`
--
ALTER TABLE `krepselio_preke`
  ADD PRIMARY KEY (`prekes_id`,`vartotojo_id`);

--
-- Indexes for table `preke`
--
ALTER TABLE `preke`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transportas`
--
ALTER TABLE `transportas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transportuojama_preke`
--
ALTER TABLE `transportuojama_preke`
  ADD PRIMARY KEY (`prekes_id`,`uzsakymo_id`,`transporto_id`);

--
-- Indexes for table `uzsakymas`
--
ALTER TABLE `uzsakymas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uzsakyta_preke`
--
ALTER TABLE `uzsakyta_preke`
  ADD PRIMARY KEY (`uzsakymo_id`,`vartotojo_id`,`prekes_id`);

--
-- Indexes for table `vartotojas`
--
ALTER TABLE `vartotojas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `preke`
--
ALTER TABLE `preke`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `transportas`
--
ALTER TABLE `transportas`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `uzsakymas`
--
ALTER TABLE `uzsakymas`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vartotojas`
--
ALTER TABLE `vartotojas`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
