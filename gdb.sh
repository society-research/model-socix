#!/bin/bash
# Note: should be run inside docker, first execute ./shell.sh
cuda-gdb --args ./build/src/bin/Debug/socix_test --gtest_catch_exceptions=0
