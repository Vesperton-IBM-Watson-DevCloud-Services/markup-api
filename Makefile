BIN      = ./node_modules/.bin
COMPILER = --compilers coffee:coffee-script/register
REPORTER = --reporter list

test:
	$(BIN)/mocha $(COMPILER) $(REPORTER)

server:
	$(BIN)/coffee ./lib/server.coffee

bower-install:
	$(BIN)/bower install

bower-update:
	$(BIN)/bower update

.PHONY: test
