
- template

```txt
.SUFFIXES: .cbl .int $(SUFFIXES)
.PHONY: default all compile test clean install showmacro

default: all

all: compile test

compile:

test:

clean:

install:

showmacro:
	@echo MAKE $(MAKE) ; \
	echo AR $(AR) ; \
	echo ARFLAGS $(ARFLAGS) ; \
	echo YACC $(YACC) ; \
	echo YFLAGS $(YFLAGS) ; \
	echo LEX $(LEX) ; \
	echo LFLAGS $(LFLAGS) ; \
	echo LDFLAGS $(LDFLAGS) ; \
	echo CC $(CC) ; \
	echo CFLAGS $(CFLAGS) ; \
	echo FC $(FC) ; \
	echo FFLAGS $(FFLAGS)
```