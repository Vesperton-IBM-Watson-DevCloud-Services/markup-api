BIN=./node_modules/.bin

server:
	$(BIN)/coffee ./lib/server.coffee

bower-install:
	$(BIN)/bower install

bower-update:
	$(BIN)/bower update

test:
	$(BIN)/mocha --compilers coffee:coffee-script/reporter

.PHONY: test
