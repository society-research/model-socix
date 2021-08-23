.PHONY: ninja-with-cmake ninja test build-dir clean clean-build
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
#prod-ninja: build-dir
#	cd build && cmake -G Ninja -DRELEASE_TYPE=??? -DVISUALISATION=OFF -DNO_TEST=ON ..
#	cd build && ninja
