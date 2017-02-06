local v = require("src.math.vector")

local followPlayer = {}

followPlayer.update = function (entity, game)
  local playerPosition = game.player:toPosition()
  local entityPosition = entity:toPosition()

  local distance = v.distance(entityPosition, playerPosition)

  if distance > 10 then
    local unitVector = v.normalise(entityPosition, playerPosition)
    entity.x = entity.x + unitVector.dx * entity.speed
    entity.y = entity.y + unitVector.dy * entity.speed
  end
end

return followPlayer
