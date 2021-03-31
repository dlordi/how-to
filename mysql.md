
# Modificare il massimo numero di connessioni consentite

In `/etc/my.cnf`
```ini
[mysql]
max_allowed_packet=512MB

[mysqld]
max_allowed_packet=512MB
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
user=mysql
# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0
max_connections=501

[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid
max_connections=501
```

## Per renderlo operativo subito
```sql
SET GLOBAL max_connections = 501;
```

# Abilitare il log di tutte le query

## Per renderlo operativo subito

```sql
SET GLOBAL log_output = 'FILE';
SET GLOBAL general_log_file = '/var/log/mysql/query.log';
SET GLOBAL general_log = 1;
```

# Abilitare il log delle query lente

- le query "lente" sono registrate nel file di log **solo quando finiscono la loro esecuzione**

- la durata (oltre la quale una query è considerata lenta) è espressa in **secondi**

- in `/etc/my.cnf`
```ini
[mysqld]
long_query_time = 1
slow_query_log_file = /var/log/mysql/slow-query.log
slow_query_log = 1
```

## Per renderlo operativo subito
```sql
SET GLOBAL long_query_time = 1;
SET GLOBAL slow_query_log_file = '/var/log/mysql/slow-query.log';
SET GLOBAL slow_query_log = 1;
```

# Visualizzare l'attività corrente del DB
```sql
show full processlist;

select *
  from INFORMATION_SCHEMA.PROCESSLIST
 where COMMAND <> 'Sleep';
```

# Comando `mysql`

* per visualizzare i record estratti da una select in "verticale" terminare la query SQL con \G

* per eseguire del codice SQL da riga di comando usare l'opzione `-e "COMANDI SQL"`

# ODBC con MySQL

`/etc/my.cnf`
```ini
[client]
socket=/var/lib/mysql/mysql.sock

[odbc]
PASSWORD = ...
```

```sh
ln -s /var/lib/mysql/mysql.sock /tmp/mysql.sock
```

`/etc/odbcinst.ini`
```ini
[ODBC]
Trace = yes
TraceFile = /tmp/odbc.log
```

---

```sql
SET global general_log_file='/tmp/mysql-query.log';
SET global general_log = on;
SET global log_output = 'file';
```

```sh
cat /dev/null >/tmp/mysql-query.log
```

---

# timestamp o datetime

To summarize, if you want to serve your date and time data the same way regardless of timezones, you can use the DATETIME type (which will also allow you to use all the date & type functions built in MySQL). Otherwise, you can use TIMESTAMP and serve the data on a per-timezone basis.

- per datetime usare `now()`
- per timestamp usare `current_timestamp()`
