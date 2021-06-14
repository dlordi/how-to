
# Oggetto `window.location`

Esempio: `http://localhost:3000/index.html?key1=val1&key2=val2&#anchor`

| Proprietà                  | Valore                                                         |
|----------------------------|----------------------------------------------------------------|
| `window.location.href`     | `http://localhost:3000/index.html?key1=val1&key2=val2&#anchor` |
| `window.location.protocol` | `http:`                                                        |
| `window.location.host`     | `localhost:3000`                                               |
| `window.location.hostname` | `localhost`                                                    |
| `window.location.port`     | `3000`                                                         |
| `window.location.pathname` | `/index.html`                                                  |
| `window.location.search`   | `?key1=val1&key2=val2`                                         |
| `window.location.hash`     | `#anchor`                                                      |
| `window.location.origin`   | `http://localhost:3000`                                        |


## There are several ways an external script can be executed:

- If `async` is present: The script is executed asynchronously with the rest of the page (the script will be executed while the page continues the parsing)
- If `async` is not present and `defer` is present: The script is executed when the page has finished parsing
- If neither `async` or `defer` is present: The script is fetched and executed immediately, before the browser continues parsing the page
- https://html.spec.whatwg.org/images/asyncdefer.svg

# Comportamento anomalo nell'overflow su `fieldset`

- vedi anche
  - https://stackoverflow.com/questions/7434756/overflow-and-text-overflow-within-fieldsets
  - https://stackoverflow.com/questions/17408815/fieldset-resizes-wrong-appears-to-have-unremovable-min-width-min-content

- questo css corregge il problema su Chrome (testato il 14/06/2021 con Chrome Versione 91.0.4472.101 (Build ufficiale) (a 64 bit) su Windows 10 Professional 21H1 build SO 19043.1052)

```css
fieldset {
    min-width: 0;
    text-overflow: ellipsis;
    overflow: hidden;
}

legend {
    min-width: 0;
    max-width: 100%;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}
```
