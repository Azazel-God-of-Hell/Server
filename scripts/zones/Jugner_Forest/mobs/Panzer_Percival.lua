-----------------------------------
-- Area: Jugner Forest
--   NM: Panzer Percival
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 157)
end

return entity
