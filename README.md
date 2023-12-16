# You must have iptables pre-installed !

Example use :

Ban request "attack" on port 80 :
       --ban INPUT --port 80 --sring "attack"
Ban requests to port 80 :
        ./test.sh --ban OUTPUT --protocol tcp --port 80
Unban first chain:
        ./test.sh -u INPUT 1

--ban        -b         add port or word to the blacklist
        INPUT           incoming traffic
        OUTPUT          outgoing traffic
        FORWARD         traffic passing through the system
--unban      -u         unlock the word
        [name or num]               like --unban INPUT 4
--port       -p         specify the required port
--protocol   -P         data transfer protocol (tcp, udp, etc...)
--word       -w         argument is the desired word
                                    like --string "porn"
--list       -L         displays a list of all locks
