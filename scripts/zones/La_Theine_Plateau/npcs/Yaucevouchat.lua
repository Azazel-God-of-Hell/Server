-----------------------------------
-- Area: La Theine Plateau
--  NPC: Yaucevouchat
-- Involved in Mission: The Rescue Drill
-- !pos -318 39 183 102
-----------------------------------
require("scripts/globals/missions")
local ID = require("scripts/zones/La_Theine_Plateau/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:getCurrentMission(SANDORIA) == xi.mission.id.sandoria.THE_RESCUE_DRILL then
        local MissionStatus = player:getCharVar("MissionStatus")

        if MissionStatus >= 5 and MissionStatus <= 7 then
            player:startEvent(104)
        elseif MissionStatus == 8 then
            player:showText(npc, ID.text.RESCUE_DRILL + 21)
        elseif MissionStatus >= 9 then
            player:showText(npc, ID.text.RESCUE_DRILL + 26)
        else
            player:showText(npc, ID.text.RESCUE_DRILL + 7)
        end
    else
        player:showText(npc, ID.text.RESCUE_DRILL + 34)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
