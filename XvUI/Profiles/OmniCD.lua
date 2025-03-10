-- Lua functions
local unpack = unpack

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)

--[[
OmniCD profile
LC: 09/03/2025
]]
function Private:Setup_OmniCD(installer)
	if not E:IsAddOnEnabled('OmniCD') then Private:Print('OmniCD ' .. 'is not installed or enabled.') return end

	-- Profile names
	local name = 'XvUI'

	-- Disable LibDualSpec to set the profile
	if E.Retail then
		OmniCDDB['namespaces']['LibDualSpec-1.0'] = OmniCDDB['namespaces']['LibDualSpec-1.0'] or {}
		OmniCDDB['namespaces']['LibDualSpec-1.0']['char'] = OmniCDDB['namespaces']['LibDualSpec-1.0']['char'] or {}
		OmniCDDB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm] = {}
		OmniCDDB['namespaces']['LibDualSpec-1.0']['char'][E.mynameRealm]['enabled'] = false
	end

	-- Global db
	OmniCDDB['cooldowns'] = {}
	OmniCDDB['global']['disableElvMsg'] = true
	OmniCDDB['version'] = 4

	OmniCDDB['profiles'][name] = {}
	OmniCDDB['profiles'][name]['General'] = {}
	OmniCDDB['profiles'][name]['Party'] = {}

	OmniCDDB['profiles'][name]['Party'] = {
		["party"] = {
			["extraBars"] = {
				["raidBar4"] = {
					["manualPos"] = {
						["raidBar4"] = {
							["y"] = 384.3199914097786,
							["x"] = 682.3467034983623,
						},
					},
				},
				["raidBar3"] = {
					["truncateIconName"] = 3,
					["progressBar"] = false,
					["locked"] = true,
					["enabled"] = true,
					["layout"] = "horizontal",
					["name"] = "Raid CDs",
					["growLeft"] = true,
					["manualPos"] = {
						["raidBar3"] = {
							["y"] = 277.1210680246113,
							["x"] = 366.0801090049718,
						},
					},
					["scale"] = 0.9000000000000001,
					["sortBy"] = 9,
					["columns"] = 10,
				},
				["raidBar1"] = {
					["truncateStatusBarName"] = 12,
					["manualPos"] = {
						["raidBar1"] = {
							["y"] = 442.4539744853828,
							["x"] = 975.1463844537793,
						},
					},
					["locked"] = true,
				},
				["raidBar2"] = {
					["truncateIconName"] = 3,
					["progressBar"] = false,
					["enabled"] = true,
					["name"] = "AOE CC",
					["locked"] = true,
					["columns"] = 4,
					["scale"] = 0.9000000000000001,
					["manualPos"] = {
						["raidBar2"] = {
							["y"] = 442.454052610381,
							["x"] = 1064.216304337911,
						},
					},
				},
			},
			["general"] = {
				["showPlayer"] = true,
				["showRange"] = true,
			},
			["spells"] = {
				["370965"] = true,
				["279302"] = true,
				["197721"] = true,
				["192077"] = true,
				["6262"] = true,
				["403876"] = true,
				["396286"] = false,
				["*"] = false,
				["108281"] = true,
				["498"] = true,
				["383009"] = true,
				["49039"] = true,
				["198144"] = false,
				["198793"] = true,
				["47568"] = true,
				["235313"] = true,
				["417050"] = true,
				["382440"] = true,
				["108270"] = true,
				["267171"] = true,
				["370665"] = true,
				["48265"] = true,
				["12051"] = true,
				["422750"] = true,
				["633"] = true,
				["235450"] = true,
				["32375"] = true,
				["586"] = true,
				["55342"] = true,
				["108416"] = true,
				["387174"] = true,
				["452930"] = true,
				["401238"] = true,
				["198103"] = true,
				["374251"] = true,
				["11426"] = true,
				["853"] = true,
				["16191"] = true,
				["109304"] = true,
				["264735"] = true,
				["374348"] = true,
				["184662"] = true,
				["31850"] = true,
				["319454"] = true,
				["383269"] = true,
				["370511"] = true,
				["192249"] = true,
				["192222"] = true,
				["191634"] = true,
				["110959"] = true,
				["258925"] = true,
				["19236"] = true,
			},
			["icons"] = {
				["scale"] = 0.9000000000000001,
				["showTooltip"] = true,
			},
			["raidCDS"] = {
				["32375"] = true,
				["853"] = true,
				["8122"] = true,
				["202137"] = true,
				["207684"] = true,
				["99"] = true,
				["414660"] = true,
				["179057"] = true,
				["157981"] = true,
				["132469"] = true,
				["20549"] = true,
				["202138"] = true,
				["115750"] = true,
				["30283"] = true,
				["31661"] = true,
				["368970"] = true,
				["357214"] = true,
			},
			["position"] = {
				["offsetX"] = 5,
				["locked"] = false,
				["attachMore"] = "LEFT",
				["columns"] = 20,
				["attach"] = "TOPLEFT",
				["preset"] = "TOPLEFT",
				["offsetY"] = 5,
				["anchor"] = "TOPRIGHT",
				["anchorMore"] = "RIGHT",
			},
			["manualPos"] = {
				{
					["y"] = 354.4534295773483,
					["x"] = 717.0132652235043,
				},
				{
					["y"] = 352.3200702500326,
					["x"] = 711.6799840927124,
				},
				{
					["y"] = 432.853193449977,
					["x"] = 665.2801413798297,
				},
				{
					["y"] = 392.3199521684655,
					["x"] = 737.2799053955096,
				},
				{
					["y"] = 294.7202863812381,
					["x"] = 570.346901314253,
				},
			},
			["priority"] = {
				["trinket"] = 100,
			},
			["spellFrame"] = {
				[357214] = 2,
				[853] = 2,
				[368970] = 2,
			},
			["spellGlow"] = {
				["*"] = false,
			},
		},
		["noneZoneSetting"] = "party",
		["scenarioZoneSetting"] = "party",
		["raid"] = {
			["extraBars"] = {
				["raidBar5"] = {
					["truncateIconName"] = 3,
					["layout"] = "horizontal",
					["name"] = "Freedom",
					["locked"] = true,
					["columns"] = 4,
					["scale"] = 0.9000000000000001,
					["manualPos"] = {
						["raidBar5"] = {
							["y"] = 284.586673326492,
							["x"] = 160.2137366533189,
						},
					},
				},
				["raidBar4"] = {
					["name"] = "Immunities",
					["manualPos"] = {
						["raidBar4"] = {
							["y"] = 599.2533069181445,
							["x"] = 511.6803401255529,
						},
					},
				},
				["raidBar3"] = {
					["truncateIconName"] = 3,
					["progressBar"] = false,
					["enabled"] = true,
					["layout"] = "horizontal",
					["name"] = "Raid Movement",
					["locked"] = true,
					["manualPos"] = {
						["raidBar3"] = {
							["y"] = 283.5208139753158,
							["x"] = 160.2141565751845,
						},
					},
					["scale"] = 0.9000000000000001,
					["columns"] = 9,
				},
				["raidBar2"] = {
					["truncateIconName"] = 3,
					["progressBar"] = false,
					["enabled"] = true,
					["layout"] = "horizontal",
					["name"] = "Raid CDs",
					["growUpward"] = true,
					["locked"] = true,
					["columns"] = 9,
					["scale"] = 0.9000000000000001,
					["manualPos"] = {
						["raidBar2"] = {
							["y"] = 472.8532316184064,
							["x"] = 160.2138050126923,
						},
					},
				},
			},
			["spellFrame"] = {
				[32375] = 2,
			},
			["icons"] = {
				["showTooltip"] = true,
			},
			["raidCDS"] = {
				["414660"] = true,
				["1044"] = true,
				["32375"] = true,
				["388615"] = true,
			},
			["frame"] = {
				["freedom"] = 3,
				["externalDefensive"] = 3,
			},
			["spells"] = {
				["32375"] = true,
				["414660"] = true,
				["186265"] = false,
				["196555"] = false,
				["45438"] = false,
				["642"] = false,
			},
		},
		["visibility"] = {
			["scenario"] = true,
			["raid"] = true,
			["arena"] = false,
		},
		["groupSize"] = {
			["party"] = 5,
			["raid"] = 30,
		}
	}

	OmniCDDB['profiles'][name]["General"] = {
		["fonts"] = {
			["statusBar"] = {
				["font"] = "XvUI",
			},
			["icon"] = {
				["font"] = "XvUI",
				["size"] = 12,
			},
			["anchor"] = {
				["font"] = "XvUI",
			},
		},
		["textures"] = {
			["statusBar"] = {
				["BG"] = "ElvUI Norm",
				["bar"] = "XvUI",
			},
		}
	}

	OmniCDDB['profileKeys'][E.mynameRealm] = name

	if installer then
		PluginInstallStepComplete.message = "OmniCD profile has been set."
		PluginInstallStepComplete:Show()
	end

	Private:Print("OmniCD profile has been set.")
end
