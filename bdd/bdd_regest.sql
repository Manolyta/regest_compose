-- phpMyAdmin SQL Dump
-- version 5.1.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql-galle-tessonneau.alwaysdata.net
-- Generation Time: Feb 27, 2023 at 05:44 PM
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
-- Table structure for table `autorisation`
--

CREATE TABLE `autorisation` (
  `id_autorisation` int(11) NOT NULL,
  `lecture` tinyint(1) DEFAULT NULL,
  `ecriture` tinyint(1) DEFAULT NULL,
  `suppression` tinyint(1) DEFAULT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `id_equipe` int(11) NOT NULL,
  `id_repertoire` int(11) NOT NULL,
  `id_fichier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

--
-- Dumping data for table `equipe`
--

INSERT INTO `equipe` (`id_equipe`, `nom`, `id_projet`) VALUES
(1, 'Développement Regest', 1);

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

--
-- Dumping data for table `gantt_tasks`
--

INSERT INTO `gantt_tasks` (`id`, `text`, `start_date`, `duration`, `progress`, `parent`, `sort_order`, `id_projet`) VALUES
(1, 'Test 1', '2023-02-12 00:00:00', 3, 0, 0, 4, 1),
(2, 'Test 2', '2023-02-12 00:00:00', 3, 0, 0, 3, 1),
(3, 'tst 3', '2023-02-12 00:00:00', 3, 0, 0, 9, 1),
(4, 'test 4', '2023-02-12 00:00:00', 3, 0, 0, 12, 1),
(5, 'test 5', '2023-02-12 00:00:00', 3, 0, 0, 13, 1),
(6, 'sous tache 1', '2023-02-12 00:00:00', 2, 0, 1, 14, 1),
(7, 'sous tache 2', '2023-02-12 00:00:00', 2, 0, 1, 15, 1),
(8, 'sous tache 3', '2023-02-12 00:00:00', 2, 0, 9, 2, 1),
(9, 'sous tache 4', '2023-02-12 00:00:00', 1, 0, 2, 17, 1),
(10, 'sous tache 5', '2023-02-12 00:00:00', 1, 0, 3, 19, 1),
(11, 'sous tache 6', '2023-02-12 00:00:00', 1, 0, 3, 20, 1),
(13, 'test 6', '2023-02-12 00:00:00', 1, 0, 0, 21, 1);

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

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id_news`, `titre`, `contenu`, `date`, `id_projet`, `id_utilisateur`) VALUES
(6, 'Lancement du projet regest !', 'C\'ets parti !', '2022-12-05', 1, 1),
(7, 'Début du dev ! ', 'ça va chauffer !', '2022-12-05', 1, 1),
(8, 'Fin des interfaces ! Ou presque !', 'Y\'en a qui vont burn out ', '2022-12-05', 1, 1),
(9, 'Fin de l\'ajout des news ! Yay !', 'Nous avons enfin fini de développé l\'ajout des news !', '2022-12-05', 1, 1),
(10, 'C\'est cassé ? ', 'Et voilà un bonne chose de faite aussi !', '2022-12-05', 1, 1),
(12, 'Présentation suivi projet', 'Coucou les amis je suis sauvage', '2022-12-09', 1, 1),
(22, 'Consigne oral de fin de période', 'Deux présentations orales :\r\n\r\n	Présentation académique :\r\n\r\n		Comment on a mener le projet ? \r\n		Les choix techniques ?\r\n\r\n	Présentation / Démonstration à un investisseur :\r\n\r\n		Démonstration : validation du point de vue\r\n		Element de création d\'entreprise ?\r\n		Remise de la documentation / manuel utilisateur ? \r\n	\r\nPossible redondance entre les 2 oraux.\r\n', '2023-02-07', 1, 1);

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

--
-- Dumping data for table `projet`
--

INSERT INTO `projet` (`id_projet`, `nom`, `date_debut`, `date_fin`, `status`, `id_chef_de_projet`, `id_site`) VALUES
(1, 'Regest', '2022-12-09', '2023-04-26', 0, 1, 1);

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
(1, 'Mon role');

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE `site` (
  `id_site` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `adresse` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `site`
--

INSERT INTO `site` (`id_site`, `nom`, `adresse`) VALUES
(1, 'Groupama Supports & Services - Castelnau-le-Lez', '1000 Avenue Marcel Dassault\r\n34170 Castelnau-le-Lez');

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

--
-- Dumping data for table `user_rejoint_equipe`
--

INSERT INTO `user_rejoint_equipe` (`date_entree`, `id_utilisateur`, `id_equipe`) VALUES
('2023-01-05', 1, 1),
('2023-02-07', 5, 1),
('2023-02-17', 3, 1),
('2023-02-17', 2, 1);

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
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `password`, `nom`, `prenom`, `telephone`, `email`, `poste`, `service`, `nom_image`, `lien_calendar`, `id_role`) VALUES
(1, '8d81994270a41fbf34beb634235075060fb873cf229aa68afd2d50e6dc7afe49', 'ANGELI', 'Manon', '0658259635', 'user', 'Développeur', 'Développement', 'image.png', 'https://calendar.google.com/calendar/u/0/embed?src=p2rn64sthgafnnpe0ug4p8fkds@group.calendar.google.com&ctz=Europe/Paris', 1),
(2, '$2y$10$kVwHyN04Eoeqew0vsdJ2iOkDKEW2H/bSdwV9TU/ouZ3usEJ1E7ngi', 'limata', 'nicolas', '0782545752', 'nicolas.limata@mines-ales.org', 'comique', 'clown', NULL, NULL, 1),
(3, 'ca41dd8b7e0a3e7d9aa7f8e689c48936d95d848d97febd6362c9cb60da275512', 'Angeli', 'Manon', '0618084480', 'manon', NULL, NULL, NULL, NULL, 1),
(4, '09de0ab0f8dff491c36c0f09e5f33e6f52fe805bd2383fbf2db88f5e7df43a27', 'Locatelli', 'Julia', NULL, 'julia.locatelli@mines-ales.org', NULL, NULL, NULL, NULL, 1),
(5, '2db9372c8e496073f53521b87a2118effeb074662bf4c78f5562d14de1b4f3d0', 'Regeste', 'Corky', NULL, 'corky', NULL, NULL, NULL, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autorisation`
--
ALTER TABLE `autorisation`
  ADD PRIMARY KEY (`id_autorisation`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_equipe` (`id_equipe`),
  ADD KEY `id_repertoire` (`id_repertoire`),
  ADD KEY `id_fichier` (`id_fichier`);

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
-- AUTO_INCREMENT for table `autorisation`
--
ALTER TABLE `autorisation`
  MODIFY `id_autorisation` int(11) NOT NULL AUTO_INCREMENT;

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
-- Constraints for table `autorisation`
--
ALTER TABLE `autorisation`
  ADD CONSTRAINT `autorisation_equipe` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`id_equipe`) ON DELETE CASCADE,
  ADD CONSTRAINT `autorisation_fichier` FOREIGN KEY (`id_fichier`) REFERENCES `fichier` (`id_fichier`) ON DELETE CASCADE,
  ADD CONSTRAINT `autorisation_repertoire` FOREIGN KEY (`id_repertoire`) REFERENCES `repertoire` (`id_repertoire`) ON DELETE CASCADE,
  ADD CONSTRAINT `autorisation_user` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE CASCADE;

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
