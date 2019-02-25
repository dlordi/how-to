# RPM

* reinstallazione di un pacchetto
```sh
rpm -Uvh --replacepkgs <percorso file .rpm>
```

* disinstallazione di un pacchetto
```sh
rpm -e <nome pacchetto>
```

* pacchetto da cui proviene un file
```sh
rpm -qf <percorso file>
```

* file presenti in un pacchetto
```sh
rpm -qlp <percorso file .rpm>
```

* file presenti in un pacchetto già installato
```sh
rpm -ql <nome pacchetto>
```

# YUM

* cancella la cache locale, forzando tutte le seguenti operazioni a consultare i repository
```sh
yum clean all
```

* cerca il pacchetto che contiene il file
```sh
yum whatprovides "*/<nome file>"
yum provides "*/<nome file>"
```

* elenco dei pacchetti relativi ad `openssl`
```sh
yum --showduplicates list openssl
```

* elenco delle operazioni fatte
```sh
yum history
```

la colonna ID rappresenta un identificativo dell'operazione e può essere usata nei subcomandi di `history` per annullare una o più operazioni

* tornare ad un precedente stato
```sh
yum history rollback <ID>
```
