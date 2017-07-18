local gamestate = require("src.logic.gamestate")
local view = require("src.graphics.view")
local player = require("src.mobs.player")
local gameController = require("src.logic.game_controller")

DEBUG = false

local controller

love.load = function ()
  local theView = view.create(270, 180, 0, 0)
  local game = gamestate.create(player.create(), theView)
  controller = gameController.get()
  controller:pushState(game)
end

love.update = function (dt)
  controller:update(dt)
end

love.draw = function ()
  controller:draw()
end

function love.keypressed(key)
  controller:keypressed(key)
end
