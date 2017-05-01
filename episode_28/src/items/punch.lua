local entity = require("src.logic.entity")
local sprite = require("src.graphics.sprite")
local status = require("src.logic.status")

local punch = {}

local punchSprite = sprite.create("assets/sprites/punch.png")
local punchSound = love.audio.newSource("assets/sounds/punch.wav", "static")

local collision = function (self, entity, game)
  if game.player ~= entity then
    entity:takeDamage(1)
  end
end

punch.create = function (pos)
  local punch = entity.create(punchSprite, pos, 0, nil, collision)
  punchSound:play()

  local t = status.create(status.ticks(6), function (t, ent, game)
    ent:done()
  end)

  punch:addStatus(t)

  return punch
end

return punch
