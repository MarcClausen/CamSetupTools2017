#!/bin/bash
#Taking pictures and retreiving them from cams

echo -e "TAKING PICTURES AND STARTING TRANSFERS"
echo

ip1=1
for ((ip2=1;ip2<=180;ip2++)); do
    full_ip=192.168."$ip1"."$ip2"

  ssh -o "StrictHostKeyChecking no" pi@"$full_ip" "sudo reboot"

done
