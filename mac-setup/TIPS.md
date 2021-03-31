# Varie
- Dashboard:
	- disabilita la dashboard permanentemente
		```sh
		defaults write com.apple.dashboard mcx-disabled -boolean TRUE; killall Dock
		```

- Finder
	- tenendo premuto la barra spazio quando un file è selezionato, si ha una preview del suo contenuto
	- se si tiene premuto a lungo il tasto verde di una finestra, è possibile metterla a metà schermo
	- `Shift+Command+A`: apre una finestra in Applicazioni
	- `Shift+Command+D`: apre una finestra nella Scrivania/Desktop
	- `Shift+Command+H`: apre una finestra nella home directory
	- `Control+Command+Q`: fa il logout senza mettere il computer in sleep

- Dock
	- la combinazione di tasti `Alt+Command+D` visualizza/nasconde la dock
	- modifica il delay per visualizzare la dockbar
		```sh
		defaults write come.apple.dock autohide-delay -float 0; killall Dock
		```
	- modifica il tempo di transizione per visualizzare la dockbar
		```sh
		defaults write come.apple.dock autohide-time-modifier -float 0; killall Dock
		```

- creazione di un file zip protetto da password
	```sh
	zip -e output.zip <file1> <file2>
	```

- apre il popup di stampa sempre nelle opzioni estese
	```sh
	defaults write -g PMPrintingExpandedStateForPrint -bool TRUE
	```

# Homebrew
- per generare il file `Brewfile` che contiene l'elenco di tutti i pacchetti installati con Homebrew usare il comando
	```sh
	brew bundle dump
	```
- installazione degli strumenti di sviluppo
	```sh
	xcode-select --install
	```
- se ci sono errori del tipo `Error: Cask 'syncmate' definition is invalid: invalid 'depends_on macos' value: ":mountain_lion"` eseguire il seguente comando per cancellare la dipendenza dal sistema operativo nei file dei cask che generano l'errore (vedi [questo sito](https://github.com/Homebrew/homebrew-cask/issues/58046))
	```sh
	/usr/bin/find "$(brew --prefix)/Caskroom/"*'/.metadata' -type f -name '*.rb' -print0 | /usr/bin/xargs -0 /usr/bin/perl -i -pe 's/depends_on macos: \[.*?\]//gsm;s/depends_on macos: .*//g'
	```

# SyncMate
- se i Contatti e/o il Calendario non vengono visti
	- cancellare e poi ripristinare i permessi all'app su android
	- fare il riavvio sia del mac che del telefonino
	- fare una prima sincronizzazione del Calendario configurando SyncMate in modo da importare dal telefonino gli eventi nel calendario del mac (in questo modo si evita che per un qualche malfunzionamento il mac possa cancellare gli eventi sul telefonino!)
	- in seguito, riportare la configurazione in modo da fare un confronto fra gli eventi del telefonino e quelli del calendario del mac!

# httpd
- DocumentRoot is `/usr/local/var/www`.
- The default ports have been set in `/usr/local/etc/httpd/httpd.conf` to `8080` and in `/usr/local/etc/httpd/extra/httpd-ssl.conf` to `8443` so that httpd can run without sudo.
- To have launchd start httpd now and restart at login: `brew services start httpd`
- Or, if you don't want/need a background service you can just run: `apachectl start`

# Shortkey per strumento di cattura schermo
- tutto il desktop: `Shift+Cmd+3`
- selezione rettangolare: `Shift+Cmd+4` (tenendo in seguito premuta la barra spazio la selezione può essere spostata)
- cattura finestra: `Shift+Cmd+4+SpaceBar`
- disabilita l'ombreggiatura nel cattura finestra
	```sh
	defaults write com.apple.screencapture disable-shadow -bool TRUE; killall SystemUIServer
	```

# Preferenze di Sistema
- Keyboard ➡ Text ➡ Disable "Correct spelling automatically"
- Security and Privacy ➡ Firewall ➡ On
- Security and Privacy ➡ General ➡ Allow App Store and identified developers
- File Sharing ➡ Off

# Oh My Zsh (https://github.com/ohmyzsh/ohmyzsh#using-oh-my-zsh)
- installazione
	```sh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	```
	- aggiungere a ~/.zshrc, nella sezione plugins, queste istruzioni
		```sh
		plugins=(
		    zsh-autosuggestions
		    zsh-syntax-highlighting
		)
		```

# Link
- https://github.com/herrbischoff/awesome-macos-command-line/blob/master/README.md
