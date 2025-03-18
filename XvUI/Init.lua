-- Lua functions
local tonumber = tonumber
local unpack = unpack

-- API cache
local GetAddOnMetadata = C_AddOns.GetAddOnMetadata

-- Cache Lua / WoW API
local format = string.format
local ReloadUI = ReloadUI

-- Global environment
local _G = _G

-- AddOn namespace
local Name, Private = ...

local Version = GetAddOnMetadata(Name, "Version")

-- ElvUI modules
local E, L, V, P, G = unpack(ElvUI)
local EP = LibStub("LibElvUIPlugin-1.0")
local PI = E:GetModule('PluginInstaller')

-- Ace modules
XVUI = E:NewModule(Name, "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0");

-- Constants: Logo, Name
Private.Logo = 'Interface\\AddOns\\XvUI\\Media\\Textures\\XvUI_Logo'
Private.Name = '|cff0099ffXv|r|cffffffffUI|r'

-- Constants: Media
Private.Font = 'XvUI'
Private.Texture = 'XvUI'
Private.Outline = 'OUTLINE'

-- Constants: Version checks
--Private.RequiredElvUI = tonumber(GetAddOnMetadata(Name, 'X-Required-ElvUI'))
Private.Version = tonumber(GetAddOnMetadata(Name, 'Version'))

-- Chat print
function Private:Print(msg)
	print(Private.Name .. ': ' .. msg)
end

-- Set install version to current XvUI version
local function InstallComplete()
	E.global.XVUI.install_version = Private.Version
	ReloadUI()
end

-- Installer table
XVUI.InstallerData = {
	Title = format("|cff0099ff%s %s|r", Name, "Installation"),
	Name = Name,
	-- Uncomment the line below f you have a logo you want to use, otherwise it uses the one from ElvUI
	tutorialImage = "Interface\\AddOns\\XvUI\\Media\\Textures\\XvUI_Banner.tga",
	Pages = {
		[1] = function()
			PluginInstallFrame.SubTitle:SetFormattedText("Welcome to the installation for %s.", Name)
			PluginInstallFrame.Desc1:SetText("The XvUI installer will guide you through a few steps and apply the profiles of your choice.")
			PluginInstallFrame.Desc2:SetText(format('|cff0099ff%s', L["Your existing profiles will not change. The installer will create a fresh profile."]))
			PluginInstallFrame.Desc3:SetText("Please read the steps carefully before clicking any buttons.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", InstallComplete)
			PluginInstallFrame.Option1:SetText("Skip and close the installer")
		end,
		[2] = function()
			PluginInstallFrame.SubTitle:SetText("ElvUI profile")
			PluginInstallFrame.Desc1:SetText("Current layout is a multipurpose one, valid for Tank, Healing and DPS. Please click a button below to apply the profile.")
			PluginInstallFrame.Desc2:SetText(format('|cff0099ff%s', "Recommended step. Should not be skipped."))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() Private:Setup_ElvUI() end)
			PluginInstallFrame.Option1:SetText("Setup Profile")
		end,
		[3] = function()
			PluginInstallFrame.SubTitle:SetText("Plater profile")
			PluginInstallFrame.Desc1:SetText("Please click the button below to apply XvUI profile for Plater.")
			PluginInstallFrame.Desc2:SetText(format('|cff0099ff%s', "Recommended step. Should not be skipped."))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() Private:Setup_Plater(true) end)
			PluginInstallFrame.Option1:SetText("Setup Plater")
		end,
		[4] = function()
			PluginInstallFrame.SubTitle:SetText("BigWigs profile")
			PluginInstallFrame.Desc1:SetText("Please click the button below to apply XvUI profile for BigWigs.")
			PluginInstallFrame.Desc2:SetText(format('|cff0099ff%s', "Recommended step. Should not be skipped."))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() Private:Setup_BigWigs() end)
			PluginInstallFrame.Option1:SetText("Setup BigWigs")
		end,
		[5] = function()
			PluginInstallFrame.SubTitle:SetText("Details profile")
			PluginInstallFrame.Desc1:SetText("Please click the button below to apply XvUI profile for Details.")
			PluginInstallFrame.Desc2:SetText(format('|cff0099ff%s', "Recommended step. Should not be skipped."))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() Private:Setup_Details(true) end)
			PluginInstallFrame.Option1:SetText("Setup Details")
		end,
		[6] = function()
			PluginInstallFrame.SubTitle:SetText("OmniCD profile")
			PluginInstallFrame.Desc1:SetText("Please click the button below to apply XvUI profile for OmniCD.")
			PluginInstallFrame.Desc2:SetText(format('|cff0099ff%s', "Recommended step. Should not be skipped."))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() Private:Setup_OmniCD(true) end)
			PluginInstallFrame.Option1:SetText("Setup OmniCD")
		end,
		[7] = function()
			PluginInstallFrame.SubTitle:SetText("WarpDeplete profile")
			PluginInstallFrame.Desc1:SetText("Please click the button below to apply XvUI profile for WarpDeplete.")
			PluginInstallFrame.Desc2:SetText(format('|cff0099ff%s', "Recommended step. Should not be skipped."))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() Private:Setup_WarpDeplete(true) end)
			PluginInstallFrame.Option1:SetText("Setup WarpDeplete")
		end,
		[8] = function()
			PluginInstallFrame.SubTitle:SetText("NameplateSCT profile")
			PluginInstallFrame.Desc1:SetText("Please click the button below to apply XvUI profile for NameplateSCT.")
			PluginInstallFrame.Desc2:SetText(format('|cff0099ff%s', "This will overwrite your current NameplateSCT configuration."))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() Private:Setup_NameplateSCT(true) end)
			PluginInstallFrame.Option1:SetText("Setup NameplateSCT")
		end,
		[9] = function()
			PluginInstallFrame.SubTitle:SetText("ActionBar Buddy (ElvUI Plugin)")
			PluginInstallFrame.Desc1:SetText("Default XvUI configuration for ActionBar Buddy (ElvUI Plugin).")
			PluginInstallFrame.Desc2:SetText(format('|cff0099ff%s', "Skip this step if you have not installed this addon."))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() Private:Setup_ElvUI_ABB() end)
			PluginInstallFrame.Option1:SetText("Setup")
		end,
		[10] = function()
			PluginInstallFrame.SubTitle:SetText("Installation Complete")
			PluginInstallFrame.Desc1:SetText("You have completed the installation process.")
			PluginInstallFrame.Desc2:SetText("Please click the button below in order to finalize the process and automatically reload your UI.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", InstallComplete)
			PluginInstallFrame.Option1:SetText("Finished")
		end,
	},
	StepTitles = {
		[1] = "Welcome",
		[2] = "ElvUI",
		[3] = "Plater",
		[4] = "BigWigs",
		[5] = "Details",
		[6] = "OmniCD",
		[7] = "WarpDeplete",
		[8] = "NameplateSCT",
		[9] = "ActionBar Buddy",
		[10] = "Installation Complete"
	},
	StepTitlesColor = {1, 1, 1},
	StepTitlesColorSelected = {0, 179/255, 1},
	StepTitleWidth = 200,
	StepTitleButtonWidth = 180,
	StepTitleTextJustification = "LEFT",
}

-- This function holds the options table which will be inserted into the ElvUI config
function XVUI:Config()
	E.Options.args.Name = {
		order = 100,
		type = "group",
		name = Private.Name,
		args = {
			header1 = {
				order = 1,
				type = "header",
				name = Name,
			},
			description1 = {
				order = 2,
				type = "description",
				name = format("%s is a layout for ElvUI.", Name),
			},
			spacer1 = {
				order = 3,
				type = "description",
				name = "\n\n\n",
			},
			header2 = {
				order = 4,
				type = "header",
				name = "Installation",
			},
			description2 = {
				order = 5,
				type = "description",
				name = "The installation guide should pop up automatically after you have completed the ElvUI installation. If you wish to re-run the installation process for this layout then please click the button below.",
			},
			spacer2 = {
				order = 6,
				type = "description",
				name = "",
			},
			install = {
				order = 7,
				type = "execute",
				name = "Install",
				desc = "Run the installation process.",
				func = function() E:GetModule("PluginInstaller"):Queue(XVUI.InstallerData); E:ToggleOptions(); end,
			},
		},
	}
end

-- Defaults: E.global.XVUI
G.XVUI = {
	dev = false,
	install_version = nil,
	scaled = false,
}

-- Defaults: E.private.L1UI
V.XVUI = {}

-- Defaults: E.db.XVUI
P.XVUI = {}

-- Initialize module in ElvUI
local function Initialize()
	if E.private.install_complete == nil then -- ElvUI installer skip
		E.private.install_complete = E.version
	end

	if E.global.XVUI.install_version == nil then -- XvUI installer queue
		PI:Queue(XVUI.InstallerData)
	end

	EP:RegisterPlugin(Name, XVUI.Config)
	--XVUI:RegisterEvents()
end

local function CallbackInitialize()
	Initialize()
end

E:RegisterModule(Name, CallbackInitialize)