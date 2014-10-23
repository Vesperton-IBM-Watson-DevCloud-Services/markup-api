BIN             = ./node_modules/.bin
COFFEE_COMPILER = --compilers coffee:coffee-script/register

test:
	$(BIN)/mocha $(COFFEE_COMPILER)

start:
	$(BIN)/coffee ./lib/server.coffee

bower-install:
	$(BIN)/bower install

bower-update:
	$(BIN)/bower update

.PHONY: test
