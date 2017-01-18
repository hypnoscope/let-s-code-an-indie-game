local sprite = {}

local draw = function (self, x, y)
  love.graphics.draw(
    self.image,
    x,
    y,
    0,
    10,
    10)
end

sprite.create = function (imagePath)
  local inst = {}

  inst.image = love.graphics.newImage(imagePath)
  inst.image:setFilter('nearest', 'nearest')

  inst.draw = draw

  return inst
end

return sprite
