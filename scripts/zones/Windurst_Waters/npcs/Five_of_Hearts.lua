-----------------------------------
-- Area: Windurst Waters
--  NPC: Five of Hearts
-----------------------------------
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:getQuestStatus(tpz.quest.log_id.WINDURST, tpz.quest.id.windurst.A_GREETING_CARDIAN) == QUEST_ACCEPTED then
        player:startEvent(686)
    else
        player:startEvent(273)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
