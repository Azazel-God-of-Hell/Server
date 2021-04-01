-----------------------------------
-- ID: 14515
-- Item: Hydra Doublet
-- Item Effect: gives refresh
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    return 0
end

item_object.onItemUse = function(target)
    if (target:hasStatusEffect(xi.effect.REFRESH)) then
        target:messageBasic(xi.msg.basic.NO_EFFECT)
    else
        target:addStatusEffect(xi.effect.REFRESH, 4, 3, 180)
    end
end

return item_object
