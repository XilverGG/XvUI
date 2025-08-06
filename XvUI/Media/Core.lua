local LSM = LibStub('LibSharedMedia-3.0')

if LSM == nil then return end

local MediaType_FONT = LSM.MediaType.FONT
local MediaType_STATUSBAR = LSM.MediaType.STATUSBAR
local MediaType_SOUND = LSM.MediaType.SOUND

-- -----
-- BACKGROUND
-- -----

-- -----
--  BORDER
-- ----

-- -----
--   FONT
-- -----
LSM:Register(MediaType_FONT, "XvUI", [[Interface\Addons\XvUI\Media\Fonts\XvUI.ttf]])
LSM:Register(MediaType_FONT, "XvUI CYR", [[Interface\Addons\XvUI\Media\Fonts\XvUI_CYR.ttf]])

-- -----
--   SOUND
-- -----
LSM:Register(MediaType_SOUND, "|cff0099ffAlert|r", [[Interface\Addons\XvUI\Media\Sounds\alert.ogg]])
LSM:Register(MediaType_SOUND, "|cff0099ffAvoid|r", [[Interface\Addons\XvUI\Media\Sounds\avoid.ogg]])
LSM:Register(MediaType_SOUND, "|cff0099ffDamage|r", [[Interface\Addons\XvUI\Media\Sounds\damage.ogg]])
LSM:Register(MediaType_SOUND, "|cff0099ffDeffensive|r", [[Interface\Addons\XvUI\Media\Sounds\deffensive.ogg]])
LSM:Register(MediaType_SOUND, "|cff0099ffDPS|r", [[Interface\Addons\XvUI\Media\Sounds\dps.ogg]])
LSM:Register(MediaType_SOUND, "|cff0099ffFocus|r", [[Interface\Addons\XvUI\Media\Sounds\focus.ogg]])
LSM:Register(MediaType_SOUND, "|cff0099ffFrontal|r", [[Interface\Addons\XvUI\Media\Sounds\frontal.ogg]])
LSM:Register(MediaType_SOUND, "|cff0099ffHealer|r", [[Interface\Addons\XvUI\Media\Sounds\healer.ogg]])
LSM:Register(MediaType_SOUND, "|cff0099ffHealing|r", [[Interface\Addons\XvUI\Media\Sounds\healing.ogg]])
LSM:Register(MediaType_SOUND, "|cff0099ffKick|r", [[Interface\Addons\XvUI\Media\Sounds\kick.ogg]])
LSM:Register(MediaType_SOUND, "|cff0099ffStun|r", [[Interface\Addons\XvUI\Media\Sounds\stun.ogg]])
LSM:Register(MediaType_SOUND, "|cff0099ffSwirly|r", [[Interface\Addons\XvUI\Media\Sounds\swirly.ogg]])
LSM:Register(MediaType_SOUND, "|cff0099ffTank|r", [[Interface\Addons\XvUI\Media\Sounds\tank.ogg]])
-- -----
--   STATUSBAR
-- -----
LSM:Register(MediaType_STATUSBAR, "XvUI", [[Interface\Addons\XvUI\Media\Textures\XvUI]])
LSM:Register(MediaType_STATUSBAR, "XvUI Alt", [[Interface\Addons\XvUI\Media\Textures\XvUI_Alt]])
LSM:Register(MediaType_STATUSBAR, "XvUI Target", [[Interface\Addons\XvUI\Media\Textures\XvUI_Target]])
LSM:Register(MediaType_STATUSBAR, "XvUI Focus", [[Interface\Addons\XvUI\Media\Textures\XvUI_Focus]])
