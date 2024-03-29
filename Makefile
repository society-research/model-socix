ninja-with-cmake:
	#rm -rf build && mkdir build
	cd build && cmake -G Ninja -DCMAKE_BUILD_TYPE=Debug -DFLAMEGPU_VISUALISATION=ON -DFLAMEGPU_SHARE_USAGE_STATISTICS=OFF -DFLAMEGPU_TELEMETRY_SUPPRESS_NOTICE=ON ..
	cd build && ninja
.PHONY: ninja-with-cmake

ninja:
	cd build && ninja
.PHONY: ninja

test: ninja
	#./build/src/bin/Release/socix_test --gtest_color=yes
	./build/src/bin/Debug/socix_test --gtest_color=yes
.PHONY: test

clean-build: clean
	make ninja-with-cmake
.PHONY: clean-build

clean:
	rm -rf build
.PHONY: clean

lint:
	cd build && ninja lint_socix lint_socix_test
.PHONY: lint

watch:
	make ninja-with-cmake
	while true; do inotifywait -e modify ./src/*; make test; done
.PHONY: watch

compose-up:
	UID=$(shell id -u) GID=$(shell id -g) docker-compose up
.PHONY: compose-up

compose-up-rebuild:
	UID=$(shell id -u) GID=$(shell id -g) docker-compose up --build
.PHONY: compose-up-rebuild

format:
	clang-format -i $$(fd '(\.cu|\.cuh)$$' src/)
.PHONY: format
#prod-ninja:
#	cd build && cmake -G Ninja -DRELEASE_TYPE=??? -DFLAMEGPU_VISUALISATION=OFF -DNO_TEST=ON ..
#	cd build && ninja
# Using `-DCMAKE_BUILD_TYPE=`, `Debug` or `Profile` build configurations can be
# generated.
