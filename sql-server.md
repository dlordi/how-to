
# Varie

- elenco sessioni e terminazione
```sql
select * from sys.sysprocesses;
kill <numero>;
```

- aggiungere una colonna ad una tabella
```sql
ALTER TABLE [dbo].[nome_tabella]
  ADD [nome_nuova_colonna] [varchar](1000) NOT NULL DEFAULT('')
```
