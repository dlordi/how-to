
## Eseguire codice compresso in formato .zip (sistemi UNIX)

```sh
echo "print 1" > __main__.py # __main__.py è l'entry point
zip app.zip __main__.py # si possono aggiungere anche directory strutturate come package di python
echo '#!/usr/local/python2.7/bin/python -u' | cat - app.zip > app # creazione di un eseguibile con shebang
chmod 755 app
rm -f __main__.py app.zip
./app
```

## Moduli utili

```py
import readline
import rlcompleter
readline.parse_and_bind('tab: complete')
```

## Moduli interessanti

```py
# struct: analisi delle variabili
import struct
float_rep = lambda num: struct.pack('!f', num)
```

## Precedenza degli operatori

Precedenza degli operatori elencata nella tabella in ordine decrescente

| Operatore                                    | Significato                                          |
|----------------------------------------------|------------------------------------------------------|
| ()                                           | Parentesi                                            |
| **                                           | Esponente                                            |
| +x, -x, ~x                                   | Unary plus, Unary minus, Bitwise NOT                 |
| *, /, //, %                                  | Moltiplicazione, divisione, divisione intera, modulo |
| +, -                                         | Somma, sottrazione                                   |
| <<, >>                                       | Operatori shift bitwise                              |
| &                                            | AND bitwise                                          |
| ^                                            | XOR bitwise                                          |
| \|                                            | OR bitwise                                           |
| ==, !=, >, >=, <, <=, is, is not, in, not in | Confronto, identità, Membership operators            |
| not                                          | Logical NOT                                          |
| and                                          | Logical AND                                          |
| or                                           | Logical OR                                           |

## Encode/decode delle stringhe

### Python 2

```py
str.decode() # da una sequenza di byte genera una stringa
unicode.encode() # da una stringa genera una sequenza di byte
```

### Python 3

```py
bytes.decode() # da una sequenza di byte genera una stringa
str.encode() # da una stringa genera una sequenza di byte
```

## Utilizzo della struttura dati set

inizializzazione

```py
nuovo_set = set()
altro_set = {'elem1', 'elem2'}
```

il set è immutable, una volta creato non è possibile modificarne gli elementi contenuti, ma è possibile aggiungerne altri o cancellare quelli esistenti

```py
nuovo_set.add('elem3')
altro_set.remove('elem1')
altro_set.discard('elem4') # a differenza di remove, discard non genera un errore se l'elemento non esiste nel set
altro_set.pop() # pop rimuove e restituisce un elemento qualsiasi (genera un errore se il set è vuoto)
altro_set.clear() # cancella tutti gli elementi presenti nel set
```

## Accesso a datasource ODBC usando pywin32 tramite oggetti COM
```py
import win32com.client as w32c

conn = w32c.Dispatch('ADODB.Connection')
conn.Open('nome_connessione_odbc')

sql = r"""
	select campo from tabella where
		campo like 'a%'
"""

record_set = w32c.Dispatch('ADODB.RecordSet')
record_set.Open(sql, conn)

try:
	record_set.MoveFirst()
except:
	pass

while not record_set.EOF:
	campo = record_set.Fields.Item('campo').Value
	record_set.MoveNext()

record_set.Close()
conn.Close()

#

#import win32com.client as w32c
#
#def get_table_list(connessione):
#	"""
#	Restituisce la lista di tutte le tabelle accessibili
#	sulla connessione ODBC fornita
#	"""
#
#	retval = []
#
#	record_set = connessione.OpenSchema(20, [None, None, None, 'Table'])
#
#	while not record_set.EOF:
#		retval.append(record_set('TABLE_NAME'))
#		record_set.MoveNext()
#
#	record_set.Close()
#
#	return retval
#
#wshShell = w32c.Dispatch('WScript.Shell')
#connessione = w32c.Dispatch('ADODB.Connection')
#connessione.Open('nome_connessione_odbc')
#wshShell.Popup("Sono state individuate %d tabelle" % (n), 1, "Refresh completato", 64)
#connessione.Close()

```

## Configurazione di più versioni di python

Si possono installare più versioni di python su Windows e tramite il file `C:\Windows\py.ini` stabilire quale sia la versione di default; ad esempio, con la seguente configurazione si usa python 2 come default (si può usare il comando `py` al posto dell'interprete specifico)

```ini
[defaults]
python=2
```

### Gestione delle associazioni tipi di file su Windows

Gli esempi si riferiscono a python versione 2.7

#### Visualizzazione

```bat
assoc | findstr -i python
.py=Python.File
.pyc=Python.CompiledFile
.pyd=Python.Extension
.pyo=Python.CompiledFile
.pyw=Python.NoConFile
.pyz=Python.ArchiveFile
.pyzw=Python.NoConArchiveFile
```

```bat
ftype | findstr -i python
Python.ArchiveFile="C:\Python27\python.exe" "%1" %*
Python.CompiledFile="C:\Python27\python.exe" "%1" %*
Python.File="C:\Python27\python.exe" "%1" %*
Python.NoConArchiveFile="C:\Python27\pythonw.exe" "%1" %*
Python.NoConFile="C:\Python27\pythonw.exe" "%1" %*
```

#### Modifica COME AMMINISTRATORE
```bat
ftype Python.ArchiveFile="C:\Python27\python.exe" "%1" %*
ftype Python.NoConArchiveFile="C:\Python27\pythonw.exe" "%1" %*
```


## Installazione di librerie che richiedono la compilazione di sorgenti C/C++ su Windows

Per python 2.7, installare https://www.microsoft.com/en-us/download/details.aspx?id=44266 ed usare uno dei prompt di comandi messi a disposizione (ad esempio: versione a 32 bit o 64 bit; nel menu start, si trovano nella voce `Microsoft Visual C++ Compiler for Python 2.7`).

Se durante la compilazione compare un messaggio relativo a `vcvarsall.bat` (ad esempio: `error: Unable to find vcvarsall.bat`), settare queste variabili:
```bat
SET DISTUTILS_USE_SDK=1
SET MSSdk=1
```
e riprovare

# pip

## Aggiornamento di tutti i pacchetti installati

```py
import pkg_resources
from subprocess import call
packages = [dist.project_name for dist in pkg_resources.working_set]
call('py -m pip install --upgrade ' + ' '.join(packages), shell=True)
```

## Directory della cache

- Linux and Unix: `~/.cache/pip` e la directory `XDG_CACHE_HOME`
- OS X: `~/Library/Caches/pip`
- Windows: `%LocalAppData%\pip\Cache`
