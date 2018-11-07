
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
