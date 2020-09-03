
## installazione di pywin32
- se dopo aver installato pywin32 non si riescono ad importare alcuni moduli (ad es, la `import win32api` genera un errore su una DLL), eseguire in un prompt di DOS come amministratore
```sh
cd \Python27
python scripts\pywin32_postinstall.py -install
```

## GIL (Global Interpreter Lock)
- evita che il codice sia eseguito su più di un core del processore alla volta

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

### `shutil`: copia di file

| Funzione             | Metadati | Permission | Buffer | dest può essere una directory |
|----------------------|----------|------------|--------|-------------------------------|
| `shutil.copy`        | No       | Si         | No     | Si                            |
| `shutil.copyfile`    | No       | No         | No     | No                            |
| `shutil.copy2`       | Si       | Si         | No     | Si                            |
| `shutil.copyfileobj` | No       | No         | Si     | No                            |


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
| `()`                                         | Parentesi                                            |
| `**`                                         | Esponente                                            |
| `+x`, `-x`, `~x`                             | Più unario, meno unario, NOT bitwise                 |
| `*`, `/`, `//`, `%`                          | Moltiplicazione, divisione, divisione intera, modulo |
| `+`, `-`                                     | Somma, sottrazione                                   |
| `<<`, `>>`                                   | Operatori shift bitwise                              |
| `&`                                          | AND bitwise                                          |
| `^`                                          | XOR bitwise                                          |
| `|`                                          | OR bitwise                                           |
| `==`, `!=`, `>`, `>=`, `<`, `<=`, `is`,      | Confronto                                            |
| `is not`, `in`, `not in`                     | Identità, operatori di appartenenza                  |
| `not`                                        | NOT logico                                           |
| `and`                                        | AND logico                                           |
| `or`                                         | OR logico                                            |

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


### Configurazione su vim
- opzioni da aggiungere nel file `.vimrc`
```txt
set textwidth=79 " lines longer than 79 columns will be broken
set shiftwidth=4 " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4 " a hard TAB displays as 4 columns
set expandtab " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround " round indent to multiple of 'shiftwidth'
set autoindent " align the new line indent with the previous line
```

## Installazione di librerie che richiedono la compilazione di sorgenti C/C++ su Windows

Per python 2.7, installare https://www.microsoft.com/en-us/download/details.aspx?id=44266 ed usare uno dei prompt di comandi messi a disposizione (ad esempio: versione a 32 bit o 64 bit; nel menu start, si trovano nella voce `Microsoft Visual C++ Compiler for Python 2.7`).

Se durante la compilazione compare un messaggio relativo a `vcvarsall.bat` (ad esempio: `error: Unable to find vcvarsall.bat`), settare queste variabili:
```bat
SET DISTUTILS_USE_SDK=1
SET MSSdk=1
```
e riprovare

## Opzioni utili riga di comando

- `-O`: toglie le assert statements dal codice compilato
- `-OO`: toglie sia le assert che le doc string per ridurre la dimensione del compilato

## Variabili d'ambiente utili

- `PYTHONDONTWRITEBYTECODE`: equivale a `python -B` (non genera i file `.pyc`)
- `PYTHONUNBUFFERED`: equivale a `python -u` (non bufferizza stdout e stderr)

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

## Installazioni / disinstallazioni massive da file di requirements

```sh
pip install -r $REQUIREMENT_FILE
```

```sh
pip uninstall -r $REQUIREMENT_FILE -y
```

## Elenco dei pacchetti obsoleti

```sh
pip list --outdated
```

## Dettagli di un pacchetto

```sh
pip show $NOME_PACCHETTO --verbose
```

# Virtual Environment

## crezione ed attivazione di un nuovo Virtual Environment
```sh
py -3 -m venv $NOME_ENV
cd $NOME_ENV
scripts/activate
```

## uso del Virtual Environment
```sh
pip install $PACCHETTO
```
oppure
```sh
pip install -r requirements.txt
```

## preparazione delle dipendenze e disattivazione
```sh
pip freeze >requirements.txt
deactivate
```

# pipenv

- tutti i virtual environment sono tenuti in `~/.virtualenvs`
  - se si vuole creare il virtual environment nella directory del progetto impostare la variabile d'ambiente
```sh
export PIPENV_VENV_IN_PROJECT=1
```
- il file `Pipfile` (si trova nella root del progetto) tiene traccia delle dipendenze
- `Pipfile` sostituisce `requirements.txt`
- il file `Pipfile.lock` tiene traccia di cosa è stato installato
- nel file `Pipfile` si può anche mettere il riferimento alla versione di python da usare per creare il virtual environment

- se si ha già un `Pipfile`, la creazione del virtual environment e l'installazione delle dipendenze avviene con il comando
```sh
pipenv install
```

- per creare un nuovo virtual environment partendo da zero si può usare il comando
```sh
pipenv --python $PYTHON_VERSION_FOR_VENV
```

- per attivare il virtual environment usare il comando
```sh
pipenv shell
```

- per installare una nuova dipendenza (che verrà aggiunta automaticamente al `Pipfile`) usare il comando
```sh
pipenv install $NOME_PACKAGE
```

- per visualizzare la directory in cui si trova il virtualenv
```sh
pipenv --venv
```

- per cancellare tutto il virtualenv già creato
```sh
pipenv --rm
```

# appunti da Python Tricks: the book
- se un dizionario viene passato ad una funzione con l'operatore di unpack `*`, alla funzione verranno passate le keys del dizionario, in un ordine arbitrario
- i contenitori come dizionari e liste utilizzano sempre il risultato di `__repr__` sugli elementi contenuti, anche quando si prova ad avere una rappresentazione `str`
- nella scrittura di un modulo, è una buona pratica definire una classe di eccezioni base da cui far derivare tutte quelle che verranno lanciate dal modulo stesso
- gli assegnamenti in python non copiano gli oggetti, creano solo un legame fra il nome e l'oggetto stesso
- i contenitori modificabili nativi di python (dizionari, liste, set, ecc...) possono essere copiati (shallow mode) passandoli come argomento alla rispettiva funzione di factory
```py
my_list = [...]
copy_of_my_list = list(my_list)
```
- tramite il modulo `abc` (Abstract Base Class) e le metaclassi è possibile controllare l'istanziazione delle classi
  - esempio con python 2
```py
from abc import ABCMeta, abstractmethod

class Base(object):
	__metaclass__ = ABCMeta

	@abstractmethod
	def foo(self):
		pass


class Concrete(Base):
	pass


# questa istruzione genera un errore perché la classe Concrete non implementa il metodo foo
c = Concrete()
```
  - esempio con python 3
```py
from abc import ABCMeta, abstractmethod

class Base(metaclass=ABCMeta):
	@abstractmethod
	def foo(self):
		pass


class Concrete(Base):
	pass


# questa istruzione genera un errore perché la classe Concrete non implementa il metodo foo
c = Concrete()
```
- le tuple sono sempre strutture ad-hoc (non esiste un modo per garantire che due tuple abbiano lo stesso numero/tipo di campi); questo "difetto" porta a preferire le `collections.namedtuple`
- le `collections.namedtuple` sono implementate internamente come classi
- i metodi statici sono principalmente un metodo per inserire delle funzioni in un namespace
- dato che è consentito un solo metodo `__init__` per ogni classe, i metodi di classe (`classmethod`) sono un modo per fornire dei costruttori alternativi
- le tuple possono essere usate come key di un dizionario solo se tutti gli elementi della tupla sono hashable
- i moduli standard di python offrono varianti specializzate dei dizionari standard, che sono tutte basate sul tipo `dict` standard
- `types.MappingProxyType` è una vista readonly su un dizionario; questa classe è presente da python 3.3 per avere proxy immutabili di un dizionario
- gli `array.array` sono ottimizzati in termini di occupazione di memoria rispetto a tuple e liste
- python 3: il tipo `bytes` è immutabile, ma a differenza del tipo `str`, è disponibile un tipo `bytearray` che è invece una sequenza modificabile di interi nel range 0-255
- da python 3.6 è disponibile `typing.NamedTuple`, classe simile a `collections.namedtuple`, ma che permette di usare una nuova sintassi e di specificare i type hint
```py
from typing import NamedTuple

class Car(NamedTuple):
	color: str
	mileage: float
	automatic: bool
```
- da python 3.3 è disponibile `typing.SimpleNamespace`: una sorta di dizionario che permette di accedere alle key con la sintassi dot (.) invece delle parentesi quadre
- implementazioni corrette del tipo di dato set permettono di testare l'appartenenza di un elemento in tempo costante, mentre unione, intersezione e differenza sono in media O(n)
- implementazioni corrette di uno stack permettodo di avere inserimento e cancellazione in tempo costante
- il tipo `list` usato per emulare uno stack
  - supporta le operazioni di push e pop in tempo costante in amortized analysis
    - le performance sono però meno "stabili" di quelle di `collections.deque` (linked list) che invece sono sempre O(1)
  - l'accesso ad un elemento qualsiasi è sempre O(1)

# Object oriented programming

- le sottoclassi che chiamano `super()` devono passare due parametri: il primo è la sottoclasse stessa, il secondo è `self`

# f-strings

formatta in esadecimale un numero intero con zero padding a due cifre
```py
r=1
print(f'{r:02X}')
```

# pytz

Gli oggetti creati con `datetime` sono "naive", non contengono MAI informazioni sul timezone a cui si riferiscono, anche quando vengono usati metodi che fanno riferimento a UTC

```py
import datetime
import pytz

dt_now = datetime.datetime.now()
dt_utcnow = datetime.datetime.utcnow()
```

se si prova a stampare `dt_now` e/o `dt_utcnow`, non viene data nessuna indicazione del timezone

`pytz` è un database dei vari timezone esistenti ed una serie di metodi che consentono di applicare i timezone agli oggetti datetime

per aggiungere informazioni sul timezone ad un oggetto naive occorre prima stabilire quale timezone...

```py
my_tz = pytz.timezone('Europe/Rome')
utc_tz = pytz.timezone('UTC')
```

... e poi usare questo oggetto per localizzare gli oggetti naive

```py
dt_now = my_tz.localize(dt_now)
dt_utcnow = utc_tz.localize(dt_utcnow)
```

ora gli oggetti datetime contengono informazioni sul timezone e possono essere convertiti da un timezone all'altro correttamente

```py
us_east_tz = pytz.timezone('US/Eastern')
dt_us_east = dt_now.astimezone(us_east_tz)
```

si possono anche creare direttamente oggetti datetime che siano timezone aware

```py
dt_us_east = datetime.datetime.now(tz=us_east_tz)
dt_us_east = datetime.datetime(2019, 5, 12, 21, 03, 23, tzinfo=us_east_tz)
```
