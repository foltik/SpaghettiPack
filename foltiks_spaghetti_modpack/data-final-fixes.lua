local patch = require('patch')

-- Allow medium electric pole hand crafting
data.raw.recipe['medium-electric-pole'].category = 'crafting'


-- Move science packs back to the Clown's rows in the intermediates category
patch.merge(data.raw.recipe['automation-science-pack'], {
    group = 'intermediate-products',
    subgroup = 'automation-science-pack',
    order = 'a-a'
})
patch.merge(data.raw.recipe['logistic-science-pack'], {
    group = 'intermediate-products',
    subgroup = 'logistic-science-pack',
    order = 'a-a'
})
patch.merge(data.raw.recipe['chemical-science-pack'], {
    group = 'intermediate-products',
    subgroup = 'chemical-science-pack',
    order = 'a-a'
})
patch.merge(data.raw.recipe['production-science-pack'], {
    group = 'intermediate-products',
    subgroup = 'production-science-pack',
    order = 'a-a'
})
patch.merge(data.raw.recipe['advanced-logistic-science-pack'], {
    group = 'intermediate-products',
    subgroup = 'advanced-logistic-science-pack',
    order = 'a-a'
})
patch.merge(data.raw.recipe['utility-science-pack'], {
    group = 'intermediate-products',
    subgroup = 'utility-science-pack',
    order = 'a-a'
})

-- Revert Pyanodon's and bob's new science pack icons and colors back to the nice looking vanilla ones
data.raw.tool['automation-science-pack'].icons = {{icon = '__base__/graphics/icons/automation-science-pack.png', icon_size = 64}}
-- data.raw.recipe['automation-science-pack'].icons = {{icon = '__base__/graphics/icons/automation-science-pack.png', icon_size = 64}}

data.raw.tool['logistic-science-pack'].icons = {{icon = '__base__/graphics/icons/logistic-science-pack.png', icon_size = 64}}
-- data.raw.recipe['logistic-science-pack'].icons = {{icon = '__base__/graphics/icons/logistic-science-pack.png', icon_size = 64}}
-- data.raw.technology['logistic-science-pack'].icons = {{icon = '__base__/graphics/icons/logistic-science-pack.png', icon_size = 64}}

data.raw.tool['chemical-science-pack'].icons = {{icon = '__base__/graphics/icons/chemical-science-pack.png', icon_size = 64}}
-- data.raw.recipe['chemical-science-pack'].icons = {{icon = '__base__/graphics/icons/chemical-science-pack.png', icon_size = 64}}

data.raw.tool['production-science-pack'].icons = {{icon = '__base__/graphics/icons/production-science-pack.png', icon_size = 64}}
-- data.raw.recipe['production-science-pack'].icons = {{icon = '__base__/graphics/icons/production-science-pack.png', icon_size = 64}}

data.raw.tool['utility-science-pack'].icons = {{icon = '__base__/graphics/icons/utility-science-pack.png', icon_size = 64}}
-- data.raw.recipe['utility-science-pack'].icons = {{icon = '__base__/graphics/icons/utility-science-pack.png', icon_size = 64}}
-- data.raw.technology['utility-science-pack'].icons = {{icon = '__base__/graphics/icons/utility-science-pack.png', icon_size = 64}}

data.raw.tool['advanced-logistic-science-pack'].icons = {{icon = '__bobtech__/graphics/icons/logistic-science-pack-technology.png', icon_size = 128}}
-- data.raw.recipe['advanced-logistic-science-pack'].icons = {{icon = '__bobtech__/graphics/icons/logistic-science-pack-technology.png', icon_size = 128}}

-- Enable belt crafting without tech
data.raw.recipe['belt'].enabled = true

-- Remove water from Ethylene Glycol recipe, allowing it to be crafted properly
patch.remove(data.raw.recipe['ethylene-glycol'].ingredients, function(i) return i.name == 'water' end)

-- Fix crushed stone phosphorous sorting recipe and reduce slag count
data.raw.recipe['crushed-stone-sorting'] = nil
data:extend({
  {
    type = "recipe",
    name = "crushed-stone-sorting",
    icons =
    {
      {
        icon = "__Clowns-Processing__/graphics/icons/sorting.png"
      },
      {
        icon = "__angelsrefining__/graphics/icons/stone-crushed.png",
        scale = 0.5,
        shift = {8, 8},
      },
    },
    icon_size = 32,
    category = "ore-sorting",
    subgroup = "ore-sorting-t1",
    order = "i",
    energy_required = 1,
    enabled = false,
    allow_decomposition = false,
    ingredients =
    {
      {type = "item", name = "stone-crushed", amount = 20},
    },
    results =
    {
      {type = "item", name = "slag", amount = 1},
      {type = "item", name = "phosphate-rock", amount = 1},
    },
  }
})


-- Remove unresearchable kovarex enrichment tech from prereqs
for _, tech in pairs(data.raw.technology) do
   if tech.prerequisites ~= nil then
      patch.remove(tech.prerequisites, function(e) return e == 'kovarex-enrichment-process' end)
   end
end
