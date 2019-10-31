-------------------------------------------------------------------------require
local _math = require( 'common/math' )
local _gfx  = require( 'common/gfx'  )
--------------------------------------------------------------------------config
config = require( '#terrain/forest_cfg' )
---------------------------------------------------------------------------local
local TREE_GROWTH_STAGES  = config.TREE_GROWTH_STAGES
local TREE_SCALE_SUFFIX   = config.TREE_SCALE_SUFFIX
local TREE_SCALE_GROUP    = config.TREE_SCALE_GROUP
local TREE_SCALE_SUBGROUP = config.TREE_SCALE_SUBGROUP

local TINY_PARTICLE_SUFFIX = '-tiny'

-------------------------------------------------------------------------------- Create small particles for small trees
local  function scaledAnimationVariations( oldAnimationVariations, scale )
    local newAnimationVariations = {}
    for i, oldAnimation in ipairs( oldAnimationVariations ) do
        newAnimationVariations[ i ] = _gfx.sprite_scale( oldAnimation, scale )
    end
    return newAnimationVariations
end

local function scaledParticle( oldParticle, suffix, scale )
    local newParticle    = table.deepcopy( oldParticle )
    newParticle.name     = oldParticle.name .. suffix
    newParticle.pictures = scaledAnimationVariations( oldParticle.pictures, scale )
    newParticle.shadows  = scaledAnimationVariations( oldParticle.shadows , scale )
    return newParticle
end

data:extend({
    scaledParticle( data.raw[ 'leaf-particle' ][ 'leaf-particle'   ], TINY_PARTICLE_SUFFIX, 0.01 ),
    scaledParticle( data.raw[ 'particle'      ][ 'branch-particle' ], TINY_PARTICLE_SUFFIX, 0.01 ),
})

-------------------------------------------------------------------------------- TEMP
data:extend({
  {
    type = "item-group",
    name = TREE_SCALE_GROUP,
    order = "e",
    inventory_order = "e",
    icon = "__entropy__/graphics/icons/groups/scaled-trees.png",
    icon_size = 64,
  },
  {
    type = "item-subgroup",
    name = TREE_SCALE_SUBGROUP,
    group = TREE_SCALE_GROUP,
    order = "a",
  },
})
-------------------------------------------------------------------------------- Create small trees for all trees
for _, tree in pairs( data.raw.tree ) do
    if tree.group ~= TREE_SCALE_GROUP then
    --if oldTree.name:find("dead") or oldTree.name:find("dry") then
        for i_stage = 1, TREE_GROWTH_STAGES do
            -- Naming and options
            local newTree = table.deepcopy( tree )
            newTree.name = tree.name .. '-' .. TREE_SCALE_SUFFIX
            if i_stage < 10 then
                newTree.name = newTree.name .. '0' .. i_stage
            else
                newTree.name = newTree.name .. i_stage
            end
            newTree.group = TREE_SCALE_GROUP
            newTree.subgroup = TREE_SCALE_SUBGROUP
            newTree.autoplace = nil

    --! tree.max_health = round(tree.max_health * areaScale)
    --tree.collision_box = scaledBox(tree.collision_box, sqrt(areaScale))
    --tree.selection_box = scaledBox(tree.selection_box, sqrt(areaScale))

            -- Calc scale for small tree
            local scale = 0.15 + (i_stage - 1) * 0.80 / TREE_GROWTH_STAGES

            -- Resizing drawing box
            if newTree.drawing_box then
                newTree.drawing_box = _math.box_scale( newTree.drawing_box, scale )
            end

            -- Resizing sprites
            if newTree.pictures then
                local oldPictures = newTree.pictures
                local newPictures = {}
                for i, oldSprite in ipairs( oldPictures ) do
                    newPictures[ i ] = _gfx.sprite_scale( oldSprite, scale )
                end
                newTree.pictures = newPictures
            end

            -- Resize or create particles sprites
            if newTree.variations then
                local newVariations = {}
                for i, oldVariation in ipairs( newTree.variations ) do
                    local newVariation = {}
                    for j, oldPic in pairs( oldVariation ) do
                        if not oldPic.type then
                            newVariation[ j ] = _gfx.sprite_scale( oldPic, scale )
                        elseif oldPic.type == 'create-particle' then
                            ---- CPTEI = CreateParticleTriggerEffectItem
                            local oldCptei = oldPic
                            local newCptei = table.deepcopy( oldCptei )
                            if scale <= 0.4 then
                                newCptei.entity_name = newCptei.entity_name .. TINY_PARTICLE_SUFFIX
                            end
                            local p = { 'initial_height'          ,
                                        'initial_height_deviation',
                                        'initial_vertical_speed'  ,
                                        'speed_from_center'       ,
                                        'speed_from_center_deviation' }
                            for k, v in pairs( p ) do
                                if oldCptei[ k ] then
                                    newCptei[ k ] = v * scale
                                end
                            end
                            newCptei.offset_deviation = _math.box_scale( oldCptei.offset_deviation, scale )
                            newVariation[ j ] = newCptei
                        end
                    end
                    newVariations[i] = newVariation
                end
                newTree.variations = newVariations
            end

            --
            data:extend({ newTree })
        end
    end
end

--------------------------------------------------------------------------------