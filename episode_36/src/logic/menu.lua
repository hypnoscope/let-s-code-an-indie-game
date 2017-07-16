local menu = {}

local xPos = 18
local spacing = 14
local selectedColor = {255, 0, 255}
local white = {255, 255, 255}

local _drawOption = function (option, index)
  love.graphics.print(option, xPos, spacing * index)
end

local _drawSelectedOption = function (option, index)
  love.graphics.setColor(selectedColor)
  _drawOption(option, index)
  love.graphics.setColor(white)
end

local draw = function (self, view)
  view:inDisplayContext(function ()
    for index, option in ipairs(self.options) do
      if index == self.selected then
        _drawSelectedOption(option, index)
      else
        _drawOption(option, index)
      end
    end
  end)
end

local next = function (self)
  self.selected = self.selected + 1
  if self.selected > #self.options then
    self.selected = 1
  end
end

local previous = function (self)
  self.selected = self.selected - 1
  if self.selected < 1 then
    self.selected = #self.options
  end
end

menu.create = function (options)
  local inst = {}

  inst.options = options
  inst.selected = 1

  inst.draw = draw
  inst.next = next
  inst.previous = previous

  return inst
end

return menu
