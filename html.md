
## Oggetto `window.location`

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


### There are several ways an external script can be executed:

- If `async` is present: The script is executed asynchronously with the rest of the page (the script will be executed while the page continues the parsing)
- If `async` is not present and `defer` is present: The script is executed when the page has finished parsing
- If neither `async` or `defer` is present: The script is fetched and executed immediately, before the browser continues parsing the page
- https://html.spec.whatwg.org/images/asyncdefer.svg
