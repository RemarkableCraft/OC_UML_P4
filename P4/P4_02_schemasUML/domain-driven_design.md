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

### Restaurateur
	--> Livrer des plats de qualité à domilcile
	--> Faire le menu du jour
	--> Préparer et conditionner 2 plats et 2 desserts
	--> Transmettre les plats aux livreurs

### Livreur
	--> "Marauder" dans les rues en attendant une livraison
	--> Livrer les commandes le plus rapidement possible (moins de 20min)

### Client
	--> Commander un ou plusieurs plats

---------------------------------

## LEURS ACTIONS
- [x] *\( sur l'application\)*

### Restaurateur
- [x] Elaborer le menu du jour (choix de 2 plats et 2 desserts)
- [ ] Réaliser et conditionner les plats
- [ ] Transmettre les différents plats aux livreurs
- [x] Mettre en ligne le menu

### Livreur
- [x] Réceptionner les plats
- [ ] Se déplacer dans la ville
- [x] Consulter les commandes clients
- [ ] Livrer la commande le plus rapidement possible (- de 20min)
- [x] Confirmer la livraison de commande

### Client
- [x] Consulter le menu du jour
- [x] Commander un ou plusieurs plats dans son panier
- [ ] _Payer sa commande_
- [x] Réceptionner sa commande

---------------------------------

## DESCRIPTION DES CAS D'UTILISATION

### Élaborer le menu du jour
- le __restaurateur__ demande à créer le __menu du jour__
- l'__application__ affiche la __liste des plats__
  * une __image__ du plat
  * le __nom__ du plats
  * la __liste d'ingrédients__
  * le __prix__ du plat
  * le __type__ de plat
- le restaurateur sélectionne le ou les __plats__ dans la liste
- l'application enregistre le ou les __plats sélectionnés__
- l'application affiche la liste des plats sélectionnés
- le restaurateur entre la __quantités réalisable__ de chaque plats
- le restaurateur valide son menu
- l'application enregistre les plats sélectionnés et les quantités réalisable
- l'application affiche le menu du jour final
- l'application mais en ligne le menu
- l'application envoie une notification aux clients

### Réassort des livreurs
- le __restaurateur__ demande des __livreurs__
- l'__application__ envoie une alerte "besoin de livreur" à la __liste de livreur__
- le __livreur__ demande à ouvrir l'alerte
- l'application affiche le __*formulaire de statut*__ du livreur
- le livreur valide son __statut__ d'actif
- l'application change le statut du livreur en "actif"
- L'application compte le nombre de livreur dans la __liste de livreur actif__
- l'application stop la recherche de livreur si celui ci atteint la __quantité réalisable__ de plat défini par le restaurateur
- l'application calcul la __quantité de plat à préparer__ que doit faire le restaurateur
- l'application affiche au restaurateur la liste de livreur et la quantité de plat à préparer
- le restaurateur confirme la liste de livreur et la quantité de plat à préparer
- le restaurateur notifie que les plat sont prêts
- le livreur demande à récuperer son stock de plat
- l'application envoi une alerte au restaurateur de préparer le stock du livreur
- l'application affiche au livreur et au restaurateur le stock de plat qu'il doit récupérer
- le livreur valide le stock de plat reçu
- l'application met le statut du livreur en "disponible" 

### Commande et livraison de repas
- le __client__ demande à voir le __menu du jour__
- l'__application__ affiche le __menu du jour__
- le client sélectionne un ou plusieurs plats
- l'application affiche le ou les __plats commandés__
- l'application affiche un formulaire pour connaitre la __quantité de plats commandés__
- le client entre le nombre de plats à liver
- le client valide la __commande__ de ce ou ces plats sélectionnés
- l'application enregistre la commande
- l'application affiche la synthese de la commande
- l'application demande une validation de la commande au clients
- le client valide la commande
- l'application valide la commande
- l'application recherche un __livreur__ dont le __statut__ est "disponible"
- l'application verifie si le livreur à dans son __stock de plat__ le nombre de plat de la commande
- l'application calcul le meilleur __itineraire__ et le __temps de livraison__
- l'application envoie une alerte de "nouvel commande" au livreur le plus proche
- le livreur demande à consulter les informations de la commande
- l'application affiche la synthèse de la commande
  * __plats commandés__ et la __quantité de plats commandés__
  * __adresse de livraison__
  * __temps de livraison__ estimé
  * identité du __client__
- le livreur valide la __commande__
- l'application enregistre la validation de la livraison
- l'application change le statut du livreur en "en cour de livraison"
- l'application affiche au livreur le meilleur itineraire et le temps estimé
- l'application affiche au client la prise en charge de sa commande et le temps estimé d'attente
- le livreur demande à valider la __fin de livraison__ de la commande
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
- la liste des plats
- les plats
- une image du plat
- le nom du plat
- les ingrédients
- le prix du plat
- le type de plat
- les plats séléctionnés
- la liste des plats séléctionnés
- la quantité de plats réalisable
- le livreur
- le statut du livreur
- la liste de livreur "actif"
- la quantité de plat à préparer
- le stock des plats par livreur
- le client
- la commande
- les plats commandée
- la quantité des plats commandés
- l'adresse de livraison
- le statut de la livraison
- l'itineraire de la livraison
- le temps de livraison
- la fin de livraison

---------------------------------

## LES CLASSES

|Menu|
|---|
| - plat_menu: *id\_plat*|
| - qte_plat_menu: *nombre*|

|Media|
|---|
| - nom_fichier: *texte*|
| - type_fichier: *texte*|

|Plat|
|---|
| - nom_plat: *texte*|
| - ingrédient_plat: *texte*|
| - prix_plat: *nombre*|
| - type_plat: *texte*|
| - image_plat: *id\_media*|

|Livreur|
|---|
| - statut_livreur: *texte*|
| - pseudo_livreur: *texte*|
| - mail_livreur: *texte*|
| - localisation_livreur: *id\_adresse*|

|Stock|
|---|
| - plat_stock: *id\_plat*|
| - livreur_stock: *id\_livreur*|
| - qte_plat_stock: *nombre*|

|Client|
|---|
| - pseudo_client: *texte*|
| - domicile_client: *id\_adresse*|
| - bureau_client: *id\_adresse*|
| - telephone_client: *nombre*|
| - mail_client: *texte*|

|Adresse|
|---|
| - num_voie: *nombre*|
| - nom_voie: *texte*|
| - code_postal: *texte*|
| - nom_ville: *texte*|

|Commande|
|---|
| - client_cde: *id\_client*|
| - plat_cde: *id\_plat*|
| - qte_plat_cde: *nombre*|
| - prix_cde: *nombre*|
| - livreur_cde: *id\_livreur*|
| - tps_livraison_cde: *time*|
| - etat_cde: *texte*|