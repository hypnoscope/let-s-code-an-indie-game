local room = require("src.logic.rooms.room")
local slime = require("src.mobs.slime")
local magicPotion = require("src.pickups.magic_potion")
local position = require("src.logic.position")
local dungeonRoom = require("src.logic.rooms.floorplans.dungeon_room")
local bridgeRoom = require("src.logic.rooms.floorplans.bridge")
local random = require("src.math.random")
local tilesheet = require("src.graphics.tilesheet")
local item = require("src.pickups.item")
local sword = require("src.items.sword")

local map = {}

local tilemaps = {dungeonRoom, bridgeRoom}

local draw = function (self, view)
  self.rooms[self.roomIndex]:draw(view)
end

local currentRoom = function (self)
  return self.rooms[self.roomIndex]
end

local update = function (self, game)
  currentRoom(self):update(game, self)
end

local _createRoom = function ()
  local entities = {}
  local tilemap = random.pick(tilemaps)
  local tiles = tilesheet.create("assets/sprites/tiles/dungeon.png", 8)
  local availablePositions = tilemap:getWalkablePositions(
    tiles.tileSize,
    290,
    300)

  for i=1, 5 do
    local pos = random.pick(availablePositions)
    entities[i] = slime.create(position.create(pos[1], 0, pos[2]))
  end

  for i=1, 5 do
    local pos = position.create(150 + i*10, 0, 100)
    table.insert(entities, magicPotion.create(pos))
  end

  table.insert(entities, item.create(
    position.create(140, 0, 80),
    sword
  ))

  return room.create(tilemap, tiles, entities)
end

local nextRoom = function (self, game)
  if self.roomIndex == #self.rooms then
    table.insert(self.rooms, _createRoom())
  end

  local newRoom = self.rooms[self.roomIndex + 1]
  local startPosition = newRoom:getEntrance()

  game.player.position:setPosition(
    startPosition.x, startPosition.y, startPosition.z)

  self.roomIndex = self.roomIndex + 1
end

local previousRoom = function (self, game)
  if self.roomIndex > 1 then
    self.roomIndex = self.roomIndex - 1

    local newRoom = currentRoom(self)
    local startPosition = newRoom:getExit()

    game.player.position:setPosition(
      startPosition.x, startPosition.y, startPosition.z)
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
