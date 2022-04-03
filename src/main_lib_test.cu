#include "gtest/gtest.h"
#include "main_lib.cuh"

TEST(human, CollectResource) {
  flamegpu::ModelDescription model("socix_test_human_CollectResource");
  AddHuman(model);
  // TODO: call CollectResource_impl::operator()
}
