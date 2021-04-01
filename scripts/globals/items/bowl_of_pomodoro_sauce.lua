-----------------------------------
-- ID: 5194
-- Item: Bowl of Pomodoro Sauce
-- Food Effect: 5Min, All Races
-----------------------------------
-- Intelligence 2
-- Mind 2
-- HP Recovered while healing +1
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    local result = 0
    if target:hasStatusEffect(xi.effect.FOOD) or target:hasStatusEffect(xi.effect.FIELD_SUPPORT_FOOD) then
        result = xi.msg.basic.IS_FULL
    end
    return result
end

item_object.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 300, 5194)
end

item_object.onEffectGain = function(target, effect)
    target:addMod(xi.mod.INT, 2)
    target:addMod(xi.mod.MND, 2)
    target:addMod(xi.mod.HPHEAL, 1)
end

item_object.onEffectLose = function(target, effect)
    target:delMod(xi.mod.INT, 2)
    target:delMod(xi.mod.MND, 2)
    target:delMod(xi.mod.HPHEAL, 1)
end

return item_object
