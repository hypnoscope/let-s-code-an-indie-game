local v = require("src.math.vector")

local followPlayer = {}

followPlayer.update = function (entity, game)
  local playerPosition = game.player:toPosition()
  local entityPosition = entity:toPosition()

  local distance = v.distance(entityPosition, playerPosition)

  if distance > 1 then
    local unitVector = v.normalise(entityPosition, playerPosition)
    entity.x = entity.x + unitVector.dx * entity.speed * game.dt
    entity.z = entity.z + unitVector.dz * entity.speed * game.dt
  end
end

return followPlayer
