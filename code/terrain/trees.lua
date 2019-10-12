require( "code.common.log" )

local _math = require( "code.common.math"   )


local trees = {}

--______________________________________________________________________________________________________________________
--############################################################################## FOREST SPREADING ######################

local function tree_spread( surface, parentTree, tilesToUpdate )
    local radius = 10
    local pos_newTreeOffset = { x = math.random( -radius, radius),
                                y = math.random( -radius, radius) }
    local pos_newTree = _math.vector_sum( parentTree.position, pos_newTreeOffset)
    local tile = surface.get_tile( pos_newTree )
    --_log( "    " .. tile.name )
    local canPlace = surface.can_place_entity{     name = parentTree.name,
                                               position = pos_newTree}
    if canPlace then
        surface.create_entity{     name = parentTree.name,
                               position = pos_newTree }
    end
end


local function chunk_process( surface, chunk )
    local chunk_area = {{ chunk.x * 32, chunk.y * 32}, {chunk.x * 32 + 32, chunk.y * 32 + 32}}
    local trees = surface.find_entities_filtered{ area = chunk_area, type = "tree" }
    local trees_count = #trees
    --_log( "  Trees count: " .. #trees )
    if trees_count > 0 then
        local tiles_to_update = {}
        for i = 1, 10 do
            local tree_parent = trees[ math.random(1, trees_count) ]
            tree_spread( surface, tree_parent, tiles_to_update )
        end
    end
end


--******************************************************************************
function trees.forest_process()
    local surface = game.surfaces[ 1 ]
    if surface and surface.valid then
        local chunks_count = 0
        for chunk in surface.get_chunks() do
            chunks_count = chunks_count + 1
            --_log( "Chunk #" .. chunks_count )
            chunk_process( surface, chunk )
        end
        --_log( "\nSurfaces count: " .. #game.surfaces )
        --_log( "Chunks count:" .. chunks_count )
    end
end

--******************************************************************************


--######################################################################################################################

return trees