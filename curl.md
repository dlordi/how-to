- specificando solo `-d` la richiesta viene fatta in `POST`
- l'opzione `-u` permette di specificare utente e password

## esempi
- richiesta in PUT con dati letti da file
```sh
curl -X PUT \
  -H "Content-Type: application/json" \
  -H "Authorization: Basic $USERNAME_PASSWORD" \
  -d @"/tmp/data_to_send.json" \
  -k \ # permette di fare anche richieste insicure
  -i \ # visualizza gli header della response
  -v \ # visualizza gli header della request
  $URL
```
