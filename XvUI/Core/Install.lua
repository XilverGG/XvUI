-- Lua functions
local format = format
local unpack = unpack

-- API cache
local C_UI_Reload = C_UI.Reload

-- Global environment
local _G = _G

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)

-- Set install version to current XvUI version
local function InstallComplete()
	E.global.XVUI.install_version = Private.Version
	C_UI_Reload()
end

-- Installer table
XVUI.InstallerData = {
	Title = format('|cff0099ff%s %s|r', Private.Name, "Installer"),
	Name = Private.Name,
	tutorialImage = Private.Logo,
	Pages = {
		[1] = function()
			PluginInstallFrame.SubTitle:SetFormattedText(L["installer_welcome_title"], Private.Name)
			PluginInstallFrame.Desc1:SetText(L["installer_welcome_desc1"])
			PluginInstallFrame.Desc2:SetText(format('|cff0099ff%s', L["installer_welcome_desc2"]))
			PluginInstallFrame.Desc3:SetText(L["installer_welcome_desc3"])
			--PluginInstallFrame.Option1:Show()
			--PluginInstallFrame.Option1:SetScript("OnClick", InstallComplete)
			--PluginInstallFrame.Option1:SetText(L["installer_close"])
		end,
		[2] = function()
			PluginInstallFrame.SubTitle:SetText(L["installer_elvui_title"])
			PluginInstallFrame.Desc1:SetText(L["installer_elvui_desc"])
			PluginInstallFrame.Desc2:SetText(format('|cff0099ff%s', L["installer_recommended_step"]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() Private:Setup_ElvUI() end)
			PluginInstallFrame.Option1:SetText(L["installer_elvui_button"])
		end,
		[3] = function()
			PluginInstallFrame.SubTitle:SetText(L["installer_plater_title"])
			PluginInstallFrame.Desc1:SetText(L["installer_plater_desc"])
			PluginInstallFrame.Desc2:SetText(format('|cff0099ff%s', L["installer_recommended_step"]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() Private:Setup_Plater(true) end)
			PluginInstallFrame.Option1:SetText(L["installer_plater_button"])
		end,
		[4] = function()
			PluginInstallFrame.SubTitle:SetText(L["installer_bigwigs_title"])
			PluginInstallFrame.Desc1:SetText(L["installer_bigwigs_desc"])
			PluginInstallFrame.Desc2:SetText(format('|cff0099ff%s', L["installer_recommended_step"]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() Private:Setup_BigWigs() end)
			PluginInstallFrame.Option1:SetText(L["installer_bigwigs_button"])
		end,
		[5] = function()
			PluginInstallFrame.SubTitle:SetText(L["installer_details_title"])
			PluginInstallFrame.Desc1:SetText(L["installer_details_desc"])
			PluginInstallFrame.Desc2:SetText(format('|cff0099ff%s', L["installer_recommended_step"]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function()
        Private:Setup_Details({ isInstaller = true, alternativeProfile = false })
      end)
			PluginInstallFrame.Option1:SetText(L["installer_details_button"])
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript("OnClick", function()
        Private:Setup_Details({ isInstaller = true, alternativeProfile = true })
      end)
			PluginInstallFrame.Option2:SetText(L["installer_details_button_alt"])
		end,
		[6] = function()
			PluginInstallFrame.SubTitle:SetText(L["installer_omnicd_title"])
			PluginInstallFrame.Desc1:SetText(L["installer_omnicd_desc"])
			PluginInstallFrame.Desc2:SetText(format('|cff0099ff%s', L["installer_recommended_step"]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() Private:Setup_OmniCD(true) end)
			PluginInstallFrame.Option1:SetText(L["installer_omnicd_button"])
		end,
		[7] = function()
			PluginInstallFrame.SubTitle:SetText(L["installer_warpdeplete_title"])
			PluginInstallFrame.Desc1:SetText(L["installer_warpdeplete_desc"])
			PluginInstallFrame.Desc2:SetText(format('|cff0099ff%s', L["installer_recommended_step"]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() Private:Setup_WarpDeplete(true) end)
			PluginInstallFrame.Option1:SetText(L["installer_warpdeplete_button"])
		end,
		[8] = function()
			PluginInstallFrame.SubTitle:SetText(L["installer_nameplatesct_title"])
			PluginInstallFrame.Desc1:SetText(L["installer_nameplatesct_desc"])
			PluginInstallFrame.Desc2:SetText(format('|cff0099ff%s', L["installer_nameplatesct_info"]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() Private:Setup_NameplateSCT(true) end)
			PluginInstallFrame.Option1:SetText(L["installer_nameplatesct_button"])
		end,
		[9] = function()
			PluginInstallFrame.SubTitle:SetText(L["installer_actionbarbuddy_title"])
			PluginInstallFrame.Desc1:SetText(L["installer_actionbarbuddy_desc"])
			PluginInstallFrame.Desc2:SetText(format('|cff0099ff%s', L["installer_optional_step"]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() Private:Setup_ElvUI_ActionBarBuddy() end)
			PluginInstallFrame.Option1:SetText(L["installer_actionbarbuddy_button"])
		end,
		[10] = function()
			PluginInstallFrame.SubTitle:SetText(L["installer_addonskins_title"])
			PluginInstallFrame.Desc1:SetText(L["installer_addonskins_desc"])
			PluginInstallFrame.Desc2:SetText(format('|cff0099ff%s', L["installer_optional_step"]))
			PluginInstallFrame.Desc3:SetText(L["installer_addonskins_desc2"])
			PluginInstallFrame.Desc4:SetText(L["installer_addonskins_desc3"])
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() Private:Setup_AddOnSkins() end)
			PluginInstallFrame.Option1:SetText(L["installer_addonskins_button"])
		end,
		[11] = function()
			PluginInstallFrame.SubTitle:SetText(L["installer_complete_title"])
			PluginInstallFrame.Desc1:SetText(L["installer_complete_desc"])
			PluginInstallFrame.Desc2:SetText(L["installer_complete_desc2"])
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", InstallComplete)
			PluginInstallFrame.Option1:SetText(L["installer_complete_button"])
		end,
	},
	StepTitles = {
		[1] = L["installer_welcome_step_title"],
		[2] = "ElvUI",
		[3] = "Plater",
		[4] = "BigWigs",
		[5] = "Details",
		[6] = "OmniCD",
		[7] = "WarpDeplete",
		[8] = "NameplateSCT",
		[9] = "ActionBar Buddy",
		[10] = "AddOnSkins",
		[11] = L["installer_complete_step_title"]
	},
	StepTitlesColor = {1, 1, 1},
	StepTitlesColorSelected = {0, 179/255, 1},
	StepTitleWidth = 200,
	StepTitleButtonWidth = 180,
	StepTitleTextJustification = "LEFT",
}
