
#!/bin/bash


	ip1=1
for ((ip2=1;ip2<=180;ip2++)); do
    full_ip=192.168."$ip1"."$ip2"
#
if ping -c 1 -W 1 -i 0.2 $full_ip | grep -w 100%;
then echo -e "$full_ip" ;

else echo ok > /dev/null

fi
	done
done
# flite_cmu_us_slt "You may resume working over the plants. See you in 10 minutes"
