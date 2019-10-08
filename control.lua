local settings = require( 'settings' )

-------------------------------------------------------------------------------- Daytime ajust

-- Length of day (in real minutes).
local day_length = 20

script.on_init( function()
    game.surfaces[ 1 ].ticks_per_day = day_length * 60 * 60
end)

--------------------------------------------------------------------------------