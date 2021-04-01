-----------------------------------
-- Attachment: Auto-repair Kit II
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------
local attachment_object = {}

attachment_object.onEquip = function(pet)
    -- We do not have support to do a fraction of a percent so we rounded
    local frame = pet:getAutomatonFrame()
    if frame == xi.frames.HARLEQUIN then
        pet:addMod(xi.mod.HPP, 10)
    elseif frame == xi.frames.VALOREDGE then
        pet:addMod(xi.mod.HPP, 8)
    elseif frame == xi.frames.SHARPSHOT then
        pet:addMod(xi.mod.HPP, 11)
    elseif frame == xi.frames.STORMWAKER then
        pet:addMod(xi.mod.HPP, 12)
    end
end

attachment_object.onUnequip = function(pet)
    local frame = pet:getAutomatonFrame()
    if frame == xi.frames.HARLEQUIN then
        pet:delMod(xi.mod.HPP, 10)
    elseif frame == xi.frames.VALOREDGE then
        pet:delMod(xi.mod.HPP, 8)
    elseif frame == xi.frames.SHARPSHOT then
        pet:delMod(xi.mod.HPP, 11)
    elseif frame == xi.frames.STORMWAKER then
        pet:delMod(xi.mod.HPP, 12)
    end
end

attachment_object.onManeuverGain = function(pet, maneuvers)
    attachment_object.onUpdate(pet, maneuvers)
end

attachment_object.onManeuverLose = function(pet, maneuvers)
    attachment_object.onUpdate(pet, maneuvers - 1)
end

attachment_object.onUpdate = function(pet, maneuvers)
    local power = 0
    if maneuvers > 0 then
        power = math.floor(3 * maneuvers + (pet:getMaxHP() * (0.6 * maneuvers) / 100))
    end
    updateModPerformance(pet, xi.mod.REGEN, 'autorepair_kit_ii_mod', power)
end

return attachment_object
