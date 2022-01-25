-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2021 at 03:21 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demomvc`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categorie`
--

CREATE TABLE `tbl_categorie` (
  `id_categorie` int(11) NOT NULL,
  `categorie` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_categorie`
--

INSERT INTO `tbl_categorie` (`id_categorie`, `categorie`, `description`) VALUES
(1, 'Papeterie', 'Article de bureau en lien avec la papetrie'),
(2, 'Électronique', 'Article de bureau électronique');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_produit`
--

CREATE TABLE `tbl_produit` (
  `id_produit` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `produit` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_produit`
--

INSERT INTO `tbl_produit` (`id_produit`, `id_categorie`, `produit`, `description`) VALUES
(3, 1, 'Crayon de mine', 'Paquet de 10 crayons de marque HB'),
(4, 1, 'Style bleu', 'Paquet de 10 stylos de marque BIC'),
(5, 2, 'Calculatrice', 'Calculatrice de comptabilité'),
(6, 2, 'Aiguisoir électrique', 'Aiguisoir électrique de marque GE');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_utilisateur`
--

CREATE TABLE `tbl_utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `courriel` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `est_actif` tinyint(4) NOT NULL,
  `role_utilisateur` tinyint(4) NOT NULL,
  `type_utilisateur` tinyint(4) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_utilisateur`
--

INSERT INTO `tbl_utilisateur` (`id_utilisateur`, `nom`, `prenom`, `courriel`, `mdp`, `est_actif`, `role_utilisateur`, `type_utilisateur`, `token`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', '$2y$10$wrHuXB.wR0EScOHyqNhJnOzW/6HcE.C0c0eaUF4XjhJGSwYfDQMrS', 1, 1, 0, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_categorie`
--
ALTER TABLE `tbl_categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Indexes for table `tbl_produit`
--
ALTER TABLE `tbl_produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `fk_categorie` (`id_categorie`);

--
-- Indexes for table `tbl_utilisateur`
--
ALTER TABLE `tbl_utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_categorie`
--
ALTER TABLE `tbl_categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_produit`
--
ALTER TABLE `tbl_produit`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_utilisateur`
--
ALTER TABLE `tbl_utilisateur`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_produit`
--
ALTER TABLE `tbl_produit`
  ADD CONSTRAINT `fk_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `tbl_categorie` (`id_categorie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
