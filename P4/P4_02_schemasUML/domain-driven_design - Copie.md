LES ACTEURS

Client
- client_pseudo
- client_adresse
- client_telephone
- client_mail

Livreur
- livreur_pseudo
- livreur_statut
- livreur_position
- livreur_telephone

Restaurateur
- restaurateur_nomRestaurant
- restaurateur_adresseRestaurant
- restaurateur_nom

*
* Menu
* - le nom du plat
* - le type de plat (plat ou dessert)
* - la disponibilitee du plat
* - la quantite de plat en service
* - la liste d'ingrédient dans le plat
* - le pri du plat
*

*
* Commandes
* - les plats commandes
* - l'adresse de livraison
* - le prix de la commande
* - le nom du livreur
* - le temps de livraison
*

*
* Paiement
* - type de paiement
*

---------------------------------

LEURS OBJECTIFS / CAS D'UTILISATION

Restaurateur 	--> Livrer des plats de qualité à domilcile
		--> Faire le menu du jour
		--> Préparer et conditionner 2 plats et 2 desserts
		--> Transmettre les plats aux livreurs

Livreur 	--> "Marauder" dans les rues en attendant une livraison
		--> Livrer les commandes le plus rapidement possible (moins de 20min)

Client 		--> Commander un ou plusieurs plats

---------------------------------

LEURS ACTIONS
(-* sur l'application)

Restaurateur
-* Elaborer le menu du jour (choix de 2 plats et 2 desserts)
-  Réaliser et conditionner les plats
-  Transmettre les différents plats aux livreurs
-* Mettre en ligne le menu

Livreur
-* Réceptionner les plats
-  Se déplacer dans la ville
-* Consulter les commandes clients
-  Livrer la commande le plus rapidement possible (- de 20min)
-* Confirmer la livraison de commande

Client
-* Consulter le menu du jour
-* Commander un ou plusieurs plats dans son panier
(- Payer sa commande)
-* Réceptionner sa commande

---------------------------------

DESCRIPTION DES CAS D'UTILISATION

Elaborer le menu du jour
- le restaurateur demande a creer le menu du jour
- l'application affiche la liste des plats
- le restaurateur selectionne les plats dans la liste
- l'application enregistre la liste de plat selectionner
- le restaurateur demande la liste de ses plats selectionnes
- l'application affiche les plats selectionnes
- le restaurateur entre la quantites max qu'il peut réaliser de chaque plats
- le restaurateur valide son menu
- l'application enregistre les plats choisi et les quantites
- l'application affiche le menu final
- l'application mais en ligne le menu
- l'application envoie une notification aux clients

Reassort des livreurs
- le restaurateur demande a livrer ses plats
- l'application envoie une alerte de "besoin de livreur" a liste de livreur
- le livreur demande a ouvrir l'alerte
- l'application affiche le formulaire de demande d'activité du livreur
- le livreur valide son statut d'actif
- l'application change le statut du livreur en "actif"
- l'application stop la recherche de livreur si celui ci atteint la quantité max de plat défini par le restaurateur
- l'application calcul la quantite de plat previsionnel que doit faire le restaurateur
- l'application affiche au restaurateur la liste de livreur et nombre de plat a preparer
- le restaurateur confirme la liste et les quantités
- l'application affiche la quantite de plat à fournir à chaque livreur
- le livreur demande a récuperer son stock
- l'application affiche la quantite des plats qu'il doit recuperer
- l'application envoi une alerte au restaurateur de preparer le reassort du livreur
- le livreur valide le reassort terminé
- l'application met le statut du livreur en "disponible" 

Commande et livraison de repas
- le client demande le menu du jour
- l'application affiche le menu du jour
- le client selectionne un plat
- l'application affiche le plat
- l'application affiche un formulaire pour connaitre la quantite
- le client entre la quantité
- le client valide la commande de ce plat
- l'application enregistre la commande
- l'application affiche une demande (ajout de plat ou fin de commande)
- le client répond a la demande
- l'application affiche la synthese de la commande
- l'application demande une validation de la commande au clients
- le client valide la commande
- l'application valide la commande
- l'application recherche un livreur dont le statut est "disponible"
- l'application verifie si le livreur a dans son stock les plats de la commande
- l'application calcul le meilleur itineraire et le temps de livraison
- l'application envoie une alerte de "nouvel commande" au livreur le plus proche
- le livreur demande a consulter les informations de la commande (liste des plats, adresse, temps de livraison)
- l'application affiche le detail de la commande
- le livreur valide la livraison
- l'application enregistre la validation de la livraison
- l'application change le statut du livreur en "en cour de livraison"
- l'application affiche au livreur le meilleur itineraire et le temps estimé
- l'application affiche au client la prise en charge de sa commande et le temps estimé d'attente
- le livreur demande à valide la reception de la commande
- l'appliction affiche le formulaire de fin de livraison
- le livreur valide la fin de livraison
- l'application change le statut du livreur en "disponible"
- l'application modifie le stock du livreur
- l'application envoi au client la notification "Bon appétit"
- l'application envoi au client une enquete de satisfaction

*
* Recherche de plat
* - le restaurateur demande a rechercher un plat
* - l'application affiche la page de recherche
* - le restaurateur saisit la liste d'ingredients en sa possession
* - le restaurateur demande l'execution de la reherche
* - l'application lance la recherche
* - l'application affiche les résultats

* Creation de nouveau plat
* - le restaurateur demande a creer un nouveau plat
* - l'application affiche la page de creation
* - le restaurateur rempli le formulaire de creation de plat
* - le restaurateur valide la creation de ce plat
* - l'application verifie que le formulaire soit complet et bien rempli
* - l'application enregistre son nouveau plat
* - l'application affiche son nouveau plat
*

---------------------------------

LES ENTITES

- le restaurateur
- le livreur
- les plats
- les ingrédients
- le menu du jour
- le stock des plats creer
- le stock des plats par livreur
- le statut du livreur
- la commande
- la localisation du livreur
