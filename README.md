# ip_lit
#
#exapmle use:
#
#./test.sh --ban INPUT --port 80 --sring "attack"  //ban request "attack" on port 80
#./test.sh --ban OUTPUT --protocol tcp --port 80   //ban requests to port 80
#./test.sh -u INPUT 1                              //unban first chain
#
#--ban        -b         add port or word to the blacklist
        INPUT           incoming traffic
        OUTPUT          outgoing traffic
        FORWARD         traffic passing through the system
#--unban      -u         unlock the word
        [name or num]               like --unban INPUT 4
#--port       -p         specify the required port
#--protocol   -P         data transfer protocol (tcp, udp, etc...)
#--word       -w         argument is the desired word
#                                    like --string "porn"
#--list       -L         displays a list of all locks
