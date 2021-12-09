<?php
//-----------------------------------------------------
// Création de la table - ADRESSE
//-----------------------------------------------------
CREATE TABLE adresse (
	adresse_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	adresse_num_voie INT
	adresse_type_voie ENUM('Rue', 'Allée', 'Avenue', 'Boulevard', 'Impasse', 'Place', 'Route', 'Carrefour', 'Chemin', 'Chaussée', 'Cité', 'Corniche', 'Cours', 'Domaine', 'Descente', 'Ecart', 'Esplanade', 'Faubourg', 'Grande Rue', 'Hameau', 'Halle', 'Lieu-dit', 'Lotissement', 'Marché', 'Montée', 'Passage', 'Plaine', 'Plateau', 'Promenade', 'Parvis', 'Quartier', 'Quai', 'Résidence', 'Ruelle', 'Rocade', 'Rond-point', 'Sente - Sentier', 'Square', 'Terre-plein', 'Traverse', 'Villa', 'Village')
	adresse_nom_voie VARCHAR(60)
	adresse_complement VARCHAR(60)
	adresse_code_postal VARCHAR(5)
	adresse_ville VARCHAR(20)
	adresse_added_date DATETIME
	adresse_update_date DATETIME
	adresse_deleted_date DATETIME
)


//-----------------------------------------------------
// Création de la table - MEDIA
//-----------------------------------------------------
CREATE TABLE media (
	media_id INT
	media_type ENUM('.gif', '.jpg', '.jpeg', '.jfif', '.pjpeg', '.pjp', '.png')
	media_nom VARCHAR(30)
	media_chemin VARCHAR(100)
	media_added_date DATETIME
	media_added_deleted DATETIME
)


//-----------------------------------------------------
// Création de la table - CLIENT
//-----------------------------------------------------
CREATE TABLE client (
	client_id INT
	client_nom VARCHAR(30)
	client_prenom VARCHAR(30)
	client_pseudo VARCHAR(30)
	client_mail VARCHAR(50)
	client_telephone_fr_fr VARCHAR(10)
	client_domicile INT
	client_bureau INT
	client_hash_mdp VARCHAR(100)
	client_token VARCHAR(100)
	client_added_date DATETIME
	client_update_date DATETIME
	client_deleted_date DATETIME
)


//-----------------------------------------------------
// Création de la table - RESTAURATEUR
//-----------------------------------------------------
CREATE TABLE restaurateur (
	restaurateur_id INT
	restaurateur_nom VARCHAR(30)
	restaurateur_prenom VARCHAR(30)
	restaurateur_nom_restaurant VARCHAR(50)
	restaurateur_mail VARCHAR(50)
	restaurateur_telephone_fr_fr VARCHAR(10)
	restaurateur_adresse INT
	restaurateur_hash_mdp VARCHAR(100)
	restaurateur_token VARCHAR(100)
	restaurateur_added_date DATETIME
	restaurateur_update_date DATETIME
	restaurateur_deleted_date DATETIME
)


//-----------------------------------------------------
// Création de la table - LIVREUR
//-----------------------------------------------------
CREATE TABLE livreur (
	livreur_id INT
	livreur_nom VARCHAR
	livreur_prenom VARCHAR
	livreur_pseudo VARCHAR
	livreur_mail VARCHAR
	livreur_telephone VARCHAR
	livreur_latitude DECIMAL
	livreur_longitude DECIMAL
	livreur_statut ENUM
	livreur_added_date DATETIME
	livreur_deleted_date DATETIME
)


//-----------------------------------------------------
// Création de la table - PLAT
//-----------------------------------------------------
CREATE TABLE plat (
	plat_id INT
	plat_nom VARCHAR
	plat_ingrédient 
	plat_media
	plat_prix
	plat_type
	plat_statut
	plat_restaurateur
	plat_added_date
	plat_update_date
	plat_deleted_date
)


//-----------------------------------------------------
// Création de la table - MENU
//-----------------------------------------------------
CREATE TABLE menu (
	menu_id
	//menu_restaurateur
	menu_plat
	menu_quantité_plat
	menu_added_date
	menu_update_date
	menu_deleted_date
)


//-----------------------------------------------------
// Création de la table - PANIER
//-----------------------------------------------------
CREATE TABLE panier (
	panier_id
	panier_client
	panier_plat
	panier_quantite_plat
	panier_added_date
	panier_deleted_date
)


//-----------------------------------------------------
// Création de la table - COMMANDE
//-----------------------------------------------------
CREATE TABLE commande (
	commande_id
	commande_panier
	commande_prix
	commande_livreur
	commande_temps_livraison
	commande_etat
	//commande_notation
	//commande_commentaire
	commande_added_date
	commande_deleted_date
)


//-----------------------------------------------------
// Création de la table - STOCK
//-----------------------------------------------------
CREATE TABLE stock (
	stock_id
	stock_plat
	stock_livreur
	stock_quantité
	stock_added_date
	stock_update_date
	stock_deleted_date
)
?>