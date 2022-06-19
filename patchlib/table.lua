local tbl = {}

function tbl.delete(t, arg)
   if t == nil then
      error('Tried to delete from nil table!')
   end

   local fn
   if type(arg) == 'function' then
      fn = arg
   else
      fn = function(v) return v == arg end
   end

   for i = #t, 1, -1 do
      if fn(t[i]) then
         table.remove(t, i)
      end
   end
end

function tbl.replace(t, old, new)
   for k, v in pairs(t) do
      if v == old then
         t[k] = new
      end
   end
end

function tbl.merge(t, new)
   if t == nil then
      error('Tried to merge into nil table!')
   end

   for k, v in pairs(new) do
      t[k] = v
   end
end

function tbl.imerge(t, new)
   if t == nil then
      error('Tried to merge into nil table!')
   end

   for _, v in ipairs(new) do
      table.insert(t, v)
   end
end

return tbl
