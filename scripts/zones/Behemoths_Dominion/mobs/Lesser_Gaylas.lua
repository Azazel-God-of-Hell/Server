-----------------------------------
-- Area: Behemoths Dominion
--  Mob: Lesser Gaylas
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 101, 1, xi.regime.type.FIELDS)
    xi.regime.checkRegime(player, mob, 102, 1, xi.regime.type.FIELDS)
end

return entity
