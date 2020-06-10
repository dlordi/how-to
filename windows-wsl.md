# WSL:

Per attivarlo, cercare nel menu start la voce `funzionalità`; nella finestra che si apre cercare `Sottosistema linux`

### Comandi utili da Windows
- `wsl` fa partire il sottosistema linux in una shell
- `wslconfig` dato che è possibile installare più sottosistemi, con questo comando si possono gestire quelli installati (ad esempio, si può specificare il sottosistema di default con il comando `wslconfig /setdefault <sottosistema>`)
- `wsl --list` per elencare tutti i sistemi installati

## Il filesystem di WSL è in
`C:\Users\<utente>\AppData\Local\lxss\rootfs`

## dal prompt di dos
```sh
lxrun /uninstall /full
lxrun /install /y
```
