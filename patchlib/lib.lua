local patch = {
   table = {},
   recipes = {},
   techs = {recipes = {}, prereqs = {}},
}

function tablify(t)
   if t == nil then
      return {}
   elseif type(t) == 'table' then
      return t
   else
      return {t}
   end
end

-- Table

function patch.table.delete(t, fn)
   if t ~= nil then
      for i = #t, 1, -1 do
         if fn(t[i]) then
            table.remove(t, i)
         end
      end
   end
end

function patch.table.merge(t, new)
   if t ~= nil then
      for _, v in ipairs(new) do
         table.insert(t, v)
      end
   end
end

function patch.table.imerge(t, new)
   if t ~= nil then
      for k, v in pairs(new) do
         t[k] = v
      end
   end
end

-- Recipe

function patch.recipes.delete(recipes)
   if type(recipe) ~= 'table' then
      recipe = {recipe}
   end

   for _, r in ipairs(recipes) do
      data.raw.recipe[r] = nil
      -- Remove recipe from any tech effects
      for _, tech in pairs(data.raw.technology) do
         patch.table.delete(tech.effects, function(e) return e.recipe == r end)
      end
   end
end

function patch.recipes.hide(recipes)
   for _, r in ipairs(tablify(recipes)) do
      data.raw.recipe[r].hidden = nil
      -- Remove recipe from any tech effects
      for _, tech in pairs(data.raw.technology) do
         patch.table.delete(tech.effects, function(e) return e.recipe == r end)
      end
   end
end

function patch.recipes.lock(recipes)
   for _, r in ipairs(tablify(recipes)) do
      data.raw.recipe[r].enabled = false
   end
end

-- Tech

function patch.techs.delete(techs)
   for _, t in ipairs(tablify(techs)) do
      data.raw.technology[t] = nil
      -- Remove tech from any prerequisites
      for _, tech in pairs(data.raw.technology) do
         patch.table.delete(tech.prerequisites, function(pre) return p == t end)
      end
   end
end

function patch.techs.hide(techs)
   for _, t in ipairs(tablify(techs)) do
      data.raw.technology[t].hidden = true
      -- Remove tech from any prerequisites
      for _, tech in pairs(data.raw.technology) do
         patch.table.delete(tech.prerequisites, function(pre) return p == t end)
      end
   end
end

--function patch.prereqs.add(tech, prereqs)
--end

function patch.techs.prereqs.remove(tech, prereqs)
   for _, p in ipairs(tablify(prereqs)) do
      patch.table.delete(data.raw.technology[tech].prerequisites, function(pre) return pre == p end)
   end
end

function patch.techs.recipes.add(tech, recipes)
   -- Lock specified recipes by default
   data.raw.technology[tech].effects = data.raw.technology[tech].effects or {}
   for _, r in ipairs(tablify(recipes)) do
      patch.recipes.lock(r)
      table.insert(data.raw.technology[tech].effects, {type = 'unlock-recipe', recipe = r})
   end
end

function patch.techs.recipes.set(tech, recipes)
   patch.table.delete(data.raw.technology[tech].effects, function(e) return e.type == 'unlock-recipe' end)
   patch.techs.recipes.add(tech, recipes)
end

return patch
