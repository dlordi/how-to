- disabilitare invio di dati telemetrici
  - modificare il registry con [questo file](assets/disable-telemetry.reg)
  - riavviare il computer

- assicurarsi che la dimensione del testo e delle icone sia al 100% e non al 125%
  - tasto destro sul Desktop, scegliere Impostazioni schermo e poi controllare la voce Ridimensionamento e layout

- disabilitare tutti i suoni
  - ![](assets/suoni.png)

- installare [KeePass](KeePass)
  - installare il plugin [KeePassHttp](https://github.com/pfn/keepasshttp/)
  - installare il plugin [KeeAnywhere](https://keeanywhere.de/)

- installare [Firefox](https://www.mozilla.org/it/firefox/new/) e accedere con l'account per sincronizzare i bookmark

- eseguire un aggiornamento del sistema

- disabilitare avvio automatico di OneDrive

- impostare schermo secondario come unico attivo quando collegato

- ~~abilitare luce notturna~~

- accedere automaticamente con un utente senza dover inserire la password all'avvio
  ```bat
  control userpasswords2
  ```
  - se non disponibile, usare il programma `Autologon` della `SysinternalsSuite` per abilitare l'accesso automatico

- impostare lo sfondo del desktop
  - [sfondo originale di windows 10](assets/wallpaper-windows-10.jpg)

- impostare il nome delle dispositivi USB
  - `J:` e `K:` per le chiavette USB
  - `T:` e `U:` per i dischi USB

- configurazione esplora risorse
  - ![](assets/esplora-risorse-1.png)
  - ![](assets/esplora-risorse-2.png)
  - ![](assets/esplora-risorse-3.png)

- risparmio energetico (scegliere una delle due seguenti opzioni)
  - ![](assets/risparmio-energetico.png)
  - ![](assets/risparmio-energetico-razer.png)

- disabilitare la sospensione del computer quando si chiude il coperchio del portatile **NON DISPONIBILE IN WINDOWS 10 HOME 20H2**
  - ![](assets/chiusura-coperchio.png)

- usa pulsanti piccoli nella barra delle applicazioni
  - ![](assets/barra-applicazioni.png)

- barra della lingua
  - ![](assets/barra-lingua-1.png)
  - ![](assets/barra-lingua-2.png)
  - ![](assets/barra-lingua-3.png)
  - ![](assets/barra-lingua-4.png)

- ~~installare software per la chiavetta Internet~~ non più necessario con la saponetta wifi
  - disabilitare la voce "Consenti a Windows di gestire questa connessione" nelle "Impostazioni di Sistema" -> "Rete e Internet" -> "Cellulare" (bisogna avere la chiavetta collegata per poter vedere questa voce)

- ~~impostare profilo scansione documenti a casa~~ non più necessario con il software "Scanner Windows" scaricato dallo store!
  - ![](assets/profilo-scansione-documenti-casa.png)

- ~~impostare profilo scansione documenti in ufficio~~
  - ![](assets/profilo-scansione-documenti-ufficio.png)

- impostare profilo scansione documenti in ufficio tramite il software "Scanner Windows" scaricato dallo store
  - ![](assets/profilo-scansione-documenti-ufficio.jpg)

- creare un collegamento sul desktop alla directory `%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup`

- installare [Nodepad++](https://notepad-plus-plus.org/downloads/)
  - nelle opzioni, abilitare la chiusura di un file facendo doppio click sul tab

- mettere in esecuzione automatica l'eseguibile di [autohotkey](my-autohotkeys/my-autohotkeys.exe) per poter avere
  - caratteri tilde e backtick
  - drag delle finestre tenendo premuto il tasto windows

- solo per Windows 10 Home, installare [RDPWrap](https://github.com/stascorp/rdpwrap/releases) per poter accedere al PC con desktop remoto 

- installare [executor](https://executor.dk/download)
  - ripristinare la configurazione, la skin e le keywords
    - è sufficiente il file `executor.ini`
  - nella configurazione, impostare che venga eseguito all'avvio del sistema
  - creare collegamento sul desktop

- installare Chrome
  - fare l'accesso per sincronizzare impostazioni e bookmark
  - impostarlo come browser predefinito

- impostare Windows Media Player come lettore multimediale predefinito

- installazione [CCleaner](https://www.ccleaner.com/it-it/ccleaner/download/standard)
  - in Impostazioni, settare la lingua su Italiano
  - in Pulizia intelligente, disattivare tutte le voci
  - in Avanzate, togliere la spunta da Chiedi se salvare un backup dei problemi del registro
  - in Privacy, togliere la spunta da qualsiasi voce che comporti la condivisione di informazioni

- installare Windows Terminal dallo store

- installare notepad++

- installare 7-zip

- configurare l'ambiente di sviluppo (vedere file [DEV-SETUP.md](DEV-SETUP.md))

- ~~installare [PowerToys](https://github.com/microsoft/PowerToys/releases/)~~

- ~~installare edge chromium~~
