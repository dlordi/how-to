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
- vedi anche https://docs.microsoft.com/it-it/windows/deployment/update/windows-update-resources

## mount di una condivisione di rete come unità disco
```bat
net use Z: \\percorso\share\
```
  - aggiungere `/PERSISTENT:YES` per fare in modo che mantenga l'impostazione al riavvio

## unmount di una unità di rete precedentemente montata
```bat
net use Z: /delete
```
