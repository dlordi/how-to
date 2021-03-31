
# varie
  - per fare in modo che il compilatore di vue non dia errore quando si usano campi importati da altri .js referenziati da `index.html` aggiungere al file `.eslintrc.js` la sezione seguente
```js
  globals: {
    '$': true
  }
```

  - nel file `config/index.js` impostare `assetsPublicPath` per il prefisso dei file css e js generati dal compilatore
