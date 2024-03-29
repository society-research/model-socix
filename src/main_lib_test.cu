#include "main_lib.cuh"
#include "gtest/gtest.h"

TEST(human, CollectResource) {
  flamegpu::ModelDescription model("socix_test_human_CollectResource");
  AddHuman(model);
  model.generateLayers(); // required for agent functions to be executed
  std::cerr << model.getConstructedLayersString() << std::endl;
  const char *argv[] = {"bin/socix",  "--steps",   "1", "--random",
                        "1711656101", "--verbose", NULL};
  flamegpu::CUDASimulation cudaSimulation(model, 6, argv);
  flamegpu::AgentVector initialPopulation(model.Agent("human"), 1 /*amount of humans*/);
  initialPopulation[0].setVariable<int>(VAR_HUMAN_RESOURCES, 1);
  cudaSimulation.setPopulationData(initialPopulation);
  EXPECT_EQ(cudaSimulation.step(), true)
      << "stop should be triggered, since we passed '-s 1'";
  flamegpu::AgentVector finalPopulation(model.Agent("human"));
  cudaSimulation.getPopulationData(finalPopulation);
  ASSERT_EQ(finalPopulation.size(), 1);
  const int humansResources = finalPopulation[0].getVariable<int>(VAR_HUMAN_RESOURCES);
  EXPECT_EQ(humansResources, 0);
}

TEST(model, CreateEnvironment) {
  flamegpu::ModelDescription model("socix_test_model_CreateEnvironment");
  auto env = CreateEnvironment(model);
  EXPECT_EQ(env.getProperty<unsigned int>("POPULATION_TO_GENERATE"), 5000u)
      << "should have reasonable default";
}
