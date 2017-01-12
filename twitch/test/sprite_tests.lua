local cute = require("test.cute")
local sprite = require("src.graphics.sprite")

notion("Sprite gets drawn to the screen", function ()
  minion("graphics watcher", love.graphics, "draw")

  local s = sprite.create("assets/adventurer.png", 0, 0)

  s:draw()

  check(report("graphics watcher").calls).is(1)
end)

notion("Image is set to the correct filter mode", function ()
  local s = sprite.create("assets/adventurer.png", 0, 0)

  local min, mag, _ = s.image:getFilter()

  check(min).is("nearest")
  check(mag).is("nearest")
end)
