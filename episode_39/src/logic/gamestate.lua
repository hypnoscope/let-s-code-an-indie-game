local map = require("src.logic.rooms.map")
local display = require("src.graphics.display")
local inventory = require("src.logic.inventory")
local pausestate = require("src.logic.pausestate")
local gameController = require("src.logic.game_controller")

local gamestate = {}

local modulate = function (self)
  return (self.updates % 2) == 0
end

local addEntity = function (self, entity)
  table.insert(self.entities, entity)
end

local update = function (self, dt)
  self.updates = self.updates + 1
  self.dt = dt
  self.map:update(self)

  for i, entity in ipairs(self.entities) do
    if entity.finished then
      table.remove(self.entities, i)
    end
  end

  for _, entity in ipairs(self.entities) do
    entity:update(self)
  end

  self.view:update(self)
end

local draw = function (self)
  self.map:draw(self.view)

  for _, entity in ipairs(self.entities) do
    entity:draw(self.view)
  end

  self.display:draw(self.view, self)

  if DEBUG then
    love.graphics.print(self.player.hp, 10, 10)
    love.graphics.print(self.debugString)
  end
end

local keypressed = function (self, key)
  if key == 'z' then self.player:action1(self) end
  if key == 'x' then self.player:action2(self) end
  if key == 'escape' then gameController.get():pushState(self.pause) end
end

local getInventory = function (self)
  return self.inventory
end

local getPlayer = function (self)
  return self.player
end

gamestate.create = function (player, view)
  local inst = {}

  inst.pause = pausestate.create(view)

  inst.updates = 0
  inst.entities = { player }
  inst.player = player
  inst.display = display.create()
  inst.inventory = inventory.create()
  inst.map = map.create()
  inst.view = view
  inst.dt = 0
  inst.debugString = ""

  inst.addEntity = addEntity
  inst.update = update
  inst.draw = draw
  inst.keypressed = keypressed
  inst.modulate = modulate
  inst.getInventory = getInventory
  inst.getPlayer = getPlayer

  return inst
end

return gamestate
