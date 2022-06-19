local p = require('__patchlib__/lib')

if mods['bobplates'] then
   -- Hide Barrelling recipes from player crafting
   for _, r in pairs(data.raw.recipe) do
      if r.category == 'air-pump' and r.name ~= 'bob-liquid-air' then
         r.hide_from_player_crafting = true
      elseif r.category == 'barrelling' then
         r.hide_from_player_crafting = true
      end
   end
end

if mods['bobassembly'] then
   -- Remove furnace uncrafting and upcrafting recipes
   p.recipes.delete({
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
end

if mods['bobpower'] then
   -- Remove boiler upcrafting recipes
   p.recipes.delete({
      'boiler-2-from-oil-boiler',
      'boiler-3-from-heat-exchanger',
      'boiler-3-from-oil-boiler-2',
      'boiler-4-from-heat-exchanger-2',
      'boiler-4-from-oil-boiler-3',
      'boiler-5-from-heat-exchanger-3',
      'boiler-5-from-oil-boiler-4',
      'oil-boiler-2-from-boiler-3',
      'oil-boiler-3-from-boiler-4',
      'oil-boiler-4-from-boiler-5',
      'heat-exchanger-2-from-boiler-4',
      'heat-exchanger-3-from-boiler-5',
   })
end

if mods['bobplates'] then
    -- Remove chem science prereq from gem processing 2
    p.techs.prereqs.remove('gem-processing-2', 'chemical-science-pack')

    -- Move raw gem recipes to gem processing 1
    -- TODO: Add just the 3's at index 1
    p.techs.recipes.set('gem-processing-1', {
       'bob-ruby-3',
       'bob-sapphire-3',
       'bob-emerald-3',
       'bob-amethyst-3',
       'bob-topaz-3',
       'bob-diamond-3',
       'bob-ruby-4',
       'bob-sapphire-4',
       'bob-emerald-4',
       'bob-amethyst-4',
       'bob-topaz-4',
       'bob-diamond-4',
    })
end

if mods['bobelectronics'] then
   -- Add rubber recipe to electronics tech
   -- TODO: add at index 4
   p.techs.recipes.add('electronics', 'bob-rubber')
end
