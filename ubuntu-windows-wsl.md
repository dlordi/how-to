# UbuntuOnWindows:

Per attivarlo, cercare nel menu start la voce `funzionalità`; nella finestra che si apre cercare `Sottosistema linux`

### Comandi utili da Windows
- `wsl` fa partire il sottosistema linux in una shell
- `wslconfig` dato che è possibile installare più sottosistemi, con questo comando si possono gestire quelli installati (ad esempio, si può specificare il sottosistema di default con il comando `wslconfig /setdefault <sottosistema>`)
- `wsl --list` per elencare tutti i sistemi installati

## Il filesystem di UbuntuOnWindows è in
`C:\Users\<utente>\AppData\Local\lxss\rootfs`

## I file utilizzati dalle distro linux in ambiente windows sono in
`C:\Users\<utente>\AppData\Local\Packages\<sottosistema>`

## Scaricare informazioni aggiornate su tutti i pacchetti disponibili
```sh
sudo apt-get update
```

## Installare un pacchetto
```sh
sudo apt-get install $PACKAGENAME
```

## Disinstallare un pacchetto
```sh
sudo apt-get remove $PACKAGENAME
```

## Ricerca di un pacchetto
```sh
sudo apt-cache search $WORD
```

## Aggiornamento di tutti i pacchetti installati
```sh
sudo apt-get upgrade
```

## dal prompt di dos
```sh
lxrun /uninstall /full
lxrun /install /y
```

## dalla bash
```sh
sudo su
```
