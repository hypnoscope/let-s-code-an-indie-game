local sprite = require("src.graphics.sprite")
local entity = require("src.logic.entity")
local keyboardMovement = require("src.logic.ai.movement.keyboard_movement")
local bounce = require("src.logic.ai.movement.bounce")

local adventurer
local player
local slimeSprite
local slime

love.load = function ()
  adventurerSprite = sprite.create("assets/sprites/adventurer.png")
  player = entity.create(adventurerSprite, 50, 50, 0, 5, bounce)
  slimeSprite = sprite.create("assets/sprites/slime.png")
  slime = entity.create(slimeSprite, 50, 300, 0, 3, keyboardMovement)
end

love.update = function ()
  player:update()
  slime:update()
end

love.draw = function ()
  player:draw()
  slime:draw()
end
