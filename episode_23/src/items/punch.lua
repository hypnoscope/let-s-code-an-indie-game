local entity = require("src.logic.entity")
local sprite = require("src.graphics.sprite")
local timer = require("src.logic.timer")

local punch = {}

local punchSprite = sprite.create("assets/sprites/punch.png")
local punchSound = love.audio.newSource("assets/sounds/punch.wav", "static")

local collision = function (self, entity, game)
  if game.player ~= entity then
    entity:takeDamage(1)
  end
end

punch.create = function (xPos, yPos, zPos)
  local punch = entity.create(punchSprite, xPos, yPos, zPos, 0, nil, collision)
  punchSound:play()

  local t = timer.create(timer.ticks(6), function (t, ent, game)
    ent:done()
  end)

  punch:addTimer(t)

  return punch
end

return punch
