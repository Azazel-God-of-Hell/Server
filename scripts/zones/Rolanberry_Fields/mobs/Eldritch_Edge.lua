-----------------------------------
-- Area: Rolanberry Fields
--   NM: Eldritch Edge
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 218)
end

return entity
