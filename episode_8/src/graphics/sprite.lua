local view = require("src.graphics.view")

local sprite = {}

local draw = function (self, view, x, y)
  view:inContext(function ()
    love.graphics.draw(
      self.image,
      x,
      y,
      0)
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
