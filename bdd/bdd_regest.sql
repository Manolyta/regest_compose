-- phpMyAdmin SQL Dump
-- version 5.1.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql-galle-tessonneau.alwaysdata.net
-- Generation Time: Mar 02, 2023 at 01:24 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `galle-tessonneau_regest`
--

-- --------------------------------------------------------

--
-- Table structure for table `cr_reunion`
--

CREATE TABLE `cr_reunion` (
  `id_cr_reunion` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `date_reunion` date DEFAULT NULL,
  `sujet` varchar(25) DEFAULT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `id_projet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `equipe`
--

CREATE TABLE `equipe` (
  `id_equipe` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `id_projet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fichier`
--

CREATE TABLE `fichier` (
  `id_fichier` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `date_ajout` date DEFAULT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `id_repertoire` int(11) DEFAULT NULL,
  `id_projet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gantt_links`
--

CREATE TABLE `gantt_links` (
  `id` int(11) NOT NULL,
  `source` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `type` varchar(1) NOT NULL,
  `id_projet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gantt_tasks`
--

CREATE TABLE `gantt_tasks` (
  `id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `duration` int(11) NOT NULL,
  `progress` float NOT NULL,
  `parent` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `id_projet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `liste_to_do_list`
--

CREATE TABLE `liste_to_do_list` (
  `id_liste_to_do_list` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `id_projet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id_news` int(11) NOT NULL,
  `titre` varchar(50) DEFAULT NULL,
  `contenu` varchar(8000) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `id_projet` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projet`
--

CREATE TABLE `projet` (
  `id_projet` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `id_chef_de_projet` int(11) NOT NULL,
  `id_site` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `repertoire`
--

CREATE TABLE `repertoire` (
  `id_repertoire` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `date_ajout` date NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `id_projet` int(11) NOT NULL,
  `id_repertoire_pere` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id_role`, `role`) VALUES
(1, 'Administrateur');

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE `site` (
  `id_site` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `adresse` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tache_to_do_list`
--

CREATE TABLE `tache_to_do_list` (
  `id_tache_to_do_list` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `contenu` text NOT NULL,
  `date_creation` date DEFAULT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date DEFAULT NULL,
  `echeance` date DEFAULT NULL,
  `etat` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `id_liste_to_do_list` int(11) NOT NULL,
  `id_equipe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_rejoint_equipe`
--

CREATE TABLE `user_rejoint_equipe` (
  `date_entree` date DEFAULT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `id_equipe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `password` varchar(256) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `poste` varchar(50) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `nom_image` varchar(50) DEFAULT NULL,
  `lien_calendar` varchar(256) DEFAULT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cr_reunion`
--
ALTER TABLE `cr_reunion`
  ADD PRIMARY KEY (`id_cr_reunion`),
  ADD UNIQUE KEY `nom` (`nom`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_projet` (`id_projet`);

--
-- Indexes for table `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`id_equipe`),
  ADD KEY `id_projet` (`id_projet`);

--
-- Indexes for table `fichier`
--
ALTER TABLE `fichier`
  ADD PRIMARY KEY (`id_fichier`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_repertoire` (`id_repertoire`),
  ADD KEY `id_projet` (`id_projet`);

--
-- Indexes for table `gantt_links`
--
ALTER TABLE `gantt_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gantt_links_projet` (`id_projet`),
  ADD KEY `gantt_links_source` (`source`),
  ADD KEY `gantt_links_target` (`target`);

--
-- Indexes for table `gantt_tasks`
--
ALTER TABLE `gantt_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gantt_tasks_projet` (`id_projet`);

--
-- Indexes for table `liste_to_do_list`
--
ALTER TABLE `liste_to_do_list`
  ADD PRIMARY KEY (`id_liste_to_do_list`),
  ADD KEY `id_projet` (`id_projet`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id_news`),
  ADD KEY `id_projet` (`id_projet`),
  ADD KEY `news_ibfk_2` (`id_utilisateur`);

--
-- Indexes for table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`id_projet`),
  ADD KEY `id_chefDeProjet` (`id_chef_de_projet`),
  ADD KEY `id_site` (`id_site`);

--
-- Indexes for table `repertoire`
--
ALTER TABLE `repertoire`
  ADD PRIMARY KEY (`id_repertoire`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_projet` (`id_projet`),
  ADD KEY `id_repertoire_pere` (`id_repertoire_pere`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id_site`);

--
-- Indexes for table `tache_to_do_list`
--
ALTER TABLE `tache_to_do_list`
  ADD PRIMARY KEY (`id_tache_to_do_list`),
  ADD KEY `id_dossierTodoList` (`id_liste_to_do_list`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_equipe` (`id_equipe`);

--
-- Indexes for table `user_rejoint_equipe`
--
ALTER TABLE `user_rejoint_equipe`
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_equipe` (`id_equipe`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD KEY `id_role` (`id_role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cr_reunion`
--
ALTER TABLE `cr_reunion`
  MODIFY `id_cr_reunion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `equipe`
--
ALTER TABLE `equipe`
  MODIFY `id_equipe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `fichier`
--
ALTER TABLE `fichier`
  MODIFY `id_fichier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gantt_links`
--
ALTER TABLE `gantt_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gantt_tasks`
--
ALTER TABLE `gantt_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `liste_to_do_list`
--
ALTER TABLE `liste_to_do_list`
  MODIFY `id_liste_to_do_list` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id_news` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `projet`
--
ALTER TABLE `projet`
  MODIFY `id_projet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `repertoire`
--
ALTER TABLE `repertoire`
  MODIFY `id_repertoire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `site`
--
ALTER TABLE `site`
  MODIFY `id_site` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `tache_to_do_list`
--
ALTER TABLE `tache_to_do_list`
  MODIFY `id_tache_to_do_list` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cr_reunion`
--
ALTER TABLE `cr_reunion`
  ADD CONSTRAINT `cr_reunion_projet` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id_projet`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_reunion_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Constraints for table `equipe`
--
ALTER TABLE `equipe`
  ADD CONSTRAINT `equipe_projet` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id_projet`) ON DELETE CASCADE;

--
-- Constraints for table `fichier`
--
ALTER TABLE `fichier`
  ADD CONSTRAINT `fichier_projet` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id_projet`) ON DELETE CASCADE,
  ADD CONSTRAINT `fichier_repertoire` FOREIGN KEY (`id_repertoire`) REFERENCES `repertoire` (`id_repertoire`) ON DELETE CASCADE,
  ADD CONSTRAINT `fichier_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Constraints for table `gantt_links`
--
ALTER TABLE `gantt_links`
  ADD CONSTRAINT `gantt_links_projet` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id_projet`) ON DELETE CASCADE,
  ADD CONSTRAINT `gantt_links_source` FOREIGN KEY (`source`) REFERENCES `gantt_tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gantt_links_target` FOREIGN KEY (`target`) REFERENCES `gantt_tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gantt_tasks`
--
ALTER TABLE `gantt_tasks`
  ADD CONSTRAINT `gantt_tasks_projet` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id_projet`) ON DELETE CASCADE;

--
-- Constraints for table `liste_to_do_list`
--
ALTER TABLE `liste_to_do_list`
  ADD CONSTRAINT `liste_to_do_list_projet` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id_projet`) ON DELETE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_projet` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id_projet`) ON DELETE CASCADE,
  ADD CONSTRAINT `news_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Constraints for table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `projet_chef` FOREIGN KEY (`id_chef_de_projet`) REFERENCES `utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `projet_site` FOREIGN KEY (`id_site`) REFERENCES `site` (`id_site`);

--
-- Constraints for table `repertoire`
--
ALTER TABLE `repertoire`
  ADD CONSTRAINT `repertoire_parent` FOREIGN KEY (`id_repertoire_pere`) REFERENCES `repertoire` (`id_repertoire`) ON DELETE CASCADE,
  ADD CONSTRAINT `repertoire_projet` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id_projet`) ON DELETE CASCADE,
  ADD CONSTRAINT `repertoire_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Constraints for table `tache_to_do_list`
--
ALTER TABLE `tache_to_do_list`
  ADD CONSTRAINT `tache_to_do_list_liste` FOREIGN KEY (`id_liste_to_do_list`) REFERENCES `liste_to_do_list` (`id_liste_to_do_list`) ON DELETE CASCADE;

--
-- Constraints for table `user_rejoint_equipe`
--
ALTER TABLE `user_rejoint_equipe`
  ADD CONSTRAINT `user_rejoint_equipe_equipe` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`id_equipe`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_rejoint_equipe_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE CASCADE;

--
-- Constraints for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
