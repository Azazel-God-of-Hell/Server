-----------------------------------
-- Ability: Soul Voice
-- Enhances the effects of your songs.
-- Obtained: Bard Level 1
-- Recast Time: 1:00:00
-- Duration: 0:03:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

ability_object.onUseAbility = function(player, target, ability)
    player:addStatusEffect(xi.effect.SOUL_VOICE, 1, 0, 180)
end

return ability_object
