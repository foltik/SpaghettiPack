local patch = require('patch')

-- Fix for a bug with Pyanodon's Petroleum Handling hotair recipe overrides
data.raw.recipe['hotair-angels-roll-rubber-casting'].icons = {{icon = '__PCPRedux__/graphics/icons/roll-blank.png', tint = {r = 0, g = 0, b = 0}, icon_size=32}}


-- Allow medium electric pole hand crafting
data.raw.recipe['medium-electric-pole'].category = 'crafting'


-- Move science packs back to the intermediates category
data:extend({{
    type = 'item-subgroup',
    name = 'science-packs',
    group = 'intermediate-products',
    order = 'm-a'
}})
patch.merge(data.raw.recipe['automation-science-pack'], {
    group = 'intermediate-products',
    subgroup = 'science-packs',
    order = 'a-a'
})
patch.merge(data.raw.recipe['logistic-science-pack'], {
    group = 'intermediate-products',
    subgroup = 'science-packs',
    order = 'a-b'
})
patch.merge(data.raw.recipe['military-science-pack'], {
    group = 'intermediate-products',
    subgroup = 'science-packs',
    order = 'a-c'
})
patch.merge(data.raw.recipe['chemical-science-pack'], {
    group = 'intermediate-products',
    subgroup = 'science-packs',
    order = 'a-d'
})
patch.merge(data.raw.recipe['production-science-pack'], {
    group = 'intermediate-products',
    subgroup = 'science-packs',
    order = 'a-e'
})
patch.merge(data.raw.recipe['advanced-logistic-science-pack'], {
    group = 'intermediate-products',
    subgroup = 'science-packs',
    order = 'a-f'
})
patch.merge(data.raw.recipe['utility-science-pack'], {
    group = 'intermediate-products',
    subgroup = 'science-packs',
    order = 'a-g'
})
patch.merge(data.raw.recipe['space-science-pack'], {
    group = 'intermediate-products',
    subgroup = 'science-packs',
    order = 'a-h'
})


-- Revert Pyanodon's and bob's new science pack icons and colors back to the nice looking vanilla ones
data.raw.tool['automation-science-pack'].icons = {{icon = '__base__/graphics/icons/automation-science-pack.png', icon_size = 64}}
data.raw.recipe['automation-science-pack'].icons = {{icon = '__base__/graphics/icons/automation-science-pack.png', icon_size = 64}}

data.raw.tool['logistic-science-pack'].icons = {{icon = '__base__/graphics/icons/logistic-science-pack.png', icon_size = 64}}
data.raw.recipe['logistic-science-pack'].icons = {{icon = '__base__/graphics/icons/logistic-science-pack.png', icon_size = 64}}
data.raw.technology['logistic-science-pack'].icons = {{icon = '__base__/graphics/icons/logistic-science-pack.png', icon_size = 64}}

data.raw.tool['chemical-science-pack'].icons = {{icon = '__base__/graphics/icons/chemical-science-pack.png', icon_size = 64}}
data.raw.recipe['chemical-science-pack'].icons = {{icon = '__base__/graphics/icons/chemical-science-pack.png', icon_size = 64}}

data.raw.tool['production-science-pack'].icons = {{icon = '__base__/graphics/icons/production-science-pack.png', icon_size = 64}}
data.raw.recipe['production-science-pack'].icons = {{icon = '__base__/graphics/icons/production-science-pack.png', icon_size = 64}}

data.raw.tool['utility-science-pack'].icons = {{icon = '__base__/graphics/icons/utility-science-pack.png', icon_size = 64}}
data.raw.recipe['utility-science-pack'].icons = {{icon = '__base__/graphics/icons/utility-science-pack.png', icon_size = 64}}
data.raw.technology['utility-science-pack'].icons = {{icon = '__base__/graphics/icons/utility-science-pack.png', icon_size = 64}}

--data.raw.tool['advanced-logistic-science-pack'].icons = {{icon = '__bobtech__/graphics/icons/logistic-science-pack-technology.png', icon_size = 128}}
--data.raw.recipe['advanced-logistic-science-pack'].icons = {{icon = '__bobtech__/graphics/icons/logistic-science-pack-technology.png', icon_size = 128}}
