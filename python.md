
## moduli utili

```py
import readline
import rlcompleter
readline.parse_and_bind("tab: complete")
```

## Encode/decode delle stringhe

### Python 2

```py
str.decode() # da una sequenza di byte genera una stringa
unicode.encode() # da una stringa genera una sequenza di byte
```

### Python 3

```py
bytes.decode() # da una sequenza di byte genera una stringa
str.encode() # da una stringa genera una sequenza di byte
```
