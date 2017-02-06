local keyboardMovement = {}

keyboardMovement.update = function (entity, game)
  local moving = false
  local dX = 0
  local dY = 0
  local room = game.map:currentRoom()

  if love.keyboard.isDown("right") and not moving then
    dX = entity.speed
    moving = true
  end
  if love.keyboard.isDown("left") and not moving then
    dX = -entity.speed
    moving = true
  end
  if love.keyboard.isDown("up") and not moving then
    dY = -entity.speed
    moving = true
  end
  if love.keyboard.isDown("down") and not moving then
    dY = entity.speed
    moving = true
  end

  local newX = entity.x + dX
  local newY = entity.y + dY

  if room:walkable(newX, newY) then
    entity.x = newX
    entity.y = newY
  end
end

return keyboardMovement
