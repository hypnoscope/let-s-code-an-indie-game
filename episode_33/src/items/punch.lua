local entity = require("src.logic.entity")
local sprite = require("src.graphics.sprite")
local status = require("src.logic.status")
local knockback = require("src.logic.statuses.knockback")
local removeSelf = require("src.logic.statuses.remove_self")

local punch = {}

local punchSprite = sprite.create("assets/sprites/punch.png")
local punchSound = love.audio.newSource("assets/sounds/punch.wav", "static")

local collision = function (self, entity, game)
  if game.player ~= entity then
    entity:takeDamage(1)

    local duration = 20
    local strength = 8

    entity:addStatus(knockback.create(
      duration,
      entity,
      self.position,
      strength))
  end
end

local speed = 0
local noMovement = nil

punch.create = function (pos)
  local punch = entity.create(
    punchSprite,
    pos,
    speed,
    noMovement,
    collision)

  punchSound:play()

  punch:addStatus(removeSelf.create(6))

  return punch
end

return punch
