#!/bin/bash
# DynDNS (dyndns2) updater
# jimakker @ HACKmildegia

USER="YOUR_DDNS_USER" # set this in your DynDNS service provider
PASS="YOUR_DDNS_PASS" # set this in your DynDNS service provider
HOST="YOUR_DDNS_HOSTNAME" # set this in your DynDNS service provider
CHECK="http://checkip.dyndns.com/" # you can use another service (eg. your own)
NIC="https://www.ovh.com/nic/update" # you may use your dyndns2 provider's url
LOG="update.log" # use /dev/null if you don't need a log

TMP_IP=$(curl --silent  $CHECK)
# The following line parses IP address from http://checkip.dyndns.com/
# If you are another ip check you may have to change/remove this
TMP_IP=${TMP_IP:76:-15}

read -r IP < ip
if [ "$TMP_IP" != "$IP" ]; then
	curl --silent --user $USER:$PASS \
	  -d "system=dyndns&hostname=$HOST&myip=$TMP_IP" $NIC \
	| xargs -L 1 echo $(date)  >> $LOG
	echo $TMP_IP > ip
fi