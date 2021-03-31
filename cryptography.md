## Formati dei file

- [PKCS](https://it.wikipedia.org/wiki/PKCS)

- [Comandi per convertire i vari formati](https://www.sslshopper.com/ssl-converter.html)

- `CSR`
  - Certificate Signing Request, contiene la richiesta ad una CA di generare un certificato di firma
  - il formato usato è **PKCS10** (definito nella RFC 2986)
  - include delle informazioni come nome, organizzazione e la chiave pubblica da firmare
  - a fronte del CSR la CA produce il certificato pubblico (che è, in sostanza, la sola chiave pubblica insieme a una descrizione del soggetto; nel certificato è sempre anche incluso l'algoritmo usato per generare la chiave pubblica e l'algoritmo di firma)

- `PEM`/`DER`
  - formato **NON CRIPTATO** per contenitori che può includere solo il certificato pubblico (ad esmpio, nelle installazioni di Apache, i file dei certificati delle CA sono in `/etc/ssl/certs`), oppure può includere una intera catena di certificati comprese chiavi pubbliche, private e certificati radice
  - le chiavi contenute sono in formato x509 ASN.1
  - può anche includere un `CSR` dato che supporta il formato PKCS10
  - `PEM`: rappresentazione testuale codificata base64 ()
    - inizia con <nobr>`-----BEGIN CERTIFICATE-----`</nobr> e finisce con <nobr>`-----END CERTIFICATE-----`</nobr>
  - `DER`: rappresentazione binaria
    - comando per convertire il formato `DER` in `PEM`
      ```sh
      openssl x509 -inform der -in to-convert.der -out converted.pem
      ```
  - `.cert`, `.cer`, `.crt`: estensioni usate su Windows

- `.key`
  - file in formato `PEM` che contiene **solo** la chiave privata di uno specifico certificato (è solo una convenzione, non c'è nessuno standard; nelle installazioni di Apache si trova in `/etc/ssl/private`)
  - le permission su questi file sono importanti al punto che alcuni programmi non li leggono se non sono impostati correttamente.

- `PKCS12`
  - estensioni: `.pkcs12`, `.pfx`, `.p12`
  - contenitore (protetto da password) di coppie di certificati pubblici e privati, oltre che delle informazioni sul proprietario
  - a differenza dei file `PEM`, questo contenitore è del tutto criptato e certificato da una terza parte
  - con questo certificato, un utente può identificarsi e autenticarsi con chiunque si fidi della terza parte
  - comando per trasformarlo in `PEM` con entrambe le chiavi pubblica e privata:
    ```sh
    openssl pkcs12 -nodes \
      -in file-to-convert.p12 \
      -out converted-file.pem
    ```

- `PKCS7`
  - sintassi standard per contenitori di dati firmati e/o criptati
  - può usare i formati `PEM`/`DER`
  - non contiene chiavi private
  - utilizzato tipicamente per contenere certificati o `CRL`
  - estensione tipica su Windows: `.p7b`

- `.p7b`, `.keystore`
  - formato usato su Windows per lo scambio di certificati
  - a differenza dei certificati `PEM`, in questo formato è possibile includere il percorso di certificazione dei certificati.

- `CRL`
  - contiene le revoche dei certificati rilasciati da una CA, ad esempio per scadenza
  - si possono in genere scaricare dal sito web della CA

- `.p7m`
  - [Guida di riferimento](https://quoll.it/firma-digitale-p7m-come-estrarre-il-contenuto/)
  - file PDF nel quale è presente una firma digitale formato PKCS#7
  - non è altro che un contenitore che incapsula sia il documento originale (non criptato) che la firma digitale personale e quella della catena della CA che ha rilasciato il certificato
  - nell'ordine, contiene:
    1. nei primi byte, l'header `PKCS7`
    2. il documento originale (non criptato)
    3. l'hash di firma (che valida per legge il contenuto)
    4. il certificato digitale personale di chi ha firmato
    5. il certificato della CA
  - comando per estrarre il PDF contenuto
    ```sh
    openssl smime -verify -noverify \
      -in documento.pdf.p7m -inform DER \
      -out documento.pdf
    ```
  - comando per estrarre il certificato digitale personale di chi ha firmato
    ```sh
    openssl pkcs7 -print_certs \
      -in documento.pdf.p7m -inform DER \
      -out cert.pem
    ```
    il certificato viene estratto nel file `cert.pem` e se si vuole visualizzare in modo testuale basta il comando per i certificati x509
    ```sh
    openssl x509 -in cert.pem -text -noout
    ```
    per verificare la validità del certificato
    ```sh
    openssl verify cert.pem
    ```

---

## Generazione di un certificato da una CA

CA = Certification Authority; ente (fidato da entrambe le parti che si devono scambiare dati) che certifica l'identità di un soggetto tramite il rilascio di un certificato.

Il certificato è ottenuto firmando la chiave pubblica di un soggetto (assieme ad alcune sue informazioni, come nome, organizzazione, ecc...) con la chiave privata della CA; ogni certificato ha un intervallo temporale di validità, trascorso il quale la CA può revocare il certificato.

La CA tiene un registro pubblicamente accessibile dei certificati digitali rilasciati (e anche quelli revocati).

Differenti tipi di certificato:
- Un **Certificato digitale di Sottoscrizione** è utilizzato per definire la corrispondenza tra il soggetto richiedente il certificato e la sua chiave pubblica. Questi certificati sono quelli utilizzati per l'apposizione di firme digitali a valenza legale.

- Un **Certificato di Autenticazione** è principalmente utilizzato per l'accesso ai siti web che implementano l'autenticazione a mezzo certificato, oppure per firmare messaggi di posta elettronica allo scopo di garantire l'identità del mittente. Ad un Certificato digitale di autenticazione è di solito associato un indirizzo di posta elettronica in modo univoco.

Step per la richiesta di un certificato

1. Creazione della propria chiave privata
```sh
openssl genrsa -out myKey.pem
```

La chiave pubblica si può ricavare dalla chiave privata con questo comando
```sh
openssl rsa -in myKey.key -out public.key -outform PEM -pubout
```

La chiave privata può essere criptata con un algoritmo simmetrico (es: aes) e inserendo una password
```sh
openssl genrsa -aes128 2048
```

Per togliere la password
```sh
openssl rsa -in www.key -out new.key
```

2. Generazione del file `.csr` (richiesto dalla CA) a partire dalla propria chiave privata
```sh
openssl req -new -key myKey.pem -out cert.csr
```
La CA risponde con un certificato (file `myCert.cer`).

3. Per creare un file `.p12` che contiene chiave privata, chiave pubblica e certificato occorre che tutti i file siano in formato `.pem`; nel caso in cui il certificato fornito dalla CA sia in formato `PKCS7` convertirlo in pem
```sh
openssl pkcs7 -in myCert.cer -print_certs -out certs.pem
```

4. Generazione del file `keyStore.p12` finale
```sh
openssl pkcs12 -export -out keyStore.p12 -inkey myKey.pem -in certs.pem
```

## Processo di firma e cifratura

Si firma con la propria chiave privata in modo che il ricevente (usando la chiave pubblica) possa attestare la provenienza; si cifra con la chiave pubblica del ricevente (in modo che solo lui possa leggere il contenuto usando la sua chiave privata).

**La chiave pubblica di ciascun soggetto è contenuta in un certificato digitale firmato da una terza parte fidata, in questo modo coloro che riconoscono la terza parte come fidata devono controllarne la firma per accettare come valida la chiave pubblica da esso pubblicata.**

Una terza parte utilizza la chiave pubblica della CA per decrittare il certificato e, se ce la fa, allora è certo che quel certificato è stato davvero firmato dall'autorità. Poi ne legge il contenuto ed è sicuro (perchè lo dice la CA) che la chiave pubblica che ci trova dentro è proprio della persona che le altre informazioni che contiene il certificato dicono.

Se poi decide di inizare una comunicazione può usare la chiave pubblica trovata nel certificato per crittare i dati e essere così sicuro che il suo interlocutore (gia verificato) riuscirà a decrittare ciò che sta comunicando

In realtà la firma di una informazione di solito non si fa di tutta l'informazione ma di un hash della stessa, per cui la CA userà una funzione di hash che applicherà al tuo certificato ancora non firmato, applicherà la sua chiave privata all'hash e questa sarà la sua firma che aggiunge al tuo certificato non firmato.

Dato un certificato firmato quindi, un client che lo deve verificare, decritta l'hash con la chiave pubblica della ca, riapplica la stessa funzione di hash sul resto del certificato e, se i 2 hash corrispondono, allora il mittente è chi dice di essere.

Il certificato di una ca ha il campo CA:TRUE ed è firmato da se stessa

---

- visualizzare il contenuto di un file `.p12`
  - su linux
    ```sh
    openssl pkcs12 -info -in <percorso_file.p12>
    ```

  - su windows
    ```bat
    certutil -p <password> -dump <percorso_file.p12>
    ```

  - da python
    ```py
    from OpenSSL import crypto

    p12 = crypto.load_pkcs12(
        open(percorso_file.p12, 'rb').read(),
        password
    )

    # PEM formatted private key
    print crypto.dump_privatekey(
        crypto.FILETYPE_PEM,
        p12.get_privatekey(),
    )

    # PEM formatted certificate
    print crypto.dump_certificate(
        crypto.FILETYPE_PEM,
        p12.get_certificate(),
    )

    print p12.get_ca_certificates()
    ```
