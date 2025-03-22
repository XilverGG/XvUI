-- Lua functions
local format = format
local pairs = pairs
local sort = sort
local tconcat = table.concat
local tinsert = table.insert
local tonumber = tonumber
local tostring = tostring
local unpack = unpack

-- API cache
local GetCVar = C_CVar.GetCVar
local GetCVarBool = C_CVar.GetCVarBool
local SetCVar = C_CVar.SetCVar

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)
local D = E:GetModule('Distributor')
local PI = E:GetModule('PluginInstaller')

-- LibAceConfigHelper does not exist yet
local ACH

function XVUI:Config()

	E.Options.name = format('%s + %s |cff0099ff%.2f|r', E.Options.name, Private.Name, Private.Version)

	-- LibAceConfigHelper
	ACH = E.Libs.ACH

	-- Don't export this
	D.blacklistedKeys.global.XVUI = {}
	D.blacklistedKeys.global.XVUI.dev = true

	-- Header
	XVUI.Options = ACH:Group(Private.Name, nil, 20)

	-- Installer & Update
	XVUI.Options.args.setup = ACH:Group('', nil, 1)
	XVUI.Options.args.setup.inline = true
	XVUI.Options.args.setup.args.header1 = ACH:Header(Private.Name, 1)
	XVUI.Options.args.setup.args.spacer1 = ACH:Spacer(2, 'full')
	XVUI.Options.args.setup.args.installer = ACH:Execute(Private.Name .. ' ' .. L["Install"], L["Re-Run the installation process."], 3, function() PI:Queue(XVUI.InstallerData) E:ToggleOptions() end)
	XVUI.Options.args.setup.args.dev = ACH:Toggle('Developer', "Enable this toggle to apply Luckyone's personal adjustments during the installation process.\n\nAdditional information section will show up at the bottom of the config after ReloadUI.", 4, nil, nil, nil, function() return E.global.XVUI.dev end, function(_, value) E.global.XVUI.dev = value end)
	XVUI.Options.args.setup.args.spacer2 = ACH:Spacer(5, 'full')
	XVUI.Options.args.setup.args.header2 = ACH:Header(L["Quick setup for alts"], 6)
	XVUI.Options.args.setup.args.spacer3 = ACH:Spacer(7, 'full')
	XVUI.Options.args.setup.args.altMain = ACH:Execute(L["Alt: "] .. L["DPS & Tanks"], L["Quick setup for alts"] .. '\n\n' .. L["This step will load your most recent XvUI profile."], 8, function() Private:HandleAlts('Main') end, nil, true)

	-- Spacer
	XVUI.Options.args.header = ACH:Spacer(2, 'full')

	-- WeakAuras Retail
	XVUI.Options.args.weakauras = ACH:Group('WeakAuras', nil, 3)
	XVUI.Options.args.weakauras.args.edits.inline = true
	XVUI.Options.args.weakauras.args.edits.args.importButtonRanged = ACH:Execute(L["Ranged DPS"], nil, 1, function() Private:WeakAurasImport('customEditsRanged') end)
	XVUI.Options.args.weakauras.args.edits.args.importButtonMelee = ACH:Execute(L["Melee DPS"], nil, 2, function() Private:WeakAurasImport('customEditsMelee') end)
	XVUI.Options.args.weakauras.args.edits.args.spacer = ACH:Spacer(3, 'full')
	XVUI.Options.args.weakauras.args.edits.args.importButtonTanks = ACH:Execute(L["Tanks"], nil, 4, function() Private:WeakAurasImport('customEditsTanks') end)
	XVUI.Options.args.weakauras.args.edits.args.importButtonHealers = ACH:Execute(L["Healers"], nil, 5, function() Private:WeakAurasImport('customEditsHealers') end)

	E.Options.args.XVUI = XVUI.Options
end
