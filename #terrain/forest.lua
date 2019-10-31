local _forest = {}
-------------------------------------------------------------------------require
local util  = require( 'util'        )
local _math = require( 'common/math' )
--------------------------------------------------------------------------config
_forest.cfg = require( '#terrain/forest_cfg' )
---------------------------------------------------------------------------local
local AlienBiome_TreeData = require( '#terrain/forest_alien_biomes' )

local Nauvis
local ChunksCount = 1024

local TREE_GROWTH_STAGES  = _forest.cfg.TREE_GROWTH_STAGES
local TREE_SCALE_SUFFIX   = _forest.cfg.TREE_SCALE_SUFFIX
local TREE_SCALE_GROUP    = _forest.cfg.TREE_SCALE_GROUP
local TREE_SCALE_SUBGROUP = _forest.cfg.TREE_SCALE_SUBGROUP
--______________________________________________________________________________________________________________________
--############################################################################## FOREST PROCESSING #####################

--****************************************************************************** Spread one tree
local function tree_process( tree )
    local radius = 10

    if util.string_starts_with( tree.name, 'dry-tree'    ) then return end
    if util.string_starts_with( tree.name, 'dead-grey'   ) then return end
    if util.string_starts_with( tree.name, 'dead-tree'   ) then return end
    if util.string_starts_with( tree.name, 'dead-dry'    ) then return end
    if util.string_starts_with( tree.name, 'dry-hairy'   ) then return end
    if util.string_starts_with( tree.name, 'tree-dryland') then return end

-- Temporary realisation -------------------------------------------------------
    --log( tree.prototype.subgroup.name )
    if tree.prototype.subgroup.name == TREE_SCALE_SUBGROUP then
        -- Growing tree
        local stage = string.sub( tree.name, string.len( tree.name ) - 1 ) + 1
        -- local new_tree_name
        if stage <= TREE_GROWTH_STAGES then
            new_tree_name = string.sub( tree.name, 1, string.len(tree.name) - 2 )
            if stage < 10 then
                new_tree_name = new_tree_name .. '0' .. stage
            else
                new_tree_name = new_tree_name .. stage
            end
            --log( tree.name .. ' +1 = ' .. stage .. ' !'..new_tree_name)
        else
            new_tree_name = string.gsub( tree.name, '-' .. TREE_SCALE_SUFFIX .. (stage-1), '' )
            --log( tree.name .. ' > ' .. new_tree_name )
        end
        --
        local new_tree = { name = new_tree_name, position = tree.position }
        tree.destroy()
        local can_place = Nauvis.can_place_entity( new_tree )
        if can_place then
            Nauvis.create_entity( new_tree )
        end
    else
        -- Mature tree
        local offset = { x = math.random( -radius, radius),
                         y = math.random( -radius, radius) }
        local new_tree_pos = _math.vector_sum( tree.position, offset )
-- DEV SECTION -------------
-- DEV SECTION -------------
-- DEV SECTION -------------
        local split = util.split( tree.name, '-' )
        local tileName1 = split[ 1 ] or ''
        local tileName2 = split[ 2 ] or ''
        local tileName3 = split[ 3 ] or ''
-- DEV SECTION -------------
-- DEV SECTION -------------
-- DEV SECTION -------------
        local new_tree_name = tree.name --.. '-' .. TREE_SCALE_SUFFIX .. '01'
        --
        local new_tree = { name = new_tree_name, position = new_tree_pos }
        local can_place = Nauvis.can_place_entity( new_tree )
        if can_place then
            tree.destroy()
            Nauvis.create_entity( new_tree )
        end
    end
--------------------------------------------------------------------------------
end

--****************************************************************************** Process one chunk
local function chunk_process( chunk )
    local area = {{ chunk.x * 32     , chunk.y * 32      },
                  { chunk.x * 32 + 32, chunk.y * 32 + 32 }}
    local trees = Nauvis.find_entities_filtered{ area = area, type = 'tree' }
    local trees_count = #trees
    if trees_count > 0 then
        local from = math.random( 1, 8 )
        for i = from, trees_count, 8 do
            tree_process( trees[ i ] )
        end
    end
end

--******************************************************************************

--______________________________________________________________________________________________________________________
--############################################################################## EVENTS FUNCTIONS ######################

--****************************************************************************** Chunks processing iteration
local skiper = 0
function _forest.process()
    Nauvis = Nauvis or game.surfaces[ 'nauvis' ]
    --skiper = skiper + 1
    if ChunksCount / 1024 >= skiper then
        chunk_process( Nauvis.get_random_chunk() )
    end
    if skiper == 10 then skiper = 0 end
end

--****************************************************************************** Chunks count calculation
function _forest.calc_chunks_count()
    local test = Nauvis.get_chunks()
    count = 0
    for chunk in Nauvis.get_chunks() do
        count = count + 1
    end
    if count < 1024 then count = 1024 end
    ChunksCount = count
end

--******************************************************************************

--######################################################################################################################

return _forest
