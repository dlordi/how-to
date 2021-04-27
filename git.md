# Configurazione
- configurare utente e nome del branch principale a livello globale
	```sh
	git config --global user.name "Domenico Lordi"
	git config --global user.email "domenico.lordi@gmail.com"
	git config --global init.defaultBranch main
	```
- configura la gestione del newline per checkin e checkout in modo da non modificare i file
	```sh
	git config --global core.autocrlf false
	```
- ~~aggiungere al file `$HOME/.gitconfig` questo contenuto~~
	```txt
	[alias]
	a = add -A
	cam = commit -am
	s = status
	pom = push origin main
	puom = pull origin main
	cob = checkout -b
	[color]
	ui = auto
	```

# Git & GitHub

[tutorial](https://product.hubspot.com/blog/git-and-github-tutorial-for-beginners)

## Rinominare il branch `master` in `main`
```sh
git branch -m master main
git push -u origin main
```
- a questo punto occorre cancellare anche il branch `master` remoto
- per farlo bisogna prima impostare un altro branch come quello default
  - per github: ...
  - per gitlab: Settings -> Repository -> Default branch
    - se protetta, si può cancellare solo da interfaccia web andando su Repository -> Branches
```sh
git push origin --delete master
```

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
git reset $NOME_DEL_FILE # rimuove un file dall'area di staging (il contrario di git add); usare "git reset" per rimuovere tutti i file
git commit -m "$MESSAGGIO" # usare messaggi nella forma "se applicato, questo commit farà ..."
git log # visualizzare l'elenco dei commit; se si aggiunge -p visualizza anche le diff
git push -u origin main # richiede la password di github; i push successivi possono essere fatti anche solo con "git push"
```

## Clonare un repo remoto

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

In alternativa, usare
```sh
git commit --amend -m $NUOVO_MESSAGGIO
```

## Unione (squash) di più commit in una sola

1. ### occorre sapere il numero delle ultime commit fatte che si vogliono unire; eseguire quindi il comando
```sh
git rebase -i HEAD~$NUMERO_ULTIME_COMMIT_DA_UNIRE
```

2. ### a questo punto si apre l'editor di testo con elencate le commit individuate dal comando precedente
Le commit sono elencate dalla più vecchia alla più recente ed ognuna è preceduta dal comando `pick`; la prima commit (quindi la più vecchia) deve restare con il comando `pick` mentre per le altre occorre sostituire il comando in `s`; salvare il testo così modificato ed uscire dall'editor

3. ### a questo punto git proporrà i messaggi delle singole commit da unire
I messaggi sono visualizzati nell'editor di testo, in cui è quindi possibile scegliere il comando da assegnare alla commit risultate dall'unione (le righe che iniziano con hash non saranno incluse nel messaggio finale); salvando e uscendo le commit
saranno unite

## Visualizzare la storia di un file
```sh
git log --follow -p -- $NOME_FILE
```

## Elenco di file
- di una sola commit
```sh
git diff-tree --no-commit-id --name-only -r $ID1
```
oppure
```sh
git log --stat $HASH
```

- compresi fra due commit
```sh
git diff-tree --no-commit-id --name-only -r $ID1^ $ID2
```

- delle ultime `NUM` commit
```sh
git diff --name-only HEAD~$NUM
```

## Undo dell'ultimo commit senza perdere le modifiche (tipicamente si usa quando ci si è accorti di aver fatto una commit incompleta)
```sh
git reset --soft HEAD^
```

## Ritornare all'ultimo commit cancellando le modifiche in corso
```sh
git reset HEAD --hard
git clean -fd # cancella i nuovi file aggiunti
```
  - l'ultimo comando NON cancella i file indicati in `.gitignore` (usare `-x` al posto di `-fd` per farlo)
