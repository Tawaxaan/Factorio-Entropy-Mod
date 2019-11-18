-------------------------------------------------------------------------require
local _math = require( 'common/math' )
local _gfx  = require( 'common/gfx'  )
--------------------------------------------------------------------------config
config = require( '#terrain/forest_cfg' )
---------------------------------------------------------------------------local


--______________________________________________________________________________________________________________________
--############################################################################## TREES TINT CORRECTION #################

local tintColors = {}

-- Volcanic
tintColors[ 'tree-volcanic-a' ] = {}
tintColors[ 'tree-volcanic-a' ].leaves = { r = 200, g = 200, b = 255 }
tintColors[ 'tree-volcanic-a' ].trunk  = { r = 100, g = 120, b = 120 }

-------------------------------------------------------------------------------- Applying tint
for treeName, treesColor in pairs( tintColors ) do
    local tree = data.raw.tree[ treeName ]
    for _, v_var in pairs ( tree.variations ) do
        local leavesColor = tintColors[ treeName ].leaves
        v_var.leaves.tint = leavesColor
        if v_var.leaves.hr_version then
            v_var.leaves.hr_version.tint = leavesColor
        end
        local trunkColor = tintColors[ treeName ].trunk
        v_var.trunk.tint = trunkColor
        if v_var.trunk.hr_version then
           v_var.trunk.hr_version.tint = trunkColor
        end
    end
end

--------------------------------------------------------------------------------

--______________________________________________________________________________________________________________________
--############################################################################## SCALED TREES GENERATION ###############

local TREE_GROWTH_STAGES         = config.TREE_GROWTH_STAGES
local TREE_SCALE_SUFFIX          = config.TREE_SCALE_SUFFIX
local TREE_SCALE_GROUP           = config.TREE_SCALE_GROUP
local TREE_SCALE_SUBGROUP_TREE   = config.TREE_SCALE_SUBGROUP_TREE
local TREE_SCALE_SUBGROUP_STUMP  = config.TREE_SCALE_SUBGROUP_STUMP

local TINY_PARTICLE_SUFFIX       = '-tiny'

data:extend({
    {
        type  = "item-group",
        name  = TREE_SCALE_GROUP,
        order = "e",
        icon  = "__entropy__/graphics/icons/groups/scaled-trees.png",
        icon_size = 64,
    },
    {
        type  = "item-subgroup",
        name  = TREE_SCALE_SUBGROUP_TREE,
        group = TREE_SCALE_GROUP,
        order = "a",
    },
    {
        type  = "item-subgroup",
        name  = TREE_SCALE_SUBGROUP_STUMP,
        group = TREE_SCALE_GROUP,
        order = "b",
    },
})

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

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
data:extend({
    scaledParticle( data.raw[ 'leaf-particle' ][ 'leaf-particle'   ], TINY_PARTICLE_SUFFIX, 0.2 ),
    scaledParticle( data.raw[ 'particle'      ][ 'branch-particle' ], TINY_PARTICLE_SUFFIX, 0.2 ),
    scaledParticle( data.raw[ 'particle'      ][ 'wooden-particle' ], TINY_PARTICLE_SUFFIX, 0.5 ),
})

-------------------------------------------------------------------------------- Create small stumps for small trees
for _, v_corpse in pairs( data.raw.corpse ) do
    local skip = not util.string_starts_with( v_corpse.name, 'tree' )
                 or v_corpse.group == TREE_SCALE_GROUP
    if not skip then
        for i_size = 1, TREE_GROWTH_STAGES / 4 do
            local newStump = table.deepcopy( v_corpse )
            newStump.name  = v_corpse.name .. '-' .. TREE_SCALE_SUFFIX .. i_size
            newStump.group = TREE_SCALE_GROUP
            newStump.subgroup = TREE_SCALE_SUBGROUP_STUMP
            newStump.autoplace = nil
            local scale = 0.1 + (i_size - 1) * 0.80 / ( TREE_GROWTH_STAGES / 4 )

            local oldAnims = newStump.animation
            local newAnims = {}

            for k, v_oldAnim in pairs( oldAnims ) do
                local newAnim = _gfx.sprite_scale( v_oldAnim, scale )
                newStump.animation[ k ] = newAnim
            end

            --for _, v_anim in pairs( newStump.animation ) do
                --v_anim = _gfx.sprite_scale( v_anim, scale )
            --end
            data:extend({ newStump })
        end
    end
end

-------------------------------------------------------------------------------- Create small trees for all trees
function CreateSmallTree( parrentTree, stage )
    local newTree = table.deepcopy( parrentTree )

    -- Naming and options
    local suffix  = TREE_SCALE_SUFFIX .. ( stage < 10 and 0 or '' ) .. stage
    newTree.name  = parrentTree.name .. '-' .. suffix
    newTree.group = TREE_SCALE_GROUP
    newTree.subgroup = TREE_SCALE_SUBGROUP_TREE
    newTree.autoplace = nil

    -- Calc scale for small tree
    local scale = 0.15 + (stage - 1) * 0.80 / TREE_GROWTH_STAGES

    -- Max health
    newTree.max_health = parrentTree.max_health * scale

    -- Mining
    newTree.minable.count = parrentTree.minable.count * scale
    if scale <= 0.6 then
        newTree.minable.mining_particle = "wooden-particle" .. TINY_PARTICLE_SUFFIX
    end

    -- Corpse (stump)
    if newTree.remains_when_mined then
        local suffix  = TREE_SCALE_SUFFIX .. math.floor( ( stage + 3 ) / 4 )
        newTree.remains_when_mined = parrentTree.remains_when_mined .. '-' .. suffix
    end

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
                    if scale <= 0.6 then
                        newCptei.entity_name = newCptei.entity_name .. TINY_PARTICLE_SUFFIX
                    end
                    newCptei[ 'initial_height' ] = newCptei[ 'initial_height' ] * scale
                    newCptei.offset_deviation    = _math.box_scale( oldCptei.offset_deviation, scale )
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

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
for _, v_tree in pairs( data.raw.tree ) do
    if v_tree.group ~= TREE_SCALE_GROUP then
        for i_stage = 1, TREE_GROWTH_STAGES do
            CreateSmallTree( v_tree, i_stage )
        end
    end
end

--------------------------------------------------------------------------------

--______________________________________________________________________________________________________________________
--######################################################################################################################