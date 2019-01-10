
## Guida essenziale

Con Chrome occorre usare https per poter installare la PWA su un dispositivo

1. riferimento al manifest (il manifest serve a descrivere la PWA); questo codice va messo nella pagina html
```html
<link rel="manifest" href="/manifest.json">
```

2. contenuto del file `manifest.json`
```js
{
	"display": "standalone",
	"start_url": "index.html",
	"short_name": "MMO Suite",
	"name": "My Mini Office Suite",
	"description": "My Mini Office Suite",
	"background_color": "#fff",
	"theme_color": "#2196f3",
	"icons": [
		{
			"src": "logo-192.png",
			"sizes": "192x192",
			"type": "image/png"
		}
	]
}
```

3. per sapere se si sta visualizzando la pagina in un browser o in PWA mettere questo codice nella pagina html
```js
let isPWAinBrowser = true;
if (matchMedia('(display-mode: standalone)').matches) {
	// Android and iOS 11.3+
	isPWAinBrowser = false;
} else if ('standalone' in navigator) {
	// useful for iOS < 11.3
	isPWAinBrowser = !navigator.standalone;
}
```

Con Chrome, caricare la pagina html e andare in `dev tools`, `application` per controllare il manifest

## Service Worker

- servono per fare avere una cache alla PWA

- non sono indispensabili

- non è collegato ad una singola pagina ma da un insieme di pagina (tutte quelle nella sottodirectory del service worker)

- su un dispositivo, il service worker viene eseguito anche se la PWA non è visibile, ma una volta eseguito viene automaticamente sospeso dal browser

- deve essere registrato da un javascript presente in tutte le pagine del sito; codice da mettere nella pagina html per registrare il service worker
```js
if ('serviceWorker' in navigator) {
	window.addEventListener('load', function () {
		navigator.serviceWorker.register('/service-worker.js')
	})
}
```

- contenuto del file `service-worker.js`
```js
const CACHE_VERSION = 'v1';
const CACHE_LIST = ['index.html', 'css/main.css', 'js/main.js'];

self.addEventListener('install', (event) => {
	const cache = await event.waitUntil(caches.open(CACHE_VERSION));
	cache.addAll(CACHE_LIST);
});

```

## Utility varie

[icone gratuite](https://www.iconfinder.com/search/?q=app&price=free)

[generatore online del file manifest.json](https://app-manifest.firebaseapp.com/)
