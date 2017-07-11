local gameController = require("src.logic.game_controller")

local pause = {}

local update = function (self)
  -- do nothing
end

local keypressed = function (self, key)
  if key == 'q' then gameController.get():popState() end
end

local draw = function (self)
  self.view:inDisplayContext(function ()
    love.graphics.print("(PAUSED)", 100, 10)
  end)
end

pause.create = function (view)
  local inst = {}

  inst.view = view

  inst.update = update
  inst.keypressed = keypressed
  inst.draw = draw

  return inst
end

return pause
