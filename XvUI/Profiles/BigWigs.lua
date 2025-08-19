-- Lua functions
local unpack = unpack

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)

--[[
BigWigs profiles
LC: 18/08/2025
]]

function Private:Setup_BigWigs()
	if not E:IsAddOnEnabled('BigWigs') then Private:Print('BigWigs ' .. 'is not installed or enabled.') return end

	-- Profile names
	local name = 'XvUI'

	-- Profile strings
	local profile = 'BW1:TzvtVTTrtyqW0Gweuuj5g7KIee3cNIxFOb1Y1PTgOhmTL)Q2wQs0VXXN4kQrIBcf52Ll9h5Oqrrp7Z9uqp2t6q)bOBbOhi0pb)tW)c6o7YLu5dFyH35JNzMNzMLY6FyvgcjjKbqR4eQGghL81tGHSaZ197UzJJCB0oZ2Y66Oy(qsyPkNMUUnpSUBZwwHvMMd0MXHX8KZ6Ys5Sqy9w2F7t(El1Pt3WuTG64X3z3EahGiTeB1PJ)LeJa7UxcHHXNVUTs3kDJ5KObW6QBRPevNd903viw)M8COdie0Obj)rfECQiKgbtC3DVn)5Mh7EWEh1yu)4irh6RGLNI16XmgW9jjG3O(KEGGoeAzVYtQFnQ8W4Oy)aE8qiqrmBlD9iYqGvzBo9vl(lPKECIGSORRcvuv2co(berW4E0ewi5seWpAm6CtDYKvD8aE85hZoNW7LemknbO(sQ371(HKKeFKb9kIgMOpVnjKoikZ(1dlZhw1imrcjIYcEn2ciu7iHFlkh8XgLlHpaeoh0yBxwnulI6m1fB(3ZLoccxKT0nOINr7jc0y8tSkOKDb6GartraWtwwzZgjmPJTjsF902SJSZ5kl8dG(cl2COOnJJd7fFE0rPd7k90JnVaUq8bI7ThJM3SF)eq8Cl1LomIVSaTFBK2l6mjqqGkhCI59aUA8BFlll7jMsfjWhwwk5591yWNHfgJ3nXSWxD)CkQdVQr3w(3eJie9hZQotsQ5Qsl0ymd(NyPTppAA7TUgf14cMKlqYZ76YIcJHTkjkNvzvFp27RoU1RlDYJDptJOfp2FJi6WTs5ylkYwphugm3lzqBg9ciKD3zDs1pqp90EOKJMDGCmoP6ngAkFWMNVGXUVX4nsfXBsseTK4q9dL(KpTzaYnG6)sjwj2Ao5TkOSL097YWcrdebFIEeZmf0O3aiyQjvkBr5ak9DBo8RPqK)LTUL8vI1yp4dpWRBezln14Ngl0PFCTYZvRBR6nBbjebYOMHN8T7Du3YhgERw9j6i8OrOOtJJhMR1ujDoNYaVzM(p5rxP1xutZSaA2jV77s2D8jHG9vDj6THK))u5)6q8FP8vN0OE7x8aA5XQOjUyAhqKzIAbINlsf4rg02xZHkIyv88P)Gn6Cd5ZvKe5GAV9TrNXntjXw35zRWQ5lJRaRWIpZm)iM57iz3o72w)BTXsqkEh7bzvCoQ5rnUcmW6DZz0eA3qWHWpGoKkEZvQ3eXhzA3EVD219k4cMMz(g1(RjwY3XkqbB6Pmph8nzVrshupj8BFgRsHjTHeCyWZbXWJJ9YuomYHejILXgjIoIldb(wqFsAOGNO703zI(7J6u4XJ13u4V1D6oWeyjCEz3lBH8SxEnBjN(0WWGPfPawtlWM7DkyKHFt2xgKv7(tmFbdL9q2CfEEOmHOSqkWXpHTsjKhgFMKcl6d6bJ5VQVzJ5P1421gyvRR1ezbw(Rbgl5iZTtZSZS)Rp)V)4rhVNCHgIez360SxK9I)8lc)0SFNvTaEtFSFwLSQz1itl0GL2DWIqsbTplM6dS5HOJ7S(I505I)VTbjVbl)F'

	-- Profile import
	-- API.RegisterProfile(addonName, profileString, optionalCustomProfileName, optionalCallbackFunction)
	BigWigsAPI.RegisterProfile('XvUI', profile, name)

	-- No chat print here
	-- BigWigs will print a message with all important information after the import
end
