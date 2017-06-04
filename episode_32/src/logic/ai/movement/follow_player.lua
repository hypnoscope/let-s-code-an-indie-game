local v = require("src.math.vector")

local followPlayer = {}

followPlayer.update = function (entity, game)
  local playerPosition = game.player.position
  local entityPosition = entity.position
  local dX = 0
  local dZ = 0
  local room = game.map:currentRoom()

  local distance = v.distance(entityPosition, playerPosition)

  if distance > 1 then
    local unitVector = v.normalise(entityPosition, playerPosition)
    dX = unitVector.dx * entity.speed * game.dt
    dZ = unitVector.dz * entity.speed * game.dt

    local newX = entity.position.x + dX
    local newZ = entity.position.z + dZ

    if room:walkable(newX, newZ) then
      entity.position:setPosition(newX, entity.position.y, newZ)
    end
  end

end

return followPlayer
