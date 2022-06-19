local Map = require('map')
local Recipe = require('recipe')

local Recipes = {}

function Recipes:new(filter)
   local o = setmetatable({}, self)
   self.__index = self

   local fn
   if type(filter) == 'function' then
      fn = filter
   elseif type(arg) == 'string' then
      fn = function(r) return string.match(r.name, filter) end
   end
   o.fn = fn

   return o
end

-- Can either take nothing, a string.match filter, or a function filter
function Recipes.all(filter)

   return Map:new(data.raw.recipe):iter(fn, Recipe)
end

function Recipes:sub(old, new, scale)
   if type(old) == 'string' then
      old = {type = 'item', name = old}
   end

   if type(new) == 'string' then
      new = {type = 'item', name = new}
   end

   for _, r in Recipes.all() do
   end
end

return Recipes
