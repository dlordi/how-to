- l'accesso alla chiavetta USB Sony è più lento rispetto a Windows

- SyncMate è lento nel fare il sync! probabilmente perché deve ogni volta considerare tutti gli eventi (circa 2400)
	- inoltre, ogni tanto, non riconosce bene gli eventi del calendario e li duplica, costringendo poi a "ripulire" i doppioni

- non si riesce ad installare il software di scansione per la stampante di casa; tentativi fatti:
	- https://support.hp.com/it-it/drivers/selfservice/HP-Officejet-6100-All-in-One-Printer-series/79476/model/79478 scaricato e installato HPPrinterDrivers5.1.dmg
	- con homebrew
		```sh
		brew cask install hp-eprint
		```
	- dall'AppStore, installato HP Easy Scan
	- https://support.hp.com/it-it/drivers/selfservice/HP-Officejet-6100-All-in-One-Printer-series/79476/model/79478 scaricato e installato HP Easy Start

- ~~installazione del software per la chiavetta USB (software di Huawei) che però non funziona!~~ non più necessario, si utilizza la saponetta wifi
	- non si abilita il pulsante connetti anche inserendo la chiavetta nella porta usb!
		- ho anche provato a creare un nuovo profilo nelle opzioni del software e, quando poi ho provato a salvarlo, alla richiesta di permettere al software di accedere a "Sistema Eventi" o qualcosa del genere, ho dato OK, ma continua a non vedere la chiavetta inserita nella porta USB... forse vanno scaricati dei driver per il modem che è uno HUAWEI Mobile Broadband E353 HSPA
