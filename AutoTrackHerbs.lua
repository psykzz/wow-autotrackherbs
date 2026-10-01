-- AutoTrackHerbs
-- Keeps "Find Herbs" minimap tracking enabled. Tracking can silently get
-- cleared on death/resurrect or on login/reload; this just re-enables it
-- whenever that happens. No-ops entirely for characters that don't have
-- Herbalism (the tracking type simply won't be found in their list).
--
-- Verified live via /script against C_Minimap.* on this client:
--   C_Minimap.GetNumTrackingTypes() -> number
--   C_Minimap.GetTrackingInfo(index) -> table { type, name, active, spellID,
--     subType, texture }
--   C_Minimap.SetTracking(index, state)
-- The legacy globals (GetTrackingInfo/SetTracking) no longer exist on this
-- client.

local FIND_HERBS_SPELL_ID = 2383

-- Finds the current tracking-list index for Find Herbs by spellID (locale-
-- independent, unlike matching on the tracking type's display name).
-- Returns index, active or nil, nil if this character doesn't have it.
local function FindHerbsTrackingIndex()
    for i = 1, C_Minimap.GetNumTrackingTypes() do
        local info = C_Minimap.GetTrackingInfo(i)
        if info and info.spellID == FIND_HERBS_SPELL_ID then
            return i, info.active
        end
    end
    return nil, nil
end

local function EnsureHerbTracking()
    local index, active = FindHerbsTrackingIndex()
    if index and not active then
        C_Minimap.SetTracking(index, true)
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("PLAYER_ALIVE")
frame:RegisterEvent("PLAYER_UNGHOST")
frame:RegisterEvent("MINIMAP_UPDATE_TRACKING")

frame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_ENTERING_WORLD" then
        -- Tracking info isn't always populated the instant this fires (e.g.
        -- immediately after login), so give it a moment before checking.
        C_Timer.After(2, EnsureHerbTracking)
    else
        EnsureHerbTracking()
    end
end)
