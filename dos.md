
- copia completa di un albero di directory
```bat
robocopy /MIR /NFL /NDL /NJH "<percorso di origine>" "<percorso di destinazione>"
```
in alternativa, usare
```bat
rem assicurarsi che la directory di destinazione esista (e sia vuota...) per evitare che xcopy chieda all'utente il tipo di destinazione
mkdir "<percorso di destinazione>"
xcopy /s /e /c /h /k /y "<percorso di origine>" "<percorso di destinazione>"
```

- aggiungere una stringa ad un file se non già presente (codice da mettere in un file bat)
```bat
set NEWLINE=^& echo.

find /C /I "stringa da aggiungere" percorso_file
if %ERRORLEVEL% neq 0 echo %NEWLINE%^	stringa da aggiungere>>percorso_file
```

- elencare le dll richieste da un eseguibile (è necessario installare i build tools di visual studio per avere il comando!)
```bat
dumpbin /dependents "file da controllare"
```

- informazioni sulla CPU
```bat
WMIC CPU Get /Format:List
```

- come vedere il product key di attivazione di windows
```bat
wmic path softwarelicensingservice get OA3xOriginalProductKey
```

- `echo` senza il newline finale
```bat
echo | set /p="avvio servizio... "
```

- modificatori di variabili

| Variabile con modificatore   | Descrizione |
|------------------------------|-------------|
| `%~1`                        | Expands `%1` which removes any surrounding quotation marks (`""`) |
| `%~f1`                       | Expands `%1` to a fully qualified path name |
| `%~d1`                       | Expands `%1` to a drive letter only |
| `%~p1`                       | Expands `%1` to a path only |
| `%~n1`                       | Expands `%1` to a file name only |
| `%~x1`                       | Expands `%1` to a file extension only |
| `%~s1`                       | Expands path to contain short names only |
| `%~a1`                       | Expands `%1` to the file attributes of file |
| `%~t1`                       | Expands `%1` to the date and time of file |
| `%~z1`                       | Expands `%1` to the size of file |
| `%~$PATH:I`                  | Searches the directories listed in the `PATH` environment variable and expands `%I` to the fully qualified name of the first one found. If the environment variable name is not defined or the file is not found by the search, this modifier expands to the empty string |

