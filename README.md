# Instruction pour connexion et configuration openvpn3 ubuntu (22.04 testé)

## Prérequis  

- ubuntu 20, 22  
- resolvectl d'installé

## Ajout des fichiers sur votre machine

- cloner ce repos dans votre home (~/)

## Configuration du chemin de la clef OPENVPN 

- Après avoir télécharger et enregistré le fichier obtenu au moment de la connexion avec OPENVPN3 CLOUD
indiquer son chemin d'enregistrement dans le fichier `~/openvpn3-install/startvpn.conf.sh` dans la variable `DIR_KEY_OPENVPN`

## Configuration du nom de connexion 

- executer la commande
```shell
$ nmcli connection show
```

- copier le nom de la connexion en cours, coller cette valeur dans le fichier `~/openvpn3-install/startvpn.conf.sh` dans la variable `NAME_NMCLI_CONNECTION`

## Configuration du lien 

- toujours avec la commande ci-dessus copier le nom de la colonne " DEVICE " de la connexion en cours

- coller cette valeur dans le fichier `~/openvpn3-install/startvpn.conf.sh` dans la variable `LINK`

## Demarrer / Connecter le VPN

- la partie configuration doit etre terminé
- dans un terminal à la racine (~/) executer `./openvpn3-install/startvpn.sh`
- le navigateur s'ouvre => identifier vous
- retourner dans le terminal et répondre à la question (y ou N)
- VOUS ETES CONNECTE

## Stop VPN avec reset DNS 

- dans un terminal à la racine (~/) executer `./openvpn3-install/closevpn.sh`
- VOUS ETES DECONNECTE
