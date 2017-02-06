local tilesheet = require("src.graphics.tilesheet")
local tilemap = require("src.logic.rooms.tilemap")

local room = {}

local walkable = function (self, x, y)
  if x < 0 or y < 0 then return false end
  local tileChar = self.tilemap:getTile(x, y, self.tilesheet.tileSize)
  return (tileChar == '.' or tileChar == ',')
end

local draw = function (self, view)
  self.tilemap:draw(view, self.tilesheet)

  for _, entity in ipairs(self.entities) do
    entity:draw(view)
  end
end

local update = function (self, game, map)
  for _, entity in ipairs(self.entities) do
    entity:update(game)
  end

  if game.player.x > self.roomWidth - 8 then
    map:nextRoom(game)
  end

  if game.player.x < 8 then
    map:previousRoom(game)
  end
end

room.create = function (entities)
  local inst = {}

  inst.tilesheet = tilesheet.create("assets/sprites/tiles/dungeon.png", 8)
  inst.tilemap = tilemap.create()

  inst.color = {
    math.random(255), math.random(255), math.random(255)
  }

  inst.entities = entities
  inst.roomWidth = 50 * inst.tilesheet.tileSize
  inst.roomHeight = 22 * inst.tilesheet.tileSize

  inst.draw = draw
  inst.update = update
  inst.walkable = walkable

  return inst
end

return room
