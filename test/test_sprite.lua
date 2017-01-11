local cute = require("test.cute")

notion("sprite gets drawn", function ()
  local s = sprite.create()
  minion("drawing", love.graphics, draw)

  s:draw(report("drawing", ))



end)
