local sprite = require("src.graphics.sprite")

local adventurer

love.load = function ()
  adventurer = sprite.create("assets/sprites/adventurer.png", 0, 0)
end

love.update = function ()
  adventurer.x = adventurer.x + 5
  if adventurer.x > love.graphics.getWidth() then
    adventurer.x = 0
  end
end

love.draw = function ()
  adventurer:draw()
end
