#!/bin/bash
if [ $1 == "--help" ]||[ $1 == "-h" ]
then
	echo "
  =====================================================
 ||--------------------------------------------------||
 ||>|>  					     ||  Created by:   tungue
 ||         #####	     #####   ############### ||  Telegram:     https://t.me/tungueoffensive
 ||        #####            #####   ###############  ||  GitHub:       https://github.com/47solar
 ||       #####                         #####        ||
 ||      #####            #####        #####         ||
 ||     #####            #####        #####          ||
 ||    #####            #####        #####           ||
 ||   #####     ####   #####        #####            ||
 ||  ##############   #####        #####             ||
 || ##############   #####        #####              ||
 ||						<|<|<||
 ||__________________________________________________||
 =====================================================
 
Help list
	
exapmle use:

./test.sh --ban INPUT --port 80 --sring \"attack\"  //ban request \"attack\" on port 80
./test.sh --ban OUTPUT --protocol tcp --port 80     //ban requests to port 80
./test.sh -u INPUT 1                                //unban first chain

--ban        -b         add port or word to the blacklist
	INPUT           incoming traffic
	OUTPUT          outgoing traffic
	FORWARD         traffic passing through the system
--unban      -u         unlock the word
	[name or num]               like --unban INPUT 4
--port       -p         specify the required port
--protocol   -P	        data transfer protocol (tcp, udp, etc...)
--word       -w         argument is the desired word
		                    like --string \"porn\"
--list       -L         displays a list of all locks"
elif [ $1 == "--list" ]||[ $1 == "-L" ] 
then
	sudo /sbin/iptables --list --line-numbers 
elif [ $1 == "--ban" ]||[ $1 == "-b" ]&&[ $2 == "INPUT" ]||[ $2 == "OUTPUT" ]||[ $2 == "FORWARD" ]&&[ $3 == "--protocol" ]||[ $3 == "-P" ]&&[ $5 == "--port" ]||[ $5 == "-p" ]
then
	sudo /sbin/iptables -A "$2" -p "$4" --dport "$6" -j DROP
	echo "
	Completed!"
elif [ $1 == "--ban" ]||[ $1 == "-b" ]&&[ $2 == "INPUT" ]||[ $2 == "OUTPUT" ]||[ $2 == "FORWARD" ]&&[ $3 == "--protocol" ]||[ $3 == "-P" ]&&[ $5 == "--word" ]||[ $5 == "-w" ]
then 
	sudo /sbin/iptables -I "$2" -p "$4" -m string --string "$6" --algo bm -j DROP
	echo "
	Completed!"
elif [ $1 == "--unban" ]||[ $1 == "-u" ]&&[ $2 == "INPUT" ]||[ $2 == "OUTPUT" ]||[ $2 == "FORWARD" ]
then
	sudo /sbin/iptables -D "$2" "$3"
	echo "
	Completed!"
else
	echo "
	Error: bad request" 
	echo "
For help enter --help or -h
"
fi
exit 0
