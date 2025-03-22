-- Lua functions
local format = format
local unpack = unpack

-- API cache
local GetAddOnMetadata = C_AddOns.GetAddOnMetadata

-- Cache Lua / WoW API
local ReloadUI = ReloadUI

-- Global environment
local _G = _G

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)
local PI = E:GetModule('PluginInstaller')

-- Chat print
function Private:Print(msg)
	print(Private.Name .. ': ' .. msg)
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
	text = format('|cffFF0000%s|r', L["Your ElvUI is outdated - please update and reload."]),
	whileDead = 1,
	hideOnEscape = false,
}

-- Events
function XVUI:PLAYER_ENTERING_WORLD(_, initLogin, isReload)
	if initLogin or isReload then
		Private:VersionCheck()
	end
end

-- Register events
function XVUI:RegisterEvents()
	XVUI:RegisterEvent('PLAYER_ENTERING_WORLD')
end

-- Set install version to current XvUI version
local function InstallComplete()
	E.global.XVUI.install_version = Private.Version
	ReloadUI()
end

-- Installer table
XVUI.InstallerData = {
	Title = format("|cff0099ff%s %s|r", Private.Name, L["Installation"]),
	Name = Private.Name,
	tutorialImage = Private.Logo,
	Pages = {
		[1] = function()
			PluginInstallFrame.SubTitle:SetFormattedText("Welcome to the installation for %s.", Private.Name)
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
			PluginInstallFrame.Option1:SetScript("OnClick", function() Private:Setup_ElvUI_ActionBarBuddy() end)
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
