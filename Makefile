.PHONY: ninja-with-cmake ninja test build-dir clean clean-build lint watch compose-up compose-up-rebuild
ninja-with-cmake: build-dir
	cd build && cmake -G Ninja -DVISUALISATION=ON ..
	cd build && ninja
ninja:
	cd build && ninja
test: ninja
	./build/src/bin/Release/socix_test
build-dir:
	mkdir -p build
clean-build: clean
	make ninja-with-cmake
clean:
	rm -rf build
lint:
	cd build && ninja lint_socix lint_socix_test
watch:
	while true; do inotifywait -e modify ./src/*; make test; done
compose-up:
	UID=$(shell id -u) GID=$(shell id -g) docker-compose up
compose-up-rebuild:
	UID=$(shell id -u) GID=$(shell id -g) docker-compose up --build
#prod-ninja: build-dir
#	cd build && cmake -G Ninja -DRELEASE_TYPE=??? -DVISUALISATION=OFF -DNO_TEST=ON ..
#	cd build && ninja
# Using `-DCMAKE_BUILD_TYPE=`, `Debug` or `Profile` build configurations can be
# generated.
