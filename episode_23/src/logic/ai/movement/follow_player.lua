local v = require("src.math.vector")

local followPlayer = {}

followPlayer.update = function (entity, game)
  local playerPosition = game.player:toPosition()
  local entityPosition = entity:toPosition()
  local dX = 0
  local dZ = 0
  local room = game.map:currentRoom()

  local distance = v.distance(entityPosition, playerPosition)

  if distance > 1 then
    local unitVector = v.normalise(entityPosition, playerPosition)
    dX = unitVector.dx * entity.speed * game.dt
    dZ = unitVector.dz * entity.speed * game.dt

    local newX = entity.x + dX
    local newZ = entity.z + dZ

    if room:walkable(newX, newZ) then
      entity.x = newX
      entity.z = newZ
    end
  end


end

return followPlayer
