
- elenco delle sessioni

```sql
select * from v$session where
	osuser = 'root' -- account del sistema operativo da cui viene fatta la query
	and status = 'ACTIVE'
;
```

- testo delle query eseguite; questa tabella può essere messa in join con `v$session` tramite le colonne `sql_address`, `sql_hash_value`

```sql
select * from v$sqltext_with_newlines
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

- hint su indici da utilizzare

```sql
select /*+ index(<nome_alias> <nome_indice>) */ * from <nome_tabella> <nome_alias>;
```

- aggiugnere un commento ad una colonna

```sql
COMMENT ON COLUMN "SCHEMA"."TABLE_NAME"."COLUMN_NAME" IS 'commento';
```

- posizione del file `tnsnames.ora`

  - `$ORACLE_HOME/network/admin/tnsnames.ora`

- elenco delle tabelle di uno schema

```sql
SELECT DISTINCT OWNER, OBJECT_NAME
  FROM DBA_OBJECTS
 WHERE OBJECT_TYPE = 'TABLE'
   AND OWNER = '&OWNER'
```
