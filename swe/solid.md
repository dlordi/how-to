# SOLID
Principi per lo sviluppo software orientato agli oggetti (pubblicati nei primi anni 2000 da Robert C. Martin)
I principi SOLID sono intesi come linee guida per lo sviluppo di software leggibile, estendibile e manutenibile, in particolare nel contesto di pratiche di sviluppo agili e fondate sull'identificazione di **code smell** e sul refactoring.

- https://team-coder.com/solid-principles/
- https://blog.scottlogic.com/2018/06/26/solid-principles.html
- https://www.baeldung.com/solid-principles

- __S: Single responsibility principle o principio di singola responsabilità__
  - ogni elemento di un programma (classe, metodo, variabile) deve avere una sola responsabilità, e che tale responsabilità deve essere interamente incapsulata dall'elemento stesso. Tutti i servizi offerti dall'elemento dovrebbero essere strettamente allineati a tale responsabilità.

  - ad esempio, nel design pattern **Strategy**, ogni classe che implementa una interfaccia che rappresenta un certo comportamento, è responsabile unicamente di implementare un particolare algoritmo

  - Come esempio, si consideri un modulo che compila e stampa un report. Tale modulo può cambiare per due motivi. In primo luogo, il contenuto del report può cambiare. In secondo luogo, il formato del report può cambiare. Queste due cose cambiano per cause molto diverse: uno sostanziale e uno estetico. Il principio di singola responsabilità dice che questi due aspetti del problema sono in realtà due responsabilità distinte, e dovrebbero quindi essere descritte in classi o moduli separati. Sarebbe cattiva progettazione accoppiare due cose che cambiano, per motivi diversi in momenti diversi. Se vi è un cambiamento nel processo di compilazione del report, ci saranno maggiori probabilità che il codice per la stampa fallisca se si trova nella stessa classe.

- __O: Open/closed principle o principio aperto/chiuso__
  - le entità (classi, moduli, funzioni, ecc.) software dovrebbero essere aperte all'estensione, ma chiuse alle modifiche; in maniera tale che un'entità possa permettere che il suo comportamento sia modificato senza alterare il suo codice sorgente.
  - in particolare, una volta completata l'implementazione di un'entità, questa non dovrebbe essere più modificata, eccetto che per eliminare errori di programmazione. L'introduzione di nuove caratteristiche o la modifica di quelle esistenti dovrebbe richiedere la creazione di nuove entità.
  - sfrutta l'ereditarietà dell'implementazione e dell'interfaccia (tenendo conto del Single responsibility principle e del Liskov substitution principle)

- __L: Liskov substitution principle o principio di sostituzione di Liskov__
  - gli oggetti di una superclasse possono essere sostituiti con oggetti delle sue sottoclassi senza alterare la correttezza dei risultati del programma; richiede che:
    - i prerequisiti richiesti ad una superclasse devono essere almeno altrettanto vincolanti di quelli richiesti alle sottoclassi;
    - le postcondizioni e gli invarianti in una sottoclasse devono essere almeno altrettanto vincolanti di quelle delle sue superclassi.
  - un caso tipico in cui questo principio viene violato è una classe `Quadrato` che eredita da una classe `Rettangolo`: un oggetto di tipo `Rettangolo` può avere metodi che cambiano in maniera indipendente altezza e larghezza, cosa che non è vera per la classe `Quadrato`!

- __I: Interface segregation principle o principio di segregazione delle interfacce__
  - affinché un client non dipenda da metodi che non usa, è preferibile che le interfacce siano molte, specifiche e piccole (con pochi metodi) piuttosto che poche, generiche e grandi. In questo modo, è possibile relegare a ciascuna interfaccia un unico ruolo che la classe client può implementare senza dover implementare funzionalià di cui non ha bisogno

- __D: Dependency inversion principle o principio di inversione delle dipendenze__
  - normalmente i componenti di alto livello dipendono da quelli di basso livello perché li usano; questo principio ribalta la dipendenza introducendo delle astrazioni che vengono
    - usate dai componenti di alto livello, che normalmente si trovano nello stesso contesto (ad esempio, package) di queste astrazioni
    - implementate da quelli di basso livello, che quindi dipendendo da queste astrazioni/interfacce
  - i design pattern Observer, Adapter, Factory Method e Abstract Factory e la dependency injection realizzano questo concetto
