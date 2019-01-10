
- elenco delle sessioni

```sql
select * from v$session where osuser = 'root';
```

- per terminare una sessione (i numeri separati da virgola sono rispettivamente `sid` e `session#` presi dalla `v$session`)

```sql
ALTER SYSTEM KILL SESSION '55,715';
```

- explain di una query

```sql

-- 1
explain plan for 'query/update/...'

-- 2
select plan_table_output from table(dbms_xplan.display('plan_table',null,'basic'));

```
