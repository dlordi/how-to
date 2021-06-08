## Installazione (vedi anche https://docs.microsoft.com/it-it/windows/wsl/install-win10)
  - eseguire questi comandi in una powershell come amministratore
```bat
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart
```
  - fare un riavvio
  - installare [pacchetto di aggiornamento del kernel linux](https://docs.microsoft.com/it-it/windows/wsl/install-win10#step-4---download-the-linux-kernel-update-package)
  - eseguire questi comandi in una powershell come amministratore
```bat
wsl.exe --set-default-version 2
```
  - installare una distribuzione dallo store (vedi anche https://docs.microsoft.com/it-it/windows/wsl/install-win10)

### Comandi utili da Prompt dei comandi
- `wsl` fa partire il sottosistema linux in una shell
- `wsl --list --all --verbose` per elencare tutti i sistemi installati
- per disinstallare un sistema **CANCELLANDO ANCHE TUTTO IL FILE SYSTEM**
  - `wsl --unregister %NOME_DISTRO%`
- `wslconfig` è un comando utile per fare alcune operazioni che comunque si possono svolgere con `wsl`

### Varie
- il filesystem di WSL è in `%USERPROFILE%\AppData\Local\lxss\rootfs`

## ~~dal prompt di dos~~
```sh
lxrun /uninstall /full
lxrun /install /y
```

# ~~CentWSL~~
- [riferimento principale](https://github.com/yuk7/CentWSL)
