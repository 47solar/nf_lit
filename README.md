# This is a beta version of the script

## A simplified version of iptables.
<a><strong><bold>
* Blocking a specific sequence of bytes on a specific port;<br>
* Blocking a specific port;<br>
* Filter the number of connections to a specific port;<br>
* Unblocking a port or bytes;<br>
* View the list of blocks.<br>
</bold></strong></a>

## You must have nftables pre-installed !

## Clone IpLit
``` Shell
git clone https://github.com/47solar/nf_lit.git
cd nf_lit
```

## Example use

![Image alt](https://github.com/47solar/ip_lit/assets/153699315/e3ddc797-4891-467e-9c05-96781ad682bc)


Ban request "attack" on port 80
``` Shell
./NfLit.sh ban INPUT protocol udp port 80 word "root"
```
Ban requests to port 80
``` Shell
./NfLit.sh ban OUTPUT protocol tcp port 80
```
Limiting the number of connections to a specific port
``` Shell
./NfLit.sh filter OUTPUT protocol tcp port 443
```
Unban first chain
``` Shell
./NfLit.sh unban INPUT 1
```
## Arguments
```
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
```
```Created by @47solar```<br>
<br><strong>Telegram : <a href="https://t.me/tungueoffensive">tungue</a></strong>
