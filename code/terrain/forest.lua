local util = require('util')

require( "code.common.log" )
local _math = require( "code.common.math"   )
local _forest = {}
--------------------------------------------------------------------------------
_forest.PROCESS_INTERVAL = 1 -- Processing iteration interval (tick)
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

-- Temporary realisation for tree-growth-scaled-trees mod ----------------------
    if util.string_starts_with( parent_tree.name, "dry-tree") then return end
    if util.string_starts_with( parent_tree.name, "dead-grey") then return end
    if util.string_starts_with( parent_tree.name, "dead-tree") then return end
    if util.string_starts_with( parent_tree.name, "dead-dry") then return end
    if util.string_starts_with( parent_tree.name, "dry-hairy") then return end
    if util.string_starts_with( parent_tree.name, "tree-dryland") then return end
    local new_tree_name
    if string.sub( parent_tree.name, string.len(parent_tree.name)-7 ) == "-sapling" then
        new_tree_name = string.gsub( parent_tree.name, "-sapling", "-tiny" )
        new_tree_pos  = parent_tree.position
        parent_tree.destroy()
    elseif string.sub( parent_tree.name, string.len(parent_tree.name)-4 ) == "-tiny" then
        new_tree_name = string.gsub( parent_tree.name, "-tiny", "-large" )
        new_tree_pos  = parent_tree.position
        parent_tree.destroy()
    elseif string.sub( parent_tree.name, string.len(parent_tree.name)-5 ) == "-large" then
        new_tree_name = string.gsub( parent_tree.name, "-large", "" )
        new_tree_pos  = parent_tree.position
        parent_tree.destroy()
    else
        new_tree_name = parent_tree.name .. "-sapling"
    end
--------------------------------------------------------------------------------

    --if util.string_starts_with( parent_tree.name, "young" ) then
    --    return
    --end
    -- local new_tree_name = "young" .. parent_tree.name .. "-s1"
    local new_tree = { name = new_tree_name, position = new_tree_pos }
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
        --for i = 1, 10 do
            local parent_tree = trees[ math.random( 1, trees_count ) ]
            tree_spread( surface, parent_tree )
        --end
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