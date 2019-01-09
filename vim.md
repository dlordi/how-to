
# Gestione UTF8 (esempi: à ζ 漢 🎉)

## Riconoscere i caratteri UTF8 già presenti in un file che viene aperto

```cfg
:set encoding=utf-8
```

## Gestire l'inserimento di nuovi caratteri UTF8

```cfg
:set fileencoding=utf-8
```

# Windows

Il file di configurazione si deve chiamare `_vimrc` e deve essere nella HOME directory dell'utente (variabile di ambiente `%HOME%`)
