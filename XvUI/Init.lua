-- Lua functions
local tonumber = tonumber
local unpack = unpack

-- API cache
local GetAddOnMetadata = C_AddOns.GetAddOnMetadata

-- Cache Lua / WoW API
local format = string.format
local GetCVarBool = GetCVarBool
local ReloadUI = ReloadUI
local StopMusic = StopMusic

-- AddOn namespace
local Name, Private = ...

local Version = GetAddOnMetadata(Name, "Version")

-- Create references to ElvUI internals
local E, L, V, P, G = unpack(ElvUI)

-- Create reference to LibElvUIPlugin
local EP = LibStub("LibElvUIPlugin-1.0")

-- Create a new ElvUI module so ElvUI can handle initialization when ready
local XVUI = E:NewModule(Name, "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0");

-- Constants: Logo, Name
Private.Logo = 'Interface\\AddOns\\XvUI\\Media\\Textures\\XvUI_Logo'
Private.Name = '|cff0099ffXv|r|cffffffffUI|r'

-- Constants: Version checks
--Private.RequiredElvUI = tonumber(GetAddOnMetadata(Name, 'X-Required-ElvUI'))
Private.Version = tonumber(GetAddOnMetadata(Name, 'Version'))

-- Global environment
local _G = _G

-- Chat print
function Private:Print(msg)
	print(Private.Name .. ': ' .. msg)
end

-- This function is executed when you press "Skip Process" or "Finished" in the installer.
local function InstallComplete()
	if GetCVarBool("Sound_EnableMusic") then
		StopMusic()
	end

	-- Set a variable tracking the version of the addon when layout was installed
	E.db[Name].install_version = Version

	ReloadUI()
end

-- This is the data we pass on to the ElvUI Plugin Installer.
-- The Plugin Installer is reponsible for displaying the install guide for this layout.
local InstallerData = {
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
		[8] = "Installation Complete"
	},
	StepTitlesColor = {1, 1, 1},
	StepTitlesColorSelected = {0, 179/255, 1},
	StepTitleWidth = 200,
	StepTitleButtonWidth = 180,
	StepTitleTextJustification = "LEFT",
}

-- This function holds the options table which will be inserted into the ElvUI config
local function InsertOptions()
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
				func = function() E:GetModule("PluginInstaller"):Queue(InstallerData); E:ToggleOptions(); end,
			},
		},
	}
end

-- Create a unique table for our plugin
P[Name] = {}

-- This function will handle initialization of the addon
function XVUI:Initialize()
	-- Initiate installation process if ElvUI install is complete and our plugin install has not yet been run
	if E.private.install_complete and E.db[Name].install_version == nil then
		E:GetModule("PluginInstaller"):Queue(InstallerData)
	end

	-- Insert our options table when ElvUI config is loaded
	EP:RegisterPlugin(Name, InsertOptions)
end

-- Register module with callback so it gets initialized when ready
E:RegisterModule(XVUI:GetName())
