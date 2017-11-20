#!/bin/bash
# Dangerous script changing configuration in Raspberries
# very dangerous
#full_ip=192.168.1.$1

  ip1=1
for ((ip2=1;ip2<=180;ip2++)); do
    full_ip=192.168."$ip1"."$ip2"

  ## update fstab
  ssh -o "StrictHostKeyChecking no" pi@"$full_ip" "sudo rm /etc/fstab"
  scp -o "StrictHostKeyChecking no" fstab pi@"$full_ip":./fstab
  ssh -o "StrictHostKeyChecking no" pi@"$full_ip" "sudo mv fstab /etc/fstab"
  
  scp -o "StrictHostKeyChecking no" S05checkroot.sh pi@"$full_ip":./S05checkroot.sh
  ssh -o "StrictHostKeyChecking no" pi@"$full_ip" "sudo mv S05checkroot.sh /etc/rcS.d/"
  
  scp -o "StrictHostKeyChecking no" S06checkfs.sh pi@"$full_ip":./S06checkfs.sh
  ssh -o "StrictHostKeyChecking no" pi@"$full_ip" "sudo mv S06checkfs.sh /etc/rcS.d/"
 
  
  ssh -o "StrictHostKeyChecking no" pi@"$full_ip" "sudo reboot"
done
exit 0