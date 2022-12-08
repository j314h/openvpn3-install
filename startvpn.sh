#!/bin/bash

source ./openvpn3-install/startvpn.conf.sh

echo 
echo "===== Lancement connexion vpn Vattenfall (openvpn3) ====="
echo 

# open connection openvpn
openvpn3 session-start --config $DIR_KEY_OPENVPN

confirm()
{
    read -r -p "${1} [y/N] " response

    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

echo
echo "===== Etat de votre connexion au vpn ====="
echo

sleep 5

if confirm "Connexion réussi ?"; then
	echo
	
	# set ipv
	nmcli con mod "${NAME_NMCLI_CONNECTION}" ipv4.dns "10.42.0.101 10.42.0.102"
	echo "--> Configuration IPV4 => OK"

	# set dns filaire home jha
	sudo resolvectl dns $LINK 10.42.0.101 10.42.0.102
	echo "--> Set dns pour :" $LINK "avec 10.42.0.101 10.42.0.102 => OK"
	
	# restart network
	sudo service NetworkManager restart
	echo "--> Restart NetworkManager => OK"
	
	# message end
	echo
	echo "===== DNS et connexion VPN Vattenfall réussi ====="
	echo
else
    echo "Une erreur est survenu soit le path de la clef openvpn ne corresponds pas /n 
    soit il y a eu une erreur de connexion avec vos identifiants"
fi




