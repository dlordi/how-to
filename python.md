
## moduli utili

```py
import readline
import rlcompleter
readline.parse_and_bind("tab: complete")
```

## Precedenza degli operatori

Precedenza degli operatori elencata nella tabella in ordine decrescente

| Operatore                                    | Significato                                          |
|----------------------------------------------|------------------------------------------------------|
| ()                                           | Parentesi                                            |
| **                                           | Esponente                                            |
| +x, -x, ~x                                   | Unary plus, Unary minus, Bitwise NOT                 |
| *, /, //, %                                  | Moltiplicazione, divisione, divisione intera, modulo |
| +, -                                         | Somma, sottrazione                                   |
| <<, >>                                       | Operatori shift bitwise                              |
| &                                            | AND bitwise                                          |
| ^                                            | XOR bitwise                                          |
| \|                                            | OR bitwise                                           |
| ==, !=, >, >=, <, <=, is, is not, in, not in | Confronto, identità, Membership operators            |
| not                                          | Logical NOT                                          |
| and                                          | Logical AND                                          |
| or                                           | Logical OR                                           |

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

## set

inizializzazione

```py
nuovo_set = set()
altro_set = {'elem1', 'elem2'}
```

il set è immutable, una volta creato non è possibile modificarne gli elementi contenuti, ma è possibile aggiungerne altri o cancellare quelli esistenti

```py
nuovo_set.add('elem3')
altro_set.remove('elem1')
altro_set.discard('elem4') # a differenza di remove, discard non genera un errore se l'elemento non esiste nel set
altro_set.pop() # pop rimuove e restituisce un elemento qualsiasi (genera un errore se il set è vuoto)
altro_set.clear() # cancella tutti gli elementi presenti nel set
```

