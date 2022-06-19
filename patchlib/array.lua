local Array = {}

function Array:new(t)
   t = t or {}
   setmetatable(t, self)
   self.__index = self
   return t
end

function Array:add(v, i)
   if i ~= nil then
      table.insert(self, i, v)
   else
      table.insert(self, v)
   end
end

function Array:rm(arg)
   local fn
   if type(arg) == 'function' then
      fn = arg
   else
      fn = function(v) return v == arg end
   end

   for i = #self, 1, -1 do
      if fn(self[i]) then
         table.remove(self, i)
      end
   end
end

function Array:sub(old, new)
   local oldfn
   if type(old) == 'function' then
      oldfn = old
   else
      oldfn = function(v) return v == old end
   end

   local newfn
   if type(new) == 'function' then
      newfn = new
   else
      newfn = function() return new end
   end

   for i, v in ipairs(self) do
      if fn(v) then
         self[i] = fn(v)
      end
   end
end

function Array:merge(new, i)
   if i ~= nil then
      for j = i, i + #new - 1 do
         print(j)
         self:add(new[j - i + 1], j)
      end
   else
      for _, v in ipairs(new) do
         self:add(v)
      end
   end
end

function Array:map(fn)
   local new = Array:new()
   for _, v in ipairs(self) do
      new:add(fn(v))
   end
end

return Array
