-------------------------------------------------------------------------require
--------------------------------------------------------------------------config
---------------------------------------------------------------------------local


-------------------------------------------------------------------------------- Sets tiles walking speed modifier
for _, v_tile in pairs( data.raw.tile ) do
    if     v_tile.name:find( '-sand-' )   then v_tile.walking_speed_modifier = 0.70
    elseif v_tile.name:find( '-snow-' )   then v_tile.walking_speed_modifier = 0.50
    elseif v_tile.name == 'water-shallow' or v_tile.name == 'water-mud' then
        v_tile.walking_speed_modifier = 0.30
    elseif util.string_starts_with( v_tile.name, 'volcanic-' ) then
        v_tile.walking_speed_modifier = 1
    end
end

--______________________________________________________________________________________________________________________
--############################################################################## VOLCANIC BIOME ########################

-------------------------------------------------------------------------------- Remove orange lava from volcanic tiles

local tile

tile = table.deepcopy( data.raw.tile[ 'volcanic-orange-heat-1' ] )
tile.name = 'volcanic-orange-heat-4'
tile.tint = { r = 180, g = 180, b = 180 }
data.raw.tile[ 'volcanic-orange-heat-4' ] = tile

tile = table.deepcopy( data.raw.tile[ 'volcanic-orange-heat-1' ] )
tile.name = 'volcanic-orange-heat-3'
tile.tint = { r = 200, g = 200, b = 200 }
data.raw.tile[ 'volcanic-orange-heat-3' ] = tile

tile = table.deepcopy( data.raw.tile[ 'volcanic-orange-heat-1' ] )
tile.name = 'volcanic-orange-heat-2'
tile.tint = { r = 215, g = 215, b = 215 }
data.raw.tile[ 'volcanic-orange-heat-2' ] = tile

tile = data.raw.tile[ 'volcanic-orange-heat-1' ]
tile.tint = { r = 235, g = 235, b = 235 }

local decal = data.raw[ 'optimized-decorative' ][ 'lava-decal-orange' ]
decal.autoplace.default_enabled = false


--______________________________________________________________________________________________________________________
--############################################################################## GENERIC DECORATIONS ###################

-------------------------------------------------------------------------------- Volcanic
local color = { r = 255, g = 60, b = 60 }
local decal = data.raw[ 'optimized-decorative' ][ 'puddle-decal' ]
for _, v_pic in ipairs( decal.pictures ) do
    v_pic.tint = color
    v_pic.apply_runtime_tint = true
    if v_pic.hr_v_picersion then
        v_pic.hr_v_picersion.tint = color
        v_pic.hr_v_picersion.apply_runtime_tint = true
    end
end
--------------------------------------------------------------------------------

--______________________________________________________________________________________________________________________
--############################################################################## #######################################