
* copia completa di un albero di directory
```bat
robocopy /MIR /NFL /NDL /NJH "<percorso di origine>" "<percorso di destinazione>"
```

* aggiungere una stringa ad un file se non già presente (codice da mettere in un file bat)
```bat
set NEWLINE=^& echo.

find /C /I "stringa da aggiungere" percorso_file
if %ERRORLEVEL% neq 0 echo %NEWLINE%^	stringa da aggiungere>>percorso_file
```
