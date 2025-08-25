-- Lua functions
local unpack = unpack

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)

--[[
	AddOnSkins profile
	LC: 25/08/2025
]]
function Private:Setup_AddOnSkins(installer)
  if not E:IsAddOnEnabled("AddOnSkins") and E.Retail then
    Private:Print("AddOnSkins " .. "is not installed or enabled.")
    return
  end

  local AS = unpack(AddOnSkins)

  -- Profile name
  local name = "XvUI"

  -- Profile creation
  AS.data:SetProfile(name)

  -- Profile data
  AS.db.EmbedSystemDual = true
  AS.db.EmbedLeftWidth = 224

  Private:Print("AddOnSkins profile has been set.")
end
