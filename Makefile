all: build

build: hakyll
	./hakyll build

hakyll: hakyll.hs
	cabal exec ghc -- --make hakyll.hs
	./hakyll clean

new:
	@./new_post.sh

watch: hakyll
	./hakyll watch -p 9000

clean: hakyll
	./hakyll clean
