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

-- -----
--   STATUSBAR
-- -----
LSM:Register(MediaType_STATUSBAR, "XvUI", [[Interface\Addons\XvUI\Media\Textures\XvUI]])
LSM:Register(MediaType_STATUSBAR, "XvUI Alt", [[Interface\Addons\XvUI\Media\Textures\XvUI_Alt]])
LSM:Register(MediaType_STATUSBAR, "XvUI Target", [[Interface\Addons\XvUI\Media\Textures\XvUI_Target]])
LSM:Register(MediaType_STATUSBAR, "XvUI Focus", [[Interface\Addons\XvUI\Media\Textures\XvUI_Focus]])
