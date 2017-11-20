#!/bin/bash

#Defining variables
	time_stamp=$(date +'%Y%m%d%H%M%S')
	params_jpg="--nopreview --width 2560 --height 1320 -t 1 -e jpg -o /tmp/camera_jpg/Cam""$ip2""_MT""$time_stamp"".jpg"
echo -e "$(date -Iseconds)\Taking picture....parameters: $full_ip, $params_jpg, $params_png"



	mkdir -pv ./pic_download/jpg/


JPG related transfer
echo
ssh -o "StrictHostKeyChecking no" pi@"$full_ip" "rm -vR /tmp/camera_jpg*"
echo
ssh -o "StrictHostKeyChecking no" pi@"$full_ip" "mkdir -pv /tmp/camera_jpg"
echo
ssh -o "StrictHostKeyChecking no" pi@"$full_ip" "raspistill $params_jpg"
echo
scp -o "StrictHostKeyChecking no" pi@"$full_ip":/tmp/camera_jpg/*.jpg ./pic_download/jpg/
echo
ssh -o "StrictHostKeyChecking no" pi@"$full_ip" "mkdir -pv /tmp/camera_jpg"



