-----------------------------------
-- Area: Metalworks
--  NPC: Patt-Pott
-- Type: Consulate Representative
-- !pos 23 -17 42 237
-----------------------------------
local ID = require("scripts/zones/Metalworks/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)

    if (player:getCurrentMission(WINDURST) == xi.mission.id.windurst.THE_THREE_KINGDOMS_BASTOK and player:getCharVar("MissionStatus") == 5) then
        if (trade:hasItemQty(599, 1) and trade:getItemCount() == 1) then -- Trade Mythril Sand
            player:startEvent(255)
        end
    end

end

entity.onTrigger = function(player, npc)

    currentMission = player:getCurrentMission(WINDURST)
    MissionStatus = player:getCharVar("MissionStatus")

    if (currentMission == xi.mission.id.windurst.THE_THREE_KINGDOMS) then
        if (MissionStatus == 1) then
            player:startEvent(254)
        elseif (MissionStatus == 6) then
            player:startEvent(256)
        elseif (MissionStatus == 7) then
            player:startEvent(258)
        elseif (MissionStatus == 11) then
            player:startEvent(259)
        end
    elseif (currentMission == xi.mission.id.windurst.THE_THREE_KINGDOMS_BASTOK2) then
        if (MissionStatus == 11) then
            player:startEvent(257)
        else
            player:startEvent(258)
        end
    else
        player:startEvent(250)
    end

end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if (csid == 254) then
        player:addMission(xi.mission.log_id.WINDURST, xi.mission.id.windurst.THE_THREE_KINGDOMS_BASTOK)
        player:delKeyItem(xi.ki.LETTER_TO_THE_CONSULS_WINDURST)
        player:setCharVar("MissionStatus", 3)
    elseif (csid == 256) then
        player:addMission(xi.mission.log_id.WINDURST, xi.mission.id.windurst.THE_THREE_KINGDOMS_BASTOK2)
        player:setCharVar("MissionStatus", 8)
    elseif (csid == 257) then
        player:addMission(xi.mission.log_id.WINDURST, xi.mission.id.windurst.THE_THREE_KINGDOMS)
        player:delKeyItem(xi.ki.KINDRED_CREST)
        player:addKeyItem(xi.ki.KINDRED_REPORT)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.KINDRED_REPORT)
    elseif (csid == 255) then
        player:tradeComplete()
        player:setCharVar("MissionStatus", 7)
        player:addMission(xi.mission.log_id.WINDURST, xi.mission.id.windurst.THE_THREE_KINGDOMS)
    end

end

return entity
