
# Varie

* è stato sviluppato nel 1995 da Brendan Eich

# Tipi di dato

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

* quando una funzione viene chiamata come metodo di un oggetto, la keyword `this` (all'interno della funzione) fa riferimento all'oggetto a cui la funzione appartiene

* se si usa `Object.create` passando come parametro `null` si crea un oggetto **SENZA** prototipo! (può essere utile per creare dei "veri" dizionari che non hanno metodi e proprietà di `Object`)

questo codice javascript
```js
d = Object.create(null)
```
equivale a questo codice python
```py
d = dict()
```

## Regole per la conversione dei tipi: esempi
```js
5 - '4' === 1 // l'operatore - si applica solo fra numeri, quindi prova a convertire entrambi gli operandi in numeri ed esegue l'operazione

5 + '4' === '54' // ? perché si sceglie di fare la concatenazione?

+!{}[true] === 1 // la sequenza di operazioni è: +(!({}[true])); quella più interna, {}[true], produce undefined; !undefined è una espressione booleana che viene valutata in true; +true è una espressione numerica che viene valutata in 1

+[3.14] === 3.14 //

+[3.14, 2.71] === NaN //

7 - 'a' === NaN // l'operatore - si applica solo fra numeri, quindi prova a convertire entrambi gli operandi in numeri; il secondo (cioé 'a') non può essere convertito in numero, quindi genera Nan e a questo punto tutte le successive operazioni generano NaN

7 / 0 === Infinity // la divisione per 0 produce Infinity
```

# Funzioni

* hoisting: meccanismo per cui se si usa var all'interno di una function, la variabile risulta dichiarata (**MA NON DEFINITA**) già all'inizio della funzione
```js
function () {
	console.log(a); // stampa undefined
	var a = 3;
}
```

* **lexical scoping**: una funzione ha accesso alle variabili definite al suo interno e alle variabili definite all'interno delle funzioni che la contengono, fino ad arrivare allo scoping globale

* `function f () {}` è una function declaration, mentre `f = function () {}` è una function expression

* all'interno di una funzione la variabile `arguments` contiene tutti i parametri passati; è molto simile ad un array ma **NON** è un array (quindi alcuni metodi non sono disponibili)

# Oggetti

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
**NON CHIARO**: perché viene usato Object.create e non si fa semplicemente `Derived.prototype = Base.prototype`???

* conviene chiamare i metodi di Object.prototype usando la call per evitare che possano essere ridefiniti in un oggetto

```js
Object.prototype.hasOwnProperty.call(object, key) // al posto di object.hasOwnProperty(key)
```
