#include "main_lib.cuh"

FLAMEGPU_AGENT_FUNCTION(CollectResource, flamegpu::MessageNone, flamegpu::MessageNone) {
  int r = FLAMEGPU->getVariable<int, ResourceAmount>("resources", int(Resource::Basic));
  r++; // TODO pass message with nearby resource actor
  FLAMEGPU->setVariable<int, ResourceAmount>("resources", r, int(Resource::Basic));
  return flamegpu::ALIVE;
}

void AddHuman(flamegpu::ModelDescription &model) {
  flamegpu::AgentDescription human = model.newAgent("human");
  // Resources
  human.newVariable<int, ResourceAmount>("resources", DefaultResources);
  // System
  //human.newState("market"); // should these be a bool variable "system" instead?
  //human.newState("socix");

  // behavior
  flamegpu::AgentFunctionDescription dscCollectResource =
      human.newFunction("CollectResource", CollectResource);
}

flamegpu::EnvironmentDescription CreateEnvironment(flamegpu::ModelDescription &model) {
  flamegpu::EnvironmentDescription env = model.Environment();
  // Population size to generate, if no agents are loaded from disk
  env.newProperty("POPULATION_TO_GENERATE", 5000u);
  // Environment bounds
  // env.newProperty("MIN_POSITION", -0.5f);
  // env.newProperty("MAX_POSITION", +0.5f);
  return env;
}
