local vector = {}

vector.distance = function (from, to)
  local dx = to.x - from.x
  local dy = to.y - from.y
  return math.sqrt(dx*dx + dy*dy)
end

vector.normalise = function (from, to)
  local dx = to.x - from.x
  local dy = to.y - from.y
  local distance = vector.distance(from, to)

  return {
    dx = dx / distance,
    dy = dy / distance
  }
end

local theta = math.rad(45)

vector.worldToScreen = function (vec3)
  return {
    x = vec3.x + vec3.z * math.cos(theta),
    y = vec3.y + vec3.z * math.sin(theta)
  }
end

return vector
