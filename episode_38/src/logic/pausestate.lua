local gameController = require("src.logic.game_controller")
local menu = require("src.logic.menus.menu")
local menuStack = require("src.logic.menus.menuStack")

local pause = {}

local update = function (self)
  -- do nothing
end

local keypressed = function (self, key)
  if key == 'escape' then gameController.get():popState() end
  self.menuStack:keypressed(key)
end

local draw = function (self)
  self.menuStack:draw(self.view)
  self.view:inDisplayContext(function ()
    love.graphics.print("(PAUSED)", 100, 10)
  end)
end

pause.create = function (view)
  local inst = {}

  local confirmExitMenu = menu.create(50, 50, {
    menu.createOption("No", function ()
      inst.menuStack:popMenu()
    end),
    menu.createOption("Yes", function ()
      gameController.get():exit()
    end)
  })

  inst.view = view
  inst.menuStack = menuStack.create()
  inst.menuStack:pushMenu(menu.create(10, 10, {
    menu.createOption("Continue", function ()
      gameController.get():popState()
    end),
    menu.createOption("Exit", function ()
      inst.menuStack:pushMenu(confirmExitMenu)
    end)
  }))

  inst.update = update
  inst.keypressed = keypressed
  inst.draw = draw

  return inst
end

return pause
