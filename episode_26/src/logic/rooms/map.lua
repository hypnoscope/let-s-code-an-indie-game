local room = require("src.logic.rooms.room")
local slime = require("src.mobs.slime")
local magicPotion = require("src.pickups.magic_potion")
local position = require("src.logic.position")

local map = {}

local draw = function (self, view)
  self.rooms[self.roomIndex]:draw(view)

  love.graphics.printf(
    "Room " .. self.roomIndex,
    350,
    20,
    100,
    "center"
  )
end

local currentRoom = function (self)
  return self.rooms[self.roomIndex]
end

local update = function (self, game)
  currentRoom(self):update(game, self)
end

local _createRoom = function ()
  local entities = {}

  for i=1, 5 do
    local xPos = math.random(100) + 100
    local zPos = math.random(50) + 100
    entities[i] = slime.create(position.create(xPos, 0, zPos))
  end

  for i=1, 5 do
    local pos = position.create(150 + i*10, 0, 100)
    table.insert(entities, magicPotion.create(pos))
  end

  return room.create(entities)
end

local nextRoom = function (self, game)
  if self.roomIndex == #self.rooms then
    table.insert(self.rooms, _createRoom())
  end

  local newRoom = self.rooms[self.roomIndex + 1]

  game.player.position:setPosition(
    newRoom.entranceX,
    game.player.position.y,
    newRoom.entranceZ)

  self.roomIndex = self.roomIndex + 1
end

local previousRoom = function (self, game)
  if self.roomIndex > 1 then
    self.roomIndex = self.roomIndex - 1
    local newRoom = currentRoom(self)

    game.player.position:setPosition(
      newRoom.exitX,
      game.player.position.y,
      newRoom.exitZ)
  end
end

map.create = function ()
  local inst = {}

  inst.roomIndex = 1
  inst.rooms = {}
  inst.rooms[1] = _createRoom()

  inst.draw = draw
  inst.update = update
  inst.nextRoom = nextRoom
  inst.previousRoom = previousRoom
  inst.currentRoom = currentRoom

  return inst
end

return map
