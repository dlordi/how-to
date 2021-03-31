
# Varie

- `.attr`: legge un attributo da un tag HTML e restituisce il valore così come impostato nell'HTML
- nelle funzioni che vengono passate ai metodi di jQuery, `this` fa riferimento all'elemento DOM che sta rispondendo all'evento
- l'evento `resize` può essere scatenato più volte mentre si ridimensiona un elemento oppure una volta sola quando si finisce di ridimensionare (dipende dal browser)
- l'evento `load` di una pagina viene scatenato solo quando tutti i riferimenti del documento (css, immagini, ecc...) saranno stati scaricati
  - il metodo `ready` di jQuery, invece, si scatena prima, quando solo la pagina HTML è stata scaricata
- l'oggetto evento ha una proprietà numerica `.which` che rappresenta il codice del carattere associato all'evento; si può convertire in carattere con
```js
String.fromCharCode(evt.which)
```
- per bloccare un evento usare `evt.preventDefault()`, `event.stopPropagation()` e `return false;`
- con `.hide` (e altri metodi/effetti simili) gli elementi non vengono tolti dal documento, ma sono solo nascosti
- jQuery mette gli effetti da applicare ad un elemento in una coda (quindi non occorre gestire manualmente l'inizio di un nuovo effetto quando il precedente termina!)
- https://fancyapps.com/fancybox/3/: plugin per gestire una galleria di immagini
- http://www.wizzud.com/jqdock/demonstrator/: plugin per ingrandire le immagini al passaggio del mouse (stile mac)
- esiste il metodo `.clone` per copiare un elemento selezionato con jQuery
