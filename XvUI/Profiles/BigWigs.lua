-- Lua functions
local unpack = unpack

-- AddOn namespace
local _, Private = ...

-- ElvUI modules
local E, L = unpack(ElvUI)

--[[
BigWigs profile
LC: 25/08/2025
]]

function Private:Setup_BigWigs()
  if not E:IsAddOnEnabled("BigWigs") then
    Private:Print("BigWigs " .. "is not installed or enabled.")
    return
  end

  -- Profile names
  local name = "XvUI"

  -- Profile strings
  local profile =
    "BW1:Tz1sVTTXtCqW0GweuujLg7KIee3cNI)5qdQvQtBnqpeAl)Q2wQsu)JJpXvuJe3ekYTlx6h5OqrrpRZ9uqp2t6q)aOBbOhwOpc(JG)e0D2LpuE4dl8op(nZ8BMzPS(hwLrqsczi0koHkOXrjF9myeli)6(92SXrUnAlTTSUmkMpIewQYPPRBZdR72SLvyL5zaTzCymp50ESuole2OL93(OV3sF60lm1iOoE8D2ThYbiYiXwF64FbjxGDVlGWW4Z2WwRBTEXCs0qyd9T11IQZH(M7AeRFvwo0becA0WK)OcpovesJGzU7U3M)CZUUhS3rngpios0H(k4HZXATlJbCFsc4nEaPpiOJGw2R9O6xIkpmok2pGhpcc0eZ2kxpImcyv2MtF1k)skPpNiiR46Qrfvjx2XpGicM2NMWcjxGa(rtrNBAsgz1Pd5XN1LDgH3pjyCAcq9vuV3R9djjj(id6venmrFEBsiDyK0(1JkZhw1imrcjIYcED2Yiu7OGFlkh8XgLlHpeeoh0yBxwnulI6c1fBP3ZLoccxix9kuXZO9fbgm(jwfuYUaDyGOPia4jpuBZttykhBtu(6zSzhvNZvv4hadewSBII2mooSF8zrhLoQNYtp2sc4CXhiUxFkAEZbdsaXZT0x6Wi(Qc0(TrAVOtvabb6CWjM3h46XV9TSSSNLxQibEVYsjlVVed(cSWu8EEml810pNJ6WRg0Tv)nlxeI(dyvxijnCvPfgmwa)JTm2NfnJ9wxIIACotXfi55DzzrHXWwNeLZQSQVh79vDB96sN8y3oVr0Ih7)0i6OTs5ylkY2mhugm3lyqBg9CiKDRfDs3pqp9mEOLJMDGAmoP6v50u2GnpBbJDNCJFAQiEtsIOLchQFOYNSPTCGCdO(VuHvITHtERcsUQPFxgwiAOi4tmJy5tbn6pecMNNkLTOmav(Unh(1uiY)Iwxt9kX6S7(Hh4nnc5QZZ9ZGf60pUE55JRBR7nBbjebYO5dpzB37OVLnm8wT6Jnr4(JrrNehpktBEL05mkd8wy6)47pXOVOMwybmFN8wVlz3XNec2t6rmBdj))5Q)1H4)s1RoPr93V4b0YJhJM4IPDarLj6fiEMiDGhNJ2(goutepgpFYpyJo3q9CfjrnO2FFB0zCZurS1DE2ASA(Q4kWkS4ZmlnML)De51Lx36FRnvbsX7y3vwX5OMh1ycKdR3vNstO9cbhc)a6iQ4nt0VjIpY0U9E7SR7e4CMHz(g9(BESuVJvGc20tzEo4BYEJvoOFs43(mwLctAdj4WGNdIHhh7LPCW54t7UhscDexec8TGbK0qbpX0LVXmZ3gnH)btn30yV1n6nmpOkO8K3wUCwMRUkx1zanmmyEr4X6zz2nFNIfz33i)YazT7ml)RxOS7XUzHNhQsiklKcC8ZxRvc5HXNQOVIEGzOyPjdY3wEsnUDTHw16zntvGL)sGPk(j)2jsBP9F95)9hpU7EQLzisiV2jYxiFXF(fHFQ83zvlGpVhoqwrwvwJmVqdwA3alcff0(0yQpWwcI62zJvYOZv(FBdkEdE4)b"

  -- Profile import
  BigWigsAPI.RegisterProfile("XvUI", profile, name)

  -- No chat print here
  -- BigWigs will print a message with all important information after the import
end
