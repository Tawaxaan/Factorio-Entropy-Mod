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
settings.startup[ 'alien-biomes-include-dirt-aubergine'   ].value = false
settings.startup[ 'alien-biomes-include-dirt-beige'       ].value = false
settings.startup[ 'alien-biomes-include-dirt-black'       ].value = false
settings.startup[ 'alien-biomes-include-dirt-brown'       ].value = false
settings.startup[ 'alien-biomes-include-dirt-cream'       ].value = false
settings.startup[ 'alien-biomes-include-dirt-dustyrose'   ].value = false
settings.startup[ 'alien-biomes-include-dirt-grey'        ].value = false
settings.startup[ 'alien-biomes-include-dirt-purple'      ].value = false
settings.startup[ 'alien-biomes-include-dirt-red'         ].value = false
settings.startup[ 'alien-biomes-include-dirt-tan'         ].value = false
settings.startup[ 'alien-biomes-include-dirt-violet'      ].value = false
settings.startup[ 'alien-biomes-include-dirt-white'       ].value = false
settings.startup[ 'alien-biomes-include-frozen'           ].value = false
settings.startup[ 'alien-biomes-include-grass-blue'       ].value = false
settings.startup[ 'alien-biomes-include-grass-green'      ].value = false
settings.startup[ 'alien-biomes-include-grass-mauve'      ].value = false
settings.startup[ 'alien-biomes-include-grass-olive'      ].value = false
settings.startup[ 'alien-biomes-include-grass-orange'     ].value = false
settings.startup[ 'alien-biomes-include-grass-purple'     ].value = false
settings.startup[ 'alien-biomes-include-grass-red'        ].value = false
settings.startup[ 'alien-biomes-include-grass-turquoise'  ].value = false
settings.startup[ 'alien-biomes-include-grass-violet'     ].value = false
settings.startup[ 'alien-biomes-include-grass-yellow'     ].value = false
settings.startup[ 'alien-biomes-include-sand-aubergine'   ].value = false
settings.startup[ 'alien-biomes-include-sand-beige'       ].value = false
settings.startup[ 'alien-biomes-include-sand-black'       ].value = false
settings.startup[ 'alien-biomes-include-sand-brown'       ].value = false
settings.startup[ 'alien-biomes-include-sand-cream'       ].value = false
settings.startup[ 'alien-biomes-include-sand-dustyrose'   ].value = false
settings.startup[ 'alien-biomes-include-sand-grey'        ].value = false
settings.startup[ 'alien-biomes-include-sand-purple'      ].value = false
settings.startup[ 'alien-biomes-include-sand-red'         ].value = false
settings.startup[ 'alien-biomes-include-sand-tan'         ].value = false
settings.startup[ 'alien-biomes-include-sand-violet'      ].value = false
settings.startup[ 'alien-biomes-include-sand-white'       ].value = false
settings.startup[ 'alien-biomes-include-volcanic-blue'    ].value = false
settings.startup[ 'alien-biomes-include-volcanic-green'   ].value = false
settings.startup[ 'alien-biomes-include-volcanic-orange'  ].value = true
settings.startup[ 'alien-biomes-include-volcanic-purple'  ].value = false
settings.startup[ 'alien-biomes-include-inland-shallows'  ].value = true
settings.startup[ 'alien-biomes-include-coastal-shallows' ].value = true

--------------------------------------------------------------------------------