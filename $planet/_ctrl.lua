local _planet = {}
-------------------------------------------------------------------------require
--------------------------------------------------------------------------config
_planet.conf = require ( '$planet/_conf' )
---------------------------------------------------------------------------local


--****************************************************************************** Daytime length adjusting
function _planet.set_daytime_length()
    game.surfaces[ 1 ].ticks_per_day = PLANET_DAY_LENGTH * 60 * 60
end

--******************************************************************************

return _planet