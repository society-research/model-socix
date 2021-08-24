#include "flamegpu/flamegpu.h"

constexpr uint64_t ResourceAmount = 10; // slots defined by Resource enum
const std::array<int, ResourceAmount> DefaultResources = {0};
enum class Resource {
  Basic = 0,
};

void AddHuman(flamegpu::ModelDescription& model);
