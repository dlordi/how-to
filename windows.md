## Hyper-V
- per abilitarlo da prompt con permessi di amministratore
```bat
dism.exe /Online /Enable-Feature:Microsoft-Hyper-V /All
```
- per disabilitarlo da prompt con permessi di amministratore
```bat
dism.exe /Online /Disable-Feature:Microsoft-Hyper-V-All
```
- vedi anche https://www.poweronplatforms.com/enable-disable-hyper-v-windows-10-8/

## Directory speciali
- esecuzione automatica
  - specifica dell'utente: `%APPDATA%\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`
  - di tuti gli utenti: `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp`

## Sbloccare gli aggiornamenti di Windows
- chiudere la finestra degli aggiornamenti di Windows
- avviare come amministratore un Prompt dei comandi ed eseguire i seguenti comandi
```bat
net stop wuauserv
net stop bits
rd /s /q %windir%\softwaredistribution
net start bits
net start wuauserv
```
  - può essere utile riavviare anche questi servizi
```bat
net stop appidsvc
net stop cryptsvc
```
- riavviare il PC
- provare di nuovo ad installare gli aggiornamenti di Windows
- vedi anche
  - https://docs.microsoft.com/it-it/windows/deployment/update/windows-update-resources
  - https://www.howtogeek.com/247380/how-to-fix-windows-update-when-it-gets-stuck/

## mount di una condivisione di rete come unità disco
```bat
net use Z: \\percorso\share\
```
  - aggiungere `/PERSISTENT:YES` per fare in modo che mantenga l'impostazione al riavvio

## unmount di una unità di rete precedentemente montata
```bat
net use Z: /delete
```

## Modificare nome e azienda di installazione
```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion]
"RegisteredOwner"="NOME"
"RegisteredOrganization"="AZIENDA"
```

---

## Misc

* [Driver Sony Vaio](http://sonyvaiodriver.com/sony-vaio-vpceb2e9ebq-windows-7-64-bits-drivers/)
