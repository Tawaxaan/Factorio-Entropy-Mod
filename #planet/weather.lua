local _weather = {}
-------------------------------------------------------------------------require
--------------------------------------------------------------------------config
_weather.cfg = require ( '#planet/weather_cfg' )
---------------------------------------------------------------------------local


--****************************************************************************** Daytime length adjusting
function _weather.set_daytime_length()
    local nauvis = game.surfaces[ 'nauvis' ]
    nauvis.ticks_per_day = PLANET_DAY_LENGTH * 60 * 60
    --[[
    TODO: Balance it
    log(nauvis.dusk) -- 0.25
    log(nauvis.dawn) -- 0.75
    log(nauvis.evening) -- 0.45
    log(nauvis.morning) -- 0.55
    log(nauvis.min_brightness) -- 0.15
    ]]
end

--******************************************************************************

return _weather