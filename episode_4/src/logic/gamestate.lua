local gamestate = {}

local addEntity = function (self, entity)
  table.insert(self.entities, entity)
end

local update = function (self)
  for _, entity in ipairs(self.entities) do
    entity:update(self)
  end
  self.player:update(self)
end

local draw = function (self)
  for _, entity in ipairs(self.entities) do
    entity:draw()
  end
  self.player:draw()
end

gamestate.create = function (player)
  local inst = {}

  inst.entities = {}
  inst.player = player

  inst.addEntity = addEntity
  inst.update = update
  inst.draw = draw

  return inst
end

return gamestate
