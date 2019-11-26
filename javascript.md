
# Varie

- è stato sviluppato nel 1995 da Brendan Eich

# Tipi di dato

- ha 6 tipi di base: `number` (sempre a 64 bit), `string`, `boolean`, `object`, `function` e `undefined`

- se si prova ad aggiungere delle proprietà ai tipi `number`, `string` o `boolean`, anche se non viene generato un errore, la proprietà non viene in realtà creata (sono tipi immutabili)

- `NaN` e `Infinity` sono di tipo `number` (anche se non hanno un valore)
```js
Infinity - 1 === Infinity
0 / 0 === NaN
NaN !== NaN // NaN è il solo valore che non è uguale a sè stesso
Infinity - Infinity == NaN
```

- `typeof` è un operatore unario che produce come risultato una stringa

- il confronto fra stringhe si basa sullo standard Unicode

- la differenza fra `undefined` e `null` è più un errore di design che basato su una reale esigenza

- quando la conversione in numero non riesce, il risultato è `NaN` (e successive operazioni su `NaN` producono ancora `NaN`)

- `null` o `undefined` sono uguali solo a `null` o `undefined` (altri confronti risultano sempre `false`)
```js
null === null
undefined === undefined
```

- quando si vuole controllare che un valore sia un vero valore e non `null` o `undefined` basta confrontarlo con `null` (**NON CHIARO**: vuol dire che nessun altro valore (oltre a `null` e `undefined`) può essere automaticamente convertito in `null`?)

- una espressione è un frammento di codice che produce un valore

- il tipo più semplice di statement è una espressione seguita da un `;`

- il `;` finale può essere omesso in certi casi, in altri è necessario per non considerare anche la riga seguente come parte dello statement

- nel confronto fra oggetti, l'operatore `==` restituisce `true` solo se i due oggetti puntano allo stesso elemento (se sono oggetti diversi, anche se hanno lo stesso contenuto, restituisce `false`)

- quando una funzione viene chiamata come metodo di un oggetto, la keyword `this` (all'interno della funzione) fa riferimento all'oggetto a cui la funzione appartiene

- se si usa `Object.create` passando come parametro `null` si crea un oggetto **SENZA** prototipo! (può essere utile per creare dei "veri" dizionari che non hanno metodi e proprietà di `Object`)

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

- hoisting: meccanismo per cui se si usa var all'interno di una function, la variabile risulta dichiarata (**MA NON DEFINITA**) già all'inizio della funzione
```js
function () {
	console.log(a); // stampa undefined
	var a = 3;
}
```

- **lexical scoping**: una funzione ha accesso alle variabili definite al suo interno e alle variabili definite all'interno delle funzioni che la contengono, fino ad arrivare allo scoping globale

- `function f () {}` è una function declaration, mentre `f = function () {}` è una function expression

- all'interno di una funzione la variabile `arguments` contiene tutti i parametri passati; è molto simile ad un array ma **NON** è un array (quindi alcuni metodi non sono disponibili)

- `bind`: è un metodo che restituisce una funzione in cui il contesto (`this`) viene forzato; ad esempio:
```js
function f() {
  console.log(this.value);
}
```

l'esecuzione di `f` fa riferimento a contesti diversi in base al momento della chiamata

```js
const g = f.bind({value: 42}); // stampa 42
```

l'esecuzione di `g` farà sempre riferimento all'oggetto passato a `bind`

- `call`: permette di richiamare una funzione forzando il contesto (`this`); eventuali parametri da passare alla funzione possono essere indicati di seguito; notare che a differenza di `bind` non viene restituita una nuova funzione: semplicemente la funzione originale viene richiamata specificando contesto e parametri; esempio:
```js
function f(a, b, c) {
  console.log(this.value, a, b, c);
}
f.call({value: 42}, 1, 2, 3); // stampa 42 1 2 3
```

- `apply`: simile a `call`, ma i parametri da passare devono essere in un array; esempio:
```js
function f(a, b, c) {
  console.log(this.value, a, b, c);
}
f.apply({value: 42}, [1, 2, 3]); // stampa 42 1 2 3
```

# Oggetti

- l'eredità può essere realizzata facendo
```js
function Base(/* ... */) {
	/* ... */
}

function Derived(/* ... */) {
	Base.call(this, /* ... */);
}
Derived.prototype = Object.create(Base.prototype);
```
**NON CHIARO**: perché viene usato `Object.create` e non si fa semplicemente `Derived.prototype = Base.prototype`???

- conviene chiamare i metodi di Object.prototype usando la call per evitare che possano essere ridefiniti in un oggetto

```js
Object.prototype.hasOwnProperty.call(object, key) // al posto di object.hasOwnProperty(key)
```

# `delete`

The point is the delete operator removes a property from an object. **It cannot remove a variable**.

For example:
1. If it is created with `var`, it cannot be deleted.
```js
var g_a = 1; //create with var, g_a is a variable 
delete g_a; //return false
console.log(g_a); //g_a is still 1
```

2. If it is created without var, it can be deleted.
```js
g_b = 1; //create without var, g_b is a property 
delete g_b; //return true
console.log(g_b); //error, g_b is not defined
```

Technical Explanation

1. Using `var`

   In this case the reference `g_a` is created in what the ECMAScript spec calls "[VariableEnvironment](http://www.ecma-international.org/ecma-262/5.1/#sec-10.3)" that is attached to the current scope - this may be the a function execution context in the case of using `var` inside a function (though it may be get a little more complicated when you consider `let`) or in the case of "global" code the VariableEnvironment is attached to the global object (often `window`). References in the VariableEnvironment are not normally deletable - the process detailed in [ECMAScript 10.5](http://www.ecma-international.org/ecma-262/5.1/#sec-10.5) explains this in detail, but suffice it to say that **unless your code is executed in an eval context (which most browser-based development consoles use), then variables declared with var cannot be deleted**.

2. Without Using `var`

   When trying to assign a value to a name without using the `var` keyword, Javascript tries to locate the named reference in what the ECMAScript spec calls "[LexicalEnvironment](http://www.ecma-international.org/ecma-262/5.1/#sec-10.3)", and the main difference is that LexicalEvironments are nested - that is a LexicalEnvironment has a parent (what the ECMAScript spec calls "outer environment reference") and when Javscript fails to locate the reference in a LexicalEenvironment, it looks in the parent LexicalEnvironment (as detailed in [10.3.1](http://www.ecma-international.org/ecma-262/5.1/#sec-10.3.1) and [10.2.2.1](http://www.ecma-international.org/ecma-262/5.1/#sec-10.2.2.1)). **The top level LexicalEnvironment is the "global environment", and that is bound to the global object in that its references are the global object's properties**. So if you try to access a name that was not declared using a var keyword in the current scope or any outer scopes, Javascript will eventually fetch a property of the window object to serve as that reference. As we've learned before, properties on objects can be deleted.

Notes:

1. It is important to remember that `var` declarations are "hoisted" - i.e. they are always considered to have happened in the beginning of the scope that they are in - though not the value initialization that may be done in a `var` statement - that is left where it is. So in the following code, `a` is a reference from the VariableEnvironment and not the window property and its value will be `10` at the end of the code:
```js
function test() { a = 5; var a = 10; }
```

2. The above discussion is when "strict mode" is not enabled. Lookup rules are a bit different when using "strict mode" and lexical references that would have resolved to window properties without "strict mode" will raise "undeclared variable" errors under "strict mode". I didn't really understand where this is specified, but its how browsers behave.

# `Number` e `parseInt`

```js
Number('2a') === NaN
+'2a' === NaN
parseInt('2a') === 2
```

in pratica,
  - `parseInt` si ferma al primo carattere che non può essere trattato come numero intero, restituendo quello di cui ha fatto il parsing fino a quel momento.
  - `Number` invece tenta di convertire l'intera stringa: se in qualsias punto non ci riesce produce `NaN`
    - l'operatore unario `+` si comporta come `Number`
