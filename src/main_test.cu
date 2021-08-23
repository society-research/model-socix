#include "gtest/gtest.h"
#include "main_lib.cuh"

TEST(one, is_one) {
  f();
  EXPECT_TRUE(1 == 1);
  EXPECT_EQ(1, 1);
}
