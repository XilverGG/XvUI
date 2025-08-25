-- Lua functions
local format = format
local unpack = unpack

-- API cache
local GetAddOnMetadata = C_AddOns.GetAddOnMetadata
local C_UI_Reload = C_UI.Reload

-- Global environment
local _G = _G

-- Global strings
local ACCEPT = ACCEPT
local CANCEL = CANCEL

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L, V, P, G = unpack(ElvUI)
local PI = E:GetModule("PluginInstaller")

-- Chat print
function Private:Print(msg)
  print(Private.Name .. ": " .. msg)
end

-- Reload popup
E.PopupDialogs.XVUI_RL = {
  text = L["Reload required - continue?"],
  button1 = ACCEPT,
  button2 = CANCEL,
  OnAccept = C_UI_Reload,
  whileDead = 1,
  hideOnEscape = false,
}

-- Version check popup
E.PopupDialogs.XVUI_VC = {
  text = format("|cffFF0000%s|r", L["Your ElvUI is outdated - please update and reload."]),
  whileDead = 1,
  hideOnEscape = false,
}

-- Version check
function Private:VersionCheck()
  if E.version < Private.RequiredElvUI then
    E:StaticPopup_Show("XVUI_VC")
    Private:Print(format("|cffFF0000%s|r", L["Your ElvUI is outdated - please update and reload."]))
  end
end

-- Chat commands
function XVUI:Toggles(msg)
  if msg == "install" then
    PI:Queue(XVUI.InstallerData)
  elseif msg == "config" then
    E:ToggleOptions()
    E.Libs.AceConfigDialog:SelectGroup("ElvUI", "XvUI")
  end
end

-- Register chat commands
function XVUI:LoadCommands()
  self:RegisterChatCommand("xvui", "Toggles")
end

-- Events
function XVUI:PLAYER_ENTERING_WORLD(_, initLogin, isReload)
  if initLogin or isReload then
    Private:VersionCheck()
  end
end

-- Register events
function XVUI:RegisterEvents()
  XVUI:RegisterEvent("PLAYER_ENTERING_WORLD")
end

-- Defaults: E.global.XVUI
G.XVUI = {
  dev = false,
  install_version = nil,
  scaled = false,
}

-- Defaults: E.private.XVUI
V.XVUI = {}

-- Defaults: E.db.XVUI
P.XVUI = {}
