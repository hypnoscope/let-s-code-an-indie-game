local keyboardMovement = require("src.logic.ai.movement.keyboard_movement")
local spritesheet = require("src.graphics.spritesheet")
local entity = require("src.logic.entity")
local punch = require("src.items.punch")
local sword = require("src.items.sword")
local status = require("src.logic.status")
local animation = require("src.graphics.animation")
local position = require("src.logic.position")

local player = {}

local adventurerSprite = spritesheet.create(
  "assets/sprites/adventurer.png",
  16,
  animation.STAND)

local _spawnEntity = function (self, entityToSpawn, game)
  local currentRoom = game.map:currentRoom()
  local pos = self.position
  local offset = 10
  if pos.left then offset = -12 end

  currentRoom:addEntity(entityToSpawn.create(position.create(
    pos.x + offset,
    pos.y,
    pos.z,
    pos.left
  )))
end

local _interuptMovement = function (self)
  local t = status.create(
    status.ticks(5),
    function (_, owner, game)
      owner.interuptMovement = false
    end,
    function ()
      self.interuptMovement = true
    end)

  self:addStatus(t)
end

local action2 = function (self, game)
  _spawnEntity(self, sword, game)
  _interuptMovement(self)
end

local action1 = function (self, game)
  _spawnEntity(self, punch, game)
  _interuptMovement(self)
end

player.create = function ()
  local player = entity.create(
    adventurerSprite,
    position.create(50, 0, 100),
    56,
    keyboardMovement)

  player.action1 = action1
  player.action2 = action2

  return player
end

return player
