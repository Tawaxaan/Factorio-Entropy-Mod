local config = {}

-- Interval for chunk count calculation (minutes)
config.CHUNKS_COUNT_UPDATE_INTERVAL = 5
-- Interval for processing iteration (tick)
config.PROCESS_INTERVAL             = 1

-- Count of tree growth (must be a multiple of four)
config.TREE_GROWTH_STAGES           = 16

-- Suffix for scaled prototypes names
config.TREE_SCALE_SUFFIX   = 'scl'

-- Group and subgroups for rescaled trees
config.TREE_SCALE_GROUP          = 'tree-scaled'
config.TREE_SCALE_SUBGROUP_TREE  = 'tree-scaled-normal'
config.TREE_SCALE_SUBGROUP_STUMP = 'tree-scaled-stump'

return config