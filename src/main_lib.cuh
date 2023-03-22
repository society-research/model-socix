#include "flamegpu/flamegpu.h"

constexpr uint64_t ResourceAmount = 10; // slots defined by Resource enum
const std::array<int, ResourceAmount> DefaultResources = {0};
enum class Resource {
  Basic = 0,
};

enum class System {
  Market = 0,
  Socix = 1,
};

// essa2021: 1 cell = 1 m^2

void AddHuman(flamegpu::ModelDescription &model);

flamegpu::EnvironmentDescription
CreateEnvironment(flamegpu::ModelDescription &model);
