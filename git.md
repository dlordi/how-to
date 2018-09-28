# Git & GitHub

[tutorial](https://product.hubspot.com/blog/git-and-github-tutorial-for-beginners)

## Preparazione

1. `md <directory di lavoro>`
1. `cd <directory di lavoro>`
1. `git init`
1. `git config user.email "domenico.lordi@gmail.com" # si può usare l'opzione --global`
1. `git config user.name "Domenico Lordi" # si può usare l'opzione --global`
1. `# <creare un repo su github e scegliere di "push an existing repository from command line">`
1. `git remote add origin https://github.com/<utente>/<repo su github>`

## Utilizzo

1. `git status`
1. `git add <nome del file> # oppure git add --all`
1. `git commit -m "<messaggio>"`
1. `git log # visualizzare l'elenco dei commit`
1. `git push -u origin master # richiede la password di github`

## Clonare un repo da GitHub

1. `git clone <url del repo> # crea la directory in cui clona il repo`
