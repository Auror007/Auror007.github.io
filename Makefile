HUGO_BIN=hugo

.PHONY: build demo release

build:
	$(HUGO_BIN) --themesDir=../.. --source=.

demo:
	$(HUGO_BIN) server -D --themesDir=./themes --source=. --bind 0.0.0.0

release: build
	rm -rf ./resources && cp -r ./resources ./resources
