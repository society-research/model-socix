#include "flamegpu/flamegpu.h"

__device__ constexpr const char VAR_HUMAN_RESOURCES[] = "resources";

enum class System {
  Market = 0,
  Socix = 1,
};

// essa2021: 1 cell = 10 m^2

void AddHuman(flamegpu::ModelDescription &model);

flamegpu::EnvironmentDescription CreateEnvironment(flamegpu::ModelDescription &model);
