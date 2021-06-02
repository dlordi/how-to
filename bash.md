- assicurarsi che il file `$HOME/.bash_profile` abbia i seguenti permessi: `-rw-r--r--`
	```sh
	chmod 644 $HOME/.bash_profile
	```

- impostazioni da copiare in `.bash_profile`
	```sh
	bind '"\e[A": history-search-backward'
	bind '"\e[B": history-search-forward'

	shopt -s histappend
	alias ll='ls -las'
	alias ..='cd ..'
	```

- impostazioni da copiare in `.bash_profile` specifiche per MacOS X
	```sh
	alias dt='cd ~/Desktop'
	alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'
	```
