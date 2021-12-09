<?php
//-----------------------------------------------------
// Création de la table - ADRESSE
//-----------------------------------------------------
CREATE TABLE adresse (
	adresse_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	adresse_num_voie INT UNSIGNED NOT NULL,
	adresse_type_voie ENUM('Rue', 'Allée', 'Avenue', 'Boulevard', 'Impasse', 'Place', 'Route', 'Carrefour', 'Chemin', 'Chaussée', 'Cité', 'Corniche', 'Cours', 'Domaine', 'Descente', 'Ecart', 'Esplanade', 'Faubourg', 'Grande Rue', 'Hameau', 'Halle', 'Lieu-dit', 'Lotissement', 'Marché', 'Montée', 'Passage', 'Plaine', 'Plateau', 'Promenade', 'Parvis', 'Quartier', 'Quai', 'Résidence', 'Ruelle', 'Rocade', 'Rond-point', 'Sente - Sentier', 'Square', 'Terre-plein', 'Traverse', 'Villa', 'Village') NOT NULL DEFAULT 'Rue',
	adresse_nom_voie VARCHAR(60) NOT NULL,
	adresse_complement VARCHAR(60) NULL,
	adresse_code_postal VARCHAR(5) NOT NULL,
	adresse_ville VARCHAR(20) NOT NULL,
	adresse_added_date DATETIME NOT NULL,
	adresse_update_date DATETIME NULL,
	adresse_deleted_date DATETIME NULL
) ENGINE=InnoDB;


//-----------------------------------------------------
// Création de la table - MEDIA
//-----------------------------------------------------
CREATE TABLE media (
	media_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	media_type ENUM('.gif', '.jpg', '.jpeg', '.jfif', '.pjpeg', '.pjp', '.png') NOT NULL,
	media_nom VARCHAR(30) NOT NULL UNIQUE,
	media_chemin VARCHAR(100) NOT NULL UNIQUE,
	media_added_date DATETIME NOT NULL,
	media_deleted_date DATETIME NULL
) ENGINE=InnoDB;


//-----------------------------------------------------
// Création de la table - CLIENT
//-----------------------------------------------------
CREATE TABLE client (
	client_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	client_nom VARCHAR(30) NOT NULL,
	client_prenom VARCHAR(30) NOT NULL,
	client_pseudo VARCHAR(30) NOT NULL UNIQUE,
	client_mail VARCHAR(50) NOT NULL UNIQUE,
	client_telephone_fr_fr VARCHAR(10) NOT NULL UNIQUE,
	fk_client_domicile INT UNSIGNED NOT NULL,
	fk_client_bureau INT UNSIGNED NULL,
	client_hash_mdp VARCHAR(100) NOT NULL,
	client_token VARCHAR(100) NULL UNIQUE,
	client_added_date DATETIME NOT NULL,
	client_update_date DATETIME NULL,
	client_deleted_date DATETIME NULL,
		//FOREIGN KEY(fk_client_domicile) REFERENCES adresse(id) ON DELETE CASCADE,
		//FOREIGN KEY(fk_client_bureau) REFERENCES adresse(id) ON DELETE CASCADE,
		CONSTRAINT uc_client UNIQUE (client_nom, client_prenom)
) ENGINE=InnoDB;


//-----------------------------------------------------
// Création de la table - RESTAURATEUR
//-----------------------------------------------------
CREATE TABLE restaurateur (
	restaurateur_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	restaurateur_nom VARCHAR(30) NOT NULL,
	restaurateur_prenom VARCHAR(30) NOT NULL,
	restaurateur_nom_restaurant VARCHAR(50) NOT NULL UNIQUE,
	restaurateur_mail VARCHAR(50) NOT NULL UNIQUE,
	restaurateur_telephone_fr_fr VARCHAR(10) NOT NULL UNIQUE,
	fk_restaurateur_adresse INT UNSIGNED NOT NULL,
	restaurateur_hash_mdp VARCHAR(100) NOT NULL,
	restaurateur_token VARCHAR(100) NULL UNIQUE,
	restaurateur_added_date DATETIME NOT NULL,
	restaurateur_update_date DATETIME NULL,
	restaurateur_deleted_date DATETIME NULL,
		//FOREIGN KEY(fk_restaurateur_adresse) REFERENCES adresse(id),
		CONSTRAINT uc_restaurateur UNIQUE (restaurateur_nom, restaurateur_prenom)
) ENGINE=InnoDB;


//-----------------------------------------------------
// Création de la table - LIVREUR
//-----------------------------------------------------
CREATE TABLE livreur (
	livreur_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	livreur_nom VARCHAR(30) NOT NULL,
	livreur_prenom VARCHAR(30) NOT NULL,
	livreur_pseudo VARCHAR(30) NOT NULL UNIQUE,
	livreur_mail VARCHAR(50) NOT NULL UNIQUE,
	livreur_telephone_fr_fr VARCHAR(10) NOT NULL UNIQUE,
	livreur_latitude DECIMAL NULL,
	livreur_longitude DECIMAL NULL,
	livreur_statut ENUM('inactif', 'actif', 'en livraison') NOT NULL DEFAULT 'inactif',
	livreur_added_date DATETIME NOT NULL,
	livreur_update_date DATETIME NULL,
	livreur_deleted_date DATETIME NULL,
		CONSTRAINT uc_livreur UNIQUE (livreur_nom, livreur_prenom)
) ENGINE=InnoDB;


//-----------------------------------------------------
// Création de la table - PLAT
//-----------------------------------------------------
CREATE TABLE plat (
	plat_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	plat_nom VARCHAR(60) NOT NULL UNIQUE,
	plat_ingrédient TEXT NULL,
	fk_plat_media INT UNSIGNED NULL,
	plat_prix DECIMAL UNSIGNED NOT NULL,
	plat_type ENUM('plat', 'dessert') NOT NULL,
	plat_statut BOOLEAN NOT NULL DEFAULT '0',
	fk_plat_restaurateur INT UNSIGNED NOT NULL,
	plat_added_date DATETIME NOT NULL,
	plat_update_date DATETIME NULL,
	plat_deleted_date DATETIME NULL,
		//FOREIGN KEY(fk_plat_media) REFERENCES media(id),
		//FOREIGN KEY(fk_plat_restaurateur) REFERENCES restaurateur(id)
) ENGINE=InnoDB;


//-----------------------------------------------------
// Création de la table - MENU
//-----------------------------------------------------
CREATE TABLE menu (
	menu_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fk_menu_restaurateur INT UNSIGNED NOT NULL,
	fk_menu_plat INT UNSIGNED NOT NULL,
	menu_quantité_plat INT UNSIGNED NOT NULL,
	menu_added_date DATETIME NOT NULL,
	menu_update_date DATETIME NULL,
	menu_deleted_date DATETIME NULL,
		//FOREIGN KEY(fk_menu_restaurateur) REFERENCES restaurateur(id),
		//FOREIGN KEY(fk_menu_plat) REFERENCES plat(id)
) ENGINE=InnoDB;


//-----------------------------------------------------
// Création de la table - PANIER
//-----------------------------------------------------
CREATE TABLE panier (
	panier_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fk_panier_client INT UNSIGNED NOT NULL,
	fk_panier_plat INT UNSIGNED NOT NULL,
	panier_quantite_plat INT UNSIGNED NOT NULL,
	panier_added_date DATETIME NOT NULL,
	panier_deleted_date DATETIME NULL,
		//FOREIGN KEY(fk_panier_client) REFERENCES client(id),
		//FOREIGN KEY(fk_panier_plat) REFERENCES plat(id)
) ENGINE=InnoDB;


//-----------------------------------------------------
// Création de la table - COMMANDE
//-----------------------------------------------------
CREATE TABLE commande (
	commande_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fk_commande_panier INT UNSIGNED NOT NULL,
	commande_prix DECIMAL UNSIGNED NOT NULL,
	fk_commande_livreur INT UNSIGNED NOT NULL,
	commande_temps_livraison TIME NOT NULL,
	commande_added_date DATETIME NOT NULL,
	commande_deleted_date DATETIME NULL,
		//FOREIGN KEY(fk_commande_panier) REFERENCES panier(id),
		//FOREIGN KEY(fk_commande_livreur) REFERENCES livreur(id)
) ENGINE=InnoDB;


//-----------------------------------------------------
// Création de la table - STOCK
//-----------------------------------------------------
CREATE TABLE stock (
	stock_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fk_stock_plat INT UNSIGNED NOT NULL,
	fk_stock_livreur INT UNSIGNED NOT NULL,
	stock_quantité INT UNSIGNED NOT NULL,
	stock_added_date DATETIME NOT NULL,
	stock_update_date DATETIME NULL,
	stock_deleted_date DATETIME NULL,
		//FOREIGN KEY(fk_stock_plat) REFERENCES plat(id),
		//FOREIGN KEY(fk_stock_livreur) REFERENCES livreur(id)
) ENGINE=InnoDB;
?>