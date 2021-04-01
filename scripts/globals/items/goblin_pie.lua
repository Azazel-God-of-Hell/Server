-----------------------------------
-- ID: 4539
-- Item: goblin_pie
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health 12
-- Magic 12
-- Dexterity -1
-- Agility 3
-- Vitality -1
-- Charisma -5
-- Defense % 9 (cap 100)
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
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 1800, 4539)
end

item_object.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 12)
    target:addMod(xi.mod.MP, 12)
    target:addMod(xi.mod.DEX, -1)
    target:addMod(xi.mod.AGI, 3)
    target:addMod(xi.mod.VIT, -1)
    target:addMod(xi.mod.CHR, -5)
    target:addMod(xi.mod.FOOD_DEFP, 9)
    target:addMod(xi.mod.FOOD_DEF_CAP, 100)
end

item_object.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 12)
    target:delMod(xi.mod.MP, 12)
    target:delMod(xi.mod.DEX, -1)
    target:delMod(xi.mod.AGI, 3)
    target:delMod(xi.mod.VIT, -1)
    target:delMod(xi.mod.CHR, -5)
    target:delMod(xi.mod.FOOD_DEFP, 9)
    target:delMod(xi.mod.FOOD_DEF_CAP, 100)
end

return item_object
