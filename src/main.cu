#include "main_lib.cuh"

int main(int argc, const char ** argv) {
  flamegpu::ModelDescription model("socix");
  //flamegpu::EnvironmentDescription env("env");
  AddHuman(model);
}
