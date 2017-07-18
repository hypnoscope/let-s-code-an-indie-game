local gameController = require("src.logic.game_controller")
local menu = require("src.logic.menu")

local pause = {}

local update = function (self)
  -- do nothing
end

local keypressed = function (self, key)
  if key == 'escape' then gameController.get():popState() end
  if key == 'down' then self.menu:next() end
  if key == 'up' then self.menu:previous() end
end

local draw = function (self)
  self.menu:draw(self.view)
  self.view:inDisplayContext(function ()
    love.graphics.print("(PAUSED)", 100, 10)
  end)
end

pause.create = function (view)
  local inst = {}

  inst.view = view
  inst.menu = menu.create({"one", "two", "three"})

  inst.update = update
  inst.keypressed = keypressed
  inst.draw = draw

  return inst
end

return pause
