# Pattern creazionali

## Factory Method
- fornisce un'interfaccia per creare un oggetto, ma lascia che le sottoclassi decidano quale oggetto istanziare

- utile quando:
  - una classe non è in grado di sapere in anticipo le classi di oggetti che deve creare
  - lo step di creazione di un oggetto richiede una significativa quantità di codice, che verrebbe duplicato in tutti i punti in cui ne è necessario l'uso
  - la creazione di un oggetto richiede l’accesso ad informazioni o risorse che non dovrebbero essere contenute nella classe di composizione
  - la gestione del ciclo di vita degli oggetti gestiti deve essere centralizzata in modo da assicurare un comportamento coerente all’interno dell’applicazione
  - le classi delegano la responsabilità di creazione

## Abstract Factory
- fornisce un'interfaccia per creare famiglie di oggetti connessi o dipendenti tra loro, in modo che non ci sia necessità da parte degli utilizzatori di specificare i nomi delle classi concrete all'interno del proprio codice

## Builder
- separa la costruzione di un oggetto complesso dalla sua rappresentazione, in modo che il processo di costruzione stesso possa creare diverse rappresentazioni

## Prototype
- permette di creare nuovi oggetti clonando un oggetto iniziale, o prototipo

## Singleton
- ha lo scopo di assicurare che di una classe possa essere creata una sola istanza in sistemi con un unico thread

## Double-checked locking
- ha lo scopo di assicurare che di una classe possa essere creata una sola istanza in sistemi multithread

## Lazy initialization
- è la tattica di istanziare un oggetto solo nel momento in cui deve essere usato per la prima volta
- utilizzato spesso insieme al pattern **Factory Method**

# Pattern strutturali

## Adapter
- converte l'interfaccia di una classe in una interfaccia diversa

## Façade
- permette, attraverso un'interfaccia più semplice, l'accesso a sottosistemi che espongono interfacce complesse e diverse tra loro

## Bridge
- permette di separare l'astrazione di una classe dalla sua implementazione, per permettere loro di variare indipendentemente

## Composite
- utilizzato per dare la possibilità all'utilizzatore di manipolare gli oggetti in modo uniforme, organizza gli oggetti in una struttura ad albero

## Container
- offre una soluzione alla rottura dell'incapsulamento per via dell'uso dell'ereditarietà

## Decorator
- consente di aggiungere metodi a classi esistenti durante il run-time (cioè durante lo svolgimento del programma), permettendo una maggior flessibilità nell'aggiungere delle funzionalità agli oggetti

## Flyweight
- permette di separare la parte variabile di una classe dalla parte che può essere riutilizzata

## Proxy
- fornisce una rappresentazione di un oggetto di accesso difficile o che richiede un tempo importante per l'accesso o creazione. Il Proxy consente di posticipare l'accesso o creazione al momento in cui sia davvero richiesto

# Pattern comportamentali

## Chain of Responsibility
- diminuisce l'accoppiamento fra l'oggetto che effettua una richiesta e quello che la soddisfa, dando a più oggetti la possibilità di soddisfarla

## Command
- permette di isolare la porzione di codice che effettua un'azione dal codice che ne richiede l'esecuzione

## Interpreter
- dato un linguaggio, definisce una rappresentazione della sua grammatica insieme ad un interprete che utilizza questa rappresentazione per l'interpretazione delle espressioni in quel determinato linguaggio

## Iterator
- risolve diversi problemi connessi all'accesso e alla navigazione attraverso gli elementi di una struttura dati, senza esporre i dettagli dell'implementazione e della struttura interna del contenitore

## Mediator
- si interpone nelle comunicazioni tra oggetti, allo scopo di aggiornare lo stato del sistema quando uno qualunque di essi comunica un cambiamento del proprio stato

## Memento
- è l'operazione di estrarre lo stato interno di un oggetto, senza violarne l'incapsulazione, e memorizzarlo per poterlo ripristinare in un momento successivo

## Observer
- definisce una dipendenza uno a molti fra oggetti diversi, in maniera tale che se un oggetto cambia il suo stato, tutti gli oggetti dipendenti vengono notificati del cambiamento avvenuto e possono aggiornarsi

## State
- permette ad un oggetto di cambiare il suo comportamento al cambiare di un suo stato interno

## Strategy
- è utile in quelle situazioni dove è necessario modificare dinamicamente gli algoritmi utilizzati da un'applicazione
- favorisce la composizione (HAS-A) al posto dell'ereditarietà (IS-A)
- fa riferimento ad un contesto o comportamento che può essere realizzato in diversi modi (strategie o algoritmi)
- *TLDR*: si basa su una interfaccia che descrive il comportamento generale e delle classi che implementano, ciasuna, un particolare algoritmo che rientra nella descrizione fatta dalla classe
```java
// questa interfaccia rappresenta un comportamento astratto
interface MovimentoSuTerraFerma {
  void muovi();
}

// queste classi sono le famiglie di algoritmi che implementano il comportamento
class Camminare implements MovimentoSuTerraFerma {
  void muovi() {
    System.out.println("Sto camminando...");
  }
}

class Strisciare implements MovimentoSuTerraFerma {
  void muovi() {
    System.out.println("Sto strisciando...");
  }
}

// questa classe ha un riferimento generico al comportamento descritto in precedenza;
// in questo modo è possible a runtime oppure nelle sottoclassi cambiare l'algoritmo
// concreto che viene utilizzato senza avere legami troppo rigidi
class EssereVivente {
  MovimentoSuTerraFerma movimentoSullaTerraFerma;

  // la presenza di questo metodo permette di cambiare a runtime il comportamento
  // dell'oggetto
  void setMovimentoSuTerraFerma(MovimentoSuTerraFerma movimentoSullaTerraFerma) {
    this.movimentoSullaTerraFerma = movimentoSullaTerraFerma;
  }

  void doSpostamento() {
    movimentoSullaTerraFerma.muovi();
  }
}
```

## Visitor
- permette di separare un algoritmo dalla struttura di oggetti composti a cui è applicato, in modo da poter aggiungere nuovi comportamenti senza dover modificare la struttura stessa

## Template Method
- permette di definire la struttura di un algoritmo lasciando alle sottoclassi il compito di implementarne alcuni passi come preferiscono

---

# Pattern architetturali

## Client-server
- rappresenta un tipo di applicazione di rete nel quale un computer client istanzia l'interfaccia utente di un'applicazione connettendosi ad una server application o ad un sistema di database

## MVC
- consiste nel separare i componenti software in:
  - **model**: modello delle funzionalità di business
  - **view**: logica di presentazione
  - **controller**: controllori dell'accesso ai **model** da parte dei **view**

## Repository
- affronta aspetti di persistenza

## Front controller
- prevede l'utilizzo di un singolo file per gestire tutte le richieste

---

# Pattern di metodologia

## Responsibility
- identificare chiaramente e dividere la responsabilità assegnata a ciascun oggetto o componente del sistema
- è il pattern metodologico basilare indicato nel libro Design Patterns

## Make it run, make it right, make it fast, make it small

---

# Pattern di concorrenza

## Monitor Object
- consente soltanto un processo attivo al suo interno, al contempo non necessita di una codifica esplicita della mutua esclusione

---

# Antipattern

## Ancora da nave - boat anchor
- mantenere una porzione di codice sorgente diventata inutile

## Busy waiting
- ciclo continuo di attesa di un evento

## Azione a distanza - action at a distance
- modifica che impatta su parti di codice molto lontane tra loro

## Mancato caching - caching failure
- non azzerare una cache contenente un errore, dopo che esso è stato trattato

## Carica e spara - accumulate and fire
- subroutine i cui input sono variabili globali

## Codice puzzolente - code smell
- piccolo malfunzionamento, che però è sintomo di un grande problema più nascosto

## Colata di lava - lava flow
- mantenere porzioni di codice la cui rimozione è rischiosa o può causare conseguenze non determinabili

## Complessità involontaria - accidental complexity
- apparente necessità di sviluppare codice complesso, che invece sarebbe già disponibile in qualche libreria

## Enorme palla di fango - big ball of mud
- sistema costruito in modo caotico, senza una struttura riconoscibile

## Fede cieca - blind faith
- non verificare il risultato di una subroutine o il manifestarsi di un errore

## Inerzia del codice - code momentum
- presenza eccessiva di vincoli e dipendenze, che rendono difficili le modifiche

## Inferno delle DLL - DLL hell
- presenza di conflitti tra le DLL da cui il programma dipende

## In mano al fornitore - vendor lock-in
- dipendenza troppo stretta da uno specifico fornitore, non sostituibile se non a costi elevati

## Input ad-hoc - input kludge
- incapacità di gestire input non validi

## Interblocco ricontrollato - double-checked locking
- inizializzazione parziale di un oggetto condiviso tra thread

## Interfaccia che ingrassa - interface bloat
- incorporare troppe operazioni in una sola interfaccia

## Invecchiamento rapido - continuous obsolescence
- sistema le cui versioni sono troppo diverse tra loro, e che quindi invecchia rapidamente e di continuo

## Inversione di astrazione - abstraction inversion
- non esporre funzionalità utili, costringendo a reimplementarle

## Kitchen sink
- oggetto che contiene un gran numero di operazioni complesse ed eterogenee tra loro

## Numero Magico - magic number
- inserire costanti negli algoritmi senza documentarne il significato o lo scopo

## Oggetto Dio - God object
- implementare una grossa funzionalità in un unico oggetto che esegue tutte le operazioni, invece che in più oggetti che si dividono il compito

## Ottimizzazione prematura - premature optimization
- scrivere codice molto ottimizzato, ma poco leggibile

## Poltergeist
- oggetto il cui unico compito è passare informazioni a un unico altro oggetto

## Priorità alle estensioni - feature creep
- aggiungere ulteriori caratteristiche al progetto, andando ben oltre il requisito iniziale

## Problema dello yo-yo - yo-yo problem
- struttura eccessivamente frammentata e quindi difficile da comprendere

## Programmazione cargo cult - cargo cult programming
- inserire una porzione di programma ignorandone scopo o principio di funzionamento

## Programmazione copia e incolla - copy and paste programming
- implementare una funzionalità simile ad un'altra copiandone e incollandone il codice piuttosto che creando una subroutine condivisa

## Pulsante magico - magic pushbutton
- pulsante che contiene anche la propria logica applicativa, invece che tenerla separata

## Punto di vista ambiguo - ambiguous viewpoint
- diagramma che indica solo le parti, ma non cosa compongono, ad esempio senza distinguere tra parti di interfaccia e di implementazione

## Reinventare la ruota - reinventing the wheel
- reimplementare un metodo che è già stato implementato, testato e ottimizzato da qualcun altro

## Reinventare la ruota quadrata - Reinventing the Square Wheel
- come reinventing the wheel, ma il risultato della reimplementazione è peggiore del metodo esistente

## Sbagliato di uno - Fencepost (o anche off-by-one) error
- partire dall'indice iniziale sbagliato in un loop (ad esempio in Java iniziare il loop su un array partendo da 1 invece che da 0)

## Software che ingrassa - software bloat
- tendenza di un'applicazione ad avere programmi di installazione che crescono a dismisura

## Spaghetti code - spaghetti code
- codice con un flusso incomprensibile

## Valori cablati - hard code
- inserire costanti nel codice piuttosto che in file di configurazione

## Valori esterni - soft code
- inserire logica applicativa in file di configurazione (ad esempio con un linguaggio di comandi) piuttosto che nel codice

## Vicolo cieco - Dead End
- dover modificare una componente su cui il supporto da parte di chi l'ha fornita è cessato
