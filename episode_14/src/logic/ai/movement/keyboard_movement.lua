local vector = require("src.math.vector")

local keyboardMovement = {}

keyboardMovement.update = function (entity, game)
  local moving = false
  local dX = 0
  local dZ = 0
  local currentRoom = game.map:currentRoom()

  if love.keyboard.isDown("right") and not moving then
    dX = entity.speed
    moving = true
  end
  if love.keyboard.isDown("left") and not moving then
    dX = -entity.speed
    moving = true
  end
  if love.keyboard.isDown("up") and not moving then
    dZ = -entity.speed
    moving = true
  end
  if love.keyboard.isDown("down") and not moving then
    dZ = entity.speed
    moving = true
  end

  local newX = entity.x + dX * game.dt
  local newZ = entity.z + dZ * game.dt
  local screenPos = vector.worldToScreen({x=newX, y=entity.y, z=newZ})
  if currentRoom:walkable(screenPos.x, screenPos.y) then
    entity.x = newX
    entity.z = newZ
  end

  game.debugString = entity.x .. "," .. entity.y .. "," .. entity.z
end

return keyboardMovement
