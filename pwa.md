[icone gratuite](https://www.iconfinder.com/search/?q=app&price=free)

[generatore online del file manifest.json](https://app-manifest.firebaseapp.com/)

with chrome, you must use https (except localhost) to install pwa on a device

add
```html
<link rel="manifest" href="manifest.json"> <!-- manifest.json describes the pwa -->
```
to `index.html`

load `index.html` and then go to chrome dev tools -> application to check manifest

a service worker is required for a pwa; service worker is not attached to a single page, but to a set of pages (all pages in subdirs of the service worker); on a device, service worker will run even if the pwa is hidden; service worker must be registerd by some js included in all pages of a site
