local keyboardMovement = require("src.logic.ai.movement.keyboard_movement")
local spritesheet = require("src.graphics.spritesheet")
local entity = require("src.logic.entity")
local punch = require("src.items.punch")
local timer = require("src.logic.timer")
local animation = require("src.graphics.animation")
local position = require("src.logic.position")

local player = {}

local adventurerSprite = spritesheet.create(
  "assets/sprites/adventurer.png",
  16,
  animation.STAND)

local action1 = function (self, game)
  local currentRoom = game.map:currentRoom()
  local pos = self.position
  currentRoom:addEntity(punch.create(position.create(
    pos.x + 8,
    pos.y,
    pos.z
  )))
  self.interuptMovement = true
  local t = timer.create(timer.ticks(5), function (_, owner, game)
    owner.interuptMovement = false
  end)
  self:addTimer(t)
end

player.create = function ()
  local player = entity.create(
    adventurerSprite,
    position.create(50, 0, 100),
    56,
    keyboardMovement)

  player.action1 = action1

  return player
end

return player
