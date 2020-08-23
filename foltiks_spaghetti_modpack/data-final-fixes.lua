-- Fix for a bug with Pyanodon's Petroleum Handling hotair recipe overrides
data.raw.recipe['hotair-angels-roll-rubber-casting'].icons = {{
    icon = '__PCPRedux__/graphics/icons/roll-blank.png',
    tint = {r = 0, g = 0, b = 0},
    icon_size=32
}}



-- Revert Pyanodon's new science pack icons to the nice looking vanilla ones
data.raw.tool['automation-science-pack'].icon = '__base__/graphics/icons/automation-science-pack.png'
data.raw.tool['automation-science-pack'].icon_size = 64
data.raw.tool['logistic-science-pack'].icon = '__base__/graphics/icons/logistic-science-pack.png'
data.raw.tool['logistic-science-pack'].icon_size = 64
data.raw.tool['chemical-science-pack'].icon = '__base__/graphics/icons/chemical-science-pack.png'
data.raw.tool['chemical-science-pack'].icon_size = 64
data.raw.tool['production-science-pack'].icon = '__base__/graphics/icons/production-science-pack.png'
data.raw.tool['production-science-pack'].icon_size = 64
data.raw.tool['utility-science-pack'].icon = '__base__/graphics/icons/utility-science-pack.png'
data.raw.tool['utility-science-pack'].icon_size = 64

-- Fix Clown's recipes color changes
data.raw.recipe['automation-science-pack'].icons[1] = {icon = '__base__/graphics/icons/automation-science-pack.png', icon_size = 64}
data.raw.recipe['alt1-science-pack-1'].icons[1] = {icon = '__base__/graphics/icons/automation-science-pack.png', icon_size = 64}
data.raw.recipe['alt2-science-pack-1'].icons[1] = {icon = '__base__/graphics/icons/automation-science-pack.png', icon_size = 64}
data.raw.recipe['facility-science-pack-1'].icons[1] = {icon = '__base__/graphics/icons/automation-science-pack.png', icon_size = 64}

data.raw.recipe['logistic-science-pack'].icons[1] = {icon = '__base__/graphics/icons/logistic-science-pack.png', icon_size = 64}
data.raw.recipe['alt1-science-pack-2'].icons[1] = {icon = '__base__/graphics/icons/logistic-science-pack.png', icon_size = 64}
data.raw.recipe['facility-science-pack-2'].icons[1] = {icon = '__base__/graphics/icons/logistic-science-pack.png', icon_size = 64}
data.raw.technology['logistic-science-pack'].icon = '__base__/graphics/icons/logistic-science-pack.png'
data.raw.technology['logistic-science-pack'].icon_size = 64

data.raw.recipe['utility-science-pack'].icons[1] = {icon = '__base__/graphics/icons/utility-science-pack.png', icon_size = 64}
data.raw.recipe['alt1-high-tech-science-pack'].icons[1] = {icon = '__base__/graphics/icons/utility-science-pack.png', icon_size = 64}
data.raw.recipe['alt2-high-tech-science-pack'].icons[1] = {icon = '__base__/graphics/icons/utility-science-pack.png', icon_size = 64}
data.raw.recipe['facility-high-tech-science-pack'].icons[1] = {icon = '__base__/graphics/icons/utility-science-pack.png', icon_size = 64}
data.raw.technology['utility-science-pack'].icon = '__base__/graphics/icons/utility-science-pack.png'
data.raw.technology['utility-science-pack'].icon_size = 64
