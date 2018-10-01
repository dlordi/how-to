
* è stato introdotto nel 1995

* ha 6 tipi di base: `number` (sempre a 64 bit), `string`, `boolean`, `object`, `function` e `undefined`

* se si prova ad aggiungere delle proprietà ai tipi `number`, `string` o `boolean`, anche se non viene generato un errore, la proprietà non viene in realtà creata (sono tipi immutabili)

* `NaN` e `Infinity` sono di tipo `number` (anche se non hanno un valore)
```js
Infinity - 1 === Infinity
0 / 0 === NaN
NaN !== NaN // NaN è il solo valore che non è uguale a sè stesso
Infinity - Infinity == NaN
```

* `typeof` è un operatore unario che produce come risultato una stringa

* il confronto fra stringhe si basa sullo standard Unicode

* la differenza fra `undefined` e `null` è più un errore di design che basato su una reale esigenza

* quando la conversione in numero non riesce, il risultato è `NaN` (e successive operazioni su `NaN` producono ancora `NaN`)

* `null` o `undefined` sono uguali solo a `null` o `undefined` (altri confronti risultano sempre `false`)
```js
null === null
undefined === undefined
```

* quando si vuole controllare che un valore sia un vero valore e non `null` o `undefined` basta confrontarlo con `null` (**NON CHIARO**: vuol dire che nessun altro valore (oltre a `null` e `undefined`) può essere automaticamente convertito in `null`?)

* una espressione è un frammento di codice che produce un valore

* il tipo più semplice di statement è una espressione seguita da un `;`

* il `;` finale può essere omesso in certi casi, in altri è necessario per non considerare anche la riga seguente come parte dello statement

* nel confronto fra oggetti, l'operatore `==` restituisce `true` solo se i due oggetti puntano allo stesso elemento (se sono oggetti diversi, anche se hanno lo stesso contenuto, restituisce `false`)

* quando una funzione viene chiamata come metodo di un oggetto, la keyword `this` (all'interno della funzione) fa riferimento all'oggetto

* se si usa `Object.create` passando come parametro `null` si crea un oggetto *SENZA* prototipo! (può essere utile per creare dei "veri" dizionari che non hanno metodi e proprietà di `Object`)

questo codice javascript
```js
d = Object.create(null)
```
equivale a questo codice python
```py
d = dict()
```

* l'eredità può essere realizzata facendo
```js
function Base(/* ... */) {
	/* ... */
}
function Derived(/* ... */) {
	Base.call(this, /* ... */);
}
Derived.prototype = Object.create(Base.prototype);
```
**NON CHIARO**: perché viene usato Object.create e non si fa semplicemente
Derived.prototype = Base.prototype???
