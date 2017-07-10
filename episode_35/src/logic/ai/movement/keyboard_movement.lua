local vector = require("src.math.vector")
local animation = require("src.graphics.animation")

local keyboardMovement = {}

keyboardMovement.update = function (entity, game)
  if entity.interuptMovement then return end

  local moving = false
  local dX = 0
  local dZ = 0
  local currentRoom = game.map:currentRoom()

  if love.keyboard.isDown("right") and not moving then
    dX = entity.speed
    moving = true
    entity.position:faceRight()
  end
  if love.keyboard.isDown("left") and not moving then
    dX = -entity.speed
    moving = true
    entity.position:faceLeft()
  end
  if love.keyboard.isDown("up") and not moving then
    dZ = -entity.speed
    moving = true
  end
  if love.keyboard.isDown("down") and not moving then
    dZ = entity.speed
    moving = true
  end

  if moving then
    entity.sprite:setAnimation(animation.WALK)
  else
    entity.sprite:setAnimation(animation.STAND)
  end

  local newX = entity.position.x + dX * game.dt
  local newZ = entity.position.z + dZ * game.dt

  if currentRoom:walkable(newX, newZ) then
    entity.position:setPosition(newX, entity.position.y, newZ)
  end

end

return keyboardMovement
