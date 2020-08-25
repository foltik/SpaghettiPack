local patch = {}

function patch.remove(t, fn)
   for i = #t, 1, -1 do
      if fn(t[i]) then
         table.remove(t, i)
      end
   end
end

function patch.merge(t, new)
   for k, v in pairs(new) do
      t[k] = v
   end
end

function patch.imerge(t, new)
   for _, v in ipairs(new) do
      table.insert(t, v)
   end
end

function patch.remove_recipe(recipe)
   data.raw.recipe[recipe] = nil
   for _, tech in pairs(data.raw.technology) do
      if tech.effects ~= nil then
         patch.remove(tech.effects, function(e) return e.recipe == recipe end)
      end
   end
end

function patch.remove_recipes(recipes)
   for _, r in ipairs(recipes) do
      patch.remove_recipe(r)
   end
end

return patch
