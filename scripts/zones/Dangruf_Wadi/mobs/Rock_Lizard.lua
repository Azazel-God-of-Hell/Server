-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Rock Lizard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 639, 2, xi.regime.type.GROUNDS)
end

return entity
