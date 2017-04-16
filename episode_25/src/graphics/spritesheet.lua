local spritesheet = {}

local draw = function (self, view, x, y)
  view:inContext(function ()
    local xOffset = self.image:getWidth() / 2
    local yOffset = self.image:getHeight() / 2

    love.graphics.draw(
      self.image,
      self.sprites[self.animation:frame()],
      x - xOffset,
      y - yOffset
    )
  end)
end

local setAnimation = function (self, newAnimation)
  if newAnimation ~= self.animation then
    self.animation = newAnimation
  end
end

local update = function (self, game)
  self.animation:update(game)
end

spritesheet.create = function (imagePath, spriteSize, animation)
  local inst = {}

  inst.image = love.graphics.newImage(imagePath)
  inst.image:setFilter('nearest', 'nearest')
  inst.sprites = {}
  inst.animation = animation

  local spritesWide = inst.image:getWidth() / spriteSize

  inst.maxSprites = spritesWide

  for i = 1, spritesWide do
    local x = (i - 1) * spriteSize
    local y = 0

    inst.sprites[i] = love.graphics.newQuad(
      x, y,
      spriteSize, spriteSize,
      inst.image:getDimensions()
    )
  end

  inst.draw = draw
  inst.update = update
  inst.setAnimation = setAnimation

  return inst
end

return spritesheet
