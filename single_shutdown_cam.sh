#!/bin/bash
#Taking pictures and retreiving them from cams

echo -e "SHUTTING DOWN CAMERAS"
echo

    full_ip=192.168.1.$1


  ssh -o "StrictHostKeyChecking no" pi@"$full_ip" "sudo shutdown -h now" &


