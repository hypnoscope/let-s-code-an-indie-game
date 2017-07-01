local view = require("src.graphics.view")

local sprite = {}

local draw = function (self, view, x, y, flipped)
  view:inContext(function ()
    local xOffset = self.size / 2
    local yOffset = self.size / 2
    local xScale = 1
    if flipped then xScale = -1 end
    love.graphics.draw(
      self.image,
      x,
      y,
      0,
      xScale,
      1,
      xOffset,
      yOffset
    )

    if DEBUG then
      love.graphics.rectangle("fill", x, y, 1, 1)
    end
  end)
end

local getImage = function (self)
  return self.image
end

sprite.create = function (imagePath)
  local inst = {}

  inst.image = love.graphics.newImage(imagePath)
  inst.image:setFilter('nearest', 'nearest')
  inst.size = inst.image:getWidth()

  inst.draw = draw
  inst.getImage = getImage

  return inst
end

return sprite
