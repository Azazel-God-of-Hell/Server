-----------------------------------
-- Area: Caedarva Mire
--   NM: Vidhuwa the Wrathborn
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 471)
end

return entity
