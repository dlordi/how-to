- generare le chiavi SSH per GitHub e GitLab

- installare [python](https://www.python.org/)

- installare **PER TUTTI GLI UTENTI** i font
  - [Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro)
  - [Cascadia Code](https://github.com/microsoft/cascadia-code/releases)

- installare [git](https://git-scm.com/download/win)
  - se si installa git con chocolatey usare questo comando
  ```bat
  choco install git.install --params "/GitOnlyOnPath /NoAutoCrlf /NoShellIntegration /NoGuiHereIntegration /NoShellHereIntegration /SChannel"
  ```

- installare [Visual Studio Code](https://code.visualstudio.com/)
  - abilitare il sync delle impostazioni/estensioni/ecc... tramite account GitHub

- installare [.NET SDK](https://dotnet.microsoft.com/download/dotnet/)
  - disabilitare l'invio di dati con telemetria (impostare variabile d'ambiente `DOTNET_CLI_TELEMETRY_OPTOUT=1`)

- installare [WinMerge](https://winmerge.org/)

- installare [WSL 2](../windows-wsl.md)
