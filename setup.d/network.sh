#!/bin/bash

ID='Wired connection 1'
ID_NEW='eth0'
IP='192.168.1.11/24'
GATEWAY='192.168.1.1'
DNS='8.8.8.8'

sudo nmcli connection modify \'$ID\' connection.id $ID_NEW ipv4.method manual ipv4.address $IP ipv4.gateway $GATEWAY  ipv4.dns $DNS

sudo nmcli device disconnect enp03
sudo nmcli device connect enp03

