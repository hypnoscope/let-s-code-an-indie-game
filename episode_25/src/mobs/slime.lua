local sprite = require("src.graphics.sprite")
local entity = require("src.logic.entity")
local bounceAfterPlayer = require("src.logic.ai.movement.bounce_after_player")

local slime = {}

local slimeSprite = sprite.create("assets/sprites/slime.png")
local speed = 32

slime.create = function (pos)
  return entity.create(slimeSprite, pos, speed, bounceAfterPlayer)
end

return slime
