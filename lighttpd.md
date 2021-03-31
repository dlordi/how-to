# lighttpd
```sh
# il server lighttpd e' stato installato a partire dai sorgenti con il seguente comando (eseguito da root)
./configure --without-pcre --prefix=/usr/local/lighttpd-1.4.28

# la compilazione e' stata fatta con il seguente comando (da root)
make

# l'installazione e' stata fatta da root con il seguente comando
make install

# per poterlo avviare (da root)
cd /usr/local/lighttpd-1.4.28
sbin/lighttpd -D -f lighttpd.conf
```

file di configurazione lighttpd.conf

```ini

server.port = 8123
server.bind = "127.0.0.1"

server.document-root = "/var/www/html"

server.username = "apache"
server.groupname = "apache"

mimetype.assign = (
	".html" => "text/html",
	".txt" => "text/plain",
	".jpg" => "image/jpeg",
	".png" => "image/png"
)

static-file.exclude-extensions = ( ".cgi" )
index-file.names = ( "/bin/controller.cgi" )

server.modules += ( "mod_cgi" )
cgi.assign = (
	".cgi" => "/usr/local/python2.7/bin/python"
)

#server.modules += ( "mod_fastcgi" )
#fastcgi.debug = 1
#fastcgi.server = (
#		".cgi" => (
#			"localhost" => (
##				"socket" => "/tmp/fcgi.sock",
#				"host" => "127.0.0.1",
#				"port" => 8321,
#				"min-procs" => 1
#			)
#		)
#	)

server.modules += ( "mod_alias" )
alias.url = ( "/bin/" => "/var/www/cgi-bin/" )

server.modules += ( "mod_rewrite" )
url.rewrite-once = (
	"^/\?(.*)$" => "/bin/controller.cgi?$1",
	"^/$" => "/bin/controller.cgi"
)
```
