#include "main_lib.cuh"

FLAMEGPU_AGENT_FUNCTION(CollectResource, flamegpu::MessageNone, flamegpu::MessageNone) {
  int r = FLAMEGPU->getVariable<int, ResourceAmount>("resources", int(Resource::Basic));
  r++; // TODO pass message with nearby resource actor
  FLAMEGPU->setVariable<int, ResourceAmount>("resources", r, int(Resource::Basic));
  return flamegpu::ALIVE;
}

void AddHuman(flamegpu::ModelDescription& model) {
  flamegpu::AgentDescription human = model.newAgent("human");
  // Resources
  human.newVariable<int, ResourceAmount>("resources", DefaultResources);
  // System
  human.newState("market"); // should these be a bool variable "system" instead?
  human.newState("socix");
  // TODO Physiological well-being
  // TODO Mental well-being

  // behavior
  flamegpu::AgentFunctionDescription dscCollectResource = human.newFunction("CollectResource", CollectResource);
}
