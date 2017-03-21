local keyboardMovement = require("src.logic.ai.movement.keyboard_movement")
local sprite = require("src.graphics.sprite")
local entity = require("src.logic.entity")
local punch = require("src.items.punch")
local timer = require("src.logic.timer")

local player = {}

local adventurerSprite = sprite.create("assets/sprites/adventurer.png")

local action1 = function (self, game)
  local currentRoom = game.map:currentRoom()
  currentRoom:addEntity(punch.create(self.x + 8, self.y, self.z))
  self.interuptMovement = true
  local t = timer.create(5, function (_, owner, game)
    owner.interuptMovement = false
  end)
  self:addTimer(t)
end

player.create = function ()
  local player = entity.create(
    adventurerSprite,
    50,
    0,
    100,
    56,
    keyboardMovement)

  player.action1 = action1

  return player
end

return player
