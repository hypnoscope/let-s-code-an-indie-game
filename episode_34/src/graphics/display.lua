local display = {}

local _drawBar = function (n, pipWidth, pipHeight, barX, barY, color)
  love.graphics.setColor(color)
  for i = 0, (n - 1) do
    love.graphics.rectangle(
      'fill',
      i * pipWidth + barX,
      barY,
      pipWidth,
      pipHeight)
  end
  love.graphics.setColor(255, 255, 255)
end

local draw = function (self, view, game)
  view:inDisplayContext(function ()
    local player = game:getPlayer()
    local inventory = game:getInventory()
    local item = inventory:getItem()
    local healthColor = {100, 200, 100}
    local magicColor = {200, 100, 200}

    _drawBar(player.hp, 6, 3, 4, 2, healthColor)
    _drawBar(inventory.potionCount, 6, 2, 4, 6, magicColor)

    local itemIconPositionX = 260
    local itemIconPositionY = 1
    love.graphics.draw(
      item.SPRITE:getImage(),
      itemIconPositionX,
      itemIconPositionY)
  end)
end

display.create = function ()
  local inst = {}

  inst.draw = draw

  return inst
end

return display
