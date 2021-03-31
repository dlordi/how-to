# The Twelve-Factor App

1. Codebase: un repo per una applicazione
2. Dipendenze: esplicitare tutte le librerie richieste, non assumere la loro presenza
3. Configurazione: utilizzo delle variabili d'ambiente
4. Backing service: utilizzo di stringhe di connessione per i servizi esterni
5. Build, release, esecuzione: sequenza ordinata di fasi da seguire per il deploy
6. Processi: sono stateless, tutti i dati che devono persistere sono destinati ad un backing service
7. Binding delle Porte: l'applicazione è self-contained, non si affida ad altri servizi per andare in esecuzione
8. Concorrenza: scalabilita, process formation (array dei tipi di processo e il numero di processi presenti per ogni tipo)
9. Rilasciabilità: garantire robustezza con avvii veloci e shutdown graduali; gestire situazioni di crash improvviso
10. Parità tra Sviluppo e Produzione: rilasci veloci, devops, similarita fra ambienti di sviluppo e produzione
11. Log: gestire l'output generato in fase di sviluppo (visualizzato in terminale) e produzione (storicizzato)
12. Processi di Amministrazione: trattati come i processi utente
