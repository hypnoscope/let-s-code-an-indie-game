local v = require("src.math.vector")

local bounce = {}

local bounceHeight = function (entity, game)
  local entityPosition = entity:toPosition()
  local playerPosition = game.player:toPosition()
  local distance = v.distance(entityPosition, playerPosition)
  if distance < 10 then
    return 40
  else
    return 20
  end
end

bounce.update = function (entity, game)
  if not entity.bounceDirection then
    entity.bounceDirection = 1
  end

  if entity.y < (-1 * bounceHeight(entity, game)) then entity.bounceDirection = -1 end
  if entity.y > 0 then entity.bounceDirection = 1 end

  entity.y = entity.y - (entity.speed * 2 * entity.bounceDirection * game.dt)
end

return bounce
