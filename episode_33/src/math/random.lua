local random = {}

random.pick = function (list)
  local length = #list
  local choice = love.math.random(1, length)
  return list[choice]
end

return random
