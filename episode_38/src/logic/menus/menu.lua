local menu = {}

local spacing = 14
local selectedColor = {255, 0, 255}
local white = {255, 255, 255}

local selectSound = love.audio.newSource(
  "assets/sounds/menu_select.wav", "static")

selectSound:setVolume(0.3)

local confirmSound = love.audio.newSource(
  "assets/sounds/menu_confirm.wav", "static"
)

confirmSound:setVolume(0.3)

local _drawOption = function (x, y, option, index)
  love.graphics.print(option["text"], x, y + (spacing * (index - 1)))
end

local _drawSelectedOption = function (x, y, option, index)
  love.graphics.setColor(selectedColor)
  _drawOption(x, y, option, index)
  love.graphics.setColor(white)
end

local draw = function (self, view)
  view:inDisplayContext(function ()
    for index, option in ipairs(self.options) do
      if index == self.selected then
        _drawSelectedOption(self.x, self.y, option, index)
      else
        _drawOption(self.x, self.y, option, index)
      end
    end
  end)
end

local next = function (self)
  selectSound:play()
  self.selected = self.selected + 1
  if self.selected > #self.options then
    self.selected = 1
  end
end

local previous = function (self)
  selectSound:play()
  self.selected = self.selected - 1
  if self.selected < 1 then
    self.selected = #self.options
  end
end

local confirm = function (self)
  confirmSound:play()
  local currentOption = self.options[self.selected]

  currentOption["onSelect"]()
end

menu.create = function (x, y, options)
  local inst = {}

  inst.x = x
  inst.y = y
  inst.options = options
  inst.selected = 1

  inst.draw = draw
  inst.next = next
  inst.previous = previous
  inst.confirm = confirm

  return inst
end

menu.createOption = function (text, onSelect)
  return {
    text = text,
    onSelect = onSelect
  }
end

return menu
