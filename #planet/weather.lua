local _weather = {}
-------------------------------------------------------------------------require
--------------------------------------------------------------------------config
_weather.cfg = require ( '#planet/weather_cfg' )
---------------------------------------------------------------------------local


--****************************************************************************** Daytime length adjusting
function _weather.set_daytime_length()
    local surface = game.surfaces[ 'nauvis' ]
    surface.ticks_per_day = PLANET_DAY_LENGTH * 60 * 60
    --[[
    TODO: Balance it
    log(surface.dusk) -- 0.25
    log(surface.dawn) -- 0.75
    log(surface.evening) -- 0.45
    log(surface.morning) -- 0.55
    log(surface.min_brightness) -- 0.15
    ]]
end

--******************************************************************************

return _weather