-------------------------------------------------------------------------require
require( 'hotkeys' )

require( '#entities/_data'    )
--------------------------------------------------------------------------config
---------------------------------------------------------------------------local


--------------------------------------------------------------------------------  Sets tiles walking speed modifier
for _, tile in pairs( data.raw.tile ) do
    if     tile.name:find( '-sand-' ) then tile.walking_speed_modifier = 0.65
    elseif tile.name:find( '-snow-' ) then tile.walking_speed_modifier = 0.50
    end
    --elseif util.string_starts_with( tile.name, 'volcanic-' ) then
        --tile.walking_speed_modifier = ( 11 - tile.name:sub( -1 ) ) / 10
    --end
end

--------------------------------------------------------------------------------