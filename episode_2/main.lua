local sprite = require("src.graphics.sprite")
local entity = require("src.logic.entity")

local adventurer
local player

love.load = function ()
  adventurerSprite = sprite.create("assets/sprites/adventurer.png")
  player = entity.create(adventurerSprite, 50, 50, 5)
end

love.update = function ()
  player:update()
end

love.draw = function ()
  player:draw()
end
