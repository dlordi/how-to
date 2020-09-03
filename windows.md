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
  - specifica dell'utente: `%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup`
  - di tuti gli utenti: `%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\StartUp`

- nomi di directory speciali che se usati creano dei riferimenti a risorse di sistema (il codice dopo il punto è il `CLSID`)
  - `Amministrazione totale.{ED7BA470-8E54-465E-825C-99712043E01C}`
  - `Strumenti di amministrazione.{D20EA4E1-3957-11d2-A40B-0C5020524153}`
  - `Pannello di controllo.{21EC2020-3AEA-1069-A2DD-08002b30309d}`
  - `Connessioni.{241D7C96-F8BF-4F85-B01F-E2B043341A4B}`
  - `Fonti di carattere.{D20EA4E1-3957-11d2-A40B-0C5020524152}`
  - `Computer.{20D04FE0-3AEA-1069-A2D8-08002B30309D}`
  - `Documenti.{450D8FBA-AD25-11D0-98A8-0800361B1103}`
  - `Cronologia.{ff393560-c2a7-11cf-bff4-444553540000}`
  - `Risorse di rete.{208d2c60-3aea-1069-a2d7-08002b30309d}`
  - `Stampanti e fax.{2227A280-3AEA-1069-A2DE-08002B30309D}`
  - `Cartella Programmi.{7be9d83c-a729-4d97-b5a7-1b7313c39e0a}`
  - `Cestino.{645FF040-5081-101B-9F08-00AA002F954E}`
  - `Menu Start.{48e7caab-b918-4e58-a94d-505519c795dc}`
  - `Operazioni pianificate.{D6277990-4C6A-11CF-8D87-00AA0060F5BF}`
  - `Prestazioni del sistema.{78F3955E-3B90-4184-BD14-5397C15F1EFC}`


## Creare immagine di sistema senza usare software di terze parti
- https://www.ilsoftware.it/articoli.asp?tag=Creare-immagine-di-sistema-Windows-10-senza-usare-software-di-terze-parti_18523

## Configurare server SSH
- https://www.ilsoftware.it/articoli.asp?tag=SSH-e-SFTP-come-creare-un-server-sicuro-in-Windows-10_19669

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

## Utility varie da riga di comando

- controllo del disco
```bat
chkdsk F: /f /r /x
```

- disinstallazione di uno specifico aggiornamento di Windows (bisogna conoscere il Knowledge Base number)
```bat
wusa.exe /uninstall /kb:2846071 /quiet /norestart
```

- reset winsock e stack TCP/IP
```bat
netsh winsock reset
netsh int ip reset resettcpip.txt
```

- programmi installati
  - elenco dei nomi
```bat
reg query "HKLM\Software\Microsoft\Windows\Currentversion\Uninstall" /s /v DisplayName
```

  - elenco dei comandi usati per disinstallare
```bat
reg query "HKLM\Software\Microsoft\Windows\Currentversion\Uninstall" /s /v UninstallString
```

- cancellare servizi
```bat
sc GetKeyName "nome che compare nella prima colonna della finestra servizi"
sc delete "nome visualizzato dal comando precedente"
```

- password delle reti wifi
```bat
netsh wlan show profiles
netsh wlan show profile name="ProfileName" key=clear
```

- comando per generare un file di report in `\windows\system32\energy-report.html` sull'utilizzo della batteria
```bat
powercfg -energy
```

---

## Misc

* [Driver Sony Vaio](http://sonyvaiodriver.com/sony-vaio-vpceb2e9ebq-windows-7-64-bits-drivers/)
