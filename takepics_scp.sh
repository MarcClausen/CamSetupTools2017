#!/bin/bash
#Taking pictures and retreiving them from cams
#this script calls takepics_scp2.sh

echo -e "TAKING PICTURES AND STARTING TRANSFERS"
echo
ip1=1
for ((ip2=$1;ip2<=$1;ip2++)); do
    full_ip=192.168."$ip1"."$ip2"

    # Test if device is up, and only perform task if its up
    if ping -c 1 -W 1 $full_ip | grep 100%;
    then echo -e "WARNING! - The camera $full_ip is down"

    else echo -e "Camera $full_ip is up. Capturing...";chmod 777 ./takepics_scp2.sh && . ./takepics_scp2.sh;

    fi

done
# flite_cmu_us_slt "You may resume working over the plants. See you in 10 minutes"


