
# Heroku

L'idea di base è che ogni app rappresenta una sorta di macchina virtuale/container in cui viene eseguito un processo definito dal file `Procfile`; il processo può essere legato a un linguaggio di programmazione e di conseguenza si possono specificare i pacchetti che devono essere installati (dipendenze) per far funzionare l'applicativo

## Python

Su heroku si possono installare solo app WSGI; nel `Procfile` deve essere indicato il comando di avvio del servizio; ad esempio, se si usa web.py:
```Procfile
web: python code.py $PORT
```
se si usa gunicorn
```Procfile
web: gunicorn -w 4 myapp:app
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

## Node.js

si può indicare il comando di partenza sia nel `Procfile` che in `package.json`; se si usa `package.json` bisogna mettere il comando nella sezione `scripts` e chiamarlo `web`, ad esempio:
```json
"scripts": {
  "web": "node main.js"
}
```

### Utility a riga di comando

vedi anche https://becominghuman.ai/steps-to-create-and-deploy-python-web-app-on-heroku-95b6c4f570b0

```sh
heroku login # This will ask you to enter email id and password

heroku create # This will create an application in Heroku which you can see on Heroku Dashboard
git remote -v # to be sure remote heroku repository has been added

touch .gitignore
git init

git config user.email "domenico.lordi@gmail.com"
git config user.name "Domenico Lordi"

git add . # Add all the files

git commit -m "initial commit" # Commit the code

git push heroku master # This will push the entire app on Heroku Server

heroku config:set PORT=8080 # This will set the Port

heroku ps:scale web=1 # This is to ensure that at least one instance of an app is running

heroku open # Visit the app through generated URL or with the above command

heroku logs --tail # This is to check the logs, if anything goes wrong.
```
