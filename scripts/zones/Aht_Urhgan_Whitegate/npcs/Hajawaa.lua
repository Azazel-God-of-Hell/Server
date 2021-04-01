-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Hajawaa
-- Armor Storage NPC
-----------------------------------
require("scripts/globals/armorstorage")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.armorStorage.onTrade(player, trade, 703)
end

entity.onTrigger = function(player, npc)
    xi.armorStorage.onTrigger(player, 704)
end

entity.onEventUpdate = function(player, csid, option)
    xi.armorStorage.onEventUpdate(player, csid, option, 704)
end

entity.onEventFinish = function(player, csid, option)
    xi.armorStorage.onEventFinish(player, csid, option, 703, 704)
end

return entity
