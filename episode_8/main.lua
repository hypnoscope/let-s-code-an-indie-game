local sprite = require("src.graphics.sprite")
local entity = require("src.logic.entity")
local keyboardMovement = require("src.logic.ai.movement.keyboard_movement")
local bounce = require("src.logic.ai.movement.bounce")
local gamestate = require("src.logic.gamestate")
local followPlayer = require("src.logic.ai.movement.follow_player")
local view = require("src.graphics.view")

local game

love.load = function ()
  local adventurerSprite = sprite.create("assets/sprites/adventurer.png")
  local player = entity.create(adventurerSprite, 50, 50, 0, 5, keyboardMovement)
  game = gamestate.create(player, view.create(270, 180))
end

love.update = function ()
  game:update()
end

love.draw = function ()
  game:draw()
end
