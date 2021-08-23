project(socix CUDA CXX)
option(VISUALISATION "Enable visualisation support" OFF)
set(FLAMEGPU_VERSION "master" CACHE STRING "Git branch or tag to use")
include(flamegpu2)
include(${FLAMEGPU_ROOT}/cmake/common.cmake)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin/${CMAKE_BUILD_TYPE}/)
set(main_src
  # ${CMAKE_CURRENT_LIST_DIR}/ needed?
  main.cu
  main_lib.cu
)
add_flamegpu_executable("${PROJECT_NAME}" "${main_src}" "${FLAMEGPU_ROOT}" "${PROJECT_BINARY_DIR}" TRUE)
target_include_directories("${PROJECT_NAME}" PRIVATE ".")

if(NOT NO_TEST)
  project(socix_test CUDA CXX)
  include(download_gtest)
  include(GoogleTest)
  set(test_src
    main_test.cu
    main_lib.cu
  )
  add_flamegpu_executable("${PROJECT_NAME}" "${test_src}" "${FLAMEGPU_ROOT}" "${PROJECT_BINARY_DIR}" TRUE)
  target_link_libraries("${PROJECT_NAME}" gtest_main)
  add_compile_options(-O1 -g -fsanitize=address -fno-omit-frame-pointer -fno-optimize-sibling-calls)
endif()
