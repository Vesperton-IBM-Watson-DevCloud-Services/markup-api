BIN             = ./node_modules/.bin
TEST_REPORTER   = --reporter list
COFFEE_COMPILER = --compilers coffee:coffee-script/register

test:
	$(BIN)/mocha $(COMPILER) $(REPORTER)

server:
	$(BIN)/coffee ./lib/server.coffee

bower-install:
	$(BIN)/bower install

bower-update:
	$(BIN)/bower update

.PHONY: test
