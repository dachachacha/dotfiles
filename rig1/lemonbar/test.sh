STATUS=$(cat ~/tmp/vpn_status | grep "Tunnel" | cut -d ":" -f 2 | tr -d " ")
LOCATION=$(cat ~/tmp/vpn_status | grep "Location" | cut -d ":" -f 2 | tr -d " ")
echo $STATUS
echo $LOCATION
