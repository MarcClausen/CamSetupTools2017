#!/bin/bash



    full_ip=192.168.1.$1

  
 #ssh -o "StrictHostKeyChecking no" pi@"$full_ip" "mkdir -p /tmp/camera_jpg" 
 
 #ssh -o  "StrictHostKeyChecking no" pi@"$full_ip" "raspistill $params_jpg"
  
 scp -o "StrictHostKeyChecking no" pi@"$full_ip":/etc/rcS.d/S06checkfs.sh ./ 
 
 scp -o "StrictHostKeyChecking no" pi@"$full_ip":/etc/rcS.d/S05checkroot.sh ./ 



done

exit 0
