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

### Elaborer le menu du jour
- le __restaurateur__ demande à créer le __menu du jour__
- l'__application__ affiche la __liste des plats__
  * une __image__ du plat
  * le __nom__ du plats
  * la __liste d'ingrédients__
  * le __prix__ du plat
  * le __type__ de plat
- le restaurateur sélectionne le ou les __plats__ dans la liste
- l'application enregistre le ou les __plats sélectionnés__
- le restaurateur demande la __liste des plats sélectionnés__
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
- le restaurateur confirme la liste de livreur et la quantité de plat à préaprer
- l'application affiche le __stock de plat__ à fournir à chaque livreur
- le livreur demande à récuperer son stock de plat
- l'application affiche le stock de plat qu'il doit récupérer
- l'application envoi une alerte au restaurateur de préparer le stock de plat du livreur
- le livreur valide le stock de plat reçu
- l'application met le statut du livreur en "disponible" 

### Commande et livraison de repas
- le __client__ demande à voir le __menu du jour__
- l'__application__ affiche le __menu du jour__
- le client sélectionne un ou plusieurs plats
- l'application affiche le ou les __plats sélectionnés__
- l'application affiche un formulaire pour connaitre le __nombre de plats à livrer__
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
  * __plats sélectionné__
  * __adresse de livraison__
  * __temps de livraison__ estimé
  * identité du __client__
- le livreur valide la __livraison__
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

|Restarateur|
|---|
| |

|Menu du jour|
|---|
| |

|Liste des plats|
|---|
| |

|Image|
|---|
| - Nom du fichier: string|

|Plat|
|---|
| - Nom: string|
| - Liste ingrédient: string|
| - Prix: number|
| - Type: string|

|Plat sélectionné|
|---|
| |

|Liste des plats sélectionnés|
|---|
| |

|Quantité de plat réalisable|
|---|
| |

|Livreur|
|---|
| - Statut |

|Liste de livreur|
|---|
| |

|Liste de livreur actif|
|---|
| |

|Quantité de plat à préparer|
|---|
| |

|Stock de plat|
|---|
| |

|Client|
|---|
| - Adresse|
| - Pseudo|

|Nombre de plat à livrer|
|---|
| |

|Commande|
|---|
| |

|Livraison|
|---|
| - Itinéraire|
| - Temps|
| - Statut|