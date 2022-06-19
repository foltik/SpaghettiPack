local Array = require('array.lua')

local Recipe = {}



function Recipe:new(name)
   local recipe = data.raw.recipe[name]
   if recipe == nil then
      error(string.format('Tried to access nil recipe "%s"!', name))
   end

   setmetatable(recipe, self)
   self.__index = self

   for i, v in ipairs(recipe.ingredients) do
      if not v.type and not v.name and not v.amount and v[1] and v[2] then
         recipe.ingredients[i] = {type = 'item', name = v[1], amount = v[2]}
      end
   end
   -- Add RecipeIngredients
   Array:new(recipe.ingredients)

   if recipe.result and not recipe.results then
      recipe.results = {{type = 'item', name = recipe.result, amount = recipe.result_count or 1}}
      recipe.result = nil
      recipe.result_count = nil
   end
   -- Add RecipeResults?
   Array:new(recipe.results)

   return recipe
end

function Recipe:hide()
   self.hidden = true
end


return function(name)
   return Recipe:new(name)
end
