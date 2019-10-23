-------------------------------------------------------------------------require
local util   = require( 'util'  )

require( 'hotkeys' )

require( '#entities/_data'    )
--------------------------------------------------------------------------config
---------------------------------------------------------------------------local



-------------------------------------------------------------------------------- Alien Biomes configure
-- Forced applying Alien Biomes alien-biomes-remove-obsolete-tiles startup setiing.
settings.startup[ 'alien-biomes-remove-obsolete-tiles' ].value = true

-- Alien Biomes does not remove this tile.
data.raw.tile[ 'grass-1' ] = nil

-- Blocking tile-speed-reduction setting.
for _, tile in pairs( data.raw.tile ) do
    if tile.name:find( '-sand-' ) or tile.name:find( '-snow-' ) then
        tile.walking_speed_modifier = 0.8
    elseif util.string_starts_with( tile.name, 'volcanic-' ) then
        tile.walking_speed_modifier = ( 11 - tile.name:sub( -1 ) ) / 10
    end
end

-- Vegetation always enabled.
settings.startup['alien-biomes-disable-vegetation'].value = false

--------------------------------------------------------------------------------