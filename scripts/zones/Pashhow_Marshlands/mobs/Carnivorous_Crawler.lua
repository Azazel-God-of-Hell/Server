-----------------------------------
-- Area: Pashhow Marshlands
--  Mob: Carnivorous Crawler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 23, 1, xi.regime.type.FIELDS)
    xi.regime.checkRegime(player, mob, 24, 2, xi.regime.type.FIELDS)
end

return entity
