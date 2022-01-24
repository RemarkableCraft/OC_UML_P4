-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 24 jan. 2022 à 23:37
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `p4_oc`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `adresse_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `adresse_num_voie` int(10) UNSIGNED NOT NULL,
  `adresse_type_voie` enum('Rue','Allée','Avenue','Boulevard','Impasse','Place','Route','Carrefour','Chemin','Chaussée','Cité','Corniche','Cours','Domaine','Descente','Ecart','Esplanade','Faubourg','Grande Rue','Hameau','Halle','Lieu-dit','Lotissement','Marché','Montée','Passage','Plaine','Plateau','Promenade','Parvis','Quartier','Quai','Résidence','Ruelle','Rocade','Rond-point','Sente - Sentier','Square','Terre-plein','Traverse','Villa','Village') NOT NULL DEFAULT 'Rue',
  `adresse_nom_voie` varchar(60) NOT NULL,
  `adresse_complement` varchar(60) DEFAULT NULL,
  `adresse_code_postal` varchar(5) NOT NULL,
  `adresse_ville` varchar(20) NOT NULL,
  `adresse_added_date` datetime NOT NULL,
  `adresse_update_date` datetime DEFAULT NULL,
  `adresse_deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`adresse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`adresse_id`, `adresse_num_voie`, `adresse_type_voie`, `adresse_nom_voie`, `adresse_complement`, `adresse_code_postal`, `adresse_ville`, `adresse_added_date`, `adresse_update_date`, `adresse_deleted_date`) VALUES
(1, 1, 'Rue', 'du restaurant', NULL, '00001', 'QUELQUE-PART', '2022-01-15 23:11:24', NULL, NULL),
(2, 2, 'Allée', 'de chez moi', 'appt 2', '00001', 'QUELQUE-PART', '2022-01-24 23:11:24', NULL, NULL),
(3, 3, 'Boulevard', 'de mon travail', 'bureau 3', '00002', 'AUTRE-PART', '2022-01-21 12:14:26', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `client_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_nom` varchar(30) NOT NULL,
  `client_prenom` varchar(30) NOT NULL,
  `client_pseudo` varchar(30) NOT NULL,
  `client_mail` varchar(50) NOT NULL,
  `client_telephone_fr_fr` varchar(10) NOT NULL,
  `fk_client_domicile` int(10) UNSIGNED NOT NULL,
  `fk_client_bureau` int(10) UNSIGNED DEFAULT NULL,
  `client_hash_mdp` varchar(100) NOT NULL,
  `client_token` varchar(100) DEFAULT NULL,
  `client_added_date` datetime NOT NULL,
  `client_update_date` datetime DEFAULT NULL,
  `client_deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `client_pseudo` (`client_pseudo`),
  UNIQUE KEY `client_mail` (`client_mail`),
  UNIQUE KEY `client_telephone_fr_fr` (`client_telephone_fr_fr`),
  UNIQUE KEY `uc_client` (`client_nom`,`client_prenom`),
  UNIQUE KEY `client_token` (`client_token`),
  KEY `fk_client_domicile` (`fk_client_domicile`),
  KEY `fk_client_bureau` (`fk_client_bureau`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`client_id`, `client_nom`, `client_prenom`, `client_pseudo`, `client_mail`, `client_telephone_fr_fr`, `fk_client_domicile`, `fk_client_bureau`, `client_hash_mdp`, `client_token`, `client_added_date`, `client_update_date`, `client_deleted_date`) VALUES
(1, 'Bidule', 'Jean', 'jean-bidule', 'jean.bidule@mail.fr', '0909090909', 2, 3, 'okzbvqpeib51tbhr56n44dfh1n651vq6v41dfw65v1', NULL, '2022-01-17 11:16:03', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `commande_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_commande_panier` int(10) UNSIGNED NOT NULL,
  `commande_prix` decimal(10,0) UNSIGNED NOT NULL,
  `fk_commande_livreur` int(10) UNSIGNED NOT NULL,
  `commande_temps_livraison` time NOT NULL,
  `commande_statut` enum('en creation','payée','livraison en cour','livrée') NOT NULL,
  `commande_added_date` datetime NOT NULL,
  `commande_deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`commande_id`),
  KEY `fk_commande_panier` (`fk_commande_panier`),
  KEY `fk_commande_livreur` (`fk_commande_livreur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `livreur_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `livreur_nom` varchar(30) NOT NULL,
  `livreur_prenom` varchar(30) NOT NULL,
  `livreur_pseudo` varchar(30) NOT NULL,
  `livreur_mail` varchar(50) NOT NULL,
  `livreur_telephone_fr_fr` varchar(10) NOT NULL,
  `livreur_latitude` decimal(10,0) DEFAULT NULL,
  `livreur_longitude` decimal(10,0) DEFAULT NULL,
  `livreur_statut` enum('inactif','actif','en livraison') NOT NULL DEFAULT 'inactif',
  `livreur_hash_mdp` varchar(100) NOT NULL,
  `livreur_token` varchar(100) DEFAULT NULL,
  `livreur_added_date` datetime NOT NULL,
  `livreur_update_date` datetime DEFAULT NULL,
  `livreur_deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`livreur_id`),
  UNIQUE KEY `livreur_pseudo` (`livreur_pseudo`),
  UNIQUE KEY `livreur_mail` (`livreur_mail`),
  UNIQUE KEY `livreur_telephone_fr_fr` (`livreur_telephone_fr_fr`),
  UNIQUE KEY `uc_livreur` (`livreur_nom`,`livreur_prenom`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`livreur_id`, `livreur_nom`, `livreur_prenom`, `livreur_pseudo`, `livreur_mail`, `livreur_telephone_fr_fr`, `livreur_latitude`, `livreur_longitude`, `livreur_statut`, `livreur_hash_mdp`, `livreur_token`, `livreur_added_date`, `livreur_update_date`, `livreur_deleted_date`) VALUES
(1, 'Vavite', 'Benoit', 'benoit-vavite', 'benoit.vavite@mail.fr', '0911111111', '48', '1', 'en livraison', '6t5g1r16d5f1b7r4b65b149g9r4th654n1g', NULL, '2022-01-17 23:21:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `media_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `media_type` enum('.gif','.jpg','.jpeg','.jfif','.pjpeg','.pjp','.png','webp') NOT NULL,
  `media_nom` varchar(30) NOT NULL,
  `media_chemin` varchar(100) NOT NULL,
  `media_added_date` datetime NOT NULL,
  `media_deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`media_id`),
  UNIQUE KEY `media_nom` (`media_nom`),
  UNIQUE KEY `media_chemin` (`media_chemin`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`media_id`, `media_type`, `media_nom`, `media_chemin`, `media_added_date`, `media_deleted_date`) VALUES
(1, 'webp', 'tartiflette', 'https://assets.afcdn.com/recipe/20160401/38946_w1200h800c1cx2690cy1793.webp', '2022-01-17 23:31:41', NULL),
(2, 'webp', 'blanquette', 'https://assets.afcdn.com/recipe/20190529/93191_w1200h800c1cx4330cy2886cxb8660cyb5773.webp', '2022-01-17 23:32:21', NULL),
(3, 'webp', 'lasagne', 'https://assets.afcdn.com/recipe/20200408/109520_w1200h1800c1cx1866cy2800cxb3732cyb5600.webp', '2022-01-17 23:32:21', NULL),
(4, 'webp', 'poutine', 'https://assets.afcdn.com/recipe/20200622/112176_w1200h800c1cx2880cy1920cxb5760cyb3840.webp', '2022-01-17 23:33:23', NULL),
(5, 'webp', 'tiramisu', 'https://assets.afcdn.com/recipe/20190529/93098_w1200h799c1cx2464cy1640cxb4928cyb3280.webp', '2022-01-17 23:33:53', NULL),
(6, 'webp', 'crème pâtissière', 'https://assets.afcdn.com/recipe/20180713/80960_w1200h1600c1cx1944cy2592cxb3888cyb5184.webp', '2022-01-17 23:34:26', NULL),
(7, 'webp', 'tarte citron', 'https://assets.afcdn.com/recipe/20140121/63377_w1200h1531c1.webp', '2022-01-17 23:35:05', NULL),
(8, 'webp', 'panna cotta', 'https://assets.afcdn.com/recipe/20170905/71705_w1200h1800c1cx1411cy4176cxb3999cyb6000.webp', '2022-01-17 23:35:48', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `menu_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_menu_restaurateur` int(10) UNSIGNED NOT NULL,
  `fk_menu_plat` int(10) UNSIGNED NOT NULL,
  `menu_quantité_plat` int(10) UNSIGNED NOT NULL,
  `menu_added_date` datetime NOT NULL,
  `menu_update_date` datetime DEFAULT NULL,
  `menu_deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `fk_menu_restaurateur` (`fk_menu_restaurateur`),
  KEY `fk_menu_plat` (`fk_menu_plat`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `menu`
--

INSERT INTO `menu` (`menu_id`, `fk_menu_restaurateur`, `fk_menu_plat`, `menu_quantité_plat`, `menu_added_date`, `menu_update_date`, `menu_deleted_date`) VALUES
(1, 1, 1, 200, '2022-01-18 23:55:10', NULL, NULL),
(2, 1, 3, 150, '2022-01-18 23:55:10', NULL, NULL),
(3, 1, 4, 100, '2022-01-18 23:57:13', NULL, NULL),
(4, 1, 6, 200, '2022-01-18 23:57:57', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

DROP TABLE IF EXISTS `panier`;
CREATE TABLE IF NOT EXISTS `panier` (
  `panier_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_panier_client` int(10) UNSIGNED NOT NULL,
  `fk_panier_plat` int(10) UNSIGNED NOT NULL,
  `panier_quantite_plat` int(10) UNSIGNED NOT NULL,
  `panier_added_date` datetime NOT NULL,
  `panier_deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`panier_id`),
  KEY `fk_panier_client` (`fk_panier_client`),
  KEY `fk_panier_plat` (`fk_panier_plat`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`panier_id`, `fk_panier_client`, `fk_panier_plat`, `panier_quantite_plat`, `panier_added_date`, `panier_deleted_date`) VALUES
(1, 1, 1, 2, '2022-01-18 20:28:00', '2022-01-18 20:30:00'),
(2, 1, 4, 2, '2022-01-18 20:28:00', '2022-01-18 20:30:00');

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

DROP TABLE IF EXISTS `plat`;
CREATE TABLE IF NOT EXISTS `plat` (
  `plat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `plat_nom` varchar(60) NOT NULL,
  `plat_ingrédient` text,
  `fk_plat_media` int(10) UNSIGNED DEFAULT NULL,
  `plat_prix` decimal(10,0) UNSIGNED NOT NULL,
  `plat_type` enum('plat','dessert') NOT NULL,
  `plat_statut` tinyint(1) NOT NULL DEFAULT '0',
  `fk_plat_restaurateur` int(10) UNSIGNED NOT NULL,
  `plat_added_date` datetime NOT NULL,
  `plat_update_date` datetime DEFAULT NULL,
  `plat_deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`plat_id`),
  UNIQUE KEY `plat_nom` (`plat_nom`),
  KEY `fk_plat_media` (`fk_plat_media`),
  KEY `fk_plat_restaurateur` (`fk_plat_restaurateur`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`plat_id`, `plat_nom`, `plat_ingrédient`, `fk_plat_media`, `plat_prix`, `plat_type`, `plat_statut`, `fk_plat_restaurateur`, `plat_added_date`, `plat_update_date`, `plat_deleted_date`) VALUES
(1, 'Tartiflette du Chef', 'pomme de terre,\r\noignon,\r\nreblochon,\r\nhuile,\r\nail,\r\nsel,\r\npoivre,\r\nlardons fumés', 1, '10', 'plat', 1, 1, '2022-01-17 23:36:39', NULL, NULL),
(2, 'Blanquette du Chef', 'bouillon de légume,\r\nbouillon de poule,\r\ncarotte,\r\noignon,\r\nchampignon,\r\ncrème fraiche,\r\ncitron,\r\nfarine,\r\nvin blanc,\r\nsel,\r\npoivre,\r\nblanquette de veau,\r\njaune d\'œuf', 2, '13', 'plat', 0, 1, '2022-01-17 23:36:39', NULL, NULL),
(3, 'Lasagne du Chef', 'farine,\r\nbeurre,\r\nlait,\r\nlasagne,\r\noignon,\r\nail,\r\ncéleri,\r\ncarotte,\r\npurée de tomate,\r\nvin rouge,\r\nfeuille de laurier,\r\nthym,\r\nbasilic,\r\nmuscade,\r\nfromage,\r\nparmesan,\r\nsel,\r\npoivre,\r\nbœuf haché', 3, '8', 'plat', 1, 1, '2022-01-17 23:42:28', NULL, NULL),
(4, 'Tiramisu du Chef', 'sucre roux,\r\nsucre vanillé,\r\nbiscuit à la cuillère,\r\ncacao amer,\r\nœuf,\r\nmascarpone,\r\ncafé', 5, '5', 'dessert', 1, 1, '2022-01-17 23:46:17', NULL, NULL),
(5, 'Tarte au citron du Chef', 'sucre glace,\r\nlevure chimique,\r\nblanc d\'œuf,\r\ncitron,\r\nsucre,\r\nmaïzena,\r\nœuf,\r\nfarine,\r\nbeurre,\r\nsel', 7, '5', 'dessert', 0, 1, '2022-01-17 23:46:17', NULL, NULL),
(6, 'Panna cotta du Chef', 'sucre,\r\ngélatine,\r\nvanille,\r\ncrème liquide,\r\ncoulis de fraise', 8, '3', 'dessert', 1, 1, '2022-01-17 23:51:11', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `restaurateur`
--

DROP TABLE IF EXISTS `restaurateur`;
CREATE TABLE IF NOT EXISTS `restaurateur` (
  `restaurateur_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `restaurateur_nom` varchar(30) NOT NULL,
  `restaurateur_prenom` varchar(30) NOT NULL,
  `restaurateur_nom_restaurant` varchar(50) NOT NULL,
  `restaurateur_mail` varchar(50) NOT NULL,
  `restaurateur_telephone_fr_fr` varchar(10) NOT NULL,
  `fk_restaurateur_adresse` int(10) UNSIGNED NOT NULL,
  `restaurateur_hash_mdp` varchar(100) NOT NULL,
  `restaurateur_token` varchar(100) DEFAULT NULL,
  `restaurateur_added_date` datetime NOT NULL,
  `restaurateur_update_date` datetime DEFAULT NULL,
  `restaurateur_deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`restaurateur_id`),
  UNIQUE KEY `restaurateur_nom_restaurant` (`restaurateur_nom_restaurant`),
  UNIQUE KEY `restaurateur_mail` (`restaurateur_mail`),
  UNIQUE KEY `restaurateur_telephone_fr_fr` (`restaurateur_telephone_fr_fr`),
  UNIQUE KEY `uc_restaurateur` (`restaurateur_nom`,`restaurateur_prenom`),
  UNIQUE KEY `restaurateur_token` (`restaurateur_token`),
  KEY `fk_restaurateur_adresse` (`fk_restaurateur_adresse`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `restaurateur`
--

INSERT INTO `restaurateur` (`restaurateur_id`, `restaurateur_nom`, `restaurateur_prenom`, `restaurateur_nom_restaurant`, `restaurateur_mail`, `restaurateur_telephone_fr_fr`, `fk_restaurateur_adresse`, `restaurateur_hash_mdp`, `restaurateur_token`, `restaurateur_added_date`, `restaurateur_update_date`, `restaurateur_deleted_date`) VALUES
(1, 'Chef', 'Pascal', 'Chez Pascal le Chef', 'pascal.le.chef@restaurant.fr', '0910101010', 1, 'bt1r54e1951vfe98b165df1b98g165df1', NULL, '2022-01-14 23:19:08', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `stock_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_stock_plat` int(10) UNSIGNED NOT NULL,
  `fk_stock_livreur` int(10) UNSIGNED NOT NULL,
  `stock_quantité` int(10) UNSIGNED NOT NULL,
  `stock_added_date` datetime NOT NULL,
  `stock_update_date` datetime DEFAULT NULL,
  `stock_deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`stock_id`),
  KEY `fk_stock_plat` (`fk_stock_plat`),
  KEY `fk_stock_livreur` (`fk_stock_livreur`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `stock`
--

INSERT INTO `stock` (`stock_id`, `fk_stock_plat`, `fk_stock_livreur`, `stock_quantité`, `stock_added_date`, `stock_update_date`, `stock_deleted_date`) VALUES
(5, 1, 1, 8, '2022-01-18 19:30:00', '2022-01-18 20:30:00', NULL),
(6, 2, 1, 10, '2022-01-18 19:30:00', NULL, NULL),
(7, 4, 1, 8, '2022-01-18 19:30:00', '2022-01-18 20:30:00', NULL),
(8, 6, 1, 10, '2022-01-18 19:30:00', NULL, NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_client_bureau` FOREIGN KEY (`fk_client_bureau`) REFERENCES `adresse` (`adresse_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_client_domicile` FOREIGN KEY (`fk_client_domicile`) REFERENCES `adresse` (`adresse_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_livreur` FOREIGN KEY (`fk_commande_livreur`) REFERENCES `livreur` (`livreur_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_commande_panier` FOREIGN KEY (`fk_commande_panier`) REFERENCES `panier` (`panier_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_menu_plat` FOREIGN KEY (`fk_menu_plat`) REFERENCES `plat` (`plat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_menu_restaurateur` FOREIGN KEY (`fk_menu_restaurateur`) REFERENCES `restaurateur` (`restaurateur_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `fk_panier_client` FOREIGN KEY (`fk_panier_client`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_panier_plat` FOREIGN KEY (`fk_panier_plat`) REFERENCES `plat` (`plat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `plat`
--
ALTER TABLE `plat`
  ADD CONSTRAINT `fk_plat_media` FOREIGN KEY (`fk_plat_media`) REFERENCES `media` (`media_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_plat_restaurateur` FOREIGN KEY (`fk_plat_restaurateur`) REFERENCES `restaurateur` (`restaurateur_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `restaurateur`
--
ALTER TABLE `restaurateur`
  ADD CONSTRAINT `fk_restaurateur_adresse` FOREIGN KEY (`fk_restaurateur_adresse`) REFERENCES `adresse` (`adresse_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `fk_stock_livreur` FOREIGN KEY (`fk_stock_livreur`) REFERENCES `livreur` (`livreur_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_stock_plat` FOREIGN KEY (`fk_stock_plat`) REFERENCES `plat` (`plat_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
