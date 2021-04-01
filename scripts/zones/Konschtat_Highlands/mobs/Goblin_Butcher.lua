-----------------------------------
-- Area: Konschtat Highlands
--  Mob: Goblin Butcher
-----------------------------------
require("scripts/globals/regimes")
require("scripts/quests/tutorial")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 84, 3, xi.regime.type.FIELDS)
    xi.tutorial.onMobDeath(player)
end

return entity
