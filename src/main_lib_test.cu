#include "main_lib.cuh"
#include "gtest/gtest.h"

TEST(human, CollectResource) {
  flamegpu::ModelDescription model("socix_test_human_CollectResource");
  AddHuman(model);
  const char *argv[] = {"-s", "1", "-r", "1", NULL};
  flamegpu::CUDASimulation cudaSimulation(model, 4, argv);
  flamegpu::AgentVector population(model.Agent("human"), 1 /*amount of humans*/);
  population.push_back();
  population[0].setVariable<int>("resources", 1, int(Resource::Basic));
  EXPECT_EQ(cudaSimulation.step(), true)
      << "stop should be triggered, since we passed '-s 1'";
  cudaSimulation.getPopulationData(population);
  ASSERT_EQ(population.size(), 1); // FIXME: assertion fails
  EXPECT_EQ(population[0].getVariable<int>("resources", int(Resource::Basic)), 2);
}

TEST(model, CreateEnvironment) {
  flamegpu::ModelDescription model("socix_test_model_CreateEnvironment");
  auto env = CreateEnvironment(model);
  EXPECT_EQ(env.getProperty<unsigned int>("POPULATION_TO_GENERATE"), 5000u)
      << "should have reasonable default";
}
