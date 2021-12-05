-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 06, 2018 at 06:38 AM
-- Server version: 1.0.32
-- PHP Version: 5.6.33-1~dotdeb+zts+7.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tadlau`
--

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT`
--

CREATE TABLE IF NOT EXISTS `CLIENT` (
  `personal_id` int(11) NOT NULL,
  `name` varchar(22) NOT NULL,
  `surname` varchar(22) NOT NULL,
  `birth_date` date NOT NULL,
  `phone` varchar(22) NOT NULL,
  `email` varchar(22) NOT NULL,
  PRIMARY KEY (`personal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CLIENT`
--

INSERT INTO `CLIENT` (`personal_id`, `name`, `surname`, `birth_date`, `phone`, `email`) VALUES
(1, 'Edgaras', 'Kablys', '1998-05-07', '548974894985', 'heyho@gmail.com'),
(2, 'Johnas', 'Kablys', '1997-05-07', '54474894985', 'heyho2@gmail.com'),
(3, 'Mikas', 'Kablys', '1937-05-07', '54474894985', 'heyho3@gmail.com'),
(5, 'Kvilas', 'Kablys', '1987-05-07', '5447456985', 'heyho5@gmail.com'),
(6, 'Kvilas', 'Kablys', '1987-05-07', '5447456985', 'heyho5@gmail.com'),
(7, 'Spaikas', 'Kirbaitis', '1998-05-07', '54564894985', 'heyho7@gmail.com'),
(8, 'Kimas', 'Kirbaitis', '1995-05-07', '54474894985', 'heyho8@gmail.com'),
(9, 'Hojumas', 'Kirbaitis', '1963-05-07', '54474894985', 'heyho9@gmail.com'),
(10, 'Sibile', 'Sepetiene', '1971-05-07', '54474894985', 'heyho10@gmail.com'),
(11, 'Jurga', 'Sepetiene', '1991-05-07', '544564985', 'heyho11@gmail.com'),
(12, 'Jonas', 'Limogas', '1982-05-07', '544565685', 'heyho12@gmail.com'),
(13, 'Paulius', 'Limogas', '1958-05-07', '5789894985', 'heyho13@gmail.com'),
(14, 'Folis', 'Limogas', '1974-05-07', '5447123985', 'heyho14@gmail.com'),
(15, 'Justinas', 'Limogas', '1914-05-07', '5444594985', 'heyho15@gmail.com'),
(16, 'Johanas', 'Limogas', '1969-05-07', '5412394985', 'heyho16@gmail.com'),
(17, 'Janius', 'Sinonas', '1987-05-07', '54431294985', 'heyho17@gmail.com'),
(18, 'Jalapenas', 'Sinonas', '1938-05-07', '54389124985', 'heyho18@gmail.com'),
(19, 'Jifas', 'Sinonas', '1947-05-07', '5447453985', 'heyho19@gmail.com'),
(20, 'Jovydas', 'Sinonas', '1945-05-07', '54474198123', 'heyho20@gmail.com'),
(21, 'Johansburgas', 'Sinonas', '1939-05-07', '544123445894985', 'heyho21@gmail.com'),
(25, 'Kimas', 'Junasan', '1975-04-03', '5214964894', '78kiman@gmail.com'),
(26, 'Kalas', 'Jyhasn', '1945-05-06', '847874987', 'kimanlka@gmail.com'),
(27, 'kiunmas', 'iaskaka', '1948-07-30', '897987416', 'masndj@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `DEVELOPER`
--

CREATE TABLE IF NOT EXISTS `DEVELOPER` (
  `name` varchar(22) NOT NULL,
  `id_DEVELOPER` int(11) NOT NULL,
  `fk_PUBLISHERid_PUBLISHER` int(11) NOT NULL,
  PRIMARY KEY (`id_DEVELOPER`),
  KEY `fk_PUBLISHERid_PUBLISHER` (`fk_PUBLISHERid_PUBLISHER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `DEVELOPER`
--

INSERT INTO `DEVELOPER` (`name`, `id_DEVELOPER`, `fk_PUBLISHERid_PUBLISHER`) VALUES
('SneakyBox', 1, 1),
('Kojima', 2, 2),
('Jimeo', 3, 3),
('Simbiote', 4, 4),
('Gerflux', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `DLC`
--

CREATE TABLE IF NOT EXISTS `DLC` (
  `id` int(11) NOT NULL,
  `title` varchar(22) NOT NULL,
  `release_date` date NOT NULL,
  `cost` int(22) NOT NULL,
  `age_rating` varchar(22) NOT NULL,
  `critics_evaluation` varchar(22) NOT NULL,
  `fk_PURCHASEnumber` int(11) NOT NULL,
  `fk_GAMEid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_PURCHASEnumber` (`fk_PURCHASEnumber`),
  KEY `fk_GAMEid` (`fk_GAMEid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `DLC`
--

INSERT INTO `DLC` (`id`, `title`, `release_date`, `cost`, `age_rating`, `critics_evaluation`, `fk_PURCHASEnumber`, `fk_GAMEid`) VALUES
(1, 'Far Cry 5 reborn', '2017-05-17', 59, '17', '3/10', 1, 1),
(2, 'Jumanji reborn', '2016-05-17', 20, '18+', '6/7', 2, 2),
(3, 'Ori reb', '2017-04-18', 59, '17', '3/10', 3, 3),
(4, 'Gilfoilyt', '2017-05-14', 20, '18+', '6/7', 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `EMPLOYEE`
--

CREATE TABLE IF NOT EXISTS `EMPLOYEE` (
  `workerid` int(11) NOT NULL,
  `name` varchar(22) NOT NULL,
  `surname` varchar(22) NOT NULL,
  `fk_SHOPid_SHOP` int(11) NOT NULL,
  PRIMARY KEY (`workerid`),
  KEY `fk_SHOPid_SHOP` (`fk_SHOPid_SHOP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `EMPLOYEE`
--

INSERT INTO `EMPLOYEE` (`workerid`, `name`, `surname`, `fk_SHOPid_SHOP`) VALUES
(1, 'Edgaras', 'Gervilas', 1),
(2, 'Karlas', 'Jyhasn', 2),
(3, 'Germa', 'Kilaite', 2),
(4, 'Jumanji', 'Junak', 2),
(5, 'Simas', 'Gulas', 3),
(6, 'Juka', 'Saki', 4),
(7, 'Kim', 'Sigfriedas', 5),
(8, 'Maskva', 'Nymergas', 6),
(9, 'Hujanas', 'Klauss', 7),
(10, 'Bitu', 'Karasam', 8),
(11, 'Daijus', 'Dybilis', 9),
(12, 'Shymkent', 'Kent', 10),
(14, 'Kurmis', 'Grauzikas', 11),
(15, 'Vydas', 'Kasaitis', 12),
(16, 'Deal', 'Nope', 13),
(17, 'Vyd', 'Smoke', 14),
(18, 'Gud', 'Job', 15),
(21, 'Veryga', 'Nubaustasis', 16);

-- --------------------------------------------------------

--
-- Table structure for table `GAME`
--

CREATE TABLE IF NOT EXISTS `GAME` (
  `id` int(11) NOT NULL,
  `title` varchar(22) NOT NULL,
  `release_date` date NOT NULL,
  `platform` varchar(22) NOT NULL,
  `genre` varchar(22) NOT NULL,
  `input_device` varchar(22) NOT NULL,
  `display_type` varchar(22) NOT NULL,
  `cpu_requirement` varchar(22) NOT NULL,
  `gpu_requirement` varchar(22) NOT NULL,
  `ram_requirement` varchar(22) NOT NULL,
  `os_requirement` varchar(22) NOT NULL,
  `cost` int(11) NOT NULL,
  `mod_availability` varchar(22) NOT NULL,
  `dlc_availability` varchar(22) NOT NULL,
  `multiplayer_availability` varchar(22) NOT NULL,
  `current_state` varchar(22) NOT NULL,
  `current_version` varchar(22) NOT NULL,
  `age_rating` varchar(22) NOT NULL,
  `critic_evaluation` varchar(22) NOT NULL,
  `fk_PURCHASEnumber` int(11) NOT NULL,
  `fk_DEVELOPERid_DEVELOPER` int(11) NOT NULL,
  PRIMARY KEY (`id`,`title`),
  KEY `fk_PURCHASEnumber` (`fk_PURCHASEnumber`),
  KEY `fk_DEVELOPERid_DEVELOPER` (`fk_DEVELOPERid_DEVELOPER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `GAME`
--

INSERT INTO `GAME` (`id`, `title`, `release_date`, `platform`, `genre`, `input_device`, `display_type`, `cpu_requirement`, `gpu_requirement`, `ram_requirement`, `os_requirement`, `cost`, `mod_availability`, `dlc_availability`, `multiplayer_availability`, `current_state`, `current_version`, `age_rating`, `critic_evaluation`, `fk_PURCHASEnumber`, `fk_DEVELOPERid_DEVELOPER`) VALUES
(1, 'Far Cry 5', '2017-05-15', 'PC', 'Shooter', 'K/M', '3D', '3ghz+', 'r9 290x+', '8gb+', 'Wind 7+', 59, 'No', 'Yes', 'Yes', 'Released', '1.3', '17', '10/10', 1, 1),
(2, 'Far Cry 4', '2016-05-17', 'PC', 'Shooter', 'K/M', '3D', '2ghz+', 'r9 270x+', '4gb+', 'Wind Xp+', 20, 'Yes', 'Yes', 'Yes', 'Released', '1.9', '18+', '9/10', 2, 2),
(3, 'Ori', '2017-05-17', 'PC', 'Platformer', 'K/M', '2D', '1Ghz+', 'Gtx 750Ti+', '8gb+', 'Mac OSX', 15, 'No', 'No', 'No', 'Released', '1.3', '12+', '8.5/10', 3, 3),
(4, 'Jumanji', '2017-05-14', 'All', 'Adventure', 'K', '2D', '2Ghz+', 'rx 480+', '8gb+', 'Wind Xp+', 10, 'No', 'No', 'No', 'Released', '1.5', '18+', '7/10', 4, 4),
(5, 'FlatOut', '2017-05-17', 'PC', 'Shooter', 'K/M', '3D', '1Ghz+', 'Gtx 750Ti+', '8gb+', 'Mac OSX', 59, 'No', 'No', 'Yes', 'Released', '1.3', '17', '8.5/10', 5, 5),
(6, 'Greenberg', '2017-05-14', 'PC', 'Shooter', 'K/M', '3D', '2ghz+', 'r9 270x+', '8gb+', 'Wind Xp+', 20, 'Yes', 'Yes', 'Yes', 'Released', '1.9', '18+', '9/10', 6, 3),
(7, 'GrassRow', '2017-06-01', 'PC', 'Platformer', 'K/M', '3D', '1Ghz+', 'r9 290x+', '8gb+', 'Wind 7+', 59, 'No', 'No', 'Yes', 'Released', '1.3', '17', '8.5/10', 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `PAYMENT`
--

CREATE TABLE IF NOT EXISTS `PAYMENT` (
  `datee` date NOT NULL,
  `sum` int(22) NOT NULL,
  `id_PAYMENT` int(11) NOT NULL,
  `fk_CLIENTpersonal_id` int(11) NOT NULL,
  `fk_RECEIPTnumber` int(11) NOT NULL,
  PRIMARY KEY (`id_PAYMENT`),
  KEY `fk_CLIENTpersonal_id` (`fk_CLIENTpersonal_id`),
  KEY `fk_RECEIPTnumber` (`fk_RECEIPTnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PAYMENT`
--

INSERT INTO `PAYMENT` (`datee`, `sum`, `id_PAYMENT`, `fk_CLIENTpersonal_id`, `fk_RECEIPTnumber`) VALUES
('2017-05-20', 415, 1, 14, 1),
('2017-05-21', 623, 2, 15, 2),
('2017-05-21', 74, 3, 8, 3),
('2017-05-22', 14, 4, 3, 4),
('2017-05-23', 47, 5, 18, 5),
('2017-05-24', 432, 6, 19, 6),
('2017-05-25', 4789, 7, 10, 7);

-- --------------------------------------------------------

--
-- Table structure for table `PUBLISHER`
--

CREATE TABLE IF NOT EXISTS `PUBLISHER` (
  `name` varchar(22) NOT NULL,
  `id_PUBLISHER` int(11) NOT NULL,
  PRIMARY KEY (`id_PUBLISHER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PUBLISHER`
--

INSERT INTO `PUBLISHER` (`name`, `id_PUBLISHER`) VALUES
('Ubisoft', 1),
('Activision', 2),
('SteamPowered', 3),
('Blizzard', 4),
('Bethesda', 5);

-- --------------------------------------------------------

--
-- Table structure for table `PURCHASE`
--

CREATE TABLE IF NOT EXISTS `PURCHASE` (
  `number` int(22) NOT NULL AUTO_INCREMENT,
  `total_cost` int(22) NOT NULL,
  `date` date NOT NULL,
  `place` varchar(22) NOT NULL,
  `item_count` int(22) NOT NULL,
  `fk_SHOPid_SHOP` int(11) NOT NULL,
  `fk_CLIENTpersonal_id` int(11) NOT NULL,
  `fk_EMPLOYEEworker_id` int(11) NOT NULL,
  PRIMARY KEY (`number`),
  KEY `fk_SHOPid_SHOP` (`fk_SHOPid_SHOP`),
  KEY `fk_CLIENTpersonal_id` (`fk_CLIENTpersonal_id`),
  KEY `fk_EMPLOYEEworker_id` (`fk_EMPLOYEEworker_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `PURCHASE`
--

INSERT INTO `PURCHASE` (`number`, `total_cost`, `date`, `place`, `item_count`, `fk_SHOPid_SHOP`, `fk_CLIENTpersonal_id`, `fk_EMPLOYEEworker_id`) VALUES
(1, 147, '2017-05-22', 'Shop', 1, 1, 1, 1),
(2, 254, '2017-05-21', 'Shop', 2, 2, 2, 2),
(3, 84948, '2017-05-19', 'Shop', 41, 3, 3, 3),
(4, 1789, '2017-05-18', 'Shop', 15, 4, 5, 4),
(5, 96, '2017-05-17', 'Shop', 851, 5, 6, 5),
(6, 489, '2017-05-16', 'Shop', 556, 6, 7, 6),
(7, 6565, '2017-05-15', 'Shop', 147, 7, 8, 7);

-- --------------------------------------------------------

--
-- Table structure for table `RECEIPT`
--

CREATE TABLE IF NOT EXISTS `RECEIPT` (
  `number` int(22) NOT NULL,
  `date` date NOT NULL,
  `cost` int(22) NOT NULL,
  `fk_PURCHASEnumber` int(11) NOT NULL,
  PRIMARY KEY (`number`),
  KEY `fk_PURCHASEnumber` (`fk_PURCHASEnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `RECEIPT`
--

INSERT INTO `RECEIPT` (`number`, `date`, `cost`, `fk_PURCHASEnumber`) VALUES
(1, '2017-05-19', 45, 1),
(2, '2017-05-18', 452, 2),
(3, '2017-05-17', 4524, 3),
(4, '2017-05-16', 42, 4),
(5, '2017-05-15', 4241, 5),
(6, '2017-05-19', 59, 6),
(7, '2017-05-18', 10, 7);

-- --------------------------------------------------------

--
-- Table structure for table `SHOP`
--

CREATE TABLE IF NOT EXISTS `SHOP` (
  `name` varchar(22) NOT NULL,
  `adress` varchar(22) NOT NULL,
  `phone` varchar(22) NOT NULL,
  `email` varchar(22) NOT NULL,
  `id_SHOP` int(11) NOT NULL,
  `fk_TOWNid_TOWN` int(11) NOT NULL,
  PRIMARY KEY (`id_SHOP`),
  KEY `fk_TOWNid_TOWN` (`fk_TOWNid_TOWN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SHOP`
--

INSERT INTO `SHOP` (`name`, `adress`, `phone`, `email`, `id_SHOP`, `fk_TOWNid_TOWN`) VALUES
('Gamestop', 'Upes g. 15', '8998789789', 'Gameshop1@gmail.com', 1, 1),
('Gamestop reverse', 'Havaju g. 13', '8978978989', 'Gameshop2@gmail.com', 2, 1),
('Jupiteris ', 'planetu g. 17', '8748978989', 'Gameshop3@gmail.com', 3, 2),
('Namakas', 'tripolio g. 92', '874987897897', 'Gameshop4@gmail.com', 4, 2),
('Kilmeris', 'hienu g. 72', '7889748989', 'Gameshop5@gmail.com', 5, 3),
('Gilbertas', 'defunu g. 15', '52165489498498', 'Gameshop6@gmail.com', 6, 3),
('Hyperboll', 'pauksteliu g. 63', '48984899459', 'Gameshop7@gmail.com', 7, 4),
('Ferbus', 'Cyprasu g. 73', '45189489489', 'Gameshop8@gmail.com', 8, 4),
('Klauss', 'Kaledu g. 36', '49848989489', 'Gameshop10@gmail.com', 9, 5),
('Rabbvit', 'Velyku g. 71', '4564564564564', 'Gameshop9@gmail.com', 10, 5),
('Maximute', 'Vingiu g. 782', '788945512616', 'Gameshop11@gmail.com', 11, 6),
('Gulbele', 'Gulbiu g. 432', '7984894894789489', 'Gameshop12@gmail.com', 12, 6),
('Hjnau', 'Hjnau g. 12', '451894894987', 'Gameshop13@gmail.com', 13, 7),
('Proskynas', 'Gervu g. 18', '8948918589489', 'Gameshop14@gmail.com', 14, 7),
('Henlo', 'hen g. 92', '459489489894', 'Gameshop15@gmail.co', 15, 8),
('Hau', 'ashduf g. 19', '489489498', 'Gameshop16@gmail.com', 16, 8);

-- --------------------------------------------------------

--
-- Table structure for table `TAXES`
--

CREATE TABLE IF NOT EXISTS `TAXES` (
  `cost` int(22) NOT NULL,
  `quantity` int(22) NOT NULL,
  `id_TAXES` int(11) NOT NULL,
  `fk_RECEIPTnumber` int(11) NOT NULL,
  PRIMARY KEY (`id_TAXES`),
  KEY `fk_RECEIPTnumber` (`fk_RECEIPTnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TAXES`
--

INSERT INTO `TAXES` (`cost`, `quantity`, `id_TAXES`, `fk_RECEIPTnumber`) VALUES
(14, 3, 1, 1),
(45234, 45345, 2, 2),
(7452, 45, 3, 3),
(7854, 45, 4, 4),
(786, 45, 5, 5),
(789, 63, 6, 6),
(45234, 452, 7, 7);

-- --------------------------------------------------------

--
-- Table structure for table `TOWN`
--

CREATE TABLE IF NOT EXISTS `TOWN` (
  `name` varchar(22) NOT NULL,
  `id_TOWN` int(11) NOT NULL,
  PRIMARY KEY (`id_TOWN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TOWN`
--

INSERT INTO `TOWN` (`name`, `id_TOWN`) VALUES
('Kaunas', 1),
('Vilnius', 2),
('Maskva', 3),
('Londonas', 4),
('Kijevas', 5),
('Gdanskas', 6),
('Berlynas', 7),
('Warsuva', 8);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `DEVELOPER`
--
ALTER TABLE `DEVELOPER`
  ADD CONSTRAINT `DEVELOPER_ibfk_1` FOREIGN KEY (`fk_PUBLISHERid_PUBLISHER`) REFERENCES `PUBLISHER` (`id_PUBLISHER`);

--
-- Constraints for table `DLC`
--
ALTER TABLE `DLC`
  ADD CONSTRAINT `DLC_ibfk_1` FOREIGN KEY (`fk_PURCHASEnumber`) REFERENCES `PURCHASE` (`number`),
  ADD CONSTRAINT `DLC_ibfk_2` FOREIGN KEY (`fk_GAMEid`) REFERENCES `GAME` (`id`);

--
-- Constraints for table `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  ADD CONSTRAINT `EMPLOYEE_ibfk_1` FOREIGN KEY (`fk_SHOPid_SHOP`) REFERENCES `SHOP` (`id_SHOP`);

--
-- Constraints for table `GAME`
--
ALTER TABLE `GAME`
  ADD CONSTRAINT `GAME_ibfk_1` FOREIGN KEY (`fk_PURCHASEnumber`) REFERENCES `PURCHASE` (`number`),
  ADD CONSTRAINT `GAME_ibfk_2` FOREIGN KEY (`fk_DEVELOPERid_DEVELOPER`) REFERENCES `DEVELOPER` (`id_DEVELOPER`);

--
-- Constraints for table `PAYMENT`
--
ALTER TABLE `PAYMENT`
  ADD CONSTRAINT `PAYMENT_ibfk_1` FOREIGN KEY (`fk_CLIENTpersonal_id`) REFERENCES `CLIENT` (`personal_id`),
  ADD CONSTRAINT `PAYMENT_ibfk_2` FOREIGN KEY (`fk_RECEIPTnumber`) REFERENCES `RECEIPT` (`number`);

--
-- Constraints for table `PURCHASE`
--
ALTER TABLE `PURCHASE`
  ADD CONSTRAINT `PURCHASE_ibfk_1` FOREIGN KEY (`fk_SHOPid_SHOP`) REFERENCES `SHOP` (`id_SHOP`),
  ADD CONSTRAINT `PURCHASE_ibfk_2` FOREIGN KEY (`fk_CLIENTpersonal_id`) REFERENCES `CLIENT` (`personal_id`),
  ADD CONSTRAINT `PURCHASE_ibfk_3` FOREIGN KEY (`fk_EMPLOYEEworker_id`) REFERENCES `EMPLOYEE` (`workerid`);

--
-- Constraints for table `RECEIPT`
--
ALTER TABLE `RECEIPT`
  ADD CONSTRAINT `RECEIPT_ibfk_1` FOREIGN KEY (`fk_PURCHASEnumber`) REFERENCES `PURCHASE` (`number`);

--
-- Constraints for table `SHOP`
--
ALTER TABLE `SHOP`
  ADD CONSTRAINT `SHOP_ibfk_1` FOREIGN KEY (`fk_TOWNid_TOWN`) REFERENCES `TOWN` (`id_TOWN`);

--
-- Constraints for table `TAXES`
--
ALTER TABLE `TAXES`
  ADD CONSTRAINT `TAXES_ibfk_1` FOREIGN KEY (`fk_RECEIPTnumber`) REFERENCES `RECEIPT` (`number`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
