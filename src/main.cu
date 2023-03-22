#include "main_lib.cuh"

int main(int argc, const char ** argv) {
  flamegpu::ModelDescription model("socix");
  auto env = CreateEnvironment(model);
  AddHuman(model);
  // create model runner
  flamegpu::CUDASimulation cudaSimulation(model);
  cudaSimulation.initialise(argc, argv);
}
