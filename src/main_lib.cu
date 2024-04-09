#include "main_lib.cuh"

FLAMEGPU_AGENT_FUNCTION(CollectResource, flamegpu::MessageNone, flamegpu::MessageNone) {
  int food = FLAMEGPU->getVariable<int>(VAR_HUMAN_RESOURCES);
  food--; // consume
  FLAMEGPU->setVariable<int>(VAR_HUMAN_RESOURCES, food);
  return flamegpu::ALIVE;
}

void AddHuman(flamegpu::ModelDescription &model) {
  flamegpu::AgentDescription human = model.newAgent("human");
  // Resources
  human.newVariable<int>(VAR_HUMAN_RESOURCES, 0);
  // System
  // human.newState("market"); // should these be a bool variable "system" instead?
  // human.newState("socix");

  // behavior
  flamegpu::AgentFunctionDescription dscCollectResource =
      human.newFunction("CollectResource", CollectResource);
  model.newLayer().addAgentFunction(dscCollectResource);
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
