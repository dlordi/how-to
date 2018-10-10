
elenco delle sessioni

```sql
select * from v$session where osuser = 'root';
```

per terminare una sessione (i numeri separati da virgola sono rispettivamente `sid` e `session#` presi dalla `v$session`)

```sql
ALTER SYSTEM KILL SESSION '55,715';
```
