local view = {}

local scale = function (self)
  return love.graphics.getWidth() / self.gameWidth
end

local inContext = function (self, drawFunction)
  local scale = scale(self)
  love.graphics.push('all')
  love.graphics.scale(scale, scale)
  drawFunction()
  love.graphics.pop()
end

view.create = function (gameWidth, gameHeight)
  local inst = {}

  inst.gameWidth = gameWidth
  inst.gameHeight = gameHeight

  inst.inContext = inContext

  return inst
end

return view
