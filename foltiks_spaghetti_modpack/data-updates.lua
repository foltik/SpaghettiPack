-- Remove PyCoalTBAA's Science Pack 0
-- Remove from all tech
for t, tech in pairs(data.raw.technology) do
   for i = #tech.unit.ingredients, 1, -1 do
      if tech.unit.ingredients[i][1] == 'science-pack-0' then
         table.remove(tech.unit.ingredients, i)
      end
   end
end
-- Remove from labs
for l, lab in pairs(data.raw.lab) do
   for i = #lab.inputs, 1, -1 do
      if lab.inputs[i] == 'science-pack-0' then
         table.remove(lab.inputs, i)
      end
   end
end
-- Remove recipe and item
data.raw.recipe['science-pack-0'] = nil
data.raw.tool['science-pack-0'] = nil
