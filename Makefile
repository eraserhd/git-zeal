
prefix=/usr/local

install:
	install git-zeal $(prefix)/bin/
	install -m 644 git-zeal.1 $(prefix)/share/man/man1/

.PHONY: install
