local gamestate = require("src.logic.gamestate")
local view = require("src.graphics.view")
local player = require("src.mobs.player")

DEBUG = false
local game
local theView

love.load = function ()
  theView = view.create(270, 180, 0, 0)
  game = gamestate.create(player.create(), theView)
end

love.update = function (dt)
  game:update(dt)
end

love.draw = function ()
  game:draw()
end

function love.keypressed(key)
  game:keypressed(key)
end
