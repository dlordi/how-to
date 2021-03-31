# Come faccio ad eseguire il backup, a ripristinare o a trasferire i miei dati di WhatsApp?
È possibile eseguire il backup dei dati WhatsApp utilizzando Google Drive e/o un backup locale. I backup locali vengono eseguiti automaticamente ogni giorno alle 02:00 e il database viene salvato in un file sul telefono stesso.
- Google Drive
- Ripristino o trasferimento di un backup
- Risoluzione dei problemi di backup e ripristino

## Google Drive
Puoi eseguire il backup delle chat e degli elementi multimediali su Google Drive, in modo tale che se dovessi cambiare telefono Android o ottenerne uno nuovo, le tue chat e i tuoi elementi multimediali saranno al sicuro. Per utilizzare Google Drive, assicurati che:
1. Il dispositivo sia sincronizzato con Google Drive.
2. Google Play Services sia installata (disponibile solo per Android 2.3.4 e versioni successive).
3. Il tuo account Google Drive disponga di spazio sufficiente per tutti i tuoi dati di WhatsApp.
4. Il telefono abbia sufficiente spazio libero per creare il backup.

### Come eseguire il backup su Google Drive
1. Apri WhatsApp
2. Tocca Menu > Impostazioni > Chat e chiamate> Backup delle chat.
3. Tocca Backup su Google Drive e imposta la frequenza di backup a tuo piacimento, o tocca Esegui backup per eseguire un backup immediato.
4. Ti verrà richiesto di selezionare un account Google su cui eseguire il backup della cronologia chat. Se non disponi di un account Google, tocca Aggiungi account quando richiesto. Ricorda l'account Google che stai utilizzando per il backup.
5. Tocca Backup tramite per scegliere la rete che desideri utilizzare per il backup. Tieni presente che il backup tramite rete dati cellulare può comportare costi aggiuntivi.

### Note importanti su Google Drive
1. Il primo backup completo può richiedere del tempo. Lascia il telefono collegato ad una fonte di alimentazione.
2. È possibile cambiare la frequenza di backup delle chat, l'account su cui eseguire il backup e quale connessione utilizzare per il backup in qualsiasi momento attraversoMenu > Impostazioni > Chat e chiamate > Backup delle chat.
3. Ogni volta che si esegue un backup su Google Drive su un account Google, il precedente backup di Google Drive verrà sovrascritto Non c'è alcun modo per ripristinare un vecchio backup da Google Drive.

## Ripristino o trasferimento di un backup
WhatsApp ti chiederà di ripristinare le chat e file multimediali da un backup nel momento in cui verifichi il tuo numero. Basta toccare "Ripristina" quando ti viene richiesto di farlo. Se WhatsApp non rileva alcuna copia di backup, potrebbe essere dovuto al fatto che:
1. Non sei registrato con lo stesso account Google.
2. Non stai utilizzando lo stesso numero telefonico utilizzato per creare il backup.
3. La scheda SD e/o la cronologia chat è danneggiata.
4. Non esiste alcun file di backup sull'account Google Drive o localmente sul telefono. Nota: Il modo più semplice per trasferire i dati su un nuovo telefono cellulare e' quello di utilizzare Google Drive. Se desideri utilizzare un backup locale, dovrai trasferire i file sul nuovo telefono utilizzando un computer, file explorer o scheda SD. Se i dati non sono memorizzati nella cartella /sdcard/WhatsApp/, è possibile che lo siano nelle cartelle memoria interna o memoria principale.

### Per ripristinare un backup locale meno recente
Il telefono memorizza i file dei backup locali degli ultimi 7 giorni (Google Drive avrà solo il più recente). Se desideri ripristinare un backup locale, che non è il più recente, dovrai effettuare le seguenti operazioni:
1. Scarica un file manager. Ecco alcune scelte: [File Manager e Explorers](https://play.google.com/store/search?q=file+manager+or+file+explorer&c=apps).
2. Nel File Manager, vai in `sdcard/WhatsApp/Databases`. Se i dati non sono memorizzati sulla scheda SD, vedrai memoria interno o memoria principale invece di sdcard.
3. Rinomina il file di backup che desideri ripristinare da `msgstore-AAAA-MM-DD.1.db.crypt8` a `msgstore.db.crypt8`.
4. Disinstalla WhatsApp.
5. Installa WhatsApp.
6. Tocca Ripristina quando richiesto.

## Risoluzione dei problemi di backup e ripristino

### Se non riesci a creare un backup su Google Drive, prova quanto segue:
1. Verifica di aver aggiunto un account Google sul telefono.
2. Verifica di avere abbastanza spazio disponibile sull'account di Google Drive per creare un backup. Puoi vedere quanto spazio è disponibile sul Google Drive nella parte sinistra inferiore dello schermo.
3. Verifica di avere Google Play Services installata sul telefono. Nota: Google Play servizi è disponibile solo su Android 2.3.4 e versioni successive.
4. Se stai tentando di eseguire il backup tramite rete dati cellulare, assicurati di disporre di dati sia per WhatsApp che per Google Play Services. Rivolgiti al tuo gestore se non sei sicuro.
5. Prova a fare il backup tramite rete diversa (per esempio, provare a connetterti al Wi-Fi se non riesci ad eseguire il backup tramite rete cellulare).

### Se non riesci a ripristinare un backup da Google Drive, prova quanto segue:
1. Assicurati di ripristinare i dati dallo stesso numero di telefono e account Google su cui il backup è stato creato.
2. Assicurati che ci sia abbastanza spazio sul telefono per ripristinare il backup.
3. Assicurati di avere Google Play Services installata nel telefono. Nota: Google Play Services è disponibile solo su Android 2.3.4 e versioni successive.
4. Assicurati che la batteria sia completamente carica o che il telefono sia collegato a una fonte di alimentazione.
5. Assicurati che il telefono sia collegato a una rete forte e stabile. Se il ripristino tramite rete cellulare non funziona, prova la Wi-Fi.
