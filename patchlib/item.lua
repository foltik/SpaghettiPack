local Array = require('array.lua')

local Item = {}



function Item:new(name, tbl)
   tbl = tbl or 'item'
   local item = data.raw[tbl][name]
   if item == nil then
      error(string.format('Tried to access nil item in table "%s": "%s"!', tbl, name))
   end

   setmetatable(item, self)
   self.__index = self

   return item
end

function Item:hide()
   self.hidden = true
end



return function(name)
   return Item:new(name)
end
