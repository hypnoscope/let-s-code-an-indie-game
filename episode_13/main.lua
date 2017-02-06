local sprite = require("src.graphics.sprite")
local entity = require("src.logic.entity")
local keyboardMovement = require("src.logic.ai.movement.keyboard_movement")
local bounce = require("src.logic.ai.movement.bounce")
local gamestate = require("src.logic.gamestate")
local followPlayer = require("src.logic.ai.movement.follow_player")
local view = require("src.graphics.view")
local tilesheet = require("src.graphics.tilesheet")
local tilemap = require("src.logic.rooms.tilemap")

DEBUG = true
local game
local theView

love.load = function ()
  local adventurerSprite = sprite.create("assets/sprites/adventurer.png")
  local player = entity.create(adventurerSprite, 50, 50, 0, 2, keyboardMovement)
  theView = view.create(270, 180, 0, 0)
  game = gamestate.create(player, theView)
end

love.update = function ()
  game:update()
end

love.draw = function ()
  game:draw()
end
