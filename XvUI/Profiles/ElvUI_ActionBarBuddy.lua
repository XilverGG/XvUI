-- Lua functions
local unpack = unpack

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E = unpack(ElvUI)

-- ElvUI_ActionBarBuddy options
function Private:Setup_ElvUI_ActionBarBuddy()
  if not E:IsAddOnEnabled("ElvUI_ActionBarBuddy") then
    Private:Print("ElvUI_ActionBarBuddy " .. "is not installed or enabled.")
    return
  end

  E.db["abb"]["bar1"]["customTriggers"] = true
  E.db["abb"]["bar1"]["displayTriggers"]["hasFocus"] = false
  E.db["abb"]["bar1"]["displayTriggers"]["hasTarget"] = false
  E.db["abb"]["bar1"]["displayTriggers"]["inCombat"] = 0
  E.db["abb"]["bar1"]["displayTriggers"]["inVehicle"] = false
  E.db["abb"]["bar1"]["displayTriggers"]["isDragonRiding"] = false
  E.db["abb"]["bar1"]["displayTriggers"]["isPlayerSpellsFrameOpen"] = true
  E.db["abb"]["bar1"]["displayTriggers"]["isPossessed"] = false
  E.db["abb"]["bar1"]["displayTriggers"]["isProfessionBookOpen"] = true
  E.db["abb"]["bar1"]["displayTriggers"]["notMaxHealth"] = false
  E.db["abb"]["bar1"]["displayTriggers"]["playerCasting"] = false
  E.db["abb"]["bar1"]["inheritGlobalFade"] = true
  E.db["abb"]["bar10"]["inheritGlobalFade"] = true
  E.db["abb"]["bar13"]["inheritGlobalFade"] = true
  E.db["abb"]["bar14"]["inheritGlobalFade"] = true
  E.db["abb"]["bar15"]["inheritGlobalFade"] = true
  E.db["abb"]["bar2"]["displayTriggers"]["hasFocus"] = false
  E.db["abb"]["bar2"]["displayTriggers"]["hasOverridebar"] = false
  E.db["abb"]["bar2"]["displayTriggers"]["hasTarget"] = false
  E.db["abb"]["bar2"]["displayTriggers"]["inCombat"] = 0
  E.db["abb"]["bar2"]["displayTriggers"]["inVehicle"] = false
  E.db["abb"]["bar2"]["displayTriggers"]["isDragonRiding"] = false
  E.db["abb"]["bar2"]["displayTriggers"]["isPossessed"] = false
  E.db["abb"]["bar2"]["displayTriggers"]["mouseover"] = false
  E.db["abb"]["bar2"]["displayTriggers"]["notMaxHealth"] = false
  E.db["abb"]["bar2"]["displayTriggers"]["playerCasting"] = false
  E.db["abb"]["bar2"]["inheritGlobalFade"] = true
  E.db["abb"]["bar3"]["inheritGlobalFade"] = true
  E.db["abb"]["bar4"]["inheritGlobalFade"] = true
  E.db["abb"]["bar5"]["inheritGlobalFade"] = true
  E.db["abb"]["bar6"]["inheritGlobalFade"] = true
  E.db["abb"]["bar7"]["inheritGlobalFade"] = true
  E.db["abb"]["bar8"]["inheritGlobalFade"] = true
  E.db["abb"]["bar9"]["inheritGlobalFade"] = true
  E.db["abb"]["barPet"]["inheritGlobalFade"] = true
  E.db["abb"]["global"]["displayTriggers"]["hasFocus"] = false
  E.db["abb"]["global"]["displayTriggers"]["hasOverridebar"] = false
  E.db["abb"]["global"]["displayTriggers"]["hasTarget"] = false
  E.db["abb"]["global"]["displayTriggers"]["inCombat"] = 0
  E.db["abb"]["global"]["displayTriggers"]["inVehicle"] = false
  E.db["abb"]["global"]["displayTriggers"]["isDragonRiding"] = false
  E.db["abb"]["global"]["displayTriggers"]["isPlayerSpellsFrameOpen"] = true
  E.db["abb"]["global"]["displayTriggers"]["isPossessed"] = false
  E.db["abb"]["global"]["displayTriggers"]["isProfessionBookOpen"] = true
  E.db["abb"]["global"]["displayTriggers"]["notMaxHealth"] = false
  E.db["abb"]["global"]["displayTriggers"]["playerCasting"] = false
  E.db["abb"]["global"]["globalFadeAlpha"] = 1
  E.db["abb"]["stanceBar"]["displayTriggers"]["inCombat"] = 1
  E.db["abb"]["stanceBar"]["inheritGlobalFade"] = true

  -- Update ElvUI
  E:StaggeredUpdateAll()

  -- Show message about layout being set
  PluginInstallStepComplete.message = "Layout Set"
  PluginInstallStepComplete:Show()
end
