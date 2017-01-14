local bounce = {}

bounce.update = function (entity)
  if not entity.bounceDirection then
    entity.bounceDirection = 1
  end

  if entity.z > 200 then entity.bounceDirection = -1 end
  if entity.z < 0 then entity.bounceDirection = 1 end

  entity.z = entity.z + entity.speed * 2 * entity.bounceDirection
end

return bounce
