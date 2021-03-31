```sh
yum install python2-pip.noarch
pip install -U pip geoip2
```

```sh
# wget https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz
# gunzip GeoLiteCity.dat.gz

wget https://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz
gunzip GeoLite2-Country.tar.gz
```

il database è nel file `.mmdb`

```py
import geoip2.database

reader = geoip2.database.Reader('GeoLite2-Country.mmdb')
response = reader.country('INDIRIZZO_IP')
print '%s, %s' % (response.country.iso_code, response.country.name)
```
