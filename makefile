Home_Dir := ~/Documents/code/Xunner/home
Github_IO_Dir := ~/Documents/code/Xunner.github.io
Home_Server_Dir := ~/Documents/code/Xunner/home-server

.PHONY: all build home-fe home-be

all: home-fe home-be

build:
	yarn build

home-fe: build
	rm -r $(Github_IO_Dir)/assets/
	rm -r $(Github_IO_Dir)/workbox-*.js
	cp -r $(Home_Dir)/dist/* $(Github_IO_Dir)
	cd $(Github_IO_Dir) ;\
	git add * ;\
	git commit -am "pushed through makefile at `date '+%Y-%m-%d %H:%M:%S'`" ;\
	git push

home-be: build
	rm -r $(Home_Server_Dir)/static/
	mkdir $(Home_Server_Dir)/static
	cp -r $(Home_Dir)/dist/* $(Home_Server_Dir)/static
	cd $(Home_Server_Dir) ;\
	git add * ;\
	git commit -am "pushed through makefile at `date '+%Y-%m-%d %H:%M:%S'`" ;\
	git push
