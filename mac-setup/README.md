
# Preparazione della reinstallazione
- riavviare il Mac tenendo premuti i tasti `Command+R` finché non compare la schermata di recovery
- usare l'Utility Disco per formattare il disco "Macintosh HD" con file system APFS
- avviare la reinstallazione (serve avere una connessione di rete)
- per la procedura dettagliata vedere anche
	- https://support.apple.com/it-it/HT204904
	- https://support.apple.com/it-it/guide/mac-help/mh27903/mac

# Installazione
- scelta del tema scuro
- creare utente "Domenico Lordi" con username "dome"
- **disabilitare tutte le voci relative ad iCloud**
	- andare in Preferenze di Sistema e cercare iCloud
	- togliere gli spunta da tutte le caselle
- installazione strumenti di sviluppo richiesti da alcuni package di homebrew
	```sh
	xcode-select --install
	```
- installazione di homebrew usando il comando presente sul [sito internet](http://brew.sh)
- disabilitare le analytics di `brew`
	```sh
	brew analytics off
	```
	- se necessario, fare unshallow del repo con questi comandi
	```sh
	git -C "/usr/local/Homebrew/Library/Taps/homebrew/homebrew-core" fetch --unshallow
	git -C "/usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask" fetch --unshallow
	```
- eseguire questi comandi per aggiornare l'elenco dei package installabili con brew e per verificare che non ci siano stati problemi di installazione
	```sh
	brew update && brew doctor
	```
- ~~scaricare il file [`Brewfile`](Brewfile) ed eseguire il seguente comando per installare tutti i pacchetti (vedi [questo sito](https://tomlankhorst.nl/brew-bundle-restore-backup))~~
	```sh
	brew bundle
	```

# MacOS X
- Preferenze di Sistema
	- nella voce "Mouse" (**solo il mouse, non la trackpad**)
		- togliere la spunta da "Direzione scorrimento: naturale"
		- impostare "Velocità puntatore" su "Veloce"
	- nella voce "Monitor", impostare
		- la risoluzione dello schermo a "Più spazio"
		- abilitare l'opzione "Night Shift" (vedi anche https://support.apple.com/it-ch/guide/mac-help/mchl97bc676d/mac)
		- eventualmente, impostare anche il duplica su più schermi se si collega un monitor esterno
	- nella voce "Tastiera", impostare
		- "Ripetizione tasto" su "Veloce"
		- "Ritardo iniziale" su "Corto"
	- nella voce "Accessibilità" ➡ "Zoom", abilitare lo zoom dello schermo con il tasto Command + scroll
		- spuntare "Usa gesti di scorrimento con tasti modificatori per ingrandire"
		- scegliere il tasto Command
	- nella voce "Mission Control" ➡ "Angoli attivi", abilitare l'angolo in basso a destra per visualizzare il desktop tenendo premuto il tasto Command
		- tenendo premuto il tasto Command, scegliere nel menu dell'angono in basso a destra la voce "Scrivania"
	- nella voce "Dock e barra dei menu" spuntare "Mostra e nascondi automaticamente il Dock"
- abilitare l'utente `root` (vedi [questo sito](https://support.apple.com/it-it/HT204012))
- configurazione di Finder (usare `Command+,` per accedere alle impostazioni)
	- nella scheda "Avanzate"
		- spuntare "Mostra tutte le estensioni dei nomi file"
		- alla voce "Tieni le cartelle in alto:", spuntare "Nelle finestre quando le ordini per nome"
	- mettere la visualizzazione dei dettagli
		- menu "Vista" ➡ "Come elenco"
	- visualizzare i file nascosti, visualizzare la barra di stato e la barra del percorso
		```sh
		defaults write com.apple.finder ShowPathbar -bool true
		defaults write com.apple.finder ShowStatusBar -bool true
		defaults write com.apple.finder AppleShowAllFiles true
		killall Finder
		```
- configurazioni varie
	```sh
	# Expand save panel by default
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

	# Expand print panel by default
	defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
	defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

	# Save to disk (not to iCloud) by default
	defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

	# Enable full keyboard access for all controls
	# (e.g. enable Tab in modal dialogs)
	defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

	# Save screenshots to the desktop
	defaults write com.apple.screencapture location -string "${HOME}/Desktop"

	# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
	defaults write com.apple.screencapture type -string "png"
	```

# MacPass
- installazione
	```sh
	brew install --cask macpass
	```
- copiare il file delle password di MacPass nella directory `Documenti` e aprirlo

# Firefox
- installazione
	```sh
	brew install --cask firefox
	```
- impostarlo come browser predefinito
- accedere con l'account Firefox in modo da sincronizzare bookmark, plugin, ecc...
- scegliere di visualizzare sempre la barra dei segnalibri
- ~~nelle impostazioni, scegliere "Chiedi dove salvare ogni file"~~ dovrebbe già essere impostato avendo fatto l'accesso con l'account Firefox
- ~~impostare con il tema di default del sistema operativo~~ dovrebbe già essere impostato avendo fatto l'accesso con l'account Firefox
	- ~~andare in Componenti aggiuntivi ➡ Temi ➡ disattivare temi Chiaro e Scuro in modo che resti attivo quello Predefinito~~
- ~~impostare YouTube con il tema scuro~~ (sembra che lo faccia in automatico...)

# Sublime Text
- installazione
	```sh
	brew install --cask sublime-text
	```

# Terminale
- aumentare la dimensione del font
	- Preferenze ➡ Profili ➡ Testo ➡ Font (usare dimensione 14)
- chiudere la finestra quando si esce dalla shell
	- Preferenze ➡ Profili ➡ Shell ➡ Quando la shell si conclude ➡ Chiudi se la shell si è conclusa senza errori

# SSH
- creare una coppia chiave privata/chiave pubblica
	```sh
	ssh-keygen -t ed25519
	```
	- chiave privata: `$HOME/.ssh/id_ed25519`
	- chiave pubblica: `$HOME/.ssh/id_ed25519.pub`
- ~~creare una coppia chiave privata/chiave pubblica~~ sostituito dal più sicuro metodo precedente
	```sh
	ssh-keygen -t rsa -b 4096 -C "domenico.lordi@gmail.com"
	```
	- chiave privata: `$HOME/.ssh/id_rsa`
	- chiave pubblica: `$HOME/.ssh/id_rsa.pub`

# GitHub e GitLab
- aggiornare la chiave pubblica
	- per GitLab, vedi [questo link](https://gitlab.com/-/profile/keys)
	- ~~per GitHub, vedi [questo link](https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)~~

# Git
- installazione
	```sh
	brew install git
	```
- per la configurazione vedere [how-to di git](../git.md)

# NodeJS
- installazione
	```sh
	brew install node
	```
- eseguire `npm` per verificare se deve essere aggiornato
- package da installare globalmente
	```sh
	npm install -g @vue/cli
	npm install -g firebase-tools
	npm install -g lite-server
	```

# Visual Studio Code
- installazione
	```sh
	brew install --cask visual-studio-code
	```
- **TODO**: accedere per poter sincronizzare tutte le impostazioni e i plugins installati
- estensioni utili
	```txt
	CoenraadS.bracket-pair-colorizer-2
	eamodio.gitlens
	octref.vetur
	vscode-icons-team.vscode-icons
	```
- altre estensioni
	```txt
	suntobright.vscode-sftp
	bradgashler.htmltagwrap
	donjayamanne.githistory
	formulahendry.code-runner
	ms-dotnettools.csharp
	ms-python.python
	ms-python.vscode-pylance
	ms-vscode-remote.remote-containers
	ms-vscode-remote.remote-ssh
	ms-vscode-remote.remote-ssh-edit
	ms-vscode-remote.remote-ssh-explorer
	ms-vscode-remote.remote-wsl
	ms-vscode-remote.vscode-remote-extensionpack
	ms-vscode.cpptools
	```
- per installarle in blocco, creare un file `extensions.txt` contenente l'elenco precedente ed eseguire
	```sh
	code --install-extensions extensions.txt
	```
- impostazioni utili
	```json
	{
	    "telemetry.enableCrashReporter": false,
	    "telemetry.enableTelemetry": false,
	    "explorer.openEditors.visible": 0,
	    "editor.renderWhitespace": "all",
	    "workbench.iconTheme": "vscode-icons",
	    "git.confirmSync": false,
	    "workbench.startupEditor": "newUntitledFile",
	    "python.showStartPage": false,
	    "git.autofetch": true,
	    "git.enableSmartCommit": true,
	    "workbench.settings.openDefaultSettings": true,
	    "workbench.settings.useSplitJSON": true,
	    "workbench.settings.editor": "json"
	 }
	 ```
- altre impostazioni
	```json
	{
	    "editor.fontSize": 14,
	    "editor.fontFamily": "'Source Code Pro', Menlo, Monaco, 'Courier New', monospace",
	    "editor.lineHeight": 0,
	    "editor.rulers": [
		80
	    ],
	    "editor.insertSpaces": false,
	    "editor.mouseWheelZoom": true,
	    "editor.minimap.enabled": true,
	    "editor.dragAndDrop": true,
	    "editor.multiCursorModifier": "ctrlCmd",
	    "editor.renderIndentGuides": true,
	    "editor.snippetSuggestions": "top",
	    "editor.formatOnPaste": true,
	    // "sublimeTextKeymap.promptV3Features": true,
	    // "window.openFilesInNewWindow": true,
	    "window.zoomLevel": 0,
	    "files.autoSave": "off",
	    "files.associations": {
		"*.html": "html"
	    },
	    "files.exclude": {
		"**/.git": true,
		"**/.svn": true,
		"**/.hg": true,
		"**/CVS": true,
		"**/.DS_Store": true,
		"**/*.pyc": {
		    "when": "$(basename).py"
		},
		"**/__pycache__": true
	    },
	    "window.titleBarStyle": "custom",
	    "workbench.colorTheme": "Visual Studio Dark",
	    "workbench.editor.enablePreview": false,
	    "workbench.tree.indent": 16,
	    "editor.suggestSelection": "first",
	    "debug.console.fontFamily": "'Source Code Pro', Consolas, 'Courier New', monospace",
	    "typescript.updateImportsOnFileMove.enabled": "always",
	    "python.linting.enabled": true,
	    "python.linting.pylintEnabled": true,
	    // "vsintellicode.modify.editor.suggestSelection": "automaticallyOverrodeDefaultValue",
	    "vetur.format.defaultFormatter.js": "vscode-typescript",
	    "vetur.format.defaultFormatter.ts": "vscode-typescript",
	    "code-runner.enableAppInsights": false,
	    "code-runner.executorMap": {
		"java": "cd $dir && \"%JAVA_HOME%\\bin\\javac\" $fileName && \"%JAVA_HOME%\\bin\\java\" $fileNameWithoutExt",
		"python": "$pythonPath -u $fullFileName"
	    },
	    "code-runner.showExecutionMessage": false,
	    "code-runner.clearPreviousOutput": true,
	    "editor.renderControlCharacters": false,
	    "editor.quickSuggestions": {
		"other": false,
		"comments": false,
		"strings": false
	    },
	    "python.languageServer": "Pylance",
	    "python.defaultInterpreterPath": "/usr/bin/python3"
	}
	```
- ~~[Finder toolbar app to open current folder in Visual Studio Code](https://github.com/sozercan/OpenInCode)~~
- ~~aggiungere una voce "Open in VSCode" al menu contestuale del Finder~~
	- vedi https://apple.stackexchange.com/questions/238948/osx-how-to-add-a-right-click-option-in-folder-to-open-the-folder-with-an-applic
		- In macOS Mojave (10.14.2), I could not find Service option in Automator. So I had to follow the below steps to open folder contents in Preview app:
			- lanciare Automator
			- File > Nuovo
			- scegliere `Azione Rapida` e fare click su Scegli
			- per la voce "Il flusso di lavoro elabora l'elemento attuale" scegliere `file e cartelle` in `Finder`"
			- From the left hand side pane in Automator, drag-drop Library > Utilities > Run Shell Script into the right hand pane
			- Ensure Pass input is set to "as arguments"
			- Then paste the below text:
				```sh
				for f in "$@"; do
				   open -a 'Visual Studio Code' "$f"
				done
				```
			- Click File > Save
			- Give name as "Open in VSCode"
			- Go to Finder, select a folder containing PDF files, right click on folder name in finder > choose Quick Actions > Open In Preview
			- All the PDF files should now open in Preview.

# Chrome
- accedere con la mia mail in modo da sincronizzare bookmark, ecc...

# Heroku
- installazione
	```sh
	brew tap heroku/brew && brew install heroku
	```
- eseguire la login restando nel terminale
	```sh
	heroku login -i
	```

# LibreOffice
- installazione
	```sh
	brew install --cask libreoffice
	```
- ~~è stato necessario andare nelle Preferenze di Sistema ➡ Sicurezza e Privacy e consentire l'esecuzione di OpenOffice~~

# Magic Mouse
- per accoppiarlo via bluetooth è sufficiente accenderlo e fare click sui tasti
- in Preferenze di Sistema, configurarlo in modo che il Click secondario sia "Fai click sul lato destro"

# Stampante HP OfficeJet 6100 di casa
- collegare e accendere la stampante
- nelle Preferenze di Sistema, scegliere Stampanti e Scanner; provando ad aggiungere un nuova stampante, dovrebbe proporre la stampate
	- **ATTENZIONE**: non vengono installati dei driver specifici (che sembranon non esistere nemmeno sul sito HP) ma solo dei driver generici
	- **ATTENZIONE**: non viene riconosciuta come stampante multifunzione: non si riesce ad usare lo scanner

# Sublime Text
- ~~installare il Package Control~~
- ~~configurazione:~~
	```json
	{
		"draw_white_space": "all",
		"font_face": "Source Code Pro",
		"font_size": 16,
		"highlight_line": true,
		"theme": "Adaptive.sublime-theme"
	}
	```

# Rectangle (window manager: consente di spostare le finestre con delle combinazioni di tasti)
- installazione (richiede permessi speciali)
	```sh
	brew install --cask rectangle
	```
- nella configurazione, abilitare gli aggiornamenti automatici

# ~~Bash~~ sostituita da zsh

# ~~iTerm2~~
- utilizzo del font Source Code Pro
	- andare in Preferenze di Sistema ➡ Profiles ➡ Text
		- scegliere il font "Source Code Pro" e dimensione 14
- abilitato il tema minimal
	- Preferences ➡ Appearance ➡ Theme: Minimal
- abilitata la status bar nella parte bottom della finestra
	- Preferences ➡ Appearance ➡ General ➡ Status bar location: Bottom
- alla status bar è stato aggiunto il componente per visualizzare il carico della CPU
	- Preferences ➡ General ➡ Profiles ➡ Session ➡ Configure Status Bar
- le icone da visualizzare nelle tab sono quelle di default associate alle applicazioni
	- Preferences ➡ General ➡ Profiles ➡ General ➡ Icon: Built-in Icon for Current App
- all'apertura di una nuova tab, posizionarsi nella directory della scheda precedente
	- Preferences ➡ General ➡ Profiles ➡ Working Directory ➡ Reuse previous session's directory
- usare le classiche combinazioni del Mac per spostarsi nel testo
	- Preferences ➡ Keys ➡ Presets ... ➡ Natural Text Editing

# ~~Alfred~~
- sono state consentite le notifiche
- è stato concesso l'accesso alla scrivania, ai documenti e al download

# ~~SyncMate~~
- disabilitare l'invio di statistiche anonime
- per il Moto Z2 Play, nella scheda Calendar, mettere come periodo "ALL" sia per gli eventi passati che per quelli futuri
- nelle Preferenze di sistema ➡ Sicurezza e Privacy, è stato dato a SyncMate il privilegio di accedere a
	- Calendario
	- Contatti
	- 

# ~~iTunes~~
- nella scheda Store togliere la spunta dalla voce "Condividi informazioni sulla tua libreria con Apple"
- importazione della libreria dal disco di backup
- autorizzare il computer all'Apple Store in modo da poter scaricare gli aggiornamenti software dei programmi preinstallati (ad es: Numbers)
	- vedi https://support.apple.com/it-it/HT201251
	- TL;DR: occorre aprire iTunes, andare nel menu Account ➡ Autorizzazioni ➡ Autorizza questo PC ed inserire utente e password dell'Apple ID
	- occorre poi anche fare l'accesso!

# ~~AppStore~~
- accedere all'Apple Store
	- nell'AppStore è necessario controllare se ci sono dei termini e condizioni da accettare prima di poter scaricare gli aggiornamenti dei programmi

# ~~OnyX (utility simile a CCleaner)~~
- sono stati dati i permessi di accesso completo al disco
	- nel pannello di sistema, selezionare sicurezza e privacy
	- fare click sul lucchetto per abilitare le modifiche ai settaggi
		- inserire la password!
	- andare nella sezione di sinistra Accesso completo al disco
	- mettere la spunta su OnyX

# Altro
- https://github.com/mathiasbynens/dotfiles
- https://dotfiles.github.io/
- https://github.com/CoreyMSchafer/dotfiles
- [Abbreviazioni accessibilità del Mac](https://support.apple.com/it-it/HT204434)
- [MacBook All-in-One For Dummies Cheat Sheet](https://www.dummies.com/computers/macs/macbook/macbook-all-in-one-for-dummies-cheat-sheet/)
- [Combinazioni di tasti durante l'avvio del Mac](https://support.apple.com/it-it/HT201255)
- [app per vedere la TV con la TV stick](http://www.pctvsystems.com/FuugoMacSoftwareIT/tabid/318/language/it-IT/Default.aspx)
- [Abbreviazioni da tastiera Spotlight sul Mac](https://support.apple.com/it-it/guide/mac-help/mh26783/mac)
