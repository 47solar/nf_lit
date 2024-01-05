# This is a beta version of the script

## A simplified version of iptables.
<a><strong><bold>
* Locking a specific sequence of bytes on a specific port.<br>
* Blocking a specific port.<br>
* Unblocking a port or bytes.<br>
* View the list of locks.<br>
</bold></strong></a>

## You must have iptables pre-installed !

## Install git :
```
git clone https://github.com/47solar/ip_lit.git
cd ip_lit
```

## Example use :

![Image alt](https://github.com/47solar/ip_lit/assets/153699315/ae7813ef-9363-4afb-8828-ce5523cce0d2)

Ban request "attack" on port 80 :
```
./IpLit.sh -b INPUT -P udp -p 80 -w "attack"
```
Ban requests to port 80 :
```
./IpLit.sh -b OUTPUT -P tcp -p 80
```
Unban first chain :
```
./IpLit.sh -u INPUT 1
```
## Arguments :
```
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
                                    like --word "porn"
--list       -L         displays a list of all locks
```
```Created by @47solar```<br>
<br><strong>Telegram : <a href="https://t.me/tungueoffensive">tungue</a></strong>
