## test in ambiente ermetico, separato dalla produzione
- unit test
- integration test
  - `dagger`: tool per fare dei test quando il software usa dependency injection
- system test
  - smoke test
  - performance test
  - regression test

## test in produzione
- configuration test: serve a stabilire quanto sia diverso il software installato in produzione dall'ultima versione
- stress test: generalmente, i componenti non degradano progressivamente ma vanno in errore di colpo
- canary test: alcuni server possono essere aggiornati ad una nuova release e vengono tenuti d'occhio per vedere se ci sono problemi
  - non rappresenta un vero e proprio test, piuttosto è una user acceptance

## Tipologie di TDD:
- Inside Out (or the Detroit School of TDD or Classicist):
  - the focus is on the results (or state)
  - Testing begins at the smallest unit level and the architecture emerges organically
  - This approach is generally easier to learn for beginners, attempts to minimize mocking, and helps prevent over-engineering
  - Design happens at the refactor stage, which can unfortunately result in large refactorings
  - Smaller, monolithic applications are often better suited for the Inside Out approach

- Outside In (or the London School of TDD or Mockist)
  - approach focuses on user behavior
  - Testing begins at the outer-most level and the details emerge as you work your way in
  - This approach relies heavily on mocking and stubbing external dependencies
  - It's generally harder to learn, but it helps ensure that the code aligns to the overall business needs
  - Design happens at the red stage (when new tests fail)
  - It's often easier to use the Outside In approach when working with complex applications that have a large number of rapidly changing external dependencies (i.e., microservices)
