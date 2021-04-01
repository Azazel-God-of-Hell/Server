-----------------------------------
-- ID: 5960
-- Item: Ulbukan Lobster
-- Food Effect: 5 Min, Mithra only
-----------------------------------
-- Dexterity -3
-- Vitality 1
-- Defense +9%
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    local result = 0
    if (target:getRace() ~= xi.race.MITHRA) then
        result = xi.msg.basic.CANNOT_EAT
    end
    if (target:getMod(xi.mod.EAT_RAW_FISH) == 1) then
        result = 0
    end
    if target:hasStatusEffect(xi.effect.FOOD) or target:hasStatusEffect(xi.effect.FIELD_SUPPORT_FOOD) then
        result = xi.msg.basic.IS_FULL
    end
    return result
end

item_object.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 300, 5960)
end

item_object.onEffectGain = function(target, effect)
    target:addMod(xi.mod.DEX, -3)
    target:addMod(xi.mod.VIT, 1)
    target:addMod(xi.mod.DEFP, 9)
end

item_object.onEffectLose = function(target, effect)
    target:delMod(xi.mod.DEX, -3)
    target:delMod(xi.mod.VIT, 1)
    target:delMod(xi.mod.DEFP, 9)
end

return item_object
