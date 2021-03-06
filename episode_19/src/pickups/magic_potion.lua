local entity = require("src.logic.entity")
local sprite = require("src.graphics.sprite")

local magicPotion = {}

local potionSprite = sprite.create("assets/sprites/magic_potion.png")

local potionSound = love.audio.newSource(
  "assets/sounds/potion-plink.wav",
  "static"
)

local collision = function (self, entity, game)
  if entity == game.player then
    potionSound:play()
    self:done()
  end
end

magicPotion.create = function (xPos, yPos, zPos)
  local potion = entity.create(
    potionSprite,
    xPos, yPos, zPos,
    0,
    nil,
    collision)

  return potion
end

return magicPotion
