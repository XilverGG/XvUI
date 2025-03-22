-- Lua functions
local unpack = unpack

-- Global environment
local _G = _G

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)

-- Disable LibDualSpec to set the profile
local function HandleLibDualSpec()
	ElvDB['namespaces']['LibDualSpec-1.0'] = ElvDB['namespaces']['LibDualSpec-1.0'] or {}
	ElvDB['namespaces']['LibDualSpec-1.0']['char'] = ElvDB['namespaces']['LibDualSpec-1.0']['char'] or {}
	ElvDB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm] = {}
	ElvDB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm]['enabled'] = false
end

-- Full frontend refresh
local function Refresh()
	E:StaggeredUpdateAll()
	E:UIMult()
	E:UIScale()
	E:Config_UpdateSize(true)
end

function Private:GetProfileByName(profileName)
    local profiles = E.data:GetProfiles()

    for _, profile in ipairs(profiles) do
        if profile == profileName then
            return profile
        end
    end

    return nil
end

-- Handler for existing profiles (Quick install on alts)
function Private:HandleAlts()

	local profile = Private:GetProfileByName('XvUI')

	if not profile then
		Private:Print(L["No existing XvUI profile found."])
		return
	end

	HandleLibDualSpec()

	-- Set XvUI profile
	E.data:SetProfile(profile)

	-- PrivateDB for ElvUI
	Private:Setup_ElvUI_PrivateDB()

	-- Push the update
	Refresh()

	E:StaticPopup_Show('XVUI_RL')

	Private:Print(L["Applied profile: "] .. profile)
end
