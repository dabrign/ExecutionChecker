#!/bin/sh
#This script is enable by env variable i set to one
i=1
while [ $i -ne 0 ]
do
	hour=$(date +"%H") #sync with time.ien.it using GMT time ( -1/-2 hours wrt our time)
	min=$(date +"%M")
	echo $hour
	if [ $hour	-lt 18 ]
	then 
		sleep 300 # 300 sec = 5 minutes sleep -- reduce the up time of the cpu during no-working period"
		echo "sleep"
	else
		echo "start a program"
		if $(ps ax | grep Scrip1 | grep -v grep > /dev/null ) -o $(ps ax | grep Script2 | grep -v grep > /dev/null );
		then echo "Everything OK";
		else
			cd /path/to/script;
			nohup ./Script2 &> program1.log ;
			echo "Script2 ReSTARTed";			
		fi
		#ToDo: send an email to Supervisor -- ALARM
	fi
done
		