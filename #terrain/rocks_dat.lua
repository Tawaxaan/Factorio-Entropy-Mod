-------------------------------------------------------------------------require
--------------------------------------------------------------------------config
---------------------------------------------------------------------------local


--______________________________________________________________________________________________________________________
--############################################################################## ROCKS TINT CORRECTION #################

local tintColors = {}

-- Volcanic
--tintColors[ 'rock-big-volcanic'  ] = { r = 80, g = 80, b = 80 }
--tintColors[ 'rock-huge-volcanic' ] = { r = 80, g = 80, b = 80 }
tintColors[ 'rock-big-black'     ] = { r = 110, g = 100, b = 100 }
tintColors[ 'rock-huge-black'    ] = { r = 110, g = 100, b = 100 }

-------------------------------------------------------------------------------- Applying tint
for rockName, rockColor in pairs( tintColors ) do
    local rock = data.raw[ 'simple-entity' ][ rockName ]
    for _, v_pic in pairs ( rock.pictures ) do
        v_pic.tint = rockColor
        if v_pic.hr_version then
            v_pic.hr_version.tint = rockColor
        end
    end
end

--------------------------------------------------------------------------------

--______________________________________________________________________________________________________________________
--######################################################################################################################