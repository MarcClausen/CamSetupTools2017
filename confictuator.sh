#!/bin/bash
# Dangerous script changing configuration in Raspberries
# very dangerous
#full_ip=192.168.1.$1


    full_ip=192.168.1.$1


   #picture taking part

  ssh -o "StrictHostKeyChecking no" pi@"$full_ip" "sudo sysctl vm.dirty_writeback_centisecs=1"
  ssh -o "StrictHostKeyChecking no" pi@"$full_ip" "sudo sysctl vm.dirty_writeback_centisecs=1"

  ## update fstab
  ssh -o "StrictHostKeyChecking no" pi@"$full_ip" "sudo rm /etc/fstab"
  scp -o "StrictHostKeyChecking no" fstab pi@"$full_ip":./fstab
  ssh -o "StrictHostKeyChecking no" pi@"$full_ip" "sudo mv fstab /etc/fstab"

  #ssh -o "StrictHostKeyChecking no" pi@"$full_ip" "sudo "

  #ssh -o "StrictHostKeyChecking no" pi@"$full_ip" "sudo "
exit 0
