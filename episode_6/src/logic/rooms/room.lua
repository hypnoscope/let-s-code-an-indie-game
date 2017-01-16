local room = {}

local roomWidth = 800
local roomHeight = 600

local draw = function (self)
  love.graphics.push('all')
  love.graphics.setColor(unpack(self.color))
  love.graphics.rectangle("fill", 0, 0, roomWidth, roomHeight)
  love.graphics.pop()
end

local update = function (self, game, map)
  if game.player.x > roomWidth then
    map:nextRoom(game)
  end

  if game.player.x < 0 then
    map:previousRoom(game)
  end
end

room.create = function ()
  local inst = {}

  inst.color = {
    math.random(255), math.random(255), math.random(255)
  }

  inst.draw = draw
  inst.update = update

  return inst
end

return room
