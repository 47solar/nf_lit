# You must have iptables pre-installed !

## Example use :

```Ban request "attack" on port 80 :
        ./test.sh -b INPUT -p 80 -w "attack"

Ban requests to port 80 :
        ./test.sh -b OUTPUT -P tcp -p 80
        
Unban first chain :
        ./test.sh -u INPUT 1
```

```Created by @47solar ```
Telegram: <url href="https://t.me/tungueoffensive">tungue</url>
