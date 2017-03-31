local spritesheet = {}

local draw = function (self, view, x, y)
  view:inContext(function ()
    local xOffset = self.image:getWidth() / 2
    local yOffset = self.image:getHeight() / 2

    love.graphics.draw(
      self.image,
      self.sprites[self.currentSprite],
      x - xOffset,
      y - yOffset
    )
  end)
end

local update = function (self, game)
  self.frameCount = self.frameCount + game.dt

  if self.frameCount >= self.frameTime then
    self.currentSprite = self.currentSprite + 1
    self.frameCount = 0
  end

  if self.currentSprite > self.maxSprites then self.currentSprite = 1 end
end

spritesheet.create = function (imagePath, spriteSize)
  local inst = {}

  inst.image = love.graphics.newImage(imagePath)
  inst.image:setFilter('nearest', 'nearest')
  inst.sprites = {}
  inst.currentSprite = 1
  inst.frameTime = 15 * (1/60)
  inst.frameCount = 0

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

  return inst
end

return spritesheet
