local map = require("src.logic.rooms.map")

local gamestate = {}

local addEntity = function (self, entity)
  table.insert(self.entities, entity)
end

local update = function (self)
  self.map:update(self)
  for _, entity in ipairs(self.entities) do
    entity:update(self)
  end
  self.player:update(self)
end

local draw = function (self)
  self.map:draw(self.view)
  self.player:draw(self.view)
  for _, entity in ipairs(self.entities) do
    entity:draw(self.view)
  end
end

gamestate.create = function (player, view)
  local inst = {}

  inst.entities = {}
  inst.player = player
  inst.map = map.create()
  inst.view = view

  inst.addEntity = addEntity
  inst.update = update
  inst.draw = draw

  return inst
end

return gamestate
