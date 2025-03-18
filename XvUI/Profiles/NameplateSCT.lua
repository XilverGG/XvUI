-- Lua functions
local unpack = unpack

-- Global environment
local _G = _G

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)

--[[
NameplateSCT profile
LC: 18/03/2025
]]
function Private:Setup_NameplateSCT(installer)
    if not E:IsAddOnEnabled('NameplateSCT') and E.Retail then Private:Print('NameplateSCT ' .. 'is not installed or enabled.') return end
    
    -- Profile data
    NameplateSCTDB["global"] = {
        ["xVariance"] = 50,
        ["yVariance"] = 50,
        ["personal"] = true,
        ["animationsPersonal"] = {
            ["normal"] = "fountain",
        },
        ["font"] = "XvUI",
        ["strata"] = {
            ["target"] = 4,
            ["offTarget"] = 3,
        },
        ["yOffsetPersonal"] = -200,
        ["showIconOnly"] = false,
    }
    
    if installer then
        PluginInstallStepComplete.message = "NameplateSCT profile has been set."
        PluginInstallStepComplete:Show()
    end
    
    Private:Print("NameplateSCT profile has been set.")
end
