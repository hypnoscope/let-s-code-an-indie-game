local sprite = require("src.graphics.sprite")
local entity = require("src.logic.entity")
local keyboardMovement = require("src.logic.ai.movement.keyboard_movement")
local bounce = require("src.logic.ai.movement.bounce")
local gamestate = require("src.logic.gamestate")

local adventurer
local player
local slimeSprite
local slime
local game

love.load = function ()
  adventurerSprite = sprite.create("assets/sprites/adventurer.png")
  player = entity.create(adventurerSprite, 50, 50, 0, 5, keyboardMovement)
  game = gamestate.create(player)

  slimeSprite = sprite.create("assets/sprites/slime.png")
  for i=1, 32 do
    local randomX = math.random(love.graphics.getWidth())
    local randomY = math.random(love.graphics.getHeight())
    local slime = entity.create(slimeSprite, randomX, randomY, 0, 4, bounce)
    game:addEntity(slime)
  end
end

love.update = function ()
  game:update()
end

love.draw = function ()
  game:draw()
end
