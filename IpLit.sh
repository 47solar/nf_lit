#!/bin/bash
if [ "$1" == "--help" ]||[ "$1" == "-h" ]
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
	
Exapmle use:

./IpLit.sh --ban INPUT --protocol udp --port 80 --word \"attack\"  //ban request \"attack\" on port 80 and protocol udp
./IpLit.sh --ban OUTPUT --protocol tcp --port 80     		   //ban requests to port 80 and protocol tcp
./IpLit.sh --unban INPUT 1                               	   //unban first chain
./IpLit.sh --filter OUTPUT --protocol tcp --port 443 --quan 3      //Limiting the number of connections to a specific port
Arguments:

--ban        -b         add port or word to the blacklist
        INPUT           incoming traffic
        OUTPUT          outgoing traffic
        FORWARD         traffic passing through the system
--unban      -u         unlock the word or port
        INPUT, OUTPUT, FORWARD
        [name or num]               like --unban INPUT 4
    --port       -p         specify the required port
    --protocol   -P         data transfer protocol (tcp, udp, etc...)
    --word       -w         argument is the desired word
                                    like --word \"porn\"
--list       -L         displays a list of all locks
--filter     -f         limiting the number of connections to a specific port
    --quan       -a         number of connections"
elif [ "$1" == "--list" ]||[ "$1" == "-L" ]
then
	sudo /sbin/iptables --list --line-numbers 
elif [ "$1" == "--ban" ]||[ "$1" == "-b" ]&&[ "$2" == "INPUT" ]||[ "$2" == "OUTPUT" ]||[ "$2" == "FORWARD" ]&&[ "$3" == "--protocol" ]||[ "$3" == "-P" ]&&[ "$5" == "--port" ]||[ "$5" == "-p" ]
then
	sudo /sbin/iptables -A "$2" -p "$4" --dport "$6" -j DROP
	echo "
	Completed!"
elif [ "$1" == "--ban" ]||[ "$1" == "-b" ]&&[ "$2" == "INPUT" ]||[ "$2" == "OUTPUT" ]||[ "$2" == "FORWARD" ]&&[ "$3" == "--protocol" ]||[ "$3" == "-P" ]&&[ "$5" == "--word" ]||[ "$5" == "-w" ]
then 
	sudo /sbin/iptables -I "$2" -p "$4" -m string --string "$6" --algo bm -j DROP
	echo "
	Completed!"
elif [ "$1" == "--unban" ]||[ "$1" == "-u" ]&&[ "$2" == "INPUT" ]||[ "$2" == "OUTPUT" ]||[ "$2" == "FORWARD" ]
then
	sudo /sbin/iptables -D "$2" "$3"
	echo "
	Completed!"
elif [ "$1" == "--filter" ]||[ "$1" == "-f" ]&&[ "$3" == "INPUT" ]||[ "$3" == "OUTPUT" ]||[ "$3" == "FORWARD" ]&&[ "$4" == "--protocol" ]||[ "$4" == "-P" ]&&[ "$6" == "--port" ]||[ "$6" == "-p" ]&&[ "$8" == "--quan" ]||[ "$8" == "-q" ]
then
	sudo /sbin/iptables -t filter -I "$3" -p "$5" --syn --dport "$7" -m connlimit --connlimit-above "$9" -j DROP
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
