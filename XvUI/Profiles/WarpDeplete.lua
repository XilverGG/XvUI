-- Lua functions
local unpack = unpack

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)

--[[
WarpDeplete profile
LC: 10/03/2025
]]

function Private:Setup_WarpDeplete(installer)
	if not E:IsAddOnEnabled('WarpDeplete') and E.Retail then Private:Print('WarpDeplete ' .. 'is not installed or enabled.') return end

	-- Profile name
	local name = 'XvUI'

	-- Profile data
	WarpDepleteDB['profiles'][name] = WarpDepleteDB['profiles'][name] or {}
	WarpDepleteDB['profiles'][name] = {
		["forcesTexture"] = Private.Texture,
		["frameX"] = 15.8330135345459,
		["timerFont"] = Private.Font,
		["bar3Font"] = Private.Font,
		["bar1Texture"] = Private.Texture,
		["objectivesFont"] = Private.Font,
		["bar2Texture"] = Private.Texture,
		["keyDetailsFont"] = Private.Font,
		["deathsFont"] = Private.Font,
		["frameY"] = -52.49984359741211,
		["forcesOverlayTexture"] = Private.Texture,
		["bar3Texture"] = Private.Texture,
		["bar1Font"] = Private.Font,
		["bar2Font"] = Private.Font,
		["forcesFont"] = Private.Font,
		["keyFont"] = Private.Font
	}

	-- Profile key
	WarpDepleteDB['profileKeys'][E.mynameRealm] = name

	if installer then
		PluginInstallStepComplete.message = "WarpDeplete profile has been set."
		PluginInstallStepComplete:Show()
	end

	Private:Print("WarpDeplete profile has been set.")
end
