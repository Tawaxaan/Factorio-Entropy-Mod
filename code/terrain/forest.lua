require( "code.common.log" )
local _math = require( "code.common.math"   )
local _forest = {}
--------------------------------------------------------------------------------
_forest.PROCESS_INTERVAL = 120 -- Processing iteration interval (tick)
--------------------------------------------------------------------------------


--______________________________________________________________________________________________________________________
--############################################################################## FOREST SPREADING ######################

--****************************************************************************** Spread one tree
local function tree_spread( surface, parent_tree )
    local radius = 10
    local offset = { x = math.random( -radius, radius),
                     y = math.random( -radius, radius) }
    local new_tree_pos = _math.vector_sum( parent_tree.position, offset )
    local tile = surface.get_tile( new_tree_pos )
    --_log( "    " .. tile.name )
    local new_tree = { name = parent_tree.name, position = new_tree_pos }
    local canPlace = surface.can_place_entity( new_tree )
    if canPlace then
        surface.create_entity( new_tree )
    end
end

--****************************************************************************** Process one chunk
local function chunk_process( surface, chunk )
    local area = {{ chunk.x * 32     , chunk.y * 32      },
                  { chunk.x * 32 + 32, chunk.y * 32 + 32 }}
    local trees = surface.find_entities_filtered{ area = area, type = "tree" }
    local trees_count = #trees
    --_log( "  Trees count: " .. #trees )
    if trees_count > 0 then
        for i = 1, 10 do
            local tree_parent = trees[ math.random( 1, trees_count ) ]
            tree_spread( surface, tree_parent )
        end
    end
end


--****************************************************************************** Chunks processing iteration
function _forest.process()
    local surface = game.surfaces[ 1 ]
    local chunks_count = 0
    for chunk in surface.get_chunks() do
        chunks_count = chunks_count + 1
        --_log( "Chunk #" .. chunks_count )
        chunk_process( surface, chunk )
    end
    --_log( "\nSurfaces count: " .. #game.surfaces )
    --_log( "Chunks count:" .. chunks_count )
end

--******************************************************************************


--######################################################################################################################

return _forest