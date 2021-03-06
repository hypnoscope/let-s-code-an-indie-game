local vector = require("src.math.vector")

local room = {}

local walkable = function (self, x, z)
  local screenPos = vector.worldToScreen({x=x, z=z, y=0})
  if screenPos.x < 0 or screenPos.y < 0 then return false end
  local tileChar = self.tilemap:getTile(screenPos.x, screenPos.y, self.tilesheet.tileSize)
  return (tileChar == ',' or tileChar == "." or tileChar == "~")
end

local draw = function (self, view)
  self.tilemap:draw(view, self.tilesheet)

  for _, entity in ipairs(self.entities) do
    entity:draw(view)
  end
end

local roomChangeThreshold = 2

local update = function (self, game, map)
  for i, entity in ipairs(self.entities) do
    if entity.finished then
      table.remove(self.entities, i)
      break
    end

    entity:update(game)

    game.player:collisionCheck(entity, game)
    entity:collisionCheck(game.player, game)
    for _, anotherEntity in ipairs(self.entities) do
      entity:collisionCheck(anotherEntity, game)
    end
  end

  if game.player.position.drawX > self.roomWidth - roomChangeThreshold then
    map:nextRoom(game)
  end

  if game.player.position.drawX < roomChangeThreshold then
    map:previousRoom(game)
  end
end

local addEntity = function (self, ent)
  table.insert(self.entities, ent)
end

local getEntrance = function (self)
  return self.tilemap.playerStartLeft
end

local getExit = function (self)
  return self.tilemap.playerStartRight
end

room.create = function (tilemap, tilesheet, entities)
  local inst = {}

  inst.tilesheet = tilesheet
  inst.tilemap = tilemap

  inst.color = {
    math.random(255), math.random(255), math.random(255)
  }

  inst.entities = entities
  inst.roomWidth = tilemap.tilesWide * inst.tilesheet.tileSize

  inst.draw = draw
  inst.update = update
  inst.walkable = walkable
  inst.addEntity = addEntity
  inst.getEntrance = getEntrance
  inst.getExit = getExit

  return inst
end

return room
