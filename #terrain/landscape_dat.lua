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
--############################################################################## WATER #################################

data.raw.tile[ 'deepwater'     ].tint = { r = 255, g = 100, b = 100 }
data.raw.tile[ 'water'         ].tint = { r = 255, g = 120, b = 120 }
data.raw.tile[ 'water-mud'     ].tint = { r = 220, g = 160, b = 170 }
data.raw.tile[ 'water-shallow' ].tint = { r = 190, g = 160, b = 180 }

--______________________________________________________________________________________________________________________
--############################################################################## VOLCANIC BIOME ########################

-------------------------------------------------------------------------------- Remove orange lava from volcanic tiles

data.raw.tile[ 'volcanic-orange-heat-2' ].variants  = data.raw.tile[ 'volcanic-orange-heat-1' ].variants
data.raw.tile[ 'volcanic-orange-heat-3' ].variants  = data.raw.tile[ 'volcanic-orange-heat-1' ].variants
data.raw.tile[ 'volcanic-orange-heat-4' ].variants  = data.raw.tile[ 'volcanic-orange-heat-1' ].variants

data.raw.tile[ 'volcanic-orange-heat-2' ].map_color = data.raw.tile[ 'volcanic-orange-heat-1' ].map_color
data.raw.tile[ 'volcanic-orange-heat-3' ].map_color = data.raw.tile[ 'volcanic-orange-heat-1' ].map_color
data.raw.tile[ 'volcanic-orange-heat-4' ].map_color = data.raw.tile[ 'volcanic-orange-heat-1' ].map_color

data.raw.tile[ 'volcanic-orange-heat-1' ].tint = { r = 235, g = 235, b = 235 }
data.raw.tile[ 'volcanic-orange-heat-2' ].tint = { r = 215, g = 215, b = 215 }
data.raw.tile[ 'volcanic-orange-heat-3' ].tint = { r = 200, g = 200, b = 200 }
data.raw.tile[ 'volcanic-orange-heat-4' ].tint = { r = 180, g = 180, b = 180 }

local decal = data.raw[ 'optimized-decorative' ][ 'lava-decal-orange' ]
decal.autoplace.default_enabled = false

--------------------------------------------------------------------------------

--______________________________________________________________________________________________________________________
--############################################################################## GENERIC DECORATIONS COLOR TINT ########

local tintColors = {}

-- Volcanic land object
tintColors[ 'puddle-decal'    ] = { r = 255, g =  80, b = 100 }
tintColors[ 'dark-mud-decal'  ] = { r = 140, g = 140, b = 180 }
-- Volcanic bush
tintColors[ 'brown-fluff-dry' ] = { r = 180, g = 180, b = 220 }
tintColors[ 'red-desert-bush' ] = { r = 180, g = 160, b = 200 }
-- Volcanic rocks
tintColors[ 'rock-tiny-black'   ] = { r = 110, g = 100, b = 100 }
tintColors[ 'rock-small-black'  ] = { r = 110, g = 100, b = 100 }
tintColors[ 'rock-medium-black' ] = { r = 110, g = 100, b = 100 }
--tintColors[ 'rock-tiny-volcanic'   ] = { r = 100, g = 90, b = 90 }
--tintColors[ 'rock-small-volcanic'  ] = { r = 100, g = 90, b = 90 }
--tintColors[ 'rock-medium-volcanic' ] = { r = 100, g = 90, b = 90 }


-------------------------------------------------------------------------------- Applying tint
for decName, decColor in pairs( tintColors ) do
    local decal = data.raw[ 'optimized-decorative' ][ decName ]
    for _, v_pic in pairs( decal.pictures ) do
        v_pic.tint = decColor
        if v_pic.hr_version then
            v_pic.hr_version.tint = decColor
        end
    end
end

--------------------------------------------------------------------------------

--______________________________________________________________________________________________________________________
--############################################################################## #######################################