local v = require("src.math.vector")

local bounce = {}

local bounceHeight = function (entity, game)
  local entityPosition = entity:toPosition()
  local playerPosition = game.player:toPosition()
  local distance = v.distance(entityPosition, playerPosition)
  if distance < 100 then
    return 400
  else
    return 200
  end
end

bounce.update = function (entity, game)
  if not entity.bounceDirection then
    entity.bounceDirection = 1
  end

  if entity.z > bounceHeight(entity, game) then entity.bounceDirection = -1 end
  if entity.z < 0 then entity.bounceDirection = 1 end

  entity.z = entity.z + entity.speed * 2 * entity.bounceDirection
end

return bounce
