-- Lua functions
local unpack = unpack

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)

--[[
BigWigs profiles
LC: 04/07/2025
]]

function Private:Setup_BigWigs()
	if not E:IsAddOnEnabled('BigWigs') then Private:Print('BigWigs ' .. 'is not installed or enabled.') return end

	-- Profile names
	local name = 'XvUI'

	-- Profile strings
	local profile = 'BW1:Lv1tVTrruCTAlrGIqy7qtAruraPgroqBJdParIdDtCADij2yVMMMt741pV7OUE3HzNn)P3WIdC2N5ufh5KpWhaFRsCyK)iKpc5tqN3S)Zk1hg53))9E)EZSg)hRYiioM4bTJIPcAuy8gZGrm)CXd7VxJtSB0rAAyCDyeFejO0KvlB7whx3UvBJGkZZs0Erbr84Z7Zs4Say32Mp5r)GH(0QFqsQI64X3B2XJdqyQgt9PL7vKCfM9VcccIUyxtTTT6hXjHEWUAPD0QQZHbPY6mw)Mmm0fecAOx8FvHhLicOHWm7x0CVFPvp7JAEsJXdJcfDPVb2Co2R9ymG7sIbNXdjdabDe02CRhv)A04XrHrU(8OrGVEWCGk0tiJawLd403S(VMqgWjcY6226SIMKRz56te(thqJzbKRWe(rtXGBLcgz1PE8Ol6XUGWhe7pojgOUQrVZBDdiXXU4e0POAiqFvhsa1luA(2rL4Hvnebsaru2WpzUaUuGHP5Hdnv)y1WSJ6wOzyRIkFUcg7t5GlsODfeUW6OghyFdA7L0bcFBc3de)mRcQ5fa1Zx0s4d84n1(8SyMk2oev4oP(8CfJzRA4JGHcd2kOQ9IIcgeDr4jjJ6RI0HTkIXpS0YLMIU3A4Wyq8kJz5OgNPwNEEVMxJAACjtffwgNcpWr0dkbDgcNILjpB3K7BghWZ2fwWPtnUgfwKXZhMAA9X66VpetejkoFbZy9FOEYxUlXQ(bD530RnRA(q6ao87jqO7vTVJAZDhn(SI4daEkZzyyKXCLDS9vmOdJEjeCDP7yXZ8e9PnA(ivhgx9TLo5WUxHd8i3NfshTp2ekuzYU7IM0ubA3jdRl2bYnsP0YcbHEc)pjL7Zj6gd8aN55d8fweRUOxDVGYYCdtxQB4W4N2P8C76MS7N7YZser7rIfTviK6gO6WST4C0y7tDFTQZJntP1SRB7OL6YiUQ7ig6LSmbZXOWzrrJU1UAZWZvRqG)cBKN(vts9OODw4sr(9K7EBS21LeaMt6tsP14FBU6Vwe3xREbijCWHfpMvESn6InIyFIcl6nbEMkDHhNNTdt3D0dQTXZN(JMyWnupDqIv7fdo0edg7ff7v36LBXQ5QQRa7XIN8xDml)nD5sYLm()AtvjP4nLVuwX6KwN0ycKNwNBoNgt7hawe(r0ruX7MOFFcV43PtZN)c7jWLS0jZ3PVLMxl5g3uKfCZkH5yHVp6mwfG(Y7F(zSkfU0bIX1rhlmhoCKgt4QBI4eOR4QaGVpmKKei4XPe6YZs)ivATF40ujDI3F5(E5vuLhh59Kpod2kr5gwdPbb(ZlQn2mRXw5wDkoAFN8R9L1U)S8pJG6EaBLIipwbiklGcC87iBvMYJJoxn7kiG0nIvNmm)wYtR13OMNrnU5mvdw(j5PQHtU0zstP5)85)7hpUxt1fbiuiVZzYHYH)9xe8PY)GvTi95e4qzfzvznY8clyRTm2e3tUwNZJOUaBviSx3DxpBCU(3EaOMBWMV)d'

	-- Profile import
	-- API.RegisterProfile(addonName, profileString, optionalCustomProfileName, optionalCallbackFunction)
	BigWigsAPI.RegisterProfile('XvUI', profile, name)

	-- No chat print here
	-- BigWigs will print a message with all important information after the import
end
