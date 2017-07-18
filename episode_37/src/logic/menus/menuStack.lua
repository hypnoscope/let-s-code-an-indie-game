local menuStack = {}

local popMenu = function (self)
  table.remove(self.menus, #self.menus)
end

local pushMenu = function (self, menu)
  table.insert(self.menus, menu)
end


local keypressed = function (self, key)
  local currentMenu = self.menus[#self.menus]

  if key == 'down' then currentMenu:next() end
  if key == 'up' then currentMenu:previous() end
  if key == 'return' then currentMenu:confirm() end
end

local draw = function (self, view)
  for _, m in ipairs(self.menus) do
    m:draw(view)
  end
end

menuStack.create = function ()
  local inst = {}

  inst.menus = {}

  inst.popMenu = popMenu
  inst.pushMenu = pushMenu
  inst.draw = draw
  inst.keypressed = keypressed

  return inst
end

return menuStack
