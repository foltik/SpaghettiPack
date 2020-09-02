local patch = require('patch')

-- Remove PyCoalTBAA's Science Pack 0
data.raw.recipe['science-pack-0'] = nil
data.raw.tool['science-pack-0'] = nil
for _, tech in pairs(data.raw.technology) do
   patch.remove(tech.unit.ingredients, function(i) return i[1] == 'science-pack-0' end)
end
for _, lab in pairs(data.raw.lab) do
   if lab.inputs ~= nil then
      patch.remove(lab.inputs, function(i) return i == 'science-pack-0' end)
   end
end


-- Remove unused concrete grid recipe and item
patch.remove_recipe('dect-concrete-grid')
data.raw.item['dect-concrete-grid'] = nil
data.raw.tile['dect-concrete-grid'] = nil


-- Remove furnace uncrafting and redundant recipes that confused people
patch.remove_recipes({
    'stone-mixing-furnace-from-stone-furnace',
    'stone-furnace-from-stone-mixing-furnace',
    'stone-chemical-furnace-from-stone-furnace',
    'stone-furnace-from-stone-chemical-furnace',
    'steel-chemical-furnace-from-steel-furnace',
    'steel-furnace-from-steel-chemical-furnace',
    'steel-furnace-from-fluid-furnace',
    'steel-furnace-from-steel-mixing-furnace',
    'electric-furnace-from-electric-chemical-furnace',
    'electric-chemical-furnace-from-electric-furnace',
    'electric-furnace-from-electric-mixing-furnace',
    'electric-mixing-furnace-from-electric-furnace',
    'steel-chemical-furnace-from-fluid-chemical-furnace',
    'fluid-chemical-furnace-from-fluid-furnace',
    'steel-mixing-furnace-from-fluid-mixing-furnace',
    'steel-mixing-furnace-from-steel-furnace',
    'fluid-mixing-furnace-from-fluid-furnace',
    'fluid-furnace-from-fluid-chemical-furnace',
    'fluid-furnace-from-fluid-mixing-furnace',
})

patch.imerge(data.raw.technology['basic-fluid-handling'].effects, {
    {type = 'unlock-recipe', recipe = 'bob-small-storage-tank'},
    {type = 'unlock-recipe', recipe = 'bob-small-inline-storage-tank'},
})

-- Disable yuoki's science alternate crafting
--[[
data.raw.technology['yi-science-exchange'] = nil
patch.remove_recipes({
    'y_military_science_recipe',
    'y_chemical_science_recipe',
    'y_production_science_recipe',
    'y_high-tech_science_recipe',
    'y_space_science_recipe',
})

-- Disable some unbalanced yuoki's unicomp exchange
patch.remove_recipes({
    'y_createbluesigns_recipe',
    'y-ac-copper2uc-recipe',
    'y-ac-iron2uc-recipe',
    'y-ac-coal2uc-recipe',
    'y-ac-stone2uc-recipe',
    'y-ac-uran2uc-recipe',
    'y-ac-wood2uc-recipe',
    'y-ac-uc2copper-recipe',
    'y-ac-uc2iron-recipe',
    'y-ac-uc2coal-recipe',
    'y-ac-uc2stone-recipe',
    'y-ac-uc2uranore-recipe',
    'y-ac-uc2wood-recipe'
})

data.raw.technology['yi-oil-atomics'] = nil
patch.remove_recipes({
    'y-heavyoil2uc-recipe',
    'y-lightoil2uc-recipe',
    'y-lubricant2uc-recipe',
    'y-petroleum-recipe',
    'y-uc2crudeoil-recipe',
    'y-ac-uc2plastic-recipe',
})

data.raw.technology['yi-organic-atomics'] = nil
patch.remove_recipes({
    'y_catalyst_ft_recipe',
    'y_regcatft_recipe',
    'y_catalyst_bp_recipe',
    'y_regcatbp_recipe',
    'y_coal2liquid',
    'y_ft_recipe',
    'y_rawsyngas1_recipe',
    'y_rawsyngas2_recipe',
    'y_refinehydrogen_recipe',
    'y_slurry2ethanol_recipe',
    'y_mf2d-recipe'
})
patch.imerge(data.raw.technology['yi-basic-farming'].effects, {
    'y_granulate_wood_recipe',
    'ye_granulate_trifitan_recipe',
    'ye_granulate_vuger_recipe',
    'ye_granulate_corn_recipe',
    'ye_biofuel_recipe'
})
--]]

-- Add missing Titanium Tetrachloride recipe
RECIPE {
    type = "recipe",
    name = "ticl4",
    category = "hpf",
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = "fluid", name = "chlorine", amount = 40},
        {type = "item", name = "coal-dust", amount = 10},
        {type = "item", name = "titanium-plate", amount = 3},
    },
    results = {
        {type = "item", name = "ticl4", amount = 4},
    },
    main_product = "ticl4",
    icon = "__pypetroleumhandlinggraphics__/graphics/icons/ticl4.png",
    icon_size = 32,
    subgroup = "py-petroleum-handling-recipes",
    order = "a"
}:add_unlock("oil-machines-mk01")

-- Add missing Tin-Chromium Alloy recipe
RECIPE {
    type = "recipe",
    name = "sncr-alloy",
    category = "advanced-foundry",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "item", name = "chromium", amount = 3},
        {type = "item", name = "tin-plate", amount = 4},
    },
    results = {
        {type = "item", name = "sncr-alloy", amount = 2},
    },
    main_product = "sncr-alloy",
    icon = "__pypetroleumhandlinggraphics__/graphics/icons/sncr-alloy.png",
    icon_size = 32,
    subgroup = "py-rawores-recipes",
    order = "a"
}:add_unlock("oil-sands")
