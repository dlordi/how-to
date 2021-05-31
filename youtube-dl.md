# Utilizzo di un file di configurazione
- su Windows
```bat
alias ydl=cd %HOMEDRIVE%%HOMEPATH%\Desktop & C:\dowe\bin\youtube-dl\youtube-dl.exe --config-location C:\dowe\bin\youtube-dl\youtube-dl.conf "$P$"
alias ymp3=cd %HOMEDRIVE%%HOMEPATH%\Desktop & C:\dowe\bin\youtube-dl\youtube-dl.exe --config-location C:\dowe\bin\youtube-dl\youtube-dl.conf --extract-audio --audio-format mp3 "$P$"
alias jydl=cd J:\DOWNLOAD\video & J:\software\youtube-dl\youtube-dl.exe --config-location J:\software\youtube-dl\youtube-dl.conf "$P$"
alias jymp3=cd J:\DOWNLOAD\audio & J:\software\youtube-dl\youtube-dl.exe --config-location J:\software\youtube-dl\youtube-dl.conf --extract-audio --audio-format mp3 "$P$"
```

- su Mac
```sh
--config-location /Volume/Sony_32CA1/DOWNLOAD/video/youtube-dl.conf
```

# Aggiornamento
```bat
C:\dowe\bin\youtube-dl\youtube-dl.exe -U
J:\software\youtube-dl\youtube-dl.exe -U
```

## Scarica la versione per linux
- con il prompt dei comandi
```bat
J: & cd \software\youtube-dl
wget -O youtube-dl https://youtube-dl.org/downloads/latest/youtube-dl
```

- con PowerShell
```ps1
J:
cd \software\youtube-dl
Invoke-WebRequest https://youtube-dl.org/downloads/latest/youtube-dl -OutFile youtube-dl
```

# qualità del video da scaricare
- usare il flag `-F` per avere un elenco delle scelte possibili associate ad una URL
- usare il flag `-f ` seguito da una delle opzioni dell'elenco precedente per scaricare la qualità voluta

# download video da C
```bat
C: & cd %HOMEDRIVE%%HOMEPATH%\Desktop
C:\dowe\bin\youtube-dl\youtube-dl.exe --config-location C:\dowe\bin\youtube-dl\youtube-dl.conf "https://www.twitch.tv/videos/1031714596"
```

# download mp3 da C
```bat
C: & cd %HOMEDRIVE%%HOMEPATH%\Desktop
C:\dowe\bin\youtube-dl\youtube-dl.exe --config-location C:\dowe\bin\youtube-dl\youtube-dl.conf --extract-audio --audio-format mp3 "https://www.youtube.com/watch?v=9EjWsAXGftk"
```

# download video da J
```bat
J: & cd \DOWNLOAD\video
J:\software\youtube-dl\youtube-dl.exe --config-location J:\software\youtube-dl\youtube-dl.conf "https://www.youtube.com/watch?v=KLEDKgMmbBI"
```

# download mp3 da J (bisogna avere ffmpeg)
```bat
J: & cd \DOWNLOAD\audio
J:\software\youtube-dl\youtube-dl.exe --config-location J:\software\youtube-dl\youtube-dl.conf --extract-audio --audio-format mp3 "https://www.youtube.com/watch?v=mffIIq3MHc8"
```

## Estrazione di una parte da un file MP3
```bat
J: & cd \DOWNLOAD\audio
J:\software\youtube-dl\ffmpeg -i 210408-lazanzara.mp3 -acodec copy -ss 00:10:00 -to 00:14:14 parenzo-vs-gottardo-su-raccomandazioni.mp3
```

## Conversione da flac a mp3
```bat
J:\software\youtube-dl\ffmpeg -i "K:\a_udio\ORA O MAI PIU\cd1\01. Jessica Morlacchi - Wwwmipiacitu.flac" -ab 320k -map_metadata 0 -id3v2_version 3 "K:\a_udio\ORA O MAI PIU\cd1\01. Jessica Morlacchi - Wwwmipiacitu.mp3"
```

## Aggiornamento di ffmpeg
- https://ffmpeg.org/download.html
