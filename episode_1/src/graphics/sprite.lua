local sprite = {}

local draw = function (self)
  love.graphics.draw(
    self.image,
    self.x,
    self.y,
    0,
    10,
    10)
end

sprite.create = function (imagePath, x, y)
  local inst = {}

  inst.x = x
  inst.y = y
  inst.image = love.graphics.newImage(imagePath)
  inst.image:setFilter('nearest', 'nearest')

  inst.draw = draw

  return inst
end

return sprite
