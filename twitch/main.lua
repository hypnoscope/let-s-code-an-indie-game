local cute = require("test.cute")

local sprite = require("src.graphics.sprite")

local x = 0
local y = 0

local adventurer

love.load = function (args)
  cute.go(args)
  adventurer = sprite.create("assets/adventurer.png", 0, 0)
end

love.update = function ()
  x = x + 5
  if x > love.graphics.getWidth() then
    x = 0
  end
end

love.draw = function ()
  adventurer:draw()
  cute.draw()
end

love.keypressed = function (key)
  cute.keypressed(key)
end
