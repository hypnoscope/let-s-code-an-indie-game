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

return vector
