
## Accesso con certificato invece che con password

Sul client (__computer che si deve collegare senza chiedere la password__) occorre generare una coppia di chiavi pubblica e privata; la chiave privata resta sul client, mentre quella pubblica deve essere installata sul server (__computer verso il quale avviene il collegamento__)

[Guida di riferimento](https://www.jscape.com/blog/setting-up-sftp-public-key-authentication-command-line)

### Preparazione

Sul **client**

```sh
cd
mkdir -p .ssh
chmod 700 .ssh
```
generazione della coppia di chiavi: viene chiesto il nome del file (in genere `id_rsa`) ed è anche possibile inserire una passphrase per proteggere la chiave privata
```sh
ssh-keygen -t rsa -b 2048
```
le chiavi sono generate nella directory `.ssh`: la chiave privata è in `id_rsa`, quella pubblica in `id_rsa.pub`
```sh
chmod 700 .ssh/id_rsa*
```

Sul **server**

se si lavora come root, occorre posizionarsi nella home directory dell'utente che deve accedere con il certificato; altrimenti si può lavorare direttamente come l'utente
```sh
mkdir .ssh
chmod 700 .ssh
touch .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
```

l'owner deve essere l'utente che intende accedere con il certificato: `chown -R UTENTE:GRUPPO .ssh`

permessi sulla home directory dell'utente dovrebbe già essere impostata in questo modo: `chmod go-w ~`

### Installazione

1. Sul **client**

la chiave pubblica deve essere trasmessa al server
```sh
scp ~/.ssh/id_rsa.pub $USER_NAME@$SERVER:~/.ssh/$CLIENT.key
```

2. Sul **server**

la chiave pubblica ricevuta deve essere aggiunta a quelle utilizzabili per l'utente
```sh
cat ~/.ssh/$CLIENT.key >> ~/.ssh/authorized_keys
```

In alternativa ai due punti precedenti, si può usare un unico comando sul **client**
```sh
ssh-copy-id -i .ssh/id_rsa.pub $USER_NAME@$SERVER
```

3. Sul **client**

Provando ad accedere viene chiesta la passphrase inserita al momento della creazione delle chiavi (se non è stata inserita nessuna passphrase, l'accesso avviene automaticamente); se ci sono problemi di accesso potrebbe essere necessario modificare **sul server** il file `/etc/ssh/sshd_config` per abilitare l'accesso con certificato (ed eventualmente consentire solo quello, disabilitando l'accesso con password)

4. Sul **server**

Si può disabilitare del tutto l'accesso con password e consentire solo quello con certificato impstando, nel file `/etc/ssh/sshd_config` il parametro a `no`; in seguito riavviare il servizio `ssh`.

## Connessione e creazione di un tunnel per mappare la porta remota su una porta locale

```sh
ssh -f -L$REMOTE_PORT:localhost:$LOCAL_HOST root@$REMOTE_HOST -N
```
esempio: crea un tunnel fra la porta locale 3337 e la porta remota 6379 (la porta remota viene mappata sull'indirizzo 127.0.0.1)
```sh
ssh -L 3337:127.0.0.1:6379 root@remote-host -N
```
