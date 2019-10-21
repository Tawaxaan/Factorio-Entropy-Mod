local _forest = {}
-------------------------------------------------------------------------require
local util   = require( 'util'        )
local _math  = require( 'common/math' )
--------------------------------------------------------------------------config
_forest.conf = require( '#terrain/forest/_conf' )
---------------------------------------------------------------------------local

local surface
local chunks_count = 1024

--______________________________________________________________________________________________________________________
--############################################################################## FOREST PROCESSING #####################

--****************************************************************************** Spread one tree
local function tree_process( tree )
    local radius = 10
    local offset = { x = math.random( -radius, radius),
                     y = math.random( -radius, radius) }
    local new_tree_pos = _math.vector_sum( tree.position, offset )
    local tile = surface.get_tile( new_tree_pos )
    --_debug( "    " .. tile.name )

-- Temporary realisation for tree-growth-scaled-trees mod ----------------------
    if util.string_starts_with( tree.name, 'dry-tree'    ) then return end
    if util.string_starts_with( tree.name, 'dead-grey'   ) then return end
    if util.string_starts_with( tree.name, 'dead-tree'   ) then return end
    if util.string_starts_with( tree.name, 'dead-dry'    ) then return end
    if util.string_starts_with( tree.name, 'dry-hairy'   ) then return end
    if util.string_starts_with( tree.name, 'tree-dryland') then return end
    local new_tree_name
    if string.sub( tree.name, string.len(tree.name)-7 ) == '-sapling' then
        new_tree_name = string.gsub( tree.name, '-sapling', '-tiny' )
        new_tree_pos  = tree.position
        tree.destroy()
    elseif string.sub( tree.name, string.len(tree.name)-4 ) == '-tiny' then
        new_tree_name = string.gsub( tree.name, '-tiny', '-large' )
        new_tree_pos  = tree.position
        tree.destroy()
    elseif string.sub( tree.name, string.len(tree.name)-5 ) == '-large' then
        new_tree_name = string.gsub( tree.name, '-large', '' )
        new_tree_pos  = tree.position
        tree.destroy()
    else
        new_tree_name = tree.name .. '-sapling'
        tree.destroy()
    end
--------------------------------------------------------------------------------

    local new_tree = { name = new_tree_name, position = new_tree_pos }
    local can_place = surface.can_place_entity( new_tree )
    if can_place then
        surface.create_entity( new_tree )
    end
end

--****************************************************************************** Process one chunk
local function chunk_process( chunk )
    local area = {{ chunk.x * 32     , chunk.y * 32      },
                  { chunk.x * 32 + 32, chunk.y * 32 + 32 }}
    local trees = surface.find_entities_filtered{ area = area, type = 'tree' }
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
function _forest.process()
    surface = surface or game.surfaces[ 1 ]
    chunk_process( surface.get_random_chunk() )
-- TODO: Add corresponding count of processing chunks with chunks_count
end

--****************************************************************************** Chunks count calculation
function _forest.calc_chunks_count()
    count = 0
    for chunk in surface.get_chunks() do
        count = count + 1
    end
    chunks_count = count
end

--******************************************************************************

--######################################################################################################################

return _forest