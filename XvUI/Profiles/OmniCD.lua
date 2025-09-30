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
  if not E:IsAddOnEnabled("OmniCD") then
    Private:Print("OmniCD " .. "is not installed or enabled.")
    return
  end

  -- Profile names
  local name = (E.global.XVUI.dev and "XvUI") or "XvUI " .. Private.Version

  -- Disable LibDualSpec to set the profile
  if E.Retail then
    OmniCDDB["namespaces"]["LibDualSpec-1.0"] = OmniCDDB["namespaces"]["LibDualSpec-1.0"] or {}
    OmniCDDB["namespaces"]["LibDualSpec-1.0"]["char"] = OmniCDDB["namespaces"]["LibDualSpec-1.0"]["char"] or {}
    OmniCDDB["namespaces"]["LibDualSpec-1.0"]["char"][E.mynameRealm] = {}
    OmniCDDB["namespaces"]["LibDualSpec-1.0"]["char"][E.mynameRealm]["enabled"] = false
  end

  -- Global db
  OmniCDDB["cooldowns"] = {}
  OmniCDDB["global"]["disableElvMsg"] = true
  OmniCDDB["version"] = 4

  OmniCDDB["profiles"][name] = {}
  OmniCDDB["profiles"][name]["General"] = {}
  OmniCDDB["profiles"][name]["Party"] = {}

  OmniCDDB["profiles"][name]["Party"] = {
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
        ["raidBar1"] = {
          ["scale"] = 0.6000000000000001,
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
          ["enabled"] = true,
          ["name"] = "AOE CC",
          ["columns"] = 4,
          ["truncateIconName"] = 3,
          ["locked"] = true,
          ["scale"] = 0.9000000000000001,
          ["progressBar"] = false,
          ["manualPos"] = {
            ["raidBar2"] = {
              ["y"] = 442.454052610381,
              ["x"] = 1064.216304337911,
            },
          },
        },
        ["raidBar3"] = {
          ["enabled"] = true,
          ["growLeft"] = true,
          ["truncateIconName"] = 3,
          ["scale"] = 0.9000000000000001,
          ["layout"] = "horizontal",
          ["progressBar"] = false,
          ["name"] = "Raid CDs",
          ["locked"] = true,
          ["sortBy"] = 9,
          ["manualPos"] = {
            ["raidBar3"] = {
              ["y"] = 277.1210680246113,
              ["x"] = 366.0801090049718,
            },
          },
          ["columns"] = 10,
        },
      },
      ["general"] = {
        ["showRange"] = true,
        ["showPlayer"] = true,
      },
      ["spells"] = {
        ["633"] = true,
        ["370965"] = true,
        ["396286"] = false,
        ["853"] = true,
        ["422750"] = true,
        ["*"] = false,
        ["109304"] = true,
        ["108281"] = true,
        ["235450"] = true,
        ["47568"] = true,
        ["279302"] = true,
        ["19236"] = true,
        ["197721"] = true,
        ["498"] = true,
        ["258925"] = true,
        ["16191"] = true,
        ["403876"] = true,
        ["370665"] = true,
        ["198144"] = false,
        ["374348"] = true,
        ["383009"] = true,
        ["49039"] = true,
        ["32375"] = true,
        ["184662"] = true,
        ["55342"] = true,
        ["191634"] = true,
        ["192222"] = true,
        ["586"] = true,
        ["192249"] = true,
        ["192077"] = true,
        ["198793"] = true,
        ["108270"] = true,
        ["264735"] = true,
        ["319454"] = true,
        ["11426"] = true,
        ["31850"] = true,
        ["383269"] = true,
        ["370511"] = true,
        ["452930"] = true,
        ["235313"] = true,
        ["108416"] = true,
        ["417050"] = true,
        ["382440"] = true,
        ["6262"] = true,
        ["401238"] = true,
        ["387174"] = true,
        ["267171"] = true,
        ["110959"] = true,
        ["198103"] = true,
        ["12051"] = true,
        ["374251"] = true,
        ["48265"] = true,
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
        ["attachMore"] = "LEFT",
        ["columns"] = 20,
        ["offsetX"] = 5,
        ["preset"] = "TOPLEFT",
        ["attach"] = "TOPLEFT",
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
      ["raidCDS"] = {
        ["1044"] = true,
        ["414660"] = true,
        ["388615"] = true,
        ["32375"] = true,
      },
      ["extraBars"] = {
        ["raidBar5"] = {
          ["name"] = "Freedom",
          ["columns"] = 4,
          ["truncateIconName"] = 3,
          ["locked"] = true,
          ["layout"] = "horizontal",
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
        ["raidBar2"] = {
          ["enabled"] = true,
          ["columns"] = 9,
          ["truncateIconName"] = 3,
          ["scale"] = 0.9000000000000001,
          ["layout"] = "horizontal",
          ["progressBar"] = false,
          ["name"] = "Raid CDs",
          ["locked"] = true,
          ["manualPos"] = {
            ["raidBar2"] = {
              ["y"] = 472.8532316184064,
              ["x"] = 160.2138050126923,
            },
          },
          ["growUpward"] = true,
        },
        ["raidBar3"] = {
          ["enabled"] = true,
          ["manualPos"] = {
            ["raidBar3"] = {
              ["y"] = 283.5208139753158,
              ["x"] = 160.2141565751845,
            },
          },
          ["truncateIconName"] = 3,
          ["scale"] = 0.9000000000000001,
          ["layout"] = "horizontal",
          ["progressBar"] = false,
          ["name"] = "Raid Movement",
          ["locked"] = true,
          ["columns"] = 9,
        },
      },
      ["spells"] = {
        ["45438"] = false,
        ["186265"] = false,
        ["32375"] = true,
        ["196555"] = false,
        ["414660"] = true,
        ["642"] = false,
      },
      ["frame"] = {
        ["externalDefensive"] = 3,
        ["freedom"] = 3,
      },
      ["icons"] = {
        ["showTooltip"] = true,
      },
      ["spellFrame"] = {
        [32375] = 2,
      },
    },
    ["visibility"] = {
      ["arena"] = false,
      ["scenario"] = true,
      ["raid"] = true,
    },
    ["groupSize"] = {
      ["raid"] = 30,
      ["party"] = 5,
    },
  }

  OmniCDDB["profiles"][name]["General"] = {
    ["fonts"] = {
      ["statusBar"] = {
        ["font"] = Private.Font,
      },
      ["icon"] = {
        ["font"] = Private.Font,
        ["size"] = 12,
      },
      ["anchor"] = {
        ["font"] = Private.Font,
      },
    },
    ["textures"] = {
      ["statusBar"] = {
        ["BG"] = "ElvUI Norm",
        ["bar"] = Private.Texture,
      },
    },
  }

  OmniCDDB["profileKeys"][E.mynameRealm] = name

  if installer then
    PluginInstallStepComplete.message = "OmniCD profile has been set."
    PluginInstallStepComplete:Show()
  end

  Private:Print("OmniCD profile has been set.")
end
