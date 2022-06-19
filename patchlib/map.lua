local Map = {}

function Map:new(t)
   t = t or {}
   setmetatable(t, self)
   self.__index = self
   return t
end

function Map:iter(filter, map)
   local keys = {}
   for k, _ in pairs(data.raw.recipe) do
      table.insert(keys, k)
   end

   local filterfn
   if type(arg) == 'function' then
      filterfn = arg
   else
      filterfn = function() return true end
   end

   local mapfn
   if type(map) == 'function' then
      mapfn = map
   else
      mapfn = function(v) return v end
   end

   local i = 0
   return function()
      i = i + 1
      local r = mapfn(keys[i])

      while not filterfn(r) do
         i = i + 1
         r = mapfn(keys[i])
      end

      return keys[i], r
   end
end

return Map
