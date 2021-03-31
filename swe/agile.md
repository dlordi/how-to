# Il Manifesto Agile
Stiamo scoprendo modi migliori di creare software, sviluppandolo e aiutando gli altri a fare lo stesso.
Grazie a questa attività siamo arrivati a considerare importanti

- **Gli individui e le interazioni**             più che i processi e gli strumenti
- **Il software funzionante**                    più che la documentazione esaustiva
- **La collaborazione col cliente**              più che la negoziazione dei contratti
- **Rispondere al cambiamento**                  più che seguire un piano

Ovvero, fermo restando il valore delle voci a destra, consideriamo più importanti le voci a sinistra.

---

# La Metodologia Agile
Dato che lo sviluppo software è soggetto a rapidi cambiamenti (cambiano le richieste durante lo sviluppo, cambiano i modelli di business, cambiano le tecnologie a disposizione, ecc...), la metodologia agile promuove delle tecniche/strumenti che possano essere flessibili per potersi adattare ai cambiamenti e per poter gestire prodotti con cicli di vita molto veloci; i principi generali della metodologia Agile sono:
  1. customer satisfaction
  1. rilasci frequenti del software
  1. accettare i cambiamenti
  1. costante comunicazione fra tutte le persone coinvolte (sviluppatori, utenti, proprietari) durante la fase di sviluppo
  1. comunicazione deve passare prevalentemente tramite incontri faccia-a-faccia (di persona o in video call)
  1. il metro di misura è quanto software funzionate è stato prodotto, non il rispetto delle pianificazioni
  1. prediligere le buone scelte di design che emergono spontaneamente dal team di lavoro
  1. il team di lavoro valuta sè stesso per riflettere su come essere più produttivo
  1. valorizzare le persone che sono motivate dal progetto
  1. garantire un passo costante nello sviluppo (sviluppo sostenibile)
  1. attenzione ad un buon design e a soluzioni tecniche di alto profilo
    - continuos integration
    - refactoring
  1. semplicità: massimizzare la quantità di lavoro che si può evitare di fare

  - favorisce l'idea che il codice (che rappresenta la fonte di documentazione più autorevole sul prodotto finale) si trova sempre in uno stato in cui può essere portato in produzione

# Metodologie ispirate ad Agile e loro peculiarità

## Scrum
- sistema **iterativo** e incrementale per controllare i rischi e ottimizzare le previsioni; l'intenzione non è solo quella di rifinire il prodotto finale tramite iterazioni, ma anche rifinire il processo di sviluppo per iterazioni.

- sistema **empirico**: la conoscenza proviene dall'esperienza e le decisioni devono essere prese sulla base di ciò che si conosce
  - trasparenza: gli aspetti significativi del processo devono essere visibili a chi è responsabile del risultato finale; per essere compresi correttamente, tali aspetti devono aderire ad uno standard (ad esempio, un vocabolario di termini) condiviso
  - inspection: gli utenti devono poter frequentemente ispezionare il progresso del lavoro, ma non troppo spesso da rappresentare un ostacolo (può essere necessaria una specifica competenza per essere svolta)
  - adattabilità: se durante le ispezioni ci si accorge che il processo sta deviando dagli obiettivi, deve essere possibile modificare il processo stesso il più presto possibile
  - inspection e adattabilità sono previsti da scrum in 4 specifici eventi:
    - Sprint Planning
    - Daily Scrum
    - Sprint Review
    - Sprint Retrospective

- figure previste:
  - **Product Owner**
    - ha la responsabilità di massimizzare il valore di ciò che viene prodotto dal Team
    - Esperto di Scrum
    - ha conoscenza del business domain
    - eccellenti capacità comunicative
    - conoscenza dei processi Scrum
    - capacità di gestire l'imprevisto
    - capacità di negoziazione
    - approachable
    - proattivo
    - decisive
    - pragmatico
    - orientato al risultato

  - **Scrum Master** (owner del processo scrum; rappresenta per il processo Scrum quello che il Product Owner rappresenta per il prodotto finale)
    - esperto di Scrum
    - servant Leader
    - moderator
    - problem Solver
    - approachable
    - motivator
    - perceptive
    - mentor
    - capacità di coordinazione
    - introspective

  - **Scrum Team**
    - conoscenza di Scrum
    - collaborative
    - self-organizing
    - fortemente motivato
    - proactive
    - composto da esperti di tecnologia
    - cross-functional outlook
    - team player
    - independent
    - responsible
    - intuitive
    - orientato al risultato
    - introspective

  - **Stakeholders** (chi commissiona il prodotto)

  - possono essere divise in:
    - **pigs**: sono committati sulla consegna del prodotto finale (Product Owner, Scrum Master e Scrum Team)
    - **chickens**: danno dei contributi (i clienti finali)

- lavoro suddiviso in intervalli di tempo (Sprints)

- meeting regolari per permettere agli stakeholders di seguire l'avanzamento del progetto

- Anche se SCRUM abbraccia l'idea di flessibilità e adattabilita, prevede alcuni passaggi immutabili (ad esempio, una volta che le stories entrano a far parte di uno sprint, questo processo non può più essere modificato)

- User story:
  - rappresenta una "conversazione" ancora non occorsa fra il team di sviluppo e il cliente
  - costituiscono il focus principale del lavoro
  - ha una visione verticale (ad esempio: partendo dal basso, il DB, poi ORM, domain models, servizi, controller, UI, ecc..)
  - i test realizzati per una user story formano anche una suite di regression test per verificare che ulteriori sviluppi non abbiano compromesso lavoro già svolto
  - punti di una User story:
    - rappresentano il valore di una User story
    - sono stabiliti dal team di sviluppo durante lo Sprint Planning
    - devono tener conto dell'intero ciclo di vita (analisi, design, sviluppo, testing, QA e deploy; in parte rappresentano anche la difficoltà della User story)
    - i punti sono "guadagnati" dal team al completamento della User story
  - per potersi considerare completata, occorre anche verificare i criteri di accettabilità con il product owner ed escludere debito tecnico reckless
- Le suddivisioni principali di una SCRUM board prevedono Backlog, In Progress, QA, Done
- Non esistono incentivi per lavori solo parzialmente completati

### Retrospective
- raccogliere gli umori del team e le pregresse esperienze per gestire future incognite

---

## Crystal
Caratteristiche peculiari:
  - comunicazione fra i membri del team
  - il feedback sulle attività già svolte permette l'analisi delle attività future

---

## DSDM
Caratteristiche peculiari:
  - per progetti con tempi e budget "stretti"
  - riguarda tutto il progetto, non solo la fase di sviluppo del software (come invece fanno gli altri metodi agile)
  - segue la filosofia Atern:
    - fasi (Exploration e Engineering possono essere unite):
      1. Pre-project: Initiation of the project, agreeing the Terms of Reference for the work
      1. Feasibility: Typically a short phase to assess the viability and the outline business case (justification)
      1. Foundations: Key phase for ensuring the project is understood and defined well enough so that the scope can be baselined at a high level and the technology components and standards agreed, before the development activity begins
      1. Exploration: Iterative development phase during which teams expand on the high level requirements to demonstrate the functionality
      1. Engineering: Iterative development phase where the solution is engineered to be deployable for release
      1. Deployment: For each Increment (set of timeboxes) of the project the solution is made available.
      1. Post project: Assesses the accrued benefits.

---

## Extreme Programming
Caratteristiche peculiari:
  - segue molto da vicino le richieste di cambiamento durante lo sviluppo del software
  - pair programming
  - unit test e TDD
  - comunicazione fra sviluppatori e utenti finali

---

## Kanban
Caratteristiche peculiari:
  - accodamento delle richieste in base alla priorità
  - gli stakeholders possono tracciare lo stato di avanzamento del progetto
