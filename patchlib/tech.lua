local Array = require('array')



local Tech = {}

function Tech:new(name)
   local tech = data.raw.technology[name]
   if tech == nil then
      error(string.format('Tried to access nil technology "%s"!', name))
   end

   setmetatable(tech, self)
   self.__index = self

   tech.prerequisites = tech.prerequisites or {}
   Array:new(tech.prerequisites)

   tech.effects = tech.effects or {}
   TechRecipes:new(tech.effects)

   return tech
end

function Tech:hide()
   self.hidden = true
end



local TechRecipes = Array:new()

function TechRecipes:add(recipe, i)
   Array.add(self, {type = 'unlock-recipe', recipe = recipe}, i)
end

function TechRecipes:rm(recipe)
   Array.rm(self, function(e) return e.recipe == recipe end)
end

function TechRecipes:sub(old, new)
   Array.sub(self, function(r) return r.recipe == old end, {type = 'unlock-recipe', recipe = new})
end

function TechRecipes:merge(recipes, i)
   Array.merge(self, Array:new(recipes):map(function(r) return {type = 'unlock-recipe', recipe = r} end), i)
end



return function(name)
   return Tech:new(name)
end
