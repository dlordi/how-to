
# Su CentOS

- installazione con yum (occorre prima installare dei repository normalmente non disponibili e poi installare nginx stesso)
```sh
yum install epel-release # repository normalmente non disponibili
yum install nginx
```

- configurazione
```sh
cd /etc/nginx
vim nginx.conf # cancellare tutte le sezioni server in modo da creare file separati per ogni sito

# creazione di un file per il sito di esempio "mywebsite"
cd conf.d
vim mywebsite.conf
```

contenuto del file `mywebsite.conf`:
```conf
server {
    listen 80;
    server_name mywebsite;
    root /var/www/mywebsite;
}
```
