-------------------------------------------------------------------------require
local util  = require( 'util'  )
--------------------------------------------------------------------------config
---------------------------------------------------------------------------local

--______________________________________________________________________________________________________________________
--############################################################################## MODS SETTINGS OVERRIDES ###############

-------------------------------------------------------------------------------- Alien Biomes
-- Forced applying alien-biomes-remove-obsolete-tiles startup setiing
settings.startup[ 'alien-biomes-remove-obsolete-tiles' ].value = true

-- Alien Biomes does not remove this tile
data.raw.tile[ 'grass-1' ] = nil

-- Blocking tile-speed-reduction setting
settings.startup[ 'tile-speed-reduction' ].value = 100

-- Vegetation always enabled
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

--______________________________________________________________________________________________________________________
--############################################################################## WIPE THIS WORLD ### HO-HO-HO ##########

local ignoredTechnologies = {
    'construction-robotics', 'personal-roboport-equipment', 'exoskeleton-equipment', 'character-logistic-slots-1',
    'fluid-handling', 'oil-processing', 'railway', 'automated-rail-transportation', 'rail-signals',
    --[[ Exception for Time-Tool mod ]] 'circuit-network'
}

local ignoredRecipies = {
    'rail', 'locomotive', 'cargo-wagon', 'train-stop', 'rail-signal', 'rail-chain-signal',
    'roboport', 'logistic-chest-passive-provider', 'logistic-chest-storage', 'construction-robot',
    'exoskeleton-equipment', 'personal-roboport-equipment',
    'storage-tank', 'pump', 'empty-barrel',
    'pumpjack', 'oil-refinery', 'chemical-plant', 'basic-oil-processing', 'solid-fuel-from-petroleum-gas',
    'advanced-oil-processing', 'sulfuric-acid', 'coal-liquefaction', 'heavy-oil-cracking', 'light-oil-cracking',
    'solid-fuel-from-light-oil', 'solid-fuel-from-heavy-oil', 'lubricant',
    'iron-plate', 'copper-plate', 'steel-plate', 'stone-brick', 'sulfur', 'plastic-bar',
    'copper-cable', 'iron-stick', 'iron-gear-wheel', 'electronic-circuit', 'advanced-circuit',
    'processing-unit', 'engine-unit', 'electric-engine-unit',
    'uranium-processing', 'uranium-fuel-cell', 'kovarex-enrichment-process',
    'explosives', 'battery', 'flying-robot-frame', 'low-density-structure',
    'rocket-part', 'rocket-fuel', 'rocket-control-unit',
    'automation-science-pack', 'logistic-science-pack', 'chemical-science-pack', 'military-science-pack',
    'production-science-pack', 'utility-science-pack',
    --[[ Exception for Time-Tool mod ]] 'red-wire', 'green-wire', 'arithmetic-combinator', 'decider-combinator',
    --[[ Exception for Time-Tool mod ]] 'constant-combinator', 'power-switch', 'programmable-speaker'
}

local ignoredItems = {
    'transport-belt', 'fast-transport-belt', 'express-transport-belt',
    'underground-belt', 'fast-underground-belt', 'express-underground-belt',
    'splitter', 'fast-splitter', 'express-splitter',
    'inserter', 'fast-inserter', 'stack-inserter',
    'assembling-machine-1', 'assembling-machine-2', 'assembling-machine-3',
    'steel-furnace', 'stone-furnace',
}

local itemTypesToHide = { 'item', 'ammo', 'armor', 'gun', 'inserter', 'repair-tool' }

-------------------------------------------------------------------------------- Hide items by types

local skipList = {}
for _, v in pairs( ignoredItems ) do skipList[ v ] = true end

for _, v_itemType in pairs( itemTypesToHide ) do
    for k, v_item in pairs( data.raw[ v_itemType ] ) do
        if not skipList[ v_item.name ] then
            v_item.flags = { 'hidden' }
        end
    end
end

-------------------------------------------------------------------------------- Turn-off and remove recipies
for k, v_recp in pairs( data.raw.recipe ) do
    if v_recp.normal then
        v_recp.normal.enabled    = false
        v_recp.expensive.enabled = false
    else
        v_recp.enabled =  false
    end
end

local skipList = {}
for _, v in pairs( ignoredRecipies ) do skipList[ v ] = true end

for k, v_recp in pairs( data.raw.recipe ) do
    if not skipList[ v_recp.name ] then
        data.raw.recipe[ k ] = nil
    end
end

-------------------------------------------------------------------------------- Turn-off and remove technologies
for k, v_tech in pairs( data.raw.technology ) do
    v_tech.enabled       = false
    v_tech.hidden        = true
    v_tech.prerequisites = nil
end

local skipList = {}
for _, v in pairs( ignoredTechnologies ) do skipList[ v ] = true end

for k, v_tech in pairs( data.raw.technology ) do
    if not skipList[ v_tech.name ] then
        data.raw.technology [ k ] = nil
    end
end

--------------------------------------------------------------------------------

--______________________________________________________________________________________________________________________
--######################################################################################################################