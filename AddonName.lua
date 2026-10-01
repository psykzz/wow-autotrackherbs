local addonName = ...

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_LOGIN")

    SLASH_ADDONNAME1 = "/addonname"
    SlashCmdList.ADDONNAME = function()
        print(addonName .. " is loaded.")
    end
end)
