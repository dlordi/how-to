
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

### Utility a riga di comando

vedi anche https://becominghuman.ai/steps-to-create-and-deploy-python-web-app-on-heroku-95b6c4f570b0

```sh
heroku login # This will ask you to enter email id and password

heroku create #  This will create an application in Heroku which you can see on Heroku Dashboard

git add . #Add all the files

git commit -m "App ready to deploy" # Commit the code

git push heroku master # This will push the entire app on Heroku Server

heroku config:set PORT=8080 # This will set the Port

heroku ps:scale web=1 # This is to ensure that at least one instance of an app is running

heroku open # Visit the app through generated URL or with the above command

heroku logs # This is to check the logs, if anything goes wrong.
```
