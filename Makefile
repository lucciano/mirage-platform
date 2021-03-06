OS ?= unix

PREFIX ?= /usr/local

ifneq "$(MIRAGE_OS)" ""
OS := $(MIRAGE_OS)
endif

.PHONY: all clean install test
.DEFAULT: all

all:
	cd $(OS) && $(MAKE) all

clean:
	cd $(OS) && $(MAKE) clean

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp scripts/mir-run $(DESTDIR)$(PREFIX)/bin/
	chmod a+x $(DESTDIR)$(PREFIX)/bin/mir-run
	cd $(OS) && $(MAKE) install

test:
	cd $(OS) && $(MAKE) test
