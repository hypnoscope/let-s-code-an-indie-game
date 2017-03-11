local entity = require("src.logic.entity")
local sprite = require("src.graphics.sprite")

local punch = {}

local punchSprite = sprite.create("assets/sprites/punch.png")
local punchSound = love.audio.newSource("assets/sounds/punch.wav", "static")

punch.create = function (xPos, yPos, zPos)
  local punch = entity.create(punchSprite, xPos, yPos, zPos)
  punchSound:play()
  return punch
end

return punch
