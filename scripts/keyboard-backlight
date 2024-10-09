#!/bin/bash

outstring=$(brightnessctl -l)
declare -a devices
for (( i=0; i<50 ; i++ ));
do
	devices[$i]=${outstring#*"Device '"}
	devices[$i]=${devices[$i]%%"' of"*}
	outstring=${outstring#*"Device '"}
	if [ $i -gt 0 ];
	then
		if [ ${devices[$i]} == ${devices[$i-1]} ];
		then
			unset devices[$i]
			break
		fi
	fi
done

i=0
declare -a scrlckdevices #array to store scrolllock device names only
for device in ${devices[@]}; 
do
	if [ ${device#*"::"} == "scrolllock" ];
	then
		scrdevices[$i]=$device
		#echo ${scrdevices[$i]}
		i=$i+1
	fi
	echo ${device}
done
keyboardled=${scrdevices[0]}
while [ 1 ]
do
	bright=$(brightnessctl get -d "${keyboardled}")
	if [ $bright == 0 ]
	then
		sudo brightnessctl -d "${keyboardled}" set 1
	fi
    	sleep 0.5
done
exit 0
