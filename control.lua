local config = require( 'config' )

-------------------------------------------------------------------------------- Daytime ajust

global.checks_count = 0

-- Run check every N tick.
local n_tick = 40

-- Unfreeze daytime every N check.
local unfreeze_period = 3

script.on_nth_tick( n_tick, function( ev )
     if global.checks_count < 2 then
         for _, s in pairs( game.surfaces ) do
             s.freeze_daytime = ( global.checks_count == 1 )
         end
     end
     global.checks_count = global.checks_count + 1
     if global.checks_count > unfreeze_period then
         global.checks_count = 0
     end
end)

--------------------------------------------------------------------------------