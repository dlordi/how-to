
- connessione e creazione di un tunnel per mappare la porta remota su una porta locale
```sh
ssh -f -L$REMOTE_PORT:localhost:$LOCAL_HOST root@$REMOTE_HOST -N
```
