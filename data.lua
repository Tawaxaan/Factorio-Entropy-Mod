-------------------------------------------------------------------------require
require( 'hotkeys' )

require( '#entities/_data'    )
--------------------------------------------------------------------------config
---------------------------------------------------------------------------local



-------------------------------------------------------------------------------- Alien Biomes configure
-- Forced applying Alien Biomes alien-biomes-remove-obsolete-tiles startup setiing.
settings.startup[ "alien-biomes-remove-obsolete-tiles" ].value = true

-- Alien Biomes does not remove this tile.
data.raw.tile[ "grass-1" ] = nil

-- Vegetation always enabled.
settings.startup["alien-biomes-disable-vegetation"].value = false

--------------------------------------------------------------------------------