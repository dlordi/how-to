# Git & GitHub

[tutorial](https://product.hubspot.com/blog/git-and-github-tutorial-for-beginners)

## Preparazione di un repo locale da sincronizzare su GitHub

```sh
md $DIRECTORY_DI_LAVORO
cd $DIRECTORY_DI_LAVORO
git init
git config user.email "domenico.lordi@gmail.com" # si può usare l'opzione --global
git config user.name "Domenico Lordi" # si può usare l'opzione --global
# <creare un repo su github e scegliere di "push an existing repository from command line">
git remote add origin https://github.com/dlordi/$REPO_SU_GITHUB # "origin" è l'alias locale che viene dato al repo remoto (la convenzione è usare "origin")
git remote -v # visualizza un elenco di repo remoti
```

## Utilizzo tipico

```sh
git status
git add $NOME_DEL_FILE # oppure "git add --all" per aggiungere tutti i file, anche in directory di livello superiore oppure "git add ." per aggiugere tutti i file dalla directory corrente e sottodirectory
git commit -m "$MESSAGGIO" # usare messaggi nella forma "se applicato, questo commit farà ..."
git log # visualizzare l'elenco dei commit
git push -u origin master # richiede la password di github; i push successivi possono essere fatti anche solo con "git push"
```

## Clonare un repo da GitHub

```sh
git clone $URL_DEL_REPO # crea la directory in cui clona il repo
```

## Togliere un repository remoto dall'elenco di quelli prensenti nel repo locale

```sh
git remote -v # per vedere quali sono i nomi dei repo remoti
git remote rm $NOME_DEL_REPO
```

## Modificare il messaggio di una commit

La procedura da seguire è la seguente:
1. ### visualizzare un elenco di commit che comprenda quello da modificare;

Occorre prima trovare l'hash assegnato al commit di interesse con il comando `git log` e poi usare il comando
```sh
git rebase -i $HASH^
```

per visualizzare in `vi` tutte le commit a partire da quella di interesse fino all'ultima fatta

2. ### sul commit di interesse, scegliere il tipo di modifica da fare;

Ogni commit visualizzata con il comando precedente in `vi` è preceduta da un comando `pick`; occorre individuare la commit di interesse e cambiare il comando da `pick` a `reword`; salvare e uscire da `vi`

3. ### modificare il messaggio

Eseguendo le istruzioni dello step precedente a questo punto sarà visualizzato in `vi` il messaggio originale della commit; modificarlo, salvare e uscire da `vi`

