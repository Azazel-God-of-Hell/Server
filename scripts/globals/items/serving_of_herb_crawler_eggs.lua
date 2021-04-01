-----------------------------------
-- ID: 4552
-- Item: serving_of_herb_crawler_eggs
-- Food Effect: 180Min, All Races
-----------------------------------
-- Health % 6
-- Health Cap 80
-- Magic 10
-- Agility 3
-- Vitality -1
-- Evasion 8
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
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 10800, 4552)
end

item_object.onEffectGain = function(target, effect)
    target:addMod(xi.mod.FOOD_HPP, 6)
    target:addMod(xi.mod.FOOD_HP_CAP, 80)
    target:addMod(xi.mod.MP, 10)
    target:addMod(xi.mod.AGI, 3)
    target:addMod(xi.mod.VIT, -1)
    target:addMod(xi.mod.EVA, 8)
end

item_object.onEffectLose = function(target, effect)
    target:delMod(xi.mod.FOOD_HPP, 6)
    target:delMod(xi.mod.FOOD_HP_CAP, 80)
    target:delMod(xi.mod.MP, 10)
    target:delMod(xi.mod.AGI, 3)
    target:delMod(xi.mod.VIT, -1)
    target:delMod(xi.mod.EVA, 8)
end

return item_object
