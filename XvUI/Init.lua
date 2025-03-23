-- Lua functions
local tonumber = tonumber
local unpack = unpack

-- API cache
local GetAddOnMetadata = C_AddOns.GetAddOnMetadata

-- AddOn namespace
local Name, Private = ...

-- ElvUI modules
local E = unpack(ElvUI)
local EP = LibStub("LibElvUIPlugin-1.0")
local PI = E:GetModule('PluginInstaller')

-- Ace modules
XVUI = E:NewModule(Name, 'AceConsole-3.0', 'AceHook-3.0', 'AceEvent-3.0', 'AceTimer-3.0')

-- Constants: Logo, Name
Private.Logo = 'Interface\\AddOns\\XvUI\\Media\\Textures\\XvUI_Banner.tga'
Private.Name = '|cff0099ffXv|r|cffffffffUI|r'

-- Constants: Media
Private.Font = 'XvUI'
Private.Texture = 'XvUI'
Private.Outline = 'OUTLINE'

-- Constants: Tables
Private.Config = {}

-- Constants: Version checks
Private.RequiredElvUI = tonumber(GetAddOnMetadata(Name, 'X-Required-ElvUI'))
Private.Version = GetAddOnMetadata(Name, 'Version')

-- Initialize module in ElvUI
local function Initialize()
	if E.private.install_complete == nil then -- ElvUI installer skip
		E.private.install_complete = E.version
	end

	if E.global.XVUI.install_version == nil then -- XvUI installer queue
		PI:Queue(XVUI.InstallerData)
	end

	EP:RegisterPlugin(Name, XVUI.Config)
	XVUI:RegisterEvents()
end

local function CallbackInitialize()
	Initialize()
end

E:RegisterModule(Name, CallbackInitialize)
