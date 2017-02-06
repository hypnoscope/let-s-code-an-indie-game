local view = require("src.graphics.view")

local sprite = {}

local draw = function (self, view, x, y)
  view:inContext(function ()
    local xOffet = self.image:getWidth() / 2
    local yOffset = self.image:getHeight() / 2
    love.graphics.draw(self.image, x - xOffet, y - yOffset, 0)

    if DEBUG then
      love.graphics.rectangle('line', x, y, 1, 1)
    end
  end)
end

sprite.create = function (imagePath)
  local inst = {}

  inst.image = love.graphics.newImage(imagePath)
  inst.image:setFilter('nearest', 'nearest')

  inst.draw = draw

  return inst
end

return sprite
