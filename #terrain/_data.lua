-------------------------------------------------------------------------require
require( '#terrain/forest_dat'    )
require( '#terrain/rocks_dat'     )
require( '#terrain/landscape_dat' )
--------------------------------------------------------------------------config
---------------------------------------------------------------------------local

-- Remove vanila world map generation presets ----------------------------------

data.raw[ 'map-gen-presets' ][ 'default' ][ 'rich-resources'        ] = nil
data.raw[ 'map-gen-presets' ][ 'default' ][ 'marathon'              ] = nil
data.raw[ 'map-gen-presets' ][ 'default' ][ 'death-world'           ] = nil
data.raw[ 'map-gen-presets' ][ 'default' ][ 'death-world-marathon'  ] = nil
data.raw[ 'map-gen-presets' ][ 'default' ][ 'rail-world'            ] = nil
data.raw[ 'map-gen-presets' ][ 'default' ][ 'ribbon-world'          ] = nil
data.raw[ 'map-gen-presets' ][ 'default' ][ 'island'                ] = nil

-- -----------------------------------------------------------------------------