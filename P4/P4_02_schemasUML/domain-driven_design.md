## LES ACTEURS

### Client
- client_pseudo
- client_adresse
- client_telephone
- client_mail

### Livreur
- livreur_pseudo
- livreur_statut
- livreur_position
- livreur_telephone

### Restaurateur
- restaurateur_nomRestaurant
- restaurateur_adresseRestaurant
- restaurateur_nom

---------------------------------

## LEURS OBJECTIFS / CAS D'UTILISATION

### Restaurateur	--> Livrer des plats de qualité à domilcile
			--> Faire le menu du jour
			--> Préparer et conditionner 2 plats et 2 desserts
			--> Transmettre les plats aux livreurs

### Livreur 		--> "Marauder" dans les rues en attendant une livraison
			--> Livrer les commandes le plus rapidement possible (moins de 20min)

### Client		--> Commander un ou plusieurs plats

---------------------------------

## LEURS ACTIONS
([x] sur l'application)

### Restaurateur
[x] Elaborer le menu du jour (choix de 2 plats et 2 desserts)
[ ] Réaliser et conditionner les plats
[ ] Transmettre les différents plats aux livreurs
[x] Mettre en ligne le menu

### Livreur
[x] Réceptionner les plats
[ ] Se déplacer dans la ville
[x] Consulter les commandes clients
[ ] Livrer la commande le plus rapidement possible (- de 20min)
[x] Confirmer la livraison de commande

### Client
[x] Consulter le menu du jour
[x] Commander un ou plusieurs plats dans son panier
[ ] _Payer sa commande_
[x] Réceptionner sa commande

---------------------------------

## DESCRIPTION DES CAS D'UTILISATION

### Elaborer le menu du jour
- le __restaurateur__ demande à créer le __menu__ du jour
- l'application affiche la liste des __plats__
  * une __*image*__ du plat
  * le __*nom*__ du plats
  * la liste d'__*ingrédients*__
  * le __*prix*__ du plat
  * le __*type*__ de plat
- le restaurateur sélectionne les plats dans la liste
- l'application enregistre la liste de plat sélectionnés
- le restaurateur demande la liste de ses plats sélectionnés
- l'application affiche les plats sélectionnés
- le restaurateur entre la __*quantités max*__ qu'il peut réaliser de chaque plats
- le restaurateur valide son menu
- l'application enregistre les plats choisis et les quantités
- l'application affiche le menu final
- l'application mais en ligne le menu
- l'application envoie une notification aux clients

### Réassort des livreurs
- le restaurateur demande à livrer ses plats
- l'application envoie une alerte "besoin de livreur" à la liste de livreur
- le __livreur__ demande à ouvrir l'alerte
- l'application affiche le formulaire de demande d'activité du livreur
- le livreur valide son __*statut*__ d'actif
- l'application change le statut du livreur en "actif"
- l'application stop la recherche de livreur si celui ci atteint la quantité max de plat défini par le restaurateur
- l'application calcul la quantité de plat prévisionnel que doit faire le restaurateur
- l'application affiche au restaurateur la liste de livreur et nombre de plat à préparer
- le restaurateur confirme la liste et les quantités
- l'application affiche la quantité de plat à fournir à chaque livreur
- le livreur demande à récuperer son __stock__
- l'application affiche la quantité des plats qu'il doit récupérer
- l'application envoi une alerte au restaurateur de préparer le stock du livreur
- le livreur valide le stock reçu
- l'application met le statut du livreur en "disponible" 

### Commande et livraison de repas
- le __client__ demande à voir le menu du jour
- l'application affiche le menu du jour
- le client sélectionne un ou plusieurs plats
- l'application affiche le ou les plats sélectionnés
- l'application affiche un formulaire pour connaitre la quantité de chaque plats
- le client entre la quantité
- le client valide la commande de ce plat
- l'application enregistre la __commande__
- l'application affiche la synthese de la commande
- l'application demande une validation de la commande au clients
- le client valide la commande
- l'application valide la commande
- l'application recherche un livreur dont le statut est "disponible"
- l'application verifie si le livreur à dans son stock les plats de la commande
- l'application calcul le meilleur __*itineraire*__ et le __*temps de livraison*__
- l'application envoie une alerte de "nouvel commande" au livreur le plus proche
- le livreur demande à consulter les informations de la commande
- l'application affiche le detail de la commande
  * __*liste des plats*__
  * adresse de livraison
  * temps de livraison estimé
  * identité du client
- le livreur valide la __*livraison*__
- l'application enregistre la validation de la livraison
- l'application change le statut du livreur en "en cour de livraison"
- l'application affiche au livreur le meilleur itineraire et le temps estimé
- l'application affiche au client la prise en charge de sa commande et le temps estimé d'attente
- le livreur demande à valider la fin de livraison de la commande
- l'appliction affiche le formulaire de fin de livraison
- le livreur valide la fin de livraison
- l'application change le statut du livreur en "disponible"
- l'application modifie le stock du livreur
- l'application envoi au client la notification "Bon appétit"
- l'application envoi au client une enquête de satisfaction

> Recherche de plat
> - le restaurateur demande a rechercher un plat
> - l'application affiche la page de recherche
> - le restaurateur saisit la liste d'ingredients en sa possession
> - le restaurateur demande l'execution de la reherche
> - l'application lance la recherche
> - l'application affiche les résultats
>
> Creation de nouveau plat
> - le restaurateur demande a creer un nouveau plat
> - l'application affiche la page de creation
> - le restaurateur rempli le formulaire de creation de plat
> - le restaurateur valide la creation de ce plat
> - l'application verifie que le formulaire soit complet et bien rempli
> - l'application enregistre son nouveau plat
> - l'application affiche son nouveau plat

---------------------------------

## LES ENTITES

- le restaurateur
- le menu du jour
- les plats
- une image du plat
- le nom du plat
- les ingrédients
- le prix du plat
- le type de plat
- la quantité maximal de plats réalisable
- le livreur
- le statut du livreur
- le stock des plats par livreur
- le client
- la commande
- la liste des plats commandée
- l'adresse de livraison
- le statut de la livraison
- l'itineraire de la livraison
- le temps de livraison

---------------------------------

## LES CLASSES



| Menu |
|------|
| - le nom du plat|
| - le type de plat (plat ou dessert)|
| - la disponibilitee du plat|
| - la quantite de plat en service|
| - la liste d'ingrédient dans le plat|
| - le pri du plat|

| Commandes |
|-----------|
| - les plats commandes|
| - l'adresse de livraison|
| - le prix de la commande|
| - le nom du livreur|
| - le temps de livraison|

>| Paiement|
>|---------|
>| - type de paiement|