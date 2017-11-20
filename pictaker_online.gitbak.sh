#!/bin/bash
# Taking pictures and retreiving them from cameras
# if there is no activatorfile, will selftest and report
XSEC=
cloud_ip_port=
#Infinite while loop so I can consider myself a programmer
while :
do

#Download files needed for the thing to work

curl -H """$XSEC""" ""$cloud_ip_port""/activatorfile > /tmp/activatorfile

curl -H """$XSEC""" ""$cloud_ip_port""/pic_settings > /tmp/pic_settings


# Test if activator file exists, and run picture taking if so
# Detector code starts
if cat /tmp/activatorfile | grep A01;
then

rm /tmp/activatorfile
curl -H """$XSEC""" -X POST ""$cloud_ip_port""/activatorfile

echo -e "PRINTING LOTS OF GARBAGE ON YOUR TERMINAL..."





#run with old settings unless new are present
  mv /tmp/pic_settings /tmp/pic_settings_old
  params_jpg=$(cat /tmp/pic_settings_old)



# Clean up after last nights party
  rm -R /tmp/*

  
#Defining variables
  time_stamp=$(date +'%Y%m%d%H%M%S')
 
  
  
  ip1=1

  
#Beginning of picture taking
  for ((ip2=1;ip2<=180;ip2++)); do
    full_ip=192.168."$ip1"."$ip2"
    params_name=""Cam""$ip2""_MT""$time_stamp"".jpg""
    full_params=""$params_jpg""""$params_name""
    localdir=/tmp/pic_download/MT""$time_stamp""/
    localpic=""$localdir""Cam""$ip2""_MT""$time_stamp"".jpg
  
  
#Prepare folders
  mkdir -p /tmp/pic_download/MT""$time_stamp""/  
  ssh -o "StrictHostKeyChecking no" pi@"$full_ip" "rm -R /tmp/camera_jpg/*"
  ssh -o "StrictHostKeyChecking no" pi@"$full_ip" "mkdir -p /tmp/camera_jpg" 
  
  
#Run camera
  ssh -o  "StrictHostKeyChecking no" pi@"$full_ip" "raspistill ""$full_params"" " &
  
  
#Wait before transffering and compressing, but continue to next cam
  
  sleep 20 && scp -o "StrictHostKeyChecking no" pi@"$full_ip":/tmp/camera_jpg/*.jpg ""$localdir"" &
  
  sleep 25 && nice convert $localpic -quality 75% $localpic &

  done

#Put pictures into Tar archive and delete the original files
  sleep 60
  tar -cvvf /tmp/pic_download/MT""$time_stamp"".tar ""$localdir""*
  sleep 1
  rm -R ""$localdir""

#Transfer the tar file and do md5
  curl -H """$XSEC""" -T /tmp/pic_download/MT""$time_stamp"".tar ""$cloud_ip_port""
  md5sum /tmp/pic_download/MT""$time_stamp"".tar > /tmp/pic_download/MT""$time_stamp"".tar.md5
  curl -H """$XSEC""" -T /tmp/pic_download/MT""$time_stamp"".tar.md5 ""$cloud_ip_port""

#Detector code is ending  
else echo "Nothing to do at $(date), running tests"
fi

#running ssh tests
        time_stamp=$(date +'%Y%m%d%H%M%S')
        ip1=1
        sleep 2 && rm /tmp/selftest*
        touch /tmp/selftest""$time_stamp""
	for ((ip2=1;ip2<=180;ip2++)); do
	full_ip=192.168."$ip1"."$ip2"
	if ssh -o "StrictHostKeyChecking no" -q -o BatchMode=yes -o ConnectTimeout=1 pi@"$full_ip" "echo testing cam""$ip2""";
	then echo "cam""$ip2"" is ok" >> /tmp/selftest""$time_stamp"";
	else echo "cam""$ip2"" is down" >> /tmp/selftest""$time_stamp"";
	fi
        done
#Upload self-test
curl -H """$XSEC""" -T /tmp/selftest""$time_stamp"" ""$cloud_ip_port""


# end of infinite while loop
sleep 10 #minimum pollrate in seconds
done

exit 0
