-----------------------------------
-- Area: Metalworks
--  NPC: Lorena
-- Type: Blacksmithing Guildworker's Union Representative
-- !pos -104.990 1 30.995 237
-----------------------------------
local ID = require("scripts/zones/Metalworks/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/crafting")
-----------------------------------
local entity = {}

local keyitems = {
    [0] = {
        id = xi.ki.METAL_PURIFICATION,
        rank = 3,
        cost = 40000
    },
    [1] = {
        id = xi.ki.METAL_ENSORCELLMENT,
        rank = 3,
        cost = 40000
    },
    [2] = {
        id = xi.ki.CHAINWORK,
        rank = 3,
        cost = 10000
    },
    [3] = {
        id = xi.ki.SHEETING,
        rank = 3,
        cost = 10000
    },
    [4] = {
        id = xi.ki.WAY_OF_THE_BLACKSMITH,
        rank = 9,
        cost = 20000
    }

}

local items = {
    [0] = {
        id = 15445,
        rank = 3,
        cost = 10000
    },
    [1] = {
        id = 14831,
        rank = 5,
        cost = 70000
    },
    [2] = {
        id = 14393,
        rank = 7,
        cost = 100000
    },
    [3] = {
        id = 153,
        rank = 9,
        cost = 150000
    },
    [4] = {
        id = 334,
        rank = 9,
        cost = 200000
    },
    [5] = {
        id = 15820,
        rank = 6,
        cost = 80000
    },
    [6] = {
        id = 3661,
        rank = 7,
        cost = 50000
    },
    [7] = {
        id = 3324,
        rank = 9,
        cost = 15000
    }
}

entity.onTrade = function(player, npc, trade)
    unionRepresentativeTrade(player, npc, trade, 801, 2)
end

entity.onTrigger = function(player, npc)
    unionRepresentativeTrigger(player, 2, 800, "guild_smithing", keyitems)
end

entity.onEventUpdate = function(player, csid, option, target)
    if (csid == 800) then
        unionRepresentativeTriggerFinish(player, option, target, 2, "guild_smithing", keyitems, items)
    end
end

entity.onEventFinish = function(player, csid, option, target)
    if (csid == 800) then
        unionRepresentativeTriggerFinish(player, option, target, 2, "guild_smithing", keyitems, items)
    elseif (csid == 801) then
        player:messageSpecial(ID.text.GP_OBTAINED, option)
    end
end

return entity
