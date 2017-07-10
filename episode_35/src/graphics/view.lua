local view = {}

local scale = function (self)
  return love.graphics.getWidth() / self.gameWidth
end

local clamp = function (min, n, max)
  if n < min then return min end
  if n > max then return max end
  return n
end

local viewOffset = 0

local update = function (self, game)
  local currentRoom = game.map:currentRoom()
  local maxX = (currentRoom.roomWidth - self.gameWidth) + viewOffset
  self.x = clamp(-viewOffset, game.player.position.drawX - self.gameWidth / 2, maxX)
end

local displayOffset = 10

local inContext = function (self, drawFunction)
  local scale = scale(self)
  love.graphics.push('all')
  love.graphics.scale(scale, scale)
  love.graphics.translate(-self.x, -self.y + displayOffset)
  drawFunction()
  love.graphics.pop()
end

local inBackgroundContext = function (self, drawFunction)
  local scale = scale(self)
  love.graphics.push('all')
  love.graphics.scale(scale, scale)
  love.graphics.translate(0, displayOffset)
  drawFunction()
  love.graphics.pop()
end

local inDisplayContext = function (self, drawFunction)
  local scale = scale(self)
  love.graphics.push('all')
  love.graphics.scale(scale, scale)
  drawFunction()
  love.graphics.pop()
end

view.create = function (gameWidth, gameHeight, x, y)
  local inst = {}

  inst.gameWidth = gameWidth
  inst.gameHeight = gameHeight
  inst.x = x
  inst.y = y

  inst.inContext = inContext
  inst.inBackgroundContext = inBackgroundContext
  inst.inDisplayContext = inDisplayContext
  inst.update = update

  return inst
end

return view
