#!/bin/bash

# clickable area aliases
CA='%{A:'   # start click area
EC=':}'     # end click area cmd
EA='%{A}'   # end click area

righthard=""
rightsoft=""
lefthard=""
leftsoft=""
skip="0"

vpn() {
#    #mullvad can take long and hang, hence the solution below
#    RUNNING=$(ps ax | grep "mullvad status" | grep -v grep | wc -l)
#    CONN="VPN: no"
#    if [ "$skip" -eq 5 ]; then
#        STATUS=$(cat ~/tmp/vpn_status | grep "Tunnel" | cut -d ":" -f 2 | tr -d " ")
#        LOCATION=$(cat ~/tmp/vpn_status | grep "Location" | cut -d ":" -f 2 | tr -d " ")
#        if [ "$RUNNING" == 0 ]; then
#            mullvad status > ~/tmp/vpn_status 2>&1 &
#        else
#            PROC=$(ps ax | grep "mullvad status" | grep -v grep | sed "s/^ *//" |cut -d " " -f 1)
#            kill -9 "$PROC"
#            mullvad status > ~/tmp/vpn_status 2>&1 &
#        fi
#    else
#        STATUS=$(cat ~/tmp/vpn_status | grep "Tunnel" | cut -d ":" -f 2 | tr -d " ")
#        LOCATION=$(cat ~/tmp/vpn_status | grep "Location" | cut -d ":" -f 2 | tr -d " ")
#    fi
#    if [ ! -z $STATUS ]; then
#        CONN="$STATUS ($LOCATION)"
#    fi
#    VPN=$CONN
#    echo "$VPN"
    echo ""
}
name() {
    HOST=$(hostname)
    LNAME=$(uname -r)
    echo "$HOST - $LNAME"
}
clock() {
    DATETIME=$(date "+%T %a %b %d")
    TIME=$(date "+%T")
    echo "$TIME"
}
mdate() {
    DATE=$(date "+%a %b %d")
    echo "$DATE"
}
battery() {
    BATPERC=$(acpi --battery | cut -d, -f2)
    batt=$(echo "$BATPERC" | tr "\n" " ")
    batt="${batt//%}"
    batt0=$(echo $batt | cut -f1 -d" ")
    batt1=$(echo $batt | cut -f2 -d" ")
    if (( $batt0 < 40)) && (($batt1 < 20)); then
      echo "BAT: %{F#FFFF00}%{B#FF0000}$batt0% $batt1% %{F-}%{B-}"
    else
      #echo "%{F#FFFF00}%{B#00FF00}$batt0% $batt1% %{F-}%{B-}"
      echo "BAT: $BATPERC" | tr "\n" " "
    fi
    echo
}
workspaces() {
    WS=$(~/.config/bspwm/workspaces.py)
    echo "$WS"
}
volume() {
    vol=$(amixer get Master | sed -n 's/^.*\[\([0-9]\+\)%.*$/\1/p'| uniq)
    echo "VOL: $vol%"
}
memory() {
    mem=$(free | grep Mem | awk '{print ($3+$5)/1000000}')
    printf "RAM: %0.2fGB\n" $mem
}
processor() {
    #usage=$(grep 'cpu ' /proc/stat | awk '{print ($2+$4)*100/($2+$4+$5)}' | cut -c1-4 )
    usage=$(top -bn1 | grep "Cpu(s)" | \
           sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
           awk '{print 100 - $1}')
    #line="    "
    echo "CPU: $usage%"
}
wifi() {
    ssid=$(iw dev wlp4s0 info | grep ssid | cut -d" " -f2 | tr -d " ")
    if [ ! -z $ssid ]; then
        echo "WiFi: $ssid"
    else
        echo "WiFi: none"
    fi
}

while true; do

    skip=$((skip+1))
    if [ "$skip" == 6 ]; then
        skip=0
    fi
#   color0=$(xrdb -query -all | grep "*color0:" | sed "s/\*color0:\t//")
#   color1=$(xrdb -query -all | grep "*color1:" | sed "s/\*color1:\t//")
#   color2=$(xrdb -query -all | grep "*color2:" | sed "s/\*color2:\t//")
#   color3=$(xrdb -query -all | grep "*color3:" | sed "s/\*color3:\t//")
#   color4=$(xrdb -query -all | grep "*color4:" | sed "s/\*color4:\t//")
#   color5=$(xrdb -query -all | grep "*color5:" | sed "s/\*color5:\t//")
#   color6=$(xrdb -query -all | grep "*color6:" | sed "s/\*color6:\t//")
#   color7=$(xrdb -query -all | grep "*color7:" | sed "s/\*color7:\t//")
#   color8=$(xrdb -query -all | grep "*color8:" | sed "s/\*color8:\t//")
    data=(
    %{l}
    $(workspaces)
    $righthard

    %{c}
    $lefthard
    $(mdate)
    $rightsoft
    $(clock)
    $rightsoft
    $(wifi)
    $righthard
    $lefthard

    %{r}
    $(battery)
    $(volume)
    $lefthard
    $(processor)
    $lefthard
    $(memory)
    )

    echo ${data[@]}
    sleep 4
done

