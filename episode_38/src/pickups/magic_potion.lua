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
    local inventory = game:getInventory()
    inventory:addPotion()
    self:done()
  end
end

magicPotion.create = function (pos)
  local potion = entity.create(
    potionSprite,
    pos,
    0,
    nil,
    collision)

  return potion
end

return magicPotion
