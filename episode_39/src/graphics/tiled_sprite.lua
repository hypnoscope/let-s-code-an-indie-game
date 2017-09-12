local tiledSprite = {}

local draw = function (self, view, x, y, flipped)
  local rot = 0
  local scale = 1
  view:inContext(function ()
    love.graphics.draw(
      self.image, self.quad,
      x, y - self.yOffset, rot, scale, scale,
      self.image:getWidth()/2, 0)
  end)
end

tiledSprite.create = function (imagePath, repeatX, repeatY)
  local inst = {}

  inst.image = love.graphics.newImage(imagePath)
  inst.image:setFilter('nearest', 'nearest')
  inst.image:setWrap('repeat', 'repeat')
  local width = inst.image:getWidth()
  local height = inst.image:getHeight()
  inst.quad = love.graphics.newQuad(
    0, 0,
    width * repeatX, height * repeatY,
    inst.image:getDimensions())
  inst.size = width
  inst.yOffset = height * repeatY

  inst.draw = draw

  return inst
end

return tiledSprite
