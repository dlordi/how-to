
## visualizza il processo che sta utilizzando una porta
```sh
netstat -altnp | grep $NUM_PORTA
```

## eseguire `top` con autorefresh
```sh
top -d .2
```

## forzare il logout di un utente
```sh
who # per sapere quale pts/ sta usando l'utente in questione
ps -dN|grep $pts # per sapere il PID del session leader
kill -9 $pid_session_leader # per fare il logout!
```

## `/etc/fstab`
per fare il mount di condivisioni samba che hanno degli spazi nel nome, sostituire lo spazio con `\040`
vedi [questo link](http://www.simpit.com/wordpress/?p=626)

## aggiungere spazio di swap
il valore di count è dato da quanti MB si vogliono riservare * 1024 (in questo caso, 512MB * 1024 = 524288)
```sh
dd if=/dev/zero of=/swapfile1 bs=1024 count=524288
mkswap /swapfile1
chown root:root /swapfile1
chmod 0600 /swapfile1
swapon /swapfile1
```
in `/etc/fstab`
```txt
/swapfile1 swap swap defaults 0 0
```

## creazione di un disco di 8GB in memoria
```sh
mount -t tmpfs tmpfs /mnt/ramdisk -o size=8192M
```

## configurazione `bash` in `.bash_profile`
```txt
alias ..='cd ..'
shopt -s histappend
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
alias gta='git add -A'
alias gtc='git commit -m'
alias gtd='git diff'
alias gtl='git log'
alias gts='git status -s'
```

## per terminare una shell ma scollegare i processi lanciati senza nohup in modo che non vengano terminati
```sh
disown -a && exit
```

## sicurezza, `firewalld` e `firewall-cmd`
- file utili:
  - log: `/var/log/firewalld`
  - unit del servizio: `/usr/lib/systemd/system/firewalld.service`
  - variabili usati dalla unit del servizio: `/etc/sysconfig/firewalld`

- per cercare gli indirizzi IP che tentano di accedere al sistema
```sh
grep "Invalid user" /var/log/secure
```

- per abilitare una porta sul firewall
```sh
firewall-cmd --permanent \
  --zone=public \
  --add-port=$NUM_PORTA/tcp
```

- per bloccare un indirizzo IP (vedi anche http://www.linuxeveryday.com/2016/12/block-unblock-ip-address-firewalld)
```sh
firewall-cmd --permanent \
  --add-rich-rule="rule family='ipv4' source address='$INDIRIZZO_IP' reject"
```

- per sbloccare un indirizzo IP
```sh
firewall-cmd --permanent \
  --remove-rich-rule="rule family=ipv4 source address='$INDIRIZZO_IP' reject"
```

- per avere l'elenco degli IP bloccati usare il comando
```sh
firewall-cmd --list-all
```

- dopo aver eseguito un comando di blocco/sblocco, occorre anche eseguire
```sh
firewall-cmd --reload
```

## controllo disco
```sh
badblocks -b 4096 -c 4096 -s /dev/sda
```

## visualizzazione estesa di data/ora modifica con `ls`
```sh
ls --time-style=full-iso
```

oppure
```sh
ls --full-time
```

## systemd unit file
- directory degli unit files: `/etc/systemd/system`

- questa è la dipendenza che di fatto fa partire il servizio
```ini
[Install]
WantedBy=multi-user.target
```

- l'output di un servizio si può vedere con
```sh
journalctl -f
```

- elenco degli unit files
```sh
systemctl --list-unit-files
```

# CentOS
- installazione ambiente di sviluppo `nodejs` con `git`
```sh
yum install -y wget vim httpd

# https://phoenixnap.com/kb/how-to-install-git-on-centos-7
yum groupinstall "Development Tools"
yum install -y gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel
yum install -y https://centos7.iuscommunity.org/ius-release.rpm
yum install -y git2u-all

# https://tecadmin.net/install-latest-nodejs-and-npm-on-centos/
yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_12.x | sudo -E bash -
yum install -y nodejs
```
