local room = require("src.logic.rooms.room")

local map = {}

local draw = function (self)
  self.rooms[self.roomIndex]:draw()
  love.graphics.printf(
    "Room " .. self.roomIndex,
    350,
    20,
    100,
    "center"
  )
end

local update = function (self, game)
  self.rooms[self.roomIndex]:update(game, self)
end

local _createRoom = function ()
  return room.create()
end

local nextRoom = function (self, game)
  if self.roomIndex == #self.rooms then
    table.insert(self.rooms, _createRoom())
  end

  game.player.x = 1
  self.roomIndex = self.roomIndex + 1
end

local previousRoom = function (self, game)
  if self.roomIndex > 1 then
    self.roomIndex = self.roomIndex - 1
    game.player.x = 700
  end
end

map.create = function ()
  local inst = {}

  inst.roomIndex = 1
  inst.rooms = {}
  inst.rooms[1] = room.create()

  inst.draw = draw
  inst.update = update
  inst.nextRoom = nextRoom
  inst.previousRoom = previousRoom

  return inst
end

return map
