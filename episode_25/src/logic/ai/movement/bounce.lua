local v = require("src.math.vector")

local bounce = {}

local bounceHeight = function (entity, game)
  local entityPosition = entity.position
  local playerPosition = game.player.position
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

  local pos = entity.position

  if pos.y < (-1 * bounceHeight(entity, game)) then entity.bounceDirection = -1 end
  if pos.y > 0 then entity.bounceDirection = 1 end

  local newY = pos.y - (entity.speed * 2 * entity.bounceDirection * game.dt)

  entity.position:update(pos.x, newY, pos.z)
end

return bounce
