local patch = require('patch')

-- Remove PyCoalTBAA's Science Pack 0
data.raw.recipe['science-pack-0'] = nil
data.raw.tool['science-pack-0'] = nil
for _, tech in pairs(data.raw.technology) do
   patch.remove(tech.unit.ingredients, function(i) return i[1] == 'science-pack-0' end)
end
for _, lab in pairs(data.raw.lab) do
   patch.remove(lab.inputs, function(i) return i == 'science-pack-0' end)
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
