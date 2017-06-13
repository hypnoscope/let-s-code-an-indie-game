local entity = require("src.logic.entity")
local sprite = require("src.graphics.sprite")
local knockback = require("src.logic.statuses.knockback")
local removeSelf = require("src.logic.statuses.remove_self")

local sword = {}

local speed = 0
local noMovement = nil
local swordSprite = sprite.create("assets/sprites/sword.png")
local swordSound = love.audio.newSource("assets/sounds/sword.wav", "static")

local collision = function (self, entity, game)
  if game.player ~= entity then
    entity:takeDamage(3)
    local duration = 20
    local strength = 8
    entity:addStatus(knockback.create(
      duration,
      entity,
      self.position,
      strength))
  end
end

sword.create = function (pos)
  local inst = entity.create(
    swordSprite,
    pos,
    speed,
    noMovement,
    collision)

  swordSound:play()

  inst:addStatus(removeSelf.create(6))

  return inst
end

return sword
