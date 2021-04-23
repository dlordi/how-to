- impostazioni da copiare in `.bash_profile`
	```sh
	bind '"\e[A": history-search-backward'
	bind '"\e[B": history-search-forward'

	alias ll='ls -las'
	alias dt='cd ~/Desktop'
	alias ..='cd ..'
	alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'
	```

- assicurarsi che il file `$HOME/.bash_profile` abbia i seguenti permessi: `-rw-r--r--`
	```sh
	chmod 644 $HOME/.bash_profile
	```
