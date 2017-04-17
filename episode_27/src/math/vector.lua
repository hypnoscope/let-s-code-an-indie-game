local vector = {}

vector.distance = function (from, to)
  local dx = to.x - from.x
  local dz = to.z - from.z
  return math.sqrt(dx*dx + dz*dz)
end

vector.normalise = function (from, to)
  local dx = to.x - from.x
  local dz = to.z - from.z
  local distance = vector.distance(from, to)

  return {
    dx = dx / distance,
    dz = dz / distance
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
