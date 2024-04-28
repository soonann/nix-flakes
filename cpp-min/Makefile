.DEFAULT_GOAL := run 
.PHONY: run build clean

build:
	mkdir -p build
	clang++ src/main.cpp -o build/main

run: build
	./build/main

clean:
	rm -rf build

