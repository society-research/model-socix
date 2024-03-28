#include "main_lib.cuh"

int main(int argc, const char **argv) {
  flamegpu::ModelDescription model("socix");
  auto env = CreateEnvironment(model);
  AddHuman(model);
  flamegpu::io::Telemetry::suppressNotice();
  flamegpu::CUDASimulation cudaSimulation(model, argc, argv);
  cudaSimulation.simulate();
}
