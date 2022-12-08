#!/bin/bash

source ./startvpn.conf.sh

echo
echo "===== Deconnexion au VPN Vattenfall ====="
echo

# close openvpn
openvpn3 session-manage --config $DIR_KEY_OPENVPN --disconnect
echo "-----> Deconnexion VPN => OK"

### reset ipv4 and restart network and reset dns ###
nmcli con mod "${NAME_NMCLI_CONNECTION}" ipv4.dns "8.8.8.8"
echo "-----> Reset IPV4 => OK"

sudo service NetworkManager restart
echo "-----> Restart NetworkManager => OK"

# set dns
sudo resolvectl dns $LINK 8.8.8.8
echo "-----> Restart Dns" $LINK "=> OK"

echo
echo "===== Deconnexion réussi ====="
echo
