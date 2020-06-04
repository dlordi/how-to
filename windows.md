## Sbloccare gli aggiornamenti di Windows
- chiudere la finestra degli aggiornamenti di Windows
- avviare come amministratore un Prompt dei comandi ed eseguire i seguenti comandi
net stop wuauserv
net stop bits
rd /s /q %windir%\softwaredistribution
net start bits
net start wuauserv
- riavviare il PC
- provare di nuovo ad installare gli aggiornamenti di Windows
