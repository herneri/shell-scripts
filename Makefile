DIR = /usr/local/bin

%:
	cp ./$@.sh $(DIR)/$@
	chmod 555 $(DIR)/$@
