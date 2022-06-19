local Tech = require('tech')

local Techs = {}

-- Can either take nothing, a string.match filter, or a function filter
function Techs.all(arg)
   local keys = {}
   for k, _ in pairs(data.raw.technology) do
      table.insert(keys, k)
   end

   local fn
   if type(arg) == 'function' then
      fn = arg
   elseif type(arg) == 'string' then
      fn = function(t) return string.match(t.name, arg) end
   else
      fn = function() return true end
   end

   local i = 0
   return function()
      i = i + 1
      local t = Tech(keys[i])

      while not fn(t) do
         i = i + 1
         t = Tech(keys[i])
      end

      return keys[i], t
   end
end

return Techs
