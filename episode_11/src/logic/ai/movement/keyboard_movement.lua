local keyboardMovement = {}

keyboardMovement.update = function (entity)
  local moving = false
  if love.keyboard.isDown("right") and not moving then
    entity.x = entity.x + entity.speed
    moving = true
  end
  if love.keyboard.isDown("left") and not moving then
    entity.x = entity.x - entity.speed
    moving = true
  end
  if love.keyboard.isDown("up") and not moving then
    entity.y = entity.y - entity.speed
    moving = true
  end
  if love.keyboard.isDown("down") and not moving then
    entity.y = entity.y + entity.speed
    moving = true
  end
end

return keyboardMovement
