-----------------------------------
-- Area: Rolanberry Fields [S]
--   NM: Delicieuse Delphine
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 513)
end

return entity
