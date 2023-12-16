# You must have iptables pre-installed !

## Example use :

Ban request "attack" on port 80 :
```
        ./test.sh -b INPUT -p 80 -w "attack"
```
Ban requests to port 80 :
```
        ./test.sh -b OUTPUT -P tcp -p 80
```
Unban first chain :
```
        ./test.sh -u INPUT 1
```
## Arguments :
```
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
```

```Created by @47solar (tungue) ```
Telegram: <a href="https://t.me/tungueoffensive">tungue</a>
