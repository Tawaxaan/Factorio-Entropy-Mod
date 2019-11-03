local _forest = {}
-------------------------------------------------------------------------require
local util  = require( 'util'        )
local _math = require( 'common/math' )
--------------------------------------------------------------------------config
_forest.cfg = require( '#terrain/forest_cfg' )
---------------------------------------------------------------------------local
local Nauvis
local Chunks_count = 1024

local TREE_GROWTH_STAGES  = _forest.cfg.TREE_GROWTH_STAGES
local TREE_SCALE_SUFFIX   = _forest.cfg.TREE_SCALE_SUFFIX
local TREE_SCALE_SUBGROUP_TREE = _forest.cfg.TREE_SCALE_SUBGROUP_TREE
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
    if tree.prototype.subgroup.name == TREE_SCALE_SUBGROUP_TREE then
        -- Growing tree
        local stage = string.sub( tree.name, string.len( tree.name ) - 1 ) + 1
        local newTree_name
        if stage <= TREE_GROWTH_STAGES then
            newTree_name = string.sub( tree.name, 1, string.len(tree.name) - 2 )
            newTree_name = newTree_name .. ( stage < 10 and 0 or '' ) .. stage
        else
            newTree_name = string.gsub( tree.name, '-' .. TREE_SCALE_SUFFIX .. (stage-1), '' )
        end
        --
        local newTree = { name = newTree_name, position = tree.position }
        tree.destroy()
        local canPlace = Nauvis.can_place_entity( newTree )
        if canPlace then
            Nauvis.create_entity( newTree )
        end
    else
        -- Mature tree
        local offset = { x = math.random( -radius, radius),
                         y = math.random( -radius, radius) }
        local new_tree_pos = _math.vector_sum( tree.position, offset )
-- DEV SECTION -------------
-- DEV SECTION -------------
-- DEV SECTION -------------
        local tile = Nauvis.get_tile( new_tree_pos )
        local split = util.split( tile.name, '-' )
        local tileName1 = split[ 1 ] or ''
        local tileName2 = split[ 2 ] or ''
        local tileName3 = split[ 3 ] or ''
-- DEV SECTION -------------
-- DEV SECTION -------------
-- DEV SECTION -------------
        local newTree_name = tree.name .. '-' .. TREE_SCALE_SUFFIX .. '01'
        --
        local newTree = { name = newTree_name, position = new_tree_pos }
        local canPlace = Nauvis.can_place_entity( newTree )
        if canPlace then
            tree.destroy()
            Nauvis.create_entity( newTree )
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
    if Chunks_count / 1024 >= skiper then
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
    Chunks_count = count
end

--******************************************************************************

--######################################################################################################################

return _forest
