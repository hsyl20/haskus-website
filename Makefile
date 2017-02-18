all: build

build: hakyll
	stack exec -- sitehaskus build

hakyll: src/hakyll.hs
	stack build

new:
	@./new_post.sh

watch: hakyll
	stack exec -- sitehaskus watch --port 9000

clean: hakyll
	stack clean
