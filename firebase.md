
- si sviluppa in locale e poi si usano dei comandi per inviare i file al server di firebase

- i comandi da usare fanno parte di un package basato su node che va installato con il comando
```sh
npm install -g firebase-tools
```

fatto questo, è disponibile il comando `firebase` per creare un nuovo progetto, inviarlo al server, ecc..; per creare un nuovo progetto eseguire
```sh
firebase init
```

che chiederà passo passo quali opzioni avere per il progetto (supporto per database realtime, functions, ecc..)

se si usa l'hosting di firebase, per inviare i file al server usare il comando

```sh
firebase deploy
```

prima, però, occore fare login su firebase in modo da avere i permessi di accesso al server; si può usare il comando

```sh
firebase login
```

che permette di fare login a livello globale (quindi, non del singolo progetto) oppure il comando

```sh
firebase login:ci
```

che crea un token di accesso che in seguito si può usare con il seguente comando

```sh
firebase deploy --token <TOKEN>
```

---

```sh
firebase init functions
```
installare le dipendenze (ci mette parecchio tempo...)

```txt
myproject
 +- .firebaserc    # Hidden file that helps you quickly switch between
 |                 # projects with `firebase use`
 |
 +- firebase.json  # Describes properties for your project
 |
 +- functions/     # Directory containing all your functions code
      |
      +- package.json  # npm package file describing your Cloud Functions code
      |
      +- index.js      # main source file for your Cloud Functions code
      |
      +- node_modules/ # directory where your dependencies (declared in
                       # package.json) are installed
```

By default, the Firebase CLI looks in the `functions/` folder for the source code. You can specify another folder by adding the following lines in firebase.json:

```json
"functions": {
  "source": "another-folder"
}
```

HTTP functions are synchronous, so you should send a response as quickly as
possible and defer work using the Realtime Database

```sh
firebase deploy --only functions
```
