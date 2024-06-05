#!/bin/bash
chmod +x NfLit.sh
if [ "$1" == "help" ]||[ "$1" == "h" ]
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

./test.sh ban INPUT protocol udp port 80 word \"attack\"  //ban request \"attack\" on port 80
./test.sh ban OUTPUT protocol tcp port 80              //ban requests to port 80
./test.sh unban INPUT 1                               //unban first chain

ban         add port or word to the blacklist
                INPUT           incoming traffic
                OUTPUT          outgoing traffic
                FORWARD         traffic passing through the system

unban       unlock the word or port
                INPUT, OUTPUT, FORWARD [name or num]               
				like --unban INPUT 4

port        specify the required port

protocol    data transfer protocol (tcp, udp, etc...)

word        argument is the desired word
                like word \"porn\"

list        displays a list of all locks

help        show this hint"
elif [ "$1" == "list" ]
then
	echo ""
	list(){
	sudo /sbin/nft list tables
	}
	list
elif [ "$1" == "help" ]
then
	echo ""
	helpt(){
	sudo /sbin/nft -a list ruleset
	}
	helpt
elif [ "$1" == "delete" ] && [ "$2" == "table" ] && ([ "$3" == "ip" ] || [ "$3" == "inet" ] || [ "$3" == "arp" ]) && [ "$4" == "$4" ]
then
	echo ""
	del_table(){
	sudo /sbin/nft delete table "$3" handle "$4"
	}
	del_table "$@" "$@"
	echo "
	Succefully! Table \""$3"\" has been deleted."
elif [ "$1" == "delete" ] && [ "$2" == "rule" ] && ([ "$3" == "ip" ] || [ "$3" == "inet" ] || [ "$3" == "arp" ]) && ([ "$4" == "filter" ] || [ "$4" == "route" ] || [ "$4" == "nat" ]) && ([ "$5" == "output" ] || [ "$5" == "input" ]) && [ "$6" == "$6" ] 
then
	echo ""
	del_rule(){
	sudo /sbin/nft delete rule "$3" "$4" "$5" handle "$6"
	}
	del_rule "$@" "$@" "$@" "$@"
	echo "
	Succefully! Rule \""$3" handle "$4" in "$5"\" has been deleted."
elif [ "$1" == "delete" ] && [ "$2" == "chain" ] && ([ "$3" == "ip" ] || [ "$3" == "inet" ] || [ "$3" == "arp" ]) && [ "$4" == "$4" ]
then
	echo ""
	del_chain(){
	sudo /sbin/nft delete chain "$3" handle "$4"
	}
	del_chain "$@" "$@"
	echo "
	Succefully! Chain \""$3"\" has been deleted."
elif [ "$1" == "create" ] && [ "$2" == "table" ] && ([ "$3" == "filter" ] || [ "$3" == "route" ] || [ "$3" == "nat" ])
then
	echo ""
	add_table(){
	sudo /sbin/nft add table "$3"
	}
	add_table "$@"
	echo "
	Succefully! Table \""$3"\" has been added."
elif [ "$1" == "add" ] && [ "$2" == "chain" ] && ([ "$3" == "ip" ] || [ "$3" == "inet" ] || [ "$3" == "arp" ]) && ([ "$4" == "filter" ] || [ "$4" == "route" ] || [ "$4" == "nat" ]) && ([ "$5" == "output" ] || [ "$5" == "input" ])
then
	echo ""
	add_chain(){
	sudo /sbin/nft add chain "$3" "$4" "$5"
	}
	add_chain "$@" "$@" "$@"
	echo "
	Succefully! Chain \""$3" handle "$4"\" has been added."

elif [ "$1" == "add" ] && [ "$2" == "rule" ] && ([ "$3" == "ip" ] || [ "$3" == "inet" ] || [ "$3" == "arp" ]) && ([ "$4" == "route" ] || [ "$4" == "filter" ] || [ "$4" == "nat" ]) && [ "$5" == "port" ] && [ "$6" == "$6" ] && ([ "$7" == "output" ] || [ "$7" == "input" ]) && [ "$8" == "$8" ] && ([ "$9" == "tcp" ] || [ "$9" == "udp" ])
then
	echo ""
	add_rule(){
	sudo /sbin/nft insert rule "$3" "$4" "$7" "$9" dport "$6" drop comment \""$8"\"
	}
	add_rule "$@" "$@" "$@" "$@" "$@"
	echo "
	Succefully! Rule \""$3" on port "$4"\" with comment "$8" has been added."
else
	2>/dev/null
	echo "
	|^^^^^^^^^^^^^^^^^^^^^^^^|
	| ERROR: Something wrong |
	|                        |
	| Enter ./NfLit help	 |
	|                        |	
	 ^^^^^^^^^^^^^^^^^^^^^^^^"
fi
exit 0
