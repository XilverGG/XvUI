-- Lua functions
local unpack = unpack

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)

--[[
	BigWigs profiles
	LC: 09/03/2025
]]
function Private:Setup_BigWigs()
	if not E:IsAddOnEnabled('BigWigs') then Private:Print('BigWigs ' .. 'is not installed or enabled.') return end

	-- Profile names
	local name = 'XvUI'

	-- Profile strings
	local profile = 'BW1:Lv1pVTTruCqW0Gwyuej5ghNIcu7ceJMHMeR0K26TqB5e5AlPkr1K4jEI6jYdHI86DhLTYwf6qN1CNc6yN0q)aOTa0Hd6JG)i4pb9E8VcjA4GE))3797Dhn(xwLXGqq8GorcQKgfk2BjmM5NlEYGdB0YUrxLPHXvHr8XKGstwTTTBFwD72DmcQSklrhgfeXftgWI5Sa4GoMp6b)GrYP1GG4uf1XJV3SRhhGWunMjNwUtj5kmhmfccIU4aZeB7piItc9GdsKEsIQ6CyyQCsgRFDgg6bsjn0t8Nv4rXYaAiS0(fnp8NB33(0MTAmBuuOSh9TW9xH9AFgd4Ueb4mBeziiPJHoM7)G6xHgplkmY1Nhng8tgmhRdTfzmWQCmN(2D(LyYqors2X2ojROj1DSC9js)fdPcwazkMWpzbgC7uWOQUWJhDrF2fe(qH)SybqD1JEN35gqecxCc6uuneOVUljG6fQmF34s8WQgIajGilB4hTscxkXWs4Htm1)y1WSJ6wRzyBHkFUgghr5GlsO9KeU060ghBFnA7L0HsFBc3dK7YQGAEbq98LTL(axSBIpptW0X2LOd3j1NNRzmBDdFkmsAW2evDyuuWWOlcBfpEGosh2wig)4sRU5c092Jgja5RnwMJACMA9Qj9BEfQPXLmDuyzCk8ahr3Qe0ziCbwM8SDDUVzCapBxynNELXvOW6mE(WmHwFys9pceezSMZxZmw)7Lm5l3Lyv)OU8B63HvnFiDmh(Tyi0DANBO3CFsc(SI4dbEkZzyyKXCLDS9ug0LrVecUQ0DS4zEI(0bnFQUdfvFxPtoSTlCGh5(Sq64JWMqJkt2Tx3ucvG2DYW66DGAVukTSqqON0)Zs5(CIUXqpWzv(aFTfXQR7vVlOSm3W0L6gom(PNuE(46MS7M7YZILrhseYoAesDd0Dy2wCoAS9PUVr35cZuAT46gk1JrC13rmswYYemNHcNhfn(d2vBgorVcb(RTr(QBpp1JI2zTlf53tU9hI1EUKaWC(askTk(1v6)ArCFJ(fG4WHNu8yw5XJrxSre7t0yjztGNPkPWZYZ2jP7ojdQhJNp9hnXGBOF6Gi07fdpXedg7fn7v36L7ZQ5QRRe7XIN83Agl)nD1nv304)QTqNKI3u(kvfRwTB1yoKNwNRNqf0bbGfHFkDmv((5jVpHx872T5ZFH9C4sw6K57sULMxl1ExxKfCZkM5yHVp6mthqYL3)4wSkfU0fe46OJfMdhosJXC9nrCc0tona4hbJiXbsUiLq3yz6hPsR99wKkLK4J2yGxEf15XrTT6HzWwlQ2ZAeniWFvrTXM5oSn)GofhTVxTRVQ2DxM)zeu3xZ2SiYZ0aIYcOah)oY(LP8SOj6zxbbKUrS18r53sEAnUznpJAdmwQBWYpjVqpCYLoxzQm)7V4F(0z9BQViaHs1noxnsn6V(YGpx97SQfPpNahPQOQQQrwvybBTnWMyB1D6ojI6cSTGW(9oyNSX5oF7XGEUb3)))d'

	-- Profile import
	-- API.RegisterProfile(addonName, profileString, optionalCustomProfileName, optionalCallbackFunction)
	BigWigsAPI.RegisterProfile('XvUI', profile, name)

	-- No chat print here
	-- BigWigs will print a message with all important information after the import
end
