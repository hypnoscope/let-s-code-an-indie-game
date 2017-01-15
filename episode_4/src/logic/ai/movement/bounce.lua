local bounce = {}

local bounceHeight = function (entity, game)
  local player = game.player
  local playerX = player.x
  local playerY = player.y
  local dX = playerX - entity.x
  local dY = playerY - entity.y
  local distance = math.sqrt(dX*dX + dY*dY)
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
