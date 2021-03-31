
```sh
npm install -g create-react-app
```

```sh
npm run build
```

```sh
firebase init
```
- selezionare tutte le opzioni
- [create a new project]
- confermare il file di default per `database.rules.json`
- confermare il file di default per `firestore.rules`
- confermare il file di default per `firestore.indexes.json`
- Do you want to install dependencies with npm now? (Y/n)                     -> Y
- What do you want to use as your public directory? (public)                  -> build
- Configure as a single-page app (rewrite all urls to /index.html)? (y/N)     -> Y
- File build/index.html already exists. Overwrite? (y/N)                      -> N
- confermare il file di default per storage.rules

- andare sul sito https://console.firebase.google.com e creare un nuovo progetto

- `firebase use --add`
  - selezionare il progetto creato in precedenza
  - What alias do you want to use for this project? (e.g. staging)              -> staging

- `firebase deploy`
  - si può anche eseguire con il flag `--project <projectId>`
  - dato che si sono selezionate tutte le opzioni, compreso firestore/Cloud firestore
  - occorre abilitarlo nel progetto, Scheda Database
  - aggiunto `"deploy": "firebase deploy"` alla sezione `"scripts"` del file `package.json` in modo che si possa usare il comando `npm run deploy` al posto di `firebase deploy`

To use Firebase Database in our React app, we'll need to import the firebase javascript library and configure it with our Firebase application keys, which can be found in the Firebase Console (https://console.firebase.google.com/). Open your project in the Overview section, click on the red button that says "Add Firebase to your web app" and you'll see the keys that we'll need to use. Make sure you don't rush to copy all of the provided code, we'll do it slightly different - we'll include the firebase package in our react application. Open the command-line in your project dir and install firebase package into the project by running npm install -S firebase. Don't confuse this with what we did earlier. We simply set up our project to be deployed to Firebase Hosting - we didn't necessarily have to use firebase in our front-end application.

creazione del file `src/fire.js`
