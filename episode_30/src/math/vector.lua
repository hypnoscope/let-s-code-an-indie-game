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

vector.worldToScreen = function (vec3)
  return {
    x = vec3.x,
    y = vec3.y + vec3.z
  }
end

return vector
