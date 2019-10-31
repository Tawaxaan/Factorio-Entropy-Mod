local _gfx = {}
-------------------------------------------------------------------------require
--------------------------------------------------------------------------config
---------------------------------------------------------------------------local


--______________________________________________________________________________________________________________________
--############################################################################## SPRITES ###############################

--****************************************************************************** Sprite scale
function _gfx.sprite_scale( oldSprite, scale )
    local newSprite = table.deepcopy( oldSprite )
    if oldSprite.shift then
       newSprite.shift = { oldSprite.shift[ 1 ] * scale,
                           oldSprite.shift[ 2 ] * scale }
    end
    newSprite.scale = ( oldSprite.scale or 1 ) * scale
    if oldSprite.hr_version then
        newSprite.hr_version = _gfx.sprite_scale( oldSprite.hr_version, scale )
    end
    return newSprite
end

--******************************************************************************

--######################################################################################################################

return _gfx