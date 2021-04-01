-----------------------------------
-- Area: Winurst Wood
--  NPC: Ephemeral Moogle
-- Type: Crystal Strage NPC
-- !pos -10.500 -5.250 -143.400 241 - Boneworker's Guild
-- !pos -34.840 -1.250 -114.490 241 - Weaver's Guild
-----------------------------------
require("scripts/globals/ephemeral")
-----------------------------------
local entity = {}

local triggerEvent = 896
local tradeEvent = 898
local failEvent = 900

entity.onTrade = function(player, npc, trade)
    xi.ephemeral.onTrade(player, trade, tradeEvent, failEvent)
end

entity.onTrigger = function(player, npc)
    xi.ephemeral.onTrigger(player, triggerEvent)
end

entity.onEventUpdate = function(player, csid, option)
    xi.ephemeral.onEventUpdate(player)
end

entity.onEventFinish = function(player, csid, option)
    xi.ephemeral.onEventFinish(player, option, csid == tradeEvent)
end

return entity
