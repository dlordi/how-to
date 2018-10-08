
# Heroku

L'idea di base è che ogni app rappresenta una sorta di macchina virtuale/container in cui viene eseguito un processo definito dal file `Procfile`; il processo può essere legato a un linguaggio di programmazione e di conseguenza si possono specificare i pacchetti che devono essere installati (dipendenze) per far funzionare l'applicativo

## Python

Su heroku si possono installare solo app WSGI; nel `Procfile` deve essere indicato

```Procfile
web: python code.py $PORT
```

in questo caso, `code.py` è il file di partenza dell'applicativo

è possibile specificare quale versione di python usare tramite il file `runtime.txt`

```txt
python-2.7.15
```

le dipendenze sono indicate nel file `requirements.txt`

```txt
web.py==0.38
Jinja2==2.10
Werkzeug==0.14
gunicorn==19.9.0
```
