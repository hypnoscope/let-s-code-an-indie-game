local tilesheet = {}

local drawTile = function (self, view, x, y, tileX, tileY)
  view:inContext(function ()
    love.graphics.draw(self.image, self.quads[tileX][tileY], x, y)
  end)
end

tilesheet.create = function (imagePath, tileSize)
  local inst = {}

  inst.image = love.graphics.newImage(imagePath)
  inst.image:setFilter('nearest', 'nearest')
  inst.tileSize = tileSize
  inst.quads = {}

  for tileX=1, inst.image:getWidth()/tileSize do
    inst.quads[tileX] = {}
    for tileY=1, inst.image:getHeight()/tileSize do
      inst.quads[tileX][tileY] = love.graphics.newQuad(
        (tileX-1) * tileSize,
        (tileY-1) * tileSize,
        tileSize,
        tileSize,
        inst.image:getDimensions())
    end
  end

  inst.drawTile = drawTile

  return inst
end

return tilesheet
