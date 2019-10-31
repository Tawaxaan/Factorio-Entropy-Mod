-------------------------------------------------------------------------require
local util   = require( 'util'  )
--------------------------------------------------------------------------config
---------------------------------------------------------------------------local


-------------------------------------------------------------------------------- Alien Biomes configure
-- Forced applying Alien Biomes alien-biomes-remove-obsolete-tiles startup setiing.
settings.startup[ 'alien-biomes-remove-obsolete-tiles' ].value = true

-- Alien Biomes does not remove this tile.
data.raw.tile[ 'grass-1' ] = nil

-- Blocking tile-speed-reduction setting.
settings.startup[ 'tile-speed-reduction' ].value = 100

-- Vegetation always enabled.
settings.startup[ 'alien-biomes-disable-vegetation' ].value = false

-- Includes
settings.startup[ 'alien-biomes-include-dirt-aubergine'   ].value = true
settings.startup[ 'alien-biomes-include-dirt-beige'       ].value = true
settings.startup[ 'alien-biomes-include-dirt-black'       ].value = true
settings.startup[ 'alien-biomes-include-dirt-brown'       ].value = true
settings.startup[ 'alien-biomes-include-dirt-cream'       ].value = true
settings.startup[ 'alien-biomes-include-dirt-dustyrose'   ].value = true
settings.startup[ 'alien-biomes-include-dirt-grey'        ].value = true
settings.startup[ 'alien-biomes-include-dirt-purple'      ].value = true
settings.startup[ 'alien-biomes-include-dirt-red'         ].value = true
settings.startup[ 'alien-biomes-include-dirt-tan'         ].value = true
settings.startup[ 'alien-biomes-include-dirt-violet'      ].value = true
settings.startup[ 'alien-biomes-include-dirt-white'       ].value = true
settings.startup[ 'alien-biomes-include-frozen'           ].value = true
settings.startup[ 'alien-biomes-include-grass-blue'       ].value = true
settings.startup[ 'alien-biomes-include-grass-green'      ].value = true
settings.startup[ 'alien-biomes-include-grass-mauve'      ].value = true
settings.startup[ 'alien-biomes-include-grass-olive'      ].value = true
settings.startup[ 'alien-biomes-include-grass-orange'     ].value = true
settings.startup[ 'alien-biomes-include-grass-purple'     ].value = true
settings.startup[ 'alien-biomes-include-grass-red'        ].value = true
settings.startup[ 'alien-biomes-include-grass-turquoise'  ].value = true
settings.startup[ 'alien-biomes-include-grass-violet'     ].value = true
settings.startup[ 'alien-biomes-include-grass-yellow'     ].value = true
settings.startup[ 'alien-biomes-include-sand-aubergine'   ].value = true
settings.startup[ 'alien-biomes-include-sand-beige'       ].value = true
settings.startup[ 'alien-biomes-include-sand-black'       ].value = true
settings.startup[ 'alien-biomes-include-sand-brown'       ].value = true
settings.startup[ 'alien-biomes-include-sand-cream'       ].value = true
settings.startup[ 'alien-biomes-include-sand-dustyrose'   ].value = true
settings.startup[ 'alien-biomes-include-sand-grey'        ].value = true
settings.startup[ 'alien-biomes-include-sand-purple'      ].value = true
settings.startup[ 'alien-biomes-include-sand-red'         ].value = true
settings.startup[ 'alien-biomes-include-sand-tan'         ].value = true
settings.startup[ 'alien-biomes-include-sand-violet'      ].value = true
settings.startup[ 'alien-biomes-include-sand-white'       ].value = true
settings.startup[ 'alien-biomes-include-volcanic-blue'    ].value = true
settings.startup[ 'alien-biomes-include-volcanic-green'   ].value = true
settings.startup[ 'alien-biomes-include-volcanic-orange'  ].value = true
settings.startup[ 'alien-biomes-include-volcanic-purple'  ].value = true
settings.startup[ 'alien-biomes-include-inland-shallows'  ].value = true
settings.startup[ 'alien-biomes-include-coastal-shallows' ].value = true

--------------------------------------------------------------------------------