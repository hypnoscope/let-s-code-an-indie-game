local sprite = require("src.graphics.sprite")
local entity = require("src.logic.entity")
local keyboardMovement = require("src.logic.ai.movement.keyboard_movement")
local bounce = require("src.logic.ai.movement.bounce")
local gamestate = require("src.logic.gamestate")
local followPlayer = require("src.logic.ai.movement.follow_player")

local game

love.load = function ()
  local adventurerSprite = sprite.create("assets/sprites/adventurer.png")
  local player = entity.create(adventurerSprite, 50, 50, 0, 5, keyboardMovement)
  game = gamestate.create(player)

  local slimeSprite = sprite.create("assets/sprites/slime.png")
  for i=1, 8 do
    local randomX = math.random(love.graphics.getWidth())
    local randomY = math.random(love.graphics.getHeight())
    local slime = entity.create(slimeSprite, randomX, randomY, 0, 4, followPlayer)
    game:addEntity(slime)
  end

  game:addEntity(entity.create(slimeSprite, 500, 300, 0, 4, followPlayer))
end

love.update = function ()
  game:update()
end

love.draw = function ()
  game:draw()
end
