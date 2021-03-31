
## Collaborare ad un progetto github con le pull request

[riferimento principale](https://akrabat.com/the-beginners-guide-to-contributing-to-a-github-project/)

[guida schematica di git con comandi utili per usare github](http://rogerdudler.github.io/git-guide/index.it.html)

[comandi utili per usare git/github](https://github.com/joshnh/Git-Commands)

[emoji di github!](https://www.webfx.com/tools/emoji-cheat-sheet/)

1. andare sul sito github del progetto a cui si vuole collaborare (ad esempio: https://github.com/bluebird75/winpdb) e fare una fork del progetto in modo da copiarlo nel proprio github (occorre quindi aver fatto la login su github!); questa operazione creerà un repo remoto sul proprio account github con lo stesso nome del repo di partenza

2. clonare il proprio progetto github (repo remoto) in locale e se necessario configurarlo
```sh
git clone git@github.com:dlordi/winpdb.git
# se non funziona provare con http
# git clone https://github.com/dlordi/winpdb.git
```

3. il repo locale a questo punto ha solo un repo remoto, quello del proprio account github. Occorre aggiungere un altro repo remoto, quello dell'account da cui si è fatto fork del progetto; questo repo può essere usato in "sola lettura" e serve per poter riportare sul proprio repo locale le modifiche che altri fanno al progetto
```sh
# aggiunta del repo remoto di "sola lettura"
git remote add upstream git@github.com:bluebird75/winpdb.git
```

A questo punto sono presenti due repo remoti nel repo locale:

- `origin` che fa riferimento alla fork del progetto (cioé, al repo presente sul proprio account github). Su questo repo è possibile fare sia letture che scritture
- `upstream` che fa riferimento al repo remoto principale, quello di partenza da cui si è fatta la fork. Questo è il repo di "sola lettura".

4. a questo punto si può iniziare a lavorare in locale. Una regola da seguire è quella che ogni blocco di modifiche vengano fatte in un branch a parte in modo da separare meglio gli interventi fatti; è anche possibile che il progetto di partenza abbia più branch (ad esempio, un `master` per la versione stabile e un `develop` per la versione più recente): in questi casi, scegliere in base al tipo di lavoro che si vuole fare il branch più adatto
```sh
# posizionarsi, nel repo locale, sul branch più adatto in base al tipo di intervento che si deve fare
git checkout master

# sincronizzare il repo locale con eventuali modifiche che possono essere state fatte nel frattempo al repo remoto di partenza, quello "ufficiale"
git pull upstream master
# successivamente, sincronizzare il repo locale con il proprio repo remoto
git push origin master
```
a questo punto i 3 repo (quello locale e i 2 remoti) sono allineati

5. creazione di un nuovo branch per iniziare il proprio lavoro; il nome del branch può iniziare ad esempio con `feature/` o `bugfix/`
```sh
git checkout -b feature/copy-in-output-console
```
il precedente comando corrisponde a questi due
```sh
git branch feature/copy-in-output-console
git checkout feature/copy-in-output-console
```

A questo punto è possibile fare le modifiche in locale sul nuovo branch creato; una volta finite le modifiche in locale, per fare una pull request, è necessario che il branch sia prima portato anche sul proprio repo remoto con il comando
```sh
git push -u origin feature/copy-in-output-console
```

6. quando pronti per la pull request, andare su github (ad esempio: https://github.com/dlordi/winpdb); dovrebbe essere visibile il branch su cui si è lavorato con un bottone "Compare & pull request". In alternativa, il precedente comando `git push` dovrebbe aver visualizzato un link diretto in cui fare la pull request

7. fatta la pull request, si può ritornare sul branch master e cancellare il branch creato per la modifica
```sh
git checkout master
git branch -D feature/copy-in-output-console
```
A questo punto, si può ripartire dal punto 4 per continuare a fare altre modifiche

## Comandi utili

- elenco delle destinazioni con indicazione se sono fetch e/o push
```sh
git remote -v
```

- elenco dei branch
```sh
git branch -a
```

## Merge di un branch
1. posizionarsi nel branch IN CUI SI VUOLE FARE MERGE, tipicamente `master`
```sh
git checkout master
```
2. verificare che sia allineato con il repo remoto
```sh
git pull origin master
```
3. visualizzare i branch che sono stati merged in precedenza
```sh
git branch --merged
```
4. merge
  - si può fare un merge effettivo
```sh
git merge $NOME_DEL_BRANCH
```
  - oppure si può fare un merge lasciandosi la possibilità di controllare i conflitti/cambiamenti
```sh
git merge --no-commit --no-ff $NOME_DEL_BRANCH
```
  - in questo secondo caso occorre poi eseguire anche la `git commit`, oppure fare abort di tutto il merge
```sh
git merge --abort
```
  - prima di fare `git commit` o di fare abort di tutto il merge si possono vedere quali modifiche verrebbero applicate
```sh
git diff --cached
```
5. push sul repo remoto
```sh
git push origin master
```
