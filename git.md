# Git & GitHub

[tutorial](https://product.hubspot.com/blog/git-and-github-tutorial-for-beginners)

## Preparazione di un repo locale da sincronizzare su GitHub

```sh
md <directory di lavoro>
cd <directory di lavoro>
git init
git config user.email "domenico.lordi@gmail.com" # si può usare l'opzione --global
git config user.name "Domenico Lordi" # si può usare l'opzione --global
# <creare un repo su github e scegliere di "push an existing repository from command line">
git remote add origin https://github.com/dlordi/<repo su github> # "origin" è l'alias locale che viene dato al repo remoto (la convenzione è usare "origin")
git remote -v # visualizza un elenco di repo remoti
```

## Utilizzo

```sh
git status
git add <nome del file> # oppure "git add --all" per aggiungere tutti i file, anche in directory di livello superiore oppure "git add ." per aggiugere tutti i file dalla directory corrente e sottodirectory
git commit -m "<messaggio>" # usare messaggi nella forma "se applicato, questo commit farà ..."
git log # visualizzare l'elenco dei commit
git push -u origin master # richiede la password di github; i push successivi possono essere fatti anche solo con "git push"
```

## Clonare un repo da GitHub

```sh
git clone <url del repo> # crea la directory in cui clona il repo
```

## Togliere un repository remoto dall'elenco di quelli prensenti nel repo locale

```sh
git remote -v # per vedere quali sono i nomi dei repo remoti
git remote rm <nome del repo>
```
